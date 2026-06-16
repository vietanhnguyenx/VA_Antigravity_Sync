# BỘ TEST CASES CHUẨN QA — US: THÊM MỚI / SỬA CHẶNG BAY
## Phân hệ: Quản lý danh mục Chặng bay (Leg/Segment Management) | Dự án VNA.FIMS Phase 1

**Mã tài liệu:** FIMS-TC-LEG-01  
**Tác giả:** Tester kỳ cựu  
**Ngày cập nhật:** 2026-06-11  
**Trạng thái:** Sẵn sàng cho Execution (Sau khi BA xác nhận các câu hỏi mở ở Mục 6)

---

## 1. PRECONDITIONS CHUNG (TIỀN ĐIỀU KIỆN CHUNG)
Tất cả các test case dưới đây đều thừa hưởng các tiền điều kiện sau (trừ khi có mô tả riêng biệt trong từng case):
1. Thiết bị test chạy trên hệ điều hành Windows, trình duyệt Chrome/Edge phiên bản mới nhất.
2. User đã đăng nhập thành công vào hệ thống FIMS với tài khoản có quyền tương ứng theo mô tả từng nhóm TC.
3. Đang đứng tại màn hình danh sách Chặng bay (`Danh mục` -> `Chặng bay`).
4. Kết nối mạng ổn định (trừ test case kiểm tra lỗi network).

---

## 2. TEST DATA CHUẨN (DỮ LIỆU ĐỂ TEST)
| Tên dữ liệu | Giá trị mẫu | Trạng thái trong DB | Ghi chú |
|---|---|---|---|
| **Sân bay nội địa 1** | HAN (Hà Nội) | Active | Dùng test chặng bay |
| **Sân bay nội địa 2** | SGN (TP.HCM) | Active | Dùng test chặng bay |
| **Sân bay quốc tế 1** | NRT (Tokyo) | Active | Dùng test chặng bay |
| **Flight Code mẫu 1** | VN123 | Đã tồn tại trong DB | Dùng test trùng mã |
| **Flight Code mẫu 2** | VN-456.7/8 | Chưa tồn tại | Ký tự đặc biệt hợp lệ |
| **Flight Code mẫu 3** | vn123 | Chưa tồn tại | Test case-sensitivity |
| **Tài khoản Test 1** | admin_fims | Active | Đầy đủ quyền Create/Edit/Delete |
| **Tài khoản Test 2** | view_fims | Active | Chỉ có quyền View danh sách |

---

## 3. QUY ƯỚC MỨC ĐỘ ƯU TIÊN (PRIORITY) & TRẠNG THÁI (STATUS)
- **P1 (Blocker):** Chức năng chính không chạy, crash hệ thống, mất dữ liệu, hoặc lỗi bảo mật.
- **P2 (Critical):** Lỗi nghiệp vụ quan trọng, sai lệch luồng dữ liệu, lỗi validate không cho submit dữ liệu đúng.
- **P3 (Major):** Lỗi hiển thị, giao diện không đúng spec, thiếu tooltip, lỗi thông báo không rõ nghĩa.
- **P4 (Minor):** Lỗi typo nhẹ, lệch pixel UI, các vấn đề thẩm mỹ khác.
- **Status:** `Blank` (Chưa chạy), `Pass` (Đạt), `Fail` (Lỗi), `Block` (Bị chặn).

---

## 4. CHI TIẾT CÁC KỊCH BẢN KIỂM THỬ (TEST CASES)

### NHÓM 1: HIỂN THỊ & TRIGGER MÀN HÌNH (6 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC001 | 1.1 | Mở form Thêm mới từ nút Create | Tài khoản: `admin_fims` | Click nút **Create** (icon `+` ở trên bên phải) | Popup hiển thị với title "Add new flight routes". Tất cả các ô nhập liệu trống. Nút Save/Cancel hiển thị rõ. | P1 | | | |
| TC002 | 1.1 | Mở form Sửa từ icon Sửa | Tài khoản: `admin_fims` | Click icon **Sửa** (cột Action) của bản ghi Flight Code: `VN123` | Popup hiển thị với title "Edit flight routes" (hoặc tương đương). Dữ liệu hiện tại của bản ghi `VN123` được điền đầy đủ và chính xác vào form. | P1 | | | |
| TC003 | 1.2.4.1 | Title popup Thêm mới | Form Thêm mới đang mở | Kiểm tra nhãn tiêu đề popup | Tiêu đề hiển thị chính xác text cứng: **"Add new flight routes"** | P2 | | | |
| TC004 | 1.2.4.1 | Title popup Sửa | Form Sửa đang mở | Kiểm tra nhãn tiêu đề popup | Tiêu đề hiển thị chính xác text của chức năng chỉnh sửa. | P2 | | | |
| TC005 | 1.1.4.9 | Quyền hiển thị nút Create | Tài khoản: `view_fims` | Vào màn hình danh sách Chặng bay | Nút **Create** bị ẩn hoàn toàn, không hiển thị trên UI. | P2 | | | |
| TC006 | 1.1.4.19 | Quyền hiển thị icon Sửa | Tài khoản: `view_fims` | Vào màn hình danh sách Chặng bay | Icon **Sửa** trong cột Action bị ẩn hoàn toàn trên tất cả các dòng dữ liệu. | P2 | | | |

