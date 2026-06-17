---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Mô hình quy trình — To-Be PH4"
document_id: "TOBE-PH4"
source_br: "ba/workspace/drafts/brd/BRD-TOSS-PH4-quan-ly-danh-muc-v0.5.md (BR-401…BR-469)"
source_func: "ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.4.md (FUNC-401…FUNC-431)"
---

# Sơ đồ Quy trình To-Be — Phân hệ 4: Quản lý danh mục (Master Data)

> **Nguyên tắc (CLAUDE.md §0):** Sơ đồ này chỉ mô tả những gì đã được ghi nhận trong các nguồn BRD-TOSS-PH4 v0.5 và PHAN-RA-BRD-PH4 v0.4. Nơi nào nguồn còn cờ `[cần xác nhận]` hoặc OID chưa chốt thì giữ nhãn `*(chờ xác nhận)*`. Không suy diễn thêm bước hoặc logic phân nhánh chưa có trong nguồn.

---

## 1. Tổng quan phạm vi

| Trường | Giá trị |
|---|---|
| Phân hệ | PH4 — Quản lý danh mục (Master Data) |
| Actor chính | Admin PH4 (người quản trị danh mục); Điều phái viên (tiêu thụ + duyệt một số bản ghi); Netline, FIMS, AMOS (nguồn dữ liệu tích hợp); TOSS PH1/PH2/PH3 (hệ thống tiêu thụ) |
| Vai trò của PH4 | Nguồn sự thật duy nhất (Single Source of Truth) cho dữ liệu danh mục dùng chung; PH1–PH3 và PH5 chỉ đọc (tiêu thụ) từ PH4 (BR-401 / BR-405) |
| Ranh giới hệ thống | TOSS PH4 quản lý master data; Netline và FIMS là nguồn đồng bộ Aircraft Master (BR-418); AMOS là hệ thống chủ bảo dưỡng — PH4 chỉ đồng bộ hiện trạng (BR-419); Lido nhận Standard Taxi Time theo phương án tích hợp (BR-443 / FUNC-418-05) |
| Trigger (khởi động) | (1) Dữ liệu nguồn (Netline/FIMS/AMOS) có thay đổi → đồng bộ tự động; (2) Admin PH4 mở màn danh mục để thêm/sửa thủ công |
| Kết thúc | Bản ghi danh mục được lưu, phiên bản được ghi nhận, thay đổi được đẩy (push) cho hệ thống tiêu thụ qua API/Webhook (BR-404) |
| Nguồn BR | BR-401 … BR-469 (BRD-TOSS-PH4-quan-ly-danh-muc-v0.5.md) |
| Nguồn FUNC | FUNC-401-01 … FUNC-431-xx (PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.4.md) |

---

## 2. Sơ đồ To-Be — Aircraft Master: Đồng bộ tự động từ Netline/FIMS

> **Nguồn:** BR-406, BR-407, BR-408, BR-418; FUNC-427-01…06; FUNC-403-01…02; FUNC-404-01…04.
>
> PH4 hợp nhất (merge) dữ liệu tàu bay từ hai nguồn Netline và FIMS thành bản ghi golden record theo khóa (số đăng ký × giai đoạn hiệu lực). Mỗi thay đổi được ghi phiên bản và đẩy sang các hệ thống tiêu thụ.

```mermaid
flowchart TD
    S((Bắt đầu\nđồng bộ)) --> T1{Loại trigger\nđồng bộ?}

    T1 -->|Theo lịch hằng ngày\nFUNC-404-04| A1[TOSS kéo dữ liệu\ntừ Netline]
    T1 -->|Sự kiện thay đổi\nreal-time| A1

    A1 --> A2[TOSS kéo dữ liệu\ntừ FIMS]

    A2 --> B1[Đối chiếu hai nguồn\ntheo khóa\nAC_REG × VALID_SINCE–VALID_UNTIL\nFUNC-427-01]

    B1 --> B2{Bản ghi tồn tại\ntrong golden record?}

    B2 -->|Chưa có — tàu mới| B3[Tạo mới golden record\ntàu bay\nFUNC-405-01 … 05]
    B2 -->|Đã có — kiểm tra thay đổi| B4{Có trường\nkhác biệt?}
    B4 -->|Không có thay đổi| END_SKIP((Kết thúc —\nkhông cập nhật))
    B4 -->|Có thay đổi| B5[Cập nhật golden record\nưu tiên nguồn theo\nquy tắc OID: KS-30\nFUNC-427-03]

    B3 --> C1[Ánh xạ codeset loại tàu\nNetline ↔ FIMS\nFUNC-427-02]
    B5 --> C1

    C1 --> C2[Hợp nhất cấu hình ghế\nSTD_VERSION + ALT_1..4\nFUNC-427-04]
    C2 --> C3[Lưu phiên bản bản ghi\nai / nội dung / thời điểm\nFUNC-403-01…02]

    C3 --> D1[Đẩy thay đổi\ncho hệ thống tiêu thụ\nqua API / Webhook\nFUNC-404-01…02\nBR-404]

    D1 --> END((Kết thúc\nđồng bộ))
```

