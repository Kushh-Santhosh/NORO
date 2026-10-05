# Testing and verification

## Local checks

- `npm test` — deterministic role and transition acceptance tests.
- `npm run build` — TypeScript project build and Vite production bundle.
- `npm audit` — dependency advisory check.
- Chrome acceptance run — report creation, report verification gate, assignment, claim, independent check, failed verification/reopen, reassignment, passing verification/closure, public ledger, and asset passport. Checked 375, 390, 430, 1024, and 1440 CSS-pixel widths; no horizontal overflow or browser console/network errors were observed. The test reset the browser demo data afterward.

## Backend verification still required

The SQL migration was reviewed but not applied to a Supabase project, as requested. Before connecting production data, run it in a disposable project and verify: reporter and repairer cannot verify; a conflicted verifier cannot start or decide a check; checklists and verifier evidence are mandatory; a repair claim remains `repair_claimed` until an independent verifier starts the check; closure cannot happen without a passing independent verification; high-risk assets require two distinct passes for the current repair claim; a failed check reopens the issue; contractor reads/evidence are limited to the current assignment; public reads expose no PII or hidden/approximate coordinates; anonymous and out-of-ward writes fail; profile organization and role grants cannot be self-edited; and audit/evidence update or delete is denied.

Review Supabase database advisors and inspect policies with authenticated test accounts. Configure a private evidence bucket and Storage policies before using evidence URLs; this migration stores evidence metadata only.

## Remaining browser work

The browser test used the existing local Chrome through the DevTools protocol; there is no committed automated E2E suite. Screen-reader review, keyboard-only end-to-end review, contrast measurement, and the 768px breakpoint still need a dedicated accessibility pass.
