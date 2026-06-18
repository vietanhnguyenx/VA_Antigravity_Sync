---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-18"
survey_date: "2026-06-17"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Quản lý MEL/CDL & Tích hợp AMOS — Buổi chiều 17/06/2026"
---

# Báo cáo Khảo sát — Quản lý MEL/CDL & Tích hợp AMOS

**Ngày khảo sát:** 17/06/2026
**Phiên họp:** TOSS-17-06-8 (buổi 8)

---

> **Cảnh báo chất lượng ASR:** Transcript gốc có chất lượng nhận dạng giọng nói trung bình, nhiều đoạn nhiễu và thuật ngữ kỹ thuật bị biến dạng. Các thuật ngữ đã được hiệu chỉnh: MEL, AMOS, OPS++ (Netline Flight Ops++), OFP, Lido, FODM (Flight Ops Documentation Manager — Airbus), VICO; một số đoạn không khôi phục được đã gắn cờ cần xác nhận. Bản Word giao khách hàng đã gỡ toàn bộ chú thích này.

---

## I. Thông tin chung

| Trường | Nội dung |
|---|---|
| **Thời gian** | 17/06/2026 — buổi chiều (khoảng 00:00–01:18 theo timestamp transcript) |
| **Mục đích** | Khảo sát yêu cầu quản lý MEL (Minimum Equipment List) / CDL (Configuration Deviation List) trong TOSS, xác định phạm vi tích hợp AMOS (Aircraft Maintenance & Operations System) và cách dữ liệu MEL phục vụ cảnh báo điều phái cùng báo cáo khai thác hàng ngày. |
| **Đối tượng khảo sát** | Đại diện VNA phụ trách quản lý dữ liệu MEL bên bộ phận kỹ thuật (chị Nga), có sự tham gia của đại diện VNA bên khai thác và bên D&B/EMP. |
| **Phía khảo sát** | Nhóm TOSS/VTIT (anh Hiệp cùng các thành viên). |
| **Phạm vi buổi** | Cấu trúc Master MEL, cơ chế MEL active từ AMOS, mapping với định dạng Lido Import file, cảnh báo điều phái khi MEL phát sinh/đóng, dashboard MEL cho trực ban trưởng và báo cáo khai thác hàng ngày, kế hoạch khảo sát tiếp với nhóm AMOS/VICO. |

---

## II. Nội dung trao đổi

### 1. Phạm vi tích hợp AMOS ↔ TOSS cho MEL/CDL

**Yêu cầu**

VNA xác nhận yêu cầu tích hợp AMOS để lấy thông tin MEL/CDL, kế hoạch bảo dưỡng tàu bay và các thông tin kỹ thuật khác xuất hiện trong cả Yêu cầu Kỹ thuật của TOSS lẫn của OPS++ (Netline Flight Ops++) bên D&B/EMP, cụ thể tại mục 3.2 phiên bản tháng 5–6/2026 [17062026 §3, §8]. Định hướng được VNA và VTIT đặt ra là TOSS đứng ra làm đầu mối tích hợp AMOS một lần và sẽ chuyển dữ liệu MEL/CDL sang OPS++ khi OPS++ triển khai sau, nhằm tránh trùng lặp tích hợp và giảm khối lượng khảo sát phía OPS++ [17062026 §5–§7].

**Thảo luận và Đề xuất**

VNA và VTIT thống nhất rằng OPS++ sẽ không tự tích hợp AMOS riêng cho phần MEL/CDL mà sẽ tiếp nhận dữ liệu từ TOSS [17062026 §6, §7]. VNA lưu ý mục tiêu hai bên khác nhau ở chỗ TOSS quan tâm cảnh báo MEL cho điều phái theo từng tổ bay (chuyến bay), còn OPS++ quan tâm lịch bảo dưỡng tàu bay và lịch bay làm căn cứ xây dựng dữ liệu EFB [17062026 §11]. Do đó việc chi tiết hoá giao diện TOSS ↔ OPS++ sẽ được làm trong giai đoạn khảo sát tích hợp riêng giữa hai dự án, tại buổi 17/06 chưa cần đặc tả chi tiết hơn yêu cầu kỹ thuật chung [17062026 §17].

**Kết luận**

