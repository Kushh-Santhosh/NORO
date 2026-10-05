create schema if not exists extensions;
create extension if not exists pgcrypto with schema extensions;
create extension if not exists postgis;
grant usage on schema public to anon,authenticated;

create type public.noro_role as enum ('citizen','verifier','coordinator','municipal_officer','department_officer','contractor','field_worker','ward_admin','auditor','admin');
create type public.issue_status as enum ('under_verification','verified','unconfirmed','duplicate','assigned','jurisdiction_dispute','accepted','in_progress','repair_claimed','verification_pending','verified_closed','reopened','closed_unverified','cancelled');
create type public.issue_fault_type as enum ('not_working','damaged','unsafe','maintenance','other');

create table public.wards (
  id uuid primary key default gen_random_uuid(), code text unique not null, name text not null,
  geom geography(multipolygon,4326), created_at timestamptz not null default now()
);
create table public.role_requests (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  requested_role public.noro_role not null check(requested_role in ('citizen','municipal_officer','contractor','verifier')),
  applicant_data jsonb not null default '{}'::jsonb check(jsonb_typeof(applicant_data)='object'),
  status text not null default 'pending' check(status in ('pending','approved','rejected')),
  reviewed_by uuid references auth.users(id), reviewed_at timestamptz, review_note text,
  created_at timestamptz not null default now()
);
create index role_requests_user_created_idx on public.role_requests(user_id,created_at desc);
create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null, phone text unique, created_at timestamptz not null default now()
);
create or replace function public.handle_new_profile() returns trigger language plpgsql security definer set search_path = '' as $$
begin
  insert into public.profiles(id,display_name,phone) values(new.id,coalesce(nullif(new.raw_user_meta_data->>'display_name',''),'Noro member'),nullif(new.raw_user_meta_data->>'phone','')) on conflict(id) do nothing;
  if new.raw_user_meta_data->>'role_requested'='citizen' then
    insert into public.role_grants(user_id,role,ward_id) values(new.id,'citizen',null) on conflict do nothing;
  elsif new.raw_user_meta_data->>'role_requested' in ('municipal_officer','contractor','verifier') then
    insert into public.role_requests(user_id,requested_role,applicant_data) values(new.id,(new.raw_user_meta_data->>'role_requested')::public.noro_role,
      (coalesce(new.raw_user_meta_data->'applicant_data','{}'::jsonb)-'password'-'email'-'access_token'));
  end if;
  return new;
end $$;
revoke all on function public.handle_new_profile() from public,anon,authenticated;
create trigger on_auth_user_created_profile after insert on auth.users for each row execute function public.handle_new_profile();
create table public.role_grants (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references public.profiles(id) on delete cascade,
  role public.noro_role not null, ward_id uuid references public.wards(id), active boolean not null default true,
  unique(user_id,role,ward_id)
);
create table public.organisations (
  id uuid primary key default gen_random_uuid(), name text not null, kind text not null,
  unique(name,kind)
);
alter table public.profiles add column org_id uuid references public.organisations;
create table public.asset_categories (
  id uuid primary key default gen_random_uuid(), code text unique not null, name text not null,
  risk_class text not null check(risk_class in ('high','medium','low')),
  service_standard text not null, standard_status text not null default 'proposed' check(standard_status in ('proposed','adopted')),
  checklist jsonb not null default '[]'::jsonb, version integer not null default 1
);
-- Extensible service taxonomy: category, department, contractor specialisation,
-- service standard, SLA and verifier checklist are related configuration records.
create table public.departments (
  id uuid primary key default gen_random_uuid(), code text unique not null, name text not null,
  organisation_id uuid references public.organisations, active boolean not null default true
);
create table public.service_categories (
  id uuid primary key default gen_random_uuid(), code text unique not null, name text not null,
  department_id uuid not null references public.departments, active boolean not null default true
);
create table public.issue_categories (
  id uuid primary key default gen_random_uuid(), code text unique not null, name text not null,
  asset_category_id uuid references public.asset_categories, service_category_id uuid references public.service_categories,
  default_severity text not null default 'medium' check(default_severity in ('critical','high','medium','low')),
  active boolean not null default true
);
create table public.service_standards (
  id uuid primary key default gen_random_uuid(), code text not null, version integer not null default 1,
  asset_category_id uuid not null references public.asset_categories,
  service_category_id uuid references public.service_categories,
  description text not null, state text not null default 'proposed' check(state in ('proposed','adopted','retired')),
  effective_from date, effective_to date, unique(code,version)
);
create table public.sla_rules (
  id uuid primary key default gen_random_uuid(), issue_category_id uuid not null references public.issue_categories,
  severity text not null check(severity in ('critical','high','medium','low')),
  response_after interval not null, resolve_after interval not null, state text not null default 'proposed' check(state in ('proposed','adopted','retired'))
);
create table public.verification_checklists (
  id uuid primary key default gen_random_uuid(), asset_category_id uuid not null references public.asset_categories,
  issue_category_id uuid references public.issue_categories, version integer not null default 1,
  checklist jsonb not null check(jsonb_typeof(checklist)='array'), active boolean not null default true,
  unique(asset_category_id,issue_category_id,version)
);
create table public.contractors (
  id uuid primary key default gen_random_uuid(), organisation_id uuid unique not null references public.organisations,
  registration_reference text, operating_wards uuid[] not null default '{}', availability text not null default 'available' check(availability in ('available','limited','unavailable','suspended')),
  created_at timestamptz not null default now()
);
create table public.contractor_specialisations (
  contractor_id uuid not null references public.contractors on delete cascade,
  service_category_id uuid not null references public.service_categories,
  primary_service boolean not null default false, primary key(contractor_id,service_category_id)
);
create table public.verifier_profiles (
  user_id uuid primary key references public.profiles on delete cascade,
  organisation_id uuid references public.organisations, operating_wards uuid[] not null default '{}',
  training_state text not null default 'pending' check(training_state in ('pending','current','expired','suspended')),
  approved_by uuid references public.profiles, approved_at timestamptz, conflict_declaration_required boolean not null default true
);

