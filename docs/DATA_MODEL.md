# NORO data model

The main relationship is **Ward → Asset → Issue**. Asset records persist independently of issues. Reports preserve reporter identity, captured and corrected locations, fault type, severity, and current state. Assignments record the responsible organization and accepted worker. Repair claims link the contractor's completion notes and evidence. Evidence metadata includes uploader, capture time/mode, optional location/accuracy, storage path, and content hash; the underlying evidence objects live in a private Storage bucket.

Role grants scope users to roles and, where applicable, wards. Contractor organizations and specializations define service eligibility. Verifier profiles record approved wards and training. Conflict declarations bind a verifier to a report. Verification rows record outcome, checklist, evidence references, and lighting night-check status. Notifications store recipient, event type, read state, and related entity. Audit events preserve actor, action, entity, and before/after state; mutation is guarded by the database.

PostGIS `geography` stores ward boundaries, registered asset locations, and report/correction points. Spatial indexes support lookup, and `nearby_registered_assets` returns nearby registered assets to authorized callers.

`public_asset_registry` and `public_issue_ledger` are curated public views with a field allowlist. They are the only database objects used by the anonymous public explorer. They omit reporter names, private notes, and storage paths. Location precision is controlled by the public location tier.

Browser demo state is defined in `src/domain.ts` and is not part of the live relational model. Keep demo fixture names and IDs distinct from database identities.
