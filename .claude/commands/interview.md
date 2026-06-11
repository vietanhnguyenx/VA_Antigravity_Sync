---
description: Generate 15-20 stakeholder interview questions for a specified role using 5W1H and open-ended question principles.
argument-hint: <role — e.g., PO, end user, dev lead, sponsor, accountant>
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion, Agent
version: "2.0"
---

# /interview — Generate Stakeholder Interview Question Set

**Role to interview:** `$ARGUMENTS`

## Execution flow

### Step 1 — Clarify interview context (if needed)

If the role is vague or needs more detail, use `AskUserQuestion` (up to 3 questions):

1. **Interview goal:** Initial discovery / Requirements validation / Current-process assessment / Other?
2. **Business focus area:** Which VCM module? (Hợp đồng / Nhà cung cấp / Thanh toán / Đấu thầu)
3. **Planned interview duration:** 30 / 60 / 90 minutes? (affects question count)

### Step 2 — Read references

- [CLAUDE.md §3](CLAUDE.md#3-end-user-personas) — VCM persona characteristics.
- [.claude/glossary/ba-terms-vi-en.md](.claude/glossary/ba-terms-vi-en.md) — keep terminology consistent in questions.

### Step 3 — Generate the question set following these principles

Generate **15–20 questions** for role `$ARGUMENTS`, observing:

#### Question principles
- **Open-ended:** start with "Anh/Chị có thể mô tả...", "Theo Anh/Chị...", "Điều gì khiến...". **Avoid** closed (Yes/No) questions.
- **5W1H:** cover **Who, What, When, Where, Why, How** for each main topic.
- **Non-leading:** do not hint at desired answers.
- **Neutral:** avoid internal jargon when interviewing end users.

#### Question set structure (by section)

| Section | # Questions | Goal |
|---|---|---|
| **1. Khởi động (Warm-up)** | 2–3 | Set the tone, learn about the interviewee's role |
| **2. Quy trình hiện tại (As-Is)** | 4–6 | Describe daily work, tools, forms in use |
| **3. Vấn đề & Điểm đau (Pain Points)** | 3–5 | Difficulties, wasted time, common errors |
| **4. Kỳ vọng & Mong muốn (Wishlist)** | 3–4 | If you had a "magic wand", what would you improve? |
| **5. Đo lường & Tiêu chí thành công** | 2–3 | Personal KPIs, definition of "success" |
| **6. Kết thúc & Mở rộng** | 1–2 | Who else should we interview? What documents to review? |

### Step 4 — Output format

Output literally in Vietnamese:

```markdown
# Bộ Câu Hỏi Phỏng Vấn — Vai trò: <ROLE>

## Thông tin chung
- **Vai trò:** <ROLE>
- **Mục tiêu phỏng vấn:** ...
- **Thời lượng dự kiến:** ... phút
- **Người phỏng vấn:** ...
- **Ngày dự kiến:** ...

## 1. Khởi động (Warm-up) — 5 phút

**Q1.** Anh/Chị có thể giới thiệu ngắn về vai trò hiện tại và công việc chính trong một ngày làm việc điển hình?
*Mục đích: tạo không khí + hiểu phạm vi vai trò.*

**Q2.** Anh/Chị đã làm vị trí này được bao lâu? Trước đây có làm vai trò nào liên quan không?
*Mục đích: đánh giá kinh nghiệm và mức am hiểu nghiệp vụ.*

## 2. Quy trình hiện tại (As-Is) — 15 phút

**Q3.** Anh/Chị có thể mô tả tuần tự các bước Anh/Chị thường làm khi <hoạt động chính theo role>?
*Mục đích: thu thập As-Is.*

... (tiếp tục Q4–Qn)

## 3. Vấn đề & Điểm đau ...
## 4. Kỳ vọng & Mong muốn ...
## 5. Đo lường ...
## 6. Kết thúc & Mở rộng ...

## Phụ lục — Câu hỏi dự phòng (Follow-up Prompts)
- "Anh/Chị có thể cho một ví dụ cụ thể gần đây không?"
- "Điều gì khiến vấn đề này quan trọng với Anh/Chị?"
- "Nếu phải xếp 3 ưu tiên cao nhất, Anh/Chị chọn gì?"
```

### Step 5 — Reference examples for 5 common roles

The agent should tailor questions to the role specifics:

| Role | Question focus |
|---|---|
| **Sponsor / BGĐ** | Strategic objectives, KPIs, budget, acceptable risk, definition of success |
| **Product Owner (PO)** | Roadmap, prioritization, trade-offs, market/user feedback |
| **End User** (Cán bộ Mua sắm, Kế toán / Tài chính, etc.) | Daily work, tools, forms, pain points, expectations |
| **Dev Lead / Architect** | Technical constraints, system integrations, tech debt, performance |
| **Pháp chế / Compliance** | Legal requirements, audit, traceability, personal data |

### Step 6 — Save output

- File: `ba/process/interview-guides/Interview-<role-slug>-v1.0-<YYYY-MM-DD>.md`
- Standard YAML frontmatter.

## Mandatory rules

- **All generated deliverable content MUST be in Vietnamese.** The agent reasons in English but produces Vietnamese output. Use the formal "Anh/Chị" form of address.
- Do not use hard-to-understand jargon when the role is end user — use everyday phrasing.
- Each question must include an italicized **purpose** note so the interviewer understands the "why".
- The follow-up prompt appendix is mandatory — it helps drill deeper when needed.

## After completion

Report:
1. Path to the question file.
2. Total questions and distribution across the 6 sections.
3. Recommended materials/data to prepare before the interview (current forms, screenshots, etc.).
