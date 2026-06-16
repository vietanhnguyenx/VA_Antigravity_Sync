---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.3"
date: "2026-06-12"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH4"
parent_document: "BRD-TOSS-PH4-quan-ly-danh-muc-v0.1.md"
parent_section: "§7.4 Phân hệ 4 — Quản lý danh mục (Master Data)"
---

# Phân rã Yêu cầu nghiệp vụ (BR) xuống Yêu cầu chức năng (FUNC) — Phân hệ 4: Quản lý danh mục (Master Data)

> **Phiên bản này (v0.3 — 2026-06-12):** bổ sung phân rã FUNC cho 12 BR mới của Phân hệ 4 trong `BRD-TOSS-001-khung-v0.4.md` §7.4: BR-421 (trạng thái tàu/overflow), BR-422 (cấu hình ghế thay thế — STD_VERSION + alternative), BR-423 (AC_INDEX và cỡ tổ bay tiêu chuẩn), BR-424 (năng lực thiết bị: ILS/AUTOLAND/ACARS/SPECIAL_EQUIPMENT), BR-425 (NOISE/RADIO/PHONE), BR-426 (AP_RESTRICTION), BR-427 (golden record FIMS + Netline + codeset), BR-428 (Included Baggage Allowance), BR-429 (Sector Groups by FH), BR-430 (Scheduled TAT), BR-431 (Commercial Config), BR-432 (Planned Version). Giữ nguyên toàn bộ phần phân rã BR-401 … BR-420 đã có ở v0.2 làm lịch sử. Bản v0.1 (`PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.1.md`) và bản v0.2 (`PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.2.md`) được lưu lại làm bản gốc.

## Mục đích và phạm vi

Tài liệu phân rã trung thực các Yêu cầu nghiệp vụ (BR — Business Requirement) thuộc **Phân hệ 4 — Quản lý danh mục (Master Data)** đã ghi nhận tại `BRD-TOSS-PH4-quan-ly-danh-muc-v0.1.md` (BR-401 … BR-432; §7.4 từ `BRD-TOSS-001-khung-v0.6.md`) xuống lớp **Yêu cầu chức năng (FUNC — Functional Requirement)**. Mỗi FUNC bám sát nội dung nguồn đã được trích dẫn, không suy diễn ngoài nguồn, không bịa thêm danh mục/thuộc tính.

## Nguyên tắc phân rã (CLAUDE.md §0 — bắt buộc)

1. **Chỉ phân rã và lắp ráp trung thực** từ nội dung do con người đã ghi nhận (Đề xuất giải pháp kỹ thuật v0.3 §II.4; Báo cáo khảo sát 09/06/2026 §II.1, II.5, II.6; BRD-TOSS-001 §7.4). Không suy diễn, không "hoàn thiện" logic, không bịa danh mục/thuộc tính.
2. **Mỗi FUNC truy vết về một BR cha** thuộc Phân hệ 4 và trích nguồn cụ thể (tài liệu, mục, trang/đoạn).
3. **Khi nguồn không bao phủ một khía cạnh nào**, ghi "(chưa có nguồn — cần SME bổ sung)" thay vì tự sinh nội dung.
4. **Bảo toàn các cờ `[cần xác nhận]`** đã có ở BR cha (ví dụ: Damp Lease trong BR-405).
5. **Thuật ngữ kỹ thuật** giữ tiếng Anh trong ngoặc đơn ở lần xuất hiện đầu tiên.

## Nguồn nguyên thủy đã đối chiếu

| Mã nguồn | Tài liệu | Mục đã đọc |
|---|---|---|
| NG-1 | `BRD-TOSS-PH4-quan-ly-danh-muc-v0.1.md` | BR-401 … BR-432 (§7.4 từ `BRD-TOSS-001-khung-v0.6.md`) |
| NG-2 | `vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/04-phan-he-quan-ly-danh-muc.md` (Đề xuất §II.4, trang 18–20) | Toàn bộ |
| NG-3 | `BAO-CAO-KHAO-SAT-09062026-v0.2.md` | §II.1 Cây menu và danh mục chức năng; §II.5 Quản lý tàu bay; §II.6 Quản lý sân bay và cảnh báo dịch vụ |
| NG-4 | `BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md` | §II.9 Bảng dầu (AHM); §II.11 Phép bay; §II.12 Chứng chỉ tổ bay theo sân bay đặc biệt; §II.14 Standard Taxi Time |
| NG-5 | `BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md` | §II.2 Cảnh báo chuyến không thường lệ thiếu STS/HEAD (cơ sở danh mục Flight Type Code) |
| NG-6 | `ba/workspace/drafts/phan-tich/customer-docs-source/Aircraft_Netline.extracted.md` | Header 39 cột Netline (AC_STATE, REMARK, STD_VERSION, STD_VERSION_ALT_1..4, AC_INDEX, CREWSIZE_COCKPIT/CABIN, ILS_EQUIPMENT, AUTOLAND, ACARS, SPECIAL_EQUIPMENT, NOISE, RADIO, PHONE, AP_RESTRICTION, AC_SUBTYPE…) và mẫu dữ liệu |
| NG-7 | `ba/workspace/drafts/phan-tich/customer-docs-source/Aircraft_FIMS.extracted.md` | Header 21 cột FIMS (AC_REG, AC_TYPE, AC_SUBTYPE, SEAT, C_CLASS/WY_CLASS, AC_TYPE_1, AC_MODEL, AC_TYPE_ICAO, MTOW_CONFIG, MAX_PAYLOAD, TANK_CAPACITY, SUB_GROUP…) và mẫu dữ liệu |
| NG-8 | `ba/workspace/drafts/phan-tich/yckt-trien-khai/sheet-04-yckt-v3.md` | Dòng 206 (Included Baggage Allowance), 207 (Sector Groups by FH), 208 (Scheduled TAT), 209 (Commercial Config), 235 (Planned Version) |

---

## 1. Bảng phân rã BR → FUNC

### 1.1 BR-401 — Tổ chức phân hệ danh mục tách biệt (Single Source of Truth)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-401-01 | Tổ chức phân hệ Quản lý danh mục thành module riêng, tách biệt với các module nghiệp vụ, đóng vai trò nguồn sự thật duy nhất (Single Source of Truth) cho dữ liệu danh mục dùng chung của hệ thống. | BR-401 | NG-2 §II.4 đoạn mở đầu; NG-1 §7.4 BR-401 |
| FUNC-401-02 | Bố trí phần bảo trì danh mục thành một menu riêng, đặt cùng cấp với menu quản trị hệ thống và menu giám sát dữ liệu, do khối lượng dữ liệu danh mục lớn. | BR-401 | NG-3 §II.1 (Kết quả: thống nhất tách bảo trì danh mục thành menu riêng); NG-1 §7.4 BR-401 |

### 1.2 BR-402 — Cấu trúc Metadata chuẩn cho mọi danh mục

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-402-01 | Định nghĩa mọi bản ghi danh mục theo cấu trúc Metadata chuẩn hóa thống nhất toàn hệ thống. | BR-402 | NG-2 §II.4 — Cấu trúc Metadata chuẩn |
| FUNC-402-02 | Cho phép phân loại bản ghi danh mục theo lĩnh vực, theo nghiệp vụ, hoặc theo hệ thống sử dụng để tối ưu hóa việc quản lý. | BR-402 | NG-2 §II.4 — Cấu trúc Metadata chuẩn |

### 1.3 BR-403 — Quản lý phiên bản (Versioning) cho từng bản ghi danh mục

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-403-01 | Lưu trữ đầy đủ lịch sử thay đổi cho từng bản ghi danh mục, ghi nhận: ai thay đổi, nội dung thay đổi là gì, thời điểm cập nhật. | BR-403 | NG-2 §II.4 — Quản lý phiên bản (Versioning) |
| FUNC-403-02 | Cho phép truy xuất trạng thái dữ liệu danh mục tại bất kỳ thời điểm nào trong quá khứ. | BR-403 | NG-2 §II.4 — Quản lý phiên bản (Versioning) |

### 1.4 BR-404 — Đồng bộ chủ động qua API/Webhook và phân quyền truy cập

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-404-01 | Cung cấp và đẩy dữ liệu danh mục cho các hệ thống vệ tinh qua API. | BR-404 | NG-2 §II.4 — Đồng bộ hóa dữ liệu chủ động |
| FUNC-404-02 | Cung cấp và đẩy dữ liệu danh mục qua cơ chế Webhook ngay khi phát sinh thay đổi. | BR-404 | NG-2 §II.4 — Đồng bộ hóa dữ liệu chủ động |
| FUNC-404-03 | Thiết lập quyền truy cập và khai thác dữ liệu danh mục chi tiết theo từng hệ thống sử dụng hoặc từng nhóm người dùng cụ thể. | BR-404 | NG-2 §II.4 — Phân quyền dữ liệu |
| FUNC-404-04 | Đồng bộ dữ liệu danh mục tự động hằng ngày theo lịch định kỳ. | BR-404 | NG-3 §II.1 (VNA: danh mục là lớp dữ liệu cơ sở, đồng bộ tự động hằng ngày) |

