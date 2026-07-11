---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Team"
version: "1.0"
date: "2026-06-18"
status: "Draft"
document_type: "SRS"
---

# Đặc tả chức năng — Phân hệ Quản lý nước sạch (Potable Water Service) trên Web EFF

*Tài liệu này đặc tả chi tiết các chức năng phía Website của phân hệ Quản lý nước sạch (Potable Water Service) thuộc hệ thống MO Plus / Web EFF (Electronic Flight Folder — Sổ tay bay điện tử) của VNA. Phân hệ được tích hợp trực tiếp vào giao diện Web EFF hiện tại (Danh sách chuyến bay cột trái — Khung chi tiết dạng Tab cột phải — thanh điều hướng Menu ở Header), gồm 3 nhóm chức năng: (1) Tab "Nước sạch" trên màn hình chi tiết chuyến bay để xem và nhập tay chỉ số nước (YC33); (2) 5 báo cáo đối chiếu & giám sát trong Menu Report kèm chức năng xuất Excel (YC34–YC39); (3) 4 màn hình cấu hình tham số & danh mục trong Menu Admin → Water Service Config (YC25–YC28). Nội dung được phân rã trung thực 100% từ danh sách yêu cầu gốc `ULNL_CNM.VNA.MO.CR.Phase2_nước sạch` (cột "Tên Chức năng" = WEBSITE) và bản mô tả công việc BA. Các điểm nguồn chưa rõ được giữ nguyên và gom tại mục "Câu hỏi / Nội dung cần làm rõ" — không suy diễn.*

*Các sơ đồ luồng hệ thống được mô tả đầy đủ bằng bảng "Mô tả luồng xử lý" trong từng chức năng; bản vẽ sơ đồ gốc được lưu kèm trong hồ sơ thiết kế.*

*Ghi chú thuật ngữ: A-CAD/ACARS (Aircraft Communications Addressing and Reporting System — hệ thống điện văn liên lạc tàu bay), Loadsheet (bảng cân bằng tải), Pax (Passenger — hành khách), UTC (Coordinated Universal Time — giờ phối hợp quốc tế), Buffer (tham số đệm an toàn).*

---

## NHÓM A — Tab chuyến bay

## A1. Nước sạch — Xem và Nhập liệu nước sạch chuyến bay

*Nguồn: YC33 — Manual Water Data Entry (UI), mã loại chức năng GD_WEB1.*

| Tên chức năng | Nước sạch — Xem và Nhập liệu nước sạch chuyến bay |
| :---- | :---- |
| **Mục đích** | Cho phép Admin xem thông số nước khuyến nghị của chuyến bay và nhập tay / điều chỉnh số liệu nước sạch đầu chuyến và cuối chuyến khi hệ thống không nhận được hoặc nghi ngờ dữ liệu từ A-CAD (ACARS), hoặc khi tổ bay không gửi được dữ liệu qua App MO Plus |
| **Trigger** | Người dùng chọn một chuyến bay tại bảng Danh sách chuyến bay (cột trái Web EFF), sau đó mở Tab "Nước sạch" (Water Service) ở Khung chi tiết cột phải |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền truy cập Tab Nước sạch của chuyến bay; chuyến bay đã được chọn ở cột trái |
| **Hậu điều kiện** | Số liệu nhập tay/điều chỉnh được lưu vào DB kèm bản ghi lưu vết (Audit log: giá trị cũ, giá trị mới, ID người dùng, lý do điều chỉnh); số liệu nhập tay được ưu tiên hiển thị trên các báo cáo |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng chọn một chuyến bay ở bảng Danh sách chuyến bay (cột trái), hệ thống hiển thị Khung chi tiết chuyến bay ở cột phải |
| 2 | Người dùng click Tab "Nước sạch" (Water Service) nằm sau tab *Request documents* |
| 3 | Hệ thống hiển thị thông số khuyến nghị nạp (suất tiêu thụ lịch sử áp dụng, tổng khách Pax + Crew, giờ bay, lượng nước khuyến nghị đã tính kèm buffer) và trạng thái nguồn dữ liệu khách (Booking Amadeus hay đã bóc tách từ Loadsheet) |
| 4 | Hệ thống hiển thị bảng so khớp & xác nhận số liệu nước đầu/cuối chuyến gồm 3 nguồn: (a) số liệu tự động từ A-CAD/ACARS (với tàu A350/B787); (b) số liệu do Tổ bay submit qua App MO Plus (kèm liên kết xem ảnh đồng hồ đã chụp); (c) dòng Nhập tay/Điều chỉnh dành cho Admin |
| 5 | Người dùng nhập chỉ số % nước đầu chuyến và/hoặc % nước cuối chuyến vào dòng Nhập tay; hệ thống tự động quy đổi ra lít tương ứng |
| 6 | Trường hợp người dùng sửa đổi một bản ghi đã tồn tại: hệ thống yêu cầu nhập Lý do điều chỉnh (bắt buộc) |
| 7 | Người dùng nhấn nút Lưu; hệ thống kiểm tra tính hợp lệ của dữ liệu (Validate). Nếu không hợp lệ chuyển sang bước 8; nếu hợp lệ chuyển sang bước 9 |
| 8 | Hiển thị thông báo lỗi (lỗi cấp trường: hiển thị inline; lỗi hệ thống: hiển thị toast message); giữ nguyên màn hình |
| 9 | Hệ thống lưu dữ liệu vào DB, ghi bản ghi Audit log (giá trị cũ, giá trị mới, ID user, lý do), hiển thị toast message lưu thành công và cập nhật lại bảng so khớp |

### Màn hình chức năng

> [ẢNH: YC33]

### Mô tả chi tiết màn hình

**Hiển thị thông số khuyến nghị:** Lượng nước khuyến nghị (đã tính kèm buffer) được lấy từ engine tính toán phía backend (YC18) và chỉ hiển thị tại đây dưới dạng chỉ đọc — phạm vi Website không thực hiện tính toán (xem Câu hỏi CH-01). Trạng thái nguồn dữ liệu khách thể hiện rõ số khách đang lấy từ Booking Amadeus hay đã bóc tách từ Loadsheet.

**Quy đổi % ↔ Lít:** Khi người dùng nhập chỉ số %, hệ thống tự động quy đổi sang lít theo công thức: **Lít = (% / 100) × Dung tích bồn nước sạch** của loại tàu bay tương ứng (dung tích lấy từ cấu hình YC25). Tương tự cho cả đầu chuyến và cuối chuyến.

**Lý do điều chỉnh:** Trường Lý do là **bắt buộc** khi sửa đổi một bản ghi đã tồn tại. Nếu để trống khi Lưu: hiển thị thông báo inline yêu cầu nhập lý do.

