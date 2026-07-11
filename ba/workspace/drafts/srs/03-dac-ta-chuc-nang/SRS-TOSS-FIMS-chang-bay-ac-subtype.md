---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Team"
version: "0.1"
date: "2026-06-11"
status: "Draft"
document_type: "SRS"
---

# Đặc tả chức năng — Quản lý danh mục Chặng bay và AC Subtype

*Tài liệu này đặc tả chi tiết hai chức năng danh mục của hệ thống FIMS: Quản lý danh mục Chặng bay và Quản lý danh mục AC Subtype. Nội dung được rà soát, chuẩn hóa và thống nhất cách trình bày. Các sơ đồ luồng hệ thống được mô tả đầy đủ bằng bảng "Mô tả luồng xử lý" trong từng chức năng; bản vẽ sơ đồ gốc được lưu kèm trong hồ sơ thiết kế.*

---

## 1. Quản lý danh mục Chặng bay

Module quản lý danh mục Chặng bay (Leg/Segment) định nghĩa các cặp sân bay khởi hành – đến trong mạng đường bay của VNA. Mỗi chặng bay xác định loại hành trình (Nội địa / Quốc tế) và các thuộc tính khai thác đặc biệt như EDTO. Module cho phép thực hiện các chức năng: Xem danh sách, Tìm kiếm/Lọc, Xuất Excel, Thêm mới, Sửa và Xóa.

### 1.1. Xem danh sách chặng bay

| Tên chức năng | Xem danh sách chặng bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xem toàn bộ danh sách chặng bay đã được khai báo trong hệ thống |
| **Trigger** | Người dùng truy cập web FIMS, nhấn phân hệ **Danh mục**, chọn **Chặng bay** |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và có phân quyền xem phân hệ Danh mục Chặng bay |
| **Hậu điều kiện** | Màn hình hiển thị danh sách chặng bay |

#### 1.1.1. Mô tả luồng xử lý

| Bước | Chi tiết |
| ----- | ----- |
| 1 | Người dùng truy cập web FIMS, mở module Danh mục, chọn Chặng bay |
| 2 | Hệ thống hiển thị màn hình danh sách Chặng bay trên giao diện |
| 3 | Người dùng click Thêm mới, hệ thống hiển thị màn hình Thêm mới Chặng bay |
| 4 | Người dùng click icon "Sửa", hệ thống hiển thị màn hình Sửa Chặng bay |
| 5 | Người dùng click icon "Xóa", hệ thống hiển thị màn hình Xóa Chặng bay |

#### 1.1.2. Mô tả chi tiết màn hình

**Chức năng tìm kiếm:** Click vào các ô search để chọn lọc, tìm kiếm thông tin theo dữ liệu của Chặng bay. Trường hợp searchbox không có dữ liệu: mặc định tìm kiếm toàn bộ dữ liệu tại cột đó. Khi người dùng thay đổi giá trị trường dữ liệu (debounce 0.5s) hoặc nhấn Enter/nút Search, hệ thống reload dữ liệu bảng phù hợp với bộ lọc và đặt lại trang hiện tại về trang 1. Trường hợp API trả về có kết quả: hiển thị danh sách theo kết quả API; trường hợp API trả về rỗng hoặc lỗi: hiển thị "Không có kết quả nào liên quan".

