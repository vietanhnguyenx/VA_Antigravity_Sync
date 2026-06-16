---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.6.3 Kiến trúc lưu trữ và phân tầng dữ liệu"
source_pages: "52-53"
---

# III.6.3 Kiến trúc lưu trữ và phân tầng dữ liệu

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.6.3 Kiến trúc lưu trữ và phân tầng dữ liệu
- Trang: 52–53

## Nội dung trích nguyên văn (Verbatim Extract)

- ● Tổ chức lưu trữ dữ liệu theo mô hình phân tầng, trong đó dữ liệu thô (raw data) được lưu giữ nguyên trạng để đảm bảo khả năng truy xuất và kiểm chứng, trong khi dữ liệu đã xử lý (processed/curated data) được tối ưu về cấu trúc và định dạng để phục vụ phân tích.

- ● Dữ liệu được lưu trữ dưới các định dạng cột như Parquet hoặc Delta Lake nhằm giảm dung lượng lưu trữ và tăng hiệu năng truy vấn. Đồng thời, tầng lưu trữ được tách biệt với tầng xử lý, cho phép mở rộng độc lập theo nhu cầu, tránh tình trạng tranh chấp tài nguyên giữa các tác vụ xử lý.

- ● Hệ thống cũng hỗ trợ phân vùng dữ liệu theo thời gian và theo domain, giúp tối ưu việc đọc/ghi dữ liệu trong các kịch bản xử lý khối lượng lớn.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
