---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/sync/requirements/quan-ly-yeu-cau"
status: "Active"
date: "2026-06-04"
---

# quan-ly-yeu-cau/ — Nhật ký Kiểm soát Thay đổi Yêu cầu (NKLR)

## Mục đích

Theo dõi toàn bộ thay đổi yêu cầu trong vòng đời dự án: yêu cầu mới, thay đổi, tạm hoãn, loại bỏ — kèm lý do, người yêu cầu, và tác động đến tài liệu hiện hành.

## Quy ước đặt tên

`NKLR-TOSS-<pham-vi>-v<X.Y>-<YYYY-MM-DD>.md`

Ví dụ: `NKLR-TOSS-tong-the-v1.0-2026-06-04.md`

## Cấu trúc mỗi mục (NKLR entry)

| Trường | Mô tả |
|---|---|
| **Mã** | `CR-<NNN>` (Change Request) |
| **Tiêu đề** | Mô tả ngắn thay đổi |
| **Loại** | Mới / Thay đổi / Tạm hoãn / Loại bỏ |
| **Nguồn** | Ai yêu cầu, từ biên bản nào |
| **Tài liệu bị ảnh hưởng** | BRD §, SRS §, Wireframe wf-... |
| **Trạng thái** | Đề xuất / Đang xem xét / Chấp thuận / Từ chối |
| **Ngày** | Ngày ghi nhận |
| **Người xử lý** | BA phụ trách |

## Nguyên tắc

- **Append-only**: không xóa entry cũ, chỉ cập nhật trạng thái.
- Mọi thay đổi trong `srs/` hoặc `brd/` phải có entry NKLR tương ứng.
- Sau khi `Chấp thuận` → cập nhật tài liệu bị ảnh hưởng + tăng version.

## Liên kết

- BRD bị ảnh hưởng → [`../brd/`](../brd/)
- SRS bị ảnh hưởng → [`../srs/`](../srs/)
- Nguồn yêu cầu ← [`../../../workspace/input/meeting-notes/`](../../../workspace/input/meeting-notes/)
