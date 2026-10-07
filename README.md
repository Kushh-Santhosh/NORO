# NORO

## Civic Asset Accountability Network

**Public assets deserve public accountability.**

NORO is a proposed civic service platform that links reports about public assets to reviewed repair work, independent verification, and a privacy-conscious public record. Its central governance rule is simple: a contractor's repair claim is not proof of closure. A separate verifier must check and record the result.

NORO is not a government service. No government adoption, integration, or field-pilot result is implied.

## 1. Overview

A conventional grievance tool can record that a problem was reported and that someone marked it complete. NORO models the full chain of responsibility: which asset is affected, who reviewed the report, which organization received the work, what evidence was submitted, who checked the outcome, and what can safely be published.

The repository contains a live Supabase-connected application for controlled acceptance use and a separate browser-local preview. The live backend is connected to a dedicated NORO test project; this is not a claim of production deployment.

## 2. The problem

Public asset faults often pass through multiple teams and systems. A status such as “resolved” can hide whether work was assigned, whether a repair was claimed, whether the result was independently checked, or whether the same fault returned. NORO keeps those events distinct and attached to the asset and report.

## 3. Governance innovation

NORO treats independent verification as a required state transition. Role grants, ward scope, assignment checks, evidence requirements, conflict declarations, verification rules, and audit triggers are implemented in PostgreSQL policies and governed RPCs. The browser does not grant itself authority based on the selected URL or a demo identity.

## 4. How NORO works

1. A citizen locates a registered asset or reports an unregistered location, describes the fault, and may attach evidence.
2. A manager reviews and validates the report, corrects location details when needed, and assigns an appropriate service organization.
3. The assigned contractor accepts the work, starts repair, and submits notes and evidence with a repair claim.
4. A separate verifier declares conflict status, reviews the evidence, and records a checklist and pass/fail outcome.
5. A pass can close the issue under the configured verification rules. A failure reopens the issue for rework.
6. A curated public view displays allowed asset and outcome fields without exposing reporter identity, private notes, or evidence paths.

## 5. Two-key closure

The repair claim and the verification decision are separate records and separate actions. Contractors cannot mark their own repair verified. A repair claim moves an issue to verification pending; an independent verifier must record evidence and a passing result before it is eligible for verified closure. A failed check returns the same issue to rework. Lighting requires the additional after-dark check; other categories do not.

## 6. Role model

- **Citizen:** submits and follows reports permitted to their account.
- **Manager:** reviews ward-scoped reports, makes audited corrections, and assigns work.
- **Contractor:** sees assigned work and records acceptance, repair progress, evidence, and claims.
- **Verifier:** handles eligible verification tasks, declares conflicts, and records independent results.
- **Public:** reads curated asset and issue information without signing in.

Manager and verifier access is provisioned by an administrator. Contractor self-registration is an access request, not an approved role grant.

## 7. Citizen workflow

The authenticated citizen workspace reads their accessible reports and submits an issue to Supabase with a registered asset or a confirmed latitude/longitude, fault type, description, and optional file evidence. Uploads go to private Storage and are registered with the report. The separate preview has a richer map-first flow with optional geolocation, place search, draggable pin, and local nearby-asset matching. That richer preview flow is not yet the live authenticated reporting UI.

## 8. Manager workflow

The authenticated manager workspace loads ward-authorized records, validates reports, records location or asset corrections through an RPC, assigns available contractor organizations, reads database notifications, and reviews scoped audit history. The current UI does not yet provide a complete specialization-matched organization directory; verify contractor eligibility in the target configuration before assigning work.

## 9. Contractor workflow

A contractor sees assignment records allowed by their organization and role. The workspace exposes accept, start, and repair-claim actions according to the current state. A repair claim requires notes and evidence; the database then awaits an independent check.

## 10. Independent verification

A verifier can read evidence permitted for the issue, uses a short-lived signed URL for private files, declares conflict status, and submits verifier evidence and a checklist with pass/fail. The database enforces separation from the reporter and repairer and category-specific night requirements. A failed verification requires a reason and reopens the issue.

## 11. Asset passport

The live public registry presents the asset code, category, ward, condition, and privacy-filtered location. Selecting an asset shows linked public issue states and their report, repair-claim, rework, and verified-closure dates when available. Internal audit history and private evidence are not public passport content. The preview also has an illustrative local asset history.

## 12. Public accountability

`/map`, `/public-ledger`, and `/assets` are anonymous views. When configured, they query the curated `public_asset_registry` and `public_issue_ledger` views. The views expose only selected fields; evidence storage paths, citizen identity, and internal notes are not selected. Without Supabase configuration, these routes use synthetic preview records instead.

## 13. Architecture

NORO uses Preact, TypeScript, Vite, Supabase JS, PostgreSQL, PostGIS, and Leaflet. Main application routes are:

- `/` — product overview
- `/signin`, `/signup` — Supabase Auth, access requests, and password recovery
- `/account/:role` — authenticated Supabase workspace, with a matching active role grant required
- `/map`, `/public-ledger`, `/assets` — public database views or synthetic preview fallback
- `/demo`, `/workspace/:role` — separate local demo identities and workflows

The live `/account/:role` code does not use the preview's localStorage workflow store. Demo persistence is browser-local and is not a security boundary.

## 14. Supabase, PostgreSQL, and PostGIS

