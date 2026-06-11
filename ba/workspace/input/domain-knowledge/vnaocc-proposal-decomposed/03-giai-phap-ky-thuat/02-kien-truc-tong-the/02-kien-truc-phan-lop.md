---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.2.2 Phân lớp kiến trúc"
source_pages: "29-32"
---

# III.2.2 Phân lớp kiến trúc

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.2.2 Phân lớp kiến trúc
- Trang: 29–32

## Nội dung trích nguyên văn (Verbatim Extract)

Kiến trúc hệ thống được tổ chức theo mô hình phân lớp, bao gồm Presentation Layer, Application/Service Layer và Data Layer. Việc phân tách theo các lớp chức năng giúp hệ thống đảm bảo tính độc lập giữa giao diện, xử lý nghiệp vụ và dữ liệu, đồng thời tạo nền tảng cho khả năng mở rộng, tích hợp và vận hành ổn định.

**Hình 3. Sơ đồ phân lớp kiến trúc**

### ● Presentation Layer
Đóng vai trò là lớp giao tiếp với người dùng, cung cấp các kênh truy cập như ứng dụng web và ứng dụng di động. Lớp này được thiết kế theo hướng thống nhất về trải nghiệm và cách thức tương tác, đảm bảo người dùng có thể tiếp cận hệ thống một cách thuận tiện và nhất quán trên các nền tảng khác nhau.

Toàn bộ yêu cầu từ người dùng được tiếp nhận tại lớp này và chuyển tiếp tới lớp dịch vụ phía dưới thông qua các cơ chế điều phối tập trung. Presentation Layer không thực hiện xử lý nghiệp vụ, mà tập trung vào việc hiển thị dữ liệu, thu thập thông tin đầu vào và đảm bảo tính toàn vẹn của các tương tác với hệ thống.

### ● Application/Service Layer
Application/Service Layer là trung tâm xử lý nghiệp vụ của hệ thống, nơi các chức năng được tổ chức theo các miền nghiệp vụ độc lập. Mỗi miền chức năng đảm nhận một phạm vi xử lý riêng, cho phép hệ thống triển khai và mở rộng theo từng phần mà không ảnh hưởng đến các thành phần khác.

Lớp này đồng thời đóng vai trò điều phối các luồng xử lý và quản lý giao tiếp giữa các thành phần trong hệ thống cũng như với các hệ thống bên ngoài. Các luồng tích hợp được thiết kế theo hướng tách biệt với xử lý nghiệp vụ lõi, nhằm đảm bảo hệ thống có thể mở rộng kết nối mà không làm gia tăng độ phức tạp hoặc ảnh hưởng đến tính ổn định.

### ● Data Layer
Data Layer chịu trách nhiệm quản lý, lưu trữ và cung cấp dữ liệu cho toàn bộ hệ thống (Database, cache …). Kiến trúc dữ liệu được tổ chức theo hướng phân tách giữa dữ liệu phục vụ xử lý nghiệp vụ và dữ liệu phục vụ khai thác, phân tích, nhằm đảm bảo hiệu năng cho các giao dịch đồng thời hỗ trợ các nhu cầu báo cáo và phân tích dữ liệu.

Lớp dữ liệu được thiết kế với khả năng mở rộng và tích hợp cao, cho phép hệ thống khai thác dữ liệu một cách linh hoạt, đồng thời đảm bảo tính nhất quán, an toàn và sẵn sàng của dữ liệu trong suốt quá trình vận hành.

### Cách thức vận hành và xử lý của mô hình:

- ● Quy trình vận hành của hệ thống được tổ chức theo luồng xử lý xuyên suốt giữa các lớp, trong đó mỗi lớp đảm nhận một vai trò riêng biệt và chỉ tương tác với lớp liền kề, đảm bảo tính tách biệt và kiểm soát chặt chẽ trong toàn bộ quá trình xử lý.

- ● Người dùng thực hiện tương tác với hệ thống thông qua Presentation Layer (các giao diện Web/Mobile). Tại lớp này, các yêu cầu được tiếp nhận, kiểm tra sơ bộ về tính hợp lệ của dữ liệu đầu vào và định dạng thông tin trước khi được chuyển tiếp xuống lớp Application/Service Layer để xử lý.

- ● Tại Application/Service Layer, yêu cầu được tiếp nhận và xử lý theo logic nghiệp vụ tương ứng. Lớp này chịu trách nhiệm điều phối luồng xử lý, thực hiện các kiểm tra nghiệp vụ và quyết định hướng xử lý tiếp theo. Trong trường hợp yêu cầu có thể được xử lý hoàn toàn tại lớp này, kết quả sẽ được trả trực tiếp về lớp Presentation để hiển thị cho người dùng. Ngược lại, nếu cần truy xuất hoặc cập nhật dữ liệu, lớp này sẽ gửi yêu cầu xuống Data Layer.

- ● Data Layer thực hiện việc tương tác với hệ thống lưu trữ dữ liệu, bao gồm truy vấn, cập nhật và xử lý dữ liệu theo yêu cầu từ lớp Application/Service Layer. Kết quả sau khi xử lý được trả ngược trở lại lớp Application/Service Layer để tiếp tục kiểm tra và hoàn thiện, trước khi gửi về lớp Presentation để hiển thị cho người dùng.

- ● Trong toàn bộ quá trình xử lý, các lỗi phát sinh được kiểm soát theo nguyên tắc phân lớp. Lỗi tại lớp nào sẽ được xử lý và chuẩn hóa tại lớp đó trước khi được trả ngược lên lớp phía trên, đảm bảo thông tin phản hồi nhất quán và phù hợp với ngữ cảnh sử dụng. Việc trao đổi dữ liệu giữa các lớp được thực hiện thông qua các cấu trúc dữ liệu trung gian được chuẩn hóa, đảm bảo tính nhất quán, dễ mở rộng và độc lập với cấu trúc lưu trữ bên dưới.

Cách tổ chức này giúp hệ thống đảm bảo luồng xử lý rõ ràng, dễ kiểm soát, đồng thời tạo điều kiện cho việc mở rộng, thay đổi từng lớp mà không ảnh hưởng đến toàn bộ hệ thống.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
