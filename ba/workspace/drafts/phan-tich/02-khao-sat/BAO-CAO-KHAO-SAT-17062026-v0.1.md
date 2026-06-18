---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-17"
survey_date: "2026-06-17"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Quản lý MEL/CDL & Tích hợp AMOS — Buổi chiều 17/06/2026"
---

# Báo cáo Khảo sát — Quản lý MEL/CDL & Tích hợp AMOS

**Ngày khảo sát:** 17/06/2026  
**Phiên họp:** TOSS-17-06-8 (buổi 8)

---

> *(Cảnh báo chất lượng ASR: Transcript gốc có chất lượng nhận dạng giọng nói (ASR) trung bình — nhiều đoạn nhiễu, lặp từ, và thuật ngữ kỹ thuật bị biến dạng. Các thuật ngữ đã được hiệu chỉnh theo domain-knowledge: "mail/mèo/meo" → MEL, "AMOZ/AMBOT/HAMOS" → AMOS, "FOIE/FOEM/FOI/FOM" → OPS++ [đã xác nhận: OPS++ — Netline Flight Ops++, BA Lead 18/06/2026], "OIP/OFP" → OFP, "NAIL/nail" → MEL item. Một số đoạn không khôi phục được — gắn cờ `[cần xác nhận]`.)*

---

## I. Thông tin chung

| Trường | Nội dung |
|---|---|
| **Thời gian** | 17/06/2026 — buổi chiều (khoảng 00:00–01:18 theo timestamp transcript) |
| **Mục đích** | Khảo sát yêu cầu quản lý MEL (Minimum Equipment List) / CDL (Configuration Deviation List) trong TOSS; xác định phạm vi tích hợp với AMOS (Aircraft Maintenance & Operations System) |
| **Đối tượng khảo sát** | Đại diện VNA — phụ trách quản lý dữ liệu MEL bên bộ phận kỹ thuật (được gọi là "Nga" trong transcript); có sự tham gia của đại diện VNA bên khai thác |
| **Phía khảo sát** | Nhóm TOSS/VTIT (Hiệp và các thành viên) |
| **Phạm vi buổi** | Cấu trúc Master MEL; tích hợp AMOS → TOSS cho MEL active; cảnh báo Dispatcher; phương án nhập liệu ban đầu; định dạng dữ liệu (Lido ePot, XML) |

---

## II. Nội dung trao đổi

### 1. Phạm vi tích hợp AMOS ↔ TOSS cho MEL/CDL

**Yêu cầu**

VNA xác nhận trong YCKT của cả hai hệ thống đều có yêu cầu tích hợp AMOS để lấy thông tin MEL/CDL và hỏng hóc kỹ thuật. Cụ thể, mục 3-2 trong tài liệu YCKT ghi rõ: tích hợp AMOS, kế hoạch bảo dưỡng tàu bay, hỏng hóc MEL/CDL và thông tin kỹ thuật liên quan. TOSS sẽ là đầu mối tích hợp AMOS và cung cấp dữ liệu MEL cho các hệ thống phụ trợ về sau.

**Thảo luận và Đề xuất**

OPS++ (Netline Flight Ops++) là hệ thống khai thác chính hiện hữu của VNA. VNA và VTIT thống nhất: TOSS là đầu mối tích hợp AMOS một lần và cung cấp dữ liệu MEL cho OPS++ — OPS++ không tích hợp AMOS riêng.

Việc chi tiết hóa giao diện TOSS ↔ OPS++ sẽ được thực hiện trong khảo sát tích hợp; tại buổi 17/06 chưa cần đặc tả chi tiết hơn.

**Kết luận**

TOSS chịu trách nhiệm tích hợp AMOS để lấy toàn bộ dữ liệu MEL/CDL phục vụ nghiệp vụ khai thác, đồng thời cung cấp dữ liệu MEL/CDL cho OPS++ theo yêu cầu. Chi tiết giao diện TOSS ↔ OPS++ được làm rõ trong khảo sát tích hợp.

---

### 2. Cấu trúc Master MEL và kiến trúc dữ liệu

**Yêu cầu**

