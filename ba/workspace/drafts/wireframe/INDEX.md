---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "business-analyst"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Wireframe Index (top-level)"
document_id: "WF-INDEX-TOSS"
---

# Wireframe — Chỉ mục tổng (TOSS)

> **Phạm vi:** chỉ mục tổng các tài liệu wireframe low-fidelity trong `ba/workspace/drafts/wireframe/`. Wireframe phục vụ co-evolution (Workflow P4) — vẽ song song với phân tích chức năng (PHAN-RA) và mô hình dữ liệu khái niệm (`ba/sync/models/`).
>
> **Nguyên tắc (CLAUDE.md §0):** chỉ vẽ những màn hình có nguồn BR/FUNC rõ ràng; không tự thêm màn hình; trường/khái niệm chưa rõ ghi `[cần xác nhận]`; điểm chưa có entity map ghi `*(layout cần xác nhận sau khi có entity map)*`.

## Danh mục wireframe theo phân hệ

| Phân hệ | File / Thư mục | Phiên bản | Mục tiêu | Nguồn BRD/PHAN-RA |
|---|---|---|---|---|
| PH1 — Thông tin điều hành chuyến bay | [`PH1/`](PH1/) — `wf-monitoring-overview` **v0.4**, `wf-kiem-tra-dau-ca`, `wf-giam-sat-truc-ban-truong`, `wf-giam-sat-tai-lieu` (mỗi file .md + .drawio) | 0.4 (monitoring) / 0.1 (còn lại) | **`wf-monitoring-overview` v0.4 = đặc tả màn Flight Dispatch 26 cột (§8 bám sheet Function list + §9 đối chiếu YCKT/KS/SRS) — input chính của workflow `survey-to-spec`**; kiểm tra đầu ca; giám sát trực ban trưởng; giám sát tài liệu | BRD-PH1 v0.6 · PHAN-RA-PH1 v0.6 |
| PH2 — Quản lý tài liệu chuyến bay | [`WF-PH2-tai-lieu-chuyen-bay-v0.1.md`](WF-PH2-tai-lieu-chuyen-bay-v0.1.md) | 0.1 | 6 màn: danh sách chuyến bay + tài liệu, soạn/nộp NOTOC, MEL/CDL, Dispatch Release, dashboard tài liệu, Service Order email LIDO | BRD-PH2 v0.6 · PHAN-RA-PH2 v0.4 |
| PH4 — Quản lý danh mục (Master Data) | [`WF-PH4-quan-ly-danh-muc-v0.1.md`](WF-PH4-quan-ly-danh-muc-v0.1.md) | 0.1 | 5 màn: Aircraft Master, Airport Master + MEL tool, Route Master + Tankering/TAT, Performance Factor, Admin panel nhóm E–J | BRD-PH4 v0.5 · PHAN-RA-PH4 v0.4 |

## Quy ước chung

- **Bố cục:** khung ASCII `┌─┐│└┘`; bảng dữ liệu thẳng cột; mỗi WF gắn BR/FUNC nguồn rõ ràng.
- **Trạng thái màu** (áp BR-213/PH1 thống nhất): Trắng = bình thường · Vàng = lưu ý · Đỏ = bắt buộc xử lý ngay · Xanh = hoàn tất/đã clear · Xám = không có dữ liệu.
- **Cấu hình ẩn/hiện cột** (BR-254 PH2 / BR-102 PH1) áp đồng đều — không vẽ lại ở từng màn.
- **Mặc định chữ HOA** cho tìm kiếm/filter/nhập liệu (BR-253 PH2).

## Lịch sử version

Xem `ba/workspace/drafts/quy-trinh/BA-VERSION-LOG.md`.

---

*INDEX wireframe v0.1 — 2026-06-17.*