### 1.5 BR-405 — Danh mục Tàu bay: định danh, sở hữu/thuê và lịch sử khai thác

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-405-01 | Quản lý nhóm thuộc tính định danh tàu bay: số đăng ký, loại tàu bay theo mã ICAO/IATA, trọng tải, chủ sở hữu. | BR-405 | NG-2 §II.4 — Thông tin định danh |
| FUNC-405-02 | Quản lý nhóm thuộc tính mã nhận dạng quốc tế của tàu bay: IATA Designator và ICAO Designator. | BR-405 | NG-3 §II.5 (VNA — các thuộc tính cần quản lý) |
| FUNC-405-03 | Quản lý hình thức thuê/mua của tàu bay theo danh mục: sở hữu, thuê khô (Dry Lease), thuê ướt (Wet Lease), thuê ướt kết hợp (Damp Lease) `[cần xác nhận]` — trong đó với Damp Lease bên cho thuê cung cấp toàn bộ trừ nhiên liệu, VNA tự cấp nhiên liệu cho tàu đó. | BR-405 | NG-3 §II.5 (VNA — hình thức sở hữu); NG-1 §7.4 BR-405 (giữ cờ `[cần xác nhận]`) |
| FUNC-405-04 | Quản lý thời điểm hiệu lực khai thác của tàu bay theo từng giai đoạn. | BR-405 | NG-2 §II.4 — Thông tin định danh |
| FUNC-405-05 | Quản lý tàu bay theo lịch sử khai thác: cho phép một tàu vào/ra đội bay nhiều lần và thay đổi cấu hình khoang theo từng giai đoạn. | BR-405 | NG-3 §II.5 (VNA — mỗi tàu cần quản lý theo lịch sử khai thác) |

### 1.6 BR-406 — Thuộc tính khai thác tàu bay và phân nhóm đội tàu

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-406-01 | Quản lý cấu hình khoang của tàu bay. | BR-406 | NG-3 §II.5 (VNA — các thuộc tính cần quản lý) |
| FUNC-406-02 | Quản lý dung tích thùng nhiên liệu và dung tích thùng nước của tàu bay. | BR-406 | NG-3 §II.5 |
| FUNC-406-03 | Quản lý khoang hàng của tàu bay. | BR-406 | NG-3 §II.5 |
| FUNC-406-04 | Cho phép định nghĩa nhóm đội tàu phục vụ báo cáo, theo cơ chế mỗi tàu chỉ được gán vào duy nhất một nhóm tại một thời điểm. | BR-406 | NG-3 §II.5 (VTIT — cơ chế định nghĩa nhóm đội tàu để mỗi tàu chỉ gán một lần); NG-1 §7.4 BR-406 |

### 1.7 BR-407 — Master MEL và đồng bộ MEL/CDL, defects từ AMOS

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-407-01 | Quản lý Master MEL (Master Minimum Equipment List) làm danh mục chuẩn cho toàn hệ thống. | BR-407 | NG-2 §II.4 — Tình trạng kỹ thuật & MEL/CDL |
| FUNC-407-02 | Đồng bộ thông tin MEL/CDL và hỏng hóc (defects) từ hệ thống AMOS về phân hệ danh mục. | BR-407 | NG-2 §II.4 — Tình trạng kỹ thuật & MEL/CDL |
| FUNC-407-03 | Cho phép lọc danh sách lỗi theo nhóm ảnh hưởng: phi công, tiếp viên, thợ máy. | BR-407 | NG-2 §II.4 |
| FUNC-407-04 | Tự động làm nổi bật (highlight) các MEL/lỗi mới phát sinh. | BR-407 | NG-2 §II.4 |
| FUNC-407-05 | Cho phép người dùng nhập ghi chú tính chất ảnh hưởng của MEL đối với khai thác. | BR-407 | NG-2 §II.4 |
| FUNC-407-06 | Cung cấp liên kết xem trực tiếp tài liệu MEL hiện hành từ bản ghi MEL. | BR-407 | NG-2 §II.4 |

### 1.8 BR-408 — Chỉ số PF (Performance Factor)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-408-01 | Cho phép thu nạp file dữ liệu từ các đội tàu để tính toán chỉ số PF thực tế. | BR-408 | NG-2 §II.4 — Chỉ số hiệu suất (PF) |
| FUNC-408-02 | Tính PF từ điện văn ACARS đối với các tàu có nguồn dữ liệu này. | BR-408 | NG-1 §7.4 BR-408 |
| FUNC-408-03 | Áp dụng PF của kỳ trước cho các tàu thiếu dữ liệu tính toán trong kỳ hiện tại. | BR-408 | NG-1 §7.4 BR-408 |
| FUNC-408-04 | Lưu trữ lịch sử cập nhật PF cho từng tàu theo các kỳ tính toán. | BR-408 | NG-2 §II.4 — Chỉ số hiệu suất (PF) |
| FUNC-408-05 | Thống kê biến động PF của tàu bay theo thời gian. | BR-408 | NG-2 §II.4 |
| FUNC-408-06 | Cảnh báo các tàu bay thiếu dữ liệu tính toán PF. | BR-408 | NG-2 §II.4 |

### 1.9 BR-409 — Giới hạn chu kỳ bay (FC), lịch bảo dưỡng và AOG

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-409-01 | Theo dõi giới hạn chu kỳ bay (FC — Flight Cycle) cho từng tàu bay. | BR-409 | NG-2 §II.4 — Giới hạn khai thác |
| FUNC-409-02 | Theo dõi lịch bảo dưỡng ngắn hạn và lịch bảo dưỡng dài hạn cho từng tàu bay. | BR-409 | NG-2 §II.4 — Giới hạn khai thác |
| FUNC-409-03 | Theo dõi tình trạng AOG (Aircraft on Ground) và dự kiến thời gian khắc phục. | BR-409 | NG-2 §II.4 — Giới hạn khai thác |
| FUNC-409-04 | Cảnh báo khi tàu bay tiến gần giới hạn FC. | BR-409 | NG-1 §7.4 BR-409 |

### 1.10 BR-410 — Danh mục Sân bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-410-01 | Quản lý nhóm thuộc tính định danh sân bay: mã ICAO và mã IATA. | BR-410 | NG-2 §II.4 — Thông tin hạ tầng |
| FUNC-410-02 | Quản lý nhóm thuộc tính hạ tầng sân bay: hệ thống đường băng, đường lăn, bãi đỗ. | BR-410 | NG-2 §II.4 — Thông tin hạ tầng |
| FUNC-410-03 | Quản lý nhóm trang thiết bị hỗ trợ cất hạ cánh tại sân bay. | BR-410 | NG-2 §II.4 — Thông tin hạ tầng |
| FUNC-410-04 | Quản lý nhóm thuộc tính khí tượng và tiêu chuẩn tối thiểu (Minima) của sân bay. | BR-410 | NG-2 §II.4 — Khí tượng & Minima |
| FUNC-410-05 | Cung cấp chức năng tra cứu thời tiết (WX) gắn với từng sân bay. | BR-410 | NG-2 §II.4 — Khí tượng & Minima |
| FUNC-410-06 | Quản lý các đặc điểm địa hình đặc thù của sân bay. | BR-410 | NG-2 §II.4 — Khí tượng & Minima |
| FUNC-410-07 | Quản lý các thủ tục bay theo sân bay: SID, STAR, IAP. | BR-410 | NG-2 §II.4 — Dịch vụ & Thủ tục |
| FUNC-410-08 | Quản lý quy định về Slot, phép bay và khung giờ khai thác của sân bay. | BR-410 | NG-2 §II.4 — Dịch vụ & Thủ tục |
| FUNC-410-09 | Quản lý khả năng phục vụ mặt đất tại sân bay: nhiên liệu, kỹ thuật, điện mặt đất. | BR-410 | NG-2 §II.4 — Dịch vụ & Thủ tục |
| FUNC-410-10 | Cập nhật NOTAM liên quan đến sân bay. | BR-410 | NG-2 §II.4 — Chi phí & An toàn |
| FUNC-410-11 | Cập nhật tình hình an ninh tại sân bay. | BR-410 | NG-2 §II.4 — Chi phí & An toàn |
| FUNC-410-12 | Quản lý các loại phí khai thác thương mại của sân bay: phí cất hạ cánh, phí tiếng ồn. | BR-410 | NG-2 §II.4 — Chi phí & An toàn |

