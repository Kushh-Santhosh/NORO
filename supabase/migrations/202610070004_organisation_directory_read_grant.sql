-- The existing organisations_member_read policy scopes the directory by
-- membership or municipal role; grant SELECT so PostgREST can apply that RLS.
grant select on public.organisations to authenticated;
