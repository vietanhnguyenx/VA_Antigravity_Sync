---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "ui-reviewer agent"
version: "0.1"
date: "2026-06-18"
status: "Draft"
document_type: "Mockup Review"
reviewed_file: "ba/workspace/drafts/mockup/toss-prototype-v0.5.html"
---

# Review Mockup — toss-prototype-v0.5.html — 2026-06-18

## Tổng quan

| Hạng mục | Điểm | Ghi chú |
|---|---|---|
| Độ phủ yêu cầu | 7/10 | 26 cột FL-FD đủ; 4 cột bỏ trống hoàn toàn (ATC, TO/LD, Taxi APU + cột thứ 6 ARR filter); Upload Common Document thiếu màn; "Lưu cấu hình bảng biểu và search" chưa có UI |
| Truy vết nguồn (data-src) | 8/10 | Hầu hết ô có data-src; một số ô dữ liệu mẫu (col 4 DEP dòng 2, col 6 dòng 2) thiếu data-src attribute riêng |
| Component đúng catalog | 8/10 | Bảng dùng `mat-table+MatSort+MatPaginator` đúng catalog; `mat-chip` cho Status/Type đúng; tuy nhiên `mat-toolbar(filter)` không tồn tại trong catalog — filter bar là `mat-toolbar` variant không chuẩn; `mat-button="outlined"` trong catalog dùng `matButton` directive chứ không phải class riêng |
| Văn phong tiếng Việt | 7/10 | Tiêu đề màn, banner, tooltip phần lớn tiếng Việt; nhãn cột bảng giữ tiếng Anh kỹ thuật (DSP Rel., FLTNO, ETD, ETA) là đúng quy ước hàng không; tuy nhiên button "Filter", "Reset", "Cancel", "Confirm Release" vẫn là tiếng Anh trong môi trường prototype VI |
| Không tự thêm nội dung | 9/10 | Dữ liệu mẫu có nguồn rõ ràng; REG "A893/B651/A368/A861/A395/B421" bám sheet "AZYX (không có VN)"; phát hiện 1 điểm nhỏ: dòng 3 VN411 ETD Xanh với tooltip "ATC clearance + OFP release khớp giờ" ghi thêm "(cờ §8-8)" — đây là đúng (gắn cờ chứ không giả định) |
| Xử lý biên (boundary) | 8/10 | Settings có placeholder gắn nhãn rõ ràng (MK-002); Upload Common Document (được FL-FD §8.1 liệt kê là menu item bên trái) không có nav item + không có placeholder |
| Đi hết luồng tác vụ | 7/10 | Luồng Dispatch Release: click Rel. → dialog → Confirm → giả lập OK; luồng Unrelease: wired OK; click dòng → Flight Detail: hoạt động qua showScreenDirect; tab-focus theo ô click: wired một phần (Warnings tab chỉ qua alert-dot OCC, không trigger từ click ô dispatch table); mở "tab mới trình duyệt" theo FL-FD §8.5 CHƯA thực hiện — dùng cùng-cửa-sổ thay thế, gắn nhãn prototype rõ |
| Heuristic UX-laws | 7/10 | Fitts: nút Release nhỏ (10px) — quá nhỏ cho thao tác quan trọng; Von Restorff: màu ô cell-level đúng quy ước nhưng không kết hợp icon+shape cho ô đỏ quan trọng ở cột REG; Doherty: không có spinner/skeleton khi giả lập load; Hick: filter bar 6 control hiển thị + note "20 filter" là hợp lý cho prototype |

**Kết luận: CONDITIONAL PASS**

> Màn Flight Dispatch 26 cột bám đúng sheet FL-FD về số cột, tên cột, logic phân màu chính. Các cờ [TBD] gắn đúng vị trí theo nguồn. Các phát hiện nghiêm trọng tập trung vào: (1) thiếu màn Upload Common Document — chức năng được ghi rõ trong FL-FD §8.1 nhưng không có trong prototype; (2) cơ chế "tab mới trình duyệt" theo FL-FD §8.5 chưa thực hiện đúng nghĩa (dùng cùng cửa sổ). Các phát hiện trung bình chủ yếu là data-src còn sót và UX một số chi tiết.

