---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Team"
version: "0.2"
date: "2026-06-24"
status: "Review"
document_type: "SRS"
---

# II.1 — QUẢN LÝ TÀU BAY (Aircraft Catalog Management)

*Tài liệu này đặc tả chi tiết phân hệ Quản lý tàu bay thuộc nhóm Quản lý danh mục (PH4) của hệ thống TOSS. Đối tượng quản lý là **loại tàu bay (Aircraft Subtype)** mà Vietnam Airlines khai thác — ví dụ `A320NEO`, `B787-9` — bao gồm dữ liệu định danh, dữ liệu kỹ thuật, cấu hình khoang, bảng đơn vị/hệ số nhiên liệu ACARS, thuộc tính phân nhóm và lịch sử thay đổi. Nội dung được phân rã trung thực 100% từ: (1) mockup `Aircraft Catalog Management-v3.1-en.html`; (2) bộ quyết định nghiệp vụ đã chốt với BA Lead (Q1–Q4 — xem mục "Các quyết định nghiệp vụ đã chốt"). Các điểm nguồn chưa rõ được giữ nguyên và gom tại mục "Câu hỏi / Nội dung cần làm rõ" — không suy diễn.*

*Các sơ đồ luồng hệ thống được mô tả đầy đủ bằng bảng "Mô tả luồng xử lý" trong từng chức năng; bản vẽ sơ đồ gốc và screenshot màn hình được lưu kèm trong hồ sơ thiết kế và sẽ được người soạn chèn ở vị trí "Màn hình chức năng".*

*Ghi chú thuật ngữ: AC Subtype (Aircraft Subtype — Mã loại tàu bay), ACreg (Aircraft Registration — Số đăng ký tàu bay), ACARS (Aircraft Communications Addressing and Reporting System — hệ thống điện văn liên lạc tàu bay), ICAO (International Civil Aviation Organization — Tổ chức Hàng không Dân dụng Quốc tế), IATA (International Air Transport Association — Hiệp hội Vận tải Hàng không Quốc tế), MTOW (Maximum Takeoff Weight — Trọng lượng cất cánh tối đa), APU (Auxiliary Power Unit — Đơn vị nguồn phụ), Fleet (đội tàu bay phục vụ phân loại bảo dưỡng / tổ bay), UTC (Coordinated Universal Time — giờ phối hợp quốc tế), Audit log (nhật ký lưu vết).*

---

## Các quyết định nghiệp vụ đã chốt

| Mã | Nội dung quyết định | Tác động |
| :---: | :---- | :---- |
| **Q1** | **Chế độ chỉnh sửa: Section-level.** Mỗi cụm (section) trong màn hình chi tiết có nút `Edit` riêng; khi nhấn, chỉ các trường thuộc cụm đó mở khoá, các cụm còn lại vẫn ở chế độ xem. | Áp dụng cho cả 3 cụm: Thông tin chung, Cấu hình tàu (gồm Tham số kỹ thuật / Cấu hình khoang / ACARS Fuel), Thuộc tính nhóm. |
| **Q2** | **Aircraft Type Name KHÔNG khoá.** Trường `Aircraft Type Name` (Tên loại tàu bay) được phép chỉnh sửa. | Khi vào chế độ Edit của cụm Thông tin chung, trường này mở khoá; không hiển thị biểu tượng khoá. |
| **Q3** | **Cấu hình khoang: tối đa 3 cabin.** Chỉ ba khoang `A`, `B`, `C` được khai báo; không có Cabin D/E… | Nhập `0` cho khoang không tồn tại; phân hệ KHÔNG cho phép thêm khoang động. |
| **Q4** | **Validate ACARS Fuel: hiển thị Warning, KHÔNG reject.** Khi khoảng `From–To` của các bản ghi ACARS Fuel có khoảng trống (gap) hoặc chồng lấn (overlap), hệ thống hiển thị cảnh báo và **vẫn cho phép lưu**. | Người dùng có quyền bỏ qua cảnh báo và lưu; cảnh báo được ghi vào Audit log kèm cờ `acars_warning_acknowledged = true`. |

---

## Các quyết định bổ sung (CH-01 đến CH-10) — 24/06/2026

| Mã | Nội dung quyết định | Tác động |
| :---: | :---- | :---- |
| **CH-01** | **AC Subtype đồng bộ từ Ops++.** Hệ thống nguồn là Ops++ (Vietnam Airlines Ops system). Khi phát hiện AC Subtype mới/thay đổi từ Ops++, TOSS ghi nhận giá trị từ Ops++ — AC Subtype luôn read-only, không cho user chỉnh sửa. | Nếu user sửa cục bộ trong TOSS rồi Ops++ đồng bộ giá trị mới, giá trị từ Ops++ thắng (override). |
| **CH-02** | **Valid To cho phép ngày quá khứ.** Trường `Valid To` có thể set giá trị `< today`, để ghi nhận sự kiện tàu ngừng sử dụng hồi tố (ví dụ: retired hôm qua, hôm nay mới cập nhật). | Ràng buộc duy nhất: `Valid To ≥ Valid From`. Không bắt buộc `Valid To ≥ today`. |
| **CH-03** | **Weight cross-field validation: REJECT.** Ràng buộc: `Basic Weight ≤ Max Ramp Weight ≤ MTOW`. Nếu vi phạm → lỗi VL006, **chặn lưu**. | Không cho phép warning — vi phạm là lỗi bắt buộc sửa. |
| **CH-04** | **Ownership Status thay đổi: xoá Owner.** Khi chuyển từ `Owned` → `Wet/Dry Leased`, trường `Owner` (hiện = "Vietnam Airlines") bị xoá → user phải nhập tên chủ sở hữu thực tế. | Ngược lại, chuyển `Wet/Dry Leased` → `Owned` → auto-fill `Owner = "Vietnam Airlines"`. |
| **CH-05** | **Concurrent edit: Last-Write-Wins (LWW).** Khi 2 user sửa 1 section cùng lúc, không có locking. Thằng nào save sau cùng, dữ liệu đó ghi vào DB (dữ liệu user trước bị ghi đè). | Hệ thống không phát hiện/báo conflict. Audit log ghi cả 2 lần save. User cần quy ước tránh concurrent edit. |
| **CH-06** | **Cabin Config: check tổng cap.** Tổng `Cabin A + B + C` phải ≤ cap của loại tàu (ví dụ A320 ≤ 200 ghế). Nếu vượt → lỗi VL006. | Cap được định nghĩa per aircraft type trong bảng master data. |
| **CH-07** | **Audit log: lưu IP + User-Agent + thiết bị.** Mỗi bản ghi audit ghi thêm: `IP_Address`, `User_Agent` (browser/OS), `Device` (desktop/mobile). Bảng ACARS Fuel: ghi rõ thao tác `Add Row` / `Delete Row`. | Dữ liệu này không hiển thị trên UI, chỉ lưu trên DB (phục vụ compliance/forensic). |
| **CH-08** | **Edit quyền: per-section permission.** Nút `Edit` của từng section phụ thuộc quyền chi tiết: `Edit Aircraft > General Info`, `Edit Aircraft > Aircraft Config`, `Edit Aircraft > Group Attributes` (không có quyền chung `Edit Aircraft`). | User A có `Edit Aircraft > General Info` → thấy nút Edit ở cụm Thông tin chung; không thấy ở cụm Cấu hình tàu. |
| **CH-09** | **Soft delete: KHÔNG cho phép xóa tàu bay (nút Delete ẩn).** Bỏ nút `Delete` trên màn hình chi tiết. Lý do: tàu bay đồng bộ từ Ops++, xóa cục bộ gây xung đột reconciliation. | Để ngừng dùng tàu: dùng `Valid To` (set ngày kết thúc). Audit log không ghi Delete, chỉ ghi thay đổi `Valid To`. |
| **CH-10** | **Excel export: kèm Aircraft Type trong tên file.** Tên file: `TOSS_Aircraft_History_<AC_Subtype>_<ddmmyyyy>.xlsx` (ví dụ: `TOSS_Aircraft_History_A320NEO_24062026.xlsx`). | Giúp dễ phân biệt khi export audit log của nhiều tàu cùng ngày. |

