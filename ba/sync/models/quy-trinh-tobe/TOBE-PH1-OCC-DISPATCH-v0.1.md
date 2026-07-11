---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Mô hình quy trình — To-Be PH1"
document_id: "TOBE-PH1"
source_asis: "ba/workspace/drafts/phan-tich/04-quy-trinh/ASIS-OCC-DISPATCH-v0.1.md"
source_br: "ba/workspace/drafts/brd/BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.2.md"
source_func: "ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH1-thong-tin-dieu-hanh-chuyen-bay-v0.5.md"
---

# Sơ đồ Quy trình To-Be — Phân hệ 1: Thông tin điều hành chuyến bay

> **Nguyên tắc (CLAUDE.md §0):** Sơ đồ này chỉ mô tả những gì đã được ghi nhận trong các nguồn BRD-TOSS-PH1 và ASIS-OCC-DISPATCH-v0.1.md. Nơi nào nguồn còn cờ `[cần xác nhận]` thì giữ nguyên cờ đó. Không suy diễn thêm bước hoặc logic chưa có trong nguồn.

---

## 1. Tổng quan phạm vi

| Trường | Giá trị |
|---|---|
| Phân hệ | PH1 — Thông tin điều hành chuyến bay |
| Actor chính | Điều phái viên (Dispatcher), Trực ban OCC, Trực ban Trưởng |
| Ranh giới hệ thống | TOSS PH1 (view + cảnh báo); Lido/Netline/AMOS/MO Plus là hệ thống chuyên dụng ngoài phạm vi điều khiển (BR-115) |
| Trigger (khởi động) | Đầu ca trực (Shift Start) — điều phái viên / trực ban đăng nhập TOSS |
| Kết thúc | Chuyến bay nhận điện IN/ARR, trạng thái Xanh (hoàn tất) |
| Nguồn BR | BR-101 … BR-150 (BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.2.md) |

---

## 2. Sơ đồ To-Be — Luồng chính Điều phái viên (Dispatcher)

> Biểu diễn luồng làm việc trong một ca trực từ góc nhìn điều phái viên.

```mermaid
flowchart TD
    S((Bắt đầu ca trực)) --> A1[Đăng nhập TOSS\ntheo profile cá nhân]
    A1 --> A2[Mở màn Kiểm tra Đầu ca\nStart-of-Shift Check]
    A2 --> B1{9 nhóm kiểm tra\nhoàn thành?}
    B1 -->|Cảnh báo bất thường| C1[Xem chi tiết cảnh báo\ntrên TOSS]
    C1 --> C2[[Thao tác nghiệp vụ tại\nhệ thống chuyên dụng\nLido / MO Plus / AMOS]]
    C2 --> B1
    B1 -->|Không có bất thường| D1[Mở màn Giám sát Chuyến bay\nMonitoring Overview]

    D1 --> D2[Theo dõi bảng chuyến bay\ntheo time window cấu hình\nETD sort, 3 nhóm trạng thái]

    D2 --> E1{Cảnh báo mới\nphát sinh?}
    E1 -->|Không| D2
    E1 -->|Có| E2[Nhận cảnh báo màu\ntrên màn Giám sát\nĐỏ / Vàng / Xanh]
    E2 --> E3[Click cảnh báo\nmở Flight Detail\ntab phụ tương ứng]
    E3 --> E4{Cần thao tác\nnghiệp vụ?}
    E4 -->|Có| E5[[Thao tác tại hệ thống\nchuyên dụng tương ứng\nLido / Netline / AMOS]]
    E4 -->|Chỉ xem / ghi nhận| E6[Theo dõi trạng thái\nchuyển Xanh tự động\nkhi dữ liệu nguồn cập nhật]
    E5 --> E6
    E6 --> D2

    D2 --> F1{OFP đã sẵn sàng\nDispatch Release?}
    F1 -->|Chưa| D2
    F1 -->|Có| F2[Bấm Dispatch Release\ntại cột shortcut trên\nmàn Giám sát]
    F2 --> F3[TOSS đồng bộ trạng thái\nsang MO Plus\nkhoá Captain's Release\nnếu chưa có DR]
    F3 --> D2

    D2 --> G1{Chuyến bay\nhạ cánh?}
    G1 -->|Chưa — Flight Watch| D2
    G1 -->|Nhận điện IN/ARR| G2[Cột ETA/IN/ARR\nchuyển Xanh tự động]
    G2 --> G3[Chuyến rời khỏi\nbảng Giám sát\nsau time window]
    G3 --> H1{Còn chuyến\ntrong ca?}
    H1 -->|Còn| D2
    H1 -->|Hết ca| E_END((Kết thúc ca trực))
```