### Chú giải sơ đồ 2

- **`((...))`** — điểm bắt đầu / kết thúc quy trình.
- **`[...]`** — bước xử lý (activity) thực hiện bởi TOSS PH4.
- **`{...}`** — điểm quyết định (decision gateway).
- **Mũi tên có nhãn** — nhánh có điều kiện.
- **Quy tắc ưu tiên nguồn** khi hai nguồn xung đột: ghi `*(chờ xác nhận)*` — xem OID: KS-30 (FUNC-427-03).
- **Đồng bộ real-time** (BR-404): TOSS đẩy ngay khi phát sinh thay đổi, không chờ lịch định kỳ.

---

## 3. Sơ đồ To-Be — Aircraft Master: Quản lý thủ công bởi Admin PH4

> **Nguồn:** BR-406, BR-407, BR-408, BR-409, BR-410, BR-411, BR-412, BR-413, BR-414, BR-415, BR-416, BR-417, BR-419, BR-420; FUNC-405, FUNC-406, FUNC-408 đến FUNC-427; FUNC-403-01…02.
>
> Bên cạnh đồng bộ tự động, Admin PH4 có thể thêm/sửa thuộc tính không đến từ Netline/FIMS (ví dụ: loại hình thuê, APU/Packs INOP, hạn chế sân bay) và duyệt một số bản ghi từ tự thống kê (ví dụ: Standard Taxi Time).

```mermaid
flowchart TD
    S((Admin PH4\nmở màn\nAircraft Master)) --> M1[Tìm kiếm tàu bay\ntheo số đăng ký\nhoặc loại tàu]

    M1 --> M2{Mục đích?}

    M2 -->|Xem lịch sử| M3[Tra cứu trạng thái\ntàu bay tại thời điểm\nbất kỳ trong quá khứ\nFUNC-403-02]
    M3 --> END_VIEW((Kết thúc\ntra cứu))

    M2 -->|Thêm thuộc tính\nkhai thác| M4[Cập nhật thuộc tính:\nAPU/Packs INOP\nFrom_DT / To_DT\nFUNC-420-01\nBR-420]
    M4 --> SAVE

    M2 -->|Khai báo hình thức\nsở hữu / thuê| M5[Chọn loại:\nOwned / Dry Lease\nWet Lease / Damp Lease\nFUNC-405-03\nBR-409\n*(Damp Lease — xem OID: SME-10)*]
    M5 --> SAVE

    M2 -->|Khai báo hạn chế\nsân bay| M6[Nhập AP_RESTRICTION\ncho tàu bay\nFUNC-426-01\nBR-416\n*(Codeset — xem OID: SME-31)*]
    M6 --> SAVE

    M2 -->|Cập nhật DOW\ntheo version| M7[Lưu phiên bản DOW\nkèm ngày hiệu lực\nFUNC-403-01\nBR-411]
    M7 --> SAVE

    M2 -->|Khai báo cấu hình\nghế thay thế| M8[Cập nhật STD_VERSION_ALT_1..4\nFUNC-422-02\nBR-412]
    M8 --> SAVE

    SAVE[Lưu thay đổi +\nghi phiên bản\nFUNC-403-01…02] --> PUSH[Đẩy thay đổi\nqua API / Webhook\nFUNC-404-01…02]
    PUSH --> END_M((Kết thúc\ncập nhật))
```

### Chú giải sơ đồ 3

- Sơ đồ mô tả các nhánh thao tác thủ công **được ghi rõ trong nguồn BR/FUNC**; các thuộc tính khác (NOISE, RADIO, AC_INDEX…) có FUNC nhưng không mô tả luồng thao tác riêng biệt — xem §6 Chức năng chờ mô hình hóa.
- `*(Damp Lease — xem OID: SME-10)*` — tên chính thức biến thể Wet Lease tự lo nhiên liệu chưa được chốt.
- `*(Codeset AP_RESTRICTION — xem OID: SME-31)*` — codeset chưa được chốt đầy đủ.