VNA yêu cầu TOSS quản lý Master MEL — tập tĩnh theo loại tàu bay do nhà sản xuất ban hành. Mỗi bộ Master MEL có khoảng 3.000 item. Mỗi item MEL bao gồm: mã item (Item Number), tên thiết bị, nội dung mô tả dạng free text, và các thuộc tính ảnh hưởng khai thác như hệ số nhiên liệu bổ sung (fuel factor), giảm tải (payload reduction), giới hạn độ cao (altitude cap), giới hạn autopilot, và giới hạn sân bay.

Ngoài Master MEL, hệ thống cũng cần quản lý MEL Active — tập MEL đang được kích hoạt trên từng tàu cụ thể, do AMOS cung cấp khi thợ máy gắn item MEL lên tàu sau khi phát hiện hỏng hóc.

**Thảo luận và Đề xuất**

Master MEL có cấu trúc phân cấp tối đa 5–6 level, ví dụ mã dạng "21-25-01-01-02", trong đó mỗi nhóm số là một level. Hiện tại AMOS chỉ gắn MEL active ở mức level 3–4; level chính xác AMOS có thể đi sâu tới cần được xác nhận thêm qua khảo sát DB AMOS.

Mỗi MEL item tại level cuối cùng có thể có nhiều trường hợp phân nhánh (ký hiệu x1, x2, x3…), mỗi trường hợp có các giá trị penalty khác nhau (ví dụ: x1 — giảm tải 500 kg; x2 — giới hạn autopilot; x3 — không bay sân bay X). Việc quyết định áp dụng trường hợp nào vẫn thuộc trách nhiệm của Dispatcher dựa trên tình huống thực tế; TOSS chỉ hiển thị thông tin để hỗ trợ quyết định.

Nhóm TOSS đề xuất lưu trữ Master MEL với hai lớp: (a) nội dung gốc — nguyên văn từ tài liệu nhà sản xuất; (b) bản biên soạn — phiên bản đã được bộ phận kỹ thuật VNA bổ sung metadata khai thác (fuel factor, payload reduction, altitude cap…). Cấu trúc hai lớp này cho phép so sánh khi nhà sản xuất phát hành phiên bản mới: hệ thống đánh dấu những item có nội dung gốc thay đổi để người dùng chỉ cần rà soát và cập nhật phần metadata của những item đó.

Trong dài hạn, VNA đang nghiên cứu hệ thống DDMS (Document & Data Management System — hệ thống số hóa tài liệu kỹ thuật) có khả năng export dữ liệu MEL theo định dạng số hóa, giúp tích hợp tự động hơn. Tuy nhiên DDMS chưa được triển khai nên TOSS giai đoạn đầu vẫn dùng phương án nhập liệu thủ công và import từ file.

**Kết luận**

Kiến trúc dữ liệu MEL trong TOSS gồm hai tầng: Master MEL (tĩnh, theo loại tàu) và MEL Active (từ AMOS, theo từng tàu). Master MEL lưu hai lớp nội dung: nội dung gốc từ nhà sản xuất và bản biên soạn có metadata khai thác do VNA bổ sung. Cần khảo sát thêm cấu trúc DB AMOS để xác định level nào được active và các trường dữ liệu AMOS cung cấp.

---

### 3. Quy trình khai thác MEL — Cảnh báo Dispatcher

**Yêu cầu**

Khi AMOS gắn một MEL item mới lên tàu, TOSS phải cảnh báo Dispatcher ngay để Dispatcher làm lại OFP (Operational Flight Plan), cập nhật lượng nhiên liệu bổ sung do MEL gây ra. Tương tự, khi MEL item được clear (giải quyết xong), TOSS cũng phải thông báo để Dispatcher điều chỉnh giảm nhiên liệu tương ứng, tránh chở thừa nhiên liệu không cần thiết.

**Thảo luận và Đề xuất**

Khi AMOS đồng bộ MEL active lên TOSS, hệ thống thực hiện mapping với Master MEL để xác định metadata ảnh hưởng khai thác, sau đó hiển thị cảnh báo cho Dispatcher với đầy đủ thông tin penalty. Dispatcher đọc thông tin, quyết định áp dụng trường hợp nào (x1/x2/x3), rồi chạy OFP với các thông số tương ứng.

