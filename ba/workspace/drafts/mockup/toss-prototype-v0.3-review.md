---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "ui-reviewer agent v1.1"
version: "0.1"
date: "2026-06-18"
status: "Draft"
document_type: "Báo cáo Soát Mockup (UI Review)"
prototype_file: "ba/workspace/drafts/mockup/toss-prototype-v0.3.html"
sources:
  - "BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md"
  - "BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md"
  - "BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md"
  - "BAO-CAO-KHAO-SAT-15062026-v0.1.md"
  - "BAO-CAO-KHAO-SAT-17062026-v0.1.md"
---

# Review Mockup — toss-prototype-v0.3.html — 2026-06-18

> Ghi chú phương pháp: Review này KHÔNG kết luận về accessibility, hiệu năng production, hay tác động visual định lượng — prototype không cung cấp đủ dữ liệu để chứng minh các thuộc tính đó. Mọi nhận xét UX mang tính heuristic, không phải đo lường thực nghiệm.

---

## Tổng quan điểm

| Hạng mục | Điểm | Ghi chú tóm tắt |
|---|---|---|
| Độ phủ yêu cầu | 6/10 | 4 màn hình có: OCC/Dispatch/Detail/MEL. Nhiều nhóm chức năng lớn từ nguồn hoàn toàn vắng mặt (Phase 3–6 Dispatch, kiểm tra đầu ca, upload thời tiết đa chuyến, backup Lido, phép bay, chứng chỉ tổ bay theo sân bay). Phạm vi v0.3 giới hạn 4 màn nên chấp nhận được về số lượng màn, nhưng ngay cả trong các màn đã có, một số yêu cầu cụ thể bị bỏ sót. |
| Truy vết nguồn (data-src) | 8/10 | Mật độ `data-src` rất cao — tuyệt đại đa số element đều có annotation. Tuy nhiên một số vùng UI (tab header Flight Detail, một số cell nội dung Flight Detail tab Tổ bay, Tải trọng) dùng tiếng Việt không dấu — nhỏ nhưng đếm được. |
| Component đúng catalog | 7/10 | Hầu hết `data-mat` map đúng catalog Angular Material. Một số vấn đề: `mat-stepper` dùng CSS tự làm thay vì component thật; `mat-tree` dùng custom CSS; `MatTimeline` không tồn tại trong catalog; `mat-badge` (ver-chip) dùng custom CSS; Alert dot không phải AM component. Những điều này được flag `(custom)` hoặc `(cần xác nhận)` trong prototype — cần chốt. |
| Văn phong tiếng Việt | 5/10 | Nghiêm trọng: theo nguồn [12062026 §6] toàn bộ giao diện phải 100% tiếng Anh, UTC, dark mode. Prototype hiển thị nhiều nhãn tiếng Việt trong các tab, cột, và nút ("Tổng chuyến hôm nay", "Đang bay", "Cảnh báo", v.v.). Đây là vi phạm yêu cầu ngôn ngữ giao diện đã được chốt. Các nội dung dạng comment/annotation nội bộ thì không tính, nhưng nhãn hiển thị cho người dùng cuối cần là tiếng Anh. |
| Không tự thêm nội dung | 8/10 | Không phát hiện trường hợp UI tự thêm flow hay trường không có trong nguồn. Dữ liệu mẫu (các tên Nguyễn Văn A, Trần Thị Bình…) được gắn nhãn rõ là "dữ liệu mẫu". Một điểm nghi vấn nhỏ: tab "Tải trọng" (Flight Detail) có banner "Trong ngưỡng bình thường" — trạng thái này không có mẫu cụ thể trong nguồn (nguồn chỉ mô tả ngưỡng cảnh báo khi vượt, không mô tả trạng thái OK). |
| Xử lý biên (boundary) | 7/10 | Màn "Cài đặt" trong sidenav là dead-end: click không xảy ra gì, không có placeholder gắn nhãn. Nút "Lưu" và "Lưu & Thông báo Dispatcher" trong MEL metadata dùng `alert()` JavaScript (giả lập demo) — chấp nhận được cho prototype nhưng cần gắn nhãn placeholder rõ hơn. Tích hợp MO Plus, AMOS, ACARS đều được ghi chú "giả lập demo" — đạt. |
| Đi hết luồng tác vụ | 7/10 | Luồng Dispatch Release → dialog xác nhận → cập nhật trạng thái hoạt động. Luồng Unrelease hoạt động. Click chuyến trên OCC → mở Flight Detail hoạt động. Click cảnh báo MEL → không tự mở đúng tab (phải click thủ công tab MEL). MEL Active → Cập nhật phiên bản → dialog rà soát hoạt động. Tuy nhiên: luồng "Click cảnh báo → active đúng tab phụ" (yêu cầu [12062026 §1]) chưa được triển khai đầy đủ từ OCC vào Flight Detail. |
| Heuristic UX-laws | 6/10 | Xem phân tích chi tiết §5 bên dưới. Các vấn đề chính: thiếu skeleton/spinner (Doherty), cột OCC không được nhóm/phân tách (Miller), nút "Release ngay" và "Unrelease" cạnh nhau khi đã release (Fitts/nguy cơ nhầm), cảnh báo đỏ/vàng phụ thuộc màu là chính (Von Restorff thiếu hình dạng bổ sung). |