---

## 4. Sơ đồ To-Be — Airport Master

> **Nguồn:** BR-432 … BR-445; FUNC-410-01…12; FUNC-411-01…02; FUNC-418-01…06; FUNC-419-01…04.
>
> Airport Master gồm hai luồng chính: (A) Admin PH4 quản lý thông tin sân bay thủ công; (B) luồng riêng cho Standard Taxi Time có bước tự thống kê và duyệt trước khi áp dụng (BR-443 / FUNC-418-02…03).

```mermaid
flowchart TD
    S((Admin PH4\nmở màn\nAirport Master)) --> AP1{Mục đích?}

    AP1 -->|Thêm / sửa thông tin\nsân bay| AP2[Nhập / cập nhật:\nMã ICAO, IATA, tên sân bay\nquốc gia, region, tiếp xúc\nFUNC-410-01]
    AP2 --> AP3[Cập nhật hạ tầng:\nRunway, Taxiway, Bãi đỗ\nFUNC-410-02…03]
    AP3 --> AP4[Cập nhật Minima theo\nApproach Type\nILS CAT I/II/III, RNAV, VOR, NDB\nFUNC-410-04\nBR-435]
    AP4 --> AP5[Cập nhật dịch vụ\nmặt đất: GPU/ASU, nhiên liệu\nchi phí, Parking Stand\nFUNC-410-09; FUNC-410-12\nBR-437; BR-438; BR-440]
    AP5 --> SAVE_AP[Lưu + ghi phiên bản\nFUNC-403-01…02]

    AP1 -->|Khai báo sân bay\nđặc biệt| SP1[Thêm vào danh mục\nsân bay đặc biệt\nFUNC-419-01\nBR-442\n*(Danh mục đầy đủ — xem OID: SME-18)*]
    SP1 --> SP2[Gán điều kiện chứng chỉ\ntổ bay bổ sung\nFUNC-419-02]
    SP2 --> SP3[Dữ liệu này làm cơ sở\ncảnh báo PH1\nFUNC-419-03]
    SP3 --> SAVE_AP

    AP1 -->|Cập nhật\nStandard Taxi Time| STT1[TOSS tự thống kê\ngiá trị đề xuất\ntừ dữ liệu QAR/QAI\nqua API / DB View\nFUNC-418-02\nBR-443]
    STT1 --> STT2[Trình Admin PH4\nhoặc Điều phái viên\nduyệt giá trị đề xuất\nFUNC-418-03]
    STT2 --> STT3{Duyệt?}
    STT3 -->|Từ chối| STT1
    STT3 -->|Chấp thuận| STT4[Lưu bản ghi Standard Taxi Time\ntheo sân bay × thời gian hiệu lực\nFUNC-418-01]
    STT4 --> STT5[Sinh cảnh báo\nkhi giá trị thay đổi\nFUNC-418-04\nBR-443]
    STT5 --> STT6[[Đồng bộ sang Lido\nnếu Lido hỗ trợ tích hợp\nFUNC-418-05\n*(xem OID: KS-16)*]]
    STT6 --> SAVE_AP

    SAVE_AP --> PUSH_AP[Đẩy thay đổi\nqua API / Webhook\nFUNC-404-01…02]
    PUSH_AP --> END_AP((Kết thúc\ncập nhật\nsân bay))
```

### Chú giải sơ đồ 4

- **`[[...]]`** — bước tại hệ thống ngoài phạm vi TOSS hoặc phụ thuộc quyết định tích hợp chưa chốt.
- **Standard Taxi Time** có luồng duyệt (approve) riêng vì FUNC-418-03 ghi rõ "trình điều phái viên duyệt trước khi áp dụng" (BR-443).
- **`*(xem OID: KS-16)*`** — phương án đồng bộ sang Lido chưa chốt (giai đoạn đầu có thể nhập hai lần).
- **`*(Danh mục sân bay đặc biệt đầy đủ — xem OID: SME-18)*`** — danh sách chưa được xác nhận chính thức.
- Import PDF LIDO Chart (BR-445) và Obstacle Data / EOSID (BR-444) có FUNC nhưng không mô tả luồng thao tác chi tiết trong nguồn — xem §6.

