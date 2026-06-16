---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "II.1 Phân hệ Thông tin điều hành chuyến bay"
source_pages: "9-12"
---

# II.1 Phân hệ Thông tin điều hành chuyến bay

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: II.1 Phân hệ Thông tin điều hành chuyến bay
- Trang: 9–12

## Nội dung trích nguyên văn (Verbatim Extract)

Đây là phân hệ lõi của hệ thống TOSS, nơi tích hợp dữ liệu từ hàng chục nguồn khác nhau để cung cấp năng lực giám sát và ra quyết định cho người điều hành.

### ● Thông tin chuyến bay

Hệ thống cung cấp danh sách chuyến bay trực quan, cho phép quản lý toàn diện các thuộc tính từ kế hoạch đến thực tế khai thác:

- **Hội tụ đầy đủ thông tin:** Hiển thị chi tiết về số hiệu chuyến bay, chặng bay, giờ kế hoạch (STD/STA), giờ dự kiến (ETD/ETA) và giờ thực tế (ATD/ATA). Đi kèm là các thông tin về tàu bay, cấu hình cabin, thời tiết, NOTAM, tổ bay, hành khách, hàng hóa, doanh thu và chi phí.
- **Cá nhân hóa giao diện:** Cho phép người dùng linh hoạt ẩn hoặc hiện các trường thông tin hiển thị trên bảng điều khiển tổng quan. Hệ thống lưu lại các tùy chỉnh này cho từng phiên đăng nhập của cá nhân mà không làm ảnh hưởng đến thiết lập của những người dùng khác.
- **Hệ thống cảnh báo thông minh:** Áp dụng cơ chế cảnh báo bằng màu sắc tại các trường thông tin để nhận diện nhanh các bất thường như: MEL/CDL, hỏng hóc cabin (cabin defect), khách VIP, khách nối chuyến, hệ số lấp đầy (loadfactor) thấp, chậm chuyến (delay), thiếu phép bay, hoặc thiếu điện văn hàng không.
- **Truy vết và Đối soát:** Cho phép xem lịch sử thay đổi chi tiết của từng chuyến bay về thời gian, tàu bay, loại chuyến bay và trạng thái. Đồng thời hỗ trợ quản lý các chuyến bay chuyển hướng (Divert) với đầy đủ thông tin so sánh giữa sân bay dự kiến và sân bay hạ cánh thực tế.
- **Tích hợp bản đồ trực quan:** Cung cấp liên kết nhúng để xem vị trí và hành trình bay thực tế của tàu bay thông qua hệ thống Flight Radar24.
- **Quản trị đa Carrier:** Hệ thống đáp ứng khả năng điều hành đồng thời các chuyến bay của nhiều hãng vận chuyển (Carriers) khác nhau trên cùng một nền tảng.

### ● Thông tin tàu bay

Quản lý hồ sơ năng lực và tình trạng kỹ thuật đội tàu bay theo thời gian thực:

- **Thông tin định danh:** Hiển thị loại tàu bay, số đăng ký, mã ICAO/IATA và thời điểm hiệu lực của các chứng chỉ khai thác.
- **Lịch khai thác:** Theo dõi lịch sử bay gần nhất và kế hoạch khai thác sắp tới của từng tàu bay để tối ưu hóa việc phân bổ nguồn lực.
- **Chỉ số hiệu suất (Performance Factor):** Quản lý và lưu trữ lịch sử cập nhật chỉ số PF cho từng tàu bay, phục vụ việc lập kế hoạch bay chính xác và tối ưu nạp dầu.
- **Tình trạng kỹ thuật:** Hiển thị các danh mục MEL/CDL hiện có, các hỏng hóc (defects) và phân tích các ảnh hưởng trực tiếp của chúng đến khả năng khai thác chuyến bay.
- **Bảo trì và AOG:** Theo dõi lịch bảo dưỡng định kỳ, tình trạng tàu bay dừng bay do kỹ thuật (AOG) và dự kiến thời gian khắc phục để điều chỉnh lịch bay kịp thời.
- **Giới hạn chu kỳ bay:** Cập nhật số chu kỳ bay (FC) và kích hoạt cảnh báo khi tàu bay tiến gần đến giới hạn FC quy định.
- **Phân tích chi phí:** Ghi nhận chi phí vận hành động cơ phụ (APU) và các chi phí bảo dưỡng đặc thù cho từng tàu bay.

### ● Thông tin tổ bay

Đảm bảo quản lý nguồn lực phi hành đoàn tuân thủ các quy định về an toàn:

