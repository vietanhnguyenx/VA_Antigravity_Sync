---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_BA}}"
version: "2.0"
date: "2026-05-26"
status: "{{Draft | Review | Approved}}"
document_type: "Gap Analysis Report"
---

# Gap Analysis Report

## Table of Contents

1. [Document Information](#1-document-information)
2. [Executive Summary](#2-executive-summary)
3. [Scope & Methodology](#3-scope--methodology)
4. [As-Is](#4-as-is)
5. [To-Be](#5-to-be)
6. [Gap Analysis](#6-gap-analysis)
7. [Recommendations](#7-recommendations)
8. [Roadmap](#8-roadmap--optional) — *optional*
9. [Appendix](#9-appendix--optional) — *optional*
10. [Completion Checklist](#completion-checklist)

---

## 1. Document Information

**[Required]**

| Field | Value |
|---|---|
| Project Name | {{TÊN_DỰ_ÁN}} |
| Analysis Scope | {{PHÂN_HỆ_HOẶC_QUY_TRÌNH}} |
| Version | {{PHIÊN_BẢN}} |
| Author | {{TÊN_BA}} |
| Status | {{Draft / Review / Approved}} |

---

## 2. Executive Summary

**[Required]** — Max 250 words.

Summarize 3 things: (1) reason for the analysis, (2) key findings, (3) overall recommendations.

> **Example:** The current order approval process has 6 manual touchpoints, averaging 48 hours. The largest gap is in the multi-level approval step. Recommend automating 4/6 touchpoints, expected to reduce time to 4 hours and save 1.2 billion VND/year.

---

## 3. Scope & Methodology

**[Required]**

### 3.1 Scope
- Process / module analyzed: {{...}}
- Survey period: {{FROM}} – {{TO}}
- Departments / units involved: {{...}}

### 3.2 Methodology
- Structured interviews with {{N}} stakeholders
- Direct process observation
- Existing document analysis
- Benchmark against industry standards / best practices

---

## 4. As-Is

**[Required]**

### 4.1 Current Process Description
{{SƠ_ĐỒ_BPMN_HOẶC_MÔ_TẢ_TUẦN_TỰ}}

### 4.2 Current Capabilities
| Category | Description | Assessment |
|---|---|---|
| People | {{...}} | {{Strong/Medium/Weak}} |
| Process | {{...}} | {{...}} |
| Technology | {{...}} | {{...}} |
| Data | {{...}} | {{...}} |

### 4.3 Current KPIs
| Metric | Current Value |
|---|---|
| Average processing time | 48 hours |
| Error rate | 7% |
| {{KPI}} | {{VALUE}} |

---

## 5. To-Be

**[Required]**

### 5.1 Target Process Description
{{SƠ_ĐỒ_BPMN_HOẶC_MÔ_TẢ_TUẦN_TỰ}}

### 5.2 Target Capabilities
| Category | Target Description |
|---|---|
| People | {{...}} |
| Process | {{...}} |
| Technology | {{...}} |
| Data | {{...}} |

### 5.3 Target KPIs
| Metric | Target Value | Target Date |
|---|---|---|
| Average processing time | ≤ 4 hours | Q4/2026 |
| Error rate | ≤ 1% | Q4/2026 |

---

## 6. Gap Analysis

**[Required]** — Detailed comparison table.

| ID | Item | As-Is | To-Be | Gap | Severity | Type |
|---|---|---|---|---|---|---|
| GAP-001 | Order approval | Manual 4 levels, email | Automated by rules + 1 exception level | Workflow engine needed | High | Technology |
| GAP-002 | Sales reporting | Weekly Excel export | Realtime dashboard | BI platform missing | Medium | Technology |
| GAP-003 | Data analysis skills | Limited | Dedicated Data Analyst team | Hiring + training | Medium | People |
| GAP-{{NNN}} | {{ITEM}} | {{AS_IS}} | {{TO_BE}} | {{GAP}} | {{High/Medium/Low}} | {{People/Process/Technology/Data}} |

### 6.1 Gap Classification
- **Capability gap:** {{N}} items
- **Process gap:** {{N}} items
- **Technology gap:** {{N}} items
- **Data gap:** {{N}} items

---

## 7. Recommendations

**[Required]**

| GAP ID | Recommendation | Priority (MoSCoW) | Estimated Effort | Expected Benefit |
|---|---|---|---|---|
| GAP-001 | Deploy workflow engine (Camunda or equivalent) | Must | 60 person-days | 90% reduction in approval time |
| GAP-002 | Build BI dashboard on Power BI | Should | 30 person-days | Realtime reporting |
| GAP-{{NNN}} | {{RECOMMENDATION}} | {{Must/Should/Could}} | {{...}} | {{...}} |

---

## 8. Roadmap — *optional*

| Phase | Timeline | Key Items | Dependencies |
|---|---|---|---|
| Phase 1 — Foundation | Q3/2026 | Workflow engine | None |
| Phase 2 — Automation | Q4/2026 | Migrate order approval process | Phase 1 |
| Phase 3 — Optimization | Q1/2027 | BI dashboard, training | Phase 2 |

---

## 9. Appendix — *optional*

- Interview transcripts
- Quantitative survey results
- Industry best practice references

---

## Completion Checklist

- [ ] Analysis scope clearly bounded
- [ ] Methodology documents data sources and sample size
- [ ] As-Is fully covers people, process, technology, data
- [ ] To-Be has quantitative target metrics and deadlines
- [ ] Each gap has a GAP-xxx ID, severity, and classification
- [ ] Recommendations linked to specific GAP IDs with MoSCoW priority
- [ ] Effort and expected benefit estimated
- [ ] Roadmap has clear dependency ordering
- [ ] Reviewed with business stakeholders
- [ ] Approved before moving to planning phase