---

### NHÓM 2: TRƯỜNG NHẬP LIỆU "FLIGHT CODE" (14 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC007 | 1.2.4.3 | Để trống Flight Code khi click Save | Form Thêm mới đang mở | 1. Để trống ô Flight Code.<br>2. Click nút **Save**. | Form không được submit. Ô Flight Code bị highlight viền đỏ. Xuất hiện inline message **VL004**: *"The Flight code field must not be empty."* | P1 | | | |
| TC008 | 1.2.4.3 | Để trống Flight Code khi out focus | Form Thêm mới đang mở | 1. Click vào ô Flight Code.<br>2. Không nhập gì.<br>3. Click chuột ra ngoài ô hoặc nhấn Tab. | Ô Flight Code bị highlight đỏ, hiển thị inline message **VL004** ngay lập tức. | P1 | | | |
| TC009 | 1.2.4.3 | Boundary: Nhập độ dài tối thiểu (1 ký tự) | Form Thêm mới đang mở | Nhập "A" vào Flight Code. | Ô nhận giá trị, không xuất hiện thông báo lỗi. | P2 | | | |
| TC010 | 1.2.4.3 | Boundary: Nhập độ dài tối đa (10 ký tự) | Form Thêm mới đang mở | Nhập chuỗi 10 ký tự hợp lệ: "VN-456.7/8" | Ô nhận đủ 10 ký tự, không bị cắt bớt, không lỗi. | P1 | | | |
| TC011 | 1.2.4.3 | Boundary: Nhập độ dài cận trên (9 ký tự) | Form Thêm mới đang mở | Nhập chuỗi 9 ký tự: "VN-456.7/" | Ô nhận đủ 9 ký tự, không lỗi. | P2 | | | |
| TC012 | 1.2.4.3 | Boundary: Gõ quá 10 ký tự | Form Thêm mới đang mở | Gõ trực tiếp chuỗi: "VN-123.4/56" (11 ký tự) | Hệ thống chặn nhập ký tự thứ 11. Chỉ hiển thị "VN-123.4/5" (10 ký tự đầu). | P1 | | | |
| TC013 | 1.2.4.3 | Boundary: Paste chuỗi dài hơn 10 ký tự | Form Thêm mới đang mở | Copy chuỗi "VN-123.4/56789" (14 ký tự) và paste vào ô. | Hệ thống chỉ nhận 10 ký tự đầu "VN-123.4/5". Các ký tự sau bị tự động cắt bỏ. | P1 | | | |
| TC014 | 1.2.4.3 | Nhập ký tự đặc biệt hợp lệ | Form Thêm mới đang mở | Nhập chuỗi chứa các ký tự: `-`, `_`, `.`, `/` | Hệ thống chấp nhận và hiển thị bình thường. | P2 | | | |
| TC015 | 1.2.4.3 | Nhập ký tự đặc biệt không hợp lệ | Form Thêm mới đang mở | Gõ các ký tự: `@`, `#`, `$`, `%`, `^`, `&`, `*`, `(`, `)`, `!` | Hệ thống tự động chặn các ký tự này, không hiển thị lên màn hình. | P1 | | | |
| TC016 | 1.2.4.3 | Tự động TRIM khoảng trắng | Form Thêm mới đang mở | Nhập "  VN123  " (có khoảng trắng đầu và cuối), click Save. | Hệ thống tự động loại bỏ khoảng trắng đầu/cuối trước khi lưu. Giá trị lưu thực tế là "VN123". | P2 | | | |
| TC017 | 1.2.4.3 | Nhập trùng mã Flight Code | Form Thêm mới đang mở. Mã `VN123` đã có trong DB | Nhập "VN123", điền các trường khác hợp lệ, click Save. | Lưu thất bại. Hiển thị toast lỗi **TB020**: *"Thêm mới không thành công. [Lý do từ API]"* hoặc inline message *"Flight code đã tồn tại"*. | P1 | | | |
| TC018 | 1.2.4.3 | Tràn text và Tooltip hiển thị | Form Thêm mới đang mở | Nhập chuỗi 10 ký tự hoa rộng "WWWWWWWWWW" làm tràn khung hiển thị. | Hiển thị dạng "WWWW..." có dấu ba chấm ở cuối. Khi di chuột vào ô, hiển thị toàn bộ nội dung trong tooltip. | P3 | | | |
| TC019 | 1.2.4.3 | [TH Sửa] Flight Code read-only | Form Sửa đang mở | Click chuột và cố gắng gõ phím vào ô Flight Code | Ô Flight Code ở trạng thái Textview/Disabled. Không thể tương tác hoặc thay đổi nội dung. | P1 | | | |
| TC020 | 1.2.4.3 | [TH Sửa] Hiển thị chính xác mã | Form Sửa đang mở | Kiểm tra giá trị ô Flight Code | Hiển thị đúng mã chặng bay đã chọn từ danh sách, không bị lỗi font/mất ký tự. | P1 | | | |

