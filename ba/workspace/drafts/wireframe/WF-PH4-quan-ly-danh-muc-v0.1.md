---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "business-analyst"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Wireframe"
parent_brd: "BRD-TOSS-PH4-quan-ly-danh-muc-v0.6.md"
parent_phanra: "PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.5.md"
---

# Wireframe — Phân hệ 4: Quản lý danh mục (Master Data) (v0.1)

> **Tài liệu wireframe nháp theo workflow P4 (Co-evolution Hybrid).** Mỗi màn hình bám sát BR/FUNC đã ghi nhận tại [BRD-TOSS-PH4 v0.5](../brd/BRD-TOSS-PH4-quan-ly-danh-muc-v0.6.md) và [PHAN-RA-BRD-PH4 v0.4](../srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.5.md). Các phần ghi `*(layout cần xác nhận sau khi có entity map)*` chờ mô hình dữ liệu khái niệm (sync/models/) hoàn thiện.
>
> **Phạm vi v0.1:** 5 màn hình UX trọng yếu (WF-PH4-01 … WF-PH4-05) đại diện cho 10 nhóm A–J của BRD PH4 v0.5. Các màn hình còn lại sẽ bổ sung ở v0.2 trở đi sau khi BA Lead duyệt khung trình bày.
>
> **Quy ước trình bày:** ASCII art rộng ~78 ký tự; mỗi WF gồm (1) tiêu đề + BR/FUNC nguồn, (2) layout ASCII, (3) ghi chú tương tác chính.

---

## WF-PH4-01 — Danh mục tàu bay (Aircraft Master)

**Nhóm B — BRD PH4 v0.5:** BR-406, BR-407, BR-408, BR-409, BR-410, BR-411, BR-414, BR-415, BR-416, BR-417, BR-418, BR-419, BR-420, BR-421 (định danh tàu bay, đa định danh, lịch sử hiệu lực, thuộc tính khai thác, sở hữu/thuê, DOW, năng lực thiết bị, AP_RESTRICTION, AC_STATE, hợp nhất FIMS+Netline, đồng bộ AMOS).

**FUNC nguồn (PHAN-RA v0.4):** FUNC-405-01…05, FUNC-406-01…04, FUNC-409-01…04, FUNC-421-01…04, FUNC-422-01…03, FUNC-423-01…03, FUNC-424-01…05, FUNC-425-01…04, FUNC-426-01…02, FUNC-427-01…06.

```
+----------------------------------------------------------------------------+
| TOSS · Quản lý danh mục > Tàu bay (Aircraft Master)        [Admin] [Logout]|
+----------------------------------------------------------------------------+
| Tìm kiếm: [ Reg / ICAO Type _______________ ]  Loại tàu: [ Tất cả  v ]     |
| Trạng thái: ( ) Tất cả  (x) Đang khai thác  ( ) Xuất đội  ( ) Overflow     |
| Sở hữu: [ Tất cả  v ]   Hãng khai thác: [ Tất cả  v ]   [ Tìm ] [ Xóa lọc ]|
+----------------------------------------------------------------------------+
| [+ Thêm tàu]  [Hợp nhất FIMS+Netline]  [Đồng bộ AMOS]  [Xuất Excel]        |
+----------------------------------------------------------------------------+
| # | Reg     | ICAO Type | Subtype | Cấu hình | MTOW(t) | Sở hữu  | Active  |
|---|---------|-----------|---------|----------|---------|---------|---------|
| 1 | VN-A350 | A359      | 35A     | C/W/Y    |  280.0  | Owned   |  Y      |
| 2 | VN-A621 | A321      | 32A     | C/Y      |   93.5  | Dry Lse |  Y      |
| 3 | VN-A861 | B789      | 78B     | C/W/Y    |  254.0  | Owned   |  Y      |
| 4 | VN-A123 | A320      | 32C     | C/Y      |   78.0  | Wet Lse |  N      |
|...|         |           |         |          |         |         |         |
+----------------------------------------------------------------------------+
| << Trang 1/12 >>                                Hiển thị: [ 25  v ] dòng   |
+----------------------------------------------------------------------------+
| [ Detail panel — chọn dòng tàu để xem chi tiết ]                           |
| +-------------------------- VN-A350 (A359) ------------------------------+ |
| | Tabs:  [Định danh] [Cấu hình ghế] [Khai thác] [Thiết bị] [MEL/Defect]  | |
| |        [Bảo dưỡng/AOG] [Lịch sử hiệu lực] [Lịch sử thay đổi]           | |
| +------------------------------------------------------------------------+ |
| | Reg: VN-A350     ICAO: A359    IATA: 359    Subtype: 35A               | |
| | Operator: VNA    Owner: VNA    Hình thức: Owned                        | |
| | MTOW: 280.0 t    DOW: 137.5 t  Tank cap: 138.0 t   AC_INDEX: 18        | |
| | Cabin: C 28 / W 36 / Y 241    Cargo cap (FWD/AFT/BULK): 30/22/4 t      | |
| | ILS CAT: III    AUTOLAND: Y   ACARS: V   Noise: 5   AP_RESTRICTION: -- |
| | AC_STATE: R     Remark: --    Valid: 2020-04-01 → (open)               | |
| | Cảnh báo: [!] Sắp hết FC trong 38 chu kỳ — đồng bộ AMOS 2026-06-17     | |
| +------------------------------------------------------------------------+ |
| [ Sửa ]  [ Vô hiệu hóa ]  [ Thêm giai đoạn hiệu lực mới ]  [ Đóng ]        |
+----------------------------------------------------------------------------+
```

