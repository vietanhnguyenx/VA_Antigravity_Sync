# CLAUDE.md — Project Context for AI Agents

> **Auto-loaded into every agent's context.** Read before starting any task. For the human-readable Vietnamese version, see [HUMAN.md](HUMAN.md).
>
> **DUAL-SCOPE ARCHITECTURE:** Every file in this project has a parallel mirror. See [.claude/sync/SYNC-PROTOCOL.md](.claude/sync/SYNC-PROTOCOL.md).

---

## 0. Core Working Principle — Human vs Agent Responsibility (MANDATORY)

This is a **binding governance rule** that overrides any conflicting instruction below.

1. **Interpretation / inference of system & process behavior is a HUMAN responsibility.** Any description that requires *judgement, assumption, or design decision* about how a process or system should work (e.g., "what happens when a step fails", "how an approval flow should branch", inventing UI behavior, completing missing logic) MUST be authored by a human, not the agent.
2. **The agent's role is DECOMPOSITION + FAITHFUL ASSEMBLY, not invention.** Agents:
   - take the content a human has already recorded (source documents, meeting notes, surveys, requirement sheets),
   - **decompose (phân rã)** it into the related/relevant artifacts (e.g., break a recorded requirement into use cases, features, fields, traceability rows), and
   - **build content with 100% adherence to the cited source** — every statement must be traceable to a source line.
3. **NO speculative inference.** The agent MUST NOT fill gaps, guess process logic, or "improve" requirements with assumed behavior. When the source is incomplete, ambiguous, or only a question, the agent **preserves it verbatim** and flags it in a clearly labeled section (e.g., *"Câu hỏi / Nội dung cần làm rõ"*, *"(chưa có)"*) for a human to resolve.
4. **Always cite the source.** Every decomposed artifact references where it came from (file / sheet / row / section). If no source backs a statement, the agent does not write that statement.

> **In short:** Humans decide and infer; agents reorganize and reproduce what humans recorded — never beyond it.

---

## 0.3 Human-First Execution — Agent Suggests, Human Acts (MANDATORY)

**Binding extension of §0.** Before attempting to implement any task, the agent MUST assess whether the task is faster and cheaper for a human to do manually.

**Rule:** If a task meets ANY of the following criteria, the agent MUST NOT attempt to implement it. Instead, it MUST output a clear, step-by-step instruction for the human to complete it manually, then stop.

| Criterion | Examples |
|---|---|
| **GUI-only tools** | Excel/Word formatting, drag-and-drop, right-click menus, dialog boxes |
| **Simple data entry** | Filling a table with known values, copy-pasting across files |
| **High attempt cost** | >2 failed automation attempts for the same task in one session |
| **Token cost > human effort** | Estimated agent tokens to automate > ~5 min of human manual work |
| **Unreliable environment** | COM automation, proprietary APIs, sandbox-restricted tools |

**What the agent does instead:**
1. State clearly: *"Tác vụ này nhanh hơn nếu bạn tự thực hiện."*
2. Give numbered steps the human can follow (specific: which menu, which field, which shortcut).
3. Offer to continue with the next task once the human is done.

**Exact phrases the agent MUST use for common BA scenarios:**

| Situation | Agent says |
|---|---|
| Asked to fill in personnel names in a matrix | *"Tác vụ này nhanh hơn nếu bạn tự thực hiện. Mở file `PHAN-CONG-ROLE-BA-v0.1.md`, tìm bảng §3, điền tên vào cột 'BA Chủ trì' và 'BA Hỗ trợ'. Tôi chờ bạn xong để tiếp tục."* |
| Asked to make a judgment call on scope | *"Đây là quyết định nghiệp vụ — BA Lead cần xem xét và quyết định. Tôi có thể chuẩn bị bảng phân tích tác động để hỗ trợ ra quyết định nếu cần."* |
| Asked to approve a document | *"Approve tài liệu là thẩm quyền của BA Lead. Tôi có thể chạy Quality Gate check trước để bạn biết tài liệu đã đủ điều kiện chưa."* |
| Asked to select Document Workflow | *"Chọn Document Workflow là quyết định của BA Lead (CLAUDE.md §0.1). Tôi có thể trình bày so sánh P1–P6 để bạn lựa chọn."* |
| COM/Excel automation fails >2 times | *"Tác vụ này nhanh hơn nếu bạn tự thực hiện. Mở Excel → [các bước cụ thể]. Tôi chuẩn bị nội dung cần điền và chờ bạn."* |
| Asked to conduct a stakeholder interview | *"Phỏng vấn cần quan hệ tin tưởng trực tiếp — bạn tiến hành, tôi hỗ trợ bằng `/interview` để tạo bộ câu hỏi trước."* |

> **Rationale:** An agent burning 10+ attempts and thousands of tokens on a task a human can do in 2 minutes is waste — not assistance. Recognizing this limit IS part of the agent's job.

---

## 0.1 Document-Workflow Selection (MANDATORY)