create table public.assets (
  id uuid primary key default gen_random_uuid(), public_code text unique not null,
  category_id uuid not null references public.asset_categories, ward_id uuid not null references public.wards,
  location geography(point,4326) not null, location_tier text not null default 'exact' check(location_tier in ('exact','approx','hidden')),
  responsible_org_id uuid references public.organisations, responsible_department_id uuid references public.departments, service_standard_id uuid references public.service_standards, owner_basis text, condition text not null default 'unknown',
  created_at timestamptz not null default now()
);
create index assets_location_gix on public.assets using gist(location);
create table public.issues (
  id uuid primary key default gen_random_uuid(), public_code text unique not null default ('NR-'||to_char(now(),'YYYY')||'-'||upper(substr(gen_random_uuid()::text,1,8))),
  asset_id uuid references public.assets, capture_location geography(point,4326), issue_category_id uuid references public.issue_categories, service_category_id uuid references public.service_categories, service_standard_id uuid references public.service_standards, sla_rule_id uuid references public.sla_rules, fault_type public.issue_fault_type not null, description text not null,
  status public.issue_status not null default 'under_verification', severity text not null default 'medium' check(severity in ('critical','high','medium','low')),
  reporter_id uuid not null references public.profiles, opened_at timestamptz not null default now(),
  sla_due_at timestamptz, claimed_at timestamptz, verified_closed_at timestamptz,
  repairer_user_id uuid references public.profiles, assignee_org_id uuid references public.organisations,
  parent_issue_id uuid references public.issues, created_at timestamptz not null default now(),
  constraint issue_asset_or_location_present check (asset_id is not null or capture_location is not null),
  constraint issue_closure_timestamp_consistent check ((status='verified_closed')=(verified_closed_at is not null)),
  constraint issue_claim_timestamp_present check (status not in ('repair_claimed','verification_pending','verified_closed') or claimed_at is not null)
);
create index issues_status_due_idx on public.issues(status,sla_due_at);
create index issues_asset_opened_idx on public.issues(asset_id,opened_at desc);
create index issues_capture_location_gix on public.issues using gist(capture_location);
create index issues_reporter_idx on public.issues(reporter_id,opened_at desc);
create table public.assignments (
  id uuid primary key default gen_random_uuid(), issue_id uuid not null references public.issues,
  assignee_org_id uuid not null references public.organisations, assignee_user_id uuid references public.profiles,
  created_by uuid not null references public.profiles, accepted_at timestamptz, planned_for timestamptz,
  created_at timestamptz not null default now()
);
create index assignments_issue_created_idx on public.assignments(issue_id,created_at desc,id desc);
create table public.repair_claims (
  id uuid primary key default gen_random_uuid(), issue_id uuid not null references public.issues on delete restrict,
  contractor_user_id uuid not null references public.profiles, notes text not null check(length(trim(notes))>0),
  evidence_ids uuid[] not null check(coalesce(array_length(evidence_ids,1),0)>0), claimed_at timestamptz not null default now()
);
create index repair_claims_issue_claimed_idx on public.repair_claims(issue_id,claimed_at desc);
create table public.evidence (
  id uuid primary key default gen_random_uuid(), issue_id uuid not null references public.issues on delete restrict,
  uploader_id uuid not null references public.profiles, storage_path text not null, sha256 text not null,
  kind text not null default 'photo' check(kind in ('photo','video','document')),
  captured_at timestamptz not null, location geography(point,4326), accuracy_m real,
  capture_mode text not null check(capture_mode in ('in_app','gallery','assisted')),
  created_at timestamptz not null default now(), unique(issue_id,sha256)
);
create index evidence_issue_created_idx on public.evidence(issue_id,created_at desc);
create table public.conflict_declarations (
  id uuid primary key default gen_random_uuid(), issue_id uuid not null references public.issues,
  verifier_id uuid not null references public.profiles, has_conflict boolean not null, reason text,
  created_at timestamptz not null default now(), unique(issue_id,verifier_id)
);
create index conflict_declarations_issue_verifier_idx on public.conflict_declarations(issue_id,verifier_id);
create table public.ai_assessments (
  id uuid primary key default gen_random_uuid(), issue_id uuid not null references public.issues on delete restrict,
  assessment_kind text not null check(assessment_kind in ('evidence_quality','visual_suggestion')),
  provider text not null, model_version text, result jsonb not null check(jsonb_typeof(result)='object'),
  advisory_only boolean not null default true check(advisory_only), created_at timestamptz not null default now()
);
create index ai_assessments_issue_created_idx on public.ai_assessments(issue_id,created_at desc);

create table public.verifications (
  id uuid primary key default gen_random_uuid(), issue_id uuid not null references public.issues,
  verification_type text not null default 'repair' check(verification_type in ('report','repair')),
  verifier_id uuid not null references public.profiles, outcome text not null check(outcome in ('pass','fail','partial','unable')),
  checklist jsonb not null, evidence_ids uuid[] not null, reason text, night_check boolean not null default false,
  created_at timestamptz not null default now()
);
create index verifications_issue_type_created_idx on public.verifications(issue_id,verification_type,created_at desc);
create table public.audit_events (
  id bigint generated always as identity primary key, actor_id uuid references public.profiles,
  actor_role text not null, action text not null, entity_type text not null, entity_id uuid,
  before_state jsonb, after_state jsonb, created_at timestamptz not null default now(),
  previous_hash text, event_hash text not null
);
create or replace function public.nearby_registered_assets(p_point geography,p_radius_m integer default 500)
returns table(asset_id uuid,public_code text,category text,distance_m double precision)
language sql stable security invoker set search_path = '' as $$
  select a.id,a.public_code,c.name,st_distance(a.location,p_point)
  from public.assets a join public.asset_categories c on c.id=a.category_id
  where p_point is not null and p_radius_m between 1 and 2000 and a.location_tier<>'hidden'
    and st_dwithin(a.location,p_point,p_radius_m)
  order by a.location <-> p_point limit 50
$$;

create index role_grants_user_role_ward_idx on public.role_grants(user_id,role,ward_id) where active;
create or replace function public.current_has_role(required_role public.noro_role, target_ward uuid default null)
returns boolean language sql stable security invoker set search_path = '' as $$
  select exists(select 1 from public.role_grants g where g.user_id=(select auth.uid()) and g.role=required_role and g.active and (target_ward is null or g.ward_id=target_ward or (g.ward_id is null and g.role='citizen')))
$$;

