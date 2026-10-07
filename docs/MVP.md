# NORO MVP scope

## Implemented in the local preview

- Public landing, map/list, ledger, registry, and asset/issue summaries based on synthetic data.
- Four fixed demo personas and distinct local role workflows.
- Map-first report form with optional location search/geolocation, synthetic nearby-asset matching, evidence preview, and deterministic quality feedback.
- Local manager triage, location correction, contractor assignment, accept/start/claim, independent pass/fail, audit trail, notifications, and asset history.

Preview state is browser-local and fictional. It does not provide server-side security or shared persistence.

## Implemented for authenticated Supabase use

- Supabase Auth sign-in, citizen registration, contractor access requests, and password recovery.
- Active role-grant check before opening the requested workspace.
- Live issue, asset, category, notification, and manager audit reads under RLS.
- Governed report, validation, assignment, correction, contractor, evidence, and verification operations through SQL RPCs and private Storage.
- Anonymous public reads from curated registry and issue-ledger views when Supabase is configured.

## Known integration gaps

The authenticated citizen report surface is a compact asset/location/details/evidence form; the richer map-first multi-step picker remains in the local preview. Live registered asset lookup is currently a dropdown rather than the PostGIS nearby-assets RPC. Manager assignment UI currently exposes available contractor records but does not present a complete specialization-matched directory. The live verifier interface requires an uploaded evidence file and conflict confirmation; browser acceptance should verify category checklists and file handling against the selected target project. Do not describe these gaps as implemented until the UI and backend are connected and tested.

No municipal service, identity provider, SLA alerting service, or field operation is integrated. Optional driving directions require OpenRouteService configuration.
