# II - PHÂN HỆ QUẢN LÝ DANH MỤC DÙNG CHUNG

# QUẢN LÝ TÀU BAY

**Mô tả:** Chức năng quản lý toàn bộ thông tin loại tàu bay (Aircraft Subtype) mà Vietnam Airlines khai thác, bao gồm: đặc tả kỹ thuật, cấu hình khoang, bảng nhiên liệu ACARS, nhóm phân loại, và lịch sử thay đổi.

**Khác biệt so với chuẩn TOSS:** Không có chức năng **"Thêm mới loại tàu bay"** vì dữ liệu được đồng bộ tự động từ Ops++ (CH-01). Chức năng **"Xoá loại tàu bay"** cũng bị ẩn (CH-09) để tránh xung đột đồng bộ; thay vào đó, sử dụng trường `Valid To` để ngừng sử dụng.

**Glossary viết tắt (lần đầu tiên trong tài liệu):**
- **ACARS** — Aircraft Addressing and Reporting System (hệ thống truyền thông máy bay)
- **ICAO** — International Civil Aviation Organization (tổ chức hàng không quốc tế)
- **IATA** — International Air Transport Association (hiệp hội vận tải hàng không quốc tế)
- **MTOW** — Maximum Take-Off Weight (trọng lượng cất cánh tối đa)
- **APU** — Auxiliary Power Unit (đơn vị cấp nguồn phụ)
- **ACreg** — Aircraft Registration (số đăng ký tàu bay)
- **UTC** — Coordinated Universal Time (giờ phối hợp quốc tế)
- **TOSS** — Transformative Operations Support System (hệ thống điều hành khai thác)

---

## 1. Danh sách loại tàu bay

| **Tên chức năng** | Danh sách loại tàu bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xem danh sách toàn bộ loại tàu bay đang được quản lý; hỗ trợ lọc theo AC Subtype, ACreg, 5 cấp Aircraft Category và Status để định vị nhanh bản ghi cần thao tác |
| **Trigger** | Người dùng truy cập web TOSS → chọn module *Data Maintenance* trên thanh điều hướng → chọn mục *Aircraft Fleet* tại sidebar |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền `View Aircraft Catalog` (hoặc quyền cao hơn) |
| **Hậu điều kiện** | Màn hình danh sách hiển thị bảng kết quả; bộ lọc đang áp dụng được giữ trong phiên làm việc cho đến khi người dùng nhấn `Clear Filters` hoặc rời module |

### Sơ đồ luồng hệ thống

![Danh sách loại tàu bay - Sơ đồ luồng hệ thống](ba/workspace/drafts/mockup/diagram-1-danh-sach.png)

*Sơ đồ trên mô tả các bước chính của luồng xử lý khi người dùng truy cập màn hình danh sách tàu bay:*
- *Bước 1-4: Chuỗi actions tuần tự từ khi người dùng mở module đến khi hệ thống gọi API và hiển thị bảng*
- *Bước 5: Người dùng có thể tương tác qua 3 đường khác nhau (optional filter, click vào dòng, hoặc gặp lỗi)*

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

![Danh sách tàu bay - Mockup giao diện](ba/workspace/drafts/mockup/screen-02-list-view.png)

### Mô tả chi tiết màn hình

**Tìm kiếm/lọc:** Người dùng lọc theo `AC Subtype` (gần đúng), `ACreg` (số chính xác), `Category 1–5` (dropdown lấy từ master data, mặc định `All`), `Status` (`All` / `Active` / `Inactive`). Khi nhấn `Search`, hệ thống reload bảng theo bộ lọc và đặt lại phân trang về trang 1. 

**Phân trang:** mặc định 10 dòng/trang; người dùng có thể đổi sang 20 / 50 / 100. 

**Thông báo lỗi:** lỗi cấp trường hiển thị inline; lỗi hệ thống hiển thị toast. 

**Phân quyền:** nếu không có quyền `View Aircraft Catalog`, mục menu *Aircraft Fleet* được ẩn và truy cập trực tiếp URL bị redirect về trang `Access Denied`.

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | AC Subtype | Textbox | `filter.ac_subtype` | **Placeholder:** "search AC subtype" · **Mặc định vào màn hình:** "chọn all" · **Maxlength:** 20 · **TRIM spaces:** đầu cuối · **Paste:**  chỉ lấy 20 ký tự đầu · **Vượt quá ô nhập:** hiển thị "…" tooltip · **Event (out focus/enter):** gọi API trả danh sách · **Lọc:** gần đúng theo mã loại tàu bay |
| 2 | AC Registration (ACreg) | Textbox | `filter.registration_count` | **Placeholder:** "search AC Registration (ACreg)" · **Mặc định vào màn hình:** "chọn all" · **Maxlength:** 5 · **TRIM spaces:** đầu cuối · **Paste:** chỉ lấy 5 ký tự đầu · **Vượt quá ô nhập:** hiển thị "…" tooltip · **Event (out focus/enter):** gọi API trả danh sách · **Validate:** số chính xác; nếu ký tự không phải số (0-9) → inline `VL006 — Invalid format` |
| 3 | Aircraft Category 1 | Dropdown | `filter.category_1` | **Mặc định:** "chọn All" · **Dữ liệu:** đổ từ Ops++ (call API hiển thị danh sách) · **Chỉ chọn 1 giá trị** · Lọc theo phân loại cấp 1 (ví dụ `A320NEO`, `A321 CEO`) |
| 4 | Aircraft Category 2 | Dropdown | `filter.category_2` | **Giá trị:** từ master data · **Mặc định:** All · Lọc theo phân loại cấp 2 |
| 5 | Aircraft Category 3 | Dropdown | `filter.category_3` | **Giá trị:** từ master data · **Mặc định:** All · Lọc theo phân loại cấp 3 |
| 6 | Aircraft Category 4 | Dropdown | `filter.category_4` | **Giá trị:** từ master data · **Mặc định:** All · Lọc theo phân loại cấp 4 |
| 7 | Aircraft Category 5 | Dropdown | `filter.category_5` | **Giá trị:** từ master data · **Mặc định:** All · Lọc theo phân loại cấp 5 (ví dụ `320`, `32N`) |
| 8 | Status | Dropdown | `filter.is_active` | **Giá trị:** `All` / `Active` / `Inactive` · **Mặc định:** All · Lọc theo trạng thái |
| 9 | Nút Search | Button | | **Click:** gửi request lọc → hiển thị toast tạm "Applying filters…" → reload bảng và đặt phân trang về trang 1 |
| 10 | Nút Clear Filters | Button | | **Click:** reset toàn bộ trường lọc về mặc định → reload danh sách không filter |
| 11 | No. | Textview | — | STT tăng dần theo dòng trong trang hiện tại |
| 12 | Registration Count | Textview | `registration_count` | Số lượng tàu bay (ACreg) đã đăng ký thuộc loại tàu bay này. Rỗng/lỗi: hiển thị `N/A` |
| 13 | AC Subtype | Textview (link) | `ac_subtype` | Mã loại tàu bay; in đậm, có thể click để mở màn hình chi tiết (mục 2). Rỗng/lỗi: `N/A` |
| 14 | Aircraft Type Name | Textview (link) | `aircraft_type_name` | Tên loại tàu bay; hiển thị màu xanh dương, click để mở màn hình chi tiết. Rỗng/lỗi: `N/A` |
| 15 | Status | Tag | `is_active` | `Active` → tag xanh `Active`; `Inactive` → tag xám `Inactive` |
| 16 | Actions | IconButton | — | Biểu tượng `Edit` — click: mở màn hình chi tiết (mục 2) ở chế độ xem |
| 17 | Records per page | Dropdown | — | Tuỳ chọn số bản ghi/trang. Mặc định 10. Lựa chọn: 10 / 20 / 50 / 100 |
| 18 | Pagination controls | Pagination | — | Các nút `First` / `Previous` / số trang / `Next` / `Last`. Nút tương ứng bị vô hiệu khi đang ở đầu/cuối danh sách |
| 19 | Total count | Textview | — | Hiển thị tổng số bản ghi theo bộ lọc đang áp dụng, dạng `Total: X records` |

