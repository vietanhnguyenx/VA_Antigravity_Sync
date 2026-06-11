---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA_HOẶC_QA}}"
version: "2.0"
date: "2026-05-26"
status: "{{Draft | Review | Approved | Executed}}"
document_type: "Test Scenario"
---

# Test Scenario — TS-{{NNN}}

## Table of Contents

1. [Overview](#1-overview)
2. [Test Objective](#2-test-objective)
3. [References](#3-references)
4. [Environment & Test Data](#4-environment--test-data)
5. [Test Case List](#5-test-case-list)
6. [Detailed Test Case Specification](#6-detailed-test-case-specification)
7. [Entry / Exit Criteria](#7-entry--exit-criteria--optional) — *optional*
8. [Execution Report](#8-execution-report--optional) — *optional*
9. [Completion Checklist](#completion-checklist)

---

## 1. Overview

**[Required]**

| Field | Value |
|---|---|
| Test Scenario ID | TS-{{NNN}} |
| Scenario Name | {{TÊN}} |
| Module / Function | {{MODULE / FUNC-xxx}} |
| Test Type | {{Functional / Integration / UAT / Regression / Performance}} |
| Priority | {{High / Medium / Low}} |
| Author | {{TÊN}} |
| Executor | {{TÊN_TESTER}} |
| Build Version | {{X.Y.Z}} |

---

## 2. Test Objective

**[Required]**

Describe the scenario goal in 1–2 sentences.

> **Example:** Verify the user can successfully log in via SMS OTP and that the account is locked after 5 incorrect attempts.

---

## 3. References

**[Required]**

| Type | ID / Name | Version |
|---|---|---|
| Business Requirement | BR-005 | 1.2 |
| Function | FUNC-001 | 1.0 |
| User Story | US-010 | 1.0 |
| Use Case | UC-003 | 1.1 |

---

## 4. Environment & Test Data

**[Required]**

### 4.1 Environment
| Component | Value |
|---|---|
| URL | {{https://staging.example.vn}} |
| Browsers | Chrome 124+, Edge 124+ |
| OS | Windows 11, iOS 17 |
| Screen Size | Desktop 1920×1080, Mobile 390×844 |

### 4.2 Test Data
| Field | Sample Value |
|---|---|
| Phone number | 0901234567 |
| Valid OTP | 123456 (sandbox configuration) |
| Test account | test_user_01 |

---

## 5. Test Case List

**[Required]**

| TC ID | Name | Type | Priority | Automated |
|---|---|---|---|---|
| TC-001 | Successful login with valid OTP | Happy path | High | Yes |
| TC-002 | Failed login with invalid OTP | Negative | High | Yes |
| TC-003 | Account lock after 5 incorrect OTPs | Boundary | High | Yes |
| TC-004 | OTP expires after 5 minutes | Boundary | Medium | No |
| TC-{{NNN}} | {{TÊN}} | {{TYPE}} | {{PRIORITY}} | {{Yes/No}} |

---

## 6. Detailed Test Case Specification

**[Required]** — Repeat the block below for each test case.

### TC-{{NNN}} — {{TÊN_TEST_CASE}}

| Field | Content |
|---|---|
| **Test Case ID** | TC-{{NNN}} |
| **Requirement Link** | {{BR-xxx / FUNC-xxx / US-xxx}} |
| **Precondition** | {{ĐIỀU_KIỆN_TRƯỚC_KHI_CHẠY}} |
| **Input Data** | {{DỮ_LIỆU_CỤ_THỂ}} |

#### Steps

| # | Action | Expected Result | Actual Result | Pass / Fail |
|---|---|---|---|---|
| 1 | {{HÀNH_ĐỘNG_1}} | {{KỲ_VỌNG_1}} | {{FILL_AT_EXECUTION}} | {{Pass / Fail}} |
| 2 | {{HÀNH_ĐỘNG_2}} | {{KỲ_VỌNG_2}} | {{...}} | {{...}} |

| **Postcondition** | {{TRẠNG_THÁI_SAU_KHI_CHẠY}} |
|---|---|
| **Overall Result** | {{Pass / Fail / Blocked}} |
| **Notes / Evidence** | {{Screenshot / Log / Video}} |

> **Example — TC-001: Successful login with valid OTP**
>
> | Field | Content |
> |---|---|
> | Precondition | Account `0901234567` is in "Active" state, not locked |
> | Input Data | Phone: `0901234567`, OTP: `123456` |
>
> | # | Action | Expected Result | Actual Result | Pass/Fail |
> |---|---|---|---|---|
> | 1 | Open `/login` page | Login form displayed | Displayed correctly | Pass |
> | 2 | Enter phone `0901234567`, click "Send OTP" | System sends OTP via SMS, shows OTP input field | OK | Pass |
> | 3 | Enter OTP `123456`, click "Confirm" | Redirect to `/home`, display "Login successful" | OK | Pass |
>
> - **Postcondition:** JWT session valid for 24 hours, log records `login_success` event.
> - **Conclusion:** Pass.

---

## 7. Entry / Exit Criteria — *optional*

### 7.1 Entry Criteria
- Build deployed to staging environment
- Test data loaded
- All Test Cases reviewed

### 7.2 Exit Criteria
- 100% of High-priority TCs executed
- ≥ 95% of TCs Pass
- No open Critical/High defects
- Report approved by Test Lead

---

## 8. Execution Report — *optional*

| Metric | Value |
|---|---|
| Total TCs | {{N}} |
| Pass | {{N}} ({{%}}) |
| Fail | {{N}} ({{%}}) |
| Blocked / Skipped | {{N}} ({{%}}) |
| Defects found | {{N}} (Critical: {{x}}, High: {{y}}, Medium: {{z}}, Low: {{w}}) |
| Execution Date | {{YYYY-MM-DD}} |

---

## Completion Checklist

- [ ] Scenario ID (TS-xxx) and test case IDs (TC-xxx) are unique
- [ ] Each TC traceable to a specific business/functional requirement
- [ ] Preconditions are clear and reproducible
- [ ] Test data is specific, not vague ("valid data")
- [ ] Steps are clear, each with a corresponding expected result
- [ ] Postconditions are verifiable
- [ ] Includes Happy path, Negative, and Boundary test cases
- [ ] Priority levels assigned (High/Medium/Low)
- [ ] Entry and Exit criteria clearly defined
- [ ] Space provided for evidence (screenshot/log) after execution