| STT | Tên | Kiểu dữ liệu | Mapping DB/API | Mô tả |
| ----- | ----- | ----- | ----- | ----- |
| 1 | Departure Airport | Combobox | departure_airport | Trường để lọc: tìm kiếm chính xác theo [departure_airport]. Danh sách giá trị lấy động từ mã IATA trong danh mục Airports, kèm tùy chọn 'All'. Chọn 'All' = chọn tất cả sân bay |
| 2 | Arrival Airport | Combobox | arrival_airport | Trường để lọc: tìm kiếm chính xác theo [arrival_airport]. Danh sách giá trị lấy động từ mã IATA trong danh mục Airports, kèm tùy chọn 'All'. Chọn 'All' = chọn tất cả sân bay |
| 3 | Loại chặng bay | DDL | route_type | Trường để lọc: tìm kiếm chính xác theo loại chặng bay. Danh sách giá trị: 'All', 'Quốc tế (International)', 'Nội địa (Domestic)'. Chọn 'All' = chọn cả hai. *(Gộp từ hai bộ lọc International/Domestic cũ vì hai cờ này loại trừ nhau — xem mục 3, Câu hỏi CB-01)* |
| 4 | EDTO | DDL | edto | Trường để lọc: tìm kiếm chính xác theo [edto]. Danh sách giá trị: 'All', 'Yes', 'No'. Chọn 'All' = chọn cả Yes và No |
| 5 | Status | DDL | status | Trường để lọc: tìm kiếm chính xác theo [status]. Danh sách giá trị: 'All', 'Active', 'Inactive'. Chọn 'All' = chọn cả Active và Inactive |
| 6 | Nút Search | Button | | Click: hệ thống lọc dữ liệu dựa trên nội dung trường lọc và trả về danh sách phù hợp với từ khóa tìm kiếm |
| 7 | Nút Reset | Button | | Click: hệ thống xóa nội dung search, reset toàn bộ trường lọc đã chọn, reset phân trang về trang đầu, gọi API lấy danh sách mặc định và hiển thị lại danh sách ban đầu |
| 8 | Nút Thêm mới (Create) | Button | | Click: mở màn hình Thêm mới Chặng bay, hiển thị form nhập thông tin. Nút Create chỉ hiển thị khi người dùng đã đăng nhập thành công và có quyền Thêm mới đối với chức năng tương ứng |
| 9 | Nút Export Excel | Button | | Tham chiếu kịch bản xuất Excel dùng chung (mục 11.4). Tên file tải về: FIMS_Quanlychangbay_ddmmyyhhss. Nội dung file: theo các cột dữ liệu hiển thị từ bảng danh sách Chặng bay. Định dạng: xlsx |
| 10 | Seq | Textview | | Hiển thị số thứ tự bản ghi tăng dần |
| 11 | Flight Code | Textview | flight_code | Hiển thị [flight_code] theo dữ liệu API trả về. Hiển thị tối đa 2 dòng; nếu vượt quá 2 dòng thì hiển thị "…" ở cuối dòng thứ 2 kèm tooltip hiển thị toàn bộ nội dung. Trường hợp lỗi API: hiển thị N/A |
| 12 | Departure Airport | Textview | departure_airport | Hiển thị [departure_airport] theo dữ liệu API trả về. Hiển thị tối đa 2 dòng; nếu vượt quá thì hiển thị "…" kèm tooltip. Trường hợp lỗi API: hiển thị N/A |
| 13 | Arrival Airport | Textview | arrival_airport | Hiển thị [arrival_airport] theo dữ liệu API trả về. Hiển thị tối đa 2 dòng; nếu vượt quá thì hiển thị "…" kèm tooltip. Trường hợp lỗi API: hiển thị N/A |
| 14 | International | Icon, text | international | Hiển thị trạng thái tương ứng giá trị lưu tại CSDL. Chỉ đọc |
| 15 | Domestic | Icon, text | domestic | Hiển thị trạng thái tương ứng giá trị lưu tại CSDL. Chỉ đọc |
| 16 | EDTO | Icon, text | edto | Hiển thị trạng thái tương ứng giá trị lưu tại CSDL. Chỉ đọc |
| 17 | Status | Textview | status | Hiển thị TagStatus theo dữ liệu API trả về. Status = Active: tag màu xanh lá; Status = Inactive: tag màu xám |
| 18 | Action | Icon function | | Bao gồm các chức năng: Sửa (ẩn khi người dùng không có quyền Sửa), Xóa (ẩn khi người dùng không có quyền Xóa). Click chức năng: mở màn hình tương ứng |
| 19 | Phân trang | Pagination | | Khi số lượng dữ liệu API trả về > 10: hiển thị phân trang. Chi tiết theo kịch bản phân trang dùng chung |

### 1.2. Thêm mới / Sửa chặng bay

| Tên chức năng | Thêm mới / Sửa chặng bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng thêm mới hoặc chỉnh sửa thông tin chặng bay |
| **Trigger** | Người dùng click nút **Thêm mới** hoặc icon **Sửa** tại bản ghi trong danh sách |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và có phân quyền thêm mới / sửa chặng bay |
| **Hậu điều kiện** | Thêm mới / Sửa thành công, dữ liệu được lưu vào DB |

#### 1.2.1. Mô tả luồng xử lý

| Bước | Chi tiết |
| :---: | ----- |
| 1 | Người dùng truy cập web FIMS, mở module Danh mục, chọn Chặng bay, hiển thị màn hình Chặng bay |
| 2 | Người dùng click nút Thêm mới hoặc icon "Sửa" tại chặng bay muốn sửa |
| 3 | Hệ thống hiển thị màn hình Thêm mới / Sửa Chặng bay, cho phép người dùng nhập mới hoặc chỉnh sửa thông tin chặng bay |
| 4 | Người dùng nhập/cập nhật dữ liệu và nhấn **Save** |
| 5 | Hệ thống kiểm tra dữ liệu: nếu dữ liệu không hợp lệ chuyển sang bước 6; ngược lại chuyển sang bước 7 |
| 6 | Hiển thị thông báo lỗi đến người dùng (lỗi cấp trường: hiển thị inline; lỗi hệ thống: hiển thị toast message) |
| 7 | Lưu dữ liệu vào DB |
| 8 | Hiển thị toast message Thêm mới/Sửa thành công; đóng màn hình Thêm mới/Sửa |

