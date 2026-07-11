---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "Việt Anh (tổng hợp từ transcript ASR)"
version: "0.1"
date: "2026-06-26"
status: "Draft"
document_type: "Meeting Minutes"
source_file: "ba/workspace/input/domain-knowledge/TOSS_BA_Meeting_260626.txt"
mockup_refs:
  - "C:/Users/anhnlv/Downloads/dsp_monitoring_poc_mockup_v1.html"
  - "C:/Users/anhnlv/Downloads/dsp_flight_plans_poc_mockup_v2.html"
  - "C:/Users/anhnlv/Downloads/flc_documents_poc_mockup_v1.html"
---

> **⚠ Cảnh báo chất lượng ASR:** Transcript được tổng hợp từ bản ghi âm tự động (ASR) — chất lượng thấp, nhiều lỗi từ ngữ chuyên ngành và lặp từ máy móc. Mọi nội dung đã được đối chiếu với 3 file mockup POC và domain-knowledge TOSS. Những mục đánh dấu `[cần xác nhận]` cần người dự họp xác nhận lại trước khi đưa vào tài liệu chính thức.

---

# BIÊN BẢN HỌP — Buổi làm việc Nội bộ BA/DEV
## TOSS — Rà soát Yêu cầu Màn hình DSP Monitoring, FLC Document & Quản lý Tàu bay

| Thông tin | Chi tiết |
|---|---|
| **Ngày họp** | 26/06/2026 (sáng) |
| **Hình thức** | Trực tiếp `[cần xác nhận: địa điểm]` |
| **Chủ trì** | `[cần xác nhận]` (BA Lead — người trình bày nghiệp vụ) |
| **Thành viên** | Việt Anh, Phát, Trần Phương, Tuấn Anh (DEV) `[cần xác nhận danh sách đầy đủ]` |
| **Mục tiêu** | Rà soát chi tiết các màn hình DSP Dispatch Monitoring, FLC Document, FLC Fill Order, và Quản lý tàu bay; thống nhất logic nghiệp vụ các cột trên bảng; phân công đầu việc tiếp theo |
| **Tài liệu tham chiếu** | 3 file POC mockup HTML (dsp_monitoring_poc_mockup_v1, dsp_flight_plans_poc_mockup_v2, flc_documents_poc_mockup_v1) |

---

## 1. Nội dung chính buổi họp

### 1.1 Màn hình DSP Flight Monitoring
*(Nguồn: transcript [00:02:23–01:00:24]; Mockup: `dsp_monitoring_poc_mockup_v1.html`)*

#### 1.1.1 Tổng quan giao diện và UX

- **Số dòng hiển thị:** bảng hiển thị ~20–30 dòng chuyến bay. Khoảng **10 dòng ở giữa** luôn là các chuyến bay **tại thời điểm hiện tại** (gần với giờ hiện tại).
- **Auto-scroll theo thời gian:** Timeline cuộn tự động — chuyến bay mới dần dần "trôi" vào vùng giữa màn hình theo thời thực. Người dùng không phải cuộn tay để tìm chuyến đang khai thác. Ví dụ: 10h hiện tại → các chuyến ~10h ở giữa; chuyến 9h40–9h50 đã bay nằm phía trên; chuyến sắp bay nằm phía dưới. `[cần xác nhận: cơ chế kỹ thuật auto-scroll]`
- **Mục đích UX:** Dispatcher nhìn vào bảng thấy ngay chuyến đang khai thác có vấn đề gì (cảnh báo màu sắc), tổ lái nặng không, chuyến sắp bay cần focus cái gì.
- **Tùy chỉnh cột theo user:** Mỗi user được thêm/bớt/sắp xếp các cột động (trừ các cột cố định). Cấu hình được **lưu theo tài khoản** — đăng nhập lại vẫn giữ nguyên cấu hình.
- **Dữ liệu cập nhật:** Đồng bộ liên tục từ Netline theo ETD, phạm vi: ETD + 24h trước & 20h sau `[cần xác nhận: cụm từ ASR "ETD cộng chữ 24 tiếng cộng chữ 20 tiếng"]`.

#### 1.1.2 Logic màu sắc chung (áp dụng cho tất cả cột cảnh báo)

| Màu / Icon | Ý nghĩa |
|---|---|
| **Gạch ngang (—)** | Bình thường — chưa đến thời điểm cần kiểm tra, hoặc chưa có dữ liệu liên quan |
| **Vàng (⚠)** | Cảnh báo — cần chú ý (soft threshold) |
| **Đỏ nhấp nháy (✗)** | Nguy hiểm — cần hành động ngay (hard threshold) |
| **Tích xanh (✓)** | Đã giải quyết — từng có vấn đề trước đó, nay đã ổn |