---

### NHÓM 3: TRƯỜNG "DEPARTURE AIRPORT" (9 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC021 | 1.2.4.4 | Để trống Departure Airport khi Save | Form Thêm mới đang mở | Bỏ trống ô Departure Airport, click **Save**. | Form không được gửi. Ô Departure Airport báo đỏ. Hiển thị inline message **VL004**: *"The Departure Airport field must not be empty."* | P1 | | | |
| TC022 | 1.2.4.4 | Mở dropdown danh sách sân bay | Form Thêm mới đang mở | Click vào ô Departure Airport | Dropdown hiển thị danh sách sân bay lấy từ bảng Airports, danh sách sắp xếp hợp lý và không bị trùng lặp. | P1 | | | |
| TC023 | 1.2.4.4 | Tìm kiếm nhanh sân bay theo text | Form Thêm mới đang mở | Gõ chữ "HAN" vào ô tìm kiếm nhanh của dropdown | Danh sách dropdown tự động lọc và chỉ hiển thị kết quả khớp với "HAN". | P2 | | | |
| TC024 | 1.2.4.4 | Tìm kiếm không có kết quả | Form Thêm mới đang mở | Gõ chuỗi không có thật "XYZ" | Hiển thị thông báo "No data" hoặc "Không có kết quả tìm kiếm". | P2 | | | |
| TC025 | 1.2.4.4 | Chọn sân bay từ dropdown | Form Thêm mới đang mở | Click chọn "HAN" từ danh sách | Ô Departure Airport hiển thị "HAN". Dropdown tự động đóng. | P1 | | | |
| TC026 | 1.2.4.4 | [TH Sửa] Load dữ liệu cũ | Form Sửa đang mở | Kiểm tra giá trị hiển thị của Departure Airport | Hiển thị đúng sân bay đi gốc của bản ghi. | P1 | | | |
| TC027 | 1.2.4.4 | [TH Sửa] Thay đổi Departure Airport | Form Sửa đang mở | 1. Click Departure Airport.<br>2. Chọn sân bay khác sân bay gốc (ví dụ: "SGN"). | Giá trị hiển thị cập nhật sang "SGN" thành công. | P1 | | | |
| TC028 | 1.2.4.4 | [TH Sửa] Xóa trống Departure Airport | Form Sửa đang mở | 1. Xóa giá trị Departure Airport.<br>2. Click **Save**. | Validate lỗi VL004 xuất hiện. Hệ thống không cho phép lưu trống. | P1 | | | |
| TC029 | 1.2.4.4 | Lọc trùng sân bay trong list | Form Thêm mới đang mở | Kiểm tra danh sách hiển thị trong dropdown | Mỗi sân bay (IATA code) chỉ xuất hiện duy nhất 1 lần trong danh sách dropdown. | P2 | | | |

---

### NHÓM 4: TRƯỜNG "ARRIVAL AIRPORT" (6 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC030 | 1.2.4.5 | Để trống Arrival Airport khi Save | Form Thêm mới đang mở | Bỏ trống ô Arrival Airport, click **Save**. | Form không gửi được. Ô Arrival Airport báo đỏ và hiển thị inline message **VL004**. | P1 | | | |
| TC031 | 1.2.4.5 | Mở dropdown Arrival Airport | Form Thêm mới đang mở | Click vào ô Arrival Airport | Dropdown hiển thị đầy đủ danh sách sân bay từ CSDL Airports. | P1 | | | |
| TC032 | 1.2.4.5 | Tìm kiếm nhanh sân bay | Form Thêm mới đang mở | Gõ chữ "SGN" vào ô tìm kiếm nhanh | Dropdown lọc nhanh và hiển thị sân bay "SGN". | P2 | | | |
| TC033 | 1.2.4.5 | [TH Sửa] Load dữ liệu cũ | Form Sửa đang mở | Kiểm tra giá trị hiển thị của Arrival Airport | Hiển thị chính xác sân bay đến gốc của bản ghi. | P1 | | | |
| TC034 | 1.2.4.5 | [TH Sửa] Thay đổi Arrival Airport | Form Sửa đang mở | 1. Chọn Arrival Airport.<br>2. Chọn giá trị khác khác Departure Airport. | Giá trị mới được chọn thành công. | P1 | | | |
| TC035 | 1.2.4.5 | [TH Sửa] Xóa trống Arrival Airport | Form Sửa đang mở | Xóa giá trị cũ và click **Save** | Validate lỗi VL004 xuất hiện ngay tại trường Arrival Airport. | P1 | | | |

