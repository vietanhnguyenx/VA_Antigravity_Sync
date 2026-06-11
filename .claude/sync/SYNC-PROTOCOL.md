# SYNC-PROTOCOL.md — Dual-Scope Documentation Sync

> **Auto-loaded into agent context.** This protocol governs how files in the AGENTS scope and HUMAN scope stay synchronized.

---

## 1. Architecture

Every documentation/configuration file in this project has **two parallel versions**:

| Scope | Path Pattern | Audience | Language |
|---|---|---|---|
| **AGENTS** (canonical) | `.claude/agents/`, `.claude/commands/`, `.claude/templates/`, `.claude/glossary/`, `CLAUDE.md` | AI agents — read by Claude Code at runtime | English-optimized (terse, structured) |
| **HUMAN** (mirror) | `.claude/human/...`, `HUMAN.md` | Human readers — stakeholders, BAs, new team members | Vietnamese (narrative, explanatory) |

The AGENTS scope is **canonical** (Claude Code loads from these paths). The HUMAN scope is a **semantic mirror** for human reference.

---

## 2. File Mapping

| AGENTS scope (canonical, EN) | HUMAN scope (mirror, VI) |
|---|---|
| `CLAUDE.md` | `HUMAN.md` |
| `.claude/agents/business-analyst.md` | `.claude/human/agents/business-analyst.md` |
| `.claude/commands/brd.md` | `.claude/human/commands/brd.md` |
| `.claude/commands/userstory.md` | `.claude/human/commands/userstory.md` |
| `.claude/commands/asis-tobe.md` | `.claude/human/commands/asis-tobe.md` |
| `.claude/commands/stakeholder.md` | `.claude/human/commands/stakeholder.md` |
| `.claude/commands/interview.md` | `.claude/human/commands/interview.md` |
| `.claude/templates/ba/BRD-template.md` | `.claude/human/templates/ba/BRD-template.md` |
| `.claude/templates/ba/SRS-template.md` | `.claude/human/templates/ba/SRS-template.md` |
| `.claude/templates/ba/FRD-template.md` | `.claude/human/templates/ba/FRD-template.md` |
| `.claude/templates/ba/user-story-template.md` | `.claude/human/templates/ba/user-story-template.md` |
| `.claude/templates/ba/use-case-template.md` | `.claude/human/templates/ba/use-case-template.md` |
| `.claude/templates/ba/meeting-minutes-template.md` | `.claude/human/templates/ba/meeting-minutes-template.md` |
| `.claude/templates/ba/change-request-template.md` | `.claude/human/templates/ba/change-request-template.md` |
| `.claude/templates/ba/gap-analysis-template.md` | `.claude/human/templates/ba/gap-analysis-template.md` |
| `.claude/templates/ba/test-scenario-template.md` | `.claude/human/templates/ba/test-scenario-template.md` |
| `.claude/glossary/ba-terms-vi-en.md` | `.claude/human/glossary/ba-terms-vi-en.md` |

---

## 3. Sync Rules

1. **When you edit an AGENTS file, you MUST update its HUMAN mirror in the same task** (and vice versa).
2. The two versions must remain **semantically equivalent** — same rules, same checklists, same examples (with examples localized where natural).
3. **Single source of truth:** AGENTS scope is canonical. On conflict, AGENTS wins; HUMAN is regenerated from AGENTS.
4. **Frontmatter consistency:** `version` and `date` fields must be identical across the pair.
5. **Preserve placeholders:** `{{TÊN_TRƯỜNG}}` style placeholders in templates stay verbatim — they are user-facing in deliverables and must remain Vietnamese.
6. **Cross-references:** internal links must point to the correct scope. AGENTS files link to AGENTS files; HUMAN files link to HUMAN files.

---

## 4. Sync Process

When you edit one file in a pair:

1. **Identify the mirror** via the table in Section 2.
2. **Read both files** to understand current state.
3. **Translate the diff:**
   - AGENTS → HUMAN: rewrite in Vietnamese, expand brief points into clear prose, retain examples (translate or localize).
   - HUMAN → AGENTS: rewrite in English, condense narrative into structured bullets/tables, keep examples.
4. **Update both files' frontmatter:** `version` (bump patch) and `date` (today, ISO 8601).
5. **Log the change** in `.claude/sync/SYNC-LOG.md` with: date, files affected, summary.
6. **Verify cross-references** still resolve correctly.

---

## 5. Automated Reminder (Hook)

A `PostToolUse` hook on `Edit`/`Write` operations (configured in `.claude/settings.local.json`) automatically reminds the agent when a tracked file is modified. The hook:

- Detects whether the edited path is in AGENTS or HUMAN scope.
- Outputs the corresponding mirror path that needs updating.
- Does NOT block the edit — it nudges the agent to follow up.

If the hook fires, the agent must complete the sync before declaring the task done.

---

## 6. Conflict Resolution

If two files in a pair have diverged significantly (different content, different timestamps):

1. **Read both fully.**
2. **Compute a 3-way diff** mentally: AGENTS vs HUMAN vs intended state.
3. **Surface the diff to the user** with a concrete proposal.
4. **Wait for user decision** — do not silently overwrite.
5. After resolution, update both files and log in `SYNC-LOG.md`.

---

## 7. Initial Migration (one-time)

The first-time mirror creation was performed on **2026-05-26**. All HUMAN files were generated from the existing canonical files which were originally written in Vietnamese; the canonical files were subsequently translated/condensed into English to optimize for agent parsing. See `SYNC-LOG.md` entry `MIG-001`.

---

## 8. Exclusions (NOT synced)

These files do NOT have mirrors and are not subject to this protocol:
- `ba/input/*` — external business documents, read-only.
- `ba/process/*` — generated outputs, single-language by design (Vietnamese, per CLAUDE.md §7).
- `.claude/settings.local.json` — runtime configuration, no human mirror needed.
- `.claude/sync/*` — meta-files for the sync system itself.

---

*SYNC-PROTOCOL.md version 1.0 — 2026-05-26.*