**Tình huống lỗi (Danh sách):**

| Mã | Tình huống | Thông báo |
| :---: | :---- | :---- |
| VL006 | Nhập ký tự không phải số vào ô `ACreg` | Inline `Invalid format` |
| TB022 | API trả về rỗng theo bộ lọc | Bảng trống + thông báo `No aircraft types found matching your filters` |
| TB020 | API lỗi/timeout | Toast `Error loading data. Please try again.` |
| AUTH-403 | Không có quyền `View Aircraft Catalog` | Ẩn menu *Aircraft Fleet*; truy cập URL trực tiếp → trang `Access Denied` |

**Tình huống lỗi (Edit — §3):**

| Mã | Tình huống | Thông báo |
| :---: | :---- | :---- |
| VL004 | Trường bắt buộc (Aircraft Type Name, Owner) bỏ trống | Inline `This field is required` |
| VL006 | Valid To ≤ Valid From; ICAO/IATA sai format; MTOW < Max Ramp Weight; Cabin vượt cap | Inline `Invalid format` hoặc tooltip rõ ràng |
| VL007 | ICAO Code hoặc IATA Code trùng với loại tàu bay khác | Inline `This value already exists` |
| Q4-WARNING | ACARS Fuel có gap/overlap → user bỏ qua cảnh báo | Toast `⚠ Warning: Date ranges have gaps or overlaps. Review before saving.` (không reject) |
| TB019 | Lưu thành công | Toast `✅ Changes saved successfully` |
| TB020 | API trả lỗi đã biết (validation error từ backend) | Toast `❌ Error: <message>` |
| TB021 | API lỗi không xác định (5xx, timeout) | Toast `❌ An unexpected error occurred` |
| AUTH-403 | Không có quyền `Edit Aircraft > [section-name]` | Nút Edit ẩn; redirect nếu truy cập URL trực tiếp |

---

## 2. Xem chi tiết loại tàu bay (4 tab)

| **Tên chức năng** | Xem chi tiết loại tàu bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng xem đầy đủ thông tin của một loại tàu bay, được tổ chức trong 4 tab: *Thông tin chung* — *Cấu hình tàu* — *Thuộc tính nhóm* — *Lịch sử thay đổi*; đồng thời là điểm vào cho thao tác sửa (mục 3) |
| **Trigger** | **(a)** Từ danh sách (mục 1) → click vào một bản ghi; hoặc **(b)** truy cập URL trực tiếp `/aircraft-types/{id}` |
| **Tiền điều kiện** | Người dùng đăng nhập thành công và được phân quyền `View Aircraft Catalog`; bản ghi loại tàu bay với `id` truyền vào tồn tại trong hệ thống |
| **Hậu điều kiện** | Hiển thị thông tin chi tiết với tab 1 (*Thông tin chung*) là mặc định; dữ liệu 4 tab được load theo nguyên tắc lazy (gọi API riêng khi mở từng tab) |

### Sơ đồ luồng hệ thống

![Xem chi tiết loại tàu bay - Sơ đồ luồng hệ thống](ba/workspace/drafts/mockup/diagram-2-xem-chi-tiet.png)

*Sơ đồ trên mô tả các bước khi người dùng truy cập màn hình chi tiết:*
- *Bước 1-3: Chuỗi kiểm tra quyền và gọi API lấy dữ liệu*
- *Bước 4: Hiển thị header và 4 tab (Tab 1 mặc định)*
- *Bước 5: Người dùng có 3 lựa chọn (Edit section, Switch tab, hoặc gặp lỗi)*

### Mô tả luồng xử lý

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng truy cập màn hình chi tiết (qua danh sách hoặc URL trực tiếp) |
| 2 | Hệ thống call API `GET /api/aircraft-types/{id}` để lấy dữ liệu chung (header) và dữ liệu tab 1 (*Thông tin chung*) |
| 3 | Hiển thị header (`AC Subtype` + `Aircraft Type Name`) và 4 tab; tab 1 active mặc định |
| 4 | Người dùng chuyển sang tab khác → hệ thống call API tương ứng (`/configuration`, `/group-attributes`, `/audit-log`) và hiển thị nội dung |
| 5 | Trường hợp `id` không tồn tại hoặc bản ghi đã bị xoá: hiển thị trang lỗi `Aircraft type not found` và nút `Back to list` |
| 6 | Trường hợp API lỗi/timeout: hiển thị toast `Error loading data. Please try again.` và giữ tab hiện tại trống |
| 7 | (Tuỳ chọn) Người dùng click `Edit` ở một section → chuyển section đó sang chế độ chỉnh sửa (mục 3) |

