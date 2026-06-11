---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.1.3 Nguyên tắc thiết kế hệ thống"
source_pages: "25-27"
---

# III.1.3 Nguyên tắc thiết kế hệ thống

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.1.3 Nguyên tắc thiết kế hệ thống
- Trang: 25–27

## Nội dung trích nguyên văn (Verbatim Extract)

Giải pháp được xây dựng dựa trên các nguyên tắc thiết kế cốt lõi, nhằm đảm bảo tính mở rộng, tính sẵn sàng cao, khả năng tích hợp và vận hành ổn định của hệ thống:

### ● Kiến trúc Cloud-native, microservices
- Hệ thống được thiết kế theo kiến trúc microservices, triển khai trên nền tảng container orchestration.
- Các dịch vụ độc lập, có thể phát triển, triển khai và mở rộng riêng biệt.

### ● Phân tách tầng và module độc lập
- Phân tách rõ các tầng:
  - Tầng giao diện (Presentation)
  - Tầng xử lý nghiệp vụ (Business)
  - Tầng dữ liệu (Data)
- Các module được tách biệt về chức năng và dữ liệu, đảm bảo khả năng thay đổi hoặc mở rộng từng thành phần mà không ảnh hưởng toàn hệ thống.

### ● Khả năng mở rộng linh hoạt (Scalability)
- Hệ thống hỗ trợ mở rộng tài nguyên theo chiều ngang đối với các thành phần ứng dụng và dữ liệu, cho phép đáp ứng sự thay đổi về tải người dùng và khối lượng xử lý mà không làm gián đoạn dịch vụ.

### ● Tính sẵn sàng cao (High Availability)
- Các thành phần quan trọng được triển khai theo mô hình nhiều node, có cơ chế dự phòng và chuyển đổi khi xảy ra sự cố; bảo đảm dịch vụ không bị gián đoạn trong quá trình nâng cấp, triển khai hoặc restart.

### ● Thiết kế hướng tích hợp (Integration-first) và quản lý truy cập tập trung
- Hệ thống được thiết kế với API Gateway làm điểm truy cập trung gian, bảo đảm tất cả các dịch vụ và hệ thống bên ngoài truy cập thông qua gateway; hỗ trợ kiểm soát truy cập, phân phối tải và quản lý vòng đời API.

### ● Bảo mật và kiểm soát truy cập theo nhiều lớp
- Áp dụng các cơ chế xác thực, phân quyền và kiểm soát truy cập tập trung; hỗ trợ quản lý người dùng, phân quyền chi tiết, SSO và audit log nhằm bảo đảm an toàn thông tin và tuân thủ các quy định hiện hành.

### ● Thiết lập cơ chế quan sát hệ thống (Observability) và vận hành tập trung
- Hệ thống cung cấp khả năng giám sát toàn diện bao gồm metrics, log và trạng thái hoạt động của các thành phần; hỗ trợ theo dõi hiệu năng, phát hiện bất thường, điều tiết lưu lượng theo ngưỡng và phục vụ phân tích, xử lý sự cố.
- Đồng thời, log được thu thập và quản lý tập trung, hỗ trợ truy vết, kiểm toán và nâng cao hiệu quả vận hành hệ thống.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