---

## Phạm vi chức năng

| # | Chức năng | Trigger chính | Ghi chú |
| :---: | :---- | :---- | :---- |
| 1 | Danh sách loại tàu bay | Menu *Data Maintenance* → *Aircraft Fleet* | Filter + phân trang |
| 2 | Xem chi tiết loại tàu bay | Click 1 dòng tại danh sách | Gồm 4 tab |
| 3 | Sửa thông tin loại tàu bay | Click `Edit` tại 1 section | Section-level (Q1) |
| 4 | Xoá loại tàu bay | Click `Delete` tại chi tiết | Soft delete + bắt buộc nhập lý do |
| 5 | Xem lịch sử thay đổi | Tab 4 trên màn hình chi tiết | Read-only + Export Excel |

---

## 1. Danh sách loại tàu bay

| Tên chức năng | Danh sách loại tàu bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xem danh sách toàn bộ loại tàu bay đang được quản lý trong TOSS; hỗ trợ lọc theo `AC Subtype`, số đăng ký (`ACreg`), 5 cấp `Aircraft Category` và `Status` để định vị nhanh bản ghi cần thao tác |
| **Trigger** | Người dùng truy cập web TOSS → chọn module *Data Maintenance* trên thanh điều hướng → chọn mục *Aircraft Fleet* tại sidebar |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền `View Aircraft Catalog` (hoặc quyền cao hơn) |
| **Hậu điều kiện** | Màn hình danh sách hiển thị bảng kết quả; bộ lọc đang áp dụng được giữ trong phiên làm việc cho đến khi người dùng nhấn `Clear Filters` hoặc rời module |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng truy cập web TOSS, mở module *Data Maintenance* và chọn *Aircraft Fleet* tại sidebar |
| 2 | Hệ thống gọi API `GET /api/aircraft-types` (mặc định không filter, `page = 1`, `pageSize = 10`) để lấy danh sách loại tàu bay |
| 3 | Hệ thống hiển thị bảng kết quả với các cột: `No.` (STT), `Registration Count` (Số ACreg), `AC Subtype`, `Aircraft Type Name`, `Status`, `Actions` |
| 4 | (Tuỳ chọn) Người dùng nhập/chọn giá trị tại thanh bộ lọc (`AC Subtype`, `ACreg`, `Category 1–5`, `Status`) và nhấn `Search` (hoặc phím `Enter`) |
| 5 | Hệ thống reload dữ liệu theo bộ lọc, đặt lại phân trang về trang 1 và hiển thị kết quả |
| 6 | (Tuỳ chọn) Người dùng nhấn `Clear Filters` → hệ thống reset toàn bộ trường lọc về mặc định và reload danh sách không filter |
| 7 | (Tuỳ chọn) Người dùng click vào một bản ghi bất kỳ (cột `AC Subtype`, `Aircraft Type Name`, hoặc biểu tượng `Edit` tại `Actions`) → chuyển sang màn hình *Xem chi tiết loại tàu bay* (mục 2) |
| 8 | Trường hợp API rỗng: hiển thị bảng trống với thông báo `No aircraft types found matching your filters` |
| 9 | Trường hợp API lỗi/timeout: hiển thị toast `Error loading data. Please try again.` và giữ nguyên trạng thái màn hình trước đó |

### Màn hình chức năng

> [ẢNH: II.1-W1 — Aircraft Type List]

### Mô tả chi tiết màn hình