> **Lưu ý quan trọng (transcript [00:06:13–00:06:36]):** Khi cột đang đỏ/vàng → sau khi vấn đề được giải quyết → cột **không về gạch ngang** mà chuyển sang **tích xanh**. Tích xanh hàm ý "từng có vấn đề, đã xử lý xong". Chỉ các chuyến chưa bao giờ có vấn đề mới là gạch ngang.

#### 1.1.3 Chi tiết từng cột nghiệp vụ

**[COT-01] Số hiệu tàu bay (REG)**
*(Transcript [00:07:16–00:08:13])*
- **Hiển thị:** Bỏ tiền tố VN, chỉ hiển thị phần loại tàu + số đuôi (vd: A321 → hiển thị `A21`, SU → hiển thị `SU...`) `[cần xác nhận: quy tắc rút gọn cụ thể]`
- **Màu đỏ:** REG trong OFP (sau khi bóc tách) khác với REG trên lịch bay Netline
- **Màu trắng/không màu:** Chưa có OFP → chưa so sánh được
- **Màu xanh:** REG trong OFP khớp với REG trên Netline
- **Màu vàng:** OFP đã về và REG khớp NL, nhưng Dispatcher **chưa bấm Release OFP**
- **Hover chuột:** Hiển thị lịch sử thay đổi REG (lần thay đổi gần nhất, giá trị cũ → mới, thời điểm)
- **Cơ sở so sánh:** Lịch bay (Netline) ↔ OFP (Operational Flight Plan) bóc tách từ MO đẩy sang TOSS

**[COT-02] OFP Revision**
*(Transcript [00:26:27–00:31:38])*
- **Hiển thị:** Phiên bản OFP mới nhất
- **Màu xanh:** Revision cuối cùng đã được Dispatcher release (bấm nút Release)
- **Màu vàng:** Revision cuối cùng **chưa release**, nhưng đã có revision trước đó đã release
- **Màu đỏ:** Revision cuối cùng chưa release VÀ không có revision nào đã release trước đó
- **Cảnh báo theo ngưỡng thời gian (trường hợp chưa có OFP nào):**

| Loại chuyến | Ngưỡng vàng (báo cánh) | Ngưỡng đỏ (cảnh báo khẩn) |
|---|---|---|
| Quốc nội | ETD − 210 phút (3.5h) | ETD − 75 phút |
| Quốc tế | ETD − 270 phút (4.5h) | ETD − 95 phút |

- **Cảnh báo theo ngưỡng khi đã có OFP nhưng Dispatcher chưa release:**

| Loại chuyến | Ngưỡng nhấp nháy vàng | Ngưỡng nhấp nháy đỏ |
|---|---|---|
| Quốc nội | ETD − 75 → −60 phút | ETD − 60 phút trở lại |
| Quốc tế | ETD − 90 → −75 phút | ETD − 75 phút trở lại |

- **Phân loại quốc nội/quốc tế:** Dựa vào **danh mục chặng bay** trong database (gắn nhãn từng chặng là quốc nội hay quốc tế)

**[COT-03] Chức năng Dispatch Release OFP — MỚI, CHƯA CÓ TRONG MO**
*(Transcript [00:08:14–00:09:35])*
- **Hiện trạng MO:** Hiện chỉ có quy trình **Pilot Release** (PIC confirm fly release). Không có quy trình Dispatcher release.
- **Yêu cầu bổ sung cho TOSS:** Thêm chức năng **Release OFP** trong module Dispatch. Quy trình mới:
  1. Dispatcher soạn OFP, xuất phiên bản
  2. Dispatcher **bấm nút Release OFP** → trạng thái OFP chuyển sang "Released"
  3. Trên MO xuất hiện **thông báo** cập nhật trạng thái Release OFP
  4. Phi công chỉ được phép **Confirm Fly Release** sau khi Dispatcher đã Release OFP `[cần xác nhận quy trình nghiệp vụ]`

