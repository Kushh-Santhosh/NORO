# Civic Asset Accountability Network (CAAN) — Master Blueprint

**Seva First Innovation Challenge 2026 · Open (UG and above) · Theme 05 Surakshit Bharat · Track B (Business Model or Governance)**

Draft v1 · prepared 2 October 2026 · single source of truth for the model, pilot, platform, submission and pitch.

**Evidence tags used throughout:** **\[F\]** verified fact from a source retrieved while preparing this document (source named) · **\[B\]** background knowledge, not re-verified here — verify before citing · **\[A\]** assumption · **\[P\]** proposal (our design) · **\[I\]** inference · **NOT VERIFIED** = could not confirm; do not claim it.

---

## PART 0 — READ THIS FIRST: SIX FINDINGS THAT CHANGE THE PLAN

**1. The clock is very short.** \[F\] The official site lists the submission window as 25 September – 24 October 2026, state screening by NITs from 25 October, and showcase/finale 30 November – 15 December 2026 (marked *indicative, to be confirmed at formal notification*). Today is 2 October: roughly **22 days** remain. Every plan below is sized to that. The roadmap (Part 52) is day-by-day.

**2. Entry is institution-led — you cannot register alone.** \[F\] Each institution nominates one coordinator (principal, head of department or innovation-cell in-charge), registers once with an official email and district details, and the coordinator records and submits each team's entry. **Day 1 action: find and brief your coordinator at CMR University.** This is the single most likely thing to silently kill the entry.

**3. Theme fit needs careful framing.** \[F\] Theme 05's UG focus areas are advanced manufacturing, mobility & infrastructure, security & resilience, digital public infrastructure; the theme header lists manufacturing, mobility & infrastructure, *safety*, digital public infrastructure. Public toilets and sanitation sit more naturally under Theme 03 (Swasth & Samavesh, which lists sanitation) and parks/waste under Theme 01. \[I\] To stay coherent with Theme 05, the pilot asset class should be **safety-critical public infrastructure** (street lighting is the strongest candidate — see Part 27). Pitch it as *infrastructure resilience and public safety*, with *digital public infrastructure* as the enabling layer.

**4. "A better complaint app" is already taken — and the real gap is narrower.** Complaint registration, tracking, GIS location, SLAs and auto-escalation exist in UPYOG's PGR module and in Bengaluru's Sahaaya; citizen *reopen* exists in MoHUA's Swachhata app. What the evidence shows is underserved is **who is allowed to declare a job closed, and whether anyone independent checks** (Part 41).

**5. The most feasible Track B evidence in 22 days is a "Closure Audit", not a repair programme.** \[P\] A student team cannot make a municipality repair 60 assets in three weeks. It *can* (a) census \~60–100 assets, (b) log faults through the *existing* official channel, (c) independently verify what the system says happened, and (d) measure the **gap between "closed" and "verified fixed"**. That gap, measured by you, on real assets, is Track B's "demonstrated feasibility" and "problem clarity" in one number.

**6. Several things you asked about could not be verified.** Part 0.2 lists them. They are marked NOT VERIFIED and the design does not depend on them.

### 0.1 How this document is organised

Parts 1–60 follow your brief in order, then the one-page blueprint. To keep the document usable, screen specifications use a shared **state pattern** (Part 10) instead of repeating empty/loading/error states 40 times, and user stories (Part 48) are written compactly. Any part can be expanded on request.

### 0.2 Research register — what was actually verified

