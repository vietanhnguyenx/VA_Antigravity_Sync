---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.6.7 Tối ưu tài nguyên và khả năng mở rộng"
source_pages: "54"
---

# III.6.7 Tối ưu tài nguyên và khả năng mở rộng

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.6.7 Tối ưu tài nguyên và khả năng mở rộng
- Trang: 54

## Nội dung trích nguyên văn (Verbatim Extract)

- ● Triển khai hệ thống theo hướng scale-out là chủ đạo, cho phép bổ sung node xử lý hoặc node lưu trữ khi khối lượng dữ liệu tăng. Đồng thời, hệ thống cũng hỗ trợ scale-up trong các trường hợp cần tăng tài nguyên cho từng node.

- ● Tài nguyên được phân bổ theo từng lớp chức năng (lưu trữ, xử lý), đảm bảo các tác vụ xử lý dữ liệu không ảnh hưởng tới nhau. Các cơ chế cân bằng tải và phân bổ tài nguyên được áp dụng để tối ưu hiệu năng và chi phí vận hành.

- ● Hệ thống được thiết kế với khả năng chịu lỗi và tính sẵn sàng cao, đảm bảo dữ liệu luôn được xử lý và truy cập ổn định trong quá trình vận hành.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