**[COT-04] Loại chuyến bay (Flight Type)**
*(Transcript [00:21:55–00:26:27])*
- **Các loại:** Thường (J — chở khách) / VIP / Ferry (chở hàng/không khách)
- **Lưu lịch sử thay đổi:** Hệ thống ghi lại mỗi lần loại chuyến thay đổi (vd: Thường→VIP, VIP→Thường, Thường→Ferry, Ferry→Thường) kèm thời điểm
- **Màu vàng:** ATC đã file + OFP đã có, nhưng Dispatcher **chưa bấm Release OFP**
- **Màu đỏ:** 2 trường hợp — Thường→Ferry và Thường→VIP `[cần xác nhận điều kiện cụ thể trigger đỏ]`
- **Màu xanh:** ATC và OFP đã khớp (sau khi Dispatcher release), thoả mãn theo từng trường hợp:

| Chuyển loại | Điều kiện xanh |
|---|---|
| Thường ↔ VIP | SeatHead (State Header) trong OFP gửi cho ATC khớp nhau |
| Thường ↔ Ferry | Số PAX (passengers) trong OFP: phiên bản trước > 0, phiên bản sau = 0 (hoặc ngược lại) |

- **Lưu ý kỹ thuật:** So sánh phải dùng OFP **đã được ATC chấp nhận** (OFP cuối cùng gửi lên ATC)
- **Hover chuột:** Lịch sử thay đổi loại (từ → đến, thời điểm)

**[COT-05] ETD**
*(Transcript [00:17:21–00:19:43])*
- **Đồng bộ từ Netline:** mỗi 5 phút
- **Màu vàng:** ETD bị kéo muộn **15–30 phút** so với giờ thông báo ban đầu (lịch gốc)
- **Màu đỏ:** ETD bị kéo muộn **> 30 phút**
- **Màu gạch ngang:** Chưa thay đổi hoặc thay đổi dưới 15 phút `[cần xác nhận: <15 phút là gạch ngang hay xanh]`

**[COT-06] ATC Clearance**
*(Transcript [00:19:44–00:21:54])*
- **ATC = Flight Plan tóm tắt** gửi cho cơ quan kiểm soát không lưu (ATC) qua Lido
- **OFP = Kế hoạch bay đầy đủ** do Dispatcher soạn ra cho phi công
- **Màu xanh:** Sau khi Dispatcher release, nội dung ATC file và OFP khớp nhau
- **Trạng thái chưa làm rõ:** Phần màu xanh "ATC đã file cho ATC" chưa xác định được cách liên kết điện ATC vào đúng chuyến bay → **tạm để blank, làm sau** `[cần xác nhận]`

**[COT-07] Pilot Confirm (PIL REL)**
*(Transcript [00:31:04–00:33:39])*
- **Hiển thị:** Phiên bản OFP mà phi công đã confirm
- **Màu xanh:** Phi công đã confirm và Dispatcher đã release → revision khớp nhau
- **Màu vàng:** Dispatcher đã release revision mới hơn (vd: 02) nhưng phi công mới chỉ confirm revision cũ hơn (vd: 01)
- **Màu đỏ:** Phi công **reject** `[cần xác nhận: điều kiện trigger đỏ cụ thể]`
- **Hover chuột:** Thời gian phi công confirm + nội dung Accept hay Reject

**[COT-08] Estimated Payload vs CLC**
*(Transcript [00:34:43–00:38:28])*
- **Nguồn dữ liệu:** So sánh **Payload trong OFP** (dispatcher xuất) với **Payload do CLC (Load Control) nhập vào**
- **Ngưỡng cảnh báo:** Được cấu hình trong màn hình **Quản lý tham số hệ thống** (flexible, không cứng code)
- **Màu gạch ngang:** Chưa có OFP
- **Màu vàng:** Sai lệch trong ngưỡng `[cần xác nhận: giá trị ngưỡng cụ thể]`
- **Màu đỏ:** Sai lệch vượt ngưỡng
- **Màu xanh:** Payload CLC nhập ≈ Payload OFP (trong ngưỡng an toàn)
- **Hover chuột:** Giá trị payload OFP và payload CLC nhập, lịch sử thay đổi các phiên bản

**[COT-09] Estimated DOW**
*(Transcript [00:38:29–00:39:09])*
- **Tương tự cột Payload** nhưng kiểm tra DOW (Dry Operating Weight)
- Logic đơn giản hơn. BA sẽ **kẻ bảng liệt kê các trường hợp ra tài liệu** (không mô tả trong cuộc họp)

