---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-23"
status: "Draft"
document_type: "Đối chiếu Khảo sát ↔ BRD"
---

# Đối chiếu Báo cáo Khảo sát (17/06, 18/06, 19/06) ↔ BRD v0.12

> **Mục đích.** Tìm các yêu cầu/nội dung được chốt trong ba báo cáo khảo sát đã diễn ra cùng/sau ngày chốt khung BRD v0.12 (17/06/2026) nhưng chưa được phản ánh vào BRD. **Tài liệu này chỉ đề xuất**, không sửa BRD; tuân thủ CLAUDE.md §0 (agent phân rã, không quyết định nội dung) và §0.3 (BA Lead quyết).
>
> **Phạm vi đối chiếu.** BRD-TOSS-001-khung v0.12 (§7, §8), PH1 v0.7, PH2 v0.6, PH4 v0.5, PH5 v0.5 (theo INDEX hiện hành). Đối chiếu danh mục tích hợp với bảng Google Sheet "Thông tin tích hợp" (24 luồng, pull 23/06/2026).
>
> **Quy ước trạng thái.** **COVERED** — đã có BR khớp; **PARTIAL** — có BR gần đúng nhưng thiếu chi tiết hoặc khía cạnh mới; **GAP** — chưa có BR nào trong BRD hiện hành.

---

## §1. Tóm tắt

| Báo cáo | Số chủ đề đối chiếu | COVERED | PARTIAL | GAP |
|---|---:|---:|---:|---:|
| Khảo sát 17/06/2026 (MEL/CDL · Aircraft List · AOG/MNT · Performance Factor) | 14 | 4 | 7 | 3 |
| Khảo sát 18/06/2026 (CLC & Điều phái — Monitoring, cảnh báo 7 nhóm) | 17 | 5 | 8 | 4 |
| Khảo sát 19/06/2026 (Tích hợp TOSS ↔ OPS++ — 24 luồng + SFTP + VPN) | 12 | 3 | 5 | 4 |
| **Tổng** | **43** | **12** | **20** | **11** |

Trong đó, đối chiếu chi tiết **24 luồng OPS++** (bảng Google Sheet "Thông tin tích hợp" pull 23/06/2026) với BR-528a…h và BR-530a…g cho thấy **11 luồng cụ thể chưa có BR đặc tả** (xem §3 phần B).

---

## §2. Ma trận đối chiếu

### §2.1. Báo cáo Khảo sát 17/06/2026 (MEL/CDL · Aircraft List · AOG/MNT · Performance Factor)

| STT | Chủ đề / Yêu cầu (trích nguồn) | BR liên quan | Trạng thái | Ghi chú phần thiếu |
|---|---|---|---|---|
| 1 | TOSS là đầu mối tích hợp AMOS cho MEL/CDL; OPS++ tiêu thụ MEL/CDL từ TOSS (giai đoạn sau) [17062026 §II.1; §III.1] | BR-530a (inbound AMOS → TOSS), BR-424, BR-427 (PH4) | **PARTIAL** | BR-530a đã có chiều inbound AMOS → TOSS, nhưng **chưa có BR cho chiều outbound MEL/CDL TOSS → OPS++** (TOSS là nguồn cấp lại) |
| 2 | Kiến trúc 2 tầng MEL: Master MEL (3.000 item/bộ, 5–6 cấp) + MEL Active (từ AMOS, cấp 3–4) [17062026 §II.2; §III.2] | BR-424, BR-427 (PH4) | **PARTIAL** | BR hiện chỉ nói "đọc XML MEL" và "đồng bộ MEL/CDL/Defect"; **chưa nêu rõ kiến trúc 2 tầng**, **cấp tối đa AMOS active**, **số lượng item dự kiến** |
| 3 | Master MEL lưu 2 lớp: nội dung gốc (nguyên văn nhà sản xuất) + bản biên soạn (metadata khai thác do FOE bổ sung) [17062026 §II.2; §III.3] | BR-424, BR-425 (PH4) | **GAP** | **Chưa có BR yêu cầu 2 lớp lưu trữ và cơ chế so sánh nội dung gốc cũ-mới để đánh dấu item thay đổi** (mục §III.9) |
| 4 | MEL item phân nhánh x1/x2/x3/x4 với penalty khác nhau (fuel factor, payload reduction, altitude cap, autopilot, airport limit); điều phái là người chọn nhánh áp dụng [17062026 §II.2; §III.4] | BR-424, BR-427 (PH4); BR-120, BR-121 (PH1) | **GAP** | **Chưa có BR mô tả nhánh penalty đa trường hợp và trách nhiệm quyết định của điều phái** |
| 5 | Cảnh báo điều phái khi MEL phát sinh/clear, kèm khuyến nghị làm lại OFP [17062026 §II.3; §III.5] | BR-121 (NAIL/CDL active period — PH1), BR-126a (thiếu tài liệu) | **PARTIAL** | BR-121 chỉ phủ NAIL/CDL; **chưa nêu trigger "MEL phát sinh/clear" và liên kết "làm lại OFP để tính lại nhiên liệu/tải"** |
| 6 | Màn warning tổng hợp theo chuyến bay (gom MEL + NOTAM + thời tiết + cảnh báo khác) [17062026 §II.3; §III.6] | BR-135 (Flight Detail — Warnings tab), BR-125 (Monitoring) | **COVERED** | BR-135 tab Warnings đã ghi nhận toàn bộ cảnh báo phát sinh từ đầu đến cuối chuyến |
| 7 | Dashboard MEL toàn đội tàu cho Trực ban trưởng, phục vụ BCAO; lọc bằng danh mục "MEL ảnh hưởng khai thác" của FOE [17062026 §II.3; §III.7] | BR-113 (giám sát trực ban trưởng — PH1) | **GAP** | **Chưa có BR cho dashboard MEL theo đội tàu + tích hợp danh mục "MEL ảnh hưởng khai thác" để feed BCAO** |
| 8 | Phương án nhập liệu Master MEL: bóc tách bán tự động (item code, tên, cột penalty) + nhập tay metadata theo nhánh; AI hỗ trợ 60–70% [17062026 §II.4; §III.8] | BR-424 (đọc XML MEL) | **PARTIAL** | BR-424 chỉ nói "đọc XML MEL"; **chưa nêu cơ chế bán tự động + AI extraction + giao diện nhập tay metadata cùng màn** |
| 9 | Lido Import file: mỗi item một dòng, cột penalty định lượng (p_tow, p_enrte_wt, p_perf_corr, p_altitude…), cờ thiết bị, cột action INSERT/UPDATE; vấn đề duplicate khi INSERT [17062026 §II.4] | (chưa có) | **GAP** | **Chưa có BR cho mapping Master MEL ↔ Lido Import file và xử lý cột action INSERT/UPDATE** |
| 10 | Aircraft list đồng bộ từ OPS++; TOSS không cho thêm mới tàu, chỉ xem chi tiết và sửa thuộc tính khai thác [17062026 §II.6; §III.14] | BR-406, BR-407, BR-408, BR-409, BR-410 (PH4) | **COVERED** | Bộ BR-406…BR-410 đã phủ thông tin chung, đa định danh, hiệu lực, sở hữu, thuộc tính khai thác |
| 11 | Cảnh báo tàu mới đồng bộ từ OPS++: đổi màu dòng + gửi email cho người quản lý [17062026 §II.6; §III.18] | BR-537 (PH5 — danh sách email), BR-403 (PH4 — versioning) | **PARTIAL** | Cơ chế email cảnh báo nói chung đã có (BR-537), nhưng **chưa có BR cụ thể "tàu mới đồng bộ → highlight + email"** |
| 12 | AOG/MNT Schedule lấy từ Netline (legtype=Z + FN_Carrier thuộc danh mục mã bảo dưỡng, loại trừ leg state cancel và standby) + chi tiết AMOS [17062026 §II.7; §III.20] | BR-419 (đồng bộ lịch bảo dưỡng AMOS), BR-528a (Netline) | **PARTIAL** | BR-419 chỉ nói "đồng bộ và lưu hiện trạng lịch bảo dưỡng"; **chưa có quy tắc lọc cụ thể (legtype=Z, FN_Carrier, loại standby) và mô hình màn AOG/MNT Schedule** |
| 13 | Danh mục mã bảo dưỡng (AOG/MNT Code): màn riêng, năm nhóm cố định (AOC, Định kỳ, Line check kỹ thuật, Bảo quản, Standby) [17062026 §II.8; §III.23, §III.24] | (chưa có) | **GAP** | **Chưa có BR cho danh mục AOG/MNT Code (5 nhóm cố định trong source code, CRUD cấp Code)** |
| 14 | Performance Factor: định hướng giảm tải nhập thủ công cho FOE, liên kết lịch bảo dưỡng (Engine Water Wash); chi tiết chưa rõ [17062026 §II.9; §III.25] | BR-428, BR-429, BR-430, BR-431 (PH4 — Nhóm E) | **COVERED** | BR-428…BR-431 đã phủ upload data, PF Data Period, fallback kỳ trước, cảnh báo thiếu PF |