#### 1.2.2. Mô tả chi tiết màn hình

| STT | Tên | Kiểu dữ liệu [Độ dài] | Mapping DB/API | Mô tả |
| ----- | :---- | :---- | :---- | :---- |
| 1 | Title | Textview | | Tiêu đề thay đổi theo thao tác: trường hợp Thêm mới hiển thị "Add new flight route"; trường hợp Sửa hiển thị "Edit flight route" |
| 2 | Icon X | Icon | | Click: đóng popup, điều hướng về màn hình trước đó |
| 3 | Flight code | TextBox [0;10] | flight_code | **Trường hợp Thêm mới:** mặc định để trống và cho nhập; placeholder "Enter Code"; bắt buộc nhập; maxlength 10 ký tự (chặn nếu nhập quá 10; nếu paste đoạn văn > 10 ký tự chỉ nhận 10 ký tự đầu); tự động TRIM khoảng trắng đầu/cuối khi out focus; cho phép nhập chữ, số, dấu gạch ngang [-], gạch dưới [_], chấm [.], gạch chéo [/]; chặn trùng dữ liệu; nếu nội dung dài vượt độ rộng ô thì hiển thị "…" kèm tooltip. Action: nhấn Enter/out focus/click Save, hệ thống validate, nếu để trống hiển thị thông báo IM VL004. **Trường hợp Sửa:** hiển thị [flight_code] theo dữ liệu API trả về; không cho phép chỉnh sửa |
| 4 | Departure Airport | Dropdown (đơn) | departure_airport | Bắt buộc chọn; chỉ cho phép chọn **một** sân bay. Placeholder "Choose Departure Airport". Hiển thị danh sách sân bay riêng biệt, không trùng lặp; danh sách lấy từ mã IATA của danh mục Airports; cho phép nhập từ khóa để tìm nhanh. **Trường hợp Sửa:** hiển thị [departure_airport] theo API và cho phép chỉnh sửa. Action: nhấn Enter/out focus/click Save, hệ thống validate, nếu để trống hiển thị thông báo IM VL004 |
| 5 | Arrival Airport | Dropdown (đơn) | arrival_airport | Bắt buộc chọn; chỉ cho phép chọn **một** sân bay. Placeholder "Choose Arrival Airport". Hiển thị danh sách sân bay riêng biệt, không trùng lặp; danh sách lấy từ mã IATA của danh mục Airports; cho phép nhập từ khóa để tìm nhanh. **Trường hợp Sửa:** hiển thị [arrival_airport] theo API và cho phép chỉnh sửa. Action: nhấn Enter/out focus/click Save, hệ thống validate, nếu để trống hiển thị thông báo IM VL004. **Ràng buộc:** Arrival Airport phải khác Departure Airport; nếu trùng, hiển thị thông báo lỗi và không cho lưu *(đề xuất bổ sung — xem Câu hỏi CB-02)* |
| 6 | International | Toggle | international | On: chặng bay quốc tế; Off: không phải chặng bay quốc tế. Áp dụng cho cả Thêm mới và Sửa. Hoạt động loại trừ với Domestic (xem ghi chú cuối mục) |
| 7 | Domestic | Toggle | domestic | On: chặng bay nội địa; Off: không phải chặng bay nội địa. Áp dụng cho cả Thêm mới và Sửa. Hoạt động loại trừ với International (xem ghi chú cuối mục) |
| 8 | EDTO | Toggle | edto | On: chặng bay áp dụng EDTO; Off: không áp dụng EDTO. Áp dụng cho cả Thêm mới và Sửa. *(Định nghĩa nghiệp vụ của cờ EDTO cần SME xác nhận — xem Câu hỏi CB-03)* |
| 9 | Status | Toggle | status | On: Đang hoạt động; Off: Ngừng hoạt động. Áp dụng cho cả Thêm mới và Sửa |
| 10 | Cancel | Button | | Click: đóng popup, điều hướng về màn hình trước đó; dữ liệu không được lưu vào DB |
| 11 | Save | Button | | Click: hệ thống kiểm tra dữ liệu. Nếu chặng bay đã tồn tại trong DB theo khóa định danh: hiển thị toast message TB020 và giữ nguyên popup. Nếu dữ liệu hợp lệ: lưu thành công, hiển thị toast message TB019, đóng popup và điều hướng về màn danh sách. *(Khóa định danh dùng để kiểm tra trùng cần xác nhận — xem Câu hỏi CB-04)* |