TOSS chịu trách nhiệm tích hợp AMOS để lấy toàn bộ dữ liệu MEL/CDL và các thông tin kỹ thuật phục vụ nghiệp vụ khai thác. TOSS đồng thời là nguồn cung cấp dữ liệu MEL/CDL cho OPS++ ở giai đoạn triển khai sau. Chi tiết giao diện TOSS ↔ OPS++ và phạm vi dữ liệu chuyển giao được làm rõ trong khảo sát tích hợp về sau, không xử lý tại buổi này.

---

### 2. Cấu trúc Master MEL và kiến trúc dữ liệu

**Yêu cầu**

VNA yêu cầu TOSS quản lý Master MEL — tập tĩnh do nhà sản xuất tàu bay ban hành cho từng loại tàu, ước lượng khoảng 3.000 item cho một bộ [17062026 §40]. Mỗi MEL item gồm mã item (Item Number), tên thiết bị, nội dung mô tả dạng tự do (free text) và các thuộc tính ảnh hưởng khai thác như hệ số nhiên liệu bổ sung (fuel factor — phần trăm), giảm tải (payload reduction — kg/lbs), giới hạn độ cao (altitude cap — FL), giới hạn autopilot và giới hạn sân bay [17062026 §31, §32, §90]. Bên cạnh Master MEL, TOSS cần quản lý MEL Active — tập MEL item đang được kích hoạt trên từng tàu cụ thể do AMOS ghi nhận khi thợ máy gắn item MEL lên tàu sau khi phát hiện hỏng hóc [17062026 §137].

**Thảo luận và Đề xuất**

Master MEL có cấu trúc phân cấp tối đa 5 đến 6 cấp (level), thể hiện qua mã dạng "21-25-01-01-02", trong đó mỗi nhóm số là một cấp; có trường hợp đặc biệt khi đọc chi tiết phải xem thêm note ở mức sâu hơn nên có thể lên 6 cấp [17062026 §95–§102]. Hiện AMOS chỉ active item ở cấp khoảng 3–4, không xuống đến cấp con cuối, do đó chỉ cần warning ở cấp item AMOS active [17062026 §103, §104, §115]. Mức độ chính xác AMOS có thể đi sâu tới đâu vẫn cần khảo sát thêm với nhóm AMOS/VICO.

Mỗi MEL item ở cấp gần cuối có thể có nhiều trường hợp phân nhánh (ký hiệu trong tài liệu là x1, x2, x3, x4...) với các giá trị penalty khác nhau cho từng trường hợp. Ví dụ minh hoạ từ dữ liệu thực [MEL 78A.csv] cho item `21-52-01-02-01` của Boeing 787-9 có ba nhánh: x1 giảm tải khoảng 363 kg và yêu cầu không thực hiện EDTO, x2 chỉ yêu cầu không EDTO, x3 giới hạn độ cao tối đa FL350 kèm điều kiện vận hành OFCR/OFAR. Việc quyết định áp dụng nhánh nào vẫn là trách nhiệm của điều phái dựa trên tình huống thực tế, TOSS chỉ hiển thị thông tin các nhánh để hỗ trợ quyết định [17062026 §83–§86, §121–§125].

Nhóm TOSS đề xuất lưu trữ Master MEL theo hai lớp dữ liệu song song. Lớp thứ nhất là nội dung gốc — nguyên văn từ tài liệu nhà sản xuất, không chỉnh sửa. Lớp thứ hai là bản biên soạn — phiên bản đã được chị Nga bổ sung các metadata khai thác (fuel factor, payload reduction, altitude cap, autopilot, airport...) cùng các ảnh hưởng phân theo nhánh x1/x2/x3 [17062026 §149–§151]. Cấu trúc hai lớp này cho phép so sánh khi nhà sản xuất phát hành phiên bản mới: TOSS so cái nội dung gốc cũ và mới, đánh dấu những item có nội dung gốc thay đổi để chị Nga chỉ cần rà soát và cập nhật phần metadata cho những item đó, không phải làm lại toàn bộ [17062026 §146–§147, §151–§152].

Về dài hạn, VNA đang nghiên cứu hệ thống DDMS (Document & Data Management System) có khả năng số hoá tài liệu kỹ thuật của nhà sản xuất, từ đó export dữ liệu MEL theo định dạng số hoá để các hệ thống khác lấy về. Hệ thống tương tự đã được một bên ở Orlando demo trước đây nhưng VNA chỉ mới ở giai đoạn nghiên cứu, chưa phê duyệt, chưa triển khai [17062026 §44–§47, §52, §53]. Do đó TOSS giai đoạn đầu vẫn dùng phương án nhập từ file kết hợp nhập tay metadata khai thác.