---

### NHÓM 5: RÀNG BUỘC KINH DOANH — DEPARTURE AIRPORT KHÁC ARRIVAL AIRPORT (5 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC036 | 1.2.4.11 | [Thêm mới] Dep Airport trùng Arr Airport khi Save | Form Thêm mới đang mở | 1. Chọn Departure = "HAN".<br>2. Chọn Arrival = "HAN".<br>3. Điền các trường khác hợp lệ.<br>4. Click **Save**. | Hệ thống chặn không cho lưu. Hiển thị thông báo lỗi cụ thể: *"Departure Airport và Arrival Airport không được trùng nhau."* Popup không đóng. | P1 | | | |
| TC037 | 1.2.4.11 | [Sửa] Dep Airport trùng Arr Airport khi Save | Form Sửa đang mở | 1. Thay đổi Departure hoặc Arrival sao cho chúng bằng nhau (ví dụ cùng là "SGN").<br>2. Click **Save**. | Hệ thống chặn không cho lưu. Hiển thị thông báo lỗi: *"Departure Airport và Arrival Airport không được trùng nhau."* | P1 | | | |
| TC038 | 1.2.4.11 | Trạng thái hợp lệ (Dep khác Arr) | Form Thêm mới đang mở | 1. Chọn Departure = "HAN".<br>2. Chọn Arrival = "SGN".<br>3. Click **Save**. | Hệ thống cho phép đi qua bước validate trùng sân bay. Tiến hành lưu bản ghi bình thường. | P1 | | | |
| TC039 | 1.2.4.4 | Ẩn sân bay đã chọn tại dropdown đối diện (UX) | Form Thêm mới đang mở | 1. Chọn Departure = "HAN".<br>2. Click mở dropdown của Arrival Airport. | Sân bay "HAN" nên bị ẩn hoặc disable trong dropdown Arrival Airport để tránh chọn nhầm. | P3 | | | | Gợi ý cải tiến UI/UX
| TC040 | 1.2.4.11 | Giả định Validate thời điểm của hệ thống | Form Thêm mới đang mở | 1. Chọn Departure = "HAN".<br>2. Chọn Arrival = "HAN".<br>3. Di chuột ra vùng khác (out focus). | Kiểm tra xem thông báo lỗi trùng nhau hiện ngay khi out focus hay chỉ khi bấm nút Save (theo thiết kế mặc định: hiện khi click Save). | P2 | | | Giả định: kiểm tra khi Save

---

