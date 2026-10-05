# Data model

The relational spine is **Ward → Asset → Issue**. Assets outlive individual issues. Issues carry immutable reporter identity, state, severity, SLA date, repairer, and assignment. Assignments record the responsible organisation and accepting worker. Evidence rows store actor, capture mode, time, location accuracy, and content hash. Conflict declarations attach to verifier + issue. Verifications record checklist, outcome, evidence references, and night-check confirmation. Audit events record actor role, action, entity, state before/after, and previous/current digest.

The migration also defines service standards with version/status, asset location precision, ward-scoped role grants, public PII-free ledger views, RLS, an immutable evidence policy, and RPCs for assigning issues, claiming repair, and independently verifying. Public views use `security_invoker`; client writes must use governed RPC transitions rather than direct state updates.

Local demo types are in `src/domain.ts`. Browser-local state is not shared and should not be treated as a database.