**Kết luận**

Kiến trúc dữ liệu MEL trong TOSS gồm hai tầng: Master MEL (tĩnh, theo loại tàu) và MEL Active (từ AMOS, theo từng tàu cụ thể). Master MEL lưu hai lớp nội dung là nội dung gốc từ nhà sản xuất và bản biên soạn có metadata khai thác do VNA bổ sung. MEL item ở cấp cuối có thể có nhiều trường hợp x1/x2/x3..., điều phái là người quyết định áp dụng trường hợp nào. Cấp AMOS active được xác định sơ bộ ở cấp 3–4, chi tiết cần khảo sát thêm với nhóm AMOS/VICO. DDMS được xác định là phương án tương lai chưa đưa vào phạm vi giai đoạn 1.

---

### 3. Quy trình khai thác MEL — Cảnh báo điều phái và làm lại OFP

**Yêu cầu**

Khi AMOS ghi nhận một MEL item mới được gắn lên tàu, TOSS phải tự đồng bộ về để nhận biết và cảnh báo cho điều phái, để điều phái làm lại OFP (Operational Flight Plan) tính lại lượng nhiên liệu bổ sung do MEL gây ra [17062026 §110]. Tương tự, khi một MEL item được clear (giải quyết xong), TOSS cũng phải thông báo để điều phái điều chỉnh giảm nhiên liệu tương ứng, tránh tàu phải chở thêm nhiên liệu không cần thiết [17062026 §114]. Cảnh báo phải đến trước thời điểm khởi hành (ví dụ tàu bay 16h, AMOS gắn item lúc 15h, hệ thống phải cảnh báo ngay) [17062026 §110].

**Thảo luận và Đề xuất**

Khi AMOS đồng bộ MEL active lên TOSS, TOSS thực hiện mapping với Master MEL để xác định metadata khai thác đính kèm (fuel factor, payload reduction, altitude cap, autopilot, airport...), sau đó hiển thị cảnh báo cho điều phái kèm thông tin các nhánh penalty x1/x2/x3 có thể áp dụng. Điều phái đọc thông tin, chọn nhánh áp dụng tuỳ tình huống thực tế (loại tàu, sân bay đi/đến, mức tải...) rồi chạy lại OFP với các thông số tương ứng [17062026 §85–§86, §122].

VNA đề xuất xây dựng một màn hình tổng hợp warning cho điều phái cho từng chuyến bay, gom toàn bộ cảnh báo MEL, NOTAM, thời tiết và các cảnh báo khác liên quan đến chuyến bay vào một nơi thay vì điều phái phải xem nhiều nguồn rời rạc [17062026 §127, §130]. Mỗi mục cảnh báo MEL trong màn hình tổng hợp có liên kết để mở chi tiết item, hiển thị các nhánh và các ảnh hưởng tương ứng để điều phái không phải mở tài liệu rời ra tra cứu [17062026 §86–§87, §131].

Đối với trực ban trưởng, VNA mong muốn một dashboard tổng hợp MEL theo toàn đội tàu phục vụ Báo cáo Khai thác Hàng ngày (BCAO). Cơ chế cấp dữ liệu vào dashboard là TOSS nhận danh mục MEL active từ AMOS, mapping với danh sách "MEL ảnh hưởng khai thác" do chị Nga xây dựng và duy trì để lọc ra những item cần đưa vào BCAO [17062026 §128, §162–§165]. Trường hợp người dùng vẫn muốn lấy thêm các MEL active khác ngoài danh mục chuẩn, hệ thống cần có thêm bộ lọc trên tập MEL active của AMOS [17062026 §166].

**Kết luận**

TOSS nhận MEL active từ AMOS, mapping với Master MEL để tính ảnh hưởng khai thác, hiển thị cảnh báo cho điều phái khi MEL phát sinh hoặc được clear, kèm thông tin các nhánh x1/x2/x3 để điều phái lựa chọn. Cảnh báo MEL nằm trong màn hình warning tổng hợp theo chuyến bay (gồm MEL, NOTAM, thời tiết...). Dashboard MEL theo đội tàu phục vụ trực ban trưởng và BCAO, sử dụng danh mục "MEL ảnh hưởng khai thác" của chị Nga để lọc. Cơ chế đồng bộ AMOS → TOSS (thời gian thực, theo chu kỳ hay theo lô) chưa được chốt và cần xác định ở khảo sát tích hợp AMOS.