**Ghi chú tương tác chính:**

- Bộ lọc trên đầu: search theo Registration / ICAO Type; filter trạng thái `AC_STATE` (R / O / xuất đội), hình thức sở hữu, hãng khai thác — phục vụ FUNC-421-04.
- Panel chi tiết dạng tabs để gom 30+ thuộc tính master (BR-410, BR-414, BR-415) tránh quá tải một màn.
- Hành động "Vô hiệu hóa" (không xóa cứng) — bám BR-403 versioning + BR-408 lịch sử khai thác in/out đội.
- Nút "Hợp nhất FIMS+Netline" mở wizard golden record (FUNC-427-01…06) — *(chi tiết wizard cần entity map cho cặp khóa REG × VALID_SINCE/UNTIL)*.
- Cảnh báo FC + đồng bộ AMOS hiển thị inline, không cho phép sửa tại đây (BR-419 — PH4 chỉ lưu hiện trạng).

---

## WF-PH4-02 — Danh mục sân bay (Airport Master)

**Nhóm F — BRD PH4 v0.5:** BR-432, BR-433, BR-434, BR-435, BR-436, BR-437, BR-438, BR-439, BR-440, BR-441, BR-442, BR-443, BR-444, BR-445. Khung MEL tool đa hãng tham chiếu BR-425 (Nhóm D).

**FUNC nguồn (PHAN-RA v0.4):** FUNC-410-01…12, FUNC-411-01…02, FUNC-418-01…06, FUNC-419-01…04.