---

## 5. Sơ đồ To-Be — Route Master / Tankering

> **Nguồn:** BR-446 … BR-457; FUNC-412-01…06; FUNC-413-01…04; FUNC-428-01…02; FUNC-429-01…04; FUNC-430-01…02.
>
> Route Master lưu thông tin chặng bay và các tham số tối ưu hóa. Luồng Tankering có bước tính toán khuyến nghị từ dữ liệu giá nhiên liệu.

```mermaid
flowchart TD
    S((Admin PH4\nmở màn\nRoute Master)) --> R1{Mục đích?}

    R1 -->|Thêm / sửa\nchặng bay| R2[Nhập thông tin chặng:\nDEP, ARR, GCD, Cost Index\nFinal Reserve, EDTO\nFUNC-412-01…04\nBR-446; BR-447]
    R2 --> R3[Khai báo chi phí:\nMCMR, chi phí bay qua\nFUNC-412-05…06\nBR-449; BR-450]
    R3 --> SAVE_R[Lưu + ghi phiên bản\nFUNC-403-01…02]

    R1 -->|Khai báo\nCommercial Config| CC1[Upload file LBM\nhoặc nhập thủ công\nFUNC-431-01..02\nBR-454]
    CC1 --> CC2[Trích xuất số ghế\nC/W/Y theo chặng ×\ngiai đoạn × AC Subtype]
    CC2 --> SAVE_R

    R1 -->|Quản lý\nTankering| TK1[Admin upload\nfile giá nhiên liệu\nUSD/tấn theo sân bay × kỳ giá\nFUNC-413-01\nBR-458]
    TK1 --> TK2[TOSS tính toán\nkhuyến nghị Tankering\ndựa trên hiệu quả chi phí\nFUNC-413-02\nBR-455]
    TK2 --> TK3[Cập nhật chặng bay\nvà loại tàu áp dụng\ntheo giai đoạn hiệu lực\nFUNC-413-03\nBR-455]
    TK3 --> TK4[Lưu và xuất\nkhuyến nghị Tankering\ntheo chặng × tàu × giai đoạn\nFUNC-413-04\nBR-456]
    TK4 --> SAVE_R

    R1 -->|Khai báo\nScheduled TAT| TAT1[Nhập TAT tiêu chuẩn\ntheo nhóm nối chặng\nvd QT TRUNG–QT NGAN\nFUNC-430-01\nBR-453]
    TAT1 --> SAVE_R

    SAVE_R --> PUSH_R[Đẩy thay đổi\nqua API / Webhook\nFUNC-404-01…02]
    PUSH_R --> END_R((Kết thúc\ncập nhật\nchặng bay))
```

### Chú giải sơ đồ 5

- **Tính Tankering** (FUNC-413-02) sử dụng giá nhiên liệu do Admin upload; lưu ý giá từ Việt Nam đi quốc tế khác giá nội địa — cả hai giá đều được tính (BR-455).
- **Commercial Config** (FUNC-431-01..02): nhãn FUNC dùng mã v0.3; ánh xạ sang BR-454 mới của v0.5 — xem §4 ánh xạ mã trong PHAN-RA-BRD-PH4 v0.4.
- **Included Baggage Allowance** (BR-451, FUNC-428-01…02) và **Sector Groups by FH** (BR-452, FUNC-429-01…04) có FUNC nhưng không mô tả luồng tương tác riêng — xem §6.

---

## 6. Sơ đồ To-Be — Luồng đồng bộ AMOS → Aircraft Master (hiện trạng bảo dưỡng & AOG)

> **Nguồn:** BR-419; FUNC-409-01…04.
>
> PH4 không tự quản lý bảo dưỡng. AMOS là hệ thống chủ. PH4 chỉ nhận (đồng bộ) và lưu hiện trạng để sinh cảnh báo.