**Ghi chú:** Hai nút International và Domestic hoạt động loại trừ nhau — tại một thời điểm chỉ được bật một trong hai. Khi người dùng bật một nút, hệ thống tự động tắt nút còn lại.

### 1.3. Xóa chặng bay

| Tên chức năng | Xóa chặng bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xóa chặng bay khỏi danh mục |
| **Trigger** | Người dùng click icon **Xóa** tại bản ghi trong danh sách |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và có phân quyền xóa chặng bay |
| **Hậu điều kiện** | Xóa thành công chặng bay khỏi danh sách |

#### 1.3.1. Mô tả luồng xử lý

| Bước | Chi tiết |
| :---: | ----- |
| 1 | Người dùng truy cập web FIMS, mở module Danh mục, chọn Chặng bay, hiển thị màn hình Chặng bay |
| 2 | Người dùng click icon "Xóa" |
| 3 | Mở màn hình xác nhận Xóa Chặng bay |
| 4 | Người dùng nhập Lý do và nhấn nút **Xóa** |
| 5 | Hệ thống kiểm tra ràng buộc tham chiếu và dữ liệu: nếu không hợp lệ chuyển sang bước 6; ngược lại chuyển sang bước 7 |
| 6 | Hiển thị toast message lỗi đến người dùng (bao gồm trường hợp chặng bay đang được tham chiếu trong lịch khai thác) |
| 7 | Cập nhật dữ liệu vào DB |
| 8 | Hiển thị toast message Xóa thành công |

*(Cơ chế xóa cứng hay xóa mềm và việc kiểm tra ràng buộc tham chiếu cần xác nhận — xem Câu hỏi CB-05 và CB-06)*

#### 1.3.2. Mô tả chi tiết màn hình

| STT | Tên | Kiểu | Mô tả |
| :---- | :---- | :---- | :---- |
| 1 | Title | Textview | "Xóa chặng bay" |
| 2 | Nội dung cảnh báo | Textview | "Bạn có chắc chắn muốn xóa chặng bay [DEP IATA/ICAO] – [ARR IATA/ICAO] không?" |
| 3 | Lý do xóa | Textarea | Bắt buộc nhập. Placeholder "Enter reason…". Maxlength 1000 ký tự; nếu paste vượt quá chỉ nhận 1000 ký tự đầu. Tự động TRIM khoảng trắng đầu/cuối. Nếu để trống khi nhấn Xóa: hiển thị thông báo inline "Please enter reason" |
| 4 | Nút Huỷ | Button | Click: đóng popup, không xóa |
| 5 | Nút Xóa | Button | Click: hệ thống kiểm tra lý do và ràng buộc tham chiếu, sau đó gọi API xóa |

---

## 2. Quản lý danh mục AC Subtype

Module quản lý danh mục AC Subtype (phân loại phụ tàu bay). Mỗi AC Subtype gắn với phân loại tàu bay tương ứng. Module cho phép thực hiện các chức năng: Xem danh sách, Tìm kiếm/Lọc, Xuất Excel, Thêm mới, Sửa và Xóa.

*Ghi chú mô hình dữ liệu: quan hệ giữa AC Subtype với Aircraft Type và với Đội bay (Fleet) hiện chưa nhất quán giữa các mô tả; nội dung cần làm rõ được nêu tại Câu hỏi AC-01.*

### 2.1. Xem danh sách AC Subtype

| Tên chức năng | Xem danh sách AC Subtype |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xem, tìm kiếm và lọc danh sách AC Subtype hiện có trong hệ thống |
| **Trigger** | Người dùng truy cập web FIMS, mở module Danh mục, chọn AC Subtype |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xem Danh mục AC Subtype |
| **Hậu điều kiện** | Màn hình danh sách AC Subtype được hiển thị |

#### 2.1.1. Mô tả luồng xử lý

| Bước | Mô tả |
| ----- | ----- |
| 1 | Người dùng truy cập web FIMS, mở module Danh mục, chọn AC Subtype |
| 2 | Hệ thống call API lấy danh sách AC Subtype (mặc định không filter) |
| 3 | Hiển thị danh sách AC Subtype trên giao diện |
| 4 | Người dùng nhấn nút Create, hệ thống mở màn Thêm mới AC Subtype |
| 5 | Người dùng nhấn nút Edit, hệ thống mở màn Sửa AC Subtype |
| 6 | Người dùng nhấn nút Delete, hệ thống mở màn Xóa AC Subtype |