### Màn hình chức năng

![Xem chi tiết tàu bay - 4 tabs](ba/workspace/drafts/mockup/screen-03-detail-view.png)

### Mô tả chi tiết màn hình

Chi tiết từng tab (2.1–2.4) được mô tả tại các mục dưới đây.

---

## 2.1. Tab 1 — Thông tin chung (General Information)

**Trigger:** Người dùng click Tab 1 từ màn hình chi tiết (mặc định active).

**Mục đích:** Hiển thị thông tin định danh và pháp lý của loại tàu bay: `AC Subtype`, `Aircraft Type Name`, khoảng hiệu lực, mã `ICAO`/`IATA`, trạng thái sở hữu, chủ sở hữu, trạng thái sử dụng.

**Bố cục:** Layout 2 cột, 9 trường + cụm nút `Edit` (chế độ xem) hoặc `Save` / `Cancel` (chế độ sửa).

**Ghi chú khoá:** Hai trường `AC Subtype` và `Valid From` luôn ở trạng thái chỉ đọc (đồng bộ từ Ops++ — CH-01) và có biểu tượng khoá. `Aircraft Type Name` KHÔNG khoá (Q2).

| STT | Tên | Loại control | Mapping DB/API | Khoá? | Mô tả |
| :----: | ----- | ----- | ----- | :---: | ----- |
| 1 | AC Subtype | Textview | `ac_subtype` | ✅ Có | Mã loại tàu bay (ví dụ `A320NEO`). Đồng bộ từ Ops++ (CH-01). Biểu tượng khoá hiển thị, không cho phép thao tác sửa |
| 2 | Aircraft Type Name | Textview (xem) / Textbox (sửa) | `aircraft_type_name` | ❌ Không (Q2) | Tên loại tàu bay (ví dụ `Airbus A320 NEO`). Maxlength 100. **Bắt buộc** khi lưu. Không khoá, cho phép sửa (Q2) |
| 3 | Valid From | Textview (date) | `valid_from` | ✅ Có | Ngày bắt đầu hiệu lực, format `dd/mm/yyyy`. Đồng bộ từ Ops++ (CH-01); biểu tượng khoá hiển thị |
| 4 | Valid To | Textview (xem) / DateInput (sửa) | `valid_to` | ❌ Không | Ngày kết thúc hiệu lực, format `dd/mm/yyyy`. Khi sửa phải `> Valid From` (không cho phép nhập ngày trùng Valid From, validate VL006 nếu vi phạm). Cho phép ngày quá khứ (CH-02) |
| 5 | ICAO Code | Textview / Textbox | `icao_code` | ❌ Không | Mã ICAO (ví dụ `A20N`). Maxlength 4. Validate: 3–4 ký tự, gồm chữ in hoa và số. Phải duy nhất trong hệ thống (VL007 nếu trùng) |
| 6 | IATA Code | Textview / Textbox | `iata_code` | ❌ Không | Mã IATA (ví dụ `32N`). Maxlength 3. Validate: 2–3 ký tự, gồm chữ in hoa và số. Phải duy nhất (VL007 nếu trùng) |
| 7 | Ownership Status | Textview / Dropdown | `ownership_status` | ❌ Không | Giá trị: `Owned` / `Wet Leased` / `Dry Leased`. Khi đổi giá trị → ảnh hưởng logic trường `Owner` (STT 8) — CH-04 |
| 8 | Owner | Textview / Textbox | `owner` | ❌ Không | Tên chủ sở hữu. Maxlength 50. **Logic CH-04:** nếu `Owned` → tự động điền `Vietnam Airlines` và disabled; nếu `Wet/Dry Leased` → xoá giá trị cũ, user phải nhập tên chủ mới (bắt buộc) |
| 9 | Status | Textview / Dropdown | `is_active` | ❌ Không | Giá trị: `Active` / `Inactive`. Mặc định `Active` |

**Nút hành động:**

| STT | Tên | Loại | Mô tả |
| :----: | ----- | ----- | ----- |
| 10 | Nút Edit | Button | Chỉ hiển thị ở chế độ xem khi người dùng có quyền `Edit Aircraft > General Info` (CH-08: per-section permission). Click → chuyển section 2.1 sang chế độ sửa |
| 11 | Nút Save | Button | Chỉ hiển thị ở chế độ sửa. Click → validate + gọi API `PUT /api/aircraft-types/{id}` |
| 12 | Nút Cancel | Button | Chỉ hiển thị ở chế độ sửa. Click → rollback thay đổi cục bộ và quay lại chế độ xem |

---

## 2.2. Tab 2 — Cấu hình tàu (Aircraft Configuration)

**Trigger:** Người dùng click Tab 2 từ màn hình chi tiết (lazy load).

**Mục đích:** Quản lý ba cụm cấu hình kỹ thuật: (a) tham số kỹ thuật của tàu bay, (b) cấu hình khoang (cabin), (c) bảng đơn vị/hệ số nhiên liệu ACARS theo khoảng thời gian.

**Bố cục:** 3 subsection độc lập, mỗi subsection có nút `Edit` riêng theo nguyên tắc section-level (Q1). Mỗi dòng trong bảng chi tiết hiển thị cả chế độ xem (Textview) và chế độ sửa (input control) tương ứng.