**[COT-10] Pilot Extra / Fuel**
*(Transcript [00:39:09–00:41:18])*
- **Hiển thị:** Số dầu extra mà phi công xác định (từ màn hình Confirm Release của phi công — trường "Edge of Field" / "Pilot of Charge") `[cần xác nhận: tên trường chính xác]`
- **Màu trống:** Phi công chưa confirm Fly Release
- **Màu vàng:** Trước 30 phút ETD mà vẫn chưa nhận được confirm từ phi công
- **Màu xanh:** Phi công đã confirm (có giá trị)
- **Lưu ý nghiệp vụ:** Phi công tính toán lại so với kế hoạch bay, xác định số dầu muốn bơm thêm (vd: kế hoạch 60 tấn, họ muốn bơm 61 tấn → extra = 1 tấn)

**[COT-11] Document Check (tài liệu chuyến bay)**
*(Transcript [00:42:06–00:44:34])*
- **Tài liệu bắt buộc 100% chuyến bay:** NOTAM và `[cần xác nhận: "Que Dầu" — ASR không rõ, có thể là Fuel Order hoặc tài liệu thời tiết]`
- **Chuyến EDTO:** Bắt buộc thêm tài liệu **Plotting & Icing Chart**
- **Xác định chuyến EDTO:** Dựa vào danh mục chặng bay (chặng nào được đánh dấu EDTO = có tham số EDTO)
- **Nhận diện tài liệu Plotting/Icing:** Kiểm tra **chuỗi tên file** upload xem có chứa keyword `"plotting"` hoặc `"icing"` / `"icing chart"` không
- **Màu vàng:** Thiếu ít nhất 1 tài liệu bắt buộc
- **Màu đỏ:** Tương tự, ngưỡng nghiêm trọng hơn `[cần xác nhận ngưỡng thời gian cụ thể]`
- **Màu xanh:** Đủ tất cả tài liệu
- **Phần cột ngoài giờ (OFP ngoài giờ):** **Cực kỳ phức tạp, chưa làm rõ** → để lại, không làm trong giai đoạn này
- **MEL/CDL:** Cũng rất phức tạp → để lại

#### 1.1.4 Màn hình Detail chuyến bay (slide-panel)

*(Transcript [00:47:24–00:49:26]; Mockup: modal 6 tab trong `dsp_monitoring_poc_mockup_v1.html`)*
- **Thiết kế UX:** Khi click vào 1 chuyến → **panel chi tiết trượt ra bên phải** (không phải modal popup), bảng danh sách vẫn thấy và scroll được. Tab 1, 2, 3, 4…
- **Nội dung tabs dự kiến:**
  - Tab Thông tin chung: thông tin cơ bản chuyến + lịch sử thay đổi ETD
  - Tab OFP/Release: OFP revision, Pilot confirm
  - Tab Dầu: Pilot extra, fuel order, taxi fuel
  - Tab và các thông tin khác (thiết kế chưa hoàn thiện) `[cần làm rõ thêm]`
- Trong tab **Dispatch Release** (`[cần xác nhận: tên tab]`): có chức năng **Dispatcher bấm Release OFP** ngay từ màn hình chi tiết

---

### 1.2 Màn hình DSP Flight Plans
*(Nguồn: transcript [00:49:26–00:53:46]; Mockup: `dsp_flight_plans_poc_mockup_v2.html`)*

- **Đặc điểm bản ghi:** Mỗi bản ghi là **1 OFP**, không phải 1 chuyến bay. 1 chuyến có nhiều revision OFP → có nhiều dòng.
- **Toggle lọc quan trọng:** "**All Revisions**" (hiện tất cả phiên bản) vs "**Last Revision**" (chỉ hiện phiên bản lớn nhất mỗi chuyến)
- **Kết xuất:** Export Excel theo danh sách hiện tại
- **Action:** Xem **Briefing Sheet** (view tóm tắt kế hoạch bay cho phi công)
- **Tùy chỉnh bảng:** Customize cột, lưu theo user
- **Màn hình này chưa được vẽ chi tiết trong mockup v2** → sẽ làm sau *(transcript [00:52:57]: "màn này chưa đẻ đúng không?")*
- **Nội dung Briefing Sheet:** `[cần làm rõ — hiện tại chức năng tồn tại trên MO, TOSS sẽ tham chiếu nhưng nội dung chưa chốt]`

---

### 1.3 Màn hình FLC Document Management
*(Nguồn: transcript [00:53:46–01:01:20]; Mockup: `flc_documents_poc_mockup_v1.html`)*

#### 1.3.1 2 tab chức năng chính