create or replace function public.can_read_assignment(p_issue uuid,p_assignee_user uuid,p_assignee_org uuid)
returns boolean language plpgsql stable security definer set search_path = '' as $$
declare i public.issues; a public.assets; own_org uuid;
begin
  if (select auth.uid()) is null then return false; end if;
  select * into i from public.issues where id=p_issue;
  if not found then return false; end if;
  select * into a from public.assets where id=i.asset_id;
  select org_id into own_org from public.profiles where id=(select auth.uid());
  return i.reporter_id=(select auth.uid())
    or public.current_has_role('municipal_officer',a.ward_id)
    or public.current_has_role('ward_admin',a.ward_id)
    or public.current_has_role('auditor',a.ward_id)
    or ((public.current_has_role('contractor',a.ward_id) or public.current_has_role('field_worker',a.ward_id))
      and (p_assignee_user=(select auth.uid()) or (p_assignee_user is null and p_assignee_org=own_org)));
end $$;

create or replace function public.can_access_assigned_issue(p_issue uuid)
returns boolean language plpgsql stable security definer set search_path = '' as $$
declare i public.issues; a public.assets; own_org uuid; x public.assignments;
begin
  if (select auth.uid()) is null then return false; end if;
  select * into i from public.issues where id=p_issue;
  if not found then return false; end if;
  select * into a from public.assets where id=i.asset_id;
  if not (public.current_has_role('contractor',a.ward_id) or public.current_has_role('field_worker',a.ward_id) or public.current_has_role('department_officer',a.ward_id)) then return false; end if;
  select org_id into own_org from public.profiles where id=(select auth.uid());
  select * into x from public.assignments where issue_id=p_issue order by created_at desc,id desc limit 1;
  return found and x.assignee_org_id=own_org and (x.assignee_user_id is null or x.assignee_user_id=(select auth.uid()));
end $$;

create or replace function public.can_read_issue_evidence(p_issue uuid)
returns boolean language plpgsql stable security definer set search_path = '' as $$
declare i public.issues; a public.assets;
begin
  if (select auth.uid()) is null then return false; end if;
  select * into i from public.issues where id=p_issue;
  if not found then return false; end if;
  select * into a from public.assets where id=i.asset_id;
  return i.reporter_id=(select auth.uid()) or i.repairer_user_id=(select auth.uid())
    or public.can_access_assigned_issue(p_issue)
    or public.current_has_role('verifier',a.ward_id)
    or public.current_has_role('municipal_officer',a.ward_id)
    or public.current_has_role('department_officer',a.ward_id)
    or public.current_has_role('auditor',a.ward_id);
end $$;

create or replace function public.can_upload_issue_evidence(p_issue uuid)
returns boolean language plpgsql stable security definer set search_path = '' as $$
declare i public.issues; a public.assets;
begin
  if (select auth.uid()) is null then return false; end if;
  select * into i from public.issues where id=p_issue;
  if not found then return false; end if;
  select * into a from public.assets where id=i.asset_id;
  return (i.reporter_id=(select auth.uid()) and i.status='under_verification')
    or ((i.repairer_user_id=(select auth.uid()) or public.can_access_assigned_issue(p_issue)) and i.status in ('assigned','accepted','in_progress'))
    or (public.current_has_role('verifier',a.ward_id) and i.status in ('under_verification','repair_claimed','verification_pending') and i.reporter_id<>(select auth.uid()) and coalesce(i.repairer_user_id,(select auth.uid()))<>(select auth.uid()));
end $$;

create or replace function public.can_access_evidence_path(p_name text,p_upload boolean default false)
returns boolean language plpgsql stable security definer set search_path = '' as $$
declare folders text[]; issue_id uuid;
begin
  if (select auth.uid()) is null then return false; end if;
  folders := storage.foldername(p_name);
  if coalesce(array_length(folders,1),0)<>2 then return false; end if;
  begin issue_id := folders[1]::uuid; exception when invalid_text_representation then return false; end;
  if p_upload then
    return folders[2]=(select auth.uid())::text and public.can_upload_issue_evidence(issue_id);
  end if;
  return exists(select 1 from public.evidence e where e.issue_id=issue_id and e.storage_path=p_name
    and e.uploader_id::text=folders[2] and public.can_read_issue_evidence(issue_id));
end $$;

create or replace function public.register_evidence(p_issue uuid,p_storage_path text,p_sha256 text,p_kind text,p_captured_at timestamptz,p_location geography,p_accuracy_m real,p_capture_mode text)
returns public.evidence language plpgsql security definer set search_path = '' as $$
declare result public.evidence;
begin
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  if not public.can_upload_issue_evidence(p_issue) then raise exception using errcode='42501',message='Evidence upload is not allowed for this role or issue'; end if;
  if not public.can_access_evidence_path(p_storage_path,true) then raise exception using errcode='42501',message='Evidence path must be issue/user/file'; end if;
  if p_sha256 !~ '^[0-9a-f]{64}$' then raise exception using errcode='23514',message='Evidence digest must be a SHA-256 hex value'; end if;
  if not exists(select 1 from storage.objects o where o.bucket_id='noro-evidence' and o.name=p_storage_path) then raise exception using errcode='23514',message='Upload the evidence file to private storage first'; end if;
  insert into public.evidence(issue_id,uploader_id,storage_path,sha256,kind,captured_at,location,accuracy_m,capture_mode)
    values(p_issue,(select auth.uid()),p_storage_path,p_sha256,p_kind,p_captured_at,p_location,p_accuracy_m,p_capture_mode)
    returning * into result;
  return result;
end $$;

create or replace function public.submit_issue_report(p_asset uuid,p_location geography,p_fault public.issue_fault_type,p_description text,p_severity text default 'medium')
returns public.issues language plpgsql security definer set search_path = '' as $$
declare result public.issues; asset_row public.assets;
begin
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Sign in to submit a report'; end if;
  if not public.current_has_role('citizen') then raise exception using errcode='42501',message='Citizen role required'; end if;
  if nullif(trim(p_description),'') is null then raise exception using errcode='23514',message='A report description is required'; end if;
  if p_severity not in ('critical','high','medium','low') then raise exception using errcode='23514',message='Invalid severity'; end if;
  if p_asset is not null then
    select * into asset_row from public.assets where id=p_asset;
    if not found or asset_row.location_tier='hidden' then raise exception using errcode='23514',message='Asset is unavailable for citizen reporting'; end if;
  elsif p_location is null then raise exception using errcode='23514',message='Choose an asset or confirm a map location'; end if;
  insert into public.issues(asset_id,capture_location,fault_type,description,reporter_id,severity,status)
  values(p_asset,p_location,p_fault,trim(p_description),(select auth.uid()),p_severity,'under_verification') returning * into result;
  return result;