### 2.2.1. Tham số kỹ thuật (Aircraft Parameters)

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Taxi Fuel Flow | NumberInput | `taxi_fuel_flow` | Mức tiêu thụ nhiên liệu khi di chuyển trên mặt đất, đơn vị `kg/h`. Maxlength 10. Validate: số `≥ 0`. Ví dụ `1500` |
| 2 | APU Fuel Flow | NumberInput | `apu_fuel_flow` | Mức tiêu thụ của đơn vị APU, đơn vị `kg/h`. Maxlength 10. Validate: số `≥ 0`. Ví dụ `200` |
| 3 | Fuel Tank Capacity | NumberInput | `fuel_tank_capacity` | Dung tích bình chứa nhiên liệu, đơn vị `kg`. Validate: số `> 0`. Ví dụ `27200` |
| 4 | Water Tank Capacity | NumberInput | `water_tank_capacity` | Dung tích bình nước sạch, đơn vị `lít`. Validate: số `≥ 0`. Ví dụ `200` |
| 5 | Cargo Capacity | NumberInput | `cargo_capacity` | Sức chứa hành lý/cargo, đơn vị `kg`. Validate: số `≥ 0`. Ví dụ `6000` |
| 6 | Basic Weight | NumberInput | `basic_weight` | Trọng lượng cơ bản của tàu bay, đơn vị `kg`. Validate: số `> 0`. Ví dụ `41413` |
| 7 | Max Ramp Weight | NumberInput | `max_ramp_weight` | Trọng lượng tối đa khi chuẩn bị cất cánh, đơn vị `kg`. Validate: số `> 0` và `≥ Basic Weight`. Ví dụ `75500` |
| 8 | MTOW | NumberInput | `mtow` | Trọng lượng cất cánh tối đa, đơn vị `kg`. Validate: số `> 0` và `≥ Max Ramp Weight`. **CH-03: REJECT nếu MTOW < Max Ramp Weight — toast "REJECT — MTOW must be ≥ Max Ramp Weight", không cho lưu** |
| 9 | Nút Edit / Save / Cancel | Button | — | Section-level theo Q1. Cụm Save/Cancel chỉ hiện ở chế độ sửa. Quyền: `Edit Aircraft > Aircraft Config` (CH-08) |

### 2.2.2. Cấu hình khoang tàu (Cabin Configuration)

*Phạm vi: tối đa 3 khoang `A`, `B`, `C` (Q3). Nhập `0` cho khoang không tồn tại trên loại tàu bay này; KHÔNG hỗ trợ thêm khoang động.*

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Cabin A | NumberInput | `cabin_a` | Số ghế/vị trí trong Cabin A. Validate: số nguyên `0–999`. **CH-06: tổng `Cabin A + B + C` phải ≤ cap loại tàu; nếu vượt → toast "REJECT — total cabins exceed aircraft capacity"** . Ví dụ `8`. Giá trị `0` = khoang không tồn tại |
| 2 | Cabin B | NumberInput | `cabin_b` | Số ghế trong Cabin B. Validate: số nguyên `0–999`. Tham gia tính tổng cap (CH-06). Ví dụ `24` |
| 3 | Cabin C | NumberInput | `cabin_c` | Số ghế trong Cabin C. Validate: số nguyên `0–999`. Tham gia tính tổng cap (CH-06). Ví dụ `120` |
| 4 | Ghi chú | Textview | — | Hiển thị tĩnh: `Configure max 3 cabins. Enter 0 for cabins that don't exist on this aircraft type.` |
| 5 | Nút Edit / Save / Cancel | Button | — | Section-level theo Q1. Quyền: `Edit Aircraft > Aircraft Config` (CH-08) |

### 2.2.3. ACARS Fuel Unit & Fuel Multiplier (bảng)

**Mục đích:** Khai báo các cặp `From–To` có hiệu lực cho `Fuel Unit` và `Fuel Multiplier` phục vụ tính toán nhiên liệu trong hệ thống ACARS.

**Quy tắc validate (Q4):** Các khoảng `From–To` phải nối tiếp nhau, không có khoảng trống (gap) và không chồng lấn (overlap). Nếu vi phạm → hệ thống hiển thị **toast cảnh báo** (WARNING, không REJECT) và **vẫn cho phép lưu**; cờ `acars_warning_acknowledged = true` được ghi vào Audit log.

**Hành vi ở chế độ sửa:** Nút `+ Add Row` chỉ hiển thị ở chế độ sửa; biểu tượng `Delete` (thùng rác) trên từng dòng chỉ kích hoạt ở chế độ sửa.

| STT | Tên cột | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | From | DateTimeInput | `acars_fuel_from` | Ngày-giờ bắt đầu hiệu lực, format `dd/mm/yyyy HH:MM`. Ví dụ `01/01/2026 00:00`. **Bắt buộc** |
| 2 | To | DateTimeInput | `acars_fuel_to` | Ngày-giờ kết thúc hiệu lực, format `dd/mm/yyyy HH:MM`. Ví dụ `30/06/2026 23:59`. **Bắt buộc**. Phải `> From` (VL006 nếu vi phạm) |
| 3 | Fuel Unit | NumberInput (step 0.01) | `acars_fuel_unit` | Giá trị đơn vị nhiên liệu. **Bắt buộc**. Validate: số `> 0`. Ví dụ `1500.00` |
| 4 | Fuel Multiplier | NumberInput (step 0.001) | `acars_fuel_multiplier` | Hệ số nhân. **Bắt buộc**. Validate: số `> 0`. Ví dụ `1.050` |
| 5 | Actions | IconButton | — | Biểu tượng `Delete` (thùng rác); chỉ kích hoạt ở chế độ sửa; click → xoá dòng khỏi bảng (chưa ghi DB cho đến khi `Save`) |
| 6 | Nút + Add Row | Button | — | Chỉ hiển thị ở chế độ sửa. Click → thêm một dòng trống mới ở cuối bảng |
| 7 | Nút Edit / Save / Cancel | Button | — | Section-level theo Q1. `Save` thực hiện validate Q4 và (nếu cảnh báo) hiển thị toast trước khi gọi API. Quyền: `Edit Aircraft > Aircraft Config` (CH-08) |

**Ví dụ dữ liệu hợp lệ:**

| From | To | Fuel Unit | Fuel Multiplier |
| :---- | :---- | :---: | :---: |
| 01/01/2026 00:00 | 30/06/2026 23:59 | 1500 | 1.050 |
| 01/07/2026 00:00 | 31/12/2026 23:59 | 1550 | 1.060 |

---

## 2.3. Tab 3 — Thuộc tính nhóm (Group Attributes)

**Trigger:** Người dùng click Tab 3 từ màn hình chi tiết (lazy load).

**Mục đích:** Phân loại loại tàu bay theo 5 cấp `Aircraft Category` và `Aircraft Fleet` để hỗ trợ lập lịch bay, phân công tổ bay và lập kế hoạch bảo dưỡng.

