---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.17"
date: "2026-06-17"
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
| **AOS** | *(cần xác nhận tên đầy đủ)* | Tài khoản bot/tự động hóa dùng để upload OFP vào hệ thống thay người dùng thông thường. Cần đặt tên theo vai trò (ví dụ theo shift/ca trực) để phân biệt attribution khi xem lịch sử phiên bản OFP. *(Nghĩa đầy đủ chưa xác nhận — xem OID KS-40.)* (nguồn: phỏng vấn Dispatcher 15/06/2026 P3 d.~11–13). |
| **APU** (Auxiliary Power Unit) | Động cơ phụ trợ | Thiết bị động lực phụ trên tàu bay, cung cấp điện và khí nén khi động cơ chính tắt (khởi động động cơ, điều hòa khi đỗ). Nhiên liệu APU được tính khi lập kế hoạch nhiên liệu. Trong BCAO, trạng thái APU được phân loại: **APU GEN INOP** (hỏng phát điện → cần GPU), **APU BLEED INOP** (hỏng cấp khí → cần ASU, ACU), **APU SMELL** (có mùi → cần ACU), **APU INOP** (hỏng hoàn toàn → cần ASU, ACU, GPU), **MONITOR APU** (theo dõi). Bảng APU/PACK trong BCAO theo dõi tất cả tàu trong các tình trạng này mỗi ngày. Nguồn xác nhận: ICAO Annex 6 Part I + FAA 14 CFR Part 121; mẫu BCAO (họp 09/06). |
| **ACDM / A-CDM** (Airport Collaborative Decision Making) | Ra quyết định phối hợp tại sân bay | Cơ chế chia sẻ dữ liệu thời gian thực giữa các bên tại sân bay (milestone times, vị trí, trạng thái chuyến bay, điều phối mặt đất/không lưu). TOSS tích hợp ACDM (YCKT TOSS-080). **Phỏng vấn 11/06 chiều: A-CDM là nguồn cho màn giám sát tổng quan (monitoring overview) giai đoạn sau cất cánh.** |
| **ACARS Fuel Unit** | Đơn vị nhiên liệu trên điện ACARS | Đơn vị nhiên liệu trong điện ACARS **khác nhau theo loại avionics và thay đổi theo giai đoạn** trên cùng một tàu → TOSS cần **hệ số quy đổi về kg có hiệu lực theo giai đoạn**. Đã xác nhận: **A320/A321 Rockwell Collins = LITERS** (điện [A80](#a) ghi tường minh `/UNT LITERS`); B787/A350 MVA ghi `SI FOB <value>/` — đơn vị chưa xác nhận (gram hoặc kg, xem OID SME-45). (nguồn: họp 09/06; tong-hop-dien-acars.extracted.md hàng 50). |
| **ACARS OOOI** (OUT/OFF/ON/IN) | Bộ mốc chuyển động chuyến bay qua ACARS | Bốn mốc thời gian thực tế truyền qua [ACARS](#a): **OUT** (rời bãi đỗ/off-block), **OFF** (cất cánh), **ON** (hạ cánh), **IN** (vào bãi đỗ/on-block). FOS Report lưu cả thời gian (OUT/OFF/ON/IN TIME) và nhiên liệu tại mốc (OUT/OFF/ON/IN FUEL). TOSS dùng làm nguồn cập nhật real-time cho màn hình [Monitoring](#p) và trigger raise/clear cảnh báo theo mốc. **Cùng một sự kiện OOOI đến từ 3 label ACARS khác nhau tùy avionics:** A320/A321 Rockwell Collins → [A80](#a); B787 Boeing → [M49](#m) (và/hoặc M11/M13/M14); A350 Honeywell → [DEP](#d)/[ARR](#a). TOSS cần normalize về 1 event stream. (nguồn: YCKT FOS sheet-09; phỏng vấn 11/06 chiều §II.6; tong-hop-dien-acars.extracted.md). |
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
| **AMOS** (Aircraft Maintenance Operations Software) | Aircraft Maintenance Operations Software | Phần mềm quản lý bảo dưỡng và kỹ thuật hàng không (MRO) của Swiss AviationSoftware (Thụy Sỹ). VNA đang sử dụng phiên bản 25.12. Tại VNA: nguồn cung cấp MEL/CDL, defect, AOG, lịch bảo dưỡng, techlog cho TOSS; TOSS hiển thị + cảnh báo, KHÔNG thay thế chức năng AMOS. AMOS gắn MEL item lên tàu khi thợ máy phát hiện hỏng hóc; TOSS mapping với Master MEL để cảnh báo Dispatcher. Cần tổ chức buổi khảo sát riêng với team AMOS/VICO để xác định cấu trúc DB (xem OID HC-04, KS-55, KS-56). (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.3; KS 17/06/2026 §5; YCKT TOSS-122…; BA Lead xác nhận 17/06/2026). *(Lưu ý: Customer doc TOSS v0.1 mô tả là "Aircraft Maintenance and Engineering System" — cần đối chiếu với bên kỹ thuật VNA.)* |
| **AHM (bảng dầu)** | Bảng định mức nhiên liệu/dữ liệu khai thác | "Bảng dầu AHM" được điều phái nhắc trong nghiệp vụ nhiên liệu — bảng dữ liệu định mức dầu/khai thác mà điều phái dùng và cấp cho Lido. Liên quan [AHM560](#a) (IATA Airport Handling Manual). Hiện một phần quản lý qua phần mềm nội bộ (IFV). (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.2). *(Phạm vi/định dạng bảng + phần mềm IFV: xem OID SME-16.)* |
| **APU Time** | Thời gian sử dụng APU | Thời gian hoạt động của [APU](#a) trên chuyến bay — thông số điều phái theo dõi (liên quan chi phí APU và cảnh báo) (nguồn: phỏng vấn Dispatcher 11/06/2026 Phần 2 §II.6). |
| **ACARS Phase Trigger** | Quy tắc raise/clear cảnh báo theo mốc ACARS | Quy tắc raise và clear cảnh báo gắn với mốc [ACARS OOOI](#a) riêng cho mỗi loại cảnh báo: cảnh báo loại A tắt khi OFF, cảnh báo loại B tắt khi ON, cảnh báo loại C tắt khi IN (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V). |
| **AIJS** | (giữ nguyên — tên hệ thống nội bộ VNA) | Hệ thống/phần mềm trung gian nội bộ VNA hiện nhận diện file [Weather Multi-Flight](#w) gửi qua email và tự đính vào nhiều chuyến. TOSS sẽ thay thế hoặc phối hợp (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V). |
| **A80** *(Rockwell Collins OOOI Report)* | Điện báo OOOI Rockwell Collins (A320/A321) | Điện ACARS báo sự kiện [ACARS OOOI](#a) cho đội tàu A320/A321 trang bị avionics Rockwell Collins. Bốn sub-type phân biệt qua mã đầu body: `1001 OUTRP` (OUT time + FOB), `1101 OFFRP` (OFF time + FOB + ETA sân đến), `1201 ONRP` (ON time + FOB), `1301 INRP` (IN time + FOB). Đơn vị nhiên liệu = **LITERS** (trường `/UNT LITERS` trong body). TOSS nhận song song qua địa chỉ [MVA](#m) (`QU HDQONVN`) để ưu tiên lấy OOOI time. (nguồn: tong-hop-dien-acars.extracted.md hàng 22–29). |
| **ARR** *(Honeywell ON/IN Report — A350 ACARS label)* | Điện báo ON/IN Honeywell (A350) | Label điện ACARS báo sự kiện hạ cánh/vào bãi đỗ cho đội tàu A350 (avionics Honeywell). Một điện ARR mang ON Time (`/ON <time>`) hoặc IN Time (`/IN <time>`) tùy sub-type trong trường FI; trường FOB (`/FB <giá_trị>`) ghi nhiên liệu tại mốc. **Cặp với [DEP](#d)** (label OUT/OFF của A350). TOSS nhận song song từ địa chỉ [MVA](#m) để ưu tiên. (nguồn: tong-hop-dien-acars.extracted.md hàng 42–45). |
| **ADS-B / ADS-C** *(Automatic Dependent Surveillance — Broadcast / Contract)* | Giám sát phụ thuộc tự động — quảng bá / hợp đồng | *(Tham chiếu tiêu chuẩn — ngữ cảnh tích hợp VNA chờ xác nhận.)* **ADS-B** (Broadcast): tàu bay tự phát vị trí/tốc độ/độ cao tới mọi trạm thu; **ADS-C** (Contract): tàu bay gửi báo cáo vị trí theo hợp đồng với trạm kiểm soát (dùng cho CPDLC đường dài). Tham chiếu: ICAO Doc 9684 + `domain-knowledge/datalink-pbcs/`. *(Phạm vi tích hợp ADS-B/ADS-C vào TOSS: cần xác nhận với VNA.)* |
| **ARINC 618** | Giao thức khung điện ACARS | *(Tiêu chuẩn kỹ thuật — ngữ cảnh tích hợp VNA chờ xác nhận.)* Chuẩn kỹ thuật định nghĩa cấu trúc khung điện văn [ACARS](#a): 2 dòng header (địa chỉ + trạm/time), byte **STX** (0x02) tiền tố label 3 ký tự, trường FI (flight number/tail), DT (dep/dest/time/sub-type), rồi body. Mọi điện trong kho ACARS tháng 03/2026 đều tuân theo ARINC 618. TOSS parser cần strip STX khi so sánh label. *(Phiên bản ARINC 618 đang dùng: cần xác nhận với VNA.)* |

---

## B

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **BCAO** | Báo cáo Điều hành ngày Khai thác | Báo cáo vận hành hàng ngày do trực ban trưởng lập và phát hành sau khi phê duyệt. Là **một văn bản duy nhất** gồm hai phần: (1) **Tình hình ngày hôm trước** — số chuyến (VN/0V/BL), OTP/OSP, LF theo đường trục, số tàu khai thác/dự bị, VIP A/Khác, ferry, bất thường; (2) **Kế hoạch ngày hôm nay** — cùng các mục trên + bảng APU/PACK, danh mục sân bay không hỗ trợ tàu hỏng APU, AOG/defect, TAF, NOTAM, phụ lục kỹ thuật. Thông tin bất thường nhập từ nhiều nguồn (kỹ thuật, dịch vụ, trực ban trưởng) trong ngày, cuối ngày phát hành. TOSS số hóa BCAO theo đúng cấu trúc hiện hành, phân quyền nhập theo tab nguồn, phê duyệt trước khi phát hành (nguồn: họp 09/06; mẫu BCAO_10Jun2025_11Jun2025-v2.docx). |
| **Block Time** | Thời gian Block | Thời gian từ khi tàu bay tháo chèn (off-block) đến khi gắn chèn lại (on-block). Dùng để tính giờ bay và FTL của phi hành đoàn. |
| **BQ** (Bảo quản) | Trạng thái Bảo quản tàu bay | Tình trạng tàu bay đang được bảo quản (cất giữ tạm thời, không khai thác). Xuất hiện trong báo cáo số tàu của BCAO (vd "02 BQ HAN" = 2 tàu đang bảo quản tại HAN). Phân biệt với MNT (đang bảo dưỡng) và tàu đang khai thác (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **Briefing** | Giải trình / Phổ biến thông tin chuyến bay | Cung cấp/giải trình **thông tin tóm tắt có cấu trúc** phục vụ chuẩn bị & thực hiện chuyến bay (khí tượng + NOTAM + tình trạng khai thác). Trong TOSS chủ yếu là **briefing kế hoạch bay/dispatch** do điều phái (Dispatcher) thực hiện cho tổ bay. Phân loại khí tượng (FAA): **Standard / Abbreviated / Outlook**; ngoài ra có **Passenger briefing** (14 CFR §91.519), **Operational control briefing** (§91.1013). Nguồn: `briefing/` (FAA AC 91-92, FAA-H-8083-28 Ch.3). **Trong ngữ cảnh tài liệu chuyến bay giữ nguyên tiếng Anh "briefing / Briefing Sheet / briefing package"** theo cách dùng của khách hàng (YCKT TOSS-226, mục 27.0). |
| **BOBCAT** | (giữ nguyên — tên riêng) | Cơ chế/hệ thống cấp slot cho chuyến bay qua không phận Afghanistan (KABUL FIR). Điều phái đăng ký slot BOBCAT trước khi bay qua vùng trời không kiểm soát (nguồn: FDOP §3.4). *(Cần xác nhận tên đầy đủ với VNA.)* |
| **BackPACK** | (giữ nguyên — tên phần mềm) | Phần mềm WinForm chạy cục bộ do Hãng sản xuất tàu bay cung cấp, dùng để tính performance factor từ điện văn nhận qua thư điện tử. Quy trình hiện hành: nhân sự nhập tay rồi đẩy kết quả lên Lido và FMC (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 2 ~02:21–02:25). |

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
| **Cán bộ tài liệu** | (chức danh nội bộ VNA) | Nhóm người dùng quản lý tài liệu chuyến bay (OFP, OAP, CP), giám sát trạng thái xác nhận và tải xuống (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 1 ~00:08–00:11). |
| **Cargo Capacity** | Dung lượng khoang hàng | Thuộc tính kỹ thuật của tàu bay gồm bụng trên, bụng dưới và mũi — một trong các thuộc tính kỹ thuật cần lưu cho TOSS (nguồn: báo cáo khảo sát 09/06/2026 §V — Part 1 ~01:05). |
| **CFD** *(CAS Fault Data — chờ xác nhận)* | Dữ liệu lỗi CAS | *(Chờ xác nhận với VNA / Ban kỹ thuật.)* Label điện ACARS downlink dữ liệu lỗi từ hệ thống CAS (Crew Alerting System) của tàu bay. Body điện chứa mã lỗi hệ thống hàng không. Thư viện mã lỗi (Airbus/Boeing) và phạm vi tích hợp vào TOSS (liên quan [AMOS](#a)) chưa được cung cấp. *(Nguồn: acars-rcv-analysis.extracted.md §ACARS-03.)* |
| **CPDLC** *(Controller-Pilot Datalink Communication)* | Liên lạc dữ liệu Kiểm soát viên — Phi công | *(Tham chiếu tiêu chuẩn — ngữ cảnh tích hợp VNA chờ xác nhận.)* Hệ thống nhắn tin dữ liệu hai chiều giữa phi công và kiểm soát viên không lưu, thay thế liên lạc thoại VHF trên đường dài. Trong kho ACARS tháng 03/2026, điện label `ATC` mang nội dung CPDLC (định dạng `CC1VN-AXXX...`). Thuộc nhóm datalink PBCS/FANS — xem `domain-knowledge/datalink-pbcs/`. *(Mức độ VNA tích hợp CPDLC vào TOSS: cần xác nhận với VNA.)* |

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
| **DDMS** (Document & Data Management System) | Hệ thống Quản lý Tài liệu & Dữ liệu (Kỹ thuật) | Hệ thống số hóa tài liệu kỹ thuật tàu bay mà VNA đang nghiên cứu; có khả năng import tài liệu từ nhà sản xuất và export dữ liệu MEL theo định dạng số hóa, tiềm năng tích hợp với TOSS về sau để tự động cập nhật Master MEL thay vì nhập thủ công. Hiện chưa triển khai tại VNA — giai đoạn đầu TOSS dùng phương án nhập tay/import file. (nguồn: KS 17/06/2026 §4; xem OID SME-47.) |
| **DSP** | (giữ nguyên — viết tắt nội bộ VNA) | Viết tắt gắn với nghiệp vụ điều phái (DSP briefing, SUP DSP, sheet "DSP" trong YCKT). Khả năng = Dispatch/Dispatcher (nguồn: FDOP §3.2, §3.5; YCKT sheet-05). *(Cần xác nhận với VNA.)* |
| **DOW** (Dry Operating Weight) | Trọng lượng khô | Trọng lượng tàu bay sẵn sàng khai thác chưa gồm nhiên liệu và payload. Khách hàng dùng "trọng lượng khô (DOW)" / "DOW" nguyên dạng (YCKT TOSS-200/252; vnaocc-proposal). Điều phái kiểm tra DOW theo loại tàu trong AHM560 (nguồn: FDOP §3.1, §3.5). |
| **Dry Lease** | Thuê khô | Thuê **chỉ tàu bay** của hãng khác, **đội bay (tổ lái/tiếp viên) là của hãng mình**. Tàu bay khai thác dưới AOC của bên thuê. Đối lập với [Wet Lease](#w). Liên quan tài liệu ORO.AOC.110 (Operational leasing). |
| **Duty Time** | Thời gian Trực | Khoảng thời gian phi hành đoàn thực hiện nhiệm vụ. Bị giới hạn bởi FTL và phải được TOSS theo dõi tự động. |
| **Data Monitoring** | Giám sát dữ liệu | Module giám sát tính đầy đủ và độ chính xác của các nguồn dữ liệu tích hợp ([ACARS](#a), Lido…), kết xuất báo cáo theo ngày/tuần/tháng. Khác với báo cáo nghiệp vụ (nguồn: báo cáo khảo sát 09/06/2026 §V — Part 1 ~00:44–00:47). |
| **DEP** *(Honeywell OUT/OFF Report — A350 ACARS label)* | Điện báo OUT/OFF Honeywell (A350) | Label điện ACARS báo sự kiện rời bãi đỗ/cất cánh cho đội tàu A350 (avionics Honeywell). Một điện DEP có thể mang OUT Time (`/OT <time>`) hoặc OFF Time (`/OF <time>`) tùy sub-type; trường `FB` ghi nhiên liệu block tại lúc OUT. **Cặp với [ARR](#a)** (label ON/IN của A350). TOSS nhận song song từ địa chỉ [MVA](#m) để ưu tiên. **Phân biệt với [Dispatch Release](#d).** (nguồn: tong-hop-dien-acars.extracted.md hàng 38–41). |
| **DFD** *(Digital Flight Data downlink — hai biến thể)* | Điện tải dữ liệu chuyến bay | *(Hai biến thể — cần VNA xác nhận spec decode từng loại.)* Label điện ACARS tải dữ liệu chuyến bay từ tàu xuống mặt đất. **Biến thể 1 — A350 MIAM TypeB:** dữ liệu động cơ/sự cố (engine shutdown, fault records, hiệu năng chuyến). **Biến thể 2 — A321 Q-series (liên quan [QAR](#q)):** dữ liệu QAR tổng hợp theo nhóm tham số (Q4/Q5/Q6/Q7/Q8). Cả hai dùng cùng label `DFD`. TOSS cần parser riêng cho từng biến thể. *(Spec decode và biến thể cho loại tàu khác: acars-rcv-analysis.extracted.md §ACARS-02.)* |

---

## E

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **EFB** (Electronic Flight Bag) | Túi tài liệu điện tử | Thiết bị/hệ thống lưu trữ và hiển thị tài liệu chuyến bay điện tử (kế hoạch bay, thời tiết, NOTAM, AFM, checklist…), thay thế túi tài liệu giấy. Tài liệu tải từ EFB về TOSS lưu tối đa **ba ngày sau khi chuyến bay hạ cánh**, sau đó tự động xóa; tài liệu do TOSS tự sinh vẫn lưu thường (nguồn: họp 09/06). |
| **EDTO** (Extended Diversion Time Operations) | Khai thác kéo dài thời gian chuyển hướng | Khai thác đường bay có đoạn cách sân bay dự bị quá thời gian chuyển hướng tiêu chuẩn (trước đây ETOPS). Điều phái kiểm tra WX cho EDTO ERA và theo dõi thời điểm vào EDTO (nguồn: FDOP §3.1, §3.3; ICAO Annex 6). |
| **ENR ALT / EDTO ERA** (En-route Alternate) | Sân bay dự bị trên đường bay | Sân bay tàu bay có thể hạ cánh khi phải chuyển hướng trong giai đoạn bay đường dài (ICAO Annex 2 định nghĩa "En-route alternate"). Điều phái kiểm tra điều kiện ENR ALT khi chuẩn bị kế hoạch bay (nguồn: FDOP §3.1, §3.3). |
| **eAPIS** (Electronic Advance Passenger Information System) | (giữ nguyên — hệ thống Hoa Kỳ) | Hệ thống khai báo thông tin hành khách/tổ bay điện tử của Hải quan & Biên phòng Hoa Kỳ; phải nộp cho chuyến bay đi/đến Mỹ (vd delivery flight từ Boeing) (nguồn: FDOP §3.5). |
| **ETA** (Estimated Time of Arrival) | Giờ đến dự kiến | Thời điểm dự kiến chuyến bay đến (hạ cánh/vào bãi); trong FOS tương ứng [A-CDM Milestone](#a) ELDT (dự kiến hạ cánh) / EIBT (dự kiến in-block). Hiển thị trên màn [Monitoring overview](#p) của điều phái; đối ứng với ETD (giờ khởi hành dự kiến) (nguồn: YCKT FOS sheet-09; phỏng vấn 11/06 chiều §II.6). |
| **Echo Report** | (giữ nguyên — tên báo cáo) | Báo cáo gắn với hệ thống FMS thay thế (Ops++), thuộc nhóm báo cáo lịch bay được ưu tiên xử lý (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 1 ~00:17:55). |
| **EvoDM (Evo Report)** | (giữ nguyên — tên công cụ) | Công cụ tự xây của Hãng để rút dữ liệu lịch bay từ NetLine do NetLine không tương thích với hệ thống báo cáo gốc (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 1 ~00:17–00:19). |
| **ENG** *(Engine Data ACARS — chờ xác nhận)* | Dữ liệu động cơ ACARS | *(Chờ xác nhận với VNA / Ban kỹ thuật.)* Label điện ACARS downlink dữ liệu theo dõi động cơ trong chuyến. Nội dung điện mẫu chưa được decode đầy đủ. Phạm vi tích hợp vào TOSS (liên quan [AMOS](#a) và cảnh báo kỹ thuật) chưa xác định. *(Nguồn: acars-rcv-analysis.extracted.md §ACARS-05.)* |

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
| **FON** (Flight Operations Notice) | Thông báo Khai thác Bay | Kênh thông báo/cập nhật thông tin khai thác cho điều phái, truy cập trong EFB: extra fuel/taxi fuel/holding fuel, performance factor, cost index, thông tin khai thác khác (nguồn: FDOP §3.1 — "refer to FON in EFB"). *(Tên đầy đủ đã xác nhận: Flight Operations Notice — BA Lead 17/06/2026.)* |
| **FOE** | (giữ nguyên — tên đơn vị nội bộ VNA) | Đơn vị phát triển đường bay, lập kế hoạch bay chi tiết (detailed plan: route, flight time, aircraft, load), nhận tài liệu khai thác sau chuyến. Các nhóm trực thuộc xuất hiện trong nguồn: **OPS team, EFB Group, Aircraft Performance Group (PER)** (nguồn: FDOP §3.3, §3.5). *(Cần xác nhận tên đầy đủ với VNA.)* |
| **Flight Watch** | Giám sát chuyến bay | Theo dõi chủ động chuyến bay đang khai thác (vị trí, nhiên liệu, thời tiết, sai lệch kế hoạch) với khả năng can thiệp/hỗ trợ. Vai trò chuyên trách của điều phái giám sát (nguồn: FDOP §3.1.4, §3.2.1, §3.4). Phân biệt với [Flight Following](#f). *Lưu ý: "Flight Watch" còn là tên hệ thống thời tiết/đường bay TOSS tích hợp (YCKT TOSS-086).* |
| **Flight Following** | Theo dõi chuyến bay | Theo dõi vị trí/tiến trình chuyến bay (nhận thức tình huống), mức độ nhẹ hơn Flight Watch (nguồn: FDOP §3.1.4, §3.4; FAA-S-8081-10E). |
| **Flight Permission / Phép bay** | Phép bay | Phép khai thác do nhà chức trách (CAAV/quốc gia liên quan) cấp cho chuyến bay theo ngày/giờ/loại tàu/đường bay. Điều phái kiểm tra phép bay trước khi lập kế hoạch (nguồn: FDOP §3.1, §3.5). **Phân biệt với [Dispatch Release](#d).** |
| **Fuel Exposure** | Rủi ro nhiên liệu | Mức rủi ro tiêu hao/thiếu hụt nhiên liệu khi điều kiện khai thác thay đổi (thời tiết, đổi mực bay, re-route) trong giai đoạn giám sát chuyến bay (nguồn: FDOP §3.1.4). *(Bản dịch đề xuất — cần SME xác nhận.)* |
| **Flight Detail** | Trang chi tiết chuyến bay | Trang chi tiết một chuyến, mở ở tab mới khi click từ màn Monitoring; gồm nhiều tab phụ (khai thác, tàu bay, tổ bay, tài liệu, tải…) (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng). |
| **FN Surface** | Hậu tố số hiệu chuyến (Netline) | Ký tự hậu tố của Flight Number trên Netline đánh dấu trạng thái lịch: `D` = chuyến **delay sang ngày sau (day-change)**; `Z` `[cần xác nhận định nghĩa]` (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng; xem OID SME-34). |
| **Field Order** | Thông tin order trên giao diện loadsheet | Thông tin order trên giao diện loadsheet, được nhận định là giống nhau giữa các loại tàu và giữa nội địa hay quốc tế, chỉ khác về người sử dụng (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 2 ~01:18–01:19). |
| **FILMATER** | *(tên cần xác nhận — KS-57)* | Tên phần mềm hoặc format tài liệu MEL của Boeing xuất hiện trong transcript 17/06 (ASR có thể biến dạng — có thể là "FILMMAKER" hoặc tên khác). Mỗi hãng sản xuất (Boeing/Airbus) cung cấp tài liệu MEL theo format riêng; TOSS cần import và decode từ các format này để xây dựng Master MEL. (nguồn: KS 17/06/2026 §4; xem OID KS-57.) |
| **FODM** (Flight Ops Documentation Manager) | Phần mềm Quản lý Tài liệu Khai thác Bay (Airbus) | Phần mềm của Airbus dùng để quản lý và xuất tài liệu MEL/CDL theo loại tàu. VNA dùng FODM như nguồn tài liệu MEL cho đội tàu Airbus; TOSS cần import và decode từ format FODM để xây dựng Master MEL Airbus. *(Trong transcript 17/06 ASR ghi sai thành "FOMA" — đã xác nhận: FODM. BA Lead xác nhận 17/06/2026.)* (nguồn: KS 17/06/2026 §4.) |
| **Flight Type Code** (O, Z, G, H, A, P, V, S) | Mã loại chuyến nội bộ VNA | Mã loại chuyến nội bộ VNA dùng để phân biệt chuyến thường và không thường lệ, nhận diện ở Lido và flight plan. Một số mã (ví dụ mã `O`) tương ứng "non-scheduled" với chuyển đổi `S` sang `N`. Danh mục đầy đủ chưa rõ (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V — dòng 80–95). |
| **FMS** | (giữ nguyên — tên hệ thống cũ VNA) | Hệ thống cũ mà TOSS hướng tới thay thế (ASR đọc nhầm thành "tầm phim" hoặc "tầng phim"), có một luồng vận hành rất chậm (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 1 ~00:23–00:24). |
| **Fuel Tank Capacity** | Dung lượng bình nhiên liệu | Dung lượng bình nhiên liệu của tàu bay — một trong các thuộc tính kỹ thuật cần lưu cho TOSS (nguồn: báo cáo khảo sát 09/06/2026 §V — Part 1 ~01:04). |
| **FML** *(ACARS Progress/Fuel Report)* | Điện báo tiến trình chuyến bay | Điện ACARS báo cáo tiến trình chuyến bay (Progress Report) trong giai đoạn bay, mang thông tin đường băng cất cánh và nhiên liệu. Format body: `PRG/TS<time>/<date>/DT<airport>,<runway>,<param>,<fuel>,<burn?>/FN<flight_no>`. TOSS có thể dùng để lấy runway cất cánh thực tế và fuel tại mốc báo cáo. *(Ý nghĩa đầy đủ các trường wind/fuel và cách tích hợp: cần Ban KT làm rõ — nguồn tong-hop-dien-acars.extracted.md, cờ "Cần Ban KT làm rõ".)* |
| **FOB** *(Fuel On Board)* | Nhiên liệu thực tế trên tàu | Lượng nhiên liệu thực tế trên tàu bay tại thời điểm một sự kiện ACARS được gửi. Xuất hiện trong hầu hết các điện OOOI ([A80](#a), [M49](#m), [DEP](#d)/[ARR](#a), M11/M13/M14). **Đơn vị phụ thuộc avionics:** A320/A321 Rockwell Collins = **LITERS** (điện A80 ghi `/UNT LITERS`); B787/A350 MVA ghi `SI FOB <value>/` — đơn vị chưa xác nhận (OID SME-45). TOSS cần chuẩn hóa về kg khi tổng hợp. Xem [ACARS Fuel Unit](#a). |

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
| **ICAO Designator / IATA Designator** | Mã định danh loại tàu bay | Hai mã định danh loại tàu bay theo chuẩn ICAO (4 ký tự) và IATA (3 ký tự) — cần khai báo trong danh mục tàu bay của TOSS (nguồn: báo cáo khảo sát 09/06/2026 §V — Part 1 ~00:55–00:56). |
| **ICON** | (giữ nguyên — tên hệ thống/tham số khí tượng) | Hệ thống hoặc tham số khí tượng cung cấp Flight Level cho các giai đoạn Climb, Cruise và Descend. Điều phái lấy Flight Level từ ICON và sửa vào OFP (TXT cùng email) để MO Plus bốc tách đúng (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V — dòng 1700–1715). |
| **IFV** | (giữ nguyên — tên phần mềm nội bộ VNA) | Phần mềm nội bộ quản lý thuộc tính kỹ thuật tàu bay ([Fuel Tank Capacity](#f), [Cargo Capacity](#c)…) — nguồn tích hợp cho TOSS. Tên đầy đủ chưa rõ (nguồn: báo cáo khảo sát 09/06/2026 §V — Part 1 ~01:03–01:06). |

---

## L

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **Lotang / lô tam / nô tam** ⟶ **NOTAM** | (Lỗi ASR — KHÔNG phải loại chuyến) | **Đính chính ASR (BA Lead xác nhận 12/06):** các cụm "Lotang", "lô tam", "nô tam" trong transcript đều là **lỗi nhận dạng giọng nói của [NOTAM](#n)** — KHÔNG tồn tại "chuyến Lotang". Nội dung điều phái nêu thực chất là "cảnh báo **NOTAM mới phát sinh** + đánh giá ảnh hưởng" (transcript 11/06 dòng 670: "lên trang cơ quan quản lý bay, lấy NOTAM họ phát hành"). Mọi tham chiếu "Lotang" trước đây đã gộp về cảnh báo NOTAM (BR-118). |
| **LC** (Line Check) | Kiểm tra định kỳ đường bay | Hình thức kiểm tra khai thác định kỳ của phi công trên đường bay thực tế. Tàu bay đang được sử dụng cho Line Check ghi nhận trong BCAO là "LC" kèm sân bay (vd "010 LC HAN"). Ảnh hưởng đến số tàu thực sự có sẵn cho khai thác thương mại (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **LF** (Load Factor) | Hệ số sử dụng ghế | Tỷ lệ phần trăm số ghế có khách trên tổng ghế cung ứng, đo theo chiều đi và chiều đến cho mỗi đường bay. Báo cáo trong BCAO theo từng đường trục (vd HAN-SGN-HAN LF trung bình 92%). Là KPI khai thác quan trọng bên cạnh OTP và OSP (nguồn: BCAO_10Jun2025_11Jun2025-v2.docx). |
| **Loadsheet** (Load & Trim Sheet) | Phiếu Cân bằng Tải | Tài liệu tổng kết khối lượng và cân bằng (mass & balance) của một chuyến bay: DOW, payload, nhiên liệu, các giá trị ZFW / TOW / LW và trọng tâm (CG) / trim. Phải nằm trong giới hạn (MZFW/MTOW/MLW) và được cơ trưởng ký duyệt. Là điểm giao giữa Khai thác Mặt đất (chốt tải) và Khai thác Bay/Dispatch (kiểm tra giới hạn, phát hành). Theo ICAO Annex 6 / EU 965/2012 (Part-CAT). *Lưu ý: FAA gọi tách thành "Load Manifest" + "Weight & Balance Form".* |
| **Leg History** (Netline) | Lịch sử chặng/chuyến | Lịch sử thay đổi của một chặng/chuyến (đổi giờ EPD, delay…) lưu sẵn trong Netline; TOSS hiển thị lại dạng History Timeline (nguồn: phỏng vấn Dispatcher 12/06/2026 buổi sáng). |
| **Lido video** | (giữ nguyên — tên adapter) | Adapter tự động kéo OFP, NOTAM và thời tiết về TOSS, thay thế thao tác upload thủ công của điều phái (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 2 ~02:03). |
| **Lido Import file** | Format import MEL của Lido (trước gọi "ePot") | Format file XML của hệ thống Lido (Lufthansa Systems) dùng để import dữ liệu MEL active theo chuyến bay. Có cấu trúc cột/trường riêng, cần mapping sang MEL data schema của TOSS. Vấn đề đã phát hiện: một số chỗ trong file dùng lệnh "insert" thay vì "update" gây duplicate khi nạp lại (xem OID KS-59). Cần xin template mô tả trường từ VNA để thiết kế mapping schema (xem OID KS-58). (nguồn: KS 17/06/2026 §4.) |

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
| **Master MEL** | Danh mục MEL gốc theo loại tàu | Tập danh mục tĩnh do nhà sản xuất tàu bay ban hành, theo từng loại tàu. Mỗi bộ có khoảng 3.000 item; cấu trúc phân cấp tối đa 5–6 level (ví dụ: 21-25-01-01-02). Mỗi item có: mã item, tên thiết bị, free text mô tả, và các trường metadata khai thác (fuel factor, payload reduction, altitude cap, giới hạn autopilot/sân bay). Một item tại level cuối có thể chia thành nhiều trường hợp (x1, x2, x3…) với penalty khác nhau — xem [MEL penalty](#m). TOSS lưu 2 lớp: raw content (gốc từ nhà sản xuất) và edited content (metadata khai thác do VNA bổ sung). Tần suất cập nhật: ~1–2 tháng/lần khi nhà sản xuất phát hành phiên bản mới. Nhập liệu ban đầu: import + decode bán tự động kết hợp nhập tay. (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 2 ~02:15; KS 17/06/2026 §2, §4.) |
| **MEL Active** | MEL đang kích hoạt trên một tàu cụ thể | Tập [MEL](#m) item đang được kích hoạt trên một tàu cụ thể, do thợ máy gắn lên [AMOS](#a) khi phát hiện hỏng hóc tương ứng. TOSS nhận MEL Active từ AMOS để: (1) cảnh báo Dispatcher khi item mới phát sinh hoặc được clear; (2) hỗ trợ Dispatcher xem ảnh hưởng khai thác và quyết định penalty case; (3) đưa vào báo cáo BCAO. AMOS active MEL đến level 3–4 (chính xác cần xác nhận — xem OID KS-55). (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 2 ~02:16–02:18; KS 17/06/2026 §2, §3.) |
| **MEL penalty** | Hạn chế/chi phí khai thác do MEL item | Các ràng buộc hiệu năng phát sinh khi một MEL item được kích hoạt trên tàu. Các loại penalty chính: (1) fuel factor — hệ số tăng nhiên liệu (%); (2) payload reduction — giảm tải (kg/lbs); (3) altitude cap — giới hạn mực bay tối đa (Flight Level); (4) autopilot restriction — giới hạn sử dụng autopilot; (5) airport restriction — không được bay một số sân bay nhất định. Mỗi MEL item có thể có nhiều trường hợp (case: x1, x2, x3…) với penalty khác nhau tùy điều kiện áp dụng; Dispatcher quyết định áp dụng case nào — TOSS chỉ hiển thị thông tin hỗ trợ. (nguồn: KS 17/06/2026 §2, §3.) |
| **Mission Watch** | (giữ nguyên — tên hệ thống/màn hình) | Hệ thống hoặc màn hình giám sát chuyến bay hiện hành ngoài TOSS, đã tích hợp ACARS để biết chuyến đang ở phase nào. TOSS tham chiếu nhưng lấy thẳng nguồn ACARS chứ không qua Mission Watch (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V — dòng 765–815). |
| **MMS** | (giữ nguyên — tên hệ thống tiền thân TOSS) | Hệ thống web tiền thân của TOSS, chỉ chạy được trên Internet Explorer, phát triển khoảng năm 2019, phạm vi hẹp hơn nhiều so với TOSS (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 1 ~00:53–00:54). |
| **MO Plus Latest by Filename** | Cơ chế MO Plus hiển thị file mới nhất theo tên | Cơ chế MO Plus chỉ hiển thị file cuối cùng theo tên (replace); file khác tên theo lý thuyết sẽ giữ song song nhưng thực tế thuật toán đang hardcode replace (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V — dòng 1437–1500). |
| **Multi-session / Đa phiên** | Cơ chế đa phiên người dùng | Cơ chế cho phép một người dùng mở đồng thời nhiều phiên làm việc theo các vai trò khác nhau — tham chiếu hệ thống nước ngoài (nguồn: báo cáo khảo sát 09/06/2026 §V — Part 1 ~00:48–00:51). |
| **M49** *(B787 Flight Phase Message)* | Điện pha bay B787 | Điện ACARS báo từng pha chuyển tiếp trong chuyến bay của B787 (chuẩn Boeing). Mỗi điện M49 mang một sub-type trong body (trường `01xxxx`): `INIT` → `SDPO` (Power On) → `POES` (ENG Start) → `ESTA` (Taxi Out) → `TATO` (Take Off ready) → `OFF` → `TOIC` (Initial Climb) → `ICCL` → `CLER` (Enroute) → `ERDC` (Descent) → `DCAP` (Approach) → `APFL` (Flare) → `FLRO` (Rollout) → `ON` → `ROTI` (Taxi In) → `IN` → `TISD` (ENG Shutdown). Mỗi M49 kèm time và fuel tại thời điểm chuyển pha. TOSS normalize các sub-type `OUT/OFF/ON/IN` từ M49 để lấy [ACARS OOOI](#a). Chạy song song với M11/M13/M14 — M49 được ưu tiên. (nguồn: tong-hop-dien-acars.extracted.md hàng 6–28). |
| **M11 / M13 / M14 / M44** *(Boeing B787 OOOI + Door messages)* | Điện OOOI + cửa Boeing (B787) | Nhóm 4 label điện ACARS chuẩn Boeing cho B787: **M11** = OUT Report, **M13** = ON Report *(FIMS hiện đang dùng để bóc tách time và fuel)*, **M14** = IN Report, **M44** = Door event (FIRST DOOR OPEN TIME / LAST DOOR CLOSE TIME). Chạy song song với [M49](#m) — khi có cả hai, ưu tiên M49 cho độ chính xác pha; M11/M13/M14 làm dự phòng. (nguồn: tong-hop-dien-acars.extracted.md hàng 29–37). |
| **MVA** *(Multi-format Variant Address — luồng ACARS song song)* | Luồng điện ACARS song song MVA | Địa chỉ đích `QU HDQONVN` nhận phiên bản compact của cùng sự kiện OOOI, gửi song song với điện thường (`QU HANASVN`). Format ngắn gọn hơn: `AD<time> <dest>` (OUT/OFF), `AA<on_time>/<in_time>` (ON/IN), `SI FOB <fuel>/`. VNA **ưu tiên lấy OOOI time từ MVA trước** điện thường. Xuất hiện trong cả [A80](#a), M11/M13/M14, [DEP](#d)/[ARR](#a). *(Đơn vị FOB trong MVA: chờ xác nhận — OID SME-45.)* (nguồn: tong-hop-dien-acars.extracted.md hàng 23/30/39/43). |

---

## N

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **NOTAM** (Notice to Airmen / **Notice to Air Missions** — FAA) | Thông báo cho Phi công | Thông tin về sân bay, không phận, hoặc thiết bị ảnh hưởng đến an toàn bay. Dispatcher trong TOSS phải xem xét NOTAM trước khi phát hành Dispatch Release. *Tên gọi: ICAO/truyền thống là "Notice to Airmen"; FAA đã đổi thành "Notice to Air Missions" (xem `aircraft_dispatcher_pts_10`).* **Phân loại 3 nhóm theo phạm vi ảnh hưởng:** (1) NOTAM sân bay — ảnh hưởng hoạt động tại sân bay cụ thể; (2) NOTAM vùng trời (FIR/airspace) — ảnh hưởng quyền bay qua không phận; (3) NOTAM đường bay (route/AWY) — ảnh hưởng tuyến đường bay. Cách phân loại chi tiết và đánh giá mức độ ảnh hưởng tới từng chuyến cần workshop riêng với SME điều phái. NOTAM cứu hỏa (RFFS): khi cấp RFFS sân bay thay đổi → NOTAM phát ra → TOSS cảnh báo; không cần lưu tiêu chuẩn RFFS riêng (nguồn: phỏng vấn Dispatcher 11/06/2026). **Lỗi ASR cần map:** "Lotang", "lô tam", "nô tam" trong transcript = NOTAM (BA Lead xác nhận 12/06) — KHÔNG có "chuyến Lotang"; "cảnh báo NOTAM mới phát sinh + đánh giá ảnh hưởng" gộp tại cảnh báo NOTAM (BR-118). |
| **NOTOC** (Notification To Captain) | Thông báo cho Cơ trưởng | Văn bản thông báo cho cơ trưởng về **hàng nguy hiểm (Dangerous Goods)** xếp trên tàu bay. Cơ trưởng phải tiếp nhận và **xác nhận đã nhận** (ký trên một bản sao NOTOC); một bản sao phải lưu giữ tại mặt đất, truy cập được suốt thời gian chuyến bay. Cơ sở: ICAO Annex 18 + FOCA GM-INFO Dangerous Goods (xem `dangerous-goods-notoc/`). TOSS sinh/đính kèm NOTOC trong bộ tài liệu chuyến bay khi có DG. |
| **Ngưỡng release OFP** | Ngưỡng thời gian phát hành OFP | Bộ tham số thời gian trước ETD quy định cửa sổ cho phép release OFP: **quốc nội — sớm nhất 210′, thông thường 75′, muộn nhất 60′ trước ETD; quốc tế — sớm nhất 270′, thông thường 90′, muộn nhất 75′ trước ETD.** TOSS dùng các ngưỡng này để đổi màu cảnh báo (trắng → vàng → đỏ) trên màn Dispatch Monitoring (nguồn: phỏng vấn Dispatcher 15/06/2026 P2 d.~26; đối chiếu Function list). |

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
| **OFP Source — ba định dạng PDF / TXT / HTML** | Ba định dạng OFP xuất song song từ Lido | Lido xuất OFP ở ba định dạng song song. TXT dùng để bốc tách NOTAM và giờ, HTML dùng để bốc tách group, PDF dùng để hiển thị. MO Plus mix ba nguồn. TOSS backup phải đẩy đủ ba nguồn (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V — dòng 1626–1660). |
| **OPS++** (Netline Flight Ops++) | Hệ thống khai thác chính của VNA | Hệ thống khai thác / lập lịch bay chính hiện hữu của VNA (nền Netline, đang mua mới để thay FMS cũ). TOSS lấy dữ liệu lịch bay, danh mục & tình trạng tàu bay, lịch bảo dưỡng từ OPS++ (FUNC-511-01; SH-10). TOSS là đầu mối tích hợp [AMOS](#a) và cung cấp dữ liệu MEL/CDL cho OPS++ — OPS++ không tích hợp AMOS riêng (nguồn: KS 17/06/2026 §1; KS 08/06/2026 §V). *(Trong transcript 17/06 ASR ghi "FOIE/FOI/FOEM/FOM" — đều chỉ OPS++; ban đầu nhận định nhầm là "e-FON", BA Lead hiệu chỉnh 18/06/2026.)* |

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
| **PIC Confirm** | Xác nhận của PIC | Cột/trạng thái trên màn hình Dispatch: phi công (PIC) xác nhận đã nhận và đọc OFP sau khi Dispatch đã release. Không có quy định cứng về thời điểm confirm. Đây là thông tin bổ sung ngoài **Dispatch Release** và **Pilot Release** — cần thêm cột riêng trên màn Monitoring (nguồn: phỏng vấn Dispatcher 15/06/2026 P2 d.~67). |
| **POD** | (giữ nguyên — viết tắt nội bộ VNA) | Nguồn bản tin/đánh giá tại các thời điểm cập nhật hằng ngày mà điều phái NOTAM/WX tham khảo (nguồn: FDOP §3.2.2). *(Cần xác nhận tên đầy đủ với VNA — chưa có nguồn.)* |
| **PER Group** (Aircraft Performance Group) | Nhóm tính năng tàu bay (FOE) | Nhóm thuộc FOE phụ trách tính năng tàu bay; nhận tài liệu Weigh and Balance / Chapter 2 từ Tech Dept khi nhận tàu mới (nguồn: FDOP §3.5 — "Aircarft performance Group (FOE)", "send to PER Group"). *(Cần xác nhận tên chính thức với VNA.)* |

---

## Q

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **QRH** (Quick Reference Handbook) | (giữ nguyên QRH) | Sổ tay tham chiếu nhanh quy trình khai thác/khẩn nguy của tổ lái. Nằm trong bộ tài liệu chuẩn bị cho delivery flight (nguồn: FDOP §3.5). |
| **QAR** *(Quick Access Recorder — chờ xác nhận)* | Bộ ghi dữ liệu truy xuất nhanh | *(Chờ xác nhận — OID SME-12 từ phỏng vấn 11/06/2026 sáng.)* Thiết bị trên tàu bay ghi dữ liệu chuyến bay với tần số cao (loại Flight Data Recorder dễ truy xuất). Dữ liệu QAR được downlink qua ACARS dưới dạng điện [DFD](#d) Q-series (Q4/Q5/Q6/Q7/Q8 performance groups). *(Cơ chế VNA sử dụng QAR data và phạm vi tích hợp TOSS: xem OID SME-12.)* |

---

## R

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **RDB TIME** | (giữ nguyên — mã/lỗi hệ thống nội bộ) | Loại lỗi liên quan dữ liệu đường bay xuất hiện trong nghiệp vụ chuẩn bị chuyến bay VIP (nguồn: FDOP §3.3). *(Cần xác nhận nghĩa với VNA — khả năng "Route Data Base time".)* |
| **RFFS** (Rescue and Fire Fighting Services) | Dịch vụ Cứu nạn và Cứu hỏa sân bay | Cấp độ cứu nạn–cứu hỏa của sân bay (CAT theo ICAO Annex 14); điều phái kiểm tra RFFS của sân bay đi/đến/dự bị trước khi lập kế hoạch bay (nguồn: FDOP §3.1 — "refer to FDM table 4.2"; ICAO Annex 6; 14 CFR Part 121). **Cơ chế cảnh báo TOSS (phỏng vấn 11/06):** khi cấp RFFS sân bay thay đổi → NOTAM được phát ra → TOSS nhận NOTAM và cảnh báo điều phái; TOSS không cần lưu trữ bảng tiêu chuẩn RFFS riêng. |
| **Registration (REG)** | Mã đăng ký tàu bay | Mã nhận dạng quốc tế duy nhất của tàu bay (tail number), ví dụ VNA893, A321-A396. Là khóa chính để liên kết mọi sự kiện khai thác (chuyến bay, bảo dưỡng, sự cố kỹ thuật) với từng tàu cụ thể. Một tàu có thể vào/ra đội bay nhiều lần → TOSS cần quản lý lịch sử REG theo từng giai đoạn (nguồn: họp 09/06). |
| **Reserve Crew** | Tổ bay Dự phòng | Phi hành đoàn sẵn sàng thay thế khi có sự cố. TOSS quản lý danh sách dự phòng và cảnh báo khi cần kích hoạt. |
| **Roster** | Lịch Bay | Lịch phân công nhiệm vụ của phi hành đoàn theo tháng/tuần. Được tạo trong module Quản lý Tổ bay TOSS. |
| **Reconfig (Reconfiguration)** | Tái cấu hình tàu bay | Quá trình sửa đổi lại cấu hình tàu bay (cấu hình ghế, hệ thống nội thất). Trong giai đoạn reconfig, tàu không xuất hiện trên lịch bay nhưng vẫn cần quản lý (nguồn: báo cáo khảo sát 09/06/2026 §V — Part 1 ~00:58). |
| **Report Tab + Link 7-day** | Cơ chế trải nghiệm báo cáo nặng | Cơ chế trải nghiệm sử dụng cho báo cáo nặng: trả kết quả ra tab riêng, lưu link tải bảy ngày và hỗ trợ tải lại, tương tự gửi mail báo cáo (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V — dòng 1614–1623). |

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
| **Sketch Check / Schedule Check** | (giữ nguyên — tên hệ thống/màn hình tham khảo) | Hệ thống hoặc màn hình tham khảo cho cơ chế hiển thị real-time kết hợp hiệu ứng nhấp nháy và auto-refresh theo chu kỳ ngắn (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V — dòng 1020–1030). |
| **SQS** (Special Service Request) | Yêu cầu dịch vụ đặc biệt / cập nhật số khách | Thông tin cập nhật số khách trong một chuyến bay, có thể thay đổi nhiều lần trong một chuyến do hành khách book hoặc hủy chỗ. Cần lưu chuỗi lịch sử để Hãng đánh giá (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 2 ~01:22). |
| **Subfleet** | Phân nhóm con của đội tàu | Phân nhóm con của đội tàu, ví dụ A350-900 vs A350-1000, 787-9 vs 787-10. Một số báo cáo dùng cấp subfleet thay vì cấp loại tàu tổng (nguồn: báo cáo khảo sát 09/06/2026 §V — Part 2 ~01:40–01:43). |
| **SATCOM** *(Satellite Communications — chờ xác nhận)* | Liên lạc qua vệ tinh | *(Tham chiếu tiêu chuẩn — ngữ cảnh VNA chờ xác nhận.)* Hệ thống liên lạc tàu bay qua vệ tinh (Inmarsat/Iridium), dùng cho đường dài vượt tầm VHF. Trong kho ACARS VNA, label [SMA](#s) khả năng liên quan kênh SATCOM. *(Phạm vi VNA sử dụng SATCOM và tích hợp TOSS: cần xác nhận với VNA.)* |
| **SMA** *(SATCOM Message ACARS — chờ xác nhận)* | Điện ACARS kênh SATCOM | *(Chờ xác nhận với VNA / Ban kỹ thuật.)* Label điện ACARS xuất hiện trong kho dữ liệu tháng 03/2026. Khả năng liên quan kênh [SATCOM](#s) (Satellite Message) nhưng nội dung điện mẫu chưa được decode. *(Định nghĩa đầy đủ và phạm vi decode: acars-rcv-analysis.extracted.md §ACARS-04.)* |

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
| **Top integration** | (giữ nguyên — tên nhóm trao đổi kỹ thuật) | Tên nhóm trao đổi kỹ thuật giữa hai bên (Hãng và đối tác triển khai) về tích hợp và hạ tầng (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 1 ~00:41). |
| **Trực ban trưởng** | (chức danh nội bộ VNA) | Nhóm người dùng quản lý trạng thái khai thác và khách nối chuyến — một trong hai nhóm đối tượng giám sát chính của TOSS (nguồn: báo cáo khảo sát 08/06/2026 §V — Part 1 ~00:08–00:10). |
| **TT5 / TT6** *(ACARS health/sensor data — chờ xác nhận)* | Dữ liệu cảm biến/sức khỏe hệ thống ACARS | *(Chờ xác nhận với VNA / Ban kỹ thuật.)* Hai label điện ACARS xuất hiện trong kho dữ liệu tháng 03/2026. Khả năng liên quan dữ liệu sức khỏe hệ thống (HUMS — Health and Usage Monitoring System) hoặc dữ liệu cảm biến. Nội dung điện chưa được decode. *(Định nghĩa và nguồn dữ liệu: acars-rcv-analysis.extracted.md §ACARS-06.)* |

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
| **VICO** | *(tên đầy đủ cần xác nhận)* | Đơn vị triển khai/hỗ trợ VNA vận hành [AMOS](#a); có nhân sự hiểu cấu trúc DB AMOS, từng hỗ trợ VNA kết nối và lấy dữ liệu từ DB. Là đối tác cần mời vào buổi khảo sát DB AMOS (xem OID HC-04). ASR ghi "Vicô" / "Vyco". (nguồn: KS 17/06/2026 §5.) |
| **VMA** | Ngưỡng thời tiết tối thiểu sân bay *(viết tắt nội bộ VNA)* | Tập hợp ngưỡng điều kiện khí tượng tối thiểu (tầm nhìn, trần mây, và loại hiện tượng thời tiết) mà dưới ngưỡng đó sân bay không đủ điều kiện khai thác — dùng làm mức ngưỡng so sánh khi TOSS cảnh báo METAR/SPECI. Điều phái đề cập VMA trong ngữ cảnh: khi tầm nhìn/trần mây trong METAR thay đổi xuống dưới VMA, hoặc khi có hiện tượng TSRA → hệ thống cảnh báo (nguồn: phỏng vấn Dispatcher 11/06/2026). *(Tên đầy đủ đã xác nhận — BA Lead 2026-06-16. Còn chờ xác nhận: cấu trúc bảng VMA chi tiết và phân loại sân bay theo loại khai thác.)* |
| **VNA** (Vietnam Airlines) | Hãng Hàng không Quốc gia Việt Nam | Hãng hàng không quốc gia Việt Nam — chủ thể vận hành và là bên đặt hàng hệ thống TOSS. Tên đầy đủ: **Vietnam Airlines**. Mã IATA: **VN**; mã ICAO: **HVN**. Trong tài liệu nội bộ dự án, "VNA" dùng để chỉ tổ chức khách hàng; phân biệt với **VATM** (Tổng công ty Quản lý bay Việt Nam). |

---

## W

| Viết tắt / Thuật ngữ | Tiếng Việt | Mô tả trong TOSS |
|---|---|---|
| **Wet Lease** (ACMI) | Thuê ướt | Thuê **toàn bộ của hãng khác** (tàu bay + tổ bay + bảo dưỡng + bảo hiểm — ACMI: Aircraft, Crew, Maintenance, Insurance), **hãng mình chỉ đưa khách/hàng của mình lên khai thác**. Chuyến bay khai thác dưới AOC của **bên cho thuê**. Đối lập với [Dry Lease](#d). Liên quan tài liệu ORO.AOC.110 (Operational leasing). |
| **Wet Lease kết hợp** (Damp Lease) | Thuê ướt kết hợp | Biến thể của Wet Lease: **bên cho thuê cung cấp toàn bộ TRỪ nhiên liệu** (tàu bay + tổ bay + bảo dưỡng + bảo hiểm). **Nhiên liệu do bên đi thuê — hãng dự án — TỰ cung cấp.** |
| **Watchlist** | Danh sách giám sát | Danh sách chuyến bay được điều phái đánh dấu cần theo dõi đặc biệt (watchlist designation) khi hoàn tất OFP — vd có threat/rủi ro đã ghi nhận (nguồn: FDOP §3.1). |
| **Waypoint** | Điểm dẫn đường | Điểm tọa độ xác định trên đường bay (vd ULVAL, ZAMIR). "Critical waypoints" = các điểm dẫn đường trọng yếu cần báo cáo/giám sát khi bay qua vùng trời không kiểm soát (nguồn: FDOP §3.4). |
| **Weigh Manifest** | Bản kê cân tải | Bản kê khối lượng do đối tác giao tàu (Boeing/Airbus) cung cấp khi nhận tàu bay (draft → final), đầu vào để CLC lập [Loadsheet](#l) (nguồn: FDOP §3.5). **Phân biệt với Loadsheet** (Phiếu Cân bằng Tải). |
| **Weather Multi-Flight** | File thời tiết áp cho nhiều chuyến | File thời tiết khu vực hoặc đường bay áp cho nhiều chuyến trong khoảng thời gian hiệu lực, thường khoảng ba tiếng. Upload qua TOSS và tự đính vào toàn bộ chuyến trong khoảng (nguồn: báo cáo khảo sát 11/06/2026 buổi chiều §V — dòng 1199–1265). |

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

## ★ Thuật ngữ nguồn Khách hàng (CỐT LÕI) — bộ "giải thích thuật ngữ" VNA

> **Ưu tiên cốt lõi (BA Lead, 2026-06-16):** 35 thuật ngữ dưới lấy nguyên từ tab **"giải thích thuật ngữ"** do khách hàng (VNA) tự soạn — nguồn `customer-docs-source/TOSS-Total-Operations-Steering-System-v0.1.extracted.md`. **Khi mâu thuẫn với entry A–Z phía trên, lấy định nghĩa khách hàng làm chuẩn.** Khách hàng xác nhận **TOSS = Transformative Operations Support System** (tên file "Total Operations Steering System" là nhầm/cũ — KHÔNG phải tên chính thức).

| Viết tắt / Thuật ngữ | Tiếng Anh | Nhóm | Mô tả (nguồn khách hàng) |
|---|---|---|---|
| **AKE** | AKE / LD3 Container | Hàng hóa | Thùng nhôm chứa hàng hóa/hành lý tiêu chuẩn (ULD) phổ biến nhất trên tàu thân rộng. |
| **Amadeus PSS** | Amadeus Passenger Service System | Hành khách | PSS quản lý đặt chỗ, bán vé, check-in, dữ liệu hành khách; nguồn số khách/booking/cấu hình khai thác cho lập KH bay, tải trọng, báo cáo. |
| **ANCM** | Air Navigation Charges Management | Chi phí khai thác | Quản lý chi phí điều hành bay: phí bay qua FIR, điều hướng, cất/hạ cánh. |
| **BH** | Block Hour | Kế hoạch bay | Giờ lăn + bay (rút chèn rời bến → đóng chèn vào bến). Dùng tính lương + tuổi thọ tàu bay. (phân biệt FH) |
| **CDE** | Cargo Data Exchange | Hàng hóa | Nền tảng trao đổi dữ liệu điện tử hàng hóa giữa Hãng – Sân bay – Hải quan. |
| **CFP / OFP** | Computerized / Operational Flight Plan | Kế hoạch bay | KH bay chi tiết (đường bay/thời tiết/nhiên liệu). OFP = bản chốt cuối có chữ ký pháp lý của tổ lái. |
| **Cirium** | Cirium Aviation Analytics | Dữ liệu | Nền tảng dữ liệu lịch bay toàn cầu + phân tích chuyên sâu hàng không. |
| **Contingency** | Contingency Fuel | Nhiên liệu | Xăng dự phòng tình huống bất thường (gió ngược, bão, bay vòng tránh mây). |
| **Cassiopee Alpha** | Cassiopee Alpha Safety System | An toàn bay | Quản lý báo cáo an toàn khai thác (Safety Reporting); TOSS nhận để giám sát/phân tích an toàn. |
| **EFF** | Electronic Flight Folder | Kế hoạch bay | Thư mục tài liệu chuyến bay điện tử; FIMS đóng gói OFP/WX/NOTAM đẩy lên iPad tổ lái. |
| **EGS** | Environmental Governance System | Môi trường | Quản lý dữ liệu môi trường/bền vững; TOSS cấp dữ liệu nhiên liệu/phát thải cho ESG/ETS. |
| **eTechlog** | Electronic Technical Logbook | Kỹ thuật | Nhật ký kỹ thuật điện tử: Flight Log, Defect Log, hạn định khai thác, bất thường kỹ thuật. |
| **FC** | Flight Crew / Flight Cycle | Nhân sự/Kỹ thuật | Tùy ngữ cảnh: Tổ lái HOẶC Chu kỳ bay (1 cất + 1 hạ) dùng tính hạn bảo dưỡng. |
| **FH** | Flight Hour | Kế hoạch bay | Giờ bay thực tế trên không (cất cánh → chạm đường băng hạ cánh). |
| **FIMS** | Flight Information Management System | Hệ thống Cốt lõi | "Trái tim dữ liệu" — tổng hợp lịch bay, thời tiết, nhiên liệu, tải trọng. |
| **Final Reserve** | Final Reserve Fuel | Nhiên liệu | Xăng dự trữ bắt buộc theo luật quốc tế (≈30′ bay chờ, tuyệt đối không dùng lẹm). |
| **HRMS / SkyHR** | Human Resource Management System | Nhân sự | Hệ thống quản lý nhân sự (SkyHR của VNA): mã NV, họ tên, phòng ban, chức vụ, email, trạng thái. |
| **LDAP / AD** | LDAP / Active Directory | Nhân sự/Bảo mật | Dịch vụ quản lý tài khoản tập trung; TOSS đồng bộ user (tên đăng nhập, email, phòng ban, trạng thái). |
| **LMC** | Last Minute Change | Tải trọng | Thay đổi tải trọng phút chót sát giờ cất cánh (khách hủy, dỡ bớt hàng). |
| **LMS** | Learning Management System | Nhân sự | Quản lý đào tạo; tổ bay thi sát hạch lý thuyết định kỳ. |
| **Lotus Airport** | Lotus Airport System | Khai thác mặt đất | Quản lý thông tin khai thác sân bay/dịch vụ mặt đất hỗ trợ điều hành. |
| **LOMS** | Line Operations Monitoring System | Khai thác | Giám sát điều hành bay, ghi số liệu khai thác thực tế + sự cố chuyến bay. |
| **MCMR** | Master Crew Member Record | Nhân sự | Hồ sơ gốc lý lịch/bằng cấp/năng định (Type Rating) của từng tổ bay. |
| **MFA / 2FA** | Multi-Factor / Two-Factor Authentication | Bảo mật | Xác thực đa yếu tố. |
| **Mail manifest** | Mail Manifest | Hàng hóa | Bản kê khai bưu kiện/bưu phẩm; đồng bộ API/điện văn bưu chính; đầu vào FOS Report. |
| **Overflight Permit** | Overflight Permit | Phép bay | Giấy phép bay qua vùng trời/FIR; TOSS theo dõi hiệu lực để cảnh báo chuyến chưa đủ điều kiện. |
| **PMC** | PMC Pallet | Hàng hóa | Khay (mâm) nhôm phẳng chuẩn xếp hàng cỡ lớn (thuộc ULD). |
| **RPS** | Rostering Planning System | Nhân sự | Xếp lịch làm việc (Roster) tự động cho tổ lái/tiếp viên. |
| **RTK** | Revenue Tonne Kilometer | Thương mại | Tấn-Km doanh thu (1 tấn tải trả tiền vận chuyển 1 km). |
| **SPECTRA** | SPECTRA Schedule | Lịch bay | Quản lý/lập kế hoạch/tối ưu lịch bay mùa. |
| **Tankering** | Tankering Fuel | Nhiên liệu | Bay dầu: bơm thừa xăng từ sân nhà do giá sân đến đắt; báo cáo hiệu quả tra nạp tối ưu chênh lệch. |
| **TIMS** | Technical Information Management System | Kỹ thuật | Quản lý thông tin kỹ thuật tàu bay (cấu hình, hồ sơ khai thác) hỗ trợ bảo dưỡng. |
| **Trip Fuel** | Trip Fuel | Nhiên liệu | Lượng nhiên liệu vừa đủ bay từ điểm xuất phát đến điểm đích. |
| **WNI** | Weathernews Inc | Khí tượng | Đối tác cung cấp nền tảng dữ liệu/bản đồ/cảnh báo thời tiết chuyên dụng. |
| **ZFW = DOW + Payload** | Zero Fuel Weight | Tải trọng | Trọng lượng thực tế máy bay khi không có xăng (= DOW + Payload thực tế). |

---

*v0.19 (2026-06-18): Đổi tên thuật ngữ **Lido ePot → Lido Import file** (BA Lead 18/06/2026). Cập nhật entry (section L) + đồng bộ báo cáo KS 17/06 v0.2, OID KS-58/59, agent data-modeler. Giữ chú thích tên cũ "ePot".*
*v0.18 (2026-06-18): Hiệu chỉnh định danh hệ thống — **e-FON → OPS++ (Netline Flight Ops++)**: hệ thống ghi nhận trong KS 17/06 (ASR "FOIE/FOI/FOEM/FOM") được xác định lại là OPS++ — hệ khai thác chính hiện hữu của VNA, không phải hệ thống "Thông báo Khai thác Bay Điện tử" tương lai như nhận định ban đầu. Gỡ entry e-FON (section E); bổ sung entry OPS++ (section O) hợp nhất vai trò nguồn dữ liệu + nhận MEL/CDL từ TOSS; entry FON gỡ link e-FON. Cập nhật báo cáo KS 17/06 + OID SME-45. Quyết định: BA Lead 2026-06-18.*
*v0.17 (2026-06-17): Xác nhận tên phần mềm MEL Airbus — **FOMA → FODM** (Flight Ops Documentation Manager): xóa entry FOMA, thêm entry FODM với đầy đủ tên và mô tả vai trò trong luồng import Master MEL Airbus. BA Lead xác nhận 17/06/2026. KS-57 cập nhật (Airbus chốt; Boeing FILMATER còn chờ xác nhận).*
*v0.16 (2026-06-17): Xác nhận và sửa tên hệ thống — **FOEM → e-FON** (Electronic Flight Operations Notice / Thông báo Khai thác Bay Điện tử): xóa entry FOEM (cũ, chờ xác nhận), thêm entry e-FON (section E) với đầy đủ tên + quan hệ với FON và TOSS. Cập nhật entry **FON** (gỡ cờ "khả năng" — đã xác nhận tên đầy đủ "Flight Operations Notice", thêm link e-FON). Quyết định: BA Lead 2026-06-17.*
*v0.15 (2026-06-17): Bổ sung 8 entry + cập nhật 2 entry từ buổi khảo sát MEL/CDL & Tích hợp AMOS ngày 17/06/2026 — AMOS (Swiss AviationSoftware v25.12); DDMS; FILMATER; FOMA; Lido ePot; MEL penalty; VICO; Master MEL (cập nhật); MEL Active (cập nhật). Quyết định: BA Lead 2026-06-17.*
*v0.14 (2026-06-17): Bổ sung 17 entry từ phân tích kho ACARS tháng 03/2026 (`acars-rcv-analysis.extracted.md` + `tong-hop-dien-acars.extracted.md`). **Đã xác nhận (9 entry):** A80 (Rockwell Collins OOOI — A320/A321), ARR (Honeywell ON/IN — A350), DEP (Honeywell OUT/OFF — A350), M49 (B787 Flight Phase), M11/M13/M14/M44 (Boeing B787 OOOI+Door), MVA (luồng song song HDQONVN), FML (Progress Report), FOB (Fuel On Board). **Cập nhật 2 entry hiện có:** ACARS Fuel Unit (bổ sung A320=LITERS tường minh), ACARS OOOI (bổ sung 3 label theo avionics). **Chờ xác nhận (8 entry):** ADS-B/ADS-C, ARINC 618, CFD, CPDLC, DFD (hai biến thể), ENG, QAR (OID SME-12), SATCOM, SMA, TT5/TT6. Quyết định: BA Lead 2026-06-17.*
*v0.13 (2026-06-16): Bổ sung 31 entry từ §V các báo cáo khảo sát 08–12/06/2026 sau khi BA Lead xác nhận 16/06/2026 (không cần confirm lại). Phân bố theo nguồn: **báo cáo 08/06 — 13 entry** (BackPACK, EvoDM/Evo Report, Echo Report, Lido video, SQS, Master MEL, MEL active, Top integration, Trực ban trưởng, Cán bộ tài liệu, Field Order, FMS, MMS); **báo cáo 09/06 — 8 entry** (IFV, Reconfig, Fuel Tank Capacity, Cargo Capacity, Data Monitoring, Subfleet, ICAO Designator/IATA Designator, Multi-session); **báo cáo 11/06 chiều — 10 entry** (Flight Type Code, Mission Watch, ACARS Phase Trigger, Sketch Check/Schedule Check, Weather Multi-Flight, AIJS, ICON, OFP Source ba định dạng PDF/TXT/HTML, MO Plus Latest by Filename, Report Tab + Link 7-day). Các thuật ngữ còn cờ `[cần xác nhận]` (pgepoid, Cấp clan, FME, Logitech/GDTN) và các entry đã có sẵn (Damp Lease, Category, BCAO, Hệ số quy đổi ACARS, Unrelease, OFP Number/Version, Confirm Release, Post-Release Transition, Payload Extra, FN Surface, Leg History, Flight Detail, Time Window, Color Scheme, History Timeline, Monitoring User Profile, Carrier, Dispatch Release, STS/HEAD, A-CDM) đã bỏ qua. Báo cáo 11/06 sáng và 12/06 sáng đều có toàn bộ thuật ngữ trùng glossary, không thêm entry mới. Quyết định: BA Lead 2026-06-16.*
*v0.12 (2026-06-16): Bổ sung 3 thuật ngữ từ buổi khảo sát 15/06/2026 (Màn hình Flight Dispatch / OFP Release) sau khi BA Lead confirm: **AOS** (bot upload OFP, nghĩa đầy đủ chờ xác nhận — OID KS-40), **Ngưỡng release OFP** (210/75/60′ nội địa; 270/90/75′ quốc tế), **PIC Confirm** (cột xác nhận PIC đã nhận OFP). Quyết định: BA Lead 2026-06-16.*
*v0.11 (2026-06-16): Bổ sung 35 thuật ngữ nguồn khách hàng (tab "giải thích thuật ngữ" — TOSS Total Operations Steering System v0.1) thành mục "CỐT LÕI", sau khi BA Lead xác nhận merge + chỉ đạo "ưu tiên thuật ngữ khách hàng làm cốt lõi". Làm rõ **TOSS = Transformative Operations Support System** (tên file "Total Operations Steering System" là nhầm/cũ). Quyết định: BA Lead 2026-06-16.*
*v0.11 (2026-06-16): Xác nhận 2 entry: (1) **VMA** — tên đầy đủ chính thức "ngưỡng thời tiết tối thiểu sân bay" đã được BA Lead xác nhận; gỡ cờ tên, giữ cờ cấu trúc bảng+phân loại sân bay. (2) Thêm entry mới **VNA** (Vietnam Airlines) — hãng hàng không quốc gia Việt Nam, mã IATA VN / ICAO HVN, chủ thể đặt hàng TOSS. Quyết định: BA Lead 2026-06-16.*
*v0.10 (2026-06-12): ĐÍNH CHÍNH ASR — "Lotang"/"lô tam"/"nô tam" = **NOTAM** (BA Lead xác nhận; transcript 11/06 dòng 670). Bỏ khái niệm "chuyến Lotang" (lỗi ASR); chuyển entry Lotang thành đính chính trỏ NOTAM + thêm ghi chú map vào entry NOTAM. Lan tỏa sửa: OID SME-02 (chốt), BRD BR-116, FUNC PH1, báo cáo 11/06 + 12/06.*
*v0.9 (2026-06-12): Bổ sung 8 entry từ khảo sát Dispatcher 12/06/2026 buổi sáng (thiết kế màn Monitoring) sau khi BA Lead confirm: Carrier, Color Scheme cảnh báo, Flight Detail, FN Surface (D/Z), History Timeline, Leg History, Monitoring User Profile, Time Window. "Z" của FN Surface còn chờ xác nhận (OID SME-34). Quyết định: BA Lead 2026-06-12.*
*v0.8 (2026-06-12): Bổ sung 4 entry nhóm mốc thời gian phục vụ màn hình Monitoring (rà soát FUNC màn giám sát với domain-knowledge): ACARS OOOI (OUT/OFF/ON/IN), A-CDM Milestone Times (SOBT/EOBT/TOBT/AOBT/TSAT/CTOT/TTOT/ATOT/ELDT/ALDT/EIBT/AIBT…), ETA, Phase 4/Phase 5 Monitoring. Nguồn: YCKT FOS sheet-09 (tài liệu khách hàng). Quyết định: BA Lead 2026-06-12.*
*v0.7 (2026-06-12): Bổ sung 5 entry + mở rộng 3 entry từ phỏng vấn Dispatcher 11/06/2026 (buổi chiều) sau khi BA Lead confirm — thêm: Unrelease, OFP Number/OFP Version, Confirm Release/Reload OSP, Post-Release Transition, Payload Extra; mở rộng: Dispatch Release (cặp Unrelease), STS/HEAD (chuyến không thường lệ + miễn phí khí thải), A-CDM (monitoring overview). Các tên hệ thống/viết tắt chờ xác nhận (Mission Watch, AIJS, FME, ICON, Logitech/GDTN, Sketch Check, Brady/ADC, CCD, Flight Type Code) chưa thêm — theo dõi OID SME-19…28. Quyết định: BA Lead 2026-06-12.*
*v0.6 (2026-06-12): Bổ sung 7 entry từ phỏng vấn Dispatcher 11/06/2026 (buổi sáng, Phần 2) sau khi BA Lead confirm: AMOS, AHM (bảng dầu), APU Time, Cost Index (CI), Captain Certification per Aerodrome, Standard Taxi Time, ZFW (thêm mục Z). Các thuật ngữ còn chờ xác nhận (CLC tên đầy đủ, NAIL, SkyCheck, QAR/QAI, TIC, PAX time) chưa thêm — theo dõi tại OID-TOSS-001 (SME-12…18). Quyết định: BA Lead 2026-06-12.*
*v0.5 (2026-06-11): Bổ sung 9 entry và cập nhật 5 entry từ phỏng vấn Dispatcher 11/06/2026 (buổi sáng, part 1): thêm Captain's Release, Chuyến Lotang, SPECI, TSRA, VMA; cập nhật Dispatch Release (luồng Lido→MO Plus→TOSS), Ferry Flight (cảnh báo phát sinh), METAR (tích hợp SPECI+cảnh báo VMA), NOTAM (phân loại 3 nhóm+RFFS qua NOTAM), OFP (mốc chốt nội địa 60'/quốc tế 90'), RFFS (cơ chế cảnh báo qua NOTAM). Quyết định: BA Lead 2026-06-11.*
*v0.4 (2026-06-10): Bổ sung ~38 entry từ FDOP §3.1–3.5 sau khi rà bản dịch; cập nhật 4 entry theo từ ngữ khách hàng YCKT (Dispatcher → "Điều phái"; Dispatch Release → giữ tiếng Anh; Ground Handling → "Phục vụ mặt đất"; Briefing → giữ "briefing/Briefing Sheet" trong ngữ cảnh tài liệu chuyến bay). Quyết định: BA Lead 2026-06-10.*
