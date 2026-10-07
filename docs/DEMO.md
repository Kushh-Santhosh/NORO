# Preview mode

The `/demo` route opens synthetic browser-local workspaces for Asha Rao (Citizen), Meera Nair (Manager), Imran Khan (Contractor), and Ravi Menon (Verifier). Each persona has a fixed role. Demo actions persist only in that browser profile and are not sent to Supabase. Clearing this site's storage restores the seeded preview data.

The preview demonstrates reporting, manager review and assignment, contractor accept/start/repair claim, verifier pass/fail, audit timeline, notifications, and public-safe example views. It is illustrative product behavior, not government data, field-pilot results, or an authorization test.

Use `/signin` for real Supabase Auth. An authenticated account is routed to `/account/:role`; the live workspace uses Supabase and database policies. The local preview must not be used as evidence that live RLS or database persistence works.
