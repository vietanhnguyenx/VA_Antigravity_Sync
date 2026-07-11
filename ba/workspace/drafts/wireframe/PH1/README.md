---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
status: "Draft"
document_type: "Wireframe Index (low-fidelity)"
document_id: "WF-INDEX-PH1-DSP-MON"
---

# Wireframe low-fidelity — Cụm màn hình giám sát điều phái (Phân hệ 1)

> **Phạm vi:** vẽ wireframe low-fidelity (ASCII) cho 4 cụm màn hình giám sát của điều phái thuộc Phân hệ 1 — Thông tin điều hành chuyến bay. Bám sát phân rã FUNC `PHAN-RA-BRD-PH1-thong-tin-dieu-hanh-chuyen-bay-v0.5.md` và mô hình dữ liệu khái niệm `DATA-MODEL-KHAI-NIEM-man-giam-sat-dieu-phai-v0.2.md`.
>
> **Nguyên tắc (CLAUDE.md §0 + Workflow P4):**
> - **Bám FUNC + entity map** — không bịa chức năng/trường ngoài nguồn; trường/khái niệm chưa rõ ghi `[cần xác nhận]`.
> - **Low-fidelity, tech-agnostic** — bố cục bằng khung ký tự ASCII (`┌─┐│└┘`); chưa cần component PrimeNG/Angular cụ thể; tập trung vào: bố cục, thành phần, dữ liệu hiển thị, tương tác/trạng thái.
> - **Co-evolution (P4)** — bất kỳ khác biệt nào phát hiện khi vẽ wireframe phản hồi ngược về phân rã FUNC và mô hình dữ liệu khái niệm.
> - **Truy vết** — mỗi wireframe cite BR/FUNC cha + nguồn khảo sát + thực thể dữ liệu.

## Danh mục wireframe

| # | File | Mục tiêu màn | BR / FUNC liên quan |
|---|---|---|---|
| 1 | [`wf-monitoring-overview.md`](wf-monitoring-overview.md) | Monitoring overview real-time (Phase 4 Pre-Departure + Phase 5 In-Flight) cho điều phái viên — bảng ~20 dòng × 20–30 cột, server-push, cảnh báo màu/nhấp nháy gắn mốc ACARS OUT/OFF/ON/IN | BR-125; FUNC-204 → FUNC-210 |
| 2 | [`wf-kiem-tra-dau-ca.md`](wf-kiem-tra-dau-ca.md) | Màn hình tập trung kiểm tra đầu ca (Start-of-Shift Check) — gom 9 nhóm kiểm tra + tự đối chiếu chéo + cảnh báo + deep-link sang hệ thống chuyên dụng | BR-114; FUNC-148 → FUNC-159 (tham chiếu BR-115 / FUNC-160 → 162) |
| 3 | [`wf-giam-sat-truc-ban-truong.md`](wf-giam-sat-truc-ban-truong.md) | Màn giám sát của trực ban trưởng (OCC Duty Manager) — trạng thái khai thác + khách nối chuyến; hỗ trợ xem nhiều cấp tổng quan → chi tiết chuyến → chi tiết khách | BR-113; FUNC-144, FUNC-146, FUNC-147 |
| 4 | [`wf-giam-sat-tai-lieu.md`](wf-giam-sat-tai-lieu.md) | Màn giám sát của cán bộ tài liệu + dashboard tài liệu chuyến (luồng Request/Confirm/Reject + quản lý phiên bản OFP/LS/GD/PM/NOTOC/Cargo/Mail) | BR-113 (cán bộ tài liệu) + BR-112 (dashboard tài liệu); FUNC-139 → FUNC-143, FUNC-145, FUNC-146 |

## Lưu ý chung

- **Cấu hình hiển thị (ẩn/hiện cột)** thuộc BR-102 (FUNC-104, FUNC-105) — áp dụng đồng đều cho cả 4 màn, không vẽ lại ở từng file.
- **Cảnh báo bằng màu** áp BR-103 / FUNC-106, FUNC-107 (định nghĩa loại cảnh báo) + BR-125 / FUNC-210 (gắn raise/clear theo mốc ACARS) — quy ước màu thống nhất giữa các màn:
  - Đỏ đậm + nhấp nháy = bắt buộc xử lý ngay.
  - Vàng = ghi nhận, cần theo dõi.
  - Xanh = bình thường / đã clear.
  - Xám = chưa có dữ liệu / không áp dụng.
- **Bật/tắt cảnh báo (BR-132 / FUNC-231 → 235)** — không vẽ trong cụm này, sẽ làm trong cụm cấu hình hệ thống.
- **Đa Carrier (BR-106 / FUNC-113, FUNC-114)** — bộ lọc "Hãng vận chuyển (Carrier)" mặc định gồm VN, 0V, BL.

## Các điểm `[cần xác nhận]` tổng hợp (cross-cutting)

| # | Vấn đề | FUNC | Đề xuất khi vẽ wireframe |
|---|---|---|---|
| 1 | Enum LEG STATE (taxi-out/airborne/taxi-in/arrived) — danh mục đầy đủ | FUNC-205 | Tạm dùng 4 trạng thái này; chờ SME chốt |
| 2 | Nguồn Transfer PAX (khách nối chuyến) — FOS sheet-09 không có cột trực tiếp | FUNC-144 | Để cột Transfer-IN/OUT có gắn `[cần xác nhận]` |
| 3 | Trường lưu cấp RFFS sân bay | FUNC-152 | Hiển thị "RFFS Cat" + cờ `[cần xác nhận]` |
| 4 | Trường lưu chứng chỉ tổ bay theo sân bay | FUNC-157 | Hiển thị badge "Chứng chỉ" + cờ |
| 5 | Viết tắt VMA (ngưỡng thời tiết) | FUNC-153, FUNC-183 | Giữ "VMA `[cần xác nhận]`" trong label |
| 6 | Giao thức server-push (WebSocket/SSE/Webhook) | FUNC-208 | Wireframe chỉ thể hiện hành vi "tự cập nhật"; không chốt giao thức |
| 7 | Quy tắc xác định "đã có / chưa có" tài liệu | FUNC-139, FUNC-143 | Mỗi ô badge có 3 trạng thái: Đã có / Chưa có / `[cần xác nhận quy tắc]` |
| 8 | Trạng thái "tổ bay đã xác nhận / đã tải xuống" | FUNC-145 | Để 2 cột riêng, gắn cờ |
| 9 | Danh mục loại hạn chế đầy đủ (Airport Constraints) | FUNC-156, FUNC-221 | Hiển thị 3 nhóm có nguồn rõ: Slot, Curfew, Khác `[cần xác nhận]` |
| 10 | Danh mục vai trò + ma trận quyền xem chi tiết | FUNC-142 | Chú thích "Theo quyền vai trò `[cần xác nhận ma trận]`" tại block chi tiết |