```mermaid
sequenceDiagram
    participant AMOS as AMOS\n(hệ thống chủ bảo dưỡng)
    participant PH5 as TOSS PH5\n(kênh tích hợp BR-528d)
    participant PH4 as TOSS PH4\n(Aircraft Master)
    participant PH1 as TOSS PH1\n(Giám sát / cảnh báo)

    AMOS ->> PH5: Lịch bảo dưỡng ngắn hạn\nvà dài hạn cập nhật
    AMOS ->> PH5: AOG đột xuất\n(tàu, thời gian dự kiến khắc phục)
    PH5 ->> PH4: Chuyển tiếp dữ liệu\nvào Aircraft Master\nFUNC-409-02…03
    PH4 ->> PH4: Lưu hiện trạng bảo dưỡng\nvà AOG theo tàu
    PH4 ->> PH4: Kiểm tra giới hạn FC\nFUNC-409-01…04
    alt FC tiến gần giới hạn
        PH4 ->> PH1: Sinh cảnh báo sắp hết FC\nFUNC-409-04
    end
    PH4 ->> PH1: Cung cấp hiện trạng AOG\ncho màn Giám sát
```

### Chú giải sơ đồ 6

- **PH5** là kênh tích hợp (BR-528d) — PH4 nhận dữ liệu qua PH5, không kết nối trực tiếp AMOS.
- **TOSS không tự quản lý bảo dưỡng** — Out-of-scope §5.2 #3; AMOS là hệ thống chủ (BR-419).
- **FC (Flight Cycle):** TOSS theo dõi giới hạn và sinh cảnh báo (FUNC-409-04) nhưng không quyết định hành động bảo dưỡng.

---

## 7. Sơ đồ To-Be — BP-005: Nhận tàu bay mới → Cập nhật Aircraft Master

> **Nguồn:** BP-005 (BRD §8, FDOP §3.5); BR-406, BR-407, BR-408, BR-411; FUNC-405-01…05; FUNC-403-01…02; FUNC-427-01…06.
>
> Khi hãng tiếp nhận tàu bay mới (mua hoặc thuê khô — Dry Lease), PH4 cần được cập nhật để tàu trở thành một phần đội bay khai thác. Sơ đồ chỉ bao phủ phần **PH4 cập nhật Aircraft Master** — các bước nghiệp vụ khác của BP-005 (lập OFP chuyến Ferry, briefing tổ bay…) thuộc PH1/PH2.

```mermaid
flowchart TD
    S((Nhận tàu bay\nmới — BP-005\nFDOP §3.5)) --> N1[SQD cung cấp\nmã 24-bit và phối hợp\nnhận chứng nhận CAAV\n*(Tên đầy đủ SQD — xem OID: SME)*]

    N1 --> N2[Thu thập thông số tàu:\nMSN, số đăng ký mới\nICAO 24-bit, ToT\nFDOP §3.5]

    N2 --> N3[PER Group / FOE nhận\nWeigh Manifest từ Boeing/Airbus\nxác định DOW ban đầu\nFDOP §3.5]

    N3 --> N4[Admin PH4 tạo mới\nbản ghi tàu bay\ntrong Aircraft Master\nFUNC-405-01…04\nBR-406]

    N4 --> N5[Nhập thuộc tính định danh:\nREG, ALT_REG, callsign\nloại tàu ICAO/IATA\nFUNC-405-01…02\nBR-407]

    N5 --> N6[Khai báo hình thức sở hữu:\nOwned / Dry Lease / Wet Lease\nFUNC-405-03\nBR-409\n*(Damp Lease — xem OID: SME-10)*]

    N6 --> N7[Nhập DOW version đầu tiên\ntheo Weigh Manifest draft\nFUNC-403-01\nBR-411]

    N7 --> N8[Nhập cấu hình khoang\nSTD_VERSION ban đầu\nFUNC-422-01\nBR-412]

    N8 --> N9[Khai báo thời gian\nhiệu lực khai thác đầu tiên\nValid_From = ngày ToT\nFUNC-405-04\nBR-408]

    N9 --> N10[Ghi nhận trạng thái tàu\nAC_STATE theo codeset\nFUNC-421-01\nBR-417\n*(Codeset AC_STATE — xem OID: SME-29)*]

    N10 --> N11{Netline đã có\nbản ghi tàu?}
    N11 -->|Chưa có| N12[Bản ghi PH4\nlà nguồn tạm thời\nchờ Netline đồng bộ]
    N11 -->|Đã có| N13[Đồng bộ / hợp nhất\nvới bản ghi Netline\nFUNC-427-01\nBR-418]
    N12 --> N14
    N13 --> N14[Lưu golden record\nvà ghi phiên bản\nFUNC-403-01…02]

    N14 --> N15[Đẩy thông tin tàu mới\ncho PH1, PH2, PH3\nqua API / Webhook\nFUNC-404-01…02\nBR-404]

    N15 --> N16[Cập nhật DOW final\nkhi nhận Weigh Manifest\nchính thức\nFUNC-403-01\nBR-411]

    N16 --> END((Tàu bay sẵn sàng\ntrong Aircraft Master\ncho khai thác))
```