| # | Item | Status | What was found / not found |
| --- | --- | --- | --- |
| 1–6 | Seva First site, Track B, Theme 05, Open/UG, criteria, timeline | **Verified** (4 official pages fetched) | See Parts 2–3 |
| 7 | NUDM | Partial | \[F\] Launched Feb 2021 (pilot), standalone Central Sector Scheme 2024 per a secondary source (IMPRI); NIUA's Centre for Digital Governance leads. MoU with 31 States/UTs, one or more UPYOG modules started in 18 (DPG registry) |
| 8 | UPYOG | Partial | \[F\] Open-source (MIT), registered Digital Public Good (27 Feb 2025), described as "a set of Open APIs, services and reference implementations"; 13/14/18 modules depending on source date. Third-party API access to any specific city's deployment: **NOT VERIFIED** |
| 9 | Municipal grievance redressal | Partial | \[F\] DIGIT/UPYOG PGR docs list GIS location mapping, status tracking, dashboards, **auto-escalations and SLAs** |
| 10 | NUDM asset-management standards | **NOT VERIFIED** | Asset Management appears as a listed UPYOG service in a MoHUA deck; its data standard, work-order flow and verification features were not found |
| 11 | NUIS | Partial | \[F\] Described as the foundational framework on which NUDM is built; GMIS (map-based dashboard) mentioned in secondary source |
| 12 | MoHUA material | Partial | Lok Sabha reply (5 Dec 2024), NUDM deck listing UPYOG services incl. Municipal Grievance Redressal and Asset Management, national dashboard "UMEED" |
| 13 | Municipal governance frameworks | Background \[B\] | 74th Constitutional Amendment (1992) ward committees; not re-fetched |
| 14–15 | Karnataka / GBA systems | Partial | \[F\] Greater Bengaluru Governance Act 2024 (Karnataka Act 36 of 2025): GBA, up to ten city corporations, ward committees as "basic units of urban governance". \[F\] Sahaaya 2.0 is the primary grievance channel; GBA is developing **Sahaaya Plus**, a unified single-window system (Deccan Herald, 10 Jul 2026). Whether Karnataka/GBA run UPYOG: **NOT VERIFIED** |
| 16 | Public-asset maintenance processes | **NOT VERIFIED in detail** | Only indirect evidence (press, citizen accounts). Field research (Part 28) is mandatory, not optional |
| 17–19 | Grievance / citizen-reporting / asset-management systems | Partial | Sahaaya, Swachhata, UPYOG PGR verified; CPGRAMS \[B\]; commercial EAM/CMMS products exist generally; no Indian ULB-specific asset system verified |
| 20 | Social-accountability models | Background \[B\] | Community score cards, social audits (e.g., under MGNREGS), Jan Sunwai — not re-verified |
| 21 | CSR mechanisms | Background \[B\] | Companies Act s.135 / Schedule VII; **eligibility of civic-asset maintenance not verified** |
| 22 | Ward committees | Partial | \[F\] Act objective stated; \[F\] critics (Citizens' Action Forum, PIL hearing reported 15 Apr 2026; Deccan Herald opinion) say ward committees are only advisory |
| 23 | SLA mechanisms | Partial | \[F\] PGR auto-escalation/SLA; Swachhata fixed time-frames (reported 2017: most within 12 hours) |
| 24 | Open data / dashboards | Partial | \[F\] Swachhata city rankings by resolution rate; OpenCity hosts Bengaluru datasets; UMEED national dashboard (deck only) |
| 25 | Government DPI | Partial | UPYOG/NUDM/NUIS above; DPI beyond urban: not covered |

**Sources retrieved:** sevafirst.mic.gov.in (tracks, themes, participate, timeline) · urban.digit.org (PGR) · digitalpublicgoods.net (UPYOG) · mohua.gov.in NUDM deck · nudm.mohua.gov.in handholding page · sansad.in Lok Sabha Q1727 · IMPRI NUDM explainer · indiacode.nic.in / prsindia.org (Greater Bengaluru Governance Act) · Deccan Herald (Sahaaya relaunch 2019; Sahaaya closures; Sahaaya Plus, 10 Jul 2026; GBA Act opinion) · Citizen Matters (Malleshwaram streetlight case) · Swachhata-MoHUA app listing / Vikaspedia · Khaleej Times (Swachhata 2017).

---

## PART 1 — EXECUTIVE SUMMARY

**Project name:** Civic Asset Accountability Network (CAAN). Alternatives in Part 45.

**One line:** *A ward-level service-delivery model in which a public-asset repair is only counted as done when someone independent of the repairer has verified it — with the asset, not the complaint, as the unit of accountability.*

**Problem.** Public assets (street lights, drain covers, bus shelters, toilets) fail repeatedly. Citizens can report; systems can route. But three questions are routinely unanswered: *who is actually responsible for this asset, who confirms it was really fixed, and why does the same asset keep failing?* \[F\] Bengaluru's own Commissioner admitted in 2019 that complaints on the Sahaaya app "can be closed without even addressing them on the ground" (Deccan Herald). \[F\] A separate Deccan Herald report quotes a citizen who reopened one pothole complaint at least 15 times as it was closed again.

**Why current systems are insufficient.** \[F\] They have registration, routing, SLAs, escalation, photo-of-resolution and complainant reopen. \[I\] What they do not define is an **independent closure authority** — closure typically rests with the party being measured, and the only check is the complainant, who has no standing, no training and bears the cost of re-asserting.

**Governance innovation (the four moves).**

1. **Two-key closure** — "Repair Claimed" (by department/contractor) and "Verified Closed" (by a trained independent verifier) are different states; only the second counts.
2. **Separation of roles** — reporter ≠ repairer ≠ verifier; no one verifies their own work or report.
3. **Asset-centred accountability** — each asset has a passport with a named responsible entity and a service standard; repeat failure triggers a root-cause review, not another ticket.
4. **A published Claimed-vs-Verified ledger** — the public sees both the department's closure rate and the independently verified closure rate, and the gap between them.

**How it works.** Observe → Verify → Assign → Commit → Repair → Independently Verify → Close → Publish → Analyse (Part 6). A ward-level **Community Verification Panel** (Part 7) supplies the independent check; a web platform records evidence and enforces the rules.

**Who benefits.** Residents (safer, reliable assets), municipal officers (credible closure data, defensible against false allegations), conscientious contractors (fair, evidence-based sign-off), and ward-level institutions (a structured role).

**Why Track B.** \[F\] Track B is "a new delivery model, service design, financing mechanism, community institution, process re-engineering, or governance and regulatory innovation." The novelty here is the closure rule, the institutional role and the separation of duties. The software is a recording and enforcement layer.

**Why Surakshit Bharat.** \[I\] Unlit streets, open drains and damaged shelters are public-safety and infrastructure-resilience failures; accountability for their upkeep is a digital-public-infrastructure and service-delivery problem.

**What the website does.** Captures evidence (timestamp + location), enforces role separation and closure rules, runs SLA clocks and escalation, keeps the asset passport, and publishes the ledger. It does **not** replace Sahaaya, UPYOG or any municipal system (Part 33).

**Pilot strategy.** \[P\] A Closure Audit on \~60–100 assets of one category in one Bengaluru ward cluster (Part 27): baseline census → faults logged through the official channel → independent verification of every claimed closure → publish the claimed-vs-verified gap and repeat-failure map.

**Long-term vision.** \[P\] A ward-level SOP and service-level charter that a municipality can adopt without buying new software, with the platform as an optional accelerator and an interoperable overlay on UPYOG-style systems.

### 1.1 The 30-second explanation

"When a street light is reported broken, the system often says 'closed' because the department says so — not because anyone checked. We built a ward-level model where a repair only counts when an independent, trained resident verifies it, and where every asset has an owner, a service standard and a repair history. In our pilot ward we measured how often 'closed' really meant 'fixed'."

### 1.2 The 60-second explanation

Add: "Existing platforms already take complaints, route them and track deadlines. Our gap is the last mile: who confirms the fix? Today the same party that did the work marks it done. We separate three roles — reporter, repairer, verifier — and make closure a two-key process. A trained community panel, working under a written service charter with the ward office, verifies repairs with photo and location evidence. The system flags assets that keep failing so authorities fix causes, not symptoms. The website is the ledger and rule-enforcer; the innovation is the institution and the closure rule."

### 1.3 The 3-minute explanation

Full script in Part 56.

---

## PART 2 — COMPETITION STRATEGY

### 2.1 Track A vs Track B

&#91;F\] Both tracks "carry equal standing" and are scored on the same six criteria. Track A rewards something that "can be built, demonstrated and deployed" (device, software system). Track B rewards a *model* — delivery, institution, process, governance. \[F\] At Open level the site expects "a demonstrated prototype or pilot with a credible pathway to deployment, supported by cost, beneficiaries, timeline, impact and scalability"; for Technical-level Track B it says "a costed and field-tested delivery model." \[I\] So Track B at Open level is judged on whether the *model* has been **field-tested and costed**, not on how good the software is.

### 2.2 What Track B judges are likely to look for \[I\]

- A precisely defined governance gap, evidenced first-hand ("observed first-hand, defined precisely" — official criterion 1).
- A clear statement of what is new *given what already exists* (criterion 2 asks this literally).
- Evidence the model was tried, even small (criterion 3).
- Unit economics: "what does one unit or one delivery cycle cost, and who pays?" (criterion 4).
- Named beneficiaries with a number and an effect size (criterion 5).
- A replication story for another district (criterion 6).

### 2.3 Why this must not look like a normal software project

- Lead every artefact with the **closure rule and the institution**, not screens.
- The demo should open on a *paper* process step (a verifier with a checklist) before any UI.
- Show the model working **in a degraded mode** — paper form + WhatsApp-style relay + phone call — to prove the platform is optional (Part 35, Rule 18).
- Put the **Service Charter** and **ward SOP** in the submission as first-class documents.

### 2.4 Mistakes Track B applicants are likely to make \[I\]

1. Describing a dashboard as the innovation. 2. Claiming adoption or legal authority that does not exist. 3. No field evidence — only desk research. 4. Ignoring cost and "who pays." 5. Ignoring existing systems (UPYOG/Sahaaya) or claiming they don't exist. 6. Stacking AI and blockchain as decoration. 7. Pilot too ambitious to finish. 8. Ignoring harassment/false-allegation risks.

### 2.5 Demonstrating feasibility without government deployment \[P\]

- Run in **shadow mode**: use the *existing public channel* as the system of record; CAAN adds only the verification layer. No permission needed to report and to observe.
- Seek a **letter of support / acknowledgement**, not an MoU, from a ward engineer or RWA. Describe it exactly as that.
- Use a **mock integration layer** clearly labelled "simulated" (Part 33).

### 2.6 Evidence an undergraduate team can realistically collect

Asset census with photo/GPS; baseline functional rate; fault log with timestamps in the official channel; official status at day 3/7/14; independent verification outcomes; false-closure rate; repeat-failure map; interviews with 15–25 people; cost log of your own time; a draft Service Charter reviewed by one officer or ward representative. Full list in Part 53.

### 2.7 Competition risk model (no invented numbers)

**No public participation-by-track data was found** on the official site or elsewhere; therefore **do not claim Track B has fewer competitors.** Transparent qualitative model instead:

| Driver | Direction | Why | Our response |
| --- | --- | --- | --- |
| Number of Open-level entries | Likely high \[I\] — nationwide, institution-led, UG-and-above is the broadest band | Unknown; no data | Differentiate on evidence |
| Crowding of "grievance app / civic reporting" ideas | High \[I\] | Easy idea for students | Never describe the entry that way |
| Crowding of "closure verification as governance rule" | Unknown | No evidence either way | State originality precisely and honestly (Part 41) |
| Judge expectation of pilot evidence at Open level | High \[F\] | Site wording | Closure Audit data |
| Submission is short and structured \[F\] | Favours clarity | Site says "short, structured concept" | Lead with a 1-page model; attach evidence |
| Execution risk (22 days) | High | Time | Part 52 plan |

---

## PART 3 — OFFICIAL CHALLENGE ALIGNMENT

| Seva First requirement \[F\] | Our response \[P\] |
| --- | --- |
| **Theme 05 Surakshit Bharat** — mobility & infrastructure, safety, DPI | Safety-critical civic infrastructure (pilot: street lighting); accountability layer interoperable with urban DPI |
| **Open level** — demonstrated prototype or pilot, credible deployment pathway, cost, beneficiaries, timeline, impact, scalability | Closure Audit pilot + working prototype + costed ward model + adoption pathway (Part 59) |
| **Track B** — delivery model, service design, community institution, process re-engineering, governance | Ward Verification Panel (institution); two-key closure (process re-engineering); Service Charter (governance); funding model (Part 25) |
| **Problem clarity** — "observed first-hand, defined precisely" | Own census + audit data; precise gap statement (Part 4) |
| **Originality** — "what is genuinely new, given what already exists" | Independent closure authority + role separation + asset-level repeat-failure review + claimed-vs-verified ledger (Part 41) |
| **Demonstrated feasibility** — "built, tested or piloted with evidence" | Pilot dataset, working prototype, paper fallback tested |
| **Cost** — "one unit or one delivery cycle … who pays?" | Cost per asset-month monitored and per verified closure (Part 26) |
| **Beneficiary impact** — who, how many, how much | Residents on pilot streets; people-per-asset estimate stated as assumption |
| **Scalability** — another district | Charter + SOP + open schema; ward-by-ward replication (Part 32) |
| **Institution-led entry** | CMR coordinator registers and submits (Part 0.2) |

---

## PART 4 — PROBLEM DEFINITION

**Level 1 — Simple.** A light is out. Someone reports it. A week later the system says "resolved". The street is still dark.

**Level 2 — Citizen.** I don't know who owns the pole. I reported on two portals. I got an SMS saying "assigned". \[F\] Citizen Matters documents exactly this on a Malleshwaram street: complaints filed on two Sahaaya portals, SMS saying "assigned", repeated calls from the Palike asking whether work was done, no work, and difficulty checking status. Reopening costs effort, and the ticket may be closed again.

**Level 3 — Municipal officer.** \[I\] I am measured on closures. My field staff close tickets to clear queues. I cannot prove a closure was genuine, and I get blamed for repeat faults that originate with a contractor, the power utility or an upstream cable. I have no safe, neutral way to invite outside checking.

**Level 4 — Contractor.** \[I\] I am paid on work orders and sometimes disputed on completion. A repair I did gets reported as "not done" because the fault was a different, upstream one. I have no neutral record that I fixed what I was asked to fix.

**Level 5 — Governance.** Closure is self-certified. The measuring party is the measured party. Responsibility is split (e.g., utility vs municipal body vs contractor — \[F\] BBMP's spokesperson has said most street-light complaints stem from power fluctuation, which is "not in our control"; Deccan Herald). There is no standing community role in verifying outcomes, and ward committees' powers are contested \[F\].

**Level 6 — System.** Complaint-centric data model (tickets) rather than asset-centric (history of a thing). Repeat failures hide across many tickets. Public metrics report *resolution rate*, which is exactly the number that can be inflated.

**PRIMARY PROBLEM STATEMENT.** *In Indian urban local bodies, a repair to a public asset can be recorded as closed by the party responsible for doing it, without independent confirmation, and without the failure being attributed to a specific asset with a named responsible entity and service standard; as a result closure data is unreliable, repeat failures are not systematically diagnosed, and citizens and officers cannot trust the record.*

**Secondary problems.** Ambiguous jurisdiction; duplicate/fragmented reporting; no common evidence standard; weak feedback to the reporter; no neutral forum for disputes; exclusion of non-digital residents; fear of retaliation.

**Root causes \[I\]:** incentive design (closure rate is a performance metric); no separation of duties; ticket-centric records; unclear asset ownership; no institutional role for independent verifiers; limited capacity of ward bodies.

**Symptoms \[F/I\]:** closed-but-unfixed complaints; reopen–close loops; multiple complaint IDs for one fault; repeated failure of the same pole/cover.

**Failure points:** (1) report quality; (2) ownership routing; (3) assignment; (4) repair; (5) **closure certification**; (6) feedback; (7) repeat-failure analysis.

**Consequences:** night-time safety risk, accidents, loss of trust, wasted maintenance spend on repeat fixes, polluted performance data.

**Who suffers:** residents (esp. women, elderly, persons with disabilities, night-shift workers), small shop owners, conscientious officers and contractors, and the municipality's own planning.

**Why current systems don't fully solve it** — see the gap analysis in Part 40/41. In short: they cover steps *report → route → track*; **closure authority and asset-level learning are the thin part**, and that is an institutional design question before it is a software one.

---

## PART 5 — CURRENT STATE (AS-IS) WORKFLOW

**Caveat:** \[I\] Reconstructed from published system descriptions and press. Must be validated in the field (Part 28) — it is a hypothesis.

```
Citizen notices fault
 → reports (app/portal/helpline/social media/ward office/ councillor)  [F: multiple channels exist]
 → grievance system logs ticket (ID, category, location, photo)   [F: PGR/Sahaaya/Swachhata]
 → routed to department/zone/ward engineer          [F: PGR routes to concerned departments]
 → work assigned (in-house crew or contractor)      [A]
 → repair attempted (maybe by utility staff if electrical) [I]
 → field staff marks "resolved", often with a photo [F: Swachhata resolved-photo model]
 → citizen notified; may reopen                      [F: Swachhata reopen; Sahaaya reopen]
 → ticket closes; metric counts a resolution
 → (no step) independent check; (no step) asset-level repeat analysis
```

| Gap type | Where | Evidence |
| --- | --- | --- |
| Bottleneck | Routing across utility vs municipal body | \[F\] BBMP spokesperson: faults due to power fluctuation "not in our control"; citizen accounts of BESCOM/BBMP hand-offs (Citizen Matters) |
| Information gap | Citizen cannot see assignee, plan or date | \[F\] Citizen Matters |
| Accountability gap | Closure by the responsible party | \[F\] 2019 Commissioner statement |
| Verification gap | No independent third party | \[I\] — to validate |
| Ownership gap | Pole/cover has no named owner or service standard | \[I\] |
| SLA gap | SLA clocks exist but start/stop on ticket state, not on verified outcome | \[I\]; PGR SLA verified, semantics NOT VERIFIED |
| Repeat-failure gap | Many tickets, one failing asset | \[I\] — whether UPYOG asset linkage addresses this: NOT VERIFIED |
| Data gap | "Resolution rate" can be inflated | \[F\] Swachhata ranks cities by resolution rate; Sahaaya closure admissions |

In the next part the TO-BE model replaces only the **closure, ownership and learning** steps, leaving everything upstream to existing systems.

---

## PART 6 — TO-BE GOVERNANCE MODEL

**Design principle \[P\].** CAAN does not replace upstream systems. It re-engineers three things: **ownership** (who is responsible), **closure** (who may declare done) and **learning** (what happens when an asset keeps failing). Everything else can stay in Sahaaya/UPYOG/paper.

```
OBSERVE → VERIFY → ASSIGN → COMMIT → REPAIR → INDEPENDENTLY VERIFY → CLOSE → PUBLISH → ANALYSE
   ↑                                                  │ fail                           │
   └──────────────────────────────── REOPEN ←───────┘          repeat failure → ROOT-CAUSE REVIEW
```

All SLAs below are **PROPOSED MODEL** values for the prototype, not official municipal SLAs.

| Step | Actor | Responsibility / action → output | Evidence required | SLA (proposed) | Escalation & failure condition | Audit trail |
| --- | --- | --- | --- | --- | --- | --- |
| **1 OBSERVE** | Citizen, Observer, Field worker (or assisted-desk operator for non-digital users) | Notice a fault; file report linked to an asset ID → *Report (Submitted)* | Photo with capture time + GPS; for lights, night photo. Assisted reports: operator attests, flagged "assisted" | System acknowledges ≤ 1 h | Asset not in registry → "Unmapped asset" task to coordinator within 24 h. Failure: no evidence → returned to reporter | Report hash, device/time metadata, channel (app/paper/relay) |
| **2 VERIFY** (the report) | Community Verified Observer (≠ reporter) | Confirm fault exists, de-duplicate against open issues → *Verified* / *Unconfirmed* / *Duplicate (merged)* | Independent photo + GPS, or officer inspection | Critical 4 h · High 24 h · Medium 72 h · Low 7 d | No verifier picks up → coordinator after 50% of window; still open → ward admin. Failure: unverifiable → closed as *Unconfirmed* with reason shown to reporter | Verifier ID, outcome, reason code |
| **3 ASSIGN** | Ward Admin / Municipal Officer | Use the **Accountability Map** (asset → responsible entity) to assign a named owner → *Assigned* | Assignment record; if disputed, cause note | 4 h (critical) · 24 h (others) | Jurisdiction dispute (e.g., utility vs municipal) → state *Jurisdiction Dispute*, routed to ward engineer + utility liaison; **SLA clock keeps running on the municipal body** until a different owner formally accepts | Who assigned, to whom, map version |
| **4 COMMIT** | Department Officer / Contractor | Accept and commit a date/time window and method → *Accepted* | Acceptance + planned date | Accept within 12 h (critical 1 h) | No commitment → auto-escalate one level. Failure: repeated refusals → officer review | Acceptance timestamp, commitment text |
| **5 REPAIR** | Contractor / Field worker | Execute; record **fault cause code** (e.g., lamp, driver, cable, upstream power, vandalism) → *Repair Claimed* | Before/after photo with time + GPS; materials; cause code | Per severity SLA | If cause = upstream, hand-off with code — **never close**; if SLA breached → *Escalated* | Work log, worker ID, evidence hashes |
| **6 INDEPENDENTLY VERIFY** | Verifier (≠ reporter, ≠ repairer, no conflict) | Physically check the repair under the asset's service standard → *Pass / Fail / Partial* | Photo + GPS (night photo for lights); checklist | 48 h; for lights, first night after claim | Fail → *Reopened* + penalty review. Two verifiers disagree → coordinator third check. High-risk assets → two verifiers | Verifier ID, checklist, evidence, conflict declaration |
| **7 CLOSE** | System (rule engine), optional officer countersign | Close only on *Pass* → *Verified Closed* | Pass record | Immediate | If no verifier available within window → *Verification Lapsed* → may close as **Closed-Unverified**, which is **reported separately** and never counted as verified | Closure rule version, who/what triggered |
| **8 PUBLISH** | System | Add outcome to public ledger (privacy-safe) → *Published* | — | ≤ 24 h | Publication failure alerts admin | Publication log |
| **9 ANALYSE** | Ward Coordinator + Dept Officer, reviewed by the Panel | Monthly repeat-failure review; ≥ 3 failures of one asset in 90 days (proposed) → *Root-Cause Review* → action memo | Asset passport history, cause codes | Monthly; review opened within 7 d of trigger | No action memo → shown on quarterly report | Memo, decision, follow-up |

**Key design choices \[P\]:** (a) "Repair Claimed" and "Verified Closed" are different states; (b) "Closed-Unverified" is allowed so the system does not deadlock, but is visibly distinct; (c) reopening is by the **verifier**, not only the complainant — removing the burden from the individual citizen; (d) SLA clocks stop only at Verified Closed.

---

## PART 7 — GOVERNANCE INSTITUTION

**Name \[P\]:** the "Civic Asset Accountability Network" is the *model*; the ward-level body is the **Ward Verification Panel (WVP)**.

### 7.1 Options compared (qualitative \[I\])

| Option | Legitimacy | Independence | Capacity to start | Legal certainty | Speed to pilot | Key risk |
| --- | --- | --- | --- | --- | --- | --- |
| A. Ward-level board (new body) | Medium | High | Low | Unclear | Slow | Needs formal creation; NOT VERIFIED that a ULB can create one |
| B. Community accountability cell inside the municipality | High | **Low** (marks its own homework) | Medium | Medium | Medium | Defeats independence |
| C. Loose citizen-verifier network | Low | Medium | High | None | **Fast** | Weak standing; harassment/bias risk |
| D. Ward committee extension | High \[F: Act names ward committees as basic units\] | Medium | Medium | **Contested** \[F: critics say advisory\] | Slow | Political capture; limited powers |
| E. NGO/community institution as verifier | Medium | High | Medium | None needed for pilot | Fast | Dependence on one NGO; funding |
| F. **Hybrid** — trained verifier pool run by a neutral convenor (NGO / college unit / RWA federation), reporting into the ward committee as review forum, with the ward engineer as formal counterpart | Medium→High | High | Medium | Pilot needs none | **Fast** | Needs clear protocol; complexity |

**Selected: F, hybrid \[P\].** Reason: it is the only option that is both *independent of the repairer* and *startable without legislation*. It plugs into an existing statutory forum (ward committee) without depending on its contested powers, and it does not require the municipality to buy anything. Whether the panel could later receive a formal role (via municipal resolution or SOP) is a **possible pathway, not an existing mechanism** (Part 59).

### 7.2 Panel design

| Element | Design \[P\] |
| --- | --- |
| **Members** | 5–9 verifiers; 1 coordinator (non-verifying for the same issue); 1 municipal liaison (non-voting); optional 1 contractor liaison (non-voting) |
| **Roles** | Verifier (field checks); Coordinator (assigns verifiers, resolves disputes, runs meetings); Liaison (brings official records, receives escalations) |
| **Eligibility** | 18+; lives, works or studies in the ward; not an elected representative or party office-bearer; not employed by, contracting with, or related to anyone in the responsible department or contractor; no pending dispute with the municipal body about the asset class |
| **Selection** | Open call + short interview by convenor and ward committee nominee; mix by gender, age, locality; at least one person with a disability where feasible; for the pilot: 8–10 recruited via student volunteers, RWA and local NGO |
| **Training** | 3–4 hours: model, checklists, evidence rules, safety, conflict declaration, non-confrontation, privacy; practical check on 3 assets; short pass/fail quiz; refresher every 6 months |
| **Code of conduct** | Verify the asset, not the person; no photos of people; no publishing of personal data; no contact with workers except to record; no payment or gifts; no political use of findings; report safety hazards immediately |
| **Conflict of interest** | Declaration per verification; auto-block if declared relationship; verifier cannot verify own report, own street's repeat issue more than 2 times a quarter, or any asset of a contractor they know |
| **Rotation** | 6-month term, renewable twice; per-asset verifier rotation (same person may not verify the same asset twice in a row) |
| **Verification rules** | Parts 13 and 15 |
| **Removal** | Coordinator + liaison review for: false evidence, COI breach, harassment, inactivity > 60 days; right to respond; appeal to the ward committee nominee |
| **Escalation** | Panel → ward engineer → zonal/city-corporation officer → ward committee agenda → existing grievance/appeal channels (e.g., Sahaaya, the commissioner's grievance cell) |
| **Meeting frequency** | Monthly panel review (60–90 min); quarterly public accountability meeting with ward committee/RWAs; ad hoc for critical disputes |
| **Reporting** | Monthly internal report; quarterly public report (Part 37) |

**Legal note.** Whether ward committee composition or functions allow a panel like this to be formally recognised: **NOT VERIFIED** (Act sections on ward committee composition, nomination and functions exist per the arrangement of sections; text not analysed). The pilot therefore runs as a **voluntary, protocol-based** arrangement.

---

## PART 8 — USER ROLES

| Role | Goals | Key permissions | Restrictions | Verification authority | Escalation authority |
| --- | --- | --- | --- | --- | --- |
| 1 Citizen | Report; see outcome | Report; track own reports; confirm/dispute outcome; view public data | Cannot see others' personal data; cannot verify own report | Feedback only | Can request review of a closure |
| 2 Verified Community Observer (VCO) | Confirm faults and repairs fairly | Verify reports; verify repairs when assigned; upload evidence | No self-verification; COI block; cannot assign or close | **Yes (primary)** | Can flag a suspicious closure |
| 3 Community Coordinator | Keep panel running | Assign verifiers; resolve verifier disputes; run reviews; manage training records | Cannot verify same issue they coordinate; cannot edit evidence | Third-check authority | To ward admin / ward committee agenda |
| 4 Municipal Officer | Credible closure; manage workload | View verified queue; assign; set priorities; countersign closure | Cannot close without verification; cannot edit verifier outcomes | None | Escalate up the department |
| 5 Department Officer | Own department's assets | Accept/commit tasks; manage contractors; cause-code review | Same as above | None | Escalate to head |
| 6 Maintenance Contractor | Fair sign-off; avoid false blame | Accept; schedule; upload evidence; **claim** completion; dispute a failed verification with new evidence | **Cannot self-verify**; sees only own tasks | None | Dispute to officer |
| 7 Field Worker | Execute | Task list; evidence upload; offline mode | Own tasks only | None | Report blockers |
| 8 Ward Admin | Run ward instance | Assign; configure ward settings; manage panel membership with coordinator | Cannot override rule engine; changes logged | Can order re-verification | To zone/city |
| 9 Auditor | Independent oversight | Read-only to all records and logs; export; sample re-verification | No write except audit notes | Sample re-check | Report to ward committee/authority |
| 10 NGO / Community Org | Convenor/partner | Manage own volunteers; view ward analytics | Cannot see personal data beyond own volunteers | Via its verifiers | Panel escalation |
| 11 Super Admin | Platform ops | Configure rules (versioned), roles, categories; no edit of evidence | Every action logged; two-person approval for rule changes \[P\] | None | — |
| 12 Public viewer | Understand outcomes | Public ledger, asset map (approx. locations), reports | No personal data; no exact sensitive locations | None | Can submit feedback |

### 8.1 RBAC matrix (✓ allowed · ◐ conditional · — no)

| Action | CIT | VCO | COORD | MO | DO | CON | FW | WA | AUD | NGO | SA | PUB |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Submit report | ✓ | ✓ | ✓ | ✓ | ✓ | — | ✓ | ✓ | — | ✓ | — | — |
| Verify report | — | ◐ (not own) | ◐ | ◐ officer inspection | — | — | — | — | — | — | — | — |
| Assign owner | — | — | — | ✓ | ◐ | — | — | ✓ | — | — | — | — |
| Accept / commit | — | — | — | — | ✓ | ✓ | — | — | — | — | — | — |
| Claim repair complete | — | — | — | — | ✓ | ✓ | ✓ | — | — | — | — | — |
| Independently verify repair | — | ◐ (no COI, ≠ reporter/repairer) | ◐ third check | — | — | — | — | — | ◐ sample | ◐ via VCO | — | — |
| Close (Verified) | — | — | — | — | — | — | — | — | — | — | — | — (system only) |
| Reopen | ◐ request | ✓ | ✓ | ✓ | — | — | — | ✓ | ✓ | — | — | — |
| Merge duplicates | — | — | ✓ | ✓ | ✓ | — | — | ✓ | — | — | — | — |
| Edit evidence | — | — | — | — | — | — | — | — | — | — | — | — (immutable; annotate only) |
| View personal data | own | own | panel | ward | dept | task | task | ward | audit | own vols | ◐ | — |
| Manage verifiers | — | — | ✓ | — | — | — | — | ✓ | — | ◐ | ✓ | — |
| Configure SLAs / rules | — | — | — | — | — | — | — | ◐ propose | — | — | ✓ (2-person) | — |
| View audit logs | — | — | ◐ | ◐ | ◐ | — | — | ✓ | ✓ | — | ✓ | — |
| Export reports | — | — | ✓ | ✓ | ✓ | ◐ own | — | ✓ | ✓ | ◐ | ✓ | public only |

---

## PART 9 — WEBSITE / PRODUCT ARCHITECTURE (INFORMATION ARCHITECTURE)

**Principle \[P\]:** mobile-first, light pages, works on a low-end phone; every verifier/officer flow has a printable paper equivalent.

```
PUBLIC WEBSITE
 ├ Home (the closure rule in one screen)
 ├ About the model · How accountability works (the 9 steps)
 ├ Service Charter (per asset class) · Accountability Map
 ├ Public asset map · Asset page
 ├ Public Accountability Dashboard (claimed vs verified)
 ├ Reports library · Open data (CSV, no personal data)
 └ Join as verifier · Help & training · Privacy/terms · Contact / grievance about CAAN itself
AUTHENTICATION
 ├ Phone OTP / email · Role onboarding · Verifier onboarding (training gate)
 └ Assisted-access login (for desk operators)
CITIZEN PORTAL
 ├ Report issue (guided) · My reports · Issue timeline · Confirm/dispute outcome · Notifications · Profile
COMMUNITY VERIFIER PORTAL
 ├ Verification queue · Verification detail + checklist · Evidence capture · My history · Conflict declarations · Training centre
MUNICIPAL OFFICER PORTAL
 ├ Verified-issue inbox · Assignment · SLA board · Escalations · Contractor performance · Asset health · Repeat-failure review · Reports
CONTRACTOR / FIELD PORTAL
 ├ Task list · Accept/schedule · Work + evidence upload (offline) · Completion claim · Disputes
ADMIN PORTAL
 ├ Users & roles · Verifier management · Wards/zones · Departments · Asset categories · Service standards · SLA & rules (versioned) · Audit logs · Integrations (mock/real)
ANALYTICS & REPORTING
 ├ Ward dashboard · Asset health · Performance (constructive) · Impact metrics · Scheduled reports
SETTINGS · HELP / TRAINING · NOTIFICATION CENTRE
```

The full screen specification follows in Part 10.

---

## PART 10 — COMPLETE SCREEN LIST

### 10.1 Shared state pattern (applies to every screen below unless overridden) \[P\]

| State | Standard behaviour |
| --- | --- |
| Loading | Skeleton rows/cards (no spinner-only); content shell visible within 1 s on 3G-class connection; map shows list view first |
| Empty | Plain-language explanation + the next action (e.g., "No issues in your queue — next check is due tomorrow") |
| Error | Inline message with cause in plain language, retry button, and "save draft locally" for any form with evidence |
| Permission | "You don't have access to this because …" + who to ask; never a blank page or 404 |
| Mobile | Single column, 48 px touch targets, bottom action bar, camera-first evidence capture, offline queue indicator |
| Desktop | Two-pane layouts (list + detail), keyboard shortcuts for queues, table density toggle |
| Accessibility | WCAG 2.1 AA target; semantic headings; focus order; labels for all inputs; status never by colour alone (icon + text); captions/alt text; screen-reader-friendly maps via list alternative; supports text scaling to 200% |
| Language | English, Kannada, Hindi at launch \[P\]; strings externalised for more |

### 10.2 Screens

| # | Screen | Role | Purpose; key components | Data shown → actions | Navigates to |
| --- | --- | --- | --- | --- | --- |
| 1 | Landing page | Public | State the closure rule in one screen; live claimed-vs-verified numbers; CTA "Report" / "Join as verifier" | KPIs, 3-step explainer → report, learn | Report, Dashboard, About |
| 2 | About the model | Public | Explain the model for officials/judges; downloadable Charter | Model diagram → download | How it works |
| 3 | How accountability works | Public | 9-step lifecycle with who-does-what | Step cards → view example asset | Asset page |
| 4 | Service Charter | Public | Per-asset-class standards + SLAs (labelled "proposed") | Standards table → print | Asset map |
| 5 | Accountability Map | Public/Officer | Who is responsible for which asset class in which area | Entity table, jurisdiction notes → suggest correction | Asset page |
| 6 | Public asset map | Public | Map/list of assets, condition colours + icons, filters | Approx. locations, status → open asset | Asset page |
| 7 | Asset page (Passport) | Public / role-based | See Part 20 | Condition, history, open issues → report issue | Report issue |
| 8 | Report issue | Citizen / any | Guided: pick asset (map or QR/pole ID), capture photo, describe | Photo+GPS+time, category → submit/save draft | Confirmation |
| 9 | Issue confirmation | Citizen | Receipt with ID, next steps, expected verification time | Timeline preview → share/track | My reports |
| 10 | My reports | Citizen | Own issues with status chips | List → open, confirm/dispute | Issue timeline |
| 11 | Issue timeline | All (scoped) | Vertical timeline of every state change with evidence | Events, actor role (not name for public) → comment, request review | — |
| 12 | Confirm / dispute outcome | Citizen | Answer "Is it fixed?" after a verifier pass | Yes/No + photo → submit | Timeline |
| 13 | Assisted report (desk) | Desk operator | Take a report on behalf of a non-digital resident; capture consent | Form + attestation → submit | Confirmation |
| 14 | Verification queue | Verifier | Nearby/assigned verifications, COI-filtered | Task cards, distance, due time → accept | Verification detail |
| 15 | Verification detail | Verifier | Checklist, original evidence, standard to check against | Checklist → pass/fail/partial | Evidence upload |
| 16 | Evidence upload / capture | Verifier, Contractor, Field | In-app capture with timestamp+GPS; gallery upload flagged lower-trust | Photos, notes → save (offline ok) | Verification detail |
| 17 | Conflict declaration | Verifier | Declare relationships per task | Yes/No + reason → submit | Queue |
| 18 | My verification history | Verifier | Personal record, accuracy feedback | History → view | — |
| 19 | Training centre | Verifier | Modules, quiz, certificate, refreshers | Progress → take quiz | Queue |
| 20 | Coordinator console | Coordinator | Assign verifiers, resolve disputes, third checks | Queues, disagreement list → assign | Verifier management |
| 21 | Officer dashboard | Officer | See Part 22 | Inbox, SLA, escalations → assign | Assignment |
| 22 | Assignment | Officer / Ward admin | Assign using Accountability Map; dispute flag | Issue, suggested owner → assign/dispute | Officer dashboard |
| 23 | SLA dashboard | Officer | Clocks by severity; breach forecast | Counts, ageing → escalate | Escalation dashboard |
| 24 | Escalation dashboard | Officer / Ward admin | Auto/manual escalations with next owner | List → act | Issue timeline |
| 25 | Repeat-failure review | Officer + Coordinator | Assets over threshold; cause-code analysis; action memo | Charts, passport → create memo | Asset page |
| 26 | Contractor dashboard | Contractor | My tasks, due times, disputes | Task list → accept | Repair task |
| 27 | Repair task | Contractor / Field | Accept, schedule, work, upload, **claim** completion | Task, evidence, cause code → claim | Contractor dashboard |
| 28 | Dispute a failed verification | Contractor | Submit counter-evidence | Evidence → submit | Coordinator console |
| 29 | Ward dashboard | Ward admin / Panel | Ward-level view of issues, SLA, verification | KPIs → filter, export | Reports |
| 30 | Public transparency dashboard | Public | Claimed vs verified, repeat failures, constructive metrics (Part 21) | Charts → download CSV | Asset map |
| 31 | Asset health dashboard | Officer / Public (summary) | Condition distribution, ageing, risk | Charts → drill to assets | Asset page |
| 32 | Performance dashboard | Officer / Ward admin | Process metrics (not people-ranking) | Metrics → export | Reports |
| 33 | Audit logs | Auditor / Super admin | Immutable event stream, search, hash check | Events → export | — |
| 34 | Reports | Roles | Generate/schedule Part 37 reports | Templates → generate | — |
| 35 | User management | Super/Ward admin | Invite, suspend, roles | Users → edit | — |
| 36 | Verifier management | Coordinator / Ward admin | Onboard, rotate, remove with due process | Roster, COI history → act | — |
| 37 | Department management | Admin | Departments, contacts, escalation ladders | Tree → edit | — |
| 38 | Asset categories & service standards | Admin | Define classes, checklists, standards | Forms → save (versioned) | — |
| 39 | SLA & rule configuration | Super admin | Edit proposed SLAs/rules with 2-person approval | Rules → draft/publish | Audit logs |
| 40 | Integrations (mock / live) | Super admin | Toggle simulated UPYOG/Sahaaya adapters; labelled "SIMULATED" | Adapter status → test | — |
| 41 | Notification centre | All | In-app inbox + preferences | Messages → mark read, set channels | Source screen |
| 42 | Profile & settings | All | Language, channels, accessibility, data export/delete | Settings → save | — |
| 43 | Help centre / FAQ | All | Plain-language help, paper-process download | Articles → search | — |
| 44 | Feedback about CAAN | All | Complaints about the process itself | Form → submit | — |
| 45 | Offline paper packet generator | Coordinator | Print verification sheets with QR for areas with poor connectivity | Selection → PDF | — |
| 46 | Data upload (bulk) | Coordinator | Import assets/paper results via CSV | File → validate/commit | Audit logs |

---

## PART 11 — CORE DATA MODEL

Conventions \[P\]: UUID primary keys; `created_at`, `updated_at`, `created_by` on all tables; soft delete via `deleted_at` where deletion is permitted; all state changes also written to `audit_event`; evidence is append-only.

| Entity | Key fields (type) | Relationships | Validation / indexes / audit |
| --- | --- | --- | --- |
| **User** | id, phone (unique, E.164), email?, name, language, status, consent\_at | has Roles; belongs to Organisation | Phone required for citizens; index phone; audit status changes |
| **Role / UserRole** | role\_code (enum 12), scope\_type (ward/zone/city), scope\_id, valid\_from/to | User↔Role | Unique(user, role, scope); audit grants |
| **Organisation** | id, name, type (ULB, dept, contractor, NGO, college, RWA) | has Users | Unique(name, type) |
| **Ward / Zone** | id, code, name, geometry (polygon), parent\_id | Ward→Zone | GIST index on geometry |
| **Department** | id, name, escalation\_ladder (json), org\_id | has Officers | Ladder validated for cycles |
| **Contractor** | id, org\_id, licence\_ref?, active | has Assignments | Unique(org\_id) |
| **AssetCategory** | id, code, name, risk\_class (high/med/low), checklist\_id, service\_standard\_id | has Assets | Versioned |
| **ServiceStandard** | id, category\_id, version, description, severity\_map (json), effective\_from | — | Immutable once published; audit |
| **Asset** | id, public\_code, category\_id, ward\_id, location (point 4326), location\_precision (exact/approx), responsible\_org\_id, owner\_basis (text: source of ownership info), installed\_on?, status | has Issues, Inspections | GIST(location); unique(public\_code); audit changes to responsible\_org |
| **AssetLocation (history)** | asset\_id, point, valid\_from/to, source | — | For moved/replaced assets |
| **AssetCondition** | asset\_id, condition (enum), observed\_at, source (inspection/verification) | Asset | Index (asset\_id, observed\_at) |
| **Issue** | id, asset\_id, status (enum), severity, cause\_code?, reporter\_id, duplicate\_of?, opened\_at, claimed\_at, verified\_closed\_at, closed\_unverified\_at, sla\_due\_at | has Evidence, Verifications, Assignments, Escalations | Unique partial index: one *open* issue per asset+fault\_type; audit every transition |
| **IssueEvidence** | id, issue\_id, uploader\_id, kind (photo/video/audio/doc), storage\_path, sha256, captured\_at, lat, lng, accuracy\_m, capture\_mode (in\_app/gallery/assisted), confidence\_score? | Issue | sha256 unique per issue; immutable; audit upload |
| **Verification** | id, issue\_id, type (report/repair), verifier\_id, outcome (pass/fail/partial/unable), checklist (json), coi\_declared (bool), evidence\_ids, created\_at | Issue, User | Constraint: verifier ≠ reporter, ≠ assignee users; audit |
| **RepairTask / Assignment** | id, issue\_id, assignee\_org\_id, assignee\_user\_id, accepted\_at, planned\_for, started\_at, claimed\_at, cause\_code | Issue, Contractor | Cannot claim before accepted; audit |
| **SLA** | id, issue\_id, severity, clock\_started, clock\_stopped, breach\_at, paused\_reason? | Issue | Clock stops only at verified close |
| **Escalation** | id, issue\_id, level, reason, from\_user, to\_user, opened\_at, resolved\_at | Issue | Auto-created by rule engine; audit |
| **CommunityBoard (Panel)** | id, ward\_id, convenor\_org\_id, charter\_version, active | has Observers | One active per ward |
| **CommunityObserver** | id, user\_id, board\_id, trained\_at, term\_start/end, status, quota\_counters | User, Panel | Training completion required |
| **ConflictDeclaration** | id, verifier\_id, issue\_id, relation\_type, declared\_at | Verification | Index (verifier, issue) |
| **Inspection** | id, asset\_id, inspector\_id, type (baseline/routine/sample), result (json), at | Asset | For baseline census & audits |
| **MaintenanceEvent** | id, asset\_id, issue\_id?, kind (repair/replace/preventive), cost?, at | Asset | Cost optional (privacy of contracts) |
| **AuditEvent** | id, actor\_id, actor\_role, action, entity\_type, entity\_id, before (json), after (json), at, prev\_hash, hash | — | Hash chain; insert-only; no update/delete |
| **Notification** | id, user\_id, channel, template, payload, status, sent\_at | User | Retry + dedupe key |
| **PublicReport** | id, scope, period, kind, generated\_at, file\_path, checksum | — | Versioned |
| **Feedback** | id, issue\_id, user\_id, rating?, text?, kind (citizen\_confirm/dispute) | Issue | Moderated |
| **ImpactMetric** | id, scope, period, metric\_code, value, method | — | Computed jobs; reproducible |
| **RuleVersion** | id, version, rules (json), published\_by, approved\_by, effective\_from | — | Two-person approval |
| **FundingSource** | id, scope, type (budget/CSR/grant), amount\_range?, period, notes | — | Optional; no legal claims stored |
| **IntegrationLink** | id, issue\_id, external\_system, external\_ref, mode (simulated/live), last\_sync | Issue | Mode shown in UI |

**ER description.** Ward→Assets→Issues is the spine. Each Issue has many Evidence, Verifications, Assignments, Escalations and one SLA. Verification references the Issue and the User (verifier) and must satisfy the role-separation constraints. Assets reference AssetCategory→ServiceStandard and a responsible Organisation. CommunityBoard groups CommunityObservers per Ward. AuditEvent references any entity polymorphically.

---

## PART 12 — STATUS / STATE MACHINES

### 12.1 Issue states

`Draft → Submitted → Under Verification → {Verified | Unconfirmed | Duplicate} → Assigned → {Accepted | Jurisdiction Dispute} → In Progress → Repair Claimed → Awaiting Independent Verification → {Verified Closed | Reopened | Verification Lapsed → Closed-Unverified}`; any non-terminal → **Escalated** (overlay flag, not a dead end).

| From → To | Triggered by | Evidence / guard | On SLA expiry |
| --- | --- | --- | --- |
| Draft → Submitted | Reporter | Required fields; photo+GPS unless assisted | — |
| Submitted → Under Verification | System | Asset matched; duplicate check | Ack alert at 1 h |
| Under Verification → Verified | Verifier (≠ reporter) | Independent evidence | Escalate to coordinator at 50%, ward admin at 100% |
| Under Verification → Unconfirmed | Verifier/coordinator | Reason code; reporter notified | — |
| Under Verification → Duplicate | Coordinator/officer/system suggestion | Link to master issue | — |
| Verified → Assigned | Officer/Ward admin | Owner chosen from map | Escalate to officer's superior |
| Assigned → Accepted | Assignee | Commit window | Auto-escalate one level |
| Assigned → Jurisdiction Dispute | Assignee/officer | Reason + proposed owner | Clock continues on municipal body |
| Accepted → In Progress | Assignee | Start evidence optional | — |
| In Progress → Repair Claimed | Assignee | Before/after evidence + cause code | Breach → Escalated |
| Repair Claimed → Awaiting Independent Verification | System | Verifier(s) assigned, COI-checked | Verification SLA starts |
| Awaiting → Verified Closed | System on Pass | Verifier pass (2 for high risk) | Clock stops |
| Awaiting → Reopened | Verifier fail / citizen dispute upheld | Fail evidence | Returns to Assigned, **same asset history**; counts as a failure on the passport |
| Awaiting → Verification Lapsed | System | No verifier by window | Coordinator alerted |
| Lapsed → Closed-Unverified | Coordinator/ward admin | Written reason | Reported separately |
| Verified Closed → Reopened | Verifier/Coordinator/Auditor; citizen request reviewed | New evidence within 30 days \[P\] | — |

### 12.2 Other state machines

- **Verification:** Offered → Accepted → In Field → Submitted → {Accepted by system | Disputed}; Expired if not accepted.
- **Verifier:** Applicant → Trained → Active → Suspended → {Reinstated | Removed}; Alumni.
- **Asset:** Registered → Active → {Under Repair | Out of Service | Decommissioned}.
- **Escalation:** Open → Acknowledged → {Resolved | Escalated further}.
- **Report (publication):** Draft → Reviewed → Published → Archived.

---

## PART 13 — GOVERNANCE RULE ENGINE

These rules are the Track B core. They are enforced in the database/server layer (not only the UI) so they cannot be bypassed from a client. Rules are versioned (`RuleVersion`) and changes need two-person approval. **\[P\]** throughout.

| ID | Category | Rule |
| --- | --- | --- |
| R01 | Accountability | A contractor, repairer or their organisation cannot verify their own work. |
| R02 | Accountability | An issue reaches *Verified Closed* only with a passing independent verification. |
| R03 | Accountability | Every active asset must have a named responsible organisation; assets without one are flagged "Ownership Unknown" and surfaced to the ward admin. |
| R04 | Accountability | Assignment and acceptance create a named owner and a committed date; "unassigned" cannot persist beyond the assignment SLA without escalation. |
| R05 | Accountability | A jurisdiction dispute does not stop the SLA clock on the municipal body until another owner formally accepts. |
| R06 | Accountability | A fault cause code of "upstream/other agency" requires a hand-off to a named party; it cannot be used to close. |
| R07 | Transparency | Both *claimed closure rate* and *verified closure rate* are published together, with the gap. |
| R08 | Transparency | Closed-Unverified issues are reported as a separate category and never merged into verified closures. |
| R09 | Transparency | Every closed issue's timeline is viewable (privacy-filtered) by the public. |
| R10 | Transparency | Service standards and SLAs are public and labelled with version and status ("proposed" / "adopted"). |
| R11 | Verification | The verifier must be different from the reporter and from the repairer. |
| R12 | Verification | High-risk asset classes (e.g., exposed electrical hazards) require two independent verifiers. |
| R13 | Verification | Verification requires evidence captured in-app with time and location; gallery uploads count as lower trust and need a second confirmation. |
| R14 | Verification | For assets whose function depends on conditions (night lighting), verification must occur under those conditions. |
| R15 | Verification | A "Fail" outcome must cite which checklist item failed. |
| R16 | Verification | If two verifiers disagree, a coordinator third-check decides; the disagreement is logged. |
| R17 | Verification | A verifier may not verify the same asset twice consecutively. |
| R18 | Conflict of interest | Verifiers must declare relationships before each task; a declared conflict removes them from that task. |
| R19 | Conflict of interest | Elected representatives, party office-bearers, department staff, contractors and their relatives cannot serve as verifiers. |
| R20 | Conflict of interest | No verifier may exceed 30% of the panel's verifications in a month \[A\], to avoid dependency on one person. |
| R21 | SLA | SLA severity is set at verification; officers may raise but not lower severity without a written reason. |
| R22 | SLA | SLA clocks start at report verification and stop only at *Verified Closed* (or *Unconfirmed/Duplicate*). |
| R23 | SLA | Warning notifications fire at 50% and 80% of the SLA window. |
| R24 | Escalation | An SLA breach automatically escalates one level in the department's ladder. |
| R25 | Escalation | A failed verification reopens the same issue (not a new one) and escalates after the second failure. |
| R26 | Escalation | An asset with ≥ 3 failures in 90 days \[A threshold\] triggers a Root-Cause Review. |
| R27 | Escalation | Reviews unresolved after 30 days appear on the ward committee agenda pack. |
| R28 | Data integrity | Duplicate reports for the same asset and fault type are merged into one issue; all reporters are kept as supporters. |
| R29 | Data integrity | Evidence is append-only; corrections are annotations, never edits. |
| R30 | Data integrity | Evidence hashes are stored; identical image hashes across different issues are flagged. |
| R31 | Data integrity | GPS accuracy worse than a threshold or location outside the asset's buffer flags the evidence for review. |
| R32 | Data integrity | Rule changes, role grants and outcome overrides are logged with before/after values. |
| R33 | Community participation | Citizens may dispute any closure; disputes are reviewed by a verifier within 72 h. |
| R34 | Community participation | Assisted reporting is available at defined desks and counts equally. |
| R35 | Community participation | Verifier training is mandatory before the first assignment and refreshed every 6 months. |
| R36 | Privacy | Photos must not intentionally include people; faces/number plates are blurred automatically where detected, and manual blur is offered. |
| R37 | Privacy | Reporter identity is hidden from contractors and the public; officers see it only when necessary. |
| R38 | Privacy | Public pages show approximate locations for categories flagged sensitive. |
| R39 | Audit | Every state transition writes a hash-chained audit event. |
| R40 | Audit | Auditors may trigger sample re-verification (e.g., 5% \[A\] of closures per quarter). |
| R41 | Emergency | "Critical" reports (live exposed wire, open manhole in carriageway) trigger immediate phone alert to the duty officer and a *make-safe within 2 h* target; verification of make-safe is by officer or panel on-call. |
| R42 | Emergency | Critical issues cannot be merged away, downgraded, or closed-unverified. |
| R43 | Anti-abuse | Accounts submitting repeated unconfirmed reports are rate-limited and reviewed; first response is education, not punishment. |
| R44 | Anti-abuse | Reports and verifications about individuals (rather than assets) are rejected. |
| R45 | Anti-abuse | Contractor dispute rights: a failed verification can be contested once with new evidence before reopening is final. |

---

## PART 14 — SERVICE LEVEL AGREEMENT MODEL

**PROPOSED MODEL — not official municipal SLAs.** \[F\] Existing platforms (PGR, Swachhata) already define category-wise time-frames; ours would map to whatever a ward adopts. The prototype ships with these defaults so the logic can be demonstrated.

| Severity | Definition (example: street lighting) | Proposed SLA to *claim* repair | Responsible (default) | Escalation | Penalty / review | Verification |
| --- | --- | --- | --- | --- | --- | --- |
| **Critical** | Exposed live wiring, hanging fixture, open electrical box | Make-safe 2 h; repair 24 h | Municipal electrical cell / utility (per Accountability Map) | Immediate to duty officer → department head at 2 h | Mandatory incident review | Officer or on-call verifier within 4 h; two verifiers for final repair |
| **High** | Entire stretch/junction dark, or a school/hospital approach | 24 h | Municipal electrical / contractor | Officer at 12 h, head at 24 h | Contractor review if repeated | Verifier first night after claim |
| **Medium** | Single lamp out on residential road | 72 h | Contractor / ward crew | Officer at 72 h | Counted in contractor report | Verifier within 48 h of claim |
| **Low** | Flicker, dim, pole-tilt cosmetic | 7 days | Ward crew | At 7 d | Pattern review | Verifier within 7 d, may bundle |

**Clock rules:** starts at *Verified* (report); pauses only for documented, time-limited reasons (e.g., awaiting a utility shutdown) approved by officer; stops only at *Verified Closed*. **Penalty/review \[P\]:** the model produces a *review*, not an automatic financial penalty; any link to payment or contract terms is a **possible pathway** that depends on contract clauses — NOT VERIFIED as currently available in any ULB contract.

---

## PART 15 — COMMUNITY VERIFICATION MODEL

| Question | Design \[P\] |
| --- | --- |
| **Who can become a verifier?** | Meets Part 7 eligibility; completes training and a practical test; signs the code of conduct |
| **Training** | 3–4 h in person or hybrid; checklist practice on 3 real assets; privacy and safety module; refresher every 6 months |
| **Selection** | Open call + interview; balance across localities, gender, age; waiting list to allow rotation |
| **Conflicts** | Declaration per task; automatic exclusion if the verifier lives on the same lane as the reporter (optional strict mode) or knows the contractor |
| **Same person repeatedly?** | Allowed but capped: no consecutive verification of the same asset; share cap per month (R20) |
| **Collusion** | Random verifier assignment among eligible; two verifiers for high risk; auditor sample re-verification; anomaly detection (a verifier who always passes one contractor) reviewed by coordinator |
| **Fake reports** | In-app capture with time/location; duplicate-hash check; verifier confirmation before any work is assigned; rate limits; transparent "Unconfirmed" outcomes |
| **Harassment** | Verifiers never identified publicly; panel acts as a body; no direct contact with workers; reporting channel for threats; coordinator can pause a verifier's visibility |
| **Protecting citizens** | Reporter identity hidden from contractors/public; no photos of people; minimal data; consent and deletion options |
| **Anonymous reports** | Allowed for *asset* faults through an assisted desk or low-trust channel; flagged "unverified source" and require verifier confirmation; not allowed for allegations about people |
| **False reports** | First: education message; repeated: rate limit; deliberate falsification: removal from verifier pool or account suspension with right to respond |
| **Protecting municipal staff** | Platform records assets and outcomes, not individuals' performance; public views show department/process metrics; staff can add context to any record; no personal data of staff in public view |
| **Protecting contractors** | Cause codes, dispute right (R45), evidence of their own work, balanced reporting that also shows verified successes |
| **Political misuse** | Elected representatives/office-bearers excluded from verifying; no endorsements or branding by parties; publication rules neutral; panel outputs are factual records |
| **Neutrality** | Convenor is a neutral institution; panel composition published; rule changes public and versioned; periodic external audit |

**Residual risks (honest):** a small volunteer pool can still be socially pressured; conflict-of-interest checks depend on honest declaration; neutrality ultimately depends on institutions, not code. Mitigation: rotation, sampling, audit, transparency.

---

## PART 16 — TECHNOLOGY ARCHITECTURE

**Selection logic \[P\]:** choose what you already know, that runs cheaply, and that enforces rules server-side. Nothing here is forced; each choice has a stated reason and an alternative.

| Layer | Choice | Why | Alternative |
| --- | --- | --- | --- |
| Frontend | React + TypeScript + Vite as a **PWA** | Your existing skills; installable; offline queue; no server rendering needed for the pilot | Next.js if public SEO pages become important |
| Backend / DB | **Supabase**: PostgreSQL + PostGIS + Auth + Storage + Row Level Security + Edge Functions | Geospatial queries, RLS for role separation, one managed stack | Firebase lacks PostGIS and relational constraints — weaker for this rule engine |
| Rule engine | **Deterministic**: DB constraints, triggers and Postgres functions; rules versioned in a table | Rules must be un-bypassable and auditable; AI not appropriate here | Edge Functions for complex checks |
| Workflow | n8n (optional) for scheduled jobs: SLA warnings, reports, reminders | Already known; keeps cron logic visible | Supabase scheduled functions / pg\_cron |
| Maps | MapLibre GL JS + OpenStreetMap-based tiles | No licence fee for the client library; avoid per-load charges. \[A\] Check the tile provider's usage policy; for sustained use, a hosted tile provider is needed | Google Maps (cost/licensing) |
| Storage | Supabase Storage with signed URLs; EXIF + hash on upload | Evidence integrity | S3-compatible store |
| Auth | Phone OTP for citizens/verifiers; email+password+MFA for officers/admins | Phone is the common identifier in India \[A\] | Email magic link |
| Notifications | In-app + email (pilot); SMS only for critical/officers if budget; WhatsApp only via an official business channel if later justified | SMS in India needs sender/template registration \[B — verify\] and costs per message; WhatsApp has policy and cost constraints | Phone call by coordinator (low-tech) |
| AI | Gemini for narrow, advisory tasks (Part 18) | Existing experience | Any vision-capable model |
| Hosting | Managed Supabase + static hosting (e.g., Firebase Hosting / Vercel / Netlify) | Low ops | Government cloud later \[A\] |

### 16.1 High-level architecture

```
[Citizen/Verifier/Contractor PWA]  ← offline queue (IndexedDB)
          │ HTTPS
[Edge/API layer: Supabase REST + Edge Functions]
          │
[PostgreSQL + PostGIS] ── RLS (role & scope) ── rule triggers ── audit hash chain
   │        │                    │
 [Storage] [n8n / schedulers]  [Adapter layer: Sahaaya/UPYOG (SIMULATED or live)]
               │
        [Email / SMS / in-app]            [Public read-only views/CSV]
```

- **Frontend:** feature-based modules (Part 51), role-aware routing, i18n, accessible component library, service worker for offline.
- **Backend:** thin; business rules live in the database. All writes go through RPC functions that check role, scope, state machine and rules.
- **Database:** schema per Part 50; RLS policies by role and ward scope; materialised views for public KPIs.
- **AI:** isolated edge function; never writes outcomes; returns advisory scores stored separately from verification decisions.
- **GIS:** PostGIS for point-in-ward, buffer checks, clustering; vector tiles optional later.
- **Workflow:** scheduled jobs for SLA clocks, warnings, auto-escalation, monthly review packs, report generation.
- **Notification:** event table → worker → channel adapters; dedupe keys; user preferences; quiet hours.
- **Security:** Part 34.

---

## PART 17 — TERRATRUST AI INTEGRATION

**Assumption \[A\]:** the following is based on how you described TerraTrust; confirm by a 2-hour code audit on Day 2 before relying on any module.

**Principle:** TerraTrust is a **technical enabler**. In every pitch artefact it appears at most as a footnote ("evidence-integrity components adapted from an earlier project"). It must never be the identity, the problem statement or the demo's opening.

| Module | Reuse? | How it serves *governance* |
| --- | --- | --- |
| Evidence capture with geolocation + timestamp | **Reuse** | Enables R13/R31 (evidence standard) |
| Image hashing / duplicate-evidence detection | **Reuse** | R30; catches recycled photos |
| EXIF/timestamp consistency checks | **Reuse** | Flags suspicious uploads for human review |
| Audit-trail / hash-chained event log | **Reuse** | R32/R39; auditor view |
| Evidence confidence score | **Reuse, advisory only** | Triage for verifiers; never decides outcome |
| Digital record/passport schema | **Adapt** | Becomes the *Asset Passport* (Part 20) with different fields |
| n8n workflows (notification, scheduling) | **Reuse patterns** | SLA/escalation jobs |
| Supabase auth/RLS patterns | **Reuse** | RBAC |
| Land/property schema, ownership/title logic, legal-document handling | **Do NOT reuse** | Off-topic; pulls the entry toward Track A / property verification |
| TerraTrust branding, UI and copy | **Do NOT reuse** | Keeps identity separate |
| Any AI feature that auto-approves | **Do NOT reuse** | Closure must stay human + rule-based |

---

## PART 18 — AI FEATURES

**Position \[P\]:** AI is optional assistance. No AI output can create, change or close an issue's governance state. For the submission, claim **at most two** AI features and show they are advisory.

| Feature | Input → model task → output | Human oversight | Failure mode | Privacy | AI needed? |
| --- | --- | --- | --- | --- | --- |
| Evidence quality pre-check | Photo → vision: blurry/dark/wrong subject? → prompt to retake | Reporter retakes; verifier sees result | False reject; model errors at night | Image sent to model; blur people first | **Helpful (MVP)** |
| Light-on/off from night photo | Photo → "is lamp lit" → advisory flag | Verifier decides | Reflections, glare, wrong pole | As above | **Doubtful** — verifier checklist is more reliable; optional |
| Duplicate report detection | Location + category + time | Coordinator confirms merge | Over-merge | None | **No** — deterministic (geo-buffer + fault type + hash) |
| Classify issue/asset type | Photo/text → category suggestion | Reporter/verifier confirms | Misclassification | Low | Marginal; dropdown + asset QR is better |
| Assess visible condition | Photo → condition score | Verifier confirms | Subjective | Low | **No** for MVP |
| Extract info from evidence (e.g., pole number) | Photo → OCR | Verifier corrects | OCR errors | Low | **Useful (Phase 2)** |
| Suspicious evidence | Hash, EXIF, geo mismatch, reuse | Verifier reviews | False positives | Low | **No** — deterministic checks first |
| Suggest responsible department | Asset + category + location | Officer confirms | Wrong owner | Low | **No** — use Accountability Map |
| Predict repeated failure | Passport history → simple model | Review panel | Spurious | Low | **Phase 3**, rule threshold (R26) is enough first |
| Summarise ward performance | Metrics → plain-language text | Coordinator edits before publish | Misstating numbers | Aggregated only | Optional; template-based is safer |
| Prioritise maintenance | Severity + exposure | Officer decides | Biased by data gaps | Aggregated | **No** — rules |
| Generate reports | Metrics → formatted PDF | Reviewed | Wrong figures | Aggregated | **No** — templates |

---

## PART 19 — GIS / MAP SYSTEM

| Layer / view | Purpose | Notes |
| --- | --- | --- |
| Asset map | Where assets are and their condition | Colour **and** icon/shape for condition (accessibility) |
| Issue map | Open issues by severity | Clustered at low zoom |
| Ward boundaries | Scope and reporting | \[F\] OpenCity hosts Bengaluru datasets; **the licence/currency of ward boundary data is NOT VERIFIED** — check before use; otherwise digitise the pilot area yourselves |
| Heatmap | Density of failures | For analysis, not for public blame |
| Overdue layer | SLA breaches | Officer/ward view; public view shows aggregates |
| Verified repairs | Positive outcomes | Show successes too |
| Repeat-failure clusters | Systemic faults (e.g., a feeder) | `ST_ClusterDBSCAN` on failures per asset/area |
| Responsibility layer | Which entity owns which area | Backs the Accountability Map |

**Location precision & privacy \[P\]**

| Tier | Used for | Public precision |
| --- | --- | --- |
| Exact | Public infrastructure like lamp posts, shelters | Exact point (no residential privacy risk) |
| Approximate (≈ 100 m) | Assets near sensitive places (e.g., toilets used by women/children, shelters of vulnerable groups) | Rounded/jittered |
| Hidden | Anything flagged security-sensitive | Not on public map |

Reporter's own GPS track is never stored beyond the capture point. Photos are location-stamped but EXIF GPS is stripped from public copies.

---

## PART 20 — DIGITAL ASSET PASSPORT

The **Asset Passport** is the asset-centred record that converts tickets into history.

| Field | Notes |
| --- | --- |
| Asset ID / QR code | Public code; optional physical QR or pole-number label |
| Type, location | With precision tier |
| Responsible department + maintenance responsibility | Named entity from Accountability Map; basis of ownership recorded |
| Service standard | Version link |
| Current condition; last inspection; last repair | From AssetCondition / Inspection / MaintenanceEvent |
| Open issues; repair history; verification history | Linked |
| Evidence | Thumbnails (privacy-safe) |
| SLA history | Met / breached, with cause codes |
| Repeat failures | Count in rolling 90 days, trend |
| Community feedback | Citizen confirm/dispute |

**How it supports governance:** (1) answers *who is responsible* before a complaint is filed; (2) converts duplicate tickets into one failing asset; (3) gives officers a cause-coded history for root-cause review; (4) gives contractors a fair record; (5) gives the ward committee a concrete agenda.

---

## PART 21 — PUBLIC ACCOUNTABILITY DASHBOARD

**Design for constructive accountability \[P\]: process and asset outcomes, not rankings of named people.**

| KPI | Display | Caveat shown |
| --- | --- | --- |
| Total assets mapped | Count by category/ward | Coverage % vs known inventory |
| Open / overdue issues | Count + ageing bands | — |
| **Claimed closures vs Verified closures** | Two bars + gap | Core metric |
| Closed-Unverified | Separate count | Why verification lapsed |
| SLA compliance | % by severity | SLAs labelled "proposed" until adopted |
| Median time to verified closure | Median, with distribution | Median over mean |
| Repeat failures | Assets with ≥ 3 in 90 days | Cause-code mix |
| Department/ward performance | Process metrics with context (volume, cause codes) | **No league tables of individuals; departments compared only on like-for-like categories** |
| Asset condition | Distribution | Based on inspections |

**Safeguards:** show denominators; show positive outcomes; right-of-reply notes from departments; changes in methodology announced; 24 h publication delay for sensitive cases.

---

## PART 22 — OFFICER DASHBOARD

Panels \[P\]: (1) **Incoming verified issues** sorted by severity/ageing; (2) **Assign** with owner suggestion; (3) **SLA board** with forecast of breaches; (4) **Contractor performance** — first-time-fix rate, verified-pass rate, cause-code mix; (5) **Pending work** by crew; (6) **Escalations** with next owner; (7) **Asset health** and ageing; (8) **Repeat failures** with root-cause actions; (9) **Maintenance insights** — repeat-repair count and, if cost data is entered, cost of repeat repairs vs a permanent fix; (10) **Reports**. Primary design goal: reduce the officer's workload by delivering *already-verified* issues with evidence.

---

## PART 23 — CONTRACTOR WORKFLOW

`Task received → Accept → Schedule → Work → Upload evidence → Submit completion claim → Independent verification → Closure / Reopen`

**Restrictions \[P\]:** cannot self-verify; cannot see reporter identity; cannot mark issue "closed", only "repair claimed"; evidence must be captured in-app (with offline queue) unless an exception is approved; must enter a cause code; one dispute per failed verification with new evidence; sees only own tasks and aggregate fairness metrics. **Protections:** dated task record, evidence of work done, upstream-cause hand-off path, balanced reporting of verified passes.

---

## PART 24 — COMMUNITY BOARD WORKFLOW

`Board formation → Observer training → Observation → Verification → Review meetings → Escalation → Quarterly accountability report`

| Stage | Detail \[P\] |
| --- | --- |
| Formation | Convenor + ward engineer sign a one-page protocol; open call; ward committee nominee joins interview |
| Training | Part 7/15 |
| Observation | Baseline census; routine night walks (lights) in pairs, daylight where possible, safety rules |
| Verification | Tasks via app or paper packet |
| Monthly meeting (60–90 min) | 1) Review numbers (claimed vs verified, repeat failures) 2) Disputed cases 3) Coordinator conflict check 4) Escalations to take upward 5) Training/rotation 6) Minutes published |
| Escalation | To ward engineer → zonal officer → ward committee agenda |
| Quarterly accountability report | Public, factual, reviewed by liaison for factual errors only (no veto) |