### NHÓM 6: TOGGLE SWITCHES — INTERNATIONAL / DOMESTIC (11 Test Cases)
*(Ràng buộc: International và Domestic hoạt động loại trừ nhau. Chỉ được ON 1 trong 2 hoặc cả 2 cùng OFF)*
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC041 | 1.2.4.6 | Mặc định International | Form Thêm mới đang mở | Quan sát nút International | Mặc định toggle International ở trạng thái **OFF** (Không phải chặng quốc tế). | P2 | | | |
| TC042 | 1.2.4.7 | Mặc định Domestic | Form Thêm mới đang mở | Quan sát nút Domestic | Mặc định toggle Domestic ở trạng thái **OFF** (Không phải chặng nội địa). | P2 | | | |
| TC043 | 1.2.4.6 | Bật International -> Domestic tắt | Form Thêm mới đang mở | 1. Bật toggle **International** (ON).<br>2. Quan sát trạng thái của Domestic. | Toggle Domestic tự động tắt (**OFF**). | P1 | | | |
| TC044 | 1.2.4.7 | Bật Domestic -> International tắt | Form Thêm mới đang mở | 1. Bật toggle **Domestic** (ON).<br>2. Quan sát trạng thái của International. | Toggle International tự động tắt (**OFF**). | P1 | | | |
| TC045 | 1.2.4.10 | Tắt International sau khi bật | Form Thêm mới đang mở | 1. Bật toggle International (ON).<br>2. Tắt toggle International (OFF). | Cả 2 toggle International và Domestic cùng ở trạng thái **OFF**. | P2 | | | |
| TC046 | 1.2.4.10 | Tắt Domestic sau khi bật | Form Thêm mới đang mở | 1. Bật toggle Domestic (ON).<br>2. Tắt toggle Domestic (OFF). | Cả 2 toggle International và Domestic cùng ở trạng thái **OFF**. | P2 | | | |
| TC047 | 1.2.4.10 | Không thể bật đồng thời cả 2 toggle | Form Thêm mới đang mở | 1. Click bật International (ON).<br>2. Click bật Domestic (ON). | Chỉ có Domestic được chuyển sang ON, International tự động chuyển về OFF ngay lập tức. | P1 | | | |
| TC048 | 1.2.4.6 | [TH Sửa] Load International = ON | DB có chặng bay Quốc tế (Intl=Yes) | Mở form Sửa chặng bay đó | Toggle International ở trạng thái **ON**, Domestic ở trạng thái **OFF**. | P1 | | | |
| TC049 | 1.2.4.7 | [TH Sửa] Load Domestic = ON | DB có chặng bay Nội địa (Dom=Yes) | Mở form Sửa chặng bay đó | Toggle Domestic ở trạng thái **ON**, International ở trạng thái **OFF**. | P1 | | | |
| TC050 | 1.2.4.10 | [TH Sửa] Load cả hai = OFF | DB có chặng bay cả hai = No | Mở form Sửa chặng bay đó | Cả hai toggle International và Domestic đều hiển thị **OFF**. | P2 | | | |
| TC051 | 1.2.4.10 | Save khi cả hai toggle = OFF | Form Thêm mới đang mở | 1. Điền các thông tin bắt buộc khác hợp lệ.<br>2. Để cả hai toggle Intl và Dom = OFF.<br>3. Click **Save**. | Hệ thống chấp nhận cho lưu thông tin (cho phép hành trình không phân định loại trên hệ thống danh mục). | P2 | | | Giả định nghiệp vụ cho phép

---

### NHÓM 7: TOGGLE SWITCHES — EDTO & STATUS (6 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC052 | 1.2.4.8 | Mặc định EDTO | Form Thêm mới đang mở | Quan sát trạng thái toggle EDTO | Mặc định toggle EDTO ở trạng thái **OFF** ("Không có sân bay dự bị"). | P3 | | | |
| TC053 | 1.2.4.8 | Bật EDTO | Form Thêm mới đang mở | Bật toggle EDTO sang ON | EDTO chuyển sang trạng thái **ON** ("Có sân bay dự bị"). Trạng thái các toggle khác không bị ảnh hưởng. | P2 | | | |
| TC054 | 1.2.4.8 | [TH Sửa] Load trạng thái EDTO | DB có bản ghi EDTO=Yes | Mở form Sửa chặng bay đó | Toggle EDTO hiển thị **ON**. | P2 | | | |
| TC055 | 1.2.4.9 | Mặc định Status | Form Thêm mới đang mở | Quan sát toggle Status | Toggle Status hiển thị **ON** ("Đang hoạt động") làm giá trị mặc định cho bản ghi mới. | P2 | | | Giả định mặc định ON
| TC056 | 1.2.4.9 | Tắt Status | Form Thêm mới đang mở | Tắt toggle Status sang OFF | Status chuyển sang trạng thái **OFF** ("Ngừng hoạt động"). | P2 | | | |
| TC057 | 1.2.4.9 | [TH Sửa] Load trạng thái Status | DB có bản ghi Inactive | Mở form Sửa chặng bay đó | Toggle Status hiển thị ở vị trí **OFF**. | P1 | | | |

---