### Chú giải sơ đồ 2

- **`((...))`** — điểm bắt đầu / kết thúc quy trình.
- **`[...]`** — bước xử lý (activity) thực hiện trên TOSS.
- **`[[...]]`** — quy trình con tại hệ thống ngoài phạm vi TOSS (BR-115).
- **`{...}`** — điểm quyết định (decision gateway).
- **Mũi tên có nhãn** — nhánh có điều kiện.

---

## 3. Sơ đồ To-Be — Luồng Kiểm tra Đầu ca (Start-of-Shift Check)

> Nguồn: BR-114 — màn hình tập trung 9 nhóm nội dung, tự đối chiếu và sinh cảnh báo.

```mermaid
flowchart TD
    S2((Bắt đầu\nkiểm tra đầu ca)) --> K1[TOSS tổng hợp tự động\n9 nhóm dữ liệu]

    subgraph Nhom_Du_lieu ["9 nhóm dữ liệu kiểm tra (BR-114)"]
        K2[1. Lịch bay ngày hôm nay]
        K3[2. Loại tàu bay phân công]
        K4[3. Tàu bay quay vòng]
        K5[4. Điều kiện cứu hỏa sân bay RFFS]
        K6[5. Thời tiết sân bay]
        K7[6. Tải trọng dự kiến]
        K8[7. MEL / CDL hiệu lực]
        K9[8. Hạn chế khai thác]
        K10[9. Chứng chỉ tổ bay]
    end

    K1 --> Nhom_Du_lieu
    Nhom_Du_lieu --> K11{TOSS phát hiện\nbất thường?}
    K11 -->|Không| K12[Hiển thị trạng thái\nbình thường — tiếp tục\nvào màn Giám sát]
    K11 -->|Có cảnh báo| K13[Hiển thị cảnh báo\ntự sinh — màu Đỏ/Vàng\ntheo loại bất thường]
    K13 --> K14[Điều phái ghi nhận\nvà chuyển sang\nhệ thống chuyên dụng\nnếu cần xử lý]
    K14 --> K11
    K12 --> E2_END((Vào màn\nGiám sát))
```

### Chú giải sơ đồ 3

- **subgraph** — nhóm nghiệp vụ (swim lane theo chức năng).
- TOSS chỉ đóng vai trò "view + cảnh báo" — không thực hiện nghiệp vụ chuyên dụng (BR-115).

---

## 4. Sơ đồ To-Be — Vòng đời Cảnh báo (Alert Lifecycle)

> Nguồn: BR-138, BR-139, BR-140 — bộ 4 mã màu thống nhất, tô màu ô, xanh chỉ sau khi từng Đỏ.

```mermaid
stateDiagram-v2
    [*] --> Binh_thuong : Dữ liệu nguồn bình thường
    Binh_thuong --> Can_luu_y : Điều kiện cảnh báo Vàng\n(BR-138)
    Binh_thuong --> Can_xu_ly_ngay : Điều kiện cảnh báo Đỏ\n(BR-138)
    Can_luu_y --> Can_xu_ly_ngay : Mức độ tăng lên
    Can_xu_ly_ngay --> Da_xu_ly : Dữ liệu nguồn\ncập nhật — xử lý xong\n(tự động, BR-139)
    Da_xu_ly --> Binh_thuong : Chuyến hoàn tất\n(nhận IN/ARR, BR-147)

    Binh_thuong : Bình thường\n(không màu)
    Can_luu_y : Cần lưu ý\n(màu Vàng)
    Can_xu_ly_ngay : Cần xử lý ngay\n(màu Đỏ)
    Da_xu_ly : Đã xử lý\n(màu Xanh — chỉ sau khi từng Đỏ)
```

### Chú giải sơ đồ 4

- Trạng thái **Xanh** chỉ xuất hiện sau khi đã từng qua trạng thái Đỏ (BR-139).
- Đổi màu diễn ra **tự động** theo dữ liệu nguồn — điều phái không tick thủ công (BR-139).
- Trạng thái Xanh phục vụ thống kê khối lượng công việc (BR-140).