**Tab 1 — Tài liệu chung (Common Documents)**
*(Transcript [00:53:46–00:56:07])*
- Tài liệu thời tiết và thông báo có **chu kỳ hiệu lực 3–6 tiếng** → cần cập nhật thường xuyên cho tất cả chuyến bay
- Chức năng: **Upload, Xóa, Active tài liệu** (chỉ 1–2 tài liệu tại 1 thời điểm)
- Khi Active → tài liệu đó được MO lấy về gán cho tất cả chuyến bay
- **Versioning:** Tài liệu có quy tắc đặt tên (vd: `A_v01`). Khi cần cập nhật → upload phiên bản mới `A_v02` → MO tự lấy phiên bản mới hơn. Tra cứu theo revision giống library document `[cần xác nhận: cơ chế MO gọi theo version]`

**Tab 2 — Tài liệu theo chuyến bay (Flight Documents)**
*(Transcript [00:54:19–01:01:20])*
- Giao diện: Danh sách chuyến bay (bên trái) + Upload tài liệu khi click vào từng chuyến
- **Loại tài liệu có thể upload:** Loadsheet (LS), General Declaration (GD/GDPM), Passenger Manifest (PM), NOTOC (Cargo/Baggage)
- **Cột Action trong bảng:** 2 nút cố định — **Upload tài liệu** và **Xem chi tiết theo chuyến**
- **Panel chi tiết (slide bên phải)** gồm các tab: Loadsheet, GDPM và các tab tài liệu khác
  - Mỗi tab: danh sách các phiên bản tài liệu đã upload (lịch sử revision)
  - Thông tin mỗi revision: thời gian upload, thời gian phi công Acknowledge, trạng thái (ACK / AWAIT ACK / MISSING)
  - Chức năng: **View, Download** (theo từng revision)
- **Upload Modal:** Thêm tài liệu mới → panel upload tràn lên, user chọn loại tài liệu (LS/GD/PM/NOTOC) và upload file
- **Quy tắc đặt tên file upload:** `[cần xác nhận — transcript không rõ có quy định không]`

---

### 1.4 Màn hình FLC Fill Order
*(Nguồn: transcript [01:10:10–01:13:27])*

> Màn hình này **chưa có mockup**. Nội dung sau từ transcript, cần vẽ thêm.

- **Vị trí trong menu:** Nằm trong module **Flight Load Control (FLC)**, tab Fill Order
- **Hiển thị:** Danh sách chuyến bay + thông tin Fuel Order
- **Các cột hiển thị:**

| Cột | Ghi chú |
|---|---|
| Ngày bay | — |
| Số hiệu chuyến bay | — |
| Số hiệu tàu bay | — |
| Loại tàu | — |
| Giờ cất cánh (ETD) | — |
| Sân cất cánh (DEP) | — |
| Sân hạ cánh (ARR) | Không cần giờ hạ cánh |
| OFP Revision | Revision mới nhất của OFP |
| PIC Release Revision | Phiên bản OFP mà phi công đã confirm release |
| Estimate Payload | — |
| OFP Payload | Lấy từ OFP phiên bản mới nhất |
| Block Fuel (OFP) | — |
| Fuel Order | — |
| Taxi Fuel | — |
| CHIP Fuel `[cần xác nhận]` | — |
| Phi công đã confirm các giá trị | Lấy từ màn Fly Release |

- **Màn hình chi tiết (Click vào 1 dòng):** Panel trượt ra bên phải
  - Chứa **hơn 10 tham số** người dùng cần nhập
  - Chia thành **các block** theo nhóm chức năng (VD: block A, block B...)
  - **Phân quyền theo block:** Ai có quyền sửa block nào → chỉ sửa được block đó; người khác chỉ view
  - Mục đích chia block: ghi lịch sử sửa đổi theo từng nhóm tham số `[cần làm rõ thêm — màn detail chưa được mô tả đầy đủ]`

---

### 1.5 Màn hình Quản lý Tàu bay
*(Nguồn: transcript [01:03:27–01:09:27])*

- **Trạng thái hiện tại:** Mới có **1 tab — Danh sách tàu bay** (xem, sửa, lịch sử thay đổi, lọc)
- **Ưu tiên làm ngay:** Chuẩn chỉnh màn danh sách tàu bay trước; các tab khác làm sau