### §2.2. Báo cáo Khảo sát 18/06/2026 (Centralized Load Control & Điều phái — Màn Monitoring)

| STT | Chủ đề / Yêu cầu (trích nguồn) | BR liên quan | Trạng thái | Ghi chú phần thiếu |
|---|---|---|---|---|
| 1 | Monitoring mặc định chỉ hiện chuyến bất thường; ẩn/hiện cột/dòng; lưu cấu hình theo user [18062026 §III.1] | BR-142 (PH1 — filter & cấu hình hiển thị), BR-507/508 (PH5) | **COVERED** | BR-142 + BR-507 đã phủ cấu hình hiển thị cá nhân, last-used filter |
| 2 | Quy ước 3 màu (đỏ/vàng/xanh) + "bình thường = gạch ngang/blank" áp dụng toàn cột cảnh báo [18062026 §III.2] | BR-138, BR-139 (PH1 — bộ mã màu 4 trạng thái), BR-523 (PH5) | **COVERED** | BR-138 chuẩn 4 trạng thái (đỏ/vàng/xanh lá/không màu); BR-139 quy tắc "xanh xuất hiện sau khi từng đỏ" |
| 3 | Hover làm sáng nhẹ, click làm sáng đậm; không phát âm thanh; cho phép nháy (blink) khi cảnh báo nghiêm trọng [18062026 §III.3] | BR-125 (PH1 — màu + nhấp nháy) | **PARTIAL** | BR-125 đã nói "kết hợp hiệu ứng nhấp nháy"; **chưa có BR mô tả hover/click highlight và xác nhận "không phát âm thanh"** |
| 4 | Nút Dispatch Release chỉ sáng khi đến giờ + đủ tài liệu + mọi cảnh báo nghiêm trọng đã xanh; chỉ một tập con cảnh báo dùng làm điều kiện chặn release [18062026 §III.4] | BR-160, BR-145 (PH1) | **PARTIAL** | BR-145 đã có cột Dispatch Release trên Monitoring; **chưa có BR đặc tả điều kiện sáng nút + danh sách cảnh báo chặn release** (open: cần liệt kê cụ thể — IV-2 báo cáo) |
| 5 | Mô hình tham số cảnh báo 2 mức thời gian: vàng tại 75'(nội)/90'(quốc tế), đỏ tại 60'(nội)/75'(quốc tế); trước mốc vàng giữ gạch ngang [18062026 §III.5] | BR-163 (PH1 — ngưỡng 210/75/60 và 270/90/75 cho OFP) | **PARTIAL** | BR-163 đã có khung mốc cho OFP; **chưa có BR cho mô hình 2 mức áp dụng đồng nhất nhóm Payload/DAO/Tài liệu/Tổ bay** với cặp tham số nội/quốc tế (TOSS-175/177 sheet-04) |
| 6 | Cảnh báo Payload: ngưỡng theo chặng × loại tàu × ngưỡng âm/dương × thời điểm hiệu lực; tab "Ngưỡng Payload" trong Quản lý chặng bay [18062026 §III.6] | BR-120 (PH1 — ngưỡng đa chiều loại tàu × khoảng giờ bay × ngưỡng trên/dưới) | **PARTIAL** | BR-120 chia theo khoảng giờ bay (<3h/3–6h/>6h); **báo cáo 18/06 yêu cầu chia theo chặng × loại tàu** (chiều khác). Cần **bổ sung BR cho tab "Ngưỡng Payload" trong Quản lý chặng bay** |
| 7 | Cảnh báo DAO không có ngưỡng (lệch là cảnh báo); tab "Ngưỡng DAO" với mặc định 0; nguồn DAO chuẩn từ FOEM, fallback file DOW [18062026 §III.7, §III.8] | BR-411 (PH4 — DOW theo giai đoạn), BR-528d (PH5 — FOEM/DOW data contract) | **PARTIAL** | BR-411 có DOW; data contract FOEM nói chung tại BR-528d. **Chưa có BR cho cảnh báo lệch DAO trong PH1 + tab "Ngưỡng DAO"** |
| 8 | Cảnh báo Fly Doc: chuyến thường (NOTAM + Weather), chuyến EDTO thêm (Plotting chart + Icing chart); thiếu tài liệu chặn Dispatch Release; nhận diện qua chuỗi tên file [18062026 §III.9] | BR-126a (thiếu tài liệu OFP/NOTAM/thời tiết — PH1), BR-249 (PH2 — đa định dạng) | **PARTIAL** | BR-126a nói chung "thiếu tài liệu OFP/NOTAM/thời tiết"; **chưa có BR đặc tả riêng cho chuyến EDTO (Plotting + Icing) và quy ước đặt tên file** (open: IV-5 báo cáo) |
| 9 | Cảnh báo Crew Download chỉ áp dụng cho PIC; cột "Crew Download" trên Monitoring [18062026 §III.10] | BR-126b (PH1 — tổ bay chưa tải tài liệu mới nhất) | **PARTIAL** | BR-126b đã có cảnh báo tổ bay chưa tải; **chưa giới hạn "chỉ PIC"** và **chưa đặc tả cột "Crew Download"** |
| 10 | Thứ tự cột Monitoring: Pilot Confirm → ATC → MEL/CDL; Crew CHG đặt sau ATC trước Payload [18062026 §III.11] | (chưa có) | **GAP** | **Chưa có BR cho thứ tự cột Monitoring cố định** (yếu tố UI/UX bắt buộc theo điều phái) |
| 11 | Cảnh báo OFP rỗng tổ bay (do AVES lỗi) đỏ theo mốc thời gian [18062026 §III.12] | BR-528b (AVES data contract — PH5) | **GAP** | **Chưa có BR cho phát hiện và cảnh báo "OFP rỗng tổ bay" tại PH1** |
| 12 | Cảnh báo MEL/CDL 3 lớp: AMOS → shortlist FOE trên Lido → MEL trong OFP; bắt cả 3 trường hợp thiếu/thừa/sai mã [18062026 §III.13] | BR-121 (cảnh báo NAIL/CDL active period — PH1), BR-427 (đồng bộ MEL/CDL — PH4) | **PARTIAL** | BR-121 chỉ phủ NAIL/CDL chung. **Chưa có BR cho mô hình 3 lớp đối chiếu AMOS ↔ shortlist FOE ↔ OFP và quy tắc thiếu/thừa/sai mã** |
| 13 | Cảnh báo ATC FPL phát sinh ngay khi có lệch (không phụ thuộc mốc thời gian) — 5 thành phần; matching chuỗi sâu hơn cho cập nhật một phần [18062026 §III.14] | BR-127 (cảnh báo "đã filed ATC FPL hay chưa" — PH1, Could) | **PARTIAL** | BR-127 chỉ phủ "đã filed hay chưa" (mức Could). **Chưa có BR cho so khớp 5 thành phần Filed ATC vs ATC FPL trong OFP + quy tắc cập nhật một phần** |
| 14 | Cảnh báo thời tiết theo Minima: vàng khi chạm margin, đỏ khi vi phạm; điều phái được phép sửa Minima trên giao diện điều phái (không phải FOE) [18062026 §III.15] | BR-119a (thời tiết en-route — PH1), BR-435 (PH4 — Weather Landing Minima), BR-530g (PH5 — ICON/Weather provider) | **PARTIAL** | BR-435 có Minima ở master; BR-119a có thời tiết en-route. **Chưa có BR cho cảnh báo 2 mức Minima trên Monitoring và quyền sửa Minima của điều phái** |
| 15 | Block Fuel, Pilot Confirm, Pilot AXA: hiển thị tối giản — chỉ hiện số khi vượt ngưỡng; hover xem nhanh, click xem chi tiết lịch sử [18062026 §III.16] | BR-165 (PIC Confirm — PH1), BR-135 (Flight Detail tab Flight Release) | **PARTIAL** | BR-165 có cột Pilot Confirm. **Chưa có BR đặc tả 3 cột nhiên liệu (Pilot Confirm/Pilot AXA/Block Fuel) trên Monitoring + quy tắc hover/click + quy tắc cảnh báo Pilot AXA** (Pilot AXA: open — IV-1 báo cáo) |
| 16 | Phương án dự phòng upload thủ công NOTAM/Weather khi Lido/AMOS lỗi [18062026 §III.17] | BR-249 (PH2 — upload thủ công), BR-174 (PH1 — backup khi Lido lỗi) | **COVERED** | BR-249 + BR-174 đã phủ |
| 17 | Duy trì song song hai màn: Monitoring (cảnh báo) + Flight Plan dạng danh sách (xem/thống kê OFP, lọc theo người làm, Block view, Taxi, CI…) [18062026 §III.18] | BR-101 (danh sách chuyến bay trực quan — PH1) | **GAP** | BR-101 có danh sách chuyến chung. **Chưa có BR cho màn "Flight Plan dạng danh sách" riêng biệt trong phân hệ Điều phái** (song song với Monitoring) |

