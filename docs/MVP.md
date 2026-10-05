# MVP scope

## Included

- Public landing, sign-in/onboarding shell, public map, ledger, and asset registry.
- Four fixed demo identities: Asha Rao (Citizen), Meera Nair (Manager), Imran Khan (Contractor), Ravi Menon (Verifier). Public access is unauthenticated.
- Sixty-four fictional mixed-category civic assets with approximate OpenStreetMap locations.
- Location-first citizen report: current location, manual movable map pin, place search, nearby fixture matching, unregistered observation, category-aware issue types, compressed photo, and advisory Evidence Assist brightness check.
- Manager contractor directory and deterministic category-to-specialisation matching.
- Contractor assignment lifecycle: Assigned → Accepted → In progress → Verification pending.
- Category-specific independent verification, pass/close and fail/reopen, public-safe issue history, local audit chain, asset passport, map/list alternative, and responsive layout.
- Supabase schema foundation with PostGIS, evidence/repair/verification entities, RPCs, RLS, and audit policies.

## Not connected or not implemented

Live Supabase persistence/RPC calls, real user-based RLS acceptance, Storage uploads, PostGIS nearby-asset invocation from the UI, multi-photo retention in the demo, AI vision understanding, durable offline sync, notifications, SLA scheduling, high-risk two-verifier runtime, and manager registration of unregistered observations. The demo is browser-local and cannot claim server-enforced access control. Routing needs an optional OpenRouteService key. No municipal system is connected.