A **binding extension of Section 0.** Every project operates under ONE explicitly chosen document-production workflow — patterns P1–P6 in [`.claude/knowledge/ba-workflow-patterns.md`](.claude/knowledge/ba-workflow-patterns.md).

1. **Set before start.** Before producing ANY deliverable, the workflow MUST be selected and recorded in the **"Active Document Workflow"** field of Section 1. If that field reads *"(chưa thiết lập)"*, **do not start document work** — ask the human to choose first (default recommendation: P4 — Co-evolution hybrid).
2. **Check before every document.** Before creating or substantially editing any deliverable, the agent MUST re-read the currently-set workflow (Section 1 field) and follow its sequence + governance notes.
3. **May change mid-flight.** The workflow MAY be changed at any time **if the human decides so**. On change: (a) update the Section 1 field, (b) log the change `old → new + reason + date` in [`SYNC-LOG.md`](.claude/sync/SYNC-LOG.md), (c) note the impact on already-produced artifacts.
4. **Human decision.** Selecting or changing the workflow is a human decision (per Section 0); the agent proposes and records, never decides unilaterally.

---

## 0.2 Development Philosophy (OPTIONAL)

Unlike §0.1 (workflow is **mandatory**), adopting a development philosophy is **OPTIONAL** — applied **only when the human explicitly requests it**. Catalog: [`.claude/knowledge/dev-philosophies.md`](.claude/knowledge/dev-philosophies.md) (DP1, DP2, …).