**Bố cục:** 6 dropdown, mỗi dropdown lấy danh sách giá trị từ master data tương ứng. Nút Edit/Save/Cancel theo section-level (Q1).

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Aircraft Category 1 | Dropdown | `category_1` | Phân loại cấp 1 (ví dụ `A320NEO`, `A321 CEO`). Giá trị lấy từ master data |
| 2 | Aircraft Category 2 | Dropdown | `category_2` | Phân loại cấp 2. Giá trị từ master data |
| 3 | Aircraft Category 3 | Dropdown | `category_3` | Phân loại cấp 3. Giá trị từ master data |
| 4 | Aircraft Category 4 | Dropdown | `category_4` | Phân loại cấp 4. Giá trị từ master data |
| 5 | Aircraft Category 5 | Dropdown | `category_5` | Phân loại cấp 5 (ví dụ `320`, `32N`). Giá trị từ master data |
| 6 | Aircraft Fleet | Dropdown | `aircraft_fleet` | Phân loại Fleet phục vụ quản lý bảo dưỡng và tổ bay. Giá trị: `A320` / `A321` / `A350` / `B787` / `ATR` |
| 7 | Nút Edit / Save / Cancel | Button | — | Section-level theo Q1. Quyền: `Edit Aircraft > Group Attributes` (CH-08) |

---

## 2.4. Tab 4 — Lịch sử thay đổi (Audit Log) — chỉ đọc

**Trigger:** Người dùng click Tab 4 từ màn hình chi tiết (lazy load).

**Mục đích:** Ghi nhận toàn bộ thay đổi trên loại tàu bay phục vụ audit trail và compliance, bao gồm IP Address, User-Agent, Device (CH-07).

**Bố cục:** Thanh bộ lọc + bảng kết quả + nút xuất Excel. Không có thao tác chỉnh sửa.

### Màn hình chức năng

![Lịch sử thay đổi - Tab 4 Audit Log](ba/workspace/drafts/mockup/screen-06-audit-log.png)

### Thanh bộ lọc

| STT | Tên | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Date From | DateInput | `filter.date_from` | Lọc từ ngày, format `dd/mm/yyyy`. Mặc định trống |
| 2 | Date To | DateInput | `filter.date_to` | Lọc đến ngày, format `dd/mm/yyyy`. Mặc định trống. Validate: `≥ Date From` |
| 3 | Changed By | Dropdown | `filter.changed_by` | Lọc theo người thực hiện. Giá trị: `All` / danh sách user đã thao tác trên bản ghi |
| 4 | Changed Field | Dropdown | `filter.changed_field` | Lọc theo trường thay đổi của bản ghi này. **Danh sách động per-record:** chỉ hiển thị field thực sự có thay đổi trên bản ghi này (loại bỏ field khoá như AC Subtype, Valid From). Giá trị: `All` / `Aircraft Type Name` / `ICAO Code` / `Valid To` / `Owner` / ... tùy theo history của bản ghi |
| 5 | Nút Search | Button | | Click: reload bảng audit log theo bộ lọc |
| 6 | Nút Download Excel | Button | | Click: xuất audit log theo bộ lọc ra file `.xlsx`. **CH-10:** Tên file: `TOSS_Aircraft_History_<AC_Subtype>_<ddmmyyyy>.xlsx` (ví dụ: `TOSS_Aircraft_History_A320NEO_24062026.xlsx`) |

### Bảng kết quả

| STT | Tên cột | Loại control | Mapping DB/API | Mô tả |
| :----: | ----- | ----- | ----- | ----- |
| 1 | Date/Time | Textview | `changed_at_utc` | Thời điểm thay đổi, format `dd/mm/yyyy HH:MM:SS`, hiển thị theo giờ UTC |
| 2 | Changed By | Textview | `changed_by` | Tên/ID người thực hiện thay đổi (ví dụ `data_officer`) |
| 3 | Tab | Badge | `tab_name` | Nhóm/tab nơi thay đổi xảy ra (`General Information` / `Aircraft Configuration` / `Group Attributes`) |
| 4 | Field | Badge | `field_name` | Tên trường thay đổi (ví dụ `ICAO Code`, `Cabin Config`) |
| 5 | Old Value | Textview | `old_value` | Giá trị cũ. Rỗng (tạo mới): hiển thị `—` |
| 6 | New Value | Textview | `new_value` | Giá trị mới. Rỗng (xoá): hiển thị `—` |
| 7 | Notes | Textview | `notes` | Ghi chú của người thực hiện (nếu có). **CH-07:** Lưu thêm IP Address, User-Agent, Device; riêng hành động xoá ghi nhận `Reason` từ popup |
| 8 | Phân trang | Pagination | — | Khi số bản ghi `> 10`: phân trang theo kịch bản dùng chung |

**Ví dụ bản ghi audit:**

```
Date/Time:    23/06/2026 10:30:45
Changed By:   data_officer
IP Address:   192.168.1.100
User-Agent:   Mozilla/5.0 (Windows NT 10.0; Win64; x64)
Device:       Desktop
Tab:          General Information
Field:        ICAO Code
Old Value:    A20N
New Value:    A20M
Notes:        (trống)
```

---

## 3. Sửa thông tin loại tàu bay (Section-level Edit)

| **Tên chức năng** | Sửa thông tin loại tàu bay |
| :---- | :---- |
| **Mục đích** | Cho phép người dùng chỉnh sửa các trường thông tin của loại tàu bay theo mô hình **section-level** (Q1): mỗi section có nút `Edit` độc lập, chỉ section đó chuyển sang chế độ sửa, các section khác vẫn read-only. Hỗ trợ validate per-field, warning (không reject) với ACARS Q4, và ghi Audit log với IP/User-Agent (CH-07) |
| **Trigger** | Người dùng click nút `Edit` tại một section trên màn hình chi tiết (mục 2) |
| **Tiền điều kiện** | Người dùng đăng nhập thành công; có quyền `Edit Aircraft > [section-name]` (CH-08: per-section permission); bản ghi tồn tại |
| **Hậu điều kiện** | Section được lưu với thay đổi (hoặc rollback nếu user nhấn Cancel); Audit log ghi IP, User-Agent, Device (CH-07); Last-Write-Wins áp dụng (CH-05) |

### Sơ đồ luồng hệ thống

![Sửa thông tin loại tàu bay - Sơ đồ luồng hệ thống](ba/workspace/drafts/mockup/diagram-3-sua-thong-tin.png)

*Sơ đồ trên mô tả các bước khi người dùng chỉnh sửa một section:*
- *Bước 1-3: Người dùng click Edit → kiểm tra quyền → mở chế độ sửa (Last-Write-Wins, CH-05)*
- *Bước 4-5: Người dùng thay đổi dữ liệu (có thể thêm/xoá dòng nếu ACARS)*
- *Bước 6-7: Nhấn Save → validate client-side → cảnh báo Q4 (nếu có) → gọi API*
- *Bước 8-9: Kết quả (Success: Audit log + IP/UA CH-07, Error, hoặc Cancel rollback)*