The migration chain defines wards, profiles, role grants and requests, organizations and service categories, assets, issues, assignments, repair claims, evidence metadata, conflict declarations, verifications, notifications, and audit events. PostGIS stores geography and provides the authenticated `nearby_registered_assets` RPC. Database changes are represented by ordered files under `supabase/migrations/`.

The current linked migration check confirms all six local migrations are applied, including `202610070004_organisation_directory_read_grant.sql`. The checkout is linked to the dedicated NORO test project. Re-link a fresh clone to the intended test project before running `--linked` commands. Do not infer that local migrations are deployed from file presence alone; inspect migration status before applying changes. This final verification applied only the reviewed pending migration and did not reset the database.

## 15. RLS and security

Live table reads are subject to PostgreSQL Row Level Security and role/ward/assignment predicates. Governed RPCs check authorization and state transitions in the database. Public access is limited to curated views. The frontend uses only `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`; a service-role key must never be placed in a `VITE_` variable or browser bundle. Keep `.env.local` private and untracked.

These controls have been exercised with the controlled test identities, but this does not replace a security review or prove production readiness.

## 16. Evidence storage

The `noro-evidence` Storage bucket is private. Uploads use the signed-in user's session and scoped Storage policies. `register_evidence` records metadata and a SHA-256 content hash after upload. Verifiers receive time-limited signed URLs for files they can access. Public views omit storage paths. In the preview, evidence is synthetic/local; its deterministic brightness suggestion is advisory and is not an AI authenticity check.

## 17. Notifications

Database triggers create recipient-scoped notifications for report receipt, assignment, contractor acceptance, repair claims, verification requirements, failed checks, and verified closure. The authenticated workspace displays unread count and can mark a notification read. The preview uses separate local notification state.

## 18. Audit history

Database triggers append actor, action, entity, and state information for governance events. The manager audit workspace reads events allowed by scoped RLS. Location corrections preserve the original point and reason. The preview audit chain is illustrative and browser-local.

## 19. Demo mode

`/demo` offers four synthetic identities: Asha Rao (Citizen), Meera Nair (Manager), Imran Khan (Contractor), and Ravi Menon (Verifier). Their records and transitions are stored in the current browser only. They do not authenticate with Supabase, and preview activity is not field-pilot evidence. Use `/signin` to access a real Auth session.

## 20. Local development

```sh
npm install
cp .env.example .env.local
npm run dev
```

The app is served by Vite. Never commit `.env.local`. The optional `VITE_OPENROUTESERVICE_API_KEY` enables user-requested driving directions; OpenStreetMap maps work without it.

## 21. Environment variables

`.env.example` documents the supported client settings:

- `VITE_APP_NAME`, `VITE_APP_ENV`
- `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`
- `VITE_MAP_PROVIDER`
- `VITE_OPENROUTESERVICE_API_KEY` (optional)

Only browser-safe keys may use the `VITE_` prefix. Do not add a service-role key to the frontend environment. The app reports whether configuration is present without rendering credential values.

## 22. Testing and acceptance

Run the local checks:

```sh
npm run lint
npm test -- --reporter=dot
npm run build
npm audit --omit=dev
git diff --check
```

At the latest local run, lint, all 18 automated tests, build, audit (0 production dependency vulnerabilities), and diff check passed. Live read checks confirmed the four controlled test accounts and role grants, manager audit read, public views, and nearby-assets RPC. Earlier controlled backend acceptance covered electrical repair/verification and the streetlight night-check rule, including a fail/rework/pass cycle. The test project currently exposes only synthetic electrical and streetlight asset categories and two verified-closed sample issues.

Full browser acceptance has **not** been completed. The manual checklist in [docs/TESTING.md](docs/TESTING.md) covers public pages, Auth, role flows, evidence, fail/rework, privacy, and responsive/accessibility checks. No browser automation result is claimed.

## 23. Current limitations

- The organization-directory grant is applied in the dedicated test database; check migration history separately for any other target environment.
- Controlled acceptance data currently covers electrical and streetlight categories, not toilet, road, footpath, or drainage scenarios.
- The live citizen report form is not yet the richer map-first multi-step flow available in preview.
- The live manager organization selector is not yet a complete specialization-matched directory.
- Cross-ward RLS, full browser journeys, and visual/accessibility review at all requested viewport sizes need further acceptance.
- NORO has no government integration, field-pilot evidence, municipal identity provider, or production deployment claim.

## 24. Project structure

```text
.
├── docs/                 Product, data, governance, demo, and test notes
├── public/               App icon and service worker
├── src/                  Preact app, authenticated workspaces, preview, and tests
├── supabase/
│   ├── migrations/       Ordered schema, RLS, RPC, and trigger changes
│   └── test/             Controlled synthetic acceptance fixture
├── .env.example
├── README.md
├── package.json
└── vite.config.ts
```

The full product specification is [Civic Asset Accountability Network — Master Blueprint (Seva First 2026, Track B)](Civic%20Asset%20Accountability%20Network%20%E2%80%94%20Master%20Blueprint%20(Seva%20First%202026,%20Track%20B).md).

## 25. Seva First positioning

NORO follows the Seva First blueprint's citizen-centered service and accountability framing: make public service responsibility visible, preserve an auditable record, and distinguish a work claim from an independently checked outcome. This is a product design position, not a claim of public-sector adoption or measured civic impact.

## Further documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Data model](docs/DATA_MODEL.md)
- [Governance](docs/GOVERNANCE.md)
- [Demo mode](docs/DEMO.md)
- [Testing and manual acceptance](docs/TESTING.md)
