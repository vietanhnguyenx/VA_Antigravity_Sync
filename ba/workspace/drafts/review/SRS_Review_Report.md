# BÁO CÁO REVIEW CHI TIẾT — VNA.FIMS SRS Phase 1

> **Ngày review:** 2026-06-11  
> **Người review:** BA kỳ cựu (vai trò)  
> **Phạm vi:** Toàn bộ tài liệu `VNA.FIMS_SRS_Phase 1.docx.md` (~6.180 dòng)  
> **Mục tiêu:** Kiểm tra format, tính nhất quán giữa diagram & mô tả, logic nghiệp vụ

---

## I. TỔNG QUAN ĐÁNH GIÁ

| Hạng mục | Đánh giá | Mức độ |
|---|---|---|
| Format cấu trúc tài liệu | Không đồng nhất — nhiều lỗi hệ thống | 🔴 Cao |
| Nhất quán diagram ↔ text | Thiếu nhiều diagram, có sai lệch mô tả | 🔴 Cao |
| Logic nghiệp vụ | Có lỗi logic, thiếu edge case, mã tham chiếu sai | 🟡 Trung bình–Cao |
| Chất lượng bảng mô tả màn hình | Không đồng nhất STT, thiếu Mapping DB/API | 🟡 Trung bình |
| Ngôn ngữ & thuật ngữ | Trộn Anh–Việt chưa nhất quán, có gạch ngang text bị sót | 🟡 Trung bình |

---

## II. VẤN ĐỀ FORMAT & CẤU TRÚC

### II.1 Đánh số thứ tự đề mục không nhất quán

**Vấn đề:**  
Tài liệu sử dụng hỗn hợp hai kiểu đánh số đề mục: kiểu số (1. 2. 3…) và kiểu chữ số phân cấp (1.1, 1.2…). Nhiều section cùng cấp nhưng lại dùng cấp đánh số khác nhau.

**Ví dụ cụ thể:**
- Mục **"DANH MỤC DÙNG CHUNG"** (line 2512) được đánh số `10. #` — nhưng mục **"QUẢN LÝ DANH MỤC ULD"** (line 4067) lại dùng `11. ##` (hai ký hiệu `#` cấp module con) → không thống nhất về cấp độ heading.
- Mục **"QUẢN LÝ DANH MỤC AC SUBTYPE"** (line 4801) dùng `14. ##` nhưng ngay trên nó là `12. ##` cho QUẢN LÝ DANH MỤC CHẶNG BAY → **nhảy từ 12 lên 14, bỏ mất số 13**.
- Nhiều sub-section dùng cú pháp `1.` thay vì `###` gây mất nhất quán với cấu trúc Markdown heading.

**Hướng sửa:**
- Thống nhất dùng Heading Markdown (`#`, `##`, `###`, `####`) cho toàn bộ tài liệu.
- Số thứ tự phần (1, 2, 3…) chỉ dùng trong TOC; không nhúng vào heading body.
- Đánh lại index module: kiểm tra xem có module số 13 bị bỏ qua không — nếu có thì bổ sung, nếu không thì điều chỉnh lại số.

---

### II.2 Caption sơ đồ đánh số lộn xộn

**Vấn đề:**  
Caption sơ đồ dùng số tự do (1, 2, 3… đến 100+) không reset theo từng chức năng, nhưng lại có hiện tượng **nhảy số** hoặc **lặp số** trong thân tài liệu.

**Ví dụ:**
- Line 2425: *"27. Sơ đồ luồng hệ thống"* (Caption Add/Edit Email)
- Line 2529: *"32. Sơ đồ luồng nghiệp vụ"* (Danh sách Phi công)  
- Line 4285: *"100. Sơ đồ luồng xem chi tiết ULD"*

Số caption tăng liên tục trong toàn bộ tài liệu — điều này gây khó khăn khi đọc vì không biết caption 27 thuộc chức năng nào nếu không đọc từ đầu.

**Hướng sửa:**
- Reset số caption theo module hoặc chapter.  
  Ví dụ: Hình 10.1, Hình 10.2 (cho module 10), Hình 11.1, 11.2 (cho module 11).
- Hoặc dùng caption kiểu: *Hình X — Tên chức năng* để dễ tra cứu.

---

### II.3 Bảng mô tả màn hình: STT không đồng nhất

**Vấn đề phổ biến nhất trong tài liệu.** Một số bảng điền số STT (1, 2, 3…), nhiều bảng để trống cột STT; thậm chí cùng một chức năng — phần tìm kiếm có STT, phần danh sách không có.