**Lưu vết & ưu tiên hiển thị:** Mọi thao tác nhập tay/điều chỉnh được ghi Audit log (giá trị cũ, giá trị mới, ID user thực hiện, thời điểm, lý do). Số liệu nhập tay (nguồn "Nhập tay — Admin") được **ưu tiên hiển thị** lên các báo cáo so với nguồn A-CAD và nguồn Tổ bay.

**Mốc thời gian UTC:** Thời điểm submit của tổ bay và thời điểm nhập tay/điều chỉnh hiển thị theo giờ UTC.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Suất tiêu thụ lịch sử áp dụng | Textview | historical_rate | Chỉ đọc. Suất tiêu thụ (lít/người/giờ) đang áp dụng cho chuyến bay, lấy từ engine backend |
| 2 | Tổng khách (Pax + Crew) | Textview | total_pax_crew | Chỉ đọc. Tổng số hành khách và tổ bay của chuyến |
| 3 | Giờ bay | Textview | flight_time | Chỉ đọc. Thời gian bay dự kiến của chuyến |
| 4 | Lượng nước khuyến nghị | Textview | recommended_water | Chỉ đọc. Lượng nước khuyến nghị (đã tính kèm buffer) lấy từ engine backend (YC18). Website chỉ hiển thị, không tính (xem CH-01) |
| 5 | Trạng thái nguồn dữ liệu khách | Textview | pax_source | Chỉ đọc. Hiển thị nguồn số khách: "Booking Amadeus" hoặc "Loadsheet" |
| 6 | Nước đầu chuyến — A-CAD/ACARS | Textview | dep_acars_pct | Chỉ đọc. % nước đầu chuyến tự động từ A-CAD (với tàu A350/B787). Lỗi/không có: hiển thị N/A |
| 7 | Nước đầu chuyến — Tổ bay | Textview + Link ảnh | dep_crew_pct | Chỉ đọc. % nước đầu chuyến do Tổ bay submit qua App MO Plus; kèm liên kết xem ảnh đồng hồ đã chụp. Lỗi/không có: hiển thị N/A |
| 8 | Nước cuối chuyến — Tổ bay | Textview + Link ảnh | arr_crew_pct | Chỉ đọc. % nước cuối chuyến do Tổ bay submit qua App MO Plus; kèm liên kết xem ảnh đồng hồ. Lỗi/không có: hiển thị N/A |
| 9 | % nước đầu chuyến (Nhập tay) | Textbox | dep_manual_pct | Cho phép Admin nhập chỉ số % nước đầu chuyến. Định dạng số; hệ thống tự quy đổi sang lít (ô số 11). *(Khoảng giá trị hợp lệ 0–100% cần xác nhận — xem CH-06)* |
| 10 | % nước cuối chuyến (Nhập tay) | Textbox | arr_manual_pct | Cho phép Admin nhập chỉ số % nước cuối chuyến. Định dạng số; hệ thống tự quy đổi sang lít (ô số 12) |
| 11 | Quy đổi Lít — đầu chuyến | Textview | dep_manual_liter | Chỉ đọc. Tự động tính = (% đầu / 100) × Dung tích bồn của loại tàu bay (YC25) |
| 12 | Quy đổi Lít — cuối chuyến | Textview | arr_manual_liter | Chỉ đọc. Tự động tính = (% cuối / 100) × Dung tích bồn của loại tàu bay (YC25) |
| 13 | Lý do điều chỉnh | Textarea | adjust_reason | **Bắt buộc nhập khi sửa đổi bản ghi đã tồn tại.** Mặc định để trống; placeholder "Nhập lý do điều chỉnh…". Tự động TRIM khoảng trắng đầu/cuối. Nếu để trống khi Lưu (trường hợp sửa): hiển thị thông báo inline yêu cầu nhập lý do |
| 14 | Người cập nhật / Thời điểm (UTC) | Textview | updated_by / updated_at_utc | Chỉ đọc. Hiển thị ID/tên người cập nhật cuối và thời điểm theo giờ UTC |
| 15 | Nút Lưu | Button | | Click: hệ thống validate. Nếu hợp lệ: lưu vào DB, ghi Audit log (giá trị cũ/mới, ID user, lý do), hiển thị toast thành công. Nếu không hợp lệ: hiển thị lỗi inline/toast và giữ nguyên màn hình. *(Có cần bước xác nhận trước khi ghi đè số liệu nhập tay không — xem CH-04)* |

---

## NHÓM B — Báo cáo (Menu Report)

*Ghi chú chung cho cả nhóm: 5 báo cáo dưới đây được truy cập từ Menu "Report" (dropdown) trên Header Web EFF. Mỗi báo cáo đều có nút "Xuất Excel" (YC39) đặc tả ngay trong bảng "Mô tả chi tiết màn hình" — xuất đúng bộ lọc đang áp dụng và tùy biến ẩn/hiện cột hiện tại của người dùng, định dạng .xlsx. Các báo cáo hỗ trợ tìm kiếm/lọc, phân trang theo kịch bản dùng chung; mốc thời gian hiển thị theo giờ UTC; số liệu nhập tay (Admin) được ưu tiên hiển thị. Lượng nước khuyến nghị dùng để đối chiếu lấy từ engine backend (YC18), Website chỉ hiển thị (xem CH-01).*

## B1. Báo cáo suất tiêu thụ nước sạch lịch sử

*Nguồn: YC34 — Report – Historical Consumption Rate (UI), mã loại chức năng GD_WEB2.*

| Tên chức năng | Báo cáo suất tiêu thụ nước sạch lịch sử |
| :---- | :---- |
| **Mục đích** | Thống kê suất tiêu thụ nước thực tế (lít/người/giờ) theo loại tàu, chặng bay, khung giờ và thời gian; phục vụ hiệu chỉnh định mức |
| **Trigger** | Người dùng mở Menu "Report" trên Header Web EFF, chọn "Báo cáo suất tiêu thụ nước sạch lịch sử" |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem báo cáo nước sạch |
| **Hậu điều kiện** | Màn hình hiển thị bảng dữ liệu chi tiết và biểu đồ xu hướng suất tiêu thụ theo bộ lọc |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng mở Menu Report, chọn báo cáo Suất tiêu thụ lịch sử |
| 2 | Hệ thống hiển thị màn hình báo cáo với bộ lọc mặc định (thời gian, dòng tàu, chặng bay) |
| 3 | Người dùng chọn/điều chỉnh bộ lọc và nhấn Search |
| 4 | Hệ thống gọi API lấy dữ liệu, hiển thị biểu đồ xu hướng (Line Chart) suất tiêu thụ theo tuần/tháng và bảng dữ liệu chi tiết |
| 5 | Trường hợp API rỗng/lỗi: hiển thị "Không có kết quả nào liên quan" |
| 6 | Người dùng nhấn "Xuất Excel": hệ thống xuất dữ liệu theo bộ lọc đang áp dụng ra file .xlsx |

