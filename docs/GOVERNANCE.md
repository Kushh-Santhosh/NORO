# Governance rules

## Closure rule

A contractor cannot close an issue. The assigned contractor must accept and start work, then submit repair notes and evidence; this moves the issue directly to **Verification pending**. An independent verifier who is neither reporter nor repairer records a checklist, conflict declaration, and evidence. A pass sets **Verified closed**; a fail reopens the same issue.

## Roles

The normal product roles are Public, Citizen, Manager, Contractor, and Verifier. The demo has one named identity each for Citizen (Asha Rao), Manager (Meera Nair, Civic Operations Manager), Contractor (Imran Khan, CivicWorks Electrical Services), and Verifier (Ravi Menon). Public surfaces are anonymous and read-only. Demo identity shortcuts are only on `/demo` and `/signin`; no workspace persona switcher is shown.

The local demo role checks are not a security boundary. The SQL foundation uses role grants, scoped assignment checks, RLS, governed RPCs, private evidence paths, and append-only audit events. The migration has not been applied or live-tested.

## Evidence assistance

Noro Evidence Assist is advisory. The current demo measures coarse image brightness locally and can suggest a retake. It does not determine authenticity, asset type, responsibility, issue validity, or any governance state. The schema keeps AI assessments in a separate entity from issues and verification records.

## Privacy and proposed status

All demo identities, locations, issues, and metrics are fictional. OSM basemap geography is real; marker locations are approximate synthetic points. Photo re-encoding removes source metadata in the demo path, and public views do not expose photo files or reporter names. The product is **PROPOSED, NOT ADOPTED** and has no government integration.

The browser audit chain is illustrative only. Production requires live RPC/RLS testing, administrator and role provisioning, retention rules, backups, and security review.