end $$;

create or replace function public.validate_issue_report(p_issue uuid,p_confirm boolean,p_reason text default null)
returns public.issues language plpgsql security definer set search_path = '' as $$
declare i public.issues; a public.assets; target public.issue_status;
begin
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  if i.asset_id is null then raise exception using errcode='23514',message='Register or classify this unregistered observation before validating it'; end if;
  select * into a from public.assets where id=i.asset_id;
  if not (public.current_has_role('municipal_officer',a.ward_id) or public.current_has_role('ward_admin',a.ward_id)) then raise exception using errcode='42501',message='Civic Operations Manager role required'; end if;
  if i.status<>'under_verification' then raise exception using errcode='23514',message='Only a newly reported issue can be validated'; end if;
  if not p_confirm and nullif(trim(p_reason),'') is null then raise exception using errcode='23514',message='Give a reason for marking this report unconfirmed'; end if;
  target:=case when p_confirm then 'verified'::public.issue_status else 'unconfirmed'::public.issue_status end;
  update public.issues set status=target where id=p_issue returning * into i; return i;
end $$;

create or replace function public.assign_issue(p_issue uuid,p_org uuid,p_assignee uuid default null)
returns public.issues language plpgsql security definer set search_path = '' as $$
declare i public.issues; a public.assets;
begin
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  select * into a from public.assets where id=i.asset_id;
  if not (public.current_has_role('municipal_officer',a.ward_id) or public.current_has_role('ward_admin',a.ward_id)) then raise exception using errcode='42501',message='Officer role required'; end if;
  if i.status not in ('verified','reopened') then raise exception using errcode='23514',message='Only a verified or reopened issue can be assigned'; end if;
  if not exists(select 1 from public.organisations o where o.id=p_org) then raise exception using errcode='23514',message='Repair organisation not found'; end if;
  if p_assignee is not null and not exists(select 1 from public.profiles p where p.id=p_assignee and p.org_id=p_org) then raise exception using errcode='23514',message='Assignee must belong to the selected organisation'; end if;
  update public.issues set status='assigned',assignee_org_id=p_org where id=p_issue returning * into i;
  insert into public.assignments(issue_id,assignee_org_id,assignee_user_id,created_by) values(p_issue,p_org,p_assignee,(select auth.uid()));
  return i;
end $$;

create or replace function public.accept_assignment(p_issue uuid)
returns public.issues language plpgsql security definer set search_path = '' as $$
declare i public.issues; a public.assets; x public.assignments; own_org uuid;
begin
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  select * into a from public.assets where id=i.asset_id;
  select org_id into own_org from public.profiles where id=(select auth.uid());
  select * into x from public.assignments where issue_id=p_issue order by created_at desc,id desc limit 1;
  if i.status<>'assigned' or not found or x.assignee_org_id<>own_org or (x.assignee_user_id is not null and x.assignee_user_id<>(select auth.uid())) or not public.current_has_role('contractor',a.ward_id) then raise exception using errcode='42501',message='Only the assigned contractor can accept this job'; end if;
  update public.issues set status='accepted' where id=p_issue returning * into i; return i;
end $$;

create or replace function public.start_repair_work(p_issue uuid)
returns public.issues language plpgsql security definer set search_path = '' as $$
declare i public.issues;
begin
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  if i.status<>'accepted' or not public.can_access_assigned_issue(p_issue) then raise exception using errcode='42501',message='Accept the assigned job before starting work'; end if;
  update public.issues set status='in_progress' where id=p_issue returning * into i; return i;
end $$;

create or replace function public.claim_repair(p_issue uuid,p_evidence uuid[],p_cause text)
returns public.issues language plpgsql security definer set search_path = '' as $$
declare i public.issues; a public.assets;
begin
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  select * into a from public.assets where id=i.asset_id;
  if not (public.current_has_role('contractor',a.ward_id) or public.current_has_role('field_worker',a.ward_id) or public.current_has_role('department_officer',a.ward_id)) then raise exception using errcode='42501',message='Repair role required'; end if;
  if i.status<>'in_progress' then raise exception using errcode='23514',message='Accept and start work before claiming a repair'; end if;
  if not exists(select 1 from public.assignments x join public.profiles p on p.id=(select auth.uid()) where x.issue_id=p_issue and x.id=(select x2.id from public.assignments x2 where x2.issue_id=p_issue order by x2.created_at desc,x2.id desc limit 1) and ((x.assignee_user_id is not null and x.assignee_user_id=(select auth.uid())) or (x.assignee_user_id is null and x.assignee_org_id=p.org_id))) then raise exception using errcode='42501',message='Issue is assigned to another repairer'; end if;
  if coalesce(array_length(p_evidence,1),0)<1 or nullif(trim(p_cause),'') is null then raise exception using errcode='23514',message='Repair notes and evidence are required'; end if;
  if exists(select 1 from unnest(p_evidence) e where not exists(select 1 from public.evidence ev where ev.id=e and ev.issue_id=p_issue and ev.uploader_id=(select auth.uid()))) then raise exception using errcode='23514',message='Repair evidence must belong to this issue and actor'; end if;
  insert into public.repair_claims(issue_id,contractor_user_id,notes,evidence_ids) values(p_issue,(select auth.uid()),trim(p_cause),p_evidence);
  update public.issues set status='verification_pending',repairer_user_id=(select auth.uid()),claimed_at=now() where id=p_issue returning * into i;
  return i;
end $$;

create or replace function public.start_repair_verification(p_issue uuid)
returns public.issues language plpgsql security definer set search_path = '' as $$
declare i public.issues; a public.assets; has_conflict boolean;
begin
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  select * into a from public.assets where id=i.asset_id;
  if not public.current_has_role('verifier',a.ward_id) then raise exception using errcode='42501',message='Authorised verifier required'; end if;
  if i.status<>'verification_pending' then raise exception using errcode='23514',message='No repair claim is awaiting an independent check'; end if;
  if i.reporter_id=(select auth.uid()) or i.repairer_user_id=(select auth.uid()) then raise exception using errcode='23514',message='RULE_R11: verifier must differ from reporter and repairer'; end if;
  select c.has_conflict into has_conflict from public.conflict_declarations c where c.issue_id=p_issue and c.verifier_id=(select auth.uid());
  if coalesce(has_conflict,true) then raise exception using errcode='23514',message='Declare no conflict before starting verification'; end if;
  return i;
