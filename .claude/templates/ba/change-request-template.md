---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_NGƯỜI_ĐỀ_XUẤT}}"
version: "2.0"
date: "2026-05-26"
status: "{{Submitted | Under Review | Approved | Rejected | Implemented}}"
document_type: "Change Request (CR)"
---

# Change Request — CR-{{NNN}}

## Table of Contents

1. [Request Information](#1-request-information)
2. [Change Description](#2-change-description)
3. [Justification](#3-justification)
4. [Impact Assessment](#4-impact-assessment)
5. [Effort & Cost Estimation](#5-effort--cost-estimation)
6. [Alternatives Considered](#6-alternatives-considered--optional) — *optional*
7. [Recommendation](#7-recommendation)
8. [Approval](#8-approval)
9. [Completion Checklist](#completion-checklist)

---

## 1. Request Information

**[Required]**

| Field | Value |
|---|---|
| CR ID | CR-{{NNN}} |
| Title | {{TIÊU_ĐỀ_NGẮN_GỌN}} |
| Submission Date | {{YYYY-MM-DD}} |
| Requester | {{TÊN}} ({{VAI_TRÒ}}) |
| Change Type | {{Scope / Requirement / Schedule / Cost / Quality}} |
| Urgency | {{High / Medium / Low}} |
| Priority | {{Must / Should / Could}} |
| Status | {{Submitted / Under Review / Approved / Rejected / Implemented}} |
| Related Documents | {{BRD/SRS/FRD/Sprint}} |

---

## 2. Change Description

**[Required]**

### 2.1 Current State
{{MÔ_TẢ_NỘI_DUNG_HIỆN_TẠI_HOẶC_ĐÃ_THỎA_THUẬN}}

### 2.2 Proposed State
{{MÔ_TẢ_THAY_ĐỔI_ĐỀ_XUẤT}}

### 2.3 Key Differences
- {{KHÁC_BIỆT_1}}
- {{KHÁC_BIỆT_2}}

> **Example:**
> - **Current state:** System supports payment via VNPay and MoMo.
> - **Proposed:** Add ZaloPay payment.
> - **Differences:** Need to integrate ZaloPay SDK, extend `payment_methods` table, update checkout UI.

---

## 3. Justification

**[Required]**

- **Problem / Opportunity:** {{MÔ_TẢ}}
- **Business Benefit:** {{LỢI_ÍCH_ĐỊNH_LƯỢNG_NẾU_CÓ}}
- **Consequence if not done:** {{...}}

> **Example:** 28% of customers feedback wanting to pay via ZaloPay (survey 04/2026). Adding this method is expected to increase conversion 5–8%, equivalent to 600 million VND revenue/month.

---

## 4. Impact Assessment

**[Required]**

### 4.1 Scope Impact
| Item | Impact |
|---|---|
| Requirements / Features | {{INCREASE/DECREASE/CHANGE}} |
| Affected Modules | {{DANH_SÁCH_MODULE}} |

### 4.2 Schedule Impact
- Current go-live date: {{YYYY-MM-DD}}
- Post-change go-live date: {{YYYY-MM-DD}}
- Variance: +/- {{N}} days

### 4.3 Cost Impact
- Additional cost: {{SỐ_TIỀN}} VND
- Budget source: {{...}}

### 4.4 Quality / Risk Impact
- {{RỦI_RO_PHÁT_SINH}}
- {{BIỆN_PHÁP_GIẢM_THIỂU}}

### 4.5 Resource Impact — *optional*
- Additional headcount: {{...}}
- Third-party dependencies: {{...}}

---

## 5. Effort & Cost Estimation

**[Required]**

| Item | Person-days | Unit Cost | Total |
|---|---|---|---|
| Analysis | 3 | {{...}} | {{...}} |
| Design | 5 | {{...}} | {{...}} |
| Development | 12 | {{...}} | {{...}} |
| Testing | 4 | {{...}} | {{...}} |
| Deployment | 1 | {{...}} | {{...}} |
| **Total** | **25** | | **{{TỔNG_CHI_PHÍ}}** |

---

## 6. Alternatives Considered — *optional*

| Option | Description | Pros | Cons | Assessment |
|---|---|---|---|---|
| A — Full deployment | {{...}} | {{...}} | {{...}} | Recommended |
| B — Phased deployment | {{...}} | {{...}} | {{...}} | Consider |
| C — Do nothing | Maintain current state | No added cost | Lost revenue opportunity | Not recommended |

---

## 7. Recommendation

**[Required]**

- **Recommendation from BA / PM:** {{Approve / Reject / Defer for further investigation}}
- **Basis for recommendation:** {{...}}

---

## 8. Approval

**[Required]**

| Role | Full Name | Signature | Date | Decision |
|---|---|---|---|---|
| Requester | {{TÊN}} | _______ | {{YYYY-MM-DD}} | — |
| BA / PM | {{TÊN}} | _______ | {{YYYY-MM-DD}} | {{Agree / Disagree}} |
| Change Control Board (CCB) | {{TÊN}} | _______ | {{YYYY-MM-DD}} | {{Approve / Reject}} |
| Sponsor | {{TÊN}} | _______ | {{YYYY-MM-DD}} | {{...}} |

---

## Completion Checklist

- [ ] CR ID is unique in CR-xxx format
- [ ] Current and proposed states clearly described
- [ ] Justification includes quantitative data/basis
- [ ] Full impact assessment: scope, schedule, cost, quality, resources
- [ ] Detailed effort estimation by phase
- [ ] At least 2 alternatives considered
- [ ] Clear recommendation with rationale
- [ ] Input from technical and business stakeholders gathered
- [ ] Submitted to Change Control Board (CCB) for review
- [ ] After approval, update BRD/SRS/FRD and new baseline