- **Hồ sơ phi hành đoàn:** Danh sách tổ bay thực hiện chuyến bay kèm họ tên, chức vụ, thông tin liên lạc, hộ chiếu và mã số tổ bay.
- **Giám sát hành trình:** Theo dõi chi tiết hành trình của tổ bay và lưu trữ lịch sử các lần thay đổi tổ bay trên chuyến bay.
- **Kiểm soát thời gian:** Theo dõi nghiêm ngặt giờ bay (Flight time) và giờ làm việc (Duty time) để đảm bảo không vi phạm các tiêu chuẩn an toàn hàng không.

### ● Thông tin tải trọng và hành khách

Cập nhật dữ liệu thương mại tức thời để tối ưu hóa tải trọng hữu ích:

- **Dữ liệu hành khách:** Hiển thị realtime số lượng khách mở bán, khách booking và khách thực tế theo từng hạng ghế (Adult/Child/Infant) cũng như các nhóm khách đặc biệt như VIP, CIP, khách nối chuyến.
- **Quản trị Payload:** Hiển thị thông tin trọng lượng hành khách, hành lý, hàng hóa, trọng lượng khô (DOW), danh mục thiết bị chất xếp (ULD) và lịch sử các lần thay đổi tải trọng.
- **Dịch vụ và Hàng hóa đặc biệt:** Cập nhật thông tin về suất ăn, phục vụ hành khách và quản lý các loại hàng hóa nguy hiểm (NOTOC), hàng hóa đặc biệt kèm theo các hạn chế dịch vụ trên chuyến bay.

### ● Thông tin đường bay, thời gian và nhiên liệu

Tối ưu hóa các tham số vận hành để giảm thiểu chi phí:

- **Khuyến nghị tối ưu:** Hiển thị các thông tin khuyến nghị cho chuyến bay về nạp dầu hộ (tankering), thời gian lăn bánh (taxi out), chỉ số chi phí (Cost Index - CI) và các sân bay dự bị.
- **Dữ liệu môi trường:** Cập nhật thông tin NOTAM và thời tiết được bóc tách tự động từ các nguồn tích hợp và tài liệu chuyến bay.
- **Quản trị nhiên liệu:** Theo dõi các mức nhiên liệu kế hoạch, nhiên liệu phi công yêu cầu (fuel order), nhiên liệu trên Load Sheet và các mức nhiên liệu dự phòng/extra.
- **Quỹ đạo bay:** Hiển thị phương thức cất cánh (SID) và tiếp cận (STAR) theo kế hoạch và thực tế.

### ● Thông tin khai thác sân bay

Theo dõi các cột mốc quan trọng tại sân bay để đảm bảo chỉ số đúng giờ (OTP):

- **Vị trí đỗ:** Hiển thị vị trí đỗ tàu bay tại cả sân bay đi và sân bay đến.
- **Tiến độ Boarding:** Cập nhật số cửa khởi hành (Boarding Gate) và giờ bắt đầu đón khách thực tế.
- **Phục vụ mặt đất:** Thông tin về băng chuyền hành lý và các dịch vụ hỗ trợ khai thác khác tại sân bay.

### ● Ghi nhận bất thường và Giám sát tài liệu

Hệ thống hóa việc quản lý các tình huống khẩn cấp và tuân thủ hồ sơ:

- **Phân loại bất thường:** Ghi nhận và phân tích các bất thường phát sinh do thời tiết, kỹ thuật hoặc các lý do khách quan khác để phục vụ báo cáo và rút kinh nghiệm.
- **Dashboard tài liệu:** Giám sát trạng thái chuyến bay đã có hay chưa có đối với từng loại tài liệu cần thiết.
- **Luồng phê duyệt:** Theo dõi chi tiết trạng thái yêu cầu (request), xác nhận (confirm) hoặc từ chối (reject) tài liệu bởi từng đối tượng liên quan kèm dấu thời gian thực.
- **Quản lý phiên bản:** Cho phép xem số lượng, nội dung và các phiên bản (version) khác nhau của tài liệu đính kèm chuyến bay, hỗ trợ tải về toàn bộ bộ hồ sơ khi cần thiết.
- Hệ thống đảm bảo cơ chế phân quyền xem thông tin chi tiết đến từng người dùng, đảm bảo tính bảo mật và đúng vai trò nghiệp vụ trong môi trường điều hành khai thác. Kết thúc mục 1, hệ thống thiết lập một nền tảng dữ liệu hội tụ mạnh mẽ, làm tiền đề cho các chức năng quản lý tài liệu và phân tích tối ưu ở các mục tiếp theo.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
