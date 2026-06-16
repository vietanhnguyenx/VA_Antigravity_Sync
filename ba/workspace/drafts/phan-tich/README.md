---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/workspace/drafts/phan-tich"
status: "Active"
date: "2026-06-04"
---

# phan-tich/ — Phân tích Nghiệp vụ (Drafts)

## Mục đích

Nơi BA cá nhân thực hiện các phân tích nghiệp vụ trung gian: As-Is, To-Be, gap analysis, đối chiếu tài liệu nguồn — **trước khi đưa kết quả vào SRS hoặc BRD chính thức**.

## Loại tài liệu

| Loại | Mô tả | Pattern tên file |
|---|---|---|
| As-Is / To-Be | Mô tả quy trình hiện tại và kỳ vọng | `asis-tobe-<phan-he>.md` |
| Gap analysis | Phân tích khoảng cách yêu cầu vs thực tế | `gap-<phan-he>.md` |
| Đối chiếu | Đối chiếu tài liệu nguồn vs wireframe/SRS | `doi-chieu-<loai-a>-<loai-b>.md` |
| Phân tích luồng | Mô tả luồng nghiệp vụ chi tiết | `luong-<chu-de>.md` |
| Ghi chú phân tích | Ghi chú nhanh trong quá trình nghiên cứu | `note-<chu-de>-YYYYMMDD.md` |

## Phân hệ TOSS cần phân tích

| Mã | Phân hệ |
|---|---|
| `bay` | Quản lý Khai thác Bay (Flight Operations) |
| `to-bay` | Quản lý Tổ bay (Crew Management) |
| `bao-duong` | Bảo dưỡng & Kỹ thuật Tàu bay |
| `mat-dat` | Khai thác Mặt đất (Ground Handling) |
| `an-toan` | An toàn & Tuân thủ (Safety & Compliance) |

## Nguyên tắc (CLAUDE.md §0)

- Mọi phân tích **phải trích dẫn nguồn** từ `../../input/` (biên bản họp, tài liệu nguồn).
- Phán đoán / suy diễn của BA phải **đánh dấu rõ** `[Giả định BA — cần xác nhận]` để stakeholder duyệt.
- Khi phân tích đã được xem xét và thống nhất → chuyển sang [`../../sync/requirements/`](../../sync/requirements/).

## Liên kết

- Nguồn phân tích ← [`../input/meeting-notes/`](../input/meeting-notes/) · [`../input/domain-knowledge/`](../input/domain-knowledge/)
- Kết quả → [`../brd/`](../brd/) · [`../srs/`](../srs/)
- Đã review → [`../../sync/requirements/`](../../sync/requirements/)
