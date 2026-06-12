---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
survey_date: "2026-06-11"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Phỏng vấn Dispatcher buổi chiều 11/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi chiều 11/06/2026 (Phỏng vấn Dispatcher)

> Báo cáo này tổng hợp **buổi chiều 11/06/2026** của buổi phỏng vấn điều phái viên (Dispatcher), nối tiếp buổi sáng cùng ngày. Trọng tâm: hoàn thiện danh sách cảnh báo còn lại, đi sâu **cơ chế Dispatch Release ↔ Captain's Release ↔ quản lý phiên bản OFP** giữa TOSS – MO Plus – Lido, làm rõ **các bước (step) trong quy trình điều phái** (Pre-Flight Prep → Pre-Flight Briefing → Post-Release Transition → Monitoring → Post-Flight), và một số chức năng phụ trợ (upload file thời tiết đa chuyến, payload extra, backup Lido, báo cáo Pallet Relief).

## I. Thông tin chung

- **Thời gian:** buổi chiều ngày 11/06/2026 (nối tiếp buổi sáng).
- **Mục đích:** (1) hoàn tất danh sách cảnh báo còn thiếu của khâu chuẩn bị chuyến bay; (2) thống nhất cơ chế Release/Unrelease OFP và đồng bộ phiên bản giữa TOSS–MO Plus–Lido; (3) chốt phạm vi các bước (step) còn lại của quy trình điều phái (Post-Release Transition, Monitoring, Post-Flight); (4) bàn các chức năng phụ trợ: upload file thời tiết đa chuyến (Weather Multi-Flight), payload extra, backup Lido, báo cáo Pallet Relief, sửa OFP để bốc tách MO Plus.
- **Đối tượng phỏng vấn:** điều phái viên (Dispatcher) của VNA — đại diện khối khai thác chuyến bay.
- **Phía khảo sát:** đội phân tích nghiệp vụ TOSS.
- **Cảnh báo chất lượng ghi âm (ASR):** chất lượng ghi âm buổi chiều **kém hơn buổi sáng**; nhiều đoạn lặp/đứt câu, nhiều thuật ngữ kỹ thuật bị nhận dạng sai (ASR đọc "OSP" thành "OFP" và ngược lại nhiều chỗ; "ACARS" thành "ACAD"/"A-Card"; "Pallet Relief" thành "Palloy X-cha"; "IFV" thành "Lapplock"; "Show on" thành "showdown"; "Flight Level" thành "Tí SL"; "MO Plus" thành "Emo/Mo/màu O"…). Các đoạn không suy luận chắc chắn được giữ + gắn cờ `[cần xác nhận]`.

---

## II. Nội dung trao đổi

### 1. Bổ sung cảnh báo "chuyến bay thiếu tài liệu" và "tổ bay chưa tải tài liệu mới nhất"

#### Yêu cầu
- Tiếp nối danh sách cảnh báo của buổi sáng (đã có ~15 cảnh báo). Điều phái nhắc lại hai cảnh báo còn thiếu liên quan đến **tài liệu chuyến bay**:
  - **Chuyến bay thiếu tài liệu:** đến thời điểm đáng lẽ phải có tài liệu (OFP, NOTAM, thời tiết) nhưng tài liệu chưa lên hệ thống, hoặc luồng tự động (Lido → MO Plus) bị lỗi không đẩy được.
  - **Tổ bay chưa tải tài liệu mới nhất:** tài liệu đã được tải lên MO Plus nhưng vì lý do gì đó tổ bay chưa download phiên bản mới, hoặc version đang lệch.
- Anh Dũng (Dispatcher) trước đó đã đề xuất cảnh báo này để có thể chủ động nhắc nhở tổ bay với các chuyến bay quan trọng.

#### Thảo luận – Đề xuất
- MO Plus hiện tại có ghi nhận history tổ bay đã vào xem/download tài liệu hay chưa → có sẵn cơ sở dữ liệu để TOSS đối chiếu.
- TOSS cần lấy dữ liệu này từ MO Plus và phát cảnh báo ngược về điều phái khi tổ bay chưa download bản tài liệu mới nhất trong khoảng thời gian quy định trước chuyến bay.

#### Kết luận
- Bổ sung hai cảnh báo vào module Dispatch của TOSS: **"Chuyến bay thiếu tài liệu"** và **"Tổ bay chưa tải tài liệu mới"**.
- TOSS cần kết nối với MO Plus để lấy trạng thái download tài liệu của tổ bay (phục vụ cảnh báo thứ hai).

### 2. Cảnh báo chuyến không thường lệ thiếu STS/HEAD trong OFP

#### Yêu cầu
- Trong OFP của chuyến **không thường lệ** (chuyên cơ/VIP, ferry, charter, chuyến đặc biệt) cần có **STS/HEAD** (chỉ thị trạng thái đặc biệt trong mục 18 ATC FPL theo ICAO Doc 4444). Hiện trạng: một số chuyến không thường lệ phát hành nhưng **thiếu STS/HEAD** trong OFP → vướng quy định và mất quyền claim phí khí thải về sau.

#### Thảo luận – Đề xuất
- Cơ chế nhận diện chuyến không thường lệ: dựa vào **mã loại chuyến (flight type code)** — VNA sử dụng các code O, Z, G, H, A, P, V, S, H… [cần xác nhận danh mục đầy đủ và ý nghĩa từng code].
  - Ở **ATC FPL**, chuyến thường lệ là `S` (Scheduled); chuyến không thường lệ chuyển sang `N` (Non-scheduled) — TOSS dùng code O để nhận diện (ASR đọc lệch nhưng ngữ cảnh cho thấy code phân biệt qua **Flight Type/Service Type**).