**Kết luận: CONDITIONAL PASS**

Prototype v0.3 đã dựng được 4 màn hình với mật độ truy vết nguồn cao và luồng tương tác cơ bản hoạt động. Cần xử lý các phát hiện Nghiêm trọng (ngôn ngữ giao diện và boundary sidenav) trước khi dùng làm cơ sở đặc tả hay trình bày với stakeholder kỹ thuật.

---

## Ghi chú chất lượng lắp ghép (Assembly Quality)

Prototype v0.3 được tạo qua quy trình ghép fragment từ gen-mockup agent. Chất lượng lắp ghép nhìn chung tốt:
- CSS của các fragment được tổng hợp đúng, không xung đột chọn tên class.
- JavaScript được đóng gói theo IIFE và không có xung đột scope toàn cục đáng kể.
- Một lỗi nhỏ về cú pháp: `<style>` thứ hai (dòng 260) mở trước khi `<style>` thứ nhất đóng — kỹ thuật cụ thể là thẻ `<style id="dispatch-css">` nằm trong block `<style>` đầu tiên, dẫn đến CSS của dispatch không ở trong thẻ style hợp lệ. Trình duyệt thường tự xử lý nhưng đây là lỗi markup.
- Comment lắp ghép ("CSS_END", "/*") còn sót lại trong source (dòng 353–358 và 640) tuy không ảnh hưởng đến render nhưng làm source không sạch.
- Giao tiếp giữa fragment OCC và màn Flight Detail (hàm `showScreenDirect`, `occ_openDetail`) được thiết kế đúng kiểu — fragment không phụ thuộc global ngoài hàm host.

---

## Phát hiện (theo mức độ)

### Nghiêm trọng — cần sửa trước khi duyệt

**[MK-001] Ngôn ngữ giao diện: nhãn tiếng Việt vi phạm yêu cầu đã chốt**

Nguồn [12062026 §6] chốt rõ: "100% tiếng Anh, không dùng tiếng Việt" cho toàn bộ giao diện TOSS. Prototype v0.3 hiển thị nhiều nhãn tiếng Việt cho người dùng cuối:

- Tab labels trong Flight Detail: "Cảnh báo (2)", "Flight Release", "Tổ bay", "Tải trọng", "Tàu bay / MEL" — nên là "Warnings", "Flight Release", "Crew", "Load", "Aircraft / MEL"
- KPI labels trong OCC: "Tổng chuyến hôm nay", "Đang bay (ENR)", "Pending Dispatch Release", "Red Alerts — cần xử lý", "OTP (On-Time Performance)" — nên là toàn tiếng Anh
- Dropdown filter OCC: "Tất cả Carrier", "Tất cả trạng thái" — nên là "All Carriers", "All States"
- Trạng thái Dispatch trong bảng: "Chưa Release", "Dispatch Released", "Chờ Pilot", "Hoàn tất" — nên là "Not Released", "Dispatch Released", "Awaiting Pilot", "Complete"
- Nhãn nút: "Release ngay", "Unrelease", "Lọc", "Lưu", "Hủy" — nên là "Release Now", "Unrelease", "Filter", "Save", "Cancel"
- Bảng ngưỡng Dispatch: "Nội địa (Domestic)", "Bắt đầu lưu ý", "Cảnh báo vàng (gần hạn)", "Cảnh báo đỏ (quá hạn)" — nên là tiếng Anh

