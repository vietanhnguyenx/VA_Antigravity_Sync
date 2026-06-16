---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/workspace/input/meeting-notes"
status: "Active"
date: "2026-06-04"
---

# meeting-notes/ — Biên bản Họp & Ghi chú Phỏng vấn

## Mục đích

Lưu trữ toàn bộ tài liệu ghi nhận thông tin từ stakeholder: biên bản họp, ghi chú phỏng vấn, ghi chú nghiên cứu thực địa.

**Tài liệu nguồn chỉ-đọc** — không chỉnh sửa nội dung sau khi đã lưu; mọi phân tích/diễn giải từ tài liệu này đưa vào `../drafts/phan-tich/`.

## Quy ước đặt tên

| Loại | Pattern | Ví dụ |
|---|---|---|
| Biên bản họp | `MM-YYYYMMDD-<chu-de>.md` | `MM-20260604-hop-khoi-dong.md` |
| Ghi chú phỏng vấn | `YYYYMMDD_pv-<vai-tro>.md` | `20260604_pv-dispatcher.md` |
| File gốc (PDF/Word) | Giữ nguyên tên gốc | `14.05.2026_MES_Biên bản họp.pdf` |

## Nguyên tắc (CLAUDE.md §0)

- Mọi nội dung lưu ở đây phải là **ghi chép trực tiếp** từ cuộc họp/phỏng vấn — không bổ sung suy diễn.
- Khi tạo tài liệu phân tích từ biên bản họp, **dẫn nguồn rõ ràng**: `[Nguồn: MM-20260604-hop-khoi-dong.md §3]`.

## Liên kết

- Phân tích từ tài liệu này → [`../drafts/phan-tich/`](../drafts/phan-tich/)
- Yêu cầu phát sinh sau khi phân tích → [`../../sync/requirements/`](../../sync/requirements/)