### 1.11 BR-411 — Danh mục dịch vụ sân bay phục vụ cảnh báo

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-411-01 | Quản lý danh mục dịch vụ sân bay để ghi nhận năng lực phục vụ của từng sân bay (ví dụ: sân bay không hỗ trợ tàu hỏng động cơ phụ trợ — APU). | BR-411 | NG-3 §II.6 (VNA — cần danh mục dịch vụ sân bay để ghi nhận năng lực phục vụ) |
| FUNC-411-02 | Cung cấp cơ chế cảnh báo dựa trên danh mục dịch vụ sân bay, hỗ trợ điều hành đổi tàu khi cần. | BR-411 | NG-3 §II.6 (VTIT — xây danh mục và cơ chế cảnh báo, hỗ trợ điều hành đổi tàu) |

### 1.12 BR-412 — Danh mục chặng bay (Route & Optimization)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-412-01 | Quản lý thông tin chặng bay: điểm đi, điểm đến, khoảng cách (GCD — Great Circle Distance). | BR-412 | NG-2 §II.4 — Thông tin chặng bay |
| FUNC-412-02 | Quản lý chỉ số chi phí (Cost Index) gắn với chặng bay. | BR-412 | NG-2 §II.4 — Thông tin chặng bay |
| FUNC-412-03 | Quản lý nhiên liệu dự phòng (Final Reserve) cho chặng bay. | BR-412 | NG-2 §II.4 — Thông tin chặng bay |
| FUNC-412-04 | Quản lý thông tin EDTO (Extended Diversion Time Operations) cho chặng bay. | BR-412 | NG-2 §II.4 — Thông tin chặng bay |
| FUNC-412-05 | Quản lý và lưu trữ dữ liệu chi phí điều hành bay, chi phí bay qua theo từng giai đoạn. | BR-412 | NG-2 §II.4 — Chi phí hành lang bay |
| FUNC-412-06 | Quản lý và lưu trữ các tệp thông tin MCMR theo từng giai đoạn. | BR-412 | NG-2 §II.4 — Chi phí hành lang bay |

### 1.13 BR-413 — Quy tắc Tankering

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-413-01 | Thu nạp dữ liệu giá nhiên liệu phục vụ tính toán khuyến nghị Tankering. | BR-413 | NG-2 §II.4 — Quy tắc Tankering |
| FUNC-413-02 | Tính toán khuyến nghị Tankering dựa trên hiệu quả chi phí cho từng giai đoạn. | BR-413 | NG-2 §II.4 — Quy tắc Tankering |
| FUNC-413-03 | Cho phép cập nhật linh hoạt các chặng bay và loại tàu bay áp dụng Tankering. | BR-413 | NG-2 §II.4 — Quy tắc Tankering |
| FUNC-413-04 | Xuất dữ liệu khuyến nghị Tankering theo thời gian hiệu lực. | BR-413 | NG-2 §II.4 — Quy tắc Tankering |

### 1.14 BR-414 — Danh mục bổ trợ

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-414-01 | Quản lý danh sách phi công. | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-02 | Quản lý danh sách tiếp viên. | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-03 | Quản lý danh sách quốc gia. | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-04 | Quản lý danh sách FIR (Flight Information Region). | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-05 | Quản lý danh mục đơn vị ULD (Unit Load Device). | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-06 | Thiết lập danh sách email linh hoạt để hệ thống gửi thông báo tự động. | BR-414 | NG-2 §II.4 — Quản trị liên lạc |

### 1.15 BR-415 — Cấu hình tham số vận hành

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-415-01 | Cấu hình hệ số độ tin cậy chuyến bay (%) làm tham số tính toán. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-02 | Cấu hình ngưỡng chênh lệch nhiên liệu nạp giữa yêu cầu của phi công và kế hoạch. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-03 | Cấu hình ngưỡng chênh lệch trọng tải. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-04 | Cấu hình quy định thời gian (deadline) lập OFP cho chuyến bay quốc tế và chuyến bay quốc nội. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-05 | Cấu hình thời gian cảnh báo thiếu tài liệu chuyến bay. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-06 | Cho phép người dùng có thẩm quyền cập nhật trực tiếp các tham số nói trên trên giao diện khi có thay đổi nghiệp vụ. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |

### 1.16 BR-416 — Hệ số quy đổi đơn vị nhiên liệu trong điện văn

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-416-01 | Quản lý hệ số quy đổi đơn vị nhiên liệu trong điện văn từ tàu bay, có hiệu lực theo từng giai đoạn (do đơn vị nhiên liệu có thể thay đổi theo giai đoạn). | BR-416 | NG-3 §II.5 (VTIT — đơn vị nhiên liệu trong điện văn có thể đổi theo giai đoạn, cần hệ số quy đổi về cùng đơn vị chuẩn theo thời gian hiệu lực) |
| FUNC-416-02 | Cho phép hệ số quy đổi đơn vị nhiên liệu được cấu hình theo từng tàu bay cụ thể. | BR-416 | NG-1 §7.4 BR-416 (hệ số quy đổi… theo từng tàu) |

### 1.17 BR-417 — Danh mục bảng dầu AHM (khai báo thủ công + tích hợp IFV)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-417-01 | Cung cấp chức năng cho điều phái viên (Dispatcher) chủ động khai báo thủ công bảng dầu (AHM — Aircraft Handling Manual) trên TOSS ở giai đoạn đầu, theo các tiêu chí phân loại do điều phái cung cấp (theo loại tàu, theo điều kiện khai thác). | BR-417 | Khảo sát 11/06 sáng §II.9 (kết luận: "TOSS hỗ trợ điều phái khai báo bảng dầu thủ công giai đoạn đầu"); NG-1 §7.4 BR-417 |
| FUNC-417-02 | Quản lý bản ghi bảng dầu AHM theo loại tàu bay (aircraft type) và điều kiện khai thác. | BR-417 | Khảo sát 11/06 sáng §II.9 (yêu cầu: "tra cứu bảng dầu theo loại tàu, điều kiện khai thác") |
| FUNC-417-03 | Tích hợp tự động với phần mềm IFV `[cần xác nhận tên đầy đủ]` để lấy kết quả bảng dầu khi phần mềm IFV sẵn sàng (hướng dài hạn), thay thế việc khai báo thủ công ở FUNC-417-01. | BR-417 | Khảo sát 11/06 sáng §II.9 (đề xuất: "khi phần mềm IFV hoàn thành, TOSS lấy kết quả bảng dầu từ đó") |
| FUNC-417-04 | Sinh cảnh báo cho điều phái viên khi bảng dầu AHM có thay đổi, thay thế cuộc gọi điện thoại hiện hành từ bộ phận tải/cân bằng (CLC). | BR-417 | Khảo sát 11/06 sáng §II.9 (kết luận: "TOSS cảnh báo khi bảng dầu thay đổi"; "thay cuộc gọi điện hiện hành từ CLC") |
| FUNC-417-05 | Quản lý phiên bản và lịch sử thay đổi của bản ghi bảng dầu AHM (kế thừa cơ chế versioning tổng quát tại BR-403/FUNC-403-01…02). | BR-417 | NG-2 §II.4 — Quản lý phiên bản; Khảo sát 11/06 sáng §II.9 (kết luận: TOSS cảnh báo khi bảng dầu thay đổi — hàm ý lưu trạng thái trước/sau) |

### 1.18 BR-418 — Danh mục Standard Taxi Time theo sân bay × thời gian hiệu lực

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-418-01 | Quản lý Standard Taxi Time theo sân bay (mỗi sân bay có giá trị Standard Taxi Time riêng) và theo thời gian hiệu lực (mỗi giá trị Standard Taxi Time có khoảng hiệu lực). | BR-418 | Khảo sát 11/06 sáng §II.14 (kết luận: "TOSS quản lý Standard Taxi Time theo sân bay + thời gian hiệu lực") |
| FUNC-418-02 | Tự thống kê giá trị Standard Taxi Time đề xuất từ dữ liệu thực tế lấy qua QAR / QAI (Quick Access Recorder / Quick Access Information) thông qua API hoặc Database View của Tổng công ty. | BR-418 | Khảo sát 11/06 sáng §II.14 (kết luận: "TOSS tự thống kê từ QAR/QAI (API hoặc Database View)") |
| FUNC-418-03 | Trình giá trị Standard Taxi Time tự thống kê cho điều phái viên duyệt trước khi áp dụng làm bản ghi danh mục có hiệu lực. | BR-418 | Khảo sát 11/06 sáng §II.14 (kết luận: "trình điều phái duyệt"; thảo luận §II.14: "trình điều phái duyệt trước khi áp dụng") |
| FUNC-418-04 | Sinh cảnh báo khi một sân bay thay đổi giá trị Standard Taxi Time, đặc biệt trong các đợt cao điểm (Tết, mùa cao điểm). | BR-418 | Khảo sát 11/06 sáng §II.14 (kết luận: "Cảnh báo khi sân bay thay đổi Standard Taxi Time, đặc biệt đợt cao điểm") |
| FUNC-418-05 | Hỗ trợ phương án đồng bộ giá trị Standard Taxi Time sang hệ thống Lido — phương án tích hợp tự động qua API/master của Lido nếu Lido có cơ chế; trường hợp Lido không có cơ chế tích hợp, giai đoạn đầu chấp nhận nhập hai lần (TOSS + Lido) `[cần xác nhận]`. | BR-418 | Khảo sát 11/06 sáng §II.14 (kết luận: "Phương án push sang Lido cần khảo sát kỹ thuật; nếu không, chấp nhận 'nhập hai lần' giai đoạn đầu"); NG-1 §7.4 BR-418 (giữ cờ `[cần xác nhận]`) |
| FUNC-418-06 | Quản lý phiên bản và lịch sử thay đổi của bản ghi Standard Taxi Time theo sân bay (kế thừa BR-403/FUNC-403-01…02). | BR-418 | Khảo sát 11/06 sáng §II.14 (yêu cầu monitor và thông báo khi thay đổi — hàm ý lưu trữ lịch sử); NG-2 §II.4 — Quản lý phiên bản |

