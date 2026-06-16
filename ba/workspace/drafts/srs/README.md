---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/workspace/drafts/srs"
status: "Active"
date: "2026-06-04"
---

# srs/ — Software Requirements Specification (Drafts)

## Mục đích

Lưu SRS đang xây dựng theo cấu trúc chương-phân hệ. Các file đã được team review & thống nhất chuyển sang [`../../sync/requirements/srs/`](../../sync/requirements/srs/).

## Cấu trúc file

```
srs/
├── 00-index.md                     # Mục lục tổng; tổng quan trạng thái từng chương
├── 01-gioi-thieu.md                # Giới thiệu, phạm vi, định nghĩa, tài liệu tham chiếu
├── 02-tong-quan-he-thong.md        # Kiến trúc tổng thể, bối cảnh hệ thống, ràng buộc
├── 03-dac-ta-chuc-nang/            # Đặc tả chức năng per phân hệ (xem subfolder)
├── 04-yeu-cau-dung-chung.md        # Quy tắc nghiệp vụ chung, trạng thái dùng chung
├── 05-yeu-cau-phi-chuc-nang.md     # NFR: hiệu năng, bảo mật, độ khả dụng, tuân thủ
├── 06-phu-luc.md                   # Phụ lục: bảng tra cứu, từ viết tắt
└── 07-cau-truc-du-lieu-erd.md      # ERD + từ điển thực thể
```

## 03-dac-ta-chuc-nang/ — Phân hệ TOSS

| File | Phân hệ |
|---|---|
| `3.1-quan-ly-khai-thac-bay.md` | Quản lý Khai thác Bay (Flight Operations) |
| `3.2-quan-ly-to-bay.md` | Quản lý Tổ bay (Crew Management) |
| `3.3-bao-duong-ky-thuat.md` | Bảo dưỡng & Kỹ thuật Tàu bay |
| `3.4-khai-thac-mat-dat.md` | Khai thác Mặt đất (Ground Handling) |
| `3.5-an-toan-tuan-thu.md` | An toàn & Tuân thủ (Safety & Compliance) |
| `3.6-bao-cao-thong-ke.md` | Báo cáo & Thống kê |
| `3.7-master-data.md` | Danh mục dùng chung (Master Data) |

## Quy ước đặt tên

- File chương: `<NN>-<mo-ta>.md` — ví dụ: `01-gioi-thieu.md`
- File phân hệ: `<X.Y>-<mo-ta>.md` — ví dụ: `3.1-quan-ly-khai-thac-bay.md`

## Liên kết

- Wireframe mirror → [`../wireframe/`](../wireframe/)
- Sau khi Approved → [`../../sync/requirements/srs/`](../../sync/requirements/srs/)
- Đầu ra cho DEV/QC → [`../../sync/output/agents/`](../../sync/output/agents/)