end $$;

create or replace function public.verify_report(p_issue uuid,p_outcome text,p_checklist jsonb,p_evidence uuid,p_reason text default null)
returns public.issues language plpgsql security definer set search_path = '' as $$
declare i public.issues; a public.assets; has_conflict boolean;
begin
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  select * into a from public.assets where id=i.asset_id;
  if not public.current_has_role('verifier',a.ward_id) then raise exception using errcode='42501',message='Authorised verifier required'; end if;
  if i.status<>'under_verification' then raise exception using errcode='23514',message='Report is not awaiting verification'; end if;
  if i.reporter_id=(select auth.uid()) then raise exception using errcode='23514',message='RULE_R11: verifier must differ from reporter'; end if;
  select c.has_conflict into has_conflict from public.conflict_declarations c where c.issue_id=p_issue and c.verifier_id=(select auth.uid());
  if coalesce(has_conflict,true) then raise exception using errcode='23514',message='Declare no conflict before verifying'; end if;
  if p_outcome not in ('pass','fail') or jsonb_typeof(p_checklist)<>'array' or jsonb_array_length(p_checklist)=0 then raise exception using errcode='23514',message='Outcome and checklist required'; end if;
  if exists(select 1 from jsonb_array_elements(p_checklist) as item(value) where coalesce((item.value->>'complete')::boolean,false)=false) then raise exception using errcode='23514',message='Every checklist item must be complete'; end if;
  if p_outcome='fail' and nullif(trim(p_reason),'') is null then raise exception using errcode='23514',message='An unconfirmed report needs a written reason'; end if;
  if not exists(select 1 from public.evidence e where e.id=p_evidence and e.issue_id=p_issue and e.uploader_id=(select auth.uid())) then raise exception using errcode='23514',message='Verifier evidence for this issue is required'; end if;
  insert into public.verifications(issue_id,verification_type,verifier_id,outcome,checklist,evidence_ids,reason)
    values(p_issue,'report',(select auth.uid()),p_outcome,p_checklist,array[p_evidence],nullif(trim(p_reason),''));
  update public.issues set status=case when p_outcome='pass' then 'verified'::public.issue_status else 'unconfirmed'::public.issue_status end where id=p_issue returning * into i;
  return i;
end $$;

create or replace function public.verify_repair(p_issue uuid,p_outcome text,p_checklist jsonb,p_evidence uuid[],p_night_check boolean default false)
returns public.issues language plpgsql security definer set search_path = '' as $$
declare i public.issues; a public.assets; conflict boolean; needed integer; passed integer; new_status public.issue_status;
begin
  select * into i from public.issues where id=p_issue for update;
  if not found then raise exception using errcode='P0002',message='Issue not found'; end if;
  if (select auth.uid()) is null then raise exception using errcode='42501',message='Authentication required'; end if;
  select * into a from public.assets where id=i.asset_id;
  if not public.current_has_role('verifier',a.ward_id) then raise exception using errcode='42501',message='Authorised verifier required'; end if;
  if i.status<>'verification_pending' then raise exception using errcode='23514',message='No repair is awaiting verification'; end if;
  if i.reporter_id=(select auth.uid()) or i.repairer_user_id=(select auth.uid()) then raise exception using errcode='23514',message='RULE_R11: verifier must differ from reporter and repairer'; end if;
  select has_conflict into conflict from public.conflict_declarations where issue_id=p_issue and verifier_id=(select auth.uid());
  if coalesce(conflict,true) then raise exception using errcode='23514',message='Declare no conflict before verifying'; end if;
  if p_outcome not in ('pass','fail') or jsonb_typeof(p_checklist)<>'array' or jsonb_array_length(p_checklist)=0 then raise exception using errcode='23514',message='Outcome and complete checklist required'; end if;
  if exists(select 1 from jsonb_array_elements(p_checklist) x where coalesce((x->>'complete')::boolean,false)=false) then raise exception using errcode='23514',message='Every required checklist item must be complete'; end if;
  if p_outcome='fail' and not exists(select 1 from jsonb_array_elements(p_checklist) x where coalesce((x->>'pass')::boolean,true)=false) then raise exception using errcode='23514',message='A failed outcome must cite a failed checklist item'; end if;
  if coalesce(array_length(p_evidence,1),0)<1 then raise exception using errcode='23514',message='Verification evidence is required'; end if;
  if exists(select 1 from unnest(p_evidence) e where not exists(select 1 from public.evidence ev where ev.id=e and ev.issue_id=p_issue and ev.uploader_id=(select auth.uid()))) then raise exception using errcode='23514',message='Verifier evidence must belong to this issue and actor'; end if;
  if not p_night_check then raise exception using errcode='23514',message='Streetlight verification must be performed after dusk'; end if;
  insert into public.verifications(issue_id,verifier_id,outcome,checklist,evidence_ids,night_check) values(p_issue,(select auth.uid()),p_outcome,p_checklist,p_evidence,p_night_check);
  if p_outcome='fail' then new_status='reopened'; else
    select case when c.risk_class='high' then 2 else 1 end into needed from public.assets x join public.asset_categories c on c.id=x.category_id where x.id=i.asset_id;
    select count(distinct verifier_id) into passed from public.verifications where issue_id=p_issue and verification_type='repair' and outcome='pass' and created_at>=i.claimed_at;
    if passed<coalesce(needed,1) then new_status='verification_pending'; else new_status='verified_closed'; end if;
  end if;
  update public.issues set status=new_status,verified_closed_at=case when new_status='verified_closed' then now() else null end where id=p_issue returning * into i;
  return i;
end $$;

create or replace function public.guard_issue_update() returns trigger language plpgsql security invoker set search_path = '' as $$
begin
  if new.status is distinct from old.status and current_user not in ('postgres','supabase_admin') then raise exception using errcode='42501',message='Use the governed RPC transition'; end if;
  if old.reporter_id is distinct from new.reporter_id or old.asset_id is distinct from new.asset_id then raise exception using errcode='42501',message='Issue identity fields are immutable'; end if;
  return new;