**Tìm kiếm/lọc:** Người dùng lọc theo `AC Subtype` (gần đúng), `ACreg` (số chính xác), `Category 1–5` (dropdown lấy từ master data, mặc định `All`), `Status` (`All` / `Active` / `Inactive`). Khi nhấn `Search`, hệ thống reload bảng theo bộ lọc và đặt lại phân trang về trang 1. **Phân trang:** mặc định 10 dòng/trang; người dùng có thể đổi sang 20 / 50 / 100. **Thông báo lỗi:** lỗi cấp trường hiển thị inline; lỗi hệ thống hiển thị toast. **Phân quyền:** nếu không có quyền `View Aircraft Catalog`, mục menu *Aircraft Fleet* được ẩn và truy cập trực tiếp URL bị redirect về trang `Access Denied`.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | AC Subtype | Textbox | `filter.ac_subtype` | Lọc gần đúng theo mã loại tàu bay. Maxlength 20. Placeholder `e.g., A320NEO` |
| 2 | AC Registration (ACreg) | Textbox | `filter.registration_count` | Lọc theo số đăng ký (số ACreg). Tìm kiếm số chính xác. Maxlength 5. Placeholder `e.g., 12`. Nếu nhập ký tự không phải số → hiển thị lỗi inline `VL006 — Invalid format` |
| 3 | Aircraft Category 1 | Dropdown | `filter.category_1` | Lọc theo phân loại cấp 1 (ví dụ `A320NEO`, `A321 CEO`). Giá trị từ master data. Mặc định `All` |
| 4 | Aircraft Category 2 | Dropdown | `filter.category_2` | Lọc theo phân loại cấp 2. Giá trị từ master data. Mặc định `All` |
| 5 | Aircraft Category 3 | Dropdown | `filter.category_3` | Lọc theo phân loại cấp 3. Giá trị từ master data. Mặc định `All` |
| 6 | Aircraft Category 4 | Dropdown | `filter.category_4` | Lọc theo phân loại cấp 4. Giá trị từ master data. Mặc định `All` |
| 7 | Aircraft Category 5 | Dropdown | `filter.category_5` | Lọc theo phân loại cấp 5 (ví dụ `320`, `32N`). Giá trị từ master data. Mặc định `All` |
| 8 | Status | Dropdown | `filter.is_active` | Lọc theo trạng thái. Giá trị: `All` / `Active` / `Inactive`. Mặc định `All` |
| 9 | Nút Search | Button | | Click: gửi request lọc; hiển thị toast tạm `Applying filters…`; reload bảng và đặt phân trang về trang 1 |
| 10 | Nút Clear Filters | Button | | Click: reset toàn bộ trường lọc về mặc định, reload danh sách không filter |
| 11 | No. | Textview | — | STT tăng dần theo dòng trong trang hiện tại |
| 12 | Registration Count | Textview | `registration_count` | Số lượng tàu bay (ACreg) đã đăng ký thuộc loại tàu bay này. Rỗng/lỗi: hiển thị `N/A` |
| 13 | AC Subtype | Textview (link) | `ac_subtype` | Mã loại tàu bay; in đậm, có thể click để mở màn hình chi tiết (mục 2). Rỗng/lỗi: `N/A` |
| 14 | Aircraft Type Name | Textview (link) | `aircraft_type_name` | Tên loại tàu bay; hiển thị màu xanh dương, click để mở màn hình chi tiết. Rỗng/lỗi: `N/A` |
| 15 | Status | Tag | `is_active` | `Active` → tag xanh `Active`; `Inactive` → tag xám `Inactive` |
| 16 | Actions | IconButton | — | Biểu tượng `Edit` — click: mở màn hình chi tiết (mục 2) ở chế độ xem |
| 17 | Records per page | Dropdown | — | Tuỳ chọn số bản ghi/trang. Mặc định 10. Lựa chọn: 10 / 20 / 50 / 100 |
| 18 | Pagination controls | Pagination | — | Các nút `First` / `Previous` / số trang / `Next` / `Last`. Nút tương ứng bị vô hiệu khi đang ở đầu/cuối danh sách |
| 19 | Total count | Textview | — | Hiển thị tổng số bản ghi theo bộ lọc đang áp dụng, dạng `Total: X records` |

### Tình huống lỗi

| Mã | Tình huống | Thông báo |
| :---: | :---- | :---- |
| VL006 | Nhập ký tự không phải số vào ô `ACreg` | Inline `Invalid format` |
| TB022 | API trả về rỗng theo bộ lọc | Bảng trống + thông báo `No aircraft types found matching your filters` |
| TB020 | API lỗi/timeout | Toast `Error loading data. Please try again.` |
| AUTH-403 | Không có quyền `View Aircraft Catalog` | Ẩn menu *Aircraft Fleet*; truy cập URL trực tiếp → trang `Access Denied` |

---

## 2. Xem chi tiết loại tàu bay

| Tên chức năng | Xem chi tiết loại tàu bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xem đầy đủ thông tin của một loại tàu bay, được tổ chức trong 4 tab: *Thông tin chung* — *Cấu hình tàu* — *Thuộc tính nhóm* — *Lịch sử thay đổi*; đồng thời là điểm vào cho thao tác sửa (mục 3) và xoá (mục 4) |
| **Trigger** | (a) Từ danh sách (mục 1) → click vào một bản ghi; hoặc (b) truy cập URL trực tiếp `/aircraft-types/{id}` |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền `View Aircraft Catalog`; bản ghi loại tàu bay với `id` truyền vào tồn tại trong hệ thống và chưa bị soft-delete |
| **Hậu điều kiện** | Hiển thị màn hình chi tiết với tab 1 (*Thông tin chung*) là mặc định; dữ liệu 4 tab được load theo nguyên tắc lazy (gọi API riêng khi mở từng tab) |

### Mô tả luồng xử lý (chung cho 4 tab)

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng truy cập màn hình chi tiết (qua danh sách hoặc URL trực tiếp) |
| 2 | Hệ thống call API `GET /api/aircraft-types/{id}` để lấy dữ liệu chung (header) và dữ liệu tab 1 (*Thông tin chung*) |
| 3 | Hiển thị header (`AC Subtype` + `Aircraft Type Name`) và 4 tab; tab 1 active mặc định |
| 4 | Người dùng chuyển sang tab khác → hệ thống call API tương ứng (`/configuration`, `/group-attributes`, `/audit-log`) và hiển thị nội dung |
| 5 | Trường hợp `id` không tồn tại hoặc bản ghi đã bị xoá: hiển thị trang lỗi `Aircraft type not found` và nút `Back to list` |
| 6 | Trường hợp API lỗi/timeout: hiển thị toast `Error loading data. Please try again.` và giữ tab hiện tại trống |
| 7 | (Tuỳ chọn) Người dùng click `Edit` ở một section → chuyển section đó sang chế độ chỉnh sửa (mục 3) |
| 8 | (Tuỳ chọn) Người dùng click `Delete` ở header → mở popup xác nhận xoá (mục 4) |

### Màn hình chức năng

> [ẢNH: II.1-W2 — Aircraft Detail · 4 Tabs]

---

### 2.1. Tab 1 — Thông tin chung (General Information)

**Mục đích:** Hiển thị thông tin định danh và pháp lý của loại tàu bay: `AC Subtype`, `Aircraft Type Name`, khoảng hiệu lực, mã `ICAO`/`IATA`, trạng thái sở hữu, chủ sở hữu, trạng thái sử dụng.

**Bố cục:** Layout 2 cột, 9 trường + cụm nút `Edit` (chế độ xem) hoặc `Save` / `Cancel` (chế độ sửa).

