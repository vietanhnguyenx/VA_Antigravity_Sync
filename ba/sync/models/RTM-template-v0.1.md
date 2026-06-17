---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Ma trận Truy vết Yêu cầu (RTM)"
---

# Requirements Traceability Matrix (RTM) — TOSS

> Ma trận truy vết yêu cầu: đảm bảo mọi Business Requirement đều được phủ bởi Functional Requirement, và mọi FR đều được phủ bởi User Story / Test Case.
>
> **Cập nhật đồng bộ** mỗi khi SRS hoặc BRD thay đổi. Người duy trì: Senior BA được phân công.
>
> ⚙️ **Bản máy đọc (canonical):** [`RTM-template-v0.1.json`](RTM-template-v0.1.json). Khi **agent** chỉnh sửa RTM, sửa **bản JSON** rồi đồng bộ sang bảng .md này (JSON ít bị model ghi đè sai cấu trúc hơn — xem [agent-harness-engineering.md](../../.claude/knowledge/agent-harness-engineering.md) §A4 / N4). Bảng .md dưới đây là **view cho người đọc**.

---

## Hướng dẫn Sử dụng

| Cột | Ý nghĩa | Ví dụ |
|---|---|---|
| **BR-ID** | ID Yêu cầu Nghiệp vụ | BR-001 |
| **Mô tả BR** | Tên ngắn gọn của BR | Theo dõi trạng thái chuyến bay real-time |
| **FR-ID** | ID Yêu cầu Chức năng (từ SRS) | FR-011, FR-012 |
| **FUNC-ID** | ID đặc tả chức năng (từ §03-x) | FUNC-3.1.1 |
| **US-ID** | ID User Story tương ứng | US-011, US-012 |
| **TC-ID** | ID Test Case (do QC cung cấp) | TC-011 |
| **Trạng thái** | Mức độ phủ hiện tại | Phủ đầy đủ / Thiếu TC / Chưa có FR |
| **Ghi chú** | Rủi ro, câu hỏi, tham chiếu | Chờ xác nhận SH-02 |

---

## 3.1 — Quản lý Khai thác Bay (Flight Operations)

| BR-ID | Mô tả BR | FR-ID | FUNC-ID | US-ID | TC-ID | Trạng thái | Ghi chú |
|---|---|---|---|---|---|---|---|
| BR-101 | *(chưa có)* | | | | | Chưa có FR | |
| BR-102 | *(chưa có)* | | | | | Chưa có FR | |
| BR-103 | *(chưa có)* | | | | | Chưa có FR | |

---

## 3.2 — Quản lý Tổ bay (Crew Management)

| BR-ID | Mô tả BR | FR-ID | FUNC-ID | US-ID | TC-ID | Trạng thái | Ghi chú |
|---|---|---|---|---|---|---|---|
| BR-201 | *(chưa có)* | | | | | Chưa có FR | |
| BR-202 | *(chưa có)* | | | | | Chưa có FR | |
| BR-203 | *(chưa có)* | | | | | Chưa có FR | |

---

## 3.3 — Bảo dưỡng & Kỹ thuật Tàu bay

| BR-ID | Mô tả BR | FR-ID | FUNC-ID | US-ID | TC-ID | Trạng thái | Ghi chú |
|---|---|---|---|---|---|---|---|
| BR-301 | *(chưa có)* | | | | | Chưa có FR | |
| BR-302 | *(chưa có)* | | | | | Chưa có FR | |

---

## 3.4 — Khai thác Mặt đất (Ground Handling)

| BR-ID | Mô tả BR | FR-ID | FUNC-ID | US-ID | TC-ID | Trạng thái | Ghi chú |
|---|---|---|---|---|---|---|---|
| BR-401 | *(chưa có)* | | | | | Chưa có FR | |
| BR-402 | *(chưa có)* | | | | | Chưa có FR | |

---

## 3.5 — An toàn & Tuân thủ (Safety & Compliance)

| BR-ID | Mô tả BR | FR-ID | FUNC-ID | US-ID | TC-ID | Trạng thái | Ghi chú |
|---|---|---|---|---|---|---|---|
| BR-501 | *(chưa có)* | | | | | Chưa có FR | |
| BR-502 | *(chưa có)* | | | | | Chưa có FR | |

---

## 3.6 — Báo cáo & Thống kê

| BR-ID | Mô tả BR | FR-ID | FUNC-ID | US-ID | TC-ID | Trạng thái | Ghi chú |
|---|---|---|---|---|---|---|---|
| BR-601 | *(chưa có)* | | | | | Chưa có FR | |
| BR-602 | *(chưa có)* | | | | | Chưa có FR | |

---

## 3.7 — Master Data

| BR-ID | Mô tả BR | FR-ID | FUNC-ID | US-ID | TC-ID | Trạng thái | Ghi chú |
|---|---|---|---|---|---|---|---|
| BR-701 | *(chưa có)* | | | | | Chưa có FR | |
| BR-702 | *(chưa có)* | | | | | Chưa có FR | |

---

## Tóm tắt Độ phủ

| Phân hệ | Số BR | Có FR | Có US | Có TC | % Phủ |
|---|---|---|---|---|---|
| 3.1 — Khai thác Bay | 0 | 0 | 0 | 0 | — |
| 3.2 — Tổ bay | 0 | 0 | 0 | 0 | — |
| 3.3 — Bảo dưỡng | 0 | 0 | 0 | 0 | — |
| 3.4 — Mặt đất | 0 | 0 | 0 | 0 | — |
| 3.5 — An toàn | 0 | 0 | 0 | 0 | — |
| 3.6 — Báo cáo | 0 | 0 | 0 | 0 | — |
| 3.7 — Master Data | 0 | 0 | 0 | 0 | — |
| **Tổng** | **0** | **0** | **0** | **0** | **—** |

> **Ghi chú:** Điền số liệu sau khi BRD và SRS hoàn thành. Mục tiêu: 100% BR có FR, 100% FR có US.

---

## Nhật ký Cập nhật RTM

| Ngày | Phiên bản | Thay đổi | Người cập nhật |
|---|---|---|---|
| 2026-06-04 | v0.1 | Tạo template với 7 phân hệ | BA Lead |