#### 2.1.2. Mô tả chi tiết màn hình

**Danh sách AC Subtype:** Hệ thống call API lấy danh sách AC Subtype mới nhất để hiển thị, bao gồm: AC Subtype Code, AC Subtype Name, Aircraft Type, Status, Note. Danh sách được sắp xếp theo thời gian cập nhật mới nhất; trường hợp sửa bản ghi thì bản ghi đó được đưa lên đầu.

**Tìm kiếm:** Click vào các ô search để lọc, tìm kiếm theo dữ liệu của AC Subtype. Trường hợp searchbox không có dữ liệu: mặc định tìm kiếm toàn bộ dữ liệu tại cột đó. Khi người dùng nhấn Enter/nút Search, hệ thống reload dữ liệu bảng phù hợp với bộ lọc và đặt lại trang hiện tại về trang 1. Trường hợp API trả về có kết quả: hiển thị danh sách theo kết quả API; trường hợp API trả về rỗng hoặc lỗi: hiển thị danh sách rỗng với thông điệp "Không có kết quả nào liên quan".

| STT | Tên | Kiểu dữ liệu [Độ dài] | Mapping DB/API | Mô tả nghiệp vụ |
| ----- | ----- | ----- | ----- | ----- |
| 1 | Search AC Subtype Code | Textbox [0;20] | search_code | Placeholder "Search by AC Subtype Code". Trường để lọc: tìm kiếm gần đúng theo [AC Subtype Code]. Maxlength 20 ký tự; cho phép nhập chữ, số và ký tự đặc biệt. Nếu nhập vượt quá độ dài ô thì thay phần vượt quá bằng "…" kèm tooltip. Nếu paste đoạn văn thì ghi nhận 20 ký tự đầu. Tự động TRIM khoảng trắng đầu/cuối khi tìm kiếm |
| 2 | Search AC Subtype Name | Textbox [0;100] | search_name | Placeholder "Search by AC Subtype Name". Trường để lọc: tìm kiếm gần đúng theo [AC Subtype Name]. Maxlength 100 ký tự; cho phép nhập chữ, số và ký tự đặc biệt. Nếu nhập vượt quá độ dài ô thì thay phần vượt quá bằng "…" kèm tooltip. Nếu paste đoạn văn thì ghi nhận 100 ký tự đầu. Tự động TRIM khoảng trắng đầu/cuối khi tìm kiếm |
| 3 | Filter Aircraft Type | Dropdown (đơn) | filter_aircraft_type_id | Placeholder "Aircraft Type". Trường để lọc: tìm kiếm chính xác theo [Aircraft Type]. Chỉ được chọn một giá trị. *(Kiểu chọn đơn/đa cần xác nhận — xem Câu hỏi AC-02)* |
| 4 | Filter Status | Dropdown (đơn) | filter_status | Placeholder "Status". Trường để lọc: tìm kiếm chính xác theo [Status]. Các lựa chọn: Active / Inactive |
| 5 | Nút Search | Button | | Click: hệ thống lọc dữ liệu dựa trên từ khóa và trả về danh sách phù hợp |
| 6 | Nút Reset | Button | | Click: hệ thống xóa nội dung search, reset toàn bộ trường lọc đã chọn, reset phân trang về trang đầu, gọi API lấy danh sách mặc định và hiển thị lại danh sách ban đầu |
| 7 | Nút Thêm mới | Button | btn_add | Vị trí: góc trên bên phải. Click: hiển thị popup Thêm mới AC Subtype (xem 2.2) |
| 8 | Nút Export Excel | Button | btn_export_excel | Vị trí: góc trên bên phải, cạnh nút Thêm mới. Click: xuất danh sách AC Subtype hiện tại (theo điều kiện filter đang áp dụng) ra file Excel. Tham chiếu kịch bản Export dùng chung (mục 11.4) |
| 9 | AC Subtype Code | Textview | ac_subtype_code | Hiển thị mã AC Subtype. Trường hợp API trả về rỗng/lỗi: để trống |
| 10 | AC Subtype Name | Textview | ac_subtype_name | Hiển thị tên AC Subtype. Trường hợp API trả về rỗng/lỗi: để trống |
| 11 | Aircraft Type | Textview | aircraft_type_names | Hiển thị tên Aircraft Type. Trường hợp API trả về rỗng/lỗi: để trống |
| 12 | Trạng thái | Tag | status | Active: tag màu xanh lá; Inactive: tag màu xám |
| 13 | Icon Sửa | Button | btn_edit | Click: hiển thị popup Sửa AC Subtype (xem 2.2) |
| 14 | Icon Xóa | Button | btn_delete | Click: hiển thị popup xác nhận Xóa (xem 2.3) |
| 15 | Chân trang | Pagination | | Theo kịch bản phân trang dùng chung |