| Bước | Chi tiết |
| :----: | ----- |
| 1 | Người dùng nhấn `Edit` tại một section bất kỳ trên màn hình chi tiết |
| 2 | Hệ thống kiểm tra quyền: `Edit Aircraft > [section-name]` (CH-08 per-section). Nếu không có quyền → không hiển thị nút Edit |
| 3 | Hệ thống mở chế độ sửa: toàn bộ trường trong section trở nên editable (trừ các trường khoá); các section khác vẫn read-only |
| 4 | Hiển thị action bar (nền vàng) ở đáy: `✎ Editing: <Section Name>` + hai nút `[Save]` `[Cancel]` |
| 5 | Các nút Edit ở section khác vẫn có thể click (không bị ẩn) — cho phép 2 user sửa 2 section khác nhau song song. **CH-05 (Last-Write-Wins):** Nếu cả 2 user save, ai save sau ghi đè trường trùng; Audit log sẽ ghi 2 bản ghi riêng theo timestamp. Không có pessimistic lock. |
| 6 | Người dùng thay đổi giá trị; với section ACARS Fuel có thể thêm/xoá dòng |
| 7 | Người dùng nhấn `[Save]` → client-side validate: bắt buộc, định dạng, độ dài, ràng buộc cross-field |
| 8 | Nếu fail validate → thông báo lỗi inline + Toast `Please fix the errors`; giữ chế độ sửa |
| 9 | Nếu là section ACARS Fuel và phát hiện gap/overlap → Toast cảnh báo (Q4, không reject) |
| 10 | Người dùng có thể nhấn `[Save]` lần nữa để xác nhận và lưu (có thể bỏ qua cảnh báo) |
| 11 | Nếu pass → gọi API `PUT /api/aircraft-types/{id}` với payload chỉ chứa các trường section đó |
| 12 | Backend: detect thay đổi per-field, ghi Audit log (IP + User-Agent + Device — CH-07), trả 200 OK |
| 13 | Frontend: Toast `✅ Changes saved successfully`, đóng chế độ sửa, reload dữ liệu section |
| 14 | API lỗi (4xx/5xx) → Toast `❌ Error: <message>`, giữ chế độ sửa để user retry |
| 15 | Người dùng nhấn `[Cancel]` → rollback toàn bộ thay đổi cục bộ, đóng chế độ sửa |

### Màn hình chức năng

![Sửa thông tin tàu bay - Section Edit Mode](ba/workspace/drafts/mockup/screen-04-edit-view.png)

### Quy tắc khoá theo trường

| Trường | Khoá ở chế độ Edit? | Ghi chú |
| :---- | :---: | :---- |
| AC Subtype | ✅ Có | Đồng bộ từ Ops++ (CH-01); biểu tượng khoá hiển thị |
| Aircraft Type Name | ❌ Không (Q2) | Bắt buộc khi lưu |
| Valid From | ✅ Có | Đồng bộ từ Ops++; biểu tượng khoá hiển thị |
| Valid To | ❌ Không | Phải `> Valid From` (không cho trùng). Cho phép ngày quá khứ (CH-02) |
| ICAO Code | ❌ Không | 3–4 ký tự in hoa + số; phải duy nhất (VL007) |
| IATA Code | ❌ Không | 2–3 ký tự in hoa + số; phải duy nhất (VL007) |
| Ownership Status | ❌ Không | Dropdown; khi đổi → trigger xoá `Owner` nếu chuyển sang Wet/Dry Leased (CH-04) |
| Owner | ❌ Không | Auto-fill khi `Owned`; disabled. User nhập khi `Wet/Dry Leased` |
| Status | ❌ Không | Dropdown `Active` / `Inactive` |
| Tham số kỹ thuật (8 trường) | ❌ Không | Validate số `≥ 0` hoặc `> 0`; ràng buộc `Basic Weight ≤ Max Ramp Weight ≤ MTOW` (CH-03: REJECT nếu MTOW < Max Ramp Weight — toast "REJECT — MTOW must be ≥ Max Ramp Weight", không cho lưu) |
| Cabin A / B / C | ❌ Không | Số nguyên `0–999`; tổng check cap (CH-06) |
| Bảng ACARS Fuel | ❌ Không | Thêm/xoá dòng; validate gap/overlap (Q4: warning không reject) |
| Categories 1–5 | ❌ Không | Dropdown từ master data |
| Aircraft Fleet | ❌ Không | Dropdown `A320` / `A321` / `A350` / `B787` / `ATR` |

---

## 4. Xoá loại tàu bay

**⚠️ QUAN TRỌNG (CH-09):** Nút `Delete` được **ẩn trên UI**. Lý do: tàu bay đồng bộ từ Ops++; xoá cục bộ sẽ gây xung đột khi đồng bộ lại từ Ops++. **Để ngừng dùng tàu, hãy dùng trường `Valid To` (set ngày kết thúc)** thay vì xoá.

### Màn hình chức năng

![Xoá tàu bay - Chức năng ẩn (không khả dụng)](ba/workspace/drafts/mockup/screen-05-delete-view.png)

| **Tên chức năng** | Không áp dụng (Xoá bị vô hiệu) |
| :---- | :---- |
| **Mục đích** | Không khả dụng — nút Delete bị ẩn (CH-09) |
| **Trigger** | Không có (nút Delete không tồn tại trên UI) |
| **Tiền điều kiện** | N/A |
| **Hậu điều kiện** | N/A — thay vào đó, sử dụng trường `Valid To` để ngừng dùng loại tàu bay |
| **Ghi chú** | Chức năng xoá không khả dụng vì loại tàu bay được đồng bộ từ Ops++ (CH-01). Nếu cần ngừng sử dụng, hãy cập nhật trường `Valid To` bằng cách chỉnh sửa Tab 1 (Thông tin chung). Điều này tránh xung đột khi đồng bộ lại từ Ops++ |

---

## 5. Quy tắc nghiệp vụ chung (Audit Log)

*Đặc tả chi tiết (bảng filter, bảng kết quả, nút Download Excel) đã được trình bày tại mục 2.4 — Tab 4: Lịch sử thay đổi. Mục này gom thêm các quy tắc nghiệp vụ và cơ chế ghi Audit log toàn cục.*