```
+----------------------------------------------------------------------------+
| TOSS · Quản lý danh mục > Sân bay (Airport Master)         [Admin] [Logout]|
+----------------------------------------------------------------------------+
| Tabs:  [ Sân bay thường ]  [ Sân bay đặc biệt ]  [ Runway & Minima ]       |
|        [ Standard Taxi Time ]  [ Công cụ MEL — Boeing/Airbus ]             |
+----------------------------------------------------------------------------+
| TAB · Sân bay thường                                                       |
| Tìm: [ ICAO/IATA/Tên _______ ]  Region: [ Tất cả  v ]  Quốc gia: [ v ]     |
| Handling: ( ) Tất cả  ( ) Có GPU/ASU  ( ) Không hỗ trợ APU hỏng            |
| Trạng thái: (x) Đang khai thác  ( ) Vô hiệu          [ Tìm ] [ + Thêm ]    |
+----------------------------------------------------------------------------+
| # | ICAO | IATA | Tên sân bay         | Quốc gia | TZ     | Handling | Act |
|---|------|------|---------------------|----------|--------|----------|-----|
| 1 | VVNB | HAN  | Nội Bài             | VN       | +07:00 | GPU+ASU  |  Y  |
| 2 | VVTS | SGN  | Tân Sơn Nhất        | VN       | +07:00 | GPU+ASU  |  Y  |
| 3 | VVDN | DAD  | Đà Nẵng             | VN       | +07:00 | GPU      |  Y  |
| 4 | RJTT | HND  | Tokyo Haneda        | JP       | +09:00 | Full     |  Y  |
| 5 | VVDB | DIN  | Điện Biên (đặc biệt)| VN       | +07:00 | Không APU|  Y  |
+----------------------------------------------------------------------------+
| [ Detail panel — sân bay VVNB / Nội Bài ]                                  |
| Tabs: [Định danh] [Hạ tầng] [Minima/WX] [SID/STAR/IAP] [Slot/Phép bay]     |
|       [Handling/Phí] [NOTAM/An ninh] [Parking Stand] [Lịch sử thay đổi]    |
| ----------------------------------------------------------------------     |
| ICAO: VVNB    IATA: HAN    Region: SEA — VN                                |
| Loại tàu phục vụ: A320/A321/A330/A350/B777/B787/ATR72                      |
| Approach Type: ILS CAT II / RNAV / VOR     GPU: Y   ASU: Y                 |
| Khung giờ khai thác: 24/7    Slot/phép bay: theo mùa Sxx (link OID)        |
| Parking Stand: 41 stand · 22 có Air Bridge · 12 chưa rõ — [ Quản lý ]      |
+----------------------------------------------------------------------------+
| TAB · Công cụ MEL — Boeing/Airbus (BR-425)                                 |
| +-- Chọn dòng tàu --+--- Định dạng xuất ----+--- Trạng thái bộ tài liệu ---+
| | ( ) Boeing        |  [x] XML              | Airbus → Working → Pending → |
| | (x) Airbus        |  [x] OPS              | Airline                       |
| |                   |  [ ] (định dạng 3*)   | *(tên chính thức — OID:SME-44|
| +-------------------+-----------------------+------------------------------+
| Action: [Compare 2 version]  [Apply hotfix SB]  [Ký FODM — A350]           |
| Ghi chú: Boeing dùng FrameMaker+IXP; Airbus dùng FODM 10.8.                |
+----------------------------------------------------------------------------+
```

**Ghi chú tương tác chính:**

- 5 tab tách rõ: sân bay thường, sân bay đặc biệt (FUNC-419-01…04 — Điện Biên/Đồng Hới + chứng chỉ tổ bay), runway/Minima (FUNC-410-04), Standard Taxi Time (FUNC-418-01…06), MEL tool đa hãng.
- Lọc nhanh "Không hỗ trợ APU hỏng" phục vụ FUNC-411-01…02 — cơ sở cảnh báo điều hành đổi tàu.
- Quản lý Parking Stand mở popup riêng (BR-438 — phân quyền từng đầu sân bay tự cập nhật) — *(layout popup cần xác nhận sau khi có entity map Stand × AirBridge × Sân bay)*.
- Tab công cụ MEL hiển thị vòng đời 4 trạng thái `Airbus → Working → Pending → Airline` (BR-425); ô "(định dạng 3)" giữ chỗ chờ OID SME-44.
- Standard Taxi Time tab có nút "Duyệt giá trị tự thống kê từ QAR/QAI" (FUNC-418-02…03).

---

## WF-PH4-03 — Danh mục tuyến đường bay (Route Master)

**Nhóm G — BRD PH4 v0.5:** BR-446, BR-447, BR-448, BR-449, BR-450, BR-451, BR-452, BR-453, BR-454, BR-455, BR-456, BR-457.

**FUNC nguồn (PHAN-RA v0.4):** FUNC-412-01…06, FUNC-413-01…04, FUNC-428-01…02, FUNC-429-01…04, FUNC-430-01…02, FUNC-431-01…04, FUNC-432-01…06.