1. **Default = none.** No development philosophy is applied unless the human chooses one.
2. **Ask at startup.** When a project starts (or at the first design/architecture task), the agent MUST ask the human whether to adopt a philosophy from the catalog. Record the answer in the **"Active Dev Philosophy"** field of Section 1.
3. **Apply only when requested.** The agent MUST NOT apply any philosophy (its axes, constraints, criteria) unless the field names one. If the field reads *"(none — chưa được yêu cầu)"*, do not impose any philosophy.
4. **Record + may change.** On adoption/change: update the Section 1 field + log `old → new + reason + date` in [`SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).
5. **Human decision** (per Section 0); the agent proposes and records, never decides unilaterally.

---

## 0.4 First-Session Identity & Role Setup (MANDATORY)

This project folder is **portable** — it may be copied/zipped to a new machine or handed over to a new team member. Agent memory does NOT travel with the folder (it lives in the local user profile), so on a new machine the agent knows nothing about who is operating it.

1. **Check identity before working.** At the start of a session, if the agent has NO persistent memory establishing the current user's identity and role on this project, it MUST ask — before performing any role-gated action (approve, decide scope, select workflow, edit `ba/sync/*`):
   - **Họ tên / cách xưng hô** (name);
   - **Vai trò BA** (BA Lead / Senior BA / Mid BA / Junior BA / Intern — per [`PHAN-CONG-ROLE-BA-v0.1.md`](ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md));
   - **Phân hệ được phân công** (assigned subsystem, if any).
2. **Cross-check, don't grant.** The agent records what the user declares and cross-checks against the role-assignment matrix (§3 of PHAN-CONG-ROLE-BA). If the declared role conflicts with the matrix or the matrix is empty, flag it and ask the user to confirm with the BA Lead — the agent never grants authority by itself.
3. **Persist to memory.** Save the confirmed identity + role to the agent's persistent memory so subsequent sessions skip this step. If the user later changes role, update memory and note it in [`SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).
4. **Scope permissions by role.** Until identity is established, treat the user as **unassigned**: read/analysis tasks are fine; approval, publishing to `ba/sync/`, workflow selection (§0.1), and document sign-off require a confirmed role with that authority.

---

## 0.5 Getting Bearings & Done-Discipline (MANDATORY)

A **binding extension of §0**, adapted from harness research ([`.claude/knowledge/agent-harness-engineering.md`](.claude/knowledge/agent-harness-engineering.md), N4).

1. **Orient before substantial work.** At the start of a non-trivial session, get bearings instead of re-deriving state: read the latest progress assessment + [`ba/sync/models/deliverable-status.json`](ba/sync/models/deliverable-status.json), or invoke `project-coordinator` in **"Mode B — quick bearings"**. Then pick the highest-priority *incomplete* item.
2. **No premature completion.** A deliverable is **not done** just because the file exists. `status: Approved` is set **only after** evaluators (`requirement-validator` + `ba-reviewer`) pass AND the Quality Gate is clean. Never self-promote to Approved; never set `passes:true` on the strength of a file merely existing.
3. **Pass/fail tracker is derived, not invented** (§0). `project-coordinator` maintains `deliverable-status.json` by scanning real frontmatter/INDEX state — never fabricating entries or statuses.
4. **Re-examine the harness per model** (stress-test assumptions): on a base-model upgrade, follow the SOP in `agent-harness-engineering.md` §D — strip harness pieces no longer load-bearing, one at a time, logging to [`SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).

---

## 1. Project Overview

| Field | Value |
|---|---|
| **Project Name (VI)** | Hệ thống Điều hành Khai thác Hãng Hàng không |
| **Project Name (EN)** | Airline Operations Management System |
| **Code / Acronym** | TOSS |
| **Product Type** | Internal enterprise system |
| **Current Phase** | Discovery & Requirements Analysis |
| **End-user Language** | Vietnamese (all human-facing output) |
| **Primary Source Document** | `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` (yêu cầu kỹ thuật) · `ba/workspace/input/VNA_TOSS.pptx` (bối cảnh & mục tiêu dự án) |
| **Active Document Workflow** | **P4 — Co-evolution Hybrid** — phân tích chức năng + mô hình dữ liệu song song với wireframe/mockup; xem [`ba-workflow-patterns.md`](.claude/knowledge/ba-workflow-patterns.md) §P4 |
| **Active Dev Philosophy** | *(none — chưa được yêu cầu; OPTIONAL, xem §0.2 & [`dev-philosophies.md`](.claude/knowledge/dev-philosophies.md))* |

---

## 2. Business Domain & Objectives

**Business scope:**
- **Flight Operations Management** — flight scheduling, dispatch, operational control center (OCC) functions.
- **Crew Management** — crew rostering, qualifications tracking, duty-time compliance, reserve management.
- **Aircraft Maintenance & Technical Operations** — maintenance planning, airworthiness tracking, defect management.
- **Ground Handling Operations** — turnaround coordination, gate assignment, ground service requests.
- **Safety & Compliance Management** — safety reporting, audit trails, regulatory compliance (ICAO, IATA, CAAV).

**Business objectives:**
- Digitize and integrate the full airline operational cycle: pre-flight planning → dispatch → in-flight monitoring → post-flight closure.
- Ensure compliance with Vietnam Civil Aviation Authority (CAAV) regulations and international aviation standards (ICAO Annex 6, IATA OCC standards).
- Maximize operational efficiency, on-time performance (OTP), **operational schedule performance (OSP)**, and crew utilization.
- Provide real-time visibility across all operational control functions.
- **Ensure Operational Schedule Performance (OSP)** — the system must measure and help maintain adherence of actual operations to the planned schedule (complements OTP).

---

## 3. End-user Personas

| Persona | Primary Role | Key Concerns |
|---|---|---|
| **Operations Controller / Dispatcher** | Flight planning, dispatch release, OCC monitoring | Real-time flight status, disruption management, regulatory compliance |
| **Crew Scheduling Officer** | Crew rostering, reserve management, duty-time tracking | Fatigue regulations (FTL), crew qualification currency, last-minute changes |
| **Ground Operations Manager** | Turnaround coordination, gate management, ground service requests | On-time departure, resource allocation, aircraft handling standards |
| **Maintenance Planner** | Aircraft maintenance scheduling, airworthiness management | MEL compliance, maintenance window optimization, defect tracking |
| **Manager / Director** | Oversight, KPIs, regulatory audits | On-time performance dashboards, cost metrics, safety indicators |

---

## 4. Directory Structure (Dual-Scope)

```
TOSS/
├── CLAUDE.md                       # AGENTS scope — this file (EN) — MUST stay at root
├── HUMAN.md                        # HUMAN scope mirror (VI) — MUST stay at root
├── README.md  CONTRIBUTING.md      # Git onboarding + collaboration conventions
├── .gitignore  .gitattributes      # Git hygiene
├── ba/                             # BUSINESS ANALYSIS
│   ├── workspace/                  # Vùng làm việc cá nhân (local per member)
│   │   ├── input/                  # Tài liệu nguồn chỉ-đọc
│   │   │   ├── Customer_docs/      # Tài liệu do VNA cung cấp (DOCX/XLSX/PDF) — agent tự rã → 01-nguon
│   │   │   │   ├── Aircraft/       #   Dữ liệu tàu bay (FIMS, Netline, ACARS)
│   │   │   │   ├── Form/           #   Biểu mẫu vận hành (BCAO, Diversion Report…)
│   │   │   │   ├── Procedure/      #   SOP nghiệp vụ (Flight Dispatcher, KTKTB…)
│   │   │   │   ├── meeting-notes/  #   Transcript phỏng vấn + biên bản họp
│   │   │   │   └── INDEX.md        #   Index tra nhanh + trạng thái xử lý
│   │   │   ├── domain-knowledge/   # Kiến thức miền: ICAO, CAAV, FTL, glossary — HUMAN+AGENT song song
│   │   │   └── [source files]      # BBKS, BBLV, đề xuất kỹ thuật, VNA_TOSS…
│   │   └── drafts/                 # Nháp đang xây dựng (cá nhân, chưa thống nhất)
│   │       ├── phan-tich/          # Phân tích nghiệp vụ: As-Is/To-Be, gap analysis, đối chiếu
│   │       ├── brd/                # BRD drafts
│   │       ├── srs/                # SRS drafts
│   │       │   └── 03-dac-ta-chuc-nang/  # Đặc tả chức năng per phân hệ
│   │       ├── wireframe/          # Wireframe per phân hệ (mirror cấu trúc SRS)
│   │       ├── mockup/             # HTML mockup / prototype tương tác
│   │       ├── quy-trinh/          # Quy trình BA: phân công role, skill matrix, SOP
│   │       └── presentation/       # Presentation source (md + build script)
│   └── sync/                       # Tài liệu BA thống nhất giữa các member (shared source of truth)
│       ├── requirements/           # Yêu cầu đã xem xét & thống nhất
│       │   ├── brd/                # BRD đã review
│       │   ├── srs/                # SRS đã review
│       │   └── quan-ly-yeu-cau/    # NKLR — nhật ký kiểm soát thay đổi yêu cầu
│       ├── models/                 # Mô hình nghiệp vụ: BPMN, use case diagram, data model…
│       └── output/
│           ├── human/
│           │   ├── exports/        # Đầu ra Word/PDF có phiên bản (giao khách hàng/stakeholder)
│           │   └── presentation/   # PPTX + assets
│           └── agents/             # Đầu ra tối ưu cho agent DEV/QC: dense, machine-readable
├── dev/                            # DEVELOPMENT — source code
├── qc/                             # QUALITY CONTROL — test-plan / test-case / test-report
├── shared/                         # Cross-role: API contracts, data models, shared glossary
├── logs/
│   └── ba-sessions/                # BA session logs — auto-generated YYYY-MM-DD-HHMM.md per session
└── .claude/
    ├── agents/                     # AGENTS scope — agent definitions (EN)
    ├── commands/                   # AGENTS scope — slash commands (EN)
    ├── templates/ba/               # AGENTS scope — BA templates (EN)
    ├── glossary/                   # AGENTS scope — terminology dictionary
    ├── knowledge/                  # Domain knowledge references
    ├── rules/                      # DEV code rules (Angular 21 guidelines, performance)
    ├── workflows/                  # Multi-agent orchestration (gen-feature, integrate-api)
    ├── skills/export-word/         # AGENTS scope — Word export skill (Viettel QT02)
    ├── examples/ba/                # Example BA documents
    ├── sync/                       # Sync protocol, log, and hook scripts
    │   ├── SYNC-PROTOCOL.md
    │   ├── SYNC-LOG.md
    │   └── sync-check.ps1
    └── human/                      # HUMAN scope mirror (Vietnamese versions)
        ├── agents/
        ├── commands/
        ├── templates/ba/
        └── glossary/
```

**Canonical (AGENTS) vs Mirror (HUMAN):**
- AGENTS paths under `.claude/{agents,commands,templates,glossary}/` are loaded by Claude Code at runtime.
- HUMAN paths under `.claude/human/...` are for human reference only, not loaded at runtime.
- The two must remain semantically equivalent. See [SYNC-PROTOCOL.md](.claude/sync/SYNC-PROTOCOL.md).

**Naming conventions:**
- Filenames: `kebab-case`, no diacritics, no spaces.
- Document IDs: `BRD-TOSS-001`, `SRS-TOSS-002`, `FUNC-001`, `US-001`, `UC-001`, `CR-001`, `TC-001`…
- Published files include version + date: `BRD-TOSS-flight-ops-v1.0-2026-05-28.md`.
- Meeting minutes: `MM-YYYYMMDD-<topic>.md`.

---

## 5. Available Agents

| Agent | When to Use | Key Tools |
|---|---|---|
| **business-analyst** | Requirements analysis, BRD/SRS/FRD/URD, user stories, use cases, meeting minutes, change requests, gap analysis | Read, Grep, Glob, WebFetch, Write, Edit, TodoWrite |
| **project-coordinator** (PC) | Điều phối & nhắc nhở công việc dự án còn tồn đọng: tổng hợp điểm mở/OID, action item quá hạn, cờ `[cần xác nhận]`, mốc lộ trình/TASK chưa xong → báo cáo nhắc việc có ưu tiên (chỉ tổng hợp nguồn đã ghi, không tự quyết — §0/§0.3) | Read, Grep, Glob, Write, Edit, TodoWrite |
| **Explore** | Fast lookup of files / definitions / references | Read-only |
| **general-purpose** | Multi-step tasks not covered by a specialized agent | All tools |
| **Plan** | Plan implementation strategy for complex requests | Read-only |

**DEV/QC pipeline agents (frontend — Angular 21 / ESB-FE architecture):** in [`.claude/agents/`](.claude/agents/), chained BA → SA → Coder → Mock → i18n → Runtime-verify → QA → Review:

| Agent | When to Use |
|---|---|
| **02-sa** (Solution Architect) | Design file tree, shared interfaces/types from the BA spec |
| **03-coder** (Senior FE Developer) | Build UI (dumb) + logic (smart) components; apply dynamic-form-handler skill |
| **04-mock-data** | Generate realistic mock data/services for offline UI testing |
| **05-i18n** | Extract & manage i18n keys |
| **06-runtime-verifier** | Verify the running app behaves per spec |
| **07-qa** (QA Automation) | Write unit/component tests (`.spec.ts`) covering validation & dynamic rules |
| **code-reviewer** | Review Angular code against the FE checklist (44 items, 8 categories) |

> **Frontend stack (adopted):** Angular 21 · Signals · Standalone Components · Facade pattern · feature-based folders — see [`.claude/rules/angular-guidelines.md`](.claude/rules/angular-guidelines.md). Code-gen via `gen-*` commands/skills; multi-agent orchestration via [`.claude/workflows/`](.claude/workflows/).
>
> For BA tasks, prefer `business-analyst`. For frontend feature work, use the gen-* commands + the DEV pipeline agents above.

---

## 6. Reference Resources (AGENTS scope)

| Resource | Path | Purpose |
|---|---|---|
| BA Templates | [.claude/templates/ba/](.claude/templates/ba/) | EN-structured templates — produce VI deliverables |
| Terminology Dictionary | [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) | Bilingual BA terms — **MANDATORY lookup** before translating |
| business-analyst Agent | [.claude/agents/business-analyst.md](.claude/agents/business-analyst.md) | Role definition + language rules |
| Slash Commands | [.claude/commands/](.claude/commands/) | `/brd`, `/userstory`, `/asis-tobe`, `/stakeholder`, `/interview` |
| Word Export Skill | [.claude/skills/export-word/](.claude/skills/export-word/) | Export `.md` → polished, self-contained `.docx` per Viettel QT02.BM.04 |
| Word Reference Template | [.claude/templates/word-reference.docx](.claude/templates/word-reference.docx) | QT02 visual standard (Times New Roman, black headings, logo + footer) |
| Sync Protocol | [.claude/sync/SYNC-PROTOCOL.md](.claude/sync/SYNC-PROTOCOL.md) | Dual-scope sync rules |
| Sync Log | [.claude/sync/SYNC-LOG.md](.claude/sync/SYNC-LOG.md) | Append-only change history |

---

## 7. Language Rules (applies to ALL agents)

1. **Internal reasoning = English.** Chain-of-thought, tool calls, inter-agent coordination — English only.
2. **Human-facing output = 100% Vietnamese.** Reports, deliverables, clarifying questions — Vietnamese.
3. **Technical terms:** keep English in parentheses on first occurrence — `Tiêu chí chấp nhận (Acceptance Criteria)`. Use the Vietnamese form thereafter.
4. **DO NOT mix languages** within a paragraph/sentence/bullet of a user-facing document (parenthetical glossary terms are the only exception).
5. **DO NOT invent translations** for terms already in the [glossary](.claude/glossary/ba-terms-vi-en.md). If a term is missing, propose a tentative translation and flag it for inclusion.
6. **Proper nouns stay as-is:** ICAO, IATA, CAAV, MEL, FTL, OCC, ACARS, NOTAM, Jira, SAP, Oracle, etc.
7. **Aviation domain terms** (first occurrence in a document): provide Vietnamese name + English abbreviation in parentheses — e.g., `Trung tâm Kiểm soát Khai thác (OCC — Operational Control Center)`.
8. **Vietnamese placeholders in templates** (`{{TÊN_DỰ_ÁN}}`, `{{NGÀY_PHÁT_HÀNH}}`) **stay Vietnamese verbatim** — they are user-fillable fields in deliverables.

---

## 8. Output Conventions

**Deliverable file format:**
- Default: Markdown (`.md`).
- Diagrams: prefer Mermaid in Markdown; PlantUML / Draw.io when detailed BPMN is required.
- Large data tables: CSV alongside the main Markdown file.

**Storage location — workspace (individual):**
- Source inputs (read-only): `ba/workspace/input/` — meeting notes → `meeting-notes/`, aviation domain docs → `domain-knowledge/`, raw source files at root.
- In-progress analysis: `ba/workspace/drafts/phan-tich/`.
- BA process/governance docs (role matrix, SOP): `ba/workspace/drafts/quy-trinh/`.
- BRD drafts: `ba/workspace/drafts/brd/`.
- SRS drafts (chapter files + subsystem specs): `ba/workspace/drafts/srs/` and `srs/03-dac-ta-chuc-nang/`.
- Wireframe drafts: `ba/workspace/drafts/wireframe/` (mirror SRS subsystem naming).
- HTML mockup/prototype: `ba/workspace/drafts/mockup/`.
- Presentation source: `ba/workspace/drafts/presentation/`.

**Storage location — sync (team-shared):**
- Reviewed BRD: `ba/sync/requirements/brd/`.
- Reviewed SRS: `ba/sync/requirements/srs/`.
- Requirements change log (NKLR): `ba/sync/requirements/quan-ly-yeu-cau/`.
- Business models (BPMN, use cases, data models): `ba/sync/models/`.
- Versioned Word/PDF exports: `ba/sync/output/human/exports/`.
- Human-facing presentations: `ba/sync/output/human/presentation/`.
- Agent-optimized outputs: `ba/sync/output/agents/`.
- DO NOT write to `ba/workspace/input/` (read-only inputs only).
- DO NOT save deliverables in `.claude/human/` (that's for source-file mirrors only).
- Create a sub-folder when ≥ 3 documents exist for the same module.

**Mandatory YAML frontmatter:**
```yaml
---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "<name>"
version: "x.y"
date: "YYYY-MM-DD"
status: "Draft | Review | Approved"
document_type: "<BRD | SRS | FRD | URD | User Story | ...>"
---
```

**Document IDs:** `<TYPE>-TOSS-<NNN>` for main docs; prefix conventions for requirements (`BR-`, `FR-`, `NFR-`, `FUNC-`, `US-`, `UC-`, `TC-`, `CR-`, `RISK-`, `GAP-`, `DEC-`, `AI-`).

**Traceability:** every deliverable must cross-reference: BR → FR → FUNC → US/UC → TC. Update the Requirements Traceability Matrix on every change.

**Machine-read trackers = JSON/TSV (not Markdown).** Files an agent *edits structurally* (status trackers, the RTM) are kept in JSON/TSV — models are less likely to silently mis-edit JSON than Markdown (N4). Canonical machine sources: [`ba/sync/models/deliverable-status.json`](ba/sync/models/deliverable-status.json) (pass/fail tracker, maintained by `project-coordinator`) and [`ba/sync/models/RTM-template-v0.1.json`](ba/sync/models/RTM-template-v0.1.json) (RTM). Any `.md` companion is a human-readable **view** synced from the JSON; narrative deliverables stay Markdown.

**Word / human-facing export standard (MANDATORY):** Markdown is the agent-internal channel; Word/PDF handed to humans MUST be **self-describing and visually polished**. **This whole procedure is packaged as the `export-word` skill** — [.claude/skills/export-word/](.claude/skills/export-word/) (run `scripts/export-word.ps1` with a manifest; `build-reference-template.ps1` rebuilds the template). Prefer the skill over re-deriving the steps.

> **VERSIONING (MANDATORY — applies to ALL documents, not just exports):**
> 1. **File contains current content only.** No embedded CHANGELOG, history table, or "v0.x added Y" sections inside document files. A reader should see only what is true now, not how it got there.
> 2. **Version history → `BA-VERSION-LOG.md`.** All changes are logged in `ba/workspace/drafts/quy-trinh/BA-VERSION-LOG.md` (one row per version bump). Agents MUST append to this log whenever creating a new version.
> 3. **Version bump = new file + delete old.** When confirmed content changes significantly, create `<Name>-v<X.Y>.md` (new), delete the old file, update the relevant INDEX.md, and add a row to `BA-VERSION-LOG.md`. Git retains the old content in history.
> 4. **Exported filename always carries version + date:** `<Base>-v<Version>-<YYYY-MM-DD>.docx`. Never overwrite a finalized export — the skill refuses to overwrite unless `-Force` (drafts, same version/day only).

When exporting (pandoc):
1. **No internal file links.** Strip (a) every markdown link target that is not `http(s)`/`mailto` (keep the label); (b) bare `.md`/`.html` path+extension tokens; (c) leftover **filename-slug stems** that are the link *labels* (e.g. `3.1-phan-he-quan-ly-kho`, `wf-tram-mobile-tablet`) — regex matches a slug led by a section number or `wf-` so it does **not** touch English hyphen terms (`end-to-end`, `low-fidelity`) or ID codes (`MO-2026-012`, `BATCH-2026-…`). Keep real source docs `.xlsx`/`.docx`. Cross-references become plain section text ("xem 4.6"). See [`word-export-self-contained`].
2. **Apply the Word reference template** [`.claude/templates/word-reference.docx`](.claude/templates/word-reference.docx) via `--reference-doc`. **Visual standard is aligned to the official Viettel form `QT02.BM.04_Thiet ke chi tiet.docx`** (analyzed from the real template):
   - **Consistent font:** **Times New Roman 12pt** body (the QT02 standard); headings Times New Roman **bold**, sizes ~14/13/12pt (H1/H2/H3).
   - **Headings are BLACK** `#000000` (QT02 uses black, numbered hierarchy — do **not** color headings).
   - **Tables:** single **black** borders `#000000` 0.5pt (all sides); **header row shaded Xám nhạt `#D9D9D9` with bold black text** (the QT02 header style); cell padding for legibility.
   - Auto **Table of Contents** (`--toc`); locale `vi-VN`; readability first.
   - **Letterhead (QT02):** page **header = Viettel logo (`word/media/logo.png`) + "Tài liệu thiết kế chi tiết · vx.x"**; **footer = "BM.04 · QT.TKKDL.QTDL" + "Trang PAGE / NUMPAGES"** (top border).
3. **Rebuild the template** by unzipping `word-reference.docx` and editing: `word/styles.xml` (`docDefaults` → Times New Roman; heading `w:rFonts`/`w:color`/`w:sz`; Table style `w:tblBorders` black + `firstRow` `w:shd` fill `D9D9D9`); **set `word/theme/theme1.xml` major+minor `<a:latin>` to Times New Roman** (CRITICAL — pandoc's theme is `Aptos`; styles that reference theme fonts (Heading3–9, Subtitle, captions, TOC) fall back to it → inconsistent font unless the theme itself is TNR). Keep `VerbatimChar` as a monospace (`Consolas`) for code/ASCII alignment. Add `word/header1.xml` (logo `wp:inline` + title), `word/footer1.xml` (PAGE/NUMPAGES fields), `word/_rels/header1.xml.rels`, `word/media/logo.png`, `[Content_Types].xml` overrides, and `<w:headerReference>`/`<w:footerReference>` in the `document.xml` `sectPr`. **Re-zip with FORWARD-SLASH entry names** (NOT `ZipFile::CreateFromDirectory` — on .NET Framework it writes `\` and breaks OPC; iterate files and `CreateEntry(rel.Replace('\\','/'))`).
4. **Post-process each exported docx** (pandoc drops the reference's header image): inject `word/media/logo.png` + `word/_rels/header1.xml.rels` + `png` Default into `[Content_Types].xml` via a `ZipArchive` 'Update' patch. Source `.md` keeps its links (for agents); styling/letterhead applied **only at export**.
5. **QC the exported file** (read `word/document.xml`/`styles.xml`/`theme1.xml`). PASS criteria: `.md`=0, `](`=0, slug-stems=0, no leaked YAML keys, no mojibake; entries use `/` (no `\`); contains `word/media/logo.png` + `header1.xml` + `footer1.xml` + TOC field; all expected sections present; XML well-formed; **FONT consistent — every `w:ascii`/theme font is Times New Roman (theme latin = TNR, `Aptos`/`Calibri` count = 0); only `Consolas` allowed, and only for code/verbatim**. Fix and re-export until clean.

**Input processing — hai quy tắc theo loại thư mục (MANDATORY):**

### Customer_docs → Agent tự đọc và rã MD

Khi human thêm hoặc cập nhật file Office/PDF vào `ba/workspace/input/Customer_docs/` (DOCX, XLSX, PPTX, PDF):

**Loại trừ:** bulk binary (`ACARS/in-*.zip`), phần mềm (`PEP5.16/`), và file đã có `.extracted.md` không thay đổi.

Agent thực hiện ngay:

1. **Extract nội dung** → `ba/workspace/drafts/phan-tich/01-nguon/<tên-file>.extracted.md`
   - DOCX/PPTX: `python -m markitdown <file>` (nếu lỗi encoding → dùng thư viện `python-docx` trực tiếp)
   - XLSX: `python -m markitdown <file>` (nếu là Google Sheet live → `gsheet-to-md.py` với ID sheet)
   - PDF: `pdftotext -layout <file> -` rồi ghi ra `.extracted.md`
2. **Cập nhật `01-nguon/INDEX.md`** — thêm dòng mới (file + số đoạn/dòng + mô tả ngắn).
3. **Cập nhật `Customer_docs/INDEX.md`** — điền cột "Extracted" + cột "Trạng thái".
4. **Cập nhật TIMELINE-INPUT-DOCS.md** (mục A + B + bump version) rồi chạy `.claude/sync/check-input-timeline.ps1`.
5. Nếu phát hiện entry TIMELINE không có file tương ứng → thông báo BA Lead, **KHÔNG tự xóa** (§D2 của TIMELINE).

### domain-knowledge → Human và Agent song song

`ba/workspace/input/domain-knowledge/` chứa tài liệu tham khảo miền (ICAO, IATA, CAAV, FTL, glossary TOSS…).

- **Human:** thêm PDF/XLSX/DOCX tham khảo mới bất cứ lúc nào; không cần thông báo trước cho agent.
- **Agent:** cập nhật và bổ sung `toss-glossary-v0.1.md` và các file phân tích miền khi phát hiện thuật ngữ/khái niệm mới qua phỏng vấn hoặc tài liệu; KHÔNG tự xóa file do human thêm.
- **Khi xung đột** (cùng sửa một thuật ngữ/entry): BA Lead quyết định bản nào giữ.
- Agent **không** tự extract toàn bộ PDF domain-knowledge thành `.extracted.md` trừ khi được yêu cầu cụ thể — những file này thường quá lớn và dùng chọn lọc (Grep/Read đúng mục).

---

## 9. Sync Mechanism (CRITICAL)

This project uses a **dual-scope documentation system**. Every file under `.claude/{agents,commands,templates,glossary}/` and the root `CLAUDE.md` has a Vietnamese mirror under `.claude/human/...` or `HUMAN.md`.

**When you edit any tracked file:**

1. A `PostToolUse` hook (`.claude/sync/sync-check.ps1`) fires automatically and prints a `[SYNC]` reminder identifying the mirror file.
2. **You MUST update the mirror file in the same task before declaring done.**
3. Translate the change:
   - AGENTS → HUMAN: rewrite in Vietnamese, expand into clear prose, retain examples.
   - HUMAN → AGENTS: rewrite in English, condense into structured form.
4. Bump `version` and `date` in both files' frontmatter.
5. Log the sync in [`.claude/sync/SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).

**Exceptions (no mirror required):**
- `ba/workspace/*` — individual working area (input read-only, drafts in-progress).
- `ba/sync/output/*` — finalized outputs (human/ and agents/), single-language Vietnamese.
- `ba/sync/requirements/*` — reviewed BA deliverables, actively edited by team.
- `.claude/settings.local.json` — runtime config.
- `.claude/sync/*` — meta-files for the sync system.
- `logs/*` — auto-generated session logs; no mirror required.
- **DEV toolkit config** — `.claude/{agents/0*,agents/code-reviewer,commands/gen-*,rules/*,skills/gen-*,skills/dynamic-form-handler,skills/iam-table-integration,workflows/*}`: agent-facing technical config (Angular/ESB-FE), VI-primary; **no VI mirror required** (like `skills/export-word`).

Full protocol: [.claude/sync/SYNC-PROTOCOL.md](.claude/sync/SYNC-PROTOCOL.md).

---

*CLAUDE.md version 2.7 — 2026-06-17. Mirror: [HUMAN.md](HUMAN.md). Update both when project structure or conventions change.*
*v2.7: §0.5 Getting Bearings & Done-Discipline (định hướng đầu phiên, không tuyên bố hoàn thành sớm, tracker pass/fail derived-not-invented, SOP rà harness mỗi đời model); §8 — machine-read trackers (deliverable-status.json, RTM JSON) dùng JSON/TSV thay Markdown. Nguồn: `.claude/knowledge/agent-harness-engineering.md` (N1–N4). Kèm: hook guard-safety + quality-gate; few-shot scorecard cho ba-reviewer/requirement-validator/code-reviewer; PC v1.3 (Mode B quick-bearings + maintain tracker + handoff); business-analyst v2.1 (done-discipline).*
*v2.6: §8 — Versioning rule mở rộng toàn bộ tài liệu (không chỉ export): file chỉ chứa nội dung hiện tại, không nhúng CHANGELOG; lịch sử version ghi vào `BA-VERSION-LOG.md`; version bump = file mới + xóa file cũ.*
*v2.5: §4 + §8 — phân tách "Input processing" thành 2 quy tắc rõ ràng: (1) Customer_docs → agent tự extract DOCX/XLSX/PDF → 01-nguon + cập nhật INDEX + TIMELINE; (2) domain-knowledge → human + agent cập nhật song song, không có chủ sở hữu duy nhất. Cập nhật cây §4 để hiện rõ Customer_docs/ và domain-knowledge/.*
*v2.4: §8 — thêm Input tracking rule: agent cập nhật TIMELINE-INPUT-DOCS.md khi nhận file mới; script `.claude/sync/check-input-timeline.ps1` (Scan/Check/Both) chỉ báo cáo, không tự sửa; xác nhận xóa entry thiếu file là quyết định BA Lead.*
*v2.3: §5 — thêm subagent **project-coordinator (PC)**: điều phối & nhắc nhở công việc dự án còn tồn đọng (tổng hợp OID/roadmap/TASK/action item/cờ cần xác nhận thành báo cáo nhắc việc có ưu tiên; chỉ tổng hợp nguồn đã ghi, không tự quyết — §0/§0.3). Định nghĩa: `.claude/agents/project-coordinator.md` (+ mirror VI `.claude/human/agents/`).*
*v2.2: added §0.4 First-Session Identity & Role Setup — portable-folder handover rule: on a machine with no memory of the user, the agent must ask name/role/subsystem, cross-check PHAN-CONG-ROLE-BA, persist to memory, and gate role-bound actions until confirmed.*
*v2.1: §2 — bổ sung mục tiêu/phạm vi **OSP (Operational Schedule Performance)** (bổ trợ OTP); hệ thống phải đo lường & hỗ trợ duy trì khai thác bám sát lịch hoạch định.*
*v1.3: restructured ba/ to input/process/output(human+agents) — ba/sources→input, ba/deliverables/presentation→process/presentation and output/human/presentation; added ba/output/agents scaffold. Updated §4 tree, §8 storage, §9 exceptions.*
*v1.2: synced common framework from VTX — added §0.1 Document-Workflow Selection + "Active Document Workflow" field (chưa thiết lập) + knowledge [`ba-workflow-patterns.md`](.claude/knowledge/ba-workflow-patterns.md) (P1–P6); restructured to Git monorepo by role (`Sources_docs/`→`ba/sources/`, `deliverables/`→`ba/deliverables/`, added `dev/`,`qc/`,`shared/`,`README.md`,`CONTRIBUTING.md`,`.gitignore`,`.gitattributes`); portable hook/skill paths. (git init/commit pending — git not installed.)*
*v1.1: adopted common framework from VTX — added Section 0 (Human vs Agent governance), Section 8 Word-export standard + `export-word` skill, `word-reference.docx`, refreshed SRS template. Project-specific content (TOSS aviation domain) unchanged.*