### Quy tắc nghiệp vụ chung

| # | Quy tắc | Ghi chú |
| :---: | :---- | :---- |
| 1 | Audit log được tạo tự động bởi backend mỗi khi có thao tác `Save` (mục 3) thành công | Granularity: per-field — nếu một thao tác cập nhật 3 trường thì sinh 3 bản ghi audit |
| 2 | Mọi thời gian hiển thị theo giờ UTC | Thống nhất với các phân hệ khác trong TOSS |
| 3 | **CH-07:** Audit log ghi thêm: IP Address, User-Agent (browser/OS), Device (desktop/mobile) | Phục vụ compliance/forensic trail; dữ liệu này không hiển thị trên UI, chỉ lưu trên DB |
| 4 | Trường `Notes` ghi chú nếu người dùng nhập (ví dụ: khi user bỏ qua cảnh báo Q4) | Hiện tại, Tab 1–3 không có ô input cho `Notes`; Field này phục vụ khi có cảnh báo Q4 (ghi cờ `acars_warning_acknowledged=true`) hoặc mở rộng tương lai |
| 5 | Cảnh báo Q4 (ACARS Fuel gap/overlap) bị user bỏ qua → audit log ghi cờ `acars_warning_acknowledged = true` | Phục vụ truy xuất các tình huống lưu có cảnh báo |
| 6 | Audit log không cho phép sửa/xoá bằng UI; chỉ admin DB có quyền can thiệp | Ngoài phạm vi TOSS |

---

## 6. Bảng tổng hợp Mã lỗi & Thông báo

| Mã | Thông báo | Tình huống phát sinh |
| :---: | :---- | :---- |
| VL004 | `This field is required` | Trường bắt buộc bị bỏ trống |
| VL005 | (Không áp dụng module này) | Dành cho các module khác trong TOSS; module Aircraft Management không dùng VL005 |
| VL006 | `Invalid format` | Sai định dạng (ICAO/IATA không đúng quy tắc; ô số nhận ký tự lạ; `To > From` CH-02; tổng Cabin vượt cap — CH-06; MTOW < Max Ramp Weight — CH-03) |
| VL007 | `This value already exists` | `ICAO Code` hoặc `IATA Code` trùng với loại tàu bay khác |
| Q4-WARNING | `⚠ Warning: Date ranges have gaps or overlaps. Review before saving.` | Bảng ACARS Fuel có gap/overlap — **không chặn lưu** (Q4) |
| TB019 | `✅ Changes saved successfully` | Lưu thành công |
| TB020 | `❌ Error: <message>` | API trả lỗi đã biết |
| TB021 | `❌ An unexpected error occurred` | Lỗi không xác định (5xx, timeout) |
| TB022 | `No aircraft types found matching your filters` | API danh sách trả rỗng |
| AUTH-403 | Redirect → trang `Access Denied` | Không có quyền truy cập module |

---

## 7. Tham chiếu & Ghi chú

### Các quyết định đã chốt (Q1–Q4)

Xem phần **Các quyết định bổ sung (CH-01 đến CH-10)** ở đầu tài liệu SRS chính.

### Các quyết định bổ sung (CH-01 đến CH-10)

Xem phần **Các quyết định bổ sung (CH-01 đến CH-10)** ở đầu tài liệu SRS chính.

### Tài liệu tham chiếu

- **Mockup nguồn:** `ba/workspace/drafts/mockup/Aircraft Catalog Management-v3.1-en.html`
- **BRD nguồn:** `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.5.md`
- **SRS Data Maintenance (tham chiếu cấu trúc):** `ba/workspace/input/domain-knowledge/srs/VNA.TOSS_SRS_Data Maintenance_v0.1.docx`

---

## 8. User Stories

Danh sách User Stories chia từng chức năng chi tiết, sẵn sàng để phân công lập trình:

