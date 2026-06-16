---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.1.2 Phạm vi giải pháp kỹ thuật"
source_pages: "24-25"
---

# III.1.2 Phạm vi giải pháp kỹ thuật

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.1.2 Phạm vi giải pháp kỹ thuật
- Trang: 24–25

## Nội dung trích nguyên văn (Verbatim Extract)

Phạm vi đề xuất giải pháp kỹ thuật bao gồm toàn bộ các thành phần công nghệ phục vụ việc xây dựng, triển khai và vận hành hệ thống TOSS, cụ thể:

- ● Thiết kế kiến trúc tổng thể hệ thống theo định hướng microservices và cloud-native, bảo đảm khả năng mở rộng, tách biệt các thành phần và triển khai linh hoạt trên hạ tầng cloud.

- ● Xây dựng các dịch vụ ứng dụng phục vụ các chức năng nghiệp vụ chính của hệ thống như quản lý chuyến bay, tàu bay, sân bay, dữ liệu khai thác và các phân hệ liên quan.

- ● Thiết kế và triển khai nền tảng tích hợp (Integration Layer), đóng vai trò trung gian kết nối giữa hệ thống TOSS với các hệ thống nội bộ và bên ngoài thông qua các cơ chế tích hợp chuẩn (API, message, streaming…).

- ● Xây dựng nền tảng dữ liệu (Data Platform) phục vụ lưu trữ, xử lý và cung cấp dữ liệu, đáp ứng các yêu cầu về quản lý dữ liệu tập trung, xử lý batch và streaming, cũng như cung cấp dữ liệu cho các hệ thống khai thác và phân tích.

- ● Triển khai hệ thống quản lý định danh và phân quyền (IAM), hỗ trợ xác thực tập trung, phân quyền chi tiết, tích hợp SSO và kết nối với các hệ thống quản lý danh tính hiện có.

- ● Thiết lập các cơ chế đảm bảo hiệu năng, khả năng mở rộng và tính sẵn sàng cao, bao gồm cơ chế scale-out, cân bằng tải, dự phòng hệ thống (HA).

- ● Xây dựng hệ thống giám sát, logging và cảnh báo tập trung, cho phép theo dõi trạng thái hoạt động của toàn bộ hệ thống, phát hiện sớm sự cố và hỗ trợ vận hành hiệu quả.

- ● Áp dụng quy trình CI/CD và DevOps, tự động hóa các bước xây dựng, kiểm thử và triển khai, bảo đảm tính nhất quán, giảm thiểu lỗi và rút ngắn thời gian phát hành.

- ● Phạm vi giải pháp nêu trên được xây dựng nhằm đáp ứng đầy đủ các nhóm yêu cầu kỹ thuật của hệ thống TOSS, bao gồm kiến trúc hệ thống, tích hợp dữ liệu, quản lý dữ liệu, bảo mật, hiệu năng và vận hành, đồng thời tạo nền tảng cho việc mở rộng và phát triển hệ thống trong các giai đoạn tiếp theo.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
