---
source: "TOSS - Triển khai-YCKT.xlsx · sheet 4"
document_type: "YCKT decomposition — per sheet"
date: "2026-06-09"
---

# Sheet 4: YCKT V3

> Nguồn: TOSS - Triển khai-YCKT.xlsx · sheet 4 · 478 dòng. Quay lại [INDEX](INDEX.md).

1. YÊU CẦU KỸ THUẬT HỆ THỐNG TỐI ƯU ĐIỀU HÀNH KHAI THÁC (TOSS)
2. STT | Tiêu chí yêu cầu | Chức năng | Filter/ Button | Chi tiết/ Kết quả | Biểu đồ | Logic tính toán
3. T | Yêu cầu chung
4. 1.0 | Yêu cầu về kiến trúc, công nghệ
5. TOSS-001 | Kiến trúc hệ thống được xây dựng hướng Microservices dựa trên Cloud Native do tổ chức điện toán thuần đám mây (CNCF - Cloud Native Computing Foundation) cung cấp. Yêu cầu NCC có kinh nghiệm phát triển & triển khai hệ thống dựa trên Cloud Native, có evidence (tài liệu thiết kế, triển khai… hệ thống từng thực hiện) để chứng minh
6. TOSS-002 | Tất cả các module/component trong kiến trúc được thiết kế và mô tả chi tiết: Chức năng component, Đầu vào, đầu ra, Interface. Mối quan hệ giữa các module/ component trong kiến trúc được mô tả thông qua diagram. Yêu cầu NCC có kinh nghiệm thiết kế hệ thống theo yêu cầu trên, có evidence (tài liệu thiết kế, triển khai… hệ thống từng thực hiện) để chứng minh.
7. TOSS-003 | Các công nghệ sử dụng được liệt kê đầy đủ, giải thích cụ thể lý do lựa chọn công nghệ.
 - Tên công nghệ
 - Phiên bản sử dụng
 - Mục đích sử dụng
8. TOSS-004 | Đảm bảo các yêu cầu về license:
+ Hệ thống không sử dụng các thư viện, phần mềm vi phạm bản quyền. Không sử dụng dạng trial khi triển khai chính thức hệ thống.
+ Khi sử dụng license, NCC chịu cung cấp và chịu trách nhiệm 100% đối với license cho hệ điều hành, công cụ lập trình, hệ cơ sở dữ liệu, font chữ và license các phần mềm cần thiết xuyên suốt thời gian cung cấp cho bên sử dụng.
9. TOSS-005 | Hệ thống có khả năng dễ dàng scale về phần cứng, app, DB mà không cần phải có thời gian downtime hệ thống.
10. TOSS-006 | Các tầng của ứng dụng phải được phân tách một cách độc lập, các tầng có thể chỉnh sửa một cách độc lập mà không ảnh hưởng tới các tầng khác: tầng giao diện, tầng nghiệp vụ, tầng dữ liệu.
11. TOSS-007 | Các module được phân tách một cách độc lập về dữ liệu, về nghiệp vụ, đảm bảo dữ liệu và nghiệp vụ một module không bị ảnh hưởng khi dữ liệu và nghiệp vụ của các module khác thay đổi.
12. TOSS-008 | Đối với các module phục vụ trực tiếp người dùng: Khi restart module không được ảnh hưởng đến người dùng. Phải có node dự phòng khi restart, đảm bảo dịch vụ không gián đoạn.
13. 2.0 | Yêu cầu về bảo mật, an toàn, an ninh thông tin
14. TOSS-009 | NCC đảm bảo an toàn thông tin phần ứng dụng như: source code, chức năng, giao diện… Yêu cầu NCC chứng minh năng lực, evidence nếu có
15. TOSS-010 | Cam kết bảo mật theo quy định ANTT của TCTHK. Cam kết tuân thủ quy định đánh giá ANTT của TCTHK
16. TOSS-011 | Cam kết bảo mật thông tin theo Quy định về dữ liệu trên không gian mạng phải lưu trữ tại Việt Nam theo nghị định 53/2022/NĐ-CP.
17. TOSS-012 | Tuân thủ Nghị định 13/2023/NĐCP về bảo vệ dữ liệu cá nhân
18. TOSS-013 | NCC không chia sẻ dữ liệu hoặc kết nối với bất kỳ bên nào nếu chưa có sự cho phép của TCT
19. 3.0 | Yêu cầu về độ tin cậy hệ thống
20. TOSS-014 | Toàn bộ các thành phần hệ thống phải được giám sát
21. TOSS-015 | Hệ thống có khả năng đáp ứng khi tải người dùng có thay đổi
22. TOSS-016 | Có cơ chế đảm bảo khả năng sẵn sàng cho từng thành phần và toàn bộ hệ thống
23. TOSS-017 | Cung cấp khả năng từ chối yêu cầu theo ngưỡng
24. TOSS-018 | Thiết kế giải pháp tự động phát hiện và điều tiết lưu lượng
25. TOSS-019 | Có sự phân tách sử dụng tài nguyên giữa các thành phần như: ứng dụng, Database, log…
26. 4.0 | Quản lý phân quyền tập trung, xác thực người dùng
27. TOSS-020 | 1. Quản trị người dùng, xác thực và phân quyền chi tiết theo từng phân hệ, dịch vụ
• Hệ thống cho phép quản lý toàn bộ vòng đời người dùng, bao gồm: tạo mới, sửa thông tin, vô hiệu hóa, kích hoạt lại, và xóa người dùng.
• Mỗi người dùng được gán vai trò (role) hoặc nhóm quyền (group). Vai trò này được ánh xạ với tập hợp quyền truy cập (permissions) vào các module, phân hệ, dịch vụ hoặc API riêng biệt trong hệ thống.
• Cho phép định nghĩa các chính sách quyền truy cập động (dynamic access policies) như hạn chế quyền theo thời gian, hoặc trạng thái phiên làm việc.
• Có khả năng cung cấp quyền người dùng theo thời gian thực (real-time permission) để đảm bảo không truy cập sai phạm hoặc vượt quyền.
• Yêu cầu xác thực đa yếu tố hoặc xác thực 2 bước (MFA/2FA) ít nhất cho nhóm quản trị viên
28. Phân quyền theo Carrier, sân bay, tàu bay
29. TOSS-021 | 2. Mở rộng xác thực và phân quyền ra các hệ thống bên ngoài
• Hệ thống được thiết kế theo kiến trúc dịch vụ xác thực độc lập (authentication service), cho phép các hệ thống khác tích hợp và sử dụng các dịch vụ
• Có thể tích hợp với hệ thống LDAP, Active Directory, hoặc các hệ thống quản lý danh tính (IAM) khác.
• Cho phép cấp quyền truy cập cho hệ thống bên ngoài theo các policy định nghĩa sẵn, hoặc phân quyền riêng biệt ở từng hệ thống tích hợp.
• Có thể sử dụng cơ chế token-based authentication như JWT để đảm bảo hiệu suất và bảo mật cao trong môi trường phân tán/microservices.
30. TOSS-022 | 3. Hỗ trợ Single Sign-On (SSO) và quản lý phân quyền liên hệ thống
• Một tài khoản duy nhất (SSO) có thể truy cập đồng thời nhiều hệ thống hoặc ứng dụng khác nhau mà không cần đăng nhập lại hoặc tạo tài khoản riêng lẻ.
• Phân quyền được quy hoạch tập trung theo từng hệ thống – người dùng có thể có các vai trò khác nhau trên từng hệ thống.
• Có giao diện quản trị tập trung (centralized admin portal) để cấu hình, theo dõi hoạt động, phân quyền và kiểm soát truy cập liên hệ thống.
• Hệ thống có khả năng log và audit chi tiết mọi hành vi đăng nhập, thay đổi quyền, hoặc truy cập tài nguyên – phục vụ kiểm toán, bảo mật và phân tích rủi ro.
31. TOSS-023 | Hỗ trợ quản lý phiên làm việc (session management) và kiểm soát truy cập theo thời gian thực
Cho phép tạo quyền truy cập tạm thời (có thời hạn) cho người dùng theo dự án hoặc chiến dịch đặc biệt, tự động thu hồi khi hết hạn.
32. 5.0 | Yêu cầu về danh mục hệ thống
33. TOSS-024 | 1. Hệ thống cho phép quản trị danh mục hệ thống trên một module, phân hệ hoặc dịch vụ riêng biệt
• Cấu trúc metadata chuẩn cho từng danh mục
• Hỗ trợ phân loại danh mục (theo lĩnh vực, nghiệp vụ, hệ thống sử dụng) để dễ quản lý
• Versioning và lịch sử thay đổi (ai thay đổi, khi nào, nội dung gì)
34. TOSS-025 | 2. Có khả năng cung cấp dữ liệu về danh mục cho các hệ thống khác theo phân quyền được thiết lập thông qua API hoặc webhook khi có thay đổi dữ liệu
35. TOSS-026 | 3. Có chức năng thiết lập phân quyền truy cập dữ liệu về danh mục theo hệ thống
36. 6.0 | Yêu cầu khác
37. TOSS-027 | Log phải được lưu trữ tập trung giúp giám sát, kiểm soát và xử lý sự cố hiệu quả trong toàn hệ thống.
• Hệ thống có khả năng thu thập, phân tích và hiển thị log từ nhiều dịch vụ khác nhau.
• Phân loại log theo hệ thống, mức độ và cấp quyền theo vai trò người dùng.
38. TOSS-028 | Truyền tải file cần được xử lý tối ưu hóa giúp Tăng tốc độ, giảm độ trễ và độ tin cậy khi truyền tải các tệp lớn trong hệ thống.
• Nén dữ liệu: Sử dụng các kỹ thuật nén như gzip hoặc zip để giảm kích thước file trước khi truyền
• Truyền dữ liệu song song (Parallel Transfer): Chia nhỏ file và truyền đồng thời nhiều phần
39. TOSS-029 | Ứng dụng CI/CD trong việc phát triển và triển khai, nâng cấp hệ thống giúp tự động hóa quy trình phát triển, thử nghiệm và triển khai phần mềm để giảm thiểu lỗi và tăng tốc độ phát hành.
40. TOSS-030 | Tư vấn xây dựng kiến trúc và các tiêu chuẩn cho các hệ thống triển khai tiếp theo để thích hợp với kiến trúc hệ thống này
41. TOSS-031 | Đáp ứng tối thiểu 4000 người sử dụng, sử dụng đồng thời 200
42. TOSS-032 | Các ứng dụng nghiệp vụ tương thích các trình duyệt phổ biến: Microsoft Edge, Google Chrome, Firefox
43. TOSS-033 | Phiên bản ứng dụng mobile với phạm vi chức năng theo yêu cầu tại tiêu chí TOSS0245 tương thích các hệ điều hành iOS, iPadOS, Android
44. TOSS-034 | Ứng dụng phải được nâng cấp để tương thích với các hệ điều hành, trình duyệt trong vòng 30 ngày kể từ ngày hệ điều hành, trình duyệt phát hành phiên bản mới.
45. 7.0 | Dịch vụ vận hành, giám sát
46. TOSS-035 | Có cơ chế vận hành, giám sát tập trung, cảnh báo bất thường, chủ động phát hiện sự cố
47. TOSS-036 | Cung cấp dịch vụ vận hành hệ thống trong vòng 60 tháng kể từ thời điểm golive
48. TOSS-037 | NCC hỗ trợ dịch vụ 24 giờ/ngày, 7 ngày/tuần và 365 ngày/năm, cung cấp đầy đủ thông tin liên quan đến đầu mối liên lạc để tiếp nhận yêu cầu
49. TOSS-038 | Đảm bảo hệ thống được hoạt động một cách hiệu quả và đạt hiệu suất cao.
50. TOSS-039 | Tiếp nhận thông tin sự cố và xử lý các sự cố trong hệ thống. Quản lý sự cố, vấn đề xảy ra trong hệ thống.
51. TOSS-040 | Cung cấp dịch vụ cập nhật, thay đổi hệ thống theo yêu cầu của VNA. Quản lý các yêu cầu thay đổi trong hệ thống.
52. TOSS-041 | Thực hiện các công việc liên quan tới quản trị, cấu hình, cập nhật tài nguyên lên hệ thống phần mềm và các phân hệ liên quan
53. TOSS-042 | Hỗ trợ, phối hợp với các đơn vị liên quan để đảm bảo hoạt động trong quá trình vận hành
54. TOSS-043 | Cập nhật, nâng cấp phiên bản, bản vá khi có khuyến cáo.
55. TOSS-044 | Tư vấn và đưa ra giải pháp hạn chế hoặc khắc phục được các lỗi kỹ thuật của hệ thống
56. TOSS-045 | Báo cáo vận hành hệ thống định kỳ, báo cáo sự cố bất thường
57. 8.0 | Hạ tầng và Định cỡ hệ thống (sizing)
58. TOSS-046 | Nhà cung cấp xây dựng và triển khai phần mềm hệ thống trên hạ tầng Cloud của VNA cung cấp
59. TOSS-047 | Hệ thống bao gồm các môi trường hệ thống chính (Prod), hệ thống phát triển/ kiểm thử (Dev/Test) và hệ thống dự phòng (Standby, Backup)
60. TOSS-048 | Nhà cung cấp đảm bảo tính sẵn sàng cao ( High Availability ) cho hệ thống bằng cơ chế active-active hoặc active-standy( việc chuyển đổi giữa active và standby không quá 1h)
61. TOSS-049 | Giám sát hoạt động của hệ thống trên hạ tầng Cloud của VNA và khuyến cáo cho VNA các vấn đề liên quan đến hạ tầng
62. TOSS-050 | Định cỡ hạ tầng Cloud để triển khai hệ thống do VNA cung cấp theo Mục 1, phụ lục 2 đính kèm
63. TOSS-051 | Kiến trúc hệ thống cho phép mở rộng theo thời gian
64. 9.0 | Yêu cầu bàn giao hệ thống
65. TOSS-052 | Cam kết dữ liệu, đặc tả yêu cầu, thiết kế chi tiết, mã nguồn và đặc tả mã nguồn hệ thống thuộc quyền sở hữu của Vietnam Airlines
66. TOSS-053 | Cung cấp đầy đủ tài liệu hệ thống: mô tả công nghệ sử dụng, đặc tả yêu cầu, thiết kế kiến trúc tổng thể, thiết kế chi tiết, mã nguồn và đặc tả mã nguồn hệ thống
67. TOSS-054 | Cung cấp tài liệu hướng dẫn sử dụng phần mềm, ứng dụng. Tổ chức các lớp đào tạo, hướng dẫn sử dụng, chuyển giao công nghệ cho đội ngũ quản trị và các đối tượng người dùng khác nhau
68. TOSS-055 | Bàn giao source code (mã nguồn) cho TCTHK sau khi hết thời gian thuê dịch vụ phần mềm
69. 10.0 | Thời gian triển khai
70. TOSS-056 | Thời gian triển khai hệ thống: Triển khai toàn bộ các yêu cầu kỹ thuật trong vòng tối đa 09 tháng kể từ thời điểm Hợp đồng có hiệu lực.
Trong thời gian triển khai, NCC cam kết sắp xếp ít nhất 01 nhân sự onsite tại trụ sở VNA để hỗ trợ tại chỗ.
71. TOSS-057 | Thời gian thuê dịch vụ: 60 tháng kể từ ngày Ký biên bản nghiệm thu và đưa hệ thống vào sử dụng
72. B | Tích hợp dữ liệu và Quản lý danh mục
73. 11.0 | Yêu cầu
74. TOSS-058 | Hệ thống cần có API Gateway làm trung gian
 - Đảm bảo tất cả ứng dụng và dịch vụ bên ngoài truy cập qua Gateway, tránh gọi trực tiếp backend
 - Hỗ trợ bảo mật, phân phối tải, cấu hình chính sách (throttling, giám sát, kiểm soát truy cập) linh hoạt
