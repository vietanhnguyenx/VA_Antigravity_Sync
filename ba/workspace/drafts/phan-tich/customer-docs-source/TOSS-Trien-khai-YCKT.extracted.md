---
source_gsheet: "https://docs.google.com/spreadsheets/d/1DGIytCh-7EY2YVrBhKKctunitOVtMcxIPouCbhjRuFA"
document_type: "Google Sheet → MD (gspread, read-only)"
pulled: "2026-06-16"
status: "Raw pull — chưa biên tập"
---

# TOSS - Triển khai-YCKT- VTIT

> **Nguồn (Google Sheet, live):** https://docs.google.com/spreadsheets/d/1DGIytCh-7EY2YVrBhKKctunitOVtMcxIPouCbhjRuFA  
> Pull tự động 2026-06-16 bằng `gsheet-to-md.py` — trích trung thực; con người mở link gốc để xem/sửa.

## Lịch KS

| https://docs.google.com/document/d/1oz60FpsoV2xuyWo8hoYxpBhQhyUDU4tD/edit#bookmark=id.n8xtdgrwgxz4 |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|
| STT | Nội dung | Chi tiết | Thành phần | Weekday | Ngày | THỜI GIAN |  | Hình thức |
|  |  |  |  |  |  | Sáng | Chiều |  |
| 1 | Tổng quan | Integration high level Yêu cầu nghiệp vụ tổng thể, stakeholder, phạm vi nghiệp vụ | Lê, An/Nam | 2 | 08/05/2026 | 9:00 |  | Trực tiếp |
| 2 | Tổng quan DSP |  | Mr Dũng | 3 | 09/06/2026 |  | 16 |  |
| 3 | Quản lý tàu bay |  | Lê | 3 | 09/06/2026 | 9:00 |  |  |
| 4 | Chi tiết DSP |  | DSP | 3 | 11/06/2026 | 9:00 |  | Trực tiếp |
| 5 | Chi tiết DSP |  | DSP | 3 | 12/06/2026 | 9:00 |  | Trực tiếp |
| 6 | Quản lý tàu bay | MEL, Performance Factor | Lê, MEL/FOE, Thanh | 4 | 15/06/2026 |  |  | Trực tiếp |
| 7 | Tích hợp TOSS - OPS++ | Khảo sát phạm vi tích hợp của TOSS phục vụ OPS++ | Nam, An | 4 | 16/06/2026 |  |  | Trực tiếp |
| 8 | Tích hợp Analyzed QAR | Làm việc với SQD, CĐS về việc tích hợp dữ liệu QAR |  | 4 | 17/06/2026 |  |  | Trực tiếp |
| 9 | Nghiệp vụ CLC | Cung cấp tải trọng. Xem Fuel Order. Cung cấp tài liệu LS, GD, PM. Các nghiệp vụ khác | Mr Sơn CLC | 4 | 18/06/2026 |  |  | Trực tiếp |
| 10 | Tích hợp TOSS - OPS++ | Khảo sát phạm vi tích hợp của TOSS phục vụ OPS++ | Nam, An | 4 | 19/06/2026 |  |  | Trực tiếp |
| 11 |  |  |  |  |  |  |  |  |
| 12 |  |  |  |  |  |  |  |  |
| 13 |  |  |  |  |  |  |  |  |

## Nhân sự

| NHÂN SỰ PHỐI HỢP TRIỂN KHAI |  |  |  |  |  |
|---|---|---|---|---|---|
| STT | CQĐV | Họ và tên | Chức vụ | Số điện thoại | Email |
|  |  |  |  |  |  |
| 1 | CĐS-CN | Nguyễn Quỳnh Ngân | CV | 909914988 | ngannq@vietnamairlines.com |
| 2 | TTHH |  |  |  |  |
| 3 | ATCL |  |  |  |  |
| 4 | KT |  |  |  |  |
| 5 | DVHK |  |  |  |  |
| 6 | VIAGS |  |  |  |  |

## YCKT V3