Ngoại lệ hợp lệ: tooltip kỹ thuật nội bộ, banner prototype cảnh báo (dữ liệu mẫu), [TBD] annotation — những thứ này là ghi chú BA, không phải UI hiển thị cuối cùng.

**[MK-002] Sidenav "Cài đặt" là dead-end không có placeholder**

Mục điều hướng "Cài đặt" trong sidenav không có `onclick` handler, không có `href`, không có bất kỳ phản hồi nào khi click. Đây là boundary dẫn ra ngoài phạm vi đã xây dựng mà không có placeholder gắn nhãn — vi phạm nguyên tắc boundary handling [U1].

Cần bổ sung: hoặc một placeholder screen ("Settings — Chưa xây dựng trong v0.3"), hoặc một tooltip/tooltip "Chưa triển khai trong prototype này", hoặc disable rõ ràng với nhãn giải thích.

**[MK-003] Luồng "click cảnh báo → active đúng tab phụ" chưa được triển khai đầy đủ**

Nguồn [12062026 §1] quy định: "khi điều phái click vào một cảnh báo, hệ thống mở Flight Detail và đồng thời active đúng tab phụ tương ứng với cảnh báo đó." Hàm `detail_openFromAlert(panelId)` đã được định nghĩa trong JS, nhưng:

- Không có nơi nào trong màn OCC gọi `detail_openFromAlert()` — các alert dot trên OCC không có handler `onclick`.
- Không có cảnh báo nào trong tab "Cảnh báo (2)" của Flight Detail có nút/link để "click cảnh báo → mở đúng tab MEL hay Weather".
- Kết quả: use case "click cảnh báo → active tab" được code nhưng không được kết nối vào flow người dùng. Người dùng không thể thực hiện tác vụ này.

---

### Cần xem xét

**[MK-004] `data-mat="mat-stepper"` không đúng catalog — dùng CSS tự vẽ**

Timeline 5 bước ở màn Dispatch được render bằng CSS tự vẽ (`.timeline`, `.t-step`, `.t-node`), không phải Angular Material `<mat-stepper>` (linear, horizontal). Catalog AM có `mat-stepper` / `mat-horizontal-stepper` với đầy đủ `<mat-step>`, `[editable]`, `linear` mode. Trong legend table đăng ký là `mat-stepper (linear, horizontal)` nhưng thực tế không phải. DEV sẽ implement component sai nếu không được làm rõ.

**[MK-005] `MatTimeline` không tồn tại trong catalog Angular Material**

Legend Flight Detail đăng ký "MatTimeline (custom vertical) [cần xác nhận]" cho crew timeline. Angular Material không có `MatTimeline` component. Đây là component tự tạo. Cần đổi `data-mat` thành một trong hai: (a) `mat-list` với custom CSS timeline, hoặc (b) ghi rõ `custom-vertical-timeline (no AM equivalent)`.

**[MK-006] Ngưỡng cảnh báo Release OFP: một số giá trị chưa khớp hoàn toàn giữa nguồn**

Prototype hiển thị ngưỡng nội địa: 210/75/60 phút và quốc tế: 270/90/75 phút — khớp với [15062026 §II.2].

Tuy nhiên [11062026-sang §1] đề cập upload quốc tế "trước 90 phút trước STD" và còn nhắc các mốc 130, 180, 200 phút `[cần xác nhận]`. Prototype ghi chú "[cần xác nhận]" ở ngưỡng quốc tế — đúng. Nhưng bản thân tooltip "Upload chuyến quốc tế: 90 phút trước STD" trình bày như một sự thật đã chốt, trong khi nguồn ghi rõ "các mốc 130, 180, 200 phút cần làm rõ thêm". Nên đánh dấu tooltip này là [TBD] rõ hơn thay vì viết dứt khoát.

**[MK-007] Cột OCC thiếu nhóm phân tách (Miller Law)**

Bảng OCC có 11 cột (Alert, Flight No, REG, Route, STD, STA, State, Dispatch, Pilot, MEL, Detail) hiển thị liên tục không có column group header hay divider. Nguồn [12062026 §4,§6] không yêu cầu nhóm cột cụ thể, nhưng với màn hình realtime dày đặc, không nhóm cột theo chủ đề (Identity | Schedule | Status | Actions) khiến người dùng phải quét toàn hàng mỗi lần tìm thông tin — vi phạm Miller (chunking).

**[MK-008] Dispatch dialog: trường "Dispatcher" hiển thị [TBD] — đúng nhưng cần làm rõ**

