---
name: ai-agent-token-optimization
description: Token optimization strategies for Claude Agents in VS Code (Roo Code, Continue, custom agents) — prompt caching, RAG/context selection, session hygiene, per-role context rules. Includes fit assessment table and a 4-tier action plan.
source: Methodology synthesis + practical assessment for agentic coding workflows, 2026-06-03
version: "1.0"
date: "2026-06-03"
---

> Mirrored at `.claude/human/knowledge/ai-agent-token-optimization.md` (full Vietnamese version). Sync per [SYNC-PROTOCOL.md](../sync/SYNC-PROTOCOL.md).

# AI Agent Token Optimization — VS Code Agentic Coding (AGENTS scope)

Reference for anyone building or operating Claude agents in VS Code (Roo Code, Continue, custom agents). The core data flow is: agent reads codebase (large input) → Chain-of-Thought reasoning (long output) → file edits. Every strategy below is assessed against this specific pattern.

---

## Method fit assessment

| Method | Fit | Assessment for VS Code agent | Practical implementation |
|---|---|---|---|
| **Prompt Caching** | 🟢 Essential | Critical. Same codebase queried repeatedly. Without cache, each message re-reads all files → cost grows exponentially. | Use extensions with Anthropic cache support (e.g. Roo Code). System prompt auto-inserts cache breakpoints at directory structure. |
| **RAG / Context Selection** | 🟢 Essential | Agent cannot and should not load thousands of files. Need smart filtering to send only files relevant to current feature. | Use `@filename` / `@codebase` in extensions. Create `.aiignore` / `.cursorignore` to block junk dirs (node_modules, build). |
| **English Prompting** | 🟢 Highly Recommended | Code, libraries, error logs are all English. English instructions for analysis: 30–50% token saving vs Vietnamese. | Instruct in English ("Refactor this function to follow DRY principles" not the Vietnamese equivalent). |
| **Strict Output Formatting (JSON/XML)** | 🟡 Selective | Agent needs raw code or structured XML patches (e.g. `<search_and_replace>`). Forcing pure JSON can reduce natural code generation. | Let extensions handle output format. Tools like Roo Code already use optimized XML so Claude outputs only the changed section, not the whole file. |
| **Summary Anchoring** | 🟡 Selective | In a long session, chat history grows large. Summarizing helps, but risks agent "forgetting" logic constraints set early in the session. | Proactively Clear Chat and open a new window when switching to a new feature. Don't use one chat window for a whole day. |
| **LLMLingua / Prompt Compression** | 🔴 Not Recommended | This compression algorithm prunes tokens based on natural language. Applied to source code it may delete special characters and syntax, corrupting logic before it reaches Claude. | Do not use for coding / codebase understanding tasks. |

---

## Tier 1 — Mandatory foundation (Day 1)

### Prompt cache anchor placement

The order of context in each request determines cache hit rate:

```
[SYSTEM — cache_control: ephemeral]
  └─ Role + rules + project conventions   ← reused most often
[TOOLS — cache_control: ephemeral]
  └─ Tool definitions                      ← rarely changes
[HUMAN — cache_control: ephemeral]
  └─ Codebase snapshot (file tree + key files)
[HUMAN — NO cache]
  └─ Current-turn specific request
```

> Anchor must be placed **at the boundary between "rarely-changes / often-changes"**. Wrong placement (e.g. caching the user message too) = 100% cache miss.

### `.aiignore` setup (from day 1)

```
node_modules/   dist/   build/   .git/
*.lock   *.map   *.min.js   coverage/
logs/
```

**Project-specific (VTX):** also add `ba/input/pms-quan-tri-san-xuat/` (~122 reference articles — marked "not requirements" in SRS index; pure context noise for coding tasks).

**Project-specific (TOSS):** no equivalent large reference dump currently.

---

## Tier 2 — Task-type strategy

| Task type | Context strategy | Why |
|---|---|---|
| **New feature** | Spec + relevant interfaces + 1–2 example files | New features have few backward dependencies |
| **Debug / fix bug** | Error log + faulty file + its callers + test | Stack trace is the best context |
| **Refactor** | Full module being refactored + public interface | Agent needs to see the whole |
| **Review / audit** | Send diff/patch instead of full file | `git diff HEAD` is typically < 5% of full file size |

---

## Tier 3 — Session lifecycle hygiene

```
Start new feature
  → Open new chat  (don't drag in old history)
  → Anchor: paste CLAUDE.md / CONTRIBUTING.md short version into system
  → @mention only files relevant to this feature

During session (~1–2 hours)
  → Keep 1 chat per 1 feature
  → When context > ~50 turns: Clear and paste a short summary

End of session
  → Commit with clear message
  → Let git history be the long-term memory
```

> **Principle:** git history = long-term memory; chat window = working memory. Do not use chat window as git log.

---

## Tier 4 — Per-role context rules (monorepo)

With the `ba/dev/qc/shared` structure, folder boundaries become natural context boundaries:

```python
CONTEXT_RULES = {
    "ba_task":  ["ba/process/srs/**", ".claude/knowledge/**", "CLAUDE.md"],
    "dev_task": ["dev/src/**", "shared/**", "ba/process/srs/*/3.*.md"],
    "qc_task":  ["qc/**", "dev/src/**", "ba/process/srs/*/3.*.md"],
}
# EXCLUDE: ba/input/pms-*, logs/, exports/*.docx, ba/input/pms-*
```

---

## Priority implementation order

```
IMMEDIATE (cost ↓↓)
  ✓ .aiignore correct           → remove context noise
  ✓ Cache anchor correct        → cache hit > 80%

WEEK 1 (quality ↑)
  ✓ Rule: 1 feature = 1 chat window
  ✓ English for instructions; Vietnamese for spec/doc

WEEK 2–4 (scale)
  ✓ CONTEXT_RULES by role folder (ba/dev/qc)
  ✓ Diff-first workflow: send patch not full file for reviews
```

---

## Key insight

The real cost driver in agentic coding is not *request count* but *input size per request*. An agent re-reading 500 KB of codebase for every small question costs 10× more than one reading only 3 relevant files — with the same number of questions. Caching solves turn 2+; RAG/context selection solves turn 1.