end $$;
create trigger issues_guard_update before update on public.issues for each row execute function public.guard_issue_update();
create or replace function public.guard_audit_immutable() returns trigger language plpgsql as $$ begin raise exception 'Audit events are append-only'; end $$;
create trigger audit_no_mutation before update or delete on public.audit_events for each row execute function public.guard_audit_immutable();
create or replace function public.record_issue_audit() returns trigger language plpgsql security definer set search_path = pg_catalog,public,extensions as $$
declare actor uuid; role_name text; prev text; before_data jsonb; after_data jsonb; action_name text; event_time timestamptz := clock_timestamp();
begin
  perform pg_advisory_xact_lock(424242);
  actor := (select auth.uid());
  select g.role::text into role_name from public.role_grants g where g.user_id=actor and g.active order by g.role limit 1;
  select e.event_hash into prev from public.audit_events e order by e.id desc limit 1;
  after_data := jsonb_build_object('status',new.status,'assignee_org_id',new.assignee_org_id,'repairer_user_id',new.repairer_user_id,'claimed_at',new.claimed_at,'verified_closed_at',new.verified_closed_at);
  if tg_op='INSERT' then
    action_name := 'issue submitted';
  else
    before_data := jsonb_build_object('status',old.status,'assignee_org_id',old.assignee_org_id,'repairer_user_id',old.repairer_user_id,'claimed_at',old.claimed_at,'verified_closed_at',old.verified_closed_at);
    action_name := case when old.status is distinct from new.status then 'issue state changed' else 'issue record changed' end;
  end if;
  insert into public.audit_events(actor_id,actor_role,action,entity_type,entity_id,before_state,after_state,created_at,previous_hash,event_hash)
  values(actor,coalesce(role_name,'system'),action_name,'issue',new.id,before_data,after_data,event_time,prev,
    encode(digest(coalesce(prev,'')||'|'||action_name||'|issue|'||new.id::text||'|'||coalesce(before_data::text,'')||'|'||coalesce(after_data::text,'')||'|'||event_time::text,'sha256'),'hex'));
  return new;
end $$;

create or replace function public.record_governance_audit() returns trigger language plpgsql security definer set search_path = pg_catalog,public,extensions as $$
declare actor uuid; role_name text; prev text; row_data jsonb; after_data jsonb; action_name text; issue_uuid uuid; event_time timestamptz := clock_timestamp();
begin
  perform pg_advisory_xact_lock(424242);
  actor := (select auth.uid());
  select g.role::text into role_name from public.role_grants g where g.user_id=actor and g.active order by g.role limit 1;
  select e.event_hash into prev from public.audit_events e order by e.id desc limit 1;
  row_data := to_jsonb(new);
  issue_uuid := (row_data->>'issue_id')::uuid;
  case tg_table_name
    when 'assignments' then
      action_name := 'repair assigned';
      after_data := jsonb_build_object('assignee_org_id',row_data->'assignee_org_id','assignee_user_id',row_data->'assignee_user_id','planned_for',row_data->'planned_for');
    when 'evidence' then
      action_name := 'evidence submitted';
      after_data := jsonb_build_object('evidence_id',row_data->'id','uploader_id',row_data->'uploader_id','sha256',row_data->'sha256','kind',row_data->'kind','capture_mode',row_data->'capture_mode');
    when 'repair_claims' then
      action_name := 'repair claimed';
      after_data := jsonb_build_object('claim_id',row_data->'id','contractor_user_id',row_data->'contractor_user_id','notes',row_data->'notes','evidence_ids',row_data->'evidence_ids','claimed_at',row_data->'claimed_at');
    when 'conflict_declarations' then
      action_name := 'conflict declaration recorded';
      after_data := jsonb_build_object('verifier_id',row_data->'verifier_id','has_conflict',row_data->'has_conflict','reason',row_data->'reason');
    when 'verifications' then
      action_name := 'independent verification recorded';
      after_data := jsonb_build_object('verifier_id',row_data->'verifier_id','verification_type',row_data->'verification_type','outcome',row_data->'outcome','checklist',row_data->'checklist','evidence_ids',row_data->'evidence_ids','reason',row_data->'reason','night_check',row_data->'night_check');
    else raise exception using errcode='22023',message='Unsupported governance audit source';
  end case;
  insert into public.audit_events(actor_id,actor_role,action,entity_type,entity_id,before_state,after_state,created_at,previous_hash,event_hash)
  values(actor,coalesce(role_name,'system'),action_name,tg_table_name,issue_uuid,null,after_data,event_time,prev,
    encode(digest(coalesce(prev,'')||'|'||action_name||'|'||tg_table_name||'|'||issue_uuid::text||'||'||coalesce(after_data::text,'')||'|'||event_time::text,'sha256'),'hex'));
  return new;
end $$;

create trigger assignments_audit_insert after insert on public.assignments for each row execute function public.record_governance_audit();
create trigger evidence_audit_insert after insert on public.evidence for each row execute function public.record_governance_audit();
create trigger repair_claims_audit_insert after insert on public.repair_claims for each row execute function public.record_governance_audit();
create trigger conflict_audit_insert after insert on public.conflict_declarations for each row execute function public.record_governance_audit();
create trigger verifications_audit_insert after insert on public.verifications for each row execute function public.record_governance_audit();
revoke all on function public.record_issue_audit() from public,anon,authenticated;
revoke all on function public.record_governance_audit() from public,anon,authenticated;
create trigger issues_audit_insert after insert on public.issues for each row execute function public.record_issue_audit();
create trigger issues_audit_update after update on public.issues for each row execute function public.record_issue_audit();

alter table public.wards enable row level security;
alter table public.profiles enable row level security;
alter table public.role_grants enable row level security;
alter table public.role_requests enable row level security;
alter table public.organisations enable row level security;
alter table public.asset_categories enable row level security;
alter table public.assets enable row level security;
alter table public.departments enable row level security;
alter table public.service_categories enable row level security;
alter table public.issue_categories enable row level security;
alter table public.service_standards enable row level security;
alter table public.sla_rules enable row level security;
alter table public.verification_checklists enable row level security;
alter table public.contractors enable row level security;
alter table public.contractor_specialisations enable row level security;
alter table public.verifier_profiles enable row level security;
alter table public.issues enable row level security;
alter table public.assignments enable row level security;
alter table public.evidence enable row level security;
alter table public.repair_claims enable row level security;
alter table public.ai_assessments enable row level security;
alter table public.conflict_declarations enable row level security;
alter table public.verifications enable row level security;
alter table public.audit_events enable row level security;