Dialog Release hiển thị trường Dispatcher là "[TBD — chưa xác nhận: danh sách dispatcher theo ca]". Đây là preservation đúng của open question. Tuy nhiên trong môi trường demo/trình bày, người xem có thể nhầm tưởng đây là lỗi UI. Nên bổ sung nhãn placeholder rõ hơn: "Dispatcher: [Auto-filled from session — TBD]".

**[MK-009] Tab Flight Detail hiển thị tiếng Việt không dấu trong nhiều chỗ**

Trong HTML của màn Flight Detail (khu vực comments và một số text node), có sử dụng tiếng Việt không dấu: "Phat sinh", "Chua xu ly", "Can theo doi", "Lich su thay doi to bay", "Co truong", "Co pho", v.v. Tuy đây là trong tab content (có thể là copy-paste từ fragment trước khi chuẩn hóa), nhưng một số text node thực sự hiển thị ra màn hình: "Canh bao (2)", "Canh bao MEL", "OFP doi tai", "Phat sinh: 06:30 UTC", v.v. trong tab Cảnh báo của Flight Detail. Người dùng thực tế sẽ nhìn thấy text không dấu này.

**[MK-010] `data-mat="mat-toolbar"` cho filter bar Dispatch là không đúng**

Dòng 972: `<div class="tool-row" data-mat="mat-toolbar" ...>` dùng cho thanh filter của Dispatch. Thanh filter này không phải `<mat-toolbar>` — nó là một row chứa form field và button. `mat-toolbar` là component navigation bar, không phải container cho filter controls. Nên đổi thành `data-mat="filter-row (custom)"` hoặc bỏ `data-mat` vì không có AM component tương ứng.

**[MK-011] Màn hình chiều Dispatch không xử lý trạng thái "Chưa có OFP"**

Nguồn [15062026 §II.2] quy định 4 trạng thái OFP: (1) chưa có OFP, (2) có OFP chưa release, (3) Dispatch released Pilot chưa, (4) cả hai released. Bảng Dispatch v0.3 chỉ có 4 dòng mẫu thể hiện trạng thái 2, 3, 4 — không có dòng mẫu "chưa có OFP" (dấu gạch ngang per nguồn). Đây không phải lỗi nghiêm trọng (dữ liệu mẫu) nhưng cần có ít nhất một dòng mẫu trạng thái 1 để demo đầy đủ 4 trạng thái từ nguồn.

**[MK-012] Danh sách lý do Unrelease tự bổ sung options không rõ nguồn**

Dialog Unrelease cung cấp dropdown lý do gồm: "Đổi tổ quay (dầu thay đổi)", "Thay đổi tải trọng", "Cập nhật NOTAM/thời tiết mới", "Tổ bay yêu cầu", "[TBD — Lý do khác]". Nguồn [11062026-chieu §II.4] chỉ đề cập lý do mẫu là "tổ quay cũ chở ít dầu hơn tổ quay mới" và không liệt kê danh sách đầy đủ. 3 options đầu không có nguồn chứng minh — là nội dung tự thêm ở mức "có thể chấp nhận được" nhưng cần gắn `[TBD]` cho mỗi option chưa được nguồn xác nhận.

**[MK-013] Lịch sử phiên bản OFP chỉ có 2 dòng; trường "Lấy thêm tải" không có nguồn rõ ràng**

Tab Flight Release trong Flight Detail hiển thị bảng lịch sử OFP với cột "Lấy thêm tải". Nguồn [12062026 §2] đề cập "lượng phi công confirm, có lấy thêm tải hoặc dầu (extra) hay không và lý do kèm theo" — cột này có nguồn. Tuy nhiên tên cột "Lấy thêm tải" chưa đúng nghĩa — nguồn gọi là "extra" hoặc "Payload Extra" per [11062026-chieu §II.10]. Cần đổi tên cột cho khớp thuật ngữ nguồn.

**[MK-014] MEL Active dashboard thiếu cột "BCAO" / phân loại mức ảnh hưởng**

Nguồn [17062026 §3] yêu cầu dashboard MEL Active "phân loại theo mức độ ảnh hưởng khai thác, phục vụ báo cáo BCAO hàng ngày." Bảng MEL Active v0.3 có filter "Tất cả mức ảnh hưởng / Có penalty nhiên liệu / Gần hết hạn" — tốt. Nhưng không có cột "Mức ảnh hưởng khai thác" rõ ràng hay cột hỗ trợ BCAO. Nguồn [17062026 §3] đề cập "TOSS nhận danh mục MEL active từ AMOS, mapping với danh sách MEL item cần cảnh báo do Nga xây dựng và duy trì" — cơ chế mapping này không được reflect trong UI.