---

### 4. Phương án nhập liệu Master MEL ban đầu và mapping với định dạng Lido Import file

**Yêu cầu**

Master MEL cần được nhập vào TOSS lần đầu từ tài liệu MEL do nhà sản xuất cung cấp, sau đó cập nhật mỗi khi nhà sản xuất phát hành phiên bản mới. Tần suất cập nhật ước tính khoảng 1–2 tháng một lần, số lượng item thay đổi mỗi đợt phụ thuộc nhà sản xuất; khai thác hàng ngày dữ liệu MEL ít thay đổi [17062026 §145]. Chị Nga là người thực hiện nhập liệu và duy trì dữ liệu này.

**Thảo luận và Đề xuất**

Tài liệu MEL Boeing được cung cấp qua một công cụ nội bộ mà ASR ghi là "filmmaker/Filmator" `[cần xác nhận tên thật — KS-57]`, tài liệu MEL Airbus dùng phần mềm FODM (Flight Ops Documentation Manager) [17062026 §74]. Mỗi hãng sản xuất có công cụ và định dạng riêng. Hiện chị Nga đọc tài liệu MEL dưới dạng PDF, sau đó nhập thủ công các trường cần thiết — đặc biệt là phần nội dung free text mô tả các giới hạn khai thác — quy trình này tốn nhiều công sức [17062026 §32, §41, §76].

Hệ thống lập kế hoạch OFP của VNA dùng Lido (Lufthansa Systems) có một định dạng nhập liệu riêng gọi là Lido Import file. Chị Nga đã biên soạn được file Lido Import file và đang upload lên Lido cho khai thác. Định dạng ePot là dạng bảng cột (Excel/CSV), mỗi MEL item là một dòng [17062026 §50, §69, §73]. Để minh hoạ cụ thể cấu trúc Lido Import file hiện hành, dữ liệu thực [MEL 78A.csv, 78B.csv, 78C.csv] cho thấy mỗi dòng có các cột chính như: mã hãng (`icao_airl_code` = HVN), loại tàu (`perf_type`), mã ảnh hưởng phân nhánh (`deviation_code` dạng `21-52-01-02-01X1`), nội dung mô tả khai thác (`mel_dx_remark` — free text mang các giới hạn như "REDUCE ENROUTE CLIMB LIMIT WEIGHT BY...", "AIRPLANE REMAINS AT OR BELOW FL 350", "EDTO IS NOT CONDUCTED"), nội dung mô tả thiết bị (`mel_ofp_remark`), và các trường định lượng penalty như `p_tow` (Take-off Weight), `p_enrte_wt` (giảm tải khi bay, kg), `p_lw` (Landing Weight), `unit_weight`, `p_perf_corr` (hệ số nhiên liệu bổ sung, phần trăm), `p_altitude` (giới hạn độ cao, FL), `p_speed_knots`, `p_speed_mach`, `p_etops_circles`, `p_etops_critfuel_dc`, `p_etops_critfuel_dx`. Ngoài ra có nhóm cờ thiết bị (TCAS, FMS, ATS Service Type, ILS, GLS, autoland...) và cột `action` ghi `INSERT` hoặc `UPDATE` quy định hành vi khi nạp vào Lido.

Nhóm TOSS đề xuất TOSS sẽ đọc và phân tích tài liệu MEL gốc (hoặc file Lido Import file đã có) để bóc tách tự động các trường có cấu trúc (item code, tên item, các cột penalty định lượng), còn phần nội dung free text và việc xác định ảnh hưởng theo nhánh x1/x2/x3 vẫn cần chị Nga đọc và biên soạn. Khi nhập, hệ thống hiển thị nội dung gốc của item ngay trên màn hình để chị Nga đọc và điền metadata mà không phải mở file PDF song song [17062026 §69, §142–§144]. Để bóc tách item code và tên item, có thể dùng công cụ AI hỗ trợ đạt khoảng 60–70%, phần còn lại chị Nga vẫn rà soát thủ công [17062026 §70].