---

## 5. Sơ đồ To-Be — Luồng Dispatch Release

> Nguồn: BR-145, BR-213, BR-214 (PH2 tích hợp), BR-144.

```mermaid
sequenceDiagram
    participant DSP as Điều phái viên
    participant TOSS as TOSS PH1/PH2
    participant Lido as Lido
    participant MOPlus as MO Plus

    Lido ->> TOSS: OFP mới / cập nhật (adapter tự động)
    TOSS ->> TOSS: Gán phiên bản R1/R2…\nKiểm tra tàu Netline vs OFP
    TOSS ->> DSP: Cột REG — cảnh báo màu\n(Vàng=khớp tàu chưa release\nĐỏ=lệch tàu đã release)
    DSP ->> TOSS: Bấm Dispatch Release\n(tại cột shortcut màn Giám sát)
    TOSS ->> TOSS: Gắn trạng thái DR\ncho phiên bản OFP tương ứng
    TOSS ->> MOPlus: Đồng bộ trạng thái\nDispatch Release
    MOPlus ->> MOPlus: Cho phép Captain's Release\n(sau khi có DR)
    TOSS ->> DSP: Cột REG/DR chuyển Xanh\n(khớp tàu + đã release)
```

### Chú giải sơ đồ 5

- Phạm vi giao diện cụ thể giữa TOSS và MO Plus cần làm rõ thêm (BR-214).
- Lido vẫn tự sinh OFP và đẩy lên MO Plus như hiện hành; TOSS bổ sung lớp quản lý phiên bản và trạng thái Release (BR-213).

---

## 6. So sánh As-Is → To-Be

### 6.1 Bảng so sánh theo bước quy trình

| Bước nghiệp vụ | Trạng thái As-Is | Trạng thái To-Be | Thay đổi | BR liên quan |
|---|---|---|---|---|
| Kiểm tra đầu ca | Điều phái tự tra thủ công nhiều hệ thống (Ops++, AMOS, Crew Trip, WNI…) | TOSS tổng hợp tự động 9 nhóm, tự sinh cảnh báo | **Thay thế thủ công** | BR-114 |
| Xem trạng thái chuyến bay | Mở 5–7 màn hình riêng biệt, tổng hợp bằng mắt | Bảng giám sát hợp nhất trên TOSS, time window tự trôi | **Thay thế/Hợp nhất** | BR-101, BR-125, BR-148 |
| Phát hiện bất thường | Phụ thuộc nhân viên nhìn màn hình | TOSS sinh cảnh báo màu tự động theo ngưỡng cấu hình | **Tự động hóa** | BR-103, BR-116–131, BR-138–139 |
| Tra NOTAM | Vào web nguồn bên ngoài thủ công `[Cần xác nhận]` | TOSS tích hợp NOTAM từ nguồn chính thức, phân loại và đánh giá ảnh hưởng | **Tích hợp mới** | BR-118 |
| Tra thời tiết | Vào WNI thủ công `[Cần xác nhận]` | TOSS parse METAR/SPECI, cảnh báo theo ngưỡng VMA | **Tích hợp mới** | BR-119 |
| Theo dõi MEL/CDL tàu bay | Tra Ops++ / AMOS riêng biệt | TOSS cảnh báo NAIL/CDL tự động gắn với chuyến bay trong khoảng hiệu lực | **Tích hợp mới** | BR-121 |
| Kiểm tra tổ bay | Tra Crew Trip thủ công | TOSS đối chiếu chứng chỉ tổ bay vs điều kiện sân bay, sinh cảnh báo | **Tích hợp mới** | BR-122, BR-123 |
| Kiểm tra lệch tải | Chưa rõ — `[Cần xác nhận As-Is]` | TOSS đối chiếu OFP vs số liệu CLC, cảnh báo theo ma trận ngưỡng | **Tích hợp mới** | BR-120 |
| Dispatch Release | Soạn thủ công / form `[Cần xác nhận As-Is]` | Bấm shortcut trên màn Giám sát, TOSS gán phiên bản và đồng bộ MO Plus | **Số hóa / Thay thế thủ công** | BR-145, BR-213 |
| Theo dõi chuyến đang bay | Xem Flight Radar màn riêng | TOSS nhúng liên kết FlightRadar24, Flight Watch giữ chuyến dài ngoài time window | **Tích hợp / Giữ nguyên kênh** | BR-105, BR-149 |
| Ghi nhận delay code | Thủ công `[Cần xác nhận]` | `[Chưa rõ trong nguồn — cần làm rõ với VNA]` | — | — |
| Báo cáo OTP cuối ngày | Tổng hợp thủ công từ nhiều nguồn | Thuộc phạm vi PH3 (Báo cáo tối ưu) — không nằm trong PH1 | Ngoài phạm vi PH1 | PH3 |
| Xem vị trí tàu bay trên bản đồ | Màn hình riêng (Flight Radar24 hoặc tương tự) | TOSS nhúng liên kết FlightRadar24 (BR-105) | **Giữ nguyên kênh, tích hợp vào TOSS** | BR-105 |
| Lưu lịch sử quyết định | Không có audit trail `[Cần xác nhận]` | TOSS lưu lịch sử thay đổi chuyến bay, lịch sử cảnh báo theo timeline UTC | **Tính năng mới** | BR-104, BR-150 |
| Cấu hình hiển thị cá nhân | Không có | Lưu filter/cột/trạng thái theo profile user, đăng nhập máy nào cũng giữ | **Tính năng mới** | BR-102, BR-142 |