### 1.19 BR-419 — Danh mục sân bay đặc biệt và điều kiện chứng chỉ tổ bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-419-01 | Quản lý danh mục sân bay đặc biệt (sân bay địa hình/điều kiện đặc thù) — ví dụ Điện Biên, Đồng Hới `[cần xác nhận danh mục đầy đủ]`. | BR-419 | Khảo sát 11/06 sáng §II.12 (yêu cầu: "Một số sân bay địa hình/điều kiện đặc biệt (vd Điện Biên, Đồng Hới)") |
| FUNC-419-02 | Gắn cho mỗi sân bay đặc biệt một bộ điều kiện chứng chỉ bổ sung của cơ trưởng/tổ bay (chứng chỉ riêng, điều kiện kinh nghiệm) cần thiết để được khai thác sân bay đó. | BR-419 | Khảo sát 11/06 sáng §II.12 (thảo luận: "không phải bằng lái thông thường mà là điều kiện bổ sung gắn theo từng sân bay khó") |
| FUNC-419-03 | Cung cấp danh mục sân bay đặc biệt và điều kiện chứng chỉ đi kèm làm cơ sở dữ liệu cho cảnh báo chứng chỉ tổ bay theo sân bay (xem BR-122) và cảnh báo đổi tổ bay (xem BR-123). | BR-419 | NG-1 §7.4 BR-419 ("làm cơ sở cho cảnh báo chứng chỉ tổ bay theo sân bay (xem BR-122) và cảnh báo đổi tổ (xem BR-123)") |
| FUNC-419-04 | Quản lý phiên bản và lịch sử thay đổi của danh mục sân bay đặc biệt và điều kiện chứng chỉ (kế thừa BR-403). | BR-419 | NG-2 §II.4 — Quản lý phiên bản |

### 1.20 BR-420 — Danh mục phép bay (Flight Permission) và Flight Type Code

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-420-01 | Quản lý danh mục phép bay theo cấu trúc đa chiều: quốc gia × loại tàu bay × khoảng thời gian hiệu lực × đường bay / waypoint. | BR-420 | Khảo sát 11/06 sáng §II.11 (đề xuất: "Cấu trúc thông tin phép bay đề xuất: theo quốc gia × loại tàu × khoảng thời gian hiệu lực × đường bay/waypoint"; kết luận: "TOSS xây module quản lý phép bay: quốc gia × loại tàu × đường bay × thời gian hiệu lực") |
| FUNC-420-02 | Phân biệt và quản lý phép bay theo mùa lịch bay (xin một lần cho toàn bộ lịch thường lệ của mùa, khoảng 6–7 tháng). | BR-420 | Khảo sát 11/06 sáng §II.11 (bản chất phép bay: "Xin theo mùa lịch bay (6–7 tháng); một lần xin cho toàn bộ lịch thường lệ của mùa") |
| FUNC-420-03 | Phân biệt và quản lý phép bay cấp riêng cho từng chuyến đối với chuyến VIP / charter (có thể cấp sát giờ) và phép bay bổ sung khi đổi sân bay dự bị / đổi điểm hạ cánh. | BR-420 | Khảo sát 11/06 sáng §II.11 ("Chuyến VIP/charter: cấp phép riêng (theo từng chuyến, có thể sát giờ)"; "Đổi dự bị/đổi điểm hạ cánh: phải xin bổ sung") |
| FUNC-420-04 | Cho phép điều phái viên nhập trực tiếp bản ghi phép bay trên TOSS ở giai đoạn đầu (không phụ thuộc SkyCheck). | BR-420 | Khảo sát 11/06 sáng §II.11 (kết luận: "trước mắt cho nhập trực tiếp"; "không phụ thuộc SkyCheck") |
| FUNC-420-05 | TOSS tự sinh báo cáo phép bay từ danh mục phép bay đã quản lý. | BR-420 | Khảo sát 11/06 sáng §II.11 (kết luận: "TOSS tự sinh báo cáo") |
| FUNC-420-06 | Hỗ trợ rà soát phối hợp tận dụng phân tích nghiệp vụ phép bay của đội SkyCheck nếu có (qua đầu mối anh Hùng), nhưng không phụ thuộc SkyCheck. | BR-420 | Khảo sát 11/06 sáng §II.11 (kết luận: "Rà soát tích hợp/tận dụng phân tích SkyCheck qua anh Hùng; không phụ thuộc SkyCheck") |
| FUNC-420-07 | Quản lý danh mục Flight Type Code (mã loại chuyến nội bộ VNA) gồm các code O, Z, G, H, A, P, V, S… `[cần xác nhận danh mục đầy đủ và ý nghĩa từng code]`. | BR-420 | Khảo sát 11/06 chiều §II.2 (cơ chế nhận diện chuyến không thường lệ: "dựa vào mã loại chuyến (flight type code) — VNA sử dụng các code O, Z, G, H, A, P, V, S, H…") |
| FUNC-420-08 | Phân loại mỗi Flight Type Code thuộc nhóm "chuyến thường lệ" hoặc "chuyến không thường lệ" (vd code O thuộc nhóm không thường lệ), làm cơ sở nhận diện chuyến không thường lệ và phục vụ cảnh báo "OFP chưa có STS/HEAD" (xem BR-126). | BR-420 | Khảo sát 11/06 chiều §II.2 ("TOSS dùng code O để nhận diện"; "chuyến thường lệ là S (Scheduled); chuyến không thường lệ chuyển sang N (Non-scheduled)") |
| FUNC-420-09 | Quản lý phiên bản và lịch sử thay đổi của danh mục phép bay và danh mục Flight Type Code (kế thừa BR-403). | BR-420 | NG-2 §II.4 — Quản lý phiên bản |

### 1.21 BR-421 — Trạng thái tàu bay (AC_STATE) và đánh dấu tàu hãng khác bay qua (overflow)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-421-01 | Quản lý trạng thái tàu bay theo trường `AC_STATE` (codeset) trong master tàu bay; ghi nhận các giá trị trạng thái xuất hiện trong nguồn Netline gồm `R` (Regular — tàu đang khai thác thường lệ) và `O` (Overflow — tàu của hãng khác chỉ bay qua FIR/qua sân bay VNA quản lý) `[cần xác nhận danh mục đầy đủ giá trị AC_STATE]`. | BR-421 | NG-6 cột `AC_STATE` với các giá trị `R`/`O` trong mẫu dữ liệu (vd dòng `737GA`, `733CZ` — `AC_STATE = O`; dòng `VNA761`, `VNA341` — `AC_STATE = R`); NG-1 §7.4 BR-421 |
| FUNC-421-02 | Đánh dấu tàu bay là tàu của hãng khác bay qua bằng cờ `REMARK = "OVERFLOW AC"` trong master tàu bay, phục vụ tách bạch đội tàu khai thác của VNA với tàu của hãng khác chỉ bay qua. | BR-421 | NG-6 cột `REMARK` chứa giá trị `OVERFLOW AC` cho các bản ghi của hãng khác (vd `737GA`, `733CZ`, `738CI`, `YN7QV`, `744JL`, `343AF`); NG-1 §7.4 BR-421 |
| FUNC-421-03 | Lưu thông tin hãng khai thác (`AC_OPERATOR`) và chủ sở hữu (`AC_OWNER`) tách biệt cho mỗi tàu bay, hỗ trợ phân biệt tàu VNA (`AC_OPERATOR = VN`) với tàu hãng khác (`AC_OPERATOR` = mã hãng khác như `GA`, `CZ`, `CI`, `DL`, `JL`…). | BR-421 | NG-6 cột `AC_OPERATOR`, `AC_OWNER` (vd `VNA761`: `VN/VN`; `737GA`: `GA/GA`; `333CX`: `333/CX`) |
| FUNC-421-04 | Hỗ trợ lọc/tìm kiếm tàu bay theo trạng thái (`R`, `O`) và theo hãng khai thác để phục vụ các nghiệp vụ chỉ áp dụng cho đội tàu VNA (xếp lịch, lập OFP…) hoặc chỉ áp dụng cho tàu bay qua (quản lý phép bay qua). | BR-421 | NG-1 §7.4 BR-421 ("phân biệt đội tàu VNA với tàu hãng khác chỉ bay qua") |