### Màn hình chức năng

> [ẢNH: YC34]

### Mô tả chi tiết màn hình

**Tìm kiếm/lọc:** Người dùng lọc theo thời gian, dòng tàu, chặng bay. Khi nhấn Search, hệ thống reload dữ liệu phù hợp bộ lọc và đặt lại phân trang về trang 1. **Phân trang:** khi số bản ghi > 10, hiển thị phân trang theo kịch bản dùng chung. **Thông báo lỗi:** lỗi cấp trường hiển thị inline; lỗi hệ thống hiển thị toast. **Mốc thời gian:** hiển thị theo UTC.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Khoảng thời gian | Date range | filter_period | Trường để lọc theo khoảng thời gian (từ ngày – đến ngày) |
| 2 | Loại tàu bay | Combobox | filter_aircraft_type | Trường để lọc theo dòng tàu (A321, A350, B787, ATR…). Hỗ trợ tùy chọn 'All' |
| 3 | Chặng bay | Combobox | filter_route | Trường để lọc theo chặng bay. Hỗ trợ tùy chọn 'All' |
| 4 | Khung giờ khai thác | Combobox | filter_time_slot | Trường để lọc theo khung giờ khai thác |
| 5 | Nút Search | Button | | Click: lọc dữ liệu theo bộ lọc và trả về kết quả |
| 6 | Nút Reset | Button | | Click: xóa toàn bộ bộ lọc, reset phân trang, hiển thị lại danh sách mặc định |
| 7 | Biểu đồ xu hướng | Line Chart | trend_data | Hiển thị xu hướng suất tiêu thụ theo tuần/tháng theo bộ lọc đang áp dụng |
| 8 | Loại tàu bay | Textview | aircraft_type | Cột bảng dữ liệu. Lỗi/rỗng: hiển thị N/A |
| 9 | Chặng bay | Textview | route | Cột bảng dữ liệu. Lỗi/rỗng: hiển thị N/A |
| 10 | Khung giờ | Textview | time_slot | Cột bảng dữ liệu. Lỗi/rỗng: hiển thị N/A |
| 11 | Suất tiêu thụ trung bình | Textview | avg_rate | Suất tiêu thụ trung bình lũy kế (lít/người/giờ) của chặng/tàu. Lỗi/rỗng: hiển thị N/A |
| 12 | Nút Xuất Excel (YC39) | Button | | Click: xuất dữ liệu báo cáo theo đúng bộ lọc đang áp dụng và theo tùy biến ẩn/hiện cột hiện tại của người dùng ra file .xlsx |
| 13 | Phân trang | Pagination | | Khi số bản ghi > 10: hiển thị phân trang theo kịch bản dùng chung |

---

## B2. Báo cáo nước đầu/cuối chuyến bay

*Nguồn: YC35 — Report – Water At Departure & Arrival (UI), mã loại chức năng GD_WEB2.*

| Tên chức năng | Báo cáo nước đầu/cuối chuyến bay |
| :---- | :---- |
| **Mục đích** | Đối chiếu song song dữ liệu nước đầu chuyến / cuối chuyến giữa nguồn A-CAD (ACARS) và nguồn Tổ bay xác nhận; tính lượng nước đã dùng và suất thực tế; phát hiện lệch số liệu |
| **Trigger** | Người dùng mở Menu "Report", chọn "Báo cáo nước đầu/cuối chuyến bay" |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem báo cáo nước sạch |
| **Hậu điều kiện** | Màn hình hiển thị bảng đối chiếu nước đầu/cuối chuyến, làm nổi bật các trường hợp lệch số liệu |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng mở Menu Report, chọn báo cáo Nước đầu/cuối chuyến |
| 2 | Hệ thống hiển thị màn hình báo cáo với bộ lọc mặc định |
| 3 | Người dùng chọn bộ lọc và nhấn Search |
| 4 | Hệ thống gọi API lấy dữ liệu, hiển thị bảng đối chiếu; highlight màu cảnh báo khi chênh lệch giữa A-CAD và Tổ bay vượt ngưỡng lít cấu hình (YC28) |
| 5 | Trường hợp API rỗng/lỗi: hiển thị "Không có kết quả nào liên quan" |
| 6 | Người dùng nhấn "Xuất Excel": hệ thống xuất dữ liệu theo bộ lọc ra file .xlsx |

### Màn hình chức năng

> [ẢNH: YC35]

### Mô tả chi tiết màn hình

**Logic phát hiện lệch:** Khi chênh lệch số liệu giữa nguồn A-CAD và nguồn Tổ bay vượt quá số lít cấu hình (ngưỡng chênh lệch — YC28), hệ thống highlight màu cảnh báo dòng tương ứng. Số liệu nhập tay (Admin) ưu tiên hiển thị. Mốc thời gian theo UTC; phân trang và thông báo lỗi theo kịch bản dùng chung.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Khoảng thời gian | Date range | filter_period | Trường để lọc theo khoảng thời gian |
| 2 | Loại tàu bay | Combobox | filter_aircraft_type | Trường để lọc theo dòng tàu. Hỗ trợ 'All' |
| 3 | Chặng bay | Combobox | filter_route | Trường để lọc theo chặng bay. Hỗ trợ 'All' |
| 4 | Nút Search | Button | | Click: lọc dữ liệu và trả về kết quả |
| 5 | Nút Reset | Button | | Click: xóa bộ lọc, reset phân trang, hiển thị danh sách mặc định |
| 6 | Chuyến bay | Textview | flight_no | Số hiệu chuyến bay. Lỗi/rỗng: N/A |
| 7 | Loại tàu | Textview | aircraft_type | Loại tàu bay. Lỗi/rỗng: N/A |
| 8 | Số khách (Pax) | Textview | pax | Số hành khách. Lỗi/rỗng: N/A |
| 9 | Nước khuyến nghị | Textview | recommended_water | Lượng nước khuyến nghị (từ engine backend, chỉ hiển thị). Lỗi/rỗng: N/A |
| 10 | Đầu chuyến (A-CAD) | Textview | dep_acars | % / lít nước đầu chuyến từ A-CAD. Lỗi/rỗng: N/A |
| 11 | Đầu chuyến (Tổ bay) | Textview | dep_crew | % / lít nước đầu chuyến do Tổ bay xác nhận. Lỗi/rỗng: N/A |
| 12 | Cuối chuyến (Tổ bay) | Textview | arr_crew | % / lít nước cuối chuyến do Tổ bay xác nhận. Lỗi/rỗng: N/A |
| 13 | Tiêu thụ thực tế | Textview | actual_consumption | Lượng nước đã dùng trong chuyến (đầu − cuối). Lỗi/rỗng: N/A |
| 14 | Suất thực tế | Textview | actual_rate | Suất tiêu thụ thực tế (lít/người/giờ). Lỗi/rỗng: N/A |
| 15 | Cờ cảnh báo lệch | Icon/Highlight | mismatch_flag | Highlight màu khi chênh lệch A-CAD vs Tổ bay vượt ngưỡng lít cấu hình (YC28) |
| 16 | Nút Xuất Excel (YC39) | Button | | Click: xuất dữ liệu theo đúng bộ lọc và tùy biến ẩn/hiện cột hiện tại ra file .xlsx |
| 17 | Phân trang | Pagination | | Khi số bản ghi > 10: phân trang theo kịch bản dùng chung |