Khi nhà sản xuất phát hành phiên bản MEL mới, TOSS so sánh nội dung gốc cũ và mới, đánh dấu những item có thay đổi nội dung gốc. Chị Nga chỉ cần rà soát và cập nhật metadata cho những item đó, không phải làm lại toàn bộ [17062026 §146–§152].

Về vấn đề file XML Lido Import file, hiện đang có hai khó khăn. Thứ nhất, cùng một item có thể bị chia thành nhiều bản ghi ở cấp con khác nhau (ví dụ "1, 1, 2 khác nhau một tí"), gây khó khi mapping ngược về Master MEL [17062026 §82, §83]. Thứ hai, một số chỗ trong file dùng lệnh "insert" thay vì "update" — biểu hiện cụ thể là cột `action` ghi `INSERT` cho mọi dòng [MEL 78A.csv] — khiến khi nạp lại lần hai vào Lido sẽ tạo bản ghi trùng (duplicate) thay vì cập nhật dòng cũ, có thể do bộ chuyển đổi cấu hình sai chế độ insert thay vì update [17062026 §157, §158].

Về phạm vi cần quản lý kỹ, ban đầu các anh Thắng/Dũng yêu cầu chỉ tập trung những MEL item nào có penalty (làm giống các hãng khác), sau đó mở rộng yêu cầu thêm những item ảnh hưởng khai thác như giới hạn autopilot, giới hạn sân bay [17062026 §31, §32]. Trên tổng số khoảng 3.000 item Master MEL của một loại tàu, chỉ một phần (chị Nga đã có sẵn một danh mục) là item ảnh hưởng khai thác cần cảnh báo điều phái, số lượng cụ thể cần chị Nga cung cấp lại [17062026 §35, §36, §163].

**Kết luận**

Phương án nhập liệu Master MEL là bóc tách bán tự động (item code, tên, các cột penalty định lượng) kết hợp nhập thủ công nội dung biên soạn ảnh hưởng theo nhánh x1/x2/x3. Tài liệu nguồn gồm PDF nhà sản xuất, công cụ Boeing chưa rõ tên `[cần xác nhận]`, FODM cho Airbus. Hệ thống đối chiếu nội dung gốc giữa hai phiên bản để đánh dấu item thay đổi, giúp chị Nga chỉ cập nhật phần biên soạn cho item có thay đổi. VNA (chị Nga) sẽ cung cấp file Lido Import file mẫu, mô tả các trường định dạng, và danh sách MEL ảnh hưởng khai thác cho nhóm TOSS để thiết kế cấu trúc dữ liệu và mapping. Vấn đề insert thay vì update trong Lido Import file cần điều tra thêm trong khảo sát Lido.

---

### 5. Tích hợp DB AMOS — Kế hoạch khảo sát tiếp theo

**Yêu cầu**

Để xây dựng cơ chế mapping chính xác giữa MEL active trên AMOS và Master MEL trong TOSS, cần hiểu rõ cấu trúc DB AMOS: bảng nào chứa MEL active, các trường nào (item code, trạng thái, tàu áp dụng, thời gian, log cập nhật...) và cơ chế truy cập dữ liệu [17062026 §175].

**Thảo luận và Đề xuất**

Nhóm Hà Tần đã có kết nối Data Warehouse của AMOS, đã lấy về một số dữ liệu nhưng chưa đầy đủ và chưa khảo sát chi tiết cấu trúc DB [17062026 §174, §175]. Data Warehouse mới chứa các trường cần thiết cơ bản, chưa phải toàn bộ cơ sở dữ liệu của AMOS [17062026 §59]. Nhân sự VNA chỉ có quyền xem giao diện AMOS, không nắm hết các chức năng và không thấy được toàn bộ DB; VICO (đơn vị hỗ trợ VNA triển khai AMOS) có nhân sự hiểu rõ DB AMOS và đã từng hỗ trợ truy cập dữ liệu trước đây [17062026 §177]. Trạng thái nhóm phụ trách AMOS bên trong VNA chưa được khảo sát.

