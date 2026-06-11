---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "I. Tổng quan giải pháp"
source_pages: "5-7"
---

# I. Tổng quan giải pháp

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: I. Tổng quan giải pháp
- Trang: 5–7

## Nội dung trích nguyên văn (Verbatim Extract)

Ngành hàng không dân dụng đang trải qua quá trình chuyển đổi số sâu rộng, dịch chuyển từ mô hình quản trị phản ứng (reactive management) sang mô hình tối ưu hóa dựa trên dữ liệu thực và dự báo (predictive optimization). Các hãng hàng không đang hiện diện trong một môi trường vận hành có độ phức tạp cao, nơi biến động về giá nhiên liệu, áp lực về tỷ lệ đúng giờ (OTP) và các quy định an toàn bay khắt khe đòi hỏi khả năng xử lý thông tin tập trung. Xu hướng chủ đạo hiện nay là việc thay thế dần các hệ thống rời rạc bằng những kiến trúc nền tảng có khả năng hợp nhất luồng dữ liệu từ thông tin lịch bay, tổ bay, hành khách, kỹ thuật đến các thông báo hàng không, khí tượng cũng như theo dõi chuyến bay theo thời gian thực. Mục tiêu cốt lõi là thiết lập môi trường ra quyết định hiệp đồng (Collaborative Decision Making - CDM), nâng cao năng lực nhận diện tình huống (Situational Awareness), tối ưu hóa hiệu quả kinh tế trên mỗi giờ bay.

Hệ thống tối ưu điều hành khai thác tập trung vào 3 mảng nghiệp vụ chính, bao gồm:

### ● Quản trị thông tin điều hành chuyến bay

Hệ thống TOSS thiết lập một môi trường dữ liệu hợp nhất, bóc tách và hiển thị đa chiều toàn bộ các thực thể liên quan đến chuyến bay theo kế hoạch và thực tế. Hệ thống tích hợp trực tiếp dữ liệu từ các nguồn sơ cấp để cung cấp bức tranh toàn cảnh về cấu hình tàu bay, trạng thái phi hành đoàn, thông tin tải trọng hành khách, thông tin nhiên liệu... đồng thời ghi nhận, cảnh báo các bất thường về thời tiết, kỹ thuật cũng như giám sát tài liệu chuyến bay.

### ● Số hóa và quản lý vòng đời tài liệu chuyến bay

Hệ thống TOSS đóng vai trò là trung tâm quản lý tập trung toàn bộ danh mục tài liệu khai thác bay dưới dạng số hóa, bao gồm: OFP, NOTAM, WX, briefing package, LS, GD, PM, NOTOC Cargo, NOCTOC Baggage, Cargo Manifest, Mail Manifest. Quy trình quản trị tài liệu đảm bảo tính toàn vẹn thông qua cơ chế kiểm soát phiên bản (Revision Control) và lưu trữ lịch sử tương tác chi tiết. Điểm quan trọng trong thiết kế nghiệp vụ là khả năng đồng bộ trạng thái tài liệu với MO Plus theo thời gian thực. Hệ thống ghi nhận chính xác thời điểm thực hiện các tác vụ: yêu cầu (Request), xác nhận (Confirm) hoặc từ chối (Reject) bởi Phi hành đoàn. Ngoài ra, để ứng phó với các tình huống gián đoạn kết nối, TOSS cung cấp giao diện và phương thức truy cập độc lập, đảm bảo tính liên tục của luồng thông tin tài liệu trước giờ khởi hành theo đúng quy định khai thác hàng không.

### ● Phân tích, báo cáo đánh giá tối ưu khai thác

Hệ thống cung cấp năng lực tổng hợp số liệu từ một nguồn dữ liệu duy nhất sau khi đã được thu thập đa nguồn, xử lý, làm sạch để phục vụ công tác báo cáo đánh giá tối ưu khai thác trên tất cả các phương diện: Thông tin khai thác hàng ngày, Lịch bay, Tổ bay, Thời gian thực hiện chuyến bay, Kế hoạch bay, Tải trọng, Nhiên liệu,... Đặc biệt, hệ thống bao gồm nghiệp vụ tối ưu hóa chính sách mang dầu bổ sung (Tankering Strategy) với tính chất khuyến nghị, mang lại hiệu quả kinh tế trong quá trình khai thác.

Để đáp ứng toàn diện các nghiệp vụ trên, Hệ thống TOSS được xây dựng trên kiến trúc Microservices dựa trên Cloud Native, tuân thủ tiêu chuẩn của tổ chức CNCF. Thiết kế này đảm bảo sự phân tách tuyệt đối giữa tầng giao diện, tầng logic nghiệp vụ và tầng dữ liệu, cho phép hệ thống mở rộng tài nguyên linh hoạt và cập nhật tính năng mà không gây gián đoạn dịch vụ.