### NHÓM 8: NÚT SAVE — HAPPY PATH & ERROR PATHS (10 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC058 | 1.2.4.11 | Thêm mới thành công (Happy Path) | Form Thêm mới đang mở | 1. Nhập Flight Code: `VN-456.7/8`<br>2. Chọn Dep: `HAN`, Arr: `SGN`<br>3. Bật Dom=ON, EDTO=ON, Status=ON<br>4. Click **Save**. | Bản ghi được tạo trong DB. Popup đóng. Hiển thị toast thành công **TB019**: *"Thêm mới thành công chặng bay VN-456.7/8"*. Danh sách chặng bay reload và đưa dòng vừa tạo lên đầu. | P1 | | | |
| TC059 | 1.2.4.11 | Sửa thành công (Happy Path) | Form Sửa đang mở | 1. Đổi Departure Airport từ `HAN` thành `SGN` (Arrival gốc là `NRT`).<br>2. Click **Save**. | Bản ghi cập nhật thành công. Popup đóng. Hiển thị toast thành công **TB019**: *"Sửa thành công chặng bay"*. Dữ liệu dòng tương ứng được cập nhật tức thì trên bảng. | P1 | | | |
| TC060 | 1.2.4.11 | Save thất bại do trùng mã | Form Thêm mới đang mở. Mã `VN123` đã tồn tại | 1. Nhập Flight Code: `VN123`<br>2. Nhập các thông tin khác hợp lệ.<br>3. Click **Save**. | Hệ thống chặn không cho lưu. Hiển thị toast message lỗi **TB020** hoặc **TB021** báo trùng mã chặng bay. Popup giữ nguyên. | P1 | | | |
| TC061 | 1.2.4.11 | Save thất bại do trùng Dep và Arr | Form Thêm mới đang mở | 1. Chọn Dep: `HAN`, Arr: `HAN`<br>2. Click **Save**. | Hệ thống báo lỗi "Departure Airport và Arrival Airport không được trùng nhau". Dữ liệu không lưu, popup giữ nguyên. | P1 | | | |
| TC062 | 1.2.4.11 | Save thất bại khi để trống Flight Code | Form Thêm mới đang mở | 1. Để trống Flight Code.<br>2. Điền các trường khác hợp lệ.<br>3. Click **Save**. | Hệ thống không submit. Báo lỗi highlight đỏ VL004 tại trường Flight Code. | P1 | | | |
| TC063 | 1.2.4.11 | Save thất bại khi thiếu Departure | Form Thêm mới đang mở | 1. Điền Flight Code và Arrival.<br>2. Để trống Departure.<br>3. Click **Save**. | Báo lỗi highlight đỏ VL004 tại trường Departure Airport. | P1 | | | |
| TC064 | 1.2.4.11 | Save thất bại khi thiếu Arrival | Form Thêm mới đang mở | 1. Điền Flight Code và Departure.<br>2. Để trống Arrival.<br>3. Click **Save**. | Báo lỗi highlight đỏ VL004 tại trường Arrival Airport. | P1 | | | |
| TC065 | 1.2.4.11 | Validate đồng thời nhiều trường trống | Form Thêm mới đang mở | 1. Để trống toàn bộ các trường bắt buộc.<br>2. Click **Save**. | Tất cả các ô trống bắt buộc (Flight Code, Dep, Arr) đều bị highlight đỏ và hiện VL004 đồng thời. | P2 | | | |
| TC066 | 1.2.4.11 | Lỗi hệ thống Backend (API 500) | Form Thêm mới đang mở | Giả lập/Ngắt kết nối DB Backend khi bấm Save | Hiển thị toast message lỗi hệ thống **TB021**: *"Có lỗi trong quá trình xử lý dữ liệu, vui lòng thử lại sau!"*. Form giữ nguyên không mất dữ liệu đã nhập. | P1 | | | |
| TC067 | 1.2.4.11 | Mất kết nối internet khi đang Save | Form Thêm mới đang mở | 1. Nhập đầy đủ thông tin.<br>2. Ngắt kết nối internet (Wifi/LAN).<br>3. Click **Save**. | Hiển thị toast lỗi mất kết nối mạng (hoặc tương đương **TB006**). Hệ thống không crash, dữ liệu giữ nguyên trên form. | P2 | | | |

---

### NHÓM 9: NÚT CANCEL & ICON ĐÓNG (X) (6 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC068 | 1.2.4.10 | [Thêm mới] Click Cancel | Đã nhập thông tin vào form | Click nút **Cancel** (Hủy bỏ) | Popup đóng lại lập tức. Người dùng quay lại giao diện danh sách. Không có bản ghi mới nào được thêm vào DB. | P1 | | | |
| TC069 | 1.2.4.10 | [Sửa] Click Cancel | Đã sửa đổi 1 số thông tin | Click nút **Cancel** | Popup đóng lại. Mọi thay đổi vừa nhập không được lưu vào DB. Bản ghi giữ nguyên trạng thái cũ. | P1 | | | |
| TC070 | 1.2.4.2 | [Thêm mới] Click Icon X | Đã nhập thông tin | Click icon **X** ở góc trên bên phải popup | Popup đóng lại lập tức, không lưu dữ liệu. | P1 | | | |
| TC071 | 1.2.4.2 | [Sửa] Click Icon X | Đã sửa đổi thông tin | Click icon **X** | Popup đóng lại lập tức, không lưu thay đổi. | P1 | | | |
| TC072 | 1.2.4.10 | Xác nhận mất dữ liệu khi Cancel (UX) | Form đang chứa dữ liệu nhập dở | Click **Cancel** hoặc icon **X** | Kiểm tra xem hệ thống có đưa ra cảnh báo "Thay đổi chưa được lưu, bạn có chắc chắn muốn thoát?" trước khi đóng hẳn không. (Khuyến nghị: Nên có nếu có thay đổi). | P3 | | | Giả định hiện tại: đóng luôn
| TC073 | 1.2.4.10 | Click ra ngoài vùng popup (Overlay click) | Form đang mở | Click chuột vào vùng tối ngoài phạm vi popup | Kiểm tra hành vi hệ thống: popup không được tự động đóng (tránh trường hợp người dùng click trượt làm mất dữ liệu đang nhập). | P3 | | | Giả định: không đóng khi click ngoài

