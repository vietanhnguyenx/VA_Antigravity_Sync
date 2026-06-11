---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.9.2 Backup & restore"
source_pages: "67-68"
---

# III.9.2 Backup & restore

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.9.2 Backup & restore
- Trang: 67–68

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống áp dụng chiến lược sao lưu dữ liệu nhiều lớp nhằm bảo đảm an toàn dữ liệu, khả năng khôi phục linh hoạt và đáp ứng yêu cầu vận hành liên tục. Giải pháp được thiết kế đồng bộ với cơ chế replication của MariaDB và kiến trúc HA, bảo đảm khả năng phục hồi độc lập với các kịch bản sự cố hệ thống.

### ● Phạm vi và nguyên tắc sao lưu

- Toàn bộ dữ liệu hệ thống được sao lưu định kỳ, bao gồm dữ liệu nghiệp vụ, dữ liệu cấu hình và metadata phục vụ vận hành. Hoạt động sao lưu được triển khai tách biệt với cơ chế replication nhằm đảm bảo khả năng khôi phục dữ liệu trong các kịch bản lỗi logic, thao tác nhầm hoặc sự cố lan rộng.
- Hoạt động sao lưu và khôi phục được giám sát tập trung, có cơ chế ghi log và cảnh báo khi xảy ra lỗi hoặc chậm tiến độ. Dữ liệu backup được kiểm tra định kỳ thông qua các bài test restore nhằm đảm bảo khả năng sử dụng thực tế khi cần thiết.

### ● Cơ chế sao lưu

Hệ thống áp dụng kết hợp các phương thức sao lưu nhằm tối ưu hiệu năng và dung lượng lưu trữ:
- Thực hiện full backup định kỳ (theo ngày hoặc tuần) đối với toàn bộ cơ sở dữ liệu.
- Thực hiện full backup định kỳ kết hợp lưu trữ binary logs (binlog) để hỗ trợ khôi phục theo mốc thời gian (Point-in-Time Recovery – PITR), đồng thời tối ưu dung lượng và thời gian khôi phục.

### ● Lưu trữ và bảo vệ dữ liệu backup

- Dữ liệu sao lưu được lưu trữ trên hệ thống lưu trữ tách biệt với môi trường vận hành (off-site), bảo đảm an toàn trong các kịch bản sự cố tại trung tâm dữ liệu chính.
- Dữ liệu backup được mã hóa trong quá trình truyền và lưu trữ. Chính sách lưu trữ được cấu hình linh hoạt theo yêu cầu vận hành và quy định về an toàn thông tin.

### ● Khôi phục dữ liệu

- Hệ thống hỗ trợ các kịch bản khôi phục linh hoạt, bao gồm khôi phục toàn bộ cơ sở dữ liệu hoặc khôi phục theo mốc thời gian (PITR) dựa trên binary logs của MariaDB.
- Quy trình khôi phục được chuẩn hóa và tích hợp trong runbook vận hành, đảm bảo khả năng thực hiện nhanh chóng và chính xác khi xảy ra sự cố.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
