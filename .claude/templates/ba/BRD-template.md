---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "2.0"
date: "2026-05-26"
status: "{{Draft | Review | Approved}}"
document_type: "Business Requirements Document (BRD)"
---

# Business Requirements Document (BRD)

## Table of Contents

1. [Document Control](#1-document-control)
2. [Executive Summary](#2-executive-summary)
3. [Business Context](#3-business-context)
4. [Business Objectives](#4-business-objectives)
5. [Scope](#5-scope)
6. [Stakeholders](#6-stakeholders)
7. [Detailed Business Requirements](#7-detailed-business-requirements)
8. [Business Process](#8-business-process)
9. [Risks & Assumptions](#9-risks--assumptions)
10. [Appendix](#10-appendix--optional) — *optional*
11. [Completion Checklist](#completion-checklist)

---

## 1. Document Control

**[Required]**

| Field | Value |
|---|---|
| Project Name | {{TÊN_DỰ_ÁN}} |
| Project Code | {{MÃ_DỰ_ÁN}} |
| Version | {{PHIÊN_BẢN}} |
| Release Date | {{NGÀY_PHÁT_HÀNH}} |
| Status | {{Draft / Review / Approved}} |
| Author | {{TÊN_BA}} |
| Approver | {{TÊN_NGƯỜI_DUYỆT}} |

### Change History

| Version | Date | Changed By | Description |
|---|---|---|---|
| 1.0 | 2026-01-15 | Nguyễn Văn A | Initial release |
| {{X.Y}} | {{YYYY-MM-DD}} | {{TÊN}} | {{MÔ_TẢ}} |

---

## 2. Executive Summary

**[Required]** — Max 300 words, intended for executives.

Briefly describe: the business problem, proposed solution, value delivered, and expected investment.

> **Example:** The current order management system is processed manually, causing an average delay of 48 hours. Project {{TÊN_DỰ_ÁN}} proposes automating the order approval workflow to reduce the time to under 4 hours, with an expected savings of 1.2 billion VND/year.

---

## 3. Business Context

**[Required]**

- **Current Situation:** {{MÔ_TẢ_HIỆN_TRẠNG}}
- **Problem Statement:** {{VẤN_ĐỀ}}
- **Business Opportunity:** {{CƠ_HỘI}}
- **SWOT Analysis — *optional*:**
  - Strengths: {{...}}
  - Weaknesses: {{...}}
  - Opportunities: {{...}}
  - Threats: {{...}}

---

## 4. Business Objectives

**[Required]** — Objectives must be measurable using the SMART principle.

| ID | Objective | KPI | Quantitative Target |
|---|---|---|---|
| OBJ-001 | Reduce order processing time | Average time (hours) | From 48h to ≤ 4h by Q4/2026 |
| OBJ-{{NNN}} | {{MỤC_TIÊU}} | {{KPI}} | {{ĐỊNH_LƯỢNG}} |

---

## 5. Scope

**[Required]**

### 5.1 In-scope
- {{HẠNG_MỤC_1}}
- {{HẠNG_MỤC_2}}

### 5.2 Out-of-scope
- {{HẠNG_MỤC_LOẠI_TRỪ_1}}
- {{HẠNG_MỤC_LOẠI_TRỪ_2}}

> **Example — In-scope:** Integrate domestic payment gateways (VNPay, MoMo).
> **Example — Out-of-scope:** Integrate international payment gateways (later phase).

---

## 6. Stakeholders

**[Required]**

| Stakeholder | Role | Interest Level | Influence Level | Expectations |
|---|---|---|---|---|
| {{TÊN_BÊN}} | {{VAI_TRÒ}} | High / Medium / Low | High / Medium / Low | {{KỲ_VỌNG}} |

### RACI Matrix — *optional*

| Activity | Sponsor | PM | BA | Dev Lead | QA |
|---|---|---|---|---|---|
| Requirements approval | A | C | R | C | I |

(R = Responsible, A = Accountable, C = Consulted, I = Informed)

---

## 7. Detailed Business Requirements

**[Required]** — Apply MoSCoW prioritization (Must / Should / Could / Won't).

| ID | Requirement Description | Type | Priority | Source |
|---|---|---|---|---|
| BR-001 | The system must allow customers to place orders online 24/7 | Functional | Must | Customer survey 12/2025 |
| BR-{{NNN}} | {{MÔ_TẢ}} | {{Functional / Non-functional}} | {{Must/Should/Could/Won't}} | {{NGUỒN}} |

---

## 8. Business Process

**[Required]**

### 8.1 As-Is Process
{{MÔ_TẢ_HOẶC_SƠ_ĐỒ_BPMN_AS_IS}}

### 8.2 To-Be Process
{{MÔ_TẢ_HOẶC_SƠ_ĐỒ_BPMN_TO_BE}}

### 8.3 Key Changes
- {{KHÁC_BIỆT_1}}
- {{KHÁC_BIỆT_2}}

---

## 9. Risks & Assumptions

**[Required]**

### 9.1 Risks

| ID | Risk Description | Probability | Impact | Mitigation |
|---|---|---|---|---|
| RISK-001 | Insufficient operational resources after go-live | Medium | High | Plan training 1 month in advance |

### 9.2 Assumptions
- {{GIẢ_ĐỊNH_1}}
- {{GIẢ_ĐỊNH_2}}

---

## 10. Appendix — *optional*

- Glossary
- References
- Survey results, interview transcripts

---

## Completion Checklist

- [ ] Document control and change history fully completed
- [ ] Executive summary is concise, not exceeding 300 words
- [ ] Business objectives are measurable per SMART
- [ ] In-scope / Out-of-scope clearly defined, unambiguous
- [ ] Each business requirement has a unique ID (BR-xxx) and MoSCoW priority
- [ ] All stakeholders listed with influence/interest levels
- [ ] As-Is and To-Be processes diagrammed or described
- [ ] Risks assessed with probability, impact, and mitigation
- [ ] Assumptions stated clearly and verifiable
- [ ] Approval signatures from Sponsor/Approver obtained