### Chú giải sơ đồ 7

- **ToT (Transfer of Title):** mốc thời gian chuyển giao quyền sở hữu/quyền khai thác; `Valid_From` của giai đoạn hiệu lực đầu tiên được đặt theo ToT (nguồn: FDOP §3.5).
- **DOW (Dry Operating Weight):** bản ghi ban đầu từ Weigh Manifest draft; cần cập nhật lại khi có bản chính thức (FUNC-403-01, BR-411).
- **SQD, VAECO, PER Group (FOE):** các đơn vị phối hợp trong BP-005 theo FDOP §3.5 — tên đầy đủ chưa được xác nhận chính thức `*(chờ xác nhận)*`.
- **Chuyến Ferry và OFP:** thuộc luồng PH1/PH2, không nằm trong phạm vi sơ đồ này.
- Nhánh "Netline chưa có bản ghi" chỉ xảy ra trong giai đoạn chờ Netline cập nhật — nguồn BR-418 ghi rõ hợp nhất theo khóa REG × giai đoạn hiệu lực khi có đủ hai nguồn.

---

## 8. Sơ đồ To-Be — Performance Factor (PF): Thu nạp và Cập nhật

> **Nguồn:** BR-428, BR-429, BR-430, BR-431; FUNC-408-01…06.
>
> PH4 giữ vai trò lưu trữ và tính toán PF. Báo cáo PF (PF Comparison, PF Trend…) đã chuyển sang PH3 (BR-351…BR-356) và không nằm trong sơ đồ này.

```mermaid
flowchart TD
    S((Admin PH4\nbắt đầu\ncập nhật PF)) --> PF1[Tạo kỳ tính PF\nData Period Label\nHistorical From–To Date\nFUNC-408-04\nBR-429]

    PF1 --> PF2[Upload nhiều file\ndữ liệu đội tàu\nFUNC-408-01\nBR-430]

    PF2 --> PF3[Tổng hợp điện văn ACARS\ncho tàu bay có ACARS\nFUNC-408-02\nBR-428]

    PF3 --> PF4{Tàu thiếu\ndữ liệu tính PF?}
    PF4 -->|Có| PF5[Fallback: lấy PF\ncủa kỳ trước\nFUNC-408-03\nBR-430]
    PF4 -->|Không| PF6

    PF5 --> PF6[Tổng hợp bảng PF\ncho tất cả tàu trong kỳ]

    PF6 --> PF7{Cần chỉnh sửa\nthủ công?}
    PF7 -->|Có| PF8[Correct số liệu\nthủ công\nBR-430]
    PF8 --> PF9
    PF7 -->|Không| PF9[Chọn AC Reg\nvà kỳ cập nhật\nlưu PF theo kỳ\nFUNC-408-04\nBR-430]

    PF9 --> PF10[Sinh cảnh báo\ntàu thiếu PF\nhoặc PF hết hiệu lực\nFUNC-408-06\nBR-431]

    PF10 --> END_PF((Kết thúc\ncập nhật PF))
```

### Chú giải sơ đồ 8

- **Chu kỳ tính PF:** trung bình hai tuần hoặc một tháng một lần (BR-428), bao gồm cả chuyến có MEL và chuyến không có MEL.
- **Báo cáo PF** (PF Comparison / Trend / Data Coverage) không nằm trong PH4 — xem PH3 BR-351…BR-356.
- **`*(Tên đầy đủ pgepoid — xem OID: SME-38)*`** — tên phần mềm BackPACK/PEP/PET/FOS chưa được xác nhận đầy đủ.

---

## 9. Sơ đồ To-Be — Vòng đời bản ghi danh mục (Versioning)

> **Nguồn:** BR-403; FUNC-403-01…02; BR-404; FUNC-404-01…04.
>
> Áp dụng cho mọi loại bản ghi danh mục (Aircraft, Airport, Route, PF…).

