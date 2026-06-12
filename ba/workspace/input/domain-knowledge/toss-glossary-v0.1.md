---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.10"
date: "2026-06-12"
status: "Draft"
document_type: "Domain Knowledge — Từ điển Thuật ngữ TOSS"
---

# Từ điển Thuật ngữ Nghiệp vụ — TOSS

> Danh sách thuật ngữ hàng không đặc thù dùng trong dự án TOSS. Mỗi entry gồm: thuật ngữ tiếng Anh (viết tắt), tên tiếng Việt, và mô tả ngữ cảnh sử dụng trong hệ thống.
>
> **Bổ sung thêm** khi gặp thuật ngữ mới trong quá trình phân tích. Mọi thuật ngữ trong tài liệu SRS/BRD phải có entry tương ứng tại đây.

---

## A

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **ACARS** (Aircraft Communications Addressing and Reporting System) | Hệ thống Liên lạc & Báo cáo Tàu bay | Hệ thống truyền dữ liệu số giữa tàu bay và mặt đất. TOSS nhận dữ liệu ACARS để cập nhật trạng thái chuyến bay thời gian thực. |
| **ATC** (Air Traffic Control) | Kiểm soát Không lưu | Đơn vị điều hành không phận, cấp phép cất/hạ cánh. TOSS không trực tiếp tích hợp ATC nhưng cần lưu thông tin ATC clearance. |
| **AOC** (Air Operator Certificate) | Giấy phép Khai thác Hàng không | Chứng chỉ cho phép hãng hàng không khai thác thương mại, cấp bởi CAAV. Mọi hoạt động khai thác trong TOSS phải tuân thủ điều kiện AOC. |
| **AOG** (Aircraft On Ground) | Tàu bay nằm đất | Tình trạng tàu bay không thể khai thác (thường do hỏng hóc kỹ thuật/thiếu vật tư), cần xử lý khẩn để đưa trở lại bay. Ảnh hưởng trực tiếp lịch bay/đội tàu — TOSS cần cảnh báo và hỗ trợ điều hành (đổi tàu, gián đoạn). Nguồn xác nhận thuật ngữ: tài liệu FOCA Dangerous Goods (`dangerous-goods-notoc/`). |
| **APU** (Auxiliary Power Unit) | Động cơ phụ trợ | Thiết bị động lực phụ trên tàu bay, cung cấp điện và khí nén khi động cơ chính tắt (khởi động động cơ, điều hòa khi đỗ). Nhiên liệu APU được tính khi lập kế hoạch nhiên liệu. Trong BCAO, trạng thái APU được phân loại: **APU GEN INOP** (hỏng phát điện → cần GPU), **APU BLEED INOP** (hỏng cấp khí → cần ASU, ACU), **APU SMELL** (có mùi → cần ACU), **APU INOP** (hỏng hoàn toàn → cần ASU, ACU, GPU), **MONITOR APU** (theo dõi). Bảng APU/PACK trong BCAO theo dõi tất cả tàu trong các tình trạng này mỗi ngày. Nguồn xác nhận: ICAO Annex 6 Part I + FAA 14 CFR Part 121; mẫu BCAO (họp 09/06). |
| **ACDM / A-CDM** (Airport Collaborative Decision Making) | Ra quyết định phối hợp tại sân bay | Cơ chế chia sẻ dữ liệu thời gian thực giữa các bên tại sân bay (milestone times, vị trí, trạng thái chuyến bay, điều phối mặt đất/không lưu). TOSS tích hợp ACDM (YCKT TOSS-080). **Phỏng vấn 11/06 chiều: A-CDM là nguồn cho màn giám sát tổng quan (monitoring overview) giai đoạn sau cất cánh.** |
| **ACARS Fuel Unit** | Đơn vị nhiên liệu trên điện ACARS | Đơn vị nhiên liệu trong điện ACARS có thể khác kg (vd tấn) và **thay đổi theo giai đoạn** trên cùng một tàu → TOSS cần **hệ số quy đổi về kg có hiệu lực theo giai đoạn** (nguồn: họp 09/06). |
| **ACARS OOOI** (OUT/OFF/ON/IN) | Bộ mốc chuyển động chuyến bay qua ACARS | Bốn mốc thời gian thực tế truyền qua [ACARS](#a): **OUT** (rời bãi đỗ/off-block), **OFF** (cất cánh), **ON** (hạ cánh), **IN** (vào bãi đỗ/on-block). FOS Report lưu cả thời gian (OUT/OFF/ON/IN TIME) và nhiên liệu tại mốc (OUT/OFF/ON/IN FUEL). TOSS dùng làm nguồn cập nhật real-time cho màn hình [Monitoring](#p) và trigger raise/clear cảnh báo theo mốc (nguồn: YCKT FOS sheet-09; phỏng vấn 11/06 chiều §II.6). |
| **A-CDM Milestone Times** | Các mốc thời gian theo chuẩn A-CDM | Bộ mốc thời gian khai thác tại sân theo [ACDM/A-CDM](#a), dùng trong FOS Report và màn Monitoring: **SOBT/EOBT/TOBT/AOBT** (lịch/dự kiến/mục tiêu/thực tế off-block), **TSAT/ASAT** (mục tiêu/thực tế phê duyệt khởi động), **CTOT/TTOT/ATOT** (tính toán/mục tiêu/thực tế cất cánh), **ELDT/ALDT** (dự kiến/thực tế hạ cánh), **SIBT/EIBT/AIBT** (lịch/dự kiến/thực tế in-block), **ASBT** (thực tế bắt đầu boarding), **ARDT/ASRT** (thực tế sẵn sàng khởi hành / yêu cầu khởi động) (nguồn: YCKT FOS sheet-09; chuẩn A-CDM/ICAO — tham khảo). |
| **ACU** (Air Conditioning Unit / Air Cooler Unit) | Xe làm mát / Xe cấp điều hòa mặt đất | Thiết bị mặt đất cấp điều hòa không khí cho tàu bay khi đỗ, thay thế khi APU không cấp khí điều hòa được (APU BLEED INOP, APU SMELL, APU INOP). Trong BCAO còn gọi là "xe làm mát". Liệt kê trong bảng APU/PACK và danh mục sân bay không có xe hỗ trợ tàu hỏng APU (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **AFTN** (Aeronautical Fixed Telecommunication Network) | Mạng viễn thông cố định hàng không | Mạng trao đổi điện văn hàng không (NOTAM, lịch bay…). TOSS tích hợp AFTN/AMHS (YCKT TOSS-100). |
| **AMHS** (ATS Message Handling System) | Hệ thống xử lý điện văn ATS | Hệ thống điện văn hàng không thế hệ mới (kế thừa AFTN). TOSS tích hợp (YCKT TOSS-100). |
| **ASM** (Ad-hoc Schedule Message) | Điện cập nhật lịch bay đột xuất | Điện văn IATA cập nhật thay đổi lịch bay (cùng nhóm SSM). TOSS nhận từ Flight Scheduling System (YCKT TOSS-067/099). |
| **ASU** (Air Start Unit / Air Starter Unit) | Xe khởi động khí | Thiết bị mặt đất cấp khí nén để khởi động động cơ tàu bay khi APU không thể cấp bleed air (APU BLEED INOP, APU INOP). Trong BCAO còn gọi là "xe khởi động khí". Liệt kê trong bảng APU/PACK và danh mục sân bay không có xe hỗ trợ tàu hỏng APU (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **AVES** | Hệ thống quản lý tổ bay (VNA) | Hệ thống nguồn cung cấp thông tin phi công, tiếp viên và lịch bay tổ bay. TOSS tích hợp AVES (YCKT TOSS-068). *(tên hệ thống nội bộ — nguồn YCKT.)* |
| **AIS** (Aeronautical Information Services) | Dịch vụ Thông báo tin tức Hàng không | Dịch vụ cung cấp tin tức hàng không (NOTAM, AIP…) theo ICAO Annex 15. Điều phái phối hợp AIS khi kiểm tra NOTAM (nguồn: FDOP §3.2). |
| **AWY** (Airway) | Đường hàng không | Hành lang bay được thiết lập giữa các điểm dẫn đường. Điều phái kiểm tra NOTAM theo nhóm AWY/route (nguồn: FDOP §3.2). |
| **AHM560** (IATA Airport Handling Manual ch. 560) | (giữ nguyên AHM560) | Chương 560 của IATA Airport Handling Manual — dữ liệu trọng lượng & cân bằng tàu bay do hãng công bố. Điều phái tra DOW theo loại tàu trong AHM560 (nguồn: FDOP §3.1 — "Check DOW information for any type of aircrafts in AHM560"). |
| **AQD** | (giữ nguyên — tên hệ thống) | Hệ thống báo cáo sự cố/an toàn khai thác — điều phái lập "AQD report" khi có sự cố trong ca (divert…) (nguồn: FDOP §3.1 — "prepare reports on operational incidents... (divert, AQD report, etc.)"). *(Cần xác nhận với VNA — khả năng phần mềm Aviation Quality Database.)* |
| **AMOS** | (giữ nguyên — tên hệ thống bảo dưỡng) | Hệ thống quản lý bảo dưỡng & kỹ thuật tàu bay của VNA — nguồn cung cấp MEL/CDL, defect, AOG cho TOSS; TOSS hiển thị + cảnh báo, KHÔNG thay thế chức năng AMOS (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.3; YCKT TOSS-122…). *(Tên đầy đủ + cơ chế tích hợp API/event/poll: chờ xác nhận — xem OID SME-14.)* |
| **AHM (bảng dầu)** | Bảng định mức nhiên liệu/dữ liệu khai thác | "Bảng dầu AHM" được điều phái nhắc trong nghiệp vụ nhiên liệu — bảng dữ liệu định mức dầu/khai thác mà điều phái dùng và cấp cho Lido. Liên quan [AHM560](#a) (IATA Airport Handling Manual). Hiện một phần quản lý qua phần mềm nội bộ (IFV). (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.2). *(Phạm vi/định dạng bảng + phần mềm IFV: xem OID SME-16.)* |
| **APU Time** | Thời gian sử dụng APU | Thời gian hoạt động của [APU](#a) trên chuyến bay — thông số điều phái theo dõi (liên quan chi phí APU và cảnh báo) (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.6). |

---

## B

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **BCAO** | Báo cáo Điều hành ngày Khai thác | Báo cáo vận hành hàng ngày do trực ban trưởng lập và phát hành sau khi phê duyệt. Là **một văn bản duy nhất** gồm hai phần: (1) **Tình hình ngày hôm trước** — số chuyến (VN/0V/BL), OTP/OSP, LF theo đường trục, số tàu khai thác/dự bị, VIP A/Khác, ferry, bất thường; (2) **Kế hoạch ngày hôm nay** — cùng các mục trên + bảng APU/PACK, danh mục sân bay không hỗ trợ tàu hỏng APU, AOG/defect, TAF, NOTAM, phụ lục kỹ thuật. Thông tin bất thường nhập từ nhiều nguồn (kỹ thuật, dịch vụ, trực ban trưởng) trong ngày, cuối ngày phát hành. TOSS số hóa BCAO theo đúng cấu trúc hiện hành, phân quyền nhập theo tab nguồn, phê duyệt trước khi phát hành (nguồn: họp 09/06; mẫu BCAO_10Jun2025_11Jun2025-v2.docx). |
| **Block Time** | Thời gian Block | Thời gian từ khi tàu bay tháo chèn (off-block) đến khi gắn chèn lại (on-block). Dùng để tính giờ bay và FTL của phi hành đoàn. |
| **BQ** (Bảo quản) | Trạng thái Bảo quản tàu bay | Tình trạng tàu bay đang được bảo quản (cất giữ tạm thời, không khai thác). Xuất hiện trong báo cáo số tàu của BCAO (vd "02 BQ HAN" = 2 tàu đang bảo quản tại HAN). Phân biệt với MNT (đang bảo dưỡng) và tàu đang khai thác (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **Briefing** | Giải trình / Phổ biến thông tin chuyến bay | Cung cấp/giải trình **thông tin tóm tắt có cấu trúc** phục vụ chuẩn bị & thực hiện chuyến bay (khí tượng + NOTAM + tình trạng khai thác). Trong TOSS chủ yếu là **briefing kế hoạch bay/dispatch** do điều phái (Dispatcher) thực hiện cho tổ bay. Phân loại khí tượng (FAA): **Standard / Abbreviated / Outlook**; ngoài ra có **Passenger briefing** (14 CFR §91.519), **Operational control briefing** (§91.1013). Nguồn: `briefing/` (FAA AC 91-92, FAA-H-8083-28 Ch.3). **Trong ngữ cảnh tài liệu chuyến bay giữ nguyên tiếng Anh "briefing / Briefing Sheet / briefing package"** theo cách dùng của khách hàng (YCKT TOSS-226, mục 27.0). |
| **BOBCAT** | (giữ nguyên — tên riêng) | Cơ chế/hệ thống cấp slot cho chuyến bay qua không phận Afghanistan (KABUL FIR). Điều phái đăng ký slot BOBCAT trước khi bay qua vùng trời không kiểm soát (nguồn: FDOP §3.4). *(Cần xác nhận tên đầy đủ với VNA.)* |

---

## C

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **CAAV** (Civil Aviation Authority of Vietnam) | Cục Hàng không Việt Nam | Cơ quan quản lý nhà nước về hàng không dân dụng Việt Nam. Mọi quy định CAAV là ràng buộc pháp lý cho TOSS. |
| **Captain / PIC** (Pilot-in-Command) | Cơ trưởng / Người chỉ huy tàu bay | Phi công chịu trách nhiệm cao nhất trong chuyến bay. TOSS quản lý lịch bay và chứng chỉ của PIC. |
| **Captain's Release** | (giữ nguyên tiếng Anh) | Thao tác cơ trưởng xác nhận đã nhận và chấp nhận bộ tài liệu chuyến bay (OFP, NOTAM, WX, briefing package) trên MO Plus. **Điều kiện bắt buộc: điều phái phải hoàn tất [Dispatch Release](#d) trước; MO Plus chặn thao tác này nếu Dispatch Release chưa được thực hiện.** (nguồn: phỏng vấn Dispatcher 11/06/2026 — phần 1). |
| **CAMO** (Continuing Airworthiness Management Organization) | Tổ chức Quản lý Duy trì Khả năng Bay | Đơn vị chịu trách nhiệm theo dõi khả năng bay của tàu bay. TOSS tích hợp với CAMO để theo dõi bảo dưỡng. |
| **Check-in** | Làm thủ tục | Thủ tục hành khách tại sân bay. Nằm ngoài phạm vi TOSS (thuộc hệ thống DCS). |
| **CM** (Cargo Manifest) | Bản kê hàng hóa | Bản kê hàng hóa/bưu kiện vận chuyển trên chuyến bay (loại, khối lượng, người gửi/nhận). Là một trong các tài liệu bắt buộc mang theo chuyến bay (ICAO Annex 9). TOSS đối chiếu CM với số liệu tải khi lập [Loadsheet](#l). |
| **Category / Nhóm đội tàu** (Fleet Grouping) | Phân nhóm đội tàu | Cách gom loại tàu thành nhóm phục vụ báo cáo (vd 320+321 = 1 category; thân rộng/thân hẹp; A350/787/777/ATR). **Mỗi báo cáo có thể dùng cách chia nhóm khác nhau** (fuel flow / taxi time / định mức nhiên liệu) → TOSS cho định nghĩa nhiều Category, mỗi tàu map 1 lần (nguồn: họp 09/06). |
| **CDL** (Configuration Deviation List) | Danh mục sai lệch cấu hình | Danh mục các bộ phận bên ngoài tàu bay được phép thiếu/hỏng mà vẫn khai thác được (đi cùng MEL). Điều phái kiểm tra hỏng hóc MEL/CDL trước khi lập kế hoạch bay (nguồn: FDOP §3.1; FAA-S-8081-10E). |
| **Charter** | (giữ nguyên "charter") | Chuyến bay thuê chuyến (thuê thương mại theo hợp đồng, không thuộc lịch thường lệ). Khách hàng giữ nguyên "charter" trong phân loại tính chất chuyến bay: Ferry, hủy, tăng, chở khách, chở hàng, thường lệ, VIP, charter (YCKT TOSS-271). **Phân biệt với "chuyên cơ"** (= chuyến bay nguyên thủ/VIP A). |
| **CLC** (Control Load Center) | Trung tâm Kiểm soát Cân bằng tải | Đơn vị kiểm soát cân bằng tải trọng — cung cấp thông tin tải/hành khách chính xác cho điều phái và nhận Final Weigh Manifest để lập Loadsheet. **Tên đầy đủ xác nhận từ nguồn:** FDOP §3.2 — "Control Load Center (CLC)" (thêm: FDOP §3.3, §3.5; YCKT sheet-07). *(Phỏng vấn 11/06 Phần 2 có gọi "Centralized Load Control" — vẫn giữ "Control Load Center" theo FDOP; xem OID SME-12.)* |
| **Cost Index (CI)** | Chỉ số chi phí | Tham số tối ưu chi phí khai thác (cân đối chi phí thời gian vs nhiên liệu) đưa vào kế hoạch bay; điều phái nhắc tới CI theo từng giai đoạn **Climb / Cruise / Descend**. Hiện Lido có thể chỉ trả 1 CI — điều kiện trả đủ 3 CI cần xác nhận (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.8; Đề xuất §II.1, §II.4). *(3 CI: xem OID KS-17.)* |
| **Carrier** | Hãng vận chuyển | Mã hãng khai thác trên số hiệu chuyến (VN — Vietnam Airlines, 0V — VASCO, BL — Pacific Airlines…); vừa là thành phần đầu của Flight Number, vừa là **chiều phân quyền dữ liệu** (lọc/giám sát theo hãng) (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng). |
| **Color Scheme cảnh báo (TOSS)** | Quy ước màu cảnh báo | Quy ước màu thống nhất trên giao diện giám sát: **Đỏ** = bắt buộc xử lý (có thể nhấp nháy) · **Vàng** = ghi nhận/theo dõi · **Xanh** = đã clear/bình thường · **Xám/không màu** = không áp dụng (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng — thiết kế màn Monitoring). |
| **Captain Certification per Aerodrome** | Chứng chỉ cơ trưởng theo sân bay đặc biệt | Yêu cầu cơ trưởng có chứng chỉ/được phê chuẩn khai thác tại một số **sân bay đặc biệt**; TOSS cảnh báo khi đổi tổ bay mà cơ trưởng chưa đủ chứng chỉ cho sân bay đó (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.5). *(Danh mục sân bay đặc biệt + điều kiện: xem OID SME-18.)* |
| **Confirm Release / Reload OSP** | Phi công xác nhận Release | Thao tác phi công xác nhận đã nhận bản OFP đã [Dispatch Release](#d) (trên MO Plus); khi điều phái [Unrelease](#u) thì trạng thái Confirm Release bị reset, phi công phải xác nhận lại (nguồn: phỏng vấn Dispatcher 11/06/2026 buổi chiều §II.4). |

---

## D

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **Delay Code** | Mã chậm chuyến | Mã IATA chuẩn phân loại nguyên nhân chậm chuyến. TOSS yêu cầu Dispatcher ghi Delay Code khi chuyến bay chậm > 15 phút. |
| **Dispatch Release** | (giữ nguyên tiếng Anh "Dispatch Release") | Hành động/trạng thái xác nhận chuyến bay đủ điều kiện khởi hành do điều phái thực hiện. **Khách hàng dùng nguyên văn tiếng Anh, không dịch** (YCKT TOSS-223: "Dispatch Released = TRUE thì Phi công mới thực hiện Flight Release"; sheet-05 DSP). Quy trình nghiệp vụ (phỏng vấn 11/06): Lido tự sinh OFP → tự đẩy lên MO Plus; điều phái thực hiện Dispatch Release trên TOSS → TOSS gắn trạng thái "đã Dispatch Release" vào phiên bản OFP đó → phi công mới được thực hiện [Captain's Release](#c). **Là tiền đề bắt buộc của Captain's Release.** **Cặp đối xứng [Unrelease](#u)** (phỏng vấn 11/06 chiều): điều phái có thể Unrelease để hủy Release, quay về phiên bản OFP cũ và sinh revision mới mang dữ liệu cũ; khi đó [Confirm Release](#c) của phi công bị reset. *(v0.4: thay bản dịch cũ "Giấy phép Khai thác" — không thấy khách hàng dùng.)* |
| **Dispatcher / Flight Dispatcher (FD)** | Điều phái / Nhân viên điều phái bay | Người chịu trách nhiệm lập kế hoạch và kiểm soát chuyến bay tại OCC. Là người dùng chính của module Khai thác Bay trong TOSS. **Khách hàng dùng "Điều phái"** (YCKT TOSS-234/236/244; sheet-07 menu). *(v0.4: thay bản dịch cũ "Kiểm soát viên Khai thác / Điều phối viên" — không thấy khách hàng dùng.)* |
| **Delivery Flight** | Chuyến bay nhận tàu bay | Chuyến bay đưa tàu bay mới nhận (mua/thuê) từ nơi giao (nhà sản xuất/bên cho thuê) về căn cứ khai thác. Quy trình điều phái cho delivery flight gồm chuẩn bị nhân sự, thu thập dữ liệu (MSN, 24-bit, DOW…), lập kế hoạch bay (nguồn: FDOP §3.5). |
| **DM** | (giữ nguyên — chức danh nội bộ VNA) | Cấp quản lý trực mà điều phái báo cáo/thảo luận khi có rủi ro vượt ngưỡng, thay đổi slot, quyết định khai thác (nguồn: FDOP §3.1–3.5). *(Cần xác nhận tên đầy đủ với VNA: Duty Manager hay Dispatch Manager — chưa có nguồn.)* |
| **DGM** | (giữ nguyên — chức danh nội bộ VNA) | Xuất hiện dạng "DGM OCD", "DGM OCC" trong quy trình điều phái — cấp phó quản lý đơn vị (nguồn: FDOP §3.1, §3.2). *(Cần xác nhận chức danh chính thức với VNA.)* |
| **DSP** | (giữ nguyên — viết tắt nội bộ VNA) | Viết tắt gắn với nghiệp vụ điều phái (DSP briefing, SUP DSP, sheet "DSP" trong YCKT). Khả năng = Dispatch/Dispatcher (nguồn: FDOP §3.2, §3.5; YCKT sheet-05). *(Cần xác nhận với VNA.)* |
| **DOW** (Dry Operating Weight) | Trọng lượng khô | Trọng lượng tàu bay sẵn sàng khai thác chưa gồm nhiên liệu và payload. Khách hàng dùng "trọng lượng khô (DOW)" / "DOW" nguyên dạng (YCKT TOSS-200/252; vnaocc-proposal). Điều phái kiểm tra DOW theo loại tàu trong AHM560 (nguồn: FDOP §3.1, §3.5). |
| **Dry Lease** | Thuê khô | Thuê **chỉ tàu bay** của hãng khác, **đội bay (tổ lái/tiếp viên) là của hãng mình**. Tàu bay khai thác dưới AOC của bên thuê. Đối lập với [Wet Lease](#w). Liên quan tài liệu ORO.AOC.110 (Operational leasing). |
| **Duty Time** | Thời gian Trực | Khoảng thời gian phi hành đoàn thực hiện nhiệm vụ. Bị giới hạn bởi FTL và phải được TOSS theo dõi tự động. |

---

## E

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **EFB** (Electronic Flight Bag) | Túi tài liệu điện tử | Thiết bị/hệ thống lưu trữ và hiển thị tài liệu chuyến bay điện tử (kế hoạch bay, thời tiết, NOTAM, AFM, checklist…), thay thế túi tài liệu giấy. Tài liệu tải từ EFB về TOSS lưu tối đa **ba ngày sau khi chuyến bay hạ cánh**, sau đó tự động xóa; tài liệu do TOSS tự sinh vẫn lưu thường (nguồn: họp 09/06). |
| **EDTO** (Extended Diversion Time Operations) | Khai thác kéo dài thời gian chuyển hướng | Khai thác đường bay có đoạn cách sân bay dự bị quá thời gian chuyển hướng tiêu chuẩn (trước đây ETOPS). Điều phái kiểm tra WX cho EDTO ERA và theo dõi thời điểm vào EDTO (nguồn: FDOP §3.1, §3.3; ICAO Annex 6). |
| **ENR ALT / EDTO ERA** (En-route Alternate) | Sân bay dự bị trên đường bay | Sân bay tàu bay có thể hạ cánh khi phải chuyển hướng trong giai đoạn bay đường dài (ICAO Annex 2 định nghĩa "En-route alternate"). Điều phái kiểm tra điều kiện ENR ALT khi chuẩn bị kế hoạch bay (nguồn: FDOP §3.1, §3.3). |
| **eAPIS** (Electronic Advance Passenger Information System) | (giữ nguyên — hệ thống Hoa Kỳ) | Hệ thống khai báo thông tin hành khách/tổ bay điện tử của Hải quan & Biên phòng Hoa Kỳ; phải nộp cho chuyến bay đi/đến Mỹ (vd delivery flight từ Boeing) (nguồn: FDOP §3.5). |
| **ETA** (Estimated Time of Arrival) | Giờ đến dự kiến | Thời điểm dự kiến chuyến bay đến (hạ cánh/vào bãi); trong FOS tương ứng [A-CDM Milestone](#a) ELDT (dự kiến hạ cánh) / EIBT (dự kiến in-block). Hiển thị trên màn [Monitoring overview](#p) của điều phái; đối ứng với ETD (giờ khởi hành dự kiến) (nguồn: YCKT FOS sheet-09; phỏng vấn 11/06 chiều §II.6). |

---

## F

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **FDP** (Flight Duty Period) | Giai đoạn Trực Bay | Khoảng thời gian từ khi phi hành đoàn báo cáo nhiệm vụ đến khi kết thúc chuyến bay cuối. Giới hạn bởi FTL. |
| **Ferry Flight** | Chuyến bay Ferry / Chuyến định vị | Chuyến bay di chuyển tàu bay **không chở hành khách thương mại** (positioning), thực hiện để điều phối tàu về đúng vị trí phục vụ lịch bay tiếp theo. Trong BCAO, ferry được liệt kê riêng với REG, CALLSIGN, CODE (P = Positioning), DEP, ARR, ETD, ETA và tổng hợp theo nhóm (VN/0V/BL) (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). **Phát sinh chuyến ferry mới trong lịch bay → TOSS cảnh báo điều phái** để xử lý tài liệu (OFP, tài liệu riêng của chuyến ferry) (nguồn: phỏng vấn Dispatcher 11/06/2026). |
| **Flight Plan** | Kế hoạch Bay | Tài liệu mô tả lộ trình, độ cao, nhiên liệu dự kiến của chuyến bay. TOSS tích hợp với hệ thống Flight Planning để nhận dữ liệu. |
| **FTL** (Flight Time Limitations) | Giới hạn Giờ Bay | Quy định về thời gian bay tối đa và nghỉ ngơi tối thiểu của phi hành đoàn. CAAV FTL là ràng buộc cứng trong module Quản lý Tổ bay TOSS. |
| **FIR** (Flight Information Region) | Vùng thông báo bay | Vùng trời được cung cấp dịch vụ thông báo bay và báo động (vd KABUL FIR). Điều phái theo dõi NOTAM/tình hình theo FIR (nguồn: FDOP §3.2, §3.4). |
| **FL** (Flight Level) | Mực bay | Độ cao bay tiêu chuẩn tính theo trăm feet áp suất chuẩn (vd FL350). Dùng khi đánh giá xung đột hoạt động bay cùng mực bay/liền kề (nguồn: FDOP §3.4). |
| **FDM** | (giữ nguyên — tên tài liệu nội bộ VNA) | Tài liệu nghiệp vụ điều phái tham chiếu xuyên suốt quy trình: "refer to FDM 6.2.2.6" (NOTAM), "FDM table 4.2" (RFFS), "FDM 4.2.3/6.2.2.7/6.2.4" (WX), "FDM 4.2.4" (RTOW) (nguồn: FDOP §3.1). *(Cần xác nhận tên đầy đủ với VNA — khả năng Flight Dispatch Manual.)* |
| **FON** | (giữ nguyên — tên tài liệu/kênh nội bộ VNA) | Nguồn cập nhật thông tin khai thác cho điều phái, truy cập trong EFB: extra fuel/taxi fuel/holding fuel, performance factor, cost index, thông tin khai thác khác (nguồn: FDOP §3.1 — "refer to FON in EFB"). *(Cần xác nhận tên đầy đủ với VNA — khả năng Flight Operations Notice.)* |
| **FOE** | (giữ nguyên — tên đơn vị nội bộ VNA) | Đơn vị phát triển đường bay, lập kế hoạch bay chi tiết (detailed plan: route, flight time, aircraft, load), nhận tài liệu khai thác sau chuyến. Các nhóm trực thuộc xuất hiện trong nguồn: **OPS team, EFB Group, Aircraft Performance Group (PER)** (nguồn: FDOP §3.3, §3.5). *(Cần xác nhận tên đầy đủ với VNA.)* |
| **Flight Watch** | Giám sát chuyến bay | Theo dõi chủ động chuyến bay đang khai thác (vị trí, nhiên liệu, thời tiết, sai lệch kế hoạch) với khả năng can thiệp/hỗ trợ. Vai trò chuyên trách của điều phái giám sát (nguồn: FDOP §3.1.4, §3.2.1, §3.4). Phân biệt với [Flight Following](#f). *Lưu ý: "Flight Watch" còn là tên hệ thống thời tiết/đường bay TOSS tích hợp (YCKT TOSS-086).* |
| **Flight Following** | Theo dõi chuyến bay | Theo dõi vị trí/tiến trình chuyến bay (nhận thức tình huống), mức độ nhẹ hơn Flight Watch (nguồn: FDOP §3.1.4, §3.4; FAA-S-8081-10E). |
| **Flight Permission / Phép bay** | Phép bay | Phép khai thác do nhà chức trách (CAAV/quốc gia liên quan) cấp cho chuyến bay theo ngày/giờ/loại tàu/đường bay. Điều phái kiểm tra phép bay trước khi lập kế hoạch (nguồn: FDOP §3.1, §3.5). **Phân biệt với [Dispatch Release](#d).** |
| **Fuel Exposure** | Rủi ro nhiên liệu | Mức rủi ro tiêu hao/thiếu hụt nhiên liệu khi điều kiện khai thác thay đổi (thời tiết, đổi mực bay, re-route) trong giai đoạn giám sát chuyến bay (nguồn: FDOP §3.1.4). *(Bản dịch đề xuất — cần SME xác nhận.)* |
| **Flight Detail** | Trang chi tiết chuyến bay | Trang chi tiết một chuyến, mở ở tab mới khi click từ màn Monitoring; gồm nhiều tab phụ (khai thác, tàu bay, tổ bay, tài liệu, tải…) (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng). |
| **FN Surface** | Hậu tố số hiệu chuyến (Netline) | Ký tự hậu tố của Flight Number trên Netline đánh dấu trạng thái lịch: `D` = chuyến **delay sang ngày sau (day-change)**; `Z` `[cần xác nhận định nghĩa]` (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng; xem OID SME-34). |

---

## G

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **Gate** | Cổng / Sảnh đỗ | Vị trí tàu bay đỗ tại nhà ga để hành khách lên xuống. TOSS quản lý phân công Gate trong module Khai thác Mặt đất. |
| **GD / GENDEC** (General Declaration) | Tờ khai Tổng hợp | Tài liệu khai báo chính thức của chuyến bay (hành trình, số hiệu, tổ bay, số khách), dùng cho hải quan/xuất nhập cảnh tại sân bay đi và đến. Tài liệu bắt buộc mang theo (ICAO Annex 9). TOSS lưu/sinh GD trong bộ tài liệu chuyến bay. GD còn **kèm thông tin thợ máy (mechanic/engineer)** đi theo chuyến để dự phòng trường hợp **sân bay đến không có thợ máy** phục vụ kỹ thuật. *(Họp 09/06: trong luồng Load Control, "CD/GDPM" được dùng để chỉ General Declaration — danh sách tổ bay: phi công, tiếp viên + nhân viên mặt đất lên tàu.)* |
| **Ground Handling** | Phục vụ mặt đất / Dịch vụ mặt đất | Các dịch vụ phục vụ tàu bay tại sân bay: refueling, catering, cleaning, loading. TOSS điều phối và theo dõi. **Khách hàng dùng "phục vụ mặt đất" / "dịch vụ mặt đất"** (YCKT TOSS-079, TOSS-147). *(v0.4: thay bản dịch cũ "Khai thác Mặt đất".)* |
| **GTC** (Ground Time Check) | Kiểm tra Thời gian Mặt đất | Thời gian tàu bay đỗ tại sân bay giữa hai chuyến. TOSS cảnh báo khi GTC ngắn hơn tối thiểu quy định. |
| **GM** | (giữ nguyên — chức danh nội bộ VNA) | Chức danh quản lý trong chuỗi báo cáo của điều phái: "Advise the DM, GM and DGM OCD of any event that will or may impact on the flight operations" (nguồn: FDOP §3.2). *(Cần xác nhận với VNA — khả năng General Manager / Trưởng phòng.)* |
| **GPU** (Ground Power Unit) | Xe điện / Xe cấp điện mặt đất | Thiết bị mặt đất cấp điện cho tàu bay khi đỗ, thay thế khi APU không phát điện được (APU GEN INOP). Trong BCAO còn gọi là "xe điện" (cột "sân bay không có/hỏng xe điện"). Liệt kê trong bảng APU/PACK và danh mục sân bay không hỗ trợ tàu hỏng APU (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |

---

## H

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **Holding Fuel** | Nhiên liệu chờ | Nhiên liệu dự phòng cho giai đoạn bay chờ (holding) trước khi hạ cánh. Điều phái kiểm tra holding fuel cập nhật trong FON (nguồn: FDOP §3.1). |
| **HĐQS** | Hoạt động quân sự (?) | Viết tắt tiếng Việt xuất hiện nguyên văn trong tài liệu EN của khách hàng: "Use WX and NOTAM/**HĐQS** results as a basis for selecting alternate airports" — ngữ cảnh đi cùng "military activities/operations" (nguồn: FDOP §3.2). *(Cần xác nhận với VNA: HĐQS = Hoạt động quân sự?)* |
| **History Timeline** | Dòng thời gian lịch sử thay đổi | Format hiển thị lịch sử thay đổi của chuyến (đổi giờ, đổi tàu, delay…) dạng timeline dọc kèm mốc giờ (UTC); dùng trong Flight Detail và Leg History (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng). |

---

## I

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **IATA** (International Air Transport Association) | Hiệp hội Vận tải Hàng không Quốc tế | Tổ chức quốc tế đặt ra tiêu chuẩn khai thác hàng không. TOSS tuân thủ các tiêu chuẩn IATA OCC. |
| **ICAO** (International Civil Aviation Organization) | Tổ chức Hàng không Dân dụng Quốc tế | Cơ quan LHQ chịu trách nhiệm các tiêu chuẩn hàng không toàn cầu. TOSS tuân thủ ICAO Annex 6 (khai thác), Annex 2 (bay), v.v. |
| **ICAO 24-bit Address** (mã 24-bit) | Mã định danh tàu bay 24-bit | Mã định danh duy nhất cấp cho từng tàu bay (dùng cho Mode S/ADS-B). Thu thập khi nhận tàu mới để khai báo kế hoạch bay (nguồn: FDOP §3.5 — "24-bit"). |
| **IS / IN** (trạng thái FPL trong ATC database) | (giữ nguyên — mã trạng thái) | Trạng thái bản ghi kế hoạch bay trong cơ sở dữ liệu ATC: trước khi file ATC FPL chuyến VIP, điều phái xác nhận FOE "has changed status from IS to IN and has inserted STS/HEAD" (nguồn: FDOP §3.3). *(Cần xác nhận nghĩa IS/IN với VNA.)* |

---

## L

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **Lotang / lô tam / nô tam** ⟶ **NOTAM** | (Lỗi ASR — KHÔNG phải loại chuyến) | **Đính chính ASR (BA Lead xác nhận 12/06):** các cụm "Lotang", "lô tam", "nô tam" trong transcript đều là **lỗi nhận dạng giọng nói của [NOTAM](#n)** — KHÔNG tồn tại "chuyến Lotang". Nội dung điều phái nêu thực chất là "cảnh báo **NOTAM mới phát sinh** + đánh giá ảnh hưởng" (transcript 11/06 dòng 670: "lên trang cơ quan quản lý bay, lấy NOTAM họ phát hành"). Mọi tham chiếu "Lotang" trước đây đã gộp về cảnh báo NOTAM (BR-118). |
| **LC** (Line Check) | Kiểm tra định kỳ đường bay | Hình thức kiểm tra khai thác định kỳ của phi công trên đường bay thực tế. Tàu bay đang được sử dụng cho Line Check ghi nhận trong BCAO là "LC" kèm sân bay (vd "010 LC HAN"). Ảnh hưởng đến số tàu thực sự có sẵn cho khai thác thương mại (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **LF** (Load Factor) | Hệ số sử dụng ghế | Tỷ lệ phần trăm số ghế có khách trên tổng ghế cung ứng, đo theo chiều đi và chiều đến cho mỗi đường bay. Báo cáo trong BCAO theo từng đường trục (vd HAN-SGN-HAN LF trung bình 92%). Là KPI khai thác quan trọng bên cạnh OTP và OSP (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **Loadsheet** (Load & Trim Sheet) | Phiếu Cân bằng Tải | Tài liệu tổng kết khối lượng và cân bằng (mass & balance) của một chuyến bay: DOW, payload, nhiên liệu, các giá trị ZFW / TOW / LW và trọng tâm (CG) / trim. Phải nằm trong giới hạn (MZFW/MTOW/MLW) và được cơ trưởng ký duyệt. Là điểm giao giữa Khai thác Mặt đất (chốt tải) và Khai thác Bay/Dispatch (kiểm tra giới hạn, phát hành). Theo ICAO Annex 6 / EU 965/2012 (Part-CAT). *Lưu ý: FAA gọi tách thành "Load Manifest" + "Weight & Balance Form".* |
| **Leg History** (Netline) | Lịch sử chặng/chuyến | Lịch sử thay đổi của một chặng/chuyến (đổi giờ EPD, delay…) lưu sẵn trong Netline; TOSS hiển thị lại dạng History Timeline (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng). |

---

## M

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **MEL** (Minimum Equipment List) | Danh sách Thiết bị Tối thiểu | Tài liệu quy định thiết bị nào được phép hỏng mà tàu bay vẫn được phép bay, với điều kiện nào. TOSS theo dõi MEL dispatch trong module Bảo dưỡng. |
| **MRO** (Maintenance, Repair & Overhaul) | Bảo dưỡng, Sửa chữa & Đại tu | Đơn vị cung cấp dịch vụ bảo dưỡng tàu bay. TOSS không quản lý MRO trực tiếp nhưng tích hợp kế hoạch với CAMO. |
| **METAR** (Meteorological Aerodrome Report) | Bản tin quan trắc khí tượng sân bay | Bản tin thời tiết quan trắc thực tế tại sân bay, phát hành định kỳ (30–60 phút). Cặp với [TAF](#t) (dự báo) và [SPECI](#s) (bản tin đặc biệt khi thời tiết biến động). Điều phái chuyên trách NOTAM/WX theo dõi METAR/TAF/SIGMET (nguồn: FDOP §3.2.2; FAA `sec-05-acronyms`). **TOSS cần tích hợp và parse METAR + SPECI để cảnh báo tự động các thông số: tầm nhìn, trần mây, TSRA** so với ngưỡng VMA của từng sân bay (nguồn: phỏng vấn Dispatcher 11/06/2026). |
| **MOC** (Maintenance Operations Control) | Trung tâm Kiểm soát Khai thác Bảo dưỡng | Đơn vị kiểm soát khai thác bảo dưỡng — nguồn cung cấp thông tin hỏng hóc MEL/CDL cho điều phái (nguồn: FDOP §3.1, §3.2). |
| **MSN** (Manufacturer Serial Number) | Số seri nhà sản xuất tàu bay | Số seri duy nhất của khung tàu bay do nhà sản xuất cấp. Thu thập khi nhận tàu mới (nguồn: FDOP §3.5). |
| **Monitoring User Profile** | Cấu hình giám sát theo người dùng | Hồ sơ cấu hình cá nhân lưu theo từng điều phái: bộ lọc, cột hiển thị, sắp xếp, trạng thái xem gần nhất trên màn Monitoring (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng; liên quan BR-102). |

---

## N

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **NOTAM** (Notice to Airmen / **Notice to Air Missions** — FAA) | Thông báo cho Phi công | Thông tin về sân bay, không phận, hoặc thiết bị ảnh hưởng đến an toàn bay. Dispatcher trong TOSS phải xem xét NOTAM trước khi phát hành Dispatch Release. *Tên gọi: ICAO/truyền thống là "Notice to Airmen"; FAA đã đổi thành "Notice to Air Missions" (xem `aircraft_dispatcher_pts_10`).* **Phân loại 3 nhóm theo phạm vi ảnh hưởng:** (1) NOTAM sân bay — ảnh hưởng hoạt động tại sân bay cụ thể; (2) NOTAM vùng trời (FIR/airspace) — ảnh hưởng quyền bay qua không phận; (3) NOTAM đường bay (route/AWY) — ảnh hưởng tuyến đường bay. Cách phân loại chi tiết và đánh giá mức độ ảnh hưởng tới từng chuyến cần workshop riêng với SME điều phái. NOTAM cứu hỏa (RFFS): khi cấp RFFS sân bay thay đổi → NOTAM phát ra → TOSS cảnh báo; không cần lưu tiêu chuẩn RFFS riêng (nguồn: phỏng vấn Dispatcher 11/06/2026). **Lỗi ASR cần map:** "Lotang", "lô tam", "nô tam" trong transcript = NOTAM (BA Lead xác nhận 12/06) — KHÔNG có "chuyến Lotang"; "cảnh báo NOTAM mới phát sinh + đánh giá ảnh hưởng" gộp tại cảnh báo NOTAM (BR-118). |
| **NOTOC** (Notification To Captain) | Thông báo cho Cơ trưởng | Văn bản thông báo cho cơ trưởng về **hàng nguy hiểm (Dangerous Goods)** xếp trên tàu bay. Cơ trưởng phải tiếp nhận và **xác nhận đã nhận** (ký trên một bản sao NOTOC); một bản sao phải lưu giữ tại mặt đất, truy cập được suốt thời gian chuyến bay. Cơ sở: ICAO Annex 18 + FOCA GM-INFO Dangerous Goods (xem `dangerous-goods-notoc/`). TOSS sinh/đính kèm NOTOC trong bộ tài liệu chuyến bay khi có DG. |

---

## O

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **OCC** (Operational Control Center) | Trung tâm Kiểm soát Khai thác | Trung tâm điều hành toàn bộ hoạt động khai thác bay. Là đơn vị sử dụng chính hệ thống TOSS. |
| **Off-block** | Thời điểm rời bãi đỗ | Thời điểm tàu bay bắt đầu di chuyển (tháo chèn). TOSS ghi nhận cho tính Block Time và On-time Performance. |
| **On-block** | Thời điểm đến bãi đỗ | Thời điểm tàu bay hoàn thành taxiing và gắn chèn. |
| **On-time Performance (OTP)** | Tỷ lệ Đúng giờ | KPI đo tỷ lệ chuyến bay khởi hành / đến nơi đúng giờ. Dashboard TOSS hiển thị OTP real-time. |
| **OSP** (Operational Schedule Performance) | Hiệu quả thực hiện lịch khai thác | Chỉ số đo mức độ khai thác bám sát lịch bay đã hoạch định. Liên quan/bổ trợ [OTP](#o). *(Nguồn: BA Lead cung cấp — chưa có trong tài liệu domain-knowledge.)* |
| **OCD** | (giữ nguyên — tên đơn vị nội bộ VNA) | Đơn vị quản lý điều phái; trong FDOP gắn với cả "Flight schedule and assignment team (OCD)" và "Flight permit team (OCD)" (nguồn: FDOP §3.3, §3.5). **OCD ≠ OCC.** *(Cần xác nhận với VNA: tên đầy đủ và cơ cấu các team trực thuộc.)* |
| **OFP** (Operational Flight Plan) | Kế hoạch bay (OFP) | Kế hoạch bay khai thác do điều phái lập/phát hành — tài liệu trung tâm của dispatch. Khách hàng dùng "OFP" nguyên dạng (YCKT TOSS-174/223/224/252; mục 27.0 "Quản lý tài liệu OFP, NOTAM, WX, briefing package"). Upload trước ETD: sớm nhất 240 phút, muộn nhất 70 phút (nguồn: FDOP §3.1). **Thời điểm phát hành (phỏng vấn 11/06):** nội địa chốt trước 60 phút STD; quốc tế chốt trước 90 phút STD (mốc cơ bản); một số mốc bổ sung cho chuyến quốc tế dài: 130/180/200 phút [cần xác nhận phân loại chuyến tương ứng]. Dưới ngưỡng chốt không tự làm lại OFP — chỉ làm lại khi tổ bay yêu cầu qua điện thoại. |
| **OFP Number / OFP Version** | Số hiệu OFP / Phiên bản OFP | Phân biệt hai khái niệm (phỏng vấn 11/06 chiều §II.4): **OFP Number** do Lido sinh cho mỗi lần tạo OFP; **OFP Version** do TOSS gán (R1, R2…) đánh dấu các lần [Dispatch Release](#d)/[Unrelease](#u) — phục vụ nhận biết bản chốt và truy vết. |

---

## P

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **PACK** (Air Conditioning Pack) | Hệ thống điều hòa tàu bay | Bộ điều hòa không khí của tàu bay, sử dụng khí bleed từ APU (khi dưới đất) hoặc động cơ chính (khi bay). Khi PACK hỏng hoàn toàn (**PACK INOP**) hoặc yếu (**PACK YẾU**), tàu cần hỗ trợ từ ACU mặt đất. Trạng thái PACK được theo dõi riêng trong bảng APU/PACK của BCAO (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **PM** (Passenger Manifest) | Bản kê Hành khách | Danh sách hành khách trên chuyến bay (họ tên, số ghế, điểm đi/đến). Tài liệu bắt buộc mang theo chuyến bay (ICAO Annex 9), thường đi kèm [CM — Cargo Manifest](#c). Số khách trên PM là đầu vào để tính payload trong [Loadsheet](#l). *Lưu ý: "PM" là viết tắt phụ thuộc ngữ cảnh — tại đây hiểu theo bộ tài liệu chuyến bay.* |
| **Payload (PLD)** | (giữ nguyên "payload") | Tổng tải thương mại trên chuyến bay. Khách hàng dùng nguyên dạng và định nghĩa: **payload = trọng lượng khách + hành lý + hàng + mail + ULD** (YCKT TOSS-251; TOSS-200/225). Trong vnaocc-proposal có chỗ dùng "tải trọng hữu ích". |
| **Payload Extra** | Tải/dầu lấy thêm | Phần tải/nhiên liệu tổ bay đề nghị lấy thêm so với OFP; được TOSS ghi nhận và đưa vào báo cáo (nguồn: phỏng vấn Dispatcher 11/06/2026 buổi chiều §II.10). *(Tên "Pallet Relief": xem OID.)* |
| **Post-Release Transition** (Phase 3) | Giai đoạn chuyển tiếp sau Dispatch Release | Giai đoạn từ sau khi [Dispatch Release](#d) đến khi cất cánh; TOSS tiếp tục quét và phát cảnh báo nếu phát sinh thay đổi — một trong các giai đoạn của quy trình điều phái (nguồn: phỏng vấn Dispatcher 11/06/2026 buổi chiều §II.3). |
| **Phase 4 / Phase 5 Monitoring** | Giám sát trước khởi hành / trong khi bay | Hai giai đoạn giám sát của điều phái nối tiếp [Post-Release Transition](#p): **Phase 4 — Pre-Departure Monitoring** (theo dõi từ sau release đến khi cất cánh) và **Phase 5 — In-Flight Monitoring** (theo dõi khi đang bay — chỉ cập nhật trạng thái mốc bay, KHÔNG monitor tiêu hao dầu real-time; phân tích dầu/đường bay thuộc báo cáo Post-Flight). Là khung của màn hình Monitoring overview (BR-125) (nguồn: phỏng vấn Dispatcher 11/06/2026 buổi chiều §II.6). |
| **POD** | (giữ nguyên — viết tắt nội bộ VNA) | Nguồn bản tin/đánh giá tại các thời điểm cập nhật hằng ngày mà điều phái NOTAM/WX tham khảo (nguồn: FDOP §3.2.2). *(Cần xác nhận tên đầy đủ với VNA — chưa có nguồn.)* |
| **PER Group** (Aircraft Performance Group) | Nhóm tính năng tàu bay (FOE) | Nhóm thuộc FOE phụ trách tính năng tàu bay; nhận tài liệu Weigh and Balance / Chapter 2 từ Tech Dept khi nhận tàu mới (nguồn: FDOP §3.5 — "Aircarft performance Group (FOE)", "send to PER Group"). *(Cần xác nhận tên chính thức với VNA.)* |

---

## Q

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **QRH** (Quick Reference Handbook) | (giữ nguyên QRH) | Sổ tay tham chiếu nhanh quy trình khai thác/khẩn nguy của tổ lái. Nằm trong bộ tài liệu chuẩn bị cho delivery flight (nguồn: FDOP §3.5). |

---

## R

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **RDB TIME** | (giữ nguyên — mã/lỗi hệ thống nội bộ) | Loại lỗi liên quan dữ liệu đường bay xuất hiện trong nghiệp vụ chuẩn bị chuyến bay VIP (nguồn: FDOP §3.3). *(Cần xác nhận nghĩa với VNA — khả năng "Route Data Base time".)* |
| **RFFS** (Rescue and Fire Fighting Services) | Dịch vụ Cứu nạn và Cứu hỏa sân bay | Cấp độ cứu nạn–cứu hỏa của sân bay (CAT theo ICAO Annex 14); điều phái kiểm tra RFFS của sân bay đi/đến/dự bị trước khi lập kế hoạch bay (nguồn: FDOP §3.1 — "refer to FDM table 4.2"; ICAO Annex 6; 14 CFR Part 121). **Cơ chế cảnh báo TOSS (phỏng vấn 11/06):** khi cấp RFFS sân bay thay đổi → NOTAM được phát ra → TOSS nhận NOTAM và cảnh báo điều phái; TOSS không cần lưu trữ bảng tiêu chuẩn RFFS riêng. |
| **Registration (REG)** | Mã đăng ký tàu bay | Mã nhận dạng quốc tế duy nhất của tàu bay (tail number), ví dụ VNA893, A321-A396. Là khóa chính để liên kết mọi sự kiện khai thác (chuyến bay, bảo dưỡng, sự cố kỹ thuật) với từng tàu cụ thể. Một tàu có thể vào/ra đội bay nhiều lần → TOSS cần quản lý lịch sử REG theo từng giai đoạn (nguồn: họp 09/06). |
| **Reserve Crew** | Tổ bay Dự phòng | Phi hành đoàn sẵn sàng thay thế khi có sự cố. TOSS quản lý danh sách dự phòng và cảnh báo khi cần kích hoạt. |
| **Roster** | Lịch Bay | Lịch phân công nhiệm vụ của phi hành đoàn theo tháng/tuần. Được tạo trong module Quản lý Tổ bay TOSS. |

---

## S

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **SMS** (Safety Management System) | Hệ thống Quản lý An toàn | Hệ thống quản lý rủi ro và sự cố an toàn. TOSS có module An toàn & Tuân thủ hỗ trợ báo cáo SMS. |
| **SSIM** (Standard Schedules Information Manual) | Định dạng/điện lịch bay chuẩn IATA | Chuẩn IATA mô tả lịch bay (mùa, dưới mùa). TOSS nhận lịch bay từ Flight Scheduling System qua SSIM/ASM/SSM, kết nối SFTP (YCKT TOSS-067/098). |
| **SSM** (Schedule Movement Message) | Điện thay đổi lịch bay | Điện văn IATA thông báo thay đổi lịch bay (cùng nhóm ASM). Nguồn lịch bay cho TOSS (YCKT TOSS-067). |
| **SITA** | Mạng/điện văn hàng không SITA | Nhà cung cấp mạng viễn thông hàng không; TOSS gửi/nhận **SITA TEXT** (các điện văn dạng văn bản) và gửi điện sang SITA (YCKT TOSS-096; họp 08/06). |
| **Stand** | Vị trí đỗ tàu bay | Vị trí cụ thể trên sân đỗ (apron). TOSS phân công stand trong module Mặt đất. |
| **Sector** | Chặng bay | Một chặng bay từ sân bay A đến sân bay B. Thông tin sector là đầu vào lập kế hoạch bay (nguồn: FDOP §3.5). |
| **SID / STAR** | Phương thức khởi hành / đến tiêu chuẩn | SID (Standard Instrument Departure) — phương thức khởi hành tiêu chuẩn; STAR (Standard Terminal Arrival Route) — phương thức đến tiêu chuẩn. Điều phái kiểm tra NOTAM ảnh hưởng SID/STAR (nguồn: FDOP §3.2; FAA `sec-05-acronyms`). |
| **SPECI** (Special Aerodrome Meteorological Report) | Bản tin khí tượng sân bay đặc biệt | Bản tin khí tượng phát hành ngoài chu kỳ khi thời tiết tại sân bay biến động đột ngột vượt ngưỡng (tầm nhìn thay đổi lớn, trần mây hạ thấp, TSRA xuất hiện, thay đổi hướng/tốc độ gió đáng kể…). Cặp với [METAR](#m) (bản tin định kỳ). **TOSS tích hợp SPECI cùng METAR để cảnh báo tự động** khi thông số thời tiết vượt ngưỡng VMA của sân bay (nguồn: phỏng vấn Dispatcher 11/06/2026; FAA `sec-05-acronyms`). |
| **Slot** | (giữ nguyên "slot") | Khung giờ được cấp cho chuyến bay (cất/hạ cánh hoặc qua không phận). "Cấp slot" = slot allocation. Khách hàng giữ nguyên "slot" (YCKT; FDOP §3.4 — slot BOBCAT). |
| **Station Manager** | Trưởng đại diện sân bay | Người đại diện hãng tại sân bay (vd VIAGS station manager), đầu mối phối hợp phục vụ mặt đất khi có thay đổi sau Dispatch Release (nguồn: FDOP §3.1.3). |
| **STS/HEAD** | (giữ nguyên — chỉ thị ICAO FPL) | Chỉ thị trạng thái đặc biệt trong mục 18 của ATC FPL (ICAO Doc 4444) đánh dấu chuyến bay nguyên thủ (Head of State) — dùng cho chuyến bay VIP (nguồn: FDOP §3.3). **Phỏng vấn 11/06 chiều: STS/HEAD bắt buộc cho mọi chuyến không thường lệ và là căn cứ claim miễn trừ phí khí thải** [cơ chế CORSIA/EU ETS — xem OID SME-20]. |
| **SUP** (Supervisor) | Giám sát viên | Vị trí giám sát trong ca trực điều phái; phụ trách chuyến phức tạp, đường dài ≥ 8 giờ, chuyến không có DSP đi kèm (nguồn: FDOP §3.2, §3.3). *(Chức danh nội bộ VNA — cần xác nhận.)* |
| **SQD** | (giữ nguyên — tên đơn vị nội bộ VNA) | Đơn vị cung cấp thông tin mã 24-bit và tiếp nhận/kiểm tra các giấy chứng nhận từ CAAV khi nhận tàu bay mới (nguồn: FDOP §3.5 — "Contacting member from SQD to get information about 24-bit"; "Coordinating with SQD to receive and check all certificates from CAAV"). *(Cần xác nhận tên đầy đủ với VNA.)* |
| **Standard Taxi Time** | Thời gian lăn tiêu chuẩn | Thời gian lăn (taxi) tiêu chuẩn theo sân bay/đường lăn, dùng trong kế hoạch bay và báo cáo thời gian thực hiện chuyến. Điều phái muốn TOSS quản lý giá trị master và (nếu được) để Lido push tự động (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.7). *(Đơn vị quản lý MOI / cơ chế push Lido: xem OID SME-15, KS-16.)* |

---

## T

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **TAF** (Terminal Aerodrome Forecast) | Bản tin dự báo khí tượng sân bay | Bản tin khí tượng dự báo điều kiện thời tiết tại một sân bay theo từng khung giờ, phát hành định kỳ (thường mỗi 6 giờ). Sử dụng mã ICAO 4 chữ cho sân bay (vd VVNB = Nội Bài). Trực ban trưởng xem TAF trong BCAO để lưu ý các sân bay có thời tiết xấu (TSRA — bão kèm mưa; gió mạnh; tầm nhìn thấp…). TOSS tích hợp TAF trong phần kế hoạch ngày của BCAO (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **Turnaround** | Quay vòng tàu bay | Toàn bộ hoạt động phục vụ tàu bay giữa hai chuyến (deplaning → boarding). TOSS theo dõi và điều phối Turnaround trong module Mặt đất. |
| **Turnaround Time (TAT)** | Thời gian Quay vòng | Thời gian tối thiểu cần thiết để chuẩn bị tàu bay cho chuyến bay tiếp theo. Mỗi loại tàu bay có TAT khác nhau, được cấu hình trong Master Data. |
| **Techstop** (Technical Stop) | Sân bay/chặng dừng kỹ thuật | Điểm dừng giữa hành trình để nạp nhiên liệu/phục vụ kỹ thuật, không lên/xuống khách thương mại (vd techstop cho delivery flight đường dài) (nguồn: FDOP §3.5). |
| **ToT** (Transfer of Title) | Chuyển giao quyền sở hữu | Thời điểm chuyển giao quyền sở hữu/quyền sử dụng tàu bay từ bên giao (nhà sản xuất/bên cho thuê) sang hãng trong giao nhận tàu bay; mốc thời gian quan trọng của delivery flight (nguồn: FDOP §3.5). *(Với tàu thuê: chỉ chuyển quyền khai thác — cần lưu ý ngữ cảnh.)* |
| **TSRA** (Thunderstorm with Rain) | Dông kèm mưa | Mã thời tiết hiện tại trong METAR/SPECI: thunderstorm kết hợp với mưa (`TS` = thunderstorm, `RA` = rain). Một trong các điều kiện thời tiết bất lợi mà điều phái theo dõi — khi METAR/SPECI có `TSRA` → TOSS cảnh báo so sánh với ngưỡng VMA của sân bay (nguồn: phỏng vấn Dispatcher 11/06/2026). |
| **Time Window** (Monitoring) | Cửa sổ thời gian giám sát | Khoảng thời gian look-back + look-ahead quanh giờ hiện tại để lọc chuyến hiển thị trên màn Monitoring (vd look-ahead tới ~240 phút cho chuyến quốc tế) (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng). |

---

## U

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **UCM** (Unit Load Device Control Message) | Điện kiểm soát ULD | Điện văn IATA về kiểm soát thiết bị chất tải đơn vị (ULD — pallet/container). TOSS tích hợp UCM (YCKT TOSS-097). |
| **Uncontrolled Airspace** | Vùng trời không kiểm soát | Vùng trời không được cung cấp dịch vụ kiểm soát không lưu (vd KABUL FIR) — chuyến bay qua đây áp dụng quy trình riêng: slot BOBCAT, đánh giá hoạt động bay, giám sát tăng cường tại các điểm dẫn đường trọng yếu (nguồn: FDOP §3.4). |
| **ULD** (Unit Load Device) | Thiết bị chất tải đơn vị | Pallet/container chất hàng/hành lý lên tàu bay; là đầu vào cho tính tải trọng & [Loadsheet](#l). |
| **Unrelease** (TOSS) | Hủy Dispatch Release | Thao tác điều phái hủy [Dispatch Release](#d) đã thực hiện: quay về phiên bản OFP trước và sinh một revision mới mang dữ liệu cũ; khi Unrelease, [Confirm Release](#c) của phi công bị reset (nguồn: phỏng vấn Dispatcher 11/06/2026 buổi chiều §II.4). |

---

## V

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **VAECO** | (giữ nguyên — tên đơn vị nội bộ VNA) | Đơn vị kỹ thuật phối hợp kiểm tra EFB (LIDO eRM, OPT/Flysmart, Nav) cùng đối tác khi nhận tàu bay mới (nguồn: FDOP §3.5). *(Cần xác nhận tên đầy đủ với VNA — khả năng Vietnam Airlines Engineering Company.)* |
| **VIAGS** | (giữ nguyên — tên đơn vị nội bộ VNA) | Đơn vị phục vụ mặt đất: nhận thông báo khi reissue OFP (cùng Station Manager), bố trí nhân sự nhận bàn giao tài liệu và hỗ trợ lập loadsheet theo mẫu VNA (nguồn: FDOP §3.1.3, §3.5; YCKT TOSS-078 "VMS/VIAGS"). *(Cần xác nhận tên đầy đủ với VNA — khả năng Vietnam Airlines Ground Services.)* |
| **VMA** | Ngưỡng thời tiết tối thiểu khai thác *(tên viết tắt nội bộ VNA)* | Tập hợp ngưỡng điều kiện khí tượng tối thiểu (tầm nhìn, trần mây, và loại hiện tượng thời tiết) mà dưới ngưỡng đó sân bay không đủ điều kiện khai thác — dùng làm mức ngưỡng so sánh khi TOSS cảnh báo METAR/SPECI. Điều phái đề cập VMA trong ngữ cảnh: khi tầm nhìn/trần mây trong METAR thay đổi xuống dưới VMA, hoặc khi có hiện tượng TSRA → hệ thống cảnh báo (nguồn: phỏng vấn Dispatcher 11/06/2026). **[Cần xác nhận với VNA: tên đầy đủ chính thức, cấu trúc bảng VMA, và phân loại sân bay.]** |

---

## W

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **Wet Lease** (ACMI) | Thuê ướt | Thuê **toàn bộ của hãng khác** (tàu bay + tổ bay + bảo dưỡng + bảo hiểm — ACMI: Aircraft, Crew, Maintenance, Insurance), **hãng mình chỉ đưa khách/hàng của mình lên khai thác**. Chuyến bay khai thác dưới AOC của **bên cho thuê**. Đối lập với [Dry Lease](#d). Liên quan tài liệu ORO.AOC.110 (Operational leasing). |
| **Wet Lease kết hợp** (Damp Lease) | Thuê ướt kết hợp | Biến thể của Wet Lease: **bên cho thuê cung cấp toàn bộ TRỪ nhiên liệu** (tàu bay + tổ bay + bảo dưỡng + bảo hiểm). **Nhiên liệu do bên đi thuê — hãng dự án — TỰ cung cấp.** |
| **Watchlist** | Danh sách giám sát | Danh sách chuyến bay được điều phái đánh dấu cần theo dõi đặc biệt (watchlist designation) khi hoàn tất OFP — vd có threat/rủi ro đã ghi nhận (nguồn: FDOP §3.1). |
| **Waypoint** | Điểm dẫn đường | Điểm tọa độ xác định trên đường bay (vd ULVAL, ZAMIR). "Critical waypoints" = các điểm dẫn đường trọng yếu cần báo cáo/giám sát khi bay qua vùng trời không kiểm soát (nguồn: FDOP §3.4). |
| **Weigh Manifest** | Bản kê cân tải | Bản kê khối lượng do đối tác giao tàu (Boeing/Airbus) cung cấp khi nhận tàu bay (draft → final), đầu vào để CLC lập [Loadsheet](#l) (nguồn: FDOP §3.5). **Phân biệt với Loadsheet** (Phiếu Cân bằng Tải). |

---

## Z

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **ZFW** (Zero Fuel Weight) | Trọng lượng không nhiên liệu | Trọng lượng tàu bay gồm DOW + payload, chưa tính nhiên liệu. TOSS đối soát ZFW từ OFP với ZFW thực tế tính toán, cảnh báo Delta khi lệch (nguồn: Đề xuất §II.2; phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.1). |

---

## Ghi chú Bổ sung

> - Thuật ngữ này là **tài liệu sống** — bổ sung liên tục trong quá trình phân tích.
> - Khi gặp thuật ngữ mới chưa có entry → gửi vào BA Weekly Sync để thống nhất định nghĩa trước khi thêm.
> - Đồng bộ với `.claude/glossary/ba-terms-vi-en.md` cho các thuật ngữ BA chung.
> - **Nguyên tắc ưu tiên (v0.4):** từ ngữ khách hàng dùng trong YCKT/tài liệu VNA ưu tiên hơn bản dịch tự đặt; thuật ngữ kỹ thuật khách hàng giữ tiếng Anh thì glossary giữ theo (Dispatch Release, OFP, payload, DOW, Ferry, charter, slot, briefing…).
> - **Nguồn "FDOP"** = `[MAIN] FLIGHT DISPATCHER OPERATING PROCEDURE.docx` (Customer_docs) — bản phân rã tại `ba/workspace/drafts/phan-tich/flight-dispatcher-procedure/`.
> - **Chờ VNA xác nhận (v0.4):** DM, DGM, GM, SUP, DSP, POD, RDB TIME, FOE, OCD, BOBCAT, FDM, FON, AQD, HĐQS, IS/IN, SQD, PER Group, VAECO, VIAGS (tên đầy đủ/nghĩa); Fuel Exposure (bản dịch đề xuất); câu "90m shift" và câu "or until any issues remain unclear or thoroughly resolved" trong FDOP §3.1 (nguồn EN mơ hồ). *(CLC đã xác nhận = Control Load Center, nguồn FDOP §3.2.)*

---

*v0.10 (2026-06-12): ĐÍNH CHÍNH ASR — "Lotang"/"lô tam"/"nô tam" = **NOTAM** (BA Lead xác nhận; transcript 11/06 dòng 670). Bỏ khái niệm "chuyến Lotang" (lỗi ASR); chuyển entry Lotang thành đính chính trỏ NOTAM + thêm ghi chú map vào entry NOTAM. Lan tỏa sửa: OID SME-02 (chốt), BRD BR-116, FUNC PH1, báo cáo 11/06 + 12/06.*
*v0.9 (2026-06-12): Bổ sung 8 entry từ khảo sát Dispatcher 12/06/2026 buổi sáng (thiết kế màn Monitoring) sau khi BA Lead confirm: Carrier, Color Scheme cảnh báo, Flight Detail, FN Surface (D/Z), History Timeline, Leg History, Monitoring User Profile, Time Window. "Z" của FN Surface còn chờ xác nhận (OID SME-34). Quyết định: BA Lead 2026-06-12.*
*v0.8 (2026-06-12): Bổ sung 4 entry nhóm mốc thời gian phục vụ màn hình Monitoring (rà soát FUNC màn giám sát với domain-knowledge): ACARS OOOI (OUT/OFF/ON/IN), A-CDM Milestone Times (SOBT/EOBT/TOBT/AOBT/TSAT/CTOT/TTOT/ATOT/ELDT/ALDT/EIBT/AIBT…), ETA, Phase 4/Phase 5 Monitoring. Nguồn: YCKT FOS sheet-09 (tài liệu khách hàng). Quyết định: BA Lead 2026-06-12.*
*v0.7 (2026-06-12): Bổ sung 5 entry + mở rộng 3 entry từ phỏng vấn Dispatcher 11/06/2026 (buổi chiều) sau khi BA Lead confirm — thêm: Unrelease, OFP Number/OFP Version, Confirm Release/Reload OSP, Post-Release Transition, Payload Extra; mở rộng: Dispatch Release (cặp Unrelease), STS/HEAD (chuyến không thường lệ + miễn phí khí thải), A-CDM (monitoring overview). Các tên hệ thống/viết tắt chờ xác nhận (Mission Watch, AIJS, FME, ICON, Logitech/GDTN, Sketch Check, Brady/ADC, CCD, Flight Type Code) chưa thêm — theo dõi OID SME-19…28. Quyết định: BA Lead 2026-06-12.*
*v0.6 (2026-06-12): Bổ sung 7 entry từ phỏng vấn Dispatcher 11/06/2026 (buổi sáng, Phần 2) sau khi BA Lead confirm: AMOS, AHM (bảng dầu), APU Time, Cost Index (CI), Captain Certification per Aerodrome, Standard Taxi Time, ZFW (thêm mục Z). Các thuật ngữ còn chờ xác nhận (CLC tên đầy đủ, NAIL, SkyCheck, QAR/QAI, TIC, PAX time) chưa thêm — theo dõi tại OID-TOSS-001 (SME-12…18). Quyết định: BA Lead 2026-06-12.*
*v0.5 (2026-06-11): Bổ sung 9 entry và cập nhật 5 entry từ phỏng vấn Dispatcher 11/06/2026 (buổi sáng, part 1): thêm Captain's Release, Chuyến Lotang, SPECI, TSRA, VMA; cập nhật Dispatch Release (luồng Lido→MO Plus→TOSS), Ferry Flight (cảnh báo phát sinh), METAR (tích hợp SPECI+cảnh báo VMA), NOTAM (phân loại 3 nhóm+RFFS qua NOTAM), OFP (mốc chốt nội địa 60'/quốc tế 90'), RFFS (cơ chế cảnh báo qua NOTAM). Quyết định: BA Lead 2026-06-11.*
*v0.4 (2026-06-10): Bổ sung ~38 entry từ FDOP §3.1–3.5 sau khi rà bản dịch; cập nhật 4 entry theo từ ngữ khách hàng YCKT (Dispatcher → "Điều phái"; Dispatch Release → giữ tiếng Anh; Ground Handling → "Phục vụ mặt đất"; Briefing → giữ "briefing/Briefing Sheet" trong ngữ cảnh tài liệu chuyến bay). Quyết định: BA Lead 2026-06-10.*
