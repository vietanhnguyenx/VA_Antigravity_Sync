---
name: ba-workflow-patterns
description: Six canonical BA documentation-workflow patterns (Spec-first, Prototype-first, Process-led, Co-evolution hybrid, Story-driven, Use-Case-led) with detailed trade-offs and a selection guide. Reference for choosing the document-production flow on a project.
source: Methodology synthesis — BABOK v3, Scrum Guide 2020, BPMN 2.0 practice, RUP/ICONIX use-case practice, consulting comparison 2026-06-03
version: "1.1"
date: "2026-06-03"
---

> Mirrored at `.claude/human/knowledge/ba-workflow-patterns.md` (full Vietnamese version). Sync per [SYNC-PROTOCOL.md](../sync/SYNC-PROTOCOL.md). Related: [`bpmn-2.0-cheatsheet.md`](bpmn-2.0-cheatsheet.md), [`agile-scrum-vn.md`](agile-scrum-vn.md), [`babok-v3-summary.md`](babok-v3-summary.md).

# BA Documentation-Workflow Patterns (AGENTS scope)

Five reusable patterns for sequencing the production of BA/requirements artifacts (BRD → analysis → wireframe/mockup → SRS → test). Use this file to **choose and justify** a workflow per project. Each pattern lists: flow, philosophy, outputs, strengths, weaknesses, preconditions, switch-signals, and a governance note (invention risk vs the "human decides, agent reproduces" rule).

| ID | Pattern | Core sequence |
|---|---|---|
| P1 | Spec-first (Document-led / Waterfall) | BRD → full SRS → wireframe → build → test |
| P2 | Prototype-first (Design-led) | BRD → wireframe/mockup → SRS derived from approved prototype |
| P3 | Process-led (BPMN / process-first) | BRD → As-Is/To-Be process → derive functions/data/roles/screens → SRS + wireframe |
| P4 | Co-evolution hybrid (parallel) | BRD → (function decomposition + data model) ∥ (wireframe/mockup) → SRS + RTM |
| P5 | Story-driven (Agile backlog) | Vision → Epics → User Stories + AC → JIT wireframes → incremental |
| P6 | Use-Case-led (UML / Unified Process) | BRD → Use Cases + business flows → wireframe → SRS |

---

## P1 — Spec-first (Document-led / Waterfall)

- **Flow:** Vision/BRD → complete SRS/FRD (single source of truth) → wireframe → build → test.
- **Philosophy:** Lock and sign off the textual specification before design/build; the document is the contract.
- **Outputs:** BRD, complete SRS/FRD, RTM.
- **Strengths:** Strongest formal documentation and acceptance/contract basis; high coverage of business logic and non-UI concerns; clear up-front traceability; predictable for fixed scope; low dependency on team maturity.
- **Weaknesses:** Feedback arrives very late → late changes are expensive; stakeholders validate poorly against long text; assumes requirements are fully knowable up front; long time-to-feedback.
- **Preconditions:** Scope frozen; low volatility; regulated/safety-critical domain; contract-driven delivery.
- **Switch signals:** Frequent change requests; stakeholders cannot validate from text; UI uncertainty high → move toward P3/P4.
- **Governance note:** Low invention risk *if* every spec line is sourced; main hazard is **unvalidated spec drift** (text that looks complete but was never confirmed).

## P2 — Prototype-first (Design-led)

- **Flow:** BRD → wireframe / interactive mockup → SRS transcribed from the approved prototype.
- **Philosophy:** The prototype is the elicitation and validation instrument — "show, don't tell."
- **Outputs:** Clickable prototype/mockup first; then an SRS whose component tables map 1:1 to confirmed screens.
- **Strengths:** Fastest stakeholder feedback; ideal when UI is the main uncertainty; visual stakeholders engage; component-level spec is precise.
- **Weaknesses:** **Blind to non-UI** work (batch jobs, integrations, calculations); **weak on exception/branch logic** that screens cannot show; "commit-to-pixels too early"; weak traceability; high pressure to invent UI/behaviour.
- **Preconditions:** UI is the dominant risk; a designer/human owns UI decisions; back-end logic is light *or* captured separately.
- **Switch signals:** Hidden business rules surfacing; non-UI scope growing; need for formal acceptance docs → upgrade to P4.
- **Governance note:** **Highest invention risk.** Prototype components MUST be anchored to a source (customer UI doc, survey, minutes); layout is a *human-approved proposal*, not an agent decision. Do not prototype subsystems that have no UI source.