**Ví dụ:**
- Line 3210–3219: Bảng "Xem chi tiết Carrier" — STT cột có giá trị: `33`, `2`, `3` → **lệch thứ tự, bắt đầu từ 33 thay vì 1**.
- Line 3591: Bảng "Danh sách FIR" — STT điền `18` ở dòng đầu tiên.
- Hầu hết các bảng từ Module 10 trở đi (Phi công, FIR, Quốc gia...) **để trống cột STT** trong khi các bảng trước (Airport, Email) lại có STT.

**Hướng sửa:**
- Chọn một trong hai: **luôn có STT** hoặc **không có STT** — áp dụng nhất quán toàn tài liệu.
- Khuyến nghị: Dùng STT (bắt đầu từ 1) trong tất cả các bảng mô tả màn hình.
- Sửa lại bảng "Xem chi tiết Carrier" — reset STT từ 1.

---

### II.4 Tiêu đề bảng chức năng không thống nhất

**Vấn đề:** Bảng mô tả "Tên chức năng" đầu mỗi use case có kiểu format khác nhau:

- Một số bảng dùng **Bold** cho label: `| **Mục đích** |`
- Một số bảng không Bold: `| Mục đích |`
- Một số bảng thiếu trường "Tên chức năng" ở header.

**Ví dụ:**
- Line 4807 (AC Subtype): `| Tên chức năng | Xem danh sách AC Subtype |` — không có `:`
- Line 4858 (Add/Edit AC Subtype): `| Tên chức năng | Thêm mới / Sửa AC Subtype |` và `| **Mục đích** |` — đột ngột dùng Bold
- So sánh với line 2414: `| Tên chức năng: Add/ Edit Email | |` — có dấu `:` và tên chức năng cùng cell header.

**Hướng sửa:** Chọn một template chuẩn và áp dụng toàn bộ. Đề xuất:

```
| Tên chức năng: [Tên chức năng] |  |
| :---- | :---- |
| **Mục đích** | ... |
| **Trigger** | ... |
| **Tiền điều kiện** | ... |
| **Hậu điều kiện** | ... |
```

---

### II.5 Heading phân cấp không đều

**Vấn đề:** Module "Quản lý danh mục FIR" (line 3556) có cấu trúc heading sai:
- Line 3567: `2. #### ***Sơ đồ luồng hệ thống***` — dùng `####` (level 4) ngay sau `### **Xem danh sách FIR**` (level 3) mà **bỏ qua level 3** của sub-section luồng, khiến "Sơ đồ luồng" ngang cấp "Mô tả chi tiết màn hình".
- So sánh với Module Email (line 2421): dùng đúng cú pháp `#### ***Sơ đồ luồng hệ thống***` nhưng có indent prefix.

**Hướng sửa:** Đảm bảo mỗi chức năng đều có đủ 4 sub-section ở cùng cấp heading:
1. Sơ đồ luồng hệ thống
2. Mô tả luồng xử lý
3. Màn hình chức năng
4. Mô tả chi tiết màn hình

---

### II.6 Dòng trống `## ` và `### ` thừa

**Vấn đề:** Rải rác trong tài liệu có các dòng `## ` hoặc `### ` không có nội dung (chỉ có ký tự `#` và khoảng trắng).

**Ví dụ:**
- Line 3510: `## ` — dòng trống giữa Xóa Quốc gia và Xem chi tiết Quốc gia
- Line 4018: `## ` — giữa Xóa ULD Type và Xem chi tiết ULD Type
- Line 4226: `### ` — giữa Sửa ULD và Xóa ULD
- Line 4270, 4318, 4379, 4408: tương tự

**Hướng sửa:** Xóa toàn bộ các dòng heading trống này.

---

## III. VẤN ĐỀ DIAGRAM VS MÔ TẢ VĂN BẢN

### III.1 Sơ đồ luồng thiếu / chỉ là placeholder

**Vấn đề nghiêm trọng:** Toàn bộ sơ đồ luồng trong tài liệu Markdown đều ở dạng placeholder `![][imageXXX]`. Khi chuyển sang .docx, nếu các image không được embed đúng cách thì sơ đồ sẽ mất. **Tài liệu không thể "gửi đi" độc lập ở dạng Markdown** vì không kèm file hình.

> [!WARNING]
> Tài liệu này **không self-contained** ở định dạng hiện tại. Cần đảm bảo file .docx gốc có đầy đủ sơ đồ trước khi gửi khách hàng.

---

### III.2 Danh sách phi công — luồng bước thiếu số (line 2533–2537)

