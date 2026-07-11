#!/usr/bin/env bash
# tao-khung-du-an-moi.sh — Dung khung BA tai su dung (sach, khac mien) tu TOSS.
# Giu: harness/governance + agent/skill/command/template/knowledge BA + hook.
# Bo: noi dung nghiep vu TOSS (Customer_docs, domain-knowledge hang khong, drafts, OID...),
#     pipeline DEV Angular (agents 0*, code-reviewer, gen-*, rules/*, workflows/*, mockup),
#     .secrets, logs phien, SYNC-LOG cu, settings.local.
# Dung: bash tao-khung-du-an-moi.sh [/d/BA-Framework]
set -euo pipefail
SRC="/d/TOSS"
DEST="${1:-/d/BA-Framework}"

# An toan: KHONG xoa de quy. Neu DEST da ton tai -> dung, de nguoi dung tu xu ly.
if [ -e "$DEST" ]; then
  echo "LOI: '$DEST' da ton tai. Xoa/doi ten thu cong roi chay lai (tranh mat du lieu)." >&2
  exit 1
fi
mkdir -p "$DEST"

cpf(){ mkdir -p "$DEST/$(dirname "$1")"; cp "$SRC/$1" "$DEST/$1"; }
cpd(){ mkdir -p "$DEST/$1"; cp -r "$SRC/$1/." "$DEST/$1/"; }

# --- Root (CLAUDE/HUMAN/AGENTS se duoc reset sau) ---
for f in CLAUDE.md HUMAN.md AGENTS.md README.md CONTRIBUTING.md .gitignore .gitattributes; do cpf "$f"; done

# --- Agents BA (bo DEV 0*, code-reviewer) ---
for a in business-analyst ba-reviewer requirement-validator ba-interviewer process-modeler project-coordinator; do
  cpf ".claude/agents/$a.md"; cpf ".claude/human/agents/$a.md"
done

# --- Commands BA (bo gen-*) ---
for c in asis-tobe brd interview meeting-notes stakeholder userstory; do cpf ".claude/commands/$c.md"; done
for c in asis-tobe brd interview stakeholder userstory; do cpf ".claude/human/commands/$c.md"; done

# --- Skills BA (bo gen-*, gen-mockup, dynamic-form, iam-table) ---
for s in crawl-pdf export-word meeting-synthesize survey-report term-check; do cpd ".claude/skills/$s"; done

# --- Templates / glossary / examples (full) ---
cpd ".claude/templates"; cpd ".claude/human/templates"
cpd ".claude/glossary"; cpd ".claude/human/glossary"
cpd ".claude/examples"; cpd ".claude/human/examples"

# --- Knowledge (bo angular-material-components.md) ---
cpd ".claude/knowledge"; rm -f "$DEST/.claude/knowledge/angular-material-components.md"
[ -d "$SRC/.claude/human/knowledge" ] && cpd ".claude/human/knowledge" || true

# --- Sync: hook + protocol (KHONG SYNC-LOG cu, KHONG settings.local) ---
for h in check-vietnamese format-markdown save-transcript sync-check check-input-timeline guard-safety quality-gate skill-lint; do cpf ".claude/sync/$h.ps1"; done
cpf ".claude/sync/SYNC-PROTOCOL.md"
cpf ".claude/settings.json"

# --- Skeleton thu muc (rong) ---
mkdir -p "$DEST"/ba/workspace/input/Customer_docs "$DEST"/ba/workspace/input/domain-knowledge
mkdir -p "$DEST"/ba/workspace/drafts/phan-tich "$DEST"/ba/workspace/drafts/brd \
         "$DEST"/ba/workspace/drafts/srs/03-dac-ta-chuc-nang "$DEST"/ba/workspace/drafts/wireframe \
         "$DEST"/ba/workspace/drafts/mockup "$DEST"/ba/workspace/drafts/quy-trinh \
         "$DEST"/ba/workspace/drafts/presentation
mkdir -p "$DEST"/ba/sync/requirements/brd "$DEST"/ba/sync/requirements/srs \
         "$DEST"/ba/sync/requirements/quan-ly-yeu-cau "$DEST"/ba/sync/models \
         "$DEST"/ba/sync/output/human/exports "$DEST"/ba/sync/output/human/presentation \
         "$DEST"/ba/sync/output/agents
mkdir -p "$DEST"/dev "$DEST"/qc "$DEST"/shared "$DEST"/logs/ba-sessions

# .gitkeep cho thu muc rong
find "$DEST"/ba "$DEST"/dev "$DEST"/qc "$DEST"/shared "$DEST"/logs -type d -empty -exec touch {}/.gitkeep \;

echo "BUILD DONE -> $DEST"
echo "Files: $(find "$DEST" -type f | wc -l)"
