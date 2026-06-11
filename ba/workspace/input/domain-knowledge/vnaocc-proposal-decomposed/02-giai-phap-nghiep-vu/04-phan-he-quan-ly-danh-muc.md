---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "II.4 Phân hệ Quản lý danh mục"
source_pages: "18-20"
---

# II.4 Phân hệ Quản lý danh mục

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: II.4 Phân hệ Quản lý danh mục
- Trang: 18–20

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống thiết lập một phân hệ quản trị danh mục chuyên biệt, tách biệt với các module nghiệp vụ để đảm bảo dữ liệu "nguồn sự thật duy nhất" (Single Source of Truth).

### ● Đặc tính quản trị nền tảng

- **Cấu trúc Metadata chuẩn:** Mọi danh mục đều được định nghĩa theo cấu trúc metadata chuẩn hóa, hỗ trợ phân loại theo lĩnh vực, nghiệp vụ hoặc hệ thống sử dụng để tối ưu hóa việc quản lý.
- **Quản lý phiên bản (Versioning):** Hệ thống lưu trữ đầy đủ lịch sử thay đổi cho từng bản ghi danh mục (ai thay đổi, nội dung thay đổi là gì, thời điểm cập nhật), cho phép truy xuất trạng thái dữ liệu tại bất kỳ thời điểm nào trong quá khứ.
- **Đồng bộ hóa dữ liệu chủ động:** Hệ thống có khả năng cung cấp và đẩy dữ liệu danh mục cho các hệ thống khác theo phân quyền thông qua API hoặc cơ chế Webhook ngay khi phát sinh thay đổi.
- **Phân quyền dữ liệu:** Cho phép thiết lập quyền truy cập và khai thác dữ liệu danh mục chi tiết cho từng hệ thống hoặc nhóm người dùng cụ thể.

### ● Quản lý danh mục Tàu bay

Hệ thống thiết lập hồ sơ kỹ thuật số toàn diện cho đội tàu bay, kết nối trực tiếp với dữ liệu bảo trì:

- **Thông tin định danh:** Quản lý số đăng ký, loại tàu bay (mã ICAO/IATA), trọng tải, chủ sở hữu, hình thức thuê/mua và thời điểm hiệu lực khai thác.
- **Tình trạng kỹ thuật & MEL/CDL:** Quản lý Master MEL và đồng bộ hóa thông tin MEL/CDL, hỏng hóc (defects) từ hệ thống AMOS.
  - Hệ thống cho phép lọc lỗi theo nhóm ảnh hưởng (phi công, tiếp viên, thợ máy) và tự động làm nổi bật (highlight) các lỗi mới phát sinh.
  - Người dùng có thể ghi chú tính chất ảnh hưởng của MEL đối với khai thác và liên kết xem trực tiếp tài liệu MEL hiện hành.
- **Chỉ số hiệu suất (Performance Factor - PF):**
  - Cho phép thu nạp file dữ liệu từ các đội tàu để tính toán chỉ số PF thực tế.
  - Lưu trữ lịch sử cập nhật PF, thống kê biến động PF theo thời gian và cảnh báo các tàu bay thiếu dữ liệu tính toán.
- **Giới hạn khai thác:** Theo dõi và cảnh báo giới hạn chu kỳ bay (Flight Cycle - FC), lịch bảo dưỡng ngắn/dài hạn, tình trạng AOG và dự kiến thời gian khắc phục.

### ● Quản lý danh mục Sân bay

Hệ thống quản lý chi tiết các tham số hạ tầng và quy định tại các sân bay trong mạng bay:

- **Thông tin hạ tầng:** Quản lý mã ICAO/IATA, hệ thống đường băng, đường lăn, bãi đỗ và các trang thiết bị hỗ trợ cất hạ cánh.
- **Khí tượng & Minima:** Quản lý tiêu chuẩn tối thiểu (Minima), tra cứu thời tiết (WX) và các đặc điểm địa hình đặc thù của sân bay.
- **Dịch vụ & Thủ tục:** Quản lý các thủ tục bay (SID, STAR, IAP), quy định về Slot, phép bay, khung giờ khai thác và khả năng phục vụ mặt đất (nhiên liệu, kỹ thuật, điện mặt đất).
- **Chi phí & An toàn:** Cập nhật NOTAM, tình hình an ninh và các loại phí khai thác thương mại (phí cất hạ cánh, phí tiếng ồn).

### ● Quản lý danh mục Chặng bay và Tối ưu hóa (Route & Optimization)

- **Thông tin chặng bay:** Quản lý điểm đi/đến, khoảng cách (GCD), chỉ số chi phí (Cost Index), nhiên liệu dự phòng (Final Reserve) và thông tin EDTO.
- **Chi phí hành lang bay:** Quản lý và lưu trữ dữ liệu chi phí điều hành bay, bay qua và các tệp thông tin MCMR theo từng giai đoạn.
- **Quy tắc Tankering:**
  - Thu nạp dữ liệu giá nhiên liệu và tính toán khuyến nghị tankering dựa trên hiệu quả chi phí cho từng giai đoạn.
  - Cho phép cập nhật linh hoạt các chặng bay, loại tàu bay áp dụng tankering và xuất dữ liệu khuyến nghị theo thời gian hiệu lực.

### ● Quản lý danh mục bổ trợ và Tham số hệ thống

- **Danh mục nhân sự & Hành chính:** Quản lý danh sách phi công, tiếp viên, quốc gia, FIR và danh mục đơn vị ULD.
- **Quản trị liên lạc:** Thiết lập danh sách email linh hoạt để nhận các thông báo tự động từ hệ thống.
- **Tham số vận hành hệ thống:** Cho phép cấu hình các tham số lõi phục vụ tính toán như: Hệ số độ tin cậy chuyến bay (%), ngưỡng chênh lệch nhiên liệu nạp (phi công yêu cầu và kế hoạch), ngưỡng chênh lệch trọng tải.
  - Quản lý các quy định về thời gian (deadline) lập OFP cho chuyến bay quốc tế/quốc nội và thời gian cảnh báo thiếu tài liệu.
  - Mọi tham số đều được thiết kế linh hoạt, cho phép người dùng có thẩm quyền cập nhật trực tiếp trên giao diện khi có thay đổi nghiệp vụ.

Phân hệ Quản lý danh mục này bảo đảm tính chính xác xuyên suốt của dữ liệu đầu vào, làm tiền đề vững chắc cho các thuật toán tính toán và báo cáo phân tích tại các module sau.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