**Ghi chú khoá:** Hai trường `AC Subtype` và `Valid From` luôn ở trạng thái chỉ đọc (đồng bộ từ hệ thống nguồn) và có biểu tượng khoá. `Aircraft Type Name` KHÔNG khoá (Q2).

| STT | Tên | Loại control | Mapping DB/API | Khoá? | Mô tả |
| :----: | ----- | ----- | ----- | :---: | ----- |
| 1 | AC Subtype | Textview | `ac_subtype` | Có | Mã loại tàu bay (ví dụ `A320NEO`). Hiển thị kèm biểu tượng khoá. Đồng bộ từ hệ thống nguồn |
| 2 | Aircraft Type Name | Textview (xem) / Textbox (sửa) | `aircraft_type_name` | Không (Q2) | Tên loại tàu bay (ví dụ `Airbus A320 NEO`). Maxlength 100. **Bắt buộc** khi lưu (không được để trống) |
| 3 | Valid From | Textview (date) | `valid_from` | Có | Ngày bắt đầu hiệu lực, format `dd/mm/yyyy`. Đồng bộ từ hệ thống nguồn |
| 4 | Valid To | Textview (xem) / DateInput (sửa) | `valid_to` | Không | Ngày kết thúc hiệu lực, format `dd/mm/yyyy`. Khi sửa phải `≥ Valid From` (xem CH-02 cho ràng buộc `≥ today`) |
| 5 | ICAO Code | Textview / Textbox | `icao_code` | Không | Mã ICAO (ví dụ `A20N`). Maxlength 4. Validate: 3–4 ký tự, gồm chữ in hoa và số. Phải duy nhất trong hệ thống (VL007 nếu trùng) |
| 6 | IATA Code | Textview / Textbox | `iata_code` | Không | Mã IATA (ví dụ `32N`). Maxlength 3. Validate: 2–3 ký tự, gồm chữ in hoa và số. Phải duy nhất (VL007 nếu trùng) |
| 7 | Ownership Status | Textview / Dropdown | `ownership_status` | Không | Giá trị: `Owned` / `Wet Leased` / `Dry Leased`. Khi đổi giá trị → ảnh hưởng logic trường `Owner` (STT 8) |
| 8 | Owner | Textview / Textbox | `owner` | Không | Tên chủ sở hữu. Maxlength 50. **Logic phụ thuộc `Ownership Status`:** nếu `Owned` → tự động điền `Vietnam Airlines` và disabled; nếu `Wet Leased` / `Dry Leased` → người dùng nhập tên chủ sở hữu thực tế (bắt buộc) |
| 9 | Status | Textview / Dropdown | `is_active` | Không | Giá trị: `Active` / `Inactive`. Mặc định `Active` |
| 10 | Nút Edit | Button | — | — | Chỉ hiển thị ở chế độ xem và khi người dùng có quyền `Edit Aircraft`. Click → chuyển section 2.1 sang chế độ sửa (mục 3) |
| 11 | Nút Save | Button | — | — | Chỉ hiển thị ở chế độ sửa. Click → validate + gọi API `PUT /api/aircraft-types/{id}` (xem mục 3) |
| 12 | Nút Cancel | Button | — | — | Chỉ hiển thị ở chế độ sửa. Click → rollback thay đổi cục bộ và quay lại chế độ xem |

---

### 2.2. Tab 2 — Cấu hình tàu (Aircraft Configuration)

**Mục đích:** Quản lý ba cụm cấu hình kỹ thuật: (a) tham số kỹ thuật của tàu bay, (b) cấu hình khoang (cabin), (c) bảng đơn vị/hệ số nhiên liệu ACARS theo khoảng thời gian.

**Bố cục:** 3 subsection độc lập, mỗi subsection có nút `Edit` riêng theo nguyên tắc section-level (Q1).

#### 2.2.1. Tham số kỹ thuật (Aircraft Parameters)

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Taxi Fuel Flow | NumberInput | `taxi_fuel_flow` | Mức tiêu thụ nhiên liệu khi di chuyển trên mặt đất, đơn vị `kg/h`. Maxlength 10. Validate: số `≥ 0`. Ví dụ `1500` |
| 2 | APU Fuel Flow | NumberInput | `apu_fuel_flow` | Mức tiêu thụ của đơn vị APU, đơn vị `kg/h`. Maxlength 10. Validate: số `≥ 0`. Ví dụ `200` |
| 3 | Fuel Tank Capacity | NumberInput | `fuel_tank_capacity` | Dung tích bình chứa nhiên liệu, đơn vị `kg`. Validate: số `> 0`. Ví dụ `27200` |
| 4 | Water Tank Capacity | NumberInput | `water_tank_capacity` | Dung tích bình nước sạch, đơn vị `lít`. Validate: số `≥ 0`. Ví dụ `200`. *(Tham chiếu chéo: dùng làm hệ số quy đổi % ↔ lít trong phân hệ Quản lý nước sạch — SRS-MO-Water-Web YC25.)* |
| 5 | Cargo Capacity | NumberInput | `cargo_capacity` | Sức chứa hành lý/cargo, đơn vị `kg`. Validate: số `≥ 0`. Ví dụ `6000` |
| 6 | Basic Weight | NumberInput | `basic_weight` | Trọng lượng cơ bản của tàu bay, đơn vị `kg`. Validate: số `> 0`. Ví dụ `41413` |
| 7 | Max Ramp Weight | NumberInput | `max_ramp_weight` | Trọng lượng tối đa khi chuẩn bị cất cánh, đơn vị `kg`. Validate: số `> 0` và `≥ Basic Weight`. Ví dụ `75500` |
| 8 | MTOW | NumberInput | `mtow` | Trọng lượng cất cánh tối đa, đơn vị `kg`. Validate: số `> 0` và `≤ Max Ramp Weight`. Ví dụ `79000` |
| 9 | Nút Edit / Save / Cancel | Button | — | Section-level theo Q1. Cụm Save/Cancel chỉ hiện ở chế độ sửa |

#### 2.2.2. Cấu hình khoang tàu (Cabin Configuration)

