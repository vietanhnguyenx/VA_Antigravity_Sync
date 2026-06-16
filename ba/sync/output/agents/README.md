---
document_type: "Scaffold — ba/output/agents"
status: "Active"
date: "2026-06-03"
---

# ba/output/agents/ — Đầu ra tối ưu cho Agent (DEV · QC · …)

## Mục đích

Thư mục này chứa **đầu ra BA dạng máy đọc được**, được tối ưu hóa để:
- Agent DEV, QC và các role tiếp theo **hiểu đúng nghiệp vụ** mà không phải đọc toàn bộ tài liệu.
- **Tiết kiệm token tối đa** — cấu trúc dense, loại bỏ ngôn ngữ hình thức, giữ nguyên ngữ nghĩa.

## Nguyên tắc (CLAUDE.md Mục 0)

> Nội dung trong `output/agents/` là **dẫn xuất trung thực từ `process/`** — không tự suy diễn, không thêm yêu cầu mới. Mọi phát biểu phải truy vết về file nguồn trong `ba/process/` hoặc `ba/input/`.

## Cấu trúc — agent tự xác định khi tạo nội dung

Khi có tài liệu BA đủ chín (trạng thái Review trở lên), agent BA sinh đầu ra tối ưu cho downstream. Gợi ý khởi đầu cho TOSS (hệ thống khai thác hàng không):

```
ba/output/agents/
├── features/            # Đặc tả chức năng compact: OCC, crew, maintenance, ground-ops
├── data-model/          # ERD + entity dictionary machine-readable
├── api-contracts/       # Interface giữa module (ACARS, Voffice, external systems)
├── acceptance-criteria/ # AC Given-When-Then thuần (cho QC agent)
└── context-map.md       # Bản đồ phụ thuộc module (1 trang)
```

## Tiêu chí output tối ưu cho agent

| Tiêu chí | Làm | Không làm |
|---|---|---|
| **Mật độ** | 1 dòng = 1 thông tin | Giải thích dài dòng, dẫn nhập |
| **Cấu trúc** | YAML / bảng / danh sách có nhãn | Văn xuôi mô tả |
| **Truy vết** | Ghi `[src: process/srs/§x.y]` | Không có nguồn |
| **Scope** | Chỉ thông tin DEV/QC cần để implement/test | Lịch sử quyết định, phân tích |
| **Ngôn ngữ** | Tiếng Anh cho field/logic; Tiếng Việt cho tên nghiệp vụ | Trộn lẫn không nhất quán |

## Khi nào tạo

- Sau khi tài liệu trong `process/` đạt **Review** trở lên.
- Khi DEV hoặc QC agent cần bắt đầu implement/test.
- Không tạo sớm hơn — nội dung sẽ lỗi thời nếu `process/` còn thay đổi nhiều.

## Liên kết

- Nguồn sự thật: [`ba/process/`](../process/)
- Đầu vào gốc: [`ba/input/`](../input/)
- Điểm treo chưa rõ: xem NKLR trong `ba/process/quan-ly-yeu-cau/` (khi có)
