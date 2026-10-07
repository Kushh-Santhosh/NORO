# NORO architecture

## Runtime modes and routes

NORO has two distinct modes. `/demo` and `/workspace/:role` use fictional local fixture data persisted in the current browser. They are useful for previewing transitions but provide no server authorization. The authenticated `/account/:role` route uses a Supabase Auth session, checks that the signed-in user has the requested active role grant, then reads and changes records using Supabase/PostgREST, RLS, Storage, and database RPCs. Public pages use live curated views when Supabase is configured; without configuration they show the preview data.

Routes: `/` is the landing page; `/signin` and `/signup` handle Supabase Auth; `/map`, `/public-ledger`, and `/assets` are anonymous public surfaces; `/settings/profile` and `/settings/environment` are preview shell settings routes. Self-service registration is for citizens and contractor access requests. Manager and verifier access is provisioned separately.

## Authenticated workflow

`src/BackendWorkspace.tsx` loads role grants, profile, visible issues, ward assets, categories, notifications, and manager audit/contractor records. Citizen reports call `submit_issue_report`; evidence uploads to private Storage and metadata is registered through `register_evidence`. Managers call validation, assignment, and location-correction RPCs. Contractors call accept/start/claim RPCs. Verifiers read signed evidence URLs, declare conflict status, begin verification, and submit pass/fail results. The database refresh follows each mutation.

The SQL migrations are the authoritative transition and authorization layer. RLS scopes table access; RPCs check identity, role, assignment, state, required evidence and checklist, independent verification, and category-specific night checks. Triggers append audit records and workflow notifications. Public views provide a deliberate field allowlist and do not select identity, private notes, or evidence storage paths.

## Reporting, location, and evidence

The live report form currently selects a registered asset or accepts latitude/longitude for an unregistered location, then submits description, fault type, and optional evidence. It calls the backend report RPC. The richer map-based, multi-step location picker is in the local demo workflow; it is not yet the authenticated report UI. This is a known integration gap. A PostGIS nearby-assets RPC exists in the migration set, but the live workspace does not currently call it to power asset discovery.

Demo location selection uses Leaflet/OpenStreetMap, optional browser geolocation, manual pin placement, and place search. Demo photo re-encoding removes source EXIF metadata. “Noro Evidence Assist” is deterministic local brightness feedback, not a vision model and cannot make governance decisions. Live evidence is stored privately; public views do not expose files.

## Maps and privacy

Leaflet maps use OpenStreetMap tiles with attribution. Demo markers use approximate synthetic coordinates. The live public map parses only privacy-filtered locations from the curated registry view. Exact citizen coordinates and protected asset points must not be presented as public data. Route requests are explicit and optional through `src/routing.ts`.

## Supabase schema

The migration chain defines profiles, role grants/requests, wards, organizations, departments, service categories, assets, issue taxonomy and reports, contractors and specializations, assignments, evidence, repair claims, conflict declarations, verification checklists, verifications, audit events, and notifications. PostGIS geography has spatial indexes and supports nearby asset search. Storage policies keep the evidence bucket private. Public views are intentionally curated; their owner and grant behavior should be included in each deployment review.

Always inspect the linked project reference and migration status before deployment. The ignored `supabase/.temp/` CLI link cache is generated locally and is not tracked; after a clean checkout, link to the intended test project before using `--linked` commands. Do not use `db reset` for a shared or existing database. A local SQL migration being present is not proof it has been applied remotely.

## Main source files

- `src/App.tsx` — route selection and separate local demo shell.
- `src/Product.tsx` — landing, authentication, demo access, and public/demo entry points.
- `src/BackendWorkspace.tsx` — authenticated Supabase workspace actions.
- `src/RemotePublicExplorer.tsx` — public database views and map.
- `src/ReportFlow.tsx` — map-first local preview reporting flow.
- `src/domain.ts` — deterministic browser demo transitions.
- `src/backendMappers.ts` — database value and geometry mapping.
- `supabase/migrations/` — ordered schema, policy, RPC, and trigger definitions.