---

## Phát hiện (theo mức độ)

### Nghiêm trọng (cần sửa trước khi duyệt)

**[MK-001] Upload Common Document không có nav item và không có placeholder**
- Sheet FL-FD §8.1 liệt kê rõ: "Menu bar bên trái: Flight monitoring, Upload common documents". Màn `screen-dispatch` chỉ có nav item "Flight Dispatch" — không có "Upload Common Document" trong sidenav.
- Thiếu placeholder gắn nhãn hoặc màn tạm cho chức năng này.
- Nguồn: `[FL-FD §8.1]` · `VNA-TOSS-Function-list-v1.0.extracted.md` dòng 53–55
- Tác động: vi phạm §0 (yêu cầu ghi nhận trong nguồn bị vắng mặt hoàn toàn trong UI) + [U1] boundary handling.

**[MK-002] Cơ chế mở Flight Detail không bám nguồn FL-FD §8.5**
- Sheet ghi rõ: *"Bấm vào details sẽ nhảy sang tab mới chi tiết chuyến bay, bấm ở ô nào thì sẽ hiển thị tab tương ứng trong tab đó."* `[FL-FD §8.5]`
- Prototype dùng `showScreenDirect('detail')` — chuyển screen trong cùng cửa sổ, không mở browser tab mới.
- Cơ chế "bấm ở ô nào → focus đúng tab phụ" chưa được wired từ các ô bảng dispatch (chỉ có từ alert-dot OCC cũ).
- Prototype gắn nhãn rõ là prototype, nhưng wireframe §8-6 đã chốt "tab mới" — mockup phải phản ánh đúng hành vi, hoặc gắn [TBD §8-6] tường minh ở mỗi dòng.
- Nguồn: `[FL-FD §8.5]` · `[wf-monitoring §8.5]` · `[FUNC-236, FUNC-237, FUNC-238]`

**[MK-003] Lưu cấu hình bảng biểu và search chưa có UI**
- Sheet ghi: *"Lưu cấu hình bảng biểu và search."* `[FL-FD §8.1]` — ánh xạ BR-102 / FUNC-104, FUNC-105.
- Không có nút "Ẩn/Hiện cột" (per-user column toggle), không có cơ chế lưu search theo user.
- Cần ít nhất một button placeholder với nhãn "Ẩn/Hiện cột [TBD FUNC-104]".
- Nguồn: `[FL-FD §8.1 — "Lưu cấu hình bảng biểu và search"]` · `[BR-102 / FUNC-104, FUNC-105]`

---

### Cần xem xét

**[MK-004] 4 cột bảng hiển thị [TBD] nhưng không có bất kỳ quy tắc màu ngay cả từ nguồn đã có**
- Cột 21 ATC: sheet ghi "Cảnh báo ATC (nội dung như MO)" — có nguồn BR-223 nhưng ô hiện chỉ có `[TBD · OID §8-9]` mà không gắn icon nào, kể cả icon `remove` (N/A).
- Cột 22 TO/LD: tương tự — sheet ghi đầy đủ nghĩa nhưng không có icon trạng thái.
- Cột 24 Taxi APU: tương tự.
- Đề xuất: thêm icon `remove` (ai-na) cho các cột chưa có quy tắc màu, để phân biệt "chưa biết" với "N/A"; giữ [TBD] trong title/tooltip.
- Nguồn: `[FL-FD §8.2 Col 21, 22, 24]`

**[MK-005] data-src còn sót ở một số ô dữ liệu mẫu**
- Dòng 2 (VN208D): `<td>SGN</td>` (cột 4 DEP, line ~989) thiếu data-src.
- Dòng 2: `<td data-src="[FL-FD §8.2 Col 5]">HAN</td>` có data-src nhưng ARR thực tế là HAN với tooltip rỗng.
- Dòng 5 (VN1184): `<td>DAD</td>`, `<td>HAN</td>`, `<td>18 Jun</td>` (cột 4,5,6) thiếu data-src.
- Nguồn: `[FL-FD §8.2 Col 4, 5, 6]`