```mermaid
stateDiagram-v2
    [*] --> Khoi_tao : Admin tạo bản ghi mới
    Khoi_tao --> Hieu_luc : Lưu lần đầu\n(FUNC-403-01)
    Hieu_luc --> Dang_cap_nhat : Admin sửa / đồng bộ\ncập nhật trường
    Dang_cap_nhat --> Hieu_luc : Lưu phiên bản mới\nai / nội dung / thời điểm\n(FUNC-403-01)
    Hieu_luc --> Lich_su : Giai đoạn hiệu lực kết thúc\n(Valid_To vượt qua)
    Lich_su --> Hieu_luc : Tàu trở lại đội bay\n(bản ghi giai đoạn mới — BR-408)

    Khoi_tao : Khởi tạo\n(bản ghi chưa có hiệu lực)
    Hieu_luc : Đang hiệu lực\n(dùng cho khai thác)
    Dang_cap_nhat : Đang cập nhật\n(phiên bản mới chưa lưu)
    Lich_su : Lịch sử\n(tra cứu quá khứ — FUNC-403-02)
```

### Chú giải sơ đồ 9

- Mọi chuyển trạng thái đều ghi vết kiểm toán: `last_update`, `last_update_user`, `record_id` (BR-403).
- Trạng thái **Lịch sử** không bị xóa — có thể truy xuất tại bất kỳ thời điểm nào (FUNC-403-02).
- Tàu bay có thể vào/ra đội bay nhiều lần (BR-408) → mỗi lần tạo bản ghi giai đoạn mới, bản ghi cũ chuyển sang Lịch sử.

---

## 10. Chức năng chờ mô hình hóa

Các FUNC sau đây đã có trong PHAN-RA-BRD-PH4 v0.4 nhưng nguồn **chưa mô tả luồng tương tác** hoặc chỉ liệt kê thuộc tính — chưa đủ căn cứ để vẽ sơ đồ.

| Nhóm | FUNC | BR cha (v0.5) | Lý do chưa mô hình hóa |
|---|---|---|---|
| Aircraft Master | FUNC-423-01…03 (AC_INDEX, cỡ tổ bay tiêu chuẩn) | BR-413 | Nguồn chỉ liệt kê trường `AC_INDEX`, `CREWSIZE_COCKPIT/CABIN` từ Netline; không mô tả luồng thao tác thêm/sửa riêng biệt |
| Aircraft Master | FUNC-424-01…05 (ILS, AUTOLAND, ACARS, SPECIAL_EQUIPMENT) | BR-414 | Nguồn liệt kê từ header Netline; không mô tả luồng duyệt hoặc cập nhật riêng |
| Aircraft Master | FUNC-425-01…04 (NOISE, RADIO, PHONE) | BR-415 | Nguồn chỉ từ cột Netline; luồng thao tác không mô tả |
| Aircraft Master | FUNC-421-01…04 (AC_STATE, OVERFLOW) | BR-417 | Có FUNC nhưng không có mô tả luồng duyệt/thay đổi trạng thái thủ công ngoài đồng bộ |
| Airport Master | FUNC-410-07…08 (SID/STAR/IAP, Slot/phép bay) | BR-436 | Nguồn liệt kê nội dung quản lý; không có luồng nhập/duyệt chi tiết |
| Airport Master | FUNC-410-10…11 (NOTAM, an ninh sân bay) | BR-439 | Nguồn ghi "quản lý"; cơ chế cập nhật (thủ công hay tự động) chưa rõ |
| Airport Master | BR-444 (Obstacle Data, EOSID, import .stx) | BR-444 | Should — FUNC chưa có trong v0.4; luồng import chưa mô tả |
| Airport Master | BR-445 (Import PDF LIDO Chart) | BR-445 | Should — FUNC chưa có trong v0.4; luồng quét PDF chưa mô tả |
| MEL / CDL | BR-424 … BR-427 (Master MEL, công cụ biên soạn, hotfix SB, đồng bộ AMOS) | BR-424…427 | Có FUNC-407-01…06 nhưng luồng vòng đời tài liệu MEL (biên soạn → revision → approve → xuất XML) chưa được mô tả đủ; OID SME-44 chưa chốt |
| Route Master | FUNC-428-01…02 (Included Baggage Allowance) | BR-451 | Nguồn ghi "quản lý theo nhóm đường bay"; không mô tả luồng upload/nhập |
| Route Master | FUNC-429-01…04 (Sector Groups by FH) | BR-452 | Should — nguồn chỉ liệt kê trường; không mô tả luồng |
| Danh mục bổ trợ | FUNC-414-01…06 (Phi công, Tiếp viên, Quốc gia, FIR, ULD, Email) | BR-461…BR-465 | Quản lý CRUD đơn giản; phi công/tiếp viên đồng bộ từ MO Plus (BR-461); luồng không phức tạp, không có bước duyệt riêng |
| Tham số vận hành | FUNC-415-01…06 | BR-468 | Admin cấu hình trực tiếp; luồng đơn giản (không có bước duyệt riêng theo nguồn) |
| Phép bay | FUNC-420-01…09 (Flight Permission, Flight Type Code) | BR-466, BR-467 | Có FUNC nhưng luồng tích hợp SkyCheck (OID: KS-15) chưa chốt; giai đoạn đầu nhập thủ công — đủ để vẽ sơ đồ đơn giản sau khi OID giải quyết |

