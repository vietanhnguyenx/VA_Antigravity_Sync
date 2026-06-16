---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.3"
date: "2026-06-09"
survey_date: "2026-06-08"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — buổi 08/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi 08/06/2026

## I. Thông tin chung

- **Thời gian:** ngày 08/06/2026.
- **Mục đích:** thống nhất lộ trình khảo sát và hình dung tổng thể phạm vi hệ thống TOSS, tập trung vào bức tranh tổng quan năm khối nghiệp vụ (điều hành khai thác bay, tổ bay, bảo dưỡng kỹ thuật, phục vụ mặt đất, an toàn và tuân thủ).
- **Thành phần:**
  - Bên VNA (hãng bay): chị Bạch Lê, anh An.
  - Bên VTIT (đơn vị phát triển): anh Văn Hiệp, anh Gio An.
  - Đầu mối kỹ thuật được nhắc đến: anh Nam, anh Sơn (kiến trúc giải pháp), anh Hương, chị Huyền.

## II. Nội dung trao đổi

### 1. Cách thức và lộ trình khảo sát

- **VTIT trao đổi:**
  - Đề xuất kế hoạch khảo sát khoảng hai mươi ngày làm việc, tiến hành song song giữa khảo sát số liệu và khảo sát nghiệp vụ.
  - Đề xuất làm tổng quan trước để ra khung ưu tiên, sau đó mới đi vào kế hoạch sản xuất chi tiết.
  - Đã chuẩn bị sẵn bộ câu hỏi khảo sát, sẽ gửi trước cho các đơn vị.
- **VNA trao đổi:**
  - Yêu cầu một lộ trình cụ thể để báo cáo lãnh đạo.
  - Việc vào làm việc với từng đơn vị cần có công văn đề nghị và thông báo trước khoảng một tuần.
- **Kết quả:** thống nhất khảo sát song song, làm tổng quan trước; VTIT gửi công văn và bộ câu hỏi trước mỗi đợt.

### 2. Hai nhóm đối tượng giám sát chính

- **VNA trao đổi:**
  - Có hai nhóm người dùng giám sát khác nhau: trực ban trưởng quan tâm trạng thái khai thác và khách nối chuyến; cán bộ tài liệu theo dõi tình trạng tài liệu chuyến bay (đã được tổ bay xác nhận hoặc tải xuống hay chưa).
  - Hiện đang xem lần lượt từng chuyến, mong muốn giám sát được nhiều chuyến cùng lúc.
- **VTIT trao đổi:**
  - Đề xuất xây dựng màn hình giám sát riêng cho từng nhóm, có nhiều cấp xem từ tổng quan đến chi tiết từng chuyến và từng hành khách.
- **Kết quả:** thống nhất tách màn hình giám sát riêng cho hai nhóm đối tượng.

### 3. Tích hợp dữ liệu và thay thế hệ thống cũ

- **VNA trao đổi:**
  - Mục tiêu cốt lõi là thay thế hệ thống FMS hiện hành đang vận hành chậm.
  - Dữ liệu chuyển động chuyến bay hiện chỉ phủ khoảng 90% số chuyến của hãng (các hãng khác khoảng 99%), độ chính xác khoảng 79%; quy mô khoảng mười một nghìn chuyến mỗi tháng.
- **VTIT trao đổi:**
  - Đề xuất cơ chế cập nhật theo sự kiện kết hợp ảnh chụp dữ liệu định kỳ để bảo đảm dữ liệu gần nhất.
- **Kết quả:** thống nhất mục tiêu thay thế FMS; cơ chế cập nhật dữ liệu chưa chốt, cần khảo sát thêm.

### 4. Báo cáo

- **VNA trao đổi:**
  - Báo cáo hiện thiếu nhất quán, cùng một chỉ số đúng giờ nhưng các báo cáo cho con số khác nhau.
  - Ưu tiên xử lý báo cáo hàng ngày, hai nhóm quan trọng nhất là báo cáo lịch bay và báo cáo của trực ban trưởng.
  - Phát hành báo cáo qua thư điện tử, không yêu cầu ký số.