---

## B3. Báo cáo chuyến bay nạp thừa nước sạch

*Nguồn: YC36 — Report – Overfueled Flights (UI), mã loại chức năng GD_WEB2.*

| Tên chức năng | Báo cáo chuyến bay nạp thừa nước sạch |
| :---- | :---- |
| **Mục đích** | Liệt kê các chuyến bay nạp nước thực tế vượt ngưỡng khuyến nghị (theo % hoặc theo lít), giúp nhận diện nạp thừa gây lãng phí tải và tối ưu kế hoạch nạp |
| **Trigger** | Người dùng mở Menu "Report", chọn "Báo cáo chuyến bay nạp thừa nước sạch" |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem báo cáo nước sạch |
| **Hậu điều kiện** | Màn hình hiển thị danh sách các chuyến bay nạp thừa, sắp xếp giảm dần theo lượng nước thừa |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng mở Menu Report, chọn báo cáo Chuyến bay nạp thừa |
| 2 | Hệ thống hiển thị màn hình báo cáo với bộ lọc (gồm bộ lọc theo tỷ lệ nạp thừa) |
| 3 | Người dùng chọn bộ lọc và nhấn Search |
| 4 | Hệ thống lọc các chuyến có nước đầu chuyến thực tế > lượng nước khuyến nghị (theo ngưỡng nạp thừa cấu hình YC28); hiển thị danh sách sắp xếp giảm dần theo lượng nước thừa (Lít) |
| 5 | Trường hợp API rỗng/lỗi: hiển thị "Không có kết quả nào liên quan" |
| 6 | Người dùng nhấn "Xuất Excel": hệ thống xuất dữ liệu theo bộ lọc ra file .xlsx |

### Màn hình chức năng

> [ẢNH: YC36]

### Mô tả chi tiết màn hình

**Điều kiện lọc:** Hệ thống lọc các chuyến bay có nước đầu chuyến thực tế lớn hơn lượng nước khuyến nghị, vượt ngưỡng nạp thừa (X%) cấu hình tại YC28. Bảng dữ liệu sắp xếp giảm dần theo lượng nước thừa thực tế (Lít). Mốc thời gian theo UTC; phân trang/thông báo lỗi theo kịch bản dùng chung.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Khoảng thời gian | Date range | filter_period | Trường để lọc theo khoảng thời gian |
| 2 | Loại tàu bay | Combobox | filter_aircraft_type | Trường để lọc theo dòng tàu. Hỗ trợ 'All' |
| 3 | Tỷ lệ nạp thừa | Combobox/Textbox | filter_overfill_rate | Trường để lọc theo ngưỡng tỷ lệ nạp thừa |
| 4 | Nút Search | Button | | Click: lọc dữ liệu và trả về kết quả |
| 5 | Nút Reset | Button | | Click: xóa bộ lọc, reset phân trang, hiển thị danh sách mặc định |
| 6 | Chuyến bay | Textview | flight_no | Số hiệu chuyến bay. Lỗi/rỗng: N/A |
| 7 | Loại tàu | Textview | aircraft_type | Loại tàu bay. Lỗi/rỗng: N/A |
| 8 | Nước khuyến nghị | Textview | recommended_water | Lượng nước khuyến nghị (từ engine backend, chỉ hiển thị). Lỗi/rỗng: N/A |
| 9 | Nước nạp thực tế | Textview | actual_loaded | Lượng nước đầu chuyến thực tế (Lít). Lỗi/rỗng: N/A |
| 10 | Lượng nước thừa | Textview | overfill_amount | Chênh lệch = nước nạp thực tế − nước khuyến nghị (Lít). Mặc định sắp xếp giảm dần theo cột này. Lỗi/rỗng: N/A |
| 11 | Tỷ lệ nạp thừa (%) | Textview | overfill_pct | Tỷ lệ nạp thừa so với khuyến nghị. Lỗi/rỗng: N/A |
| 12 | Nút Xuất Excel (YC39) | Button | | Click: xuất dữ liệu theo đúng bộ lọc và tùy biến ẩn/hiện cột hiện tại ra file .xlsx |
| 13 | Phân trang | Pagination | | Khi số bản ghi > 10: phân trang theo kịch bản dùng chung |

---

## B4. Báo cáo chuyến bay dùng cạn nước sạch

*Nguồn: YC37 — Report – Depleted Water Flights (UI), mã loại chức năng GD_WEB2.*

| Tên chức năng | Báo cáo chuyến bay dùng cạn nước sạch |
| :---- | :---- |
| **Mục đích** | Thống kê các chuyến bay kết thúc với lượng nước còn lại dưới ngưỡng an toàn cấu hình; đánh dấu các trường hợp có nguy cơ thiếu nước phục vụ để xem xét tăng định mức |
| **Trigger** | Người dùng mở Menu "Report", chọn "Báo cáo chuyến bay dùng cạn nước sạch" |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem báo cáo nước sạch |
| **Hậu điều kiện** | Màn hình hiển thị danh sách các chuyến dùng cạn, làm nổi bật (màu đỏ) các chuyến dưới ngưỡng an toàn |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng mở Menu Report, chọn báo cáo Chuyến bay dùng cạn |
| 2 | Hệ thống hiển thị màn hình báo cáo với bộ lọc mặc định |
| 3 | Người dùng chọn bộ lọc và nhấn Search |
| 4 | Hệ thống kiểm tra chỉ số nước cuối chuyến so với ngưỡng an toàn cấu hình (YC28); hiển thị danh sách, làm nổi bật màu đỏ các chuyến có % nước cuối chuyến dưới ngưỡng |
| 5 | Trường hợp API rỗng/lỗi: hiển thị "Không có kết quả nào liên quan" |
| 6 | Người dùng nhấn "Xuất Excel": hệ thống xuất dữ liệu theo bộ lọc ra file .xlsx |

### Màn hình chức năng

> [ẢNH: YC37]

### Mô tả chi tiết màn hình