## P3 — Process-led (BPMN / business-process-first)

- **Flow:** BRD → As-Is and To-Be process models (BPMN) → derive functions, data entities, roles, and screens from the process → SRS + wireframe.
- **Philosophy:** The business process (the value flow) is the root; functions, data and screens are *derivations* of it.
- **Outputs:** As-Is/To-Be diagrams, function decomposition, data model, then SRS.
- **Strengths:** Best coverage of logic and **exception branches**; fully covers non-UI work; strong traceability anchored to the process; aligns with formal documentation; structurally resists "form before meaning."
- **Weaknesses:** Slower *visual* feedback; requires solid modeling skill (BPMN); risk of over-modeling; less tangible for UI-oriented stakeholders.
- **Preconditions:** Complex, multi-actor, cross-system processes; a BA with modeling maturity.
- **Switch signals:** Process is simple/CRUD-only (modeling is overkill) → P1/P2; product needs rapid UI iteration → blend with P2 (i.e. P4).
- **Governance note:** Low invention risk for *derivation*, BUT **To-Be process design is a human responsibility** — the agent models the To-Be that humans decide, and flags gaps; it must not invent how a process "should" branch.

## P4 — Co-evolution hybrid (parallel) — DEFAULT RECOMMENDATION

- **Flow:** BRD → (function decomposition + data model, on a process backbone) **in parallel with** (wireframe/mockup validated early) → SRS + RTM + TC, with feedback loops between the two tracks.
- **Philosophy:** Take P3's "meaning-first" backbone and P2's "validate-visually-early," and run them concurrently so neither is blocked by the other.
- **Outputs:** Process/function map + data model + early prototype + SRS + living RTM + test cases.
- **Strengths:** **Best rework resistance**; early feedback *and* full coverage; balanced across all dimensions; still yields formal documents for acceptance.
- **Weaknesses:** Requires coordination/discipline; the two tracks can drift if not reconciled; moderate team maturity needed.
- **Preconditions:** A reconciliation mechanism (RTM / cross-check docs); a clear owner per track; a rule that the prototype track does **not** run ahead of decomposition for areas lacking a source.
- **Switch signals:** Very small/simple scope (hybrid overhead not justified) → P1/P2; pure iterative product delivery → P5.
- **Governance note:** Low risk when components are anchored and unsourced areas stay spec-led; the key guardrail is preventing the visual track from inventing ahead of the sourced decomposition.

## P5 — Story-driven (Agile backlog)

- **Flow:** Vision → Epics → User Stories + Acceptance Criteria → just-in-time wireframes → incremental delivery.
- **Philosophy:** Just-enough, just-in-time documentation; a working increment over comprehensive specs.
- **Outputs:** Product backlog; stories with testable AC; thin living docs; incremental releases.
- **Strengths:** Best time-to-value and change adaptation; continuous feedback; testability built into AC.
- **Weaknesses:** Weak for fixed-scope contracts / full up-front acceptance; formal documentation is fragmented; cross-cutting and non-functional coverage can slip; needs a mature Agile team and an engaged Product Owner.
- **Preconditions:** Iterative delivery model; empowered Product Owner; mature team.
- **Switch signals:** Contract requires a complete up-front SRS; regulated sign-off → P1/P3.
- **Governance note:** Stories derive from source; AC must be testable and human-confirmed; avoid inventing behaviour to "complete" a story.

## P6 — Use-Case-led (UML / Unified Process)

