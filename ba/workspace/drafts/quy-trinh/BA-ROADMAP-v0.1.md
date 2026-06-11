---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — BA Roadmap"
---

# BA Roadmap — TOSS

> Kế hoạch tổng thể các phase công việc BA từ Discovery đến Handoff. Ngày cụ thể do BA Lead điền sau khi xác nhận với Project Manager.

---

## 1. Tổng quan Các Phase

```
Phase 1          Phase 2           Phase 3          Phase 4         Phase 5
DISCOVERY   →   PHÂN TÍCH    →   TÀI LIỆU HÓA  →   REVIEW     →   HANDOFF
(2–3 tuần)      (3–4 tuần)       (4–6 tuần)        (2–3 tuần)     (1–2 tuần)
```

---

## 2. Chi tiết Từng Phase

### Phase 1 — Discovery (Khám phá)

**Mục tiêu:** Hiểu toàn bộ bối cảnh nghiệp vụ, thu thập yêu cầu ban đầu.

| Hoạt động | Skill/Tool | Output | Người thực hiện |
|---|---|---|---|
| Đọc và phân tích tài liệu nguồn | Đọc thủ công + ghi chú | Ghi chú phân tích trong `phan-tich/` | Senior BA |
| Phỏng vấn stakeholder | `/interview` | Câu hỏi phỏng vấn + biên bản | BA Lead + Senior BA |
| Xây dựng Stakeholder Register | `/stakeholder` | STAKEHOLDER-REGISTER | BA Lead |
| Khảo sát quy trình hiện tại | `/asis-tobe` | As-Is diagram (Mermaid) | Senior/Mid BA |
| Cập nhật domain knowledge | Đọc + ghi chú | Tài liệu trong `domain-knowledge/` | Junior/Intern |

**Milestone:** Hoàn thành As-Is cho tất cả 7 phân hệ + Stakeholder Register được duyệt.

---

### Phase 2 — Phân tích Yêu cầu

**Mục tiêu:** Xác định yêu cầu To-Be, phân tích khoảng cách, chuẩn bị nền tảng cho tài liệu hóa.

| Hoạt động | Skill/Tool | Output | Người thực hiện |
|---|---|---|---|
| Phân tích To-Be | `/asis-tobe` | To-Be diagram + Gap analysis | Senior BA |
| Phân tích khoảng cách | `/gap-analysis` *(đề xuất)* | Gap analysis per phân hệ | Senior BA |
| Tổng hợp yêu cầu nghiệp vụ | Thủ công + `/brd` | BR list draft | BA Lead + Senior BA |
| Phân tích phụ thuộc phân hệ | Thủ công | Subsystem interface map | Senior BA |
| Workshop xác nhận yêu cầu | Họp với stakeholder | Meeting notes + phản hồi | BA Lead |

**Milestone:** Gap analysis đầy đủ cho 7 phân hệ + BR list được stakeholder xác nhận.

---

### Phase 3 — Tài liệu hóa

**Mục tiêu:** Soạn thảo đầy đủ BRD, SRS, Wireframe, Mockup cho từng phân hệ.

| Hoạt động | Skill/Tool | Output | Người thực hiện |
|---|---|---|---|
| Soạn BRD | `/brd` | BRD-TOSS-001 | BA Lead + Senior BA |
| Soạn SRS từng chương | Thủ công + template | SRS 01–07 + 03-dac-ta-chuc-nang/ | Senior/Mid BA |
| Soạn Wireframe | Thủ công | wf-3.1 đến wf-3.7 | Mid BA |
| Dựng HTML Mockup | `gen-mockup` | mockup per phân hệ | Mid/Senior BA |
| Soạn User Story | `/userstory` | US per phân hệ (3–7 mỗi phân hệ) | Mid BA |
| Xây dựng RTM | Thủ công + template | RTM-TOSS | Senior BA |

**Milestone:** Toàn bộ SRS draft hoàn thành + Mockup được team nội bộ review.