**Logic kiểm tra:** Hệ thống so sánh chỉ số nước cuối chuyến với ngưỡng "dùng cạn" (Y%) cấu hình tại YC28; chuyến nào có % nước cuối chuyến dưới ngưỡng được làm nổi bật màu đỏ. Mốc thời gian theo UTC; phân trang/thông báo lỗi theo kịch bản dùng chung.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Khoảng thời gian | Date range | filter_period | Trường để lọc theo khoảng thời gian |
| 2 | Loại tàu bay | Combobox | filter_aircraft_type | Trường để lọc theo dòng tàu. Hỗ trợ 'All' |
| 3 | Chặng bay | Combobox | filter_route | Trường để lọc theo chặng bay. Hỗ trợ 'All' |
| 4 | Nút Search | Button | | Click: lọc dữ liệu và trả về kết quả |
| 5 | Nút Reset | Button | | Click: xóa bộ lọc, reset phân trang, hiển thị danh sách mặc định |
| 6 | Chuyến bay | Textview | flight_no | Số hiệu chuyến bay. Lỗi/rỗng: N/A |
| 7 | Loại tàu | Textview | aircraft_type | Loại tàu bay. Lỗi/rỗng: N/A |
| 8 | % nước cuối chuyến | Textview | arr_pct | % nước còn lại cuối chuyến. Dưới ngưỡng an toàn: làm nổi bật màu đỏ. Lỗi/rỗng: N/A |
| 9 | Lượng nước còn lại (Lít) | Textview | arr_liter | Lượng nước còn lại quy đổi ra lít. Lỗi/rỗng: N/A |
| 10 | Ngưỡng an toàn áp dụng | Textview | safety_threshold | Ngưỡng an toàn cấu hình (YC28) đang dùng để đối chiếu |
| 11 | Nút Xuất Excel (YC39) | Button | | Click: xuất dữ liệu theo đúng bộ lọc và tùy biến ẩn/hiện cột hiện tại ra file .xlsx |
| 12 | Phân trang | Pagination | | Khi số bản ghi > 10: phân trang theo kịch bản dùng chung |

---

## B5. Báo cáo chuyến bay nạp nước vượt lượng tính toán

*Nguồn: YC38 — Report – Water Overrequest Flights (UI), mã loại chức năng GD_WEB2.*

| Tên chức năng | Báo cáo chuyến bay nạp nước vượt lượng tính toán |
| :---- | :---- |
| **Mục đích** | Thống kê các chuyến bay mà tổ bay yêu cầu nạp nước vượt đáng kể so với lượng khuyến nghị hệ thống tính, kèm lý do giải trình do tổ bay nhập trên App, để đánh giá lại định mức hoặc quy trình |
| **Trigger** | Người dùng mở Menu "Report", chọn "Báo cáo chuyến bay nạp nước vượt lượng tính toán" |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem báo cáo nước sạch |
| **Hậu điều kiện** | Màn hình hiển thị danh sách các chuyến nạp vượt tính toán kèm lý do giải trình |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng mở Menu Report, chọn báo cáo Chuyến bay nạp nước vượt lượng tính toán |
| 2 | Hệ thống hiển thị màn hình báo cáo với bộ lọc mặc định |
| 3 | Người dùng chọn bộ lọc và nhấn Search |
| 4 | Hệ thống lọc các chuyến có lượng tổ bay yêu cầu nạp vượt khuyến nghị (vượt ngưỡng chênh lệch yêu cầu vs khuyến nghị cấu hình YC28); đồng bộ và hiển thị lý do giải trình từ Mobile App |
| 5 | Trường hợp API rỗng/lỗi: hiển thị "Không có kết quả nào liên quan" |
| 6 | Người dùng nhấn "Xuất Excel": hệ thống xuất dữ liệu theo bộ lọc ra file .xlsx |

### Màn hình chức năng

> [ẢNH: YC38]

### Mô tả chi tiết màn hình

**Logic đồng bộ lý do:** Hệ thống đồng bộ dữ liệu lý do giải trình do tổ bay nhập trên Mobile App gửi về và hiển thị tại cột "Lý do giải trình" để đối soát. Chênh lệch giữa lượng yêu cầu và lượng khuyến nghị được đối chiếu với ngưỡng cấu hình tại YC28. Mốc thời gian theo UTC; phân trang/thông báo lỗi theo kịch bản dùng chung.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Khoảng thời gian | Date range | filter_period | Trường để lọc theo khoảng thời gian |
| 2 | Loại tàu bay | Combobox | filter_aircraft_type | Trường để lọc theo dòng tàu. Hỗ trợ 'All' |
| 3 | Chặng bay | Combobox | filter_route | Trường để lọc theo chặng bay. Hỗ trợ 'All' |
| 4 | Nút Search | Button | | Click: lọc dữ liệu và trả về kết quả |
| 5 | Nút Reset | Button | | Click: xóa bộ lọc, reset phân trang, hiển thị danh sách mặc định |
| 6 | Chuyến bay | Textview | flight_no | Số hiệu chuyến bay. Lỗi/rỗng: N/A |
| 7 | Loại tàu | Textview | aircraft_type | Loại tàu bay. Lỗi/rỗng: N/A |
| 8 | Nước khuyến nghị | Textview | recommended_water | Lượng nước khuyến nghị (từ engine backend, chỉ hiển thị). Lỗi/rỗng: N/A |
| 9 | Nước thực tế nạp | Textview | actual_loaded | Lượng nước thực tế tổ bay yêu cầu nạp (Lít). Lỗi/rỗng: N/A |
| 10 | Chênh lệch | Textview | over_amount | Chênh lệch = nước thực tế nạp − nước khuyến nghị (Lít). Lỗi/rỗng: N/A |
| 11 | Lý do giải trình | Textview | crew_reason | Lý do do tổ bay nhập trên App MO Plus, đồng bộ về để đối soát. Lỗi/rỗng: để trống |
| 12 | Nút Xuất Excel (YC39) | Button | | Click: xuất dữ liệu theo đúng bộ lọc và tùy biến ẩn/hiện cột hiện tại ra file .xlsx |
| 13 | Phân trang | Pagination | | Khi số bản ghi > 10: phân trang theo kịch bản dùng chung |

---

## NHÓM C — Cấu hình danh mục & tham số (Menu Admin → Water Service Config)

*Ghi chú chung cho cả nhóm: 4 màn hình cấu hình dưới đây truy cập từ Menu "Admin" → "Water Service Config" (Cấu hình nước sạch) trên Header Web EFF. Toàn bộ thao tác Thêm/Sửa/Khóa bản ghi yêu cầu người dùng thuộc nhóm quyền quản trị (Admin). Mỗi bản ghi lưu Người cập nhật cuối và Ngày cập nhật cuối (UTC). Khi lưu thay đổi, hệ thống đồng bộ cấu hình tới các engine tính toán phía backend. Khóa định danh chống trùng của từng cấu hình cần xác nhận — xem CH-03.*

