# NORO architecture

## Product routes

- `/` is the public product landing page.
- `/signin` and `/signup` separate real Supabase Auth from the demo. Citizen and contractor requests are the only self-service account types; Manager and Verifier access must be provisioned/approved.
- `/demo` offers Asha Rao, Meera Nair, Imran Khan, and Ravi Menon as distinct simulated identities. `/workspace/:role` checks the matching session identity and uses local fictional data.
- `/settings/profile` and `/settings/environment` are role-session protected shell settings routes. Environment status reports configuration presence, never key values, and explicitly distinguishes configured Supabase Auth from browser-local workflow persistence.
- `/map`, `/public-ledger`, and `/assets` provide anonymous public surfaces; legacy `/public/map` and `/public/ledger` paths remain aliases.

## Operational model

The client demo domain enforces manager assignment, contractor accept/start/claim, and independent verifier pass/fail transitions. Contractor claim requires evidence and notes and immediately enters `Verification pending`. The manager directory contains multiple organizations but only CivicWorks Electrical Services maps to the single contractor demo account. The verifier cannot close an issue they reported or repaired.

## Reporting and evidence

`ReportFlow.tsx` implements location → nearby asset → issue/evidence stages. `LocationPicker` is a Leaflet/OpenStreetMap map with map tap, draggable pin, optional browser geolocation with accuracy, and OpenStreetMap place search. The citizen explicitly confirms the final point. Local demo nearest-asset matching is an approximate haversine calculation over 64 fictional records; production should use the PostGIS `nearby_registered_assets` RPC. Unregistered observations retain the citizen-confirmed point and have no `assetId`.

Client photo re-encoding removes source EXIF from the local demo copy. `Noro Evidence Assist` currently checks only coarse brightness and gives a human-review suggestion. It does not classify authenticity or issue validity, and it cannot change issue state. The schema separates advisory assessment records from issue and verification records.

## Mapping and routing

Map panels use Leaflet and the OpenStreetMap tile service with attribution. Real roads/geography are shown; demo assets and issues use approximate synthetic coordinates. Public views apply safe display rules and omit evidence and personal names. Route requests are explicit and optional through `src/routing.ts`; `VITE_OPENROUTESERVICE_API_KEY` is required. The map stays available without the key.

## Database and security

The Supabase migration defines profiles, roles, wards, assets, issue/service taxonomy, assignments, repair claims, evidence, AI assessments, verifications, and append-only audit events. Assets and issue capture points use PostGIS geography with spatial indexes. Governed RPCs require auth and role/assignment/state checks; RLS scopes records and Storage policies keep evidence private. Public issue reads use a restricted column grant.

The migration is not applied to a live database and no workspace CRUD/RPC path is connected. Demo state remains browser-local and is not a security boundary. Production requires migration application/testing, private bucket setup, RPC wiring, and real-identity RLS verification. `.env.local` is ignored; `.env.example` documents public client configuration without secrets.

## Build

Vite, TypeScript, Preact, Leaflet, and Supabase JS. `domain.ts` contains deterministic local transitions; `App.tsx` owns role-scoped workspace navigation; `Product.tsx` provides landing/auth/public routes; `ReportFlow.tsx` provides the citizen map report; `routing.ts` isolates optional ORS directions.
