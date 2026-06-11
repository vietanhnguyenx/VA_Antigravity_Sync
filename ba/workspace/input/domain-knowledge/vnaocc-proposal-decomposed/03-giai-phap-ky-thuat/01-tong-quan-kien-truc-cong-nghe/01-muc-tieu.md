---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.1.1 Mục tiêu xây dựng hệ thống"
source_pages: "22-24"
---

# III.1.1 Mục tiêu xây dựng hệ thống

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.1.1 Mục tiêu xây dựng hệ thống
- Trang: 22–24

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống TOSS (Tối ưu điều hành khai thác) được xây dựng nhằm cung cấp một nền tảng công nghệ thống nhất, hiện đại, đáp ứng yêu cầu quản lý, điều hành và tối ưu hóa hoạt động khai thác của Vietnam Airlines trong môi trường vận hành phức tạp, đa hệ thống.

Giải pháp hướng tới các mục tiêu chính:

- **● Áp dụng kiến trúc Microservices, Cloud-native theo tiêu chuẩn CNCF:** Hệ thống được thiết kế theo kiến trúc microservices, triển khai trên nền tảng cloud-native, đảm bảo các module được tách biệt độc lập về nghiệp vụ và dữ liệu, hỗ trợ mở rộng linh hoạt, triển khai không gián đoạn và đáp ứng yêu cầu về khả năng scale và tính sẵn sàng cao của hệ thống.

- **● Chuẩn hóa và tập trung hóa dữ liệu khai thác:** Thiết lập cơ chế thu thập, đồng bộ và cung cấp dữ liệu từ nhiều nguồn thông qua API, message queue và các kênh tích hợp khác; đảm bảo dữ liệu được quản lý tập trung, có kiểm soát về chất lượng, lịch sử thay đổi và khả năng cung cấp cho các hệ thống khác theo phân quyền.

- **● Xây dựng nền tảng tích hợp (Integration Layer) thống nhất:** Loại bỏ các kết nối point-to-point, thay thế bằng mô hình tích hợp qua API Gateway và các dịch vụ trung gian, cho phép kiểm soát truy cập, điều tiết lưu lượng, quản lý vòng đời API và mở rộng kết nối với các hệ thống bên ngoài.

- **● Hỗ trợ xử lý dữ liệu thời gian thực và gần thời gian thực:** Đảm bảo khả năng tiếp nhận, xử lý và cung cấp dữ liệu với độ trễ thấp; hỗ trợ đồng thời các cơ chế xử lý streaming và batch; cung cấp khả năng giám sát, theo dõi trạng thái các luồng dữ liệu vào/ra và phát hiện bất thường.

- **● Thiết kế hệ thống theo kiến trúc mở, dễ mở rộng:** Các thành phần hệ thống được phân tách rõ ràng theo tầng (giao diện, nghiệp vụ, dữ liệu) và theo module độc lập; đảm bảo khả năng thay đổi, mở rộng từng thành phần mà không ảnh hưởng đến toàn hệ thống.

- **● Đảm bảo hiệu năng và khả năng mở rộng theo tải:** Hệ thống được thiết kế để đáp ứng số lượng người dùng và tải truy cập đồng thời theo yêu cầu; hỗ trợ mở rộng tài nguyên theo chiều ngang, tự động điều tiết lưu lượng và duy trì hiệu năng khi tải tăng.

- **● Đảm bảo tính sẵn sàng và khả năng vận hành liên tục:** Áp dụng các cơ chế dự phòng và triển khai nhiều node cho các thành phần quan trọng; đảm bảo hệ thống vẫn hoạt động khi xảy ra lỗi cục bộ và không gián đoạn dịch vụ trong quá trình nâng cấp hoặc restart.

- **● Thiết lập cơ chế bảo mật và kiểm soát truy cập thống nhất:** Cung cấp giải pháp quản lý định danh, xác thực và phân quyền tập trung; hỗ trợ SSO, tích hợp LDAP/AD, kiểm soát truy cập theo vai trò và ghi log/audit phục vụ giám sát và kiểm toán.

Hệ thống TOSS không chỉ phục vụ các nhu cầu nghiệp vụ hiện tại mà còn đóng vai trò là nền tảng công nghệ lõi, cho phép mở rộng trong tương lai theo hướng tích hợp sâu với các hệ thống dữ liệu và các công cụ phân tích nâng cao, phục vụ quá trình chuyển đổi số trong lĩnh vực điều hành khai thác của Vietnam Airlines.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