```
+----------------------------------------------------------------------------+
| TOSS · Quản lý danh mục > Tuyến đường bay (Route Master)   [Admin] [Logout]|
+----------------------------------------------------------------------------+
| Tabs:  [ Chặng (Sector) ]  [ Sector Groups by FH ]  [ Scheduled TAT ]      |
|        [ Commercial Config ]  [ Tankering ]  [ Planned Version ]           |
+----------------------------------------------------------------------------+
| TAB · Chặng (Sector)                                                       |
| DEP: [ HAN  v ]   ARR: [ Tất cả  v ]   Region: [ Nội địa / Quốc tế  v ]    |
| EDTO: ( ) Tất cả  ( ) Có khai thác EDTO  ( ) Không EDTO                    |
| Trạng thái: (x) Active   [ Tìm ] [ + Thêm chặng ] [ Upload MCMR ]          |
+----------------------------------------------------------------------------+
| # | Code      | DEP-ARR | GCD(nm)| Est FT  | Cost Idx | Fleet Cate | Act   |
|---|-----------|---------|--------|---------|----------|------------|-------|
| 1 | HAN-SGN   | HAN→SGN |   615  | 02:05   |    35    | NĐ-Cate1   |  Y    |
| 2 | HAN-NRT   | HAN→NRT |  2238  | 04:45   |    45    | QT-NGAN    |  Y    |
| 3 | SGN-CDG   | SGN→CDG |  5713  | 12:15   |    55    | QT-DAI     |  Y    |
| 4 | HAN-DAD   | HAN→DAD |   324  | 01:20   |    30    | NĐ-Cate1   |  Y    |
+----------------------------------------------------------------------------+
| << Trang 1/24 >>                                Hiển thị: [ 25  v ] dòng   |
+----------------------------------------------------------------------------+
| [ Popup khi nhấn "Sửa" / "+ Thêm chặng" — Edit Sector ]                    |
| +------------------------------------------------------------------------+ |
| | Code: [HAN-SGN_____]   DEP: [HAN v]  ARR: [SGN v]                      | |
| | GCD: [_615_] nm    Ground Dist: [_628_] nm    Est FT: [02:05]          | |
| | Cost Index: [_35_]    Final Reserve: [_30_] min                        | |
| | EDTO khai thác: (x) Có  ( ) Không    Loại EDTO: [ 180 phút  v ]        | |
| | Sân bay dự bị dọc đường:  [+ Thêm]  [DAD] [CXR] [VVPB]                 | |
| | Fleet Grouping (Category):                                              | |
| |   [Cate1: NĐ-Cate1 v]  [Cate2: -- v]  [Cate3: -- v]   (đến tối đa 10)  | |
| | Included Baggage Allowance: 23 kg/PAX (NĐ — Eco)                       | |
| | MCMR: [ Upload file MCMR  Q3-2026.xlsx ]   Hiệu lực: 2026-07-01 → ...   | |
| | Chi phí điều hành / bay qua: [ Xem theo giai đoạn ]                    | |
| +------------------------------------------------------------------------+ |
| [ Lưu ]  [ Hủy ]                                                          |
+----------------------------------------------------------------------------+
```

**Ghi chú tương tác chính:**

- Tab `Chặng (Sector)` là chính; 5 tab phụ ánh xạ 1-1 với nhóm danh mục liên quan: Sector Groups by FH (BR-452), Scheduled TAT (BR-453), Commercial Config (BR-454 — upload LBM), Tankering (BR-455 + BR-456 — upload khuyến nghị), Planned Version (BR-457).
- Popup edit chặng cho phép gán nhiều Fleet Grouping (Cate1…Cate10) đồng thời — BR-422 yêu cầu "một tàu map vào tất cả Category liên quan ngay khi khai báo", áp dụng tương tự cho chặng.
- Upload MCMR là file đính kèm theo giai đoạn (BR-449) — *(layout viewer MCMR theo giai đoạn cần xác nhận sau khi có entity map)*.
- Trường EDTO + Sân bay dự bị dọc đường bám BR-447, BR-448.
- Tab Tankering: bảng khuyến nghị theo `chặng × tàu × giai đoạn` + upload file (BR-456).

---

## WF-PH4-04 — Quản lý Performance Factor (PF)

**Nhóm E — BRD PH4 v0.5:** BR-428, BR-429, BR-430, BR-431. Báo cáo PF (PF Comparison / Trend / Data Coverage) đã chuyển sang **PH3 BR-351…BR-356** — PH4 chỉ giữ phần thu nạp, tính toán, lưu trữ, cảnh báo.

**FUNC nguồn (PHAN-RA v0.4):** FUNC-408-01, FUNC-408-02, FUNC-408-03, FUNC-408-04, FUNC-408-06 (FUNC-408-05 đã chuyển sang PH3).