### §2.3. Báo cáo Khảo sát 19/06/2026 (Tích hợp TOSS ↔ NetLine/OPS++)

| STT | Chủ đề / Yêu cầu (trích nguồn) | BR liên quan | Trạng thái | Ghi chú phần thiếu |
|---|---|---|---|---|
| 1 | Kết nối TOSS ↔ OPS++ là ưu tiên hàng đầu giai đoạn này; danh mục 24 luồng (17–22 inbound + 2–4 outbound) [19062026 §III.1, §III.8] | BR-528a (Netline data contract — PH5) | **PARTIAL** | BR-528a đã có data contract Netline/OPS++ ở mức chung; **chưa có bảng 24 luồng đặc tả từng dòng** (xem §3 phần B) |
| 2 | Phương thức truyền chính là SFTP; máy chủ SFTP đặt tại VNA, cấp Private Key + User Path cho LHS [19062026 §III.3, §III.4, §III.5] | BR-525 (API Gateway), BR-526 (file lớn), BR-527 (event/poll) | **PARTIAL** | BR-525–527 nói cơ chế chung; **chưa có BR đặc tả riêng cho kênh SFTP TOSS ↔ OPS++ với Private Key, User Path, VPN** |
| 3 | Cấu trúc thư mục chuẩn: mỗi đầu dữ liệu có 3 thư mục con Temp/Pickup/Archive; ghi 2 bước (Temp → Pickup) [19062026 §III.6] | (chưa có) | **GAP** | **Chưa có BR cho cấu trúc thư mục Temp/Pickup/Archive và quy tắc ghi 2 bước** |
| 4 | Nguyên tắc TOSS chủ động vươn ra lấy dữ liệu từ hệ thống nguồn (không phải nguồn đẩy vào TOSS); ngoại lệ cho SITA [19062026 §III.7] | BR-527 (chủ động theo sự kiện + poll/snapshot — PH5) | **PARTIAL** | BR-527 đã có nguyên tắc event/poll; **chưa nêu rõ vai trò TOSS là "puller" với ngoại lệ SITA (push tới TOSS)** |
| 5 | Outbound qua ISB của LHS (cổng tích hợp); ISB chỉ cho lấy dữ liệu cần cho báo cáo; cân nhắc phương án data duplicate sang DB trung gian NetLine [19062026 §II.2] | (chưa có) | **GAP** | **Chưa có BR cho ISB outbound và phương án data duplicate** |
| 6 | Phương thức kết nối mạng: VPN trên dải IP nội bộ; cấu hình dự kiến 24/06/2026 [19062026 §III.9, §III.10] | (chưa có) | **GAP** | **Chưa có BR cho VPN + dải IP nội bộ giữa TOSS và LHS** |
| 7 | Mốc 24/06/2026: cấu hình VPN; mốc 01/07/2026: hạn cuối hoàn thành máy chủ SFTP + cấu trúc thư mục [19062026 §III.10, §III.11] | (không thuộc BR — là kế hoạch dự án) | — | Mốc kế hoạch dự án; không yêu cầu BR; theo dõi qua OID/roadmap |
| 8 | Giai đoạn chuyển tiếp: TOSS sẵn sàng cả NetLine cũ và OPS++ mới; chuyển nguồn chỉ bằng 1 thao tác; cutover ~03/2027 [19062026 §III.13] | BR-540 (PH5 — migrate Netline), BR-541 (Flight List for Backup Tool — PH5) | **PARTIAL** | Migrate đã có; **chưa có BR cho cơ chế chuyển nguồn "1 thao tác" giữa NetLine cũ ↔ OPS++** trong giai đoạn dual-run |
| 9 | Phân biệt FFM (điện gửi từng thời điểm) vs Fuel Report (báo cáo cuối chuyến) — **FMM (Fuel Monitoring Message)** TOSS phải tự sinh vì OPS++ chưa có sẵn [19062026 §III.16; bảng tích hợp dòng 5] | (chưa có) | **GAP** | **Chưa có BR cho TOSS tự sinh FMM (Fuel Monitoring Message) gửi OPS++** |
| 10 | 4 điện văn vận hành đi qua SITA: MVT, MVA, DIV, LDM — chuyển sang OPS++ thông qua TOSS [19062026 §II.2; bảng tích hợp dòng 1–4] | BR-528a (Netline data contract), BR-525 (API Gateway) | **PARTIAL** | **Chưa có BR đặc tả từng điện văn SITA (MVT/MVA/DIV/LDM) và vai trò TOSS làm hub forward** |
| 11 | Sample điện và tài liệu chi tiết tổ chức theo từng luồng (mỗi luồng một thư mục); Excel làm bảng tổng hợp chung [19062026 §III.12] | (không thuộc BR — quy trình tài liệu) | — | Quy trình tài liệu nội bộ; không yêu cầu BR |
| 12 | Phần xử lý dữ liệu nội bộ TOSS sau khi nhận từ OPS++ **không thuộc phạm vi tích hợp NetLine** (lời VNA) [19062026 §III.14, §IV-9] | — | **PARTIAL — cần BA Lead chốt** | **VNA và TOSS cần thống nhất phạm vi**: việc TOSS xử lý dữ liệu inbound vẫn phải làm và phải có BR — câu hỏi là thuộc phạm vi tích hợp NetLine hay phạm vi nội bộ TOSS (xem §4) |