75. TOSS-059 | Hệ thống cần phải giám sát & kiểm soát dữ liệu
 - Kiểm soát dữ liệu vào/ra bằng xác thực nâng cao (OAuth2, JWT, IP validation).
 - Ngăn chặn truy cập bất thường, tấn công bot/IP đáng ngờ qua nhiều lớp bảo mật.
76. TOSS-060 | Hệ thống cho phép theo dõi & cung cấp báo cáo hiệu suất
- Thu thập thống kê truy cập, lỗi, thời gian phản hồi và chỉ số bảo mật
- Phân tích hành vi bất thường, cảnh báo sớm sự cố
77. TOSS-061 | Hệ thống cho phép cấu hình động, đảm bảo không gián đoạn dịch vụ
- Thay đổi cấu hình API, bảo mật, giới hạn lưu lượng mà không cần dừng hệ thống
- Quản lý qua giao diện trực quan, hỗ trợ cập nhật tự động
78. TOSS-062 | Hệ thống cần phải quản lý được vòng đời API, hỗ trợ thiết kế, triển khai, versioning, bảo trì, cập nhật và ngừng API hiệu quả
79. TOSS-063 | Hệ thống cần phải đảm bảo hoạt động ổn định, tương thích với công nghệ cũ và thay đổi mới
80. TOSS-064 | Hệ thống phải có khả năng mở rộng: cung cấp API, plugin, tích hợp AI/ML hoặc công cụ phân tích dữ liệu bên ngoài. Đảm bảo phát triển thêm tối thiểu 10 giao tiếp dữ liệu giữa các hệ thống trong thời gian cung cấp dịch vụ không phát sinh chi phí
81. 12.0 | Tích hợp các nguồn dữ liệu
82. 12.1 | Tích hợp thông tin với các hệ thống
83. TOSS-065 | Cung cấp và đồng bộ dữ liệu của hệ thống cho Kho dữ liệu dùng chung của TCT (DWH/Lakehouse) để phục vụ chia sẻ, khai thác và phân tích dữ liệu
84. TOSS-066 | Flight Ops System (Netline hoặc hệ thống tương lai): đóng vai trò phần mềm trung gian trao đổi dữ liệu (Adapter, Middleware) vào ra cho hệ thống Flight Ops
85. TOSS-067 | Flight Scheduling System: lịch bay mùa, thay đổi lịch dưới mùa qua các format điện SSIM, ASM, SSM | Kết nối SFTP
86. TOSS-068 | AVES: thông tin phi công, tiếp viên và lịch bay phi công, tiếp viên
87. TOSS-069 | Crew Trip: thông tin chi phí khách sạn và xe chở tổ bay
88. TOSS-070 | MO Plus: dữ liệu do MO Plus quản lý phục vụ báo cáo, xem tài liệu Library cần thiết
89. TOSS-071 | MRO/ AMOS: lịch bảo dưỡng tàu bay, hỏng hóc, MEL/CDL, techlog và các thông tin kỹ thuật khác
90. TOSS-072 | TIMS: thông tin khối kỹ thuật
91. TOSS-073 | eTechlog: Flight Log, Defect log, bảo dưỡng, dữ liệu kỹ thuật máy bay, hạn định bảo dưỡng,
92. TOSS-074 | Amadeus PSS (1A): thông tin hành khách, config tàu bay, config mở bản | Config, block, pax total
chi tiết thông tin hành khách (PM) phục vụ web KN
93. TOSS-075 | Flight Planning System: kế hoạch bay, gói tài liệu chuyến bay, thông tin lập kế hoạch bay, đường bay
94. TOSS-076 | Lido mPilot
95. TOSS-077 | Adapter Lido: kế hoạch bay, gói tài liệu chuyến bay, thông tin lập kế hoạch bay, đường bay
96. TOSS-078 | Hệ thống VMS của VIAGS: thông tin khai thác tại sân bay
97. TOSS-079 | FM, Lotus Airport, PTS (Hệ thống thông tin dịch vụ mặt đất)
98. TOSS-080 | ACDM: Milestone times, vị trí, trạng thái chuyến bay, thông tin điều phối mặt đất, điều phối không lưu, năng lực khai thác sân bay, cảnh báo và phân tích hiệu suất
99. TOSS-081 | RPS, các hệ thống quản trị chi phí, lợi nhuận của VNA
100. TOSS-082 | ANCM: chi phí điều hành bay, bay qua, hạ cất cánh
101. TOSS-083 | Cargo Spot: thông tin hàng hóa cho chuyến bay
102. TOSS-084 | DCS: thông tin phục vụ hành khách
103. TOSS-085 | Flight Radar24: vị trí máy bay, hành trình bay
104. TOSS-086 | Flight Watch: dữ liệu thời tiết, dự báo theo đường bay, theo dõi chuyến bay
105. TOSS-087 | Hệ thống tiết kiệm nhiên liệu: kết quả thực hiện của từng giải pháp với từng chuyến bay
106. TOSS-088 | EGS - Hệ thống báo cáo phát triển bền vững
107. TOSS-089 | Chuyển dữ liệu cho WNI
108. TOSS-090 | Chuyển dữ liệu cho Cirium
109. TOSS-091 | Chuyển dữ liệu cho SPECTRA
110. TOSS-092 | ETS - Quản lý Khí thải
111. TOSS-093 | Chuyển dữ liệu cho Hệ thống Quản lý hợp đồng
112. TOSS-094 | LMS: dữ liệu quản lý chuỗi cung ứng
113. 12.2 | Tích hợp các điện văn/ hệ thống điện văn
114. TOSS-095 | ACARS: điện văn Aircraft Communications Addressing and Reporting System
115. ACARS Fuel Integration by AC Type
(báo cáo tích hợp dữ liệu time/fuel ACARS) | Standard Filter | Kết quả theo từng AC Type theo từng tháng trong giai đoạn được chọn:
Bảng 1: Fls by Month
Bảng 2: ACARS Time Data Coverage
Bảng 3: ACARS Block Fuel Data Coverage
Bảng 4: ACARS Trip Fuel Data Coverage
116. ACARS Fuel Integration by AC Reg
(báo cáo tích hợp dữ liệu fuel ACARS) | Standard Filter | Kết quả theo từng AC Reg theo từng tháng trong giai đoạn được chọn:
Bảng 1: Fls by Month
Bảng 2: ACARS Time Data Coverage
Bảng 3: ACARS Block Fuel Data Coverage
Bảng 4: ACARS Trip Fuel Data Coverage
Tham khảo TEMPLATE Tỷ lệ dữ liệu ACARS
117. ACARS Fuel Reliability All AC | Standard Filter
Min Difference: (cho nhập tỷ lệ 10% sai lệch giữa ACARS OUT FUEL và Fuel Order) | Bảng kết quả:
- AC Type
- AC Reg
- FLS
- ACARS Block Fuel Coverage (tỷ lệ cb có ACARS OUT-IN) (i)
- ACARS Trip Fuel Coverage (tỷ lệ cb có ACARS OFF-ON) (ii)
- ACARS OUT vs Fuel Order > Min (tỷ lệ) (iii)
- Illogical Taxi Out Fuel (iv)
- Illogical Trip Fuel (v)
- Illogical Taxi In Fuel (tỷ lệ bất hợp lý taxi in fuel) (vi)
Quy tắc highlight fill color ô giá trị:
Với 2 tỷ lệ (i) (ii): nếu <=50% sử dụng màu đỏ dịu, càng nhỏ càng đậm. Nếu >50% sử dụng màu xanh lá, càng lớn càng đậm
Với các tỷ lệ từ (iii) đến (vi): sử dụng màu đó dịu, càng bé càng nhạt, càng lớn càng đậm
118. ACARS Fuel Reliability by AC Reg | Standard Filter
(không cho chọn quá 1 AC Reg | Tương tự kết quả trên nhưng mỗi dòng là 1 tháng của Registration được chọn.
Tham khảo mẫu đánh giá độ chính xác ACARS
119. TOSS-096 | SITA TEXT: các điện văn dạng văn bản gửi qua hệ thống SITA
120. TOSS-097 | UCM: Unit Load Control Message
121. TOSS-098 | SSIM: điện văn lịch bay
122. TOSS-099 | ASM: điện văn cập nhật thông tin lịch bay
123. TOSS-100 | Hệ thống AMHS, AFTN: hệ thống trao đổi thông tin hàng không
124. 12.3 | Tích hợp dữ liệu qua email, website, file chia sẻ, nguồn khác
125. TOSS-101 | Dữ liệu LOMS và hệ thống quản lý thông tin an toàn Cassiopee Alpha
126. TOSS-102 | Dữ liệu NOTAM, WX gửi qua email
127. TOSS-103 | Website thời tiết: tự động lấy các bản tin thời tiết, file thời tiết cho chuyến bay
128. TOSS-104 | Bảng kê nhiên liệu của các nhà cung ứng
129. TOSS-105 | Migrate dữ liệu từ hệ thống FIMS: cơ sở dữ liệu lịch bay, kế hoạch bay, các dữ liệu FIMS đã tích hợp liên quan đến chuyến bay
130. TOSS-106 | Tích hợp AD để xác thực truy cập
131. TOSS-107 | Tích hợp các hệ thống khác phục vụ xây dựng các chức năng thuộc hồ sơ yêu cầu kỹ thuật này. Có cơ chế tích hợp chủ động ngay khi phát sinh dữ liệu, không chỉ đồng bộ theo tần suất
132. Overflight Permit API | API nhận phép bay qua từ hệ thống quản lý phép bay, vừa phép bay mùa và phép bổ sung (xây dựng chờ sẵn)
133. Slot and Takeoff/ Landing Permit API | API nhận Slot, phép cất hạ từ hệ thống quản lý phép bay, vừa slot mùa, vừa slot bổ sung (xây dựng chờ sẵn)
134. 12.4 | Dịch vụ dữ liệu
135. TOSS-108 | Cung cấp dịch vụ dữ liệu cho các hệ thống theo yêu cầu qua các giao tiếp lập trình
136. TOSS-109 | API và các giao diện phần mềm cung cấp lịch bay, cung cấp dữ liệu khai thác cho hệ thống khác
137. API cung cấp thông tin báo cáo FOS cho các hệ thống | Có thể truyền các trường thông tin cần lấy và trả ra dữ liệu 
Thông tin chuyến bay truyền vào: theo leg_no hoặc theo (AC Reg, DEp, ARR, FLT date, FLTNO)
138. API cung cấp Fuel - Weight - Time từ MO Plus cho các hệ thống | Cung cấp:
- Thông tin CB để ghép (leg_no, AC REG, DEP, ARR, DEP_DT, ARR_DT)
- Toàn bộ bảng Fuel Analysis KHB (cá giá trị OFP và giá trị correct)     
- Fuel Order Extra fuel reason
- Toàn bộ bảng Weight Information

check xem API FIMS đang lấy dữ liệu từ MO Plus có thêm trường nào không
139. API cung cấp thời tiết sân bay cho Quản trị EFB | Tham số:
- Sân bay
- From Date
- To Date | Trao đổi với FOE về kết quả mong muốn
140. Aircraft API | - AC Registration | Trả về thông tin về tàu bay, trong đó có:
- Các thuộc tính tàu bay
- PF mới nhất hiện đang áp dụng
141. API giao tiếp MO Plus | Gửi trạng thái Dispatch Release
Flight Release
Confirm Document
142. API cung cấp gói tài liệu chuyến bay | Gói tài liệu chuyến bay version cuối cùng của mỗi chuyến bay.
Có tham số chỉ rõ lấy những tài liệu gì.
Có xác thực/ phân quyền cho tài khoản lấy được những tài liệu gì
143. API đẩy tài liệu Library vào Draft cho từng phân hệ tài liệu
144. API đẩy tài liệu Notices vào Draft
145. 12.5 | Giám sát các nguồn dữ liệu
146. TOSS-110 | Có giao diện cho người quản trị hệ thống giám sát được tổng quan các luồng dữ liệu vào/ ra và tình trạng
147. TOSS-111 | Loại dữ liệu/ nguồn
148. TOSS-112 | Hệ thống nguồn dữ liệu/ hệ thống được cập nhật dữ liệu
149. TOSS-113 | Ngày cập nhật lần cuối
150. TOSS-114 | Quản lý các luồng dữ liệu vào
151. Gửi email báo cáo tỷ lệ dữ liệu hàng tuần | Đối với từng tàu bay:
- Tỷ lệ CB nhận được email Performance
- Tỷ lệ CB có ACARS OUT FUEL
- Tỷ lệ CB có ACARS OFF FUEL
- Tỷ lệ CB có ACARS ON FUEL
- Tỷ lệ CB có ACARS IN FUEL
- Tỷ lệ CB có dữ liệu OFP
- Tỷ lệ CB có dữ liệu QAR
- Tỷ lệ CB có dữ liệu booking
- Tỷ lệ CB có dữ liệu pax thực
- Tỷ lệ CB có dữ liệu tổ bay
- Tỷ lệ CB có dữ liệu Load sheet
152. TOSS-115 | Quản lý các luồng dữ liệu ra
153. 13.0 | Hệ thống quản lý dữ liệu
154. TOSS-116 | Hệ thống cần đáp ứng quản trị dữ liệu với quy mô lớn
 - Yêu cầu phải quản lý vòng đời dữ liệu (bao gồm: thu thập, lưu trữ, xử lý, loại bỏ dữ liệu) theo chuẩn bảo mật
 - Hỗ trợ phân loại, gắn nhãn, phân mảnh dữ liệu và quản lý metadata tập trung
155. TOSS-117 | Hệ thống được xây dựng theo kiến trúc mở rộng linh hoạt
- Hỗ trợ mở rộng ngang (thêm node) và dọc (tăng tài nguyên node)
- Tích hợp dễ dàng nguồn dữ liệu mới qua Rest API, SOAP API, gRPC, Kafka, JDBC…
156. TOSS-118 | Hệ thống cần đáp ứng lưu trữ & phân tầng dữ liệu
- Lưu trữ dữ liệu thô và đã xử lý tách biệt, định dạng tối ưu (Parquet, Delta Lake…)
- Phân tách tầng lưu trữ và tầng xử lý để dễ mở rộng, tối ưu hiệu năng
157. TOSS-119 | Hệ thống cho phép xử lý dữ liệu Batch & Streaming
- Batch: ETL định kỳ cho khối lượng lớn
 - Streaming: Xử lý gần thời gian thực với Kafka, Spark Streaming…
158. TOSS-120 | Hệ thống có khả năng tối ưu sử dụng tài nguyên theo khối lượng dữ liệu đảm bảo lưu trữ, tính toán và tính sẵn sàng cao
159. TOSS-121 | Hệ thống cần đáp ứng đa dạng các loại dữ liệu
- Hỗ trợ dữ liệu có cấu trúc (SQL), bán cấu trúc (JSON, XML, logs), phi cấu trúc (video, hình ảnh, âm thanh, IoT)
- Cung cấp môi trường xử lý và lưu trữ toàn diện cho tất cả loại dữ liệu
160. Quản lý thông tin theo chức năng riêng, không phải danh mục | 14.0 | Quản lý Tàu bay
161. 14.1 | Quản lý thông tin tàu bay
162. TOSS-122 | Thông tin chung về tàu bay: số đăng ký, loại tàu bay theo mã ICAO/ mã IATA, thông tin tải trọng, chủ sở hữu, hình thức thuê/mua, giới hạn Flight Cycle (FC), và các thông tin cơ bản khác | Thuộc tính | Mỗi AC Reg có các thuộc tính:
AC Subtype (đồng bộ từ Netline)
Aircraft Type (A320, A321, A350, B787)
Các Aircraft Category theo mô tả chi tiết

Taxi fuel flow
APU fuel flow
Tank capacity
ACARS fuel unit
ACARS fuel multiplier (hệ số nhân với FOB của ACARS ra kg)

MTOW
Config C
Config W
Config Y

Ownership Status (Wet Leased, Dry Leased, Owned)
Owner
163. TOSS-123 | Thông tin hiệu lực khai thác của tàu bay theo từng giai đoạn: ngày hiệu lực, ngày hết hiệu lực | Mỗi tàu có thể in/out nhiều lần. 
Quản lý các lần in/out
Ac Reg
Valid From (ngày in)
Valid To (ngày out, có thể null vì chưa xác định)
164. TOSS-124 | Quản lý lịch bảo dưỡng ngắn hạn và dài hạn, lịch AOG đột xuất và thời gian khắc phục dự kiến.
165. TOSS-125 | Cảnh báo tàu bay sắp hết FC
166. TOSS-126 | Quản lý các bất thường liên quan đến tàu bay, ví dụ vấn đề kỹ thuật, chim va, các vấn đề khác | Lấy từ web
167. AC APU INOP | Quản lý, khai báo tàu bay hỏng APU
- AC REG
- From date time
- To date time (có thể chưa xác định)

Các hiệu lực này để cảnh báo các tàu bay hỏng APU không được khai thác đến các sân bay không cung cấp GPU/GPS/ASU
168. TOSS-127 | Tình trạng tàu bay: APU, Packs
169. MEL/CDL | Xem danh sách MEL, CDL hiệu lực theo tàu bay. 
Xem lịch sử MEL/CDL của tàu bay
170. 14.2 | Quản lý MEL, CDL, defect
171. TOSS-128 | Quản lý Master MEL | Data Maintenance/ MEL Policy | Tự động đọc file xml MEL (cùng file gửi sang AMOS) để lấy danh mục MEL cho từng đội tàu bay, các quy định interval, Installed, Required, Procedure, điều kiện khai thác (trong đó có list các tàu bay áp dụng)
Trao đổi thêm với Nga FOE nhóm MEL về việc các Corrections.

Lido 4D đang nhận qua file CSV (tham khảo thôi)
172. TOSS-129 | Quản lý, tra cứu, chỉnh sửa, cập nhật thông tin MEL/CDL đồng bộ từ AMOS.
173. TOSS-130 | Cho phép lọc từng nhóm MEL, CDL, defect ảnh hưởng đến phi công/ cockpit, tiếp viên/ cabin, thợ máy
174. TOSS-131 | Tự động hightlight các MEL, CDL, defect mới
175. TOSS-132 | Cho phép ẩn/hiện các MEL, CDL, defect đã hết hạn
176. TOSS-133 | Cho phép người dùng ghi nhận tính chất của từng MEL có ảnh hưởng/không ảnh hưởng đến khai thác
177. TOSS-134 | Cho phép người dùng xem các MEL ảnh hưởng đến khai thác, thực hiện ghi chú, phân loại MEL theo phạm vi ảnh hưởng
178. TOSS-135 | Liên kết và cho phép xem tài liệu MEL hiện hành
179. 14.3 | Quản lý Performance Factor
180. Email, làm file đầu vào.
Xin bộ cài PEP PET POS | TOSS-136 | Cho phép upload file dữ liệu của các đội tàu bay, tính toán peformance factor của các đội tàu bay từ dữ liệu | PF Messages From AC | From Date
To Date
Aircraft Category 1
AC Reg (multiple choice, mặc định chọn tất, cho phép bỏ chọn từng Reg) | Tích hợp với email nhận điện ACARS để tập hợp thành file messate (tham khảo format file message hiện nay)
Cho phép view và download file này. 
Đảm bảo input vào PEP, PET, FOS chạy ok
181. TOSS-137 | Ghi nhận kết quả tính toán theo thời gian hiệu lực mong muốn
182. PF Data Period | Quản lý (thêm, sửa xóa) các kỳ cập nhật PF data, xem danh sách:
- Data Period Label
- Historical From Date (giai đoạn dữ liệu lịch sử dùng để tính toán)
- Historical To Date
183. Import Performance Data | Upload multiple file | Bảng tổng hợp PF từ đầu vào.
Cảnh báo các tàu không có dữ liệu và lấy PF của kỳ trước.
Cho phép correct số liệu
Chọn AC Reg để cập nhật PF (mặc định all)
Chọn Kỳ cập nhật (Data Period)
Chọn khoảng dữ liệu tính toán cho kỳ cập nhật (From Date, To Date)
Lưu trữ PF cập nhật | Các tàu không có số liệu import vào để tính ra PF thì lấy PF ban hành kỳ trước
184. TOSS-138 | Cảnh báo các tàu bay không có dữ liệu tính toán PF
185. TOSS-139 | Tìm kiếm, thống kê PF theo các tiêu chí
186. TOSS-140 | Cho phép xem lịch sử cập nhật PF
187. TOSS-141 | Báo cáo đánh giá, tổng hợp tăng giảm PF từng đội tàu bay, từng tàu bay | Báo cáo theo kỳ cập nhật
188. PF Comparison | Previous Data Period 
Current Data Period
AC Reg (multiple choice, mặc định chọn tất, cho phép bỏ chọn từng Reg) | Bảng PF từng tàu bay theo từng AC Type (format lại để gửi OCD, copy làm CV dùng cùng)
189. PF Trend by AC Type | From Date
To Date
Aircraft Category 2 | Bảng dữ liệu có các cột:
- AC Category (theo Cate2)
- Data Period
- AVG PF | Biểu đồ dây, mỗi Cate 1 dây PF theo từng Data Period. Có đường xu hướng | AVG PF của mỗi AC Cate lấy trung bình PF của các tàu trong Cate
190. PF Trend by AC Reg | From Date
To Date
AC Reg (multiple choice, mặc định ko chọn | Bảng dữ liệu có các cột:
- AC Reg
- Data Period
- PF | Khi chọn 1 AC Reg thì hiển thị biểu đồ dây PF qua từng Data Period của PF đó
191. PF Data Coverage | From Date
To Date
Aircraft Category 2 | Bảng dữ liệu có các cột:
- AC Reg
- Data Period
- PF Data Coverage | PF Data Coverage của 1 tàu của 1 kỳ: tỷ lệ số lượng CB có message PF (qua ACARS) / tổng số CB tàu đó có khai thác của kỳ đó
192. 15.0 | Quản lý Sân bay
193. TOSS-142 | Thông tin chung về sân bay: mã ICAO, IATA, tên sân bay, quốc gia, station contact, các địa chỉ SITA/AFTN/AMHS, loại tàu có khả năng phục vụ và các thông tin cơ bản khác | Thuộc tính sân bay:
- Region (EU, US, NEA, SEA, Domestic/VN....)
- Approach Type sử dụng (để lấy minima)
- GPU/GPU Available (Y/N)
- ASU Available (Y/N)

- Danh sách Terminal, Gate, Parking Stand, Air Bridge
194. TOSS-143 | Quản lý danh mục sân bay dự bị đến
195. TOSS-144 | Quản lý thông tin hạ tầng cất hạ cánh: đường băng, hệ thống hỗ trợ cất hạ cánh, taxiway layout, bãi đỗ
196. TOSS-145 | Quản lý thông tin điều kiện khí tượng và môi trường: Quản lý Minima của sân bay, quản lý tra cứu WX sân bay, đặc điểm địa hình
197. Wether Landing Minima | Quản lý thủ công: mỗi loại Approach type có một số điều kiện tối thiểu
- Approach type (ILS CAT I / II / III hoặc RNAV / VOR / NDB)
- Visibility
198. TOSS-146 | Quản lý quy định khai thác và thủ tục bay: thủ tục cất hạ cánh, tiếp cận (SID, STAR, IAP), giới hạn tiếng ồn, khung giờ cho phép khai thác, quy định về slot/phép bay, quy định khác của nhà chức trách
199. TOSS-147 | Quản lý thông tin phục vụ mặt đất: bãi đỗ, cầu ống lồng, thiết bị điện/khí mặt đất, khả năng nạp nhiên liệu, giá nhiên liệu, chi phí thiết bị mặt đất và các dịch vụ tại sân bay.
200. Parking Stand Information | Quản lý danh sách Parking Stand với từng sân bay
- Airport
- Parking Stand name
- Air Bridge Availability (Yes/No/Undefined)

Có thể phân quyền riêng cho các đầu sân bay cập nhật thông tin này
201. TOSS-148 | Quản lý thông tin an toàn và hạn chế: NOTAM, tình hình an ninh và các thông tin khác
202. TOSS-149 | Quản lý thông tin khai thác thương mại: phí hạ cất cánh, chi phí tiếng ồn, chi phí khác
203. 16.0 | Quản lý chặng bay
204. 16.1 | Thông tin chung
205. TOSS-150 | Thông tin chung: điểm đi/ điểm đến, GCD, GD, cost index, final reserve | Các thông tin chặng bay:
- DEP
- ARR
- Group by FH
- Group for TAT
- Included baggage allowance
- Commercial Config (theo tàu bay, theo giai đoạn)
- Chi phí ĐHB, BQ
- Sân bay dự bị dọc đường
- MCMR (theo giai đoạn thời gian)
206. Included baggage allowance | Quản lý, khai báo trọng lượng hành lý tiêu chuẩn theo từng nhóm đường bay Từ quốc gia... đến quốc gia..., hạng khách
207. Sector Groups by FH | Quản lý, khai báo, định nghĩa các nhóm chặng bay theo giờ bay
- Chọn NĐ/ QT
- Chọn khoảng FH
- Đặt tên nhóm
208. Scheduled TAT | - Quản lý, khai báo TAT tiêu chuẩn theo từng nhóm nối chặng QT TRUNG-QT NGAN, QT NGAN-NOI DIA.....
209. Commercial Config
(Quản lý số ghế mở bán với từng chặng bay) | - Cho phép upload file LBM chi tiết
- Trích xuất số ghế mở bán C/W/Y từng chặng bay, từng giai đoạn thời gian áp dụng, ac subtype
- Cho phép sửa hoặc cập nhật thủ công số ghế mở bản từng hạng theo từng giai đoạn, ac_subtype
210. TOSS-151 | Quản lý thông tin EDTO: có khai thác EDTO không, loại hình EDTO
211. TOSS-152 | Quản lý sân bay dự bị dọc đường theo hình thức khai thác
212. TOSS-153 | Quản lý chi phí MCMR: cho phép upload file thông tin MCMR từng giai đoạn, lưu trữ, tra cứu
213. TOSS-154 | Xem thông tin chi phí điều hành bay, bay qua
214. 16.2 | Quản lý Tankering
215. TOSS-155 | Tính toán, đưa ra khuyến nghị tankering: upload giá nhiên liệu, tính toán hiệu quả tankering dự kiến, lựa chọn khuyến nghị tankering cho giai đoạn cụ thể | Lưu ý giá từ VN đi QT khác giá VN đi NĐ. Cần tính toán cả 2 giá
216. TOSS-156 | Cho phép lựa chọn cập nhật các chặng bay, tàu bay khuyến nghị tankering theo giai đoạn hiệu lực
217. TOSS-157 | Cho phép upload file khuyến nghị tankering gồm các thông tin:
 - Loại tàu bay
 - Chặng bay (một chặng hoặc liên chặng)
 - Ngày bắt đầu áp dụng
 - Ngày dừng áp dụng
 - Hiệu quả chi phí khi tankering 1 tấn nhiên liệu
218. TOSS-158 | Lưu trữ các khuyến nghị tankering theo giai đoạn
219. TOSS-159 | Cho phép xuất dữ liệu khuyến nghị tankering theo chặng bay, tàu bay, giai đoạn hiệu lực
220. TOSS-160 | Báo cáo hiệu quả tankering theo chặng bay, sân bay, giai đoạn
221. TOSS-161 | Báo cáo tankering tổng hợp: lọc theo các tiêu chí, tỷ lệ chuyến bay tankering, tổng lượng nhiên liệu đã tankering, tổng chi phí hiệu quả,
222. TOSS-162 | Báo cáo tankering chi tiết: từng chuyến bay, lượng nhiên liệu đã tankering, chi phí hiệu quả
223. 17.0 | Quản lý danh mục khác
224. TOSS-163 | Quản lý danh mục Phi công, tiếp viên | Chắc thôi, dùng bên MO Plus
225. TOSS-164 | Quản lý danh mục Quốc gia
226. TOSS-165 | Quản lý danh mục FIR
227. TOSS-166 | Quản lý giá nhiên liệu | Fuel Price Management | Quản lý giá nhiên liệu đơn vị USD/tấn tại từng sân bay.
Mỗi sân bay sẽ có kỳ giá khác nhau: 1 tuần, 2 tuần , 1 tháng. 
Việc cập nhật sẽ theo từng sân bay, từng kỳ giá. 
Cho phép upload theo template giá:
- IATA AP CODE
- Fuel Price
- Valid From (ngày hiệu lực)
- Valid To (ngày hết hiệu lực)
Cho phép sửa tay sau khi upload. Trường hợp over lap, lấy giá của lần upload sau
Sử dụng để tính tankering
228. TOSS-167 | Quản lý danh mục ULD | Loại ULD, Từng Serial trong các loại kèm theo thông tin kích thước, trọng lượng, thuộc tính tàu bay và thuộc tính khác
Mỗi chuyến bay tự load ra các loại ULD tương ứng, cho phép nhập số lượng và tự động tính toán trọng lượng
229. TOSS-168 | Quản lý danh sách email nhận các thông báo: với mỗi thông báo tự dộng qua email, cho phép linh hoạt thêm, bớt email cần nhận các thông báo
230. Email list for Data Coverage Report | Danh sách email nhận báo cáo tỷ lệ dữ liệu tích hợp
231. Email list for Daily Operations Report | Danh sách email nhận báo cáo hàng ngày của TBT
232. TOSS-169 | Có cơ chế tổ chức riêng danh mục dùng chung cho các hệ thống và danh mục chức năng nghiệp vụ của hệ thống
233. TOSS-170 | Quản lý các danh mục khác phục vụ xây dựng các chức năng nghiệp vụ nêu tại yêu cầu kỹ thuật này
234. Aircraft Types
(Quản lý loại tàu bay) | Các loại tàu bay: A320, A321, A350, B787, ATR. Thêm sửa xóa, disable
Cho phép gán các tàu bay (Reg) với từng loại.
Quản lý Thuộc tính giới hạn lệch ZFW cho từng loại tàu bay theo từng khoảng thời gian bay (linh động khai báo khoảng thời gian, giới hạn tương ứng)
235. Planned Version
(Quản lý các version sản lượng) | Quản lý (thêm, sửa, xóa) version sản lượng
- Năm 
- Loại (UHT/KH)
- Tên version (do người dùng tự đặt)
- Danh sách chuyến bay sản lượng gồm các thông tin:
    + SECTOR, 
    + AC CARRIER
    + FLT_MONTH
    + FLT_YEAR
    + FLT_TYPES
    + FLS
236. 18.0 | Quản lý tham số hệ thống
237. TOSS-171 | Hệ số độ tin cậy (%) của chuyến bay dùng để tính thời gian bay, nhiên liệu tiêu thụ, mức bay.
238. TOSS-172 | Ngưỡng chênh lệch giữa lượng nhiên liệu phi công yêu cầu nạp và tổng nhiên liệu kế hoạch của chuyến bay theo chặng bay, loại tàu bay.
239. TOSS-173 | Ngưỡng chênh lệch giữa trọng tải ước tính và tải trọng của kế hoạch bay theo đội tàu bay, thời gian chuyến bay, giai đoạn hiệu lực
240. TOSS-174 | Thời gian quy định cần làm OFP đối với chuyến bay quốc tế, quốc nội
241. TOSS-175 | Thời gian cảnh báo chuyến bay thiếu tài liệu
242. TOSS-176 | Các tham số khác phục vụ cảnh báo và các chức năng thuộc yêu cầu kỹ thuật này | Trọng lượng khách tiêu chuẩn (để tính pax weight và payload)
243. TOSS-177 | Các tham số thể thay đổi được quản lý linh hoạt, cho phép người dùng cập nhật khi có thay đổi
244. C | Thông tin điều hành chuyến bay
245. 19.0 | Thông tin chuyến bay
246. TOSS-178 | Danh sách chuyến bay kèm các thông tin chi tiết về chuyến bay: thông tin tàu bay, cabin, sân bay, thời tiết, NOTAM, tổ bay, hành khách, hàng hóa, doanh thu, chi phí, thông tin khai thác thực tế
247. Flight List
248. Flight Detail | Bao gồm nhiều tab thông tin theo các chiều thông tin tương tự FOS report + các tính toán, cảnh báo, lịch sử
thêm tab Flight Radar hiển thị vị trí tàu bay trên màn hình flight radar 24

Tab Flight status:
- Các mốc thời gian kế hoạch: PRE-ETA, ETD, ETA
- Các mốc thời gian thực tế: PRE-ATA, các mốc phục vụ MĐ, các mốc ACDM, 
(hiển thị song song đối sánh để theo dõi, có thể theo chiều dọc tịnh tiến tăng thời gian)

Tab Flight Docs: 
- Danh sách tổng quát hiển thị các loại tài liệu với version sau cùng và trạng thái /thời điểm confirm/reject
- có thể bấm Ungroup để xem các version cũ hơn và trạng thái confirm/reject
249. TOSS-179 | Cho phép người dùng linh hoạt lựa chọn ẩn/ hiện các trường thông tin hiển thị trên giao diện tổng quan. Lưu được lựa chọn cho các phiên đăng nhập, không ảnh hưởng đến lựa chọn của user khác
250. TOSS-180 | Cảnh báo màu tại các trường thông tin: MEL, cabin defect, hành khách VIP/nối chuyến, loadfactor thấp, delay, tổ bay, return/divert, thiếu phép bay, TAT không đủ, thiếu điện văn,
251. Cảnh báo ZFW ngoài giới hạn | Tính toán khoảng lệch tiêu chuẩn cho phép dựa trên giới hạn (được cấu hình), loại tàu đang sử dụng, thời gian bay
Tính toán khoảng lệch thực tế giữa ZFW của LS hoặc ZFW nhập từ CLC. cảnh báo nếu lệch ngoài giới hạn.
Áp dụng cảnh báo cho cả màn hình tài liệu DSP
252. TOSS-181 | Xem lịch sử thay đổi từng chuyến bay: thay đổi về thời gian cất/hạ cánh, tàu bay, loại chuyến bay, trạng thái chuyên bay
253. TOSS-182 | Trạng thái chuyến bay
254. TOSS-183 | Chuyến bay divert và thông tin divert (sân bay dự kiến hạ cánh ban đầu, sân bay hạ cánh thực tế)
255. TOSS-184 | Thông tin chi phí, lợi nhuận. So sánh chi phí giữa các phương án về tàu bay, tổ bay
256. TOSS-185 | Liên kết xem vị trí máy bay trên Flight Radar24
257. TOSS-186 | Đáp ứng các chuyến bay của các carrier khác nhau
258. TOSS-187 | Có cơ chế phân quyền xem từng thông tin đối với từng người dùng
259. 20.0 | Thông tin tàu bay
260. TOSS-188 | Hiển thị thông tin chung về tàu bay: loại tàu bay, số đăng ký, mã ICAO, IATA, thời điểm hiệu lực
261. TOSS-189 | Lịch khai thác tàu bay gần nhất và sắp tới
262. TOSS-190 | Performance Factor và lịch sử cập nhật
263. TOSS-191 | MEL/CDL, defect hiện có và các ảnh hưởng
264. TOSS-192 | Lịch bảo dưỡng, AOG, dự kiến thời gian khắc phục
265. TOSS-193 | FC và cảnh báo giới hạn FC
266. TOSS-194 | Chi phí APU, chi phí bảo dưỡng tàu bay
267. 21.0 | Thông tin tổ bay
268. TOSS-195 | Danh sách tổ bay: họ và tên, chức vụ, thông tin liên lạc, năm sinh, số hộ chiếu, mã số tổ bay
269. TOSS-196 | Hành trình tổ bay
270. TOSS-197 | Lịch sử đổi tổ bay của chuyến bay
271. TOSS-198 | Flight time, Duty time
272. 22.0 | Thông tin tải trọng, hành khách
273. TOSS-199 | Hiển thị số lượng khách theo từng hạng ghế, khách người lớn/trẻ em/sơ sinh, khách inbound, outbound, VIP, CIP | Chia quyền nhập riêng cho CLC (pax/baggage), HH (cargo/ULD)
274. TOSS-200 | Hiển thị thông tin payload, tải trọng hành khách, hành lý, hàng hóa, DOW, ULD và lịch sử thay đổi tải trọng
275. TOSS-201 | Hiển thị thông tin dịch vụ: suất ăn, thông tin phục vụ hành khách
276. TOSS-202 | Quản lý và hiển thị thông tin NOTOC, hàng hóa đặc biệt, hàng hóa nguy hiểm, các hạn chế dịch vụ trên chuyến bay, chi phí bồi thường cho hành khách
277. 23.0 | Thông tin đường bay, thời gian, nhiên liệu
278. TOSS-203 | Hiển thị các thông tin khuyến nghị cho chuyến bay: tankering, taxi out, CI, sân bay dự bị đến, dự bị dọc dường, extra.....
279. TOSS-204 | Hiển thị thông tin NOTAM, thời tiết được bóc tách từ các nguồn tích hợp và từ tài liệu chuyến bay
280. TOSS-205 | Thông tin nhiên liệu: nhiên liệu kế hoạch, fuel order, load sheet fuel, % nhiên liệu dự phòng, extra
281. TOSS-206 | SID, STAR kế hoạch, thực tế
282. TOSS-207 | Hiển thị dữ liệu thống kê cho các chuyến bay cùng tính chất
283. 24.0 | Thông tin khai thác sân bay
284. TOSS-208 | Vị trí đỗ tàu bay tại sân bay đi
285. TOSS-209 | Boarding Gate
286. TOSS-210 | Giờ boarding
287. TOSS-211 | Băng chuyền hành lý tại sân bay đến
288. TOSS-212 | Vị trí đỗ tàu bay tại sân bay đến
289. TOSS-213 | Các thông tin khai thác khác
290. 25.0 | Ghi nhận thông tin bất thường đối với chuyến bay
291. TOSS-214 | Bất thường về thời tiết
292. TOSS-215 | Bất thường về kỹ thuật
293. TOSS-216 | Bất thường khác
294. 26.0 | Giám sát trạng thái tài liệu chuyến bay
295. TOSS-217 | Trạng thái chuyến bay có/ chưa có đối với từng loại tài liệu
296. TOSS-218 | Trạng thái được request, chưa confirm/đã confirm bởi từng đối tượng đối với từng loại tài liệu. Xem được trạng thái confirm/reject, thời gian confirm/reject/ request
297. TOSS-219 | Xem số tài liệu đính kèm chuyến bay. Xem nội dung từng tài liệu đính kèm chuyến bay, các version tài liệu
298. TOSS-220 | Download toàn bộ tài liệu đính kèm chuyến bay
299. TOSS-221 | Lựa chọn cho phép ẩn/ hiện tài liệu trên hệ thống MO Plus
300. D | Quản lý tài liệu chuyến bay
301. 27.0 | Quản lý tài liệu OFP, NOTAM, WX, briefing package
302. TOSS-222 | Thông tin chuyến bay
303. Cảnh báo màu sai lệch giữa ATC FPL trong OFP và filed ATC
304. TOSS-223 | Hiển thị trạng thái OFP, cho phép xem, tải các version OFP, lịch sử ban hành OFP
305. Dispatch Release | Nhấn đối với từng chuyến bay mới được coi là OFP hoàn thành.
Trên MO khi nhận được trạng thái Dispatch Released = TRUE thì mới cho Phi công thực hiện Flight Release
306. TOSS-224 | Thông tin OFP: người tạo, thời gian, các thông tin chi tiết
307. TOSS-225 | Thông tin payload, fuel order, PIC,
308. TOSS-226 | Tổng hợp và cho phép xem, nhập ghi chú trên Briefing Sheet: NOTAM, WX, MEL, Special Ops. Tự động cập nhật Briefing Sheet khi có thông tin thay đổi
309. TOSS-227 | Thông tin, trạng thái flight release
310. TOSS-228 | Cho phép upload file NOTAM, WX cho từng chuyến bay hoặc nhiều chuyến bay cùng lúc.
311. TOSS-229 | Tích hợp tự động NOTAM, WX, gói tài liệu chuyến bay từ Lido và từ các nguồn
312. TOSS-230 | Chức năng tích hợp, lưu trữ, số hóa, bóc tách thông tin NOTAM, WX | Có NOTAM Filter
313. TOSS-231 | Kiểm soát revision của file NOTAM, thời tiết. Mặc định hiển thị revision cuối cùng. Cho phép xem thời gian upload, nội dung file của tất cả các revision.
314. TOSS-232 | Cho phép chọn ẩn/ hiện file NOTAM, WX trên MO Plus
315. TOSS-233 | Cho phép upload, xem tài liệu đính kèm bất kỳ cho chuyến bay
316. TOSS-234 | Các thông tin khác phục vụ nghiệp vụ của Điều phái
317. TOSS-235 | Hỗ trợ các định dạng file pdf, docx, ảnh, txt
318. TOSS-236 | Có giao diện, phương thức độc lập cho phép điều phái upload, cung cấp các tài liệu này cho MO Plus trong trường hợp chức năng quản lý tài liệu này không truy cập được
319. 28.0 | Quản lý tài liệu LS, GD, PM, NOTOC Cargo, NOCTOC Baggage, Cargo Manifest, Mail Manifest
320. TOSS-237 | Tích hợp tự động các tài liệu từ các hệ thống gắn với từng chuyến bay
321. TOSS-238 | Cho phép upload tài liệu cho từng chuyến bay hoặc nhiều chuyến bay cùng lúc
322. TOSS-239 | Có chức năng quản lý revision, hiển thị revision được upload cuối cùng. Cho phép xem lại nội dung tài liệu, thời gian upload, thời gian confirm/reject, comment tương ứng từng revision
323. TOSS-240 | Tự động bóc tách, lưu trữ các thông tin từ các file dữ liệu
324. TOSS-241 | Trạng thái chưa confirm/đã confirm bởi từng đối tượng đối với từng loại tài liệu. Xem được trạng thái confirm/reject, thời gian confirm/reject. Trạng thái tài liệu được request kèm theo nội dung request, thời gian request
325. TOSS-242 | Xem và download trang confirm/ reject/ request tài liệu
326. TOSS-243 | Cho phép phân biệt trạng thái confirm/ reject một phần hoặc toàn bộ
327. TOSS-244 | Có giao diện, phương thức độc lập cho phép điều phái cung cấp các tài liệu này cho chuyến bay trong trường hợp chức năng quản lý tài liệu này không truy cập được.
328. TOSS-245 | Có giao diện trên mobile để quản lý thông tin, xem tài liệu và confirm tài liệu
329. 29.0 | Quản lý tải trọng
330. TOSS-246 | Cho phép nhập số lượng khách người lớn, trẻ em, trẻ sơ sinh. Tự động tính toán trọng lượng hành khách.
331. TOSS-247 | Cho phép nhập số lượng hành lý, tự động tính toán trọng lượng hành lý
332. TOSS-248 | Cho phép nhập trọng lượng hàng và mail ước tính
333. TOSS-249 | Cho phép nhập ULD hành khách (AKE), tự động tính toán trọng lượng ước tính tương ứng
334. TOSS-250 | Cho phép nhập ULD hàng hóa (AKE, PMC), tính toán trọng lượng ước tính tương ứng.
335. TOSS-251 | Tính toán và hiển thị tải trọng ước tính (payload = trọng lượng khách + hành lý + hàng + mail + ULD)
336. TOSS-252 | Hiển thị DOW ở OFP, DOW tính toán được
337. TOSS-253 | Tính và hiển thị ZFW ước tính
338. TOSS-254 | Hiển thị ZFW từ OFP
339. TOSS-255 | Hiển thị chênh lệch ZFW trên OFP và ZFW ước tính
340. TOSS-256 | Hiển thị thời gian cập nhật gần nhất
341. TOSS-257 | Đồng bộ và cập nhật tự động các thông tin tải trọng (song song với nhập thủ công)
342. TOSS-258 | Có cơ chế lưu và lịch sử cập nhật tải trọng (bao gồm lịch sử cập nhật tất cả các thông tin)
343. TOSS-259 | Cho phép xem lịch sử cập nhật tải trọng của từng chuyến bay, download lịch sử của nhiều chuyến bay
344. E | Quản lý, báo cáo đánh giá tối ưu khai thác
345. 30.0 | Yêu cầu chung về báo cáo
346. TOSS-260 | Có bộ lọc linh hoạt đối với từng báo cáo cụ thể
347. TOSS-261 | Cho phép xem báo cáo, lựa chọn các cột thông tin để hiển thị
348. TOSS-262 | Cho phép download kết quả dạng pdf, excel, docx
349. 31.0 | Quản lý báo cáo thông tin khai thác hàng ngày
350. TOSS-263 | Tổng hợp tự động thông tin, quản lý thông tin từ các nguồn theo mẫu | Daily Operations Status | Bao gồm nhiều tab cho nhiều đối tượng, mục đich, ví dụ (cần khảo sát kỹ vị trí TBT và các đơn vị cung cấp thông tin cho báo cáo ngày):
- Daily Operation Report: TBT kiểm soát thông tin tổng quan, nhập thông tin, ban hành báo cáo
- Irregular Flights: nhập các bất thường phát sinh
- Technical Status: Trực Kỹ thuật cung cấp thông tin
- OTP: các vấn đề liên quan đến yếu tố đúng giờ
- Additional Information: thông tin bổ sung, free text
351. TOSS-264 | Cho phép từng bộ phận nhập thông tin báo cáo riêng cho từng chuyến bay, tàu bay hoặc báo cáo thông tin chung
352. TOSS-265 | Cấp quyền cho user được phép rà soát tổng hợp, xác nhận nội dung và gửi cho các đầu mối nhận báo cáo
353. TOSS-266 | Danh sách đầu mối nhận báo cáo được quản trị, cấu hình linh hoạt
354. TOSS-267 | Liên kết thông tin bất thường về tàu bay với chức năng quản lý tàu bay
355. 32.0 | Báo cáo lịch bay, tàu bay
356. TOSS-268 | Báo cáo lịch bay kế hoạch
357. TOSS-269 | Báo cáo lịch bay thực hiện
358. Flight List for Backup Tool | Standard Filter | Cho phép download lịch bay cập nhật nhất theo format cho trước để user import vào phần mềm backup Netline. (Trường hợp Ops++ lỗi nhưng TOSS ok)
Đồng thời định kỳ xuất file này ra 1 SFTP độc lập với TOSS để lấy file (trường họp Ops++ lỗi và TOSS cũng lỗi)
359. TOSS-270 | Thống kê chuyến bay thay đổi/ không theo kế hoạch: đổi giờ, đổi tàu, up config, down config, đổi code và các thay đổi khác
360. TOSS-271 | Thống kê chuyến bay theo tính chất: Ferry, hủy, tăng, chở khách, chở hàng, thường lệ, VIP, charter và các tính chất khác
361. TOSS-272 | Báo cáo chuyến bay divert
362. TOSS-273 | Báo cáo OTP/ OSP
363. TOSS-274 | Thống kê chậm chuyến: chậm cất cánh, chậm hạ cánh
364. TOSS-275 | Báo cáo tàu làm kỹ thuật. Đánh giá tần suất lặp lại các lỗi dẫn đến AOG đột xuất
365. TOSS-276 | Báo cáo lịch sử chuyến bay
366. TOSS-277 | Thống kê số lần cát hạ cánh
367. TOSS-278 | Thống kê giờ máy bay/ Báo cáo sử dụng tàu bay
368. Aircraft Utilization | From Date
To Date
AC Type (multiple choice: chọn  ac type hoặc một/ nhiều cate)
AC Reg (multiple choice) | Thống kê tổng giờ bay, giờ bảo dưỡng
1. Bảng chi tiết  gồm các cột:
- AC Reg
- Lần lượt các cột AC Type/ Cate được chọn
- tổng BH chuyến bay
- Tổng ngày khai thác
- Tổng ngày dừng( chia từng cột bảo quản/ bảo dưỡng/ định kỳ..... như thống kê tàu dừng) | Nếu chọn AC Type và một/nhiều AC Cate thì mỗi phân loại có 1 biểu đồ cột trung bình BH/day
369. FH/FC | Thống kê tỷ lệ trung bình giờ BH/chuyến bay đối với từng tàu hoặc từng đội/cate
370. TOSS-279 | Thống kê hành trình bay
371. TOSS-280 | Báo cáo tàu dừng
372. TOSS-281 | Báo cáo thời gian tàu nằm sân
373. Schedule Robustness | (độ ổn định lịch)

Khả năng chống delay dây chuyền
Có buffer hợp lý hay không
374. Airport Constraints

Slot, curfew, hạn chế sân bay | Dựa theo giờ curfew của sân bay để cảnh báo
375. Crew Feasibility

Lịch có phù hợp duty time, rest time của phi công/tiếp viên
376. Kiểm tra các bất thường trong lịch bay để điều chỉnh kịp thời. Hiện nay Tổ LB đang sử dụng một công cụ Excel để kiểm tra về các yếu tố:
-	Lệch đầu
-	Vặn tàu tại DAD và các sân bay khác
-	Tàu hỏng APU đến các sân không có thiết bị điện mặt đất.
-	Ground time so với tiêu chuẩn
-	BH so với BH mùa
-	Tàu bay vi phạm phép bay
377. 33.0 | Báo cáo nhiên liệu
378. TOSS-282 | Báo cáo nhiên liệu tiêu thụ trên giờ bay theo loại tàu bay (subtype, ac type), chặng bay. Hiển thị các giá trị thống kê: median, medium, max, min, theo % độ tin cậy của nhiên liệu tiêu thụ/ giờ bay FH
379. FH Fuel Flow by AC subtype
(tổng hợp theo nhóm tàu bay) | Standard Filter
AC Type (cho phép lựa chọn theo một trong các thuộc tính chia nhóm tàu bay)
Minimum Fls (số lượng chuyến bay tối thiểu thì tính)
Reliability | Kết quả tương tự file TINH DINH MUC
- Sector
- DEP
- ARR
- AC Subtype (theo Group 4)
- Fls (số chuyến bay từng năm, mỗi năm một cột, năm nào không bay để trống), thêm một cột Fls 12 tháng gần nhất
- Min FH Fuel Flow 
- AVG FH Fuel Flow
- Max FH Fuel Flow
- FH Fuel Flow at selected Reliability
380. FH Fuel Flow by AC subtype
(tổng hợp theo từng AC Reg) | Standard Filter
AC Reg (chọn một hoặc nhiều)
Region
Minimum Fls (số lượng chuyến bay tối thiểu thì tính)
Reliability | Bảng kết quả với các cột:
- AC Reg (nếu chọn nhiều region thì lặp lại AC reg cho mỗi Region)
- Region (mỗi dòng 1 region hoặc "All" nếu chọn hết)
- Min FH Fuel Flow 
- AVG FH Fuel Flow
- Max FH Fuel Flow
- FH Fuel Flow at selected Reliability
381. TOSS-283 | Báo cáo so sánh nhiên liệu kế hoạch và thực tế
382. SFC (Statistical Fuel Consumption) | Standard Filter
Reliability | Bảng kết quả
- Sector
- AC type (loại trong Category đã chọn)
- Delta Fuel (= Actual Trip Fuel – Planned Trip Fuel) (fill màu ô những giá trị >0)
- Rate per AVG Trip Fuel (tỷ lệ của Delta Fuel/ AVG actual trip fuel)
Loại bỏ outlier (ATC delay, diversion, ACARS bất hợp lý hoặc không có…)
383. Remaining Fuel | Standard filter | Bảng 1: AVG Delta Remaining Fuel by Sectors
- Sector 
- AC Type
- AVG Delta Remaining Fuel | Top 10 chặng bay có Delta Remaining Fuel cao nhất
Top 10 chặng bay có Delta Remaining Fuel thấp nhất | Đối với mỗi CB:
Delta Remaining Fuel = Actual Remaining Fuel - Standard OFP Remaining Fuel
384. Remaining Fuel by Region | From Date
To Date
Region
AC Type | 1. AVG Delta Remaining Fuel by Region
- Region
- AC Type
- AVG Delta Remaining Fuel 
2. Remaining fuel data 
- Flight Info
- OFP Cont Fuel
- OFP Dest Alt Fuel
- OFP Final Reserve
- OFP Tankering
- OFP Extra Fuel
- Fuel Order
- Techlog uplift FOB 
- Pilot Extra Fuel
- Actual Trip Fuel
- Standard OFP Remaing Fuel
- Actual Remaining Fuel
- Delta Remaining Fuel
- Data Source for Actual Remaining Fuel (ACARS/ QAR)
385. Remaining Fuel by AC Type | From Date
To Date
AC Type | 1. AVG Delta Remaining Fuel by AC Type
- Sector 
- AC Type
- AVG Delta Remaining Fuel
2. Remaining Fuel data 
- Flight Info
- OFP Trip Fuel
- OFP Cont Fuel
- OFP Dest Alt Fuel
- OFP Final Reserve
- OFP Tankering
- OFP Extra Fuel
- Fuel Order
- Techlog uplift FOB 
- Pilot Extra Fuel
- Actual Trip Fuel
- Standard OFP Remaing Fuel
- Actual Remaining Fuel
- Delta Remaining Fuel
- Data Source for Actual Remaining Fuel (ACARS/ QAR)
386. Remaining Fuel by Sector | From Date
To Date
Sector
AC Type | 1. AVG Delta Remaining Fuel by Sector
- Sector 
- AC Type
- AVG Delta Remaining Fuel 
2. Remaining Fuel data 
- Flight Info
- OFP Cont Fuel
- OFP Dest Alt Fuel
- OFP Final Reserve
- OFP Tankering
- OFP Extra Fuel
- Fuel Order
- Techlog uplift FOB 
- Pilot Extra Fuel
- Actual Trip Fuel
- Standard OFP Remaing Fuel
- Actual Remaining Fuel
- Delta Remaining Fuel
- Data Source for Actual Remaining Fuel (ACARS/ QAR) | 1- AVG Delta Remaining Fuel by Month
(12 tháng gần nhất)
2- Delta Remaining (Historygram by range)
biểu đồ phân bổ theo khoảng (data trong khoảng thời gian được chọn)
387. TOSS-284 | Báo cáo Pilot Extra Fuel
388. Pilot Extra Fuel | Standard Filter
- Mã PC
- Tên PC (cho xổ xuống tìm tương tự rồi chọn) | Tương tự file gửi Đoàn Bay hiện nay
389. Overfueling | Standard Filter
- Crew Code
- PIC Name (cho gõ rồi xổ xuống tìm tương tự rồi chọn)
- Ngưỡng sai lệch giữa Techlog block fuel và Fuel Order  (techlog block + ngưỡng > fuel order)
- Ngưỡng sai lệch giữa ACARS OUT với Techlog block (tương tự) | \\10.222.23.207\occ\OCC\Backup\FOM\3. ĐGKT\4. EXTRA FUEL\2026.03. Đánh giá Fuel Order và nạp thực tế
1- Biểu đồ:
- Tỷ trọng Fuel Order Extra và Overfueling đối với từng khu vực bay, từng đội tàu bay
- Biểu đồ phân bố Overfueling theo khoảng chênh lệch
2- Danh sách data chi tiết như mẫu
390. TOSS-285 | Báo cáo Extra Fuel
391. OFP Extra Fuel | Standard Filter
AC Group 2 | Mỗi chuyến bay 1 dòng
- FLIGHT INFO
- Mỗi loại extra Fuel 1 cột, giá trị là số lượng extra
392. TOSS-286 | Báo cáo định mức nhiên liệu
393. Planned FH Fuel Flow | Year (năm của version kế hoạch)
Version (tên version do người dùng đặt của năm đó, tự động load ra khi chọn Year)
Operated Years (chọn một hoặc nhiều năm)
Last 12 months (End date) (mặc định D-1, cho nhập lại)
Minimum Fls (số lượng chuyến bay tối thiểu thì tính) | Kết quả tương tự file TINH DINH MUC chỉ bao gồm SECTOR/AC đã upload
- Sector
- DEP
- ARR
- AC Subtype
- Region
- Fls (số chuyến bay từng năm, mỗi năm một cột, năm nào không bay để trống), thêm một cột Fls 12 tháng gần nhất. Hightlight các giá trị FF mà Fls nhỏ hơn SLCB tối thiểu đã nhập
- FH Fuel Flow (từng năm, mỗi năm một cột, năm nào không bay để trống), thêm một cột FF 12 tháng gần nhất kể từ To Date. Highlight các giá trị FF cao hơn trung bình của cùng subtype từ 1000 trở lên)
- Final FH Fuel Flow: Lấy lần lượt ưu tiên 12 tháng gần nhất, năm mới nhất đến năm cũ nhất. Trường hợp chưa khai thác, tính trung bình Final FH Fuel Flow của cùng Subtype, cùng Region. Highlight các giá trị tự tính bằng một màu. Highlight các giá trị lấy của năm trước một màu. 

Chỉ tính đối với các CB có ACARS trip fuel
394. TOSS-287 | Báo cáo Fuel Burn/ RTK
395. Fuel Burn/RTK
(tính dựa trên các chuyến có dữ liệu khai thác) | Mô tả
(theo AC Group 1)
Điều kiện chuyến bay được tính toán:
- Có dữ liệu OFP
- Có dữ liệu ACARS Block Fuel 
- Nếu có Payload trên Loadsheet thì sử dụng, nếu không thì lấy EPLD trên OFP
396. Fuel Invoice Summary | Standard Filter | Bảng kết quả theo AC Group 1
- AC Group 1
- Mỗi tháng 1 cột (theo giai đoạn chọn), giá trị là tổng Fuel Invoice (kg) đối với từng AC Group 1 trong tháng. 
- Total (cột tổng theo từng AC Group 1)
Dòng cuối là total từng tháng của tất cả các Group 1, và tổng toàn bộ

Bảng này xuất ra để tính thủ công với RTK lấy từ TCKT/KHPT
397. TOSS-288 | Báo cáo Fuel Burn/BH
398. TOSS-289 | Báo cáo Remaining Fuel
399. 34.0 | Báo cáo thời gian thực hiện chuyến bay
400. TOSS-290 | Báo cáo, phân tích, đánh giá, khuyến nghị taxi time
401. AVG Taxi Out Time | From date
To date
Region (chọn hoặc không)
Airport (chọn hoặc không)
AC Group2 (chọn hoặc không) | Bảng kết quả:
- Region
- Airport
- Taxi out time trung bình (mỗi AC Group 2 một cột)
Có highlight màu từ nhạt đến đậm theo độ lớn dần của taxi time
402. Taxi Out Time by Hour | From date
To date
Region (chọn hoặc không)
Airport (chọn hoặc không)
AC Group2 (chọn 1 hoặc nhiều hoặc không) | Bảng kết quả:
- Region
- Airport
- Taxi out time trung bình (mỗi khung giờ một cột)
Có highlight màu từ nhạt đến đậm theo độ lớn dần của taxi time
403. TOSS-291 | Báo cáo taxi time xây dựng kế hoạch
404. TOSS-292 | Báo cáo, phân tích, đánh giá, khuyến nghị BH | BH By Periods | Sector
AC Group 
From date, to date cùng kỳ
From date, to date kỳ hiện tại
From date, to date kỳ kế hoạch
Reliability | Tương tự bảng đánh giá khuyến nghị BH hiện nay. 
Bổ sung thêm giá trị BH Reliabilitytheo % chọn
Trường hợp không chọn 1 kỳ (cùng kỳ, hiện tại, kế hoạch) thì không hiển thị Bh của kỳ đó
405. TOSS-293 | Báo cáo BH lịch bay mùa | Season BH | - Cho phép chọn tối đa 2 khoảng From date, To date
- AC Type: Cho chọn theo AC Type, AC Variant, AC Group 1 hoặc AC Group 2/3/4
- Reliability: nhập % mong muốn | Bảng kết quả:
-Region
- Sector
- AC Type (theo việc tách/gộp đã chọn)
- Fls (số chuyến bay theo các giai đoạn From date, to date đã chọn)
- BH Reliabilitytheo % đã nhập theo từng tháng 
- BH AVG theo từng tháng
- Chênh lệch giữa BH Reliability và BH AVG theo từng tháng
406. TOSS-294 | Báo cáo BH xây dựng kế hoạch
407. TOSS-295 | Báo cáo BH trung bình | BH By Periods (ghép)
408. TOSS-296 | Báo cáo xu hướng BH | BH Trend | Sector
AC Type | - Bảng chi tiết AVG BH 5 năm gần nhất từng tháng
Mỗi dòng sẽ có 14 cột, từ T11 năm trước đến T12 năm hiện tại
- Biểu đồ dây cho bảng trên
409. TOSS-297 | Báo cáo giờ thực hiện chuyến bay theo phase: taxi-out, takeoff, climb, cruise, descent, taxi-in
410. TOSS-298 | Báo cáo chuyến bay bay vòng chờ
411. FH Overrun Report
(Báo cáo FH kéo dài ) | From date
To date
ARR
AC Type | - Bảng/biểu đồ số lượng cb có FH kéo dài theo từng khung giờ, từng khoảng kéo dài.
- Bảng/biểu đồ tỷ lệ cb có FH kéo dài theo từng khung giờ, từng khoảng kéo dài, có hightlight đậm nhạt thể hiện tỷ lệ cao thấp.
Tham khảo mẫu FH đang có
412. Actual FH Summary Report
(Báo cáo FH) | From date
To date
DEP (sched)
ARR (sched)
AC Type
Options: AVG, Reliability(nhập được %)
Diverted: Y/N (mặc định N) | Bảng kết quả FH:
DEP (sched)
ARR (sched)
Actual ARR (chỉ hiển thị nếu chọn Diverted = Y)
AC TYPE
FH (theo option được chọn)
Max FH
Min FH
413. FH Plan vs Actual Daily Comparision | Standard Filter | Bảng kết quả FH theo từng chặng bay, theo từng nhóm tàu bay thân rộng/ thân hẹp theo từng ngày:
Tương tự sheet theo dõi ngày trên Flight Ops Data
Tùy theo giai đoạn thời gian được chọn, cần phải ra full các chặng bay/ tàu bay có khai thác trong giai đoạn đó. Sắp xếp theo cặp đi/về
414. TOSS-299 | Báo cáo Ground Time/ Turn Around Time | TAT Report | From date
To date
Airport
Options: Summary/Detail | Trường hợp chọn Summary: hiển thị bảng bao gồm:
- Airport
- Fls (số lượng chuyến bay đến)
- Fls meet sched TAT (slcb đạt TAT tiêu chuẩn)
- Meet sched TAT rate (tỷ lệ đạt TAT tiêu chuẩn)
- Not meet sched TAT: chia ra các khoảng TAT thực tế hơn TAT tiêu chuẩn 5, 10, 15...., >60 và slcb tương ứng
Trường hợp chọn Detail, hiển thị bảng chi tiết từng chuyến bay
- FLIGHT INFORMATION
- Group (nhóm nối chặng bay)
- Scheduled TAT
- Actual TAT
415. Ground Service Gantt 
Quản lý, khai báo linh hoạt các mốc trong sơ đồ Gantt dịch vụ
416. Standard Gantt vs Actual | Báo cáo so sánh các mốc thời gian PVMĐ theo tiêu chuẩn và thực tế
417. 35.0 | Báo cáo kế hoạch bay và dữ liệu bay thực tế
418. TOSS-300 | Báo cáo đánh giá thời gian làm OFP so với quy định
419. TOSS-301 | Báo cáo chi tiết thông tin OFP
420. TOSS-302 | Báo cáo Payload Accuracy
421. TOSS-303 | Báo cáo sân bay dự bị
422. TOSS-304 | Báo cáo đánh giá flight level
423. Tỷ lệ Flight Level từng điểm trên từng đường bay, chặng bay
424. Tỷ lệ Flight Level đối với một điểm cụ thể
425. TOSS-305 | Báo cáo chuyến bay bay qua một waypoint
426. TOSS-306 | Báo cáo route
427. TOSS-307 | Báo cáo Runway, SID, STAR
428. TOSS-308 | Báo cáo Cost Index
429. 36.0 | Báo cáo tải trọng, dịch vụ
430. TOSS-309 | Báo cáo chi tiết thông tin Load sheet
431. TOSS-310 | Báo cáo Loadfactor, hành khách, booking
432. Load Factor Overview | Các biểu đồ như BC tuần ĐGKT
433. Load Factor by Days | Standard Filter
Group by: Chọn AC Type hoặc AC Category bất kỳ | Bảng dữ liệu gồm các cột:
- Sector
- AC (theo type hoặc cate đã chọn)
- Flt Type (nhóm các LEG_TYPE của các chặng với nhau
- LF chia từng ngày nối tiếp nhau
- AVG LF giai đoạn đã chọn

Trường hợp 1 sector bay nhiều ac, mỗi dòng một ac riêng | Danh sách chặng bay - tàu bay bao gồm toàn bộ các chặng bay - tàu bay có khai thác trong giai doạn được chọn
434. Load Factor by Flights | Standard Filter | Bảng dữ liệu gồm các cột:
- Nhóm cột Flight Info mặc định
- Các cột tách rời: AC config C, W, Y
- Các cột tách rời: Com config C, W, Y
- Các cột tách rời: boooking C, W, Y
- Các cột tách rời: pax C, W, Y
- Các cột tách rời: LF C, W, Y
- LF | LF = (pax C + W + Y)/ (com config C + W + Y)
435. TOSS-311 | Báo cáo VIP, CIP
436. TOSS-312 | Báo cáo chuyến bay có NOTOC, Cargo Manifest. Chi tiết thông tin
437. TOSS-313 | Báo cáo lịch sử cập nhật tải trọng chuyến bay
438. Báo cáo tổng hợp | Chạy lại SQL 1 tháng
439. Chênh lệch thời gian nhập tải so với quy định ban đầu | một số chuyến em có quy định nhập tải bao nhiêu lần, mỗi lần bao lâu trước giờ ETD, nếu lệch ngoài khoảng đó thì sẽ là lỗi từ khâu nhập tải. | hỏi Tuấn Dương
440. Chênh lệch thời gian tải nhập vào - Lido làm up lên OFP | + TH1: nếu như chênh tầm 1-2p thì là đúng theo rule em đặt ra do máy cần thời gian tính toán
  + TH2: nếu chênh lệch quá nhiều thì sẽ là lỗi trong hệ thống tự động của Lido hoặc do người dùng ko làm đúng theo quy trình | Hỏi tuấn Dương
441. Chênh lệch thời gian upload lên MO | em cũng có rule để upload lên MO vào một số mốc thời gian nhất định trước ETD. nếu upload time lệch với khoảng đó quá nhiều thì sẽ khoanh vùng check kĩ tiếp. | Hỏi tuấn Dương
442. Chênh lệch tải EPLD giữa con số của 3 bên: CLC với OFP và loadsheet theo từng version OFP | Hỏi tuấn Dương
443. - Chênh lệch DOW giữa con số của 3 bên: CLC với OFP và loadsheet theo từng version OFP | Hỏi tuấn Dương
444. Chênh lệch BlockFuel giữa OFP và Loadsheet theo từng version loadsheet | Hỏi tuấn Dương
445. Báo cáo sai lệch tải EST của CLC so với thực tế
446. Báo cáo đánh giá cập nhật Hàng Hóa | Đặt lịch làm việc với Ban TTHH:
báo cáo so sánh hàng hóa vc thưc tế (lấy số loadsheet) và so với lần nhập OFP ban đầu và OFP lần cuối, + số hàng hóa thực tế lần cuối (số loadshee) với số hàng hóa nhập lần đầu.
chỉ đánh giá theo lần ofp cuối thì lấy số thực so với số lập lần cuối
còn các lần nhập thì em cứ cho tách ra từng cột riêng
447. TOSS-314 | Báo cáo hàng hóa, mail
448. TOSS-315 | Báo cáo hành lý ký gửi/ offload hành lý
449. TOSS-316 | Báo cáo thay đổi tải trọng sát giờ bay
450. TOSS-317 | Báo cáo sử dụng nước sạch | Cho phép upload báo cáo điện nước sạch download từ website boeing airbus bổ sung các chuyến ko nhận đc điện qua email
451. TOSS-318 | Báo cáo Weight Factor
452. TOSS-319 | Báo cáo chuyến bay đạt giới hạn tải
453. ZFW/Payload Diff Summary
(Báo cáo sai lệch Payload tổng hợp) | From date
To date | Tỷ lệ CB lệch so với tiêu chuẩn theo từng đội tàu bay, cb QT/QN và mức độ sai lệch.
Các cột:
Diff Range (trong đó thể hiện đoạn giữa là mức sai lệch cho phép cả âm, dương. Còn lại là các bước nhảy chẵn 1000kg cho đến mức sai lệch cao nhất/thấp nhất)
Fls (số chuyến bay)
Rate (tỷ lệ Fls so với tổng số CB trong giai đoạn đánh giá)
Mỗi AC type chia 2 cột QT/QN và số lượng cb tương ứng
454. MTOW Exceed
455. 37.0 | Báo cáo Tổ bay
456. TOSS-320 | Cho phép thiết lập mục tiêu giờ bay PC, TV theo từng giai đoạn
457. TOSS-321 | Báo cáo Flight Time, Flight Duty PC, TV
458. TOSS-322 | Báo cáo trung bình thời gian bay PC, TV theo từng chức vụ trên chuyến bay
459. TOSS-323 | Báo cáo số lượng PC, TV khai thác
460. TOSS-324 | Báo cáo số lượng PC, TV nghỉ
461. TOSS-325 | Báo cáo tổ bay dự bị
462. TOSS-326 | Báo cáo các trường hợp khai thác không đúng quy định
463. TOSS-327 | Các báo cáo khai thác PC, TV khác
464. 38.0 | Báo cáo khai thác khác
465. TOSS-328 | Báo cáo traffic
466. TOSS-329 | Báo cáo chuyến bay bất thường ảnh hưởng do thời tiết
467. TOSS-330 | Báo cáo chuyến bay bất thường vì lý do kỹ thuật
468. TOSS-331 | Báo cáo chuyến bay bất thường khác
469. TOSS-332 | Báo cáo sử dụng nước sạch
470. TOSS-333 | Báo cáo hiệu quả chuyến bay
471. TOSS-334 | Báo cáo NOTAM
472. TOSS-335 | Báo cáo thời tiết quan trắc thực tế
473. Observed Weather Report | From Date
To Date
WX Source (TAF hoặc METAR) | 2- Bảng chi tiết từng lần quan trắc
474. TOSS-336 | Báo cáo thời tiết quan trắc thực tế so với minima
475. TAF/METAR | - From Date
- To Date
- WX Source (TAF hoặc METAR)
- Comparison to: Minima or Other.
- Nếu chọn Other thì cho nhập Visibility và Ceiling | Bảng như hình bên | Giá trị là tỷ lệ TAF hoặc METAR cao hơn 2 điều kiện nhập vào hoặc minima.
476. TOSS-337 | Báo cáo thời tiết so sánh dự báo và thực tế
477. TOSS-338 | Các báo cáo khác phát sinh theo nghiệp vụ thuộc yêu cầu kỹ thuật này
478. Báo cáo FORM D, FORM E
