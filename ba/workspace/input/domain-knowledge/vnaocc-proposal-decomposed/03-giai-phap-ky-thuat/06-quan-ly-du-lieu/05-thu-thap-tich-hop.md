---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.6.5 Thu thập và tích hợp dữ liệu đa nguồn"
source_pages: "53-54"
---

# III.6.5 Thu thập và tích hợp dữ liệu đa nguồn

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.6.5 Thu thập và tích hợp dữ liệu đa nguồn
- Trang: 53–54

## Nội dung trích nguyên văn (Verbatim Extract)

- ● Triển khai lớp thu thập dữ liệu linh hoạt, cho phép tích hợp và thu thập dữ liệu từ nhiều nguồn khác nhau như hệ thống API, Database, hệ thống streaming và các thiết bị/nguồn dữ liệu bên ngoài. Hỗ trợ đầy đủ dữ liệu có cấu trúc (SQL), bán cấu trúc (JSON, XML, logs) và dữ liệu phi cấu trúc

- ● Lớp này hỗ trợ đa dạng các cơ chế kết nối và thu thập dữ liệu, bao gồm truy cập qua API, kết nối trực tiếp tới cơ sở dữ liệu thông qua JDBC, cũng như tiếp nhận dữ liệu theo thời gian thực thông qua các nền tảng streaming như Kafka. Các adapter được cấu hình theo từng nguồn dữ liệu cụ thể, cho phép tích hợp nhanh với các hệ thống hiện hữu mà không yêu cầu thay đổi phía nguồn.

- ● Tại lớp tiếp nhận, dữ liệu được thu thập và đưa vào hệ thống dưới dạng dữ liệu thô (raw data) mà không thực hiện biến đổi, nhằm đảm bảo giữ nguyên tính toàn vẹn của dữ liệu nguồn. Việc chuẩn hóa schema, làm sạch và biến đổi dữ liệu được thực hiện tại lớp xử lý (ETL/ELT) phía sau. Cách tiếp cận này giúp tách biệt rõ ràng giữa lớp thu thập dữ liệu và lớp xử lý, giảm phụ thuộc vào hệ thống nguồn, đồng thời tăng tính linh hoạt và khả năng mở rộng trong quá trình xử lý dữ liệu.

- ● Việc bổ sung nguồn dữ liệu mới được thực hiện thông qua cấu hình adapter và pipeline ingestion, không ảnh hưởng tới các pipeline hiện tại.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