---

## PART 25 — FUNDING MODEL

**Honest scope:** Track B names *financing mechanisms*, so funding is part of the model — but eligibility under any scheme below was **not verified** and must not be asserted.

| Source | Status | Possible role in CAAN | Caveat |
| --- | --- | --- | --- |
| Existing municipal maintenance budget | \[I\] Already pays for repairs | Primary payer: verification reduces repeat-repair waste, so the model aims to be **cost-neutral or cost-saving** at ward level | Saving is a hypothesis — measure repeat-repair cost in the pilot |
| Ward-level allocations / civic funds | NOT VERIFIED for Karnataka/GBA | Could fund the panel's coordination | Verify existence and rules |
| CSR (Companies Act s.135, Schedule VII) | \[B\] Exists; **eligibility of this activity NOT VERIFIED** | Sponsor training, devices, coordinator stipend | Do not claim eligibility; seek legal read |
| Grants / incubation | \[F\] Seva First says shortlisted innovators may get "incubation, seed and pilot funding through partner incubation schemes" and field-testing with ULBs | Fund the pilot and platform | Terms unknown |
| Performance-linked contract clauses | **Possible pathway** | Contractor payment milestones tied to *Verified Closed* in new contracts | Not an existing mechanism as far as verified |
| Philanthropy / civic foundations | \[A\] | Panel convenor funding | Not verified |

