-- Keep the citizen capture point immutable. Manager corrections are stored as
-- a separate effective location / asset and append-only correction event.
alter table public.issues
  add column if not exists manager_location geography(point,4326),
  add column if not exists manager_asset_id uuid references public.assets,
  add column if not exists manager_asset_override boolean not null default false;

create table if not exists public.issue_location_corrections (
  id uuid primary key default gen_random_uuid(),
  issue_id uuid not null references public.issues on delete restrict,
  actor_id uuid not null references public.profiles,
  original_location geography(point,4326) not null,
  updated_location geography(point,4326) not null,
  original_asset_id uuid references public.assets,
  updated_asset_id uuid references public.assets,
  reason text not null check(length(trim(reason))>0),
  created_at timestamptz not null default now()
);
create index if not exists issue_location_corrections_issue_time_idx
  on public.issue_location_corrections(issue_id,created_at desc);
alter table public.issue_location_corrections enable row level security;
create or replace function public.guard_location_correction_immutable() returns trigger
language plpgsql set search_path = '' as $$
begin raise exception using errcode='42501',message='Location corrections are append-only'; end $$;
create trigger issue_location_correction_no_mutation before update or delete
  on public.issue_location_corrections for each row execute function public.guard_location_correction_immutable();
create or replace function public.audit_location_correction() returns trigger
language plpgsql security definer set search_path = pg_catalog,public,extensions as $$
declare prev text; role_name text; event_time timestamptz:=new.created_at; before_data jsonb; after_data jsonb;
begin
  perform pg_advisory_xact_lock(424242);
  select event_hash into prev from public.audit_events order by id desc limit 1;
  select role::text into role_name from public.role_grants where user_id=new.actor_id and active
    and role in ('municipal_officer','ward_admin') order by role limit 1;
  before_data:=jsonb_build_object('location',public.st_asgeojson(new.original_location::public.geometry)::jsonb,'asset_id',new.original_asset_id);
  after_data:=jsonb_build_object('location',public.st_asgeojson(new.updated_location::public.geometry)::jsonb,'asset_id',new.updated_asset_id,'reason',new.reason);
  insert into public.audit_events(actor_id,actor_role,action,entity_type,entity_id,before_state,after_state,created_at,previous_hash,event_hash)
  values(new.actor_id,coalesce(role_name,'system'),'issue location corrected','issue',new.issue_id,before_data,after_data,event_time,prev,
    encode(digest(coalesce(prev,'')||'|issue location corrected|issue|'||new.issue_id::text||'|'||before_data::text||'|'||after_data::text||'|'||event_time::text,'sha256'),'hex'));
  return new;
end $$;
create trigger issue_location_correction_audit after insert on public.issue_location_corrections
  for each row execute function public.audit_location_correction();
revoke all on public.issue_location_corrections from anon,authenticated;
grant select on public.issue_location_corrections to authenticated;
create policy issue_location_corrections_manager_read on public.issue_location_corrections
  for select to authenticated using (
    exists(select 1 from public.issues i join public.assets a on a.id=i.asset_id
      where i.id=issue_location_corrections.issue_id
      and (public.current_has_role('municipal_officer',a.ward_id)
        or public.current_has_role('ward_admin',a.ward_id)
        or public.current_has_role('auditor',a.ward_id)
        or public.current_has_role('admin')))
  );

create or replace function public.correct_issue_location(
  p_issue uuid, p_location geography, p_asset uuid, p_reason text
) returns public.issues
language plpgsql security definer set search_path = '' as $$
declare
  i public.issues;
  old_location public.geography;
  old_asset uuid;
  target_ward uuid;
begin
  if (select auth.uid()) is null then
    raise exception using errcode='42501',message='Authentication required';
  end if;
  if p_location is null or public.st_srid(p_location::public.geometry)<>4326
     or public.geometrytype(p_location::public.geometry)<>'POINT' then
    raise exception using errcode='23514',message='Choose a valid map point';
  end if;
  if nullif(trim(p_reason),'') is null then
    raise exception using errcode='23514',message='A correction reason is required';
  end if;
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  old_asset := case when i.manager_asset_override then i.manager_asset_id else i.asset_id end;
  old_location := coalesce(i.manager_location,i.capture_location,
    (select a.location from public.assets a where a.id=i.asset_id));
  if old_location is null then
    raise exception using errcode='23514',message='Issue has no recorded location';
  end if;
  if p_asset is not null and not exists(select 1 from public.assets a where a.id=p_asset) then
    raise exception using errcode='23503',message='Selected asset is not registered';
  end if;
  select a.ward_id into target_ward from public.assets a where a.id=coalesce(p_asset,i.asset_id);
  if target_ward is null then
    select w.id into target_ward from public.wards w
      where w.geom is not null and public.st_covers(w.geom::public.geometry,p_location::public.geometry) limit 1;
  end if;
  if target_ward is null then
    raise exception using errcode='23514',message='The corrected point must fall inside a configured ward';
  end if;
  if not (public.current_has_role('municipal_officer',target_ward)
    or public.current_has_role('ward_admin',target_ward)) then
    raise exception using errcode='42501',message='Manager role for this ward is required';
  end if;
  update public.issues set manager_location=p_location,manager_asset_id=p_asset,manager_asset_override=true where id=p_issue returning * into i;
  insert into public.issue_location_corrections(issue_id,actor_id,original_location,updated_location,original_asset_id,updated_asset_id,reason)
    values(p_issue,(select auth.uid()),old_location,p_location,old_asset,p_asset,trim(p_reason));
  return i;
end $$;

revoke all on function public.correct_issue_location(uuid,geography,uuid,text) from public,anon;
grant execute on function public.correct_issue_location(uuid,geography,uuid,text) to authenticated;
revoke update,delete on public.issue_location_corrections from public,anon,authenticated;
revoke all on function public.guard_location_correction_immutable() from public,anon,authenticated;
revoke all on function public.audit_location_correction() from public,anon,authenticated;

comment on column public.issues.capture_location is 'Original citizen-confirmed capture point; never overwritten by a manager correction.';
comment on column public.issues.manager_location is 'Effective location after an audited manager correction, when present.';
