---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.5"
date: "2026-06-23"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH4"
parent_document: "BRD-TOSS-PH4-quan-ly-danh-muc-v0.6.md"
parent_section: "§7.4 Phân hệ 4 — Quản lý danh mục (Master Data)"
brd_version: "v0.6"
---

# Phân rã Yêu cầu nghiệp vụ (BR) xuống Yêu cầu chức năng (FUNC) — Phân hệ 4: Quản lý danh mục (Master Data)

> **Phiên bản này (v0.4 — 2026-06-17):** vá tài liệu phân rã FUNC theo bốn quyết định nghiệp vụ đã chốt giữa BRD PH4 v0.3 và **BRD PH4 v0.5** (xem [`BRD-TOSS-PH4-quan-ly-danh-muc-v0.6.md`](../../brd/BRD-TOSS-PH4-quan-ly-danh-muc-v0.6.md)):
>
> 1. **A — PF Reports về PH3:** Báo cáo PF (PF Comparison / PF Trend by AC Type / PF Trend by AC Reg / PF Data Coverage) đã chuyển khỏi PH4; PH4 chỉ giữ lưu trữ lịch sử PF data + cảnh báo tàu thiếu / hết hiệu lực PF. Báo cáo PF nay thuộc PH3 BR-351…BR-356.
> 2. **B — BR-419 viết lại:** PH4 chỉ "đồng bộ và lưu hiện trạng" lịch bảo dưỡng + AOG từ AMOS (xem PH5 BR-528d — kênh tích hợp AMOS) và sinh cảnh báo sắp hết Flight Cycle (FC); **không tự quản lý bảo dưỡng** (AMOS là hệ thống chủ — Out-of-scope §5.2 #3).
> 3. **C — Nhóm K đã chuyển sang PH2 v0.6:** các BR-470…BR-473 cũ (quản lý phần mềm tàu bay, SkyOffice → MO Plus/VNA Library, Service Order tự động từ email LIDO, công việc KTKTB) nay nằm trong PH2 v0.6 BR-258…BR-261.
> 4. **D — BR-425 đã có mã OID:** ngôn ngữ MEL Airbus / định dạng thứ ba ([`SME-44`](../../quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md)) trong khung MEL tool đa hãng Boeing+Airbus.
>
> **Lưu ý quan trọng về đánh mã BR:** v0.4 phân rã này **giữ nguyên cấu trúc đánh mã BR-401 … BR-432 của BRD PH4 v0.1/v0.4** (32 BR cũ) mà v0.3 đã phân rã. BRD PH4 v0.5 đã **đánh lại toàn bộ mã từ BR-401 → BR-469** (10 nhóm A–J, 69 BR) — việc remap đầy đủ FUNC sang khung mã mới được tách thành đợt làm lại (rewrite) sau, không nằm trong phạm vi v0.4 này. Để truy vết hai chiều, xem **§4 — Ánh xạ BR cũ (v0.3) ↔ BR mới (BRD v0.5)** ở cuối tài liệu.
>
> Toàn bộ phần phân rã BR-401 … BR-432 của v0.3 được giữ nguyên ở §1 và §2 dưới đây, kèm các ghi chú vá tại bốn điểm A–D nêu trên. Bản v0.3 (`PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.3.md`) được lưu song song làm bản gốc; bản v0.4 này thay thế v0.3 cho tham chiếu hiện hành.

## Mục đích và phạm vi

Tài liệu phân rã trung thực các Yêu cầu nghiệp vụ (BR — Business Requirement) thuộc **Phân hệ 4 — Quản lý danh mục (Master Data)** ghi nhận tại BRD PH4 v0.1/v0.3 (BR-401 … BR-432; §7.4 từ `BRD-TOSS-001-khung-v0.7.md`) xuống lớp **Yêu cầu chức năng (FUNC — Functional Requirement)**, có vá theo quyết định nghiệp vụ A–D đã được phản ánh trong BRD PH4 v0.5. Mỗi FUNC bám sát nội dung nguồn đã trích dẫn; không suy diễn, không bịa danh mục/thuộc tính.

## Nguyên tắc phân rã (CLAUDE.md §0 — bắt buộc)

1. **Chỉ phân rã và lắp ráp trung thực** từ nội dung con người đã ghi nhận (Đề xuất giải pháp kỹ thuật v0.3 §II.4; Báo cáo khảo sát 09/06/2026 §II.1, II.5, II.6; BRD-TOSS-001 §7.4). Không suy diễn, không "hoàn thiện" logic, không bịa danh mục/thuộc tính.
2. **Mỗi FUNC truy vết về một BR cha** thuộc Phân hệ 4 và trích nguồn cụ thể (tài liệu, mục, trang/đoạn).
3. **Khi nguồn không bao phủ một khía cạnh nào**, ghi "(chưa có nguồn — cần SME bổ sung)" thay vì tự sinh nội dung.
4. **Bảo toàn các cờ `[cần xác nhận]`** đã có ở BR cha; mọi cờ tham chiếu sổ cái OID-TOSS-001.
5. **Thuật ngữ kỹ thuật** giữ tiếng Anh trong ngoặc đơn ở lần xuất hiện đầu tiên.

## Nguồn nguyên thủy đã đối chiếu

| Mã nguồn | Tài liệu | Mục đã đọc |
|---|---|---|
| NG-1 | `BRD-TOSS-PH4-quan-ly-danh-muc-v0.1.md` (mã BR cũ) | BR-401 … BR-432 (§7.4 từ `BRD-TOSS-001-khung-v0.7.md`) |
| NG-1b | `BRD-TOSS-PH4-quan-ly-danh-muc-v0.6.md` (mã BR mới — dùng cho ánh xạ §4) | BR-401 … BR-469 (10 nhóm A–J) |
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
| FUNC-403-01 | Lưu trữ đầy đủ lịch sử thay đổi cho từng bản ghi danh mục, ghi nhận: ai thay đổi (`LAST_UPDATE_USER_ID` — quan sát giá trị viết tắt trong Netline: `HUNGTV`, `THANG_FC`, `KIENND`, `HUNGND`, `QUYHT`, `KHDUNG`), nội dung thay đổi là gì, thời điểm cập nhật (`LAST_UPDATE`), và định danh bản ghi (`RECORD_ID` — số nguyên tăng, quan sát phạm vi `1.012.272`–`27.719.427`). Trường thời gian (`VALID_SINCE`, `VALID_UNTIL`, `LAST_UPDATE`) trong nguồn Netline được lưu dạng Excel serial date/datetime (ví dụ `37438`, `38415.6078819444`) — golden record TOSS phải parse sang kiểu ngày/giờ chuẩn thay vì lưu nguyên serial. Định danh người dùng viết tắt từ Netline cần được ánh xạ sang IAM TOSS khi tích hợp PH5. | BR-403 | NG-2 §II.4 — Quản lý phiên bản (Versioning); NG-6 các cột `LAST_UPDATE`, `LAST_UPDATE_USER_ID`, `RECORD_ID`, `VALID_SINCE`, `VALID_UNTIL` |
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
| FUNC-405-01 | Quản lý nhóm thuộc tính định danh tàu bay: số đăng ký, loại tàu bay theo mã ICAO/IATA, trọng tải, chủ sở hữu. Định danh chủ sở hữu/khai thác lưu thành ba trường tách biệt: `AC_OPERATOR` (mã hãng khai thác — ví dụ `VN`, `KL`, `JL`, `AZ`, `CX`), `AC_OWNER` (mã hãng sở hữu/cho thuê), `AC_OWNER_NAME` (tên đầy đủ bên cho thuê). Danh sách bên cho thuê quan sát được trong dữ liệu Netline: VIETNAM AIRLINES, GECAS, ILFC, AWAS, ANS, KL, CX, CHINA AIRLINES, JAPAN AIRLINES, LAO AIRLINES, AIR FRANCE, AZ, GARUDA INDONESIA, CHINA SOUTHERN. Trường `AC_LOGICAL_NO` là số nguyên đếm theo `AC_SUBTYPE` (ví dụ tàu mã `763` đánh `1..8`, tàu A320 đánh `1..10`). | BR-405 | NG-2 §II.4 — Thông tin định danh; NG-6 cột `AC_OPERATOR`, `AC_OWNER`, `AC_OWNER_NAME`, `AC_LOGICAL_NO` |
| FUNC-405-02 | Quản lý nhóm thuộc tính mã nhận dạng quốc tế của tàu bay: IATA Designator và ICAO Designator. Mã ICAO designator chỉ tồn tại trong nguồn FIMS (cột `AC_TYPE_ICAO` — ví dụ giá trị quan sát: `A321`, `A21N`, `A332`, `A359`, `B789`, `B78X`, `AT72`); nguồn Netline không lưu ICAO designator — do đó bảng ánh xạ phải nạp ICAO designator từ FIMS sang golden record. | BR-405 | NG-3 §II.5 (VNA — các thuộc tính cần quản lý); NG-7 cột `AC_TYPE_ICAO` |
| FUNC-405-03 | Quản lý hình thức thuê/mua của tàu bay theo danh mục: sở hữu, thuê khô (Dry Lease), thuê ướt (Wet Lease), thuê ướt kết hợp (Damp Lease) *(xem OID: SME-10)* — trong đó với Damp Lease bên cho thuê cung cấp toàn bộ trừ nhiên liệu, hãng tự cấp nhiên liệu cho tàu đó. | BR-405 | NG-3 §II.5 (VNA — hình thức sở hữu); NG-1 §7.4 BR-405 |
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
| FUNC-407-01 | Quản lý Master MEL (Master Minimum Equipment List) làm danh mục chuẩn cho toàn hệ thống. Master MEL được lưu theo hãng qua trường `icao_airl_code` (toàn bộ mẫu dữ liệu hiện có = `HVN` — ICAO code của Vietnam Airlines), phù hợp với mô hình hãng đa nguồn (vừa sở hữu vừa đi thuê). Bộ trường penalty đo lường (ánh xạ năm loại penalty trong glossary "MEL penalty"): (1) hệ số tăng nhiên liệu `p_perf_corr` (%); (2) penalty trọng lượng `p_tow` (kg), `p_enrte_wt` (kg), `p_lw` (kg), `p_tcap`, kèm `unit_weight = KG`; (3) penalty độ cao `p_altitude` với `unit_vertical = FF`; (4) penalty hạn chế hạ cánh `auto_land_down` (vd `auto3A`, `noauto`), `ils_down` (vd `3A`, `1`), `gls_down`, `rnp_precision_down`; (5) penalty ETOPS/EDTO `p_etops_circles` (phút, ví dụ `60`/`120`/`180`), `unit_etops_circles = MN`, `p_etops_critfuel_dc`, `p_etops_critfuel_dx`. Downgrade thiết bị riêng: `tcas`, `fms`, `landing_ep`, `ats_service_type`, `other_eq`. Hạn chế cấu hình ICAO Flight Plan: `item_10a`, `item10_b`, `item18_rnav`, `item18_rnp` (vd giá trị quan sát: `H`, `J1..J5`, `M1`, `D1`, `F`, `W`, `A1,B1,B2,C1,D1`, `L1,O1,S1,S2,T1,T2`). Hai trường mô tả phân biệt: `mel_dx_remark` (cho Dispatcher, vd *"EDTO IS NOT CONDUCTED"*, *"AUTOLAND IS NOT CONDUCTED. MAXIMUM LANDING CAPABILITY IS CAT I"*) và `mel_ofp_remark` (cho OFP, vd *"AUTOMATIC CABIN PRESSURE CONTROL CHANNELS"*). Master MEL gồm hai lớp: `raw content` (gốc nhà sản xuất, không sửa) và `edited content` (metadata khai thác do hãng bổ sung). | BR-407 | NG-2 §II.4 — Tình trạng kỹ thuật & MEL/CDL; MEL-78A.extracted.md, MEL-78B.extracted.md, MEL-78C.extracted.md các cột tương ứng; toss-glossary-v0.1.md entries "Master MEL", "MEL penalty" |
| FUNC-407-02 | Đồng bộ thông tin MEL/CDL và hỏng hóc (defects) từ hệ thống AMOS về phân hệ danh mục. Mã item lưu ở trường `deviation_code` theo cấu trúc ATA `XX-XX-XX` kèm hậu tố `A/B/X1/X2…` đánh dấu trường hợp (case) — ví dụ `21-31-01B`, `21-52-01-02-01X1`, `22-11-06-02B`, `27-02-07-02`. `deviation_code` là khóa đối chiếu xuyên ba lớp AMOS Master MEL ↔ Shortlist MEL (FOE) ↔ MEL trong OFP. Trường `perf_type` xác định biến thể cấu hình hiệu năng theo biến thể tàu (quan sát: `87975` cho 78A — B787-9 có OFCR/OFAR; `87967` cho 78B — B787-9 không OFCR/OFAR; `87X75` cho 78C — B787-10) và là khóa con bên cạnh `AC_SUBTYPE` để xác định đúng bộ MEL áp dụng. Trường `eff_from`, `eff_till` ghi hiệu lực từng item (đa số rỗng — không giới hạn thời gian); `action` ghi nhận thao tác (mẫu toàn bộ = `INSERT`) — phục vụ versioning chung BR-403 cho domain MEL. Master MEL được tổ chức theo cấu trúc Section nhà sản xuất (Section P — Preface, Section 0 — General, Section 1 — EICAS Messages, Section 2 — MEL, Section 3 — CDL); mỗi trang đánh số `<section>.NN-NN-NN.x` và có ngày hiệu lực riêng theo từng trang (ví dụ từ MEL B787 R10: `Sep 30, 2025`, `Feb 24, 2021`, `Jun 19, 2024`, `Feb 08, 2018`, `Sep 25, 2019`). Hệ thống lưu trang gốc và ngày hiệu lực từng trang để truy vết revision. | BR-407 | NG-2 §II.4 — Tình trạng kỹ thuật & MEL/CDL; MEL-78A.extracted.md các cột `deviation_code`, `perf_type`, `eff_from`, `eff_till`, `action`; Extracted pages from MEL B787_R10(30SEP25).extracted.md (Preface, List of Effective Pages); toss-glossary-v0.1.md entry "Mã item MEL/CDL" |
| FUNC-407-03 | Cho phép lọc danh sách lỗi theo nhóm ảnh hưởng: phi công, tiếp viên, thợ máy. | BR-407 | NG-2 §II.4 |
| FUNC-407-04 | Tự động làm nổi bật (highlight) các MEL/lỗi mới phát sinh. | BR-407 | NG-2 §II.4 |
| FUNC-407-05 | Cho phép người dùng nhập ghi chú tính chất ảnh hưởng của MEL đối với khai thác. | BR-407 | NG-2 §II.4 |
| FUNC-407-06 | Cung cấp liên kết xem trực tiếp tài liệu MEL hiện hành từ bản ghi MEL. Hệ thống lưu trang gốc (ví dụ `P.00-01-00.x`, `2.21-31-01.x`) và ngày hiệu lực từng trang phục vụ áp Service Bulletin (xem BR-426 BRD v0.6 — SB có thể chỉ thay vài trang trong Section). | BR-407 | NG-2 §II.4; Extracted pages from MEL B787_R10(30SEP25).extracted.md (List of Effective Pages) |

### 1.8 BR-408 — Chỉ số PF (Performance Factor)

> **Vá A (PF Reports về PH3):** trong BRD PH4 v0.5, các báo cáo PF (PF Comparison, PF Trend by AC Type, PF Trend by AC Reg, PF Data Coverage) **không còn thuộc PH4**. Các FUNC ở mục này chỉ giữ phần **thu nạp, tính toán, lưu trữ lịch sử và cảnh báo** PF — đúng vai trò Master Data Owner của PH4. *(Báo cáo PF: xem PHAN-RA-BRD PH3 — BR-351…BR-356.)*

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-408-01 | Cho phép thu nạp file dữ liệu từ các đội tàu để tính toán chỉ số PF thực tế. | BR-408 | NG-2 §II.4 — Chỉ số hiệu suất (PF) |
| FUNC-408-02 | Tính PF từ điện văn ACARS đối với các tàu có nguồn dữ liệu này. | BR-408 | NG-1 §7.4 BR-408 |
| FUNC-408-03 | Áp dụng PF của kỳ trước cho các tàu thiếu dữ liệu tính toán trong kỳ hiện tại. | BR-408 | NG-1 §7.4 BR-408 |
| FUNC-408-04 | Lưu trữ lịch sử cập nhật PF cho từng tàu theo các kỳ tính toán (Data Period). | BR-408 | NG-2 §II.4 — Chỉ số hiệu suất (PF) |
| FUNC-408-05 | ~~Thống kê biến động PF của tàu bay theo thời gian.~~ *(Đã chuyển sang PH3 — báo cáo PF Trend by AC Reg / PF Trend by AC Type. Xem PHAN-RA-BRD PH3 BR-351…BR-356.)* | — | NG-1b PH3 (BRD v0.5 BR-431 đã rút phần báo cáo PF) |
| FUNC-408-06 | Cảnh báo các tàu bay thiếu dữ liệu tính toán PF (giữ lại trong PH4 — đây là cảnh báo trên dữ liệu master, không phải báo cáo). | BR-408 | NG-2 §II.4 |

### 1.9 BR-409 — Giới hạn chu kỳ bay (FC), lịch bảo dưỡng và AOG

> **Vá B (BR-409 đồng bộ AMOS, không quản lý bảo dưỡng):** trong BRD PH4 v0.5, BR-419 mới (tương ứng nội dung BR-409 cũ tại đây) được viết lại theo nguyên tắc PH5 là kênh tích hợp — PH4 chỉ "đồng bộ và lưu hiện trạng" lịch bảo dưỡng + AOG từ AMOS, **không tự quản lý bảo dưỡng**. Các FUNC bảo dưỡng ngắn/dài hạn và AOG dưới đây được điều chỉnh để bám sát ranh giới này. *(Dữ liệu gốc từ PH5 BR-528d — kênh tích hợp AMOS.)*

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-409-01 | Theo dõi giới hạn chu kỳ bay (FC — Flight Cycle) cho từng tàu bay. | BR-409 | NG-2 §II.4 — Giới hạn khai thác |
| FUNC-409-02 | Đồng bộ và lưu hiện trạng lịch bảo dưỡng ngắn hạn và lịch bảo dưỡng dài hạn từ AMOS cho từng tàu bay; PH4 không tự quản lý bảo dưỡng (AMOS là hệ thống chủ — Out-of-scope §5.2 #3). *(Dữ liệu gốc từ PH5 BR-528d — kênh tích hợp AMOS.)* | BR-409 | NG-2 §II.4 — Giới hạn khai thác; NG-1b BRD v0.5 BR-419 (viết lại theo M8) |
| FUNC-409-03 | Đồng bộ và lưu hiện trạng AOG (Aircraft on Ground) và dự kiến thời gian khắc phục từ AMOS. *(Dữ liệu gốc từ PH5 BR-528d — kênh tích hợp AMOS.)* | BR-409 | NG-2 §II.4 — Giới hạn khai thác; NG-1b BRD v0.5 BR-419 |
| FUNC-409-04 | Sinh cảnh báo khi tàu bay tiến gần giới hạn FC. | BR-409 | NG-1 §7.4 BR-409; NG-1b BRD v0.5 BR-419 (giữ rõ "sinh cảnh báo FC") |

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
| FUNC-416-02 | Cho phép hệ số quy đổi đơn vị nhiên liệu được cấu hình theo từng tàu bay cụ thể. Trường master `FUEL_MEASURE_UNIT` (Netline) nhận giá trị `KG` hoặc `LB`; trong mẫu dữ liệu hiện có chỉ quan sát thấy `KG`/`kg` (cả uppercase và lowercase tùy hãng). Golden record phải chuẩn hóa case (uppercase) khi hợp nhất. | BR-416 | NG-1 §7.4 BR-416 (hệ số quy đổi… theo từng tàu); NG-6 cột `FUEL_MEASURE_UNIT` |

### 1.17 BR-417 — Danh mục bảng dầu AHM (khai báo thủ công + tích hợp IFV)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-417-01 | Cung cấp chức năng cho điều phái viên (Dispatcher) chủ động khai báo thủ công bảng dầu (AHM — Aircraft Handling Manual) trên TOSS ở giai đoạn đầu, theo các tiêu chí phân loại do điều phái cung cấp (theo loại tàu, theo điều kiện khai thác). | BR-417 | Khảo sát 11/06 sáng §II.9; NG-1 §7.4 BR-417 |
| FUNC-417-02 | Quản lý bản ghi bảng dầu AHM theo loại tàu bay (aircraft type) và điều kiện khai thác. | BR-417 | Khảo sát 11/06 sáng §II.9 |
| FUNC-417-03 | Tích hợp tự động với phần mềm IFV *(xem OID: SME-16)* để lấy kết quả bảng dầu khi phần mềm IFV sẵn sàng (hướng dài hạn), thay thế việc khai báo thủ công ở FUNC-417-01. | BR-417 | Khảo sát 11/06 sáng §II.9 |
| FUNC-417-04 | Sinh cảnh báo cho điều phái viên khi bảng dầu AHM có thay đổi, thay thế cuộc gọi điện thoại hiện hành từ bộ phận tải/cân bằng (CLC). | BR-417 | Khảo sát 11/06 sáng §II.9 |
| FUNC-417-05 | Quản lý phiên bản và lịch sử thay đổi của bản ghi bảng dầu AHM (kế thừa cơ chế versioning tổng quát tại BR-403/FUNC-403-01…02). | BR-417 | NG-2 §II.4 — Quản lý phiên bản; Khảo sát 11/06 sáng §II.9 |

### 1.18 BR-418 — Danh mục Standard Taxi Time theo sân bay × thời gian hiệu lực

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-418-01 | Quản lý Standard Taxi Time theo sân bay (mỗi sân bay có giá trị Standard Taxi Time riêng) và theo thời gian hiệu lực (mỗi giá trị Standard Taxi Time có khoảng hiệu lực). *(Đơn vị MOI quản lý hiện hành — xem OID: SME-15.)* | BR-418 | Khảo sát 11/06 sáng §II.14 |
| FUNC-418-02 | Tự thống kê giá trị Standard Taxi Time đề xuất từ dữ liệu thực tế lấy qua QAR / QAI (Quick Access Recorder / Quick Access Information) thông qua API hoặc Database View của Tổng công ty. | BR-418 | Khảo sát 11/06 sáng §II.14 |
| FUNC-418-03 | Trình giá trị Standard Taxi Time tự thống kê cho điều phái viên duyệt trước khi áp dụng làm bản ghi danh mục có hiệu lực. | BR-418 | Khảo sát 11/06 sáng §II.14 |
| FUNC-418-04 | Sinh cảnh báo khi một sân bay thay đổi giá trị Standard Taxi Time, đặc biệt trong các đợt cao điểm (Tết, mùa cao điểm). | BR-418 | Khảo sát 11/06 sáng §II.14 |
| FUNC-418-05 | Hỗ trợ phương án đồng bộ giá trị Standard Taxi Time sang hệ thống Lido — phương án tích hợp tự động qua API/master của Lido nếu Lido có cơ chế; trường hợp Lido không có cơ chế tích hợp, giai đoạn đầu chấp nhận nhập hai lần (TOSS + Lido) *(xem OID: KS-16)*. | BR-418 | Khảo sát 11/06 sáng §II.14; NG-1 §7.4 BR-418 |
| FUNC-418-06 | Quản lý phiên bản và lịch sử thay đổi của bản ghi Standard Taxi Time theo sân bay (kế thừa BR-403/FUNC-403-01…02). | BR-418 | Khảo sát 11/06 sáng §II.14; NG-2 §II.4 — Quản lý phiên bản |

### 1.19 BR-419 — Danh mục sân bay đặc biệt và điều kiện chứng chỉ tổ bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-419-01 | Quản lý danh mục sân bay đặc biệt (sân bay địa hình/điều kiện đặc thù) — ví dụ Điện Biên, Đồng Hới *(xem OID: SME-18)*. | BR-419 | Khảo sát 11/06 sáng §II.12 |
| FUNC-419-02 | Gắn cho mỗi sân bay đặc biệt một bộ điều kiện chứng chỉ bổ sung của cơ trưởng/tổ bay (chứng chỉ riêng, điều kiện kinh nghiệm) cần thiết để được khai thác sân bay đó. | BR-419 | Khảo sát 11/06 sáng §II.12 |
| FUNC-419-03 | Cung cấp danh mục sân bay đặc biệt và điều kiện chứng chỉ đi kèm làm cơ sở dữ liệu cho cảnh báo chứng chỉ tổ bay theo sân bay (xem BR-122) và cảnh báo đổi tổ bay (xem BR-123). | BR-419 | NG-1 §7.4 BR-419 |
| FUNC-419-04 | Quản lý phiên bản và lịch sử thay đổi của danh mục sân bay đặc biệt và điều kiện chứng chỉ (kế thừa BR-403). | BR-419 | NG-2 §II.4 — Quản lý phiên bản |

### 1.20 BR-420 — Danh mục phép bay (Flight Permission) và Flight Type Code

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-420-01 | Quản lý danh mục phép bay theo cấu trúc đa chiều: quốc gia × loại tàu bay × khoảng thời gian hiệu lực × đường bay / waypoint. | BR-420 | Khảo sát 11/06 sáng §II.11 |
| FUNC-420-02 | Phân biệt và quản lý phép bay theo mùa lịch bay (xin một lần cho toàn bộ lịch thường lệ của mùa, khoảng 6–7 tháng). | BR-420 | Khảo sát 11/06 sáng §II.11 |
| FUNC-420-03 | Phân biệt và quản lý phép bay cấp riêng cho từng chuyến đối với chuyến VIP / charter (có thể cấp sát giờ) và phép bay bổ sung khi đổi sân bay dự bị / đổi điểm hạ cánh. | BR-420 | Khảo sát 11/06 sáng §II.11 |
| FUNC-420-04 | Cho phép điều phái viên nhập trực tiếp bản ghi phép bay trên TOSS ở giai đoạn đầu (không phụ thuộc SkyCheck). | BR-420 | Khảo sát 11/06 sáng §II.11 |
| FUNC-420-05 | TOSS tự sinh báo cáo phép bay từ danh mục phép bay đã quản lý. | BR-420 | Khảo sát 11/06 sáng §II.11 |
| FUNC-420-06 | Hỗ trợ rà soát phối hợp tận dụng phân tích nghiệp vụ phép bay của đội SkyCheck nếu có (qua đầu mối anh Hùng), nhưng không phụ thuộc SkyCheck. *(Tiến độ tích hợp SkyCheck — xem OID: KS-15.)* | BR-420 | Khảo sát 11/06 sáng §II.11 |
| FUNC-420-07 | Quản lý danh mục Flight Type Code (mã loại chuyến nội bộ) gồm các code O, Z, G, H, A, P, V, S… *(xem OID: SME-19)*. | BR-420 | Khảo sát 11/06 chiều §II.2 |
| FUNC-420-08 | Phân loại mỗi Flight Type Code thuộc nhóm "chuyến thường lệ" hoặc "chuyến không thường lệ" (vd code O thuộc nhóm không thường lệ), làm cơ sở nhận diện chuyến không thường lệ và phục vụ cảnh báo "OFP chưa có STS/HEAD" (xem BR-126). | BR-420 | Khảo sát 11/06 chiều §II.2 |
| FUNC-420-09 | Quản lý phiên bản và lịch sử thay đổi của danh mục phép bay và danh mục Flight Type Code (kế thừa BR-403). | BR-420 | NG-2 §II.4 — Quản lý phiên bản |

### 1.21 BR-421 — Trạng thái tàu bay (AC_STATE) và đánh dấu tàu hãng khác bay qua (overflow)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-421-01 | Quản lý trạng thái tàu bay theo trường `AC_STATE` (codeset) trong master tàu bay; ghi nhận các giá trị trạng thái xuất hiện trong nguồn Netline gồm `R` (Regular — tàu đang khai thác thường lệ) và `O` (Overflow — tàu của hãng khác chỉ bay qua FIR/qua sân bay hãng quản lý) *(xem OID: SME-29)*. | BR-421 | NG-6 cột `AC_STATE`; NG-1 §7.4 BR-421 |
| FUNC-421-02 | Đánh dấu tàu bay là tàu của hãng khác bay qua bằng cờ `REMARK = "OVERFLOW AC"` trong master tàu bay, phục vụ tách bạch đội tàu khai thác của hãng với tàu của hãng khác chỉ bay qua. | BR-421 | NG-6 cột `REMARK`; NG-1 §7.4 BR-421 |
| FUNC-421-03 | Lưu thông tin hãng khai thác (`AC_OPERATOR`) và chủ sở hữu (`AC_OWNER`) tách biệt cho mỗi tàu bay, hỗ trợ phân biệt tàu hãng (`AC_OPERATOR` = mã hãng nội bộ) với tàu hãng khác. | BR-421 | NG-6 cột `AC_OPERATOR`, `AC_OWNER` |
| FUNC-421-04 | Hỗ trợ lọc/tìm kiếm tàu bay theo trạng thái (`R`, `O`) và theo hãng khai thác để phục vụ các nghiệp vụ chỉ áp dụng cho đội tàu hãng (xếp lịch, lập OFP…) hoặc chỉ áp dụng cho tàu bay qua (quản lý phép bay qua). | BR-421 | NG-1 §7.4 BR-421 |

### 1.22 BR-422 — Cấu hình ghế tiêu chuẩn và cấu hình ghế thay thế của tàu bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-422-01 | Quản lý cấu hình ghế tiêu chuẩn (`STD_VERSION`) của tàu bay trong master tàu bay (vd `76C`, `763`, `32A`, `32C`, `77B`, `320`, `AT7`…). Đây là mã ngắn cấu hình ghế chỉ tồn tại trong nguồn Netline — nguồn FIMS không có `STD_VERSION` mã ngắn nhưng có chuỗi `SEAT` text chi tiết (vd `16BC-168YC`, `08BC-195YC`, `28BC-35YD-211YC`, `24BC-343YC`) cùng các trường số (`C_CLASS`, `WY_CLASS`, `C_NC`, `Y_NY`, `C_NC_80`, `Y_NY_80`, `ON_SEAT_FLOOR`, `CENTER_TANK`). Golden record phải hợp nhất hai nguồn (xem FUNC-427-04). | BR-422 | NG-6 cột `STD_VERSION`; NG-7 cột `SEAT`, `C_CLASS`, `WY_CLASS`, `C_NC`, `Y_NY`, `C_NC_80`, `Y_NY_80`, `ON_SEAT_FLOOR`, `CENTER_TANK` |
| FUNC-422-02 | Quản lý tối thiểu 4 cấu hình ghế thay thế (`STD_VERSION_ALT_1`, `STD_VERSION_ALT_2`, `STD_VERSION_ALT_3`, `STD_VERSION_ALT_4`) cho cùng một tàu bay, cho phép chuyển đổi cấu hình ghế khi cần. | BR-422 | NG-6 các cột `STD_VERSION_ALT_1..4` trong header |
| FUNC-422-03 | Cho phép chọn cấu hình ghế đang áp dụng (giữa `STD_VERSION` và các `STD_VERSION_ALT_n`) cho mỗi tàu bay theo từng giai đoạn hiệu lực (kế thừa cơ chế lịch sử khai thác tại FUNC-405-05). | BR-422 | NG-1 §7.4 BR-422; NG-6 |

### 1.23 BR-423 — AC_INDEX và cỡ tổ bay tiêu chuẩn (cockpit/cabin)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-423-01 | Quản lý trường `AC_INDEX` ở master tàu bay (chỉ số nội bộ gắn với tàu bay) *(xem OID: SME-30)*. | BR-423 | NG-6 cột `AC_INDEX`; NG-1 §7.4 BR-423 |
| FUNC-423-02 | Quản lý cỡ tổ bay tiêu chuẩn của tàu bay tại buồng lái qua trường `CREWSIZE_COCKPIT` (số phi công tiêu chuẩn cho một chuyến bay với tàu này). | BR-423 | NG-6 cột `CREWSIZE_COCKPIT` |
| FUNC-423-03 | Quản lý cỡ tổ bay tiêu chuẩn của tàu bay tại khoang khách qua trường `CREWSIZE_CABIN` (số tiếp viên tiêu chuẩn cho một chuyến bay với tàu này). | BR-423 | NG-6 cột `CREWSIZE_CABIN` |

### 1.24 BR-424 — Năng lực thiết bị tàu bay đối chiếu Minima sân bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-424-01 | Quản lý năng lực hệ thống hạ cánh bằng thiết bị (ILS — Instrument Landing System) của tàu bay qua trường `ILS_EQUIPMENT`. Giá trị quan sát trong mẫu dữ liệu Netline = `I` đồng nhất trên toàn bộ tàu bay. | BR-424 | NG-6 cột `ILS_EQUIPMENT` |
| FUNC-424-02 | Quản lý năng lực tự động hạ cánh của tàu bay qua trường `AUTOLAND`. Giá trị quan sát trong mẫu dữ liệu Netline = `Y` đồng nhất. | BR-424 | NG-6 cột `AUTOLAND` |
| FUNC-424-03 | Quản lý năng lực hệ thống truyền tin ACARS (Aircraft Communications Addressing and Reporting System) của tàu bay qua trường `ACARS`. Giá trị quan sát trong mẫu dữ liệu Netline = `V` ở một số tàu A320 đời cũ; trường rỗng ở các tàu B767/B777 trong mẫu. | BR-424 | NG-6 cột `ACARS` |
| FUNC-424-04 | Quản lý các thiết bị đặc biệt khác của tàu bay qua trường `SPECIAL_EQUIPMENT` (danh mục mở, do nguồn không liệt kê cố định; mẫu dữ liệu hiện có để rỗng). | BR-424 | NG-6 cột `SPECIAL_EQUIPMENT` |
| FUNC-424-05 | Cung cấp dữ liệu năng lực thiết bị tàu bay (ILS, AUTOLAND, ACARS, SPECIAL_EQUIPMENT) cho chức năng đối chiếu với tiêu chuẩn tối thiểu Minima của sân bay (xem BR-410/FUNC-410-04). | BR-424 | NG-1 §7.4 BR-424 |

### 1.25 BR-425 — Cấp tiếng ồn và thông tin liên lạc của tàu bay

> **Vá D (BR-425 thêm OID: SME-44):** trong BRD PH4 v0.5, mã BR-425 đã được dùng cho khung "công cụ biên soạn MEL dùng chung Boeing+Airbus" với cờ OID SME-44 cho tên định dạng thứ ba (Airbus FODM/định dạng xuất). Ở v0.4 phân rã này, các FUNC dưới đây vẫn giữ ngữ nghĩa BR-425 cũ (NOISE/RADIO/PHONE) theo cấu trúc v0.3; OID SME-44 được ghi chú để truy vết tới BRD v0.5. *(Định dạng MEL Airbus thứ ba — xem OID: SME-44.)*

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-425-01 | Quản lý cấp tiếng ồn (`NOISE`) của tàu bay làm cơ sở kiểm tra giới hạn khai thác đêm và phí tiếng ồn theo sân bay. | BR-425 | NG-6 cột `NOISE` |
| FUNC-425-02 | Quản lý thông tin liên lạc radio (`RADIO`) gắn với tàu bay. | BR-425 | NG-6 cột `RADIO` |
| FUNC-425-03 | Quản lý thông tin liên lạc điện thoại (`PHONE`) gắn với tàu bay. | BR-425 | NG-6 cột `PHONE` |
| FUNC-425-04 | Cung cấp dữ liệu NOISE của tàu bay cho chức năng tính phí tiếng ồn theo sân bay (xem BR-410/FUNC-410-12). *(xem OID: SME-44)* | BR-425 | NG-1 §7.4 BR-425 |

### 1.26 BR-426 — Hạn chế sân bay khai thác theo tàu bay (AP_RESTRICTION)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-426-01 | Quản lý trường `AP_RESTRICTION` (hạn chế sân bay khai thác) gắn với từng bản ghi tàu bay trong master tàu bay. Giá trị quan sát trong mẫu dữ liệu Netline = `N` đồng nhất *(codeset đầy đủ — xem OID: SME-31)*. | BR-426 | NG-6 cột `AP_RESTRICTION`; NG-1 §7.4 BR-426 |
| FUNC-426-02 | Cung cấp dữ liệu `AP_RESTRICTION` cho các chức năng cảnh báo/kiểm tra khi xếp tàu bay vào chuyến bay đến/đi từ sân bay bị hạn chế. | BR-426 | NG-1 §7.4 BR-426 |

### 1.27 BR-427 — Hợp nhất master tàu bay từ FIMS + Netline thành golden record

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-427-01 | Hợp nhất master tàu bay từ hai nguồn FIMS và Netline thành một bản ghi golden record duy nhất theo khóa (số đăng ký `REGISTRATION`/`AC_REG` × giai đoạn hiệu lực `VALID_SINCE`–`VALID_UNTIL`). | BR-427 | NG-6 các cột `REGISTRATION`, `VALID_SINCE`, `VALID_UNTIL`; NG-7 cột `AC_REG`; NG-1 §7.4 BR-427 |
| FUNC-427-02 | Duy trì bảng ánh xạ codeset loại tàu bay giữa hai nguồn: Netline dùng `AC_SUBTYPE` và `AC_SUBTYPE_NAME`; FIMS dùng `AC_TYPE`, `AC_SUBTYPE`, `AC_TYPE_1`, `AC_MODEL`, `AC_TYPE_ICAO`. | BR-427 | NG-6 cột `AC_SUBTYPE`, `AC_SUBTYPE_NAME`; NG-7 cột `AC_TYPE`, `AC_SUBTYPE`, `AC_TYPE_1`, `AC_MODEL`, `AC_TYPE_ICAO` |
| FUNC-427-03 | Hợp nhất các thuộc tính trọng tải và sức chứa từ hai nguồn (FIMS: `MTOW_CONFIG`, `MAX_PAYLOAD`, `TANK_CAPACITY`; Netline: `MAX_TAKEOFF_WGT`, `DRY_OPERATING_WGT`, `CARGO_CAPACITY`, `FUEL_CAPACITY`, `AVG_FUEL_CONSUMP`) theo quy tắc ưu tiên nguồn *(xem OID: KS-30)*. | BR-427 | NG-6, NG-7 (đối chiếu cột) |
| FUNC-427-04 | Hợp nhất thông tin cấu hình ghế từ hai nguồn. FIMS có cột chi tiết: chuỗi `SEAT` (ví dụ `16BC-168YC`, `08BC-195YC`, `28BC-35YD-211YC`, `29BC-45YD-231YC`, `24BC-343YC`), `C_CLASS` (số ghế hạng C), `WY_CLASS` (tổng số ghế W+Y), `C_NC` (số hàng C 100%), `Y_NY` (số hàng Y 100%), `C_NC_80` (số hàng C 80% load), `Y_NY_80` (số hàng Y 80% load), `ON_SEAT_FLOOR` (vd `On seat`), `CENTER_TANK` (cờ 0/1/2). Netline có `STD_VERSION` mã ngắn + tối đa 4 cấu hình thay thế `STD_VERSION_ALT_1..4`. Golden record phải mix mã ngắn Netline với chi tiết FIMS — không loại bỏ thông tin nào. | BR-427 | NG-7 cột `SEAT`, `C_CLASS`, `WY_CLASS`, `C_NC`, `Y_NY`, `C_NC_80`, `Y_NY_80`, `ON_SEAT_FLOOR`, `CENTER_TANK`; NG-6 cột `STD_VERSION`, `STD_VERSION_ALT_1..4` |
| FUNC-427-05 | Quản lý nhóm phụ (`SUB_GROUP`) của tàu bay từ FIMS (vd giá trị `F` ở một số tàu A321) — phục vụ phân nhóm báo cáo nội bộ. | BR-427 | NG-7 cột `SUB_GROUP` |
| FUNC-427-06 | Ghi nhận lịch sử thay đổi của bản ghi golden record (kế thừa cơ chế versioning BR-403/FUNC-403-01..02) và lưu thông tin cập nhật cuối cùng từ Netline (`LAST_UPDATE` — dạng Excel serial timestamp ví dụ `38415.6078819444`, cần parse sang kiểu ngày/giờ chuẩn; `LAST_UPDATE_USER_ID` — định danh viết tắt ví dụ `HUNGTV`, `THANG_FC`, `KIENND`, `HUNGND`, `QUYHT`, `KHDUNG`, cần ánh xạ sang IAM TOSS khi tích hợp PH5; `RECORD_ID` — số nguyên tăng quan sát phạm vi `1.012.272`–`27.719.427`). Nguồn FIMS chỉ có trường `ID` (số tự tăng), không có timestamp/user cập nhật. | BR-427 | NG-6 cột `LAST_UPDATE`, `LAST_UPDATE_USER_ID`, `RECORD_ID`; NG-2 §II.4 |

### 1.28 BR-428 — Included Baggage Allowance theo nhóm đường bay × hạng khách

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-428-01 | Quản lý, khai báo trọng lượng hành lý tiêu chuẩn (Included Baggage Allowance) theo từng nhóm đường bay, đặc trưng bởi quốc gia đi — quốc gia đến — hạng khách. | BR-428 | NG-8 dòng 206 |
| FUNC-428-02 | Cho phép tạo, chỉnh sửa và quản lý phiên bản các bản ghi Included Baggage Allowance theo từng giai đoạn hiệu lực (kế thừa BR-403). | BR-428 | NG-2 §II.4; NG-1 §7.4 BR-428 |

### 1.29 BR-429 — Sector Groups by FH (nhóm chặng bay theo giờ bay)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-429-01 | Quản lý, khai báo, định nghĩa các nhóm chặng bay theo giờ bay (Sector Groups by FH — Flight Hours). | BR-429 | NG-8 dòng 207 |
| FUNC-429-02 | Cho phép chọn phạm vi của nhóm là Nội địa (NĐ) hay Quốc tế (QT) cho mỗi nhóm chặng. | BR-429 | NG-8 dòng 207 |
| FUNC-429-03 | Cho phép khai báo khoảng giờ bay (FH) cho mỗi nhóm chặng. | BR-429 | NG-8 dòng 207 |
| FUNC-429-04 | Cho phép đặt tên nhóm cho mỗi nhóm chặng đã định nghĩa. | BR-429 | NG-8 dòng 207 |

### 1.30 BR-430 — Scheduled TAT theo nhóm nối chặng

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-430-01 | Quản lý, khai báo TAT tiêu chuẩn (Scheduled TAT — Scheduled Turnaround Time) theo từng nhóm nối chặng, ví dụ các nhóm `QT TRUNG–QT NGAN`, `QT NGAN–NOI DIA`…. | BR-430 | NG-8 dòng 208 |
| FUNC-430-02 | Cho phép tạo, chỉnh sửa và quản lý phiên bản các bản ghi Scheduled TAT theo từng giai đoạn hiệu lực (kế thừa BR-403). | BR-430 | NG-2 §II.4; NG-1 §7.4 BR-430 |

### 1.31 BR-431 — Commercial Config (số ghế mở bán C/W/Y theo chặng × giai đoạn × AC subtype)

> **Vá A (PF Reports về PH3):** trong BRD PH4 v0.5, mã BR-431 đã được dùng cho "lưu trữ lịch sử PF data + cảnh báo tàu thiếu PF" (Nhóm E — Performance Factor), và các báo cáo PF đã chuyển sang PH3 BR-351…BR-356. Trong v0.4 phân rã này, các FUNC dưới đây vẫn giữ ngữ nghĩa BR-431 cũ (Commercial Config) theo cấu trúc v0.3 — không có nội dung sinh báo cáo PF nào ở đây để xóa. *(Báo cáo PF: xem PHAN-RA-BRD PH3 — BR-351…BR-356.)*

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-431-01 | Cho phép tải lên file LBM chi tiết để nạp dữ liệu Commercial Config. | BR-431 | NG-8 dòng 209 |
| FUNC-431-02 | Trích xuất số ghế mở bán theo các hạng C/W/Y cho từng chặng bay, từng giai đoạn thời gian áp dụng, và từng `AC_SUBTYPE`. | BR-431 | NG-8 dòng 209 |
| FUNC-431-03 | Cho phép sửa hoặc cập nhật thủ công số ghế mở bán từng hạng theo từng giai đoạn và từng `AC_SUBTYPE`. | BR-431 | NG-8 dòng 209 |
| FUNC-431-04 | Quản lý phiên bản và lịch sử thay đổi của bản ghi Commercial Config (kế thừa BR-403). | BR-431 | NG-2 §II.4; NG-1 §7.4 BR-431 |

### 1.32 BR-432 — Planned Version (quản lý version sản lượng)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-432-01 | Cho phép thêm, sửa, xóa các version sản lượng (Planned Version). | BR-432 | NG-8 dòng 235 |
| FUNC-432-02 | Mỗi version sản lượng được khai báo theo Năm. | BR-432 | NG-8 dòng 235 |
| FUNC-432-03 | Mỗi version sản lượng có thuộc tính loại với giá trị `UHT` hoặc `KH`. | BR-432 | NG-8 dòng 235 |
| FUNC-432-04 | Mỗi version sản lượng có tên version do người dùng đặt. | BR-432 | NG-1 §7.4 BR-432 |
| FUNC-432-05 | Mỗi version sản lượng đi kèm danh sách chuyến bay sản lượng thuộc version đó. | BR-432 | NG-1 §7.4 BR-432 |
| FUNC-432-06 | Quản lý phiên bản và lịch sử thay đổi của bản ghi Planned Version (kế thừa BR-403). | BR-432 | NG-2 §II.4 |

---

## 2. Ma trận truy vết BR → FUNC

| BR (mã v0.3) | Số FUNC | Danh sách FUNC | Ghi chú vá v0.4 |
|---|---|---|---|
| BR-401 | 2 | FUNC-401-01, FUNC-401-02 | — |
| BR-402 | 2 | FUNC-402-01, FUNC-402-02 | — |
| BR-403 | 2 | FUNC-403-01, FUNC-403-02 | — |
| BR-404 | 4 | FUNC-404-01 … FUNC-404-04 | — |
| BR-405 | 5 | FUNC-405-01 … FUNC-405-05 | — |
| BR-406 | 4 | FUNC-406-01 … FUNC-406-04 | — |
| BR-407 | 6 | FUNC-407-01 … FUNC-407-06 | — |
| BR-408 | 6 | FUNC-408-01, FUNC-408-02, FUNC-408-03, FUNC-408-04, ~~FUNC-408-05~~, FUNC-408-06 | Vá A — FUNC-408-05 (PF Trend) chuyển sang PH3 |
| BR-409 | 4 | FUNC-409-01 … FUNC-409-04 | Vá B — FUNC-409-02/03/04 viết lại theo nguyên tắc "đồng bộ AMOS, không tự quản lý bảo dưỡng" |
| BR-410 | 12 | FUNC-410-01 … FUNC-410-12 | — |
| BR-411 | 2 | FUNC-411-01, FUNC-411-02 | — |
| BR-412 | 6 | FUNC-412-01 … FUNC-412-06 | — |
| BR-413 | 4 | FUNC-413-01 … FUNC-413-04 | — |
| BR-414 | 6 | FUNC-414-01 … FUNC-414-06 | — |
| BR-415 | 6 | FUNC-415-01 … FUNC-415-06 | — |
| BR-416 | 2 | FUNC-416-01, FUNC-416-02 | — |
| BR-417 | 5 | FUNC-417-01 … FUNC-417-05 | — |
| BR-418 | 6 | FUNC-418-01 … FUNC-418-06 | — |
| BR-419 | 4 | FUNC-419-01 … FUNC-419-04 | — |
| BR-420 | 9 | FUNC-420-01 … FUNC-420-09 | — |
| BR-421 | 4 | FUNC-421-01 … FUNC-421-04 | — |
| BR-422 | 3 | FUNC-422-01, FUNC-422-02, FUNC-422-03 | — |
| BR-423 | 3 | FUNC-423-01, FUNC-423-02, FUNC-423-03 | — |
| BR-424 | 5 | FUNC-424-01 … FUNC-424-05 | — |
| BR-425 | 4 | FUNC-425-01 … FUNC-425-04 | Vá D — bổ sung OID SME-44 trỏ định dạng MEL Airbus thứ ba |
| BR-426 | 2 | FUNC-426-01, FUNC-426-02 | — |
| BR-427 | 6 | FUNC-427-01 … FUNC-427-06 | — |
| BR-428 | 2 | FUNC-428-01, FUNC-428-02 | — |
| BR-429 | 4 | FUNC-429-01 … FUNC-429-04 | — |
| BR-430 | 2 | FUNC-430-01, FUNC-430-02 | — |
| BR-431 | 4 | FUNC-431-01 … FUNC-431-04 | Ghi chú vá A — không có FUNC PF báo cáo nào trong v0.3 cần xóa (BR-431 cũ là Commercial Config) |
| BR-432 | 6 | FUNC-432-01 … FUNC-432-06 | — |
| **Tổng** | **141** | — | v0.3 = 142 → v0.4 = 141 (gỡ FUNC-408-05 chuyển sang PH3) |

**Vá C (Nhóm K):** v0.3 hoàn toàn không có FUNC nào trỏ về BR-470/471/472/473 — các BR đó chỉ xuất hiện trong khung BRD PH4 v0.4 (cũ) và đã chuyển sang PH2 v0.6 (BR-258…BR-261) trước khi v0.3 phân rã chúng. Không có FUNC nào cần xóa khỏi v0.4 vì lý do này.

---

## 3. Danh sách "(chưa có nguồn — cần SME bổ sung)" và cờ `[cần xác nhận]`

### 3.1 Cờ đã chuyển về OID-TOSS-001 (v0.4 đồng nhất tham chiếu OID)

Toàn bộ cờ `[cần xác nhận]` của v0.3 nay được trỏ về sổ cái OID duy nhất tại `ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md`. Bảng dưới đây tóm tắt vị trí cờ và mã OID tương ứng đã chốt trong BRD PH4 v0.5:

| FUNC | Nội dung cần xác nhận | Mã OID |
|---|---|---|
| FUNC-405-03 | Tên tiếng Việt chính thức cho biến thể "thuê ướt kết hợp / tự lo nhiên liệu" và quy ước hạch toán | SME-10 |
| FUNC-417-03 | Tên đầy đủ của phần mềm IFV (đầu mối: anh Kiếm) và phạm vi/giao diện tích hợp với TOSS | SME-16 |
| FUNC-418-01 | Đơn vị MOI đang quản lý Standard Taxi Time hiện hành | SME-15 |
| FUNC-418-05 | Phương án đồng bộ Standard Taxi Time sang Lido (API/master hay nhập hai lần) | KS-16 |
| FUNC-419-01 | Danh mục đầy đủ các sân bay đặc biệt | SME-18 |
| FUNC-420-06 | Tiến độ tích hợp SkyCheck | KS-15 |
| FUNC-420-07 | Danh mục đầy đủ các Flight Type Code và ý nghĩa từng code | SME-19 |
| FUNC-421-01 | Danh mục đầy đủ các giá trị của `AC_STATE` ngoài `R` và `O` | SME-29 |
| FUNC-423-01 | Ngữ nghĩa của trường `AC_INDEX` trong master tàu bay | SME-30 |
| FUNC-425 (tổng) | Định dạng MEL Airbus thứ ba (FODM / SB / OPS) trong khung MEL tool đa hãng | SME-44 |
| FUNC-426-01 | Codeset trường `AP_RESTRICTION` (giá trị và ý nghĩa) | SME-31 |
| FUNC-427-03 | Quy tắc ưu tiên/đối chiếu khi giá trị trọng tải/sức chứa khác nhau giữa FIMS và Netline | KS-30 |

### 3.2 Hạng mục "(chưa có nguồn — cần SME bổ sung)"

Trong phạm vi Phân hệ 4, các BR-401 … BR-432 đã có nguồn trích dẫn rõ ràng từ NG-1/NG-2/NG-3/NG-4/NG-5/NG-6/NG-7/NG-8; v0.4 không phát sinh FUNC giả định. Một số khía cạnh đã nhận diện thuộc nhóm "cần làm rõ ở các đợt khảo sát kế tiếp" nhưng KHÔNG được tạo thành FUNC trong tài liệu này (tuân thủ §0):

| Khía cạnh chưa được nguồn mô tả đủ để phân rã thành FUNC | BR liên quan | Ghi chú |
|---|---|---|
| Quy ước cụ thể của "cấu trúc Metadata chuẩn" | BR-402 | Cần SME bổ sung chuẩn metadata cụ thể. |
| Danh sách hệ thống vệ tinh sẽ tiêu thụ qua API/Webhook và hợp đồng dữ liệu | BR-404 | Phụ thuộc tài liệu tích hợp PH5; sẽ phân rã ở SRS phân hệ tích hợp. |
| Bộ trường thuộc tính chi tiết của các nhóm trong danh mục Sân bay | BR-410 | Cần SME hàng không bổ sung. |
| Bộ trường thuộc tính chi tiết của Master MEL | BR-407 | Cần SME kỹ thuật bổ sung. |
| Định nghĩa cụ thể của "khuyến nghị Tankering" (công thức, đầu vào, đầu ra) | BR-413 | Cần SME. |
| Danh sách tham số vận hành đầy đủ ngoài 5 tham số đã nêu | BR-415 | Có thể phát sinh thêm khi phân rã các phân hệ khác. |
| Cấu trúc dữ liệu chi tiết của bảng dầu AHM | BR-417 | Cần điều phái cung cấp tài liệu AHM hiện hành. |
| Cấu trúc dữ liệu chi tiết của bản ghi phép bay | BR-420 | Cần SME phép bay xác nhận. |
| Quy tắc đối chiếu chi tiết khi `AC_OPERATOR` ≠ `AC_OWNER` | BR-421 | Chưa có chú giải nghiệp vụ. |
| Quy tắc chọn cấu hình ghế đang áp dụng giữa `STD_VERSION` và 4 ALT | BR-422 | Chưa có quy tắc lựa chọn. |
| Quy tắc ưu tiên golden record FIMS↔Netline | BR-427 | OID: KS-30. |
| Cấu trúc bản ghi Included Baggage Allowance chi tiết | BR-428 | Nguồn YCKT chỉ ở mức nguyên tắc. |
| Quy tắc khai báo khoảng FH (đơn vị, biên, chồng lấn) | BR-429 | Chưa có ràng buộc. |
| Đơn vị thời gian và ràng buộc đối với Scheduled TAT | BR-430 | Chưa có ràng buộc. |
| Định dạng file LBM và quy tắc mapping cột → trường Commercial Config | BR-431 | Nguồn YCKT chưa mô tả. |
| Quy tắc gán chuyến bay sản lượng vào Planned Version | BR-432 | Nguồn YCKT chỉ nêu nguyên tắc. |

### 3.3 Tham chiếu phạm vi cần làm rõ ở BRD §5.3

- "Phương án khi hệ thống lập kế hoạch bay không cho phép tích hợp trực tiếp" — không thuộc Phân hệ 4 nhưng có ảnh hưởng tới FUNC-404 nếu Lido không cho phép kết nối API.
- "Phạm vi xử lý phần nhiên liệu hãng tự cấp cho tàu thuê ướt kết hợp (Damp Lease)" — liên quan trực tiếp FUNC-405-03; xem OID: SME-10.

---

## 4. Ánh xạ BR cũ (v0.3) ↔ BR mới (BRD PH4 v0.5)

> **Mục đích:** giúp người đọc đối chiếu hai khung mã đang cùng tồn tại — khung BR-401…BR-432 (32 BR cũ) mà v0.3/v0.4 phân rã đang dùng, và khung BR-401…BR-469 (69 BR mới, 10 nhóm A–J) trong BRD PH4 v0.5. Bảng dưới đây chỉ ghi quan hệ chính theo nội dung nghiệp vụ; ánh xạ tinh hơn (theo FUNC) chờ đợt làm lại (rewrite) sau.

| BR cũ (v0.3) | Nội dung | Tương ứng BR mới (BRD v0.5) | Ghi chú |
|---|---|---|---|
| BR-401 | Tổ chức phân hệ danh mục tách biệt | BR-401 | Trùng |
| BR-402 | Cấu trúc Metadata chuẩn | BR-402 | Trùng |
| BR-403 | Versioning bản ghi danh mục | BR-403 | Trùng |
| BR-404 | Đồng bộ chủ động API/Webhook + phân quyền | BR-404 | Trùng |
| BR-405 | Danh mục tàu bay (định danh, sở hữu/thuê, lịch sử) | BR-406 + BR-408 + BR-409 | Tách: BR-406 = thông tin chung; BR-408 = hiệu lực khai thác; BR-409 = sở hữu/thuê |
| BR-406 | Thuộc tính khai thác tàu bay + nhóm đội tàu | BR-410 + BR-422 | Tách: BR-410 = thuộc tính chi tiết; BR-422 = Fleet Grouping Category |
| BR-407 | Master MEL + đồng bộ MEL/CDL/defects | BR-424 + BR-427 | BR-424 = Master MEL; BR-427 = đồng bộ MEL/CDL/Defect AMOS |
| BR-408 | Chỉ số PF | BR-428 + BR-429 + BR-430 + BR-431 | Tách: upload+tính, Data Period, Import, lưu trữ+cảnh báo (Báo cáo PF chuyển PH3) |
| BR-409 | Giới hạn FC + lịch bảo dưỡng + AOG | BR-419 | Viết lại: chỉ đồng bộ AMOS, không tự quản lý bảo dưỡng |
| BR-410 | Danh mục sân bay | BR-432 … BR-440 | Mở rộng thành Nhóm F (9 BR chi tiết) |
| BR-411 | Danh mục dịch vụ sân bay phục vụ cảnh báo | BR-441 | Trùng nội dung |
| BR-412 | Danh mục chặng bay + Optimization | BR-446 … BR-450 | Mở rộng thành Nhóm G (Route Master) |
| BR-413 | Quy tắc Tankering | BR-455 + BR-456 | Tách: tính toán + upload file khuyến nghị |
| BR-414 | Danh mục bổ trợ (phi công, tiếp viên, quốc gia, FIR, ULD, email) | BR-461 … BR-465 | Mở rộng thành Nhóm I |
| BR-415 | Cấu hình tham số vận hành | BR-468 + BR-469 | Tách: tham số chính + FLIGHT BASE TIME |
| BR-416 | Hệ số quy đổi đơn vị nhiên liệu | BR-459 | Trùng nội dung |
| BR-417 | Bảng dầu AHM | BR-460 | Trùng nội dung |
| BR-418 | Standard Taxi Time | BR-443 | Trùng nội dung (Nhóm F) |
| BR-419 | Sân bay đặc biệt + chứng chỉ tổ bay | BR-442 | Trùng nội dung (Nhóm F) |
| BR-420 | Phép bay + Flight Type Code | BR-466 + BR-467 | Tách: phép bay + Flight Type Code |
| BR-421 | AC_STATE + overflow | BR-417 | Trùng nội dung (Nhóm B — codeset trạng thái) |
| BR-422 | STD_VERSION + ALT (cấu hình ghế thay thế) | BR-412 | Trùng nội dung (Nhóm B) |
| BR-423 | AC_INDEX + CREWSIZE | BR-413 | Trùng nội dung (Nhóm B) |
| BR-424 | ILS/AUTOLAND/ACARS/SPECIAL_EQUIPMENT | BR-414 | Trùng nội dung (Nhóm B) |
| BR-425 | NOISE/RADIO/PHONE | BR-415 | Trùng nội dung (Nhóm B) — **lưu ý: mã BR-425 trong BRD v0.5 dùng cho công cụ MEL Boeing/Airbus, không phải NOISE** |
| BR-426 | AP_RESTRICTION | BR-416 | Trùng nội dung (Nhóm B) |
| BR-427 | Golden record FIMS+Netline | BR-418 | Trùng nội dung (Nhóm B) |
| BR-428 | Included Baggage Allowance | BR-451 | Trùng nội dung (Nhóm G) |
| BR-429 | Sector Groups by FH | BR-452 | Trùng nội dung (Nhóm G) |
| BR-430 | Scheduled TAT | BR-453 | Trùng nội dung (Nhóm G) |
| BR-431 | Commercial Config | BR-454 | Trùng nội dung (Nhóm G) — **lưu ý: mã BR-431 trong BRD v0.5 dùng cho lưu trữ lịch sử PF, không phải Commercial Config** |
| BR-432 | Planned Version | BR-457 | Trùng nội dung (Nhóm G) |

**Khoảng trống ánh xạ (BR mới chưa có FUNC ở v0.4):** BR-405 (danh mục dùng chung vs riêng TOSS), BR-407 (đa định danh REG/ALT_REG/logical_no), BR-411 (DOW versioning theo W&B), BR-420 (APU/Packs INOP), BR-421 (Aircraft Type + giới hạn ZFW), BR-423 (AC Subtype chi tiết 32A/32B/32C/35A/35B/78A/78B/78C), BR-425/426 (MEL tool Boeing/Airbus + SB hotfix), BR-433 (Alternate Airports), BR-434 (hạ tầng cất hạ cánh chi tiết), BR-435 (Weather Landing Minima), BR-436 (thủ tục SID/STAR/IAP), BR-437 (phục vụ mặt đất chi tiết), BR-438 (Parking Stand chi tiết), BR-439 (NOTAM/an ninh sân bay), BR-440 (phí thương mại sân bay), BR-444 (Obstacle/EOSID + import .stx), BR-445 (LIDO Chart PDF + checkbox đủ tài liệu), BR-447 (EDTO chi tiết), BR-448 (sân bay dự bị dọc đường), BR-449 (MCMR upload), BR-450 (chi phí điều hành/bay qua), BR-458 (Fuel Price Management chi tiết). Các BR này được phân rã FUNC trong đợt rewrite kế tiếp.

---

*Phiên bản 0.5 — 2026-06-23 — BA Lead — Fold các mục "đã clear" từ rà soát RSN-PH4-2026-06-23 (Aircraft Master Netline/FIMS + MEL/CDL Penalty + glossary Master MEL) vào các FUNC cha tương ứng; không tạo FUNC mới, không đổi mã. Phiên bản 0.4 — 2026-06-17 — BA Lead — Vá theo BRD PH4 v0.5 (A–D): (A) BR-431 PF Reports về PH3 — gỡ FUNC-408-05 Trend PF, thêm note ở §1.8 và §1.31; (B) BR-419 đồng bộ AMOS không tự quản lý bảo dưỡng — viết lại FUNC-409-02/03/04 ở §1.9; (C) Nhóm K BR-470…BR-473 không có FUNC ở v0.3 cần xóa, ghi chú tham chiếu PH2 v0.6 ở §2; (D) BR-425 thêm OID: SME-44 trong §1.25; chuẩn hóa toàn bộ cờ `[cần xác nhận]` về tham chiếu OID-TOSS-001 trong §3.1; thêm §4 ánh xạ BR cũ↔BR mới để truy vết hai chiều; cập nhật frontmatter (`version 0.3 → 0.4`, `date 2026-06-12 → 2026-06-17`, `parent_document → BRD-TOSS-PH4-quan-ly-danh-muc-v0.6.md`, `brd_version: v0.5`); tổng FUNC 142 → 141. Lịch sử các phiên bản trước (v0.1, v0.2, v0.3): xem `BA-VERSION-LOG.md`. Bản v0.3 lưu song song, chưa xóa.*
