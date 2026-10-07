-- Expose operational audit history only to managers in the issue's ward.
-- Auditor/admin access remains governed by the existing policy.
create policy audit_manager_read_scoped on public.audit_events
  for select to authenticated using (
    entity_type in ('issue','assignments','evidence','repair_claims','conflict_declarations','verifications')
    and exists (
      select 1
      from public.issues i
      left join public.assets a
        on a.id=case when i.manager_asset_override then i.manager_asset_id else i.asset_id end
      left join public.wards w
        on a.id is null
       and w.geom is not null
       and coalesce(i.manager_location,i.capture_location) is not null
       and public.st_covers(w.geom::public.geometry,coalesce(i.manager_location,i.capture_location)::public.geometry)
      where i.id=audit_events.entity_id
        and (
          (a.ward_id is not null and (
            public.current_has_role('municipal_officer',a.ward_id)
            or public.current_has_role('ward_admin',a.ward_id)
          ))
          or (a.ward_id is null and w.id is not null and (
            public.current_has_role('municipal_officer',w.id)
            or public.current_has_role('ward_admin',w.id)
          ))
        )
    )
  );

-- The blueprint requires verification under the relevant conditions for
-- night lighting. Other asset categories do not require an after-dark check.
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
  if exists(select 1 from public.assets x join public.asset_categories c on c.id=x.category_id where x.id=i.asset_id and (lower(c.code) like '%light%' or lower(c.name) like '%light%')) and not coalesce(p_night_check,false) then
    raise exception using errcode='23514',message='Lighting verification must be performed after dusk';
  end if;
  insert into public.verifications(issue_id,verifier_id,outcome,checklist,evidence_ids,night_check) values(p_issue,(select auth.uid()),p_outcome,p_checklist,p_evidence,coalesce(p_night_check,false));
  if p_outcome='fail' then new_status='reopened'; else
    select case when c.risk_class='high' then 2 else 1 end into needed from public.assets x join public.asset_categories c on c.id=x.category_id where x.id=i.asset_id;
    select count(distinct verifier_id) into passed from public.verifications where issue_id=p_issue and verification_type='repair' and outcome='pass' and created_at>=i.claimed_at;
    if passed<coalesce(needed,1) then new_status='verification_pending'; else new_status='verified_closed'; end if;
  end if;
  update public.issues set status=new_status,verified_closed_at=case when new_status='verified_closed' then now() else null end where id=p_issue returning * into i;
  return i;
end $$;
revoke all on function public.verify_repair(uuid,text,jsonb,uuid[],boolean) from public,anon;
grant execute on function public.verify_repair(uuid,text,jsonb,uuid[],boolean) to authenticated;