**[MK-006] data-mat="mat-toolbar(filter)" không có trong catalog Angular Material**
- Filter bar sử dụng `data-mat="mat-toolbar(filter)"` — catalog chỉ có `<mat-toolbar>` (thanh tiêu đề) không phải filter bar.
- Thực tế filter bar là `mat-card` hoặc custom `div` với `mat-form-field` bên trong.
- Đề xuất: đổi thành `data-mat="mat-card(filter-bar)"` hoặc `data-mat="div(filter-row)+mat-form-field+mat-select"`.
- Nguồn: `.claude/knowledge/angular-material-components.md §2`

**[MK-007] Cột ARR filter (Filter 6) không nằm trong filter bar hiện tại**
- Sheet §8.3 liệt kê Filter 6 = ARR. Filter bar prototype chỉ có DEP (Filter 5), thiếu ARR.
- Nguồn: `[FL-FD §8.3 Filter 6]` · `[wf-monitoring §8.3]`

**[MK-008] Cột 6 Date: logic màu "theo màu của cột Flight Num" chưa được thể hiện trong prototype**
- Sheet ghi: "Date — Theo màu của cột Flight Num" `[FL-FD §8.2 Col 6]`.
- Dòng 1 (VN302, FLTNO không màu): cột Date không màu — đúng.
- Dòng 2 (VN208D, FLTNO vàng): `<td class="cell-yellow" data-src="[FL-FD §8.2 Col 6 — màu theo FLTNO]">18 Jun</td>` — đúng, có data-src.
- Phát hiện: dòng 4 (VN500, FLTNO không có màu riêng nhưng ô Date không màu) — cần kiểm tra: sheet ghi Date theo màu FLTNO, mà cột FLTNO VN500 không màu → Date không màu — logic tạm đúng.
- Tuy nhiên không có tooltip ở cột Date giải thích "màu theo FLTNO" — thiếu hover detail.
- Nguồn: `[FL-FD §8.2 Col 6]`

**[MK-009] Nút "Rel." trong cột DSP Release quá nhỏ cho thao tác nghiệp vụ quan trọng (Fitts)**
- Nút Release (`dsp-rel-btn`) kích thước 10px, padding 2px 7px — đây là thao tác dispatch release quan trọng (BR-213/BR-224).
- Theo Fitts' Law: nút primary action quan trọng phải đủ lớn, đặc biệt trên màn dense.
- Đề xuất: tăng lên tối thiểu 14px font, padding 4px 10px, hoặc thêm icon flight_takeoff.
- Nguồn: `[FL-FD §8.2 Col 1]` · `[wf-monitoring §8, Fitts heuristic]`

**[MK-010] Màu ô cột REG Đỏ không kết hợp icon (Von Restorff)**
- Ô REG đỏ (VN302) chỉ đổi màu nền ô, không có icon cảnh báo.
- Trong khi các cột NOTAM/WX/MEL/VIP đỏ đều có icon (`error`, `warning`, `star`) bên cạnh giá trị.
- REG là cột đầu tiên dễ nhìn nhất — nên có icon `swap_horiz` hoặc `warning` khi màu đỏ (OFP ≠ Netline).
- Nguồn: `[FL-FD §8.2 Col 2]` · `[wf-monitoring §9.2 cột 2]` · `[Von Restorff — màu + icon + shape]`

**[MK-011] Prototype title vẫn ghi "v0.4" trong thẻ `<title>` và comment header**
- Dòng 3: `<title>TOSS — Prototype v0.4</title>`. Prototype banner ngoài ghi đúng "v0.5" nhưng title tag chưa cập nhật.
- Dòng 4–5: comment `TOSS Prototype v0.4 — 2026-06-18` chưa cập nhật thành v0.5.
- Không ảnh hưởng chức năng nhưng gây nhầm lẫn khi screenshot/share.

