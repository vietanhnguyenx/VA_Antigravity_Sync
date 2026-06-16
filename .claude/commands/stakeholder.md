---
description: Generate a RACI matrix and Power-Interest Grid for the project from the user-supplied stakeholder list and key activities.
argument-hint: (no argument — will ask interactively)
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion, Agent
version: "2.0"
---

# /stakeholder — Stakeholder Analysis

## Execution flow

### Step 1 — Collect the stakeholder list

Use `AskUserQuestion` to ask the user (up to 4 questions):

1. **Scope of application:** The entire VCM project or a specific module/initiative?
2. **Internal stakeholders:** List internal roles/individuals involved (e.g., Sponsor, PM, BA, Dev Lead, QA Lead, End Users, etc.).
3. **External stakeholders:** Any vendors, partners, or regulators involved?
4. **Key project activities/decisions** that need RACI assignment? (e.g., requirements approval, sign-off, deployment, training, etc.)

If information is insufficient, ask follow-ups; do not fabricate the list.

### Step 2 — Read references

- [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) — Group 4 (RACI, Stakeholder Analysis).
- [CLAUDE.md §3](CLAUDE.md#3-end-user-personas) — defined VCM personas.

### Step 3 — Delegate to business-analyst to produce 2 tables

#### 3.1 RACI Matrix

Format (output in Vietnamese):

| Hoạt động | Sponsor | PM | BA | Dev Lead | QA Lead | End User | Pháp chế | ... |
|---|---|---|---|---|---|---|---|---|
| Phê duyệt phạm vi dự án | **A** | C | R | I | I | C | I | |
| Soạn thảo BRD | I | C | **R/A** | I | I | C | I | |
| Duyệt thiết kế kỹ thuật | I | A | C | **R** | C | I | I | |
| Kiểm thử nghiệm thu (UAT) | I | A | C | C | C | **R** | I | |
| Đào tạo người dùng | I | A | R | C | I | C | I | |

Required rules:
- **R = Responsible** (Thực hiện) — may be multiple people.
- **A = Accountable** (Chịu trách nhiệm cuối cùng) — **exactly 1 person per activity**.
- **C = Consulted** (Tham vấn 2 chiều).
- **I = Informed** (Thông báo 1 chiều).
- Validate: no column should have too many R's (overload); every row must have exactly 1 A.

#### 3.2 Power-Interest Grid

A classification table by 4 quadrants (output in Vietnamese):

| Quyền lực ↑ / Quan tâm → | Quan tâm **Thấp** | Quan tâm **Cao** |
|---|---|---|
| Quyền lực **Cao** | **Keep Satisfied** (Giữ hài lòng) — VD: Sponsor cấp cao | **Manage Closely** (Quản lý sát sao) — VD: PM, Trưởng đơn vị sử dụng |
| Quyền lực **Thấp** | **Monitor** (Theo dõi) — VD: Phòng ban gián tiếp | **Keep Informed** (Cập nhật thường xuyên) — VD: End user, Hỗ trợ vận hành |

Each stakeholder must:
- Be placed in exactly 1 quadrant.
- Carry a concrete engagement strategy: meeting/report cadence, communication channel, focus topics.

#### 3.3 Stakeholder summary table

| Stakeholder | Vai trò | Quyền lực (C/T) | Quan tâm (C/T) | Góc phần tư | Chiến lược tương tác |
|---|---|---|---|---|---|
| {{TÊN}} | {{...}} | Cao/Thấp | Cao/Thấp | Manage Closely / Keep Satisfied / Keep Informed / Monitor | {{...}} |

### Step 4 — Save output

- File: `ba/process/stakeholder-analysis/Stakeholder-VCM-<scope-slug>-v1.0-<YYYY-MM-DD>.md`
- Standard YAML frontmatter.
- Content: (1) Bối cảnh, (2) Danh sách stakeholder, (3) Power-Interest Grid, (4) Ma trận RACI, (5) Chiến lược truyền thông, (6) Checklist hoàn thiện.

## Mandatory rules

- **All generated deliverable content MUST be in Vietnamese.** The agent reasons in English but produces Vietnamese output. Keep RACI / Power-Interest Grid framework names untranslated.
- Each RACI activity must have **exactly 1 A**. If multiple A's appear → warn the user to clarify.
- Never fabricate the stakeholder list. If information is missing, mark `{{CẦN_BỔ_SUNG}}` and ask follow-ups.

## After completion

Report:
1. Number of stakeholders analyzed.
2. Distribution across the 4 Power-Interest quadrants.
3. Warnings about activities without a clear A (if any).
4. Top 3 stakeholders recommended for early engagement.