```
+----------------------------------------------------------------------------+
| TOSS · Quản lý danh mục > Performance Factor (PF)          [Admin] [Logout]|
+----------------------------------------------------------------------------+
| PF Data Period: [ 2026-Q2 (15/04 → 14/06)  v ]   [+ Thêm kỳ] [Sửa kỳ]      |
| Phạm vi:  Đội tàu: [ A350  v ]   AC Reg: [ Tất cả  v ]                     |
| Trạng thái PF: ( ) Tất cả  ( ) Hợp lệ  (x) Sắp hết hiệu lực  ( ) Thiếu     |
+----------------------------------------------------------------------------+
| [ Upload Performance Data ]  [ Tính PF từ ACARS ]  [ Correct thủ công ]    |
| [ Tải file message ]  [ Xuất sang BackPACK/PEP/PET/FOS ]                   |
+----------------------------------------------------------------------------+
| # | Reg     | ATA Type | PF value | Valid From  | Valid To   | Data Period|
|---|---------|----------|----------|-------------|------------|------------|
| 1 | VN-A350 | A359     |  1.024   | 2026-04-15  | 2026-06-14 | 2026-Q2    |
| 2 | VN-A861 | B789     |  1.018   | 2026-04-15  | 2026-06-14 | 2026-Q2    |
| 3 | VN-A621 | A321     |  1.031   | 2026-04-15  | 2026-06-14 | 2026-Q2    |
| 4 | VN-A123 | A320     |   --     |    --       |     --     | (Thiếu) [!]|
| 5 | VN-A124 | A320     |  1.029   | 2026-02-01  | 2026-06-15 | 2026-Q1 [!]|
+----------------------------------------------------------------------------+
| Trạng thái mã hóa:                                                         |
|   [!] đỏ  = Thiếu PF hoặc PF sắp hết hiệu lực                              |
|   [~] vàng = Đang dùng PF kỳ trước (fallback)                              |
|   [v] xanh = PF hợp lệ                                                     |
+----------------------------------------------------------------------------+
| Cảnh báo tổng quát:                                                        |
|   - Đội tàu A320: 1/12 tàu thiếu PF kỳ 2026-Q2 — VN-A123                   |
|   - 3 tàu PF sắp hết hiệu lực trong 5 ngày tới                             |
|   - Kỳ tiếp theo sẽ chạy: 2026-06-21 (chu kỳ 2 tuần)                       |
+----------------------------------------------------------------------------+
| Ghi chú: Các báo cáo phân tích PF (Comparison/Trend/Data Coverage)         |
|          → xem PH3 (BR-351…BR-356).                                        |
+----------------------------------------------------------------------------+
```

**Ghi chú tương tác chính:**

- Chọn Data Period ở đầu là điểm vào duy nhất — bám BR-429 (mỗi kỳ có Label, Historical From/To Date).
- Cột "Data Period" trong bảng cho biết bản ghi đang dùng kỳ nào; nếu khác kỳ hiện hành thì gắn cờ vàng `[~]` (fallback) — BR-430.
- Nút "Upload Performance Data" cho phép multi-file (BR-430); "Tính PF từ ACARS" gọi job tổng hợp email ACARS (BR-428).
- Cảnh báo tổng quát ở khối dưới phục vụ FUNC-408-06 (cảnh báo tàu thiếu PF — giữ ở PH4 vì là cảnh báo trên master, không phải báo cáo).
- Liên kết sang báo cáo PF (PH3) đặt rõ trong footer để tránh người dùng tìm nhầm.

---

## WF-PH4-05 — Bảng quản trị danh mục (Admin panel — Nhóm E–J tổng hợp)

**Bao quát các nhóm nhỏ chưa có màn riêng:**
- Nhóm C — Phân loại tàu bay: BR-421 (Aircraft Type), BR-422 (Fleet Grouping), BR-423 (AC Subtype).
- Nhóm D — MEL/CDL/Defect (phần admin metadata): BR-424, BR-426, BR-427.
- Nhóm H — Nhiên liệu: BR-458 (Fuel Price), BR-459 (Hệ số quy đổi), BR-460 (Bảng dầu AHM).
- Nhóm I — Danh mục bổ trợ: BR-461 (Phi công/Tiếp viên), BR-462 (Quốc gia), BR-463 (FIR), BR-464 (ULD), BR-465 (Email lists), BR-466 (Phép bay), BR-467 (Flight Type Code).
- Nhóm J — Tham số vận hành: BR-468, BR-469.

