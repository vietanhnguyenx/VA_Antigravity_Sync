---
description: Generate a complete Business Requirements Document (BRD); delegates to the business-analyst agent.
argument-hint: <project or module name>
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion, Agent
version: "2.0"
---

# /brd — Generate Business Requirements Document (BRD)

**Target for BRD generation:** `$ARGUMENTS`

## Execution flow

### Step 1 — Gather input information (REQUIRED)

Before generating the BRD, **use `AskUserQuestion`** to ask the user the following (bundle up to 4 questions in a single call):

1. **Scope:** Which items are in scope? Which items are out of scope?
2. **Key Stakeholders:** Who is the sponsor, end users, and affected units?
3. **Business Objectives:** Quantitative goals (KPI, ROI, processing time, etc.)?
4. **Context & current problems:** What problem or opportunity drives the project?

### Step 2 — Read source documents

- Read [.claude/templates/ba/BRD-template.md](.claude/templates/ba/BRD-template.md) — the standard template.
- Read [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) — ensure terminology is used correctly.
- Read [CLAUDE.md](CLAUDE.md) — understand the VCM project context.
- Scan [ba/input/](ba/input/) for relevant business documents.

### Step 3 — Delegate to the business-analyst agent

Invoke the `business-analyst` agent with a clear prompt including:
- Project/module name: `$ARGUMENTS`
- The user's answers from Step 1
- Requirement to generate a complete BRD per the standard template (Sections 1–10 + Checklist)
- Requirement to apply MoSCoW prioritization to business requirements
- Requirement to render As-Is / To-Be Mermaid diagrams when process information is available

### Step 4 — Save output

- Filename: `ba/process/BRD/BRD-VCM-<slug-kebab-case>-v1.0-<YYYY-MM-DD>.md`
- Create directory `ba/process/BRD/` if it does not exist.
- Ensure the file has YAML frontmatter per the standard in [CLAUDE.md §8](CLAUDE.md#8-output-conventions).

## Mandatory rules

- **All generated deliverable content MUST be in Vietnamese.** The agent reasons in English but produces Vietnamese output — the BRD body must be standard Vietnamese business prose.
- English terms appear in parentheses on first occurrence: *Tiêu chí chấp nhận (Acceptance Criteria)*.
- Do not skip required sections of the template. If information is missing, mark `{{CẦN_LÀM_RÕ}}` instead of fabricating.
- Every business requirement must carry a `BR-VCM-NNN` ID and a MoSCoW priority.
- The document must end with the complete **Completion Checklist** from the template.

## After completion

Report back to the user (in Vietnamese):
1. Path to the generated BRD file.
2. Summary: number of business requirements, risks, assumptions.
3. Any `{{CẦN_LÀM_RÕ}}` items that need stakeholder confirmation before moving to `Review`.
