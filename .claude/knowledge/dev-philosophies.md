---
name: dev-philosophies
description: Catalog of OPTIONAL software-development philosophies a project may adopt (e.g. Modularization & Integration / "Khắc nhập – Khắc xuất"). Applied ONLY when the human explicitly chooses one — see CLAUDE.md §0.2. Extensible: add new options as DPn.
source: Methodology synthesis + evaluation, 2026-06-03
version: "1.0"
date: "2026-06-03"
---

> Mirrored at `.claude/human/knowledge/dev-philosophies.md` (full Vietnamese version). Sync per [SYNC-PROTOCOL.md](../sync/SYNC-PROTOCOL.md). Related: [`ba-workflow-patterns.md`](ba-workflow-patterns.md).

# Development Philosophy Options — Catalog (AGENTS scope)

**OPTIONAL.** Unlike the document workflow (CLAUDE.md §0.1, mandatory), a development philosophy is applied **only when the human explicitly chooses one** (CLAUDE.md §0.2). Default for every project = **none**. The agent asks at project startup; it never adopts a philosophy unilaterally.

| ID | Philosophy | One-line |
|---|---|---|
| DP1 | Modularization & Integration ("Khắc nhập – Khắc xuất") | Divide-and-conquer: decompose into independent modules, integrate via explicit contracts |

> *To add a new option:* append `## DPn — <name>` with the same sub-structure (essence, when-to-use, process, quality criteria, governance note), add a row above, bump version, sync mirror + SYNC-LOG.

---

## DP1 — Modularization & Integration ("Khắc nhập – Khắc xuất")

Decomposition + integration based on *Divide and Conquer*. "Khắc xuất" = decompose a large system/SRS into independent modules; "Khắc nhập" = aggregate the small pieces into a unified business flow.

### Essence

| | Khắc xuất (Decomposition) | Khắc nhập (Integration) |
|---|---|---|
| Action | Split large system/doc into small independent parts | Aggregate small parts into one unified flow |
| Goal | To understand, parallelize, maintain | To operate as one coherent whole |
| Core criterion | High Cohesion (within a module) | Loose Coupling + clear contracts (between modules) |

> **Key paradox:** decomposition and integration are *two sides of one decision* — where you cut module boundaries is determined by how they will be re-joined.

### Step 0 — Contract-first (precedes decomposition)

```
WRONG: decompose all modules → then design integration
       (boundaries cut wrong → rework)
RIGHT: define integration contracts first (API / event / data interface)
       → then decompose inside each contract
```
The contract is the line; the module is the area inside the line.

### Stage 1 — Khắc xuất (Decomposition)

**Choose a decomposition AXIS** (wrong axis = garbage modules):

| Axis | Use when | Owner |
|---|---|---|
| By feature | UI-rich, clear user action | BA |
| By data domain (entity) | Data-centric, report-heavy | BA + DEV |
| By user role (RBAC) | Complex permissions | BA |
| By bounded context (DDD) | Microservices, independent teams | Architect |

> Warning: "group all screens with a Save button" = high *technical* cohesion but business-meaningless. The axis must anchor to **user goals**, not technical similarity.

**Split the viewpoints** (BA vs DEV decomposition differ):

```
[System] → [Sub-system] → [Module] → [Feature / User Story]
  └────── BA owns ──────┘  └ overlap ┘  └─── DEV owns ───┘
                          (API contract,   (class, function)
                           data model)
```

| Viewpoint | Unit | "Good" criterion |
|---|---|---|
| BA decomposes docs | User Story / Use Case | **INVEST** + **vertical slice** (full business value) |
| DEV decomposes code | Module / class / function | **High Cohesion + Loose Coupling** (SOLID) |

**Separation of Concerns:** each piece separates Business Logic ⟂ UI/UX ⟂ Data.

### Stage 2 — Khắc nhập (Integration)

1. **Data integration** — reconcile fields from many sources into one consistent model (central ERD).
2. **API/Interface per Step-0 contract** — modules talk via the agreed contract, no conflict.
3. **Integration testing** — verify data flow module→module matches the overall design (≠ unit test).

### Quality criteria

| Criterion | ❌ Bad decomposition | ✅ Good decomposition |
|---|---|---|
| Coupling | Change 1 module → whole system breaks | Modules independent; one fails, others run |
| Cohesion | One module does many mixed jobs | Each module solves one problem thoroughly |
| Reusability | Hardcoded, not portable | Becomes shared libraries across projects |
| Maintenance | Debugging takes weeks | Locate the faulty module in minutes |
| Testability ★ | No independent unit test possible | Each module unit-tested in isolation |
| User-goal alignment ★ | Split by technique, loses the goal | Each piece serves a clear user goal |

> Fastest check: *"Can I write an independent test for this module?"* — if not, coupling is too high or cohesion too low.

### Governance note (CLAUDE.md §0)
Choosing the decomposition axis and the To-Be boundaries is a **human design decision**. The agent decomposes recorded requirements faithfully and proposes boundaries, but does not invent module logic or integration behavior.