---

### Gợi ý cải thiện

**[MK-015] Nút "Release ngay" (filled/red) nằm trong bảng cạnh các nút thao tác thường — nguy cơ Fitts**

Trong bảng Dispatch, với dòng VN 302 (quá hạn), nút "Release ngay" (btn-filled, màu đỏ chủ đạo) là nút to, nổi bật, đứng đầu cột hành động. Khi đã release, nút "Unrelease" (btn-text, màu đỏ lỗi) xuất hiện ngay cùng vị trí. Nguy cơ: người dùng click nhầm Unrelease khi muốn xem chi tiết, hoặc Release nhầm cho dòng sai khi mắt đang theo dõi màu. Cần thêm khoảng cách hoặc thêm bước confirm nhỏ cho nút Unrelease (vốn đã có dialog confirm — tốt) và cân nhắc tách nút Unrelease khỏi cột hành động chính.

**[MK-016] Alert dot đỏ nhấp nháy không đủ phân biệt theo Von Restorff**

Cảnh báo nguy cấp trong OCC dùng chấm đỏ nhấp nháy (màu + animation). Nguồn [12062026 §7] mô tả "cảnh báo đỏ = action ngay". Von Restorff yêu cầu phân biệt bằng màu + icon + hình dạng. Hiện tại: alert dot chỉ là chấm tròn màu đỏ — thiếu icon phân biệt loại cảnh báo. Gợi ý bổ sung: icon Material Symbols khác nhau cho từng loại cảnh báo (ví dụ `warning` cho MEL, `schedule` cho delay, `flight_takeoff` cho chưa release).

**[MK-017] Không có skeleton/spinner cho bảng OCC khi "refresh"**

Nút Refresh trên OCC hiện tại gọi `occ_renderTable()` ngay lập tức (data đã có sẵn trong JS). Trong production, bảng sẽ cần load từ server qua webhook. Prototype không có placeholder skeleton hay spinner — vi phạm Doherty (không có feedback <400ms cho realtime load). Đề xuất thêm một state "loading" giả lập (spinner brief 300ms) để prototype thể hiện đúng flow production.

**[MK-018] Tooltip hover trên REG cell mảnh và khó đọc trên dark background**

REG tooltip hiển thị "VNA298 → VNA302 07:41 UTC" trên nền `#333`. Với font-size 11px và khoảng cách nhỏ, tooltip khó đọc khi màn có nhiều thông tin. Gợi ý: tăng padding (8px 12px), tăng font-size lên 12px, và cân nhắc format 2 dòng: "VNA298 → VNA302" / "07:41 UTC" để phân tách rõ hơn.

**[MK-019] Flight Detail — tab Tổ bay không có "lý do thay đổi" trong timeline**

Timeline thay đổi tổ bay có "05:30 UTC — Thay đổi PIC: Pham Duc Dung → Nguyên Van An (su co suc khoe)". Nguồn [12062026 §2] yêu cầu ghi "ai đổi và đổi lúc nào" — đã đủ. Nhưng nguồn cũng yêu cầu "[canh bao doi to bay da gui Dispatcher]" — cần thêm indicator rằng cảnh báo này đã được gửi hay chưa để flow đầy đủ hơn.

**[MK-020] Màn MEL Master: số lượng tàu bay trong selector chỉ có 4 loại (A321/A320/A319/787-9)**

Nguồn [17062026 §2] đề cập "khoảng 3.000 item / loại tàu" và VNA có đội tàu đa dạng. Selector hiện có 4 option — phù hợp với dữ liệu mẫu. Tuy nhiên thiếu Boeing 787-10 và các loại khác nếu cần demo thực tế hơn. Không nghiêm trọng vì đây là dữ liệu mẫu — chỉ ghi nhận.

---

## Yêu cầu bị bỏ sót trong phạm vi 4 màn hình đã xây