**Vấn đề:** Bảng "Mô tả luồng xử lý" của chức năng "Danh sách phi công" (line 2533):

```
| Bước | Chi tiết |
| :---- | :---- |
|  | Truy cập web FIMS => mở đến module Danh mục/Danh mục Phi công |
|  | Hệ thống call API xuống BE lấy danh sách Phi công |
|  | Hiển thị danh sách Phi công trên giao diện người dùng |
```

→ **Cột "Bước" để trống toàn bộ** — không có số bước (1, 2, 3). Trái với các chức năng khác đều có số bước.

**Tương tự** tại "Xem chi tiết Phi công" (line 2606–2612): Cột "Bước" cũng để trống.

**Hướng sửa:** Điền số bước 1, 2, 3… vào cột Bước.

---

### III.3 Mô tả luồng Xem danh sách Phi công không khớp sơ đồ

**Vấn đề:** Mô tả luồng (line 2533–2537) chỉ có 3 bước đơn giản (truy cập → call API → hiển thị). Tuy nhiên, theo phần mô tả chi tiết màn hình (line 2570), khi user click vào một bản ghi → mở màn hình "Xem chi tiết Phi công". Luồng này **chưa được phản ánh trong bảng mô tả bước**.

Ngược lại, "Xem danh sách FIR" (line 3573–3579) có đủ 3 bước nhưng không có bước điều hướng detail. → **Không nhất quán** giữa các module về mức độ detail của bảng luồng.

**Hướng sửa:** Thêm bước 4 vào Danh sách Phi công: "User click vào 1 bản ghi → mở màn hình Xem chi tiết Phi công". Hoặc thống nhất toàn tài liệu chỉ mô tả luồng chính (không đưa navigation vào bảng mô tả luồng xem danh sách).

---

### III.4 Luồng Xem danh sách Chặng bay (line 4342–4346) mô tả quá nhiều nhánh trong bảng "Danh sách"

**Vấn đề:** Bảng mô tả luồng xem danh sách chặng bay (line 4342–4346) bao gồm cả luồng Thêm mới, Sửa, Xóa:

```
| 3 | User click Thêm mới => Hệ thống hiển thị màn hình Thêm mới Chặng bay |
| 4 | User click icon "Sửa" => Hệ thống hiển thị màn hình Sửa Chặng bay |
| 5 | User click icon "Xóa" => Hệ thống hiển thị màn hình Xóa Chặng bay |
```

Đây **không phải là luồng của "Xem danh sách"** mà là tổng hợp tất cả action. Các chức năng Thêm/Sửa/Xóa đã có mục riêng. → Gây nhầm lẫn và không nhất quán với các module khác (Phi công, FIR… chỉ mô tả luồng xem).

**Hướng sửa:** Bảng mô tả luồng "Xem danh sách" chỉ mô tả luồng xem. Bỏ bước 3, 4, 5 khỏi bảng này (đã có mục Thêm/Sửa/Xóa riêng).

---

### III.5 Xem chi tiết Quốc gia — section header bị sai cấp (line 3512)

**Vấn đề:** Sau phần Xóa Quốc gia, có một dòng `## ` trống rồi mới đến:
```
       5. ### **Xem chi tiết Quốc gia** {#xem-chi-tiết-quốc-gia}
```
→ "Xem chi tiết Quốc gia" là mục thứ 5 của "Quản lý danh mục Quốc gia" nhưng lại bị đặt sau dòng `## ` trống → về mặt cấu trúc nó có thể bị hiểu là thuộc về section cấp 2 khác, không phải sub-section của Quốc gia.

---

## IV. VẤN ĐỀ LOGIC NGHIỆP VỤ

### IV.1 Trường Password hiển thị trong Xem danh sách Email (line 2404) — vấn đề bảo mật

**Vấn đề:** Bảng "Mô tả chi tiết màn hình" (line 2403–2410) của chức năng **Xem chi tiết Email** có dòng:

```
| | Password | Textview | password | Hiển thị thông tin [password] theo dữ liệu API trả về dưới dạng mã hóa |
```

→ **Hiển thị password (dù mã hóa) lên màn hình Xem chi tiết là rủi ro bảo mật nghiêm trọng.** Không có hệ thống chuyên nghiệp nào hiển thị password ngay cả khi đã hash/encrypt lên UI.

**Hướng sửa:**
- Bỏ hoàn toàn trường Password khỏi màn hình Xem chi tiết.
- Nếu cần "đổi mật khẩu email", nên thiết kế luồng riêng (Reset/Change password), không hiển thị trong view.
- Cập nhật lại luồng Add/Edit Email (line 2455): xem xét có cần trường Password ở màn hình Edit hay không — thông thường chỉ cần khi Add mới; Edit chỉ cho phép reset.

