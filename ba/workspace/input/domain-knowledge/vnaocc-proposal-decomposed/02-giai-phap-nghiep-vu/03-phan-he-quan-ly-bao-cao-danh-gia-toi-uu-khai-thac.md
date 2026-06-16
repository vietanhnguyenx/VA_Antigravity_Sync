---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "II.3 Phân hệ Quản lý, báo cáo đánh giá tối ưu khai thác"
source_pages: "15-18"
---

# II.3 Phân hệ Quản lý, báo cáo đánh giá tối ưu khai thác

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: II.3 Phân hệ Quản lý, báo cáo đánh giá tối ưu khai thác
- Trang: 15–18

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống cung cấp một nền tảng báo cáo thông minh với bộ lọc linh hoạt, cho phép người dùng tùy chọn các cột thông tin hiển thị và xuất dữ liệu ra các định dạng chuẩn như PDF, Excel, Docx.

### ● Quản lý báo cáo thông tin khai thác hàng ngày

Đây là báo cáo tổng hợp nhanh tình hình hoạt động toàn mạng bay trong vòng 24 giờ:

- **Tổng hợp tự động:** Hệ thống tự động thu thập dữ liệu từ các nguồn tích hợp để điền vào mẫu báo cáo chung.
- **Phân quyền tác nghiệp:** Cho phép từng bộ phận nghiệp vụ nhập thông tin riêng biệt cho từng chuyến bay hoặc tàu bay; sau đó cấp quyền cho người dùng quản lý rà soát, xác nhận nội dung trước khi gửi đến danh sách đầu mối nhận báo cáo được cấu hình sẵn.
- **Liên kết dữ liệu:** Các bất thường về tàu bay trong báo cáo được liên kết trực tiếp với chức năng quản lý tàu bay để theo dõi trạng thái khắc phục.

### ● Báo cáo lịch bay và Hiệu suất đúng giờ (OTP)

Nhóm báo cáo đánh giá tính ổn định của kế hoạch bay và năng lực điều hành thực tế:

- **Thống kê biến động:** Báo cáo chi tiết các chuyến bay thay đổi so với kế hoạch như đổi giờ, đổi tàu, thay đổi cấu hình ghế, đổi code hoặc hủy chuyến,...
- **Phân loại tính chất:** Thống kê chuyến bay theo loại hình khai thác: thường lệ, thuê chuyến (Charter), chuyến bay Ferry, VIP, chở khách hoặc chuyên chở hàng hóa.
- **Chỉ số đúng giờ (OTP/OSP):** Phân tích chi tiết tỷ lệ chuyến bay đúng giờ, thống kê chậm chuyến tại các đầu sân bay (chậm cất cánh/hạ cánh) và báo cáo các chuyến bay chuyển hướng (Divert).
- **Sử dụng đội tàu:** Thống kê số lần cất hạ cánh, giờ máy bay (Flight Hours), hành trình bay và thời gian tàu dừng, nằm sân để tối ưu hóa vòng quay tàu bay.

### ● Báo cáo nhiên liệu tiêu thụ

Cung cấp các phân tích trọng yếu để kiểm soát chi phí trọng yếu hãng hàng không:

- **Phân tích nhiên liệu tiêu thụ:** Báo cáo tiêu thụ nhiên liệu trên mỗi giờ bay (Fuel/FH) theo loại tàu bay và chặng bay, đi kèm các giá trị thống kê như Median, Mean, Max, Min và độ tin cậy %.
- **Đối soát kế hoạch:** So sánh trực quan lượng nhiên liệu dự kiến trên kế hoạch bay và lượng tiêu thụ thực tế để điều chỉnh tham số lập kế hoạch.
- **Giám sát quyết định của Phi công:** Báo cáo chi tiết lượng dầu nạp thêm theo yêu cầu của phi công (Pilot Extra Fuel) và các loại nhiên liệu Extra khác.
- **Chỉ số kinh tế:** Tính toán định mức nhiên liệu, chỉ số Fuel Burn/RTK, Fuel Burn/BH.

### ● Báo cáo thời gian thực hiện chuyến bay

Phân tích chi tiết từng giai đoạn bay để tìm kiếm cơ hội tối ưu hóa thời gian:

- **Phân tích Taxi Time:** Báo cáo và đưa ra khuyến nghị thời gian lăn bánh (Taxi-in/out) tại từng sân bay để xây dựng kế hoạch bay sát thực tế.
- **Đánh giá thời gian khai thác (BH):** Thống kê xu hướng BH, BH trung bình và BH theo lịch bay mùa để khuyến nghị điều chỉnh tham số kế hoạch.
- **Phân tích chi tiết Phase:** Báo cáo giờ thực hiện chuyến bay theo từng giai đoạn: Taxi-out, Takeoff, Climb, Cruise, Descent và Taxi-in. Theo dõi các chuyến bay phải bay vòng chờ (Holding) và các chỉ số thời gian quay vòng và nằm sân của tàu bay (Ground Time/ Turnaround Time).

### ● Báo cáo kế hoạch bay (OFP) và Dữ liệu bay thực tế

Đối soát chất lượng công tác điều phái và thực thi đường bay:

- **Hiệu quả lập kế hoạch:** Đánh giá thời gian làm OFP so với quy định và phân tích chi tiết thông tin các bản OFP đã ban hành.
- **Độ chính xác tải trọng:** Báo cáo Payload Accuracy để đánh giá sự sai lệch giữa tải trọng ước tính khi lập kế hoạch và tải trọng thực tế khai thác.
- **Tối ưu hóa đường bay:** Phân tích việc sử dụng sân bay dự bị, mức bay (Flight Level), chỉ số chi phí (Cost Index), các đường bay thực tế (Route) và phương thức cất hạ cánh (Runway, SID, STAR).

### ● Báo cáo tải trọng, dịch vụ và Tổ bay

- **Dữ liệu thương mại:** Báo cáo chi tiết Load Factor, tình hình booking khách, hành khách VIP/CIP và thông tin hành lý ký gửi hoặc hành lý bị offload.
- **Hàng hóa & Tải trọng:** Thống kê chuyến bay có hàng hóa nguy hiểm (NOTOC), Cargo Manifest, báo cáo thay đổi tải trọng sát giờ bay và các chuyến bay đạt giới hạn tải trọng.
- **Quản trị nguồn lực Tổ bay:** Theo dõi mục tiêu giờ bay thiết lập cho Phi công và Tiếp viên. Báo cáo chi tiết giờ bay (Flight Time), giờ làm việc (Duty Time), tổ bay dự bị và thống kê các trường hợp khai thác không đúng quy định.

### ● Các báo cáo khai thác và Môi trường

- **Bất thường khai thác:** Thống kê chuyến bay bất thường do thời tiết, kỹ thuật hoặc các lý do khác.
- **Phân tích thời tiết chuyên sâu:** So sánh thời tiết quan trắc thực tế với tiêu chuẩn tối thiểu (Minima) và đối soát giữa thời tiết dự báo với thực tế để đánh giá rủi ro.
- **Hiệu quả tổng thể:** Báo cáo hiệu quả chuyến bay (Profitability) và các báo cáo phát sinh khác theo đặc thù nghiệp vụ OCC.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