### 2.2. Thêm mới / Sửa AC Subtype

| Tên chức năng | Thêm mới / Sửa AC Subtype |
| ----- | ----- |
| **Mục đích** | Cho phép người dùng thêm mới hoặc chỉnh sửa thông tin AC Subtype |
| **Trigger** | Người dùng click nút "Thêm mới" hoặc icon "Sửa" tại một bản ghi AC Subtype trong danh sách |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền Thêm mới / Sửa AC Subtype |
| **Hậu điều kiện** | Thêm mới / Sửa thành công, dữ liệu được lưu vào DB |

#### 2.2.1. Mô tả luồng xử lý

| Bước | Mô tả |
| :---- | :---- |
| 1 | Người dùng truy cập module Danh mục, chọn AC Subtype |
| 2 | Người dùng click "Thêm mới" hoặc icon "Sửa" tại bản ghi muốn chỉnh sửa |
| 3 | Hệ thống hiển thị popup Thêm mới / Sửa AC Subtype. Trường hợp Thêm mới: các trường để trống; trường hợp Sửa: load dữ liệu hiện tại vào form |
| 4 | Người dùng nhập/cập nhật dữ liệu và nhấn "Save" |
| 5 | Hệ thống validate dữ liệu: nếu không hợp lệ chuyển sang bước 6; nếu hợp lệ chuyển sang bước 7 |
| 6 | Hiển thị thông báo lỗi IM tương ứng, giữ nguyên màn hình popup |
| 7 | Hệ thống lưu dữ liệu vào DB (insert hoặc update) |
| 8 | Đóng popup, hiển thị toast message thành công TB019, reload danh sách |

#### 2.2.2. Mô tả chi tiết màn hình

| STT | Tên | Kiểu dữ liệu | Mapping DB/API | Mô tả nghiệp vụ |
| ----- | ----- | ----- | ----- | ----- |
| 1 | Title | Content | | Tiêu đề thay đổi theo thao tác: trường hợp Thêm mới hiển thị "Add new AC Subtype"; trường hợp Sửa hiển thị "Edit AC Subtype" |
| 2 | Icon X | Icon | | Click: đóng màn hình Thêm mới/Sửa, điều hướng về màn hình trước đó; dữ liệu thay đổi không được lưu vào DB |
| 3 | Nút Hủy bỏ | Button | | Click: đóng màn hình Thêm mới/Sửa, điều hướng về màn hình trước đó; dữ liệu thay đổi không được lưu vào DB |
| 4 | AC Subtype code | Textbox (Thêm mới) / Textview (Sửa) | ac_subtype_code | **Trường hợp Thêm mới:** mặc định để trống và cho nhập; placeholder "Enter AC Subtype code"; bắt buộc nhập; cho phép chỉnh sửa. **Trường hợp Sửa:** dữ liệu fill sẵn theo API; không cho phép chỉnh sửa; nếu API trả về lỗi/rỗng thì để trống. **Validate chung:** maxlength 10 ký tự (chặn nếu nhập quá 10; nếu paste thì ghi nhận 10 ký tự đầu); cho phép chữ, số, ký tự đặc biệt; chặn trùng dữ liệu; nếu nội dung vượt độ dài ô thì hiển thị "…" kèm tooltip; tự động TRIM khoảng trắng đầu/cuối khi out focus. Action: out focus/click Save, hệ thống validate: nếu để trống hiển thị inline "The AC Subtype code field must not be empty."; nếu mã đã tồn tại hiển thị inline "AC Subtype code already exists. Please check again." |
| 5 | AC Subtype name | Textbox | ac_subtype_name | **Trường hợp Thêm mới:** mặc định để trống và cho nhập; placeholder "Enter AC Subtype name"; bắt buộc nhập. **Trường hợp Sửa:** dữ liệu fill sẵn theo API; nếu API trả về lỗi/rỗng thì để trống và hiển thị placeholder "Enter AC Subtype name". **Validate chung:** maxlength 100 ký tự (chặn nếu nhập quá 100; nếu paste thì ghi nhận 100 ký tự đầu); cho phép chữ, số, ký tự đặc biệt; nếu nội dung vượt độ dài ô thì hiển thị "…" kèm tooltip; tự động TRIM khoảng trắng đầu/cuối khi out focus. Action: out focus/click Save, hệ thống validate: nếu để trống hiển thị inline "The AC Subtype name field must not be empty." *(Độ dài tối đa của tên cần xác nhận — xem Câu hỏi AC-03)* |
| 6 | Aircraft Type | Dropdown (đơn) | aircraft_type_id | Bắt buộc chọn; chỉ cho phép chọn một giá trị. **Trường hợp Thêm mới:** mặc định để trống; placeholder "Select aircraft type". **Trường hợp Sửa:** dữ liệu fill sẵn theo API và cho phép thay đổi; nếu API trả về lỗi/rỗng thì để trống và hiển thị placeholder "Select aircraft type". Action: out focus/click Save, hệ thống validate: nếu để trống hiển thị IM "The Aircraft type field must not be empty." *(Nguồn dữ liệu của dropdown này — Aircraft Type hay Flight fleet code của danh mục Đội bay — cần xác nhận; xem Câu hỏi AC-01)* |
| 7 | Status | Dropdown (đơn) | status | Bắt buộc chọn; chỉ cho phép chọn một giá trị. **Trường hợp Thêm mới:** mặc định để trống; placeholder "Select status". **Trường hợp Sửa:** dữ liệu fill sẵn theo API; nếu API trả về lỗi/rỗng thì để trống và hiển thị placeholder "Select status". Các lựa chọn: Active / Inactive. Action: out focus/click Save, hệ thống validate: nếu để trống hiển thị IM "The Status field must not be empty." |
| 8 | Note | Textbox | note | **Trường hợp Thêm mới:** mặc định để trống; placeholder "Enter note"; không bắt buộc. **Trường hợp Sửa:** dữ liệu fill sẵn theo API; nếu API trả về lỗi/rỗng thì để trống và hiển thị placeholder "Enter note". **Validate chung:** maxlength 1000 ký tự (chặn nếu nhập quá 1000; nếu paste thì ghi nhận 1000 ký tự đầu); cho phép nhập freetext; nếu nội dung vượt độ dài ô thì hiển thị "…" kèm tooltip; tự động TRIM khoảng trắng đầu/cuối khi out focus |
| 9 | Cancel | Button | | Click: đóng popup, điều hướng về màn hình trước đó; dữ liệu không được lưu vào DB |
| 10 | Save | Button | btn_save | Click: hệ thống validate toàn bộ trường bắt buộc. Nếu mã AC Subtype đã tồn tại trong DB: hiển thị thông báo trùng và giữ nguyên popup. Nếu dữ liệu hợp lệ: lưu thành công (insert hoặc update), hiển thị toast message TB019, đóng popup và reload danh sách. *(Nút Save được bổ sung để đầy đủ — bản gốc thiếu mô tả; xem Câu hỏi AC-04)* |

