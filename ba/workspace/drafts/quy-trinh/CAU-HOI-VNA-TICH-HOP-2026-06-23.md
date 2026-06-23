---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-23"
status: "Draft"
document_type: "Gói câu hỏi tích hợp gửi VNA / Lufthansa Systems"
---

# Câu hỏi tích hợp TOSS ↔ NetLine/OPS++ — gửi VNA / NetOps (LHS)

> Gom các điểm cần VNA/LHS làm rõ để TOSS thiết kế và triển khai tích hợp (đã theo dõi trong OID-TOSS-001). Sắp theo nhóm để tiện trao đổi tại buổi làm việc tới (dự kiến 24/06). Mỗi câu kèm mã OID để truy vết.

## A. Hạ tầng kết nối (ưu tiên — sát mốc 24/06 VPN & 01/07 SFTP)
1. **Cấu trúc thư mục SFTP chuẩn** cho từng đầu dữ liệu — quy tắc đặt tên thư mục, đặt tên tệp, mã hóa ký tự (NetOps kiến nghị). `[OID KS-89]`
2. **Mốc thời gian gửi và chu kỳ đồng bộ** cho từng luồng, kèm thời gian lưu trữ trên SFTP và thời điểm xóa tệp. `[OID KS-90]`
3. Xác nhận mô hình **một máy chủ/khu lưu SFTP dùng chung** và **một địa chỉ email dùng chung** cho cả nhóm điện ngành (TOSS đã thống nhất hướng này — cần VNA/NetOps xác nhận để cấu hình). `[N11 — đối chiếu §2bis.C]`

## B. Định dạng & nguồn từng luồng
4. **Định dạng dữ liệu Lufthansa Systems yêu cầu** cho từng luồng inbound/outbound. `[OID KS-88]`
5. **Điện FMM (Fuel Monitoring Message):** định dạng chuẩn, thời điểm gửi và nguồn dữ liệu nhiên liệu để TOSS tự sinh. `[OID KS-93]`
6. **Định dạng SSIM** mà Sabre đang dùng, và bên nào chế biến nếu định dạng khác (TOSS chỉ forward hay phải xử lý). `[OID KS-96]`
7. **Nguồn và nội dung Pax Detail** (khách thực tế sau cất cánh) cùng quan hệ với Load Sheet. `[OID KS-100]`
8. **Cấu trúc NOTAM** lấy từ cơ quan Quản lý bay và **mục đích sử dụng phía OPS++**. `[OID KS-101, KS-102]`

## C. Cơ chế kết nối & đồng bộ
9. **Routing trung gian** của điện qua Sitatex tới NetLine cũ (đường đi cụ thể). `[OID KS-94]`
10. **Cách TOSS kết nối vào ổ chia sẻ** địa chỉ SITA HDQONVN để nhận điện ACARS/MVA. `[OID KS-95]`
11. **Rate-limit của Amadeus** với nhịp quét PTM 5 phút/lần trong cửa sổ 48 giờ. `[OID KS-97]`
12. **So sánh cấu trúc bảng (schema)** giữa NetLine Classic ↔ Clone DB ↔ DB nội bộ TOSS để TOSS thiết kế truy vấn. `[OID KS-104]`
13. **Cơ chế đồng bộ Event-Based** vào DB nội bộ — xử lý sự kiện đến không đúng thứ tự (out-of-order) hoặc thiếu sự kiện (missing event). `[OID KS-105]`
14. **Cargo từ Cargo Spot:** lấy trực tiếp qua DB view hay qua một lớp nhân bản trung gian, và có rate-limit không. `[OID KS-106]`

## D. Trách nhiệm & tham số nghiệp vụ
15. **Trách nhiệm tính Crew Connection** (tổ bay nối chuyến) thuộc TOSS hay NetLine. `[OID KS-99]`
16. **Tần suất quét cập nhật Crew Assignment** sau lần quét khởi tạo (02:00 ngày 26 hàng tháng). `[OID KS-98]`
17. **Đơn vị của ngưỡng cảnh báo "tổ bay < 1000"** trong logic Crew Assignment (số chuyến / số thiết bị / số người). `[OID D-11]`
18. **Spec endpoint API trạng thái chuyến (Flight Status) của VIAGS** để TOSS lấy Gate Info. `[OID D-12]`
19. **Trạng thái Flight Data (ACDM)** đang pending — xác nhận phạm vi và thời điểm cung cấp. `[OID KS-103]`

## E. Phạm vi (xác nhận lại)
20. Xác nhận **phạm vi TOSS = các luồng "Phương thức = Thông qua TOSS"**; các luồng "Trực tiếp" (LIDO/AMOS → NetOps++) do đối tác tự đấu nối, ngoài phạm vi TOSS. `[BA Lead chốt 23/06 — DEC-16]`
21. **Ranh giới phần TOSS xử lý dữ liệu nội bộ** sau khi nhận từ OPS++ — thuộc gói dự án nào (TOSS không yêu cầu lưu trữ thay NetOps đã rõ; còn lại scope BR). `[OID DEC-17]`