---

### IV.2 Typo trong regex ULD Code (line 4163) — sai format IATA

**Vấn đề:**

```
Regex chuẩn IATA: ^[A-Z]{3}[0-9]{4,5}[A-Z]{2,3}$
```

Theo chuẩn IATA ULD code thực tế: `PMC12345AC` = 3 chữ cái (type) + 4-5 số (số serial) + 2 chữ cái (airline code). Regex này đúng về cú pháp nhưng cần kiểm tra lại với nghiệp vụ thực tế của VNA. Ngoài ra thông báo lỗi:

```
"ULD Code is invalid"
```

không rõ ràng. Nên hiển thị format mẫu hợp lệ để user biết nhập đúng.

**Hướng sửa:**
- Xác nhận lại regex với nghiệp vụ kho ULD của VNA.
- Sửa thông báo lỗi: `"ULD Code không đúng định dạng IATA (Ví dụ: PMC12345AC)"`.

---

### IV.3 Xóa Carrier — điều kiện kiểm tra mâu thuẫn (line 3244)

**Vấn đề:** Bảng mô tả Bước 5 (line 3244):

```
| Bước 5 | Hệ thống kiểm tra dữ liệu, nếu:
  Dữ liệu không hợp lệ: chuyển sang bước 6
  Dữ liệu xóa hợp lệ: Carrier chưa được gắn vào bất kỳ user nào
  Dữ liệu không hợp lệ: Carrier đã được gán thông tin
  Ngược lại: chuyển sang bước 7 |
```

→ Logic **liệt kê hai điều kiện "Dữ liệu không hợp lệ"** (trước và sau điều kiện hợp lệ) → mô tả lộn xộn, không rõ cây logic.

**Hướng sửa:** Viết lại rõ ràng:
```
Hệ thống kiểm tra:
- Nếu lý do trống → Bước 6 (IM)
- Nếu Carrier đã gán với user/FON/E-checklist → Bước 6 (toast lỗi)
- Ngược lại (hợp lệ) → Bước 7
```

---

### IV.4 Xóa ULD (line 4265) — Nội dung title popup sai tham chiếu

**Vấn đề:**

```
Text "Are you sure you want to remove the uld: [uldtypeCode]?"
```

→ Dùng biến `[uldtypeCode]` nhưng đây là popup **Xóa ULD** (không phải ULD Type). Biến đúng phải là `[uldCode]`.

So sánh với popup Xóa ULD Type (line 4013):
```
Text "Are you sure you want to remove the uld type: [uldtypeCode]?"
```

→ Đã copy-paste nhưng quên đổi biến.

**Hướng sửa:** Sửa line 4265 thành: `"Are you sure you want to remove the ULD: [uldCode]?"`

---

### IV.5 AC Subtype Name — Maxlength không đúng (line 4898)

**Vấn đề:** Trường `AC Subtype name` định nghĩa:
- Textbox, **Maxlength 10 ký tự**
- Placeholder "Enter AC Subtype name"

→ **10 ký tự là quá ngắn** cho trường "tên" (AC Subtype Name). Rất nhiều tên loại tàu bay có thể dài hơn (ví dụ: "A320-200neo"). Thêm nữa, Maxlength của trường **Search AC Subtype Name** cũng ghi là `Textbox [0;100]` nhưng mô tả lại ghi `Maxlength 20 ký tự` (line 4839) → mâu thuẫn.

**Hướng sửa:**
- Xem xét lại Maxlength cho `AC Subtype name`: khuyến nghị 100 ký tự.
- Sửa mô tả search `AC Subtype Name` (line 4839): đổi `Maxlength 20` thành `Maxlength 100` cho nhất quán với `[0;100]`.

---

### IV.6 AC Subtype Code — "Không cho phép chỉnh sửa" ở TH Thêm mới? (line 4897)

**Vấn đề:**

```
AC Subtype code | Textbox (Thêm mới) Textview (Sửa)
...
Chặn trùng dữ liệu
Không cho phép chỉnh sửa
```

→ Mô tả "Không cho phép chỉnh sửa" xuất hiện ở trong block validate chung nhưng ngữ cảnh là TH **Thêm mới**. Đây rõ ràng là rule cho TH **Sửa** (AC Subtype code không được đổi sau khi tạo). Nếu áp dụng cho TH Thêm mới thì user không thể nhập gì.