|  | YÊU CẦU KỸ THUẬT HỆ THỐNG TỐI ƯU ĐIỀU HÀNH KHAI THÁC (TOSS) |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|
|  | STT | Tiêu chí yêu cầu | Chức năng | Filter/ Button | Chi tiết/ Kết quả | Biểu đồ | Logic tính toán |
|  | T | Yêu cầu chung |  |  |  |  |  |
|  | 1 | Yêu cầu về kiến trúc, công nghệ |  |  |  |  |  |
|  | TOSS-001 | Kiến trúc hệ thống được xây dựng hướng Microservices dựa trên Cloud Native do tổ chức điện toán thuần đám mây (CNCF - Cloud Native Computing Foundation) cung cấp. Yêu cầu NCC có kinh nghiệm phát triển & triển khai hệ thống dựa trên Cloud Native, có evidence (tài liệu thiết kế, triển khai… hệ thống từng thực hiện) để chứng minh |  |  |  |  |  |
|  | TOSS-002 | Tất cả các module/component trong kiến trúc được thiết kế và mô tả chi tiết: Chức năng component, Đầu vào, đầu ra, Interface. Mối quan hệ giữa các module/ component trong kiến trúc được mô tả thông qua diagram. Yêu cầu NCC có kinh nghiệm thiết kế hệ thống theo yêu cầu trên, có evidence (tài liệu thiết kế, triển khai… hệ thống từng thực hiện) để chứng minh. |  |  |  |  |  |
|  | TOSS-003 | Các công nghệ sử dụng được liệt kê đầy đủ, giải thích cụ thể lý do lựa chọn công nghệ.  - Tên công nghệ  - Phiên bản sử dụng  - Mục đích sử dụng |  |  |  |  |  |
|  | TOSS-004 | Đảm bảo các yêu cầu về license: + Hệ thống không sử dụng các thư viện, phần mềm vi phạm bản quyền. Không sử dụng dạng trial khi triển khai chính thức hệ thống. + Khi sử dụng license, NCC chịu cung cấp và chịu trách nhiệm 100% đối với license cho hệ điều hành, công cụ lập trình, hệ cơ sở dữ liệu, font chữ và license các phần mềm cần thiết xuyên suốt thời gian cung cấp cho bên sử dụng. |  |  |  |  |  |
|  | TOSS-005 | Hệ thống có khả năng dễ dàng scale về phần cứng, app, DB mà không cần phải có thời gian downtime hệ thống. |  |  |  |  |  |
|  | TOSS-006 | Các tầng của ứng dụng phải được phân tách một cách độc lập, các tầng có thể chỉnh sửa một cách độc lập mà không ảnh hưởng tới các tầng khác: tầng giao diện, tầng nghiệp vụ, tầng dữ liệu. |  |  |  |  |  |
|  | TOSS-007 | Các module được phân tách một cách độc lập về dữ liệu, về nghiệp vụ, đảm bảo dữ liệu và nghiệp vụ một module không bị ảnh hưởng khi dữ liệu và nghiệp vụ của các module khác thay đổi. |  |  |  |  |  |
|  | TOSS-008 | Đối với các module phục vụ trực tiếp người dùng: Khi restart module không được ảnh hưởng đến người dùng. Phải có node dự phòng khi restart, đảm bảo dịch vụ không gián đoạn. |  |  |  |  |  |
|  | 2 | Yêu cầu về bảo mật, an toàn, an ninh thông tin |  |  |  |  |  |
|  | TOSS-009 | NCC đảm bảo an toàn thông tin phần ứng dụng như: source code, chức năng, giao diện… Yêu cầu NCC chứng minh năng lực, evidence nếu có |  |  |  |  |  |
|  | TOSS-010 | Cam kết bảo mật theo quy định ANTT của TCTHK. Cam kết tuân thủ quy định đánh giá ANTT của TCTHK |  |  |  |  |  |
|  | TOSS-011 | Cam kết bảo mật thông tin theo Quy định về dữ liệu trên không gian mạng phải lưu trữ tại Việt Nam theo nghị định 53/2022/NĐ-CP. |  |  |  |  |  |
|  | TOSS-012 | Tuân thủ Nghị định 13/2023/NĐCP về bảo vệ dữ liệu cá nhân |  |  |  |  |  |
|  | TOSS-013 | NCC không chia sẻ dữ liệu hoặc kết nối với bất kỳ bên nào nếu chưa có sự cho phép của TCT |  |  |  |  |  |
|  | 3 | Yêu cầu về độ tin cậy hệ thống |  |  |  |  |  |
|  | TOSS-014 | Toàn bộ các thành phần hệ thống phải được giám sát |  |  |  |  |  |
|  | TOSS-015 | Hệ thống có khả năng đáp ứng khi tải người dùng có thay đổi |  |  |  |  |  |
|  | TOSS-016 | Có cơ chế đảm bảo khả năng sẵn sàng cho từng thành phần và toàn bộ hệ thống |  |  |  |  |  |
|  | TOSS-017 | Cung cấp khả năng từ chối yêu cầu theo ngưỡng |  |  |  |  |  |
|  | TOSS-018 | Thiết kế giải pháp tự động phát hiện và điều tiết lưu lượng |  |  |  |  |  |
|  | TOSS-019 | Có sự phân tách sử dụng tài nguyên giữa các thành phần như: ứng dụng, Database, log… |  |  |  |  |  |
|  | 4 | Quản lý phân quyền tập trung, xác thực người dùng |  |  |  |  |  |
|  | TOSS-020 | 1. Quản trị người dùng, xác thực và phân quyền chi tiết theo từng phân hệ, dịch vụ • Hệ thống cho phép quản lý toàn bộ vòng đời người dùng, bao gồm: tạo mới, sửa thông tin, vô hiệu hóa, kích hoạt lại, và xóa người dùng. • Mỗi người dùng được gán vai trò (role) hoặc nhóm quyền (group). Vai trò này được ánh xạ với tập hợp quyền truy cập (permissions) vào các module, phân hệ, dịch vụ hoặc API riêng biệt trong hệ thống. • Cho phép định nghĩa các chính sách quyền truy cập động (dynamic access policies) như hạn chế quyền theo thời gian, hoặc trạng thái phiên làm việc. • Có khả năng cung cấp quyền người dùng theo thời gian thực (real-time permission) để đảm bảo không truy cập sai phạm hoặc vượt quyền. • Yêu cầu xác thực đa yếu tố hoặc xác thực 2 bước (MFA/2FA) ít nhất cho nhóm quản trị viên |  |  |  |  |  |
|  |  |  | Phân quyền theo Carrier, sân bay, tàu bay |  |  |  |  |
|  | TOSS-021 | 2. Mở rộng xác thực và phân quyền ra các hệ thống bên ngoài • Hệ thống được thiết kế theo kiến trúc dịch vụ xác thực độc lập (authentication service), cho phép các hệ thống khác tích hợp và sử dụng các dịch vụ • Có thể tích hợp với hệ thống LDAP, Active Directory, hoặc các hệ thống quản lý danh tính (IAM) khác. • Cho phép cấp quyền truy cập cho hệ thống bên ngoài theo các policy định nghĩa sẵn, hoặc phân quyền riêng biệt ở từng hệ thống tích hợp. • Có thể sử dụng cơ chế token-based authentication như JWT để đảm bảo hiệu suất và bảo mật cao trong môi trường phân tán/microservices. |  |  |  |  |  |
|  | TOSS-022 | 3. Hỗ trợ Single Sign-On (SSO) và quản lý phân quyền liên hệ thống • Một tài khoản duy nhất (SSO) có thể truy cập đồng thời nhiều hệ thống hoặc ứng dụng khác nhau mà không cần đăng nhập lại hoặc tạo tài khoản riêng lẻ. • Phân quyền được quy hoạch tập trung theo từng hệ thống – người dùng có thể có các vai trò khác nhau trên từng hệ thống. • Có giao diện quản trị tập trung (centralized admin portal) để cấu hình, theo dõi hoạt động, phân quyền và kiểm soát truy cập liên hệ thống. • Hệ thống có khả năng log và audit chi tiết mọi hành vi đăng nhập, thay đổi quyền, hoặc truy cập tài nguyên – phục vụ kiểm toán, bảo mật và phân tích rủi ro. |  |  |  |  |  |
|  | TOSS-023 | Hỗ trợ quản lý phiên làm việc (session management) và kiểm soát truy cập theo thời gian thực Cho phép tạo quyền truy cập tạm thời (có thời hạn) cho người dùng theo dự án hoặc chiến dịch đặc biệt, tự động thu hồi khi hết hạn. |  |  |  |  |  |
|  | 5 | Yêu cầu về danh mục hệ thống |  |  |  |  |  |
|  | TOSS-024 | 1. Hệ thống cho phép quản trị danh mục hệ thống trên một module, phân hệ hoặc dịch vụ riêng biệt • Cấu trúc metadata chuẩn cho từng danh mục • Hỗ trợ phân loại danh mục (theo lĩnh vực, nghiệp vụ, hệ thống sử dụng) để dễ quản lý • Versioning và lịch sử thay đổi (ai thay đổi, khi nào, nội dung gì) |  |  |  |  |  |
|  | TOSS-025 | 2. Có khả năng cung cấp dữ liệu về danh mục cho các hệ thống khác theo phân quyền được thiết lập thông qua API hoặc webhook khi có thay đổi dữ liệu |  |  |  |  |  |
|  | TOSS-026 | 3. Có chức năng thiết lập phân quyền truy cập dữ liệu về danh mục theo hệ thống |  |  |  |  |  |
|  | 6 | Yêu cầu khác |  |  |  |  |  |
|  | TOSS-027 | Log phải được lưu trữ tập trung giúp giám sát, kiểm soát và xử lý sự cố hiệu quả trong toàn hệ thống. • Hệ thống có khả năng thu thập, phân tích và hiển thị log từ nhiều dịch vụ khác nhau. • Phân loại log theo hệ thống, mức độ và cấp quyền theo vai trò người dùng. |  |  |  |  |  |
|  | TOSS-028 | Truyền tải file cần được xử lý tối ưu hóa giúp Tăng tốc độ, giảm độ trễ và độ tin cậy khi truyền tải các tệp lớn trong hệ thống. • Nén dữ liệu: Sử dụng các kỹ thuật nén như gzip hoặc zip để giảm kích thước file trước khi truyền • Truyền dữ liệu song song (Parallel Transfer): Chia nhỏ file và truyền đồng thời nhiều phần |  |  |  |  |  |
|  | TOSS-029 | Ứng dụng CI/CD trong việc phát triển và triển khai, nâng cấp hệ thống giúp tự động hóa quy trình phát triển, thử nghiệm và triển khai phần mềm để giảm thiểu lỗi và tăng tốc độ phát hành. |  |  |  |  |  |
|  | TOSS-030 | Tư vấn xây dựng kiến trúc và các tiêu chuẩn cho các hệ thống triển khai tiếp theo để thích hợp với kiến trúc hệ thống này |  |  |  |  |  |
|  | TOSS-031 | Đáp ứng tối thiểu 4000 người sử dụng, sử dụng đồng thời 200 |  |  |  |  |  |
|  | TOSS-032 | Các ứng dụng nghiệp vụ tương thích các trình duyệt phổ biến: Microsoft Edge, Google Chrome, Firefox |  |  |  |  |  |
|  | TOSS-033 | Phiên bản ứng dụng mobile với phạm vi chức năng theo yêu cầu tại tiêu chí TOSS0245 tương thích các hệ điều hành iOS, iPadOS, Android |  |  |  |  |  |
|  | TOSS-034 | Ứng dụng phải được nâng cấp để tương thích với các hệ điều hành, trình duyệt trong vòng 30 ngày kể từ ngày hệ điều hành, trình duyệt phát hành phiên bản mới. |  |  |  |  |  |
|  | 7 | Dịch vụ vận hành, giám sát |  |  |  |  |  |
|  | TOSS-035 | Có cơ chế vận hành, giám sát tập trung, cảnh báo bất thường, chủ động phát hiện sự cố |  |  |  |  |  |
|  | TOSS-036 | Cung cấp dịch vụ vận hành hệ thống trong vòng 60 tháng kể từ thời điểm golive |  |  |  |  |  |
|  | TOSS-037 | NCC hỗ trợ dịch vụ 24 giờ/ngày, 7 ngày/tuần và 365 ngày/năm, cung cấp đầy đủ thông tin liên quan đến đầu mối liên lạc để tiếp nhận yêu cầu |  |  |  |  |  |
|  | TOSS-038 | Đảm bảo hệ thống được hoạt động một cách hiệu quả và đạt hiệu suất cao. |  |  |  |  |  |
|  | TOSS-039 | Tiếp nhận thông tin sự cố và xử lý các sự cố trong hệ thống. Quản lý sự cố, vấn đề xảy ra trong hệ thống. |  |  |  |  |  |
|  | TOSS-040 | Cung cấp dịch vụ cập nhật, thay đổi hệ thống theo yêu cầu của VNA. Quản lý các yêu cầu thay đổi trong hệ thống. |  |  |  |  |  |
|  | TOSS-041 | Thực hiện các công việc liên quan tới quản trị, cấu hình, cập nhật tài nguyên lên hệ thống phần mềm và các phân hệ liên quan |  |  |  |  |  |
|  | TOSS-042 | Hỗ trợ, phối hợp với các đơn vị liên quan để đảm bảo hoạt động trong quá trình vận hành |  |  |  |  |  |
|  | TOSS-043 | Cập nhật, nâng cấp phiên bản, bản vá khi có khuyến cáo. |  |  |  |  |  |
|  | TOSS-044 | Tư vấn và đưa ra giải pháp hạn chế hoặc khắc phục được các lỗi kỹ thuật của hệ thống |  |  |  |  |  |
|  | TOSS-045 | Báo cáo vận hành hệ thống định kỳ, báo cáo sự cố bất thường |  |  |  |  |  |
|  | 8 | Hạ tầng và Định cỡ hệ thống (sizing) |  |  |  |  |  |
|  | TOSS-046 | Nhà cung cấp xây dựng và triển khai phần mềm hệ thống trên hạ tầng Cloud của VNA cung cấp |  |  |  |  |  |
|  | TOSS-047 | Hệ thống bao gồm các môi trường hệ thống chính (Prod), hệ thống phát triển/ kiểm thử (Dev/Test) và hệ thống dự phòng (Standby, Backup) |  |  |  |  |  |
|  | TOSS-048 | Nhà cung cấp đảm bảo tính sẵn sàng cao ( High Availability ) cho hệ thống bằng cơ chế active-active hoặc active-standy( việc chuyển đổi giữa active và standby không quá 1h) |  |  |  |  |  |
|  | TOSS-049 | Giám sát hoạt động của hệ thống trên hạ tầng Cloud của VNA và khuyến cáo cho VNA các vấn đề liên quan đến hạ tầng |  |  |  |  |  |
|  | TOSS-050 | Định cỡ hạ tầng Cloud để triển khai hệ thống do VNA cung cấp theo Mục 1, phụ lục 2 đính kèm |  |  |  |  |  |
|  | TOSS-051 | Kiến trúc hệ thống cho phép mở rộng theo thời gian |  |  |  |  |  |
|  | 9 | Yêu cầu bàn giao hệ thống |  |  |  |  |  |
|  | TOSS-052 | Cam kết dữ liệu, đặc tả yêu cầu, thiết kế chi tiết, mã nguồn và đặc tả mã nguồn hệ thống thuộc quyền sở hữu của Vietnam Airlines |  |  |  |  |  |
|  | TOSS-053 | Cung cấp đầy đủ tài liệu hệ thống: mô tả công nghệ sử dụng, đặc tả yêu cầu, thiết kế kiến trúc tổng thể, thiết kế chi tiết, mã nguồn và đặc tả mã nguồn hệ thống |  |  |  |  |  |
|  | TOSS-054 | Cung cấp tài liệu hướng dẫn sử dụng phần mềm, ứng dụng. Tổ chức các lớp đào tạo, hướng dẫn sử dụng, chuyển giao công nghệ cho đội ngũ quản trị và các đối tượng người dùng khác nhau |  |  |  |  |  |
|  | TOSS-055 | Bàn giao source code (mã nguồn) cho TCTHK sau khi hết thời gian thuê dịch vụ phần mềm |  |  |  |  |  |
|  | 10 | Thời gian triển khai |  |  |  |  |  |
|  | TOSS-056 | Thời gian triển khai hệ thống: Triển khai toàn bộ các yêu cầu kỹ thuật trong vòng tối đa 09 tháng kể từ thời điểm Hợp đồng có hiệu lực. Trong thời gian triển khai, NCC cam kết sắp xếp ít nhất 01 nhân sự onsite tại trụ sở VNA để hỗ trợ tại chỗ. |  |  |  |  |  |
|  | TOSS-057 | Thời gian thuê dịch vụ: 60 tháng kể từ ngày Ký biên bản nghiệm thu và đưa hệ thống vào sử dụng |  |  |  |  |  |
|  | B | Tích hợp dữ liệu và Quản lý danh mục |  |  |  |  |  |
|  | 11 | Yêu cầu |  |  |  |  |  |
|  | TOSS-058 | Hệ thống cần có API Gateway làm trung gian  - Đảm bảo tất cả ứng dụng và dịch vụ bên ngoài truy cập qua Gateway, tránh gọi trực tiếp backend  - Hỗ trợ bảo mật, phân phối tải, cấu hình chính sách (throttling, giám sát, kiểm soát truy cập) linh hoạt |  |  |  |  |  |
|  | TOSS-059 | Hệ thống cần phải giám sát & kiểm soát dữ liệu  - Kiểm soát dữ liệu vào/ra bằng xác thực nâng cao (OAuth2, JWT, IP validation).  - Ngăn chặn truy cập bất thường, tấn công bot/IP đáng ngờ qua nhiều lớp bảo mật. |  |  |  |  |  |
|  | TOSS-060 | Hệ thống cho phép theo dõi & cung cấp báo cáo hiệu suất - Thu thập thống kê truy cập, lỗi, thời gian phản hồi và chỉ số bảo mật - Phân tích hành vi bất thường, cảnh báo sớm sự cố |  |  |  |  |  |
|  | TOSS-061 | Hệ thống cho phép cấu hình động, đảm bảo không gián đoạn dịch vụ - Thay đổi cấu hình API, bảo mật, giới hạn lưu lượng mà không cần dừng hệ thống - Quản lý qua giao diện trực quan, hỗ trợ cập nhật tự động |  |  |  |  |  |
|  | TOSS-062 | Hệ thống cần phải quản lý được vòng đời API, hỗ trợ thiết kế, triển khai, versioning, bảo trì, cập nhật và ngừng API hiệu quả |  |  |  |  |  |
|  | TOSS-063 | Hệ thống cần phải đảm bảo hoạt động ổn định, tương thích với công nghệ cũ và thay đổi mới |  |  |  |  |  |
|  | TOSS-064 | Hệ thống phải có khả năng mở rộng: cung cấp API, plugin, tích hợp AI/ML hoặc công cụ phân tích dữ liệu bên ngoài. Đảm bảo phát triển thêm tối thiểu 10 giao tiếp dữ liệu giữa các hệ thống trong thời gian cung cấp dịch vụ không phát sinh chi phí |  |  |  |  |  |
|  | 12 | Tích hợp các nguồn dữ liệu |  |  |  |  |  |
|  | 12.1 | Tích hợp thông tin với các hệ thống |  |  |  |  |  |
|  | TOSS-065 | Cung cấp và đồng bộ dữ liệu của hệ thống cho Kho dữ liệu dùng chung của TCT (DWH/Lakehouse) để phục vụ chia sẻ, khai thác và phân tích dữ liệu |  |  |  |  |  |
|  | TOSS-066 | Flight Ops System (Netline hoặc hệ thống tương lai): đóng vai trò phần mềm trung gian trao đổi dữ liệu (Adapter, Middleware) vào ra cho hệ thống Flight Ops |  |  |  |  |  |
|  | TOSS-067 | Flight Scheduling System: lịch bay mùa, thay đổi lịch dưới mùa qua các format điện SSIM, ASM, SSM | Kết nối SFTP |  |  |  |  |
|  | TOSS-068 | AVES: thông tin phi công, tiếp viên và lịch bay phi công, tiếp viên |  |  |  |  |  |
|  | TOSS-069 | Crew Trip: thông tin chi phí khách sạn và xe chở tổ bay |  |  |  |  |  |
|  | TOSS-070 | MO Plus: dữ liệu do MO Plus quản lý phục vụ báo cáo, xem tài liệu Library cần thiết |  |  |  |  |  |
|  | TOSS-071 | MRO/ AMOS: lịch bảo dưỡng tàu bay, hỏng hóc, MEL/CDL, techlog và các thông tin kỹ thuật khác |  |  |  |  |  |
|  | TOSS-072 | TIMS: thông tin khối kỹ thuật |  |  |  |  |  |
|  | TOSS-073 | eTechlog: Flight Log, Defect log, bảo dưỡng, dữ liệu kỹ thuật máy bay, hạn định bảo dưỡng, |  |  |  |  |  |
|  | TOSS-074 | Amadeus PSS (1A): thông tin hành khách, config tàu bay, config mở bản | Config, block, pax total chi tiết thông tin hành khách (PM) phục vụ web KN |  |  |  |  |
|  | TOSS-075 | Flight Planning System: kế hoạch bay, gói tài liệu chuyến bay, thông tin lập kế hoạch bay, đường bay |  |  |  |  |  |
|  | TOSS-076 | Lido mPilot |  |  |  |  |  |
|  | TOSS-077 | Adapter Lido: kế hoạch bay, gói tài liệu chuyến bay, thông tin lập kế hoạch bay, đường bay |  |  |  |  |  |
|  | TOSS-078 | Hệ thống VMS của VIAGS: thông tin khai thác tại sân bay |  |  |  |  |  |
|  | TOSS-079 | FM, Lotus Airport, PTS (Hệ thống thông tin dịch vụ mặt đất) |  |  |  |  |  |
|  | TOSS-080 | ACDM: Milestone times, vị trí, trạng thái chuyến bay, thông tin điều phối mặt đất, điều phối không lưu, năng lực khai thác sân bay, cảnh báo và phân tích hiệu suất |  |  |  |  |  |
|  | TOSS-081 | RPS, các hệ thống quản trị chi phí, lợi nhuận của VNA |  |  |  |  |  |
|  | TOSS-082 | ANCM: chi phí điều hành bay, bay qua, hạ cất cánh |  |  |  |  |  |
|  | TOSS-083 | Cargo Spot: thông tin hàng hóa cho chuyến bay |  |  |  |  |  |
|  | TOSS-084 | DCS: thông tin phục vụ hành khách |  |  |  |  |  |
|  | TOSS-085 | Flight Radar24: vị trí máy bay, hành trình bay |  |  |  |  |  |
|  | TOSS-086 | Flight Watch: dữ liệu thời tiết, dự báo theo đường bay, theo dõi chuyến bay |  |  |  |  |  |
|  | TOSS-087 | Hệ thống tiết kiệm nhiên liệu: kết quả thực hiện của từng giải pháp với từng chuyến bay |  |  |  |  |  |
|  | TOSS-088 | EGS - Hệ thống báo cáo phát triển bền vững |  |  |  |  |  |
|  | TOSS-089 | Chuyển dữ liệu cho WNI |  |  |  |  |  |
|  | TOSS-090 | Chuyển dữ liệu cho Cirium |  |  |  |  |  |
|  | TOSS-091 | Chuyển dữ liệu cho SPECTRA |  |  |  |  |  |
|  | TOSS-092 | ETS - Quản lý Khí thải |  |  |  |  |  |
|  | TOSS-093 | Chuyển dữ liệu cho Hệ thống Quản lý hợp đồng |  |  |  |  |  |
|  | TOSS-094 | LMS: dữ liệu quản lý chuỗi cung ứng |  |  |  |  |  |
|  | 12.2 | Tích hợp các điện văn/ hệ thống điện văn |  |  |  |  |  |
|  | TOSS-095 | ACARS: điện văn Aircraft Communications Addressing and Reporting System |  |  |  |  |  |
|  |  |  | ACARS Fuel Integration by AC Type (báo cáo tích hợp dữ liệu time/fuel ACARS) | Standard Filter | Kết quả theo từng AC Type theo từng tháng trong giai đoạn được chọn: Bảng 1: Fls by Month Bảng 2: ACARS Time Data Coverage Bảng 3: ACARS Block Fuel Data Coverage Bảng 4: ACARS Trip Fuel Data Coverage |  |  |
|  |  |  | ACARS Fuel Integration by AC Reg (báo cáo tích hợp dữ liệu fuel ACARS) | Standard Filter | Kết quả theo từng AC Reg theo từng tháng trong giai đoạn được chọn: Bảng 1: Fls by Month Bảng 2: ACARS Time Data Coverage Bảng 3: ACARS Block Fuel Data Coverage Bảng 4: ACARS Trip Fuel Data Coverage Tham khảo TEMPLATE Tỷ lệ dữ liệu ACARS |  |  |
|  |  |  | ACARS Fuel Reliability All AC | Standard Filter Min Difference: (cho nhập tỷ lệ 10% sai lệch giữa ACARS OUT FUEL và Fuel Order) | Bảng kết quả: - AC Type - AC Reg - FLS - ACARS Block Fuel Coverage (tỷ lệ cb có ACARS OUT-IN) (i) - ACARS Trip Fuel Coverage (tỷ lệ cb có ACARS OFF-ON) (ii) - ACARS OUT vs Fuel Order > Min (tỷ lệ) (iii) - Illogical Taxi Out Fuel (iv) - Illogical Trip Fuel (v) - Illogical Taxi In Fuel (tỷ lệ bất hợp lý taxi in fuel) (vi) Quy tắc highlight fill color ô giá trị: Với 2 tỷ lệ (i) (ii): nếu <=50% sử dụng màu đỏ dịu, càng nhỏ càng đậm. Nếu >50% sử dụng màu xanh lá, càng lớn càng đậm Với các tỷ lệ từ (iii) đến (vi): sử dụng màu đó dịu, càng bé càng nhạt, càng lớn càng đậm |  |  |
|  |  |  | ACARS Fuel Reliability by AC Reg | Standard Filter (không cho chọn quá 1 AC Reg | Tương tự kết quả trên nhưng mỗi dòng là 1 tháng của Registration được chọn. Tham khảo mẫu đánh giá độ chính xác ACARS |  |  |
|  | TOSS-096 | SITA TEXT: các điện văn dạng văn bản gửi qua hệ thống SITA |  |  |  |  |  |
|  | TOSS-097 | UCM: Unit Load Control Message |  |  |  |  |  |
|  | TOSS-098 | SSIM: điện văn lịch bay |  |  |  |  |  |
|  | TOSS-099 | ASM: điện văn cập nhật thông tin lịch bay |  |  |  |  |  |
|  | TOSS-100 | Hệ thống AMHS, AFTN: hệ thống trao đổi thông tin hàng không |  |  |  |  |  |
|  | 12.3 | Tích hợp dữ liệu qua email, website, file chia sẻ, nguồn khác |  |  |  |  |  |
|  | TOSS-101 | Dữ liệu LOMS và hệ thống quản lý thông tin an toàn Cassiopee Alpha |  |  |  |  |  |
|  | TOSS-102 | Dữ liệu NOTAM, WX gửi qua email |  |  |  |  |  |
|  | TOSS-103 | Website thời tiết: tự động lấy các bản tin thời tiết, file thời tiết cho chuyến bay |  |  |  |  |  |
|  | TOSS-104 | Bảng kê nhiên liệu của các nhà cung ứng |  |  |  |  |  |
|  | TOSS-105 | Migrate dữ liệu từ hệ thống FIMS: cơ sở dữ liệu lịch bay, kế hoạch bay, các dữ liệu FIMS đã tích hợp liên quan đến chuyến bay |  |  |  |  |  |
|  | TOSS-106 | Tích hợp AD để xác thực truy cập |  |  |  |  |  |
|  | TOSS-107 | Tích hợp các hệ thống khác phục vụ xây dựng các chức năng thuộc hồ sơ yêu cầu kỹ thuật này. Có cơ chế tích hợp chủ động ngay khi phát sinh dữ liệu, không chỉ đồng bộ theo tần suất |  |  |  |  |  |
|  |  |  | Overflight Permit API |  | API nhận phép bay qua từ hệ thống quản lý phép bay, vừa phép bay mùa và phép bổ sung (xây dựng chờ sẵn) |  |  |
|  |  |  | Slot and Takeoff/ Landing Permit API |  | API nhận Slot, phép cất hạ từ hệ thống quản lý phép bay, vừa slot mùa, vừa slot bổ sung (xây dựng chờ sẵn) |  |  |
|  | 12.4 | Dịch vụ dữ liệu |  |  |  |  |  |
|  | TOSS-108 | Cung cấp dịch vụ dữ liệu cho các hệ thống theo yêu cầu qua các giao tiếp lập trình |  |  |  |  |  |
|  | TOSS-109 | API và các giao diện phần mềm cung cấp lịch bay, cung cấp dữ liệu khai thác cho hệ thống khác |  |  |  |  |  |
|  |  |  | API cung cấp thông tin báo cáo FOS cho các hệ thống |  | Có thể truyền các trường thông tin cần lấy và trả ra dữ liệu  Thông tin chuyến bay truyền vào: theo leg_no hoặc theo (AC Reg, DEp, ARR, FLT date, FLTNO) |  |  |
|  |  |  | API cung cấp Fuel - Weight - Time từ MO Plus cho các hệ thống |  | Cung cấp: - Thông tin CB để ghép (leg_no, AC REG, DEP, ARR, DEP_DT, ARR_DT) - Toàn bộ bảng Fuel Analysis KHB (cá giá trị OFP và giá trị correct)      - Fuel Order Extra fuel reason - Toàn bộ bảng Weight Information  check xem API FIMS đang lấy dữ liệu từ MO Plus có thêm trường nào không |  |  |
|  |  |  | API cung cấp thời tiết sân bay cho Quản trị EFB | Tham số: - Sân bay - From Date - To Date | Trao đổi với FOE về kết quả mong muốn |  |  |
|  |  |  | Aircraft API | - AC Registration | Trả về thông tin về tàu bay, trong đó có: - Các thuộc tính tàu bay - PF mới nhất hiện đang áp dụng |  |  |
|  |  |  | API giao tiếp MO Plus |  | Gửi trạng thái Dispatch Release Flight Release Confirm Document |  |  |
|  |  |  | API cung cấp gói tài liệu chuyến bay |  | Gói tài liệu chuyến bay version cuối cùng của mỗi chuyến bay. Có tham số chỉ rõ lấy những tài liệu gì. Có xác thực/ phân quyền cho tài khoản lấy được những tài liệu gì |  |  |
|  |  |  | API đẩy tài liệu Library vào Draft cho từng phân hệ tài liệu |  |  |  |  |
|  |  |  | API đẩy tài liệu Notices vào Draft |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  | 12.5 | Giám sát các nguồn dữ liệu |  |  |  |  |  |
|  | TOSS-110 | Có giao diện cho người quản trị hệ thống giám sát được tổng quan các luồng dữ liệu vào/ ra và tình trạng |  |  |  |  |  |
|  | TOSS-111 | Loại dữ liệu/ nguồn |  |  |  |  |  |
|  | TOSS-112 | Hệ thống nguồn dữ liệu/ hệ thống được cập nhật dữ liệu |  |  |  |  |  |
|  | TOSS-113 | Ngày cập nhật lần cuối |  |  |  |  |  |
|  | TOSS-114 | Quản lý các luồng dữ liệu vào |  |  |  |  |  |
|  |  |  | Gửi email báo cáo tỷ lệ dữ liệu hàng tuần |  | Đối với từng tàu bay: - Tỷ lệ CB nhận được email Performance - Tỷ lệ CB có ACARS OUT FUEL - Tỷ lệ CB có ACARS OFF FUEL - Tỷ lệ CB có ACARS ON FUEL - Tỷ lệ CB có ACARS IN FUEL - Tỷ lệ CB có dữ liệu OFP - Tỷ lệ CB có dữ liệu QAR - Tỷ lệ CB có dữ liệu booking - Tỷ lệ CB có dữ liệu pax thực - Tỷ lệ CB có dữ liệu tổ bay - Tỷ lệ CB có dữ liệu Load sheet |  |  |
|  | TOSS-115 | Quản lý các luồng dữ liệu ra |  |  |  |  |  |
|  | 13 | Hệ thống quản lý dữ liệu |  |  |  |  |  |
|  | TOSS-116 | Hệ thống cần đáp ứng quản trị dữ liệu với quy mô lớn  - Yêu cầu phải quản lý vòng đời dữ liệu (bao gồm: thu thập, lưu trữ, xử lý, loại bỏ dữ liệu) theo chuẩn bảo mật  - Hỗ trợ phân loại, gắn nhãn, phân mảnh dữ liệu và quản lý metadata tập trung |  |  |  |  |  |
|  | TOSS-117 | Hệ thống được xây dựng theo kiến trúc mở rộng linh hoạt - Hỗ trợ mở rộng ngang (thêm node) và dọc (tăng tài nguyên node) - Tích hợp dễ dàng nguồn dữ liệu mới qua Rest API, SOAP API, gRPC, Kafka, JDBC… |  |  |  |  |  |
|  | TOSS-118 | Hệ thống cần đáp ứng lưu trữ & phân tầng dữ liệu - Lưu trữ dữ liệu thô và đã xử lý tách biệt, định dạng tối ưu (Parquet, Delta Lake…) - Phân tách tầng lưu trữ và tầng xử lý để dễ mở rộng, tối ưu hiệu năng |  |  |  |  |  |
|  | TOSS-119 | Hệ thống cho phép xử lý dữ liệu Batch & Streaming - Batch: ETL định kỳ cho khối lượng lớn  - Streaming: Xử lý gần thời gian thực với Kafka, Spark Streaming… |  |  |  |  |  |
|  | TOSS-120 | Hệ thống có khả năng tối ưu sử dụng tài nguyên theo khối lượng dữ liệu đảm bảo lưu trữ, tính toán và tính sẵn sàng cao |  |  |  |  |  |
|  | TOSS-121 | Hệ thống cần đáp ứng đa dạng các loại dữ liệu - Hỗ trợ dữ liệu có cấu trúc (SQL), bán cấu trúc (JSON, XML, logs), phi cấu trúc (video, hình ảnh, âm thanh, IoT) - Cung cấp môi trường xử lý và lưu trữ toàn diện cho tất cả loại dữ liệu |  |  |  |  |  |
| Quản lý thông tin theo chức năng riêng, không phải danh mục | 14 | Quản lý Tàu bay |  |  |  |  |  |
|  | 14.1 | Quản lý thông tin tàu bay |  |  |  |  |  |
|  | TOSS-122 | Thông tin chung về tàu bay: số đăng ký, loại tàu bay theo mã ICAO/ mã IATA, thông tin tải trọng, chủ sở hữu, hình thức thuê/mua, giới hạn Flight Cycle (FC), và các thông tin cơ bản khác | Thuộc tính |  | Mỗi AC Reg có các thuộc tính: AC Subtype (đồng bộ từ Netline) Aircraft Type (A320, A321, A350, B787) Các Aircraft Category theo mô tả chi tiết  Taxi fuel flow APU fuel flow Tank capacity ACARS fuel unit ACARS fuel multiplier (hệ số nhân với FOB của ACARS ra kg)  MTOW Config C Config W Config Y  Ownership Status (Wet Leased, Dry Leased, Owned) Owner |  |  |
|  | TOSS-123 | Thông tin hiệu lực khai thác của tàu bay theo từng giai đoạn: ngày hiệu lực, ngày hết hiệu lực |  |  | Mỗi tàu có thể in/out nhiều lần.  Quản lý các lần in/out Ac Reg Valid From (ngày in) Valid To (ngày out, có thể null vì chưa xác định) |  |  |
|  | TOSS-124 | Quản lý lịch bảo dưỡng ngắn hạn và dài hạn, lịch AOG đột xuất và thời gian khắc phục dự kiến. |  |  |  |  |  |
|  | TOSS-125 | Cảnh báo tàu bay sắp hết FC |  |  |  |  |  |
|  | TOSS-126 | Quản lý các bất thường liên quan đến tàu bay, ví dụ vấn đề kỹ thuật, chim va, các vấn đề khác |  |  | Lấy từ web |  |  |
|  |  |  | AC APU INOP |  | Quản lý, khai báo tàu bay hỏng APU - AC REG - From date time - To date time (có thể chưa xác định)  Các hiệu lực này để cảnh báo các tàu bay hỏng APU không được khai thác đến các sân bay không cung cấp GPU/GPS/ASU |  |  |
|  | TOSS-127 | Tình trạng tàu bay: APU, Packs |  |  |  |  |  |
|  |  |  | MEL/CDL |  | Xem danh sách MEL, CDL hiệu lực theo tàu bay.  Xem lịch sử MEL/CDL của tàu bay |  |  |
|  | 14.2 | Quản lý MEL, CDL, defect |  |  |  |  |  |
|  | TOSS-128 | Quản lý Master MEL | Data Maintenance/ MEL Policy |  | Tự động đọc file xml MEL (cùng file gửi sang AMOS) để lấy danh mục MEL cho từng đội tàu bay, các quy định interval, Installed, Required, Procedure, điều kiện khai thác (trong đó có list các tàu bay áp dụng) Trao đổi thêm với Nga FOE nhóm MEL về việc các Corrections.  Lido 4D đang nhận qua file CSV (tham khảo thôi) |  |  |
|  | TOSS-129 | Quản lý, tra cứu, chỉnh sửa, cập nhật thông tin MEL/CDL đồng bộ từ AMOS. |  |  |  |  |  |
|  | TOSS-130 | Cho phép lọc từng nhóm MEL, CDL, defect ảnh hưởng đến phi công/ cockpit, tiếp viên/ cabin, thợ máy |  |  |  |  |  |
|  | TOSS-131 | Tự động hightlight các MEL, CDL, defect mới |  |  |  |  |  |
|  | TOSS-132 | Cho phép ẩn/hiện các MEL, CDL, defect đã hết hạn |  |  |  |  |  |
|  | TOSS-133 | Cho phép người dùng ghi nhận tính chất của từng MEL có ảnh hưởng/không ảnh hưởng đến khai thác |  |  |  |  |  |
|  | TOSS-134 | Cho phép người dùng xem các MEL ảnh hưởng đến khai thác, thực hiện ghi chú, phân loại MEL theo phạm vi ảnh hưởng |  |  |  |  |  |
|  | TOSS-135 | Liên kết và cho phép xem tài liệu MEL hiện hành |  |  |  |  |  |
|  | 14.3 | Quản lý Performance Factor |  |  |  |  |  |
| Email, làm file đầu vào. Xin bộ cài PEP PET POS | TOSS-136 | Cho phép upload file dữ liệu của các đội tàu bay, tính toán peformance factor của các đội tàu bay từ dữ liệu | PF Messages From AC | From Date To Date Aircraft Category 1 AC Reg (multiple choice, mặc định chọn tất, cho phép bỏ chọn từng Reg) | Tích hợp với email nhận điện ACARS để tập hợp thành file messate (tham khảo format file message hiện nay) Cho phép view và download file này.  Đảm bảo input vào PEP, PET, FOS chạy ok |  |  |
|  | TOSS-137 | Ghi nhận kết quả tính toán theo thời gian hiệu lực mong muốn |  |  |  |  |  |
|  |  |  | PF Data Period |  | Quản lý (thêm, sửa xóa) các kỳ cập nhật PF data, xem danh sách: - Data Period Label - Historical From Date (giai đoạn dữ liệu lịch sử dùng để tính toán) - Historical To Date |  |  |
|  |  |  | Import Performance Data | Upload multiple file | Bảng tổng hợp PF từ đầu vào. Cảnh báo các tàu không có dữ liệu và lấy PF của kỳ trước. Cho phép correct số liệu Chọn AC Reg để cập nhật PF (mặc định all) Chọn Kỳ cập nhật (Data Period) Chọn khoảng dữ liệu tính toán cho kỳ cập nhật (From Date, To Date) Lưu trữ PF cập nhật |  | Các tàu không có số liệu import vào để tính ra PF thì lấy PF ban hành kỳ trước |
|  | TOSS-138 | Cảnh báo các tàu bay không có dữ liệu tính toán PF |  |  |  |  |  |
|  | TOSS-139 | Tìm kiếm, thống kê PF theo các tiêu chí |  |  |  |  |  |
|  | TOSS-140 | Cho phép xem lịch sử cập nhật PF |  |  |  |  |  |
|  | TOSS-141 | Báo cáo đánh giá, tổng hợp tăng giảm PF từng đội tàu bay, từng tàu bay |  |  | Báo cáo theo kỳ cập nhật |  |  |
|  |  |  | PF Comparison | Previous Data Period  Current Data Period AC Reg (multiple choice, mặc định chọn tất, cho phép bỏ chọn từng Reg) | Bảng PF từng tàu bay theo từng AC Type (format lại để gửi OCD, copy làm CV dùng cùng) |  |  |
|  |  |  | PF Trend by AC Type | From Date To Date Aircraft Category 2 | Bảng dữ liệu có các cột: - AC Category (theo Cate2) - Data Period - AVG PF | Biểu đồ dây, mỗi Cate 1 dây PF theo từng Data Period. Có đường xu hướng | AVG PF của mỗi AC Cate lấy trung bình PF của các tàu trong Cate |
|  |  |  | PF Trend by AC Reg | From Date To Date AC Reg (multiple choice, mặc định ko chọn | Bảng dữ liệu có các cột: - AC Reg - Data Period - PF | Khi chọn 1 AC Reg thì hiển thị biểu đồ dây PF qua từng Data Period của PF đó |  |
|  |  |  | PF Data Coverage | From Date To Date Aircraft Category 2 | Bảng dữ liệu có các cột: - AC Reg - Data Period - PF Data Coverage |  | PF Data Coverage của 1 tàu của 1 kỳ: tỷ lệ số lượng CB có message PF (qua ACARS) / tổng số CB tàu đó có khai thác của kỳ đó |
|  | 15 | Quản lý Sân bay |  |  |  |  |  |
|  | TOSS-142 | Thông tin chung về sân bay: mã ICAO, IATA, tên sân bay, quốc gia, station contact, các địa chỉ SITA/AFTN/AMHS, loại tàu có khả năng phục vụ và các thông tin cơ bản khác |  |  | Thuộc tính sân bay: - Region (EU, US, NEA, SEA, Domestic/VN....) - Approach Type sử dụng (để lấy minima) - GPU/GPU Available (Y/N) - ASU Available (Y/N)  - Danh sách Terminal, Gate, Parking Stand, Air Bridge |  |  |
|  | TOSS-143 | Quản lý danh mục sân bay dự bị đến |  |  |  |  |  |
|  | TOSS-144 | Quản lý thông tin hạ tầng cất hạ cánh: đường băng, hệ thống hỗ trợ cất hạ cánh, taxiway layout, bãi đỗ |  |  |  |  |  |
|  | TOSS-145 | Quản lý thông tin điều kiện khí tượng và môi trường: Quản lý Minima của sân bay, quản lý tra cứu WX sân bay, đặc điểm địa hình |  |  |  |  |  |
|  |  |  | Wether Landing Minima |  | Quản lý thủ công: mỗi loại Approach type có một số điều kiện tối thiểu - Approach type (ILS CAT I / II / III hoặc RNAV / VOR / NDB) - Visibility |  |  |
|  | TOSS-146 | Quản lý quy định khai thác và thủ tục bay: thủ tục cất hạ cánh, tiếp cận (SID, STAR, IAP), giới hạn tiếng ồn, khung giờ cho phép khai thác, quy định về slot/phép bay, quy định khác của nhà chức trách |  |  |  |  |  |
|  | TOSS-147 | Quản lý thông tin phục vụ mặt đất: bãi đỗ, cầu ống lồng, thiết bị điện/khí mặt đất, khả năng nạp nhiên liệu, giá nhiên liệu, chi phí thiết bị mặt đất và các dịch vụ tại sân bay. |  |  |  |  |  |
|  |  |  | Parking Stand Information |  | Quản lý danh sách Parking Stand với từng sân bay - Airport - Parking Stand name - Air Bridge Availability (Yes/No/Undefined)  Có thể phân quyền riêng cho các đầu sân bay cập nhật thông tin này |  |  |
|  | TOSS-148 | Quản lý thông tin an toàn và hạn chế: NOTAM, tình hình an ninh và các thông tin khác |  |  |  |  |  |
|  | TOSS-149 | Quản lý thông tin khai thác thương mại: phí hạ cất cánh, chi phí tiếng ồn, chi phí khác |  |  |  |  |  |
|  | 16 | Quản lý chặng bay |  |  |  |  |  |
|  | 16.1 | Thông tin chung |  |  |  |  |  |
|  | TOSS-150 | Thông tin chung: điểm đi/ điểm đến, GCD, GD, cost index, final reserve |  |  | Các thông tin chặng bay: - DEP - ARR - Group by FH - Group for TAT - Included baggage allowance - Commercial Config (theo tàu bay, theo giai đoạn) - Chi phí ĐHB, BQ - Sân bay dự bị dọc đường - MCMR (theo giai đoạn thời gian) |  |  |
|  |  |  | Included baggage allowance |  | Quản lý, khai báo trọng lượng hành lý tiêu chuẩn theo từng nhóm đường bay Từ quốc gia... đến quốc gia..., hạng khách |  |  |
|  |  |  | Sector Groups by FH |  | Quản lý, khai báo, định nghĩa các nhóm chặng bay theo giờ bay - Chọn NĐ/ QT - Chọn khoảng FH - Đặt tên nhóm |  |  |
|  |  |  | Scheduled TAT |  | - Quản lý, khai báo TAT tiêu chuẩn theo từng nhóm nối chặng QT TRUNG-QT NGAN, QT NGAN-NOI DIA..... |  |  |
|  |  |  | Commercial Config (Quản lý số ghế mở bán với từng chặng bay) |  | - Cho phép upload file LBM chi tiết - Trích xuất số ghế mở bán C/W/Y từng chặng bay, từng giai đoạn thời gian áp dụng, ac subtype - Cho phép sửa hoặc cập nhật thủ công số ghế mở bản từng hạng theo từng giai đoạn, ac_subtype |  |  |
|  | TOSS-151 | Quản lý thông tin EDTO: có khai thác EDTO không, loại hình EDTO |  |  |  |  |  |
|  | TOSS-152 | Quản lý sân bay dự bị dọc đường theo hình thức khai thác |  |  |  |  |  |
|  | TOSS-153 | Quản lý chi phí MCMR: cho phép upload file thông tin MCMR từng giai đoạn, lưu trữ, tra cứu |  |  |  |  |  |
|  | TOSS-154 | Xem thông tin chi phí điều hành bay, bay qua |  |  |  |  |  |
|  | 16.2 | Quản lý Tankering |  |  |  |  |  |
|  | TOSS-155 | Tính toán, đưa ra khuyến nghị tankering: upload giá nhiên liệu, tính toán hiệu quả tankering dự kiến, lựa chọn khuyến nghị tankering cho giai đoạn cụ thể |  |  | Lưu ý giá từ VN đi QT khác giá VN đi NĐ. Cần tính toán cả 2 giá |  |  |
|  | TOSS-156 | Cho phép lựa chọn cập nhật các chặng bay, tàu bay khuyến nghị tankering theo giai đoạn hiệu lực |  |  |  |  |  |
|  | TOSS-157 | Cho phép upload file khuyến nghị tankering gồm các thông tin:  - Loại tàu bay  - Chặng bay (một chặng hoặc liên chặng)  - Ngày bắt đầu áp dụng  - Ngày dừng áp dụng  - Hiệu quả chi phí khi tankering 1 tấn nhiên liệu |  |  |  |  |  |
|  | TOSS-158 | Lưu trữ các khuyến nghị tankering theo giai đoạn |  |  |  |  |  |
|  | TOSS-159 | Cho phép xuất dữ liệu khuyến nghị tankering theo chặng bay, tàu bay, giai đoạn hiệu lực |  |  |  |  |  |
|  | TOSS-160 | Báo cáo hiệu quả tankering theo chặng bay, sân bay, giai đoạn |  |  |  |  |  |
|  | TOSS-161 | Báo cáo tankering tổng hợp: lọc theo các tiêu chí, tỷ lệ chuyến bay tankering, tổng lượng nhiên liệu đã tankering, tổng chi phí hiệu quả, |  |  |  |  |  |
|  | TOSS-162 | Báo cáo tankering chi tiết: từng chuyến bay, lượng nhiên liệu đã tankering, chi phí hiệu quả |  |  |  |  |  |
|  | 17 | Quản lý danh mục khác |  |  |  |  |  |
|  | TOSS-163 | Quản lý danh mục Phi công, tiếp viên | Chắc thôi, dùng bên MO Plus |  |  |  |  |
|  | TOSS-164 | Quản lý danh mục Quốc gia |  |  |  |  |  |
|  | TOSS-165 | Quản lý danh mục FIR |  |  |  |  |  |
|  | TOSS-166 | Quản lý giá nhiên liệu | Fuel Price Management |  | Quản lý giá nhiên liệu đơn vị USD/tấn tại từng sân bay. Mỗi sân bay sẽ có kỳ giá khác nhau: 1 tuần, 2 tuần , 1 tháng.  Việc cập nhật sẽ theo từng sân bay, từng kỳ giá.  Cho phép upload theo template giá: - IATA AP CODE - Fuel Price - Valid From (ngày hiệu lực) - Valid To (ngày hết hiệu lực) Cho phép sửa tay sau khi upload. Trường hợp over lap, lấy giá của lần upload sau Sử dụng để tính tankering |  |  |
|  | TOSS-167 | Quản lý danh mục ULD |  | Loại ULD, Từng Serial trong các loại kèm theo thông tin kích thước, trọng lượng, thuộc tính tàu bay và thuộc tính khác Mỗi chuyến bay tự load ra các loại ULD tương ứng, cho phép nhập số lượng và tự động tính toán trọng lượng |  |  |  |
| System admin | TOSS-168 | Quản lý danh sách email nhận các thông báo: với mỗi thông báo tự dộng qua email, cho phép linh hoạt thêm, bớt email cần nhận các thông báo |  |  |  |  |  |
|  |  |  | Email list for Data Coverage Report |  | Danh sách email nhận báo cáo tỷ lệ dữ liệu tích hợp |  |  |
|  |  |  | Email list for Daily Operations Report |  | Danh sách email nhận báo cáo hàng ngày của TBT |  |  |
|  | TOSS-169 | Có cơ chế tổ chức riêng danh mục dùng chung cho các hệ thống và danh mục chức năng nghiệp vụ của hệ thống |  |  |  |  |  |
|  | TOSS-170 | Quản lý các danh mục khác phục vụ xây dựng các chức năng nghiệp vụ nêu tại yêu cầu kỹ thuật này |  |  |  |  |  |
|  |  |  | Aircraft Types (Quản lý loại tàu bay) |  | Các loại tàu bay: A320, A321, A350, B787, ATR. Thêm sửa xóa, disable Cho phép gán các tàu bay (Reg) với từng loại. Quản lý Thuộc tính giới hạn lệch ZFW cho từng loại tàu bay theo từng khoảng thời gian bay (linh động khai báo khoảng thời gian, giới hạn tương ứng) |  |  |
|  |  |  | Planned Version (Quản lý các version sản lượng) |  | Quản lý (thêm, sửa, xóa) version sản lượng - Năm  - Loại (UHT/KH) - Tên version (do người dùng tự đặt) - Danh sách chuyến bay sản lượng gồm các thông tin:     + SECTOR,      + AC CARRIER     + FLT_MONTH     + FLT_YEAR     + FLT_TYPES     + FLS |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  | 18 | Quản lý tham số hệ thống |  |  |  |  |  |
|  | TOSS-171 | Hệ số độ tin cậy (%) của chuyến bay dùng để tính thời gian bay, nhiên liệu tiêu thụ, mức bay. |  |  |  |  |  |
|  | TOSS-172 | Ngưỡng chênh lệch giữa lượng nhiên liệu phi công yêu cầu nạp và tổng nhiên liệu kế hoạch của chuyến bay theo chặng bay, loại tàu bay. |  |  |  |  |  |
|  | TOSS-173 | Ngưỡng chênh lệch giữa trọng tải ước tính và tải trọng của kế hoạch bay theo đội tàu bay, thời gian chuyến bay, giai đoạn hiệu lực |  |  |  |  |  |
|  | TOSS-174 | Thời gian quy định cần làm OFP đối với chuyến bay quốc tế, quốc nội |  |  |  |  |  |
|  | TOSS-175 | Thời gian cảnh báo chuyến bay thiếu tài liệu |  |  |  |  |  |
|  | TOSS-176 | Các tham số khác phục vụ cảnh báo và các chức năng thuộc yêu cầu kỹ thuật này |  | Trọng lượng khách tiêu chuẩn (để tính pax weight và payload) |  |  |  |
|  |  |  |  |  |  |  |  |
|  | TOSS-177 | Các tham số thể thay đổi được quản lý linh hoạt, cho phép người dùng cập nhật khi có thay đổi |  |  |  |  |  |
|  | C | Thông tin điều hành chuyến bay |  |  |  |  |  |
|  | 19 | Thông tin chuyến bay |  |  |  |  |  |
|  | TOSS-178 | Danh sách chuyến bay kèm các thông tin chi tiết về chuyến bay: thông tin tàu bay, cabin, sân bay, thời tiết, NOTAM, tổ bay, hành khách, hàng hóa, doanh thu, chi phí, thông tin khai thác thực tế |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  | Flight List |  |  |  |  |
|  |  |  | Flight Detail |  | Bao gồm nhiều tab thông tin theo các chiều thông tin tương tự FOS report + các tính toán, cảnh báo, lịch sử thêm tab Flight Radar hiển thị vị trí tàu bay trên màn hình flight radar 24  Tab Flight status: - Các mốc thời gian kế hoạch: PRE-ETA, ETD, ETA - Các mốc thời gian thực tế: PRE-ATA, các mốc phục vụ MĐ, các mốc ACDM,  (hiển thị song song đối sánh để theo dõi, có thể theo chiều dọc tịnh tiến tăng thời gian)  Tab Flight Docs:  - Danh sách tổng quát hiển thị các loại tài liệu với version sau cùng và trạng thái /thời điểm confirm/reject - có thể bấm Ungroup để xem các version cũ hơn và trạng thái confirm/reject |  |  |
|  | TOSS-179 | Cho phép người dùng linh hoạt lựa chọn ẩn/ hiện các trường thông tin hiển thị trên giao diện tổng quan. Lưu được lựa chọn cho các phiên đăng nhập, không ảnh hưởng đến lựa chọn của user khác |  |  |  |  |  |
|  | TOSS-180 | Cảnh báo màu tại các trường thông tin: MEL, cabin defect, hành khách VIP/nối chuyến, loadfactor thấp, delay, tổ bay, return/divert, thiếu phép bay, TAT không đủ, thiếu điện văn, |  |  |  |  |  |
|  |  |  | Cảnh báo ZFW ngoài giới hạn |  | Tính toán khoảng lệch tiêu chuẩn cho phép dựa trên giới hạn (được cấu hình), loại tàu đang sử dụng, thời gian bay Tính toán khoảng lệch thực tế giữa ZFW của LS hoặc ZFW nhập từ CLC. cảnh báo nếu lệch ngoài giới hạn. Áp dụng cảnh báo cho cả màn hình tài liệu DSP |  |  |
|  | TOSS-181 | Xem lịch sử thay đổi từng chuyến bay: thay đổi về thời gian cất/hạ cánh, tàu bay, loại chuyến bay, trạng thái chuyên bay |  |  |  |  |  |
|  | TOSS-182 | Trạng thái chuyến bay |  |  |  |  |  |
|  | TOSS-183 | Chuyến bay divert và thông tin divert (sân bay dự kiến hạ cánh ban đầu, sân bay hạ cánh thực tế) |  |  |  |  |  |
|  | TOSS-184 | Thông tin chi phí, lợi nhuận. So sánh chi phí giữa các phương án về tàu bay, tổ bay |  |  |  |  |  |
|  | TOSS-185 | Liên kết xem vị trí máy bay trên Flight Radar24 |  |  |  |  |  |
|  | TOSS-186 | Đáp ứng các chuyến bay của các carrier khác nhau |  |  |  |  |  |
|  | TOSS-187 | Có cơ chế phân quyền xem từng thông tin đối với từng người dùng |  |  |  |  |  |
|  | 20 | Thông tin tàu bay |  |  |  |  |  |
|  | TOSS-188 | Hiển thị thông tin chung về tàu bay: loại tàu bay, số đăng ký, mã ICAO, IATA, thời điểm hiệu lực |  |  |  |  |  |
|  | TOSS-189 | Lịch khai thác tàu bay gần nhất và sắp tới |  |  |  |  |  |
|  | TOSS-190 | Performance Factor và lịch sử cập nhật |  |  |  |  |  |
|  | TOSS-191 | MEL/CDL, defect hiện có và các ảnh hưởng |  |  |  |  |  |
|  | TOSS-192 | Lịch bảo dưỡng, AOG, dự kiến thời gian khắc phục |  |  |  |  |  |
|  | TOSS-193 | FC và cảnh báo giới hạn FC |  |  |  |  |  |
|  | TOSS-194 | Chi phí APU, chi phí bảo dưỡng tàu bay |  |  |  |  |  |
|  | 21 | Thông tin tổ bay |  |  |  |  |  |
|  | TOSS-195 | Danh sách tổ bay: họ và tên, chức vụ, thông tin liên lạc, năm sinh, số hộ chiếu, mã số tổ bay |  |  |  |  |  |
|  | TOSS-196 | Hành trình tổ bay |  |  |  |  |  |
|  | TOSS-197 | Lịch sử đổi tổ bay của chuyến bay |  |  |  |  |  |
|  | TOSS-198 | Flight time, Duty time |  |  |  |  |  |
|  | 22 | Thông tin tải trọng, hành khách |  |  |  |  |  |
|  | TOSS-199 | Hiển thị số lượng khách theo từng hạng ghế, khách người lớn/trẻ em/sơ sinh, khách inbound, outbound, VIP, CIP | Chia quyền nhập riêng cho CLC (pax/baggage), HH (cargo/ULD) |  |  |  |  |
|  | TOSS-200 | Hiển thị thông tin payload, tải trọng hành khách, hành lý, hàng hóa, DOW, ULD và lịch sử thay đổi tải trọng |  |  |  |  |  |
|  | TOSS-201 | Hiển thị thông tin dịch vụ: suất ăn, thông tin phục vụ hành khách |  |  |  |  |  |
|  | TOSS-202 | Quản lý và hiển thị thông tin NOTOC, hàng hóa đặc biệt, hàng hóa nguy hiểm, các hạn chế dịch vụ trên chuyến bay, chi phí bồi thường cho hành khách |  |  |  |  |  |
|  | 23 | Thông tin đường bay, thời gian, nhiên liệu |  |  |  |  |  |
|  | TOSS-203 | Hiển thị các thông tin khuyến nghị cho chuyến bay: tankering, taxi out, CI, sân bay dự bị đến, dự bị dọc dường, extra..... |  |  |  |  |  |
|  | TOSS-204 | Hiển thị thông tin NOTAM, thời tiết được bóc tách từ các nguồn tích hợp và từ tài liệu chuyến bay |  |  |  |  |  |
|  | TOSS-205 | Thông tin nhiên liệu: nhiên liệu kế hoạch, fuel order, load sheet fuel, % nhiên liệu dự phòng, extra |  |  |  |  |  |
|  | TOSS-206 | SID, STAR kế hoạch, thực tế |  |  |  |  |  |
|  | TOSS-207 | Hiển thị dữ liệu thống kê cho các chuyến bay cùng tính chất |  |  |  |  |  |
|  | 24 | Thông tin khai thác sân bay |  |  |  |  |  |
|  | TOSS-208 | Vị trí đỗ tàu bay tại sân bay đi |  |  |  |  |  |
|  | TOSS-209 | Boarding Gate |  |  |  |  |  |
|  | TOSS-210 | Giờ boarding |  |  |  |  |  |
|  | TOSS-211 | Băng chuyền hành lý tại sân bay đến |  |  |  |  |  |
|  | TOSS-212 | Vị trí đỗ tàu bay tại sân bay đến |  |  |  |  |  |
|  | TOSS-213 | Các thông tin khai thác khác |  |  |  |  |  |
|  | 25 | Ghi nhận thông tin bất thường đối với chuyến bay |  |  |  |  |  |
|  | TOSS-214 | Bất thường về thời tiết |  |  |  |  |  |
|  | TOSS-215 | Bất thường về kỹ thuật |  |  |  |  |  |
|  | TOSS-216 | Bất thường khác |  |  |  |  |  |
|  | 26 | Giám sát trạng thái tài liệu chuyến bay |  |  |  |  |  |
|  | TOSS-217 | Trạng thái chuyến bay có/ chưa có đối với từng loại tài liệu |  |  |  |  |  |
|  | TOSS-218 | Trạng thái được request, chưa confirm/đã confirm bởi từng đối tượng đối với từng loại tài liệu. Xem được trạng thái confirm/reject, thời gian confirm/reject/ request |  |  |  |  |  |
|  | TOSS-219 | Xem số tài liệu đính kèm chuyến bay. Xem nội dung từng tài liệu đính kèm chuyến bay, các version tài liệu |  |  |  |  |  |
|  | TOSS-220 | Download toàn bộ tài liệu đính kèm chuyến bay |  |  |  |  |  |
|  | TOSS-221 | Lựa chọn cho phép ẩn/ hiện tài liệu trên hệ thống MO Plus |  |  |  |  |  |
|  | D | Quản lý tài liệu chuyến bay |  |  |  |  |  |
|  | 27 | Quản lý tài liệu OFP, NOTAM, WX, briefing package |  |  |  |  |  |
|  | TOSS-222 | Thông tin chuyến bay |  |  |  |  |  |
|  |  |  | Cảnh báo màu sai lệch giữa ATC FPL trong OFP và filed ATC |  |  |  |  |
|  | TOSS-223 | Hiển thị trạng thái OFP, cho phép xem, tải các version OFP, lịch sử ban hành OFP |  |  |  |  |  |
|  |  |  | Dispatch Release |  | Nhấn đối với từng chuyến bay mới được coi là OFP hoàn thành. Trên MO khi nhận được trạng thái Dispatch Released = TRUE thì mới cho Phi công thực hiện Flight Release |  |  |
|  | TOSS-224 | Thông tin OFP: người tạo, thời gian, các thông tin chi tiết |  |  |  |  |  |
|  | TOSS-225 | Thông tin payload, fuel order, PIC, |  |  |  |  |  |
|  | TOSS-226 | Tổng hợp và cho phép xem, nhập ghi chú trên Briefing Sheet: NOTAM, WX, MEL, Special Ops. Tự động cập nhật Briefing Sheet khi có thông tin thay đổi |  |  |  |  |  |
|  | TOSS-227 | Thông tin, trạng thái flight release |  |  |  |  |  |
|  | TOSS-228 | Cho phép upload file NOTAM, WX cho từng chuyến bay hoặc nhiều chuyến bay cùng lúc. |  |  |  |  |  |
|  | TOSS-229 | Tích hợp tự động NOTAM, WX, gói tài liệu chuyến bay từ Lido và từ các nguồn |  |  |  |  |  |
|  | TOSS-230 | Chức năng tích hợp, lưu trữ, số hóa, bóc tách thông tin NOTAM, WX | Có NOTAM Filter |  |  |  |  |
|  | TOSS-231 | Kiểm soát revision của file NOTAM, thời tiết. Mặc định hiển thị revision cuối cùng. Cho phép xem thời gian upload, nội dung file của tất cả các revision. |  |  |  |  |  |
|  | TOSS-232 | Cho phép chọn ẩn/ hiện file NOTAM, WX trên MO Plus |  |  |  |  |  |
|  | TOSS-233 | Cho phép upload, xem tài liệu đính kèm bất kỳ cho chuyến bay |  |  |  |  |  |
|  | TOSS-234 | Các thông tin khác phục vụ nghiệp vụ của Điều phái |  |  |  |  |  |
|  | TOSS-235 | Hỗ trợ các định dạng file pdf, docx, ảnh, txt |  |  |  |  |  |
|  | TOSS-236 | Có giao diện, phương thức độc lập cho phép điều phái upload, cung cấp các tài liệu này cho MO Plus trong trường hợp chức năng quản lý tài liệu này không truy cập được |  |  |  |  |  |
|  | 28 | Quản lý tài liệu LS, GD, PM, NOTOC Cargo, NOCTOC Baggage, Cargo Manifest, Mail Manifest |  |  |  |  |  |
|  | TOSS-237 | Tích hợp tự động các tài liệu từ các hệ thống gắn với từng chuyến bay |  |  |  |  |  |
|  | TOSS-238 | Cho phép upload tài liệu cho từng chuyến bay hoặc nhiều chuyến bay cùng lúc |  |  |  |  |  |
|  | TOSS-239 | Có chức năng quản lý revision, hiển thị revision được upload cuối cùng. Cho phép xem lại nội dung tài liệu, thời gian upload, thời gian confirm/reject, comment tương ứng từng revision |  |  |  |  |  |
|  | TOSS-240 | Tự động bóc tách, lưu trữ các thông tin từ các file dữ liệu |  |  |  |  |  |
|  | TOSS-241 | Trạng thái chưa confirm/đã confirm bởi từng đối tượng đối với từng loại tài liệu. Xem được trạng thái confirm/reject, thời gian confirm/reject. Trạng thái tài liệu được request kèm theo nội dung request, thời gian request |  |  |  |  |  |
|  | TOSS-242 | Xem và download trang confirm/ reject/ request tài liệu |  |  |  |  |  |
|  | TOSS-243 | Cho phép phân biệt trạng thái confirm/ reject một phần hoặc toàn bộ |  |  |  |  |  |
|  | TOSS-244 | Có giao diện, phương thức độc lập cho phép điều phái cung cấp các tài liệu này cho chuyến bay trong trường hợp chức năng quản lý tài liệu này không truy cập được. |  |  |  |  |  |
|  | TOSS-245 | Có giao diện trên mobile để quản lý thông tin, xem tài liệu và confirm tài liệu |  |  |  |  |  |
|  | 29 | Quản lý tải trọng |  |  |  |  |  |
|  | TOSS-246 | Cho phép nhập số lượng khách người lớn, trẻ em, trẻ sơ sinh. Tự động tính toán trọng lượng hành khách. |  |  |  |  |  |
|  | TOSS-247 | Cho phép nhập số lượng hành lý, tự động tính toán trọng lượng hành lý |  |  |  |  |  |
|  | TOSS-248 | Cho phép nhập trọng lượng hàng và mail ước tính |  |  |  |  |  |
|  | TOSS-249 | Cho phép nhập ULD hành khách (AKE), tự động tính toán trọng lượng ước tính tương ứng |  |  |  |  |  |
|  | TOSS-250 | Cho phép nhập ULD hàng hóa (AKE, PMC), tính toán trọng lượng ước tính tương ứng. |  |  |  |  |  |
|  | TOSS-251 | Tính toán và hiển thị tải trọng ước tính (payload = trọng lượng khách + hành lý + hàng + mail + ULD) |  |  |  |  |  |
|  | TOSS-252 | Hiển thị DOW ở OFP, DOW tính toán được |  |  |  |  |  |
|  | TOSS-253 | Tính và hiển thị ZFW ước tính |  |  |  |  |  |
|  | TOSS-254 | Hiển thị ZFW từ OFP |  |  |  |  |  |
|  | TOSS-255 | Hiển thị chênh lệch ZFW trên OFP và ZFW ước tính |  |  |  |  |  |
|  | TOSS-256 | Hiển thị thời gian cập nhật gần nhất |  |  |  |  |  |
|  | TOSS-257 | Đồng bộ và cập nhật tự động các thông tin tải trọng (song song với nhập thủ công) |  |  |  |  |  |
|  | TOSS-258 | Có cơ chế lưu và lịch sử cập nhật tải trọng (bao gồm lịch sử cập nhật tất cả các thông tin) |  |  |  |  |  |
|  | TOSS-259 | Cho phép xem lịch sử cập nhật tải trọng của từng chuyến bay, download lịch sử của nhiều chuyến bay |  |  |  |  |  |
|  | E | Quản lý, báo cáo đánh giá tối ưu khai thác |  |  |  |  |  |
|  | 30 | Yêu cầu chung về báo cáo |  |  |  |  |  |
|  | TOSS-260 | Có bộ lọc linh hoạt đối với từng báo cáo cụ thể |  |  |  |  |  |
|  | TOSS-261 | Cho phép xem báo cáo, lựa chọn các cột thông tin để hiển thị |  |  |  |  |  |
|  | TOSS-262 | Cho phép download kết quả dạng pdf, excel, docx |  |  |  |  |  |
|  | 31 | Quản lý báo cáo thông tin khai thác hàng ngày |  |  |  |  |  |
|  | TOSS-263 | Tổng hợp tự động thông tin, quản lý thông tin từ các nguồn theo mẫu | Daily Operations Status |  | Bao gồm nhiều tab cho nhiều đối tượng, mục đich, ví dụ (cần khảo sát kỹ vị trí TBT và các đơn vị cung cấp thông tin cho báo cáo ngày): - Daily Operation Report: TBT kiểm soát thông tin tổng quan, nhập thông tin, ban hành báo cáo - Irregular Flights: nhập các bất thường phát sinh - Technical Status: Trực Kỹ thuật cung cấp thông tin - OTP: các vấn đề liên quan đến yếu tố đúng giờ - Additional Information: thông tin bổ sung, free text |  |  |
|  | TOSS-264 | Cho phép từng bộ phận nhập thông tin báo cáo riêng cho từng chuyến bay, tàu bay hoặc báo cáo thông tin chung |  |  |  |  |  |
|  | TOSS-265 | Cấp quyền cho user được phép rà soát tổng hợp, xác nhận nội dung và gửi cho các đầu mối nhận báo cáo |  |  |  |  |  |
|  | TOSS-266 | Danh sách đầu mối nhận báo cáo được quản trị, cấu hình linh hoạt |  |  |  |  |  |
|  | TOSS-267 | Liên kết thông tin bất thường về tàu bay với chức năng quản lý tàu bay |  |  |  |  |  |
|  | 32 | Báo cáo lịch bay, tàu bay |  |  |  |  |  |
|  | TOSS-268 | Báo cáo lịch bay kế hoạch |  |  |  |  |  |
|  | TOSS-269 | Báo cáo lịch bay thực hiện |  |  |  |  |  |
|  |  |  | Flight List for Backup Tool | Standard Filter | Cho phép download lịch bay cập nhật nhất theo format cho trước để user import vào phần mềm backup Netline. (Trường hợp Ops++ lỗi nhưng TOSS ok) Đồng thời định kỳ xuất file này ra 1 SFTP độc lập với TOSS để lấy file (trường họp Ops++ lỗi và TOSS cũng lỗi) |  |  |
|  | TOSS-270 | Thống kê chuyến bay thay đổi/ không theo kế hoạch: đổi giờ, đổi tàu, up config, down config, đổi code và các thay đổi khác |  |  |  |  |  |
|  | TOSS-271 | Thống kê chuyến bay theo tính chất: Ferry, hủy, tăng, chở khách, chở hàng, thường lệ, VIP, charter và các tính chất khác |  |  |  |  |  |
|  | TOSS-272 | Báo cáo chuyến bay divert |  |  |  |  |  |
|  | TOSS-273 | Báo cáo OTP/ OSP |  |  |  |  |  |
|  | TOSS-274 | Thống kê chậm chuyến: chậm cất cánh, chậm hạ cánh |  |  |  |  |  |
|  | TOSS-275 | Báo cáo tàu làm kỹ thuật. Đánh giá tần suất lặp lại các lỗi dẫn đến AOG đột xuất |  |  |  |  |  |
|  | TOSS-276 | Báo cáo lịch sử chuyến bay |  |  |  |  |  |
|  | TOSS-277 | Thống kê số lần cát hạ cánh |  |  |  |  |  |
|  | TOSS-278 | Thống kê giờ máy bay/ Báo cáo sử dụng tàu bay |  |  |  |  |  |
|  |  |  | Aircraft Utilization | From Date To Date AC Type (multiple choice: chọn  ac type hoặc một/ nhiều cate) AC Reg (multiple choice) | Thống kê tổng giờ bay, giờ bảo dưỡng 1. Bảng chi tiết  gồm các cột: - AC Reg - Lần lượt các cột AC Type/ Cate được chọn - tổng BH chuyến bay - Tổng ngày khai thác - Tổng ngày dừng( chia từng cột bảo quản/ bảo dưỡng/ định kỳ..... như thống kê tàu dừng) | Nếu chọn AC Type và một/nhiều AC Cate thì mỗi phân loại có 1 biểu đồ cột trung bình BH/day |  |
|  |  |  | FH/FC |  | Thống kê tỷ lệ trung bình giờ BH/chuyến bay đối với từng tàu hoặc từng đội/cate |  |  |
|  | TOSS-279 | Thống kê hành trình bay |  |  |  |  |  |
|  | TOSS-280 | Báo cáo tàu dừng |  |  |  |  |  |
|  | TOSS-281 | Báo cáo thời gian tàu nằm sân |  |  |  |  |  |
|  |  |  | Schedule Robustness |  | (độ ổn định lịch)  Khả năng chống delay dây chuyền Có buffer hợp lý hay không |  |  |
|  |  |  | Airport Constraints  Slot, curfew, hạn chế sân bay |  | Dựa theo giờ curfew của sân bay để cảnh báo |  |  |
|  |  |  | Crew Feasibility  Lịch có phù hợp duty time, rest time của phi công/tiếp viên |  |  |  |  |
|  |  |  |  |  |  | Kiểm tra các bất thường trong lịch bay để điều chỉnh kịp thời. Hiện nay Tổ LB đang sử dụng một công cụ Excel để kiểm tra về các yếu tố: -	Lệch đầu -	Vặn tàu tại DAD và các sân bay khác -	Tàu hỏng APU đến các sân không có thiết bị điện mặt đất. -	Ground time so với tiêu chuẩn -	BH so với BH mùa -	Tàu bay vi phạm phép bay |  |
|  | 33 | Báo cáo nhiên liệu |  |  |  |  |  |
|  | TOSS-282 | Báo cáo nhiên liệu tiêu thụ trên giờ bay theo loại tàu bay (subtype, ac type), chặng bay. Hiển thị các giá trị thống kê: median, medium, max, min, theo % độ tin cậy của nhiên liệu tiêu thụ/ giờ bay FH |  |  |  |  |  |
|  |  |  | FH Fuel Flow by AC subtype (tổng hợp theo nhóm tàu bay) | Standard Filter AC Type (cho phép lựa chọn theo một trong các thuộc tính chia nhóm tàu bay) Minimum Fls (số lượng chuyến bay tối thiểu thì tính) Reliability | Kết quả tương tự file TINH DINH MUC - Sector - DEP - ARR - AC Subtype (theo Group 4) - Fls (số chuyến bay từng năm, mỗi năm một cột, năm nào không bay để trống), thêm một cột Fls 12 tháng gần nhất - Min FH Fuel Flow  - AVG FH Fuel Flow - Max FH Fuel Flow - FH Fuel Flow at selected Reliability |  |  |
|  |  |  | FH Fuel Flow by AC subtype (tổng hợp theo từng AC Reg) | Standard Filter AC Reg (chọn một hoặc nhiều) Region Minimum Fls (số lượng chuyến bay tối thiểu thì tính) Reliability | Bảng kết quả với các cột: - AC Reg (nếu chọn nhiều region thì lặp lại AC reg cho mỗi Region) - Region (mỗi dòng 1 region hoặc "All" nếu chọn hết) - Min FH Fuel Flow  - AVG FH Fuel Flow - Max FH Fuel Flow - FH Fuel Flow at selected Reliability |  |  |
|  | TOSS-283 | Báo cáo so sánh nhiên liệu kế hoạch và thực tế |  |  |  |  |  |
|  |  |  | SFC (Statistical Fuel Consumption) | Standard Filter Reliability | Bảng kết quả - Sector - AC type (loại trong Category đã chọn) - Delta Fuel (= Actual Trip Fuel – Planned Trip Fuel) (fill màu ô những giá trị >0) - Rate per AVG Trip Fuel (tỷ lệ của Delta Fuel/ AVG actual trip fuel) Loại bỏ outlier (ATC delay, diversion, ACARS bất hợp lý hoặc không có…) |  |  |
|  |  |  | Remaining Fuel | Standard filter | Bảng 1: AVG Delta Remaining Fuel by Sectors - Sector  - AC Type - AVG Delta Remaining Fuel | Top 10 chặng bay có Delta Remaining Fuel cao nhất Top 10 chặng bay có Delta Remaining Fuel thấp nhất | Đối với mỗi CB: Delta Remaining Fuel = Actual Remaining Fuel - Standard OFP Remaining Fuel |
|  |  |  | Remaining Fuel by Region | From Date To Date Region AC Type | 1. AVG Delta Remaining Fuel by Region - Region - AC Type - AVG Delta Remaining Fuel  2. Remaining fuel data  - Flight Info - OFP Cont Fuel - OFP Dest Alt Fuel - OFP Final Reserve - OFP Tankering - OFP Extra Fuel - Fuel Order - Techlog uplift FOB  - Pilot Extra Fuel - Actual Trip Fuel - Standard OFP Remaing Fuel - Actual Remaining Fuel - Delta Remaining Fuel - Data Source for Actual Remaining Fuel (ACARS/ QAR) |  |  |
|  |  |  | Remaining Fuel by AC Type | From Date To Date AC Type | 1. AVG Delta Remaining Fuel by AC Type - Sector  - AC Type - AVG Delta Remaining Fuel 2. Remaining Fuel data  - Flight Info - OFP Trip Fuel - OFP Cont Fuel - OFP Dest Alt Fuel - OFP Final Reserve - OFP Tankering - OFP Extra Fuel - Fuel Order - Techlog uplift FOB  - Pilot Extra Fuel - Actual Trip Fuel - Standard OFP Remaing Fuel - Actual Remaining Fuel - Delta Remaining Fuel - Data Source for Actual Remaining Fuel (ACARS/ QAR) |  |  |
|  |  |  | Remaining Fuel by Sector | From Date To Date Sector AC Type | 1. AVG Delta Remaining Fuel by Sector - Sector  - AC Type - AVG Delta Remaining Fuel  2. Remaining Fuel data  - Flight Info - OFP Cont Fuel - OFP Dest Alt Fuel - OFP Final Reserve - OFP Tankering - OFP Extra Fuel - Fuel Order - Techlog uplift FOB  - Pilot Extra Fuel - Actual Trip Fuel - Standard OFP Remaing Fuel - Actual Remaining Fuel - Delta Remaining Fuel - Data Source for Actual Remaining Fuel (ACARS/ QAR) | 1- AVG Delta Remaining Fuel by Month (12 tháng gần nhất) 2- Delta Remaining (Historygram by range) biểu đồ phân bổ theo khoảng (data trong khoảng thời gian được chọn) |  |
|  |  |  |  |  |  |  |  |
|  | TOSS-284 | Báo cáo Pilot Extra Fuel |  |  |  |  |  |
|  |  |  | Pilot Extra Fuel | Standard Filter - Mã PC - Tên PC (cho xổ xuống tìm tương tự rồi chọn) | Tương tự file gửi Đoàn Bay hiện nay |  |  |
|  |  |  | Overfueling | Standard Filter - Crew Code - PIC Name (cho gõ rồi xổ xuống tìm tương tự rồi chọn) - Ngưỡng sai lệch giữa Techlog block fuel và Fuel Order  (techlog block + ngưỡng > fuel order) - Ngưỡng sai lệch giữa ACARS OUT với Techlog block (tương tự) | \\10.222.23.207\occ\OCC\Backup\FOM\3. ĐGKT\4. EXTRA FUEL\2026.03. Đánh giá Fuel Order và nạp thực tế 1- Biểu đồ: - Tỷ trọng Fuel Order Extra và Overfueling đối với từng khu vực bay, từng đội tàu bay - Biểu đồ phân bố Overfueling theo khoảng chênh lệch 2- Danh sách data chi tiết như mẫu |  |  |
|  | TOSS-285 | Báo cáo Extra Fuel |  |  |  |  |  |
|  |  |  | OFP Extra Fuel | Standard Filter AC Group 2 | Mỗi chuyến bay 1 dòng - FLIGHT INFO - Mỗi loại extra Fuel 1 cột, giá trị là số lượng extra |  |  |
|  | TOSS-286 | Báo cáo định mức nhiên liệu |  |  |  |  |  |
|  |  |  | Planned FH Fuel Flow | Year (năm của version kế hoạch) Version (tên version do người dùng đặt của năm đó, tự động load ra khi chọn Year) Operated Years (chọn một hoặc nhiều năm) Last 12 months (End date) (mặc định D-1, cho nhập lại) Minimum Fls (số lượng chuyến bay tối thiểu thì tính) | Kết quả tương tự file TINH DINH MUC chỉ bao gồm SECTOR/AC đã upload - Sector - DEP - ARR - AC Subtype - Region - Fls (số chuyến bay từng năm, mỗi năm một cột, năm nào không bay để trống), thêm một cột Fls 12 tháng gần nhất. Hightlight các giá trị FF mà Fls nhỏ hơn SLCB tối thiểu đã nhập - FH Fuel Flow (từng năm, mỗi năm một cột, năm nào không bay để trống), thêm một cột FF 12 tháng gần nhất kể từ To Date. Highlight các giá trị FF cao hơn trung bình của cùng subtype từ 1000 trở lên) - Final FH Fuel Flow: Lấy lần lượt ưu tiên 12 tháng gần nhất, năm mới nhất đến năm cũ nhất. Trường hợp chưa khai thác, tính trung bình Final FH Fuel Flow của cùng Subtype, cùng Region. Highlight các giá trị tự tính bằng một màu. Highlight các giá trị lấy của năm trước một màu.   Chỉ tính đối với các CB có ACARS trip fuel |  |  |
|  | TOSS-287 | Báo cáo Fuel Burn/ RTK |  |  |  |  |  |
|  |  |  | Fuel Burn/RTK (tính dựa trên các chuyến có dữ liệu khai thác) |  | Mô tả (theo AC Group 1) Điều kiện chuyến bay được tính toán: - Có dữ liệu OFP - Có dữ liệu ACARS Block Fuel  - Nếu có Payload trên Loadsheet thì sử dụng, nếu không thì lấy EPLD trên OFP |  |  |
|  |  |  | Fuel Invoice Summary | Standard Filter | Bảng kết quả theo AC Group 1 - AC Group 1 - Mỗi tháng 1 cột (theo giai đoạn chọn), giá trị là tổng Fuel Invoice (kg) đối với từng AC Group 1 trong tháng.  - Total (cột tổng theo từng AC Group 1) Dòng cuối là total từng tháng của tất cả các Group 1, và tổng toàn bộ  Bảng này xuất ra để tính thủ công với RTK lấy từ TCKT/KHPT |  |  |
|  | TOSS-288 | Báo cáo Fuel Burn/BH |  |  |  |  |  |
|  | TOSS-289 | Báo cáo Remaining Fuel |  |  |  |  |  |
|  | 34 | Báo cáo thời gian thực hiện chuyến bay |  |  |  |  |  |
|  | TOSS-290 | Báo cáo, phân tích, đánh giá, khuyến nghị taxi time |  |  |  |  |  |
|  |  |  | AVG Taxi Out Time | From date To date Region (chọn hoặc không) Airport (chọn hoặc không) AC Group2 (chọn hoặc không) | Bảng kết quả: - Region - Airport - Taxi out time trung bình (mỗi AC Group 2 một cột) Có highlight màu từ nhạt đến đậm theo độ lớn dần của taxi time |  |  |
|  |  |  | Taxi Out Time by Hour | From date To date Region (chọn hoặc không) Airport (chọn hoặc không) AC Group2 (chọn 1 hoặc nhiều hoặc không) | Bảng kết quả: - Region - Airport - Taxi out time trung bình (mỗi khung giờ một cột) Có highlight màu từ nhạt đến đậm theo độ lớn dần của taxi time |  |  |
|  | TOSS-291 | Báo cáo taxi time xây dựng kế hoạch |  |  |  |  |  |
|  | TOSS-292 | Báo cáo, phân tích, đánh giá, khuyến nghị BH | BH By Periods | Sector AC Group  From date, to date cùng kỳ From date, to date kỳ hiện tại From date, to date kỳ kế hoạch Reliability | Tương tự bảng đánh giá khuyến nghị BH hiện nay.  Bổ sung thêm giá trị BH Reliabilitytheo % chọn Trường hợp không chọn 1 kỳ (cùng kỳ, hiện tại, kế hoạch) thì không hiển thị Bh của kỳ đó |  |  |
|  | TOSS-293 | Báo cáo BH lịch bay mùa | Season BH | - Cho phép chọn tối đa 2 khoảng From date, To date - AC Type: Cho chọn theo AC Type, AC Variant, AC Group 1 hoặc AC Group 2/3/4 - Reliability: nhập % mong muốn | Bảng kết quả: -Region - Sector - AC Type (theo việc tách/gộp đã chọn) - Fls (số chuyến bay theo các giai đoạn From date, to date đã chọn) - BH Reliabilitytheo % đã nhập theo từng tháng  - BH AVG theo từng tháng - Chênh lệch giữa BH Reliability và BH AVG theo từng tháng |  |  |
|  | TOSS-294 | Báo cáo BH xây dựng kế hoạch |  |  |  |  |  |
|  | TOSS-295 | Báo cáo BH trung bình | BH By Periods (ghép) |  |  |  |  |
|  | TOSS-296 | Báo cáo xu hướng BH | BH Trend | Sector AC Type | - Bảng chi tiết AVG BH 5 năm gần nhất từng tháng Mỗi dòng sẽ có 14 cột, từ T11 năm trước đến T12 năm hiện tại - Biểu đồ dây cho bảng trên |  |  |
|  | TOSS-297 | Báo cáo giờ thực hiện chuyến bay theo phase: taxi-out, takeoff, climb, cruise, descent, taxi-in |  |  |  |  |  |
|  | TOSS-298 | Báo cáo chuyến bay bay vòng chờ |  |  |  |  |  |
|  |  |  | FH Overrun Report (Báo cáo FH kéo dài ) | From date To date ARR AC Type | - Bảng/biểu đồ số lượng cb có FH kéo dài theo từng khung giờ, từng khoảng kéo dài. - Bảng/biểu đồ tỷ lệ cb có FH kéo dài theo từng khung giờ, từng khoảng kéo dài, có hightlight đậm nhạt thể hiện tỷ lệ cao thấp. Tham khảo mẫu FH đang có |  |  |
|  |  |  | Actual FH Summary Report (Báo cáo FH) | From date To date DEP (sched) ARR (sched) AC Type Options: AVG, Reliability(nhập được %) Diverted: Y/N (mặc định N) | Bảng kết quả FH: DEP (sched) ARR (sched) Actual ARR (chỉ hiển thị nếu chọn Diverted = Y) AC TYPE FH (theo option được chọn) Max FH Min FH |  |  |
|  |  |  | FH Plan vs Actual Daily Comparision | Standard Filter | Bảng kết quả FH theo từng chặng bay, theo từng nhóm tàu bay thân rộng/ thân hẹp theo từng ngày: Tương tự sheet theo dõi ngày trên Flight Ops Data Tùy theo giai đoạn thời gian được chọn, cần phải ra full các chặng bay/ tàu bay có khai thác trong giai đoạn đó. Sắp xếp theo cặp đi/về |  |  |
|  | TOSS-299 | Báo cáo Ground Time/ Turn Around Time | TAT Report | From date To date Airport Options: Summary/Detail | Trường hợp chọn Summary: hiển thị bảng bao gồm: - Airport - Fls (số lượng chuyến bay đến) - Fls meet sched TAT (slcb đạt TAT tiêu chuẩn) - Meet sched TAT rate (tỷ lệ đạt TAT tiêu chuẩn) - Not meet sched TAT: chia ra các khoảng TAT thực tế hơn TAT tiêu chuẩn 5, 10, 15...., >60 và slcb tương ứng Trường hợp chọn Detail, hiển thị bảng chi tiết từng chuyến bay - FLIGHT INFORMATION - Group (nhóm nối chặng bay) - Scheduled TAT - Actual TAT |  |  |
|  |  |  | Ground Service Gantt  Quản lý, khai báo linh hoạt các mốc trong sơ đồ Gantt dịch vụ |  |  |  |  |
|  |  |  | Standard Gantt vs Actual |  | Báo cáo so sánh các mốc thời gian PVMĐ theo tiêu chuẩn và thực tế |  |  |
|  | 35 | Báo cáo kế hoạch bay và dữ liệu bay thực tế |  |  |  |  |  |
|  | TOSS-300 | Báo cáo đánh giá thời gian làm OFP so với quy định |  |  |  |  |  |
|  | TOSS-301 | Báo cáo chi tiết thông tin OFP |  |  |  |  |  |
|  | TOSS-302 | Báo cáo Payload Accuracy |  |  |  |  |  |
|  | TOSS-303 | Báo cáo sân bay dự bị |  |  |  |  |  |
|  | TOSS-304 | Báo cáo đánh giá flight level |  |  |  |  |  |
|  |  |  | Tỷ lệ Flight Level từng điểm trên từng đường bay, chặng bay |  |  |  |  |
|  |  |  | Tỷ lệ Flight Level đối với một điểm cụ thể |  |  |  |  |
|  | TOSS-305 | Báo cáo chuyến bay bay qua một waypoint |  |  |  |  |  |
|  | TOSS-306 | Báo cáo route |  |  |  |  |  |
|  | TOSS-307 | Báo cáo Runway, SID, STAR |  |  |  |  |  |
|  | TOSS-308 | Báo cáo Cost Index |  |  |  |  |  |
|  | 36 | Báo cáo tải trọng, dịch vụ |  |  |  |  |  |
|  | TOSS-309 | Báo cáo chi tiết thông tin Load sheet |  |  |  |  |  |
|  | TOSS-310 | Báo cáo Loadfactor, hành khách, booking |  |  |  |  |  |
|  |  |  | Load Factor Overview |  |  | Các biểu đồ như BC tuần ĐGKT |  |
|  |  |  | Load Factor by Days | Standard Filter Group by: Chọn AC Type hoặc AC Category bất kỳ | Bảng dữ liệu gồm các cột: - Sector - AC (theo type hoặc cate đã chọn) - Flt Type (nhóm các LEG_TYPE của các chặng với nhau - LF chia từng ngày nối tiếp nhau - AVG LF giai đoạn đã chọn  Trường hợp 1 sector bay nhiều ac, mỗi dòng một ac riêng |  | Danh sách chặng bay - tàu bay bao gồm toàn bộ các chặng bay - tàu bay có khai thác trong giai doạn được chọn |
|  |  |  | Load Factor by Flights | Standard Filter | Bảng dữ liệu gồm các cột: - Nhóm cột Flight Info mặc định - Các cột tách rời: AC config C, W, Y - Các cột tách rời: Com config C, W, Y - Các cột tách rời: boooking C, W, Y - Các cột tách rời: pax C, W, Y - Các cột tách rời: LF C, W, Y - LF |  | LF = (pax C + W + Y)/ (com config C + W + Y) |
|  | TOSS-311 | Báo cáo VIP, CIP |  |  |  |  |  |
|  | TOSS-312 | Báo cáo chuyến bay có NOTOC, Cargo Manifest. Chi tiết thông tin |  |  |  |  |  |
|  | TOSS-313 | Báo cáo lịch sử cập nhật tải trọng chuyến bay |  |  |  |  |  |
|  |  |  | Báo cáo tổng hợp |  | Chạy lại SQL 1 tháng |  |  |
|  |  |  | Chênh lệch thời gian nhập tải so với quy định ban đầu |  | một số chuyến em có quy định nhập tải bao nhiêu lần, mỗi lần bao lâu trước giờ ETD, nếu lệch ngoài khoảng đó thì sẽ là lỗi từ khâu nhập tải. | hỏi Tuấn Dương |  |
|  |  |  | Chênh lệch thời gian tải nhập vào - Lido làm up lên OFP |  | + TH1: nếu như chênh tầm 1-2p thì là đúng theo rule em đặt ra do máy cần thời gian tính toán   + TH2: nếu chênh lệch quá nhiều thì sẽ là lỗi trong hệ thống tự động của Lido hoặc do người dùng ko làm đúng theo quy trình | Hỏi tuấn Dương |  |
|  |  |  | Chênh lệch thời gian upload lên MO |  | em cũng có rule để upload lên MO vào một số mốc thời gian nhất định trước ETD. nếu upload time lệch với khoảng đó quá nhiều thì sẽ khoanh vùng check kĩ tiếp. | Hỏi tuấn Dương |  |
|  |  |  | Chênh lệch tải EPLD giữa con số của 3 bên: CLC với OFP và loadsheet theo từng version OFP |  |  | Hỏi tuấn Dương |  |
|  |  |  | - Chênh lệch DOW giữa con số của 3 bên: CLC với OFP và loadsheet theo từng version OFP |  |  | Hỏi tuấn Dương |  |
|  |  |  | Chênh lệch BlockFuel giữa OFP và Loadsheet theo từng version loadsheet |  |  | Hỏi tuấn Dương |  |
|  |  |  | Báo cáo sai lệch tải EST của CLC so với thực tế |  |  |  |  |
|  |  |  | Báo cáo đánh giá cập nhật Hàng Hóa |  | Đặt lịch làm việc với Ban TTHH: báo cáo so sánh hàng hóa vc thưc tế (lấy số loadsheet) và so với lần nhập OFP ban đầu và OFP lần cuối, + số hàng hóa thực tế lần cuối (số loadshee) với số hàng hóa nhập lần đầu. chỉ đánh giá theo lần ofp cuối thì lấy số thực so với số lập lần cuối còn các lần nhập thì em cứ cho tách ra từng cột riêng |  |  |
|  | TOSS-314 | Báo cáo hàng hóa, mail |  |  |  |  |  |
|  | TOSS-315 | Báo cáo hành lý ký gửi/ offload hành lý |  |  |  |  |  |
|  | TOSS-316 | Báo cáo thay đổi tải trọng sát giờ bay |  |  |  |  |  |
| MO | TOSS-317 | Báo cáo sử dụng nước sạch | Cho phép upload báo cáo điện nước sạch download từ website boeing airbus bổ sung các chuyến ko nhận đc điện qua email | - Hardcode capc nước sạch cho từng loại tàu - Thêm Module Water service có tính toán lượng nước chuyến bay, Request nước, submit lượng nước trước chuyến bay và sau chuyến bay, đính kèm file evd - Briefings view all tham số của 1 chuyến, Đẩy hình chụp về other document. | Lượng nước có trong tank nước đầu chuyến bay và sau chuyến bay 350 và B787 điện ACARS qua email (nước lúc DEP và nước lúc ARR)  Lịch sử: Biết nước tiêu thụ, Biết pax, biết crew (tổng số người), flight time -> tiêu thụ/pax/giờ -> trung bình khung giờ tiêu thụ trên từng loại tàu  Tính toán để est chuyến mới sẽ tiêu thụ bao nhiêu.    320-321 chưa có điện |  |  |
|  | TOSS-318 | Báo cáo Weight Factor |  |  |  |  |  |
|  | TOSS-319 | Báo cáo chuyến bay đạt giới hạn tải |  |  |  |  |  |
|  |  |  | ZFW/Payload Diff Summary (Báo cáo sai lệch Payload tổng hợp) | From date To date | Tỷ lệ CB lệch so với tiêu chuẩn theo từng đội tàu bay, cb QT/QN và mức độ sai lệch. Các cột: Diff Range (trong đó thể hiện đoạn giữa là mức sai lệch cho phép cả âm, dương. Còn lại là các bước nhảy chẵn 1000kg cho đến mức sai lệch cao nhất/thấp nhất) Fls (số chuyến bay) Rate (tỷ lệ Fls so với tổng số CB trong giai đoạn đánh giá) Mỗi AC type chia 2 cột QT/QN và số lượng cb tương ứng |  |  |
|  |  |  | MTOW Exceed |  |  |  |  |
|  | 37 | Báo cáo Tổ bay |  |  |  |  |  |
|  | TOSS-320 | Cho phép thiết lập mục tiêu giờ bay PC, TV theo từng giai đoạn |  |  |  |  |  |
|  | TOSS-321 | Báo cáo Flight Time, Flight Duty PC, TV |  |  |  |  |  |
|  | TOSS-322 | Báo cáo trung bình thời gian bay PC, TV theo từng chức vụ trên chuyến bay |  |  |  |  |  |
|  | TOSS-323 | Báo cáo số lượng PC, TV khai thác |  |  |  |  |  |
|  | TOSS-324 | Báo cáo số lượng PC, TV nghỉ |  |  |  |  |  |
|  | TOSS-325 | Báo cáo tổ bay dự bị |  |  |  |  |  |
|  | TOSS-326 | Báo cáo các trường hợp khai thác không đúng quy định |  |  |  |  |  |
|  | TOSS-327 | Các báo cáo khai thác PC, TV khác |  |  |  |  |  |
|  | 38 | Báo cáo khai thác khác |  |  |  |  |  |
|  | TOSS-328 | Báo cáo traffic |  |  |  |  |  |
|  | TOSS-329 | Báo cáo chuyến bay bất thường ảnh hưởng do thời tiết |  |  |  |  |  |
|  | TOSS-330 | Báo cáo chuyến bay bất thường vì lý do kỹ thuật |  |  |  |  |  |
|  | TOSS-331 | Báo cáo chuyến bay bất thường khác |  |  |  |  |  |
|  | TOSS-332 | Báo cáo sử dụng nước sạch |  |  |  |  |  |
|  | TOSS-333 | Báo cáo hiệu quả chuyến bay |  |  |  |  |  |
|  | TOSS-334 | Báo cáo NOTAM |  |  |  |  |  |
|  | TOSS-335 | Báo cáo thời tiết quan trắc thực tế |  |  |  |  |  |
|  |  |  | Observed Weather Report | From Date To Date WX Source (TAF hoặc METAR) | 2- Bảng chi tiết từng lần quan trắc |  |  |
|  | TOSS-336 | Báo cáo thời tiết quan trắc thực tế so với minima |  |  |  |  |  |
|  |  |  | TAF/METAR | - From Date - To Date - WX Source (TAF hoặc METAR) - Comparison to: Minima or Other. - Nếu chọn Other thì cho nhập Visibility và Ceiling | Bảng như hình bên |  | Giá trị là tỷ lệ TAF hoặc METAR cao hơn 2 điều kiện nhập vào hoặc minima. |
|  | TOSS-337 | Báo cáo thời tiết so sánh dự báo và thực tế |  |  |  |  |  |
|  | TOSS-338 | Các báo cáo khác phát sinh theo nghiệp vụ thuộc yêu cầu kỹ thuật này |  |  |  |  |  |
|  |  | Báo cáo FORM D, FORM E |  |  |  |  |  |

## Sheet13

|  |  |  |  |
|---|---|---|---|
|  |  |  | Danh sách danh mục ACsubtype |
|  |  |  | Lọc theo danh sách |
|  |  |  | Thêm mới acsubtype |
|  |  |  | Sửa acsubtype |
|  |  |  | Xoá acsubtype |
|  |  |  | Kết xuất danh sách |
|  |  |  |  |
|  |  |  | Danh sách danh mục chặng bay |
|  |  |  | Lọc theo danh sách |
|  |  |  | Thêm mới chặng bay |
|  |  |  | Sửa chặng bay |
|  |  |  | Xoá chặng bay |
|  |  |  | Kết xuất chặng bay |

## DSP

| Nhu cầu |  |
|---|---|
|  | Cảnh báo đổi tải |
|  | Cảnh báo đổi tàu |
|  | Cảnh báo chuyến bay chưa có tài liệu vào thời điểm nhất định |
|  | Report |
|  | Upload tài liệu |
|  | Briefings sheet |
|  | AMOS |
|  | Tình trạng kỹ thuật máy bay |
|  | Attacht file lên MO |
|  | Dispatch release thì pilot mới được confirm release. |

## Tich hop

|  | DANH MỤC HỆ THỐNG, DỮ LIỆU TÍCH HỢP VÀO TOSS |  |  |  |  |
|---|---|---|---|---|---|
|  |  | Inbound |  | Outbound |  |
| STT | Hệ thống | Phương thức/ Nguồn | Dữ liệu | Dữ liệu | Phương thức/ Đầu ra |
| 1 | Netline Flight Ops++ |  |  |  |  |
| 2 | DWH/Lakehous TCT |  |  |  |  |
| 3 | Flight Scheduling System |  | SSIM, ASM, SSM |  |  |
| 4 | AVES |  | Thông tin PC, TV Lịch bay PC, TV |  |  |
| 5 | Crew Trip |  | Chi phí khách sạn Chi phí xe chở tổ bay Thực tế sử dụng khách sạn tổ bay |  |  |
| 6 | MO Plus |  | OFP/eOFP Flight Release Document Confirmation Tài liệu Library |  |  |
| 7 | MRO/ AMOS |  | lịch bảo dưỡng tàu bay MEL/CDL, Techlog fuel/time |  |  |
| 8 | TIMS |  | thông tin khối kỹ thuật |  |  |
| 9 | eTechlog |  | Flight Log, Defect log, bảo dưỡng, dữ liệu kỹ thuật máy bay, hạn định bảo dưỡng, |  |  |
| 10 | Amadeus PSS (1A): |  | Danh sách, số lượng hành khách Config tàu bay, config mở bản Hành khách nối chuyến, VIP, CIP |  |  |
| 11 | Lido Flight 4D/ Adapter Lido | Qua MO Plus | Kế hoạch bay NOTAM, WX filed ATC/ điện thay đổi |  |  |
| 12 | Lido mPilot |  |  |  |  |
| 13 | Hệ thống VMS của VIAGS |  | thông tin khai thác tại sân bay |  |  |
| 14 | FM, Lotus Airport, PTS |  | (Hệ thống thông tin dịch vụ mặt đất) |  |  |
| 15 | ACDM |  | Milestone times, vị trí, trạng thái chuyến bay, thông tin điều phối mặt đất, điều phối không lưu, năng lực khai thác sân bay, cảnh báo và phân tích hiệu suất |  |  |
| 16 | RPS |  | Các hệ thống quản trị chi phí, lợi nhuận của VNA |  |  |
| 17 | ANCM |  | chi phí điều hành bay, bay qua, hạ cất cánh Hóa đơn nhiên liệu |  |  |
| 18 | Cargo Spot |  | thông tin hàng hóa cho chuyến bay (lấy đánh giá so sánh độ trễ, độ chính xác so với CLC cung cấp) |  |  |
| 19 | DCS |  | thông tin phục vụ hành khách |  |  |
| 20 | Flight Radar24 |  | Vị trí máy bay, hành trình bay |  |  |
| 21 | Flight Watch |  | Dữ liệu thời tiết, dự báo theo đường bay, theo dõi chuyến bay |  |  |
| 22 | Hệ thống tiết kiệm nhiên liệu |  | kết quả thực hiện của từng giải pháp với từng chuyến bay |  |  |
| 23 | NetZero |  |  | Nhiên liệu kế hoạch ACARS |  |
| 24 | WNI |  |  | Kế hoạch bay |  |
| 25 | Cirium |  | Cũ MVT + Supplemental  Cần rà soát và nâng cáp đẻ tăng tỷ lệ dữ liệu | Kế hoạch bay |  |
| 26 | SPECTRA |  |  | (CĐS) |  |
| 27 | ETS - Quản lý Khí thải |  |  | ACARS |  |
| 28 | Quản lý Hợp đồng (CMS) |  |  | (CĐS) |  |
| 29 | LMS |  |  | (CĐS) |  |
| 30 | ACARS |  |  |  |  |
| 31 | SITA TEXT |  | UCM, ASM |  |  |
| 32 | Hệ thống AMHS, AFTN: hệ thống trao đổi thông tin hàng không |  |  |  |  |
| 33 | Cassiopee Alpha |  | Analyzed QAR |  |  |
| 34 | NOTAM, WX VATM | Email |  |  |  |
| 35 | Weather data | Website | TAF, METAR |  |  |
| 36 | Bảng kê nhiên liệu của các nhà cung ứng |  |  |  |  |
| 37 | Migrate FIMS |  | cơ sở dữ liệu lịch bay, kế hoạch bay, các dữ liệu FIMS đã tích hợp liên quan đến chuyến bay |  |  |
| 38 | AD/LDAP |  |  |  |  |
| 39 | FOEM (Flight Ops Engineering) |  | Bảng DOW. Trường hợp FOEM chưa xong sử dụng trước 1 file DOW fixed (tương tự Adapter hiện nay) |  |  |

## MENU

| Đối tượng sử dụng | Trực Ban Trưởng Các CQĐV cung cấp thông tin cho báo cáo khai thác ngày Các đơn vị/ bộ phận xem thông tin chuyến bay thời gian thực | Điều phái (Anh Phúc, anh Bảo) | CLC Phục vụ hàng hóa Phục vụ hành khách | Đại diện sân bay | PVHH: Đơn vị/công ty phục vụ hàng hóa tại sân bay khởi hành; PVMĐ: Đơn vị/công ty phục vụ mặt đất tại sân bay khởi hành; |  | Quản trị viên danh mục, dữ liệu cơ sở |  | Quản trị hệ thống |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Menu chính | Live Operations | Flight Dispatch | Flight Load Control | Station Manager | NOTOC/ Manifest | Report | Data Maintenance | Data Source Monitoring | System Admin |  |  |  |
|  | iOCC |  | Load & Weight | Danh sách chuyến bay |  | Flight Ops Summary | Performance Factor | Integration Overview | User Management | 1 link báo cáo tổng hợp tương tự báo cáo CĐT đối với các dữ liệu tổng hợp tự động. Cho phép admin chọn khoảng giai đoạn thời gian. Người xem chỉ xem | 1 link báo cáo dữ liệu khai thác tổng hợp, chọn được khoảng thời gian: - Sản lượng - OTP - LF - Bất thường | 1 link các bất thường cần lưu ý: - BH tăng/giảm - FH thực tế vs KH chênh lệch - Nhiên liệu thực tế vs KH chênh lệch ...... |
|  | Daily Operations Status | - Nhận thông tin thay đổi NOTAM, thời tiết, đóng mở cửa đường bay, MEL/CDL, tải. Nhiên liệu. Có gói thông tin rồi thì đánh giá, làm OFP. Chưa có bước release, trước Quốc tế 240p, nội địa 90p. Thường thay đổi về tải, muộn nhất quốc tế 90p, quốc nội 60p. - Cần có khâu release của DSP trên TOSS, MO cần phải có thông tin DSP release OFP thì mới confirm release được. | LS, GD, PM, eNotoc Baggage | Flt docs (lưu TOSS ver cuối tối đa 7 ngày) Đó là tài liệu của MO như OFP, NOTAM, Weather TOSS Vẫn lưu tài liệu TOSS bth |  | Ops Control | Tankering | ACARS | Email Recipients List |  |  |  |
|  | Cảnh báo crew names, chứng chỉ, phi công phải kinh nghiệm và thoả mãn bay tới sân cụ thể | - Check lịch bay: Thay đổi tàu bay Giờ bay (trên 15p thì cảnh báo) (EDT netline so với EDT OFP) | eNotoc Cargo | Flight release (pilot confirm) |  | Fuel | Country | QAR | Auto Emails |  |  |  |
|  |  | - Check flight Type: (Thay đổi type của chuyến bay) Lưu lịch sử thay đổi của loại chuyến bay. VIP- thường Thường-Ferry ngược lại | eCargo Manifest, eMail Manifest | Checklist submit |  | Time | Fir |  | Defaut View |  |  |  |
|  |  | - Check NOTAM (trên trang của quản lý bay hoặc LIDO) Kiểm tra NOTAM mới phát sinh Đánh giá ảnh hưởng (So với đường bay có ảnh hưởng hay không như hoạt động quân sự) Các loại NOTAM quan trọng như Đóng cửa sân bay, đường bay, quân sự. Check cách cứu hoả RFFS (Sân có public cách cứu hoả rồi, có NOTAM là cảnh báo rồi) |  |  |  | OFP vs QAR | Airport |  | Warnings and Parameters |  |  |  |
|  |  | - Check thời tiết WX so với Minima của từng sân bay (đối với sân cất-hạ cánh), nguồn thời tiết (nội địa- trang web quản lý bay, Quốc tế lấy theo LIDO) Minima của từng sân bay sẽ có tiêu chuẩn  Quan tâm +Tầm nhìn +Trần mây +Mưa giông (TSRA, TSRA+) + Airport chart (lấy từ Quản lý bay, Weather new) Căn cứ vào bản tin META (30p/lần) |  |  |  | Load & Weight | Sector |  |  |  |  |  |
|  |  | - Check ZFW (đổi tải trong FON), 60p quốc nội, 90p quốc tế. Căn cứ số liệu được nhập trên CLC estimate với OFP hiện tại, giới hạn lệch bao nhiêu thì cần khai báo, có giới hạn trần và sàn, khai báo trong systemadmin - Check DOW (trong AHM) (Drive operating weight) |  |  |  | Crew | Aircraft |  |  |  |  |  |
|  |  | - Cảnh báo MEL/CDL (tích hợp AMOS) (Master MEL)  Lỗi kỹ thuật mà cần mang thêm dầu trong các MEL Ảnh hưởng mực bay |  |  |  | Other | MEL Policy |  |  |  |  |  |
|  |  | Cảnh báo est TO/LD (MTOW, MLDW) trong OFP Sân bay khai thác (FOE) phần mềm tính performance, điều kiện taf meta để tính performance và so với kế hoạch. |  |  |  |  | Planned Versions |  |  |  |  |  |
|  |  | Flight permission, check phép bay, slot bay theo mùa để cảnh báo. Số phép bay Cảnh báo phép mùa chưa cho loại tàu bay thực hiện chuyến đó, |  |  |  |  | Parameters |  |  |  |  |  |
|  |  | Cảnh báo đổi tổ bay |  |  |  |  |  |  |  |  |  |  |
|  |  | Cảnh báo Taxi, APU so với (FON) Lệch taxi time (Danh mục sân bay sẽ cần khai báo taxitime tiêu chuẩn) |  |  |  |  |  |  |  |  |  |  |
|  |  | Cảnh báo ATC (nội dung như MO) |  |  |  |  |  |  |  |  |  |  |
|  |  | Cảnh báo chuyến bay thiếu tài liệu (OFP, NOTAM, WX) |  |  |  |  |  |  |  |  |  |  |
|  |  | Cảnh báo tổ bay chưa download tài liệu |  |  |  |  |  |  |  |  |  |  |
|  |  | Cảnh báo chuyến VIP mà ATC, OFP chưa có Status head, trước chuyến bay. |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Tab danh sách chính: |  |  |  |  |  |  |  |  |  |  |
|  |  | Bộ lọc: Các cột thông tin như: Thông tin chuyến bay, Pilot extra fuel, |  |  |  |  |  |  |  |  |  |  |
|  |  | Có chức năng release OFP để trạng thái DSP release, bắn lên MO để phi công nhận biết. Thêm điều kiện trên MO để pilot Confirm release. |  |  |  |  |  |  |  |  |  |  |
|  |  | Có chức năng unrealease OFP về phiên bản trước, TOSS gọi MO để tạo mới trên MO |  |  |  |  |  |  |  |  |  |  |
|  |  | Có chức năng upload tài liệu (gói OFP và các tài liệu khác) để gửi sang MO |  |  |  |  |  |  |  |  |  |  |
|  |  | Có chức năng xem chi tiết tài liệu gốc chuyến bay (LIDO) và tải về |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Tab cấu hình upload file chung |  |  |  |  |  |  |  |  |  |  |
|  |  | Ngày, thời gian hiệu lực (Theo EDT), có luôn trên MO sau khi upload. |  |  |  |  |  |  |  |  |  |  |

## Cảnh báo & Tham số

|  |  |  |  |
|---|---|---|---|
|  | Mục đích cảnh báo | Tham số tương ứng | Mô tả |
| 1 |  | FLIGHT BASE TIME FOR CAAV | Thời điểm chốt lịch bay căn cứ với CHK Sample value: 20 Nghĩa là lịch bay ngày hôm sau được chốt ở thời điểm 20 giờ ngày hôm trước |
| 2 | Cảnh báo tổ bay chưa download tài liệu version mới cho DSP |  |  |
| 3 | Cảnh báo filed ATC |  |  |
| 4 | Cảnh báo OFP phiên bản OFP mới đang có khác biệt so những thay đổi:  - AC Reg - ETD - DEP - ARR - PAX - DOW/ PAYLOAD ngoài giới hạn - Crew (đổi tổ bay) |  |  |
| 5 | Cảnh báo chuyến bay code O không có STS HEAD trong ATC FPL |  |  |
| 6 |  |  |  |
| 7 |  |  |  |
| 8 |  |  |  |
| 9 | Cảnh báo tàu bay sắp hết Flight Cycle |  |  |
| 10 | Cảnh báo tàu bay hỏng APU có lịch bay đến các sân bay không cung cấp điện khí mặt đất |  |  |
| 11 | Cảnh báo các tàu không có dữ liệu Performance Factor |  |  |
| 12 | Cảnh báo chuyến bay thiếu tài liệu | NOT UPLOADED DOCS BEFORE ETD (INT) NOT UPLOADED DOCS BEFORE ETD (DOM) |  |
| 13 | Cảnh báo MEL ảnh hưởng khai thác |  |  |
| 14 | Cảnh báo CB có khách VIP, khách nối chuyến |  |  |
| 15 | Cảnh báo Loadfactor thấp |  |  |
| 16 | Cảnh báo chuyến bay delay |  |  |
| 17 | Cảnh báo đổi tổ bay |  |  |
| 18 | Cảnh báo chuyến bay divert (so với lịch Netline) |  |  |
| 19 | Cảnh báo thiếu phép bay |  |  |
| 20 | Cảnh báo TAT không đủ quy định |  |  |
| 21 | Cảnh báo thiếu điện văn |  |  |
| 22 | Cho phép cấu hình bật tắt cánh báo mặc định và mỗi user tự cấu hình bật tắt cảnh báo của mình |  |  |
| 23 |  |  |  |
| 24 | Các cảnh báo kiểm soát luồng làm việc tự động của Lido 4D |  |  |
| 25 | Tổng hợp hết các cảnh báo đã mô tả trong YCKT |  |  |
| 26 | Bổ sung các cảnh báo trong quá trình khảo sát |  |  |

## FOS

|  | FOS Report | Flight Operations Summary/ Flight Integrated |  |  |  |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Standard Filter |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | From Date | To Date | Local time/ UTC | Plan/Actual Time | Carrier | đây là bộ lọc cố địn đối với mọi báo cáo Ngoài ra có thêm trường lọc riêng cho từng báo cáo đặc biệt |  |  |  |  |  |  |  |
|  | AC Category | AC Type | AC Reg | Flt Type | Flt State |  |  |  |  |  |  |  |  |
|  | Region | DEP | ARR | FLT NO |  |  |  |  |  |  |  |  |  |
| Các trường màu xanh lá cây là mặc định chọn |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Có nhiều nhóm thông tin, trong đó mỗi nhóm có nhiều trường thông tin. Có thể chọn toàn bộ trường của 1 số nhóm hoặc chọn từng trường của từng nhóm Cảnh báo hiệu năng lúc người dùng chọn thời gian/ số lượng trường nhiều có thể dẫn tới giảm hiệu năng |  |  |  |  |  |  |  |  |  |  |  |  |  |
| FLIGHT INFO | AIRCRAFT | TIME | FUEL UPLIFT | LOAD & WEIGHT | OFP | FLIGHT RELEASE | DOCUMENT STATUS | EOFP | QAR | CREW | AIRPORT | ACARS | COST & REVENUE |
| LEG_NO | AC SUBTYPE | OUT TIME | FUEL RECEIPT COUNT | AC CONFIG C | OFP REV | CORR DOW | CREW SYNC | OFP REV | APU ON TIME | PIC | DEP TERMINAL | ACARS MED | NAVIGATION FEE |
| REGION | AC GROUP 1 | OFF TIME | INVOICE UNIT | AC CONFIG W | OFP NUMBER | CORR PLD | OFP REV COUNT | UPLOAD TIME | APU OFF TIME | FC | DEP GATE | ACARS OUT TIME | OVERFLIGHT FEE |
| AC TYPE | AC GROUP 2 | ON TIME | INVOICE UPLIFT | AC CONFIG Y | OFP TIME | CORR ZFW | LS REV COUNT | UPLOADED BY | LEFT ENG ON TIME | CC | DEP PARKING STAND | ACARS OFF TIME |  |
| AC REG | AC GROUP 3 | IN TIME | INVOICE DENSITY | AC CONFIG CWY | EDTO | CORR TOW | GD REV COUNT | EOFP OFF BLOCK | RIGHT ENG ON TIME |  | DEP AIR BRIDGE | ACARS ON TIME |  |
| FLTNO | AC GROUP 4 | MVT OUT TIME | INVOICE UPLIFT KG | COM CONFIG C | EDTO MINS | CORR TOF | PM REV COUNT | EOFP TAKE OFF | LEFT ENG OFF TIME |  | DEP CHECK-IN COUNTER | ACARS IN TIME |  |
| STD | AC GROUP 5 | MVT OFF TIME | FUEL SUPPLIER | COM CONFIG W | IS RECLEAR OFP | CORR LDW | NOTOC BAGGAGE REV COUNT | EOFP LANDING | RIGHT ENG OFF TIME |  | ARR TERMINAL |  |  |
| STA | TANK CAPACITY | MVT ON TIME | DEFUEL QTY | COM CONFIG Y | OFP SCHED OFF BLOCK | CORR TRIP FUEL | NOTOC CARGO REV COUNT | EOFP IN BLOCK |  |  | ARR GATE | ACARS OUT FUEL |  |
| ETD | TAXI FUEL FLOW | MVT IN TIME |  | COM CONFIG CWY | OFP SCHED IN BLOCK | CORR TAXI FUEL | CARGO MANIFEST REV COUNT | EOFP CORR DOW | QAR OUT TIME |  | ARR AIR BRIDGE | ACARS OFF FUEL |  |
| ETA | APU FUEL FLOW |  | TECHLOG UPLIFT | BLOCK SPACE C | OFP EST OFF BLOCK | FUEL ORDER | MAIL MANIFEST REV COUNT | EOFP CORR PLD | QAR OFF TIME |  | ARR BAGGAGE BELT | ACARS ON FUEL |  |
| ATD (OUT TIME) | PF | BH SCHED | TECHLOG FOB | BLOCK SPACE W | OFP EST TAKE OFF | FLIGHT RELEASE TIME | LS UPLOAD TIME | EOFP CORR ZFW | QAR ON TIME |  |  | ACARS IN FUEL |  |
| ATA (IN TIME) | OWNERSHIP STATUS | BH ACTUAL |  | BLOCK SPACE Y | OFP EST LANDING | RELEASED BY | LS CONFIRM TIME | EOFP CORR TOW | QAR IN TIME |  |  | ACARS TRIP FUEL |  |
| DEP |  | FH SCHED |  | BLOCK SPACE CWY | OFP FMS CI | OFP REV RELEASED | GD UPLOAD TIME | EOFP CORR TOF | QAR OUT FUEL |  | ELDT-Estimated Landing time | ACARS BLOCK FUEL |  |
| SARR |  | FH ACTUAL |  | CODESHARE C | OFP FMS CLB CI | FLIGHT RELEASE COUNT | GD CONFIRM TIME | EOFP CORR LDW | QAR OFF FUEL |  | ALDT-Actual landing time | ACARS TXO FUEL |  |
| AARR |  | TAXI OUT TIME |  | CODESHARE W | OFP FMS CRS CI |  | PM UPLOAD TIME | EOFP CORR TRIP FUEL | QAR ON FUEL |  | LRWY-Landing runway | ACARS TXI FUEL |  |
| SECTOR |  | TAT SCHED |  | CODESHARE Y | OFP FMS DSC CI |  | PM CONFIRM TIME | EOFP CORR CONT FUEL | QAR IN FUEL |  | SIBT-Schedule in-block time |  |  |
| LEG TYPE |  | TAT ACTUAL |  | CODESHARE CWY | OFP SPECIAL OPS |  | NOTOC BAGGAGE UPLOAD TIME | EOFP CORR DEST ALTN FUEL |  |  | EIBT-Estimated in-block time |  |  |
| LEG STATE |  | DOORS OPENED TIME |  | BOOKING C | AIR DIST |  | NOTOC CARGO UPLOAD TIME | EOFP CORR FINAL RES FUEL |  |  | AIBT-Actual in-block time |  |  |
| DIVERTED |  | DOORS CLOSED TIME |  | BOOKING W | GND DIST |  | CARGO MANIFEST UPLOAD TIME | EOFP CORR MIN SECTOR FUEL |  |  | APRK-Arrival parking |  |  |
| IRREGULAR |  | PAX LOADING START |  | BOOKING Y | AVG WC |  | MAIL MANIFEST UPLOAD TIME | EOFP CORR TAKEOFF FUEL |  |  | BELT-Belt |  |  |
|  |  | PAX LOADING END |  | BOOKING CWY | AVG WIND |  | NOTOC BAGGAGE CONFIRM TIME | EOFP CORR TAXI FUEL |  |  | AGATE-Arrival gate |  |  |
|  |  | GRD SERVICE START |  | AMADEUS C | ISA DEV |  | NOTOC CARGO CONFIRM TIME |  |  |  | ACGT-Actual commence of ground handling time |  |  |
|  |  | GRD SERVICE END |  | AMADEUS W | MAX SHR |  | CARGO MANIFEST CONFIRM TIME |  |  |  | DPRK-Departure Parking |  |  |
|  |  | CARGO SERVICE START |  | AMADEUS Y | OFP ROUTE |  | MAIL MANIFEST CONFIRM TIME |  |  |  | ETTT-Estimated turnaround time |  |  |
|  |  | CARGO SERVICE END |  | AMADEUS CWY | OFP ROUTE DETAIL |  |  |  |  |  | DGATE-Departure gate |  |  |
|  |  | FUEL SERVICE START |  | LS CONFIG C | OFP FLT LVL |  |  |  |  |  | SOBT-Schedule off-block time |  |  |
|  |  | FUEL SERVICE END |  | LS CONFIG W | OFP TAKEOFF RUNWAY |  |  |  |  |  | EOBT-Estimated off-block time |  |  |
|  |  | TECH SERVICE START |  | LS CONFIG Y | OFP REMARKS |  |  |  |  |  | TOBT-Target off-block time |  |  |
|  |  | TECH SERVICE END |  | LS CONFIG CWY | DSP NOTES |  |  |  |  |  | AOBT-Actual off-block time |  |  |
|  |  | DELAY GROUP |  | LS PAX C | DISPATCHER |  |  |  |  |  | ASBT-Actual start boarding time |  |  |
|  |  | DELAY CODE |  | LS PAX W | DSP LICENSE NUMBER |  |  |  |  |  | ARDT-Actual ready for departure time |  |  |
|  |  | DELAY MINS |  | LS PAX Y | OFP PAX |  |  |  |  |  | ASRT-Actual Start-up Request Time |  |  |
|  |  | ETD CAAV |  | LS PAX CWY | OFP WX PROG |  |  |  |  |  | TSAT-Target startup approval time |  |  |
|  |  |  |  | ALLOW PCS BAG C |  |  |  |  |  |  | ASAT-Actual Startup approval time |  |  |
|  |  |  |  | ALLOW PCS BAG W | FILED ATC FPL |  |  |  |  |  | CTOT-Calculated take-off time |  |  |
|  |  |  |  | ALLOW PCS BAG Y | OFP ATC FPL |  |  |  |  |  | TTOT-Target take-off time |  |  |
|  |  |  |  | ALLOW PCS BAG | ATC FPL RULE |  |  |  |  |  | ATOT-Actual take-off time |  |  |
|  |  |  |  |  | ATC FPL TYPE OF FLIGHT |  |  |  |  |  | DRWY-Departure runway |  |  |
|  |  |  |  |  | ATC FPL WAKE TURB CAT |  |  |  |  |  |  |  |  |
|  |  |  |  |  | ATC FPL EQUIPMENT |  |  |  |  |  | Các thông số trong điện ACARS CDA |  |  |
|  |  |  |  | LS BAG PCS | ATC FPL Surveillance |  |  |  |  |  | CLR TIME |  |  |
|  |  |  |  | LS DATETIME | ATC FPL SPEED UNIT |  |  |  |  |  | CLR RUNWAY |  |  |
|  |  |  |  | LS VERSION | ATC FPL SPEED |  |  |  |  |  | CLR SQUAWK |  |  |
|  |  |  |  | LS FC | ATC FPL FL |  |  |  |  |  | CLR FL RESTRICT |  |  |
|  |  |  |  | LS CC | ATC FPL ROUTE |  |  |  |  |  | CLR SID |  |  |
|  |  |  |  | LS OTH | ATC FPL SID |  |  |  |  |  | CLR SID ADD INFO |  |  |
|  |  |  |  | LS CPART WEIGHT | ATC FPL SID END WPT |  |  |  |  |  | CLR TSAT |  |  |
|  |  |  |  | LS CPART 1 | ATC FPL STS |  |  |  |  |  | CLR ADT |  |  |
|  |  |  |  | LS CPART 2 | ATC FPL FIRS |  |  |  |  |  | ACARS GATE |  |  |
|  |  |  |  | LS CPART 3 |  |  |  |  |  |  |  |  |  |
|  |  |  |  | LS CPART 4 | OFP PIC |  |  |  |  |  |  |  |  |
|  |  |  |  | LS CPART 5 | OFP PILOTS |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PAX WEIGHT |  |  |  |  |  |  |  |  |  |
|  |  |  |  | LS ADULT | TAKEOFF ALTN |  |  |  |  |  |  |  |  |
|  |  |  |  | LS CHILD | ENROUTE ALTN |  |  |  |  |  |  |  |  |
|  |  |  |  | LS INFANT | DEST ALTN 1 |  |  |  |  |  |  |  |  |
|  |  |  |  | LS MALE | DEST ALTN 1 DST |  |  |  |  |  |  |  |  |
|  |  |  |  | LS FEMALE | DEST ALTN 1 TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS CHILD | DEST ALTN 1 FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TTL | DEST ALTN 1 ROUTE |  |  |  |  |  |  |  |  |
|  |  |  |  | LS CAB | DEST ALTN 1 TRACK |  |  |  |  |  |  |  |  |
|  |  |  |  | LS SOC C | DEST ALTN 2 |  |  |  |  |  |  |  |  |
|  |  |  |  | LS SOC W | DEST ALTN 2 DST |  |  |  |  |  |  |  |  |
|  |  |  |  | LS SOC Y | DEST ALTN 2 TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS BLKD | DEST ALTN 2 FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PAYLOAD | DEST ALTN 2 ROUTE |  |  |  |  |  |  |  |  |
|  |  |  |  | LS DOW | DEST ALTN 2 TRACK |  |  |  |  |  |  |  |  |
|  |  |  |  | LS ZFW | DEST ALTN 3 |  |  |  |  |  |  |  |  |
|  |  |  |  | LS ZFW MAX | DEST ALTN 3 DST |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TAKE OFF FUEL | DEST ALTN 3 TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TOW | DEST ALTN 3 FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TOW MAX | DEST ALTN 3 ROUTE |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TRIP FUEL | DEST ALTN 3 TRACK |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LAW | OFP TRIP FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LAW MAX | OFP TRIP TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TAXI FUEL | OFP CONT PERCENT |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TAXI WEIGHT | OFP CONT ARPT |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TAXI WEIGHT MAX | OFP CONT FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS DOI | OFP CONT TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LIZFW | OFP FINAL RES FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS MACZFW | OFP FINAL RES TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LITOW | OFP MIN SECTOR FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS MACTOW | OFP MIN SECTOR TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LILAW | OFP TAKE OFF FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS MACLAW | OFP TAKE OFF TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS STAB TRIM | OFP TAXI FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS A | OFP TAXI TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS B | OFP HOLD DEST FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS C | OFP HOLD DEST TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LMC DEST | OFP BLOCK FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LMC SPEC | OFP BLOCK TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LMC WEIGHT | OFP POSS EXTRA |  |  |  |  |  |  |  |  |
|  |  |  |  | LS UNDERLOAD BEF LMC | OFP TANKERING FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LMC TOTAL | OFP TANKERING TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS LOADMESSAGE | OFP ADDNL EDTO FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS TTL LDM | OFP ADDNL EDTO TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS JMP | OFP RCFP ADDNL FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS CRW | OFP RCFP ADDNL TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PAD C | OFP ADDNL OPN FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PAD W | OFP ADDNL OPN TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PAD Y | OFP ADDNL ATC/NOTAM FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS WET | OFP ADDNL ATC/NOTAM TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PAX ZONE 1 | OFP EXTRA OTHER FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PAX ZONE 2 | OFP EXTRA OTHER TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PAX ZONE 3 | OFP ADDNL FOB |  |  |  |  |  |  |  |  |
|  |  |  |  | LS POTABLE WATER 1 | MIN DIV FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  | LS POTABLE WATER 2 | MIN DIV TIME |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PANTRY CODE | LOST FOR EXTRA |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PANTRY EFFECT 1 |  |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PANTRY EFFECT 2 | OFP REMAIN |  |  |  |  |  |  |  |  |
|  |  |  |  | LS NOTOC YN | OFP STANDARD REMAIN |  |  |  |  |  |  |  |  |
|  |  |  |  | LS PREPARED BY |  |  |  |  |  |  |  |  |  |
|  |  |  |  | LS CARGO | OFP DOW |  |  |  |  |  |  |  |  |
|  |  |  |  | LS MAIL | OFP PAYLOAD |  |  |  |  |  |  |  |  |
|  |  |  |  | LS BAG WEIGHT | OFP ZFW |  |  |  |  |  |  |  |  |
|  |  |  |  | LS O | OFP ZFW MAX |  |  |  |  |  |  |  |  |
|  |  |  |  | LS T | OFP TOF |  |  |  |  |  |  |  |  |
|  |  |  |  | LS E | OFP TOW |  |  |  |  |  |  |  |  |
|  |  |  |  | LS FUEL DENSITY | OFP TOW MAX |  |  |  |  |  |  |  |  |
|  |  |  |  | LS NOTE | OFP LDW |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP LDW MAX |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP PERFORMANCE FACTOR |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP MEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT LAT |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT LON |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT SAP |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT ELTME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT DIST |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT ISA |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT MORA |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT WC |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT FL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT FOB |  |  |  |  |  |  |  |  |
|  |  |  |  |  | OFP EDTO CRITICAL POINT COND |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DECISION POINT |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL ROUTE |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL FINAL DEST |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL ENROUTE DEST |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL FUEL DIFF |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL TRIP FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL TRIP TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL CONT PERCENT |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL CONT ARPT |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL CONT FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL CONT TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL ALTN FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL ALTN TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL FINAL RES FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL FINAL RES TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL MIN SECTOR FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL MIN SECTOR TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL TAKE OFF FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL TAKE OFF TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL TAXI FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL TAXI TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL BLOCK FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL BLOCK TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO FNL DEST TRIP FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO FNL DEST TRIP TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO FNL DEST MINCONT FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO FNL DEST MINCONT TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO FNL DEST MINCONT |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO FNL DEST PFOB |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO ENR DEST TRIP FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO ENR DEST TRIP TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO ENR DEST CONT PERCENT |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO ENR DEST CONT FUEL |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO ENR DEST CONT TIME |  |  |  |  |  |  |  |  |
|  |  |  |  |  | RCL DP TO ENR DEST PFOB |  |  |  |  |  |  |  |  |

## Aircraft

| Thuộc tính tàu bay, loại tàu bay, nhóm tàu bay |  |  |  |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|
|  |  | BH LBM | BH khuyến nghị định kỳ | BH KH năm | Taxi KH năm | Weight Factor | ĐMNL | KPI Fuel Burn/BH Fuel Burn/RTK | Khác biệt Taxi Fuel Flow | Khác biệt APU Fuel Flow | Performance Factor |
| AC SUbtype (đồng bộ từ Netline) | 32A, 32B, 32C, .... 32X... 35A, 35B 78A, 78B, 78C |  |  |  |  |  |  |  |  |  |  |
| Aircraft Type | A320 A321 A350 B787 ATR |  |  | x | x |  |  |  |  |  | x |
| Aircraft Category 1 | A320NEO A321 CEO A321 NEO A350 B787-9 B787-10 |  |  |  |  |  |  |  | x | x |  |
| Aircraft Category 2 | A320 A321 CEO A321 NEO A350 B787 |  |  |  |  | x |  | x |  |  |  |
| Aircraft Category 3 | A320-A321 A350 B787 |  |  |  |  |  |  |  |  |  |  |
| Aircraft Category 4 | A320-A321 A350-B787 | x | x |  |  |  |  |  |  |  |  |
| Aircraft Category 5 | 320 32B 32D 32N 350 787 |  |  |  |  |  | x |  |  |  |  |
| Aircraft Category 6,7,8,9.10 | dự phòng |  |  |  |  |  |  |  |  |  |  |
| ICAO code |  |  |  |  |  |  |  |  |  |  |  |
| IATA code |  |  |  |  |  |  |  |  |  |  |  |

## Yêu cầu chung

|  | Có cơ chế đồng bộ hệ thống TEST lấy các dữ liệu PROD |
|---|---|
|  | Tất cả tìm kiếm, filter, nhập liệu mặc định chữ hoa |
|  | Không có tình trạng dropdown box quay chờ load thêm (như khi chọn CQĐV của MO Plus) |
|  | Một cấu hình chung các trường hiển thị tại mỗi màn hình của TBT (quản lý CB tổng hợp), DSP, CLC do admin thiết lập chung (ăn với tất cả user) Ngoài ra user có thể lựa chọn các trường thông tin riêng theo mong muốn |
|  |  |
|  | Migrate hoàn toàn dữ liệu Netline hiện nay |
|  |  |
|  |  |
|  |  |
|  | Thông báo CĐS, các CQĐV về nhu cầu tích hợp dữ liệu với Flight Ops (phương thức kết nối hiện tại, các trường dữ liệu/ thông tin, hệ thống có nhu cầu sử dụng) |
|  | Hiển thị dữ liệu bảng nhỏ kiểu title - value dạng tile bên trái, value bên phải cho dễ quan sát (giống VNeID). Như MO Plus chỗ user - khó quan sát |
|  | Báo cáo tỷ lệ dữ liệu định kỳ đối với tất cả các dữ liệu tích hợp |
| Giao diện | Có Darkmode/ Light Mode Phiên bản web mobile có trên cả điện thoại/ iPad |
| Bố trí báo cáo: | Standard Filter Thêm bộ lọc riêng của báo cáo nếu cần thiết Khu vực biểu đồ Khu vực bảng dữ liệu chi tiết (mỗi báo cáo chi tiết các dữ liệu, đầu vào, tính toán của riêng báo cáo đó). Cho phép chọn thêm cột dữ liệu vào báo cáo data chi tiết (các cột thuộc FOS) Các dữ liệu cơ sở thì để ở FOS report |
|  |  |
|  |  |
|  | Tự động gửi những báo cáo thường kỳ (ms trang đang thực hiện) |
|  | Rà soát các vấn đề An đang tự code đưa vào hết |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  | Số hóa, bóc tách toàn bộ OFP, kể cả những thông tin không yêu cầu trong báo cáo FOS |
|  | Cho phép điều chỉnh độ rộng cột trên web (tương tự web ACDM). Khi refresh trang vẫn giữ độ rộng đã kéo |

## Logic tính toán

|  |  |  |
|---|---|---|
| STT | Thông số | Logic |
|  | Actual Remaining Fuel | Ưu tiên lần lượt như sau: - ACARS ON FUEL - QAR ON FUEL |
|  | Standard OFP Remaining Fuel | Cont Fuel + Dest Alt Fuel + Final Reserve |
|  | Actual Trip Fuel | Ưu tiên lần lượt như sau: - ACARS OFF FUEL - ACARS ON FUEL  - QAR OFF FUEL - QAR ON FUEL |
|  | Techlog uplift FOB | Tích hợp từ AMOS (remaining after uplift) Ý nghĩa: nhiên liệu có trên tàu bay sau khi uplift |

## TASK

| STT | Nội dung | Chi tiết | Phụ trách |  |  | Trạng thái | Ngày |  |
|---|---|---|---|---|---|---|---|---|
|  |  |  | VNA | VTIT | CĐS |  |  |  |
| 0 | Slide kick-off |  | x | x |  |  |  | https://docs.google.com/spreadsheets/d/1nTu5UNxrXhJb87chJEFJycmUpgvXK39K/edit?gid=180635161#gid=180635161 |
| 1 | QĐ OCC Tổ giúp việc triển khai | Chờ TP duyệt VB trên SkyOffice | x |  |  | Hoàn thành | 04/06/2026 |  |
| 2 | Ttr giao nhiệm vụ các CQĐV |  | x |  |  | Hoàn thành | 05/06/2026 |  |
| 3 | Lập danh mục các dữ liệu sẽ tích hợp vào TOSS | Phân loại nguồn tích hợp từ DWH hoặc trực tiếp tới hệ thống nguồn | x | x |  |  |  |  |
| 4 | YC CĐS cung cấp các dữ liệu hiện nay có ở DWH |  | x |  | x |  |  |  |
| 5 | YC CĐS cung cấp hạ tầng UAT |  | x |  | x |  |  |  |
| 6 | YC CQĐV cung cấp đầu mối phối hợp | Đã gửi email | x |  |  |  |  |  |
| 7 | Khảo sát website Boeing, Airbus về các báo cáo có thể lấy được để import |  | x |  |  |  |  |  |
| 8 | Set up thông UAT và TEST LHS |  |  |  |  |  | 30/06/2026 |  |
| 9 |  |  |  |  |  |  |  |  |
| 10 |  |  |  |  |  |  |  |  |
| 11 |  |  |  |  |  |  |  |  |
| 12 |  |  |  |  |  |  |  |  |
| 13 |  |  |  |  |  |  |  |  |
| 14 |  |  |  |  |  |  |  |  |
| 15 |  |  |  |  |  |  |  |  |
| 16 |  |  |  |  |  |  |  |  |
| 17 |  |  |  |  |  |  |  |  |
| 18 |  |  |  |  |  |  |  |  |
| 19 |  |  |  |  |  |  |  |  |
| 20 |  |  |  |  |  |  |  |  |
| 21 |  |  |  |  |  |  |  |  |
| 22 |  |  |  |  |  |  |  |  |
| 23 |  |  |  |  |  |  |  |  |
| 24 |  |  |  |  |  |  |  |  |