### 2.3. Xóa AC Subtype

| Tên chức năng | Xóa AC Subtype |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xóa một AC Subtype khỏi hệ thống |
| **Trigger** | Người dùng truy cập web FIMS, nhấn phân hệ Danh mục, chọn AC Subtype, nhấn icon Xóa |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền xóa AC Subtype |
| **Hậu điều kiện** | Xóa thành công, bản ghi bị xóa khỏi danh sách |

#### 2.3.1. Mô tả luồng xử lý

| Bước | Mô tả |
| :---- | :---- |
| 1 | Người dùng truy cập FIMS, chọn danh mục AC Subtype |
| 2 | Người dùng chọn chức năng Xóa trên một bản ghi |
| 3 | Hiển thị màn hình xác nhận xóa AC Subtype |
| 4 | Người dùng nhập lý do và nhấn Delete |
| 5 | Hệ thống kiểm tra ràng buộc và dữ liệu |
| 6 | Nếu có ràng buộc/lỗi: hiển thị toast báo lỗi. Nếu hợp lệ: cập nhật dữ liệu vào DB, hiển thị toast xóa thành công và cập nhật lại danh sách trên màn hình |

*(Cơ chế xóa cứng hay xóa mềm cần xác nhận và thống nhất với các module danh mục khác — xem Câu hỏi AC-05)*

#### 2.3.2. Mô tả chi tiết màn hình

