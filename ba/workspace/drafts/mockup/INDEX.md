# INDEX — Mockup / Prototype (ba/workspace/drafts/mockup)

> Đọc index này trước rồi mở đúng file. Mockup/prototype là bản mẫu trực quan để duyệt (Angular Material 3, dark mode, dữ liệu mẫu) — KHÔNG phải code chạy. Bố cục/màu cần BA/UI duyệt.

## Hiện hành

| File | Nội dung |
|---|---|
| `toss-prototype-v0.6.html` | **Prototype hiện hành** — 5 màn: **Flight Dispatch 26 cột** (gộp OCC+Dispatch, bám sheet "Màn hình Flight Dispatch" của Function list) · Flight Detail · MEL/CDL · Settings · Upload Documents. Logic màu/hover/[TBD] theo wireframe §8/§9. |
| `toss-prototype-v0.5-review.md` | Báo cáo soát (ui-reviewer) bản v0.5 — cơ sở QA dẫn tới các sửa đổi của v0.6 (CONDITIONAL PASS, 3 phát hiện 🔴 đã xử lý). |
| `dsp_monitoring_poc_v0.1.html` | POC màn giám sát điều phái (Team BA) — được wireframe `wf-monitoring-overview` §7 tham khảo (23 cột, sortable). |
| `index.html` | Landing page portal liên kết các màn mockup module Flight Plans. |
| `THUYET-MINH-prototype-TOSS-v0.1.md` | Hướng dẫn thuyết minh prototype. ⚠️ **Mô tả bố cục v0.4 (OCC + Dispatch tách riêng)** — cần cập nhật cho v0.6 (đã gộp thành màn Flight Dispatch 26 cột). |
| `README.md` | Ghi chú thư mục mockup. |

## Lịch sử
- Các bản `toss-prototype-v0.1…v0.5.html` + `v0.3-review.md` + thư mục `fragments/` (build intermediate fan-out) **đã xóa** sau khi v0.6 thay thế — git giữ lịch sử.
- Nguồn đặc tả màn Flight Dispatch: [`wf-monitoring-overview.md`](../wireframe/PH1/wf-monitoring-overview.md) §8/§9 + sheet "Màn hình Flight Dispatch" trong `VNA-TOSS-Function-list-v1.0.extracted.md`.