VNA kỳ vọng có một màn hình tổng hợp cho Dispatcher, gom tất cả cảnh báo liên quan đến một chuyến bay vào một nơi, gồm MEL, NOTAM, thời tiết và các cảnh báo khác, thay vì phải xem nhiều nguồn rời rạc. Mỗi cảnh báo MEL trong màn hình tổng hợp sẽ có liên kết xem chi tiết nội dung item.

Dashboard tổng hợp MEL theo đội tàu cũng được đề cập: Trực ban trưởng cần nhìn thấy toàn bộ MEL đang active trên tất cả tàu bay, phân loại theo mức độ ảnh hưởng khai thác, phục vụ báo cáo BCAO (Báo cáo Khai thác hàng ngày) hàng ngày.

TOSS nhận danh mục MEL active từ AMOS, mapping với danh sách MEL item cần cảnh báo do Nga xây dựng và duy trì, để xác định item nào ảnh hưởng khai thác và đưa vào báo cáo BCAO.

**Kết luận**

TOSS sẽ nhận MEL active từ AMOS, hiển thị cảnh báo cho Dispatcher khi MEL phát sinh hoặc được clear. Dispatcher vẫn là người quyết định áp dụng trường hợp penalty nào. Dashboard tổng hợp MEL theo đội tàu phục vụ Trực ban trưởng và BCAO. Cơ chế nhận dữ liệu từ AMOS (thời gian thực, theo chu kỳ, hay theo lô) cần được xác định thêm.

---

### 4. Phương án nhập liệu Master MEL ban đầu

**Yêu cầu**

Master MEL cần được nhập vào TOSS lần đầu từ tài liệu MEL do nhà sản xuất cung cấp. Tần suất cập nhật thấp, ước tính 1–2 tháng một lần khi nhà sản xuất ra phiên bản mới. VNA (Nga) là người sẽ thực hiện nhập liệu và duy trì dữ liệu này.

**Thảo luận và Đề xuất**

Tài liệu MEL Boeing được cung cấp theo định dạng "FILMATER" [cần xác nhận: tên phần mềm/định dạng chính xác — KS-57 còn mở]; tài liệu MEL Airbus theo phần mềm **FODM** (Flight Ops Documentation Manager). Mỗi hãng sản xuất dùng một công cụ và định dạng riêng. Hiện tại Nga đọc tài liệu MEL dạng PDF, sau đó nhập thủ công các thông tin cần thiết, đặc biệt là phần nội dung ảnh hưởng khai thác (free text) — quy trình này tốn nhiều công sức.

Lido (hệ thống lập kế hoạch OFP) có một định dạng nhập liệu riêng gọi là Lido ePot. Nhóm TOSS đề xuất: TOSS sẽ đọc và phân tích tài liệu MEL để giải mã các trường có thể trích xuất tự động (item code, tên item), còn phần nội dung free text và metadata khai thác vẫn cần người dùng đọc và nhập. Khi Nga cần xem chi tiết, hệ thống hiển thị nội dung gốc của item để Nga đọc và điền metadata mà không cần mở file nguồn song song.

Khi nhà sản xuất phát hành phiên bản MEL mới, TOSS sẽ so sánh nội dung gốc cũ và mới, đánh dấu những item thay đổi. Nga chỉ cần rà soát và cập nhật metadata cho những item đó, không phải làm lại toàn bộ.

Về phía Lido ePot: XML file chứa MEL active theo chuyến bay nhưng có vấn đề cấu trúc — một item có thể bị chia thành nhiều bản ghi ở cấp con khác nhau, gây khó mapping. Ngoài ra, một số chỗ trong file dùng lệnh "insert" thay vì "update", dẫn đến lỗi duplicate khi nạp lại.

Về số lượng item ảnh hưởng khai thác cần quản lý: VNA có ước tính khoảng vài trăm item cần theo dõi đặc biệt (có penalty khai thác), trong tổng số ~3.000 item Master MEL.

**Kết luận**

Phương án nhập liệu: nhập từ file kết hợp giải mã bán tự động (trích xuất item code, tên) và nhập thủ công metadata khai thác. Cần xin dữ liệu mẫu và mô tả định dạng Lido ePot từ VNA để thiết kế cấu trúc DB và màn hình nhập liệu. Vấn đề "insert vs update" trong XML Lido cần điều tra thêm.

---