---

### NHÓM 10: PHÂN QUYỀN TRÊN FORM CHỨC NĂNG (5 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC074 | 1.1 | Nút Create chỉ sáng khi có quyền | Tài khoản: `admin_fims` (có quyền) | Vào màn danh sách | Nút **Create** hiển thị sáng, cho phép click để mở popup. | P1 | | | |
| TC075 | 1.1 | Ẩn nút Create khi thiếu quyền | Tài khoản: `view_fims` (thiếu quyền) | Vào màn danh sách | Nút **Create** bị ẩn hoàn toàn khỏi giao diện. | P1 | | | |
| TC076 | 1.1 | Icon Edit chỉ hiển thị khi có quyền | Tài khoản: `admin_fims` | Vào màn danh sách | Cột Action hiển thị icon Sửa (bút chì) đầy đủ. | P1 | | | |
| TC077 | 1.1 | Ẩn icon Edit khi thiếu quyền | Tài khoản: `view_fims` | Vào màn danh sách | Cột Action không chứa icon Sửa. | P1 | | | |
| TC078 | 1.1 | Bypass UI gọi API trực tiếp | Tài khoản: `view_fims` | Dùng Postman gửi payload POST tạo mới chặng bay trực tiếp vào API endpoint backend. | API backend chặn và trả về mã lỗi `403 Forbidden` hoặc `401 Unauthorized`. Bản ghi không được tạo. | P1 | | | |

---

### NHÓM 11: EDGE CASES & KIỂM TRA NÂNG CAO (8 Test Cases)
| TC# | SRS Ref | Mô tả kịch bản | Tiền điều kiện | Các bước thực hiện | Kết quả mong đợi (Expected Result) | Priority | Actual Result | Status | Ghi chú |
|---|---|---|---|---|---|---|---|---|---|
| TC079 | 1.2.4.3 | Flight Code chỉ gồm ký tự đặc biệt | Form Thêm mới đang mở | Nhập Flight Code: `----....//` (hoàn toàn là ký tự đặc biệt hợp lệ), click Save. | Hệ thống chặn hoặc cho phép? (Theo spec hợp lệ vì cho phép ký tự này. Cần kiểm tra xem DB/Business rule có bắt buộc có ký tự chữ/số không). | P3 | | | Cần verify rule thực tế
| TC080 | 1.2.4.3 | Flight Code chỉ nhập spaces | Form Thêm mới đang mở | Nhập "     " (toàn dấu cách), click Save. | Sau khi TRIM, chuỗi trở thành rỗng => Hệ thống báo lỗi đỏ VL004 (Empty). | P2 | | | |
| TC081 | 1.2.4.4 | Danh sách Airports từ API trả về trống | Giả lập DB Airports không có bản ghi Active nào | Mở dropdown Departure hoặc Arrival | Dropdown hiển thị trống, không bị crash giao diện hay treo spinner vĩnh viễn. | P2 | | | |
| TC082 | 1.2.4.3 | Trùng mã kiểm tra Case-sensitive | Form Thêm mới đang mở. DB đã có `VN123` | Nhập Flight Code: `vn123` (viết thường), click Save. | Kiểm tra xem DB có check case-insensitive không. Nếu có: Báo trùng mã (Pass). Nếu không: Cho lưu (Cần confirm với BA xem chặng bay `VN123` và `vn123` có được coi là trùng nhau không). | P2 | | | Gợi ý: check trùng không phân biệt hoa/thường
| TC083 | 1.2.4.11 | Spam nút Save liên tục (Double-click) | Form Thêm mới đang mở | Điền dữ liệu đúng, click liên tiếp 2-3 lần thật nhanh vào nút **Save**. | Hệ thống chỉ gửi 1 request và chỉ tạo duy nhất 1 bản ghi trong DB. Tránh lỗi duplicate request trên server. | P1 | | | |
| TC084 | 1.2.4.11 | Tranh chấp sửa đổi (Concurrency) | User A và User B cùng mở form Sửa chặng bay `VN123` | 1. User A đổi Dep Airport và click Save thành công.<br>2. User B sau đó đổi Arr Airport trên màn hình cũ và click Save. | Hệ thống thông báo lỗi tranh chấp (Conflict/Version mismatch) cho User B, không cho ghi đè mù quáng. (Cần kiểm tra thiết kế Optimistic Locking của dự án). | P2 | | | Cần verify thiết kế hệ thống
| TC085 | 1.2.4.1 | Lỗi tải API chi tiết khi mở form Sửa | Form danh sách đang mở | Bấm Sửa nhưng API GET chi tiết chặng bay trả về lỗi 500 | Form Sửa không hiển thị dữ liệu rỗng. Hiện toast thông báo lỗi tải dữ liệu. Popup không mở hoặc tự đóng. | P2 | | | |
| TC086 | 1.2.4.4 | Chọn Departure sau khi đã chọn Arrival trùng | Form Thêm mới đang mở | 1. Chọn Arrival = "SGN".<br>2. Chọn Departure = "SGN".<br>3. Bấm ra ngoài. | Báo lỗi trùng Dep/Arr ngay lập tức (hoặc khi Save tùy theo thiết kế validate của dự án). | P2 | | | |

