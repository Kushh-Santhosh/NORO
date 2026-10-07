# Governance rules

## State and closure

A submitted report starts in review. An authorized manager validates it and assigns an eligible service organization. The assigned contractor accepts, starts work, and submits repair notes and evidence. A repair claim moves the report to verification pending; it is not a closure. An independent verifier must be separate from the reporter and repairer, declare conflict status, provide evidence and checklist results, and record pass or fail. Pass can close the issue subject to category risk rules; fail reopens the same issue for rework. Streetlights require after-dark verification; non-lighting assets do not.

These transitions are implemented in PostgreSQL RPCs and triggers as well as demonstrated in the browser-only preview domain. The preview's checks are not a security boundary.

## Roles and authorization

The operational roles are Citizen, Manager (municipal officer), Contractor, Verifier, and unauthenticated Public. Supabase Auth identifies a user. Active role grants, ward scope, assignment checks, RLS, Storage policies, and RPC authorization govern live records. The URL role is only a requested workspace; it does not grant access. Manager/Verifier accounts require administrator provisioning. Contractor registration is a request, not approval.

The demo has four fixed synthetic personas (Asha Rao, Meera Nair, Imran Khan, Ravi Menon). Do not treat their local browser identities as Auth accounts or claim their sample events are field results.

## Evidence and privacy

Evidence Assist in the demo gives simple image-quality advice only. It does not establish authenticity or decide responsibility. Live evidence is stored in a private bucket, and public-facing database views exclude file paths and personal identifiers. Public coordinates must follow the asset's location privacy tier. Audit events are append-only through database guards and triggers.

## Status and operating limits

NORO is a proposed civic service model. The repository does not imply government adoption or integration. Review migration status, RLS policies, RPCs, Storage policies, public views, retention, backups, and role provisioning for the exact target project before using any deployment operationally.
