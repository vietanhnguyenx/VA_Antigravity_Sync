---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/sync/requirements/srs"
status: "Active"
date: "2026-06-04"
---

# sync/requirements/srs/ — SRS Đã Thống nhất

## Mục đích

Lưu **Software Requirements Specification đã qua review và được team thống nhất** — đây là nguồn sự thật chung cho SRS của dự án TOSS, cơ sở để DEV và QC triển khai.

> **Chỉ chứa tài liệu trạng thái `Review` hoặc `Approved`.** Tài liệu đang soạn thảo để tại [`../../../workspace/drafts/srs/`](../../../workspace/drafts/srs/).

## Cấu trúc dự kiến (mirror workspace)

```
srs/
├── 00-index.md
├── 01-gioi-thieu.md
├── 02-tong-quan-he-thong.md
├── 03-dac-ta-chuc-nang/
│   ├── 3.1-quan-ly-khai-thac-bay.md
│   ├── 3.2-quan-ly-to-bay.md
│   ├── 3.3-bao-duong-ky-thuat.md
│   ├── 3.4-khai-thac-mat-dat.md
│   ├── 3.5-an-toan-tuan-thu.md
│   ├── 3.6-bao-cao-thong-ke.md
│   └── 3.7-master-data.md
├── 04-yeu-cau-dung-chung.md
├── 05-yeu-cau-phi-chuc-nang.md
├── 06-phu-luc.md
└── 07-cau-truc-du-lieu-erd.md
```

## Nguyên tắc

- **Không sửa trực tiếp** tại đây — mọi thay đổi phải thông qua `workspace/drafts/srs/` → review → cập nhật phiên bản mới.
- Khi cập nhật: tăng version trong frontmatter + ghi nhật ký vào [`../quan-ly-yeu-cau/`](../quan-ly-yeu-cau/).

## Liên kết

- Nháp nguồn ← [`../../../workspace/drafts/srs/`](../../../workspace/drafts/srs/)
- BRD tương ứng → [`../brd/`](../brd/)
- Thay đổi yêu cầu → [`../quan-ly-yeu-cau/`](../quan-ly-yeu-cau/)
- Đầu ra cho DEV/QC → [`../../output/agents/`](../../output/agents/)