VNA sẽ đề nghị một buổi làm việc riêng với nhóm AMOS/VICO, tổ chức trực tiếp (offline) thay vì online vì các vấn đề tích hợp khó trao đổi qua online [17062026 §169]. Trong buổi đó, nhóm TOSS cần chuẩn bị trước danh sách các trường dữ liệu cần lấy từ AMOS (dựa trên yêu cầu cảnh báo MEL và yêu cầu BCAO đã xác định), từ đó mapping sang bảng/trường tương ứng trong DB AMOS [17062026 §175]. Ngoài MEL, AMOS còn quản lý nhiều dữ liệu kỹ thuật khác (service order, các kỷ thuật khai thác trong phạm vi tàu bay) phân theo loại tàu (Boeing và Airbus có model AMOS khác nhau, các menu khác nhau) — nhóm TOSS cần xác định rõ phạm vi cần lấy [17062026 §179, §180].

**Kết luận**

Cần tổ chức buổi khảo sát riêng (offline) với nhóm AMOS/VICO để xác định cấu trúc dữ liệu DB AMOS phục vụ tích hợp MEL. Nhóm TOSS chuẩn bị trước danh sách yêu cầu dữ liệu (cấu trúc, trường, log cập nhật, trạng thái) cùng câu hỏi về phạm vi (chỉ MEL hay mở rộng sang dữ liệu kỹ thuật khác) trước buổi đó. Bước trung gian là làm việc với nhóm Hà Tần để biết hiện trạng Data Warehouse đã có những dữ liệu gì.

---

## III. Các nội dung đã thống nhất

| # | Nội dung thống nhất |
|---|---|
| 1 | TOSS chịu trách nhiệm tích hợp AMOS cho MEL/CDL; OPS++ không tích hợp AMOS riêng mà lấy dữ liệu MEL/CDL từ TOSS ở giai đoạn triển khai sau. |
| 2 | Kiến trúc 2 tầng: Master MEL (tĩnh, theo loại tàu) + MEL Active (từ AMOS, theo từng tàu cụ thể). |
| 3 | Master MEL lưu 2 lớp: nội dung gốc (nguyên văn từ nhà sản xuất) + bản biên soạn (metadata khai thác do VNA bổ sung). |
| 4 | MEL item có thể có nhiều trường hợp penalty (x1/x2/x3/x4...); Điều phái là người quyết định áp dụng trường hợp nào — TOSS chỉ hiển thị thông tin hỗ trợ. |
| 5 | Khi MEL phát sinh mới hoặc được clear, TOSS cảnh báo điều phái để làm lại OFP (tăng/giảm nhiên liệu, tải, độ cao...). |
| 6 | Cảnh báo MEL nằm trong màn hình warning tổng hợp theo chuyến bay (gồm MEL, NOTAM, thời tiết...). |
| 7 | Dashboard MEL tổng hợp theo đội tàu phục vụ Trực ban trưởng và BCAO hàng ngày; lọc bằng danh mục "MEL ảnh hưởng khai thác" của chị Nga. |
| 8 | Phương án nhập liệu Master MEL: bóc tách bán tự động (item code, tên, cột penalty định lượng) + nhập thủ công nội dung biên soạn theo nhánh; tần suất cập nhật ~1–2 tháng/lần. |
| 9 | Khi nhà sản xuất phát hành phiên bản mới, hệ thống so sánh nội dung gốc cũ–mới và đánh dấu item thay đổi để VNA chỉ rà soát phần biên soạn. |
| 10 | AMOS chỉ active item ở cấp 3–4, không xuống cấp con cuối; TOSS warning ở cấp AMOS active. |
| 11 | Giai đoạn đầu TOSS dùng free text + nhập tay cho metadata MEL; tích hợp DDMS để giai đoạn sau khi DDMS được triển khai. |
| 12 | Cần tổ chức buổi khảo sát riêng (offline) với nhóm AMOS/VICO để xác định cấu trúc DB AMOS cho tích hợp MEL. |
| 13 | Tài liệu nguồn MEL: Boeing dùng công cụ nội bộ (tên cần xác nhận), Airbus dùng FODM. |

---

## IV. Vấn đề cần làm rõ