*Phạm vi: tối đa 3 khoang `A`, `B`, `C` (Q3). Nhập `0` cho khoang không tồn tại trên loại tàu bay này; KHÔNG hỗ trợ thêm khoang động.*

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Cabin A | NumberInput | `cabin_a` | Số ghế/vị trí trong Cabin A. Validate: số nguyên `0–999`. Ví dụ `8`. Giá trị `0` = khoang không tồn tại |
| 2 | Cabin B | NumberInput | `cabin_b` | Số ghế trong Cabin B. Validate: số nguyên `0–999`. Ví dụ `24`. Giá trị `0` = khoang không tồn tại |
| 3 | Cabin C | NumberInput | `cabin_c` | Số ghế trong Cabin C. Validate: số nguyên `0–999`. Ví dụ `120`. Giá trị `0` = khoang không tồn tại |
| 4 | Ghi chú | Textview | — | Hiển thị tĩnh: `Configure max 3 cabins. Enter 0 for cabins that don't exist on this aircraft type.` |
| 5 | Nút Edit / Save / Cancel | Button | — | Section-level theo Q1 |

#### 2.2.3. ACARS Fuel Unit & Fuel Multiplier (bảng)

**Mục đích:** Khai báo các cặp `From–To` đã hiệu lực cho `Fuel Unit` và `Fuel Multiplier` phục vụ tính toán nhiên liệu trong hệ thống ACARS.

**Quy tắc validate (Q4 — Warning, không reject):** Các khoảng `From–To` phải nối tiếp nhau, không có khoảng trống (gap) và không chồng lấn (overlap). Nếu vi phạm → hệ thống hiển thị toast cảnh báo `⚠ Warning: Date ranges have gaps or overlaps. Review before saving.` và **vẫn cho phép lưu**; cờ `acars_warning_acknowledged = true` được ghi vào Audit log.

**Hành vi ở chế độ sửa:** Nút `+ Add Row` chỉ hiển thị ở chế độ sửa; biểu tượng `Delete` (thùng rác) trên từng dòng chỉ kích hoạt ở chế độ sửa.

| STT | Tên cột | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | From | DateTimeInput | `acars_fuel_from` | Ngày-giờ bắt đầu hiệu lực, format `dd/mm/yyyy HH:MM`. Ví dụ `01/01/2026 00:00`. **Bắt buộc** |
| 2 | To | DateTimeInput | `acars_fuel_to` | Ngày-giờ kết thúc hiệu lực, format `dd/mm/yyyy HH:MM`. Ví dụ `30/06/2026 23:59`. **Bắt buộc**. Phải `> From` (VL006 nếu vi phạm) |
| 3 | Fuel Unit | NumberInput (step 0.01) | `acars_fuel_unit` | Giá trị đơn vị nhiên liệu. **Bắt buộc**. Validate: số `> 0`. Ví dụ `1500.00` |
| 4 | Fuel Multiplier | NumberInput (step 0.001) | `acars_fuel_multiplier` | Hệ số nhân. **Bắt buộc**. Validate: số `> 0`. Ví dụ `1.050` |
| 5 | Actions | IconButton | — | Biểu tượng `Delete` (thùng rác); chỉ kích hoạt ở chế độ sửa; click → xoá dòng khỏi bảng (chưa ghi DB cho đến khi `Save`) |
| 6 | Nút + Add Row | Button | — | Chỉ hiển thị ở chế độ sửa. Click → thêm một dòng trống mới ở cuối bảng |
| 7 | Nút Edit / Save / Cancel | Button | — | Section-level theo Q1. `Save` thực hiện validate Q4 và (nếu cảnh báo) hiển thị toast trước khi gọi API |

**Ví dụ dữ liệu hợp lệ:**

| From | To | Fuel Unit | Fuel Multiplier |
| :---- | :---- | :---: | :---: |
| 01/01/2026 00:00 | 30/06/2026 23:59 | 1500 | 1.050 |
| 01/07/2026 00:00 | 31/12/2026 23:59 | 1550 | 1.060 |

---

### 2.3. Tab 3 — Thuộc tính nhóm (Group Attributes)

**Mục đích:** Phân loại loại tàu bay theo 5 cấp `Aircraft Category` và `Aircraft Fleet` để hỗ trợ lập lịch bay, phân công tổ bay và lập kế hoạch bảo dưỡng. Chỉnh sửa khi cấu hình tàu bay thay đổi hoặc khi cần gán vào hạng mục mới.

**Bố cục:** 6 dropdown, mỗi dropdown lấy danh sách giá trị từ master data tương ứng.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Aircraft Category 1 | Dropdown | `category_1` | Phân loại cấp 1 (ví dụ `A320NEO`, `A321 CEO`). Giá trị lấy từ master data |
| 2 | Aircraft Category 2 | Dropdown | `category_2` | Phân loại cấp 2 (ví dụ `A320`, `A321 CEO`). Giá trị lấy từ master data |
| 3 | Aircraft Category 3 | Dropdown | `category_3` | Phân loại cấp 3 (ví dụ `A320-A321`, `A350`). Giá trị lấy từ master data |
| 4 | Aircraft Category 4 | Dropdown | `category_4` | Phân loại cấp 4 (ví dụ `A320-A321`, `A350-B787`). Giá trị lấy từ master data |
| 5 | Aircraft Category 5 | Dropdown | `category_5` | Phân loại cấp 5 (ví dụ `320`, `32N`, `350`). Giá trị lấy từ master data |
| 6 | Aircraft Fleet | Dropdown | `aircraft_fleet` | Phân loại Fleet phục vụ quản lý bảo dưỡng và tổ bay. Giá trị: `A320` / `A321` / `A350` / `B787` / `ATR` |
| 7 | Nút Edit / Save / Cancel | Button | — | Section-level theo Q1 |

---

### 2.4. Tab 4 — Lịch sử thay đổi (Audit Log) — chỉ đọc

**Mục đích:** Ghi nhận toàn bộ thay đổi trên loại tàu bay phục vụ audit trail và compliance.

**Bố cục:** Thanh bộ lọc + bảng kết quả + nút xuất Excel. Không có thao tác chỉnh sửa.

#### 2.4.1. Thanh bộ lọc

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Date From | DateInput | `filter.date_from` | Lọc từ ngày, format `dd/mm/yyyy`. Mặc định trống |
| 2 | Date To | DateInput | `filter.date_to` | Lọc đến ngày, format `dd/mm/yyyy`. Mặc định trống. Validate: `≥ Date From` |
| 3 | Changed By | Dropdown | `filter.changed_by` | Lọc theo người thực hiện. Giá trị: `All` / danh sách user đã thao tác trên bản ghi (ví dụ `data_officer`, `admin`, `sys_sync`) |
| 4 | Changed Field | Dropdown | `filter.changed_field` | Lọc theo trường thay đổi. Giá trị: `All` / `AC Subtype` / `ICAO Code` / `IATA Code` / `Cabin Config` / `ACARS Fuel Unit` / … (danh sách động theo các trường đã từng thay đổi) |
| 5 | Nút Search | Button | — | Click: reload bảng audit log theo bộ lọc |
| 6 | Nút Download Excel | Button | — | Click: xuất audit log theo đúng bộ lọc đang áp dụng ra file `.xlsx`. Tên file: `TOSS_Aircraft_History_<ddmmyyyy>.xlsx` |