**FUNC nguồn (PHAN-RA v0.4):** FUNC-407-01…06 (Master MEL admin), FUNC-413-01…04 (Tankering metadata), FUNC-414-01…06 (bổ trợ), FUNC-415-01…06 (tham số), FUNC-416-01…02 (quy đổi nhiên liệu), FUNC-417-01…05 (AHM), FUNC-420-01…09 (phép bay + Flight Type Code).

```
+----------------------------------------------------------------------------+
| TOSS · Quản lý danh mục > Quản trị danh mục                [Admin] [Logout]|
+----------------------------------------------------------------------------+
| +------------------- Menu trái -------------------+--- Content area ------+|
| | Nhóm C — Phân loại tàu bay                      |                        ||
| |  > Aircraft Type (A320/A321/A350…)              |   [chọn mục để xem]   ||
| |  > Fleet Grouping (Cate1…Cate10)                |                        ||
| |  > AC Subtype (32A/32B/35A/78B…)                |                        ||
| | Nhóm D — MEL/CDL/Defect                         |                        ||
| |  > Master MEL                                   |                        ||
| |  > MEL Category (Cockpit/Cabin/Maint.)          |                        ||
| |  > Hotfix MEL (Service Bulletin)                |                        ||
| | Nhóm H — Nhiên liệu                             |                        ||
| |  > Fuel Price (USD/tấn theo sân bay × kỳ)       |                        ||
| |  > Hệ số quy đổi đơn vị nhiên liệu              |                        ||
| |  > Bảng dầu AHM (thủ công + IFV)                |                        ||
| | Nhóm I — Danh mục bổ trợ                        |                        ||
| |  > Phi công / Tiếp viên (tham chiếu MO Plus)    |                        ||
| |  > Quốc gia                                     |                        ||
| |  > FIR (Flight Information Region)              |                        ||
| |  > ULD (Unit Load Device)                       |                        ||
| |  > Email list (Data Coverage / Daily Ops)       |                        ||
| |  > Phép bay (Flight Permission)                 |                        ||
| |  > Flight Type Code (O/Z/G/H/A/P/V/S)           |                        ||
| | Nhóm J — Tham số vận hành                       |                        ||
| |  > Tham số chung (độ tin cậy, ngưỡng…)          |                        ||
| |  > FLIGHT BASE TIME FOR CAAV                    |                        ||
| +-------------------------------------------------+------------------------+|
+----------------------------------------------------------------------------+
| Ví dụ Content area khi chọn "Fuel Price" (BR-458):                         |
| +------------------------------------------------------------------------+ |
| | Tìm: [ IATA AP Code ____ ]   Kỳ giá: [ 2026-W24  v ]                   | |
| | [+ Thêm bản ghi]  [Upload template]  [Xuất Excel]                      | |
| | # | IATA | Fuel Price (USD/t)| Valid From | Valid To   | Nguồn upload  | |
| | 1 | HAN  |   1,180.50        | 2026-06-09 | 2026-06-22 | upload 06/06  | |
| | 2 | SGN  |   1,165.00        | 2026-06-09 | 2026-06-22 | upload 06/06  | |
| | 3 | NRT  |   1,432.75        | 2026-06-09 | 2026-06-22 | upload 06/06  | |
| | ...                                                                    | |
| | Hành động dòng: [ Sửa ]  [ Xóa mềm ]  [ Lịch sử thay đổi ]              | |
| | Lưu ý: trùng khoảng hiệu lực → giá lần upload sau ghi đè (BR-458).      | |
| +------------------------------------------------------------------------+ |
+----------------------------------------------------------------------------+
| Ví dụ Content area khi chọn "Tham số chung" (BR-468):                      |
| +------------------------------------------------------------------------+ |
| | Tham số                                          | Giá trị | Cập nhật   | |
| |--------------------------------------------------|---------|------------| |
| | Hệ số độ tin cậy chuyến bay (%)                  |  98.5   | 2026-05-12 | |
| | Ngưỡng chênh fuel phi công yêu cầu - kế hoạch    |  ±300kg | 2026-05-12 | |
| | Ngưỡng chênh trọng tải ước tính - kế hoạch       |  ±500kg | 2026-04-30 | |
| | Deadline lập OFP — quốc tế                       |  3 giờ  | 2026-04-30 | |
| | Deadline lập OFP — quốc nội                      |  90 ph  | 2026-04-30 | |
| | Thời gian cảnh báo thiếu tài liệu chuyến bay     |  45 ph  | 2026-04-30 | |
| | Trọng lượng khách tiêu chuẩn — người lớn         |  75 kg  | 2026-03-01 | |
| | FLIGHT BASE TIME FOR CAAV                        |  20:00  | 2026-01-15 | |
| |--------------------------------------------------|---------|------------| |
| | [ Sửa ]   Mỗi lần sửa ghi nhận user + thời điểm + giá trị cũ            | |
| +------------------------------------------------------------------------+ |
+----------------------------------------------------------------------------+
```

