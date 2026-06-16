---
name: agile-scrum-vn
description: Extended Agile / Scrum reference — ceremonies, roles, artifacts, and key concepts with Vietnamese explanations. Links to the BA terminology glossary.
source: Scrum Guide 2020, Agile Manifesto, common Vietnamese-team practice
version: "1.0"
date: "2026-05-26"
---

> Mirrored at `.claude/human/knowledge/agile-scrum-vn.md` (full Vietnamese version). Sync per [SYNC-PROTOCOL.md](../sync/SYNC-PROTOCOL.md). For glossary terms see [`.claude/glossary/ba-terms-vi-en.md`](../glossary/ba-terms-vi-en.md) Group 3.

# Agile / Scrum Reference (AGENTS scope)

This is the canonical English structural summary. The Vietnamese narrative version (with detailed explanations for the team) lives at the HUMAN mirror path above.

## 1. Agile Manifesto (4 values, 12 principles)

**4 values** (left preferred over right, both have value):
1. Individuals & interactions over processes & tools.
2. Working software over comprehensive documentation.
3. Customer collaboration over contract negotiation.
4. Responding to change over following a plan.

## 2. Scrum Framework — 3 pillars, 3 roles, 5 events, 3 artifacts

### 3 Pillars (empirical process control)
- **Transparency** — work and progress visible to all.
- **Inspection** — frequent review of artifacts and progress.
- **Adaptation** — adjust based on inspection.

### 3 Roles
| Role | Responsibility | VI |
|---|---|---|
| **Product Owner (PO)** | Maximizes product value, owns Product Backlog | Chủ sản phẩm |
| **Scrum Master (SM)** | Servant-leader, removes impediments, coaches Scrum | Người dẫn dắt Scrum |
| **Developers** | Cross-functional team building the Increment | Đội phát triển |

### 5 Events (ceremonies)
| Event | Duration (2-week sprint) | Purpose |
|---|---|---|
| **Sprint** | 2 weeks (1–4) | Container for all other events; produces a usable Increment. |
| **Sprint Planning** | ≤ 4 hours | Plan the work for the sprint: WHAT (goal, items) and HOW (plan). |
| **Daily Scrum** | 15 min | Daily inspection toward Sprint Goal; surface impediments. |
| **Sprint Review** | ≤ 2 hours | Inspect Increment with stakeholders; adapt Product Backlog. |
| **Sprint Retrospective** | ≤ 1.5 hours | Inspect & adapt the team's process and quality. |

Plus continuous **Backlog Refinement** (~10% of capacity).

### 3 Artifacts (+ commitments)
| Artifact | Commitment | Purpose |
|---|---|---|
| **Product Backlog** | Product Goal | Ordered list of everything that might be needed |
| **Sprint Backlog** | Sprint Goal | The selected PBIs + plan for delivering the Increment |
| **Increment** | Definition of Done (DoD) | Concrete step toward Product Goal — usable, met DoD |

---

## 3. Story sizing & estimation

- **Story Point** — relative estimate of complexity + effort + uncertainty (NOT hours).
- **Planning Poker** — team estimates simultaneously using Fibonacci (1, 2, 3, 5, 8, 13, 21).
- **Velocity** — average story points completed per sprint over recent sprints; used for forecasting, NOT performance evaluation.
- **T-Shirt Sizing** — XS/S/M/L/XL for coarse early estimates.

## 4. User Story format

```
As a <persona>,
I want <capability>,
so that <business value>.
```

Vietnamese form (for VCM deliverables): `Là một <persona>, tôi muốn <hành động>, để <giá trị>.`

Acceptance Criteria in **Given-When-Then** (`Cho trước - Khi - Thì`).

INVEST check: **I**ndependent, **N**egotiable, **V**aluable, **E**stimable, **S**mall, **T**estable.

## 5. Prioritization techniques

| Technique | When to use |
|---|---|
| **MoSCoW** (Must/Should/Could/Won't) | Quick stakeholder alignment |
| **WSJF** (Weighted Shortest Job First) | SAFe environment, cost-of-delay focus |
| **Kano** | Distinguish basic vs. delight features |
| **RICE** (Reach, Impact, Confidence, Effort) | Growth-product environment |

## 6. Definition of Done (DoD) — example for VCM

A PBI is "Done" when:
- [ ] Code reviewed & merged to main
- [ ] Unit tests pass; coverage ≥ 80%
- [ ] Integration tests pass on staging
- [ ] Acceptance Criteria verified by QA
- [ ] Documentation updated (FRD/API docs)
- [ ] Product Owner accepts in Sprint Review

## 7. Definition of Ready (DoR) — example for VCM

A story is "Ready" for sprint when:
- [ ] User story format checked (Là một / tôi muốn / để)
- [ ] ≥ 2 Acceptance Criteria in Cho trước-Khi-Thì format
- [ ] INVEST check passed
- [ ] Story Points estimated
- [ ] No blocking dependency
- [ ] PO has accepted as next-up

## 8. Kanban (complementary to Scrum)

- **Pull-based** — work pulled when capacity available, not pushed by date.
- **WIP limit** — cap items in each column to expose bottlenecks.
- **Cycle time** — start-to-done duration; the key flow metric.
- **Cumulative Flow Diagram (CFD)** — visualize flow over time.

Often combined with Scrum → **Scrumban**.

## 9. Common pitfalls

- Daily Standup turning into status report instead of impediment surfacing.
- Velocity used to compare teams (anti-pattern — velocity is team-relative).
- Sprint without a Sprint Goal — just a list of tasks.
- PO splitting time across 5+ teams — leads to slow decisions.
- "Mini-waterfall" inside sprints — sequential analyze/design/code/test.
- DoD that's aspirational, not actually enforced.

---

*Full Vietnamese narrative at `.claude/human/knowledge/agile-scrum-vn.md`. Glossary cross-reference: [Group 3 — Agile/Scrum in ba-terms-vi-en.md](../glossary/ba-terms-vi-en.md).*
