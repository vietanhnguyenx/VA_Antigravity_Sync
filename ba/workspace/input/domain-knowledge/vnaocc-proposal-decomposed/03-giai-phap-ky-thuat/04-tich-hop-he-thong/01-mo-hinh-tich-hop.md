---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.4.1 Giải pháp tích hợp và kiểm soát"
source_pages: "40-42"
---

# III.4.1 Giải pháp tích hợp và kiểm soát

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.4.1 Giải pháp tích hợp và kiểm soát
- Trang: 40–42

## Nội dung trích nguyên văn (Verbatim Extract)

- ● Giải pháp được thiết kế theo hướng mở rộng thông qua cấu hình, trong đó việc bổ sung một hệ thống tích hợp mới được thực hiện tại API Gateway mà không yêu cầu thay đổi code của các dịch vụ backend. Cụ thể, chúng tôi sẽ triển khai việc tích hợp thông qua cấu hình route, xác định endpoint tiếp nhận, cấu hình upstream tương ứng với hệ thống đích và gắn các bước xử lý trung gian phù hợp với từng kịch bản tích hợp.

- ● Cơ chế này cho phép hệ thống dễ dàng mở rộng các kênh kết nối tới các nền tảng dữ liệu, dịch vụ AI/ML hoặc các hệ thống đối tác trong quá trình vận hành. Đồng thời, việc chuẩn hóa luồng tích hợp tại Gateway đảm bảo các hệ thống mới có thể được bổ sung mà không ảnh hưởng tới các luồng xử lý hiện tại, đáp ứng yêu cầu mở rộng tối thiểu số lượng kết nối giữa các hệ thống theo phạm vi gói thầu.

- ● Bên cạnh luồng xử lý chính, hệ thống cũng hỗ trợ các kịch bản tích hợp mở rộng, trong đó dữ liệu có thể được chuyển tiếp tới các hệ thống bên ngoài phục vụ phân tích, xử lý bổ sung hoặc đồng bộ dữ liệu. Việc tích hợp được thực hiện linh hoạt theo từng kịch bản, đảm bảo vừa đáp ứng yêu cầu nghiệp vụ vừa duy trì tính ổn định của hệ thống lõi.

### Cách thức hoạt động:

**Hình 5. Sơ đồ luồng tích hợp dữ liệu**

- ● Hình trên mô tả kiến trúc tích hợp hệ thống thông qua API Gateway, trong đó Gateway đóng vai trò trung gian tiếp nhận, xử lý và điều phối toàn bộ các request từ các hệ thống bên ngoài trước khi chuyển tới các dịch vụ nghiệp vụ tương ứng.

- ● Khi một request được gửi từ client (ví dụ /api/v1/flight), API Gateway thực hiện xử lý theo chuỗi các bước cấu hình. Trước hết, tại lớp Route, Gateway xác định endpoint và phiên bản API, từ đó ánh xạ request tới đúng luồng xử lý đã được cấu hình. Cơ chế này cho phép định tuyến linh hoạt và hỗ trợ mở rộng thêm các endpoint mới mà không ảnh hưởng tới các luồng hiện hữu.

- ● Tiếp theo, request được xử lý tại lớp Plugin, nơi thực hiện các tác vụ trung gian như kiểm tra tính hợp lệ của request, chuẩn hóa và chuyển đổi cấu trúc dữ liệu, cũng như áp dụng các chính sách xử lý theo từng kịch bản tích hợp. Lớp Plugin đóng vai trò quan trọng trong việc tách biệt sự khác biệt giữa các hệ thống tích hợp, cho phép các hệ thống bên ngoài giao tiếp với TOSS thông qua một chuẩn thống nhất mà không phụ thuộc vào cấu trúc nội bộ của backend.

- ● Sau khi hoàn tất xử lý trung gian, request được chuyển tới lớp Upstream Configuration, nơi xác định dịch vụ đích và các thông số kết nối tương ứng. Upstream trong trường hợp này là cấu hình tại API Gateway, định nghĩa các hệ thống sẽ được gọi, bao gồm các dịch vụ nội bộ TOSS, các API đối tác hoặc các nền tảng AI/Dữ liệu. API Gateway sử dụng cấu hình này để forward request tới đúng hệ thống đích mà không chứa logic nghiệp vụ bên trong.

- ● Các dịch vụ phía sau (Ví dụ: TOSS Services, Partner APIs, AI/Data Platform) là nơi thực thi nghiệp vụ thực tế và xử lý dữ liệu. Kết quả sau khi xử lý sẽ được trả về API Gateway và phản hồi lại cho nguồn request.

Với cách tiếp cận này, giải pháp đảm bảo việc tích hợp hệ thống được thực hiện thông qua cấu hình tại API Gateway (Route, Plugin, Upstream), cho phép bổ sung các hệ thống mới hoặc thay đổi luồng tích hợp mà không cần chỉnh sửa code của các dịch vụ backend hiện hữu. Điều này giúp hệ thống dễ dàng mở rộng, giảm phụ thuộc giữa các thành phần và đảm bảo tính ổn định trong quá trình vận hành.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