### 1.22 BR-422 — Cấu hình ghế tiêu chuẩn và cấu hình ghế thay thế của tàu bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-422-01 | Quản lý cấu hình ghế tiêu chuẩn (`STD_VERSION`) của tàu bay trong master tàu bay (vd `76C`, `763`, `32A`, `32C`, `77B`, `320`, `AT7`…). | BR-422 | NG-6 cột `STD_VERSION` |
| FUNC-422-02 | Quản lý tối thiểu 4 cấu hình ghế thay thế (`STD_VERSION_ALT_1`, `STD_VERSION_ALT_2`, `STD_VERSION_ALT_3`, `STD_VERSION_ALT_4`) cho cùng một tàu bay, cho phép chuyển đổi cấu hình ghế khi cần. | BR-422 | NG-6 các cột `STD_VERSION_ALT_1..4` trong header |
| FUNC-422-03 | Cho phép chọn cấu hình ghế đang áp dụng (giữa `STD_VERSION` và các `STD_VERSION_ALT_n`) cho mỗi tàu bay theo từng giai đoạn hiệu lực (kế thừa cơ chế lịch sử khai thác tại FUNC-405-05). | BR-422 | NG-1 §7.4 BR-422; NG-6 (sự tồn tại đồng thời của `STD_VERSION` + 4 ALT cho một bản ghi tàu bay) |

### 1.23 BR-423 — AC_INDEX và cỡ tổ bay tiêu chuẩn (cockpit/cabin)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-423-01 | Quản lý trường `AC_INDEX` ở master tàu bay (chỉ số nội bộ gắn với tàu bay) `[cần xác nhận ngữ nghĩa AC_INDEX — chỉ số gì, được dùng cho nghiệp vụ nào]`. | BR-423 | NG-6 cột `AC_INDEX` (giá trị quan sát: 0, 1, 3…); NG-1 §7.4 BR-423 (giữ cờ `[cần xác nhận ngữ nghĩa AC_INDEX]`) |
| FUNC-423-02 | Quản lý cỡ tổ bay tiêu chuẩn của tàu bay tại buồng lái qua trường `CREWSIZE_COCKPIT` (số phi công tiêu chuẩn cho một chuyến bay với tàu này). | BR-423 | NG-6 cột `CREWSIZE_COCKPIT` |
| FUNC-423-03 | Quản lý cỡ tổ bay tiêu chuẩn của tàu bay tại khoang khách qua trường `CREWSIZE_CABIN` (số tiếp viên tiêu chuẩn cho một chuyến bay với tàu này). | BR-423 | NG-6 cột `CREWSIZE_CABIN` |

### 1.24 BR-424 — Năng lực thiết bị tàu bay đối chiếu Minima sân bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-424-01 | Quản lý năng lực hệ thống hạ cánh bằng thiết bị (ILS — Instrument Landing System) của tàu bay qua trường `ILS_EQUIPMENT` (vd giá trị `I` quan sát trong mẫu) `[cần xác nhận danh mục đầy đủ ILS category]`. | BR-424 | NG-6 cột `ILS_EQUIPMENT` (giá trị `I` xuất hiện đồng đều trong mẫu) |
| FUNC-424-02 | Quản lý năng lực tự động hạ cánh của tàu bay qua trường `AUTOLAND` (vd giá trị `Y` quan sát trong mẫu). | BR-424 | NG-6 cột `AUTOLAND` (giá trị `Y` trong mẫu) |
| FUNC-424-03 | Quản lý năng lực hệ thống truyền tin ACARS (Aircraft Communications Addressing and Reporting System) của tàu bay qua trường `ACARS` (vd giá trị `V` quan sát ở một số tàu A320 trong mẫu). | BR-424 | NG-6 cột `ACARS` (vd `S7ASB`, `S7ASC`, `VNA302`…: `ACARS = V`) |
| FUNC-424-04 | Quản lý các thiết bị đặc biệt khác của tàu bay qua trường `SPECIAL_EQUIPMENT` (danh mục mở, do nguồn không liệt kê cố định) `[cần xác nhận danh mục cụ thể SPECIAL_EQUIPMENT]`. | BR-424 | NG-6 cột `SPECIAL_EQUIPMENT` (cột tồn tại trong header, giá trị phần lớn trống ở mẫu hiện hành) |
| FUNC-424-05 | Cung cấp dữ liệu năng lực thiết bị tàu bay (ILS, AUTOLAND, ACARS, SPECIAL_EQUIPMENT) cho chức năng đối chiếu với tiêu chuẩn tối thiểu Minima của sân bay (xem BR-410/FUNC-410-04). | BR-424 | NG-1 §7.4 BR-424 ("để đối chiếu với tiêu chuẩn tối thiểu (Minima) của sân bay") |

### 1.25 BR-425 — Cấp tiếng ồn và thông tin liên lạc của tàu bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-425-01 | Quản lý cấp tiếng ồn (`NOISE`) của tàu bay làm cơ sở kiểm tra giới hạn khai thác đêm và phí tiếng ồn theo sân bay `[cần xác nhận danh mục cấp NOISE]`. | BR-425 | NG-6 cột `NOISE` (cột tồn tại trong header) |
| FUNC-425-02 | Quản lý thông tin liên lạc radio (`RADIO`) gắn với tàu bay. | BR-425 | NG-6 cột `RADIO` |
| FUNC-425-03 | Quản lý thông tin liên lạc điện thoại (`PHONE`) gắn với tàu bay. | BR-425 | NG-6 cột `PHONE` |
| FUNC-425-04 | Cung cấp dữ liệu NOISE của tàu bay cho chức năng tính phí tiếng ồn theo sân bay (xem BR-410/FUNC-410-12). | BR-425 | NG-1 §7.4 BR-425 ("phục vụ kiểm tra giới hạn khai thác đêm/tiếng ồn") |

### 1.26 BR-426 — Hạn chế sân bay khai thác theo tàu bay (AP_RESTRICTION)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-426-01 | Quản lý trường `AP_RESTRICTION` (hạn chế sân bay khai thác) gắn với từng bản ghi tàu bay trong master tàu bay `[cần xác nhận codeset AP_RESTRICTION — giá trị `N` quan sát đồng đều trong mẫu nhưng chưa có giải nghĩa từ nguồn]`. | BR-426 | NG-6 cột `AP_RESTRICTION` (giá trị `N` trong mẫu); NG-1 §7.4 BR-426 (giữ cờ `[cần xác nhận codeset]`) |
| FUNC-426-02 | Cung cấp dữ liệu `AP_RESTRICTION` cho các chức năng cảnh báo/kiểm tra khi xếp tàu bay vào chuyến bay đến/đi từ sân bay bị hạn chế. | BR-426 | NG-1 §7.4 BR-426 (mục đích "Quản lý hạn chế sân bay khai thác theo từng tàu bay") |