### 6.2 Tổng hợp nhanh

| Loại thay đổi | Số bước | Ví dụ |
|---|---|---|
| Thay thế / Hợp nhất thủ công | 4 | Kiểm tra đầu ca, xem trạng thái chuyến, phát hiện bất thường, Dispatch Release |
| Tích hợp mới (hệ thống nguồn → TOSS) | 5 | NOTAM, WX, MEL/CDL, Tổ bay, Lệch tải |
| Tính năng mới hoàn toàn | 3 | Audit trail, profile cá nhân, cảnh báo Flight Type Code |
| Giữ nguyên kênh / tích hợp vào TOSS | 2 | FlightRadar24, Flight Watch |
| Chưa rõ trong nguồn | 2 | Ghi nhận delay code, báo cáo OTP (PH3) |

---

## 7. Giả định và ràng buộc

| # | Nội dung | Loại | Nguồn |
|---|---|---|---|
| GA-01 | TOSS PH1 đóng vai trò "view + cảnh báo" — các thao tác nghiệp vụ chuyên dụng vẫn ở Lido, MO Plus, AMOS. | Ràng buộc thiết kế | BR-115 |
| GA-02 | Nguồn NOTAM chính thức là VNCM/VNCS — tên cụ thể cần xác nhận. | Cần làm rõ | BR-118 `[cần xác nhận]` |
| GA-03 | Ngưỡng VMA cho cảnh báo thời tiết — tên đầy đủ và giá trị cần xác nhận. | Cần làm rõ | BR-119 `[cần xác nhận]` |
| GA-04 | Danh mục sân bay địa hình/điều kiện đặc thù cần điều kiện chứng chỉ đặc biệt (Điện Biên, Đồng Hới…) cần danh sách đầy đủ từ VNA. | Cần làm rõ | BR-122 `[cần xác nhận]` |
| GA-05 | Danh mục mã loại chuyến không thường lệ (O, Z, G, H, A, P, V…) cần xác nhận đầy đủ. | Cần làm rõ | BR-126 `[cần xác nhận]` |
| GA-06 | Ngưỡng phút trước STD để sinh cảnh báo PAX time cần xác nhận. | Cần làm rõ | BR-124 `[cần xác nhận]` |
| GA-07 | Dữ liệu từ Netline là nguồn thẩm quyền cho lịch bay và leg history — TOSS không tự xây dựng song song. | Ràng buộc thiết kế | BR-137 |
| GA-08 | Toàn bộ giao diện TOSS là tiếng Anh, giờ UTC 24h, dark mode ưu tiên. | Ràng buộc thiết kế | BR-143 |

---

*TOBE-PH1-OCC-DISPATCH v0.1 — 2026-06-17. Nguồn: BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.2.md (BR-101…150), ASIS-OCC-DISPATCH-v0.1.md, PHAN-RA-BRD-PH1-thong-tin-dieu-hanh-chuyen-bay-v0.5.md.*
