---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "2.0"
date: "2026-05-26"
status: "{{Draft | Ready | In Progress | Done}}"
document_type: "User Story"
---

# User Story — US-{{NNN}}

## Table of Contents

1. [Overview](#1-overview)
2. [Story Description](#2-story-description)
3. [Acceptance Criteria](#3-acceptance-criteria)
4. [Design / Technical Notes](#4-design--technical-notes--optional) — *optional*
5. [Dependencies](#5-dependencies--optional) — *optional*
6. [Completion Checklist](#completion-checklist)

---

## 1. Overview

**[Required]**

| Field | Value |
|---|---|
| Story ID | US-{{NNN}} |
| Title | {{TIÊU_ĐỀ_NGẮN_GỌN}} |
| Epic / Feature | {{EPIC-xxx}} |
| Sprint | {{SPRINT_NUMBER}} |
| Owner | {{TÊN_PO_HOẶC_BA}} |
| Estimate | {{STORY_POINTS}} |
| Priority | {{Must / Should / Could / Won't}} |
| Status | {{Backlog / Ready / In Progress / Done}} |

---

## 2. Story Description

**[Required]** — Standard format:

> **As a** {{LOẠI_NGƯỜI_DÙNG}},
> **I want** {{HÀNH_ĐỘNG_HOẶC_TÍNH_NĂNG}},
> **so that** {{GIÁ_TRỊ_HOẶC_MỤC_ĐÍCH}}.

> **Example:**
> As a **registered customer**, I want to **log in using an OTP sent via SMS**, so that **I don't need to remember a password while still maintaining security**.

### 2.1 Why — *optional*
Explain the business motivation, supporting data (e.g., 35% of users forget their password each month).

### 2.2 Context — *optional*
Reference to BRD/FRD or feedback from real users.

---

## 3. Acceptance Criteria

**[Required]** — **Given-When-Then** format.

### AC-1: {{TIÊU_ĐỀ_KỊCH_BẢN}}
- **Given** {{BỐI_CẢNH}}
- **When** {{HÀNH_ĐỘNG}}
- **Then** {{KẾT_QUẢ_MONG_ĐỢI}}

### AC-2: {{TIÊU_ĐỀ_KỊCH_BẢN}}
- **Given** {{...}}
- **When** {{...}}
- **Then** {{...}}

> **Illustrative Example — OTP Login:**
>
> **AC-1: Successful login with valid OTP**
> - **Given** the user has registered an account with phone number `0901234567`
> - **When** the user enters the correct OTP `123456` within 5 minutes of the request
> - **Then** the system redirects to the home page and displays the message "Login successful"
>
> **AC-2: Account locked after 5 incorrect OTP attempts**
> - **Given** the user has entered an incorrect OTP 4 consecutive times
> - **When** the user enters an incorrect OTP for the 5th time
> - **Then** the system locks the account for 15 minutes and sends a warning email

---

## 4. Design / Technical Notes — *optional*

- Planned API endpoint: `POST /api/v1/auth/otp/verify`
- SMS provider library: {{NHÀ_CUNG_CẤP}}
- Security note: do not log OTPs in server logs.
- Wireframe: {{LIÊN_KẾT}}

---

## 5. Dependencies — *optional*

| Dependency | Type | Description |
|---|---|---|
| US-005 | Predecessor | Account registration required first |
| Brand-name SMS Gateway | External | Contract signed with carrier |

---

## Completion Checklist

**INVEST** (Independent — Negotiable — Valuable — Estimable — Small — Testable)

- [ ] Story written in correct "As a… I want… so that…" format
- [ ] Actor is specific, not generic like "user"
- [ ] Each story delivers clear business value
- [ ] At least 2 Acceptance Criteria in Given-When-Then format
- [ ] Acceptance Criteria are testable
- [ ] Story is small enough to complete within 1 sprint
- [ ] Story points estimated
- [ ] MoSCoW priority assigned
- [ ] Dependencies on other stories listed
- [ ] Confirmed "Ready for Development" by Product Owner