---

## §3. Khoảng trống đề xuất bổ sung BRD

> **Lưu ý.** Đây là **đề xuất từ agent BA dựa trên đối chiếu**. Việc đưa vào BRD và quyết định mã BR, ưu tiên MoSCoW, wording chính thức là **thẩm quyền BA Lead** (CLAUDE.md §0). Mã BR đề xuất dưới đây là số kế tiếp dựa trên dải hiện hành mỗi phân hệ; có thể đổi khi BA Lead quyết.

### A. GAP/PARTIAL từ Khảo sát 17/06 — MEL/CDL & Aircraft Management

| Đề xuất | PH | Mã BR đề xuất | Nội dung BR đề xuất | Nguồn |
|---|---|---|---|---|
| 1 | PH4 | BR-460 | Hệ thống phải lưu trữ Master MEL theo kiến trúc 2 lớp: lớp nội dung gốc (nguyên văn từ tài liệu nhà sản xuất, không chỉnh sửa) và lớp bản biên soạn (metadata khai thác do FOE bổ sung — fuel factor, payload reduction, altitude cap, autopilot limit, airport limit) phân theo nhánh penalty x1/x2/x3/x4… | [17062026 §II.2] |
| 2 | PH4 | BR-461 | Hệ thống phải cung cấp cơ chế so sánh nội dung gốc Master MEL giữa hai phiên bản (cũ vs mới do nhà sản xuất phát hành) và đánh dấu các item có nội dung gốc thay đổi để FOE chỉ cần rà soát phần biên soạn cho các item đó. | [17062026 §II.4, §III.9] |
| 3 | PH4 | BR-462 | Hệ thống phải quản lý MEL Active ở mức từng tàu cụ thể, đồng bộ từ AMOS với cấp item ở mức 3–4 (theo cấp AMOS active); cấp tối đa AMOS active xác nhận thêm với nhóm AMOS/VICO. | [17062026 §II.2, §III.10] |
| 4 | PH1 | BR-193 | Hệ thống phải sinh cảnh báo cho điều phái khi một MEL item mới được AMOS active hoặc được clear; cảnh báo phải đến trước thời điểm khởi hành đủ thời gian cho điều phái làm lại OFP để tính lại nhiên liệu và tải bị ảnh hưởng. | [17062026 §II.3, §III.5] |
| 5 | PH1 | BR-194 | Hệ thống phải cung cấp dashboard MEL toàn đội tàu cho trực ban trưởng phục vụ Báo cáo Khai thác Hàng ngày (BCAO); lọc bằng danh mục "MEL ảnh hưởng khai thác" do FOE duy trì, đồng thời cho phép bộ lọc bổ sung trên tập MEL active của AMOS. | [17062026 §II.3, §III.7] |
| 6 | PH4 | BR-463 | Hệ thống phải hỗ trợ nhập liệu Master MEL bán tự động: bóc tách tự động các trường có cấu trúc (item code, tên item, các cột penalty định lượng — sử dụng AI hỗ trợ mức 60–70%) kết hợp nhập tay metadata theo nhánh x1/x2/x3 trên màn hình có hiển thị nội dung gốc cùng vị trí. | [17062026 §II.4, §III.8] |
| 7 | PH5 | BR-556 | Hệ thống phải duy trì luồng dữ liệu outbound chuyển MEL/CDL đã chuẩn hóa từ TOSS sang OPS++ ở giai đoạn OPS++ triển khai sau; phương thức trao đổi và lịch đồng bộ chốt khi OPS++ vào pha tích hợp. | [17062026 §II.1, §III.1] |
| 8 | PH4 | BR-464 | Hệ thống phải quản lý danh mục mã bảo dưỡng (AOG/MNT Code) là một màn hình riêng cho phép thêm/sửa/xoá/lọc các mã FN_Carrier theo Code và Group; cố định 5 nhóm trong mã nguồn: AOC, Định kỳ, Line check kỹ thuật, Bảo quản, Standby. | [17062026 §II.8, §III.23, §III.24] |
| 9 | PH4 | BR-465 | Hệ thống phải cung cấp màn hình AOG/MNT Schedule lọc các kỳ bảo dưỡng từ Netline theo quy tắc: legtype = Z VÀ FN_Carrier thuộc danh mục AOG/MNT Code, loại trừ leg state cancel và các bản ghi standby; bộ lọc gồm Base, AC registration, Code, Group code, From – To. Chi tiết hạng mục công việc (service order/work order/task) lấy từ AMOS khi xem chi tiết. | [17062026 §II.7, §III.20, §III.21] |
| 10 | PH1 | BR-195 | Hệ thống phải sinh cảnh báo "Tàu mới đồng bộ từ OPS++" trên màn Aircraft list bằng cách đổi màu dòng và gửi email tới người quản lý đã cấu hình (danh sách email quản trị tập trung tại PH5 BR-537). | [17062026 §II.6, §III.18] |