- Yêu cầu cảnh báo: khi TOSS nhận chuyến không thường lệ (code O) mà OFP tương ứng **không có STS/HEAD** → cảnh báo điều phái yêu cầu chỉnh OFP bổ sung STS/HEAD.
- Lý do nghiệp vụ then chốt: ngoài tuân thủ quy định, STS/HEAD là **căn cứ để hãng claim miễn trừ phí khí thải (CORSIA/ETS [cần xác nhận tên cơ chế])** — không có STS/HEAD thì phải chứng minh bằng tài liệu khác, "cãi nhau với người ta" về việc miễn trừ.

#### Kết luận
- Bổ sung cảnh báo: **"Chuyến không thường lệ — OFP chưa có STS/HEAD"** vào TOSS.
- Phạm vi cảnh báo: ở giai đoạn **trước chuyến bay** (trước thời điểm Captain's Release).
- Sau khi MO Plus đã release phần này, TOSS không cảnh báo nữa.
- Danh mục mã loại chuyến (O, Z, G, H, A, P, V, S…) và cơ chế chuyển sang `N` ở ATC FPL: cần làm rõ buổi sau.

### 3. Quy trình điều phái chia 6 giai đoạn — phạm vi TOSS giai đoạn này

#### Yêu cầu
- Đội khảo sát cần thống nhất với điều phái về **kiến trúc quy trình** của module Dispatch: nó gồm bao nhiêu giai đoạn (step/phase), TOSS đảm nhận giai đoạn nào, giai đoạn nào nằm ở hệ thống khác.

#### Thảo luận – Đề xuất
- Phía khảo sát chia quy trình điều phái thành **6 phần (phase)** chính:
  1. **Pre-Flight Preparation** — kiểm tra đầu ca, nạp dữ liệu, xem các cảnh báo phase 1 (đã bàn buổi sáng).
  2. **Pre-Flight Briefing** — đánh giá các cảnh báo phase 1, quyết định làm OFP, gửi CCD [cần xác nhận viết tắt; nhiều khả năng là **CSD — Crew Schedule Document** hoặc **CRD — Crew Release Document**] và đóng gói tài liệu.
  3. **Post-Release Transition** — sau khi Dispatch Release, hệ thống vẫn quét cảnh báo liên tục; khi có thay đổi (NOTAM, thời tiết, tàu, tải) → cập nhật OFP version mới và làm Release lại.
  4. **Pre-Departure Monitoring** — theo dõi chuyến chuẩn bị khởi hành (taxi-out, cất cánh đúng giờ/trễ); tích hợp ACARS để lấy mốc thời gian thực tế.
  5. **In-Flight Monitoring** — giám sát chuyến đang bay (Flight Watch); cập nhật cảnh báo NOTAM/thời tiết en-route ảnh hưởng phần đường còn lại.
  6. **Post-Flight & Shift Handover** — tổng hợp tình hình, sinh báo cáo, bàn giao ca.
- Điều phái xác nhận: hôm nay (sáng + chiều buổi đầu) **mới chỉ xong Phase 1 + một phần Phase 2**. Sẽ tiếp tục các phase còn lại ở buổi/đợt khảo sát kế tiếp.
- Tiếp cận thiết kế: mỗi phase trên TOSS gồm 3 lớp — **giao diện**, **trường thông tin** và **logic kiểm tra / cảnh báo**; khi nào cảnh báo, hiển thị màu sắc gì, hành động gì là hợp lý — cần xác định cho từng cảnh báo.

#### Kết luận
- Quy trình Dispatch trên TOSS chia **6 phase**, tên tạm chốt: **Pre-Flight Prep**, **Pre-Flight Briefing**, **Post-Release Transition**, **Pre-Departure Monitoring**, **In-Flight Monitoring**, **Post-Flight & Handover**.
- Buổi sáng + đầu buổi chiều đã xong Phase 1; Phase 2 đang dở dang (cảnh báo bổ sung như §1, §2 trên).
- Các phase 3–6 sẽ tiếp tục bàn ở buổi/đợt kế tiếp; phạm vi Phase 6 sơ bộ chỉ là **báo cáo + bàn giao ca**, không phát sinh thao tác.

### 4. Cơ chế Release / Unrelease OFP và quản lý phiên bản (TOSS – MO Plus – Lido)

> Đây là phần nội dung **dài và quan trọng nhất** của buổi chiều, làm rõ kiến trúc dữ liệu OFP qua ba hệ thống.

#### Yêu cầu
- Mô hình hiện tại: Lido tự sinh OFP → adapter lấy về → bắn sang MO Plus → MO Plus gọi ngược về Lido khi cần. **Chưa có TOSS**.
- Khi TOSS được đưa vào: TOSS đứng giữa, **quyết định MO Plus dùng phiên bản nào**, nhưng TOSS **không phải là nguồn dữ liệu gốc**.
- Vấn đề cần giải: phi công có thể chấp nhận một version cũ thay vì version mới — TOSS phải hỗ trợ trường hợp này mà không làm rối luồng dữ liệu.

#### Thảo luận – Đề xuất

**Khung tình huống ví dụ (xuyên suốt cuộc thảo luận):**
- Lido sinh OFP lần lượt version 1, 2, 3. Phi công đã "accept" version 2. Sau đó điều phái release version 3.
- Nhưng vì lý do tổ bay/khai thác (vd tổ quay cũ chở ít dầu hơn tổ quay mới; tổ quay mới buộc phải xả dầu cho mấy người ra), tổ bay **đòi quay về version 2** thay vì dùng version 3.

**Phương án ban đầu (bị loại):** Lido sinh tiếp version 4 với thông số của version 2, push tiếp lên MO Plus.
- Nhược điểm: tăng thời gian xử lý của điều phái + Lido, phải làm lại OFP cho mỗi lần quay lui, dễ rối/lỗi.

**Phương án thống nhất:**
1. **TOSS lưu danh sách phiên bản OFP** lấy từ luồng MO Plus / adapter (đã có sẵn).
2. Khi cần quay về version cũ, điều phái **bấm "Unrelease" version hiện tại** trên TOSS.
3. TOSS **chọn version cũ hơn** (vd version 2) → đẩy version đó về MO Plus với một **revision/version number mới** (vd 2.1 hoặc auto-tăng).
4. Phi công **không phải vào Lido**, không phải release lại từ đầu — chỉ thấy bản mới trên MO Plus, "đánh lại" cập nhật.
5. Điều phái **không phải lên Lido** thao tác lại — toàn bộ xử lý trên TOSS.

**Nguyên tắc version:**
- "Lido không có version, chỉ có **OFP number**. **Version là do mình (TOSS) gán**." → TOSS gán version theo thứ tự nhận: nhận lần 1 = R1, nhận lần 2 = R2…
- Khi quay về version cũ: TOSS bắn ra một version mới (auto tăng), nhưng **nội dung là của bản cũ** (vd "v4" với data của v2; hoặc "v2.1") — quy ước cụ thể TOSS tự định nghĩa.
- Trên MO Plus: cơ chế **luôn lấy bản mới nhất** ("latest"); để quay lui, TOSS đẩy bản cũ **dưới dạng version mới hơn** thì MO Plus mới override được.

**Cơ chế Confirm/Unconfirm trên MO Plus:**
- Khi TOSS Unrelease một version → MO Plus **reset trạng thái Confirm Release** của phi công về 0; phi công phải Confirm lại trên version mới.
- Khi TOSS Release version mới → MO Plus tiếp tục yêu cầu phi công Confirm.

**Cơ chế chọn version để release lại:**
- Khi Unrelease, TOSS hiển thị danh sách các version OFP **dưới** (lịch sử) → điều phái chọn version muốn release lại; TOSS bắn version đó lên MO Plus dưới dạng revision mới.
- Cho phép giảm thao tác cho điều phái và Lido: không phải sinh thêm OFP mới từ Lido cho mỗi lần "đi tới rồi quay lui".

**Backup khi Lido lỗi:**
- TOSS phải có chức năng **dự phòng cho adapter**: nếu adapter Lido lỗi, điều phái có thể **upload thủ công file OFP** lên TOSS → TOSS đẩy lên MO Plus.

#### Kết luận
- **Mô hình version OFP:** Lido có OFP number; TOSS gán version (R1, R2…) theo thứ tự nhận. Version chỉ tồn tại trên TOSS và MO Plus.
- **Unrelease là thao tác chủ động trên TOSS:** khi điều phái Unrelease, TOSS sinh revision mới với nội dung của version cũ (lấy ngược từ danh sách OFP của MO Plus) → bắn sang MO Plus → reset Confirm Release của phi công → phi công Confirm version mới.
- **Phi công không thao tác Lido**, điều phái cũng **không cần lên Lido** trong tình huống quay lui — toàn bộ xử lý qua TOSS.
- **Backup Lido:** TOSS có chức năng cho điều phái upload OFP thủ công khi adapter Lido lỗi, đẩy lên MO Plus.
- **Phụ thuộc tích hợp MO Plus:** MO Plus phải xử lý reset trạng thái Confirm Release của phi công khi nhận revision mới từ TOSS (luồng "đè" version cũ bằng version mới). Cần khớp với đội MO Plus về cơ chế notification trên app.

### 5. Phase 3 — Post-Release Transition: TOSS chỉ quét cảnh báo + tham chiếu, KHÔNG cập nhật OFP

#### Yêu cầu
- Phase 3 ("Post-Release Transition") định nghĩa: sau khi đã Release OFP, vẫn tiếp tục **quét cảnh báo liên tục** (NOTAM, thời tiết, tàu bay, tải…) cho đến khi tàu bay cất cánh.
- Vấn đề cần làm rõ: việc **làm lại OFP version mới** ở phase này nằm ở đâu — TOSS hay Lido?

#### Thảo luận – Đề xuất
- Điều phái khẳng định: **thao tác cập nhật OFP version mới (post-release) nằm ở Lido**, không nằm trên TOSS.
- TOSS ở phase 3 chỉ làm: **quét cảnh báo + tham chiếu/đề xuất cập nhật OFP**. Khi có cảnh báo, điều phái đánh giá; nếu cần cập nhật → mở Lido làm OFP mới (như §4 đã quy ước).
- Lido **không phát cảnh báo "thời tiết / NOTAM mới"** kiểu real-time — Lido chỉ cảnh báo tại thời điểm "làm bước bay" (sinh OFP). Đây là lý do TOSS phải đảm nhận monitoring & cảnh báo liên tục.
- Phạm vi cảnh báo phase 3: gồm thay đổi loại tàu, thay đổi tàu, tải, NOTAM, thời tiết — về cơ bản giống các cảnh báo phase 1 nhưng vẫn duy trì cho đến lúc cất cánh.

#### Kết luận
- TOSS Phase 3 **chỉ làm cảnh báo + tham chiếu**, không có chức năng cập nhật OFP trực tiếp.
- Khi điều phái cần làm OFP version mới sau Release → mở Lido (Phase 3 step "cập nhật tài liệu OSP version mới" thuộc Lido).
- TOSS duy trì quét cảnh báo **liên tục từ Release đến cất cánh**; khi cất cánh thì các cảnh báo chuẩn bị chuyến bay (tải, dầu mỡ…) tắt; cảnh báo ảnh hưởng đường bay (NOTAM, thời tiết en-route) **vẫn duy trì cho đến khi hạ cánh**.

### 6. Phase 4–5 — Monitoring: tích hợp ACARS, refresh real-time, cơ chế hiển thị "nhấp nháy"

#### Yêu cầu
- Phase 4–5 (Pre-Departure Monitoring + In-Flight Monitoring): TOSS cần một **màn hình overview** để điều phái mở cả ngày, theo dõi từng chuyến bay đang ở **giai đoạn (phase) nào** (taxi-out, cất cánh, đang bay, taxi-in…).
- Yêu cầu UX: cập nhật **real-time**, không bắt điều phái nhấn refresh; có cơ chế cảnh báo bằng màu/nháy.

#### Thảo luận – Đề xuất
- **Nguồn dữ liệu mốc thời gian thực tế:** lấy từ **ACARS** (đọc message ACARS để bóc tách các mốc out/off/on/in). Mission Watch [cần xác nhận hệ thống nội bộ — có khả năng là tên hệ thống/màn hình hiện hành] cũng tích hợp ACARS, nhưng TOSS sẽ **lấy thẳng nguồn ACARS** thay vì qua Mission Watch.
- **Thông tin cần giám sát mỗi chuyến:**
  - ETA (Estimated Time of Arrival).
  - Giờ thực tế đi/đến.
  - Giờ kế hoạch — so sánh **sớm/trễ bao nhiêu phút**.
  - Tình trạng "đang taxi-out", "đã cất cánh", "đang bay", "taxi-in"…
  - Với chuyến chuẩn bị: dự kiến cất cánh giờ, đã phục vụ đến giai đoạn nào tại sân (boarding, đóng cửa, push-back…) — tích hợp ACDM để biết.
- **Cơ chế refresh:**
  - **KHÔNG** dùng nút "refresh" thủ công — điều phái mở màn hình cả ngày, không thể bấm refresh mỗi vài giây.
  - Phương án 1 (đề xuất): **WebSocket / Server-Sent Events / webhook** — server đẩy thay đổi xuống client.
  - Phương án 2: **auto-refresh** theo chu kỳ (mỗi vài giây / mỗi phút) **chỉ ô có thay đổi**, không reload toàn trang.
  - Hạ tầng: chấp nhận ~20 row hiển thị, mỗi row ~20–30 cột; tải lại theo "khoảng/scope" thay đổi (Show On / từng ô) thay vì cả màn hình.
- **Cảnh báo bằng màu/nháy:**
  - Hiển thị **đỏ → xanh** theo trạng thái; khi tàu bay cất cánh → cảnh báo chuẩn bị chuyến bay **tắt** (chuyển xanh).
  - Tham khảo Sketch Check (Schedule Check?) — màn hình tương tự đang dùng — có nhấp nháy/auto-refresh.
  - Một số ô (vd thời tiết mưa dông) sau khi bản tin được clear thì ô tự tắt cảnh báo.
- **Phân nhóm trên màn overview:** chia ít nhất 3 nhóm: "chuẩn bị cất cánh / chưa cất cánh", "đang bay", "đã hạ cánh".

#### Kết luận
- TOSS có **một màn Monitoring overview** (cho Phase 4+5) — điều phái mở cả ngày — cập nhật real-time bằng webhook/SSE; chỉ cập nhật phần dữ liệu có thay đổi, không reload toàn trang.
- Nguồn dữ liệu mốc thời gian: **ACARS** trực tiếp.
- Cơ chế cảnh báo: màu sắc / nhấp nháy theo trạng thái; mỗi cảnh báo có quy tắc "raise" và "clear" rõ ràng (vd "cảnh báo A đến OFF thì tắt; cảnh báo B đến ON thì tắt; cảnh báo C đến IN mới tắt" — ý là từng cảnh báo gắn với mốc ACARS khác nhau).
- Phân nhóm chuyến trên overview: chưa cất cánh / đang bay / đã hạ cánh.
- Trong Phase 5 (In-Flight): **không monitoring chi tiết tiêu hao dầu real-time** (không có dữ liệu live); chỉ cập nhật trạng thái mốc bay. Phân tích chi tiết dầu/đường bay thuộc **báo cáo Post-Flight** (lấy dữ liệu sau khi tàu về In-block).

### 7. Phase 6 — Post-Flight & Shift Handover: chỉ là báo cáo

#### Yêu cầu
- Phase 6 sau khi chuyến bay kết thúc: tổng hợp tình hình, bàn giao ca trực.

#### Thảo luận – Đề xuất
- Phase 6 thuần là **báo cáo** (chuyến đáp → đóng trễ → tổng hợp tình hình).
- Dữ liệu chuyến đã hạ cánh + Confirm Release của phi công → đã lưu bên MO Plus.
- TOSS chỉ **kéo về để báo cáo**, không phát sinh thao tác nghiệp vụ.

#### Kết luận
- Phase 6 trên TOSS = báo cáo + bàn giao ca; **không cần chức năng nghiệp vụ riêng**.

### 8. Module Flight Dispatch — chỉ 3 chức năng chính

#### Yêu cầu
- Sau khi đi qua đủ 6 phase, chốt lại trên TOSS, module Flight Dispatch chỉ có ít chức năng "xử lý dữ liệu OFP" thực sự.

#### Thảo luận – Đề xuất
- Điều phái và khảo sát thống nhất: trên module Flight Dispatch của TOSS, **3 chức năng chính** là:
  1. **Đưa dữ liệu OFP lên** (nhận từ adapter hoặc upload backup).
  2. **Release** (Dispatch Release).
  3. **Unrelease** (kèm chọn version cũ để đẩy ngược, §4).
- Các chức năng còn lại (cảnh báo, monitoring) là **lớp hỗ trợ** dựa trên dữ liệu OFP + nguồn ngoài (NOTAM, WX, AMOS, CLC, ACARS).

#### Kết luận
- Module Flight Dispatch trên TOSS chốt **3 chức năng cốt lõi: Đẩy OFP / Release / Unrelease.**
- Ngoài ra: chức năng phụ là cảnh báo, monitoring (xem các phase tương ứng).

### 9. Upload tài liệu thời tiết đa chuyến (Weather Multi-Flight)

#### Yêu cầu
- Hiện trạng: với tài liệu thời tiết khu vực/đường bay (vd Weather Multi-Flight), điều phái **gửi qua mail**; AIJS [cần xác nhận tên đầy đủ — có thể là phần mềm soạn/đính tài liệu bay] **tự nhận diện và đính** file vào nhiều chuyến cùng lúc (theo khung giờ hiệu lực).

#### Thảo luận – Đề xuất
- TOSS cần một **menu upload file thời tiết đa chuyến**, người dùng chọn:
  - **Khoảng thời gian hiệu lực** (từ ngày X giờ Y → ngày Z giờ T).
  - Hệ thống tự gắn file vào **tất cả chuyến** có ETD nằm trong khoảng hiệu lực.
- Quy tắc xếp chồng file:
  - Một chuyến có thể có **nhiều file** (1 file chung + 1 file riêng) — vd chuyến Châu Âu có file chung khu vực + file riêng đặc thù.
  - File chung (Weather Multi-Flight) áp cho mọi chuyến trong khoảng hiệu lực.
  - File riêng (attach từ FME [cần xác nhận viết tắt — Flight Management Editor?]) áp cho từng chuyến cụ thể.
- Khoảng hiệu lực thường khoảng **3 tiếng**; ví dụ điều phái upload lúc 6h sáng, file hiệu lực đến 9h sáng → mọi chuyến cất cánh từ 6–9h được attach.
- Nếu hai khoảng hiệu lực **chồng nhau** trong một chuyến → chuyến đó nhận **cả hai file**.
- Format file:
  - Cùng cấu trúc tên file thì MO Plus **replace** (overwrite).
  - Khác cấu trúc tên thì MO Plus **giữ cả 2** (hiển thị song song).
- Hiện tại MO Plus có thuật toán **hardcode** chỉ hiển thị file cuối cùng theo tên → cần phối hợp với đội MO Plus để xử lý đúng.

#### Kết luận
- TOSS có chức năng **Upload Weather Multi-Flight**: chọn khoảng thời gian hiệu lực + danh sách chuyến trong khoảng → gắn file vào toàn bộ chuyến.
- Hỗ trợ song song: **attach file riêng cho từng chuyến** (từ FME hiện hành) — TOSS có thể có 2 menu/tab: (a) upload file riêng theo chuyến, (b) upload file chung cho nhiều chuyến.
- Cần đối chiếu với đội MO Plus: cơ chế hiển thị 2 file cùng lúc (latest by name vs giữ cả 2).
- Khi tài liệu (file riêng) ẩn trên app MO Plus, vẫn cần hiển thị trên TOSS để điều phái quyết định có hiện lại/ẩn không.

### 10. Payload Extra (dầu / nhiên liệu tổ bay lấy thêm) + báo cáo Pallet Relief

#### Yêu cầu
- Điều phái cần một **báo cáo** giúp xem nhanh: với những chuyến cùng đường bay (vd về Sài Gòn) trong cùng khung giờ, **chuyến nào tổ bay đã lấy thêm dầu (payload extra)**, đã cộng bao nhiêu — để biết quyết định cộng dầu cho chuyến hiện tại có hợp lý không.
- Hiện trạng: thông tin payload extra chỉ thấy qua việc mở từng chuyến (~20 chuyến/sortie) → không khả thi mở từng cái.

#### Thảo luận – Đề xuất
- Khái niệm:
  - **Payload Extra:** dầu/nhiên liệu **tổ bay tự đề nghị lấy thêm** so với OFP của điều phái (thường trước khoảng 30 phút trước khởi hành).
  - Cộng dầu (extra fuel): điều phái có thể cộng vào OFP; tổ bay có thể yêu cầu lấy thêm độc lập với phần điều phái cộng.
- TOSS đã có **báo cáo Pallet Relief** (ASR đọc "Palloy X-cha") — báo cáo nội bộ liệt kê chuyến và payload extra theo ngày, có lọc theo đường bay.
- Cải tiến yêu cầu:
  - **Hiển thị thêm cột Payload Extra** trong báo cáo (đã có).
  - Hoặc **trừ luôn** giữa OFP và X-actual của phi công → đưa vào một cột "Delta" để điều phái nhìn nhanh — chấp nhận hiển thị cả hai giá trị hoặc chỉ delta.
- Cơ chế tính: lấy dầu thực tế tổ bay lấy − dầu OFP = số kg lấy thêm.
- Truy vấn theo: ngày, đường bay (vd HAN-SGN), khung giờ cất cánh, loại tàu.
- Hiệu năng: query có thể lớn → cần **chuẩn hóa dữ liệu cho query nhanh**; với report nặng, áp dụng **cơ chế tab kết quả + lưu link 7 ngày** (tương tự gửi mail báo cáo).

#### Kết luận
- TOSS bổ sung cột **Payload Extra** (hoặc **Delta = Actual − OFP**) vào báo cáo Pallet Relief.
- Cho phép lọc theo: ngày, đường bay, khung giờ, loại tàu.
- Cơ chế UX cho report nặng: trả về tab kết quả riêng, lưu link tải trong **7 ngày**, hỗ trợ tải lại — tương đương luồng gửi mail báo cáo.

### 11. Tự sửa thông số trên OFP (Flight Level) trước khi đẩy lên MO Plus

#### Yêu cầu
- Một số chuyến điều phái cần **sửa Flight Level (FL)** trên OFP (vd lấy FL từ ICON [cần xác nhận tên hệ thống — có thể là tham số khí tượng/hệ thống lập kế hoạch] để chèn vào).
- Hiện trạng: điều phái phải **sửa ở cả 2 file nguồn — TXT và email gốc** — để MO Plus bốc tách đúng. Vất vả, dễ sai.

#### Thảo luận – Đề xuất
- Hai phương án để điều phái sửa OFP:
  - **PA1 (TOSS sửa giúp):** TOSS cung cấp form sửa Flight Level (theo Climb/Cruise/Descend) → TOSS tự sửa nhất quán cả TXT và email gốc → đẩy lên MO Plus.
  - **PA2 (điều phái sửa thủ công):** TOSS chỉ ra **những trường cần sửa** + **giá trị cần sửa**, điều phái download file gốc, sửa tay, upload lại lên TOSS → TOSS đẩy lên MO Plus.
- Phía MO Plus có ràng buộc: **chỉ tê PDF không đủ** — phải có TXT (và email) cho luật bốc tách. → Không thể chỉ sửa PDF.
- Trường thường sửa: **giờ, Brady [cần xác nhận — Bra'di/loại brake?], dầu mỡ, ADC [cần xác nhận]** — chủ yếu dầu mỡ.
- Trường cố định không sửa: số hiệu tàu + đường bay.

#### Kết luận
- TOSS hỗ trợ điều phái sửa OFP theo **một trong hai phương án** (chốt sau theo phân tích kỹ thuật):
  - PA1: form trên TOSS → TOSS sửa file gốc.
  - PA2: TOSS chỉ ra chỗ cần sửa → điều phái sửa tay → upload lại.
- Trường sửa: ưu tiên Flight Level (lấy từ ICON), dầu mỡ, giờ, Brady, ADC.
- Phải đảm bảo **đầu ra TXT + email** đúng format để MO Plus bốc tách.

### 12. Logitech / GD TN / Logitech.com (?) — tài liệu/dịch vụ liên quan upload

#### Yêu cầu
- Điều phái nhắc đến **"Logitech, GDTN, Logitech.com"** [cần xác nhận — ASR có thể đọc sai một thuật ngữ nội bộ VNA] khi bàn về quản lý chứng cứ tổ bay đã upload tài liệu.

#### Thảo luận – Đề xuất
- Có vẻ là **trang/cổng cho tổ bay tự khai báo đã upload** một số tài liệu — TOSS muốn xem được thông tin "tổ bay đã/chưa upload" để hiển thị cho điều phái.
- Hỗ trợ quy trình: khi tổ bay vào xem cổng tài liệu, điều phái có **log** để biết tổ bay đã xem hay chưa.

#### Kết luận
- Bổ sung TOSS hiển thị **log truy cập/upload tài liệu của tổ bay** từ nguồn "Logitech/GDTN" [cần xác nhận tên chính xác].
- Phạm vi cụ thể (đọc-only hay có thao tác): cần làm rõ ở buổi sau.

### 13. Backup nguồn dữ liệu khi Lido lỗi

#### Yêu cầu
- Khi Lido lỗi (không sinh được OFP), TOSS phải có cách giúp đẩy OFP lên MO Plus để chuyến bay vẫn khai thác được.

#### Thảo luận – Đề xuất
- Lido xuất ra **3 định dạng**: **PDF, TXT, HTML**. Cả 3 đều cần thiết:
  - **TXT** dùng để bốc tách NOTAM/giờ.
  - **HTML** dùng để bốc tách group/section.
  - **PDF** dùng để hiển thị + lưu trữ.
- Hiện tại adapter Lido cung cấp đủ 3 nguồn → MO Plus mix lại.
- Khi Lido lỗi:
  - Phương án 1: TOSS có sẵn nguồn 3 file gốc đã từng lưu → cho điều phái **lấy chuyến tương tự ngày trước** làm template, sửa lại các thông số chính (giờ, dầu, ADC) → đẩy lên MO Plus.
  - Adapter hiện đã lưu file raw → TOSS làm link download để điều phái lấy về sửa.
  - Sau khi sửa, điều phái upload lại lên TOSS → TOSS đẩy đủ 3 file (PDF, TXT, HTML) lên MO Plus theo đúng luật bốc tách.

#### Kết luận
- TOSS có chức năng backup khi Lido lỗi:
  - **(a)** Cho download file raw (PDF/TXT/HTML) của chuyến trước/chuyến tương tự — làm template.
  - **(b)** Cho điều phái sửa tay (theo PA của §11) → upload lại lên TOSS → TOSS đẩy đủ 3 định dạng lên MO Plus.
- Đảm bảo định dạng đầu ra của TOSS đúng "luật bốc tách" của MO Plus.

---

## III. Các nội dung đã thống nhất (buổi chiều)

| # | Nội dung thống nhất | Liên kết §II |
|---|---|---|
| 1 | Bổ sung cảnh báo **"Chuyến bay thiếu tài liệu"** vào module Dispatch | §1 |
| 2 | Bổ sung cảnh báo **"Tổ bay chưa tải tài liệu mới nhất"** — TOSS kéo trạng thái download từ MO Plus | §1 |
| 3 | Bổ sung cảnh báo **"Chuyến không thường lệ — OFP chưa có STS/HEAD"** (chuyến nhận diện qua code O / Service Type N) | §2 |
| 4 | Quy trình điều phái trên TOSS chia **6 phase**: Pre-Flight Prep / Pre-Flight Briefing / Post-Release Transition / Pre-Departure Monitoring / In-Flight Monitoring / Post-Flight & Handover | §3 |
| 5 | Hôm nay đã xong **Phase 1 + một phần Phase 2**; các phase còn lại sẽ tiếp tục ở buổi/đợt kế tiếp | §3 |
| 6 | **Lido không có version** — TOSS gán version (R1, R2…) theo thứ tự nhận; OFP number là của Lido | §4 |
| 7 | **Cơ chế Unrelease:** điều phái bấm Unrelease trên TOSS → TOSS sinh revision mới với nội dung của version cũ (chọn từ danh sách) → bắn sang MO Plus | §4 |
| 8 | MO Plus phải **reset trạng thái Confirm Release** của phi công khi nhận revision mới từ TOSS | §4 |
| 9 | Phi công và điều phái **không cần lên Lido** trong tình huống quay lui — toàn bộ qua TOSS | §4 |
| 10 | TOSS Phase 3 (Post-Release Transition) **chỉ quét cảnh báo + tham chiếu**, không có chức năng cập nhật OFP — cập nhật OFP version mới nằm ở Lido | §5 |
| 11 | Cảnh báo chuẩn bị chuyến bay tắt khi tàu cất cánh; cảnh báo NOTAM/thời tiết en-route duy trì đến khi hạ cánh | §5, §6 |
| 12 | Phase 4–5 (Monitoring) lấy mốc thời gian thực tế từ **ACARS trực tiếp** | §6 |
| 13 | Màn Monitoring overview **cập nhật real-time** qua webhook/SSE; chỉ refresh ô có thay đổi, không reload toàn trang | §6 |
| 14 | Cảnh báo có quy tắc raise/clear theo mốc ACARS riêng cho mỗi loại; phân nhóm chuyến: chưa cất cánh / đang bay / đã hạ cánh | §6 |
| 15 | Phase 5 (In-Flight) **không monitoring chi tiết tiêu hao dầu real-time**; phân tích chi tiết thuộc báo cáo Post-Flight | §6 |
| 16 | Phase 6 trên TOSS = **báo cáo + bàn giao ca**, không phát sinh chức năng nghiệp vụ riêng | §7 |
| 17 | Module Flight Dispatch TOSS có **3 chức năng cốt lõi**: Đẩy OFP / Release / Unrelease | §8 |
| 18 | TOSS có chức năng **Upload Weather Multi-Flight** theo khoảng thời gian hiệu lực; tự gắn vào toàn bộ chuyến trong khoảng | §9 |
| 19 | TOSS hỗ trợ song song: **attach file riêng cho từng chuyến** và **upload file chung cho nhiều chuyến** | §9 |
| 20 | TOSS bổ sung cột **Payload Extra** (hoặc Delta = Actual − OFP) vào báo cáo Pallet Relief; cho lọc theo ngày/đường bay/khung giờ/loại tàu | §10 |
| 21 | Với report nặng: trả tab kết quả riêng + lưu link tải 7 ngày | §10 |
| 22 | TOSS hỗ trợ điều phái **sửa Flight Level + dầu/giờ/ADC** trên OFP, đảm bảo đầu ra TXT+email đúng format để MO Plus bốc tách | §11 |
| 23 | TOSS hiển thị **log upload/truy cập tài liệu của tổ bay** từ nguồn "Logitech/GDTN" [tên cần xác nhận] | §12 |
| 24 | TOSS có chức năng **backup khi Lido lỗi**: download file raw template + sửa tay + upload lại + đẩy đủ 3 định dạng (PDF/TXT/HTML) lên MO Plus | §13 |

## IV. Vấn đề cần làm rõ (buổi chiều)

- **Danh mục mã loại chuyến (Flight Type Code)** — đầy đủ các code O, Z, G, H, A, P, V, S… (ý nghĩa từng code, code nào cần STS/HEAD, code nào không).
- **Tên cơ chế claim phí khí thải** (CORSIA, EU ETS, hoặc cả hai) mà STS/HEAD là căn cứ — để TOSS xếp trường này vào nhóm "có ảnh hưởng quy định".
- **Cơ chế phối hợp TOSS ↔ MO Plus** khi MO Plus reset Confirm Release của phi công: signal/payload, timing, hành vi notification trên app MO Plus.
- **Cách TOSS gán version** sau Unrelease: dùng "2.1" (sub-version) hay auto-tăng "v4" — chọn quy ước chính thức.
- **CCD** trong Phase 2 viết tắt là gì? (CSD — Crew Schedule Document? CRD — Crew Release Document? Hay nội bộ VNA?)
- **Tên hệ thống "Mission Watch"** và quan hệ với ACARS — TOSS lấy thẳng từ ACARS hay qua Mission Watch.
- **AIJS** — viết tắt và phạm vi (nhận diện file Weather Multi-Flight + đính chuyến tự động).
- **FME** — viết tắt (Flight Management Editor?), hiện đang là chỗ điều phái attach file riêng cho từng chuyến.
- **ICON** — tên hệ thống/tham số khí tượng cung cấp Flight Level cho Climb/Cruise/Descend.
- **"Logitech / GDTN / Logitech.com"** — tên nguồn dữ liệu chính xác (log tổ bay upload tài liệu).
- **"Sketch Check"** trong tài liệu monitoring — có phải Schedule Check không? Cách hiển thị tham khảo.
- **Brady / ADC** ở §11 — viết tắt/ý nghĩa, các trường cụ thể nào trong OFP/TXT cần sửa.
- **Hệ thống xử lý nguồn 3 file (TXT + HTML + PDF)** ở phía MO Plus — quy tắc bốc tách chi tiết để TOSS đảm bảo đầu ra.

> Các điểm trên cần ghi nhận tập trung tại sổ theo dõi `SO-THEO-DOI-DIEM-CHOT-v0.1.md` (OID-TOSS-001) — đề xuất mã kế tiếp SME-19+, KS-20+.

## V. Thuật ngữ đề xuất bổ sung domain-knowledge

> **CHỈ ĐỀ XUẤT, KHÔNG TỰ GHI VÀO GLOSSARY.** Chờ BA Lead confirm theo quy ước [Glossary: trình đề xuất trước khi ghi].

| # | Thuật ngữ | Mô tả từ ngữ cảnh | Nguồn dòng |
|---|---|---|---|
| 1 | **STS/HEAD** (đã có trong glossary, đề xuất mở rộng) | Bổ sung ngữ cảnh: chỉ thị bắt buộc cho **mọi chuyến không thường lệ** (không chỉ riêng VIP). Là **căn cứ claim miễn trừ phí khí thải** — không có STS/HEAD trong OFP thì hãng có thể bị tính phí khí thải cho chuyến đó. Cảnh báo "OFP chưa có STS/HEAD" cho chuyến không thường lệ là cảnh báo bắt buộc. | dòng 50–115 |
| 2 | **Flight Type Code (O / Z / G / H / A / P / V / S…)** | Mã loại chuyến nội bộ VNA dùng để phân biệt chuyến thường/không thường lệ; nhận diện ở Lido/ATC FPL. Một số code (vd O) tương ứng "non-scheduled" trên ATC FPL (chuyển S→N). Danh mục đầy đủ chưa rõ. | dòng 80–95 |
| 3 | **Dispatch Release** (đã có, đề xuất mở rộng) | Bổ sung: Release/Unrelease là **cặp thao tác đối xứng** trên TOSS; Unrelease sinh ra một revision mới với nội dung của version cũ, đẩy ngược về MO Plus và reset Confirm Release của phi công. | dòng 220–600 |
| 4 | **Unrelease (TOSS)** | Thao tác chủ động của điều phái trên TOSS để hủy bỏ Dispatch Release của version hiện tại và quay về một version OFP cũ hơn. TOSS sinh revision mới (vd v2.1 hoặc v4 chứa data v2) → đẩy lên MO Plus. Phi công không thao tác Lido. | dòng 270–550 |
| 5 | **OFP Number vs OFP Version** | OFP Number là định danh do Lido sinh; OFP Version là chỉ số do TOSS gán (R1, R2…). Lido không có khái niệm version. | dòng 525–545 |
| 6 | **Confirm Release / Reload OSP** | Hành động phi công xác nhận đã nhận tài liệu OFP trên MO Plus; reset về 0 khi TOSS Unrelease và sinh revision mới. (ASR đọc lệch "Reload OSP" — ngữ cảnh chính xác là "Confirm Release" trong nghiệp vụ Captain's Release.) | dòng 583–614 |
| 7 | **Post-Release Transition (Phase 3)** | Giai đoạn sau Release đến trước cất cánh — TOSS quét cảnh báo liên tục (NOTAM, WX, tàu, tải); thao tác cập nhật OFP version mới nằm ở Lido. | dòng 635–745 |
| 8 | **Mission Watch** | Hệ thống/màn hình giám sát chuyến bay hiện hành (ngoài TOSS) — đã tích hợp ACARS để biết chuyến đang ở phase nào. TOSS tham chiếu nhưng lấy thẳng nguồn ACARS, không qua Mission Watch. | dòng 765–815 |
| 9 | **A-CDM** (đã có) — bổ sung ngữ cảnh phase 4 | TOSS dùng A-CDM để biết chuyến đã phục vụ đến giai đoạn nào tại sân (boarding, đóng cửa, push-back, taxi-out, take-off) cho màn monitoring overview. | dòng 832–845 |
| 10 | **ACARS Phase Trigger** | Quy tắc raise/clear cảnh báo gắn với mốc ACARS riêng cho mỗi loại cảnh báo: cảnh báo về tải tắt khi OUT/OFF; cảnh báo về NOTAM/WX en-route tắt khi IN. | dòng 903–910, 882–895 |
| 11 | **Sketch Check / Schedule Check** | Hệ thống/màn hình tham khảo cho cơ chế hiển thị real-time + nhấp nháy + auto-refresh (theo chu kỳ ngắn). | dòng 1020–1030 |
| 12 | **Weather Multi-Flight** | File thời tiết khu vực/đường bay áp cho nhiều chuyến trong khoảng thời gian hiệu lực (vd 3 tiếng); upload qua TOSS, tự đính vào toàn bộ chuyến trong khoảng. | dòng 1199–1265 |
| 13 | **AIJS** | Hệ thống/phần mềm trung gian (nội bộ VNA) hiện đang nhận diện file Weather Multi-Flight gửi qua email và tự đính vào nhiều chuyến. TOSS sẽ thay thế / phối hợp. | dòng 1275–1310 |
| 14 | **FME** | Chỗ điều phái hiện đang attach file riêng cho từng chuyến (giả định: Flight Management Editor — cần xác nhận). | dòng 1285–1290 |
| 15 | **Payload Extra (Pallet Relief)** | Lượng dầu/nhiên liệu tổ bay tự đề nghị lấy thêm so với OFP của điều phái, thường ~30 phút trước khởi hành. Báo cáo "Pallet Relief" hiện đang liệt kê các chuyến + payload extra theo ngày + đường bay. TOSS bổ sung cột "Delta = Actual − OFP" để điều phái đối chiếu nhanh. | dòng 1542–1600 |
| 16 | **ICON** | Hệ thống/tham số khí tượng cung cấp Flight Level cho Climb/Cruise/Descend; điều phái lấy FL từ ICON và sửa vào OFP (TXT + email) để MO Plus bốc tách đúng. | dòng 1700–1715 |
| 17 | **OFP Source — 3 định dạng (PDF / TXT / HTML)** | Lido xuất OFP ở 3 định dạng song song: TXT dùng để bốc tách NOTAM/giờ; HTML dùng để bốc tách group/section; PDF dùng hiển thị + lưu trữ. MO Plus mix 3 nguồn. TOSS backup phải đẩy đủ 3 nguồn. | dòng 1626–1660 |
| 18 | **MO Plus Latest by Filename** | Cơ chế MO Plus chỉ hiển thị file cuối cùng theo tên (replace); file khác tên sẽ giữ song song (theo lý thuyết) nhưng thực tế thuật toán đang hardcode replace. | dòng 1437–1500 |
| 19 | **Logitech / GDTN** [tên chưa xác nhận] | Nguồn dữ liệu log tổ bay đã upload/truy cập tài liệu — TOSS hiển thị cho điều phái biết tổ bay đã vào xem hay chưa. | dòng 1504–1525 |
| 20 | **Report Tab + Link 7-day** | Cơ chế UX cho báo cáo nặng: trả kết quả ra tab riêng, lưu link tải 7 ngày, hỗ trợ tải lại — tương tự gửi mail báo cáo. | dòng 1614–1623 |

---

*Báo cáo buổi chiều 11/06/2026, lập 2026-06-12. Chất lượng ghi âm kém ở nhiều đoạn; các điểm gắn cờ `[cần xác nhận]` cần phỏng vấn bổ sung/đối chiếu SME trước khi đưa vào tài liệu yêu cầu chính thức. Điểm cần chốt được theo dõi tại OID-TOSS-001.*