**Hướng sửa:** Chuyển rule "Không cho phép chỉnh sửa" vào block mô tả riêng cho TH **Sửa**, hoặc ghi rõ: "TH Sửa: AC Subtype code **hiển thị dạng Textview, không cho phép chỉnh sửa**".

---

### IV.7 Mã thông báo lỗi tham chiếu bị sai (line 3492)

**Vấn đề:** Bước 6 luồng Xóa Quốc gia (line 3492):

```
TH chưa nhập lý do => hiện IM [VL007]
```

→ `VL007` = `<Field name> already exists. Please check again.` → **Không phải thông báo cho trường hợp "chưa nhập lý do"**.  
Thông báo đúng phải là `VL004` = `The <field name> field must not be empty.`

Tương tự tại Xóa ULD Type (line 4000) cũng dùng VL007 cho TH "chưa nhập lý do" → sai.

**Hướng sửa:** Thay `VL007` bằng `VL004` tại tất cả các chỗ mô tả "chưa nhập lý do xóa".

> [!CAUTION]
> Lỗi tham chiếu mã thông báo (`VL007` thay vì `VL004`) xuất hiện ít nhất tại:
> - Xóa Quốc gia (line 3492)
> - Xóa ULD Type (line 4000)
> - Cần check thêm toàn bộ các luồng Xóa khác.

---

### IV.8 Màn hình Sửa ULD — Current Location không cho sửa (line 4215)

**Vấn đề:**

```
| Current Location | TextBox [0;255] | | Hiển thị [Current Location] theo dữ liệu API trả về
  Mặc định: Không cho phép sửa |
```

→ Nhưng ở màn hình **Thêm mới ULD** (line 4165), Current Location là bắt buộc nhập và cho phép sửa. Nếu khi Edit không cho phép sửa Current Location, thì khi ULD di chuyển đến vị trí khác **không có cách nào cập nhật** vị trí hiện tại.

Điều này có thể là ý định thiết kế (Current Location chỉ cập nhật qua hệ thống khác), nhưng cần **ghi chú rõ lý do** trong tài liệu.

**Hướng sửa:** Thêm ghi chú: "Current Location được cập nhật tự động qua hệ thống [tên hệ thống], không cho phép chỉnh sửa thủ công." Hoặc nếu cho phép sửa thủ công — sửa lại thành Textbox bình thường.

---

### IV.9 Chặng bay — Bảng mô tả màn hình dư cột (line 4354–4377)

**Vấn đề nghiêm trọng về format:**

```
| STT |  |  |  |  | Tên |  |  |  |  | Kiểu dữ liệu  |  |  |  |  | Mapping DB/API | ... |
| ----- | ----- | ----- | ----- | ----- | :---: | :---- | ...
```

→ Bảng mô tả màn hình "Xem danh sách chặng bay" có **30 cột** (5 cột trống bên cạnh mỗi cột dữ liệu chính). Đây rõ ràng là lỗi format khi xuất từ Word/Google Docs sang Markdown — các ô merge bị split thành nhiều cột rỗng.

Tất cả dữ liệu dòng cũng có pattern tương tự:
```
| 1 |  |  |  |  | | Departure Airport  |  |  |  |  |  | Combobox |...
```

**Hướng sửa:**
- Sửa lại bảng về 5 cột chuẩn: STT | Tên | Kiểu dữ liệu | Mapping DB/API | Mô tả
- Đây là vấn đề cần fix trên file gốc (Word/Google Docs) trước khi export.

---

### IV.10 Quy tắc Email Set Default — thiếu xử lý khi deactivate email mặc định (line 2460)

**Vấn đề:** Phần mô tả button Save (Email Add/Edit):

```
Chỉ tồn tại duy nhất 1 bản ghi email ở trạng thái Active được đặt làm mặc định
=> Khi add/edit 1 bản ghi đã tồn tại email ở trạng thái active (mặc định)
=> click Save hiển thị thông báo lỗi: [TB024]
```

**Edge case thiếu:** Nếu user **bỏ check "Set default"** trên bản ghi đang là default (chuyển từ checked → unchecked) → hệ thống xử lý thế nào? Hệ thống không có email mặc định nữa → ảnh hưởng gì đến tính năng gửi mail?

**Hướng sửa:** Bổ sung rule: "Nếu bỏ chọn Default trên bản ghi đang là Default — hệ thống cảnh báo: 'Hệ thống sẽ không có email mặc định sau khi lưu. Bạn có chắc chắn?' hoặc không cho phép bỏ Default nếu chưa có email khác được set Default."

---