### 1.27 BR-427 — Hợp nhất master tàu bay từ FIMS + Netline thành golden record

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-427-01 | Hợp nhất master tàu bay từ hai nguồn FIMS và Netline thành một bản ghi golden record duy nhất theo khóa (số đăng ký `REGISTRATION`/`AC_REG` × giai đoạn hiệu lực `VALID_SINCE`–`VALID_UNTIL`). | BR-427 | NG-6 các cột `REGISTRATION`, `VALID_SINCE`, `VALID_UNTIL`; NG-7 cột `AC_REG`; NG-1 §7.4 BR-427 |
| FUNC-427-02 | Duy trì bảng ánh xạ codeset loại tàu bay giữa hai nguồn: Netline dùng `AC_SUBTYPE` (vd `763`, `321`, `320`, `772`, `AT7`…) và `AC_SUBTYPE_NAME` (vd `B767`, `A321`, `B777`, `ATR72`); FIMS dùng `AC_TYPE`, `AC_SUBTYPE`, `AC_TYPE_1`, `AC_MODEL`, `AC_TYPE_ICAO` (vd `A321 CEO` / `A321-200` / `A321`; `A350` / `A350-941` / `A359`; `B787-9` / `B787-9` / `B789`). | BR-427 | NG-6 cột `AC_SUBTYPE`, `AC_SUBTYPE_NAME`; NG-7 cột `AC_TYPE`, `AC_SUBTYPE`, `AC_TYPE_1`, `AC_MODEL`, `AC_TYPE_ICAO` (vd dòng 154 `VNA887`: `AC_TYPE=350`, `AC_TYPE_1=A350`, `AC_MODEL=A350-941`, `AC_TYPE_ICAO=A359`) |
| FUNC-427-03 | Hợp nhất các thuộc tính trọng tải và sức chứa từ hai nguồn (FIMS: `MTOW_CONFIG`, `MAX_PAYLOAD`, `TANK_CAPACITY`; Netline: `MAX_TAKEOFF_WGT`, `DRY_OPERATING_WGT`, `CARGO_CAPACITY`, `FUEL_CAPACITY`, `AVG_FUEL_CONSUMP`) theo quy tắc ưu tiên nguồn `[cần xác nhận quy tắc ưu tiên/đối chiếu]`. | BR-427 | NG-6 các cột `MAX_TAKEOFF_WGT`, `DRY_OPERATING_WGT`, `CARGO_CAPACITY`, `FUEL_CAPACITY`, `AVG_FUEL_CONSUMP`; NG-7 các cột `MTOW_CONFIG`, `MAX_PAYLOAD`, `TANK_CAPACITY` |
| FUNC-427-04 | Hợp nhất thông tin cấu hình ghế từ hai nguồn: FIMS có cột chi tiết `SEAT` (vd `16BC-168YC`, `29BC-45YD-231YC`), `C_CLASS`, `WY_CLASS`, `C_NC`, `Y_NY`, `CENTER_TANK`; Netline có cột `STD_VERSION` + 4 cột `STD_VERSION_ALT_n`. | BR-427 | NG-7 các cột `SEAT`, `C_CLASS`, `WY_CLASS`, `C_NC`, `Y_NY`, `C_NC_80`, `Y_NY_80`, `CENTER_TANK`; NG-6 các cột `STD_VERSION`, `STD_VERSION_ALT_1..4` |
| FUNC-427-05 | Quản lý nhóm phụ (`SUB_GROUP`) của tàu bay từ FIMS (vd giá trị `F` ở một số tàu A321) — phục vụ phân nhóm báo cáo nội bộ `[cần xác nhận ý nghĩa SUB_GROUP]`. | BR-427 | NG-7 cột `SUB_GROUP` (vd dòng 142 `VNA390`, 182 `VNA325`, 189 `VNA392` có `SUB_GROUP=F`) |
| FUNC-427-06 | Ghi nhận lịch sử thay đổi của bản ghi golden record (kế thừa cơ chế versioning BR-403/FUNC-403-01..02) và lưu thông tin cập nhật cuối cùng từ Netline (`LAST_UPDATE`, `LAST_UPDATE_USER_ID`). | BR-427 | NG-6 cột `LAST_UPDATE`, `LAST_UPDATE_USER_ID`; NG-2 §II.4 — Quản lý phiên bản |

### 1.28 BR-428 — Included Baggage Allowance theo nhóm đường bay × hạng khách

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-428-01 | Quản lý, khai báo trọng lượng hành lý tiêu chuẩn (Included Baggage Allowance) theo từng nhóm đường bay, đặc trưng bởi quốc gia đi — quốc gia đến — hạng khách. | BR-428 | NG-8 dòng 206 ("Quản lý, khai báo trọng lượng hành lý tiêu chuẩn theo từng nhóm đường bay Từ quốc gia… đến quốc gia…, hạng khách") |
| FUNC-428-02 | Cho phép tạo, chỉnh sửa và quản lý phiên bản các bản ghi Included Baggage Allowance theo từng giai đoạn hiệu lực (kế thừa BR-403). | BR-428 | NG-2 §II.4 — Quản lý phiên bản; NG-1 §7.4 BR-428 |

### 1.29 BR-429 — Sector Groups by FH (nhóm chặng bay theo giờ bay)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-429-01 | Quản lý, khai báo, định nghĩa các nhóm chặng bay theo giờ bay (Sector Groups by FH — Flight Hours). | BR-429 | NG-8 dòng 207 ("Quản lý, khai báo, định nghĩa các nhóm chặng bay theo giờ bay") |
| FUNC-429-02 | Cho phép chọn phạm vi của nhóm là Nội địa (NĐ) hay Quốc tế (QT) cho mỗi nhóm chặng. | BR-429 | NG-8 dòng 207 ("Chọn NĐ/QT") |
| FUNC-429-03 | Cho phép khai báo khoảng giờ bay (FH) cho mỗi nhóm chặng. | BR-429 | NG-8 dòng 207 ("Chọn khoảng FH") |
| FUNC-429-04 | Cho phép đặt tên nhóm cho mỗi nhóm chặng đã định nghĩa. | BR-429 | NG-8 dòng 207 ("Đặt tên nhóm") |

### 1.30 BR-430 — Scheduled TAT theo nhóm nối chặng

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-430-01 | Quản lý, khai báo TAT tiêu chuẩn (Scheduled TAT — Scheduled Turnaround Time) theo từng nhóm nối chặng, ví dụ các nhóm `QT TRUNG–QT NGAN`, `QT NGAN–NOI DIA`… `[cần xác nhận danh mục đầy đủ các nhóm nối chặng]`. | BR-430 | NG-8 dòng 208 ("Quản lý, khai báo TAT tiêu chuẩn theo từng nhóm nối chặng QT TRUNG-QT NGAN, QT NGAN-NOI DIA…") |
| FUNC-430-02 | Cho phép tạo, chỉnh sửa và quản lý phiên bản các bản ghi Scheduled TAT theo từng giai đoạn hiệu lực (kế thừa BR-403). | BR-430 | NG-2 §II.4 — Quản lý phiên bản; NG-1 §7.4 BR-430 |

### 1.31 BR-431 — Commercial Config (số ghế mở bán C/W/Y theo chặng × giai đoạn × AC subtype)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-431-01 | Cho phép tải lên file LBM chi tiết để nạp dữ liệu Commercial Config. | BR-431 | NG-8 dòng 209 ("Cho phép upload file LBM chi tiết") |
| FUNC-431-02 | Trích xuất số ghế mở bán theo các hạng C/W/Y cho từng chặng bay, từng giai đoạn thời gian áp dụng, và từng `AC_SUBTYPE`. | BR-431 | NG-8 dòng 209 ("Trích xuất số ghế mở bán C/W/Y từng chặng bay, từng giai đoạn thời gian áp dụng, ac subtype") |
| FUNC-431-03 | Cho phép sửa hoặc cập nhật thủ công số ghế mở bán từng hạng theo từng giai đoạn và từng `AC_SUBTYPE`. | BR-431 | NG-8 dòng 209 ("Cho phép sửa hoặc cập nhật thủ công số ghế mở bản từng hạng theo từng giai đoạn, ac_subtype") |
| FUNC-431-04 | Quản lý phiên bản và lịch sử thay đổi của bản ghi Commercial Config (kế thừa BR-403). | BR-431 | NG-2 §II.4 — Quản lý phiên bản; NG-1 §7.4 BR-431 |

### 1.32 BR-432 — Planned Version (quản lý version sản lượng)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-432-01 | Cho phép thêm, sửa, xóa các version sản lượng (Planned Version). | BR-432 | NG-8 dòng 235 ("Quản lý (thêm, sửa, xóa) version sản lượng") |
| FUNC-432-02 | Mỗi version sản lượng được khai báo theo Năm. | BR-432 | NG-8 dòng 235 ("Năm") |
| FUNC-432-03 | Mỗi version sản lượng có thuộc tính loại với giá trị `UHT` hoặc `KH` `[cần xác nhận nghĩa đầy đủ của UHT và KH]`. | BR-432 | NG-8 dòng 235 ("Loại (UHT/KH)") |
| FUNC-432-04 | Mỗi version sản lượng có tên version do người dùng đặt. | BR-432 | NG-1 §7.4 BR-432 ("Năm × loại UHT/KH × tên version") |
| FUNC-432-05 | Mỗi version sản lượng đi kèm danh sách chuyến bay sản lượng thuộc version đó. | BR-432 | NG-1 §7.4 BR-432 ("kèm danh sách chuyến bay sản lượng") |
| FUNC-432-06 | Quản lý phiên bản và lịch sử thay đổi của bản ghi Planned Version (kế thừa BR-403). | BR-432 | NG-2 §II.4 — Quản lý phiên bản |

---

## 2. Ma trận truy vết BR → FUNC

