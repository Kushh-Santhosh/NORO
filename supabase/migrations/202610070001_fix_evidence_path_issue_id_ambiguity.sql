-- Avoid a PL/pgSQL name collision between the parsed issue ID and evidence.issue_id.
create or replace function public.can_access_evidence_path(p_name text,p_upload boolean default false)
returns boolean language plpgsql security definer set search_path = '' as $$
declare
  folders text[];
  parsed_issue_id uuid;
begin
  if (select auth.uid()) is null then return false; end if;
  folders := storage.foldername(p_name);
  if coalesce(array_length(folders,1),0)<>2 then return false; end if;
  begin
    parsed_issue_id := folders[1]::uuid;
  exception when invalid_text_representation then
    return false;
  end;
  if p_upload then
    return folders[2]=(select auth.uid())::text and public.can_upload_issue_evidence(parsed_issue_id);
  end if;
  return exists(
    select 1 from public.evidence e
    where e.issue_id=parsed_issue_id
      and e.storage_path=p_name
      and e.uploader_id::text=folders[2]
      and public.can_read_issue_evidence(parsed_issue_id)
  );
end $$;