| STT | Tên | Kiểu dữ liệu | Mô tả nghiệp vụ |
| :---: | ----- | ----- | ----- |
| 1 | Icon cảnh báo | Icon | Icon xác nhận; không cho thao tác |
| 2 | Icon X | Icon | Click: đóng popup xác nhận, hệ thống không xử lý gì, quay về màn hình trước đó |
| 3 | Tiêu đề popup | Text | "Delete AC Subtype" |
| 4 | Reason | Textarea | Bắt buộc nhập. Mặc định để trống; placeholder "Enter reason…". Maxlength 1000 ký tự (gồm chữ, số, ký tự đặc biệt); nếu paste > 1000 ký tự chỉ nhận 1000 ký tự đầu. Tự động TRIM khoảng trắng đầu/cuối. Action: nhấn Enter/out focus/click Lưu lại, hệ thống validate, nếu để trống hiển thị inline "Please enter reason" |
| 5 | Content | Text | "Are you sure you want to delete AC Subtype: [AC Subtype code] ?" |
| 6 | Nút Huỷ | Button | Click: đóng popup, không thực hiện xóa, quay về màn hình trước đó |
| 7 | Nút Xóa | Button | Click: hệ thống kiểm tra ràng buộc. Nếu có ràng buộc: hiển thị toast message TB022. Nếu không có ràng buộc: xóa thành công, hiển thị toast message TB019 và cập nhật lại danh sách |

---

## 3. Các nội dung cần làm rõ

Phần này tập hợp các điểm cần người phụ trách nghiệp vụ (SME) hoặc BA Lead xác nhận trước khi tài liệu được phê duyệt. Các nội dung này liên quan đến quyết định nghiệp vụ, không thuộc phạm vi tự quyết của bước đặc tả.

| Mã | Vị trí | Nội dung cần làm rõ |
| ----- | ----- | ----- |
| CB-01 | 1.1.2 — bộ lọc danh sách | Hai bộ lọc International và Domestic ở bản gốc loại trừ nhau, gây trùng lặp logic. Bản này đề xuất gộp thành một bộ lọc "Loại chặng bay". Cần xác nhận có chấp nhận thay đổi này không, hoặc giữ hai bộ lọc riêng |
| CB-02 | 1.2.2 — Arrival Airport | Bản gốc chưa có ràng buộc Sân bay đến phải khác Sân bay đi. Đề xuất bổ sung ràng buộc này; cần xác nhận và cung cấp nội dung thông báo lỗi mong muốn |
| CB-03 | 1.2.2 — cờ EDTO | Bản gốc định nghĩa cờ EDTO là "có sân bay dự bị". Định nghĩa này cần SME khai thác xác nhận lại theo chuẩn EDTO (Extended Diversion Time Operations) và chốt nhãn hiển thị |
| CB-04 | 1.2.2 — nút Save | Cần xác định khóa định danh dùng để kiểm tra trùng chặng bay: theo Flight Code, theo cặp Sân bay đi–đến, hay kết hợp |
| CB-05 | 1.3 — Xóa chặng bay | Cần thống nhất cơ chế xóa cứng hay xóa mềm; mô tả luồng và câu cảnh báo phải đồng bộ với quyết định này |
| CB-06 | 1.3 — Xóa chặng bay | Cần xác nhận có kiểm tra ràng buộc tham chiếu (chặng bay đang dùng trong lịch khai thác) trước khi xóa hay không, cùng thông báo tương ứng |
| CB-07 | 1.1 — phạm vi module | Phần mô tả mở đầu của bản gốc nêu thuộc tính "khoảng cách, múi giờ" và chức năng "Xem chi tiết, Xem lịch sử" nhưng form và danh sách chức năng không có. Cần xác nhận bổ sung các trường/chức năng này hay loại khỏi phạm vi |
| AC-01 | 2.2.2 — Aircraft Type | Cần làm rõ mô hình dữ liệu: AC Subtype gắn với Aircraft Type hay với Đội bay (Fleet); quan hệ là một–một hay một–nhiều; thống nhất nhãn trường, nguồn dữ liệu dropdown và cột hiển thị trên danh sách |
| AC-02 | 2.1.2 — Filter Aircraft Type | Bản gốc khai báo kiểu "multi-select" nhưng mô tả "chỉ chọn một giá trị". Cần xác nhận kiểu chọn đơn hay đa |
| AC-03 | 2.2.2 — AC Subtype name | Bản gốc ghi maxlength 10 ký tự cho tên, không nhất quán với độ dài 100 ở ô tìm kiếm. Bản này tạm đặt 100; cần xác nhận độ dài tối đa chính thức |
| AC-04 | 2.2.2 — nút Save | Bản gốc thiếu mô tả nút Save trong bảng chi tiết màn hình. Bản này đã bổ sung theo chuẩn; cần xác nhận nội dung |
| AC-05 | 2.3 — Xóa AC Subtype | Cần thống nhất cơ chế xóa cứng hay xóa mềm; đồng bộ với các module danh mục khác (ví dụ Đội bay có trạng thái Delete) |

---

*Tài liệu phiên bản 0.1 — bản nháp rà soát, chờ xác nhận các nội dung tại mục 3 trước khi phê duyệt và phát hành chính thức.*