| # | Yêu cầu từ nguồn | Nguồn | Màn liên quan | Trạng thái trong UI |
|---|---|---|---|---|
| 1 | Màn tập trung kiểm tra đầu ca (Start-of-Shift Check) gồm 9 nhóm nội dung | [11062026-sang §4] | OCC hoặc Dispatch | Không có — ngoài phạm vi v0.3 |
| 2 | Cảnh báo "Chuyến bay thiếu tài liệu" | [11062026-chieu §II.1] | Dispatch/OCC | Không có |
| 3 | Cảnh báo "Tổ bay chưa tải tài liệu mới nhất" (kết nối MO Plus) | [11062026-chieu §II.1] | Dispatch | Không có |
| 4 | Cảnh báo "Chuyến không thường lệ — OFP chưa có STS/HEAD" | [11062026-chieu §II.2] | Dispatch | Không có |
| 5 | Upload Weather Multi-Flight (chọn khoảng hiệu lực, gắn file nhiều chuyến) | [11062026-chieu §II.9] | Dispatch | Không có |
| 6 | Báo cáo Pallet Relief với cột Payload Extra / delta | [11062026-chieu §II.10] | Dispatch (báo cáo) | Không có |
| 7 | Chức năng sửa OFP (Flight Level, dầu mỡ, giờ, ADC) | [11062026-chieu §II.11] | Dispatch | Không có |
| 8 | Backup Lido lỗi: download file raw template, upload lại | [11062026-chieu §II.13] | Dispatch | Không có |
| 9 | Cột "Thời tiết / NOTAM" trong bảng OCC (ngoài tab Flight Detail) | [12062026 §4, §6] | OCC | Không có trong bảng — chỉ có trong Flight Detail |
| 10 | Cột ETA/ETD thực tế từ ACARS; cột IN/ARR | [12062026 §12; 11062026-chieu §II.6] | OCC | Bảng OCC chỉ có STD/STA kế hoạch, không có ETA/ETD thực tế |
| 11 | Profile cá nhân / lưu cấu hình cột và filter | [12062026 §5] | OCC | Không có |
| 12 | Phân quyền theo khu vực (châu Âu/Mỹ/Hàn…) — hiển thị rõ trong UI | [12062026 §5] | OCC | Filter Carrier có nhưng chỉ có VN/BL; không có khu vực |
| 13 | Cột Flight Number suffix D/Z với màu vàng/đỏ | [12062026 §11] | OCC | Không có cột suffix |
| 14 | Cột ETA/IN/ARR chuyển xanh khi nhận tín hiệu IN | [12062026 §12] | OCC | Không có |
| 15 | Cảnh báo vào gate chậm (late gate) | [12062026 §8] | OCC | Không có |
| 16 | Tab Cảnh báo: raise-time + trạng thái đã/chưa xử lý rõ ràng (không chỉ màu chip) | [12062026 §2] | Flight Detail | Có raise-time nhưng không có filter/sort theo trạng thái xử lý |
| 17 | Dispatcher quyết định áp dụng x1/x2/x3 trong ngữ cảnh chuyến cụ thể (không chỉ trong Master MEL form) | [17062026 §3] | Flight Detail tab Aircraft, Dispatch | Chỉ có trong Master MEL metadata form; không có trong ngữ cảnh chuyến cụ thể |
| 18 | Dashboard tổng hợp MEL Active theo đội tàu cho Trực ban trưởng + BCAO | [17062026 §3] | MEL | Có sub-tab "MEL Active toàn đội tàu" — PASS một phần; thiếu cột phân loại BCAO |
| 19 | Cơ chế 3 nhóm giám sát tổng quan: chưa cất cánh / đang bay / đã hạ cánh | [11062026-chieu §II.6] | OCC | Không có nhóm rõ ràng; KPI có "Đang bay (ENR)" nhưng không phân vùng bảng |
| 20 | PIC Confirm (cột theo dõi riêng phi công xác nhận đã đọc OFP) | [15062026 §II.2, §II.3] | Dispatch | Không có cột PIC Confirm riêng — chỉ có cột Pilot (Release) |

**Ghi chú:** Danh sách trên chỉ liệt kê các yêu cầu trong phạm vi 4 màn đã được xây dựng. Các màn chưa được xây (Phase 3–6 Dispatch, quản lý phép bay, chứng chỉ tổ bay, taxi time, v.v.) không được tính vào điểm phủ của v0.3.

---

## Phân tích UX-laws (checklist heuristic)

### Jakob — Quy ước OCC quen thuộc

**Kết quả:** Đạt một phần.

