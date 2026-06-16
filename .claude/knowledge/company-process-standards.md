---
name: company-process-standards
description: Placeholder template for company-specific BA process standards. To be filled in by the user with internal company policies.
status: "PLACEHOLDER — TO BE FILLED BY USER"
version: "0.1"
date: "2026-05-26"
---

> Mirrored at `.claude/human/knowledge/company-process-standards.md`. Sync per [SYNC-PROTOCOL.md](../sync/SYNC-PROTOCOL.md).
>
> **STATUS: PLACEHOLDER.** This file is intentionally empty. Fill it with your company's internal standards. The Vietnamese mirror has the same structure with Vietnamese instructions.

# Company Process Standards (AGENTS scope)

## How to fill this file

This file documents **company-specific** BA standards that overrule generic guidance. Fill each section below with your organization's actual policy. Once filled:

1. Remove the `STATUS: PLACEHOLDER` note above.
2. Bump frontmatter `version` to `1.0`.
3. Bump `date` to today.
4. Sync the Vietnamese mirror at `.claude/human/knowledge/company-process-standards.md`.
5. Log the change in `.claude/sync/SYNC-LOG.md`.

Any agent that produces BA deliverables (`business-analyst`, `ba-reviewer`, etc.) is expected to **read this file first** and apply company standards in preference to generic defaults from [CLAUDE.md](../../CLAUDE.md) or the BABOK reference.

---

## 1. Document Approval Workflow

> **TODO:** Document the approval steps for each deliverable type. Who drafts → who reviews → who approves → where is sign-off recorded?

| Document type | Drafter | Reviewer(s) | Final Approver | Sign-off location |
|---|---|---|---|---|
| BRD | _e.g., BA Lead_ | _e.g., PM, Sponsor_ | _e.g., Sponsor_ | _e.g., Confluence approval workflow_ |
| SRS | | | | |
| FRD | | | | |
| User Story | | | | |
| Change Request | | | _e.g., CCB_ | |

---

## 2. Version Control Conventions for Deliverables

> **TODO:** Define how versions are numbered, when to bump major/minor, branching/baseline strategy.

- **Format:** _e.g., `vMAJOR.MINOR` (`v1.0`, `v1.1`, `v2.0`)_
- **Bump major when:** _e.g., scope changes, structural rewrite, post-approval re-baseline_
- **Bump minor when:** _e.g., content additions, clarifications inside an approved baseline_
- **Pre-approval drafts:** _e.g., `v0.X` until approved, then `v1.0`_
- **Baseline location:** _e.g., Git tag, SharePoint version, Confluence labeled version_

---

## 3. Standard File Naming Format

> **TODO:** Define the canonical naming pattern enforced for every deliverable file.

**Pattern:** `<TYPE>-<PROJECT>-<MODULE>-<v.MAJOR.MINOR>-<YYYY-MM-DD>.md`

Example: `BRD-VCM-contract-management-v1.0-2026-05-26.md`

**Rules:**
- _e.g., kebab-case, no spaces, no diacritics_
- _e.g., date in ISO 8601_
- _e.g., module is required for module-specific documents_
- _e.g., version always includes both major and minor_

---

## 4. SLA per Document Type

> **TODO:** Define expected turnaround time per deliverable, per stage.

| Document type | Draft → Review | Review → Revision | Revision → Approval | Total |
|---|---|---|---|---|
| BRD | _e.g., 5 working days_ | _e.g., 3 working days_ | _e.g., 5 working days_ | _e.g., 2–3 weeks_ |
| SRS | | | | |
| FRD | | | | |
| User Story | | | | |
| Change Request (Low/Medium impact) | | | | |
| Change Request (High/Critical impact) | | | | |
| Meeting Minutes | _e.g., within 24 hours_ | | | |

---

## 5. Additional Company-specific Rules

> **TODO:** Anything else specific to your organization — legal requirements, naming taboos, mandatory sections, escalation paths, etc.

- _Compliance requirements (e.g., Decree 13/2023/ND-CP on personal data)_
- _Mandatory document footer (e.g., confidentiality classification)_
- _Escalation path for blocked approvals_
- _Tooling requirements (Confluence space, Jira project key, etc.)_

---

*Once this file is filled, agents will treat it as authoritative for VCM-specific BA work. Vietnamese mirror: `.claude/human/knowledge/company-process-standards.md`.*
