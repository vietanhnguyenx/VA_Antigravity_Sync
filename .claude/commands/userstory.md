---
description: Generate 3-7 user stories for a feature with Given-When-Then acceptance criteria and an INVEST check.
argument-hint: <feature name>
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion, Agent
version: "2.0"
---

# /userstory — Generate User Stories for a Feature

**Feature to decompose:** `$ARGUMENTS`

## Execution flow

### Step 1 — Clarify the feature (if needed)

If the feature name is vague or lacks context, use `AskUserQuestion` to ask up to 3 questions:

1. **Primary user** of the feature: who? (Cán bộ mua sắm / Quản lý / Kế toán / Other)
2. **Business objective:** What problem does this feature solve, or what value does it create?
3. **Feature scope:** Which capabilities are included? Which are excluded?

If the feature is already clear (BRD/FRD reference exists), skip this step.

### Step 2 — Read reference resources

- [.claude/templates/ba/user-story-template.md](.claude/templates/ba/user-story-template.md) — the standard template.
- [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) — Group 3 (Agile/Scrum).
- Existing BRD/FRD in `ba/process/` if relevant to the feature.

### Step 3 — Delegate to the business-analyst agent

Ask the agent to produce **3–7 user stories** (count depends on feature complexity) using the following structure (output literally in Vietnamese):

```
### US-VCM-NNN — <Tiêu đề ngắn>

**Là một** <persona>,
**tôi muốn** <hành động hoặc tính năng>,
**để** <giá trị nghiệp vụ>.

**Tiêu chí chấp nhận (Acceptance Criteria):**

AC-1: <Tên kịch bản>
- **Cho trước (Given)** <bối cảnh>
- **Khi (When)** <hành động>
- **Thì (Then)** <kết quả mong đợi>

AC-2: <Tên kịch bản phủ định / biên>
- Cho trước...
- Khi...
- Thì...

**Mức ưu tiên:** Must / Should / Could
**Ước lượng:** <story points>
```

Require the agent to ensure:
- Each story has **at least 2 Acceptance Criteria** (1 happy path + 1 negative/boundary case).
- Full feature coverage: main flow → alternate flows → error cases.
- Sequential `US-VCM-NNN` identifiers.

### Step 4 — INVEST check (REQUIRED)

After generation, the agent must self-check **every story** against INVEST:

| Criterion | Verification question |
|---|---|
| **I**ndependent | Can the story be delivered independently, not blocked by another story? |
| **N**egotiable | Are details still negotiable, not over-specified? |
| **V**aluable | Does it deliver clear value to the user? |
| **E**stimable | Can the development team estimate it? |
| **S**mall | Small enough to complete within one sprint? |
| **T**estable | Is each AC testable? |

If a story **fails** ≥ 1 criterion, **split it** or **add detail** and recheck.

### Step 5 — Save output

- File: `ba/process/user-stories/US-VCM-<feature-slug>-v1.0-<YYYY-MM-DD>.md`
- Standard YAML frontmatter per [CLAUDE.md §8](CLAUDE.md#8-output-conventions).
- Traceability table back to the Feature/Epic at the top of the file.

## Mandatory rules

- **All generated deliverable content MUST be in Vietnamese.** The agent reasons in English but produces Vietnamese output. Use the format "Là một... tôi muốn... để..." (NOT "As a...").
- Acceptance Criteria use the bilingual Vietnamese–English pairing: **Cho trước (Given) – Khi (When) – Thì (Then)** — keep this exact mapping.
- Personas must be specific (e.g., "Cán bộ Đấu thầu"), never the generic "người dùng".

## After completion

Report to the user:
1. Path to the generated user stories file.
2. Summary table: total stories, distribution by MoSCoW.
3. INVEST check results (which stories need further clarification).