---

## 11. Bảng So sánh As-Is → To-Be (PH4)

> **Lưu ý:** Cột As-Is phản ánh thực trạng ghi nhận trong báo cáo khảo sát (KS 08/06, 09/06, 11/06) và đề xuất giải pháp kỹ thuật. Cột To-Be phản ánh yêu cầu BR/FUNC đã ghi nhận.

| Khía cạnh | As-Is (Hiện trạng) | To-Be (TOSS PH4) | Nguồn BR |
|---|---|---|---|
| Nguồn sự thật tàu bay | Phân tán: Netline, FIMS, bảng tính riêng mỗi đơn vị; không có golden record duy nhất | Một golden record duy nhất hợp nhất từ Netline + FIMS theo khóa REG × giai đoạn hiệu lực; đẩy cho các hệ thống tiêu thụ qua API/Webhook | BR-418, BR-404 |
| Đồng bộ danh mục | Đồng bộ thủ công hoặc theo lịch định kỳ; các phân hệ tự duy trì bản sao | Đồng bộ chủ động (push) ngay khi phát sinh thay đổi; không còn bản sao cục bộ ở các phân hệ | BR-404 |
| Lịch sử thay đổi | Không có hoặc ghi rời (Excel, email) | Ghi phiên bản tự động theo bản ghi: ai / nội dung / thời điểm; tra cứu lại được bất kỳ thời điểm | BR-403 |
| Hiệu lực khai thác tàu | Quản lý đơn giản (tàu vào/ra chưa theo giai đoạn) | Quản lý nhiều giai đoạn hiệu lực (Valid_From/To), tàu có thể in/out nhiều lần | BR-408 |
| Standard Taxi Time | Quản lý thủ công tại MOI; nhập lại ở từng hệ thống | Tự thống kê từ QAR/QAI → điều phái duyệt → lưu danh mục; đồng bộ sang Lido *(chờ OID: KS-16)* | BR-443 |
| Danh mục sân bay đặc biệt | Quản lý rải rác; chưa gắn điều kiện chứng chỉ tổ bay | Danh mục chính thức gắn với điều kiện chứng chỉ; làm cơ sở cảnh báo PH1 | BR-442 |
| Performance Factor | Tính bên ngoài TOSS (BackPACK/PEP/PET); nhập thủ công vào khai thác | Upload file tính PF trong TOSS; fallback tự động; lưu lịch sử theo kỳ; sinh cảnh báo tàu thiếu PF | BR-428…431 |
| Trạng thái bảo dưỡng/AOG | Nhận qua điện thoại/email từ AMOS; không tập trung | Đồng bộ tự động qua PH5 từ AMOS; lưu hiện trạng; sinh cảnh báo FC | BR-419 |
| Danh mục MEL | Nhận file XML từ hãng sản xuất; quản lý rải rác theo dòng tàu | Import XML vào TOSS; công cụ biên soạn chung Boeing+Airbus; đồng bộ AMOS; highlight mới; liên kết tài liệu *(chờ OID: SME-44)* | BR-424…427 |
| Phép bay | Xin và quản lý thủ công (ngoài TOSS); không tích hợp SkyCheck | Nhập trực tiếp trên TOSS; chuẩn bị 2 API nhận từ SkyCheck khi sẵn sàng; sinh báo cáo phép bay *(chờ OID: KS-15)* | BR-466 |

---

*TOBE-PH4 v0.1 — 2026-06-17. Trạng thái: Draft. Nguồn BR: BRD-TOSS-PH4 v0.5 (BR-401…469). Nguồn FUNC: PHAN-RA-BRD-PH4 v0.4. Lịch sử version: xem `ba/workspace/drafts/quy-trinh/BA-VERSION-LOG.md`.*