### IV.11 Đồng bộ AVES — thiếu xử lý timeout/lỗi API (line 2553)

**Vấn đề:** Chức năng đồng bộ AVES cho Danh sách Phi công mô tả rất chi tiết về mapping dữ liệu nhưng **không mô tả xử lý lỗi** khi:
- API AVES timeout
- AVES trả về lỗi
- Network failure trong quá trình đồng bộ

Chỉ có mô tả khi thành công. So sánh với button "Sync AVES" trong màn hình chi tiết Phi công (line 2625) cũng tương tự.

**Hướng sửa:** Bổ sung: "Nếu API AVES trả về lỗi/timeout → hiển thị toast: [TB021] hoặc message lỗi cụ thể. Không cập nhật dữ liệu."

---

### IV.12 Cơ chế tự động đồng bộ AVES — thiếu spec retry (line 2553)

**Vấn đề:**

```
Cơ chế tự động: Định kỳ 1 ngày/ lần => hệ thống call API đồng bộ danh sách phi công từ hệ thống AVES
```

Thiếu đặc tả:
- Thời điểm chạy (giờ nào?)
- Cơ chế retry khi fail
- Log kết quả ở đâu?
- Notify admin khi fail?

**Hướng sửa:** Bổ sung non-functional requirement cho batch job này, ít nhất: "Job chạy lúc 02:00 SA hàng ngày. Nếu fail → retry 3 lần, mỗi lần cách nhau 30 phút. Ghi log kết quả vào bảng sync_log."

---

### IV.13 Trường Status trong Danh sách Quốc gia — giá trị tag mâu thuẫn (line 3371)

**Vấn đề:**

```
Status=Active: Tag màu xanh lá
Status=Is active: Tag màu xám
```

→ `"Is active"` không phải một giá trị trạng thái hợp lệ — có thể là lỗi copy-paste, đúng ra phải là `"Inactive"`.

So sánh với tất cả các module khác đều dùng `Active/Inactive`.

**Hướng sửa:** Sửa `"Status=Is active"` thành `"Status=Inactive"`.

---

### IV.14 Search field "Người cập nhật trạng thái" trong Lịch sử Email — kiểu dữ liệu không nhất quán (line 2503)

**Vấn đề:**

```
| Người cập nhật trạng thái | Dropdown list | updated_by/updateBy | Tìm kiếm gần đúng... Maxlength 255 ký tự |
```

→ Kiểu dữ liệu là `Dropdown list` nhưng mô tả lại nói "Tìm kiếm gần đúng" và "Maxlength 255 ký tự" — điều này mâu thuẫn vì Dropdown list không có Maxlength, không tìm kiếm gần đúng.

So sánh với màn hình History Carrier (line 3307): cùng field "Người cập nhật" nhưng dùng `Combobox` (có tìm kiếm bằng gõ phím) — nhất quán hơn.

**Hướng sửa:** Đổi kiểu dữ liệu sang `Combobox` (như Carrier History) hoặc nếu là Dropdown đơn thuần thì bỏ phần mô tả Maxlength và tìm kiếm gần đúng.

---

## V. VẤN ĐỀ NGÔN NGỮ & THUẬT NGỮ

### V.1 Text bị gạch ngang (strikethrough) còn sót lại

**Vấn đề:** Rất nhiều trường trong bảng mô tả màn hình có nội dung bị gạch ngang (`~~text~~`) — thể hiện các trường/tính năng đã bị loại bỏ hoặc thay thế — nhưng **vẫn còn trong tài liệu**. Nếu đây là tài liệu gửi khách hàng, các text bị gạch ngang tạo ra nhiễu thông tin.

**Ví dụ nổi bật:**
- Line 2551: `~~Danh sách phi công~~ List of Pilot`
- Line 2553: Cả đoạn mô tả Đồng bộ AVES dài ~10 dòng bị gạch ngang
- Line 2555–2566: Hàng loạt cột tìm kiếm Phi công bị gạch ngang (Ngày sinh, Giới tính, Mã HRMS, Số thẻ ngành, Carrier, Main base, Đội tàu bay)
- Line 2572–2573: Một phần mô tả Status, Pilot Code bị gạch ngang
- Line 3304–3307: Cột History Carrier bị gạch ngang ở tên trường

**Hướng sửa:**
- **Xóa hoàn toàn** các đoạn bị gạch ngang khỏi phiên bản gửi khách hàng. Nếu cần giữ lịch sử thay đổi, dùng Git hoặc version track riêng.
- Hoặc nếu cố ý giữ lại (để team dev biết các field đã bỏ), cần **ghi rõ quy ước** ở đầu tài liệu.

