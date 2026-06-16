---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "2.0"
date: "2026-05-26"
status: "{{Draft | Review | Approved}}"
document_type: "Use Case Specification"
---

# Use Case Specification — UC-{{NNN}}

## Table of Contents

1. [Overview](#1-overview)
2. [Actors](#2-actors)
3. [Pre-conditions](#3-pre-conditions)
4. [Main Flow / Basic Flow](#4-main-flow--basic-flow)
5. [Alternative Flow](#5-alternative-flow)
6. [Exception Flow](#6-exception-flow)
7. [Post-conditions](#7-post-conditions)
8. [Special Requirements](#8-special-requirements--optional) — *optional*
9. [Extension Points](#9-extension-points--optional) — *optional*
10. [Completion Checklist](#completion-checklist)

---

## 1. Overview

**[Required]**

| Field | Value |
|---|---|
| Use Case ID | UC-{{NNN}} |
| Use Case Name | {{TÊN_UC}} |
| Module | {{MODULE}} |
| Level | {{Summary / User Goal / Sub-function}} |
| Scope | {{HỆ_THỐNG_HOẶC_PHÂN_HỆ}} |
| Priority | {{Must / Should / Could}} |
| Author | {{TÊN_BA}} |

### Brief Description — **[Required]**
Describe the business goal of the UC in 1–2 sentences.

> **Example:** Allow customers to place orders online and pay via an electronic payment gateway.

---

## 2. Actors

**[Required]**

| Type | Actor Name | Role in UC |
|---|---|---|
| Primary | {{TÊN_ACTOR_CHÍNH}} | {{VAI_TRÒ}} |
| Secondary | {{TÊN_ACTOR_PHỤ}} | {{VAI_TRÒ}} |

> **Example:**
> - Primary actor: Customer
> - Secondary actor: VNPay Payment Gateway (External System)

---

## 3. Pre-conditions

**[Required]** — Conditions that must be true *before* the UC begins.

- {{ĐIỀU_KIỆN_1}}
- {{ĐIỀU_KIỆN_2}}

> **Example:**
> - Customer is logged in.
> - Cart contains at least 1 product.
> - Customer account is in "Active" state.

---

## 4. Main Flow / Basic Flow

**[Required]** — Successful scenario (Happy Path).

| Step | Actor | Action | System Response |
|---|---|---|---|
| 1 | Customer | Clicks "Checkout" button in cart | Displays order confirmation screen |
| 2 | Customer | Selects "VNPay" payment method | Displays "Continue Payment" button |
| 3 | Customer | Clicks "Continue Payment" | Redirects to VNPay gateway |
| 4 | VNPay Gateway | Returns "Success" result | Displays order confirmation screen, sends email |
| {{N}} | {{ACTOR}} | {{HÀNH_ĐỘNG}} | {{PHẢN_HỒI}} |

---

## 5. Alternative Flow

**[Required if there are multiple ways to achieve the goal]**

### 5.1 AF-1: {{TÊN_LUỒNG_THAY_THẾ}}
- **Branch point:** Step {{N}} in the main flow.
- **Condition:** {{ĐIỀU_KIỆN_RẼ_NHÁNH}}
- **Steps:**
  1. {{BƯỚC_1}}
  2. {{BƯỚC_2}}
- **Return to main flow at step:** {{N+1}} *or* "End of UC".

> **Example — AF-1: Pay with MoMo instead of VNPay**
> Branch point: Step 2. Customer chooses "MoMo" instead of "VNPay". System redirects to MoMo gateway. Returns to step 4.

---

## 6. Exception Flow

**[Required]** — Error situations and how to handle them.

### 6.1 EX-1: {{TÊN_NGOẠI_LỆ}}
- **Trigger point:** Step {{N}}.
- **Triggering condition:** {{ĐIỀU_KIỆN_LỖI}}
- **Handling:**
  1. System displays error message: "{{NỘI_DUNG}}"
  2. System logs the event.
  3. Customer can retry or exit.

> **Example — EX-1: Payment failed due to insufficient card balance**
> Trigger point: Step 4. VNPay gateway returns error code `99`. System displays "Transaction failed. Please check your balance or try another card." Order remains in "Pending Payment" state for 15 minutes.

---

## 7. Post-conditions

**[Required]**

### 7.1 Success Post-condition
- {{TRẠNG_THÁI_SAU}}

### 7.2 Failure Post-condition
- {{TRẠNG_THÁI_KHI_LỖI}}

> **Example:**
> - Success: Order status is "Paid"; inventory decreased accordingly; confirmation email sent.
> - Failure: Order remains "Pending Payment"; inventory unchanged.

---

## 8. Special Requirements — *optional*

- Performance: Payment step completes in ≤ 5 seconds after receiving gateway response.
- Security: Do not store credit card information on the system.
- Compliance: PCI-DSS Level 1.

---

## 9. Extension Points — *optional*

| Extension Point Name | Location | Extending Use Case |
|---|---|---|
| Apply discount code | Step 1 (Main flow) | UC-012 — Apply voucher |

---

## Completion Checklist

- [ ] UC ID is unique in UC-xxx format
- [ ] Primary and secondary actors clearly identified
- [ ] Pre-conditions specific and verifiable
- [ ] Main flow described sequentially with full actor-system interactions
- [ ] At least 1 alternative flow if UC has multiple completion paths
- [ ] All exception flows listed with handling steps
- [ ] Post-conditions distinguish between success and failure
- [ ] Use Case Diagram attached (for important UCs)
- [ ] Cross-references with FRD (FUNC-xxx) identified
- [ ] Accepted by user representative
