# BẢN MÔ TẢ CÔNG VIỆC BA - THIẾT KẾ & ĐẶC TẢ PHÂN HỆ WEBSITE (MODULE NƯỚC SẠCH)

Tài liệu này hệ thống hóa và mô tả chi tiết các đầu việc phân tích thiết kế mà anh (**BA phụ trách Website**) cần thực hiện cho Module Nước sạch (Potable Water Service) dựa trên danh sách yêu cầu thực tế trong file [ULNL_CNM.VNA.MO.CR.Phase2_nước sạch-dpm.xlsx - NL Chuc nang.csv](file:///c:/Users/anhnlv/Downloads/TOSS-20260611T014328Z-3-001/TOSS/ba/workspace/input/ULNL_CNM.VNA.MO.CR.Phase2_n%C6%B0%E1%BB%9Bc%20s%E1%BA%A1ch-dpm.xlsx%20-%20NL%20Chuc%20nang.csv) và định hướng nghiệp vụ hệ thống TOS.

---

## I. Các Quy Chuẩn Thiết Kế UI/UX Chung Trên Web TOS (Bắt buộc áp dụng)

Mọi màn hình Web thiết kế nháp (Mockup/Wireframe) và mô tả nghiệp vụ (SRS) đều phải tuân thủ các quy tắc UI/UX chung của hệ thống TOS:

1. **Tùy biến cột (Customize Columns):** Cho phép người dùng cấu hình ẩn/hiện cột trên mọi bảng biểu. Cấu hình này phải được lưu tự động theo tài khoản đăng nhập (User-based settings) để hiển thị lại ở lần đăng nhập tiếp theo.
2. **Tối ưu hóa không gian (Collapse Component):** Bộ lọc tìm kiếm (Filter) và Menu điều hướng bên trái phải có tính năng thu gọn/mở rộng (Collapse/Expand) để tăng diện tích hiển thị của bảng dữ liệu.
3. **Múi giờ hiển thị (Timezone):** Bắt buộc hiển thị theo giờ quốc tế **UTC** đối với mọi dữ liệu thời gian liên quan đến chuyến bay (giờ cất/hạ cánh, giờ gửi dữ liệu...).
4. **Trường dữ liệu trống:** Hiển thị ký tự gạch ngang `-` khi dữ liệu tích hợp từ các hệ thống vệ tinh chưa trả về, không để trống hoặc hiển thị null.

---

## II. Chi Tiết Các Màn Hình Cần Thiết Kế Nháp (Mockup) & Viết Đặc Tả (SRS)

Anh cần xử lý tổng cộng **11 yêu cầu chức năng (UI)** được chia làm 3 nhóm nghiệp vụ sau:

### Nhóm 1: Quản lý Dữ liệu cấu hình & Định mức (Master Data & Configs)
Nhóm này phục vụ quản trị viên thiết lập các tham số nền cho engine tính toán lượng nước khuyến nghị.

#### 1. Màn hình Cấu hình Dung tích bồn nước (Tank Capacity) -- YC25
* **Mô tả:** Quản lý dung tích chứa nước sạch (lít) của từng loại tàu bay (A321, A350, B787, ATR...).
* **Đầu việc Mockup:**
  * Bảng hiển thị danh sách: Loại tàu bay, Hãng sản xuất, Dung tích Tank chứa (Lít), Trạng thái (Hoạt động/Khóa), Người cập nhật cuối, Thời gian cập nhật cuối.
  * Form thêm mới/sửa cấu hình (Dung tích bồn phải là số nguyên dương).
  * Các nút hành động: Thêm mới, Sửa, Khóa/Mở khóa.
* **Đầu việc SRS (Đặc tả logic):**
  * Định nghĩa ràng buộc dữ liệu (Validation): Loại tàu bay là duy nhất, Dung tích tank > 0.
  * Phân quyền (RBAC): Chỉ Admin hệ thống mới có quyền chỉnh sửa/thêm mới, các user khác chỉ có quyền xem.

#### 2. Màn hình Cấu hình Định mức tiêu thụ mặc định (Default Consumption Rate) -- YC26
* **Mô tả:** Thiết lập định mức tiêu thụ nước sạch (lít/người/giờ) khi chặng bay hoặc tàu bay chưa có dữ liệu lịch sử.
* **Đầu việc Mockup:**
  * Bộ lọc tìm kiếm: Loại tàu bay, Chặng bay (Nội địa ngắn/Nội địa dài/Quốc tế), Khung giờ bay.
  * Bảng danh sách: Loại tàu bay, Nhóm chặng bay, Khung giờ khai thác, Định mức mặc định (Lít/người/giờ).
  * Form cập nhật nhanh trực tiếp trên dòng (Inline edit) hoặc Pop-up.
* **Đầu việc SRS (Đặc tả logic):**
  * Ràng buộc logic: Định mức tiêu thụ phải là số thập phân dương (ví dụ: `1.82`).
  * Logic fallback: Khi engine không tính được suất tiêu thụ lịch sử, hệ thống sẽ dò tìm định mức cấu hình ở màn hình này theo thứ tự ưu tiên giảm dần: (1) Trùng khớp cả Loại tàu + Chặng + Khung giờ $\rightarrow$ (2) Trùng khớp Loại tàu + Chặng $\rightarrow$ (3) Trùng khớp Loại tàu $\rightarrow$ (4) Định mức mặc định toàn hệ thống.

#### 3. Màn hình Cấu hình Tham số đệm (Buffer Configuration) -- YC27
* **Mô tả:** Cấu hình các tham số đệm an toàn cộng thêm trước khi khuyến nghị nạp nước.
* **Đầu việc Mockup:**
  * Giao diện cấu hình chia làm 3 tab/khu vực:
    * *Tab 1 (Sân bay):* Giờ taxi trung bình tại từng sân bay đi/đến (phút).
    * *Tab 2 (Chặng bay):* Giờ dự phòng (holding time - phút) theo chặng.
    * *Tab 3 (Đội tàu):* Lượng nước tối thiểu an toàn (lít) và **Buffer theo số lượng khách tương đương (Pax equivalent buffer - ví dụ: mặc định +5 người)**.
* **Đầu việc SRS (Đặc tả logic):**
  * Đặc tả chi tiết cách các tham số buffer này tham gia vào công thức lõi tại mục 3.2 của BRD để tính ra `W_khuyến_nghị`.

#### 4. Màn hình Cấu hình Ngưỡng ngoại lệ (Exception Threshold) -- YC28
* **Mô tả:** Thiết lập các biên cảnh báo để lọc ra các chuyến bay có dấu hiệu bất thường.
* **Đầu việc Mockup:**
  * Form cấu hình các tham số:
    * Ngưỡng cảnh báo nạp thừa ($X\%$ so với khuyến nghị).
    * Ngưỡng cảnh báo dùng cạn nước ($Y\%$ lượng nước còn lại khi hạ cánh).
    * Ngưỡng chênh lệch gửi thông báo ($Z$ lít chênh lệch giữa tính toán Booking và Loadsheet để bắn Notification lên App).
* **Đầu việc SRS (Đặc tả logic):**
  * Ràng buộc validation: Các tỷ lệ $\%$ phải nằm trong khoảng $[0 - 100]$.
  * Logic kích hoạt cảnh báo: Khi dữ liệu chuyến bay được ghi nhận, hệ thống so sánh thực tế với các ngưỡng này để tự động đánh dấu cờ cảnh báo (Flag ngoại lệ).

---

### Nhóm 2: Nhập liệu / Vận hành (Operations)

#### 5. Màn hình Nhập tay/Điều chỉnh dữ liệu nước chuyến bay (Manual Water Data Entry) -- YC33
* **Mô tả:** Cho phép Admin nhập bổ sung hoặc điều chỉnh số liệu nước đầu/cuối chuyến khi ACARS lỗi hoặc tổ bay không submit được.
* **Đầu việc Mockup:**
  * Khung tìm kiếm chuyến bay: Số hiệu chuyến bay, Ngày bay (UTC), Loại tàu bay, Đăng ký tàu bay (Tail number).
  * Bảng kết quả tìm kiếm kèm nút "Nhập/Chỉnh sửa số liệu nước".
  * Form nhập liệu (Pop-up):
    * Hiển thị thông tin chuyến bay (chỉ đọc).
    * Nhập % nước đầu chuyến $\rightarrow$ Hệ thống tự tính quy đổi ra Lít.
    * Nhập % nước cuối chuyến $\rightarrow$ Hệ thống tự tính lượng nước đã tiêu thụ thực tế.
    * Trường ghi chú/Lý do điều chỉnh (bắt buộc nhập nếu là chỉnh sửa dữ liệu).
* **Đầu việc SRS (Đặc tả logic):**
  * Logic ghi vết (Audit trail): Lưu lại rõ nguồn dữ liệu là `Nhập tay - Admin [Tên User]` cùng giá trị trước/sau khi sửa.
  * Validation: $\%$ đầu chuyến phải lớn hơn hoặc bằng $\%$ cuối chuyến. Số liệu nhập tay sẽ ghi đè lên dữ liệu ACARS hiển thị trên báo cáo nhưng không làm mất dữ liệu ACARS gốc (lưu lịch sử đối chiếu).

---

### Nhóm 3: Hệ thống Báo cáo & Thống kê (Reports & Export)
*Nhóm này yêu cầu thiết kế giao diện hiển thị dữ liệu lớn, hỗ trợ lọc đa chiều và tương tác trực quan.*

#### 6. Báo cáo Suất tiêu thụ lịch sử (Historical Consumption Rate Report) -- YC34
* **Mô tả:** Phân tích suất tiêu thụ nước trung bình (lít/người/giờ) phục vụ hiệu chỉnh định mức.
* **Đầu việc Mockup:**
  * Bộ lọc: Khoảng thời gian, Loại tàu bay, Chặng bay, Khung giờ.
  * Khu vực biểu đồ (Chart): Biểu đồ đường thể hiện xu hướng biến động suất tiêu thụ theo tuần/tháng.
  * Bảng chi tiết: Loại tàu, Chặng bay, Khung giờ, Số lượng chuyến bay thống kê, Suất tiêu thụ trung bình lịch sử (L/người/h).
* **Đầu việc SRS (Đặc tả logic):**
  * Công thức tính suất tiêu thụ lịch sử trung bình dựa trên tổng lượng tiêu thụ chia cho tổng (Pax * Giờ bay) của tập mẫu lọc ra.

#### 7. Báo cáo Nước đầu/cuối chuyến bay (Departure & Arrival Water Report) -- YC35
* **Mô tả:** Đối chiếu chi tiết số liệu nước từ ACARS và Tổ bay submit trên từng chuyến bay.
* **Đầu việc Mockup:**
  * Bộ lọc: Ngày bay, Số hiệu chuyến bay, Loại tàu bay, Trạng thái lệch số liệu (Tất cả / Lệch / Khớp).
  * Bảng dữ liệu: Chuyến bay, Loại tàu, Số khách (Pax), Nước khuyến nghị (L), Đầu chuyến (ACARS - Lít/%), Đầu chuyến (Tổ bay - Lít/%), Cuối chuyến (Tổ bay - Lít/%), Lượng nước tiêu thụ thực tế, Suất tiêu thụ thực tế (L/người/h).
  * Highlight màu sắc: Tô màu vàng các dòng có sự chênh lệch lớn giữa đầu chuyến của ACARS và Tổ bay nhập (vượt quá ngưỡng chênh lệch quy định).
* **Đầu việc SRS (Đặc tả logic):**
  * Logic tô màu cảnh báo chênh lệch dữ liệu đầu chuyến: $|ACARS\_Departure\_Liters - Crew\_Departure\_Liters| > \text{Ngưỡng\_cấu\_hình}$.

#### 8. Báo cáo Chuyến bay nạp thừa nước (Overfueled Flights Report) -- YC36
* **Mô tả:** Danh sách các chuyến bay nạp nước thực tế vượt quá khuyến nghị gây lãng phí tải.
* **Đầu việc Mockup:**
  * Bộ lọc: Khoảng thời gian, Sân bay nạp nước, Loại tàu, Tỷ lệ nạp thừa.
  * Bảng dữ liệu: Chuyến bay, Sân bay nạp, Loại tàu bay, Lượng nước khuyến nghị (L), Lượng nước nạp thực tế (L), Thừa (Lít), Tỷ lệ thừa (%).
  * Sắp xếp: Mặc định sắp xếp giảm dần theo lượng nước thừa (Lít) để ưu tiên xử lý chuyến lãng phí nhất.
* **Đầu việc SRS (Đặc tả logic):**
  * Điều kiện lọc: Lượng nước nạp thực tế đầu chuyến > Lượng khuyến nghị hệ thống tính.

#### 9. Báo cáo Chuyến bay dùng cạn nước (Depleted Water Flights Report) -- YC37
* **Mô tả:** Thống kê chuyến bay hạ cánh với lượng nước còn lại quá thấp dưới ngưỡng an toàn.
* **Đầu việc Mockup:**
  * Bảng dữ liệu tương tự báo cáo nạp thừa, tập trung vào cột: Lượng nước còn lại cuối chuyến (Lít), Tỷ lệ còn lại cuối chuyến (%).
  * Cảnh báo màu đỏ nổi bật cho các chuyến kết thúc dưới $Y\%$.
* **Đầu việc SRS (Đặc tả logic):**
  * Điều kiện lọc: $\%$ nước cuối chuyến < Ngưỡng $Y\%$ cấu hình tại W-01.

#### 10. Báo cáo Chuyến bay nạp nước vượt lượng tính toán (Water Overrequest Flights Report) -- YC38
* **Mô tả:** Thống kê các chuyến bay mà tổ bay chủ động yêu cầu nạp vượt gợi ý kèm lý do.
* **Đầu việc Mockup:**
  * Bảng hiển thị thông tin chuyến bay, lượng nước khuyến nghị, lượng nước thực tế nạp, lượng chênh lệch và **Trường Lý do giải trình/yêu cầu** do tổ bay nhập trên App.
* **Đầu việc SRS (Đặc tả logic):**
  * Thu thập lý do từ trường nhập liệu của tổ bay trên ứng dụng di động để hiển thị đối soát.

#### 11. Chức năng Xuất báo cáo Excel (Report Export) -- YC39
* **Mô tả:** Cho phép xuất dữ liệu từ các báo cáo trên ra tệp Excel.
* **Đầu việc Mockup:** Nút bấm "Xuất Excel" đặt tại góc trên bên phải của mỗi bảng báo cáo (W-03 đến W-07).
* **Đầu việc SRS (Đặc tả logic):**
  * Quy định định dạng file xuất ra (xlsx).
  * Quy tắc dữ liệu xuất: Xuất đúng theo dữ liệu đang hiển thị sau khi áp dụng bộ lọc (Filter) và tùy biến ẩn/hiện cột (Customize Columns) của người dùng hiện tại. Tên file xuất ra tuân thủ quy ước: `Bao-cao-[Ten-bao-cao]-yyyyMMdd-HHmmss.xlsx`.

---

## III. Các Bước Triển Khai Tiếp Theo Cho BA Website

Để hoàn thành nhiệm vụ này một cách hiệu quả, anh nên thực hiện theo quy trình sau:

1. **Bước 1: Vẽ Wireframe/Mockup giao diện**
   * Sử dụng công cụ thiết kế (như Figma) để vẽ nháp 11 màn hình trên.
   * Áp dụng giao diện mẫu của hệ thống TOS đang có (có thể tham khảo file mẫu giao diện quản trị trong dự án: [system-admin-mockup.html](file:///c:/Users/anhnlv/Downloads/TOSS-20260611T014328Z-3-001/TOSS/ba/workspace/drafts/mockup/system-admin-mockup.html)).
2. **Bước 2: Viết Tài liệu Đặc tả Chức năng (SRS / FRD)**
   * Tạo tệp tài liệu đặc tả chức năng cho phần Website dưới dạng Markdown trong thư mục `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/` (ví dụ đặt tên: `SRS-TOSS-Water-Web-v1.0.md`).
   * Viết chi tiết cho từng màn hình bao gồm: Mô tả chung, Luồng nghiệp vụ chính, Mô tả giao diện chi tiết (Bảng các trường thông tin hiển thị, kiểu dữ liệu, ràng buộc validate, hành động của nút bấm), và Ma trận phân quyền truy cập.
3. **Bước 3: Xuất bản tài liệu sang Word (.docx)**
   * Sử dụng kỹ năng `export-word` để chuyển đổi tệp Markdown SRS sang tệp Word đúng biểu mẫu Viettel để bàn giao và ký duyệt.
   * Bàn giao bản vẽ Mockup và tài liệu đặc tả cho đội phát triển và thiết kế (Quân) để triển khai lập trình.