**Tab 2 — Lịch bảo dưỡng (Maintenance Schedule / AOG / MJO)**
*(Transcript [01:04:24–01:07:12])*
- **Nguồn dữ liệu:** Đồng bộ từ **Netline** (cùng luồng đồng bộ lịch bay)
- **Nhận diện bản ghi bảo dưỡng trên Netline:** Bản ghi có **từ điểm = đến điểm** (vd: SGN → SGN) với code chuyến bằng **Z** → là lịch bảo dưỡng, không phải lịch bay thương mại
- **Thao tác:** Sau khi đồng bộ, lọc bỏ bản ghi bình thường, giữ lại bản ghi Z (bảo dưỡng) → đưa vào tab Lịch bảo dưỡng
- **Các cột dự kiến:** Số tàu, từ thời điểm → đến thời điểm, Base, Code bảo dưỡng, Group, Let's test `[cần xác nhận tên cột]`
- **Màn hình chi tiết bảo dưỡng:** Tích hợp **AMOS** để lấy danh mục hạng mục bảo dưỡng → **chưa khảo sát AMOS, chưa làm trong giai đoạn này**

**Tab phụ — Danh mục mã bảo dưỡng**
- Danh sách Thêm/Sửa/Xóa: Code và Group bảo dưỡng
- Phục vụ để tra cứu khi xem lịch bảo dưỡng
- Cần **hỏi thêm bên bộ phận Bảo dưỡng** về ý nghĩa các code/group `[action item]`

**Chưa làm:** MEL, CDL, Performance Factor — để lại `[cần xác nhận lộ trình]`

---

### 1.6 Phương pháp làm tài liệu & Phân công
*(Nguồn: transcript [01:09:28–01:14:34], [01:15:00–01:24:40])*

#### 1.6.1 Thực trạng

- Tiến độ tài liệu BA **đang chậm so với DEV** (DEV đang bị tản sang dự án Sky Check)
- Phương án dùng AI (Claude/GPT) để tạo tài liệu: **chất lượng output chưa đạt chuẩn** nếu để AI tự sinh toàn bộ — cần người review chỉnh sửa nhiều, phản tác dụng
- Review tài liệu AI-generated: **vẫn bỏ sót nhiều luồng nghiệp vụ, conflict giữa các phần**

#### 1.6.2 Định hướng BA Lead

- **Quy trình khuyến nghị:** Vẽ khung US trước (tiêu đề, A/B/C/D thành phần), sau đó dùng AI hỏi đáp có hướng dẫn cụ thể để mô tả màn hình → lấy output → check thủ công
- **AI được dùng để:** Hỏi đáp từng luồng cụ thể, xuất ra Excel (exception case, thông báo lỗi, điều kiện), không để AI sinh toàn bộ tài liệu một lúc
- **Ví dụ cách dùng AI:** "Màn hình này có N cột, N tính năng → hỏi AI ra tất cả exception case là gì, thông báo lỗi từng case" → paste vào tài liệu
- **Figma:** Chỉ cần 1–2 màn hình **chi tiết tỉ mỉ** (vd: Flight Monitoring) để DEV tham chiếu — không cần Figma toàn bộ hệ thống `[cần xác nhận: ai làm Figma]`
- **Ưu tiên làm mới trước:** Danh mục cũ (lấy từ màn cũ/MO) để sau — tập trung vào các chức năng mới

#### 1.6.3 Sprint planning sơ bộ

- Nhập toàn bộ US lên **backlog Sprint 1** (tất cả màn hình, kể cả US nhỏ nhất)
- BA "gối đầu" tài liệu: BA nộp đủ tài liệu cho DEV consume, DEV báo thiếu thì BA bổ sung thêm
- DEV (Tuấn Anh) phối hợp xem tài liệu đã đủ sản xuất hay chưa
- Sau Sprint 1 → đẩy sang Sprint 2 dựa trên capacity

---

## 2. Quyết định

| # | Quyết định | Người quyết định |
|---|---|---|
| D-01 | Bổ sung quy trình **Dispatcher Release OFP** vào TOSS (MO hiện tại chưa có) | BA Lead `[cần xác nhận]` |
| D-02 | **Màu xanh** sau khi đỏ/vàng = "đã từng có vấn đề, đã xử lý" (tích xanh), **không phải** gạch ngang | BA Lead |
| D-03 | Logic xác định Thường↔Ferry: dựa vào **số PAX = 0 hay >0** trong OFP | BA Lead |
| D-04 | Logic xác định Thường↔VIP: dựa vào **State Header** trong OFP gửi ATC | BA Lead |
| D-05 | Ngưỡng cảnh báo payload OFP vs CLC: **cấu hình trong Quản lý tham số hệ thống** (không hardcode) | BA Lead |
| D-06 | **Cột ngoài giờ (OFP ngoài giờ) và MEL/CDL:** không làm trong giai đoạn này, để lại sau tháng 9 | BA Lead |
| D-07 | **Lịch bảo dưỡng (AMOS integration):** chưa làm, cần khảo sát thêm | BA Lead |
| D-08 | Phương pháp BA: vẽ khung US trước, dùng AI hỏi đáp có hướng, **không** để AI tự sinh toàn bộ | BA Lead |
| D-09 | Figma: chỉ cần 1–2 màn chi tiết, không làm toàn bộ | BA Lead `[cần xác nhận]` |
| D-10 | Màn **Flight Plans (DSP)** chưa hoàn thiện mockup → cần làm thêm | — |