Bố cục tổng thể (sidebar + topbar + table) bám sát quy ước OCC/ops dashboard thông dụng. Dark mode đúng với yêu cầu nguồn. Bộ màu 4 trạng thái (đỏ/vàng/xanh/không màu) khớp với mô tả nguồn [12062026 §7]. Tuy nhiên: sử dụng nhãn tiếng Việt cho giao diện ops (MK-001) là bất thường và không khớp với kỳ vọng của dispatcher quen dùng hệ thống tiếng Anh.

### Hick — Màn quyết định nhanh không quá tải

**Kết quả:** Đạt một phần.

Màn Dispatch Release: chỉ có 1 nút hành động chính ("Release ngay" / "Release") per row — tốt. Dialog xác nhận Release đơn giản, ít lựa chọn. Tuy nhiên: Filter bar Dispatch có 3 controls cùng lúc (search + state + filter button) — chấp nhận được. Dropdown lý do Unrelease có 5 options — hợp lý. Màn OCC: 4 filter controls + 1 button trong một row — biên của Hick nhưng vẫn trong ngưỡng.

### Miller — Chunking bảng dày

**Kết quả:** Cần cải thiện.

OCC table 11 cột không có column group header hay visual divider. Dispatcher phải scan toàn row mỗi lần muốn tìm cột REG, Dispatch, hay Pilot. Không có "frozen left column" cho Flight No (cột định danh). Khi scroll ngang, người dùng mất context. Đây là điểm yếu đáng kể cho màn realtime.

### Fitts — Kích thước nút và tách biệt hành động nguy hiểm

**Kết quả:** Đạt một phần.

Nút "Release ngay" và "Release" đủ lớn (btn-filled padding 7px 14px). Dialog xác nhận có hai nút "Hủy" và "Xác nhận Release" tách biệt — tốt. Nút "Xác nhận Unrelease" dùng màu đỏ lỗi (`--md-error`) để phân biệt hành động phá hủy — tốt. Điểm cần cải thiện: trong bảng Dispatch, sau khi release, nút "Unrelease" xuất hiện đúng vị trí cũ của nút "Release" — không có khoảng trống hay separator giữa hành động thường và hành động undo nguy hiểm (MK-015).

### Von Restorff — Cảnh báo nguy cấp nổi bật

**Kết quả:** Cần cải thiện.

Alert dot đỏ nhấp nháy dùng animation blink — tốt về màu và chuyển động. Tuy nhiên: chỉ dùng chấm tròn cho tất cả cảnh báo (MEL, delay, dispatch overdue, weather) — thiếu hình dạng và icon phân biệt loại nguy cơ. Nguồn [12062026 §7] mô tả 4 trạng thái màu nhưng không phân biệt hình icon theo loại — thông tin này cần clarify với nguồn. Hiện tại không rõ liệu đây là quyết định thiết kế hay thiếu sót. Gắn 🟡.

### Doherty — Phản hồi <400ms, không nhảy layout

**Kết quả:** Không kiểm chứng được đầy đủ (prototype static).

JavaScript filter/search trong OCC và Dispatch hoạt động tức thì trên data tĩnh — đạt trong context prototype. Không có skeleton/spinner cho bất kỳ loading state nào (MK-017). Clock update mỗi 30 giây (interval 30000ms) — quá lâu cho màn hình realtime dispatch; nguồn yêu cầu webhook realtime [11062026-chieu §II.6]. Không có trạng thái loading giả lập cho AMOS sync, ACARS update.

### Tesler — Hệ thống gánh phức tạp cố hữu

**Kết quả:** Đạt.

Bảng ngưỡng thời gian release OFP (210/75/60 và 270/90/75 phút) được pre-fill trong card thông tin — tốt, dispatcher không cần nhớ. MEL penalty được tổng hợp sẵn từ Master MEL và hiển thị trong tab Aircraft/MEL — tốt. Form metadata MEL có pre-fill từ dữ liệu mẫu. Progressive disclosure được thể hiện qua tab group (Cảnh báo ở trước, chi tiết ở tab sâu hơn) — tốt.

### Postel — Form hỏi tối thiểu, chấp nhận đa dạng đầu vào

**Kết quả:** Đạt một phần.

Form metadata MEL hỏi đúng các trường cần thiết (Fuel Factor %, Payload Reduction kg, Altitude Cap FL, Autopilot, Sân bay, Ghi chú). Dialog Release chỉ confirm, không yêu cầu nhập thêm — tốt. Tuy nhiên: input "Fuel Factor (%)" dùng `type="text"` không phải `type="number"` — chấp nhận được trong prototype nhưng DEV cần lưu ý. Search box chấp nhận text tự do — tốt.

