# NORO

**Public assets deserve public accountability.** Noro is a proposed civic asset accountability platform connecting citizen reports, mapped civic assets, manager triage, contractor repair claims, independent verification, and a public-safe record.

## Run locally

```sh
npm install
npm run dev
```

`/` is the public landing page. `/map`, `/public-ledger`, and `/assets` are public read-only demo surfaces. `/demo` offers four fixed simulated identities; `/signin` and `/signup` use Supabase Auth only when configured. Demo workspaces are local to the browser and do not authenticate a production user.

## Operating model

- **Citizen:** Asha Rao reports from a confirmed map pin, chooses a nearby asset or reports an unregistered observation, and follows her report.
- **Manager:** Meera Nair, Civic Operations Manager, triages issues and chooses an eligible organization from the manager-only contractor directory.
- **Contractor:** Imran Khan of CivicWorks Electrical Services sees only jobs assigned to that demo identity; he must accept, start work, attach evidence and notes, then claim repair complete.
- **Verifier:** Ravi Menon independently checks the claim with a category-specific checklist and evidence, then passes or reopens it.
- **Public:** No login; public map and ledger hide reporter identities and freeform notes.

A contractor claim immediately enters **Verification pending**. Only an independent verifier can reach **Verified closed**. A failed check reopens the same issue.

## Map, reporting, and evidence

The app uses Leaflet with OpenStreetMap tiles and attribution. Map pins are fictional demo data around Bengaluru. Citizen reporting starts with the location: browser geolocation is optional, manual map pin and OpenStreetMap place search are available, and the citizen confirms the final draggable pin. The demo finds nearby assets in the local fixture; the database migration includes a PostGIS nearby-asset RPC and an unregistered-location field.

Photo compression re-encodes the image locally, which removes source EXIF metadata from the demo image. **Noro Evidence Assist** currently provides a deterministic, advisory brightness/clarity pre-check; it is not a vision model and cannot change governance state. Public map markers do not expose evidence photos.

Optional driving directions use OpenRouteService only when a user requests them and the key is configured. Without a key, the map and assigned locations continue to work and the route control explains that routing is unavailable.

## Configure integrations

Copy `.env.example` to `.env.local` and set:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY` (publishable/anon key only; never a service-role key)
- `VITE_OPENROUTESERVICE_API_KEY` (optional; restrict the key to the intended browser origin)

Supabase migration files are a schema foundation and have **not** been applied to a live database. Before production use, apply and validate them in a non-production project, create the private `noro-evidence` Storage bucket, connect UI reads/writes to governed RPCs, and test RLS with real identities. The current demo persists to browser local storage and is not server-enforced.

## Verification

```sh
npm test
npm run build
npm audit --omit=dev
```

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md), [docs/DEMO.md](docs/DEMO.md), and [docs/GOVERNANCE.md](docs/GOVERNANCE.md).
