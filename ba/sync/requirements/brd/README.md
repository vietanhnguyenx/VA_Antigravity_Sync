---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/sync/requirements/brd"
status: "Active"
date: "2026-06-04"
---

# sync/requirements/brd/ — BRD Đã Thống nhất

## Mục đích

Lưu các **Business Requirements Document đã qua review và được team thống nhất** — đây là nguồn sự thật chung (source of truth) cho BRD của dự án TOSS.

> **Chỉ chứa tài liệu trạng thái `Review` hoặc `Approved`.** Tài liệu đang soạn thảo để tại [`../../../workspace/drafts/brd/`](../../../workspace/drafts/brd/).

## Quy trình đưa tài liệu vào đây

1. BA soạn nháp tại `workspace/drafts/brd/` → trạng thái `Draft`
2. Team review, ghi nhận phản hồi vào `quan-ly-yeu-cau/`
3. Sau khi thống nhất → **copy vào thư mục này**, đổi `status` thành `Approved`
4. **Không xóa** file Approved — tăng version khi cập nhật

## Quy ước đặt tên

`BRD-TOSS-<NNN>-<mo-ta>-v<X.Y>.md`

Ví dụ: `BRD-TOSS-001-tong-the-v1.0.md`

## Liên kết

- Nháp nguồn ← [`../../../workspace/drafts/brd/`](../../../workspace/drafts/brd/)
- Thay đổi yêu cầu → [`../quan-ly-yeu-cau/`](../quan-ly-yeu-cau/)
- SRS tương ứng → [`../srs/`](../srs/)
