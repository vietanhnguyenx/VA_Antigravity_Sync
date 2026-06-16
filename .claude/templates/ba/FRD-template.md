---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "2.0"
date: "2026-05-26"
status: "{{Draft | Review | Approved}}"
document_type: "Functional Requirements Document (FRD)"
---

# Functional Requirements Document (FRD)

> The FRD details the functional requirements described in the BRD/SRS, focusing on **system behavior** — it does not include technical design.

## Table of Contents

1. [Document Control](#1-document-control)
2. [Introduction](#2-introduction)
3. [Functional Overview](#3-functional-overview)
4. [Detailed Functional Specifications](#4-detailed-functional-specifications)
5. [Business Rules](#5-business-rules)
6. [Requirements Traceability Matrix](#6-requirements-traceability-matrix)
7. [Appendix](#7-appendix--optional) — *optional*
8. [Completion Checklist](#completion-checklist)

---

## 1. Document Control

**[Required]**

| Field | Value |
|---|---|
| Project Name | {{TÊN_DỰ_ÁN}} |
| Module | {{TÊN_MODULE}} |
| Version | {{PHIÊN_BẢN}} |
| Status | {{Draft / Review / Approved}} |
| Author | {{TÊN_BA}} |
| Approver | {{TÊN_NGƯỜI_DUYỆT}} |

### Change History

| Version | Date | Editor | Change Description |
|---|---|---|---|
| {{X.Y}} | {{YYYY-MM-DD}} | {{TÊN}} | {{MÔ_TẢ}} |

---

## 2. Introduction

### 2.1 Purpose — **[Required]**
Describe in detail the functions the system must provide, as the basis for design, development, and testing.

### 2.2 Scope — **[Required]**
- Applicable module: {{MODULE}}
- BRD reference: {{TÊN_BRD}} v{{X.Y}}

### 2.3 Audience — *optional*
Development, testing, architecture, and operations teams.

---

## 3. Functional Overview

**[Required]**

### 3.1 Function List

| ID | Function Name | Module | Priority | Source |
|---|---|---|---|---|
| FUNC-001 | OTP-based Login | Authentication | Must | BR-005 |
| FUNC-{{NNN}} | {{TÊN}} | {{MODULE}} | {{Must/Should}} | {{BR-xxx}} |

### 3.2 Function Hierarchy
{{SƠ_ĐỒ_CÂY_CHỨC_NĂNG_HOẶC_MÔ_TẢ}}

---

## 4. Detailed Functional Specifications

**[Required]** — Each function must have its own section following the structure below.

### 4.x FUNC-{{NNN}} — {{TÊN_CHỨC_NĂNG}}

| Field | Content |
|---|---|
| **Function ID** | FUNC-{{NNN}} |
| **Function Name** | {{TÊN}} |
| **Brief Description** | {{MÔ_TẢ_1_2_CÂU}} |
| **Actor** | {{Customer / Admin / External System}} |
| **Pre-condition** | {{ĐIỀU_KIỆN_TRƯỚC}} |
| **Input** | {{DANH_SÁCH_TRƯỜNG_DỮ_LIỆU}} |
| **Process** | {{LUỒNG_XỬ_LÝ_TỪNG_BƯỚC}} |
| **Output** | {{KẾT_QUẢ_TRẢ_VỀ}} |
| **Post-condition** | {{TRẠNG_THÁI_SAU}} |
| **Exceptions** | {{CÁC_TÌNH_HUỐNG_LỖI}} |
| **Related Non-functional Requirements** | {{NFR-xxx}} |

> **Example — FUNC-001: OTP-based Login**
> - **Actor:** Registered customer.
> - **Pre-condition:** Account in "Activated" state.
> - **Input:** Phone number (10 digits), OTP code (6 digits, valid for 5 minutes).
> - **Process:**
>   1. System validates phone number format.
>   2. Sends OTP via SMS.
>   3. Verifies user-entered OTP.
>   4. Creates a JWT session valid for 24 hours.
> - **Output:** Home page + login token.
> - **Exception:** 5 consecutive incorrect OTP entries → lock account for 15 minutes.

#### Validation Rules

| Field | Rule | Error Message |
|---|---|---|
| Phone number | 10 digits, starting with 0 | "Invalid phone number" |
| {{TRƯỜNG}} | {{QUY_TẮC}} | {{THÔNG_BÁO}} |

#### Wireframe / Mockup — *optional*
{{LIÊN_KẾT_HOẶC_HÌNH_ẢNH}}

---

## 5. Business Rules

**[Required]** — Business rules that apply across multiple functions.

| ID | Rule Description | Applicable Scope |
|---|---|---|
| BR-001 | Orders over 5 million VND must be approved by a manager | FUNC-010, FUNC-011 |
| BR-{{NNN}} | {{MÔ_TẢ}} | {{FUNC-xxx}} |

---

## 6. Requirements Traceability Matrix

**[Required]**

| Business Requirement (BR) | Function (FUNC) | Test Case (TC) | Status |
|---|---|---|---|
| BR-005 | FUNC-001 | TC-001, TC-002 | Implemented |
| {{BR-xxx}} | {{FUNC-xxx}} | {{TC-xxx}} | {{Status}} |

---

## 7. Appendix — *optional*

- Error code list
- Detailed state diagrams
- Cross-references to SRS

---

## Completion Checklist

- [ ] Each function has a unique FUNC-xxx ID
- [ ] Complete Input / Process / Output / Pre-condition / Post-condition
- [ ] Exceptions and error messages listed
- [ ] Validation rules defined for every input field
- [ ] Business rules separated and coded
- [ ] Traceability matrix from BR → FUNC → TC present
- [ ] Each function traceable to at least one business requirement
- [ ] Wireframes attached for key screens
- [ ] Reviewed for consistency with SRS and BRD
- [ ] Accepted by business representative