---

## 3. Action Items

| # | Việc cần làm | Người chịu trách nhiệm | Deadline | Trạng thái |
|---|---|---|---|---|
| AI-01 | Nhập toàn bộ US (tất cả màn hình, mọi module) lên backlog Sprint 1 | Trần Phương + `[cần xác nhận người phối hợp]` | `[cần xác nhận]` | Chưa bắt đầu |
| AI-02 | Chuẩn chỉnh màn hình **Quản lý tàu bay** (tab Danh sách tàu) — xem lại và hoàn thiện trước | `[cần xác nhận]` | `[cần xác nhận]` | Chưa bắt đầu |
| AI-03 | Làm tài liệu chi tiết màn hình **DSP Dispatch Monitoring** (theo các cột đã rà soát hôm nay) | `[cần xác nhận]` | `[cần xác nhận]` | Đang tiến hành |
| AI-04 | Làm tài liệu chi tiết màn hình **FLC Document Management** (tab tài liệu chung + theo chuyến) | `[cần xác nhận]` | `[cần xác nhận]` | Chưa bắt đầu |
| AI-05 | Làm tài liệu màn hình **FLC Fill Order** (vẽ thêm mockup, viết US) | `[cần xác nhận]` | `[cần xác nhận]` | Chưa bắt đầu |
| AI-06 | Phát: **Cập nhật tài liệu** theo các điểm đã thống nhất buổi hôm nay | Phát | `[cần xác nhận]` | Chưa bắt đầu |
| AI-07 | Kẻ bảng liệt kê đầy đủ **trường hợp logic** cột Payload OFP vs CLC (tài liệu kèm bảng Excel) | `[cần xác nhận]` | `[cần xác nhận]` | Chưa bắt đầu |
| AI-08 | Hỏi thêm bộ phận Bảo dưỡng về **code và group bảo dưỡng** để làm màn danh mục mã bảo dưỡng | `[cần xác nhận]` | `[cần xác nhận]` | Chưa bắt đầu |
| AI-09 | Xác nhận phương án **Figma chi tiết** (ai làm, màn nào) với BA Lead | `[cần xác nhận]` | `[cần xác nhận]` | Chưa bắt đầu |
| AI-10 | **Làm rõ thêm cột ATC Clearance** (cơ chế liên kết điện ATC vào chuyến bay cụ thể) — hỏi nghiệp vụ | `[cần xác nhận]` | `[cần xác nhận]` | Chưa bắt đầu |

---

## 4. Câu hỏi / Điểm chưa làm rõ