### B. GAP/PARTIAL từ Khảo sát 19/06 — 24 luồng OPS++ (so sánh từng luồng vs BR-528/530)

> Phân tích từng dòng trong bảng "Thông tin tích hợp" (Google Sheet, pull 23/06/2026) so với BR hiện hành.

#### B.1 — Inbound vào OPS++ (24 luồng đi qua TOSS hoặc trực tiếp)

| # | Luồng | Phương thức | Nguồn | Đang triển khai | BR hiện hành | Trạng thái |
|---|---|---|---|---|---|---|
| 1 | **MVT** (điện vận hành) | TOSS forward, SFTP+Email | SITA | TOSS | BR-528a (Netline chung), BR-527 (SITA chung) | **GAP** — cần BR riêng cho TOSS làm hub forward 4 điện SITA |
| 2 | **MVA** | TOSS, SFTP | SITA | TOSS | nt | **GAP** |
| 3 | **DIV** (Divert) | TOSS, SFTP+Email | SITA | TOSS | BR-117 (PH1 cảnh báo Divert), BR-528a | **PARTIAL** — có cảnh báo Divert nội bộ, **chưa có BR outbound DIV → OPS++** |
| 4 | **LDM** (Load Message) | TOSS, SFTP+Email | SITA | TOSS — **Missing** | (chưa có BR riêng) | **GAP** — luồng đang Missing, cần BR |
| 5 | **FMM** (Fuel Monitoring Message) | TOSS tự sinh | TOSS | Đã có | (chưa có BR — TOSS phải tự sinh) | **GAP** — BR đề xuất ở §3.C |
| 6 | **SSIM** (lịch mùa) | TOSS forward, SFTP | Sabre | TOSS — **Missing** | BR-528a (SSIM/ASM/SSM nêu chung) | **PARTIAL** — đã nêu chung, **chưa đặc tả luồng SSIM cụ thể** |
| 7 | **PTM** (khách nối chuyến) | TOSS, mỗi 5'/lần cho chuyến 48h tới | AMADEUS | TOSS | BR-528e (Amadeus PSS) | **PARTIAL** — chưa có quy tắc tần suất 5'/lần và 48h window |
| 8 | **ADL** (cập nhật PNL) | TOSS, 1 lần/ngày | AMADEUS | TOSS | nt | **PARTIAL** |
| 9 | **PNL** (danh sách khách booking) | TOSS, 1 lần T-30 | AMADEUS | TOSS | nt | **PARTIAL** |
| 10 | **Fuel Report** (cuối chuyến) | TOSS tự sinh | TOSS | Đã có | (chưa có BR) | **GAP** |
| 11 | **Pax Detail** | TOSS | AMADEUS | TOSS | BR-528e | **PARTIAL** |
| 12 | **Crew Assignment** | TOSS | AVES | TOSS | BR-528b (AVES) | **PARTIAL** — chưa đặc tả format đẩy sang OPS++ |
| 13 | **Gate Info** | TOSS | VMS | TOSS — **Missing** | BR-528f (VMS/VIAGS) | **PARTIAL** — đang Missing |
| 14 | **DFLT** (thông tin chuyến bay hàng ngày) | Trực tiếp Lido ↔ OPS++ | LIDO | LHS nội bộ | BR-528c (Lido Flight 4D) | **COVERED** — nằm ngoài phạm vi TOSS |
| 15 | **Flight data (ACDM)** | TOSS | ACDM | TOSS — **Missing** | BR-530d (A-CDM 16 mốc) | **PARTIAL** — A-CDM đã có inbound; **chưa có BR outbound TOSS → OPS++** |
| 16 | **Final MVT** | Trực tiếp Lido ↔ OPS++ | LIDO | LHS nội bộ | BR-528c | **COVERED** |
| 17 | **Metar** | Trực tiếp Lido ↔ OPS++ | LIDO | LHS nội bộ | BR-528c, BR-530g | **COVERED** |
| 18 | **NOTAM** | Trực tiếp hoặc qua TOSS | LIDO | LHS nội bộ + TOSS | BR-118 (NOTAM PH1), BR-528c | **PARTIAL** — chưa có BR đẩy NOTAM TOSS → OPS++ |
| 19 | **OFP** | Trực tiếp Lido ↔ OPS++ | LIDO | LHS nội bộ | BR-528c | **COVERED** |
| 20 | **Ground Event** (lịch Maintenance) | Trực tiếp AMOS ↔ OPS++ | AMOS | LHS nội bộ | BR-528d | **COVERED** |
| 21 | **MEL Item** | Trực tiếp AMOS ↔ OPS++ | AMOS | LHS nội bộ | BR-528d, BR-530a | **COVERED** *(nhưng mâu thuẫn với 17/06: TOSS là hub forward MEL/CDL sang OPS++; xem §4 phần D-2)* |
| 22 | **Cargo** | TOSS | Cargo Spot | TOSS — **Missing** | BR-528g (Cargo Spot) | **PARTIAL** — Should priority; đang Missing |
| 23 | **Crew connection** (tổ bay nối chuyến) | TOSS | AVES | TOSS — **Missing** | BR-528b | **GAP** — chưa có BR riêng cho Crew connection |
| 24 | **ATC FPL** | Trực tiếp Lido ↔ OPS++ | LIDO | LHS nội bộ — **Missing** | BR-127 (cảnh báo filed ATC), BR-528c | **PARTIAL** |