Hệ thống TOSS được xây dựng dựa trên các nền tảng sau:

### ● Quản lý người dùng và kiểm soát phân quyền tập trung

Giải pháp triển khai phân hệ Quản trị danh tính (Identity and Access Management) độc lập để kiểm soát toàn bộ vòng đời người dùng trong hệ thống. Cơ chế phân quyền dựa trên vai trò (RBAC) được chi tiết hóa đến từng dịch vụ và API, đảm bảo an toàn cho các dữ liệu nhạy cảm. Hệ thống hỗ trợ xác thực đa yếu tố (MFA/2FA), cơ chế Đăng nhập một lần (SSO) và tích hợp với LDAP/Active Directory của Tổng công ty, cho phép quản lý tập trung và lưu vết mọi hành vi truy cập tài nguyên.

### ● Quản trị danh mục và tham số hệ thống tập trung

Hệ thống thiết lập phân hệ Quản lý dữ liệu chủ để duy trì tính nhất quán cho các danh mục cốt lõi của ngành hàng không: Tàu bay, Sân bay, Chặng bay, Tổ bay,.... Mỗi thực thể dữ liệu được định nghĩa theo cấu trúc Metadata chuẩn, có hỗ trợ quản lý phiên bản và lưu vết lịch sử thay đổi. Dữ liệu chủ được cung cấp cho các hệ thống vệ tinh khác thông qua API hoặc cơ chế Webhook, đảm bảo toàn bộ hệ sinh thái khai thác vận hành trên một bộ từ điển dữ liệu duy nhất và chính xác.

### ● Cổng tích hợp và điều phối dịch vụ tập trung

Thay thế cho các kết nối điểm - điểm (Point-to-Point) truyền thống, TOSS xây dựng lớp trung gian điều phối dịch vụ dựa trên API Gateway. Phân hệ này chịu trách nhiệm bảo mật các điểm cuối, phân phối tải tự động và thực thi các chính sách giới hạn lưu lượng để bảo vệ hạ tầng backend. Giải pháp quản trị toàn diện vòng đời API và áp dụng các kỹ thuật truyền tải tệp tin lớn (nén dữ liệu, truyền song song) để tối ưu hóa tốc độ trao đổi thông tin với các hệ thống vệ tinh.

### ● Nền tảng lưu trữ và xử lý dữ liệu quy mô lớn

Hệ thống đáp ứng khả năng quản trị dữ liệu lớn thông qua kiến trúc xử lý phân lớp, hỗ trợ đa dạng định dạng dữ liệu: có cấu trúc (SQL), bán cấu trúc (JSON/XML) và phi cấu trúc (file pdf, tệp ảnh,...). Dữ liệu được quản lý theo vòng đời từ khâu thu thập, chuẩn hóa, làm sạch đến khi loại bỏ theo chuẩn bảo mật.

Hệ thống hỗ trợ xử lý song song hai chế độ:
- Xử lý Batch (Theo lô): Thực hiện các quy trình biến đổi dữ liệu (ETL) định kỳ cho khối lượng lớn dữ liệu lịch sử phục vụ báo cáo phân tích.
- Xử lý Streaming (Dòng dữ liệu): Sử dụng các công nghệ xử lý luồng (như Kafka/Spark Streaming) để phản ứng gần thời gian thực với các sự kiện khai thác.

Việc phân tách hoàn toàn giữa tầng lưu trữ và tầng xử lý giúp tối ưu hóa hiệu năng và đảm bảo tính sẵn sàng cao khi khối lượng dữ liệu tăng trưởng theo thời gian.

### ● Giám sát vận hành, độ tin cậy và tuân thủ pháp lý

Toàn bộ thành phần hệ thống TOSS được giám sát tập trung, giúp chủ động phát hiện và cảnh báo sự cố trước khi ảnh hưởng đến người dùng nghiệp vụ. Giải pháp đảm bảo tính sẵn sàng cao (High Availability) với SLA tối thiểu 99%.

Về mặt pháp lý, hệ thống tuân thủ tuyệt đối Nghị định 53/2022/NĐ-CP về lưu trữ dữ liệu tại lãnh thổ Việt Nam và Nghị định 13/2023/NĐ-CP về bảo vệ dữ liệu cá nhân. Mọi thiết kế kiến trúc, mã nguồn và dữ liệu khai thác đều thuộc quyền sở hữu toàn diện của Tổng công ty Hàng không Việt Nam, đảm bảo tính tự chủ và an toàn thông tin tối đa cho hệ thống lõi của OCC.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
