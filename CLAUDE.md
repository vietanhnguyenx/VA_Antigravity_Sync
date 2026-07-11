# CLAUDE.md — Project Context for AI Agents (TOSS)

> **Auto-loaded into every agent's context.**
> **DUAL-SCOPE ARCHITECTURE:** Every file in this project has a parallel mirror. See `.claude/sync/SYNC-PROTOCOL.md`.

@../ba-toolkit/CLAUDE.md

## PROJECT OVERRIDES — TOSS

### 1. Project Overview (override)

| Field | Value |
|---|---|
| **Project Name (VI)** | Hệ thống Điều hành Khai thác Hãng Hàng không |
| **Project Name (EN)** | Airline Operations Management System |
| **Code / Acronym** | TOSS |
| **Product Type** | Internal enterprise system |
| **Current Phase** | Discovery & Requirements Analysis |
| **End-user Language** | Vietnamese (all human-facing output) |
| **Primary Source Document** | `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` · `ba/workspace/input/VNA_TOSS.pptx` |
| **Active Document Workflow** | **P4 — Co-evolution Hybrid** |
| **Active Dev Philosophy** | *(none — chưa được yêu cầu)* |

### 2. Business Domain & Objectives (override)

**Business scope:**
- **Flight Operations Management** — flight scheduling, dispatch, operational control center (OCC) functions.
- **Crew Management** — crew rostering, qualifications tracking, duty-time compliance, reserve management.
- **Aircraft Maintenance & Technical Operations** — maintenance planning, airworthiness tracking, defect management.
- **Ground Handling Operations** — turnaround coordination, gate assignment, ground service requests.
- **Safety & Compliance Management** — safety reporting, audit trails, regulatory compliance (ICAO, IATA, CAAV).

**Business objectives:**
- Digitize and integrate the full airline operational cycle.
- Ensure compliance with Vietnam Civil Aviation Authority (CAAV) regulations and international aviation standards (ICAO Annex 6, IATA OCC standards).
- Maximize operational efficiency, on-time performance (OTP), **operational schedule performance (OSP)**, and crew utilization.
- Provide real-time visibility across all operational control functions.

### 3. End-user Personas (override)

| Persona | Primary Role | Key Concerns |
|---|---|---|
| **Operations Controller / Dispatcher** | Flight planning, dispatch release, OCC monitoring | Real-time flight status, disruption management, regulatory compliance |
| **Crew Scheduling Officer** | Crew rostering, reserve management, duty-time tracking | Fatigue regulations (FTL), crew qualification currency, last-minute changes |
| **Ground Operations Manager** | Turnaround coordination, gate management, ground service requests | On-time departure, resource allocation, aircraft handling standards |
| **Maintenance Planner** | Aircraft maintenance scheduling, airworthiness management | MEL compliance, maintenance window optimization, defect tracking |
| **Manager / Director** | Oversight, KPIs, regulatory audits | On-time performance dashboards, cost metrics, safety indicators |

### 5. Available Agents (TOSS-specific extensions)

**DEV/QC pipeline agents (frontend — Angular 21 / ESB-FE architecture):** in `.claude/agents/`, chained BA → SA → Coder → Mock → i18n → Runtime-verify → QA → Review:

| Agent | When to Use |
|---|---|
| **02-sa** (Solution Architect) | Design file tree, shared interfaces/types from the BA spec |
| **03-coder** (Senior FE Developer) | Build UI (dumb) + logic (smart) components; apply dynamic-form-handler skill |
| **04-mock-data** | Generate realistic mock data/services for offline UI testing |
| **05-i18n** | Extract & manage i18n keys |
| **06-runtime-verifier** | Verify the running app behaves per spec |
| **07-qa** (QA Automation) | Write unit/component tests (`.spec.ts`) covering validation & dynamic rules |
| **code-reviewer** | Review Angular code against the FE checklist |

> **Frontend stack:** Angular 21 · Signals · Standalone Components · Facade pattern · feature-based folders.

### P. Project-specific configs

- Định dạng Word: Sử dụng `word-reference.docx` nội bộ của dự án theo chuẩn QT02.BM.04.
- Thuật ngữ Domain: Tham khảo tại `.claude/knowledge/toss-glossary-v0.1.md`.

### A. Active Studio Packs — TOSS

> Định tuyến theo [`../.claude/ROUTER.md`](../.claude/ROUTER.md) + phân tầng model [`../.claude/knowledge/model-routing.md`](../.claude/knowledge/model-routing.md).
> Agent studio ở `../.claude/agents/` (cấp workspace) — TOSS tự thấy được, không cần copy.

| Pack | Trạng thái | Ghi chú |
|---|---|---|
| **BA** | ✅ Active | Core — giai đoạn Discovery |
| **Design** | 🟡 Một phần | Chỉ `uiux-designer` (màn hình Angular Material qua `gen-mockup`) + `design-reviewer` (accessibility). KHÔNG dùng `brand-designer` (hệ thống nội bộ, không cần branding) |
| **Dev** | ✅ Active | Pipeline Angular gốc (02-sa→07, code-reviewer) + `system-architect` + `typescript-reviewer` + `build-error-resolver` |
| **QA** | ✅ Active | `test-planner`, `e2e-runner` (Playwright), `security-reviewer` (OWASP), `qa-automation`(07) |
| **Marketing** | ❌ Off | Hệ thống doanh nghiệp nội bộ — không có nhu cầu marketing |

**Lưu ý stack:** TOSS dùng **Angular 21** → giữ `code-reviewer` + FE checklist làm reviewer chính; `typescript-reviewer` (ecc) chạy bổ trợ cho phần TS chung.
