---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "II.5 Phân hệ Quản trị hệ thống"
source_pages: "20-22"
---

# II.5 Phân hệ Quản trị hệ thống

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: II.5 Phân hệ Quản trị hệ thống
- Trang: 20–22

## Nội dung trích nguyên văn (Verbatim Extract)

Quản lý người dùng và phân quyền - Hệ thống triển khai cơ chế quản trị tập trung toàn bộ vòng đời người dùng, từ khâu khởi tạo đến khi thu hồi quyền truy cập, đảm bảo tính minh bạch và an toàn tuyệt đối cho dữ liệu điều hành.

### ● Quản trị vòng đời và Phân quyền chi tiết

- **Quản lý thực thể người dùng:** Hệ thống cung cấp các chức năng quản lý toàn bộ vòng đời người dùng, bao gồm: tạo mới, sửa đổi thông tin, vô hiệu hóa tài khoản, kích hoạt lại và xóa người dùng khỏi hệ thống.
- **Cơ chế phân quyền dựa trên vai trò (RBAC):** Mỗi người dùng được gán một hoặc nhiều vai trò (Role) hoặc nhóm quyền (Group) nhất định. Các vai trò này được ánh xạ chi tiết với các quyền truy cập (Permissions) vào từng phân hệ, dịch vụ nghiệp vụ hoặc các phương thức API riêng biệt.
- **Chính sách truy cập động (Dynamic Policies):** Cho phép định nghĩa các quy tắc truy cập linh hoạt, chẳng hạn như hạn chế quyền theo khung giờ làm việc hoặc dựa trên trạng thái hiện tại của phiên làm việc.
- **Phân quyền theo thời gian thực (Real-time Permission):** Hệ thống có khả năng cập nhật và cung cấp quyền người dùng ngay lập tức, đảm bảo ngăn chặn các hành vi truy cập sai phạm hoặc vượt quyền ngay khi phát sinh thay đổi về vị trí công tác.

### ● Xác thực nâng cao và Tích hợp hệ thống

- **Xác thực đa yếu tố (MFA/2FA):** Để bảo vệ các tài nguyên trọng yếu, hệ thống bắt buộc áp dụng xác thực hai bước hoặc đa yếu tố đối với nhóm quản trị viên và các tài khoản có quyền truy cập dữ liệu nhạy cảm.
- **Kiến trúc dịch vụ xác thực độc lập:** Hệ thống được thiết kế theo mô hình Authentication Service riêng biệt, cho phép các hệ thống khác trong mạng lưới của Vietnam Airlines có thể tích hợp và sử dụng chung dịch vụ xác thực này.
- **Cơ chế Token-based:** Sử dụng công nghệ JWT (JSON Web Token) để thực hiện xác thực, giúp đảm bảo hiệu năng xử lý cao và tính bảo mật trong môi trường kiến trúc Microservices phân tán.
- **Tích hợp danh tính tập trung:** Khả năng kết nối và đồng bộ hóa sâu với các hệ thống quản lý danh tính hiện có của Tổng công ty như LDAP và Active Directory (AD).

### ● Đăng nhập một lần (SSO) và Giám sát liên hệ thống

- **Trải nghiệm Single Sign-On (SSO):** Cho phép người dùng chỉ cần sử dụng một tài khoản duy nhất để truy cập đồng thời vào nhiều phân hệ hoặc ứng dụng vệ tinh mà không cần thực hiện đăng nhập lại nhiều lần.
- **Quản trị tập trung:** Cung cấp giao diện quản trị duy nhất để cấu hình, theo dõi mọi hoạt động, thiết lập phân quyền và kiểm soát truy cập trên toàn bộ hệ thống liên kết.
- **Kiểm soát phiên làm việc:** Hệ thống cho phép kiểm soát chặt chẽ các phiên làm việc của người dùng theo thời gian thực. Đặc biệt, hỗ trợ cấp quyền truy cập tạm thời có thời hạn cho các nhân sự tham gia dự án hoặc chiến dịch đặc biệt, hệ thống sẽ tự động thu hồi quyền ngay khi hết hạn.
- **Lưu vết và Kiểm toán:** Mọi hành vi đăng nhập, thay đổi quyền hạn hoặc truy cập vào các tài nguyên/dữ liệu nghiệp vụ đều được ghi nhật ký (Log) chi tiết. Đây là nền tảng quan trọng để phục vụ công tác kiểm toán bảo mật, phân tích rủi ro và xử lý sự cố.

Phân hệ Quản lý người dùng và Phân quyền đảm bảo rằng dữ liệu khai thác, thông tin chi phí và hồ sơ tổ bay chỉ được tiếp cận bởi đúng đối tượng vào đúng thời điểm, đáp ứng tiêu chuẩn SLA 99% về độ tin cậy và an toàn.

Giải pháp nghiệp vụ theo tài liệu đề xuất này đảm bảo đáp ứng tất cả các yêu cầu về nghiệp vụ trong Hồ sơ yêu cầu Hệ thống Tối ưu Điều hành khai thác của Tổng Công ty Hàng không Việt Nam.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
