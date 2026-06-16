---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/workspace/drafts/mockup"
status: "Active"
date: "2026-06-04"
---

# mockup/ — HTML Mockup & Prototype Tương tác

## Mục đích

Lưu các file HTML mockup (tĩnh) và prototype (tương tác clickable) phục vụ review giao diện với stakeholder. Mở bằng trình duyệt — **không cần internet, không cần server**.

## Phân biệt Mockup vs Prototype

| Loại | Mô tả | Khi dùng |
|---|---|---|
| **Mockup** (tĩnh) | Blueprint cấu trúc màn hình, không có interaction | Review layout, xác nhận danh sách trường |
| **Prototype** (tương tác) | Clickable, mô phỏng luồng & trạng thái | Demo cho stakeholder, walkthrough luồng nghiệp vụ |

## Quy ước đặt tên

| Pattern | Ví dụ |
|---|---|
| Mockup tổng: `<ma-he-thong>-mockup.html` | `toss-mockup.html` |
| Mockup phân hệ: `<X.Y>-<phan-he>-mockup.html` | `3.1-khai-thac-bay-mockup.html` |
| Prototype luồng: `<X.Y>-<phan-he>-<luong>-prototype.html` | `3.1-khai-thac-bay-dispatch-prototype.html` |

## Nguyên tắc (CLAUDE.md §0)

- Mọi element trên mockup **map 1:1 sang Angular Material component** (xem [`.claude/knowledge/angular-material-components.md`](../../../../.claude/knowledge/angular-material-components.md)).
- Trường / nhãn lấy từ **wireframe và SRS** — không tự nghĩ ra.
- Dữ liệu hiển thị là **dữ liệu mẫu minh họa** (fake) — ghi rõ trên giao diện.
- Dùng skill `gen-mockup` để tạo file HTML theo chuẩn.

## Liên kết

- Wireframe nguồn ← [`../wireframe/`](../wireframe/)
- SRS nguồn ← [`../srs/03-dac-ta-chuc-nang/`](../srs/03-dac-ta-chuc-nang/)
- Catalog Angular Material → [`.claude/knowledge/angular-material-components.md`](../../../../.claude/knowledge/angular-material-components.md)
