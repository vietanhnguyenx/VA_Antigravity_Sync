---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.6.4 Phân loại dữ liệu và quản lý metadata"
source_pages: "53"
---

# III.6.4 Phân loại dữ liệu và quản lý metadata

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.6.4 Phân loại dữ liệu và quản lý metadata
- Trang: 53

## Nội dung trích nguyên văn (Verbatim Extract)

- ● Hệ thống quản lý metadata tập trung, trong đó mỗi nguồn dữ liệu, bảng dữ liệu và pipeline xử lý đều được định danh và mô tả rõ ràng. Metadata bao gồm thông tin về schema, nguồn dữ liệu, thời điểm cập nhật, cũng như các thông tin liên quan tới quyền truy cập và mức độ nhạy cảm.

- ● Dữ liệu được phân loại theo domain nghiệp vụ và được gắn nhãn phục vụ cho việc kiểm soát và khai thác. Đồng thời, cơ chế partitioning được áp dụng theo thời gian hoặc theo key nghiệp vụ để tối ưu hiệu năng truy vấn trên dữ liệu lớn.

- ● Triển khai khả năng truy vết dữ liệu (data lineage), cho phép theo dõi toàn bộ quá trình di chuyển và biến đổi dữ liệu từ nguồn đến điểm khai thác, phục vụ cho việc kiểm toán và xử lý sự cố.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