## C1. Cấu hình dung tích bồn nước sạch

*Nguồn: YC25 — Master Data – Tank Capacity (UI), mã loại chức năng GD_WEB1.*

| Tên chức năng | Cấu hình dung tích bồn nước sạch |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng cấu hình dung tích bồn chứa nước sạch tối đa (lít) của từng loại tàu bay, phục vụ quy đổi tỷ lệ % sang lít trong toàn phân hệ |
| **Trigger** | Người dùng truy cập Menu `Admin` → `Water Service Config` → chọn tab `Tank Capacity` |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền thuộc nhóm `Admin` |
| **Hậu điều kiện** | Lưu vết thay đổi vào DB và đồng bộ cấu hình tới các engine tính toán |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng truy cập màn hình cấu hình Dung tích bồn nước sạch |
| 2 | Hệ thống hiển thị danh sách dung tích tank hiện tại theo loại tàu bay |
| 3 | Người dùng click "Thêm mới" hoặc "Sửa" tại một bản ghi |
| 4 | Hệ thống hiển thị form Thêm mới/Sửa; người dùng nhập thông tin và nhấn "Lưu" |
| 5 | Hệ thống kiểm tra tính hợp lệ (dung tích là số nguyên dương; loại tàu bay không trùng lặp). Nếu không hợp lệ chuyển sang bước 6; nếu hợp lệ chuyển sang bước 7 |
| 6 | Hiển thị thông báo lỗi (inline cấp trường / toast cấp hệ thống); giữ nguyên form |
| 7 | Lưu cấu hình vào DB, ghi Người + Ngày cập nhật cuối (UTC), đồng bộ tới engine; hiển thị toast thành công và reload danh sách |

### Màn hình chức năng

> [ẢNH: YC25]

### Mô tả chi tiết màn hình

**Ràng buộc validation:** Dung tích bồn phải là **số nguyên dương**; **loại tàu bay không được trùng lặp** trong danh mục. **Phân quyền:** chỉ nhóm quản trị viên (Admin) được Thêm/Sửa/Khóa. **Mốc thời gian:** Ngày cập nhật cuối hiển thị theo UTC.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Loại tàu bay | Combobox | aircraft_type | Lấy danh mục tàu bay hiện tại của VNA (A321, A350, B787, ATR…) để chọn. Bắt buộc chọn. Không cho trùng với bản ghi đã có (xem CH-03 về khóa định danh) |
| 2 | Hãng sản xuất | Textview/Textbox | manufacturer | Hãng sản xuất tàu bay tương ứng |
| 3 | Dung tích Tank (Lít) | Textbox | tank_capacity_liter | Bắt buộc nhập. Định dạng **số nguyên dương**; chặn giá trị ≤ 0 và giá trị không phải số nguyên |
| 4 | Trạng thái | Toggle/Tag | status | Trạng thái bản ghi (Active/Inactive — hoặc khóa bản ghi). *(Cơ chế "khóa bản ghi" cụ thể cần xác nhận)* |
| 5 | Người cập nhật cuối | Textview | updated_by | Chỉ đọc. ID/tên người cập nhật cuối |
| 6 | Ngày cập nhật cuối (UTC) | Textview | updated_at_utc | Chỉ đọc. Thời điểm cập nhật cuối theo giờ UTC |
| 7 | Nút Thêm mới | Button | | Click: mở form Thêm mới. Chỉ hiển thị khi người dùng có quyền Admin |
| 8 | Nút Sửa | Button | | Click: mở form Sửa bản ghi. Ẩn khi không có quyền |
| 9 | Nút Lưu | Button | | Click: hệ thống validate (số nguyên dương, không trùng loại tàu bay), lưu vào DB, đồng bộ engine, hiển thị toast thành công |

---

## C2. Cấu hình định mức tiêu thụ nước mặc định

*Nguồn: YC26 — Master Data – Default Consumption Rate (UI), mã loại chức năng GD_WEB1.*

| Tên chức năng | Cấu hình định mức tiêu thụ nước mặc định |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng cấu hình định mức tiêu thụ nước mặc định (lít/người/giờ) theo loại tàu / nhóm chặng / khung giờ, áp dụng khi chặng/tàu bay chưa có đủ dữ liệu lịch sử |
| **Trigger** | Người dùng truy cập Menu `Admin` → `Water Service Config` → chọn tab `Default Consumption Rate` |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền thuộc nhóm `Admin` |
| **Hậu điều kiện** | Lưu vết thay đổi vào DB và đồng bộ cấu hình tới engine tính lượng nước khuyến nghị |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng truy cập màn hình cấu hình Định mức mặc định |
| 2 | Hệ thống hiển thị danh sách định mức hiện tại; người dùng có thể lọc theo Loại tàu bay, Nhóm chặng, Khung giờ |
| 3 | Người dùng click "Thêm mới" hoặc "Sửa" (Inline Edit hoặc Modal Pop-up) |
| 4 | Người dùng nhập định mức (lít/người/giờ) và nhấn "Lưu" |
| 5 | Hệ thống kiểm tra tính hợp lệ. Nếu không hợp lệ chuyển sang bước 6; nếu hợp lệ chuyển sang bước 7 |
| 6 | Hiển thị thông báo lỗi (inline/toast); giữ nguyên form |
| 7 | Lưu cấu hình vào DB, ghi Người + Ngày cập nhật cuối (UTC), đồng bộ tới engine; hiển thị toast thành công |

### Màn hình chức năng

> [ẢNH: YC26]

### Mô tả chi tiết màn hình

**Logic fallback:** Định mức mặc định được engine tính toán sử dụng khi chặng/tàu bay chưa có dữ liệu lịch sử. Thứ tự ưu tiên (fallback) tra cứu định mức mặc định khi tính lượng nước khuyến nghị **cần xác nhận từ nghiệp vụ** — xem CH-02 (Website chỉ cấu hình giá trị, không tự quyết định thứ tự áp dụng). **Mốc thời gian:** Ngày cập nhật cuối theo UTC.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Loại tàu bay | Combobox | aircraft_type | Trường lọc + thuộc tính bản ghi. Lấy danh mục tàu bay hiện tại của VNA |
| 2 | Nhóm chặng | Combobox | route_group | Nhóm chặng: Nội địa ngắn / Nội địa dài / Quốc tế |
| 3 | Khung giờ khai thác | Combobox | time_slot | Khung giờ khai thác áp dụng định mức |
| 4 | Định mức (lít/người/giờ) | Textbox | default_rate | Bắt buộc nhập. Định dạng số dương. *(Khoảng giá trị hợp lệ cần xác nhận)* |
| 5 | Trạng thái | Toggle/Tag | status | Trạng thái bản ghi (Active/Inactive) |
| 6 | Người cập nhật cuối | Textview | updated_by | Chỉ đọc |
| 7 | Ngày cập nhật cuối (UTC) | Textview | updated_at_utc | Chỉ đọc. Theo giờ UTC |
| 8 | Nút Thêm mới | Button | | Click: mở form/inline Thêm mới. Chỉ hiển thị khi có quyền Admin |
| 9 | Nút Sửa | Button | | Click: mở form/inline Sửa. Ẩn khi không có quyền |
| 10 | Nút Lưu | Button | | Click: validate, lưu vào DB, đồng bộ engine, hiển thị toast thành công |

