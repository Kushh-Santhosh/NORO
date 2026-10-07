-- Durable workflow notifications and the private evidence bucket.
-- Additive only: this migration does not alter existing NORO records.

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('noro-evidence', 'noro-evidence', false, 10485760,
        array['image/jpeg','image/png','image/webp','application/pdf'])
on conflict (id) do nothing;

create table public.notifications (
  id uuid primary key default extensions.gen_random_uuid(),
  recipient_id uuid not null references public.profiles(id) on delete cascade,
  type text not null check (type in (
    'report_received','assignment','contractor_accepted','repair_claimed',
    'verification_required','verification_failed','verified_closure'
  )),
  title text not null,
  message text not null,
  related_entity_type text not null check (related_entity_type in ('issue','assignment','repair_claim')),
  related_entity_id uuid not null,
  event_key text not null,
  read_at timestamptz,
  created_at timestamptz not null default now(),
  unique (recipient_id, event_key)
);
create index notifications_recipient_created_idx
  on public.notifications(recipient_id, created_at desc);
alter table public.notifications enable row level security;
revoke all on public.notifications from anon, authenticated;
grant select on public.notifications to authenticated;
grant update (read_at) on public.notifications to authenticated;
create policy notifications_read_own on public.notifications
  for select to authenticated using (recipient_id = (select auth.uid()));
create policy notifications_mark_own_read on public.notifications
  for update to authenticated using (recipient_id = (select auth.uid()))
  with check (recipient_id = (select auth.uid()));

create or replace function public.noro_emit_notification(
  p_recipient uuid, p_type text, p_title text, p_message text,
  p_entity_type text, p_entity uuid, p_event_key text
) returns void
language sql security definer set search_path = '' as $$
  insert into public.notifications(
    recipient_id,type,title,message,related_entity_type,related_entity_id,event_key
  )
  select p_recipient,p_type,p_title,p_message,p_entity_type,p_entity,p_event_key
  where p_recipient is not null
  on conflict (recipient_id,event_key) do nothing
$$;
revoke all on function public.noro_emit_notification(uuid,text,text,text,text,uuid,text) from public,anon,authenticated;

create or replace function public.noro_notify_issue_insert() returns trigger
language plpgsql security definer set search_path = '' as $$
declare asset_ward uuid;
begin
  perform public.noro_emit_notification(new.reporter_id,'report_received','Report received',
    'Your report is recorded and awaiting review.', 'issue',new.id,'issue:'||new.id||':reported');
  if new.asset_id is not null then
    select ward_id into asset_ward from public.assets where id=new.asset_id;
    perform public.noro_emit_notification(g.user_id,'report_received','New report received',
      'A new issue is awaiting review in your ward.', 'issue',new.id,'issue:'||new.id||':reported')
    from public.role_grants g
    where g.active and g.role in ('municipal_officer','ward_admin') and g.ward_id=asset_ward;
  end if;
  return new;
end $$;
create trigger issues_notify_insert after insert on public.issues
  for each row execute function public.noro_notify_issue_insert();