| BR | Số FUNC | Danh sách FUNC |
|---|---|---|
| BR-401 | 2 | FUNC-401-01, FUNC-401-02 |
| BR-402 | 2 | FUNC-402-01, FUNC-402-02 |
| BR-403 | 2 | FUNC-403-01, FUNC-403-02 |
| BR-404 | 4 | FUNC-404-01, FUNC-404-02, FUNC-404-03, FUNC-404-04 |
| BR-405 | 5 | FUNC-405-01, FUNC-405-02, FUNC-405-03, FUNC-405-04, FUNC-405-05 |
| BR-406 | 4 | FUNC-406-01, FUNC-406-02, FUNC-406-03, FUNC-406-04 |
| BR-407 | 6 | FUNC-407-01 … FUNC-407-06 |
| BR-408 | 6 | FUNC-408-01 … FUNC-408-06 |
| BR-409 | 4 | FUNC-409-01 … FUNC-409-04 |
| BR-410 | 12 | FUNC-410-01 … FUNC-410-12 |
| BR-411 | 2 | FUNC-411-01, FUNC-411-02 |
| BR-412 | 6 | FUNC-412-01 … FUNC-412-06 |
| BR-413 | 4 | FUNC-413-01 … FUNC-413-04 |
| BR-414 | 6 | FUNC-414-01 … FUNC-414-06 |
| BR-415 | 6 | FUNC-415-01 … FUNC-415-06 |
| BR-416 | 2 | FUNC-416-01, FUNC-416-02 |
| BR-417 | 5 | FUNC-417-01 … FUNC-417-05 |
| BR-418 | 6 | FUNC-418-01 … FUNC-418-06 |
| BR-419 | 4 | FUNC-419-01 … FUNC-419-04 |
| BR-420 | 9 | FUNC-420-01 … FUNC-420-09 |
| BR-421 | 4 | FUNC-421-01 … FUNC-421-04 |
| BR-422 | 3 | FUNC-422-01, FUNC-422-02, FUNC-422-03 |
| BR-423 | 3 | FUNC-423-01, FUNC-423-02, FUNC-423-03 |
| BR-424 | 5 | FUNC-424-01 … FUNC-424-05 |
| BR-425 | 4 | FUNC-425-01 … FUNC-425-04 |
| BR-426 | 2 | FUNC-426-01, FUNC-426-02 |
| BR-427 | 6 | FUNC-427-01 … FUNC-427-06 |
| BR-428 | 2 | FUNC-428-01, FUNC-428-02 |
| BR-429 | 4 | FUNC-429-01 … FUNC-429-04 |
| BR-430 | 2 | FUNC-430-01, FUNC-430-02 |
| BR-431 | 4 | FUNC-431-01 … FUNC-431-04 |
| BR-432 | 6 | FUNC-432-01 … FUNC-432-06 |
| **Tổng** | **142** | — (v0.1: 73 FUNC; v0.2: +24 FUNC; v0.3: +45 FUNC mới cho BR-421…432) |

---

## 3. Danh sách "(chưa có nguồn — cần SME bổ sung)" và cờ `[cần xác nhận]`

### 3.1 Cờ `[cần xác nhận]` được bảo toàn từ BR cha

| FUNC | Cờ | Nội dung cần xác nhận | Nguồn cờ |
|---|---|---|---|
| FUNC-405-03 | `[cần xác nhận]` | Hình thức "thuê ướt kết hợp (Damp Lease)" — tên gọi tiếng Việt chính thức, quy ước hạch toán, và đặc biệt phạm vi xử lý phần nhiên liệu VNA tự cấp cho tàu thuê ướt kết hợp (xem BRD-TOSS-001 §5.3 phạm vi cần làm rõ). | NG-1 §7.4 BR-405 |
| FUNC-417-03 | `[cần xác nhận]` | Tên đầy đủ của phần mềm IFV (đầu mối: anh Kiếm) và phạm vi/giao diện tích hợp với TOSS (API hay file/import). | NG-4 §II.9 ("phần mềm IFV của anh Kiếm [cần xác nhận tên đầy đủ]"); NG-1 §7.4 BR-417 |
| FUNC-418-05 | `[cần xác nhận]` | Phương án đồng bộ Standard Taxi Time sang Lido — Lido có cơ chế tích hợp tự động (API/master) hay không; nếu không, xác nhận chính thức giải pháp "nhập hai lần" giai đoạn đầu. | NG-4 §II.14; NG-1 §7.4 BR-418 |
| FUNC-418-01 | `[cần xác nhận]` (gián tiếp) | Tên đơn vị MOI đang quản lý Standard Taxi Time hiện hành — là đơn vị nội bộ Tổng công ty hay hệ thống nào. | NG-4 §II.14 ("bên MOI [cần xác nhận] đang quản lý Standard Taxi Time"); NG-1 §7.4 BR-418 |
| FUNC-419-01 | `[cần xác nhận]` | Danh mục đầy đủ các sân bay đặc biệt (ngoài Điện Biên, Đồng Hới đã nhắc): cần SME điều phái cung cấp danh sách hoàn chỉnh + tiêu chí phân loại. | NG-4 §II.12; NG-1 §7.4 BR-419 |
| FUNC-420-07 | `[cần xác nhận]` | Danh mục đầy đủ các Flight Type Code (O, Z, G, H, A, P, V, S…) và ý nghĩa nghiệp vụ của từng code (chuyến nào thường lệ, chuyến nào không thường lệ, chuyến nào cần STS/HEAD). | NG-5 §II.2 ("danh mục đầy đủ và ý nghĩa từng code"); §IV "Vấn đề cần làm rõ" |
| FUNC-421-01 | `[cần xác nhận]` | Danh mục đầy đủ các giá trị của `AC_STATE` (ngoài `R` và `O` đã quan sát trong mẫu Netline): còn các giá trị nào? Ý nghĩa nghiệp vụ của từng giá trị? | NG-6 cột `AC_STATE`; NG-1 §7.4 BR-421 |
| FUNC-423-01 | `[cần xác nhận]` | Ngữ nghĩa của trường `AC_INDEX` trong master tàu bay (chỉ số gì? dùng cho nghiệp vụ nào? quy tắc gán giá trị?). | NG-6 cột `AC_INDEX`; NG-1 §7.4 BR-423 |
| FUNC-424-01 | `[cần xác nhận]` | Danh mục đầy đủ các giá trị của `ILS_EQUIPMENT` (mẫu chỉ thấy `I`; có các category nào khác như CAT I/II/III?). | NG-6 cột `ILS_EQUIPMENT` |
| FUNC-424-04 | `[cần xác nhận]` | Danh mục cụ thể giá trị của trường `SPECIAL_EQUIPMENT` (phần lớn trống trong mẫu, chưa có danh mục chuẩn). | NG-6 cột `SPECIAL_EQUIPMENT` |
| FUNC-425-01 | `[cần xác nhận]` | Danh mục cấp tiếng ồn `NOISE` đầy đủ và quy ước mã hóa. | NG-6 cột `NOISE` |
| FUNC-426-01 | `[cần xác nhận]` | Codeset trường `AP_RESTRICTION` (giá trị `N` quan sát đồng đều trong mẫu Netline nhưng chưa có chú giải nghiệp vụ; cần biết các giá trị và ý nghĩa). | NG-6 cột `AP_RESTRICTION`; NG-1 §7.4 BR-426 |
| FUNC-427-03 | `[cần xác nhận]` | Quy tắc ưu tiên/đối chiếu khi giá trị trọng tải/sức chứa khác nhau giữa hai nguồn FIMS và Netline (vd `MTOW_CONFIG` FIMS vs `MAX_TAKEOFF_WGT` Netline cho cùng một số đăng ký). | NG-6, NG-7 (đối chiếu cột) |
| FUNC-427-05 | `[cần xác nhận]` | Ý nghĩa nghiệp vụ của trường `SUB_GROUP` trong FIMS (vd giá trị `F` xuất hiện ở một số tàu A321). | NG-7 cột `SUB_GROUP` |
| FUNC-430-01 | `[cần xác nhận]` | Danh mục đầy đủ các nhóm nối chặng cho Scheduled TAT (ngoài `QT TRUNG–QT NGAN`, `QT NGAN–NOI DIA` đã nêu). | NG-8 dòng 208 |
| FUNC-432-03 | `[cần xác nhận]` | Nghĩa đầy đủ của hai giá trị `UHT` và `KH` của trường loại version sản lượng. | NG-8 dòng 235 |

### 3.2 Hạng mục "(chưa có nguồn — cần SME bổ sung)"