---

### V.2 Trộn Anh-Việt không nhất quán trong tên trường

**Vấn đề:** Một số trường dùng tên tiếng Anh, một số dùng tiếng Việt, một số trộn cả hai.

**Ví dụ:**
- `~~Mã phi công~~ Pilot Code` → đã có gạch ngang, nhưng pattern này lặp lại nhiều
- `~~Trạng thái hoạt động~~ Status`
- Cột History Email: tên trường "Thời gian cập nhật" (line 2500) nhưng cột tương tự trong History Carrier lại là "Update Time" (line 3310)
- Module FIR: tên file export `FIMS_fir_ddmmyyhhmm` (lowercase) vs các module khác có thể uppercase

**Hướng sửa:** Chọn **một ngôn ngữ chuẩn cho tên trường** (khuyến nghị: tiếng Anh cho toàn bộ) và áp dụng nhất quán. Nếu cần song ngữ, dùng format: `Tên Việt (English Name)`.

---

### V.3 Typo "viettnamairlines.com" (line 2454)

**Vấn đề:**

```
Dữ liệu nhập không có domain mail nội bộ @viettnamairlines.com, sai ký tự
```

→ **"viettnamairlines"** (2 chữ t) thay vì **"vietnamairlines"**.

**Hướng sửa:** Sửa thành `@vietnamairlines.com`.

---

### V.4 Title popup Carrier Detail — "Tittle" viết sai (line 3213)

**Vấn đề:**

```
| 33 | Tittle | Textview | | Hiển thị tittle: Carrier Information |
```

→ "Tittle" viết sai, đúng ra là "Title". Lỗi này lặp lại 2 lần trong cùng dòng.

**Hướng sửa:** Sửa "Tittle" → "Title".

---

### V.5 Mô tả link Google Sheets còn nguyên URL trong ô tìm kiếm FIR (line 3596)

**Vấn đề:**

```
| 5 | **Tìm kiếm[https://docs.google.com/spreadsheets/d/...]** |
```

→ URL Google Sheets xuất hiện trong tiêu đề cột "Tìm kiếm" của bảng FIR — đây rõ ràng là lỗi format khi copy từ Google Docs, link bị dính vào text heading của ô.

**Hướng sửa:** Xóa URL khỏi tiêu đề ô. Link nên đặt ở mô tả cột "Export" nếu cần tham chiếu template.

---

## VI. CÁC VẤN ĐỀ THIẾU ĐẶC TẢ (MISSING SPECS)

### VI.1 Không có đặc tả màn hình "Lịch sử" cho nhiều module Danh mục

Nhiều module trong phần **DANH MỤC DÙNG CHUNG** (Phi công, FIR, Quốc gia, Chặng bay, AC Subtype) **không có phần "Xem lịch sử"** trong khi các module cùng cấp khác (Email, Carrier) có đầy đủ. Cần xác nhận: đây là tính năng chưa scope hay bị bỏ sót?

### VI.2 Module Chặng bay thiếu chức năng Xóa

Mục "Quản lý danh mục Chặng bay" (line 4320) chỉ có:
- Xem danh sách
- Thêm mới/Sửa

Nhưng mô tả tổng quan (line 4322): *"Module cho phép thực hiện đầy đủ: Xem danh sách, Tìm kiếm/Lọc, Xuất Excel, Thêm mới, Sửa, Xóa, Xem chi tiết và Xem lịch sử."*

→ **Xóa, Xem chi tiết, Xem lịch sử chưa có spec**.

### VI.3 Module AC Subtype thiếu Xem chi tiết và Lịch sử

Tương tự chặng bay — mô tả tổng quan (line 4803) đề cập đầy đủ các chức năng nhưng trong body chỉ có: Xem danh sách, Thêm mới/Sửa, Xóa → thiếu **Xem chi tiết**.

### VI.4 Thiếu đặc tả xử lý concurrency

Tài liệu không đề cập xử lý khi **2 user cùng sửa một bản ghi** (optimistic locking, last-write-wins, conflict detection). Cần bổ sung ít nhất một quy tắc chung ở phần "Thiết kế dùng chung".

### VI.5 Thiếu mô tả Permission cho mỗi chức năng ở phần chi tiết

Phần "Tiền điều kiện" chỉ ghi chung chung "được phân quyền Add/Edit/Delete". Nhưng không có bảng mapping **quyền cụ thể** ↔ **role nào** được làm gì trên từng module. Cần một ma trận phân quyền (RBAC matrix) ở phần đầu hoặc phụ lục.