| # | Vấn đề | Mã tham chiếu |
|---|---|---|
| 1 | Hệ thống nhận MEL/CDL từ TOSS đã xác nhận là **OPS++** (Netline Flight Ops++). | `[SME-45 — đã chốt 17/06, hiệu chỉnh 18/06]` |
| 2 | AMOS active MEL item ở cấp tối đa nào (cấp 3, cấp 4 hay sâu hơn)? Cần xác nhận với nhóm AMOS/VICO để thiết kế cấu trúc dữ liệu MEL phù hợp. | `[cần xác nhận — KS-55]` |
| 3 | Cơ chế tích hợp AMOS → TOSS cho MEL active: API thời gian thực, polling theo chu kỳ, hay xuất theo lô? Định dạng dữ liệu trao đổi và độ trễ chấp nhận được (cảnh báo phải đến trước khởi hành ~1 giờ)? | `[cần khảo sát — KS-56]` |
| 4 | Định dạng/công cụ tài liệu MEL Boeing — tên thật của phần mềm (ASR ghi là "filmmaker/Filmator")? Khả năng đọc/nhập tự động của file Boeing? (Airbus = FODM đã xác nhận.) | `[Boeing còn chờ — KS-57]` |
| 5 | Mô tả chi tiết định dạng Lido Import file: danh sách trường đầy đủ, kiểu dữ liệu, ý nghĩa các cờ thiết bị, mapping sang dữ liệu MEL TOSS. VNA (chị Nga) đã đề nghị cung cấp mẫu — cần nhận file mô tả các trường. | `[cần khảo sát — KS-58]` |
| 6 | Vấn đề "insert vs update" trong file Lido Import file (cột `action` luôn ghi INSERT trong sample): nguyên nhân chính xác và cách xử lý trong quy trình import để tránh duplicate khi nạp lại lần hai? | `[cần xác nhận — KS-59]` |
| 7 | Phạm vi dữ liệu cụ thể cần lấy từ AMOS: bảng/trường nào chứa MEL active, trạng thái, tàu áp dụng, log cập nhật (qua "lễ ích em đèo" — tech log? `[cần xác nhận]`)? Có cần lấy thêm service order và dữ liệu kỹ thuật khác ngoài MEL không? | `[cần khảo sát DB AMOS — KS-55]` |
| 8 | Danh mục "MEL ảnh hưởng khai thác" do chị Nga xây dựng: số lượng cụ thể, tiêu chí lọc, cấu trúc dữ liệu. Cần xin lại file hiện hành từ chị Nga. | `[cần xác nhận — SME-46]` |
| 9 | Hệ thống DDMS (Document & Data Management System): tên đầy đủ, đơn vị triển khai (có thể liên quan demo Orlando trước đây), tiến độ phê duyệt, khả năng tích hợp với TOSS về sau. | `[cần xác nhận — SME-47]` |
| 10 | Trạng thái Data Warehouse AMOS do nhóm Hà Tần đã kết nối: đã lấy được những trường nào, còn thiếu trường nào so với yêu cầu MEL/BCAO. | `[cần khảo sát — KS-60]` |
| 11 | Có cần khảo sát riêng phần kỹ thuật trực (bộ phận lập BCAO bên kỹ thuật) để biết họ lọc dữ liệu MEL ra báo cáo như thế nào, để TOSS tái hiện đúng logic lọc? | `[cần xác nhận — SME-48]` |
| 12 | Mức độ chính xác công cụ AI bóc tách item code/tên (~60–70% theo trao đổi tại buổi) có chấp nhận được không? Quy trình rà soát thủ công phần còn lại được tổ chức như thế nào? | `[cần xác nhận — KS-61]` |
| 13 | Lido Import file có thay đổi cấu trúc giữa các version không (Lido có thể thêm cột/dòng)? Cơ chế tương thích ngược của TOSS khi Lido nâng cấp? | `[cần xác nhận — KS-62]` |

---

## V. Thuật ngữ đề xuất bổ sung domain-knowledge

> **Lưu ý nội bộ (CHỈ bản MD):** Bảng này là đề xuất — chờ BA Lead confirm trước khi ghi vào `toss-glossary-v0.1.md`.