| # | User Story | Mô tả | Acceptance Criteria | Liên quan |
| :---: | :---- | :---- | :---- | :---- |
| US-001 | Danh sách tàu bay - View, lọc, phân trang, xuất | Người dùng xem danh sách tàu bay mặc định 10 dòng/trang, hỗ trợ lọc AC Subtype (gần đúng), ACreg (số chính xác), Category 1–5, Status, phân trang 10-100, xuất Excel | **Given:** User login + quyền View Aircraft; **When:** Click module Aircraft Fleet; **Then:** (a) Danh sách load API GET /api/aircraft-types?page=1&pageSize=10 mặc định; (b) Filter fields: AC Subtype (maxlength 20, TRIM/paste, out-focus call API), ACreg (maxlength 5, numeric only, VL006 nếu non-digit), Category 1–5 (master data, default All), Status (All/Active/Inactive); (c) Search/Clear button behavior per spec; (d) Phân trang 10-100 dòng/trang; (e) Nút Export Excel tương ứng | Mục 1, CH-10 |
| US-002 | Danh sách tàu bay - Tìm kiếm/lọc nâng cao | Người dùng tìm kiếm theo AC Subtype, ACreg, Category 1–5, Status | **Given:** Danh sách đang hiển thị; **When:** Nhập filter + nhấn Search; **Then:** Bảng reload theo filter, reset về trang 1, hiển thị kết quả hoặc "No data found" | Mục 1 |
| US-003 | Xem chi tiết Tab 1 - Thông tin chung | Người dùng xem 9 trường thông tin chung, 2 trường khoá (AC Subtype, Valid From) có icon, không cho edit | **Given:** User click vào dòng danh sách hoặc truy cập URL /aircraft-types/{id}; **When:** Mở Tab 1; **Then:** (a) Hiển thị 9 trường (AC Subtype, Aircraft Type Name, Valid From, Valid To, ICAO Code, IATA Code, Ownership Status, Owner, Status); (b) AC Subtype & Valid From khoá (CH-01), có icon khoá, không cho edit; (c) Aircraft Type Name editable (Q2); (d) Nút Edit visible nếu user có quyền Edit Aircraft > General Info (CH-08) | Mục 2.1, CH-01, Q2 |
| US-004 | Sửa Tab 1 - Thông tin chung | Người dùng sửa các field editable, validate per-field (Aircraft Type Name bắt buộc, Valid To > Valid From không cho trùng, ICAO/IATA duy nhất, Owner logic), save/cancel | **Given:** User có quyền Edit Aircraft > General Info (CH-08); **When:** Click Edit → sửa dữ liệu → Save; **Then:** (a) Client-side validate: Aircraft Type Name bắt buộc (VL004), Valid To > Valid From không cho trùng (VL006 CH-02), ICAO Code 3–4 ký tự in hoa + số + duy nhất (VL007), IATA Code 2–3 ký tự + duy nhất (VL007), Owner bắt buộc nếu Wet/Dry Leased (CH-04); (b) Pass → API PUT /api/aircraft-types/{id}; (c) 200 OK → Audit log ghi IP/UA/Device (CH-07) → Toast "✅ Changes saved successfully"; (d) Fail → Toast "❌ Error/Please fix errors" | Mục 2.1, CH-02/CH-04/CH-07/CH-08, VL004/VL006/VL007 |
| US-005 | Xem chi tiết Tab 2 - Cấu hình tàu (tham số) | Người dùng xem 8 tham số kỹ thuật tàu bay (Taxi Fuel, APU, Weight, Capacity) | **Given:** User nhấn Tab 2; **When:** API gọi /configuration; **Then:** Hiển thị 3 block (Tham số, Cabin, ACARS), mỗi block có nút Edit riêng | Mục 2.2.1 |
| US-006 | Sửa Tab 2 - Block tham số kỹ thuật | Người dùng sửa 8 tham số (Taxi Fuel, APU, Weight, Capacity), validate constraint MTOW ≥ Max Ramp Weight (CH-03: REJECT) | **Given:** User nhấn Edit block tham số; **When:** Sửa MTOW < Max Ramp Weight → Save; **Then:** (a) Client-side validate: MTOW phải > 0 và ≥ Max Ramp Weight (CH-03); (b) Fail MTOW < Max Ramp Weight → Toast "❌ REJECT — MTOW must be ≥ Max Ramp Weight", không cho lưu, giữ chế độ Edit; (c) Pass → API PUT ghi tham số → Audit log (CH-07) → Toast "✅ Changes saved successfully" | Mục 2.2.1, CH-03/CH-07/CH-08 |
| US-007 | Sửa Tab 2 - Block cấu hình khoang | Người dùng điều chỉnh Cabin A/B/C (max 3 khoang, giá trị 0–999/khoang), validate tổng ≤ cap loại tàu (CH-06: REJECT) | **Given:** User nhấn Edit block Cabin; **When:** Sửa Cabin A/B/C, tổng > cap loại tàu → Save; **Then:** (a) Client-side validate: Cabin A/B/C = số nguyên 0–999; tổng phải ≤ capacity loại tàu (CH-06); (b) Fail tổng > cap → Toast "❌ REJECT — total cabins exceed aircraft capacity", không cho lưu, giữ chế độ Edit; (c) Pass → API PUT ghi cabin config → Audit log (CH-07) → Toast "✅ Changes saved successfully" | Mục 2.2.2, CH-06/CH-07/CH-08 |
| US-008 | Sửa Tab 2 - Block ACARS Fuel | Người dùng thêm/xoá dòng bảng Fuel Unit/Multiplier, validate gap/overlap (Q4: warning) | **Given:** User nhấn Edit ACARS block; **When:** Thêm dòng có gap/overlap → Save; **Then:** Toast cảnh báo (Q4: not reject), user Save lần nữa xác nhận → lưu với `acars_warning_acknowledged=true` | Mục 2.2.3, Q4/CH-08 |
| US-009 | Thêm khoảng hiệu lực ACARS | Người dùng thêm dòng mới với From/To/Fuel Unit/Multiplier, validate constraints | **Given:** User nhấn [+ Add Row]; **When:** Nhập From/To/Fuel Unit/Multiplier; **Then:** Validate To > From (VL006 nếu sai), Fuel Unit > 0 | Mục 2.2.3 |
| US-010 | Xem chi tiết Tab 3 - Thuộc tính nhóm | Người dùng xem 6 dropdown (Category 1–5, Fleet) lấy từ master data | **Given:** User nhấn Tab 3; **When:** API gọi /group-attributes; **Then:** Hiển thị 6 dropdown với value từ master data, current selection visible | Mục 2.3, CH-08 |
| US-011 | Sửa Tab 3 - Thuộc tính nhóm | Người dùng chọn giá trị từ 6 dropdown, save thay đổi | **Given:** User nhấn Edit; **When:** Chọn value → Save; **Then:** API PUT ghi giá trị mới, Audit log ghi change, reload Tab 3 | Mục 2.3, CH-08 |
| US-012 | Xem Tab 4 - Lịch sử thay đổi (Audit log) | Người dùng xem bảng audit log (Date, User, Tab, Field, Old/New Value, Notes); lọc theo Date/User/Field | **Given:** User nhấn Tab 4; **When:** Mở bảng audit; **Then:** Hiển thị tất cả change (per-field granularity), hỗ trợ lọc Date/User/Field/Changed Field, phân trang 10-100 | Mục 2.4, CH-07 |
| US-013 | Xuất Audit log Excel | Người dùng xuất audit log theo bộ lọc, tên file `TOSS_Aircraft_History_<Subtype>_<ddmmyyyy>.xlsx` | **Given:** User đang xem Tab 4 với filter; **When:** Nhấn Download Excel; **Then:** Tải file Excel theo bộ lọc, tên theo CH-10 format `TOSS_Aircraft_History_A320NEO_24062026.xlsx` | Mục 2.4, CH-10 |
| US-014 | Tìm kiếm tàu bay | Người dùng tìm kiếm nhanh AC Subtype trên danh sách bằng textbox (gần đúng) + click/edit vào từng tàu | **Given:** Danh sách hiển thị; **When:** Nhập AC Subtype (gần đúng) → Search hoặc click dòng; **Then:** Danh sách filter hoặc chuyển sang View Details tương ứng | Mục 1, 2 |

---

*II.1 Quản lý tàu bay — Đặc tả Chi tiết (SRS Format) — v0.6 — 2026-06-24. Cấu trúc và format theo VNA.TOSS_SRS_Data Maintenance. Sơ đồ luồng hệ thống dạng ảnh PNG (3 chức năng) + 14 User Stories có AC + Glossary + tất cả 10 quyết định (Q1–Q4, CH-01–CH-10) tích hợp. FINAL: Ready for BA Lead review.*