#### B.2 — Outbound từ OPS++

| # | Luồng | Phương thức | Đích | Triển khai | BR hiện hành | Trạng thái |
|---|---|---|---|---|---|---|
| 1 | **Leg Detail AMOS** | Trực tiếp AMOS ↔ OPS++ | AMOS | LHS nội bộ | BR-528d | **COVERED** |
| 2 | **Leg Detail LIDO** | Trực tiếp Lido ↔ OPS++ | LIDO | LHS nội bộ — **Missing** | BR-528c | **PARTIAL** |
| 3 | **ASM** (điện schedule) | TOSS forward | SITA | TOSS — Đã có nhưng **Missing đích** | BR-528a (SSIM/ASM/SSM) | **PARTIAL** |
| 4 | **ACH** | TOSS forward | SITA | TOSS — **Missing** | BR-528a | **PARTIAL** |

**Tổng kết B**: Trong 24 luồng inbound + 4 luồng outbound = **28 luồng**, có khoảng **11 luồng GAP/PARTIAL nghiêm trọng** chưa có BR đặc tả riêng: MVT, MVA, LDM, FMM, Fuel Report, Crew connection, DIV outbound, ASM/ACH outbound, NOTAM outbound TOSS→OPS++, Flight data ACDM outbound.

#### Đề xuất BR mới cho PH5

| Đề xuất | PH | Mã BR đề xuất | Nội dung BR đề xuất | Nguồn |
|---|---|---|---|---|
| 1 | PH5 | BR-557 | Hệ thống phải hoạt động như **hub forward** cho 4 điện văn SITA (MVT, MVA, DIV, LDM) đi qua TOSS và chuyển vào OPS++ ngay khi có cập nhật từ SITA; lưu Archive copy phục vụ truy vết. | [19062026 §II.2; bảng tích hợp dòng 1–4] |
| 2 | PH5 | BR-558 | Hệ thống phải **tự sinh điện FMM (Fuel Monitoring Message)** từ dữ liệu tổng hợp các nguồn (Lido, ACARS, AMOS) và đẩy sang OPS++ qua SFTP theo lịch chốt với LHS. | [19062026 §II.2, §III.16; bảng tích hợp dòng 5] |
| 3 | PH5 | BR-559 | Hệ thống phải **tự sinh Fuel Report** (gồm nhiên liệu đã tiêu thụ + điện summary OUT/ON/IN) một lần sau khi chuyến bay kết thúc và đẩy sang OPS++. | [19062026 §II.2; bảng tích hợp dòng 10] |
| 4 | PH5 | BR-560 | Hệ thống phải triển khai **máy chủ SFTP đặt tại hạ tầng VNA** với cơ chế xác thực Private Key + User Path; cấu trúc thư mục mỗi đầu dữ liệu gồm 3 thư mục con Temp/Pickup/Archive; cơ chế ghi 2 bước (ghi vào Temp rồi sao chép sang Pickup) để tránh đọc tệp dở. | [19062026 §III.6] |
| 5 | PH5 | BR-561 | Hệ thống phải kết nối với hạ tầng Lufthansa Systems qua **VPN trên dải IP nội bộ** giữa VNA và LHS. | [19062026 §III.9] |
| 6 | PH5 | BR-562 | Hệ thống phải hỗ trợ **chế độ dual-source** trong giai đoạn chuyển tiếp NetLine cũ ↔ OPS++ mới (dự kiến cutover ~03/2027): cho phép chuyển nguồn lấy dữ liệu chỉ bằng một thao tác cấu hình, không cần triển khai lại. | [19062026 §III.13] |
| 7 | PH5 | BR-563 | Hệ thống phải đặc tả luồng **outbound qua ISB của Lufthansa Systems** (phương thức: API/Web Service/Queue/FTP) cho phần dữ liệu cần thiết phục vụ báo cáo; phối hợp với phương án data duplicate sang DB trung gian NetLine cho phần còn lại. | [19062026 §II.2] |
| 8 | PH5 | BR-564 | Hệ thống phải đặc tả các luồng **PTM/PNL/ADL** với quy tắc tần suất chốt cùng LHS: PTM mỗi 5 phút cho chuyến trong 48h tới, PNL 1 lần ở mốc T-30 ngày, ADL 1 lần/ngày sau PNL. | [19062026 §II.2; bảng tích hợp dòng 7–9] |
| 9 | PH5 | BR-565 | Hệ thống phải đặc tả luồng **Crew connection** (tổ bay nối chuyến) từ AVES qua TOSS sang OPS++; hiện đang Missing trong bảng tích hợp. | [bảng tích hợp dòng 23] |
| 10 | PH5 | BR-566 | Hệ thống phải đặc tả luồng **outbound điện ASM, ACH** từ TOSS qua SITA tới các bên thứ ba; hiện ASM Đã có nhưng đích Missing, ACH Missing. | [bảng tích hợp Outbound dòng 3–4] |

