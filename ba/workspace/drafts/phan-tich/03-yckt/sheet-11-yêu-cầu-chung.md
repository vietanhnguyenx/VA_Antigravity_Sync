---
source: "TOSS - Triển khai-YCKT.xlsx · sheet 11"
document_type: "YCKT decomposition — per sheet"
date: "2026-06-09"
---

# Sheet 11: Yêu cầu chung

> Nguồn: TOSS - Triển khai-YCKT.xlsx · sheet 11 · 14 dòng. Quay lại [INDEX](INDEX.md).

1. Có cơ chế đồng bộ hệ thống TEST lấy các dữ liệu PROD
2. Tất cả tìm kiếm, filter, nhập liệu mặc định chữ hoa
3. Không có tình trạng dropdown box quay chờ load thêm (như khi chọn CQĐV của MO Plus)
4. Một cấu hình chung các trường hiển thị tại mỗi màn hình của TBT (quản lý CB tổng hợp), DSP, CLC do admin thiết lập chung (ăn với tất cả user)
Ngoài ra user có thể lựa chọn các trường thông tin riêng theo mong muốn
5. Migrate hoàn toàn dữ liệu Netline hiện nay
6. Thông báo CĐS, các CQĐV về nhu cầu tích hợp dữ liệu với Flight Ops (phương thức kết nối hiện tại, các trường dữ liệu/ thông tin, hệ thống có nhu cầu sử dụng)
7. Hiển thị dữ liệu bảng nhỏ kiểu title - value dạng tile bên trái, value bên phải cho dễ quan sát (giống VNeID). Như MO Plus chỗ user - khó quan sát
8. Báo cáo tỷ lệ dữ liệu định kỳ đối với tất cả các dữ liệu tích hợp
9. Giao diện | Có Darkmode/ Light Mode
Phiên bản web mobile có trên cả điện thoại/ iPad
10. Bố trí báo cáo: | Standard Filter
Thêm bộ lọc riêng của báo cáo nếu cần thiết
Khu vực biểu đồ
Khu vực bảng dữ liệu chi tiết (mỗi báo cáo chi tiết các dữ liệu, đầu vào, tính toán của riêng báo cáo đó). Cho phép chọn thêm cột dữ liệu vào báo cáo data chi tiết (các cột thuộc FOS)
Các dữ liệu cơ sở thì để ở FOS report
11. Tự động gửi những báo cáo thường kỳ (ms trang đang thực hiện)
12. Rà soát các vấn đề An đang tự code đưa vào hết
13. Số hóa, bóc tách toàn bộ OFP, kể cả những thông tin không yêu cầu trong báo cáo FOS
14. Cho phép điều chỉnh độ rộng cột trên web (tương tự web ACDM). Khi refresh trang vẫn giữ độ rộng đã kéo