| # | Điểm mở | Mức độ | Ghi chú |
|---|---|---|---|
| Q-01 | **"Que Dầu"** (ASR: [00:42:06]) — tài liệu bắt buộc 100% chuyến bay, là tài liệu gì? Fuel Order? Fuel Release? | Cao | Cần người dự họp xác nhận |
| Q-02 | **ATC Clearance màu xanh:** Cơ chế liên kết điện ATC vào chuyến bay cụ thể (hiện chưa làm được) | Cao | BA Lead đã nói "để sau" |
| Q-03 | **Ngưỡng vàng/đỏ cột Flight Type (Loại chuyến bay)** — điều kiện trigger đỏ cụ thể là gì? | Cao | Transcript [00:22:36–00:24:25] không rõ |
| Q-04 | **Màu xanh cột Pilot Extra** — điều kiện cụ thể để chuyển xanh là gì? | Trung bình | Transcript [00:34:43] "cần trong OFP nhưng OFP không có DOW đâu" — không rõ |
| Q-05 | **Cột thông tin Rule (tổ lái)** — nội dung và logic màu sắc | Trung bình | Transcript [00:33:46] nhắc đến nhưng không mô tả |
| Q-06 | **Ngưỡng cảnh báo Document (LS/GD)** — thời gian cụ thể bao lâu trước ETD | Cao | Chưa được định nghĩa trong buổi |
| Q-07 | **Chặng EDTO** — tham số nào trên danh mục chặng bay xác định là EDTO? | Cao | Transcript [00:42:47]: "tham số B là EDTO" — cần xác nhận tên trường |
| Q-08 | **Block Fuel cột** — logic màu sắc cụ thể (vàng/đỏ là gì?) | Trung bình | Nhắc đến trong mockup nhưng không giải thích trong họp |
| Q-09 | **Danh sách participants đầy đủ** — ai tham dự buổi hôm nay? | Thấp | ASR không định danh rõ người nói |
| Q-10 | **Quy tắc đặt tên file upload** (FLC Document tab theo chuyến) — có quy định không? | Trung bình | Transcript [00:54:49–00:55:33] không kết luận rõ |
| Q-11 | **Màn hình Detail FLC Fill Order** — mô tả chi tiết 10+ tham số cần nhập, layout block | Cao | "anh chưa khảo sát chi tiết" — cần buổi riêng |
| Q-12 | **Cột REG rút gọn** — quy tắc bỏ tiền tố VN cụ thể là gì? (ASR: "gạch từ V đi, hiển thị A3, A1...") | Trung bình | Cần confirm với data thực |

---

## 5. Phụ lục — Bảng tra cứu tài liệu tham chiếu

| Tài liệu/Hệ thống nhắc đến | Mô tả | Vị trí tham chiếu |
|---|---|---|
| **OFP (Operational Flight Plan)** | Kế hoạch bay Dispatcher soạn cho phi công | — |
| **MO** | Hệ thống hiện tại đang dùng (cũ, sẽ thay thế bằng TOSS) | — |
| **Netline** | Hệ thống quản lý lịch bay (nguồn đồng bộ ETD, REG, lịch bảo dưỡng) | — |
| **Lido** | Hệ thống kế hoạch bay (Flight Planning System) | — |
| **ACARS** | Hệ thống nhắn tin kỹ thuật số máy bay (nhận điện Out/Off/On/In) | `ba/workspace/input/domain-knowledge/` |
| **AMOS** | Aircraft Maintenance and Engineering System (tích hợp bảo dưỡng) | Chưa khảo sát |
| **ATC** | Air Traffic Control — cơ quan kiểm soát không lưu | — |
| **ETOPS/EDTO** | Extended Diversion Time Operations (chuyến bay đường dài qua đại dương) | `ba/workspace/input/domain-knowledge/` |
| **CLC / FLC** | (Flight) Load Control — bộ phận kiểm soát trọng tải | — |
| **POC Mockup DSP Monitoring v1** | `dsp_monitoring_poc_mockup_v1.html` | `C:/Users/anhnlv/Downloads/` |
| **POC Mockup DSP Flight Plans v2** | `dsp_flight_plans_poc_mockup_v2.html` | `C:/Users/anhnlv/Downloads/` |
| **POC Mockup FLC Documents v1** | `flc_documents_poc_mockup_v1.html` | `C:/Users/anhnlv/Downloads/` |
| **Function List VNA.TOSS v1.0** | `ba/workspace/input/domain-knowledge/VNA.TOSS_Function_list_v1.0.xlsx` | Tài liệu function list được dùng trong buổi |

---

## 6. Các đầu việc phát sinh cần follow-up (không phải action item tức thời)

1. **Sprint planning chính thức** với Tuấn Anh (DEV Lead) để chốt capacity Sprint 1
2. **Khảo sát AMOS** — phối hợp với bộ phận Bảo dưỡng để làm rõ API/data model
3. **Làm rõ nghiệp vụ OFP ngoài giờ** — phức tạp, dự kiến tháng 9–12
4. **MEL/CDL** — để lại, dự kiến tháng 10–12
5. **Briefing Sheet** — nội dung chưa chốt, cần đối chiếu với MO

---

*Biên bản này được tổng hợp từ transcript ASR — độ chính xác phụ thuộc chất lượng ghi âm. Người dự họp vui lòng xem xét và xác nhận các mục đánh dấu `[cần xác nhận]` trước khi dùng làm tài liệu chính thức.*

*Tổng hợp bởi: Claude Code (AI assistant) — 26/06/2026*
*Nguồn: TOSS_BA_Meeting_260626.txt + dsp_monitoring_poc_mockup_v1.html + dsp_flight_plans_poc_mockup_v2.html + flc_documents_poc_mockup_v1.html*