---

## Danh sách [TBD] cần điền (từ [cần xác nhận] trong nguồn, hiện có trong prototype)

| # | Nội dung [TBD] | Vị trí trong prototype | Nguồn gốc open question |
|---|---|---|---|
| 1 | Danh sách trạng thái vòng đời chuyến (GRD/BRD/OUT/ENR/IN/ARR) — định nghĩa và quy tắc chuyển trạng thái | OCC filter dropdown, OCC table state column | [12062026 §IV.9 — cần SME xác nhận] |
| 2 | Cơ chế giữ chuyến đường dài chưa đáp ngoài time window (để trôi / giữ / filter phụ) | OCC time window dropdown option "Custom" | [12062026 §IV.4 — chưa chốt] |
| 3 | Ngưỡng "vào gate chậm" tính theo phút trễ so với ETA kết điểm | Không có trong prototype (yêu cầu bị bỏ sót) | [12062026 §IV.5] |
| 4 | Quy tắc clear/giữ đỏ sau khi chuyến cất cánh cho từng loại cảnh báo | OCC alert column | [12062026 §IV.6] |
| 5 | Tên khu vực điều phái (châu Âu, Mỹ, Hàn…) dùng cho phân quyền dữ liệu | OCC carrier filter — chưa có khu vực | [12062026 §IV.3] |
| 6 | Các mốc upload OFP quốc tế: 130, 180, 200 phút và phân loại chuyến tương ứng | Dispatch threshold card tooltip quốc tế | [11062026-sang §IV.1] |
| 7 | Quy ước phiên bản OFP sau Unrelease: auto-tăng (R3) hay sub-version (2.1) | Dialog Unrelease, note dưới bảng OFP history | [11062026-chieu §IV.4; 12062026 §IV.7] |
| 8 | Danh mục mã loại chuyến đầy đủ (O, Z, G, H, A, P, V, S…) và mã nào cần STS/HEAD | Không có trong prototype | [11062026-chieu §IV.1] |
| 9 | Danh sách đầy đủ lý do Unrelease (hiện prototype tự điền 4 options) | Dialog Unrelease dropdown | [11062026-chieu §II.4] |
| 10 | Dispatcher field trong dialog Release: cơ chế auto-fill tên dispatcher theo ca | Dialog Release, trường "Dispatcher: [TBD]" | [15062026 §II.3] |
| 11 | Cơ chế tích hợp AMOS → TOSS: API real-time / polling / batch | MEL Active sub-tab, ghi chú "Đồng bộ AMOS: 09:40 UTC" | [17062026 §IV.3 — KS-56] |
| 12 | Định dạng MEL Boeing ("FILMATER") — tên chính xác và khả năng import | MEL Cập nhật phiên bản tab, ghi chú bên dưới | [17062026 §IV.4 — KS-57] |
| 13 | Vấn đề "insert vs update" trong Lido ePot XML khi import MEL | MEL Cập nhật phiên bản tab, ghi chú "[TBD · KS-59]" | [17062026 §IV.6 — KS-59] |
| 14 | Trường hợp x4 — ETOPS trong dialog cập nhật MEL Rev.36 | MEL dialog cập nhật — field "x4 — ETOPS [TBD]" | [17062026 §IV chưa xác nhận] |
| 15 | VMA — viết tắt đầy đủ và ngưỡng biên an toàn (500m đã nhắc trong nguồn nhưng chưa chính thức) | Flight Detail tab Thời tiết / NOTAM, ghi chú VMA | [11062026-sang §IV.2] |

---

## Ghi chú về phạm vi review này

Review này không kết luận về:
- **Accessibility:** prototype không cung cấp đủ thông tin để đánh giá contrast ratio thực tế, screen reader support, keyboard navigation.
- **Hiệu năng production:** data tĩnh trong JS không phản ánh độ trễ network/database thực tế.
- **Tác động visual định lượng:** không có user testing hay A/B test.

Những đánh giá UX trong review này là heuristic (dựa trên định luật UX và đối chiếu nguồn), không phải kết quả đo lường.

---

*Review v0.1 — 2026-06-18 — Thực hiện bởi ui-reviewer agent v1.1. Các phát hiện cần được BA Lead xem xét và quyết định xử lý trước phiên review tiếp theo.*
