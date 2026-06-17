---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Index — Customer_docs/ACARS"
status: "Active"
date: "2026-06-12"
---

# ACARS/ — Dữ liệu mẫu điện ACARS (inbound)

## Mục đích
Chứa **dữ liệu mẫu điện văn ACARS** do khách hàng (VNA) cung cấp, phục vụ:
- Hiểu định dạng & nội dung điện ACARS để thiết kế bộ thu nạp/parse (PH5 tích hợp).
- Bóc tách các mốc thời gian chuyển động **OOOI** (OUT/OFF/ON/IN) và nhiên liệu tại mốc làm nguồn real-time cho màn hình Monitoring (BR-125) và báo cáo nhiên liệu (PH3).

## Nội dung
- **31 file nén** `in-260301.zip` … `in-260331.zip`.
- Quy ước tên: `in-<YYMMDD>.zip` — `in` = inbound (điện nhận về); `26` = năm 2026; `03` = tháng 3; `01…31` = ngày. → **mỗi file là gói điện ACARS inbound của một ngày trong tháng 3/2026.**

## Liên quan TOSS
- Phân hệ 5 — tích hợp ACARS (BR-519 / FUNC-519-04): thu nạp mốc OUT/OFF/ON/IN.
- Phân hệ 1 — màn hình Monitoring overview (BR-125 / FUNC-204…210).
- Phân hệ 3 — báo cáo ACARS Fuel Reliability/Coverage (BR-322).
- Thuật ngữ: [ACARS, ACARS OOOI, ACARS Fuel Unit] trong `../../domain-knowledge/toss-glossary-v0.1.md`.

## Ghi chú
- File `.zip` là **dữ liệu thô chỉ-đọc** — không giải nén/chỉnh sửa tại đây; nếu cần phân tích, giải nén ra vùng làm việc tạm và đưa kết quả vào `../../drafts/phan-tich/`.
- `[cần xác nhận]` cấu trúc bên trong mỗi zip (số lượng điện, định dạng text/HTML) — bóc tách khi vào giai đoạn thiết kế tích hợp ACARS.