Trong phạm vi Phân hệ 4, các BR-401 … BR-432 đã có nguồn trích dẫn rõ ràng từ NG-1/NG-2/NG-3/NG-4/NG-5/NG-6/NG-7/NG-8; chưa phát sinh FUNC nào thuộc dạng "(chưa có nguồn — cần SME bổ sung)" tại đợt phân rã v0.3. Một số khía cạnh đã được nhận diện thuộc nhóm "cần làm rõ ở các đợt khảo sát kế tiếp" nhưng KHÔNG được tạo thành FUNC giả định trong tài liệu này (tuân thủ §0 — không suy diễn):

| Khía cạnh chưa được nguồn mô tả đủ để phân rã thành FUNC ở v0.2 | BR liên quan | Ghi chú |
|---|---|---|
| Quy ước cụ thể của "cấu trúc Metadata chuẩn" (các trường metadata bắt buộc, kiểu dữ liệu, ràng buộc) | BR-402 | Nguồn mới nêu nguyên tắc; cần SME bổ sung chuẩn metadata cụ thể trước khi phân rã sâu hơn. |
| Danh sách hệ thống vệ tinh sẽ tiêu thụ dữ liệu danh mục qua API/Webhook và hợp đồng dữ liệu (data contract) | BR-404 | Phụ thuộc tài liệu tích hợp (Phân tích YCKT v0.1 §3 và tài liệu API Gateway) — sẽ phân rã ở SRS phân hệ tích hợp. |
| Bộ trường thuộc tính chi tiết của các nhóm (đường băng, đường lăn, Minima, SID/STAR/IAP, Slot…) trong danh mục Sân bay | BR-410 | Nguồn chỉ nêu nhóm thuộc tính; bộ trường chi tiết cần SME hàng không bổ sung trước khi xuống mức trường dữ liệu. |
| Bộ trường thuộc tính chi tiết của Master MEL (cấu trúc bản ghi MEL chuẩn) | BR-407 | Nguồn nêu "quản lý Master MEL" nhưng chưa liệt kê trường; cần SME kỹ thuật bổ sung. |
| Định nghĩa cụ thể của "khuyến nghị Tankering" (công thức, đầu vào, đầu ra hiển thị) | BR-413 | Nguồn nêu nguyên tắc theo hiệu quả chi phí; công thức cụ thể cần SME. |
| Danh sách tham số vận hành đầy đủ ngoài 5 tham số đã nêu (BR-415) | BR-415 | Nguồn liệt kê 5 tham số làm ví dụ "như"; có thể phát sinh thêm khi phân rã các phân hệ khác. |
| Cấu trúc dữ liệu chi tiết của bảng dầu AHM (trường dữ liệu, đơn vị, ràng buộc) | BR-417 | Khảo sát 11/06 sáng §II.9 yêu cầu lấy tài liệu AHM từ điều phái để xác định cấu trúc; chưa có tại đợt phân rã này. |
| Cách gọi nội bộ cho danh mục bản ghi bảng dầu (ASR nhận lệch thành "quả đấy dầu"); nguồn bảng dầu hiện hành ("anh Ngọt") | BR-417 | Nguồn ASR không rõ; cần điều phái xác nhận để chuẩn hóa danh mục và đầu mối nghiệp vụ. |
| Cấu trúc dữ liệu chi tiết của bản ghi phép bay (các trường nhận diện chuyến/đường bay/loại phép, ràng buộc thời hạn) | BR-420 | Nguồn nêu mô hình 4 chiều (quốc gia × loại tàu × hiệu lực × đường bay) nhưng chưa liệt kê bộ trường chi tiết; cần SME phép bay xác nhận. |
| Quy tắc đối chiếu chi tiết khi `AC_OPERATOR` ≠ `AC_OWNER` (vd `333CX`: operator `333`, owner `CX`) | BR-421 | Mẫu Netline có một số dòng operator khác owner; chưa có chú giải nghiệp vụ. |
| Quy tắc chọn cấu hình ghế đang áp dụng giữa `STD_VERSION` và 4 `STD_VERSION_ALT_n` (theo chuyến, theo giai đoạn, theo người quyết định) | BR-422 | Nguồn xác nhận sự tồn tại nhiều cấu hình thay thế nhưng chưa định nghĩa quy tắc lựa chọn. |
| Quy tắc ưu tiên/đối chiếu khi giá trị giữa FIMS và Netline khác nhau cho cùng một số đăng ký | BR-427 | Nguồn dữ liệu thực có sự khác biệt (vd cấu hình ghế chi tiết ở FIMS vs codeset ở Netline); cần SME quyết định quy tắc golden record. |
| Cấu trúc bản ghi Included Baggage Allowance (các trường cụ thể: mã nhóm đường bay, mã quốc gia, hạng khách, đơn vị trọng lượng) | BR-428 | Nguồn YCKT chỉ mô tả mức nguyên tắc. |
| Quy tắc khai báo khoảng FH (đơn vị giờ, biên trên/biên dưới, cho phép chồng lấn hay không) | BR-429 | Nguồn YCKT chỉ nêu "Chọn khoảng FH" mà chưa quy định ràng buộc. |
| Đơn vị thời gian và quy tắc đối với Scheduled TAT (phút/giờ; min/max) | BR-430 | Nguồn YCKT chỉ nêu nguyên tắc khai báo theo nhóm nối chặng. |
| Định dạng file LBM và quy tắc mapping cột → trường Commercial Config | BR-431 | Nguồn YCKT nêu "upload file LBM" nhưng chưa mô tả định dạng cụ thể. |
| Quy tắc gán chuyến bay sản lượng vào một Planned Version (tự động/thủ công, ràng buộc duy nhất) | BR-432 | Nguồn YCKT chỉ nêu "kèm danh sách chuyến bay sản lượng". |

### 3.3 Tham chiếu phạm vi cần làm rõ ở BRD §5.3

- "Phương án khi hệ thống lập kế hoạch bay không cho phép tích hợp trực tiếp" — không thuộc Phân hệ 4 nhưng có ảnh hưởng tới FUNC-404 (đồng bộ chủ động) nếu Lido không cho phép kết nối API.
- "Phạm vi xử lý phần nhiên liệu VNA tự cấp cho tàu thuê ướt kết hợp (Damp Lease)" — liên quan trực tiếp FUNC-405-03; cần làm rõ trước khi phân rã FUNC này xuống mức quy trình hạch toán.

---

*Phiên bản 0.1 — 2026-06-11 — BA Lead — Khởi tạo phân rã FUNC cho Phân hệ 4 (BR-401 … BR-416) từ BRD-TOSS-001 §7.4, Đề xuất §II.4 và Khảo sát 09/06/2026 §II.1, II.5, II.6.*

*Phiên bản 0.2 — 2026-06-12 — BA Lead — Bổ sung phân rã FUNC cho 4 BR mới của Phân hệ 4 trong BRD-TOSS-001 §7.4 v0.2: BR-417 (bảng dầu AHM, 5 FUNC), BR-418 (Standard Taxi Time, 6 FUNC), BR-419 (sân bay đặc biệt + chứng chỉ tổ bay, 4 FUNC), BR-420 (phép bay + Flight Type Code, 9 FUNC). Tổng phát sinh 24 FUNC mới (FUNC-417-01 … FUNC-420-09). Đổi tham chiếu sang `BRD-TOSS-001-khung-v0.2.md`. Nguồn nguyên thủy bổ sung: Khảo sát 11/06/2026 buổi sáng §II.9, §II.11, §II.12, §II.14 và Khảo sát 11/06/2026 buổi chiều §II.2.*

*Phiên bản 0.3 — 2026-06-12 — BA Lead — Bổ sung phân rã FUNC cho 12 BR mới của Phân hệ 4 trong BRD-TOSS-001 §7.4 v0.3: BR-421 (AC_STATE/overflow, 4 FUNC), BR-422 (STD_VERSION + alternative, 3 FUNC), BR-423 (AC_INDEX/CREWSIZE, 3 FUNC), BR-424 (ILS/AUTOLAND/ACARS/SPECIAL_EQUIPMENT, 5 FUNC), BR-425 (NOISE/RADIO/PHONE, 4 FUNC), BR-426 (AP_RESTRICTION, 2 FUNC), BR-427 (golden record FIMS + Netline + codeset, 6 FUNC), BR-428 (Included Baggage Allowance, 2 FUNC), BR-429 (Sector Groups by FH, 4 FUNC), BR-430 (Scheduled TAT, 2 FUNC), BR-431 (Commercial Config, 4 FUNC), BR-432 (Planned Version, 6 FUNC). Tổng phát sinh 45 FUNC mới (FUNC-421-01 … FUNC-432-06). Đổi tham chiếu sang `BRD-TOSS-001-khung-v0.4.md`. Nguồn nguyên thủy bổ sung: NG-6 `Aircraft_Netline.extracted.md` (39 cột Netline), NG-7 `Aircraft_FIMS.extracted.md` (21 cột FIMS), NG-8 `sheet-04-yckt-v3.md` dòng 206/207/208/209/235.*