create policy wards_public_read on public.wards for select to anon,authenticated using(true);
create policy categories_public_read on public.asset_categories for select to anon,authenticated using(true);
create policy organisations_member_read on public.organisations for select to authenticated using(id=(select org_id from public.profiles where id=(select auth.uid())) or public.current_has_role('municipal_officer') or public.current_has_role('department_officer') or public.current_has_role('auditor') or public.current_has_role('admin'));
create policy departments_public_read on public.departments for select to anon,authenticated using(true);
create policy services_public_read on public.service_categories for select to anon,authenticated using(true);
create policy issue_categories_public_read on public.issue_categories for select to anon,authenticated using(active);
create policy standards_public_read on public.service_standards for select to anon,authenticated using(state in ('proposed','adopted'));
create policy sla_rules_public_read on public.sla_rules for select to anon,authenticated using(state in ('proposed','adopted'));
create policy checklists_public_read on public.verification_checklists for select to anon,authenticated using(active);
create policy contractors_scoped_read on public.contractors for select to authenticated using(exists(select 1 from public.profiles p where p.org_id=contractors.organisation_id and p.id=(select auth.uid())) or public.current_has_role('municipal_officer') or public.current_has_role('auditor'));
create policy contractor_specialisations_read on public.contractor_specialisations for select to authenticated using(exists(select 1 from public.contractors c join public.profiles p on p.org_id=c.organisation_id where c.id=contractor_specialisations.contractor_id and p.id=(select auth.uid())) or public.current_has_role('municipal_officer') or public.current_has_role('auditor'));
create policy verifier_profile_scoped_read on public.verifier_profiles for select to authenticated using(user_id=(select auth.uid()) or public.current_has_role('municipal_officer') or public.current_has_role('auditor'));
create policy assets_ward_read on public.assets for select to authenticated using(public.current_has_role('municipal_officer',ward_id) or public.current_has_role('department_officer',ward_id) or public.current_has_role('ward_admin',ward_id) or public.current_has_role('citizen',ward_id) or public.current_has_role('verifier',ward_id) or public.current_has_role('contractor',ward_id) or public.current_has_role('field_worker',ward_id) or public.current_has_role('auditor',ward_id));
create policy profiles_self_read on public.profiles for select to authenticated using(id=(select auth.uid()));
create policy profiles_self_update on public.profiles for update to authenticated using(id=(select auth.uid())) with check(id=(select auth.uid()));
create policy roles_self_read on public.role_grants for select to authenticated using(user_id=(select auth.uid()));
create policy role_requests_self_read on public.role_requests for select to authenticated using(user_id=(select auth.uid()) or public.current_has_role('admin'));
create policy issues_reporter_read on public.issues for select to authenticated using(reporter_id=(select auth.uid()));
create policy issues_public_read on public.issues for select to anon using(true);
create policy issues_reporter_insert on public.issues for insert to authenticated with check(reporter_id=(select auth.uid()) and status='under_verification' and ((asset_id is not null and exists(select 1 from public.assets a where a.id=issues.asset_id and a.location_tier<>'hidden')) or (asset_id is null and capture_location is not null)));
create policy issues_ward_read on public.issues for select to authenticated using(exists(select 1 from public.assets a where a.id=issues.asset_id and (public.current_has_role('verifier',a.ward_id) or public.current_has_role('coordinator',a.ward_id) or public.current_has_role('municipal_officer',a.ward_id) or public.current_has_role('department_officer',a.ward_id) or public.current_has_role('ward_admin',a.ward_id) or public.current_has_role('auditor',a.ward_id))));
create policy issues_assignee_read on public.issues for select to authenticated using(public.can_access_assigned_issue(id));
create policy assignments_scoped_read on public.assignments for select to authenticated using(public.can_read_assignment(issue_id,assignee_user_id,assignee_org_id));
create policy evidence_participant_read on public.evidence for select to authenticated using(exists(select 1 from public.issues i join public.assets a on a.id=i.asset_id where i.id=evidence.issue_id and (i.reporter_id=(select auth.uid()) or evidence.uploader_id=(select auth.uid()) or public.current_has_role('verifier',a.ward_id) or public.current_has_role('municipal_officer',a.ward_id) or public.current_has_role('auditor',a.ward_id) or public.can_access_assigned_issue(i.id))));
create policy ai_assessments_participant_read on public.ai_assessments for select to authenticated using(exists(select 1 from public.issues i join public.assets a on a.id=i.asset_id where i.id=ai_assessments.issue_id and (i.reporter_id=(select auth.uid()) or public.current_has_role('municipal_officer',a.ward_id) or public.current_has_role('verifier',a.ward_id) or public.can_access_assigned_issue(i.id))));
create policy repair_claims_participant_read on public.repair_claims for select to authenticated using(contractor_user_id=(select auth.uid()) or public.can_access_assigned_issue(issue_id) or exists(select 1 from public.issues i join public.assets a on a.id=i.asset_id where i.id=repair_claims.issue_id and (i.reporter_id=(select auth.uid()) or public.current_has_role('verifier',a.ward_id) or public.current_has_role('municipal_officer',a.ward_id) or public.current_has_role('auditor',a.ward_id)));
create policy conflict_own_read on public.conflict_declarations for select to authenticated using(verifier_id=(select auth.uid()) or public.current_has_role('coordinator'));
create policy conflict_own_insert on public.conflict_declarations for insert to authenticated with check(verifier_id=(select auth.uid()) and exists(select 1 from public.issues i join public.assets a on a.id=i.asset_id where i.id=conflict_declarations.issue_id and public.current_has_role('verifier',a.ward_id)));
create policy verification_participant_read on public.verifications for select to authenticated using(verifier_id=(select auth.uid()) or exists(select 1 from public.issues i join public.assets a on a.id=i.asset_id where i.id=verifications.issue_id and (i.reporter_id=(select auth.uid()) or public.current_has_role('municipal_officer',a.ward_id) or public.current_has_role('auditor',a.ward_id))));
create policy audit_auditor_read on public.audit_events for select to authenticated using(public.current_has_role('auditor') or public.current_has_role('admin'));

revoke all on public.wards,public.profiles,public.role_grants,public.role_requests,public.organisations,public.asset_categories,public.departments,public.service_categories,public.issue_categories,public.service_standards,public.sla_rules,public.verification_checklists,public.contractors,public.contractor_specialisations,public.verifier_profiles,public.assets,public.issues,public.ai_assessments,public.assignments,public.evidence,public.repair_claims,public.conflict_declarations,public.verifications,public.audit_events from anon,authenticated;
grant select on public.wards,public.asset_categories,public.departments,public.service_categories,public.issue_categories,public.service_standards,public.sla_rules,public.verification_checklists to anon,authenticated;
grant select on public.assets to authenticated;
grant select on public.profiles,public.role_grants,public.role_requests,public.contractors,public.contractor_specialisations,public.verifier_profiles,public.issues,public.ai_assessments,public.assignments,public.evidence,public.repair_claims,public.conflict_declarations,public.verifications,public.audit_events to authenticated;
grant select (id,public_code,asset_id,fault_type,status,severity,opened_at,claimed_at,verified_closed_at) on public.issues to anon;
grant update(display_name,phone) on public.profiles to authenticated;
revoke insert on public.issues from anon,authenticated;
grant insert on public.conflict_declarations to authenticated;
revoke all on function public.submit_issue_report(uuid,geography,public.issue_fault_type,text,text) from public,anon;
revoke all on function public.validate_issue_report(uuid,boolean,text) from public,anon;
revoke all on function public.assign_issue(uuid,uuid,uuid) from public,anon;
revoke all on function public.claim_repair(uuid,uuid[],text) from public,anon;
revoke all on function public.accept_assignment(uuid) from public,anon;
revoke all on function public.start_repair_work(uuid) from public,anon;
revoke all on function public.start_repair_verification(uuid) from public,anon;
revoke all on function public.verify_repair(uuid,text,jsonb,uuid[],boolean) from public,anon;
revoke all on function public.verify_report(uuid,text,jsonb,uuid,text) from public,anon;
revoke all on function public.current_has_role(public.noro_role,uuid) from public,anon;
revoke all on function public.can_read_assignment(uuid,uuid,uuid) from public,anon;
revoke all on function public.can_access_assigned_issue(uuid) from public,anon;
revoke all on function public.can_read_issue_evidence(uuid) from public,anon;
revoke all on function public.can_upload_issue_evidence(uuid) from public,anon;
revoke all on function public.can_access_evidence_path(text,boolean) from public,anon;
revoke all on function public.nearby_registered_assets(geography,integer) from public,anon;
revoke all on function public.guard_issue_update() from public,anon,authenticated;
revoke all on function public.guard_audit_immutable() from public,anon,authenticated;
grant execute on function public.submit_issue_report(uuid,geography,public.issue_fault_type,text,text) to authenticated;
grant execute on function public.validate_issue_report(uuid,boolean,text) to authenticated;
grant execute on function public.assign_issue(uuid,uuid,uuid) to authenticated;
grant execute on function public.claim_repair(uuid,uuid[],text) to authenticated;
grant execute on function public.accept_assignment(uuid) to authenticated;
grant execute on function public.start_repair_work(uuid) to authenticated;
grant execute on function public.start_repair_verification(uuid) to authenticated;
grant execute on function public.verify_repair(uuid,text,jsonb,uuid[],boolean) to authenticated;
grant execute on function public.verify_report(uuid,text,jsonb,uuid,text) to authenticated;
grant execute on function public.current_has_role(public.noro_role,uuid) to authenticated;
grant execute on function public.can_read_assignment(uuid,uuid,uuid) to authenticated;
grant execute on function public.can_access_assigned_issue(uuid) to authenticated;
grant execute on function public.can_read_issue_evidence(uuid) to authenticated;
grant execute on function public.can_upload_issue_evidence(uuid) to authenticated;
grant execute on function public.can_access_evidence_path(text,boolean) to authenticated;
grant execute on function public.nearby_registered_assets(geography,integer) to authenticated;
revoke all on function public.register_evidence(uuid,text,text,text,timestamptz,geography,real,text) from public,anon,authenticated;
grant execute on function public.register_evidence(uuid,text,text,text,timestamptz,geography,real,text) to authenticated;

-- Private evidence uploads must use issue-uuid/uploader-uuid/file-name.
-- Evidence rows are inserted through register_evidence after Storage confirms the object exists.
create policy noro_evidence_upload on storage.objects for insert to authenticated
  with check(bucket_id='noro-evidence' and public.can_access_evidence_path(name,true));
create policy noro_evidence_read on storage.objects for select to authenticated
  using(bucket_id='noro-evidence' and public.can_access_evidence_path(name,false));
revoke update,delete on public.audit_events from public,anon,authenticated;

-- These definer views intentionally expose only curated public fields. In particular,
-- approximate asset coordinates are snapped before leaving the database and hidden
-- assets are excluded. Base asset rows remain unavailable to anonymous clients.
create view public.public_asset_registry with(security_invoker=false) as
select a.id,a.public_code,a.ward_id,a.category_id,a.location_tier,a.condition,
  case when a.location_tier='exact' then a.location else st_snaptogrid(a.location::geometry,0.001)::geography end as public_location
from public.assets a where a.location_tier<>'hidden';
create view public.public_issue_ledger with(security_invoker=false) as
select i.id,i.public_code,i.asset_id,i.fault_type,i.status,i.severity,i.opened_at,i.claimed_at,i.verified_closed_at,
  a.public_code as asset_code,a.ward_id
from public.issues i join public.assets a on a.id=i.asset_id;
grant select on public.public_asset_registry,public.public_issue_ledger to anon,authenticated;

comment on table public.issues is 'Issue transitions are governed server-side; client cannot update status directly.';
comment on table public.verifications is 'A pass is independent evidence; high-risk categories require two distinct passing verifiers for the current repair claim.';
comment on table public.audit_events is 'Append-only hash-chained governance event log. No update or delete.';
comment on view public.public_issue_ledger is 'PII-free curated public ledger view; its controlled fault category excludes reporter identity and report description.';