---

## C3. Cấu hình tham số đệm Buffer

*Nguồn: YC27 — Master Data – Buffer Configuration (UI), mã loại chức năng GD_WEB1.*

| Tên chức năng | Cấu hình tham số đệm Buffer |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng cấu hình các tham số đệm an toàn (Buffer) dùng trong công thức tính lượng nước cần nạp khuyến nghị: giờ taxi theo sân bay, giờ dự phòng theo chặng, mức tối thiểu an toàn theo loại tàu, buffer theo người tương đương |
| **Trigger** | Người dùng truy cập Menu `Admin` → `Water Service Config` → chọn tab `Buffer Configuration` |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền thuộc nhóm `Admin` |
| **Hậu điều kiện** | Lưu vết thay đổi vào DB và đồng bộ cấu hình tới engine tính lượng nước khuyến nghị |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng truy cập màn hình cấu hình Tham số đệm Buffer |
| 2 | Hệ thống hiển thị form cấu hình chia theo các khu vực nhập liệu (giờ taxi, giờ dự phòng, mức tối thiểu an toàn, buffer theo người tương đương) |
| 3 | Người dùng nhập/điều chỉnh các tham số và nhấn "Lưu" |
| 4 | Hệ thống kiểm tra tính hợp lệ. Nếu không hợp lệ chuyển sang bước 5; nếu hợp lệ chuyển sang bước 6 |
| 5 | Hiển thị thông báo lỗi (inline/toast); giữ nguyên form |
| 6 | Lưu cấu hình vào DB, ghi Người + Ngày cập nhật cuối (UTC), đồng bộ tới engine; hiển thị toast thành công |

### Màn hình chức năng

> [ẢNH: YC27]

### Mô tả chi tiết màn hình

**Logic áp dụng:** Các tham số buffer này được engine backend áp dụng vào công thức tính lượng nước cần nạp khuyến nghị (YC18). Website chỉ cấu hình giá trị; công thức và cách áp dụng thuộc backend (xem CH-01). **Mốc thời gian:** Ngày cập nhật cuối theo UTC.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Sân bay | Combobox | airport | Phạm vi áp dụng giờ taxi (theo sân bay) |
| 2 | Giờ taxi (phút) | Textbox | taxi_time_min | Bắt buộc nhập. Định dạng số dương (phút) |
| 3 | Chặng bay | Combobox | route | Phạm vi áp dụng giờ dự phòng (theo chặng) |
| 4 | Giờ dự phòng (phút) | Textbox | reserve_time_min | Bắt buộc nhập. Định dạng số dương (phút) |
| 5 | Loại tàu bay | Combobox | aircraft_type | Phạm vi áp dụng mức tối thiểu an toàn (theo loại tàu) |
| 6 | Mức tối thiểu an toàn (Lít) | Textbox | min_safety_liter | Bắt buộc nhập. Định dạng số dương (Lít) |
| 7 | Buffer theo người tương đương | Textbox | buffer_extra_pax | Số người tương đương cộng thêm (ví dụ mặc định +5 người). Định dạng số nguyên dương |
| 8 | Người cập nhật cuối | Textview | updated_by | Chỉ đọc |
| 9 | Ngày cập nhật cuối (UTC) | Textview | updated_at_utc | Chỉ đọc. Theo giờ UTC |
| 10 | Nút Lưu | Button | | Click: validate, lưu vào DB, đồng bộ engine, hiển thị toast thành công. Chỉ hiển thị khi có quyền Admin |

---

## C4. Cấu hình ngưỡng ngoại lệ

*Nguồn: YC28 — Master Data – Exception Threshold (UI), mã loại chức năng GD_WEB1.*

| Tên chức năng | Cấu hình ngưỡng ngoại lệ |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng cấu hình các biên độ ngưỡng để hệ thống tự động gắn cờ (Flag) cảnh báo trên báo cáo: ngưỡng nạp thừa, ngưỡng nước còn lại được coi là "dùng cạn", ngưỡng chênh lệch giữa yêu cầu tổ bay và lượng khuyến nghị (cũng như chênh lệch pax booking vs loadsheet để trigger notification) |
| **Trigger** | Người dùng truy cập Menu `Admin` → `Water Service Config` → chọn tab `Exception Threshold` |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền thuộc nhóm `Admin` |
| **Hậu điều kiện** | Lưu vết thay đổi vào DB; các báo cáo và logic cảnh báo áp dụng ngưỡng mới |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng truy cập màn hình cấu hình Ngưỡng ngoại lệ |
| 2 | Hệ thống hiển thị form các ngưỡng hiện tại (nạp thừa X%, dùng cạn Y%, chênh lệch pax Z lít) |
| 3 | Người dùng nhập/điều chỉnh các ngưỡng và nhấn "Lưu" |
| 4 | Hệ thống kiểm tra tính hợp lệ. Nếu không hợp lệ chuyển sang bước 5; nếu hợp lệ chuyển sang bước 6 |
| 5 | Hiển thị thông báo lỗi (inline/toast); giữ nguyên form |
| 6 | Lưu cấu hình vào DB, ghi Người + Ngày cập nhật cuối (UTC); các báo cáo áp dụng ngưỡng mới khi đối chiếu/gắn cờ |

### Màn hình chức năng

> [ẢNH: YC28]

### Mô tả chi tiết màn hình