create or replace function public.noro_notify_issue_transition() returns trigger
language plpgsql security definer set search_path = '' as $$
declare asset_ward uuid; event_suffix text;
begin
  if new.status is not distinct from old.status then return new; end if;
  select ward_id into asset_ward from public.assets where id=new.asset_id;
  event_suffix := 'issue:'||new.id||':status:'||new.status::text||':'||coalesce(new.claimed_at::text,'');
  if new.status='accepted' then
    perform public.noro_emit_notification(g.user_id,'contractor_accepted','Contractor accepted assignment',
      'The assigned contractor accepted this issue.', 'issue',new.id,event_suffix)
    from public.role_grants g where g.active and g.role in ('municipal_officer','ward_admin') and g.ward_id=asset_ward;
    perform public.noro_emit_notification(new.reporter_id,'contractor_accepted','Work accepted',
      'The assigned repair team accepted your report.', 'issue',new.id,event_suffix);
  elsif new.status='verified_closed' then
    perform public.noro_emit_notification(new.reporter_id,'verified_closure','Repair independently verified',
      'An independent verifier passed the repair check. The issue is closed.', 'issue',new.id,event_suffix);
    perform public.noro_emit_notification(g.user_id,'verified_closure','Issue verified closed',
      'An independent verifier passed the repair check.', 'issue',new.id,event_suffix)
    from public.role_grants g where g.active and g.role in ('municipal_officer','ward_admin') and g.ward_id=asset_ward;
    perform public.noro_emit_notification(p.id,'verified_closure','Repair verified closed',
      'The issue you repaired passed independent verification.', 'issue',new.id,event_suffix)
    from public.profiles p where p.id=new.repairer_user_id;
  elsif new.status='reopened' then
    perform public.noro_emit_notification(new.reporter_id,'verification_failed','Verification failed · issue reopened',
      'The repair did not pass independent verification and needs more work.', 'issue',new.id,event_suffix);
    perform public.noro_emit_notification(p.id,'verification_failed','Rework required',
      'The repair did not pass independent verification. Review the issue and submit new evidence after rework.', 'issue',new.id,event_suffix)
    from public.profiles p where p.id=new.repairer_user_id;
    perform public.noro_emit_notification(g.user_id,'verification_failed','Verification failed · issue reopened',
      'A repair did not pass independent verification.', 'issue',new.id,event_suffix)
    from public.role_grants g where g.active and g.role in ('municipal_officer','ward_admin') and g.ward_id=asset_ward;
  end if;
  return new;
end $$;
create trigger issues_notify_transition after update of status on public.issues
  for each row execute function public.noro_notify_issue_transition();

create or replace function public.noro_notify_assignment() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  perform public.noro_emit_notification(p.id,'assignment','New repair assignment',
    'A civic repair issue has been assigned to your organization.', 'assignment',new.id,
    'assignment:'||new.id||':assigned')
  from public.profiles p where p.org_id=new.assignee_org_id
    and (new.assignee_user_id is null or p.id=new.assignee_user_id);
  return new;
end $$;
create trigger assignments_notify_insert after insert on public.assignments
  for each row execute function public.noro_notify_assignment();

create or replace function public.noro_notify_repair_claim() returns trigger
language plpgsql security definer set search_path = '' as $$
declare issue_row public.issues; asset_ward uuid;
begin
  select * into issue_row from public.issues where id=new.issue_id;
  select ward_id into asset_ward from public.assets where id=issue_row.asset_id;
  perform public.noro_emit_notification(issue_row.reporter_id,'repair_claimed','Repair claimed',
    'The contractor submitted a repair claim. Independent verification is required.', 'repair_claim',new.id,
    'repair-claim:'||new.id||':submitted');
  perform public.noro_emit_notification(g.user_id,'repair_claimed','Repair claimed · verification required',
    'A contractor submitted repair evidence for an issue in your ward.', 'repair_claim',new.id,
    'repair-claim:'||new.id||':submitted')
  from public.role_grants g where g.active and g.role in ('municipal_officer','ward_admin') and g.ward_id=asset_ward;
  perform public.noro_emit_notification(g.user_id,'verification_required','Repair ready for verification',
    'A repair claim is waiting for an independent check.', 'repair_claim',new.id,
    'repair-claim:'||new.id||':verification-required')
  from public.role_grants g where g.active and g.role='verifier' and g.ward_id=asset_ward
    and g.user_id<>issue_row.reporter_id and g.user_id<>new.contractor_user_id;
  return new;
end $$;
create trigger repair_claims_notify_insert after insert on public.repair_claims
  for each row execute function public.noro_notify_repair_claim();

revoke all on function public.noro_notify_issue_insert() from public,anon,authenticated;
revoke all on function public.noro_notify_issue_transition() from public,anon,authenticated;
revoke all on function public.noro_notify_assignment() from public,anon,authenticated;
revoke all on function public.noro_notify_repair_claim() from public,anon,authenticated;