**Ghi chú tương tác chính:**

- Layout chuẩn 2 cột: menu trái phân nhóm theo BRD (C/D/H/I/J), content phải là bảng CRUD đơn giản cho danh mục được chọn.
- Mỗi danh mục đều có: `[+ Thêm]`, `[Sửa]`, `[Xóa mềm]`, `[Lịch sử thay đổi]` — bám BR-403 (versioning) + nguyên tắc không xóa cứng.
- Hành động "Upload template" áp dụng cho các danh mục có nhập hàng loạt: Fuel Price (BR-458), Commercial Config (BR-454 — đã đặt ở WF-03), Tankering (BR-456 — đã đặt ở WF-03), MCMR (BR-449), Phép bay theo mùa (BR-466).
- Danh mục "Phi công / Tiếp viên" (BR-461) chỉ cho phép xem (đồng bộ từ MO Plus), không cho sửa gốc — UI ẩn nút Sửa.
- "Email list" (BR-465) phân hai danh sách riêng: Data Coverage Report + Daily Operations Report; admin tập trung tại PH5 BR-537 — PH4 chỉ tiêu thụ theo loại báo cáo.
- Form sửa "Tham số chung" (BR-468) yêu cầu xác nhận đổi giá trị + ghi audit `user + thời điểm + giá trị cũ/mới` — bám yêu cầu phân quyền.

---

## Phụ lục — Khoảng trống cần entity map (chưa wireframe ở v0.1)

Các điểm dưới đây đã được nhận diện nhưng chưa có cấu trúc dữ liệu khái niệm đủ chắc để wireframe; chờ entity map đặt tại `ba/sync/models/` rồi bổ sung ở v0.2:

| Mục | BR liên quan | Lý do hoãn |
|---|---|---|
| Wizard hợp nhất golden record FIMS+Netline | BR-418 (mã v0.5) / BR-427 (mã v0.3) | Cần entity map khóa `REG × VALID_SINCE/UNTIL` + bảng ánh xạ codeset loại tàu giữa hai nguồn. |
| Viewer file MCMR theo giai đoạn | BR-449 | Cần định nghĩa cấu trúc file MCMR (sheet, cột) và quy tắc giai đoạn. |
| Quản lý Parking Stand chi tiết per sân bay | BR-438 | Cần entity Stand × AirBridge × Sân bay × Phân quyền edit theo đầu sân bay. |
| Quản lý phép bay đa chiều (Quốc gia × Loại tàu × Đường bay × Waypoint × Mùa) | BR-466 | Cần entity map phép bay mùa vs phép bay riêng chuyến (charter/VIP) trước khi vẽ form đa chiều. |
| Cấu hình ghế thay thế STD_VERSION_ALT_1..4 + cabin layout | BR-412, BR-422 | Cần entity layout cabin chi tiết (zone, hạng, hàng ghế) — chỉ có thể vẽ sau khi data model phê duyệt. |
| Quản lý ULD theo loại × serial × kích thước × thuộc tính tàu | BR-464 | Cần entity ULD × loại tàu áp dụng. |

---

*WF-PH4 v0.1 — 2026-06-17. Tổng 5 màn hình chính bao quát 10 nhóm A–J. 6 khoảng trống chờ entity map ghi rõ ở phụ lục. Nguồn: BRD-TOSS-PH4 v0.5, PHAN-RA-BRD-PH4 v0.4.*
