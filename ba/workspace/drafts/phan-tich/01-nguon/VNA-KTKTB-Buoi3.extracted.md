Kết quả khảo sát buổi 3 VNA - Phòng Kỹ thuật khai thác bay

1. Nhóm lập phương án đường bay

- Tìm hiểu quy trình và cách sử dụng phần mềm:

+ Hiểu quy trình sử dụng phần mềm tạo đường bay

+ Hiểu quy trình soạn phương án đường bay

- VTIT trình bày ý tưởng sơ bộ về tool cho khách hàng

+ Cho phép người dùng khai báo cơ sở dữ liệu hoặc import file PDF từ Nhà cung cấp (LIDO Chart) để quét pdf lấy các dữ liệu thuộc tính của sân bay.

+ Cơ sở dữ liệu sân bay sẽ có các trường checkbox cho phép người dùng đánh dấu sân bay đã đủ tài liệu theo nghiệp vụ.

+ Hỗ trợ tạo các dữ liệu trong file phương án bay theo thao tác chọn sân bay đi/đến/dự bị.

+ Hỗ trợ quét file pdf CFP để lấy dữ liệu các phép bay trong đường bay và tạo bảng thống kê phép bay dựa trên dữ liệu.

+ Hỗ trợ tính Payload đường bay khi chọn sân bay đi/đến.

=> Khách hàng hài lòng với đề xuất ý tưởng của VTIT.

- Công việc tiếp theo cần nguyên cứu tính khả thi

+ Đọc / thống kê dữ liệu cần quét và lấy về trong file PDF từ LIDO Chart.

+ Phân tích / thống kê các trường dữ liệu cho cơ sở dữ liệu sân bay.

+ Nghiên cứu quy tắc quét file CFP để tạo bảng thống kê phép bay.

+ Phân tích thêm cách tính payload dựa trên thuộc tính sân bay và DOW.

2. Nhóm thư viện khai thác

- Tìm hiểu quy trình và cách sử dụng phần mềm:

+ Hiểu quy trình đăng tải tài liệu lên SkyOffice, MO. Cần tích hợp hệ thống khác (MO Plus, VNA Library) để giảm thao tác đăng tải. MO Plus và VNA Library là 2 hệ thống đang phát triển

+ Thu thập nhu cầu quản lý hoá đơn, tự động tính thuế.

+ Hiểu quy trình tạo Service Order

- VTIT trình bày ý tưởng sơ bộ về tool cho khách hàng

+ Cho phép đăng tải tài liệu tại SkyOffice và hệ thống tự động tải tài liệu đã đăng tải lên hệ thống khác như MO, MO Plus, VNA Library.

+ Nhà cung cấp LIDO sẽ gửi email vào địa chỉ email cố định của VNA và từ đó hệ thống tự động tạo Service Order theo máy bay. Sau khi order hoàn thành và VNA tiếp nhận thông tin thì sẽ đánh dấu thủ công hoàn thành trên hệ thống.

=> Khách hàng hài lòng với đề xuất ý tưởng của VTIT.

- Công việc tiếp theo cần nghiên cứu tính khả thi:

+ Cần liên hệ với đầu mối CĐS của VNA để tìm hiểu cách thức tích hợp của SkyOffice.

+ Cần tham khảo hệ thống Service Order hiện tại của VNA.

+ Cần nghiên cứu API để đọc email của Microsoft Outlook (bao gồm lấy nội dung, lấy file đính kèm)

3. Nhóm Tool tính toán cân bằng trọng tải

- Tìm hiểu quy trình và cách sử dụng phần mềm:

+ Thu thập nhu cầu bổ sung cho tool tính toán cân bằng tải.

+ Thu thập thêm nhu cầu từ khách hàng về các chức năng quản lý:
			- Quản lý công việc.

- Quản lý Obstacle Data

- Quản lý EOSID.

- Quản lý các phần mềm, tính năng máy bay.

- VTIT trình bày ý tưởng sơ bộ về tool cho khách hàng

+ V/v nhu cầu bổ sung tool tính toán cân bằng tải: Hệ thống cần lưu lại các phiên bản thông số cân của từng tàu bay. Cho phép xuất thành 5-6 trang pdf theo template của VNA.

+ V/v quản lý công việc: Hệ thống cho phép tạo việc, giao việc, nhân viên báo cáo, xuất báo cáo tuần, vẽ biểu đồ báo cáo.

+ V/v quản lý Obstacle Data và EOSID: Hệ thống cho phép quản lý thuộc tính trong sân bay bao gồm EOSID và Obstacle Data. Hệ thống lưu và cho truy xuất nhật ký các chỉnh sửa. Có thể import file .stx để gán vào sân bay.

+ V/v quản lý các phần mềm, tính năng máy bay: Hệ thống cho tạo bản ghi lưu lại các lần chỉnh sửa phần mềm theo từng máy bay, và người dùng có thể comment, đánh dấu tàu bay có cần cập nhật hay không.

=> Khách hàng hài lòng với đề xuất ý tưởng của VTIT.

- Công việc tiếp theo cần nghiên cứu tính khả thi:

+ Phân tích tài liệu Obstacle Data và EOSID để thiết kế cơ sở dữ liệu cho sân bay.

+ Phân tích file .stx của nhà chức trách sân bay, phục vụ cho Obstacle Data và EOSID.