---

## 5. BẢNG TỔNG HỢP SỐ LƯỢNG TEST CASES
| Nhóm kịch bản | Số lượng TCs | Ưu tiên P1 | Ưu tiên P2 | Ưu tiên P3 |
|---|---|---|---|---|
| 1 — Hiển thị & Trigger | 6 | 2 | 4 | 0 |
| 2 — Trường Flight Code | 14 | 9 | 4 | 1 |
| 3 — Departure Airport | 9 | 6 | 3 | 0 |
| 4 — Arrival Airport | 7 | 5 | 2 | 0 |
| 5 — Ràng buộc Dep != Arr | 5 | 3 | 1 | 1 |
| 6 — Toggle Intl / Dom | 11 | 5 | 6 | 0 |
| 7 — Toggle EDTO / Status | 6 | 1 | 4 | 1 |
| 8 — Nút Save & Luồng lưu | 10 | 8 | 2 | 0 |
| 9 — Hủy bỏ & Đóng | 6 | 4 | 0 | 2 |
| 10 — Phân quyền hệ thống | 5 | 5 | 0 | 0 |
| 11 — Edge Cases nâng cao | 8 | 1 | 6 | 1 |
| **TỔNG CỘNG** | **83** | **49** | **32** | **6** |

---

## 6. DANH SÁCH CÂU HỎI MỞ (OPEN QUESTIONS FOR BA/DEV)
> [!IMPORTANT]
> Tester cần gửi danh sách này cho BA Lead và Tech Lead trước khi tiến hành viết kịch bản test chi tiết tự động hoặc chạy test tay:

1. **Về Validate Dep=Arr (TC040):** Hệ thống sẽ thực hiện kiểm tra và báo lỗi ngay khi người dùng chọn xong sân bay trùng ở dropdown thứ hai (out focus), hay chỉ hiển thị cảnh báo khi bấm nút **Save**?
2. **Về Cảnh báo mất dữ liệu (TC072):** Khi form đã được điền thông tin dở dang, nếu người dùng bấm **Cancel** hoặc nút **X**, hệ thống có hiển thị popup confirm xác nhận hành động hủy không? Hay đóng luôn và xóa sạch dữ liệu trên form?
3. **Về Đóng form khi click ngoài (TC073):** Người dùng click chuột ra vùng overlay màu xám bên ngoài popup thì popup có tự đóng không? (Khuyến nghị của QA: không đóng để tránh mất công nhập liệu).
4. **Về Trạng thái mặc định của Status (TC055):** Khi mở form thêm mới, toggle Status mặc định ở trạng thái ON (Hoạt động) hay OFF (Không hoạt động)?
5. **Về Trùng mã Flight Code (TC082):** Hệ thống kiểm tra trùng lặp mã Flight Code có phân biệt chữ hoa và chữ thường không (ví dụ: `VN123` và `vn123` có bị coi là trùng không)?
6. **Về Xử lý tranh chấp (TC084):** Dự án FIMS sử dụng cơ chế gì để giải quyết khi hai người dùng cùng sửa một chặng bay cùng một lúc? (Optimistic Locking có versioning/last-updated-time hay cho phép người lưu sau đè đè dữ liệu cũ)?
7. **Về Format Flight Code (TC079):** Chặng bay có cho phép tạo mã chỉ toàn các ký tự đặc biệt (ví dụ: `---...//`) không? Hay tối thiểu phải chứa ít nhất một chữ cái hoặc chữ số?