#### 2.4.2. Bảng kết quả

| STT | Tên cột | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Date/Time | Textview | `changed_at_utc` | Thời điểm thay đổi, format `dd/mm/yyyy HH:MM:SS`, hiển thị theo giờ UTC |
| 2 | Changed By | Textview | `changed_by` | Tên/ID người thực hiện thay đổi (ví dụ `data_officer`) |
| 3 | Tab | Badge | `tab_name` | Nhóm/tab nơi thay đổi xảy ra (`General Information` / `Aircraft Configuration` / `Group Attributes`) |
| 4 | Field | Badge | `field_name` | Tên trường thay đổi (ví dụ `ICAO Code`, `Cabin Config`, `ACARS Fuel Unit`) |
| 5 | Old Value | Textview | `old_value` | Giá trị cũ. Rỗng (trường hợp tạo mới): hiển thị `—` |
| 6 | New Value | Textview | `new_value` | Giá trị mới. Rỗng (trường hợp xoá): hiển thị `—` |
| 7 | Notes | Textview | `notes` | Ghi chú của người thực hiện (nếu có); riêng đối với hành động xoá → ghi nhận `Reason` từ popup xoá (mục 4) |
| 8 | Phân trang | Pagination | — | Khi số bản ghi `> 10`: phân trang theo kịch bản dùng chung |

**Ví dụ bản ghi audit:**

```
Date/Time:    23/06/2026 10:30:45
Changed By:   data_officer
Tab:          General Information
Field:        ICAO Code
Old Value:    A20N
New Value:    A20M
Notes:        (trống)
```

---

## 3. Sửa thông tin loại tàu bay (Section-level Edit)

| Tên chức năng | Sửa thông tin loại tàu bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng chỉnh sửa thông tin loại tàu bay theo từng cụm (section-level — Q1); chỉ các trường trong section được mở khoá, các trường thuộc section khác vẫn ở chế độ xem; tăng tính kiểm soát thay đổi và giảm rủi ro thao tác nhầm |
| **Trigger** | Người dùng nhấn nút `Edit` ở bất kỳ section nào: *Thông tin chung* (2.1), *Tham số kỹ thuật* (2.2.1), *Cấu hình khoang* (2.2.2), *ACARS Fuel* (2.2.3), hoặc *Thuộc tính nhóm* (2.3) |
| **Tiền điều kiện** | Người dùng đã đăng nhập, được phân quyền `Edit Aircraft`; bản ghi loại tàu bay tồn tại và chưa bị soft-delete; tại thời điểm thao tác không có người dùng khác đang sửa cùng section (xem CH-05 về cơ chế khoá đồng thời) |
| **Hậu điều kiện** | Dữ liệu mới được lưu vào DB; một bản ghi Audit log (per-field changes) được tạo cho mỗi trường thay đổi; toast thông báo kết quả được hiển thị; màn hình quay về chế độ xem với dữ liệu mới |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng nhấn `Edit` tại một section bất kỳ trên màn hình chi tiết |
| 2 | Hệ thống mở chế độ sửa cho section đó: toàn bộ trường trong section trở nên editable (trừ các trường khoá `AC Subtype`, `Valid From` ở section 2.1); các section còn lại vẫn ở chế độ xem |
| 3 | Hệ thống hiển thị action bar ở đáy panel section (nền vàng nhạt) với nhãn `✎ Editing: <Section Name>` và hai nút `Save` / `Cancel`; các section khác đồng thời ẩn nút `Edit` cho đến khi section đang sửa hoàn thành |
| 4 | Người dùng thay đổi giá trị các trường (ví dụ đổi `ICAO Code` từ `A20N` → `A20M`); với section ACARS Fuel có thể thêm dòng bằng `+ Add Row` hoặc xoá dòng bằng biểu tượng thùng rác |
| 5 | Người dùng nhấn `Save` → hệ thống thực hiện validate cấp client: bắt buộc, định dạng, độ dài, giới hạn số (xem bảng "Quy tắc validate theo trường") |
| 6 | Nếu fail validate → hiển thị thông báo lỗi inline trên các trường vi phạm và toast `Please fix the errors before saving`; giữ chế độ sửa |
| 7 | Nếu là section ACARS Fuel và phát hiện gap/overlap → hiển thị toast cảnh báo Q4 `⚠ Warning: Date ranges have gaps or overlaps. Review before saving.`; vẫn cho phép người dùng nhấn `Save` lần nữa để xác nhận lưu |
| 8 | Nếu pass validate → gọi API `PUT /api/aircraft-types/{id}` với payload chỉ chứa các trường thuộc section đang sửa; backend phát hiện thay đổi theo từng trường và tạo bản ghi Audit log tương ứng |
| 9 | Nếu API trả `200 OK` → hiển thị toast `✅ Changes saved successfully`; đóng chế độ sửa của section; reload dữ liệu section vừa lưu để hiển thị giá trị mới |
| 10 | Nếu API trả lỗi (4xx/5xx) → hiển thị toast `❌ Error: <message>`; giữ chế độ sửa để người dùng điều chỉnh và thử lại |
| 11 | Người dùng nhấn `Cancel` → hệ thống rollback toàn bộ thay đổi cục bộ trong section, đóng chế độ sửa và hiển thị lại giá trị trước khi sửa |

### Màn hình chức năng

> [ẢNH: II.1-W3 — Section Edit Mode (yellow action bar)]

### Quy tắc khoá theo trường

