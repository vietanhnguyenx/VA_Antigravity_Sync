---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.6.1 Mô hình tổng thể và kiến trúc triển khai Data Platform"
source_pages: "51-52"
---

# III.6.1 Mô hình tổng thể và kiến trúc triển khai Data Platform

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.6.1 Mô hình tổng thể và kiến trúc triển khai Data Platform
- Trang: 51–52

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 11. Sơ đồ kiến trúc dữ liệu tổng thể Data Platform**

- ● Triển khai kiến trúc dữ liệu theo mô hình tách lớp, trong đó các thành phần thu thập, lưu trữ, xử lý và khai thác dữ liệu được tổ chức độc lập và kết nối thông qua các pipeline dữ liệu chuẩn hóa. Kiến trúc này cho phép tách biệt hoàn toàn giữa luồng xử lý giao dịch và luồng xử lý dữ liệu, từ đó tránh ảnh hưởng lẫn nhau và đảm bảo hiệu năng cho cả hai hệ thống.

- ● Giải pháp được thiết kế để hỗ trợ toàn diện các loại dữ liệu phát sinh từ hệ thống, bao gồm dữ liệu có cấu trúc, bán cấu trúc và phi cấu trúc. Cụ thể, hệ thống có khả năng tiếp nhận và xử lý dữ liệu từ các nguồn dữ liệu quan hệ, dữ liệu dạng Rest API, JSON/XML, SOAP API, gRPC, Kafka, JDBC hoặc log, cũng như các dữ liệu phi cấu trúc như hình ảnh, video và dữ liệu từ thiết bị IoT.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