### C. GAP/PARTIAL từ Khảo sát 18/06 — Centralized Load Control & Điều phái

| Đề xuất | PH | Mã BR đề xuất | Nội dung BR đề xuất | Nguồn |
|---|---|---|---|---|
| 1 | PH1 | BR-196 | Hệ thống phải áp dụng **mô hình tham số cảnh báo 2 mức thời gian** đồng nhất cho các nhóm OFP/Payload/DAO/Tài liệu/Tổ bay: mức vàng tại 75 phút (quốc nội) hoặc 90 phút (quốc tế) trước STD, mức đỏ tại 60 phút (quốc nội) hoặc 75 phút (quốc tế) trước STD; trước mốc vàng giữ trạng thái bình thường (gạch ngang). Mỗi nhóm có cặp tham số quốc nội/quốc tế riêng, cấu hình linh hoạt. | [18062026 §III.5] |
| 2 | PH1 | BR-197 | Hệ thống phải đặc tả **điều kiện sáng nút Dispatch Release** đa điều kiện: (1) đã đến giờ thực hiện; (2) đã đủ tài liệu chuyến bay; (3) tàu bay khớp; (4) không còn cảnh báo ETD vượt 30 phút (nếu ATD trên 30 phút phải chạy lại OFP); (5) tổ bay đúng theo OFP; (6) Pilot Confirm đã xác nhận. Tập con cảnh báo "chặn release" cấu hình được theo rule, tinh chỉnh sau khi vào khai thác thực tế. | [18062026 §III.4] |
| 3 | PH1 | BR-198 | Hệ thống phải cung cấp **tab "Ngưỡng Payload"** trong phân hệ Quản lý chặng bay cho phép khai báo ngưỡng dung sai chênh lệch Payload theo chặng × loại tàu × ngưỡng âm/dương × thời điểm hiệu lực. | [18062026 §III.6] |
| 4 | PH1 | BR-199 | Hệ thống phải sinh **cảnh báo lệch DAO** theo nguyên tắc "lệch là cảnh báo" giữa DAO trên OFP và Actual DAO từ CLC; cho phép khai báo ngưỡng linh hoạt trong tab "Ngưỡng DAO" của phân hệ Quản lý chặng bay với mặc định bằng 0; nguồn DAO chuẩn lấy từ FOEM (xem PH5 BR-528d), fallback file DOW khi FOEM chưa sẵn sàng. | [18062026 §III.7, §III.8] |
| 5 | PH2 | BR-262 | Hệ thống phải mở rộng **cảnh báo thiếu tài liệu Fly Doc** cho **chuyến EDTO**: ngoài NOTAM + Weather (chung mọi chuyến), chuyến EDTO bắt buộc thêm **Plotting chart và Icing chart**. Nhận diện loại tài liệu qua chuỗi ký tự trong tên file (chứa "plotting" hoặc "icing"); cần chốt quy ước đặt tên với điều phái. Thiếu tài liệu chặn Dispatch Release. | [18062026 §III.9] |
| 6 | PH1 | BR-200 | Hệ thống phải **giới hạn cảnh báo Crew Download chỉ áp dụng cho PIC** (chỉ cần PIC tải tài liệu là đủ điều kiện Captain's Release); hiển thị qua cột "Crew Download" trên màn Monitoring. | [18062026 §III.10] |
| 7 | PH1 | BR-201 | Hệ thống phải áp dụng **thứ tự cột Monitoring cố định** đối với nhóm cột cảnh báo cốt lõi: Pilot Confirm → ATC → Crew CHG → Payload → MEL/CDL (Crew CHG đặt sau ATC và trước Payload); thứ tự này có thể tinh chỉnh sau workshop. | [18062026 §III.11] |
| 8 | PH1 | BR-202 | Hệ thống phải sinh **cảnh báo "OFP rỗng tổ bay"** (đỏ tại cột tổ bay theo mốc thời gian) khi hệ thống AVES bị lỗi không trả tổ bay sang OFP. | [18062026 §III.12] |
| 9 | PH1 | BR-203 | Hệ thống phải triển khai **cảnh báo MEL/CDL 3 lớp**: (1) lấy danh sách MEL của tàu từ AMOS cho chuyến đang xét; (2) lọc theo danh mục shortlist MEL của FOE trên Lido; (3) so sánh shortlist với danh mục MEL trong OFP. Kích hoạt cảnh báo trong cả ba trường hợp: OFP thiếu MEL, OFP dư MEL, sai mã MEL. | [18062026 §III.13] |
| 10 | PH1 | BR-204 | Hệ thống phải mở rộng **cảnh báo ATC FPL** (BR-127 hiện hành) lên Must và đặc tả 5 thành phần cần so khớp giữa Filed ATC và ATC FPL trong OFP; cảnh báo phát sinh ngay khi có lệch (không phụ thuộc mốc thời gian); xây thuật toán matching chuỗi sâu hơn để nhận biết cập nhật một phần (đổi điểm route, đổi fly level). | [18062026 §III.14] |
| 11 | PH1 | BR-205 | Hệ thống phải sinh **cảnh báo thời tiết theo Minima sân bay** 2 mức (vàng khi METAR/TAF chạm margin, đỏ khi vi phạm Minima) cho cả chuyến sắp khởi hành và chuyến đang bay có estimate arrival gần sân chạm Minima; cho phép **điều phái sửa Minima trên giao diện điều phái** (FOE không trực tiếp sửa trên giao diện này). | [18062026 §III.15] |
| 12 | PH1 | BR-206 | Hệ thống phải hiển thị **3 cột nhiên liệu trên Monitoring** với nguyên tắc tối giản: Pilot Confirm (trạng thái phi công xác nhận release), Pilot AXA (chênh lệch dầu phi công lấy thêm kèm lý do), Block Fuel (chỉ hiện số khi vượt ngưỡng); hover hiển thị nhanh, click mở chi tiết lịch sử cập nhật. Quy tắc cảnh báo cụ thể cho Pilot AXA cần làm rõ thêm. | [18062026 §III.16] |
| 13 | PH1 | BR-207 | Hệ thống phải cung cấp **màn "Flight Plan dạng danh sách"** song song với màn Monitoring trong phân hệ Điều phái, dành cho tra cứu và thống kê OFP (lọc theo người làm OFP, theo trạng thái, hiển thị Block view/Taxi/CI…); dùng chung dữ liệu nhưng khác mục đích — Monitoring tập trung cảnh báo, Flight Plan tập trung xem/thống kê. | [18062026 §III.18] |

---

## §4. Điểm cần BA Lead quyết

| # | Điểm cần quyết | Bối cảnh & lựa chọn |
|---|---|---|
| **D-1** | **Phạm vi BR cho 11 GAP nghiêm trọng trong 24 luồng OPS++** (xem §3.B). | Bảng tích hợp pull 23/06/2026 cho thấy nhiều luồng vẫn ở trạng thái "Missing" và một số chỉ ghi chung BR-528a (Netline). Cần BA Lead quyết: (a) bổ sung BR atomic cho từng luồng (BR-557…566) hay (b) giữ ở mức data contract chung BR-528a/530 và đẩy chi tiết sang SRS/Tài liệu tích hợp. |
| **D-2** | **Mâu thuẫn nguồn cấp MEL/CDL cho OPS++**. | (i) Báo cáo 17/06 chốt: TOSS là đầu mối tích hợp AMOS, sau đó cấp lại MEL/CDL cho OPS++ [17062026 §II.1, §III.1]. (ii) Bảng tích hợp (pull 23/06) ghi MEL Item và Ground Event là "Kết nối trực tiếp AMOS – NetOps++", **không qua TOSS** [bảng tích hợp dòng 20–21]. Hai nguồn xung đột — cần BA Lead chốt với VNA. |
| **D-3** | **Phạm vi "xử lý dữ liệu nội bộ TOSS sau khi nhận từ OPS++"**. | VNA tuyên bố "không thuộc scope dự án tích hợp NetLine" [19062026 §III.14, §IV-9]. Cần BA Lead chốt: phần xử lý này thuộc phạm vi BRD TOSS (cần BR) hay tách dự án riêng. |
| **D-4** | **Hạ ưu tiên BR-127 từ Could → Must** dựa trên 18/06. | BR-127 (cảnh báo "đã filed ATC FPL hay chưa") hiện ở Could (sau Validation Agent 3 G1). Báo cáo 18/06 §III.14 yêu cầu cảnh báo 5 thành phần ATC FPL ngay khi có lệch — mức nghiệp vụ Must. Cần BA Lead quyết review lại ưu tiên. |
| **D-5** | **Khung 2 mức thời gian thống nhất** vs **mốc OFP 3 mức hiện có (210/75/60 và 270/90/75)** tại BR-163. | Báo cáo 18/06 đề xuất khung 2 mức (vàng 75/90, đỏ 60/75) áp dụng đồng nhất cho 5 nhóm cảnh báo (OFP/Payload/DAO/Tài liệu/Tổ bay). BR-163 hiện có thêm mốc 210/270 (bắt đầu lưu ý) cho OFP. Cần BA Lead chốt: (a) giữ song song hai khung, (b) thống nhất khung 2 mức cho tất cả, hay (c) khung 3 mức cho OFP + khung 2 mức cho các nhóm còn lại. |
| **D-6** | **Cutover NetLine cũ → OPS++ năm chính xác**. | Báo cáo 19/06 ghi "khoảng tháng 3" nhưng năm chưa rõ (`[cần xác nhận năm]`); ước tính 03/2027. Cần BA Lead xác nhận với anh Nam (VNA) để chốt mốc trong BRD/roadmap. |
| **D-7** | **Năm nhóm cố định AOG/MNT Code** vs khả năng mở rộng. | Báo cáo 17/06 §III.24 chốt 5 nhóm cố định trong source code (AOC/Định kỳ/Line check kỹ thuật/Bảo quản/Standby), thêm nhóm mới phải phát triển bổ sung. Cần BA Lead xác nhận: cứng 5 nhóm này có chấp nhận được dài hạn hay cần codeset mở rộng được? |
| **D-8** | **Quy ước đặt tên file Plotting chart / Icing chart**. | Báo cáo 18/06 §IV-5 để mở: dự án sẽ thống nhất quy ước nào (chứa chuỗi "plotting"/"icing")? Cần BA Lead chốt trước khi triển khai (ảnh hưởng BR-262 đề xuất). |
| **D-9** | **Phạm vi tham gia của ASM/ACH/SSIM/SITA** trong các BR PH5. | BR-528a hiện gộp tất cả "Netline, SSIM/ASM/SSM" làm một. Báo cáo 19/06 + bảng tích hợp cho thấy ASM (Đã có) và ACH (Missing) đều là outbound qua TOSS riêng biệt với SSIM (inbound qua TOSS). Cần BA Lead quyết tách BR-528a thành các BR atomic ASM/ACH/SSIM riêng (đề xuất BR-566). |
| **D-10** | **BR cho cấu trúc thư mục SFTP Temp/Pickup/Archive** là **BR functional** hay **NFR/kỹ thuật**. | Đề xuất BR-560 ở §3.B. Tính chất kỹ thuật mạnh — có thể chỉ cần ghi vào tài liệu thiết kế tích hợp thay vì BRD. BA Lead quyết mức tài liệu phù hợp. |

---

## §5. Tham chiếu

- BRD khung: `ba/workspace/drafts/brd/BRD-TOSS-001-khung-v0.12.md`
- BRD PH1 v0.7: `ba/workspace/drafts/brd/BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.7.md` (BR-101…BR-192 — 75 BR)
- BRD PH2 v0.6: `ba/workspace/drafts/brd/BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.6.md` (BR-201…BR-261 — 59 BR)
- BRD PH4 v0.5: `ba/workspace/drafts/brd/BRD-TOSS-PH4-quan-ly-danh-muc-v0.5.md` (BR-401…BR-459 — 69 BR)
- BRD PH5 v0.5: `ba/workspace/drafts/brd/BRD-TOSS-PH5-quan-tri-he-thong-v0.5.md` (BR-501…BR-555, gồm 528a–h và 530a–g — 68 BR)
- Báo cáo Khảo sát 17/06: `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-17062026-v0.3.md`
- Báo cáo Khảo sát 18/06: `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-18062026-v0.1.md`
- Báo cáo Khảo sát 19/06: `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-19062026-v0.1.md`
- Bảng "Thông tin tích hợp" (pull 23/06/2026, 24 luồng): `ba/workspace/drafts/phan-tich/01-nguon/TOSS-Thong-tin-tich-hop-OpsPlus.extracted.md`