---

### Phase 4 — Review & Validation

**Mục tiêu:** Xem xét, chỉnh sửa, phê duyệt tài liệu với stakeholder.

| Hoạt động | Skill/Tool | Output | Người thực hiện |
|---|---|---|---|
| Internal peer review | `ba-reviewer` agent | Danh sách comment | BA team |
| Stakeholder review session | Họp + bản trình bày | Phản hồi + sign-off | BA Lead + SH |
| Chỉnh sửa theo feedback | Thủ công | Phiên bản mới | Tác giả |
| BA Lead final approve | Thủ công | Status: Approved | BA Lead |
| Promote vào sync/ | Thủ công | File trong `sync/requirements/` | BA Lead |

**Milestone:** BRD + SRS được stakeholder sign-off, RTM hoàn chỉnh.

---

### Phase 5 — Handoff

**Mục tiêu:** Bàn giao tài liệu cho team DEV/QC, hỗ trợ onboarding.

| Hoạt động | Skill/Tool | Output | Người thực hiện |
|---|---|---|---|
| Xuất Word QT02 | `export-word` | Bộ tài liệu .docx | Senior BA |
| Tạo agent-optimized output | Thủ công | `sync/output/agents/` | Senior BA |
| Họp handoff DEV/QC | Họp | Meeting notes | BA Lead |
| Hỗ trợ Q&A trong sprint đầu | On-demand | — | BA team |

**Milestone:** DEV nhận và xác nhận đủ tài liệu để bắt đầu sprint 1.

---

## 3. Phân công Phân hệ theo Phase (Template)

> BA Lead điền tên nhân sự cụ thể. Xem thêm [PHAN-CONG-ROLE-BA-v0.1.md](PHAN-CONG-ROLE-BA-v0.1.md).

| Phân hệ | Mã | BA Chủ trì Phase 1 | BA Chủ trì Phase 2-3 | BA Review |
|---|---|---|---|---|
| Quản lý Khai thác Bay | 3.1 | *(chưa có)* | *(chưa có)* | BA Lead |
| Quản lý Tổ bay | 3.2 | *(chưa có)* | *(chưa có)* | BA Lead |
| Bảo dưỡng & Kỹ thuật | 3.3 | *(chưa có)* | *(chưa có)* | BA Lead |
| Khai thác Mặt đất | 3.4 | *(chưa có)* | *(chưa có)* | BA Lead |
| An toàn & Tuân thủ | 3.5 | *(chưa có)* | *(chưa có)* | BA Lead |
| Báo cáo & Thống kê | 3.6 | *(chưa có)* | *(chưa có)* | BA Lead |
| Master Data | 3.7 | *(chưa có)* | *(chưa có)* | BA Lead |

---

## 4. Risk & Giảm thiểu

| Risk | Xác suất | Tác động | Giảm thiểu |
|---|---|---|---|
| Stakeholder không sẵn sàng tham gia phỏng vấn | Trung bình | Cao | Lên lịch sớm, có backup người thay |
| Yêu cầu thay đổi nhiều sau Phase 2 | Cao | Cao | Áp dụng CHANGE-CONTROL-SOP chặt |
| BA team thiếu kiến thức miền hàng không | Cao | Trung bình | Đào tạo domain knowledge Phase 1 |
| Deadline bị ép sau Phase 3 | Trung bình | Cao | Buffer 20% thời gian mỗi phase |

---

## 5. Liên kết

- SOP luồng tài liệu: [SOP-LUONG-TAI-LIEU-v0.1.md](SOP-LUONG-TAI-LIEU-v0.1.md)
- Stakeholder: [STAKEHOLDER-REGISTER-v0.1.md](STAKEHOLDER-REGISTER-v0.1.md)
- Phân công role: [PHAN-CONG-ROLE-BA-v0.1.md](PHAN-CONG-ROLE-BA-v0.1.md)