### 5. Tích hợp DB AMOS — Kế hoạch khảo sát tiếp theo

**Yêu cầu**

Để xây dựng cơ chế mapping chính xác giữa MEL active trên AMOS và Master MEL trong TOSS, cần hiểu rõ cấu trúc DB AMOS: những bảng nào chứa thông tin MEL active, trường nào, và cơ chế nào để TOSS đọc được.

**Thảo luận và Đề xuất**

VNA cho biết đã có kết nối AMOS (nhóm "Hà Tần" đã tham gia), nhưng chưa khảo sát chi tiết cấu trúc DB. VICO (đơn vị hỗ trợ VNA triển khai AMOS) có nhân sự hiểu rõ DB AMOS và có thể hỗ trợ mapping dữ liệu. VNA sẽ sắp xếp một buổi làm việc riêng với nhóm AMOS/VICO để khảo sát cấu trúc dữ liệu.

Trong buổi làm việc đó, nhóm TOSS cần chuẩn bị danh sách các trường dữ liệu cần lấy từ AMOS (dựa trên yêu cầu cảnh báo MEL đã được xác định), từ đó mapping sang bảng/trường tương ứng trong DB AMOS.

**Kết luận**

Cần tổ chức một buổi khảo sát riêng với nhóm AMOS/VICO để xác định cấu trúc dữ liệu DB AMOS phục vụ tích hợp MEL. Nhóm TOSS chuẩn bị danh sách yêu cầu dữ liệu trước buổi đó.

---

## III. Các nội dung đã thống nhất

| # | Nội dung thống nhất |
|---|---|
| 1 | TOSS chịu trách nhiệm tích hợp AMOS cho MEL/CDL; OPS++ không tích hợp AMOS riêng mà lấy dữ liệu MEL/CDL từ TOSS. |
| 2 | Kiến trúc 2 tầng: Master MEL (tĩnh, theo loại tàu) + MEL Active (từ AMOS, theo từng tàu cụ thể). |
| 3 | Master MEL lưu 2 lớp: nội dung gốc (từ nhà sản xuất) + bản biên soạn (bổ sung metadata khai thác do VNA). |
| 4 | MEL item có thể có nhiều trường hợp penalty (x1/x2/x3…); Dispatcher là người quyết định áp dụng trường hợp nào — TOSS chỉ hiển thị thông tin hỗ trợ. |
| 5 | Khi MEL phát sinh mới hoặc được clear, TOSS cảnh báo Dispatcher để làm lại OFP. |
| 6 | Dashboard MEL tổng hợp theo đội tàu phục vụ Trực ban trưởng và BCAO hàng ngày. |
| 7 | Phương án nhập liệu ban đầu: giải mã bán tự động (trích item code/tên) kết hợp nhập thủ công metadata khai thác; tần suất cập nhật ~1–2 tháng/lần. |
| 8 | Giai đoạn đầu TOSS dùng free text + nhập tay cho phần metadata MEL; tích hợp DDMS (số hóa tài liệu kỹ thuật) để sau khi DDMS triển khai. |
| 9 | Cần tổ chức buổi khảo sát riêng với nhóm AMOS/VICO để xác định cấu trúc DB AMOS cho tích hợp MEL. |

---

## IV. Vấn đề cần làm rõ

