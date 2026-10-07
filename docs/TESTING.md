# Testing and acceptance

## Local checks

Run from the repository root:

```sh
npm run lint
npm test -- --reporter=dot
npm run build
npm audit --omit=dev
git diff --check
```

Vitest covers local workflow transitions and backend mapping helpers. The current suite has 18 tests across two files. These checks do not exercise every live RPC or a browser journey.

## Linked test database status

The linked project is a dedicated NORO test environment. The linked project is the dedicated NORO test environment. The final read-only migration list confirms all six local migrations applied, including `202610070004_organisation_directory_read_grant.sql`. The checkout is linked to that project. A fresh clone must be linked to the intended test project before using `--linked` commands. The migration push applied only 004 after reviewing its grant and existing RLS policy; the database was not reset.

Read-only checks against the connected project confirmed that the four controlled acceptance accounts can sign in and read their corresponding active role grants; the manager audit query succeeds; curated public registry and ledger views are queryable; and the authenticated PostGIS `nearby_registered_assets` RPC returns results. The current synthetic fixture has one ward, two asset categories (electrical fixture and streetlight), two public asset rows, and two verified-closed issue records. It does not support claiming toilet, road, footpath, or drainage scenarios were tested.

Earlier controlled backend acceptance exercised an electrical repair workflow with failed verification, rework, and a passing independent check, plus the streetlight after-dark rejection/pass rule. The current repository cleanup did not repeat those mutating workflows. Read results in this section do not by themselves prove cross-ward isolation or every write policy.

## Controlled acceptance setup

Use only the dedicated test project. Before applying schema, inspect the configured project reference and compare `supabase migration list --linked` with `supabase/migrations/`. Do not reset or delete existing data. `supabase/test/acceptance_setup.sql` expects four already-created controlled Auth accounts with the `.example` test addresses in the script; it creates synthetic ward, organization, specialization, and assets, but no reports. It does not insert users into `auth.users`.

The full backend acceptance should exercise citizen report submission; manager validation, correction, and assignment; contractor accept/start/claim; verifier conflict declaration and pass/fail; failed verification followed by rework and passing verification; notifications; audit events; private evidence upload/read; public-view privacy; PostGIS nearby lookup; and RLS isolation for each role and anonymous access. Verify that repair claim and closure are different states, lighting alone requires a night check, and a failed check reopens the same issue.

## Manual browser acceptance

Full browser acceptance has not been completed in this session, and no committed browser E2E harness is present. Complete these checks manually before release:

- Public: landing, live or preview map, public ledger, asset passport/history, and privacy fields.
- Auth: citizen and contractor signup, valid/invalid sign-in, password recovery, role routing, and sign-out.
- Citizen: report toilet, road, footpath, drainage, and streetlight cases; choose location/asset, attach a photo, review, submit, and follow the timeline.
- Manager: validate, correct location, assign a service-matched contractor, inspect notifications and audit history.
- Contractor: view own assignments, accept, start, add repair notes/evidence, and claim completion.
- Verifier: inspect repair evidence, declare conflict status, reject conflicted or self-verification, require night check for lighting only, and pass/fail with evidence/reason.
- Rework/public: verify fail reopens the same report, second claim followed by pass closes it, and public outcome omits private fields.
- Responsive/accessibility: check 390, 430, 768, 1024, and 1440 CSS-pixel widths; keyboard/focus order, Escape behavior, touch targets, labels/errors, contrast, reduced motion, and horizontal overflow.