---

## VII. TỔNG HỢP CÁC HÀNH ĐỘNG CẦN THỰC HIỆN

### Ưu tiên Cao (Must Fix trước khi gửi)

| # | Vị trí | Vấn đề | Hành động |
|---|---|---|---|
| 1 | Line 2404 | Password hiển thị trên màn hình View | Xóa trường Password khỏi màn hình Xem chi tiết Email |
| 2 | Toàn bộ | Text gạch ngang còn sót | Xóa hết strikethrough text khỏi phiên bản gửi khách |
| 3 | Line 4265 | Title popup Xóa ULD dùng sai biến | Sửa `[uldtypeCode]` → `[uldCode]` |
| 4 | Line 3492, 4000 | Mã lỗi VL007 sai cho "chưa nhập lý do" | Sửa thành VL004 |
| 5 | Line 3371 | Status=`Is active` sai | Sửa thành `Inactive` |
| 6 | Line 4354–4377 | Bảng Chặng bay có 30 cột thừa | Sửa lại về 5 cột chuẩn |
| 7 | Line 2454 | Typo `viettnamairlines.com` | Sửa → `vietnamairlines.com` |
| 8 | Line 3213 | Typo `Tittle` | Sửa → `Title` |
| 9 | Toàn bộ | Module thiếu số 13 trong index | Kiểm tra và bổ sung/điều chỉnh |
| 10 | Line 3596 | URL Google Sheets dính vào header bảng FIR | Xóa URL khỏi tiêu đề |

### Ưu tiên Trung bình (Should Fix)

| # | Vị trí | Vấn đề | Hành động |
|---|---|---|---|
| 11 | Toàn bộ | STT bảng mô tả màn hình không đồng nhất | Chuẩn hóa theo một template |
| 12 | Toàn bộ | Caption sơ đồ đánh số lộn xộn | Reset theo module |
| 13 | Line 3244 | Logic Xóa Carrier mâu thuẫn | Viết lại rõ cây quyết định |
| 14 | Line 4898 | AC Subtype Name Maxlength=10 quá ngắn | Đổi thành 100 |
| 15 | Line 4897 | "Không cho phép chỉnh sửa" đặt sai vị trí | Chuyển vào block TH Sửa |
| 16 | Line 2460 | Thiếu edge case bỏ chọn Default Email | Bổ sung rule xử lý |
| 17 | Line 2533 | Bảng luồng Phi công thiếu số bước | Điền số 1, 2, 3 |
| 18 | Line 4215 | Current Location không sửa được trong Edit ULD | Thêm ghi chú lý do |
| 19 | Line 2503 | Kiểu dữ liệu Dropdown vs Combobox mâu thuẫn | Thống nhất Combobox |

### Ưu tiên Thấp (Nice to Have)

| # | Vị trí | Vấn đề | Hành động |
|---|---|---|---|
| 20 | Toàn bộ | Trộn Anh-Việt tên trường | Chọn một ngôn ngữ chuẩn |
| 21 | Line 2553 | Thiếu xử lý lỗi API AVES | Bổ sung error handling |
| 22 | Line 2553 | Thiếu spec batch job tự động AVES | Bổ sung non-functional req |
| 23 | Toàn bộ | Dòng heading trống `## `, `### ` | Xóa |
| 24 | Toàn bộ | Thiếu chức năng Xóa/Xem chi tiết/Lịch sử một số module | Xác nhận scope và bổ sung |
| 25 | Phụ lục | Thiếu RBAC matrix | Bổ sung phụ lục phân quyền |
| 26 | Phần dùng chung | Thiếu xử lý concurrency | Bổ sung quy tắc chung |

---

## VIII. KẾT LUẬN

Tài liệu SRS đã có nền tảng tốt về cấu trúc và mức độ chi tiết. Tuy nhiên **chưa đạt chuẩn gửi khách hàng** do còn nhiều vấn đề cần fix, đặc biệt:

1. **Vấn đề bảo mật**: Hiển thị Password trong màn hình View.
2. **Lỗi tham chiếu mã thông báo** (VL007 vs VL004).
3. **Text gạch ngang còn sót** làm tài liệu trông chưa "clean".
4. **Bảng Chặng bay** bị lỗi format nghiêm trọng (30 cột thừa).
5. **Các chức năng chưa spec** (Xóa/Chi tiết/Lịch sử của Chặng bay, AC Subtype).

Sau khi fix các vấn đề **Ưu tiên Cao**, tài liệu có thể gửi đi với kèm ghi chú các phần đang trong quá trình bổ sung.