**Recommended structure \[P\]:** (1) municipality pays for what it already pays for (repairs) and provides a liaison; (2) the **panel's coordination cost** (the new cost) is funded by grant/CSR/ward-level funds during the pilot; (3) a fixed share of verified savings from avoided repeat repairs, if demonstrated, is the case for the municipality to absorb the coordination cost later. **Who pays — one sentence:** initially a grant/philanthropic funder for the coordinator; eventually the municipal maintenance budget, justified by measured repeat-repair savings.

---

## PART 26 — COST MODEL

All figures are **assumption-based ranges in INR** — no quotes were obtained, and software/messaging prices were not re-checked. Treat them as planning ranges and replace with real quotes.

| Cost line | Low-cost pilot (3 wks, \~60–100 lamps, student-run) | Standard pilot (3–6 months, 1 ward cluster, 200–400 assets) | Scaled (per ward per year, steady state) |
| --- | --- | --- | --- |
| Software build | Own time (unpaid) | ₹0.3–1.0 L (part-time dev support) | ₹0.5–1.5 L maintenance share |
| Hosting / storage | ₹0–2 K (free tiers) | ₹5–15 K | ₹20–60 K |
| Mapping | ₹0 (OSM/MapLibre) | ₹0–10 K | ₹10–40 K |
| SMS / notifications | ₹0 (in-app/email) | ₹5–15 K | ₹20–80 K (if SMS used; registration needed) |
| Training | ₹2–5 K (printing, refreshments) | ₹20–50 K | ₹30–80 K |
| Community meetings | ₹1–3 K | ₹10–25 K | ₹40–80 K |
| Verifier incentives (optional) | ₹0–? (volunteer) | ₹0–30 K (travel/data reimbursement) | ₹0.5–2 L |
| Devices (shared phones/power banks) | ₹0 (own) | ₹10–25 K | ₹10–30 K |
| Field operations (travel, data packs) | ₹3–10 K | ₹25–60 K | ₹40–90 K |
| Coordinator / administration | ₹0 | ₹0.5–1.5 L | ₹1.5–4 L |
| Audit/evaluation | ₹0 | ₹10–30 K | ₹20–60 K |
| **Indicative total** | **₹10–30 K** | **₹1.5–4 L** | **₹4–10 L** |

**Unit costs (illustrative \[A\]):** if a ward has \~500 monitored assets in one category, ward-year cost ₹4–10 L → about **₹67–170 per asset per month**. Cost per verified closure = (verification labour + coordination share) ÷ verified closures — compute from pilot logs (time per verification × an assumed value of time). **Cost-benefit hook:** compare the monitoring cost against the municipality's measured cost of repeat repairs on assets that failed ≥3 times — this is the one number a municipal finance officer will care about.

---

## PART 27 — PILOT DESIGN

### 27.1 Asset category comparison (scored 1–5; weights sum to 100)

Scores are **\[I\] my judgment**; rescore with your own recon.

| Criterion (weight) | Street lights | Public toilets | Parks | Drains / covers | Bus shelters | Manhole & footpath hazards |
| --- | --- | --- | --- | --- | --- | --- |
| Ease of field verification (20) | 5 | 3 | 2 | 3 | 4 | 4 |
| Visible condition (10) | 4 | 3 | 3 | 3 | 5 | 4 |
| Safety (15) | 5 | 3 | 2 | 5 | 3 | 5 |
| Measurable repair (15) | 5 | 3 | 2 | 3 | 4 | 4 |
| Availability / number in a small area (10) | 5 | 2 | 2 | 4 | 2 | 3 |
| Student accessibility (10) | 4 | 2 | 4 | 3 | 4 | 3 |
| Cost (5) | 4 | 3 | 4 | 3 | 4 | 4 |
| Impact (10) | 4 | 4 | 3 | 5 | 3 | 4 |
| Scalability (5) | 5 | 3 | 3 | 4 | 3 | 4 |
| **Weighted score (/100)** | **93** | 58 | 51 | 73 | 72 | 79 |

**Decision \[P\]: street lights**, because a lamp is binary (on/off), countable within a short walk, safety-relevant (Theme 05 fit), and responsibility is **genuinely split** across bodies — which is exactly the accountability gap the model targets. **Honest drawbacks:** night-time fieldwork has personal-safety risk; electrical faults sometimes sit upstream (hence cause codes); in 3 weeks few faults will reach closure. **Fallback:** manhole/footpath hazards (daytime, binary) if recon shows lamp IDs are unusable. **Sensitivity \[I\]:** lamps stay first unless night-safety is weighted above \~25%.

**Fieldwork safety rules \[P\]:** always in pairs; 6:30–8:30 pm window; well-populated stretches; hi-vis bands; share live location with a team lead; no confrontation; inform the college coordinator; never touch electrical equipment; stay on footpath.

### 27.2 Pilot location criteria

Within 30–40 minutes of team members; 2–4 km of road with mixed arterial/internal streets; an active RWA or NGO; visible pole numbers (or ability to label); a ward engineer or office reachable; coverage by the city's grievance channel (all GBA areas assumed; confirm).

### 27.3 Asset sample

60–100 lamps, stratified: \~20 main road, \~50 internal roads, \~10 junction/park edge. Each gets an asset ID, photo, GPS, pole number (if any), and a first guess at responsible entity.

### 27.4 Design: two-part "Closure Audit" \[P\]

**Part A — Closed-Ticket Sweep (fast, larger n).** Ask 10–20 residents/RWA members for their last 3 months of *closed* street-light complaints (their own accounts). Independently verify at the actual location, at night, whether each is fixed. Output: **false-closure rate** with n stated. *Whether Sahaaya's public complaint data can be browsed or exported: NOT VERIFIED — do not rely on it.*

**Part B — Live Cycle (smaller n, prospective).** Baseline night check of all sample lamps → log each genuine fault once through the official channel → record official status at day 3/7/14 → verify every claimed closure independently within 48 h → reopen via the same channel when failed → record time stamps. Expect only a handful of faults (**n likely under 20** \[A\]); report counts and ranges, not percentages-with-confidence.

| Phase | Content | Output |
| --- | --- | --- |
| Baseline survey | Day-time census, night functional check, responsibility mapping, resident short survey | Baseline functional rate; ownership-ambiguity cases |
| Data collection | Standard forms (paper + app) | Dataset |
| Stakeholders | Ward engineer (courtesy meeting), RWA, local NGO, 3–5 residents, one contractor/crew if reachable | Letters/notes |
| Training | 2–3 h verifier session | 8–10 trained verifiers |
| Deployment | Paper protocol first, platform in shadow mode | Working loop |
| Monitoring | Weekly status review | Tracker |
| Verification | Independent re-checks | Verification records |
| Endline | Repeat night check; resident short survey | Change data |
| Impact measurement | Part 29 | Pilot report (2–3 pages) |

**Ethics/legality:** report only real faults; no false complaints; no photos of people; no entering restricted areas; be transparent with officials that the team is a student project studying closure quality; do not claim official endorsement.

---

## PART 28 — FIELD RESEARCH PLAN

**Goal:** validate the as-is workflow and the gap *before* polishing anything. Target 15–25 short interviews in the first 7 days.

| Group | Core questions (5–8 each, abridged) |
| --- | --- |
| Citizens / residents | Last time a street light failed: what did you do? Which channel? What did you hear back? How did you know if it was fixed? Did it recur? Who do you think is responsible? Would you trust a neighbour trained to check? What would stop you from participating? |
| Shopkeepers | Does lighting affect your hours/sales/safety? Who do you call? How long do repairs take? Repeat issues? |
| Municipal officers / engineers | How do you receive and close complaints? What counts as "closed"? Who checks? How do you handle utility vs municipal responsibility? What data do you wish you had? What would make you accept outside verification? What would worry you? |
| Maintenance workers | How do you get assignments? What proof do you give? What stops a fix being final? What do you do when the fault is upstream? |
| Contractors | How is completion certified? Are you ever disputed? What evidence protects you? What would make independent verification fair? |
| NGOs / RWAs | Have you tried tracking repairs? What worked/failed? Who would convene a panel? Capacity for training? |
| Ward representatives / ward committee members | What does the ward committee do on asset upkeep? Would it review a quarterly report? Concerns about misuse? |

**Observation checklist (per asset):** asset ID/pole no.; lit/unlit/flicker; surrounding light level; visible damage; label present; nearby obstruction (tree); safety hazard; photo; GPS; time; observer; conflict declaration.