1. ~~Tên đầy đủ hệ thống trong transcript~~ → **Đã xác nhận:** Hệ thống là **OPS++** (Netline Flight Ops++) — hệ thống khai thác chính của VNA. Cụm ASR "FOIE/FOI/FOM/FOEM" trong transcript đều chỉ OPS++. `[SME-45 — Đã chốt 17/06/2026; hiệu chỉnh 18/06/2026: hệ thống là OPS++, không phải "e-FON"]`
2. AMOS active MEL item ở level tối đa nào (level 3? level 4? sâu hơn)? Cần xác nhận với nhóm AMOS/VICO để thiết kế cấu trúc dữ liệu MEL phù hợp. `[cần xác nhận — KS-55]`
3. Cơ chế tích hợp AMOS → TOSS cho dữ liệu MEL active: API theo thời gian thực, theo chu kỳ polling, hay xuất theo lô? Định dạng dữ liệu trao đổi? `[cần khảo sát — KS-56]`
4. Định dạng file tài liệu MEL Boeing ("FILMATER") — tên phần mềm/định dạng chính xác và khả năng đọc/nhập tự động? *(Airbus = FODM đã xác nhận.)* `[Boeing còn chờ — KS-57 Đang xử lý]`
5. Mô tả chi tiết định dạng Lido ePot: danh sách trường, kiểu dữ liệu, mapping sang dữ liệu MEL TOSS? VNA (Nga) đã đề nghị cung cấp mẫu — cần nhận file. `[cần khảo sát — KS-58]`
6. Vấn đề "insert vs update" trong file XML Lido ePot: nguyên nhân chính xác và cách xử lý trong quy trình import? `[cần xác nhận — KS-59]`
7. Phạm vi dữ liệu cụ thể cần lấy từ AMOS: bảng/trường nào trong DB AMOS chứa MEL active, MEL item code, trạng thái, tàu áp dụng? `[cần khảo sát DB AMOS — KS-55]`
8. Những MEL item nào được xác định là "ảnh hưởng khai thác" (cần cảnh báo Dispatcher)? Số lượng ước tính và tiêu chí lọc? Cần xin danh sách từ Nga. `[cần xác nhận — SME-46]`
9. Hệ thống "DDMS" (Document & Data Management System) VNA đang nghiên cứu: tên đầy đủ, tiến độ triển khai, và khả năng tích hợp với TOSS về sau? `[cần xác nhận — SME-47]`

---

## V. Thuật ngữ đề xuất bổ sung domain-knowledge

> **Lưu ý nội bộ (CHỈ bản MD):** Bảng này là đề xuất — chờ BA Lead confirm trước khi ghi vào `toss-glossary-v0.1.md`.

| Thuật ngữ | Mô tả từ ngữ cảnh transcript | Nguồn dòng |
|---|---|---|
| **OPS++** (Netline Flight Ops++) | Hệ thống khai thác chính của VNA; nhận dữ liệu MEL/CDL từ TOSS (TOSS là đầu mối tích hợp AMOS). Cụm ASR "FOIE/FOI/FOM/FOEM" đều chỉ OPS++ (ban đầu nhầm là "e-FON", hiệu chỉnh 18/06). Glossary v0.18 đã cập nhật. | Dòng 3–6, 11, 17 |
| **Master MEL** | Tập danh mục MEL tĩnh theo loại tàu bay do nhà sản xuất cung cấp; khoảng 3.000 item/bộ; phân cấp tối đa 5–6 level | Dòng 24, 37, 90, 136 |
| **MEL Active** | Tập MEL item đang được kích hoạt trên một tàu cụ thể, do AMOS ghi nhận khi thợ máy gắn item MEL lên tàu sau hỏng hóc | Dòng 109, 136, 166 |
| **MEL penalty** | Hạn chế/chi phí hiệu năng do một MEL item gây ra, gồm: fuel factor (%), payload reduction (kg/lbs), altitude cap (FL), giới hạn autopilot, giới hạn sân bay | Dòng 31–33, 84–86, 164 |
| **Lido ePot** | Format import dữ liệu MEL của hệ thống lập kế hoạch OFP Lido (Lufthansa Systems); file XML có cấu trúc cột/trường riêng | Dòng 78, 157 |
| **FILMATER** | Tên phần mềm/format tài liệu MEL của Boeing (có thể là "FILMMAKER" hoặc tên thực khác — ASR biến dạng); cần xác nhận chính xác | Dòng 74 |
| **FODM** (Flight Ops Documentation Manager) | ~~Chờ xác nhận~~ — **Đã xác nhận 17/06:** Phần mềm Airbus quản lý và xuất tài liệu MEL/CDL. ASR ghi sai thành "FOMA". Glossary v0.17 đã cập nhật. | Dòng 74 |
| **DDMS** | Document & Data Management System — hệ thống số hóa tài liệu kỹ thuật tàu bay mà VNA đang nghiên cứu; khi triển khai có thể cung cấp dữ liệu MEL dạng số hóa cho TOSS | Dòng 44, 53 |
| **VICO** | Đơn vị hỗ trợ VNA triển khai AMOS; có nhân sự hiểu cấu trúc DB AMOS (ASR ghi "Vicô"/"Vyco") | Dòng 177 |
