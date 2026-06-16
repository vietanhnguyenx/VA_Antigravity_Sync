---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/workspace/drafts/wireframe"
status: "Active"
date: "2026-06-04"
---

# wireframe/ — Wireframe Đặc tả Giao diện (Drafts)

## Mục đích

Mô tả cấu trúc màn hình, luồng điều hướng, và thành phần giao diện **ở mức low-fidelity** theo từng phân hệ. Mỗi file wireframe **mirror 1:1 với một file SRS** trong `../srs/03-dac-ta-chuc-nang/`.

## Cấu trúc file

```
wireframe/
├── 00-wireframe-overview.md        # Tổng quan shell UI, navigation, design tokens
├── wf-3.1-khai-thac-bay.md         # Wireframe Quản lý Khai thác Bay
├── wf-3.2-to-bay.md                # Wireframe Quản lý Tổ bay
├── wf-3.3-bao-duong.md             # Wireframe Bảo dưỡng & Kỹ thuật
├── wf-3.4-mat-dat.md               # Wireframe Khai thác Mặt đất
├── wf-3.5-an-toan.md               # Wireframe An toàn & Tuân thủ
├── wf-3.6-bao-cao.md               # Wireframe Báo cáo & Thống kê
└── wf-3.7-master-data.md           # Wireframe Master Data
```

## Nội dung mỗi file wireframe

Mỗi file mô tả các màn hình theo cấu trúc chuẩn:
1. **Danh sách màn hình** của phân hệ
2. **Dashboard thống kê** (nếu có): KPI, trạng thái theo nhóm
3. **Danh sách dữ liệu**: cột, bộ lọc, phân trang, thao tác
4. **Form tạo/sửa**: trường, quy tắc validation, luồng submit
5. **Chi tiết**: tab/section, thao tác theo trạng thái

## Nguyên tắc (CLAUDE.md §0)

- Mọi element trên wireframe phải **truy vết được về SRS** cùng phân hệ.
- Không tự thêm màn hình/trường chưa có trong SRS — gắn cờ `[Câu hỏi — chờ xác nhận]`.
- Sau khi HTML mockup dựng từ wireframe → lưu tại [`../mockup/`](../mockup/).

## Liên kết

- SRS tương ứng → [`../srs/03-dac-ta-chuc-nang/`](../srs/03-dac-ta-chuc-nang/)
- HTML mockup → [`../mockup/`](../mockup/)
- Skill tạo mockup → `gen-mockup`