**Logic đối chiếu & gắn cờ:** Hệ thống đối chiếu dữ liệu thực tế với các ngưỡng cấu hình để tự động gắn cờ (Flag) ngoại lệ trên các báo cáo B3 (nạp thừa — X%), B4 (dùng cạn — Y%), B5 (vượt tính toán — ngưỡng chênh lệch yêu cầu vs khuyến nghị) và highlight lệch số liệu trên B2. Ngưỡng chênh lệch pax booking vs loadsheet (Z lít) dùng để trigger notification. **Mốc thời gian:** Ngày cập nhật cuối theo UTC.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Ngưỡng nạp thừa (X%) | Textbox | overfill_threshold_pct | Bắt buộc nhập. Định dạng % (số dương). Dùng cho báo cáo B3 |
| 2 | Ngưỡng dùng cạn (Y%) | Textbox | depleted_threshold_pct | Bắt buộc nhập. Định dạng % (số dương). Dùng cho báo cáo B4 |
| 3 | Ngưỡng chênh lệch pax (Z lít) | Textbox | pax_diff_threshold_liter | Bắt buộc nhập. Định dạng số (Lít). Chênh lệch pax booking vs loadsheet để trigger notification |
| 4 | Ngưỡng chênh lệch yêu cầu vs khuyến nghị | Textbox | request_diff_threshold | Ngưỡng để gắn cờ chuyến nạp vượt lượng tính toán (báo cáo B5) và phát hiện lệch A-CAD vs Tổ bay (báo cáo B2). *(Đơn vị % hay Lít cần xác nhận)* |
| 5 | Người cập nhật cuối | Textview | updated_by | Chỉ đọc |
| 6 | Ngày cập nhật cuối (UTC) | Textview | updated_at_utc | Chỉ đọc. Theo giờ UTC |
| 7 | Nút Lưu | Button | | Click: validate, lưu vào DB. Chỉ hiển thị khi có quyền Admin |

---

## Câu hỏi / Nội dung cần làm rõ

Phần này tập hợp các điểm cần người phụ trách nghiệp vụ (SME) hoặc BA Lead xác nhận trước khi tài liệu được phê duyệt. Đây là các quyết định nghiệp vụ, không thuộc phạm vi tự quyết của bước đặc tả; nội dung được giữ nguyên từ nguồn, không suy diễn.

| Mã | Vị trí | Nội dung cần làm rõ |
| ----- | ----- | ----- |
| CH-01 | A1, B1–B5, C2–C3 — lượng nước khuyến nghị | Công thức chính xác tính lượng nước khuyến nghị thuộc engine backend (YC18 — Water Requirement Calculation Engine), không thuộc phạm vi Website (Website chỉ hiển thị). Cần backend cung cấp/chốt công thức và đầu ra API để đối chiếu trên Tab và các báo cáo |
| CH-02 | C2 — Định mức mặc định | Thứ tự ưu tiên (fallback) tra cứu định mức mặc định khi engine tính toán không đủ dữ liệu lịch sử (ví dụ: ưu tiên theo loại tàu trước hay theo nhóm chặng trước, khung giờ áp dụng thế nào). Nguồn chỉ nêu "đặc tả logic fallback" mà chưa nêu thứ tự cụ thể |
| CH-03 | C1–C4 — khóa định danh | Khóa định danh dùng để chống trùng bản ghi cấu hình của từng màn (ví dụ: Tank Capacity theo Loại tàu bay; Default Rate theo bộ Loại tàu + Nhóm chặng + Khung giờ; Buffer/Threshold theo phạm vi áp dụng). Cần chốt để xây ràng buộc "không trùng" |
| CH-04 | A1 — nút Lưu | Có cần bước xác nhận (confirm) trước khi ghi đè số liệu nhập tay lên số liệu đã có (A-CAD/Tổ bay) hay không, và nội dung câu xác nhận |
| CH-05 | Toàn tài liệu — mã thông báo | Mã thông báo (message code) dùng chung cho thông báo thành công/lỗi/trùng/xác nhận cần đối chiếu với tài liệu gốc MOPLUS_SRS_EFF_WEB để dùng đúng mã chung (ví dụ tương đương TB019/TB020/IM…) |
| CH-06 | A1 — ô % nhập tay | Khoảng giá trị hợp lệ của chỉ số % nước đầu/cuối chuyến (giả định 0–100%) và quy tắc làm tròn khi quy đổi sang lít cần xác nhận |

---

## Dòng cập nhật Change Log (đề xuất cho v2.6)

Đề xuất bổ sung 1 dòng vào Bảng ghi nhận thay đổi (Trang 2) của tài liệu gốc MOPLUS_SRS_EFF_WEB khi nâng phiên bản từ 2.5 lên 2.6:

| Ngày | Vị trí thay đổi | Loại (A/M/D) | Mô tả thay đổi | Version |
| ----- | ----- | :----: | ----- | :----: |
| 18/06/2026 | Mục Nước sạch, cuối chương 3 (nối tiếp sau mục báo cáo cuối) | A (Tạo mới) | Bổ sung phân hệ Quản lý nước sạch (Potable Water Service): Tab xem/nhập tay chỉ số nước chuyến bay, 5 báo cáo đối chiếu & giám sát, 4 màn cấu hình tham số/danh mục, xuất Excel. | 2.6 |

---

## Ma trận truy vết

| YC | Tên chức năng | Mã loại chức năng | Mục SRS |
| ----- | ----- | ----- | ----- |
| YC33 | Manual Water Data Entry (UI) — Nước sạch: Xem và Nhập liệu nước sạch chuyến bay | GD_WEB1 | A1 |
| YC34 | Report – Historical Consumption Rate (UI) — Báo cáo suất tiêu thụ nước sạch lịch sử | GD_WEB2 | B1 |
| YC35 | Report – Water At Departure & Arrival (UI) — Báo cáo nước đầu/cuối chuyến bay | GD_WEB2 | B2 |
| YC36 | Report – Overfueled Flights (UI) — Báo cáo chuyến bay nạp thừa nước sạch | GD_WEB2 | B3 |
| YC37 | Report – Depleted Water Flights (UI) — Báo cáo chuyến bay dùng cạn nước sạch | GD_WEB2 | B4 |
| YC38 | Report – Water Overrequest Flights (UI) — Báo cáo chuyến bay nạp nước vượt lượng tính toán | GD_WEB2 | B5 |
| YC39 | Report Export (UI) — Xuất báo cáo Excel | GD_WEB1 | Nút "Xuất Excel" trong B1–B5 |
| YC25 | Master Data – Tank Capacity (UI) — Cấu hình dung tích bồn nước sạch | GD_WEB1 | C1 |
| YC26 | Master Data – Default Consumption Rate (UI) — Cấu hình định mức tiêu thụ nước mặc định | GD_WEB1 | C2 |
| YC27 | Master Data – Buffer Configuration (UI) — Cấu hình tham số đệm Buffer | GD_WEB1 | C3 |
| YC28 | Master Data – Exception Threshold (UI) — Cấu hình ngưỡng ngoại lệ | GD_WEB1 | C4 |

---

*Tài liệu phiên bản 1.0 — bản nháp rà soát, chờ xác nhận các nội dung tại mục "Câu hỏi / Nội dung cần làm rõ" trước khi ghép vào tài liệu gốc MOPLUS_SRS_EFF_WEB và phát hành phiên bản 2.6.*