| Trường | Khoá ở chế độ Edit? | Ghi chú |
| :---- | :---: | :---- |
| AC Subtype | ✅ Có | Đồng bộ từ hệ thống nguồn; biểu tượng khoá luôn hiển thị |
| Aircraft Type Name | ❌ Không (Q2) | Bắt buộc khi lưu |
| Valid From | ✅ Có | Đồng bộ từ hệ thống nguồn |
| Valid To | ❌ Không | Phải `≥ Valid From` (xem CH-02) |
| ICAO Code | ❌ Không | 3–4 ký tự in hoa + số; phải duy nhất (VL007 nếu trùng) |
| IATA Code | ❌ Không | 2–3 ký tự in hoa + số; phải duy nhất (VL007 nếu trùng) |
| Ownership Status | ❌ Không | Dropdown `Owned` / `Wet Leased` / `Dry Leased` |
| Owner | ❌ Không (auto-fill nếu `Owned`) | Khi `Ownership = Owned` → auto-fill `Vietnam Airlines` và disabled; khi `Wet/Dry Leased` → bắt buộc nhập |
| Status | ❌ Không | Dropdown `Active` / `Inactive` |
| Tham số kỹ thuật (8 trường) | ❌ Không | Validate số `≥ 0` hoặc `> 0` theo trường; ràng buộc `Basic Weight ≤ Max Ramp Weight ≤ MTOW` không bị tính bằng MTOW (xem CH-03) |
| Cabin A / B / C | ❌ Không | Số nguyên `0–999`; tối đa 3 khoang (Q3) |
| Bảng ACARS Fuel | ❌ Không | Thêm/xoá dòng; warning gap/overlap (Q4) |
| Categories 1–5 | ❌ Không | Dropdown từ master data |
| Aircraft Fleet | ❌ Không | Dropdown `A320` / `A321` / `A350` / `B787` / `ATR` |

### Tình huống lỗi

| Mã | Tình huống | Thông báo |
| :---: | :---- | :---- |
| VL004 | Trường bắt buộc bị bỏ trống (ví dụ `Aircraft Type Name`, ô bắt buộc trong bảng ACARS) | Inline `This field is required` |
| VL006 | Sai định dạng (ICAO/IATA không phải chữ in hoa + số; ô số nhận ký tự lạ; `To` không lớn hơn `From`) | Inline `Invalid format` |
| VL007 | Trùng giá trị `ICAO Code` hoặc `IATA Code` với loại tàu bay khác | Inline `This value already exists` |
| Q4-WARNING | Khoảng `From–To` trong bảng ACARS Fuel có gap/overlap | Toast `⚠ Warning: Date ranges have gaps or overlaps. Review before saving.` — không chặn lưu |
| TB019 | Lưu thành công | Toast `✅ Changes saved successfully` |
| TB020 | API trả lỗi đã biết | Toast `❌ Error: <message>` |
| TB021 | Lỗi không xác định | Toast `❌ An unexpected error occurred` |

---

## 4. Xoá loại tàu bay

| Tên chức năng | Xoá loại tàu bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xoá mềm (soft delete) một loại tàu bay không còn sử dụng; yêu cầu nhập lý do xoá để phục vụ audit trail |
| **Trigger** | Người dùng nhấn nút `Delete` ở header của màn hình chi tiết (mục 2) |
| **Tiền điều kiện** | Người dùng đã đăng nhập và được phân quyền `Delete Aircraft`; loại tàu bay không đang được sử dụng trong các chuyến bay đang hoạt động (active flight schedule — kiểm tra ở backend, mã `VL999`) |
| **Hậu điều kiện** | Bản ghi được set `is_deleted = true` (không xoá vật lý); một bản ghi Audit log được tạo với `Field = 'Record'`, `Old Value = 'Active'`, `New Value = 'Deleted'`, `Notes = <lý do người dùng nhập>`; bản ghi không còn xuất hiện ở danh sách chính (mục 1); người dùng được chuyển về danh sách |

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng nhấn `Delete` ở header của màn hình chi tiết |
| 2 | Hệ thống mở popup xác nhận xoá với tiêu đề `Delete Aircraft` và mô tả `Are you sure you want to delete <Aircraft Type Name> (<AC Subtype>)? This action cannot be undone.` |
| 3 | Người dùng nhập lý do xoá vào ô `Reason` (bắt buộc, maxlength 1000) — ví dụ `Aircraft retired from fleet` |
| 4 | Người dùng nhấn `Delete` trong popup → hệ thống validate: `Reason` không được rỗng (VL004) |
| 5 | Hệ thống gọi API `DELETE /api/aircraft-types/{id}?reason=<reason>`; backend kiểm tra nghiệp vụ: loại tàu bay không thuộc bất kỳ chuyến bay đang hoạt động nào (mã `VL999`) |
| 6 | Nếu vi phạm `VL999` → API trả lỗi → hiển thị toast `❌ Cannot delete: Aircraft is used in active flight schedules`; giữ popup để người dùng có thể đóng |
| 7 | Nếu pass → backend set `is_deleted = true`, ghi Audit log; API trả `200 OK` |
| 8 | Hệ thống hiển thị toast `✅ Aircraft deleted successfully`, đóng popup và redirect về màn hình danh sách (mục 1) |
| 9 | Người dùng nhấn `Cancel` → đóng popup, không có thay đổi nào được thực hiện |

### Màn hình chức năng

> [ẢNH: II.1-W4 — Delete Confirmation Popup]

### Mô tả chi tiết màn hình (popup)

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Title | Textview | — | Tiêu đề tĩnh `Delete Aircraft` |
| 2 | Subtitle | Textview | — | Mô tả động: `Are you sure you want to delete <Aircraft Type Name> (<AC Subtype>)? This action cannot be undone.` |
| 3 | Reason | Textarea | `delete_reason` | **Bắt buộc**. Maxlength 1000. Placeholder `e.g., Aircraft retired from fleet`. Tự động trim khoảng trắng đầu/cuối. Nếu để trống khi nhấn `Delete` → hiển thị thông báo inline `Reason is required` (TB023) |
| 4 | Nút Cancel | Button | — | Click: đóng popup, không gọi API |
| 5 | Nút Delete | Button | — | Click: validate (VL004) → gọi API `DELETE /api/aircraft-types/{id}?reason=…`. Trong khi chờ phản hồi: disabled và hiển thị spinner |

### Tình huống lỗi

| Mã | Tình huống | Thông báo |
| :---: | :---- | :---- |
| VL004 / TB023 | Người dùng nhấn `Delete` khi chưa nhập `Reason` | Inline `Reason is required` |
| VL999 | Loại tàu bay đang được sử dụng trong active flight schedule | Toast `❌ Cannot delete: Aircraft is used in active flight schedules`, giữ popup |
| TB020 | API lỗi khác | Toast `❌ Error: <message>`, giữ popup |
| TB019 | Xoá thành công | Toast `✅ Aircraft deleted successfully`, đóng popup, redirect về danh sách |

---

## 5. Xem lịch sử thay đổi (Audit Log)