**[MK-012] Dialog Release: thiếu thông tin DSP license validation per FL-FD §8.2 Col 1**
- Sheet ghi: "Điều kiện active là bóc tách OFP xem user DSP với số license nào tương ứng với thông tin trên DSP license trong thông tin user." `[FL-FD §8.2 Col 1]`
- Dialog hiện chỉ hiển thị "DSP License: DSP-002 — Nguyễn Văn A" (hardcoded).
- Không có [TBD] cho logic "active khi tới thời điểm cần release" — cần gắn [TBD] vào checkbox activation logic.
- Nguồn: `[FL-FD §8.2 Col 1]`

**[MK-013] Không có Snackbar / feedback sau Confirm Release (Doherty)**
- Sau khi `dsp_confirmRelease()` chỉ gọi `alert()` — không cập nhật dòng bảng (cột DSP Release checkbox, REG màu, OFP DSP badge).
- Trạng thái bảng không phản ánh kết quả sau release — người dùng phải reload để thấy thay đổi.
- Cần gắn nhãn "[PROTOTYPE — trạng thái bảng không cập nhật sau giả lập release]" hoặc wired giả lập cập nhật ô.
- Nguồn: `[Doherty — feedback trong 400ms]` · `[FL-FD §8.2 Col 1]`

**[MK-014] Phân quyền theo carrier không có UI**
- Sheet ghi: "Phân quyền theo carrier" `[FL-FD §8.4]` — BR-106 / FUNC-113, FUNC-114.
- Prototype không có bất kỳ UI placeholder nào cho phân quyền carrier (filter carrier không có, indicator user's carrier không có).
- Cần ít nhất badge hiển thị carrier user hiện tại hoặc [TBD] placeholder.
- Nguồn: `[FL-FD §8.4]` · `[BR-106 / FUNC-113, FUNC-114]`

---

### Gợi ý cải thiện

**[MK-015] KPI strip dùng nhãn tiếng Anh ("Total Flights", "Alerts (Red)")**
- Các nhãn KPI sử dụng tiếng Anh. Đề xuất Việt hóa: "Tổng chuyến", "Cảnh báo đỏ", "Lưu ý vàng", "Bình thường".
- Nguồn: `[wf-monitoring §7.1 — "badge thống kê: Tổng / Cảnh báo / Bình thường"]`

**[MK-016] Header 2 tầng nhóm cột không tối ưu (Miller)**
- Nhóm "Load / Fuel" gộp cột 13–16 và cột 19 (colspan=5 nhưng đánh nhãn "Col 13–16,19") — ZFW-DOW (cột 19) bị tách ra nằm ở nhóm "Weather / NOTAM" trong HTML (colspan=3, data-src "[FL-FD §8.2 Col 17–18,19]") nhưng thực tế ZFW-DOW là cột kiểm tra tải, không phải thời tiết.
- Đề xuất: ZFW-DOW nên thuộc nhóm "Load / Fuel" thay vì "Weather / NOTAM".
- Nguồn: `[FL-FD §8.2 Col 19 — "Check ZFW (đổi tải trong FON)"]`

**[MK-017] Thiếu "LIVE" indicator và thông tin dispatcher/ca trực trên màn dispatch**
- Wireframe §3 và §7.1 mô tả: topbar "● LIVE" + "Dispatcher: NGUYỄN VĂN A | Ca: 06:00–18:00".
- Prototype chỉ có đồng hồ UTC ở toolbar chung, không có indicator kết nối real-time và thông tin ca trực.
- Nguồn: `[wf-monitoring §3 — header ca trực; §7.1 — topbar LIVE indicator]`

**[MK-018] Gợi ý thêm Snackbar/notification sample cho UX completeness**
- Theo Doherty Threshold: màn realtime ops cần feedback nhanh. Thêm 1 `mat-snackbar` giả lập sau Confirm Release/Unrelease thay vì `alert()`.

---

## Kiểm tra chuyên biệt

### (1) Đủ 26 cột theo sheet không?

Xác nhận đủ 26 cột theo thứ tự sheet FL-FD:

| # | Tên cột sheet | Có trong mockup | Ghi chú |
|---|---|---|---|
| 1 | DSP Release | Có | Checkbox + Rel. button; data-src đúng |
| 2 | REG | Có | Màu 4 trạng thái; tooltip REG cũ→mới |
| 3 | FLTNO | Có | Suffix D/Z vàng; freeze cột |
| 4 | DEP | Có | Thiếu data-src ở một số dòng |
| 5 | ARR | Có | Divert vàng; tooltip ARR kế hoạch→thực tế |
| 6 | Date | Có | Màu theo FLTNO; data-src đúng |
| 7 | ETD | Có | 3 ngưỡng màu Vàng/Đỏ/Xanh đúng sheet |
| 8 | ETA | Có | [TBD] gắn đúng (cờ §8-9) |
| 9 | Flight Type | Có | Chip J/G/P/A/VIP/Ferry; màu đổi loại |
| 10 | Status | Có | GRD/BRD/OUT/ENR/IN/ARR; blink BRD/OUT; [TBD §8-7] |
| 11 | OFP DSP | Có | Format "2/0/1 R2"; Xanh/Vàng/Đỏ đúng; [TBD §8-1] format |
| 12 | Pilot release | Có | Gạch trắng/R01/R02; Xanh/Vàng/Đỏ |
| 13 | EPLD | Có | [TBD §8-4] gắn đúng; hiển thị giá trị kg |
| 14 | EST DOW | Có | [TBD §8-4]; hiển thị giá trị kg |
| 15 | BLOCK FUEL | Có | Đỏ 30' trước ETD pilot chưa release |
| 16 | PILOT EXTRA | Có | Đỏ/bình thường; delta kg sau release |
| 17 | NOTAM | Có | Ngưỡng 210'/270'/75'/95' + OFP window — đúng sheet |
| 18 | WX | Có | Icon; [TBD §8-3] cờ chia sẻ ngưỡng |
| 19 | ZFW-DOW | Có | Icon OK/warn; tooltip 60'QN/90'QT |
| 20 | MEL/CDL | Có | Icon; tooltip AMOS tích hợp |
| 21 | ATC | Có | Chỉ [TBD] — không có icon trạng thái (xem MK-004) |
| 22 | TO/LD (MTOW, MLDW) | Có | Chỉ [TBD] — không có icon trạng thái (xem MK-004) |
| 23 | Missing Document | Có | Icon đỏ/xanh; tooltip OFP/NOTAM/WX |
| 24 | Taxi APU | Có | Chỉ [TBD] — không có icon trạng thái (xem MK-004) |
| 25 | Crew change | Có | Icon; tooltip MO Plus; data-src FUNC-145 |
| 26 | VIP | Có | Icon đỏ cờ VIP500; data-src BR-126 |

**Kết luận (1): Đủ 26 cột, đúng thứ tự. 3 cột (21, 22, 24) chỉ hiển thị [TBD] không có icon — xem MK-004.**

---

### (2) Logic phân màu có khớp §8 không?

| Cột | Logic sheet §8.2 | Prototype thực hiện | Đánh giá |
|---|---|---|---|
| REG | Đỏ=OFP≠Netline released; Không màu=chưa OFP; Xanh=khớp+released; Vàng=khớp chưa release | Dòng 1 đỏ, dòng 2 vàng, dòng 3 xanh, dòng 5 xanh — đúng 4 trạng thái | Khớp |
| FLTNO | Suffix D/Z→vàng; mất D/Z→đỏ | Dòng 2 VN208D vàng suffix — đúng | Khớp |
| ARR | Divert→vàng | Dòng 6 BL182 DAD* vàng — đúng | Khớp |
| ETD | Vàng 15–30', Đỏ >30', Xanh ATC+OFP khớp | Dòng 1 đỏ +30', dòng 2 vàng +20', dòng 3 xanh — đúng 3 trạng thái | Khớp |
| Flight Type | Vàng ATC+OFP ra chưa release; Đỏ đổi loại; Xanh head khớp | Dòng 4 VN500 đỏ (đổi Normal→VIP); dòng 6 BL182 đỏ (đổi Normal→Ferry) — đúng; trạng thái Vàng và Xanh chưa có dòng mẫu | Một phần |
| Status | Blink khi BRD/OUT | st-BRD và st-OUT có animation dsp-blink 1.2s — đúng | Khớp |
| OFP DSP | Xanh=rev cuối released; Vàng=rev trước released; Đỏ=chưa có | Dòng 1 đỏ, dòng 2 vàng, dòng 3 xanh, dòng 5 xanh — đúng | Khớp |
| NOTAM | 5 ngưỡng theo trạng thái OFP × QN/QT | Bảng legend đầy đủ 5 dòng ngưỡng; dữ liệu mẫu thể hiện đỏ (dòng 1), vàng (dòng 2, 4), xanh (dòng 3, 5, 6) — khớp | Khớp |
| Quy ước màu chung | Xanh chỉ phát sinh sau khi đã từng Đỏ | Legend ghi đúng: "Xanh chỉ phát sinh sau khi đã từng Đỏ và xử lý xong"; nguồn `[12-sang §II.7 #9]` | Khớp |

**Phát hiện lệch màu:**
- Cột BLOCK FUEL dòng 2 (VN208D, BRD): ô màu vàng với tooltip "Block Fuel OFP R2: 12 600 kg — Vàng: pilot release R01 (cũ), R2 chưa release". Sheet §8.2 Col 15 chỉ ghi "Đỏ nếu 30 phút trước ETD pilot chưa release" — không có trạng thái Vàng riêng cho BLOCK FUEL. Prototype tự suy diễn "Vàng khi pilot release rev cũ". Cần gắn [TBD] hoặc ghi rõ đây là suy luận từ §9.2 (POC §7.2).
- Cột EPLD/EST DOW dòng 3 (VN411) màu xanh (cell-green) — tuy nhiên quy tắc màu cho EPLD/EST DOW chưa được sheet xác nhận (cờ §8-4 vẫn mở). Hiển thị màu xanh ở đây là suy diễn, vi phạm §0.

**Kết luận (2): Logic phân màu khớp tốt với §8 cho các cột đã có quy tắc rõ (REG, FLTNO, ARR, ETD, Status, OFP DSP, NOTAM). Hai điểm lệch nhỏ: BLOCK FUEL Vàng và EPLD/EST DOW Xanh chưa có nguồn — cần gắn [TBD] rõ hơn.**

---

### (3) Các cột sheet để trống có gắn [TBD] không?

| Cột | Tình trạng sheet | Mockup gắn [TBD]? |
|---|---|---|
| 8 ETA — quy tắc màu | Sheet để trống | Có — `[TBD]` trong header + ô dữ liệu mẫu |
| 10 Status — enum | Sheet ghi "tạm thời" | Có — `[TBD]` trong header + mỗi badge |
| 13 EPLD — màu cụ thể | Sheet không nêu màu | Có — `[TBD §8-4]` trong header |
| 14 EST DOW — màu | Sheet không nêu màu | Có — `[TBD §8-4]` trong header |
| 21 ATC — màu | Sheet để trống | Có — `[TBD · OID §8-9]` trong ô dữ liệu |
| 22 TO/LD — màu | Sheet để trống | Có — `[TBD · OID §8-9]` trong ô dữ liệu |
| 24 Taxi APU — màu | Sheet để trống | Có — `[TBD · OID §8-9]` trong ô dữ liệu |
| 11 OFP DSP — format "2/0/1" | Sheet chưa giải thích | Có — `[TBD §8-1]` trong tooltip |

**Kết luận (3): Tất cả cột sheet để trống đều có gắn [TBD] đúng vị trí. Tuân thủ §0 tốt. Ngoại lệ: BLOCK FUEL Vàng và EPLD/EST DOW Xanh (xem mục 2 trên) — cần bổ sung [TBD] vào các ô này.**

---

### (4) Màn Detail, MEL, Settings còn nguyên vẹn sau assembly không?

| Màn | Kiểm tra | Trạng thái |
|---|---|---|
| Flight Detail | screen-detail hiển thị đúng; 6 tab (Warnings, Flight Release, Aircraft/MEL, Weather/NOTAM, Crew, Load) có data-src và nội dung; OFP Version History table còn nguyên; MEL alert với goto link còn nguyên | Nguyên vẹn |
| MEL/CDL | screen-mel với 3 sub-tab (Master MEL, Fleet Active, Version Update); tree Chapter 21/34/73; detail panel; Update dialog — tất cả còn nguyên; JS mel_expandNode/mel_selectItem/mel_filterTree hoạt động | Nguyên vẹn |
| Settings | screen-settings placeholder còn nguyên với nhãn rõ ràng | Nguyên vẹn |
| CSS isolation | dispatch-v05-css viết trong `<style id="dispatch-v05-css">` không override các class của v0.4 (comment ghi rõ); tuy nhiên phát hiện `</style></style>` dư ở line 511 (thẻ style đóng 2 lần) — không gây lỗi render nhưng cần cleanup | Nguyên vẹn (1 HTML artifact nhỏ) |

**Kết luận (4): 3 màn còn lại nguyên vẹn. Phát hiện 1 thẻ `</style>` thừa tại dòng 511 — không ảnh hưởng runtime nhưng là HTML không hợp lệ.**

---

### (5) Chuyển màn + click dòng → Flight Detail hoạt động không?

| Tình huống | Cơ chế | Hoạt động? |
|---|---|---|
| Sidebar click "Flight Dispatch" | `showScreen('dispatch')` | Có — active class set đúng |
| Sidebar click "Flight Detail" | `showScreen('detail')` | Có — chuyển sang screen-detail |
| Sidebar click "MEL/CDL" | `showScreen('mel')` | Có |
| Sidebar click "Settings" | `showScreen('settings')` | Có — placeholder hiển thị |
| Click dòng bảng dispatch | `onclick="showScreenDirect('detail')"` trên `<tr>` | Có — mỗi 6 dòng đều có onclick; chuyển sang screen-detail |
| Click ô DSP Release (stopPropagation) | `onclick="event.stopPropagation()"` | Có — click release button không trigger row click |
| Click dòng → focus đúng tab phụ | Chưa wired từ các ô dispatch | Không — tất cả 6 dòng đều mở detail ở tab "Warnings" mặc định, không phụ thuộc ô click |
| Click alert-dot OCC → detail + Warnings tab | `detail_openFromAlert('dtab-warnings')` | Có (từ OCC legacy fragment) |

**Kết luận (5): Chuyển màn hoạt động. Click dòng → Flight Detail hoạt động. Tuy nhiên "bấm ở ô nào thì hiển thị tab tương ứng" (FL-FD §8.5) chưa được wired từ bảng dispatch — đây là phần của MK-002.**

---

## Yêu cầu bị bỏ sót

| Yêu cầu | Nguồn | Trạng thái UI |
|---|---|---|
| Menu bar trái: "Upload common documents" | `[FL-FD §8.1]` — dòng 236 extracted | Không có (MK-001) |
| Lưu cấu hình bảng biểu và search | `[FL-FD §8.1]` · BR-102/FUNC-104,105 | Không có (MK-003) |
| Click ô → focus đúng tab phụ trong chi tiết | `[FL-FD §8.5]` · `[FUNC-237, FUNC-238]` | Chưa wired từ dispatch table (MK-002) |
| Phân quyền theo carrier — UI indicator | `[FL-FD §8.4]` · BR-106/FUNC-113,114 | Không có (MK-014) |
| Filter ARR (Filter 6) | `[FL-FD §8.3 Filter 6]` | Thiếu trong filter bar (MK-007) |

---

## [TBD] cần điền (từ [cần xác nhận] trong nguồn)

Các mục sau từ nguồn có cờ `[cần xác nhận]` — prototype đã gắn đúng [TBD] vào UI. Liệt kê để OID tracking:

| Cờ | Mô tả | Vị trí trong mockup |
|---|---|---|
| §8-1 | Ý nghĩa 3 số trong format "2/0/1 R2" của OFP DSP | Tooltip cột 11; legend component map |
| §8-3 | WX/MEL/ATC/TO-LD/Taxi/VIP có dùng chung ngưỡng NOTAM không | Tooltip cột 18, 20; ô cột 21,22,24 |
| §8-4 | Màu vàng/đỏ cụ thể của EPLD/EST DOW theo mức lệch | Header cột 13, 14; ô dữ liệu mẫu |
| §8-5 | 20 filter — ánh xạ trường chính xác | Banner "20 filter — xem wireframe §8.3" |
| §8-7 | Enum LEG STATE chính thức (GRD/BRD/OUT/ENR/IN/ARR tạm thời) | Badge Status mỗi dòng |
| §8-8 | Xanh ETD vs Xanh Flight Type — quy tắc khác nhau không | Tooltip ETD dòng 3 có gắn "(cờ §8-8)" |
| §8-9 | Màu ATC/TO-LD/Missing Doc/Taxi APU — sheet để trống | Header + ô [TBD · OID §8-9] cột 21,22,24 |
| §8-10 | Hover tooltip 19 cột trống | Các cột 8–26 ngoại trừ đã có tooltip |
| §9-1 | 6 cột bổ sung TOSS-180 (cabin defect/PAX nối chuyến/loadfactor/thiếu phép bay/TAT/điện văn) | Banner TBD summary cuối bảng |

---

## Backlog đề xuất cho v0.6

Theo thứ tự ưu tiên (ảnh hưởng nguồn → trải nghiệm):

1. **[MK-001]** Thêm nav item "Upload Common Documents" + placeholder screen gắn nhãn [TBD - ngoài phạm vi v0.5].
2. **[MK-002]** Wired click ô → focus đúng tab phụ trong Flight Detail (mapping ô → tab ID); gắn note [PROTOTYPE — mở cùng cửa sổ thay tab mới per §8-6].
3. **[MK-003]** Thêm button "Ẩn/Hiện cột" placeholder (data-src BR-102/FUNC-104,105) + button "Lưu tìm kiếm".
4. **[MK-004]** Thêm icon `remove` (ai-na) cho cột ATC/TO-LD/Taxi APU khi [TBD] để phân biệt với cột có giá trị thực.
5. **[MK-007]** Thêm Filter 6 ARR vào filter bar.
6. **[MK-014]** Thêm indicator carrier của user hiện tại (badge header hoặc toolbar).
7. **[MK-013]** Giả lập cập nhật dòng bảng sau Confirm Release (đổi badge OFP DSP → xanh, REG → xanh).
8. **[MK-009]** Tăng kích thước nút Rel. và Confirm Release (Fitts).
9. **[MK-010]** Thêm icon `swap_horiz` vào ô REG đỏ.
10. **[MK-015]** Việt hóa nhãn KPI strip và button Filter/Reset.
11. **[MK-011]** Cập nhật `<title>` và comment header thành v0.5.
12. **[MK-016]** Chuyển cột ZFW-DOW sang nhóm header "Load / Fuel" thay vì "Weather / NOTAM".

---

*Review hoàn tất 2026-06-18 — ui-reviewer agent v1.1 · Nguồn kiểm tra: `[FL-FD §8.1–§8.5; wf-monitoring §8; §9; VNA-TOSS-Function-list-v1.0.extracted.md]`*