| Thuật ngữ | Mô tả từ ngữ cảnh transcript | Nguồn |
|---|---|---|
| **OPS++** (Netline Flight Ops++) | Hệ thống khai thác chính của VNA do bên D&B/EMP triển khai; nhận dữ liệu MEL/CDL từ TOSS (TOSS là đầu mối tích hợp AMOS một lần). Cụm ASR "FOIE/FOI/FOM/FOEM" đều chỉ OPS++. Glossary v0.18 đã cập nhật. | [17062026 §3, §5–§7, §11] |
| **Master MEL** | Tập danh mục MEL tĩnh theo loại tàu bay do nhà sản xuất cung cấp; ước khoảng 3.000 item một bộ; phân cấp tối đa 5–6 cấp. | [17062026 §40, §95–§99] |
| **MEL Active** | Tập MEL item đang được kích hoạt trên một tàu cụ thể, do thợ máy gắn lên thông qua AMOS sau khi phát hiện hỏng hóc; AMOS active ở cấp 3–4. | [17062026 §104, §136, §137] |
| **Nội dung gốc / Bản biên soạn (MEL)** | Hai lớp lưu trữ Master MEL: nội dung gốc = nguyên văn nhà sản xuất, bản biên soạn = bản chị Nga bổ sung metadata khai thác. Dùng để so sánh khi phát hành phiên bản mới. | [17062026 §149–§152] |
| **MEL penalty / Nhánh x1/x2/x3** | Mỗi MEL item ở cấp gần cuối có nhiều trường hợp phân nhánh ký hiệu x1, x2, x3, x4..., mỗi nhánh có giá trị penalty khác (fuel factor %, payload reduction kg, altitude cap FL, giới hạn autopilot, giới hạn sân bay). Điều phái chọn nhánh áp dụng. | [17062026 §83–§86, §121]; [MEL 78A.csv `21-52-01-02-01X1/X2/X3`] |
| **Lido Import file** | Định dạng nhập dữ liệu MEL của Lido (Lufthansa Systems — hệ thống lập kế hoạch OFP của VNA); dạng bảng cột (CSV/Excel), mỗi MEL item là một dòng, gồm cột định danh, cột penalty định lượng, cờ thiết bị và cột `action` (INSERT/UPDATE). | [17062026 §50, §78]; [MEL 78A.csv] |
| **FODM** (Flight Ops Documentation Manager) | Phần mềm Airbus dùng để biên soạn và xuất tài liệu MEL/CDL theo định dạng máy đọc. Đã được VNA xác nhận tại buổi 17/06. ASR ban đầu ghi sai thành "FOMA/EvoDM". | [17062026 §74] |
| **Công cụ MEL Boeing (tên chưa xác nhận)** | Phần mềm Boeing tương đương FODM, ASR ghi là "filmmaker"/"Filmator"; chị Nga đang dùng để đọc tài liệu MEL B787 trước khi nhập vào Lido Import file. | [17062026 §74] `[cần xác nhận — KS-57]` |
| **DDMS** (Document & Data Management System) | Hệ thống số hoá tài liệu kỹ thuật tàu bay mà VNA đang nghiên cứu (có thể liên quan demo từ một đơn vị ở Orlando trước đây); khi triển khai có khả năng cung cấp dữ liệu MEL số hoá cho TOSS, OPS++... thay vì nhập tay. Hiện chưa phê duyệt. | [17062026 §44–§47, §52, §53] |
| **VICO** | Đơn vị hỗ trợ VNA triển khai AMOS; có nhân sự hiểu cấu trúc DB AMOS và có thể hỗ trợ mapping dữ liệu cho TOSS. ASR ghi "Vicô"/"Vyco". | [17062026 §177] |
| **Hà Tần (nhóm)** | Nhóm bên VNA đã có kết nối Data Warehouse của AMOS; đã lấy về một số dữ liệu nhưng chưa khảo sát đầy đủ cấu trúc. TOSS sẽ làm việc với nhóm này để biết hiện trạng dữ liệu trước khi khảo sát chi tiết với VICO. | [17062026 §174–§175] |
| **BCAO** (Báo cáo Khai thác Hàng ngày) | Báo cáo kỹ thuật do trực ban trưởng phát hành hàng ngày, có mục liệt kê MEL/CDL ảnh hưởng khai thác cần lưu ý trong ngày; TOSS sẽ feed dữ liệu MEL active sau khi lọc qua danh mục chuẩn của chị Nga. | [17062026 §128, §162, §164] |
| **Action INSERT/UPDATE (cột Lido Import file)** | Cột `action` trong file Lido Import file quy định hành vi nạp dòng vào Lido. Hiện file mẫu của VNA luôn ghi INSERT cho mọi dòng, gây duplicate khi nạp lại; cần điều tra cấu hình bộ chuyển đổi. | [17062026 §157, §158]; [MEL 78A.csv cột `action`] |