*Đặc tả màn hình và bộ lọc đã được trình bày tại mục **2.4 — Tab 4: Lịch sử thay đổi**. Mục này gom thêm các quy tắc nghiệp vụ chung của Audit log.*

| Tên chức năng | Xem lịch sử thay đổi loại tàu bay |
| :---- | :---- |
| **Mục đích** | Cung cấp giao diện chỉ đọc cho phép tra cứu lịch sử thay đổi của một loại tàu bay (ai, khi nào, trường nào, giá trị cũ/mới, ghi chú); phục vụ audit trail và compliance |
| **Trigger** | Người dùng mở màn hình chi tiết (mục 2) và chọn Tab 4 `Lịch sử thay đổi` |
| **Tiền điều kiện** | Người dùng đã đăng nhập và có quyền `View Aircraft Catalog`; bản ghi loại tàu bay tồn tại (chấp nhận cả bản ghi đã soft-delete để xem lịch sử) |
| **Hậu điều kiện** | Hiển thị bảng lịch sử thay đổi theo bộ lọc; hỗ trợ xuất Excel theo bộ lọc đang áp dụng |

### Quy tắc nghiệp vụ chung

| # | Quy tắc | Ghi chú |
| :---: | :---- | :---- |
| 1 | Audit log được tạo tự động bởi backend mỗi khi có thao tác `Edit` (mục 3) hoặc `Delete` (mục 4) thành công | Granularity: per-field — nếu một thao tác `Save` cập nhật 3 trường thì sinh 3 bản ghi audit |
| 2 | Mọi thời gian hiển thị theo giờ UTC | Thống nhất với các phân hệ khác trong TOSS (ví dụ MO Water Web) |
| 3 | Trường `Notes` của audit lưu lý do (đối với hành động xoá) hoặc ghi chú do người dùng nhập (đối với một số phân hệ có ô Reason ở chế độ sửa) | Hiện tại màn hình *Sửa* (mục 3) không có ô Reason; ô Notes chỉ điền cho hành động xoá |
| 4 | Trường hợp cảnh báo Q4 (ACARS Fuel gap/overlap) bị người dùng bỏ qua và lưu → audit log ghi cờ `acars_warning_acknowledged = true` ở `Notes` | Phục vụ truy xuất các tình huống lưu có cảnh báo |
| 5 | Audit log không cho phép sửa/xoá bằng UI; chỉ admin DB có quyền can thiệp ở tầng dữ liệu (ngoài phạm vi TOSS) | — |

---

## 6. Bảng tổng hợp Khoá vs. Cho phép sửa

| Trường | Xem | Sửa | Biểu tượng khoá | Ghi chú |
| :---- | :---: | :---: | :---: | :---- |
| AC Subtype | ✅ | ❌ | 🔒 | Đồng bộ từ hệ thống nguồn |
| Aircraft Type Name | ✅ | ✅ | — | Q2 |
| Valid From | ✅ | ❌ | 🔒 | Đồng bộ từ hệ thống nguồn |
| Valid To | ✅ | ✅ | — | — |
| ICAO Code | ✅ | ✅ | — | Phải duy nhất |
| IATA Code | ✅ | ✅ | — | Phải duy nhất |
| Ownership Status | ✅ | ✅ | — | Dropdown |
| Owner | ✅ | ✅ (auto-fill khi `Owned`) | — | — |
| Status | ✅ | ✅ | — | — |
| Tham số kỹ thuật (8 trường) | ✅ | ✅ | — | — |
| Cabin A / B / C | ✅ | ✅ | — | Tối đa 3 khoang (Q3) |
| Bảng ACARS Fuel | ✅ | ✅ (thêm/xoá dòng) | — | Warning Q4 nếu gap/overlap |
| Categories 1–5 | ✅ | ✅ | — | Dropdown từ master data |
| Aircraft Fleet | ✅ | ✅ | — | Dropdown 5 giá trị |

---

## 7. Bảng tổng hợp Mã lỗi & Thông báo

| Mã | Thông báo | Tình huống phát sinh |
| :---: | :---- | :---- |
| VL004 | `This field is required` | Trường bắt buộc bị bỏ trống |
| VL006 | `Invalid format` | Sai định dạng (ICAO/IATA không đúng quy tắc; ô số nhận ký tự lạ; `To ≤ From`) |
| VL007 | `This value already exists` | `ICAO Code` hoặc `IATA Code` trùng với loại tàu bay khác |
| VL999 | `Cannot delete: Aircraft is used in active flight schedules` | Xoá loại tàu bay đang dùng trong chuyến bay hoạt động |
| Q4-WARNING | `⚠ Warning: Date ranges have gaps or overlaps. Review before saving.` | Bảng ACARS Fuel có gap/overlap — **không chặn lưu** (Q4) |
| TB019 | `✅ Changes saved successfully` / `✅ Aircraft deleted successfully` | Lưu/xoá thành công |
| TB020 | `❌ Error: <message>` | API trả lỗi đã biết |
| TB021 | `❌ An unexpected error occurred` | Lỗi không xác định (5xx, timeout) |
| TB022 | `No aircraft types found matching your filters` | API danh sách trả rỗng |
| TB023 | `Reason is required` | Bỏ trống `Reason` ở popup xoá |
| AUTH-403 | Redirect → trang `Access Denied` | Không có quyền truy cập module |

---

## 8. Tham chiếu

- **Mockup nguồn:** `ba/workspace/drafts/mockup/Aircraft Catalog Management-v3.1-en.html` (v3.1, EN)
- **BRD nguồn:** `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.5.md` (PH4 — Quản lý danh mục)
- **Template SRS mẫu (cấu trúc đặc tả):** `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/SRS-MO-Water-Web-v1.0.md`
- **Tham chiếu chéo dữ liệu kỹ thuật:** `Water Tank Capacity` được dùng làm hệ số quy đổi `%` ↔ `lít` trong phân hệ MO Water Web (YC25)
- **Quyết định nghiệp vụ Q1–Q4:** chốt với BA Lead, ngày 2026-06-24 (xem mục "Các quyết định nghiệp vụ đã chốt")

---

*SRS — II.1 Quản lý tàu bay — v0.2 — 2026-06-24. Trạng thái: Review (với BA Lead đã chốt 10 quyết định bổ sung CH-01→CH-10). Phạm vi: section II.1 trong cấu trúc SRS TOSS v1.1, chờ tích hợp vào tài liệu tổng hợp.*