- **VTIT trao đổi:**
  - Đề xuất tiếp cận hai chiều (từ báo cáo ngược về dữ liệu và từ dữ liệu tích hợp lên) để tránh bỏ sót.
- **Kết quả:** ưu tiên báo cáo hàng ngày; phát hành qua thư điện tử, không ký số.

### 5. Quy trình cân bằng tải và dữ liệu kỹ thuật tàu bay

- **VNA trao đổi:**
  - Mô tả quy trình lập phiếu cân bằng tải đi qua bốn bước, từ nhập trọng tải ước tính đến phục vụ tại sân bay; đây là chuỗi gắn kết chặt giữa nhiều hệ thống.
  - Thông tin tình trạng kỹ thuật và hệ số khai thác tàu bay được lấy từ hệ thống bảo dưỡng.
- **VTIT trao đổi:**
  - Ghi nhận để thiết kế tích hợp; lưu ý phần tính hệ số khai thác cần làm rõ nguồn và cách tính.
- **Kết quả:** thống nhất giữ nguyên quy trình bốn bước, làm rõ chi tiết ở buổi sau.

### 6. Khách nối chuyến

- **VNA trao đổi:**
  - Cần theo dõi khách nối vào và nối ra để cảnh báo nguy cơ lỡ nối chuyến khi chậm chuyến.
- **VTIT trao đổi:**
  - Nguồn dữ liệu hành khách lấy từ hệ thống đặt chỗ, nhưng chưa kiểm chứng được là dữ liệu thời gian thực hay bản sao; hiện chưa bên nào dùng nguồn này để ra quyết định.
- **Kết quả:** cần kiểm chứng lại nguồn dữ liệu hành khách trước khi dùng để ra quyết định.

### 7. Hạ tầng và môi trường

- **VNA trao đổi:**
  - Môi trường kiểm thử đã được dựng; có hai mốc ràng buộc là hạ tầng sẵn sàng trước giữa tháng Sáu và thông kết nối trước ngày 30 tháng Sáu.
  - Việc cấp phát hạ tầng đám mây còn chậm.
- **VTIT trao đổi:**
  - Cần sớm chốt số lượng máy chủ và địa chỉ mạng để xin cấp.
- **Kết quả:** phối hợp xử lý việc cấp hạ tầng đám mây và chốt số máy chủ.

## III. Các nội dung đã thống nhất

| # | Nội dung thống nhất |
|---|---|
| 1 | Khảo sát song song số liệu và nghiệp vụ; làm tổng quan trước, chi tiết sau |
| 2 | Tách màn hình giám sát riêng cho hai nhóm đối tượng |
| 3 | Mục tiêu tích hợp là thay thế hệ thống FMS |
| 4 | Ưu tiên báo cáo hàng ngày; phát hành qua thư điện tử, không ký số |
| 5 | Phân quyền theo chức năng; tài liệu sinh từ TOSS thì lưu, tài liệu từ hệ thống ngoài lưu tạm |

## IV. Vấn đề cần làm rõ

- Cơ chế duy trì dữ liệu gần nhất.
- Logic cụ thể của từng báo cáo, chỉ mô tả kỹ được khi đã có số liệu thật.
- Tiến độ cấp phát hạ tầng đám mây.
- Cách kiểm chứng nguồn dữ liệu hành khách.
- Phương án khi hệ thống lập kế hoạch bay không cho tích hợp trực tiếp.
- Danh sách người dự, vai trò và thẩm quyền quyết định của từng người.

## V. Kết luận và kế hoạch tiếp theo

Buổi khảo sát đã xác lập được phạm vi tổng thể, lộ trình triển khai, hai nhóm đối tượng giám sát và mục tiêu thay thế hệ thống cũ. Bước tiếp theo là khảo sát chi tiết theo từng đối tượng, bắt đầu từ bộ phận điều phái, đồng thời chốt số lượng máy chủ và địa chỉ mạng, xử lý việc cấp hạ tầng đám mây và kiểm chứng nguồn dữ liệu hành khách.

---

*Báo cáo lập trên cơ sở ghi nhận tại buổi làm việc; một số nội dung kỹ thuật cần đối chiếu lại với người dự họp trước khi sử dụng làm căn cứ chính thức.*
