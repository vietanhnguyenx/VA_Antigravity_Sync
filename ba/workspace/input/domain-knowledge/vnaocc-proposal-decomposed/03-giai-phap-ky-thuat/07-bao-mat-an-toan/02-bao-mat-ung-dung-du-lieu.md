---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.7.2 Bảo mật ứng dụng và dữ liệu"
source_pages: "56-59"
---

# III.7.2 Bảo mật ứng dụng và dữ liệu

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.7.2 Bảo mật ứng dụng và dữ liệu
- Trang: 56–59

## Nội dung trích nguyên văn (Verbatim Extract)

### ● Kiểm soát truy cập ứng dụng:

- Triển khai cơ chế xác thực và kiểm soát truy cập theo mô hình tập trung, trong đó dịch vụ IAM (Keycloak) chịu trách nhiệm xác thực và cấp phát định danh, còn API Gateway đóng vai trò là điểm kiểm soát truy cập duy nhất của hệ thống.
- Người dùng và các hệ thống tích hợp thực hiện xác thực thông qua chuẩn OAuth2/OpenID Connect và được cấp access token (JWT) để sử dụng trong các lần truy cập tiếp theo. Token được sử dụng xuyên suốt trong toàn bộ hệ thống, đảm bảo mô hình không trạng thái, phù hợp với kiến trúc microservices.
- Việc phân quyền được tổ chức theo mô hình Role-Based Access Control (RBAC), trong đó các vai trò được ánh xạ tới quyền truy cập cụ thể trên từng API và phân hệ. Các chính sách truy cập được quản lý tập trung tại IAM, giúp đảm bảo tính nhất quán trong toàn hệ thống.
- Tại API Gateway (APISIX), toàn bộ request đều được kiểm tra xác thực, đối chiếu quyền truy cập và áp dụng các chính sách bảo mật như giới hạn lưu lượng, kiểm soát IP và phát hiện truy cập bất thường trước khi chuyển tiếp tới các dịch vụ phía sau. Cách tiếp cận này giúp tách biệt hoàn toàn logic bảo mật khỏi các service nghiệp vụ, đồng thời đảm bảo khả năng mở rộng và vận hành tập trung.

### ● Bảo mật dữ liệu

Giải pháp bảo mật dữ liệu được triển khai theo nhiều lớp, đảm bảo dữ liệu luôn được bảo vệ trong suốt vòng đời xử lý.

**Hình 13. Sơ đồ giải pháp bảo mật dữ liệu**

- Hệ thống áp dụng các cơ chế bảo mật dữ liệu theo nhiều lớp nhằm đảm bảo tính bảo mật, toàn vẹn và kiểm soát đối với toàn bộ dữ liệu trao đổi trong quá trình vận hành. Tất cả các luồng dữ liệu truyền giữa người dùng, hệ thống bên ngoài và các dịch vụ nội bộ đều được mã hóa thông qua giao thức TLS (từ phiên bản 1.2 trở lên), đảm bảo dữ liệu không bị nghe lén hoặc can thiệp trong quá trình truyền tải.
- Việc kiểm soát truy cập được thực hiện kết hợp giữa xác thực người dùng và kiểm soát nguồn truy cập. Các yêu cầu từ bên ngoài được kiểm tra theo địa chỉ IP, áp dụng cơ chế whitelist đối với các hệ thống tích hợp, đồng thời có thể thiết lập các chính sách giới hạn truy cập theo từng nhóm đối tượng. Cơ chế này giúp hạn chế các truy cập trái phép ngay từ lớp biên của hệ thống.
- Tại lớp API Gateway, toàn bộ dữ liệu vào và ra hệ thống được kiểm soát tập trung. Gateway thực hiện kiểm tra định dạng dữ liệu, xác thực thông tin đầu vào và áp dụng các chính sách lọc nhằm phát hiện và ngăn chặn các payload bất thường hoặc không hợp lệ trước khi chuyển tiếp tới các dịch vụ nghiệp vụ. Đồng thời, các dữ liệu phản hồi cũng được kiểm soát để đảm bảo không làm lộ thông tin nhạy cảm ra bên ngoài.
- Ở tầng ứng dụng, các dữ liệu nhạy cảm được xử lý theo nguyên tắc tối thiểu hóa hiển thị. Các thông tin như dữ liệu cá nhân, thông tin định danh hoặc dữ liệu nghiệp vụ quan trọng được masking hoặc ẩn một phần khi hiển thị hoặc ghi log. Cách tiếp cận này giúp giảm thiểu rủi ro rò rỉ thông tin, đồng thời vẫn đảm bảo đáp ứng nhu cầu khai thác và vận hành hệ thống.

### ● Bảo vệ hệ thống khỏi truy cập bất thường

**Hình 14. Mô hình giám sát an ninh và phân tích bất thường hệ thống**

- Hệ thống triển khai cơ chế giám sát và bảo vệ an ninh theo nhiều lớp, tập trung tại các điểm kiểm soát như NGINX, API Gateway và lớp hạ tầng, nhằm phát hiện sớm và ngăn chặn các hành vi truy cập bất thường trong toàn bộ quá trình vận hành.
- Tại lớp biên, hệ thống áp dụng các cơ chế kiểm soát lưu lượng và bảo vệ trước các tấn công phổ biến như DDoS, bot hoặc truy cập từ các nguồn IP đáng ngờ. Các yêu cầu truy cập được phân tích theo hành vi và tần suất, từ đó áp dụng các chính sách chặn, giới hạn hoặc cô lập theo thời gian thực. Kết hợp với đó, Web Application Firewall (WAF) được sử dụng để phát hiện và ngăn chặn các lỗ hổng bảo mật ở tầng ứng dụng như injection, cross-site scripting hoặc các payload bất thường.
- Tại lớp giám sát, hệ thống thu thập và phân tích liên tục các dữ liệu liên quan đến lưu lượng truy cập, log hệ thống và hành vi người dùng. Các cơ chế phân tích được áp dụng để nhận diện các mẫu bất thường, từ đó kích hoạt cảnh báo hoặc hành động xử lý phù hợp. Việc giám sát không chỉ dừng ở mức phát hiện sự cố mà còn hỗ trợ phân tích nguyên nhân và truy vết khi cần thiết.

Toàn bộ các hoạt động giám sát và bảo vệ được tích hợp với hệ thống logging và monitoring tập trung, cho phép theo dõi theo thời gian thực và hỗ trợ vận hành chủ động. Cách tiếp cận này giúp hệ thống duy trì trạng thái an toàn liên tục, đồng thời nâng cao khả năng phản ứng nhanh trước rủi ro an ninh trong môi trường vận hành thực tế.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