- **Flow:** BRD → Use Cases (actor–goal, with main/alternate/exception flows) + business process flows (activity/BPMN) → wireframe (derived from the use cases) → SRS → use-case-based test cases.
- **Philosophy:** "Behaviour-first" — model *what the system does, for whom* (use cases) and *how the process flows*, before UI and detailed spec; UI and SRS are derivations of confirmed behaviour. Rooted in RUP / ICONIX / Unified Process.
- **Outputs:** Use-case diagrams + use-case specs (main/alternate/exception flows), process-flow diagrams, then wireframe, then SRS, then UC-based test cases.
- **Strengths:** Best-in-class coverage of logic and **exception branches** (alternate/exception flows are the native content of a use case); **cleanest end-to-end traceability** (UC → wireframe → SRS function → TC, near-automatic RTM); wireframe is well-grounded (derived from confirmed UC behaviour → not invented → respects Section 0); excellent fit for a formal SRS (UC + flows are textbook SRS content).
- **Weaknesses:** Sequential (model UC → wireframe → SRS) → visual feedback arrives later than P2/P4; modeling overhead and UML/use-case skill required (heavy for simple CRUD; risk of analysis paralysis); **actor-less work** (batch jobs, scheduled tasks, IoT ingest) is awkward to express as use cases.
- **Preconditions:** Behaviour-rich, multi-actor system with many alternate/exception flows; team comfortable with UML/use cases; formal SRS + a test basis needed.
- **Switch signals:** Simple CRUD (overkill) → P1/P2; need very fast UI feedback → P2/P4; heavy actor-less processing → P3 (process-led).
- **Governance note:** A use case is exactly where *"what happens when a step fails / how the flow branches"* lives — which Section 0 assigns to **humans**. Alternate/exception flows MUST be human-decided; the agent only decomposes *recorded* scenarios into use-case structure and must not invent branches. P6 can also run **on P4's parallel backbone** (model UC + flows in parallel with the wireframe) to recover early visual feedback.

---

## Weighted comparison (general best-practice, 1–5; 5 = best)

| Criterion (weight) | P1 | P2 | P3 | P4 | P5 | P6 |
|---|:--:|:--:|:--:|:--:|:--:|:--:|
| Early elicitation (×2) | 2 | 4 | 4 | 5 | 4 | 4 |
| Visual stakeholder validation (×2) | 2 | 5 | 3 | 5 | 4 | 4 |
| Logic & exception coverage (×3) | 4 | 2 | 5 | 4 | 3 | 5 |
| Non-UI coverage (×2) | 4 | 1 | 5 | 4 | 3 | 4 |
| Traceability quality (×2) | 4 | 2 | 4 | 4 | 4 | 5 |
| Rework resistance / late-change cost (×3) | 2 | 3 | 4 | 5 | 5 | 4 |
| Time-to-feedback/demo (×2) | 1 | 5 | 3 | 4 | 5 | 3 |
| Fit for formal docs (SRS/contract) (×2) | 5 | 2 | 5 | 4 | 2 | 5 |
| Resists "form/words before meaning" (×2) | 3 | 1 | 5 | 4 | 3 | 5 |
| Low team-maturity dependency (×1) | 4 | 3 | 2 | 3 | 2 | 2 |
| **Weighted total (/105)** | **63** | **62** | **86** | **92** | **76** | **89** |

## Selection guide

| Context | Recommended |
|---|---|
| Fixed/contracted scope, low change, heavy regulation | P1 or P3 |
| New product, uncertain UI, UX experimentation | P2 (then upgrade to P4) |
| Complex multi-actor/cross-system business logic | **P3 / P4** |
| Behaviour-rich, many exception flows, UC-based acceptance | **P6** (optionally on a P4 parallel backbone) |
| Iterative delivery, mature Agile team, engaged PO | P5 (+ a light RTM) |
| Default for enterprise BA with a formal SRS deliverable | **P4 (with a P3 process backbone)** |

## Invariant principles (apply to every pattern)

1. **Every artifact traces to a source**; distinguish *fact* from *inference-to-be-confirmed*.
2. **Validate early, validate often** — never defer all feedback to the end.
3. **Separate "what/why" (business) from "how it looks" (UI)** — fix meaning before form.
4. **Keep a living RTM** across BR → FR → screen → TC.
5. **Humans decide and infer; agents decompose and reproduce** (To-Be design, UI behaviour, gap-filling are human responsibilities).