**Resident survey (10 items):** (1) street used daily? (2) feel safe at night here? (3) number of dark nights last month (estimate) (4) ever reported a fault? (5) channel (6) days until you heard back (7) was it actually fixed (yes/no/don't know) (8) did it recur (9) trust in a trained neighbour verifying (1–5) (10) preferred way to participate (app/phone/paper).

**Asset inspection form fields:** matches Inspection entity (Part 11) + checklist items per Service Standard.

**Consent language (verbal or written) \[P\]:** "We are students from \[institution\] studying how repairs to public street lights are confirmed. Taking part is voluntary. We will not record your name unless you agree. Your answers will be used in summary form for a competition submission and a public report. You can stop at any time and ask us to delete your data. May we proceed?" (Photos: "We photograph lamps, not people.")

---

## PART 29 — IMPACT MEASUREMENT

Targets are **proposed hypotheses** \[P\], not claims. Baselines come from the pilot.

| KPI | Baseline | Target (hypothesis) | Method | Data source | Frequency |
| --- | --- | --- | --- | --- | --- |
| Issue verification rate | Measure | ≥ 90% of reports verified or marked unconfirmed in SLA | Verification timestamps | Platform | Weekly |
| **False-closure rate** (claimed closed but failing verification) | Measure in Closed-Ticket Sweep | Show baseline; target lower with 2-key closure | Verifier outcome vs official status | Verification records | Per cycle |
| Verified closure rate | Measure | Higher share of claims reaching Verified Closed | Counts | Platform | Monthly |
| SLA compliance (proposed SLAs) | Measure | ≥ 80% \[A\] | Clock logs | Platform | Monthly |
| Median time to verified closure | Measure | Decline over cycles | Medians | Platform | Monthly |
| Repeat-failure rate (≥3 in 90 d) | Measure | Declining after root-cause reviews | Passport history | Platform | Quarterly |
| Cost per resolved issue | Measure | Report; compare monitoring cost vs repeat-repair cost | Logs + cost entries | Cost log | Quarterly |
| Citizen satisfaction | Survey baseline | Improvement | Survey (1–5) | Survey | Baseline/endline |
| False-report rate | Measure | < 10% \[A\] and falling after education | Unconfirmed share | Platform | Monthly |
| Verification accuracy | Measure | ≥ 95% agreement with auditor re-check \[A\] | 5% sample re-verification | Auditor | Quarterly |
| Community participation | Count verifiers/active share | 8–10 active in pilot | Roster/activity | Platform | Monthly |
| Ownership clarity | % assets with named owner | 100% of sample | Accountability Map | Platform | At setup |
| Beneficiaries (proxy) | — | Residents on pilot roads (estimate, stated as assumption) | Resident survey + road counts | Field | Baseline |

---

## PART 30 — THEORY OF CHANGE

| Stage | Content \[P\] |
| --- | --- |
| **Inputs** | Student team; trained verifier volunteers; convenor institution; ward engineer liaison; platform (open-source stack); small grant/in-kind support; Service Charter template |
| **Activities** | Asset census; Accountability Map; verifier training; fault logging via official channel; independent verification; monthly panel review; repeat-failure review; quarterly public report |
| **Outputs** | N assets with passports; N faults verified; claimed-vs-verified ledger; trained verifier roster; draft Charter and ward SOP; pilot report |
| **Outcomes (short/medium)** | Fewer closed-but-broken faults; clearer ownership; faster verified closure; fewer repeat failures after root-cause actions; higher resident trust |
| **Long-term impact** | Reliable public infrastructure; credible closure data for planning and budgeting; a standing community role in service verification; a replicable ward-level SOP |
| **Assumptions to test** | (1) false closures are common enough to measure; (2) officers will accept independent checks; (3) volunteers can be recruited and retained; (4) verification cost is lower than repeat-repair cost |

---

## PART 31 — BUSINESS / OPERATING MODEL

| Question | Answer \[P\] |
| --- | --- |
| Who operates it? | A neutral **convenor** (NGO / college unit / RWA federation) runs the panel; the municipality's ward office is the formal counterpart |
| Who owns the platform? | Open-source codebase held by the team or a non-profit steward; each ward's **data** remains with the municipality/ward under agreed terms \[A\] |
| Who governs the rules? | A public **Rule Charter** reviewed annually by panel + municipal liaison + an external reviewer; platform rule changes need two-person approval |
| Who trains verifiers? | Convenor, using a standard curriculum; municipal liaison contributes the technical module |
| Who maintains the software? | Steward team (pilot); later an empanelled agency or the municipality's IT cell. \[F\] UPYOG's model shows states can use empanelled implementation partners — an analogous route is a *possible pathway*, not verified for CAAN |
| Who pays? | Part 25 |

| Context | How it adapts |
| --- | --- |
| Small municipality | Paper-first; one coordinator; shared phone; monthly meeting at town office; platform optional |
| Medium city | Ward panels per zone; platform with SMS fallback; zone-level coordinators |
| Large city (e.g., Bengaluru) | Ward panels under the ward committee; city-level audit cell; integration with the city grievance platform via ticket references |
| Panchayat | \[B\] Different legal framework (73rd Amendment, gram sabha); panel could report to the gram sabha; assets differ (hand-pumps, village lights, community halls); **legal fit NOT VERIFIED** |

---

## PART 32 — SCALABILITY

| Level | What changes | How governance stays manageable |
| --- | --- | --- |
| Pilot cluster (60–100 assets) | Student-run, paper+app, shadow mode | Single coordinator |
| 5 wards | Multiple panels; shared training; shared rule defaults | Convenor consortium; templates |
| City | Accountability Map and standards negotiated with each department/utility; city audit cell | Standardised cause codes and checklists; sampled audits |
| District | Urban + rural variations; panchayat adaptation | District-level technical team; adapters per local system |
| State | Align with state grievance and asset platforms; capacity partners | State SOP template; empanelled partners |
| Other states | Language, local institutions, legal checks | Open schema, localisation kit, legal checklist per state |

**Scaling principle \[P\]:** scale the *protocol and training*, not the software. A ward can adopt the Charter with paper forms; the platform only makes it cheaper and auditable at volume.

---

## PART 33 — INTEROPERABILITY

**Principle:** CAAN is an **overlay**. It references an external ticket ID, adds verification and ownership data, and (where allowed) pushes the outcome back. It does not claim any API that has not been verified.

| System | Ideal integration | Current **verified** capability | Future | Prototype simulation |
| --- | --- | --- | --- | --- |
| UPYOG PGR | Read ticket status; post verification outcome as a comment/state | \[F\] Described as open-API-based, open source (MIT) with GIS mapping, tracking, auto-escalation/SLA. Whether any specific city exposes API access to third parties: **NOT VERIFIED** | Pilot with a UPYOG-adopting ULB via NUDM/NIUA | Mock adapter with sample PGR-like JSON, labelled SIMULATED |
| UPYOG Asset Management | Sync asset registry | \[F\] Listed as a UPYOG service; capability/data model **NOT VERIFIED** | Map CAAN's passport fields to it | Import assets via CSV |
| Sahaaya 2.0 / Sahaaya Plus (GBA) | Reference ticket ID; publish outcome | \[F\] Exists; Sahaaya Plus under development (10 Jul 2026). Public API: **NOT VERIFIED** | Official partnership | Manual ticket-ID entry + screenshot; CSV |
| Swachhata-MoHUA | Toilet/sanitation complaints | \[F\] Has resolved-photo + citizen reopen; third-party API **NOT VERIFIED** | — | None needed |
| NUDM national dashboard (UMEED) | Contribute verified-outcome indicator | \[F\] Mentioned in MoHUA deck; interface **NOT VERIFIED** | Propose a "verified closure" indicator | Export compatible CSV |
| GIS (GMIS / state GIS) | Layer exchange | \[F\] GMIS named in a secondary source; access **NOT VERIFIED** | Standard formats (GeoJSON) | GeoJSON import/export |
| Municipal asset systems / utility records (e.g., power distribution) | Confirm ownership of poles/feeders | **NOT VERIFIED** | Data-sharing MoU | Accountability Map built by hand from field/officer input |
| State platforms (e.g., single-window grievance) | Link | **NOT VERIFIED** | — | CSV |

**Mock layer rule (Rule 11):** the demo must show an `IntegrationLink.mode = simulated` badge wherever a mock adapter is used.

---

## PART 34 — SECURITY & PRIVACY

| Area | Design \[P\] |
| --- | --- |
| Authentication | Phone OTP (citizens/verifiers); email + password + MFA (officers/admin); session expiry; device binding for field accounts |
| Authorization / RBAC | RLS in database by role and ward scope; no client-side-only checks; separation-of-duty constraints at DB level |
| Encryption | TLS everywhere; encryption at rest (managed DB/storage); secrets in vault; signed URLs for evidence |
| Audit logs | Hash-chained, insert-only, exportable; periodic anchor of the latest hash in a signed daily digest (no blockchain needed) |
| Evidence integrity | In-app capture; SHA-256; EXIF consistency; duplicate check; immutable storage with annotation layer |
| Location privacy | Part 19 tiers; strip EXIF GPS from public copies; do not store continuous tracks |
| Citizen privacy | Minimal data; reporter hidden from contractors/public; no faces/plates; consent record |
| Retention / deletion | \[A\] Evidence 3 years then archive/anonymise; personal data deleted on request unless needed for open disputes; policy to be aligned to applicable law (India's data-protection law — **applicability and specifics not verified here; take legal advice**) |
| Sensitive data | No caste/religion/health data collected; assisted-report attestations stored minimally |
| Abuse prevention | Rate limits; CAPTCHA on public forms; upload scanning/type/size limits; moderation queue; honeypots |

| Threat | Mitigation |
| --- | --- |
| Fake reports | In-app capture, verification before assignment, rate limits, education-first response |
| Malicious uploads | File-type validation, malware scan, size limits, sandboxed rendering |
| Harassment | Verifier anonymity in public views; panel acts collectively; threat-report path; pause visibility |
| Doxxing | No personal data on public pages; blur faces; hide reporter identity; remove EXIF |
| GPS manipulation | Accuracy threshold; compare with asset buffer; cross-check with second evidence; flag for review; physical re-check on suspicion |
| Duplicate/recycled evidence | Hash and perceptual-hash comparison across issues |
| AI errors | Advisory only; humans decide; log AI suggestions separately |
| Insider misuse | Least privilege; two-person rule changes; audit exports |

---

## PART 35 — ACCESSIBILITY & INCLUSION

| Need | Design \[P\] |
| --- | --- |
| Low-end phones / slow internet | Lightweight PWA; image compression before upload; offline queue; list view fallback for maps; SMS/phone fallback for critical items |
| Regional languages | Kannada, Hindi, English at launch; externalised strings; plain-language copy; icons with text |
| Low digital literacy | Wizard-style reporting with 3 steps; pole-number or QR picking; photos instead of typing |
| Voice input | Browser speech-to-text for descriptions where supported \[A\]; coordinator-assisted phone reports as the reliable fallback |
| Senior citizens | Large text, high contrast, assisted desk, trusted-neighbour verification |
| Persons with disabilities | WCAG 2.1 AA, screen-reader labels, keyboard operation, captioned training videos; panel includes persons with disabilities; accessibility audits of footpaths/shelter ramps as a later asset class |
| Digitally excluded | **Assisted reporting** at ward office/library/CSC \[A: exists in many places — verify locally\]; paper forms with QR; coordinator phone line |
| Offline field verification | Paper packets with printed asset IDs; later bulk upload (Screen 46) |
| **Low-tech fallback (Rule 18)** | The whole model runs on: paper checklist + photograph + WhatsApp/phone relay to a coordinator + a spreadsheet ledger. The platform adds auditability and scale but is not required |

---

## PART 36 — NOTIFICATION SYSTEM

| Event | Citizen | Verifier | Officer | Contractor | Admin/Coordinator | Channel |
| --- | --- | --- | --- | --- | --- | --- |
| Submission received | ✓ receipt | — | — | — | — | In-app/email/SMS-opt |
| Report verified / unconfirmed | ✓ outcome + reason | ✓ (for own task) | — | — | — | In-app/email |
| Assignment | ✓ "assigned to X" | — | ✓ | ✓ task | — | In-app/SMS for critical |
| SLA warning (50/80%) | — | — | ✓ | ✓ | ✓ | In-app/email |
| SLA breach | ✓ neutral update | — | ✓ escalated | ✓ | ✓ | In-app/SMS |
| Repair claimed | ✓ "awaiting independent check" | ✓ request | ✓ | ✓ | ✓ | In-app |
| Verification request | — | ✓ | — | — | ✓ if unclaimed | In-app/phone |
| Verified Closed | ✓ | ✓ | ✓ | ✓ | ✓ | In-app/email |
| Reopened | ✓ | ✓ | ✓ | ✓ | ✓ | In-app/SMS |
| Escalation | ✓ neutral | — | ✓ | ✓ | ✓ | In-app/email |
| Panel meeting | — | ✓ | ✓ liaison | optional | ✓ | Email/calendar |
| Report published | ✓ (subscribers) | ✓ | ✓ | ✓ | ✓ | Email |
| Critical hazard | ✓ confirmation | — | ✓ phone alert | ✓ | ✓ | Phone/SMS |

Rules: quiet hours (except critical); dedupe; plain language; opt-out of non-critical; WhatsApp not used in the pilot.

---

## PART 37 — REPORTING

| Report | Cadence | Audience | Content |
| --- | --- | --- | --- |
| Daily digest | Daily | Officer/coordinator | New verified issues, breaches in next 24 h |
| Weekly SLA & queue report | Weekly | Officer, coordinator | Backlog, ageing, verification queue, lapses |
| Contractor report | Monthly | Officer, contractor | First-time-fix, verified-pass rate, cause codes, disputes |
| Asset health report | Monthly | Officer, panel | Condition mix, repeat-failure list, recommended reviews |
| Department report | Monthly | Dept head | Process metrics, jurisdiction disputes, escalations |
| Community verification report | Monthly | Panel, convenor | Volume, accuracy, rotation, training status |
| **Ward accountability report** | Quarterly | Public + ward committee | Claimed vs verified, repeat failures, actions taken, open items, methodology note |
| SLA report | Quarterly | Public | SLA compliance by severity (labelled proposed/adopted) |

---

## PART 38 — DEMO MODE

**Design \[P\]:** a "Judge Mode" seeded with 40 pilot-like assets and 12 issues at different stages, with a visible **DEMO DATA / SIMULATED INTEGRATION** badge. Never present seeded data as pilot results; show real pilot numbers on a separate evidence slide.

### 38.1 Five-minute demo (click-level script in Part 57)

| Minute | Content | Screen |
| --- | --- | --- |
| 0–1 | **Problem:** a closed ticket, a dark street. Real pilot photo + one real number from the Closed-Ticket Sweep | Slide → Landing |
| 1–2 | **Citizen reports:** pick lamp, photo, submit; show "verification pending" | Report issue → Confirmation |
| 2–3 | **Governance workflow:** verifier confirms; officer assigns from Accountability Map; contractor accepts and **claims** repair; show "Repair Claimed" ≠ closed | Verification, Assignment, Repair task |
| 3–4 | **Independent verification:** different verifier at night, checklist, fail → reopen; second attempt pass → Verified Closed; show two-key rule | Verification detail → Timeline |
| 4–5 | **Impact:** claimed vs verified ledger, repeat-failure asset, cost per verified closure; close with the paper fallback sheet | Public dashboard |

### 38.2 Ten-minute backup

Add: (a) 90-second walkthrough of the Service Charter and Accountability Map; (b) rule engine view (R01/R02/R11 blocking an attempted self-verification); (c) audit log hash check; (d) mock UPYOG/Sahaaya adapter with SIMULATED badge; (e) 60-second paper-process demonstration; (f) Q&A pre-load (Part 39).

---

## PART 39 — JUDGE QUESTIONS & HONEST ANSWERS

Templates in **\[brackets\]** must be filled with your real pilot facts; never invent them.

| # | Question | Answer |
| --- | --- | --- |
| 1 | Isn't this just a grievance app? | No. Intake, routing and tracking already exist. We change *who may declare closure* and *what the unit of accountability is*. The platform records; the contribution is a closure rule and an institution, and it still works on paper. |
| 2 | UPYOG already does this. What's new? | UPYOG's PGR provides SLAs, escalation, GIS and tracking. We found no verified evidence that it defines an independent community closure authority or asset-level repeat-failure review; its asset module's details are NOT VERIFIED. If it does, CAAN sits on top as an overlay. |
| 3 | Why do we need citizens? | For independence and presence: they are at the asset at night, are not paid by the repairer, and cost less than re-inspection by staff. They are trained, rotated and audited. |
| 4 | Why would municipalities adopt it? | Credible closure data, an evidence trail that defends staff against false allegations, fewer repeat visits. We claim no adoption; the pathway is a pilot order or ward SOP. |
| 5 | Who pays? | Municipality pays for repairs as now; coordination cost funded by grant/CSR during the pilot, later justified by measured repeat-repair savings (Part 25). |
| 6 | Who has legal authority? | Verifiers have none and do not decide governance outcomes alone; they record evidence under a protocol. A formal role is a possible pathway via municipal resolution/SOP — not an existing mechanism we can cite. |
| 7 | What if the verifier is biased? | Rotation, conflict declarations, two verifiers for high risk, third-check on disagreement, auditor sampling, anomaly review, public checklists. Residual risk remains and is disclosed. |
| 8 | What about fake complaints? | Verification before assignment, in-app evidence, hash checks, rate limits, education-first response. |
| 9 | Why Track B? | The novelty is institutional and procedural; the software is replaceable by a paper protocol. |
| 10 | Why not Track A? | Track A rewards a built product; our product layer is deliberately thin. Judged as software we would look like a clone of existing portals. |
| 11 | How do you prove impact? | Pilot measures false-closure rate, time to verified closure, repeat failures and cost. Sample is small and reported descriptively. |
| 12 | Where is your pilot? | \[Ward cluster, dates, number of assets, partners\]. Scope and limits stated up front. |
| 13 | How is it scalable? | We scale the protocol, training and charter; software is optional. Cost per asset-month falls with scale (Part 26 ranges). |
| 14 | Why can't a municipality build this itself? | It can — it's open. But independence cannot be built in-house: the repairing body verifying itself is the problem. We offer the protocol and the neutral role. |
| 15 | How is it different from asset-management systems? | They manage assets and work orders for the owner. They do not define independent verification or a public claimed-vs-verified ledger. |
| 16 | What if verifiers don't show up? | *Verification Lapsed* state; Closed-Unverified is reported separately; coordinator and paper packets; no silent closure. |
| 17 | Won't officers feel policed? | Metrics are process-level, with right of reply and verified successes shown; the officer's workload falls because issues arrive verified. |
| 18 | What if a contractor disputes a failure? | One dispute with new evidence (R45); cause codes distinguish upstream faults. |
| 19 | Does it work without smartphones? | Yes: paper checklist, phone relay, spreadsheet ledger (Rule 18). |
| 20 | How is privacy handled? | Minimal data, hidden reporter identity, no faces/plates, EXIF stripping, retention policy (Part 34). Legal alignment needs professional advice. |
| 21 | What does a ward cost? | Indicative ₹4–10 L/year at steady state; ₹67–170 per asset-month under stated assumptions (Part 26). |
| 22 | How many false closures did you find? | \[n closed tickets checked, n failing\]. State n; do not extrapolate. |
| 23 | Isn't n too small? | Yes; the pilot demonstrates feasibility and measurement, not statistical proof; we plan a larger cycle. |
| 24 | Is street lighting too narrow? | It's the pilot class chosen by a scored comparison; the model and schema are asset-agnostic. |
| 25 | Who owns the pole — utility or municipality? | The Accountability Map records it; unclear cases get a *Jurisdiction Dispute* state with the clock running on the municipal body (R05). Legal allocation: NOT VERIFIED. |
| 26 | Why not RTI? | \[B\] RTI is a request-based right to information, not a continuous verification loop; the two complement each other. |
| 27 | Why not social audit? | \[B\] Social audits exist and inspire us; CAAN is ticket-level, continuous and asset-centred. |
| 28 | Isn't verifying everything expensive? | Verification targets *claimed closures*; Phase 2 adds risk-based sampling for Low severity. |
| 29 | How do you prevent political capture? | Exclusions, neutral convenor, versioned public rules, neutral publication templates. |
| 30 | Vandalism or theft isn't a repair failure. | Cause codes separate it; repeat-failure review distinguishes causes. |
| 31 | What is AI's role? | Advisory evidence-quality prompts only; no AI decision on closure. |
| 32 | Why not blockchain? | A hash-chained audit log plus daily digest gives tamper-evidence without added complexity. |
| 33 | How will you retain volunteers? | Short tasks, rotation, certificates, recognition, reimbursement of expenses, visible outcomes. |
| 34 | What if the municipality refuses to engage? | Shadow mode on public channels with factual publishing; engage through RWAs and ward committee; no adversarial framing. |
| 35 | What if your data contradicts the official data? | Right of reply, 24 h review, factual presentation, joint site check offered. |
| 36 | Are volunteers safe? | Pairs, time window, no confrontation, no electrical contact, incident reporting. |
| 37 | Is publishing legal? | Photos of public assets without people; no personal data. Legal confirmation: NOT VERIFIED. |
| 38 | Timeline to adoption? | We do not promise adoption; proposed pathway of pilot → review → SOP over \[A\] 6–12 months. |
| 39 | What is success for you? | A ward adopting the Charter; verified closure gap measured and shrinking. |
| 40 | Biggest weakness? | Dependence on municipal cooperation and volunteer capacity; small pilot. |
| 41 | What if there's no asset inventory? | The census builds one; it can seed the ward's registry. |
| 42 | Integration with Sahaaya Plus? | Overlay by ticket reference; API availability NOT VERIFIED; simulated adapter in the demo. |
| 43 | Why Bengaluru? | Pilot convenience and documented closure issues; the model is not city-specific. |
| 44 | Does this work in rural areas? | Possible adaptation to gram panchayats; legal fit NOT VERIFIED. |
| 45 | Swachhata already lets citizens reopen. | Reopen depends on the complainant and the same agency closing again; we add a designated independent verifier, split closure states, and asset-level analytics. |
| 46 | Commercial CMMS tools exist. | They serve asset owners; none we reviewed provides community verification as a governance step. |
| 47 | What does "verified" mean? | A checklist-based observation against the service standard; it is not engineering or electrical-safety certification, which remains with licensed staff. |
| 48 | Liability if a verifier errs or is hurt? | Volunteers do not certify safety; safety rules and insurance/legal cover are open items to resolve with the convenor. |
| 49 | Could contractors game verifiers? | COI rules, random assignment, rotation, anomaly detection, sample audits. |
| 50 | What surprised you in the field? | \[Real finding from interviews — write this honestly.\] |
| 51 | Sustainability after you graduate? | Convenor institution + open protocol + documented handover. |

---

## PART 40 — COMPETITOR / ALTERNATIVE ANALYSIS

**Coverage note:** only the first few were verified in depth; civic-tech startups and other open-source systems were **not exhaustively researched** — do a deeper scan on Days 2–3 before claiming uniqueness.

| System | Purpose | Users | Capabilities | Already solves | Gap relevant to us | Our difference |
| --- | --- | --- | --- | --- | --- | --- |
| **UPYOG PGR** \[F\] | Grievance registration and redressal | Citizens, ULB staff | GIS mapping, status tracking, dashboards, auto-escalation and SLAs | Intake, routing, deadlines | Closure semantics and independent checking: not found | Independent closure authority overlay |
| **UPYOG Asset Management** \[F listed\] | Municipal asset management | ULB staff | Capabilities **NOT VERIFIED** | Asset registry (presumed) | Verification/repeat-review: NOT VERIFIED | Passport + verification model |
| **Sahaaya 2.0 / Sahaaya Plus** \[F\] | Bengaluru grievance channel; unified system in development (Jul 2026) | Citizens, GBA staff | Complaint filing and tracking | Intake and tracking | \[F\] Closure-without-action admitted (2019); reopen–close loops reported | Independent verifier + two-key closure |
| **Swachhata-MoHUA** \[F\] | Sanitation complaints (built by Janaagraha's IChangeMyCity) | Citizens, sanitary inspectors | Photo-geotag, SLAs, resolved-photo, citizen reopen, city ranking by resolution rate | Citizen feedback loop | Reopen depends on the complainant; ranking uses resolution rate | Designated verifier panel; claimed-vs-verified metric |
| **CPGRAMS** \[B\] | Central public grievance portal | Citizens, ministries | Grievance tracking | Not local-asset-focused | Not researched in detail | Ward-level, asset-level |
| **IChangeMyCity (Janaagraha)** \[F existence\] | Citizen civic engagement platform | Citizens | Reporting, community features | Civic participation | Not researched in depth | Institutional verification role |
| **Commercial EAM/CMMS** \[F generic\] | Asset maintenance and work orders | Asset owners | Inventory, inspections, scheduled maintenance, work orders | Owner-side maintenance | Independent community verification absent in typical descriptions | Complements as an overlay |
| **Social audits / community scorecards** \[B\] | Community monitoring of public programmes | Communities | Periodic public review | Participation and transparency | Not continuous or ticket-level | Continuous, evidence-based, role-separated |
| **Ward committees / area sabhas** \[F objectives; powers contested\] | Participation forum | Residents, councillor | Advisory review | Forum for dialogue | Advisory; no verification protocol | Provides evidence and a structured agenda |
| **OpenCity and open data dashboards** \[F\] | Open civic data | Public/researchers | Datasets | Data availability | Not outcome verification | Publishes verified outcomes |

---

## PART 41 — ORIGINALITY DEFENSE: WHAT IS ACTUALLY NEW?

**What is *not* new (be explicit):** reporting; routing; tracking; SLAs; maps; photo proof from the repairer; complainant reopen (Swachhata); asset registers (UPYOG listing); social audits (the idea).

**What we believe is new \[I — absence-of-evidence, not proof of absence\]:**

1. **An independent closure authority at ward level.** Closure is a two-key act; the repairer's claim and the independent verification are separate recorded states, and only the second counts.
2. **A defined institutional role for the verifier** — eligibility, training, COI rules, rotation, removal, escalation — rather than "any citizen may comment."
3. **Role separation as a governance rule** — reporter ≠ repairer ≠ verifier — enforced by the system and by protocol.
4. **Asset-centred accountability with a named owner** and a Jurisdiction Dispute state that keeps the clock running on the municipal body.
5. **Repeat-failure feedback as an institutional loop** — thresholds trigger a root-cause review that appears on the ward agenda.
6. **A published claimed-vs-verified ledger** — the gap itself becomes the accountability signal.
7. **Closed-Unverified as an honest category** that prevents silent deadlock and silent inflation.

**Originality statement (one paragraph):** *Existing civic platforms let citizens report and let agencies close; the evidence we reviewed shows closure often rests with the party being measured. CAAN introduces an independent, trained, rotating community verification role and a two-key closure rule at ward level, makes the asset — not the ticket — the unit of accountability with a named owner and service standard, and publishes the gap between what is claimed closed and what is verified fixed. The software records and enforces; the innovation is the closure rule, the institution and the feedback loop.*

**Validation obligation:** before submission, run a documented scan (Days 2–3) for any deployed system that already combines independent community verification with closure gating; if found, cite it and reposition as *adaptation and ward-level institutionalisation*.

---

## PART 42 — FAILURE MODES (30)

Probability and impact are qualitative judgments \[A\]: L = low, M = medium, H = high.

| # | Risk | Prob. | Impact | Mitigation |
| --- | --- | --- | --- | --- |
| 1 | No institutional coordinator registered in time | M | Critical | Brief CMR coordinator on Day 1; get a named backup |
| 2 | Cannot recruit enough verifiers | M | H | Recruit through RWA, NSS/student clubs, NGO; start paper-only |
| 3 | Officers hostile or unresponsive | M | H | Frame as support; courtesy meeting; shadow mode; share draft findings first |
| 4 | Too few faults during pilot | H | M | Closed-Ticket Sweep; descriptive reporting; continue pilot to showcase dates |
| 5 | False-closure rate is low | M | M | Report honestly; emphasise ownership/time/repeat gaps; value of assurance |
| 6 | Judges see a grievance app | M | H | Lead with closure rule and institution; paper demo; state what is not new |
| 7 | An existing system already combines these | M | H | Deeper scan Days 2–3; reposition as adaptation |
| 8 | Verifier bias or collusion | M | H | Rotation, COI, two verifiers, audits |
| 9 | Harassment of verifiers | L–M | H | Anonymous public views, panel-level action, incident protocol |
| 10 | Retaliation against reporters | L | H | Hidden identity, minimal data |
| 11 | Flood of fake or low-quality reports | L | M | Verification gate, rate limits |
| 12 | Night-time safety incident | L | Critical | Pairs, time window, safe areas, no confrontation, college informed |
| 13 | Complaint about photos/publishing | L | M | No people, EXIF stripping, takedown path |
| 14 | Data-protection non-compliance | M | H | Minimal data, retention policy, legal advice before scale |
| 15 | Demo failure (connectivity/platform) | M | H | Offline demo build, recorded video, paper walkthrough |
| 16 | Over-building features | H | M | MVP list (Part 43) frozen on Day 8 |
| 17 | AI false positives mislead | M | L | Advisory only; show to verifier, never decide |
| 18 | GPS spoofing | L | M | Accuracy checks, second evidence, physical re-check |
| 19 | Contractor pushback | M | M | Dispute right; fairness metrics; cause codes |
| 20 | Jurisdiction ambiguity unresolvable | H | M | Jurisdiction Dispute state; municipal clock rule; escalation to zonal level |
| 21 | Verification cost exceeds benefit | M | H | Measure cost; risk-based sampling in Phase 2 |
| 22 | Volunteer fatigue | H | M | Short tasks, rotation, recognition |
| 23 | Political misuse | L–M | H | Exclusions, neutral convenor, neutral reports |
| 24 | Dashboard read as shame ranking | M | M | Process metrics, right of reply |
| 25 | Scope creep to many asset classes | M | M | One class only (Rule 13) |
| 26 | Time overrun / exams / team capacity | H | H | Day-by-day plan with cut lines (Part 52) |
| 27 | Mock integration mistaken for real | L | H | SIMULATED badge everywhere |
| 28 | Claims unsupported by evidence | M | H | Evidence tags; fill-in templates; no invented numbers |
| 29 | Funding story unrealistic | M | M | Ranges + assumptions; "who pays" stated plainly |
| 30 | No asset inventory or ownership data | M | M | Census and hand-built Accountability Map |

---

## PART 43 — MVP VS FULL PRODUCT

**Must exist before 24 October (MVP) \[P\]**

| Category | Item |
| --- | --- |
| Governance documents | Service Charter (1–2 pages); Ward SOP draft; Verifier code of conduct; Accountability Map for the pilot area; paper verification form |
| Evidence | Asset census; Closed-Ticket Sweep results; live cycle log; interview notes; consent forms |
| Prototype | Report → verify → assign → claim → independent verify → close/reopen → public ledger; role separation enforced (R01, R02, R11); evidence capture with time/location; audit log; Judge Mode seed data; SIMULATED adapter badge |
| Submission | Concept note; cost model; scaling note; short demo video; deck |

| Phase | Scope |
| --- | --- |
| **MVP (by 24 Oct)** | Above |
| **Phase 2 (Nov–Dec showcase)** | Offline PWA hardening; SMS for critical; verifier training module; repeat-failure review screen; report generation; Kannada/Hindi UI; risk-based sampling; second asset class (daytime hazards) |
| **Phase 3 (3–6 months)** | 5-ward expansion; contractor performance reports; adapters for a real municipal system if permitted; external audit; OCR for pole numbers |
| **National-scale version** | Multi-city configuration; state SOP templates; empanelled partners; open schema for interoperability; independent evaluation; legal frameworks per state |

---

## PART 44 — WHAT WE SHOULD NOT BUILD

| Feature | Why exclude |
| --- | --- |
| Blockchain / tokens | Adds complexity; a hash-chained log gives the needed tamper-evidence |
| AI auto-approval or AI scoring of repairs | Violates the principle that closure is human + rule-based |
| Social feed / comments wall | Invites conflict and moderation burden; use structured notes |
| Gamification, points, leaderboards for citizens | Encourages volume over accuracy and can incentivise false reports; use simple recognition |
| Public ranking of named officials | Triggers defensiveness; harms adoption |
| General-purpose chatbot | Not core; reliability and cost issues |
| Full asset-management / CMMS clone | Competes with existing systems; we are an overlay |
| Payments, billing, contractor invoicing | Out of scope; legal complexity |
| Native mobile apps | PWA suffices; saves weeks |
| IoT sensors, drones, CCTV integration | Cost, privacy, off-model |
| WhatsApp bot in the pilot | Policy/cost/complexity; use phone relay |
| Multi-city admin and billing | Premature |
| Complex predictive ML | Rule threshold is enough for now |
| Citizen-vs-citizen voting/upvote features | Popularity ≠ priority; severity rules decide |

---

## PART 45 — BRANDING

Guideline: government-appropriate, descriptive, neutral. Check domain and trademark conflicts before adopting \[A\].

| Option | Notes |
| --- | --- |
| **Civic Asset Accountability Network (CAAN)** | Working name; descriptive; recommended |
| Verified Closure Network | Highlights the core rule |
| Ward Assurance Network | Emphasises ward-level institution |
| Public Asset Verification Protocol | Sounds like a standard — good for SOP-style adoption |
| Closure Charter | Emphasises the governance document |

**Taglines:** "A fix isn't fixed until it's verified." · "Closing the loop on public assets." · "Every public asset, an owner and a standard."

**One-line pitch:** *A ward-level accountability model in which public-asset repairs are closed only after independent community verification.*

**Short description (≈ 50 words):** CAAN is a service-delivery model for urban local bodies. A trained, rotating panel of community verifiers independently confirms repairs to public assets; closure requires their confirmation. Each asset has a named owner and a service standard, and the ward publishes both claimed and verified closures.

**Long description (≈ 150 words):** Public assets like street lights fail repeatedly, and citizens often cannot tell who is responsible or whether a repair really happened. Existing platforms handle reporting, routing, tracking and deadlines. CAAN adds the missing governance layer: separate roles for reporter, repairer and verifier; a two-key closure rule; an asset passport with a named owner and service standard; a Jurisdiction Dispute state for contested responsibility; and a monthly review that turns repeat failures into root-cause action. A neutral convenor trains and rotates a community verification panel that reports into the ward committee. A light web platform records evidence, enforces the rules and publishes a claimed-vs-verified ledger; the same model can run on paper where digital infrastructure is weak. The pilot measures how often "closed" really means "fixed".

---

## PART 46 — COMPLETE UX DESIGN SYSTEM

**Feel \[P\]:** calm, factual, institutional-but-friendly. No neon, gradients or gamified elements.

| Element | Spec |
| --- | --- |
| Visual language | Flat surfaces, 8-px grid, generous whitespace, thin dividers, evidence photos as the hero element, icons paired with text |
| Typography | Noto Sans (covers Latin, Kannada and Devanagari scripts) with system-font fallback; base 16 px; scale 14/16/20/24/32; line-height 1.5; no all-caps for long text |
| Colour (proposed; verify contrast ≥ 4.5:1 with a checker) | Primary deep blue `#1F3A5F`; secondary teal `#0F766E`; neutrals `#111827` text, `#F5F7FA` background, `#D1D5DB` borders |
| Status colours + icons | Submitted: grey · Under verification: blue · Verified: teal · Assigned/In progress: indigo · **Repair Claimed: amber ("not yet confirmed")** · Awaiting independent check: amber outline · **Verified Closed: green + check** · Closed-Unverified: grey with dashed outline · Reopened: orange/red · Escalated: purple flag. Always icon + text, never colour alone |
| Cards | Issue card = asset thumbnail, status chip, due time, owner; max 3 actions |
| Tables | Sticky header, sortable, row density toggle, responsive collapse to cards |
| Maps | Neutral basemap, condition markers with shapes, list view alternative, legend always visible |
| Buttons | Primary (filled), secondary (outline), destructive (red, confirm dialog); min height 44–48 px |
| Forms | One question per screen on mobile for reporting; inline validation; helpful examples; draft autosave |
| Alerts | Info/success/warning/error with icon; persistent for blocking errors; toast only for confirmations |
| Accessibility | WCAG 2.1 AA target; focus rings; skip links; ARIA labels; reduced-motion; 200% zoom; keyboard-only operable; captions |
| Content tone | Plain, non-accusatory ("verification did not pass" not "contractor failed") |
| Government readiness \[B/A\] | Follow Indian government web guidelines (GIGW) where applicable — compliance **not claimed**, to be checked |

---

## PART 47 — PRODUCT REQUIREMENTS DOCUMENT

**Product vision.** A lightweight, interoperable accountability layer that makes independent verification of public-asset repairs routine at ward level.

**Goals.** G1 Enforce two-key closure. G2 Make ownership explicit per asset. G3 Provide trustworthy evidence with minimal friction. G4 Publish claimed-vs-verified outcomes. G5 Surface repeat failures for root-cause action. G6 Work with or without good digital infrastructure.

**Non-goals.** Replace municipal grievance or asset systems; certify engineering safety; rank individuals; automate decisions with AI; run payments; support all asset classes at once.

**Personas.** *Asha* (resident, mid-30s, mid-range Android, Kannada-first); *Ravi* (verifier, college student/retiree, 3–4 hrs a week); *Meera* (ward engineer, overloaded, wants fewer repeat calls); *Imran* (contractor crew lead, low-bandwidth, fears unfair blame); *Latha* (panel coordinator, NGO staff); *Dev* (auditor).

### 47.1 Functional requirements (MVP unless noted)

| ID | Requirement | Acceptance criterion |
| --- | --- | --- |
| FR-001 | Users can register/login via phone OTP; officers/admins via email+MFA | OTP login works; MFA enforced for officer/admin |
| FR-002 | Role-based access across the 12 roles with ward scope | A user cannot access data outside role/scope (tested) |
| FR-003 | Asset registry with category, location, responsible organisation | Asset CRUD (admin/coordinator); public code unique |
| FR-004 | Bulk asset import via CSV | Invalid rows reported; valid committed |
| FR-005 | Accountability Map: asset class/area → responsible entity | Viewable publicly; edit logged |
| FR-006 | Report an issue against an asset with photo, GPS, time | Submission blocked without required evidence unless assisted |
| FR-007 | Assisted reporting by desk operator | Attestation recorded; flagged "assisted" |
| FR-008 | Duplicate detection and merge | Same asset+fault merged; reporters retained |
| FR-009 | Report verification by independent verifier | Verifier ≠ reporter enforced |
| FR-010 | Severity assignment with SLA mapping | SLA due time computed from proposed table |
| FR-011 | Assignment to responsible org/user | Named owner stored; dispute state available |
| FR-012 | Acceptance with committed window | Time stamped |
| FR-013 | Contractor/field repair claim with before/after evidence and cause code | Claim blocked without evidence/cause code |
| FR-014 | Independent verification of repair with checklist | Pass/Fail/Partial recorded with evidence |
| FR-015 | Two verifiers for high-risk assets | Closure requires two passes |
| FR-016 | Closure only on verification pass | Direct close by any role impossible (tested) |
| FR-017 | Reopen on fail or upheld dispute; same issue | Passport failure count increments |
| FR-018 | Verification Lapsed → Closed-Unverified flow | Reported separately in all counts |
| FR-019 | SLA clocks with warnings and breach escalation | Warnings at 50/80%; breach escalates |
| FR-020 | Escalation ladder per department | Next owner notified |
| FR-021 | Conflict-of-interest declaration and auto-exclusion | Excluded verifier cannot accept the task |
| FR-022 | Evidence integrity: hash, EXIF check, duplicate hash flag | Duplicate flagged for review |
| FR-023 | Immutable hash-chained audit log | Chain verification passes; no update/delete |
| FR-024 | Asset passport page | All Part 20 fields shown |
| FR-025 | Public map and asset pages with privacy tiers | Sensitive assets show approximate location |
| FR-026 | Public dashboard with claimed vs verified | Both numbers and gap displayed |
| FR-027 | Officer dashboard (verified inbox, SLA, escalations) | Panels per Part 22 |
| FR-028 | Verifier management and training gate | Cannot receive tasks before training pass |
| FR-029 | Notifications (in-app, email; SMS for critical) | Events per Part 36 |
| FR-030 | Reports (monthly/quarterly) as PDF/CSV | Generated and archived |
| FR-031 | Rule configuration with versioning and two-person approval | Draft → approved → effective |
| FR-032 | Simulated integration adapters with visible badge | Badge appears wherever used |
| FR-033 | Offline capture and sync (PWA) | Evidence queued offline and uploaded later with original capture time |
| FR-034 | Multilingual UI (English, Kannada, Hindi) — *Phase 2 for Hindi* | Language switch persists |
| FR-035 | Paper-packet generator with QR | PDF printable; results uploadable |
| FR-036 | Repeat-failure review trigger and memo | ≥3 in 90 days opens review |
| FR-037 | Citizen confirm/dispute of outcome | Dispute routed to a verifier within 72 h |
| FR-038 | Data export (CSV/GeoJSON) without personal data | Public export verified for PII absence |
| FR-039 | Account deletion/data export for users | Request fulfilled per retention policy |
| FR-040 | Feedback channel about the platform itself | Form + admin queue |

### 47.2 Non-functional requirements

| ID | Requirement |
| --- | --- |
| NFR-001 | Report submission works on 3G-class connections; page weight ≤ \~1 MB initial \[A\] |
| NFR-002 | Images compressed client-side to ≤ \~500 KB \[A\] before upload |
| NFR-003 | Core flows usable offline with queued sync |
| NFR-004 | WCAG 2.1 AA conformance target; screen-reader tested on key flows |
| NFR-005 | Availability target 99% during pilot \[A\]; recorded demo as fallback |
| NFR-006 | All data encrypted in transit and at rest |
| NFR-007 | Role/scope enforced at the database layer |
| NFR-008 | Audit log tamper-evident; verification tool available |
| NFR-009 | Pilot scale: ≥ 500 assets, 50 concurrent users; design headroom to 10× |
| NFR-010 | Median API response < 500 ms for common reads \[A\] |
| NFR-011 | Backups daily; restore tested once before submission |
| NFR-012 | Public pages contain no personal data |
| NFR-013 | Localisation without code changes |
| NFR-014 | Browser support: current Chrome/Edge/Firefox/Safari + Android WebView |
| NFR-015 | Open-source codebase with documented schema and rules |
| NFR-016 | Observability: error logging and basic metrics |

**Dependencies.** Coordinator registration; ward-engineer contact; pilot area access; verifier recruitment; map tiles; email/SMS provider; legal read on data handling. **Risks:** Part 42. **Metrics:** Part 29.

---

## PART 48 — USER STORIES (90)

Format: story → **AC** (acceptance criteria).

### 48.1 Citizen (20)

| ID | Story and acceptance criteria |
| --- | --- |
| C-01 | As a citizen I want to report a faulty asset in three steps so that it gets verified. **AC:** photo + location + category captured; confirmation with ID shown |
| C-02 | I want to find the asset by map, QR or pole number so that I report the right one. **AC:** all three methods work; wrong-asset warning if far from GPS |
| C-03 | I want to see who is responsible for an asset so that I know where to escalate. **AC:** owner and basis displayed on asset page |
| C-04 | I want to save a draft offline so that poor network doesn't lose my report. **AC:** draft persists and syncs |
| C-05 | I want to use my language so that I understand. **AC:** Kannada/English switch persists |
| C-06 | I want updates when my report changes so that I'm not in the dark. **AC:** in-app + email events per Part 36 |
| C-07 | I want to see the timeline so that I know what happened. **AC:** all states with times and role names |
| C-08 | I want to confirm or dispute a fix so that my view counts. **AC:** dispute routed to verifier within 72 h |
| C-09 | I want my identity hidden from contractors so that I'm safe. **AC:** contractor views omit reporter data |
| C-10 | I want to report without a smartphone via a desk so that I'm not excluded. **AC:** assisted report creates a flagged record |
| C-11 | I want duplicates merged so that I'm not told "already reported" with no link. **AC:** I'm added as supporter and see the master issue |
| C-12 | I want to see public ward performance so that I can judge fairly. **AC:** dashboard shows claimed vs verified with denominators |
| C-13 | I want to browse assets near me so that I understand local conditions. **AC:** list and map views |
| C-14 | I want to flag a hazard as critical so that urgent cases move fast. **AC:** critical path triggers duty alert; confirmation shown |
| C-15 | I want to delete my account so that I control my data. **AC:** deletion/export request processed |
| C-16 | I want clear reasons when a report is unconfirmed so that I can improve. **AC:** reason code and tip shown |
| C-17 | I want to know expected timelines so that expectations are realistic. **AC:** SLA due shown and labelled proposed/adopted |
| C-18 | I want large text and high contrast so that I can read. **AC:** supports 200% zoom, AA contrast |
| C-19 | I want to download a report for RWA use so that I can share. **AC:** PDF/CSV export without PII |
| C-20 | I want to volunteer as a verifier so that I can contribute. **AC:** application form leads to training |

### 48.2 Community verifier (20)

| ID | Story and acceptance criteria |
| --- | --- |
| V-01 | As a verifier I want nearby tasks so that I can verify conveniently. **AC:** sorted by distance and due time |
| V-02 | I want a checklist so that I verify consistently. **AC:** checklist per service standard |
| V-03 | I want conflict-of-interest screening so that I stay neutral. **AC:** declaration per task; excluded if conflict |
| V-04 | I want in-app evidence capture so that my proof is credible. **AC:** time/location stamped; gallery flagged |
| V-05 | I want to work offline so that poor signal doesn't block me. **AC:** results queued with capture times |
| V-06 | I want to see the original report and repair claim so that I know what to check. **AC:** both visible |
| V-07 | I want to fail a repair with a reason so that rework is specific. **AC:** failing item required |
| V-08 | I want a safety guide so that I stay safe. **AC:** displayed before first task and on request |
| V-09 | I want my identity hidden publicly so that I'm protected. **AC:** public views show role only |
| V-10 | I want not to verify the same asset consecutively so that rotation is fair. **AC:** system blocks it |
| V-11 | I want to decline a task without penalty so that I can manage time. **AC:** decline reason optional |
| V-12 | I want training and a certificate so that I'm credible. **AC:** quiz, certificate, expiry reminder |
| V-13 | I want a history of my verifications so that I can reflect. **AC:** list with outcomes |
| V-14 | I want to flag suspicious evidence so that integrity is kept. **AC:** flag reaches coordinator |
| V-15 | I want to report harassment so that I'm supported. **AC:** incident form; coordinator notified |
| V-16 | I want a paper packet when offline so that I can still work. **AC:** printable with QR |
| V-17 | I want to request a second verifier on a hard case so that decisions are robust. **AC:** coordinator assigns |
| V-18 | I want to see monthly review outcomes so that my work matters. **AC:** monthly summary |
| V-19 | I want task reminders so that I meet windows. **AC:** configurable |
| V-20 | I want my reimbursement (if any) recorded so that it is transparent. **AC:** log of expense claims |

### 48.3 Municipal officer (20)

| ID | Story and acceptance criteria |
| --- | --- |
| O-01 | As an officer I want verified issues only in my inbox so that I don't triage noise. **AC:** inbox excludes Unconfirmed/Duplicates |
| O-02 | I want suggested owners from the Accountability Map so that I assign fast. **AC:** suggestion with basis |
| O-03 | I want to flag a jurisdiction dispute so that others share the load. **AC:** state set; liaison notified |
| O-04 | I want SLA forecasts so that I prevent breaches. **AC:** risk list for next 24 h |
| O-05 | I want auto-escalation so that stalls surface. **AC:** next owner notified |
| O-06 | I want contractor first-time-fix stats so that I manage vendors. **AC:** report per contractor |
| O-07 | I want to see repeat-failure assets so that I fix causes. **AC:** list with cause codes |
| O-08 | I want to add context to a record so that fairness is preserved. **AC:** officer note visible |
| O-09 | I want to countersign closures so that my accountability is recorded. **AC:** optional step logged |
| O-10 | I want a daily digest so that I plan the day. **AC:** email at set time |
| O-11 | I want evidence at a glance so that I don't revisit sites. **AC:** thumbnails and checklist |
| O-12 | I want to reassign tasks so that workloads balance. **AC:** history kept |
| O-13 | I want to propose a severity change with reason so that classification is right. **AC:** reason required |
| O-14 | I want to see verifier disagreements so that I can intervene. **AC:** list |
| O-15 | I want monthly reports for my superiors so that I can show progress. **AC:** PDF with methodology |
| O-16 | I want to record repair cost so that I can compare repeat vs permanent fixes. **AC:** optional cost field |
| O-17 | I want to contest a verification outcome so that errors are corrected. **AC:** request third check |
| O-18 | I want ward committee agenda packs so that I can present. **AC:** auto-generated |
| O-19 | I want to export CSV for my own system so that I avoid double entry. **AC:** export without PII |
| O-20 | I want to see integration status so that I know what's simulated. **AC:** badge and logs |

### 48.4 Contractor (15)

| ID | Story and acceptance criteria |
| --- | --- |
| K-01 | As a contractor I want a clear task list so that I plan crews. **AC:** due times, location, fault |
| K-02 | I want to accept or decline with reason so that assignments are fair. **AC:** reason mandatory on decline |
| K-03 | I want to schedule a window so that residents and verifiers know. **AC:** window saved |
| K-04 | I want to upload before/after evidence offline so that site conditions don't block me. **AC:** queued upload |
| K-05 | I want to record cause codes so that upstream faults aren't blamed on me. **AC:** code required |
| K-06 | I want to claim completion so that verification starts. **AC:** claim creates verification task |
| K-07 | I want to dispute a fail with evidence so that I'm treated fairly. **AC:** one dispute per fail |
| K-08 | I want a record of passes so that my performance is fair. **AC:** monthly summary includes passes |
| K-09 | I want to hand off an upstream fault so that the right party acts. **AC:** hand-off with named party |
| K-10 | I want notifications for reopen so that I respond promptly. **AC:** in-app + SMS |
| K-11 | I want to see the standard I'm judged on so that I comply. **AC:** checklist visible |
| K-12 | I want not to see reporter identity so that I'm not tempted to retaliate. **AC:** hidden |
| K-13 | I want worker accounts so that each person is accountable. **AC:** sub-accounts |
| K-14 | I want to request more time with a reason so that real delays are recorded. **AC:** officer approval, time-limited |
| K-15 | I want to export my own records so that I can reconcile billing. **AC:** CSV |

### 48.5 Admin (15)

| ID | Story and acceptance criteria |
| --- | --- |
| A-01 | As an admin I want to manage users and roles so that access is correct. **AC:** invite, suspend, change roles with logs |
| A-02 | I want to configure asset categories and checklists so that new classes can be added. **AC:** versioned |
| A-03 | I want to define SLAs and rules with approval so that changes are controlled. **AC:** two-person approval |
| A-04 | I want to see audit logs so that I can investigate. **AC:** search and export |
| A-05 | I want to verify audit-chain integrity so that tampering is detected. **AC:** one-click check |
| A-06 | I want to manage wards and boundaries so that scope is right. **AC:** polygons importable |
| A-07 | I want to manage the verifier roster so that rotation works. **AC:** quotas visible |
| A-08 | I want to onboard departments and escalation ladders so that routing is accurate. **AC:** ladder validated |
| A-09 | I want to run the simulated adapter so that demos work. **AC:** sample payloads |
| A-10 | I want to publish reports so that the public sees updates. **AC:** review then publish |
| A-11 | I want to moderate flagged content so that abuse is handled. **AC:** queue and actions |
| A-12 | I want to export public data so that others can analyse. **AC:** PII-free CSV/GeoJSON |
| A-13 | I want to set data retention so that policy is enforced. **AC:** scheduled jobs |
| A-14 | I want backup/restore controls so that data is safe. **AC:** documented test |
| A-15 | I want a health dashboard so that I notice problems. **AC:** errors, queue lengths, failed notifications |

---

## PART 49 — API BLUEPRINT

**Design \[P\]:** REST over HTTPS, versioned `/api/v1`. With Supabase, reads use auto-generated REST under RLS; **state-changing actions are database RPC functions** (so rules cannot be bypassed). Authentication: JWT bearer (Supabase Auth). Authorization: role + ward scope via RLS and RPC checks. Resource names are issue-centric rather than copying generic CRUD.

| Method & path | Roles | Purpose | Key validation |
| --- | --- | --- | --- |
| `GET /assets?ward=&category=&bbox=` | Public (approx.), roles (exact) | List assets | bbox size limit; privacy tier applied |
| `GET /assets/{id}` | Public/roles | Asset passport | — |
| `POST /assets/import` | Coordinator, Admin | CSV import | schema, geometry validity |
| `GET /accountability-map?ward=` | Public | Owners by class/area | — |
| `POST /issues` | Citizen, VCO, Field, Desk | Create report | asset exists; evidence present (or assisted flag); duplicate check |
| `GET /issues?status=&asset=&mine=` | Roles by scope | List | scope-filtered |
| `GET /issues/{id}` | Roles by scope | Detail + timeline | PII filtering by role |
| `POST /issues/{id}/evidence` | Participants | Add evidence | file type/size; hash; capture meta |
| `POST /issues/{id}/verifications` (type=report) | VCO, Coordinator, Officer | Verify/reject report | verifier ≠ reporter; COI |
| `POST /issues/{id}/assignments` | Officer, Ward admin | Assign owner | owner is valid org; map reference |
| `POST /issues/{id}/assignments/{aid}/accept` | Dept, Contractor | Accept + commit | window in future |
| `POST /issues/{id}/jurisdiction-dispute` | Assignee, Officer | Flag dispute | reason + proposed owner |
| `POST /issues/{id}/repair-claims` | Contractor, Dept, Field | Claim repair | before/after evidence, cause code |
| `POST /issues/{id}/verifications` (type=repair) | VCO, Coordinator, Auditor | Independent verification | verifier ≠ reporter/repairer; COI; checklist complete |
| `POST /issues/{id}/close` | System only (called by trigger) | Closure | gate rule R02 (no direct client call) |
| `POST /issues/{id}/reopen` | VCO, Coordinator, Officer, Auditor | Reopen | new evidence required |
| `POST /issues/{id}/disputes` | Citizen, Contractor | Dispute outcome | one per outcome |
| `POST /issues/{id}/closed-unverified` | Coordinator, Ward admin | Lapse closure | written reason |
| `GET /verifications/queue` | VCO | Tasks | COI-filtered |
| `POST /conflict-declarations` | VCO | Declare | — |
| `GET /sla/board?ward=` | Officer, Ward admin | SLA clocks | scope |
| `GET /escalations` / `POST /escalations/{id}/ack` | Officer, Admin | Manage | — |
| `GET /reviews/repeat-failures` / `POST /reviews/{id}/memo` | Officer, Coordinator | Root-cause | threshold |
| `GET /public/ledger?ward=&period=` | Public | Claimed vs verified | aggregated, PII-free |
| `GET /reports` / `POST /reports/generate` | Roles | Reports | template, period |
| `GET /audit?entity=` | Auditor, Admin | Audit events | pagination; hash check endpoint `GET /audit/verify` |
| `POST /rules/drafts`, `POST /rules/{id}/approve` | Admin | Rule versions | two distinct approvers |
| `POST /integrations/{system}/sync` | Admin | Adapter run | `mode` returned (simulated/live) |
| `POST /notifications/preferences` | All | Preferences | — |

**Example request — create issue**

```json
POST /api/v1/issues
{
  "asset_id": "c1b2…",
  "fault_type": "lamp_out",
  "description": "Not lit since Tuesday night",
  "evidence": [{
    "storage_path": "issues/tmp/9f3.jpg",
    "sha256": "ab12…",
    "captured_at": "2026-10-07T19:42:10+05:30",
    "lat": 12.9716, "lng": 77.5946, "accuracy_m": 8,
    "capture_mode": "in_app"
  }]
}
```

**Response (201)**

```json
{ "id": "7d1e…", "status": "under_verification",
  "severity": "medium", "verification_due_at": "2026-10-10T19:42:10+05:30",
  "duplicate_of": null, "asset_owner": {"org": "Ward Electrical Cell", "basis": "Accountability Map v1"} }
```

**Errors (uniform):** `{"error":{"code":"RULE_R11","message":"Verifier cannot be the reporter","details":{}}}` — codes: `VALIDATION`, `FORBIDDEN`, `NOT_FOUND`, `CONFLICT`, `RULE_Rxx`, `RATE_LIMITED`.

---

## PART 50 — DATABASE SCHEMA (PostgreSQL / Supabase, abridged)

```sql
create extension if not exists postgis;
create extension if not exists pgcrypto;

create type app_role as enum ('citizen','vco','coordinator','municipal_officer','dept_officer',
  'contractor','field_worker','ward_admin','auditor','ngo','super_admin');
create type severity as enum ('critical','high','medium','low');
create type issue_status as enum ('draft','submitted','under_verification','verified','unconfirmed',
  'duplicate','assigned','jurisdiction_dispute','accepted','in_progress','repair_claimed',
  'awaiting_verification','verified_closed','reopened','verification_lapsed','closed_unverified');

create table wards (
  id uuid primary key default gen_random_uuid(),
  code text unique not null, name text not null,
  geom geometry(MultiPolygon,4326) not null);
create index wards_geom_gix on wards using gist(geom);

create table organisations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  type text not null check (type in ('ulb','department','contractor','ngo','college','rwa')),
  unique (name, type));

create table profiles (
  id uuid primary key references auth.users on delete cascade,
  org_id uuid references organisations, display_name text,
  phone text unique, language text not null default 'en',
  consent_at timestamptz, created_at timestamptz not null default now());

create table user_roles (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references profiles on delete cascade,
  role app_role not null, ward_id uuid references wards,
  unique (user_id, role, ward_id));

create table asset_categories (
  id uuid primary key default gen_random_uuid(),
  code text unique not null, name text not null,
  risk_class text not null check (risk_class in ('high','medium','low')),
  checklist jsonb not null, service_standard jsonb not null, version int not null default 1);

create table assets (
  id uuid primary key default gen_random_uuid(),
  public_code text unique not null,
  category_id uuid not null references asset_categories,
  ward_id uuid not null references wards,
  geom geometry(Point,4326) not null,
  location_tier text not null default 'exact' check (location_tier in ('exact','approx','hidden')),
  responsible_org_id uuid references organisations,
  owner_basis text,                        -- where the ownership claim comes from
  status text not null default 'active');
create index assets_geom_gix on assets using gist(geom);
create index assets_ward_idx on assets(ward_id, category_id);

create table issues (
  id uuid primary key default gen_random_uuid(),
  asset_id uuid not null references assets,
  fault_type text not null, severity severity not null default 'medium',
  status issue_status not null default 'submitted',
  reporter_id uuid not null references profiles,
  duplicate_of uuid references issues,
  cause_code text,
  opened_at timestamptz not null default now(),
  verified_at timestamptz, claimed_at timestamptz, closed_at timestamptz,
  closure_kind text check (closure_kind in ('verified','unverified')),
  sla_due_at timestamptz);
create unique index one_open_issue_per_asset_fault on issues(asset_id, fault_type)
  where status not in ('verified_closed','closed_unverified','unconfirmed','duplicate');
create index issues_status_idx on issues(status, severity, sla_due_at);

create table issue_evidence (
  id uuid primary key default gen_random_uuid(),
  issue_id uuid not null references issues on delete restrict,
  uploader_id uuid not null references profiles,
  kind text not null check (kind in ('photo','video','audio','doc')),
  storage_path text not null, sha256 text not null,
  captured_at timestamptz not null, lat double precision, lng double precision, accuracy_m real,
  capture_mode text not null check (capture_mode in ('in_app','gallery','assisted')),
  created_at timestamptz not null default now(),
  unique (issue_id, sha256));

create table assignments (
  id uuid primary key default gen_random_uuid(),
  issue_id uuid not null references issues,
  assignee_org_id uuid not null references organisations,
  assignee_user_id uuid references profiles,
  accepted_at timestamptz, planned_for tstzrange, claimed_at timestamptz,
  cause_code text, created_at timestamptz not null default now());

create table verifications (
  id uuid primary key default gen_random_uuid(),
  issue_id uuid not null references issues,
  type text not null check (type in ('report','repair')),
  verifier_id uuid not null references profiles,
  outcome text not null check (outcome in ('pass','fail','partial','unable')),
  checklist jsonb not null, coi_declared boolean not null default false,
  created_at timestamptz not null default now());

-- R11: verifier cannot be the reporter or the repairer
create or replace function enforce_verifier_separation() returns trigger
language plpgsql as $$
begin
  if exists (select 1 from issues i where i.id = new.issue_id and i.reporter_id = new.verifier_id) then
    raise exception 'RULE_R11: verifier cannot be the reporter';
  end if;
  if exists (select 1 from assignments a where a.issue_id = new.issue_id
             and a.assignee_user_id = new.verifier_id) then
    raise exception 'RULE_R11: verifier cannot be the repairer';
  end if;
  return new;
end $$;
create trigger trg_verifier_separation before insert on verifications
  for each row execute function enforce_verifier_separation();

-- R02/R12: closure gate (one passing repair verification; two distinct verifiers if high risk)
create or replace function enforce_closure_gate() returns trigger
language plpgsql as $$
declare need int; have int;
begin
  if new.status = 'verified_closed' and old.status is distinct from 'verified_closed' then
    select case when c.risk_class = 'high' then 2 else 1 end into need
      from assets a join asset_categories c on c.id = a.category_id where a.id = new.asset_id;
    select count(distinct verifier_id) into have from verifications
      where issue_id = new.id and type = 'repair' and outcome = 'pass';
    if have < need then raise exception 'RULE_R02: closure requires % independent pass(es)', need; end if;
  end if;
  return new;
end $$;
create trigger trg_closure_gate before update on issues
  for each row execute function enforce_closure_gate();

create table audit_events (
  id bigint generated always as identity primary key,
  actor_id uuid, actor_role text, action text not null,
  entity_type text not null, entity_id uuid,
  before jsonb, after jsonb, at timestamptz not null default now(),
  prev_hash text, hash text);
create or replace function audit_chain() returns trigger language plpgsql as $$
declare p text;
begin
  perform pg_advisory_xact_lock(424242);               -- serialise to keep the chain linear
  select hash into p from audit_events order by id desc limit 1;
  new.prev_hash := p;
  new.hash := encode(digest(coalesce(p,'') || new.action || new.entity_type ||
     coalesce(new.entity_id::text,'') || coalesce(new.after::text,'') || new.at::text, 'sha256'), 'hex');
  return new;
end $$;
create trigger trg_audit_chain before insert on audit_events
  for each row execute function audit_chain();
revoke update, delete on audit_events from public, anon, authenticated;

-- RLS (illustrative)
alter table issues enable row level security;
create policy issues_reporter_read on issues for select using (reporter_id = auth.uid());
create policy issues_ward_read on issues for select using (
  exists (select 1 from user_roles r join assets a on a.ward_id = r.ward_id
          where r.user_id = auth.uid() and a.id = issues.asset_id
          and r.role in ('vco','coordinator','municipal_officer','dept_officer','ward_admin','auditor')));
-- writes only through SECURITY DEFINER RPCs that call the rule checks above
```

**Also needed (not shown):** `rule_versions`, `escalations`, `notifications`, `community_boards`, `community_observers`, `conflict_declarations`, `inspections`, `maintenance_events`, `public_reports`, `feedback`, `impact_metrics`, `funding_sources`, `integration_links`; public views (`public_ledger`, `public_assets`) that strip PII and apply location tiers. Note: \[A\] verify triggers and policies in a test suite — especially RLS, which is easy to get subtly wrong.

---

## PART 51 — FOLDER / CODE ARCHITECTURE

```
caan/
├ apps/web/                      # React + TS + Vite PWA
│  ├ src/
│  │  ├ app/                  # routes, layouts, providers, guards
│  │  ├ features/
│  │  │  ├ issues/            # report, timeline, my reports
│  │  │  ├ verification/      # queue, checklist, conflict declaration
│  │  │  ├ assignment/        # officer assign, dispute
│  │  │  ├ repair/            # contractor/field tasks
│  │  │  ├ assets/            # map, passport
│  │  │  ├ dashboards/        # public, ward, officer
│  │  │  ├ panel/             # verifier management, training
│  │  │  ├ admin/             # rules, SLAs, users, audit
│  │  │  └ reports/
│  │  ├ components/ui/         # design-system primitives (status chip, evidence card)
│  │  ├ lib/                  # supabase client, i18n, geo, offline queue, evidence capture
│  │  ├ services/             # typed RPC wrappers
│  │  ├ hooks/  types/  locales/ (en, kn, hi)
│  │  └ workers/              # service worker, image compression
│  └ e2e/                      # Playwright tests (role separation, closure gate)
├ supabase/
│  ├ migrations/              # schema, triggers, RLS
│  ├ functions/               # edge functions: notify, sla-tick, evidence-check, ai-precheck
│  ├ seed/                    # judge-mode demo data (flagged DEMO)
│  └ tests/                    # pgTAP/SQL tests for rules R01–R45
├ workflows/n8n/               # exported workflows (optional)
├ adapters/simulated/          # SIMULATED UPYOG/Sahaaya payloads
├ docs/                        # charter/, sop/, rules/, field-research/, pilot/
└ README.md
```

**Principle:** every governance rule has a SQL test; the UI never contains the only copy of a rule.

---

## PART 52 — DEVELOPMENT ROADMAP (2 Oct → 24 Oct 2026)

**Priority order \[P\]:** validate the problem → collect pilot evidence → minimum prototype → submission. Do not polish UI before the field work is moving. **Plan to submit by 23 Oct; treat 24 Oct as buffer.** Check your exam/festival calendar and adjust.

| Day | Date | Focus | Output | Cut line if behind |
| --- | --- | --- | --- | --- |
| 1 | Fri 2 Oct | Brief CMR coordinator; start institution registration; originality scan; TerraTrust code audit (2 h); pick candidate pilot area | Coordinator confirmed; registration started; scan notes | Registration is non-negotiable |
| 2 | Sat 3 Oct | Field recon in candidate area; check pole numbering; test the official complaint channel; 3–4 interviews; recruit RWA/NGO contact | Recon notes; area chosen | — |
| 3 | Sun 4 Oct | Asset census (daytime) — first half; interviews; request residents' closed tickets (Sweep) | 30–50 assets recorded | Reduce to 60 assets |
| 4 | Mon 5 Oct | Census finish; Accountability Map v0; recruit 8–10 verifiers; DB schema + auth | 60–100 assets; roster; schema | — |
| 5 | Tue 6 Oct | Baseline night check (pairs); report flow build | Baseline functional rate v0 | — |
| 6 | Wed 7 Oct | Baseline night check 2; log genuine faults via official channel; verification flow build | Fault IDs and timestamps | — |
| 7 | Thu 8 Oct | Verifier training #1; Sweep verification at night; **scope freeze** | Trained verifiers; Sweep data v0 | Drop Hindi/SMS |
| 8 | Fri 9 Oct | Sweep continues; rule triggers + audit log; Service Charter draft | Charter v0 | — |
| 9 | Sat 10 Oct | Meet ward engineer/official (courtesy + feedback on Charter); officer dashboard | Notes/letter attempt | If no meeting, use RWA letter |
| 10 | Sun 11 Oct | Official status check (day 3–5 on faults); contractor flow; offline capture | Status log | — |
| 11 | Mon 12 Oct | Public ledger; seed Judge Mode data; interviews wrap (target 15–25) | Dashboard | Use 1 chart only |
| 12 | Tue 13 Oct | Verify any claimed closures; cost log; evidence folder structure | Verification records | — |
| 13 | Wed 14 Oct | Usability test with 3 people; fix; deck skeleton | Fix list | — |
| 14 | Thu 15 Oct | Day-7 status check; metrics v1 | Metrics v1 | — |
| 15 | Fri 16 Oct | Concept note draft; cost and scale notes; adoption pathway text | Draft v1 | — |
| 16 | Sat 17 Oct | Day-14 status check; verify; rehearsal 1 | Updated metrics | — |
| 17 | Sun 18 Oct | Record demo video v1; offline demo build | Video v1 | — |
| 18 | Mon 19 Oct | Endline night check; resident short survey | Endline data | — |
| 19 | Tue 20 Oct | Analysis; 2–3-page pilot report; charts | Pilot report | — |
| 20 | Wed 21 Oct | Finalise deck; Q&A rehearsal with a mentor | Deck v2 | — |
| 21 | Thu 22 Oct | Coordinator review; fixes; backup copies | Submission package | — |
| 22 | Fri 23 Oct | **Submit** via coordinator; confirm receipt | Submission receipt | — |
| 23 | Sat 24 Oct | Buffer / deadline | — | — |

&#91;F\] Screening begins 25 October and the exhibition/finale window is 30 Nov – 15 Dec (indicative) — continue the pilot after submission so you have more data for later stages.

---

## PART 53 — PILOT EVIDENCE PACKAGE (CHECKLIST)

| ☐ | Evidence | Detail |
| --- | --- | --- |
| ☐ | Asset census | Asset ID, photo, GPS, pole number, responsible entity guess; CSV + folder |
| ☐ | Baseline night check | Per-lamp lit/unlit/flicker with timestamp and observer |
| ☐ | Closed-Ticket Sweep | For each ticket: reporter's account (consented), official status, date closed, our verification result, photo, n stated |
| ☐ | Fault log | Fault ID in official channel, filing time, channel, status at day 3/7/14 |
| ☐ | Verification records | Verifier ID (coded), time, checklist, outcome, evidence |
| ☐ | Before/after pairs | For every verified repair |
| ☐ | Timeline extract | Issue timestamps (report, claim, verification, close) |
| ☐ | Interviews | 15–25 summaries with consent; quotes only with permission |
| ☐ | Survey | Baseline and endline; response counts |
| ☐ | Accountability Map | Version, sources, unresolved cases |
| ☐ | Cost log | Hours, travel, printing, data, hosting; value-of-time assumption stated |
| ☐ | SLA performance | Proposed SLAs vs actuals (label proposed) |
| ☐ | Repeat-failure data | Any asset with 2+ faults in the period |
| ☐ | Stakeholder note | Ward engineer/RWA/NGO acknowledgement (described accurately) |
| ☐ | Feedback | Verifier and resident feedback forms |
| ☐ | Limitations note | Sample size, duration, selection bias, what you did not measure |
| ☐ | Video/photo set | 60-second field clip (no faces), screenshots |

**Data hygiene:** one master spreadsheet with a data dictionary; raw files untouched; analysis in a copy; every number in the deck traceable to a row.

---

## PART 54 — COMPETITION SUBMISSION PACKAGE

&#91;F\] The portal asks for "a short, structured concept with supporting material where available." Exact fields and limits are not published on the pages reviewed — **check the live submission form once the portal opens** and map these assets to it.

| Material | Content | Length target |
| --- | --- | --- |
| Concept note | Problem, gap, model, pilot, results, cost, scale | 1–2 pages |
| Problem statement | Primary statement + first-hand evidence | ½ page |
| Solution description | Nine-step model + two-key closure | 1 page |
| Governance model | Panel, roles, rules (R01–R45 highlights), Service Charter | 1–2 pages |
| Prototype | Link/screenshots; Judge Mode credentials | — |
| Pilot evidence | Evidence summary with limitations | 2–3 pages |
| Cost model | Part 26 ranges + unit cost | 1 page |
| Impact | KPIs and baseline results | 1 page |
| Scalability | Ladder + adoption pathway | 1 page |
| Architecture | One diagram + interoperability note | 1 page |
| Demo video | 3–5 min, paper-first | ≤ 5 min |
| Presentation | 10–12 slides (Part 55) | — |
| Supporting docs | Charter, SOP, consent forms, interview guide, support note | Appendix |

---

## PART 55 — PITCH DECK (12 SLIDES)

| # | Title | Purpose | Content | Visual / data | Speaker notes |
| --- | --- | --- | --- | --- | --- |
| 1 | A fix isn't fixed until it's verified | Hook | One image: a closed ticket and a dark street | Your own pilot photo | Start with the street, not the software |
| 2 | The problem | Problem clarity | Who suffers; citizen account; closure admission (Sahaaya, 2019) | Photo + one cited quote | State what you saw first-hand |
| 3 | What already exists | Honesty | UPYOG PGR, Sahaaya, Swachhata: what they do well | Comparison table (Part 40) | "We build on these, not against them" |
| 4 | The gap | Originality | Closure rests with the measured party; ticket ≠ asset | Flow with the gap highlighted | One sentence: independent closure authority |
| 5 | The model | Core idea | Nine steps; two-key closure; roles | Diagram | 60 seconds |
| 6 | The institution | Track B anchor | Ward Verification Panel, eligibility, rotation, escalation | Org chart | Emphasise safeguards |
| 7 | The enabling platform | Feasibility | Evidence capture, rule engine, ledger; paper fallback | 2–3 screens + paper form | "Optional accelerator" |
| 8 | The pilot | Demonstrated feasibility | Area, asset count, design, ethics | Map of the pilot area | Be precise about scope |
| 9 | What we found | Evidence | False-closure rate (n), time gaps, ownership ambiguity cases, repeat failures | Claimed vs verified chart | **Fill with real numbers only; state n** |
| 10 | Cost and who pays | Cost | Ranges; per asset-month; funding path | Table | Assumptions on slide |
| 11 | Impact and scale | Impact + scalability | Beneficiaries (stated assumption), ladder, adoption pathway | Ladder graphic | "Proposed adoption pathway" wording |
| 12 | Risks and next steps | Credibility | Top 5 risks + safeguards; next 90 days; ask (field-testing with a ULB) | Risk table | Close with the one-sentence pitch |

---

## PART 56 — THE 3-MINUTE PITCH (SPOKEN)

*Replace \[brackets\] with your real data. Do not read numbers you did not measure.*

"Picture a street near \[place\]. A resident reports a dead light. A week later, the system says: *resolved*. That night, the street is still dark.

This is not a story we heard. We \[walked \[N\] lamps in \[area\]\] and checked \[N\] complaints that the system had marked closed. \[X\] of them were not fixed. \[Replace with your real result, with the sample size.\]

Cities already have systems for reporting complaints — and good ones. They take reports, route them, track deadlines. What they don't settle is a simple question: *who confirms that it's really fixed?* Today, the same side that does the work usually closes the ticket. We've seen even a Municipal Commissioner admit that tickets can be closed without anyone fixing the problem on the ground.

So we didn't build another app. We designed a ward-level model with three simple ideas.

First, **two keys to close**. The repairer can say 'we have repaired it.' Only an independent, trained community verifier can say 'it is fixed.'

Second, **separate roles**. The person who reports, the person who repairs and the person who verifies are never the same.

Third, **the asset keeps the record**. Every pole has an owner, a service standard and a history, so when it fails again, we ask why — not just open another ticket.

A small panel of trained residents — rotating, screened for conflicts, reporting into the ward committee — does the verification. A simple website holds the evidence and enforces the rules. And if there's no internet, the same model runs on a paper form and a phone call.

In our pilot we \[describe in one sentence\]. It cost about \[₹ per asset per month, stated as an estimate\]. We publish two numbers side by side: what's *claimed* closed and what's *verified* fixed. The gap between them is the accountability.

We're not claiming a city has adopted this. We're proposing a pathway: a pilot order, a ward protocol, a shared Service Charter. We're asking for the chance to test it with an urban local body.

Because a fix isn't fixed until someone independent says so."

---

## PART 57 — FIVE-MINUTE DEMO SCRIPT (CLICK-LEVEL)

**Before you start:** Judge Mode on; DEMO DATA and SIMULATED badges visible; one paper form on the table.

| Time | Action (click) | Presenter says |
| --- | --- | --- |
| 0:00 | Slide 1 → your real pilot photo; one real number | "A closed ticket and a dark street. Here's what we measured." |
| 0:45 | Open **Landing page** → point to claimed vs verified widget | "This is the number we publish: claimed closed vs verified fixed." |
| 1:00 | **Public map** → tap lamp *KR-017* → **Asset passport** | "Every asset has an owner, a standard and a history." |
| 1:15 | Login as **Citizen (Asha)** → **Report issue** → capture photo → submit | "Three steps; time and location are stamped." |
| 1:40 | **Issue confirmation** → show "Under verification" | "Nothing is assigned until someone independent confirms the fault." |
| 1:55 | Switch to **Verifier (Ravi)** → queue → verification detail → *Verified* | "Different person from the reporter — the system enforces that." |
| 2:15 | Switch to **Officer (Meera)** → inbox → **Assign** (owner suggested from the Accountability Map) | "Ownership is explicit; if it's disputed, the clock still runs on the municipality." |
| 2:35 | Switch to **Contractor (Imran)** → accept → **Repair task** → upload before/after → cause code → **Claim repair** | "The contractor can claim a repair — not close it." |
| 3:00 | Show status **Repair Claimed (amber)**; as Officer, click **Close** → error *RULE\_R02* | "Even the officer can't close it without independent verification." |
| 3:20 | Switch to **Verifier #2 (night checklist)** → **Fail** with reason → issue **Reopened** | "This verifier checked at night. It failed. The same issue reopens; the asset's record shows a failure." |
| 3:40 | Contractor re-claims → Verifier #2 **Pass** → **Verified Closed** → **Timeline** | "Closed only now, with a full evidence trail." |
| 4:05 | **Public dashboard** → claimed vs verified; repeat-failure asset flagged | "The gap is visible. Repeat failures go to a root-cause review." |
| 4:30 | **Audit log** → *Verify chain* → OK | "Every action is tamper-evident." |
| 4:40 | Hold up the **paper verification form** | "No smartphone, no internet? Same protocol, paper and a phone call." |
| 4:50 | Final slide: one-sentence pitch | "A fix isn't fixed until someone independent confirms it." |

---

## PART 58 — NATIONAL SCALE VISION (5 YEARS)

Focus on **adoption**, not vanity metrics. All are goals, not predictions \[P\].

| Year | Goal | Adoption indicators |
| --- | --- | --- |
| 1 | Prove the model in one ward cluster; publish the Charter and SOP; complete a second asset class | Pilot report; trained panel; a ward/RWA acknowledgement; a ULB conversation started |
| 2 | 3–5 wards in one city with a municipal liaison; independent evaluation of false-closure and cost | Written pilot arrangement with a ULB; evaluation published |
| 3 | City-level adoption of the SOP in at least one city; interoperability with a real grievance platform if technically and legally permitted | Platform-integrated verification; contractor clauses piloted |
| 4 | A second state/district with local partners; state-level template; panchayat adaptation tested | State-level engagement; legal checklist per state |
| 5 | Recognised practice in a state/national urban programme (aspiration) — e.g., a "verified closure" indicator proposed to urban dashboards | Number of ULBs with adopted SOPs; verified-closure share; sustained volunteer retention |

---

## PART 59 — POLICY / GOVERNANCE ADOPTION

**Existing legal/institutional hooks (verified or background):** \[F\] The Greater Bengaluru Governance Act, 2024 (Karnataka Act 36 of 2025) names ward committees as basic units of urban governance and provides for their constitution, meetings and functions (details not analysed here; critics describe them as advisory). \[B\] The 74th Constitutional Amendment envisages ward committees for larger municipalities. \[F\] NUDM/UPYOG exist as shared digital infrastructure adopted by many States/UTs.

**What is NOT an existing mechanism:** any statute or rule that *requires* independent community verification of repair closures — **not found**; a legal basis for a community panel to certify closures — **NOT VERIFIED**; payment withholding based on community verification — **NOT VERIFIED**.

| Instrument | Status | How it could be used |
| --- | --- | --- |
| Pilot order / letter of permission by a ward or zonal officer | Possible pathway | Allows the pilot to run in the ward |
| Memorandum of understanding (convenor ↔ ULB) | Possible pathway | Roles, data sharing, liaison, publication rules |
| Ward-level SOP | Possible pathway | Defines Verified Closure and escalation in the ward |
| Service-level agreement / contract clause | Possible pathway | Future contracts reference verified closure and cause codes |
| Municipal resolution | Possible pathway | Adopts the Service Charter formally; **legality of scope not verified** |
| Community partnership / ward committee agenda item | Possible pathway | Quarterly report review |
| Operating guideline from state/urban department | Possible pathway | Template for other ULBs |

**Proposed adoption pathway \[P\]:** (1) courtesy briefing and data sharing → (2) pilot order or letter → (3) 3–6 month joint pilot → (4) joint review with the ward committee → (5) ward SOP → (6) contract-clause pilot → (7) replication through a state template. No stage is assumed to happen.

---

## PART 60 — FINAL STRATEGIC ASSESSMENT

1. **Why this idea deserves to exist.** Reporting is solved to a first approximation; credible closure is not. A cheap, explicit closure rule and a neutral verification role could make municipal data and public trust better at low cost.
2. **Why Track B is appropriate.** The contribution is a delivery model, an institution and a rule set; the software is replaceable by paper.
3. **What makes it original.** The combination in Part 41 (two-key closure, role separation, defined verifier institution, asset-centred accountability, claimed-vs-verified ledger) — pending your originality scan.
4. **Biggest weakness.** It needs municipal cooperation and sustained volunteers, and the pilot will be small and short.
5. **Biggest risk.** Execution in 22 days — specifically the coordinator registration and getting enough real evidence.
6. **Most important thing to validate.** That closed-but-unfixed is common enough in your area to measure, and that the closure step is genuinely where existing systems are weak (field interviews + sweep).
7. **Most important thing to build.** The two-key closure rule with enforced role separation, the paper protocol and the claimed-vs-verified ledger.
8. **Most important evidence to collect.** The Closed-Ticket Sweep result with its sample size, plus responsibility-ambiguity cases and any officer/RWA feedback.
9. **What could make judges reject it.** Looking like a grievance app; unsupported claims; no field evidence; claiming adoption; AI/tech-led storytelling; weak cost story.
10. **What could make it exceptionally strong.** A small but honest dataset showing a measurable closure gap, a one-page Service Charter reviewed by a real official, a paper-and-platform demo, transparent limits, and a clear "who pays" answer.

---

## FINAL SECTION — THE ONE-PAGE BLUEPRINT

| Field | Content |
| --- | --- |
| **PROJECT NAME** | Civic Asset Accountability Network (CAAN) |
| **PROBLEM** | Public-asset repairs can be closed by the responsible party without independent confirmation, and failures are tracked as tickets rather than as assets with owners and standards |
| **TARGET USERS** | Residents; community verifiers; ward/municipal officers; contractors and field crews; ward committees; auditors |
| **GOVERNANCE INNOVATION** | Two-key closure; reporter ≠ repairer ≠ verifier; Ward Verification Panel; asset passport with named owner and standard; Jurisdiction Dispute state; repeat-failure root-cause loop; claimed-vs-verified ledger |
| **WEBSITE ROLE** | Records evidence, enforces rules, runs SLA clocks, publishes the ledger; optional — model also runs on paper |
| **CORE WORKFLOW** | Observe → Verify → Assign → Commit → Repair → Independently Verify → Close → Publish → Analyse |
| **TRACK** | Track B — Business Model or Governance |
| **THEME** | Theme 05 — Surakshit Bharat (mobility & infrastructure; safety; digital public infrastructure) |
| **PILOT** | Closure Audit of 60–100 street lights in one Bengaluru ward cluster: baseline, closed-ticket sweep, live cycle, endline |
| **COST** | Student pilot ≈ ₹10–30 K; standard pilot ≈ ₹1.5–4 L; scaled ≈ ₹4–10 L per ward-year (assumption-based ranges) |
| **BENEFICIARIES** | Residents on pilot roads (count to be measured); municipal staff and contractors gain credible records |
| **IMPACT METRICS** | False-closure rate; verified closure rate; time to verified closure; repeat-failure rate; cost per verified closure; resident satisfaction |
| **SCALABILITY** | Scale protocol + training; pilot cluster → 5 wards → city → district → state |
| **TECH STACK** | React + TypeScript + Vite PWA; Supabase (PostgreSQL/PostGIS, Auth, Storage, RLS); MapLibre; optional n8n; advisory AI for evidence quality |
| **KEY DIFFERENTIATOR** | An independent, institutionalised closure authority at ward level — not another complaint channel |
| **ONE-SENTENCE PITCH** | *A ward-level accountability model that counts a public-asset repair as done only when an independent, trained community verifier confirms it — and publishes the gap between claimed and verified closure.* |

---

*End of Master Blueprint v1. Items tagged NOT VERIFIED, \[A\] or \[B\] should be resolved or removed before any claim appears in the submission.*
