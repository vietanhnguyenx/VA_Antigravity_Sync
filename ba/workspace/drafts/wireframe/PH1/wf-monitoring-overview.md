---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.4"
date: "2026-06-18"
status: "Draft"
document_type: "Wireframe (low-fidelity)"
document_id: "WF-PH1-MON-OVERVIEW"
---

# Wireframe — Monitoring overview real-time (Phase 4 + Phase 5)

## 1. Mục tiêu màn

Cung cấp một màn hình giám sát real-time cho điều phái viên (Dispatcher) mở suốt ca trực, gom các chuyến bay đang ở **Phase 4 — Pre-Departure Monitoring** và **Phase 5 — In-Flight Monitoring** trên cùng một bảng. Bảng cập nhật tự động (server-push hoặc auto-refresh từng ô) khi nhận điện văn ACARS OUT/OFF/ON/IN, và phát cảnh báo bằng màu/nhấp nháy gắn raise/clear theo mốc ACARS.

## 2. BR / FUNC liên quan

| BR | FUNC | Vai trò trên màn |
|---|---|---|
| BR-125 | FUNC-204 | Màn hình mở suốt ca trực, không cần refresh thủ công |
| BR-125 | FUNC-205 | Tối thiểu hiển thị: LEG STATE, ATD/ATA vs STD/STA, ETA |
| BR-125 | FUNC-206 | Với chuyến chưa cất cánh, hiển thị thêm mốc A-CDM (boarding, đóng cửa, push-back…) |
| BR-125 | FUNC-207 | Nguồn mốc thực tế lấy thẳng từ ACARS (không qua Mission Watch `[cần xác nhận]`) |
| BR-125 | FUNC-208 | Server-push (WebSocket/SSE/Webhook `[cần xác nhận]`), dự phòng auto-refresh từng ô; ~20 dòng × 20–30 cột |
| BR-125 | FUNC-209 | Phân nhóm tối thiểu 3: chưa cất cánh / đang bay / đã hạ cánh |
| BR-125 | FUNC-210 | Cảnh báo màu/nhấp nháy, mỗi loại gắn 1 mốc ACARS để raise/clear; Phase 5 KHÔNG monitor dầu live |
| BR-102 | FUNC-104, FUNC-105 | Ẩn/hiện cột, lưu theo phiên cá nhân |
| BR-106 | FUNC-113, FUNC-114 | Lọc theo Carrier (VN, 0V, BL) |

## 3. Bố cục ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  TOSS — MONITORING OVERVIEW (Phase 4 + Phase 5)                Dispatcher: NGUYỄN VĂN A   |  Ca: 06:00 - 18:00   │
│                                                                Cập nhật: tự động (server-push)  ● LIVE          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Carrier: [✓ VN] [✓ 0V] [✓ BL]   DEP: [▼ HAN]   ARR: [▼ Tất cả]   Loại chuyến: [▼ Tất cả]                        │
│ Trạng thái: [✓ Chưa cất cánh] [✓ Đang bay] [✓ Đã hạ cánh]   [⚙ Ẩn/Hiện cột]  [⟳ Refresh thủ công (dự phòng)]   │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ ── NHÓM A: CHƯA CẤT CÁNH / CHUẨN BỊ (FUNC-209) ───── 6 chuyến ─────────────────────────────────────────────── ▼ │
│ ┌────┬────────┬─────┬─────┬───────┬───────┬───────┬───────┬─────────┬────────┬───────┬───────┬──────────┐      │
│ │ #  │ FLT NO │ DEP │ ARR │ STD   │ ETD   │ TOBT  │ TSAT  │ A-CDM   │ GATE   │ AC REG│ LEG   │ Cảnh báo │      │
│ │    │        │     │     │       │       │       │       │ Stage   │/Stand  │       │ STATE │          │      │
│ ├────┼────────┼─────┼─────┼───────┼───────┼───────┼───────┼─────────┼────────┼───────┼───────┼──────────┤      │
│ │ 1  │ VN204  │ HAN │ SGN │ 07:00 │ 07:00 │ 06:55 │ 07:00 │ Boarding│ 12/B12 │ VN-A395│ on-gate│ [─]     │      │
│ │ 2  │ VN217  │ HAN │ DAD │ 07:15 │ 07:30 │ 07:25 │ 07:30 │ ĐóngCửa │ 14/B14 │ VN-A689│ on-gate│⚠TAT     │      │
│ │ 3  │ 0V8202 │ HAN │ HPH │ 07:25 │ 07:25 │ 07:20 │ 07:25 │ Push-bk │ 16/B16 │VN-A1234│taxi-out│[─]      │      │
│ │ …  │        │     │     │       │       │       │       │         │        │       │       │          │      │
│ └────┴────────┴─────┴─────┴───────┴───────┴───────┴───────┴─────────┴────────┴───────┴───────┴──────────┘      │
│                                                                                                                  │
│ ── NHÓM B: ĐANG BAY (FUNC-209) ─────────────────── 9 chuyến ──────────────────────────────────────────────── ▼  │
│ ┌────┬────────┬─────┬─────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬─────────┬──────────┐       │
│ │ #  │ FLT NO │ DEP │ ARR │ STD   │ ATD   │ OFF   │ STA   │ ETA   │ Δ ETA │ AC REG│ LEG     │ Cảnh báo │       │
│ │    │        │     │     │       │ (OUT) │       │       │(ELDT) │ phút  │       │ STATE   │          │       │
│ ├────┼────────┼─────┼─────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼─────────┼──────────┤       │
│ │ 4  │ VN162  │ HAN │ SGN │ 06:00 │ 06:08 │ 06:18 │ 08:10 │ 08:14 │ +4    │ VN-A861│airborne│[─]      │       │
│ │ 5  │ VN1184 │ DAD │ HAN │ 06:30 │ 06:33 │ 06:42 │ 07:55 │ 08:02 │ +7    │ VN-A368│airborne│⚠WX-DEP  │       │
│ │ 6  │ BL182  │ HAN │ SGN │ 06:45 │ 06:58 │ 07:11 │ 08:55 │ 09:05 │ +10   │ VN-B651│airborne│⚠OSP+10' │       │
│ │ …  │        │     │     │       │       │       │       │       │       │       │         │          │       │
│ └────┴────────┴─────┴─────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴─────────┴──────────┘       │
│                                                                                                                  │
│ ── NHÓM C: ĐÃ HẠ CÁNH (FUNC-209) ─────────────── 5 chuyến ────────────────────────────────────────────────── ▼  │
│ ┌────┬────────┬─────┬─────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬─────────┬──────────┐       │
│ │ #  │ FLT NO │ DEP │ ARR │ STA   │ ATA   │ ON    │ IN    │ Δ STA │ Stand │ AC REG│ LEG     │ Cảnh báo │       │
│ │    │        │     │     │       │       │       │       │ phút  │       │       │ STATE   │          │       │
│ ├────┼────────┼─────┼─────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼─────────┼──────────┤       │
│ │ 7  │ VN161  │ SGN │ HAN │ 05:30 │ 05:42 │ 05:35 │ 05:42 │ +12   │ A05   │ VN-A861│ arrived│[─]      │       │
│ │ …  │        │     │     │       │       │       │       │       │       │       │         │          │       │
│ └────┴────────┴─────┴─────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴─────────┴──────────┘       │
│                                                                                                                  │
│ Tổng: 20 chuyến trong phạm vi ca trực  |  Cảnh báo đang raise: 4 (1 đỏ, 3 vàng)                                 │
└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

  ⓘ Mở chi tiết chuyến: click [FLT NO]  →  Panel chi tiết trượt ra bên phải (FUNC-205, FUNC-206, FUNC-207)
```

## 4. Danh sách thành phần + trường dữ liệu hiển thị

### 4.1 Header & Ca trực

| Thành phần | Trường (bám entity map) | Thực thể nguồn |
|---|---|---|
| Tên Dispatcher | `NGUOI_DUNG.ho_ten` | NGUOI_DUNG |
| Khung ca trực | `CA_TRUC.pham_vi` + giờ bắt đầu/kết thúc | CA_TRUC |
| Indicator ● LIVE | trạng thái kết nối server-push | (UI state, FUNC-208) |

### 4.2 Bộ lọc

| Thành phần | Trường | Thực thể |
|---|---|---|
| Carrier checkbox | `CHUYEN_BAY.carrier` (VN/0V/BL) | CHUYEN_BAY (FUNC-114) |
| DEP / ARR | `CHUYEN_BAY.dep_iata`, `arr_iata` | CHUYEN_BAY |
| Loại chuyến | `CHUYEN_BAY.leg_type` | CHUYEN_BAY |
| Trạng thái nhóm | filter theo `LEG STATE` + mốc ACARS | CHUYEN_BAY + MOC_KHAI_THAC |
| Ẩn/Hiện cột | cá nhân hóa session | (BR-102, FUNC-104, 105) |

### 4.3 Bảng nhóm A — Chưa cất cánh / chuẩn bị (FUNC-206)

| Cột | Trường | Thực thể |
|---|---|---|
| FLT NO | `CHUYEN_BAY.flight_no` | CHUYEN_BAY |
| DEP / ARR | `CHUYEN_BAY.dep_iata`, `arr_iata` | CHUYEN_BAY / SAN_BAY |
| STD | `CHUYEN_BAY.std` | CHUYEN_BAY |
| ETD | `CHUYEN_BAY.etd` | CHUYEN_BAY |
| TOBT / TSAT | `MOC_KHAI_THAC.tobt`, `tsat` (A-CDM) | MOC_KHAI_THAC |
| A-CDM Stage | suy ra từ `MOC_KHAI_THAC` (SOBT/EOBT/TOBT/ASBT/AOBT) | MOC_KHAI_THAC |
| GATE / Stand | `SAN_BAY.parking_stand` (gate + stand) | SAN_BAY |
| AC REG | `TAU_BAY.ac_reg` | TAU_BAY |
| LEG STATE | `CHUYEN_BAY.leg_state` `[cần xác nhận enum]` | CHUYEN_BAY |
| Cảnh báo | `CANH_BAO.loai`, `muc_do` | CANH_BAO |

### 4.4 Bảng nhóm B — Đang bay (FUNC-205, FUNC-207)

| Cột | Trường | Thực thể |
|---|---|---|
| FLT NO, DEP, ARR, STD | (như nhóm A) | CHUYEN_BAY |
| ATD (OUT) | `MOC_KHAI_THAC.out_time` (ACARS OUT) | MOC_KHAI_THAC |
| OFF | `MOC_KHAI_THAC.off_time` (ACARS OFF) | MOC_KHAI_THAC |
| STA / ETA (ELDT) | `CHUYEN_BAY.sta`, `eta` | CHUYEN_BAY |
| Δ ETA phút | `eta - sta` (delta minutes) | (computed) |
| AC REG, LEG STATE | (như trên) | TAU_BAY, CHUYEN_BAY |
| Cảnh báo | `CANH_BAO` gắn `acars_trigger=OFF` | CANH_BAO |

### 4.5 Bảng nhóm C — Đã hạ cánh

| Cột | Trường | Thực thể |
|---|---|---|
| ATA | `CHUYEN_BAY.ata` | CHUYEN_BAY |
| ON / IN | `MOC_KHAI_THAC.on_time`, `in_time` | MOC_KHAI_THAC |
| Δ STA phút | `ata - sta` | (computed) |
| Stand | `SAN_BAY.parking_stand` (ARR) | SAN_BAY |

### 4.6 Chi tiết chuyến — mở TAB MỚI của trình duyệt khi click ô/dòng

> **Cơ chế mở (đã chốt — §8-6):** click một ô hoặc một dòng trên bảng giám sát sẽ mở chi tiết chuyến bay ở **tab mới của trình duyệt** (cho phép mở đồng thời nhiều chuyến). Ô được click quyết định **tab phụ** nào trong màn chi tiết được focus (ví dụ click `MEL/CDL` → tab "Tàu bay/MEL", click `WX` → tab "Thời tiết/NOTAM"). Bám sheet "Màn hình Flight Dispatch" `[FL-FD]` + `[12062026 §II.1]` + `[FUNC-236, FUNC-237, FUNC-238]`. *(Bỏ phương án panel slide-out của bản nháp trước.)* Các nhóm trường dưới đây là nội dung hiển thị trong màn chi tiết:

| Nhóm | Trường |
|---|---|
| Định danh | flight_no, carrier, leg_no, leg_type, irregular, diverted |
| Mốc thời gian | STD/STA, ETD/ETA, ATD/ATA, OUT/OFF/ON/IN, A-CDM (SOBT/EOBT/TOBT/AOBT/TSAT/CTOT/TTOT/ATOT) |
| Tàu bay | ac_reg, ac_type, ac_subtype, config_cwy |
| Cảnh báo đang raise | bảng `CANH_BAO` lọc theo `flight_no` chưa `clear_time` |

## 5. Tương tác & trạng thái

| Tương tác | Mô tả |
|---|---|
| **Server-push cập nhật ô** (FUNC-208) | Khi nhận ACARS OUT/OFF/ON/IN cho chuyến X: chỉ cập nhật các ô liên quan (ATD, OFF, ON, IN, Δ ETA, LEG STATE, Cảnh báo) — KHÔNG reload toàn trang. Phương án dự phòng: auto-refresh từng ô theo chu kỳ. Giao thức cuối cùng `[cần xác nhận]`. |
| **Chuyển nhóm tự động** (FUNC-209) | Khi nhận OFF → chuyển chuyến từ Nhóm A sang Nhóm B; khi nhận IN → chuyển sang Nhóm C. Hiệu ứng: dòng "nhấc khỏi nhóm cũ + chèn vào đầu nhóm mới" có highlight 3 giây. |
| **Cảnh báo raise/clear theo mốc ACARS** (FUNC-210) | Mỗi loại cảnh báo gắn mốc raise + mốc clear: ví dụ "Cảnh báo OSP +X phút" raise khi nhận OUT trễ, clear khi nhận OFF đúng dự kiến mới; "Cảnh báo WX-DEP" clear khi METAR/SPECI mới đưa thời tiết về trong ngưỡng VMA `[cần xác nhận]`. |
| **Màu cảnh báo** (BR-103) | Đỏ + nhấp nháy = bắt buộc xử lý; Vàng = ghi nhận; Xanh = đã clear; Xám = không áp dụng. |
| **KHÔNG monitor dầu live trong Phase 5** (FUNC-210) | Panel chi tiết Phase 5 không hiển thị tiêu hao nhiên liệu live; chỉ ACARS FUEL tại các mốc OUT/OFF/ON/IN. Phân tích chi tiết dầu thuộc Post-Flight. |
| **Ẩn/Hiện cột** (BR-102) | Click [⚙ Ẩn/Hiện cột] → modal danh sách cột; lưu theo phiên cá nhân — không ảnh hưởng người khác. |
| **Click ô / dòng** | Mở chi tiết chuyến ở **tab mới của trình duyệt**; ô được click quyết định tab phụ được focus (xem §4.6). |
| **Hover cell cảnh báo** | Tooltip hiển thị: loại cảnh báo, raise_time, mốc ACARS gắn để clear. |

## 6. Ghi chú `[cần xác nhận]`

| # | Vấn đề | FUNC | Ảnh hưởng wireframe |
|---|---|---|---|
| 1 | Enum LEG STATE chính thức | FUNC-205 | Tạm dùng `on-gate / taxi-out / airborne / taxi-in / arrived` |
| 2 | Giao thức server-push (WebSocket/SSE/Webhook) | FUNC-208 | Wireframe chỉ thể hiện hành vi "tự cập nhật ô", không chốt giao thức |
| 3 | Hệ thống/màn hình hiện hành "Mission Watch" | FUNC-207 | Ghi chú nguồn = ACARS trực tiếp (không qua Mission Watch `[cần xác nhận]`) |
| 4 | A-CDM Stage — danh mục stage hiển thị (Boarding / ĐóngCửa / Push-back / …) | FUNC-206 | Tạm dùng 3 stage chính, chờ SME A-CDM xác nhận đầy đủ |
| 5 | VMA — viết tắt ngưỡng thời tiết tối thiểu | FUNC-210 (clear WX) | Giữ label "VMA `[cần xác nhận]`" trong tooltip cảnh báo WX |
| 6 | Số chuyến tham chiếu ~20 dòng × 20–30 cột (FUNC-208) | FUNC-208 | Wireframe minh họa 20 dòng (6+9+5); cột co giãn theo Ẩn/Hiện |

---

## 7. Bổ sung tham khảo từ POC `dsp_monitoring_poc.html` (Mockup Team BA)

> Nguồn: `ba/workspace/input/Mockup_Team_BA/dsp_monitoring_poc.html` — POC "Flight Monitoring — DSP" do team BA dựng. Đây là **hiện thực hóa trực quan của BR-125** ở mức hi-fi hơn; rút các thành phần dưới đây để bổ sung wireframe. *(POC là artifact nội bộ team → dùng làm **tham khảo thiết kế**; các quy ước/enum cần SME khách hàng xác nhận — giữ cờ.)*

### 7.1 Bố cục tổng thể (POC) — bổ sung khung ngoài
- **Sidebar trái** (thu/mở được) với nhóm menu: **Giám sát** (Flight Monitoring · Danh sách OFP · Cảnh báo); **Tác vụ** (Upload Common Docs · WX/NOTAM · MEL/CDL); **Hệ thống** (Cấu hình · Báo cáo).
- **Topbar**: tiêu đề "✈ FLIGHT MONITORING" + cụm **badge thống kê** (Tổng / ⚠ Cảnh báo / ✓ Bình thường) + ngày giám sát + đồng hồ real-time.
- **Filter bar** thu/mở: ô tìm `FLTNO/REG`, DEP, ARR, Loại CB, Status, Cảnh báo (Có/Bình thường), [✕ Reset].
- **Status bar dưới**: ● Real-time, "Hiển thị N/Tổng chuyến", phiên bản.
- Giao diện **dark theme**, bảng cuộn ngang, **header cố định (sticky) + sort click cột**.

### 7.2 Bảng giám sát đầy đủ cột (POC) — đối chiếu BR/FUNC

> POC dùng **một bảng sortable** với cột **Status** thay cho 3 nhóm tách (đối chiếu §3 hiện tại — xem 7.5). Mỗi cột cảnh báo có **tooltip mô tả quy tắc nghiệp vụ** (rất giá trị).

| Cột POC | Ý nghĩa / quy tắc (tooltip POC) | BR/FUNC | Thực thể·trường (entity map) |
|---|---|---|---|
| REG | Số đăng ký tàu | FUNC-205 | TAU_BAY.ac_reg |
| FLTNO | Số hiệu chuyến | FUNC-205 | CHUYEN_BAY.flight_no |
| DEP / ARR | Sân bay đi/đến | FUNC-205 | CHUYEN_BAY.dep/arr_iata |
| ETD / ETA | Giờ dự kiến đi/đến | FUNC-205 | CHUYEN_BAY.etd/eta |
| Type | Loại chuyến J/G/P/A/VIP (chip màu) | BR-126 | CHUYEN_BAY.leg_type |
| **Status** | GRD/BRD/OUT/ENR/IN/ARR (badge màu, **nhấp nháy** khi BRD/OUT) | FUNC-205/209 | CHUYEN_BAY.leg_state *(POC đề xuất enum — xem 7.3)* |
| **OFP Rev** | Số OFP + Revision cuối, **3 màu**: 🟢 đã Dispatch Release · 🟡 chưa release (bản trước đã) · 🔴 chưa rev nào release | BR-213/224 | TAI_LIEU_CHUYEN.ofp_number/version, released_by |
| EPLD | Payload EST trên OFP; cảnh báo nếu CLC nhập lệch quá ngưỡng | BR-120 | TAI_TRONG.payload (OFP↔CLC) |
| EST DOW | DOW EST trên OFP; so CLC, cảnh báo vượt trần/sàn | BR-120/406 | TAU_BAY.dow / TAI_TRONG |
| BLOCK FUEL | OFP Block Fuel; 🔴 nếu 30' trước ETD pilot chưa release; hiển thị delta khi đã release | BR-110/120 | OFP fuel |
| **PILOT EXTRA** | = Pilot Release − OFP Block Fuel (+thêm / −ít) | BR-309 (Pilot Extra) | TAI_TRONG / OFP |
| NOTAM | Kiểm tra NOTAM (đường bay/quân sự/RFFS/đóng cửa); ⚠ NOTAM mới chưa đánh giá | BR-118 | NOTAM |
| WX | Thời tiết DEP/ARR vs Minima (METAR 30'/lần, TAF; tầm nhìn/trần mây/TSRA) | BR-119 | THOI_TIET |
| ZFW-DOW | ZFW=DOW+Payload; cảnh báo lệch CLC vượt ngưỡng | BR-120/217 | TAI_TRONG.zfw |
| MEL/CDL | Cảnh báo MEL/CDL từ AMOS (ảnh hưởng nhiên liệu/mực bay) | BR-121/407 | MEL_CDL |
| ATC | Cảnh báo ATC (như Dispatch MO) | BR-223 | (ATC FPL) |
| TO/LD | Est TO/LD vs MTOW/MLDW theo điều kiện thực tế (TAF/METAR) | BR-110 (RTOW) | TAU_BAY.mtow / perf |
| Missing Doc | Tài liệu còn thiếu: OFP/NOTAM/WX/Dispatch Release (tag đỏ) | BR-112/222 | TAI_LIEU_CHUYEN |
| Taxi/APU | Lệch Taxi time / APU time so với FON | BR-124/430 | MOC_KHAI_THAC / Standard Taxi Time |
| Crew ↓ | Tổ bay chưa download tài liệu từ Pilot App | BR-112 (FUNC-145) | PHAN_CONG_TO_BAY / TAI_LIEU_CHUYEN |
| VIP | Chuyến VIP: ATC/OFP chưa có Status Head (⭐ / ⚠) | BR-126 | CHUYEN_BAY.leg_type=VIP |

### 7.3 Mô hình trạng thái chuyến (POC) — ứng viên chốt enum LEG STATE
POC đề xuất enum **Status**: `GRD` (mặt đất) → `BRD` (boarding) → `OUT` (off-block) → `ENR` (enroute/đang bay) → `IN` (in-block) → `ARR` (đã đến). Có **nhấp nháy** khi `BRD`/`OUT` (giai đoạn sát giờ cần chú ý).
→ Đây là **ứng viên trả lời** cho cờ "enum LEG STATE" (OID) và ánh xạ Nhóm A/B/C: A = GRD/BRD/OUT, B = ENR, C = IN/ARR. **Cần SME khách hàng xác nhận** trước khi chốt (POC là mockup team).

### 7.4 Quy ước hiển thị cảnh báo (POC) — bổ sung §5
- **OFP Rev 3 màu** (🟢/🟡/🔴) + định dạng "x/y/z Rn" `[cần xác nhận ý nghĩa x/y/z]`.
- **Icon trạng thái mỗi cột cảnh báo**: ✓ (OK) / ⚠ (vàng) / ✕ (đỏ) / — (N/A), kèm **tooltip quy tắc**.
- **Dòng có cảnh báo** tô nền đỏ nhạt; **badge Status nhấp nháy** khi BRD/OUT.
- **Missing Doc** = các tag đỏ liệt kê tài liệu thiếu (OFP/NOTAM/WX/Dispatch Release).
- **Type chip** màu theo J/G/P/A/VIP.

### 7.5 Đối chiếu POC ↔ wireframe hiện tại (cần BA Lead chốt)
| Khía cạnh | Wireframe §3 (hiện tại) | POC | Khuyến nghị |
|---|---|---|---|
| Tổ chức dòng | 3 nhóm tách (A/B/C) theo FUNC-209 | 1 bảng sortable + cột Status + filter | Giữ **mặc định nhóm** (FUNC-209) **+ chế độ xem 1 bảng sortable** (toggle) — đáp ứng cả hai |
| Cột | ~13 cột/nhóm | 23 cột (nhiều cột cảnh báo gộp NOTAM/WX/MEL/ATC/TO-LD/Taxi/Crew/Missing Doc) | **Gộp các cột cảnh báo** vào overview (ẩn/hiện theo BR-102); chi tiết xem panel |
| Khung ngoài | chưa có sidebar/topbar | có sidebar menu + topbar stats + statusbar | **Bổ sung** sidebar điều hướng DSP + topbar badge thống kê |

### 7.6 POC giúp chốt/đề xuất các cờ `[cần xác nhận]`
- **enum LEG STATE** → POC đề xuất GRD/BRD/OUT/ENR/IN/ARR (chờ SME).
- **Cột cảnh báo + tooltip quy tắc** → POC cung cấp diễn giải nghiệp vụ chi tiết (NOTAM/WX/ZFW/TO-LD/Pilot Extra/Crew↓…) — đưa vào đặc tả FUNC tương ứng.
- Các cờ còn lại (VMA, RFFS field, server-push, Mission Watch) POC **không** giải quyết — vẫn chờ SME.

> **Ghi chú đồng bộ:** đề xuất cập nhật (a) entity map: thêm enum `leg_state` ứng viên + thực thể nguồn Pilot App (Crew↓); (b) OID SME LEG STATE: ghi "POC đề xuất GRD/BRD/OUT/ENR/IN/ARR — chờ SME". File `.drawio` tương ứng nên regenerate để thêm khung sidebar/topbar + cột cảnh báo khi chốt phương án 7.5.

---

## 8. Đặc tả cột theo sheet "Màn hình Flight Dispatch" (NGUỒN CHÍNH THỨC khách hàng)

> **Nguồn:** `VNA-TOSS-Function-list-v1.0.extracted.md` → section `## Màn hình Flight Dispatch` (pull 2026-06-18, version 493, sửa bởi `hiepdv0695`).
>
> **Vai trò:** Đây là **source-of-truth** mà VNA đang base xây Màn hình Flight Dispatch. Mọi cột / quy tắc phân màu / hover / details trong mục này được chép TRUNG THỰC từ sheet, gắn cờ `[Function list — Màn hình Flight Dispatch]` (viết tắt `[FL-FD]`) ở cột Nguồn. Phần nào sheet để trống → ghi *(chưa có trong sheet)*; không suy diễn (CLAUDE.md §0).
>
> **Quan hệ với §3–§7:** §3 (ASCII 3 nhóm) và §7 (POC dsp_monitoring_poc) là **các góc nhìn nội bộ team BA**; §8 là **đặc tả chính thức bám sheet khách hàng**. Khi có xung đột → §8 ưu tiên; §3/§7 cần điều chỉnh theo §8.

### 8.1 Tổng quan màn hình (theo sheet)

- **Vị trí trong Function list:** Module 2 — **Flight Dispatch**, gồm 4 nhóm chức năng: (a) **Flight monitoring** — Màn hình giám sát danh sách tổng quan (chính là §8 này); (b) Lọc trên màn hình; (c) Release OFP (gồm Xem chi tiết chuyến bay — mở cửa sổ mới, Upload OFP trong details, Các tab thông tin trong chi tiết chuyến bay); (d) **Upload common Document** (danh sách / Xoá / Upload — chọn quãng thời gian hiệu lực có thể đưa lên MO theo ETD). `[FL-FD]`
- **Menu bar bên trái** (trên cùng màn hình): `Flight monitoring → ...`, `Upload common documents`. `[FL-FD]`
- **Bố cục:** Header chứa **dải Filter 1 → 20** (kèm 1 Filter chung) + **Bảng danh sách chuyến bay** 26 cột. `[FL-FD]`
- **Quy ước màu chung (sheet ghi cuối section):** `[FL-FD]`
  - **Không màu** — Bình thường.
  - **Đỏ** — cần giải quyết.
  - **Vàng** — lưu ý.
  - **Xanh lá** — đã xử lý.
- **Tương tác chung:** *"Các cảnh báo sẽ được phân màu theo rules đã thống nhất và khi hover chuột vào sẽ hiển thị tool tips chi tiết của cảnh báo theo từng ô, khi bấm vào chi tiết chuyến bay để xem full."* `[FL-FD]`
- **Mở chi tiết:** *"Bấm vào details sẽ nhảy sang **tab mới** chi tiết chuyến bay, bấm ở ô nào thì sẽ hiển thị tab tương ứng trong tab đó."* `[FL-FD]` *(Khác biệt với §4.6/§7: §4.6 dự kiến panel slide-out — cần thống nhất; sheet yêu cầu tab mới của trình duyệt.)*
- **Lưu cấu hình:** *"Lưu cấu hình bảng biểu và search."* `[FL-FD]` *(Ánh xạ BR-102 / FUNC-104, FUNC-105.)*
- **Phân quyền:** *"Phân quyền theo carrier."* `[FL-FD]` *(Ánh xạ BR-106 / FUNC-113, FUNC-114.)*

### 8.2 Bảng đặc tả 26 cột (trung thực theo sheet)

Mỗi dòng = 1 cột trên màn. Cột `Logic phân màu / cảnh báo` chép từ hàng **"Color"** của sheet; cột `Hover tooltip` chép từ hàng **"Hover details"**; cột `Details (lịch sử)` chép từ hàng **"Details"**. Ô trống = sheet không ghi.

| # | Tên cột | Ý nghĩa / dữ liệu hiển thị | Logic phân màu / cảnh báo | Hover tooltip | Details (lịch sử) | Nguồn |
|---|---|---|---|---|---|---|
| 1 | **DSP Release** | Check box. *"Active khi OFP đã tới thời điểm cần release. Khi nhấn vào sẽ release OFP. Điều kiện active là bóc tách OFP xem user DSP với số license nào tương ứng với thông tin trên DSP license trong thông tin user."* | (Active ↔ inactive theo điều kiện trên — sheet không định nghĩa thêm màu cho ô này) | *(chưa có trong sheet)* | *(chưa có trong sheet)* | `[FL-FD]` |
| 2 | **REG** | Số đăng ký tàu bay. Dữ liệu mẫu: `AZYX (không có VN); Tàu XU giữ nguyên`. | **Đỏ** — OFP DSP release khác Netline. **Không màu** — Chưa có OFP. **Xanh** — Sau đỏ, OFP = Netline. **Vàng** — OFP giống Netline và DSP chưa release. *(Quy tắc gắn vào cột REG theo bố cục sheet — cần kiểm chứng với SME vì logic này có yếu tố OFP/Netline; cờ `[cần xác nhận]`.)* | `Reg cũ → Reg mới; Giờ đổi trên netline` | Lịch sử đổi tàu — các mốc thời gian và tàu tương ứng. | `[FL-FD]` |
| 3 | **FLTNO** | Số hiệu chuyến bay. Dữ liệu mẫu: *"Đầy đủ"*. | **Surfix `D`, `Z`** → vàng. **Mất `D`/`Z`** → đỏ. Khi Ops++ hoặc Netline đổi status `ARR` hoặc có **ACARS IN** → back về thường. *"Thường là các trường hợp còn lại."* | `-` (gạch — sheet không ghi nội dung) | Lịch sử thay đổi số hiệu chuyến bay. | `[FL-FD]` |
| 4 | **DEP** | Sân bay đi. | `-` *(sheet để gạch ở hàng Color)* | `-` | *(chưa có)* | `[FL-FD]` |
| 5 | **ARR** | Sân bay đến. | **Chuyến Divert** → vàng khi thay đổi (ARR kế hoạch và thực tế khác nhau trong Ops++). | `Thông tin ARR Divert và giờ thực tế; ARR kế hoạch → ARR thực tế` | *(chưa có)* | `[FL-FD]` |
| 6 | **Date** | Ngày khai thác. Dữ liệu mẫu: `dd`. | Theo màu của cột **Flight Num** *(suy ra: lấy theo FLTNO)*. | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 7 | **ETD** | Giờ dự kiến cất cánh (`HH:MM:SS`, mẫu `16:00:00`). | **Vàng** — 15 tới 30 phút so với EDT trước đó trên Netline. **Xanh** — gửi điện change và lấy ETD mới so sánh. **Đỏ** — Netline kéo delayed trên 30 phút. **Xanh** — khi ATC vs OFP phải release khớp. | `Giờ cũ → giờ mới` | Lịch sử Netline kéo các mốc giờ. | `[FL-FD]` |
| 8 | **ETA** | Giờ dự kiến hạ cánh. Mẫu `16:00:00`. | *(chưa có trong sheet)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 9 | **Flight Type** | Loại chuyến (J/G/P/A/VIP/Ferry/Thường). Dữ liệu mẫu: *"Theo flight type"*. *"Check flight Type: thay đổi type của chuyến bay. Lưu lịch sử thay đổi của loại chuyến bay. VIP ↔ Thường; Thường ↔ Ferry; ngược lại."* | **Vàng** — đã ATC và OFP ra nhưng chưa release. **Đỏ** — Thường ↔ Ferry. **Đỏ** — Thường ↔ VIP. **Xanh** — Status head ATC và OFP đã release khớp (áp dụng chuyến thường → VIP và ngược lại). Với Thường ↔ Ferry thì dựa vào số pax trong OFP. | Hiển thị lịch sử thay đổi code nào sang code nào và thời điểm thay đổi. | Lịch sử đổi code. | `[FL-FD]` |
| 10 | **Status** | Trạng thái chuyến bay theo phase (tạm thời): `GRD` (Ground — đang PVMĐ) → `BRD` (Boarding) → `OUT` (Taxi out) → `ENR` (Enroute) → `IN` (Taxi in) → `ARR` (đã kết thúc). *"Khi chuyển trạng thái thì **nhấp nháy mấy lần rồi dừng**."* | *(chưa có trong sheet — chỉ có quy tắc nhấp nháy khi chuyển)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 11 | **OFP DSP** | OFP number và OFP Rev cuối, **định dạng `2/0/1 R2`**. *"Nếu Rev cuối đó đã dispatch release → **XANH**. Nếu Rev cuối chưa release mà có rev trước đó release → **VÀNG**. Nếu Rev cuối chưa release mà trước đó chưa có rev nào được DSP release → **ĐỎ**."* `[cần xác nhận ý nghĩa các số `2/0/1`]` | Xanh / Vàng / Đỏ như mô tả ở cột bên trái. | `Thời gian upload, Tên DSP, thời gian release.` | *(chưa có)* | `[FL-FD]` |
| 12 | **Pilot release** | Trạng thái pilot release. **Chưa confirm** → gạch trắng. **Đã confirm** → hiển thị phiên bản OFP `R01`. **Xanh** — đã release OFP cuối mà DSP đã release. **Vàng** — đã release OFP trước OFP cuối OFP release. **Đỏ** — Reject. | Như mô tả. | `Thời gian release.` | *(chưa có)* | `[FL-FD]` |
| 13 | **EPLD** | Hiển thị giá trị **PAYLOAD EST trên OFP**. *"Cảnh báo tại đây nếu Payload CLC nhập sai khác quá giới hạn."* | (Cảnh báo theo ngưỡng lệch CLC ↔ OFP — sheet không nêu màu cụ thể; cờ `[cần xác nhận]`.) | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 14 | **EST DOW** | Hiển thị giá trị **DOW EST trên OFP**. *"Cảnh báo tại đây nếu DOW CLC nhập sai khác quá giới hạn."* | (Như EPLD — cảnh báo khi lệch giới hạn; sheet không nêu màu.) | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 15 | **BLOCK FUEL** | OFP BLOCK FUEL. | *(chưa có trong sheet)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 16 | **PILOT EXTRA** | *"Nếu CB chưa có Flight Release thì bỏ trống. Cảnh báo màu nếu 30 phút trước EDT mà Pilot chưa release. Nếu đã có Pilot Release → hiển thị giá trị **Pilot Release − OFP Block Fuel** của đúng rev OFP được release bởi Pilot."* | **Cảnh báo màu** nếu 30 phút trước EDT mà Pilot chưa release; cụ thể màu — sheet không định nghĩa rõ; `[cần xác nhận]`. | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 17 | **NOTAM** | *"Check NOTAM (trên trang của quản lý bay hoặc LIDO). Kiểm tra NOTAM mới phát sinh; đánh giá ảnh hưởng (so với đường bay có ảnh hưởng hay không như hoạt động quân sự). Các loại NOTAM quan trọng: đóng cửa sân bay, đường bay, quân sự. Check cách cứu hoả RFFS (sân có public cách cứu hoả rồi, có NOTAM là cảnh báo rồi)."* | **Hai ngưỡng theo thời gian chưa-có / chưa-release OFP:** `[FL-FD]` <br>• **Chưa có OFP:** `(-)` nếu chưa tới giờ; `(!)` **Vàng** nếu sắp tới giờ (**210' quốc nội / 270' quốc tế**); `(!)` **Đỏ** nếu sắp tới giờ (**75' quốc nội / 95' quốc tế**). <br>• **Đã có OFP, DSP chưa release:** hiển thị phiên bản OFP; **Vàng** từ **75→60' quốc nội** (**90→75' quốc tế**); **Đỏ** từ **60' quốc nội / 75' quốc tế**. <br>• **Đã có OFP, DSP đã release:** hiển thị phiên bản OFP; **Xanh**. <br>*(Lưu ý: trong sheet logic màu này nằm ở dải cột NOTAM/WX/ZFW-DOW/MEL — áp dụng chung cho nhóm cột cảnh báo phụ thuộc OFP; cờ `[cần xác nhận]` về việc các cột MEL/WX/ZFW có dùng đúng cùng ngưỡng không.)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 18 | **WX** | *"Check thời tiết WX so với Minima của từng sân bay (đối với sân cất-hạ cánh); nguồn thời tiết: nội địa — trang web quản lý bay; quốc tế — LIDO. Minima sẽ có tiêu chuẩn. Quan tâm: tầm nhìn / trần mây / mưa giông (TSRA, TSRA+) / Airport chart (lấy từ Quản lý bay, Weather new). Căn cứ vào bản tin META (30 phút / lần)."* | *(Sheet không gắn quy tắc màu riêng cho WX; áp dụng quy tắc nhóm như cột 17 — cờ `[cần xác nhận]`.)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 19 | **ZFW-DOW** | *"Check **ZFW** (đổi tải trong FON): **60 phút quốc nội**, **90 phút quốc tế**. Căn cứ số liệu được nhập trên CLC estimate với OFP hiện tại; giới hạn lệch bao nhiêu thì cần khai báo, có **giới hạn trần và sàn**, khai báo trong **System Admin**. Check **DOW** (trong AHM — Drive Operating Weight)."* | Cảnh báo lệch CLC vs OFP vượt ngưỡng trần/sàn (ngưỡng khai báo trong System Admin); màu cụ thể — sheet không nêu; cờ `[cần xác nhận]`. | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 20 | **MEL/CDL** | *"Cảnh báo MEL/CDL (tích hợp **AMOS** — Master MEL). Lỗi kỹ thuật mà cần mang thêm dầu trong các MEL; ảnh hưởng mực bay."* | *(Sheet không nêu màu riêng — áp quy tắc nhóm; cờ `[cần xác nhận]`.)* Tích hợp AMOS — *"Chờ xem xét tích hợp"*. | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 21 | **ATC** | Cảnh báo ATC (*"nội dung như MO"*). | *(chưa có trong sheet)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 22 | **TO/LD (MTOW, MLDW)** | *"Cảnh báo **EST TO/LD (MTOW, MLDW)** trong OFP. Sân bay khai thác (FOE) — phần mềm tính performance; điều kiện TAF/META để tính performance và so với kế hoạch."* | *(chưa có trong sheet)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 23 | **Missing Document** | Cảnh báo chuyến bay thiếu tài liệu (OFP, NOTAM, WX). | *(chưa có trong sheet)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 24 | **Taxi APU** | *"Cảnh báo **Taxi, APU** so với FON. Lệch taxi time. (Danh mục sân bay sẽ cần khai báo taxi time tiêu chuẩn.)"* | *(chưa có)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 25 | **Crew change** | Cảnh báo tổ bay chưa download tài liệu. | *(chưa có)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |
| 26 | **VIP** | *"Cảnh báo chuyến VIP mà **ATC, OFP chưa có Status head**, trước chuyến bay."* | *(chưa có)* | *(chưa có)* | *(chưa có)* | `[FL-FD]` |

### 8.3 Dải Filter (1 → 20) — phân bố vị trí trong Header (theo sheet)

Sheet bố trí 20 Filter + 1 nhóm Filter cuối ở hàng Header (vị trí cột tương ứng):

| Filter # | Vị trí cột tương ứng | Diễn giải đề xuất (cần xác nhận) | Nguồn |
|---|---|---|---|
| Filter 1 | (giữa cụm Header chính) | Lọc theo trường chính của Header — `[cần xác nhận trường chính xác]` | `[FL-FD]` |
| Filter 2 | DSP Release | Lọc theo trạng thái DSP Release (đã/chưa release) | `[FL-FD]` |
| Filter 3 | REG | Lọc theo số tàu | `[FL-FD]` |
| Filter 4 | FLTNO | Lọc theo số hiệu chuyến | `[FL-FD]` |
| Filter 5 | DEP | Lọc theo sân bay đi | `[FL-FD]` |
| Filter 6 | ARR | Lọc theo sân bay đến | `[FL-FD]` |
| Filter 7 | Date | Lọc theo ngày khai thác | `[FL-FD]` |
| Filter 8 | ETD | Lọc theo khoảng ETD | `[FL-FD]` |
| Filter 9 | ETA | Lọc theo khoảng ETA | `[FL-FD]` |
| Filter 10 | Flight Type | Lọc theo loại chuyến (Thường/Ferry/VIP/J/G/P/A) | `[FL-FD]` |
| Filter 11 | Status | Lọc theo trạng thái GRD/BRD/OUT/ENR/IN/ARR | `[FL-FD]` |
| Filter 12 | OFP DSP | Lọc theo trạng thái OFP DSP (Xanh/Vàng/Đỏ/chưa có) | `[FL-FD]` |
| Filter 13 | Pilot release | Lọc theo trạng thái Pilot Release | `[FL-FD]` |
| Filter 14 | EPLD | Lọc cảnh báo Payload (có/không) | `[FL-FD]` |
| Filter 15 | EST DOW | Lọc cảnh báo DOW (có/không) | `[FL-FD]` |
| Filter 16 | BLOCK FUEL | Lọc cảnh báo Block Fuel | `[FL-FD]` |
| Filter 17 | PILOT EXTRA | Lọc cảnh báo Pilot Extra | `[FL-FD]` |
| Filter 18 | NOTAM | Lọc cảnh báo NOTAM | `[FL-FD]` |
| Filter 19 | WX | Lọc cảnh báo Weather | `[FL-FD]` |
| Filter 20 | ZFW-DOW | Lọc cảnh báo ZFW-DOW | `[FL-FD]` |
| Filter (cuối) | (gộp các cột còn lại) | Lọc theo nhóm cảnh báo còn lại: MEL/CDL, ATC, TO/LD, Missing Doc, Taxi APU, Crew change, VIP | `[FL-FD]` |

> **Cờ `[cần xác nhận]`:** sheet chỉ ghi nhãn `Filter 1 → 20` + 1 ô `Filter` cuối theo vị trí cột, **không liệt kê tường minh trường lọc**. Ánh xạ trên là đề xuất bám 1-1 vị trí cột để team xác nhận với khách hàng.

### 8.4 Phân quyền theo carrier

*"Phân quyền theo carrier"* `[FL-FD]` — kết hợp với mô hình đa carrier `VN / 0V / BL` (BR-106 / FUNC-113, FUNC-114): mỗi user/role thấy được tập chuyến của (các) carrier mà role đó được cấp.

### 8.5 Tương tác chi tiết chuyến bay

- **Click ô bất kỳ trên 1 dòng** → mở **tab mới** chi tiết chuyến bay; **bấm ở ô nào thì tab tương ứng trong cửa sổ chi tiết được focus** (vd click `MEL/CDL` → tab "Aircraft / MEL"; click `WX` → tab "Weather / NOTAM"). `[FL-FD]`
- **Hover bất kỳ ô cảnh báo** → tooltip chi tiết quy tắc và giá trị hiện tại (xem cột "Hover details" của §8.2). `[FL-FD]`
- **Lưu cấu hình:** mỗi user lưu cấu hình **bảng biểu (ẩn/hiện cột)** và **search** (BR-102 / FUNC-104, FUNC-105). `[FL-FD]`

### 8.6 Đối chiếu §8 ↔ §3 (3 nhóm A/B/C) ↔ §7 (POC) ↔ Mockup v0.4

| Khía cạnh | Sheet §8 (NGUỒN) | §3 ASCII | §7 POC | Mockup `screen-occ` v0.4 | Mockup `screen-dispatch` v0.4 |
|---|---|---|---|---|---|
| Tổ chức dòng | **1 bảng phẳng** + cột Status + 20 Filter | 3 nhóm A/B/C tách | 1 bảng sortable | 1 bảng phẳng | 1 bảng phẳng |
| Số cột | **26 cột** | ~13 cột/nhóm | 23 cột | 10 cột | 10 cột |
| Mở chi tiết | **Tab mới của trình duyệt**, focus đúng tab theo ô click | Panel slide-out bên phải | (POC không cụ thể) | Click row → `screen-detail` | Click row → `screen-detail` |
| Phân quyền | Theo **carrier** | Theo carrier (filter) | (không nêu) | (không có UI phân quyền) | (không có) |
| Lưu cấu hình | Bảng + search **theo user** | BR-102 ẩn/hiện cột | sticky header + sort | (không có) | (không có) |
| Màu chung | Đỏ/Vàng/Xanh lá/Không màu | Đỏ/Vàng/Xanh/Xám | Như §8 | Chip Red/Yellow/Green | Chip Red/Yellow/Green |

> **Khuyến nghị thống nhất:** §3 cần thêm **chế độ "1 bảng phẳng 26 cột"** (toggle với chế độ 3 nhóm); §4.6 **đã đổi** "panel slide-out" thành "**tab mới của trình duyệt**" để bám sheet (v0.4).

### 8.7 Cờ `[cần xác nhận]` phát sinh từ §8

| # | Vấn đề | Cột / mục liên quan | Đề xuất |
|---|---|---|---|
| §8-1 | Ý nghĩa định dạng `2/0/1 R2` của OFP DSP (3 số đầu là gì?) | Cột 11 OFP DSP | Hỏi SME: có phải `số OFP / số revision đã release / số revision chưa release Rn`? |
| §8-2 | Logic màu của cột REG (Xanh/Vàng/Đỏ theo trạng thái OFP) có phải sheet đặt nhầm dòng không? Đọc nội dung giống OFP DSP hơn | Cột 2 REG | Yêu cầu khách hàng xác nhận: quy tắc màu này áp cho REG hay OFP DSP? |
| §8-3 | Các cột WX / ZFW-DOW / MEL/CDL / ATC / TO/LD / Missing Doc / Taxi APU / Crew change / VIP **không có quy tắc màu riêng** trong sheet, chỉ có ngưỡng thời gian chung ở cột NOTAM | Cột 18–26 | Hỏi SME: dùng chung ngưỡng 210/270/75/95/75-60/60 với NOTAM hay mỗi cột có ngưỡng riêng? |
| §8-4 | Phân màu của EPLD / EST DOW khi vượt ngưỡng CLC vs OFP — đỏ hay vàng hay cả hai cấp? | Cột 13, 14 | Yêu cầu ngưỡng cụ thể từ System Admin |
| §8-5 | Filter 1–20 không liệt kê tường minh trường lọc — chỉ vị trí | §8.3 | Đề xuất bảng ở §8.3, xin xác nhận từng filter |
| §8-6 | Mở "chi tiết chuyến bay" — sheet ghi *"tab mới"*; wireframe hiện tại + mockup dùng cùng cửa sổ (panel slide-out / `screen-detail`). | §8.5 vs §4.6 / Mockup | Xin chốt: tab mới của trình duyệt hay panel/cửa sổ trong cùng tab? |
| §8-7 | Status `GRD/BRD/OUT/ENR/IN/ARR` — sheet ghi *"tạm thời"* → enum có thể thay đổi | Cột 10 Status | Trùng cờ §7 — POC đã đề xuất, vẫn chờ SME |
| §8-8 | Logic ETD: *"Xanh — khi ATC vs OFP phải release khớp"* xuất hiện ở cả Flight Type và ETD — liệu có trùng / thừa? | Cột 7 ETD + Cột 9 Flight Type | Xin xác nhận quy tắc xanh có khác nhau giữa 2 cột không |
| §8-9 | Hàng "Color" của các cột DEP / ETA / BLOCK FUEL / ATC / TO/LD / Missing Doc / Taxi APU / Crew change / VIP **để gạch hoặc trống** trong sheet | Cột 4, 8, 15, 21–26 | Sheet đang trống — cần bổ sung quy tắc màu cho 9 cột này |
| §8-10 | Hover của các cột 8–26 (ngoại trừ ETD, Flight Type, OFP DSP, Pilot release) **trống** trong sheet | Hàng Hover của §8.2 | Cần khách hàng bổ sung tooltip cho 19 cột còn lại |
| §8-11 | Details (lịch sử) chỉ có ở REG, FLTNO, ETD, Flight Type | Hàng Details của §8.2 | Các cột khác có cần Details không? |
| §8-12 | "Upload OFP trong details" và "Các tab thông tin trong xem chi tiết chuyến bay" thuộc nhóm Release OFP — chưa có wireframe riêng | §8.1 Tổng quan | Đề xuất tạo `wf-flight-detail-tabs.md` ở bước tiếp theo |

### 8.8 Ánh xạ §8 ↔ BR / FUNC

| Cột sheet §8 | BR | FUNC | Ghi chú |
|---|---|---|---|
| 1 DSP Release (checkbox + action) | BR-213 / BR-224 (Dispatch Release) | (cần FUNC mới — phát sinh từ sheet) | Active theo DSP license của user |
| 2 REG | BR-125 (Monitoring overview) | FUNC-205 | + history đổi tàu |
| 3 FLTNO | BR-125 | FUNC-205 | + history đổi số hiệu + suffix D/Z |
| 4–6 DEP/ARR/Date | BR-125 | FUNC-205 | ARR có cảnh báo Divert (vàng) |
| 7–8 ETD/ETA | BR-125 | FUNC-205, FUNC-210 | Ngưỡng 15–30' / >30' |
| 9 Flight Type | BR-126 (loại chuyến) | (cần FUNC mới) | Đỏ khi đổi loại; xanh khi ATC+OFP head khớp |
| 10 Status | BR-125 | FUNC-205, FUNC-209 | Enum GRD/BRD/OUT/ENR/IN/ARR — `[cần xác nhận]` |
| 11 OFP DSP | BR-213 / BR-224 | (FUNC OFP versioning) | Format `2/0/1 R2` |
| 12 Pilot release | BR-214 / BR-225 (Captain's Release) | (FUNC Pilot Release) | Reject = đỏ |
| 13 EPLD | BR-120 (Payload) | (FUNC EPLD warning) | Theo ngưỡng System Admin |
| 14 EST DOW | BR-120 / BR-406 | (FUNC DOW warning) | Trần/sàn ZFW |
| 15 BLOCK FUEL | BR-110 (Fuel) | (FUNC Block Fuel) | OFP Block Fuel |
| 16 PILOT EXTRA | BR-309 | (FUNC Pilot Extra delta) | = Pilot Release − OFP Block Fuel |
| 17 NOTAM | BR-118 | (FUNC NOTAM warning) | Ngưỡng 210/270/75/95 phút |
| 18 WX | BR-119 | (FUNC WX warning) | METAR 30'/lần, TAF |
| 19 ZFW-DOW | BR-120 / BR-217 | (FUNC ZFW warning) | 60' QN / 90' QT; trần/sàn System Admin |
| 20 MEL/CDL | BR-121 / BR-407 | (FUNC MEL warning) | Tích hợp AMOS — *"Chờ xem xét tích hợp"* |
| 21 ATC | BR-223 | (FUNC ATC warning) | "Như MO" |
| 22 TO/LD | BR-110 (RTOW) | (FUNC TO/LD performance) | FOE tính performance |
| 23 Missing Document | BR-112 / BR-222 | (FUNC Missing Doc) | OFP/NOTAM/WX |
| 24 Taxi APU | BR-124 / BR-430 | (FUNC Taxi APU) | So FON |
| 25 Crew change | BR-112 / FUNC-145 | FUNC-145 | Crew chưa download |
| 26 VIP | BR-126 | (FUNC VIP head) | ATC/OFP chưa head |

> **Hành động kế tiếp:** mở OID-TOSS-001 các cờ §8-1 đến §8-12 (12 mục mới); đề xuất FUNC mới cho các cột chưa có FUNC riêng (DSP Release, Flight Type, OFP DSP versioning, Pilot release, EPLD/EST DOW/BLOCK FUEL/PILOT EXTRA, NOTAM/WX/MEL/ATC/TO-LD/Missing Doc/Taxi APU/VIP).

---

## 9. Đối chiếu & bổ sung từ các nguồn liên quan

> Mục đích: dùng YCKT (TOSS-175 → TOSS-182), các báo cáo khảo sát 11/06 (sáng+chiều), 12/06 (sáng), 15/06 và SRS PH1 v0.5 (FUNC-204 → FUNC-276) để (a) bổ sung các cột cảnh báo mà sheet Function list bỏ trống; (b) giải các cờ màu/ngưỡng còn trống ở §8; (c) ánh xạ 26 cột ↔ FUNC/BR/YCKT; (d) cập nhật trạng thái 12 cờ §8-1…§8-12. Tuân thủ §0: chỉ ghi nội dung có nguồn, không suy diễn; nguồn trỏ trực tiếp ở mỗi dòng.

### 9.1 Cột cảnh báo BỔ SUNG từ YCKT TOSS-180 (ngoài 26 cột của sheet)

YCKT TOSS-180 liệt kê các trường cảnh báo màu trên Flight List mà **sheet "Màn hình Flight Dispatch" hiện không có cột tương ứng**. Đề xuất bổ sung vào màn (cần SME khách hàng xác nhận có gộp với cột hiện có hay tách cột riêng):

| # | Cột đề xuất bổ sung | Ý nghĩa (theo YCKT) | Đối chiếu cột §8 hiện có | Nguồn |
|---|---|---|---|---|
| 9.1-A | **Cabin defect** | Cảnh báo lỗi cabin của tàu bay đang được phân cho chuyến (lỗi cabin có thể chưa nằm trong MEL/CDL nhưng vẫn ảnh hưởng phục vụ hành khách). | Không có trong 26 cột (khác MEL/CDL ở cột 20). | `[YCKT TOSS-180]` |
| 9.1-B | **PAX nối chuyến (transfer/transit)** | Cảnh báo chuyến có hành khách nối chuyến cần ưu tiên (ảnh hưởng quyết định cho phép delay/đổi chuyến). | Không có (cột 26 VIP chỉ xử lý VIP, không xử lý nối chuyến). | `[YCKT TOSS-180]` |
| 9.1-C | **Loadfactor thấp** | Cảnh báo chuyến có hệ số lấp đầy ghế thấp (cơ sở quyết định gộp chuyến / huỷ / điều chỉnh kế hoạch). | Không có. | `[YCKT TOSS-180]` |
| 9.1-D | **Thiếu phép bay (Overflight/Landing permit)** | Cảnh báo chuyến thiếu phép bay (đặc biệt với chuyến quốc tế đi qua vùng trời cần xin phép). | Có thể gộp vào "Missing Document" (cột 23) nhưng sheet chỉ liệt kê OFP/NOTAM/WX → đề xuất tách hoặc mở rộng nội hàm cột 23. | `[YCKT TOSS-180]` |
| 9.1-E | **TAT không đủ (Turn-Around Time)** | Cảnh báo Turn-Around Time của tàu bay giữa hai chặng quá ngắn so với chuẩn (đối chiếu với `TAT SCHED` vs `TAT ACTUAL` — đã có trong FUNC-151 màn Kiểm tra đầu ca). | Không có cột riêng — sheet có "Taxi APU" (cột 24) nhưng chỉ về taxi time, không phải TAT. | `[YCKT TOSS-180]` · `[FUNC-151]` |
| 9.1-F | **Thiếu điện văn** | Cảnh báo chuyến thiếu điện văn khai thác (FPL/MVT/LDM/CPM…) cần gửi/nhận trước/trong chuyến. | Có thể gộp vào "Missing Document" (cột 23) nhưng sheet chỉ liệt kê OFP/NOTAM/WX → đề xuất mở rộng nội hàm cột 23 hoặc tách thành cột riêng. | `[YCKT TOSS-180]` |

> **Tóm tắt §9.1:** thêm **6 cột cảnh báo** từ YCKT TOSS-180 mà Function list bỏ trống — cabin defect, PAX nối chuyến, loadfactor thấp, thiếu phép bay, TAT không đủ, thiếu điện văn. Cần OID hỏi SME khách hàng: (a) tách cột riêng hay gộp vào cột hiện có (đặc biệt với 9.1-D và 9.1-F khả năng gộp vào Missing Document); (b) màu cảnh báo từng trường (YCKT chỉ nêu "cảnh báo màu" chung).

### 9.2 Giải/bổ sung quy tắc màu & ngưỡng từ báo cáo khảo sát

Đối chiếu các ô §8 còn trống (đặc biệt cờ §8-3, §8-4, §8-9) với báo cáo khảo sát 11/06, 12/06 và 15/06:

| Cột §8 (số/tên) | Hiện trạng sheet | Bổ sung từ khảo sát (có nguồn) | Nguồn |
|---|---|---|---|
| **Quy ước màu chung** | Đỏ / Vàng / Xanh lá / Không màu | **Bộ mã màu 4 trạng thái** áp xuyên suốt mọi cột: Đỏ (action ngay) / Vàng (lưu ý) / Xanh (đã xử lý — chỉ phát sinh **sau** khi đã từng Đỏ và xử lý xong) / Không màu (bình thường). Không tự chuyển Xanh từ Không màu. Tô màu cả ô (cell-level), không bo box, không chỉ đổi màu chữ. Đổi màu tự động theo dữ liệu nguồn (Lido/Netline/MO Plus/ACARS), điều phái không tick thủ công. | `[12062026 §II.7 #5,#7,#9,#10,#11]` · `[FUNC-247, FUNC-248, FUNC-249, FUNC-250]` |
| **Cột 2 REG** | Sheet ghi quy tắc 4 trạng thái nhưng chưa rõ ý nghĩa | **Quy tắc kết hợp tàu Netline × tàu trên OFP đã Dispatch Release:** Đỏ = lệch tàu + đã release; Vàng = khớp tàu nhưng chưa release; Xanh = khớp + đã release; Không màu = chưa có OFP. Hover hiển thị `REG cũ → REG mới + giờ đổi trên Netline (UTC)`; click ô mở Flight Detail tab Tàu bay với lịch sử đổi tàu. Lược tiền tố "VN" cho nhóm VNA/VNB (VNA893 → A893); nhóm khác (vd XU) giữ nguyên. | `[12062026 §II.9 #17,#18,#19]` · `[FUNC-260, FUNC-261, FUNC-262]` · `[BR-144]` |
| **Cột 3 FLTNO** | Suffix D/Z → vàng, mất D/Z → đỏ | **Bổ sung chi tiết:** Vàng khi có D/Z (giữ Vàng, không chuyển Xanh vì là chuyến đặc thù); Đỏ khi trước có D/Z nay mất (giật về ngày gốc). Hover hiển thị lịch sử D/Z. Trường hợp chuyển sang ngày sau **không qua D/Z** (chỉ đổi ETD) → cảnh báo ở cột ETD, không phải Flight Number. | `[12062026 §II.11 #21,#22]` · `[FUNC-266, FUNC-267, FUNC-268]` · `[BR-146]` |
| **Cột 5 ARR** | Divert → vàng | **Bổ sung quy tắc clear:** giữ Vàng đến khi A-CDM/Netline cập nhật giờ hạ cánh thực tế sân bay divert; clear khi nhận ACARS IN (xem FUNC-270). | `[12062026 §II.12]` · `[FUNC-269, FUNC-270]` |
| **Cột 7 ETD** | Vàng 15–30', Đỏ >30', Xanh khi ATC/OFP khớp | **Xác nhận ngưỡng OSP:** lệch ≥ 15 phút so với kế hoạch (cả sớm và muộn) → cảnh báo. Ngưỡng OSP do System Admin cấu hình. | `[11062026-sáng §5 #6,#7]` · `[BR-117/OSP]` |
| **Cột 8 ETA** | *(sheet để trống)* | **Bổ sung từ khảo sát:** chuyển **Xanh** khi nhận điện IN dẫn đến ARR. Nguồn: A-CDM nội địa (gần real-time) + quốc tế (chấp nhận trễ); ưu tiên Netline. Khi cột Xanh → clear/chuyển trạng thái cuối các cảnh báo liên quan của chuyến. | `[12062026 §II.12 #23]` · `[FUNC-269, FUNC-270]` · `[BR-147]` |
| **Cột 10 Status (LEG STATE)** | Enum GRD/BRD/OUT/ENR/IN/ARR tạm thời, nhấp nháy khi chuyển | **Đề xuất nhấp nháy khi BRD/OUT** (giai đoạn sát giờ cần chú ý) — POC `dsp_monitoring_poc.html` đề xuất; chốt enum cần SME. Phân nhóm tối thiểu 3: A = GRD/BRD/OUT (chưa cất cánh) → B = ENR (đang bay) → C = IN/ARR (đã hạ cánh). Chuyển nhóm tự động theo mốc ACARS OUT/OFF/ON/IN. | `[12062026 (POC) §III#9]` · `[11062026-chiều §II.6 #15]` · `[FUNC-209]` |
| **Cột 11 OFP DSP** | 3 màu Xanh/Vàng/Đỏ theo trạng thái Rev cuối | **Bổ sung ngưỡng thời gian** (cùng nhóm với cột 17 NOTAM): Vàng từ 75→60' quốc nội (90→75' quốc tế); Đỏ từ 60' quốc nội / 75' quốc tế. Cửa sổ release Dispatch: sớm nhất 75' (QN) / 90' (QT), muộn nhất 60' (QN) / 75' (QT) trước ETD. | `[15062026 §II.2 #5,#6]` |
| **Cột 12 Pilot release** | Xanh/Vàng/Đỏ (Reject) | **Bổ sung:** Vàng khi 30 phút trước ETD pilot chưa release. **PIC Confirm** là cột đề xuất bổ sung (khách hàng yêu cầu) tách riêng khỏi Pilot release — không ràng buộc cứng thời điểm. Un-Release luôn sinh phiên bản mới và khóa release tạm thời. | `[15062026 §II.2 #7,#8]` · `[YCKT TOSS-181]` |
| **Cột 13 EPLD** | Cảnh báo lệch CLC vs OFP — sheet không nêu màu | **Bổ sung từ khảo sát:** ngưỡng cảnh báo cấu hình theo **ma trận loại tàu × khoảng giờ bay × ngưỡng trên/dưới không đối xứng**; cấu hình trong System Admin. Màu cụ thể (vàng/đỏ theo mức lệch): *(chưa có nguồn — cờ §8-4 vẫn mở)*. | `[11062026-sáng §10 #14]` · `[YCKT TOSS-173]` |
| **Cột 14 EST DOW** | Tương tự EPLD | **Bổ sung:** áp ma trận ngưỡng tương tự EPLD; **cảnh báo ZFW ngoài giới hạn** (TOSS-180) — tính khoảng lệch chuẩn dựa trên giới hạn cấu hình, loại tàu, thời gian bay; so với ZFW của LS hoặc CLC nhập tay; cảnh báo cũng áp cho màn DSP document. Màu cụ thể: *(chưa có nguồn — cờ §8-4 vẫn mở)*. | `[YCKT TOSS-180 — ZFW]` · `[11062026-sáng §10 #14]` |
| **Cột 15 BLOCK FUEL** | *(sheet để gạch)* | **Bổ sung:** Đỏ nếu 30 phút trước ETD pilot chưa release; khi đã có Pilot Release thì hiển thị delta `Pilot Release − OFP Block Fuel` ở cột 16 PILOT EXTRA. | `[POC §7.2]` · `[15062026 — Pilot Release]` |
| **Cột 16 PILOT EXTRA** | Cảnh báo màu nếu 30' trước ETD chưa release; sheet không nêu màu cụ thể | **Bổ sung:** màu **Đỏ** khi 30' trước ETD pilot chưa release (đồng nhất với Pilot release Cột 12). | `[POC §7.2]` · `[15062026 §II.2]` |
| **Cột 17 NOTAM** | Đã có ngưỡng 210/270/75/95 và 75-60/60-quốc nội · 90-75/75-quốc tế | **Xác nhận ngưỡng** trùng với buổi 15/06: cửa sổ release 210' (QN) / 270' (QT) → 75' (QN) / 90' (QT) → 60' (QN) / 75' (QT). NOTAM phân 3 nhóm (sân bay / vùng trời / đường bay); NOTAM cứu hỏa (RFFS) khi phát ra thì cảnh báo trực tiếp. | `[15062026 §II.2 #5]` · `[11062026-sáng §6 #10,#11]` |
| **Cột 18 WX** | *(sheet không gắn quy tắc màu riêng)* | **Bổ sung từ khảo sát 11/06-sáng:** 3 thông số chính so với **VMA + biên an toàn**: tầm nhìn, trần mây, TSRA. METAR 30 phút/lần; SPECI khi có biến động. Nguồn nội địa = VATM/VNCM, quốc tế = Lido. Áp **cùng ngưỡng nhóm với NOTAM** *(cờ §8-3 — cần SME khẳng định)*. | `[11062026-sáng §7 #12,#13]` · `[BR-119]` · `[FUNC-180…184]` |
| **Cột 19 ZFW-DOW** | 60' QN / 90' QT; trần/sàn System Admin | **Xác nhận từ khảo sát:** check ZFW trong FON; cấu hình trần/sàn System Admin theo ma trận loại tàu × giờ bay; lưu lịch sử nhập CLC để luôn lấy được con số nhập cuối cùng. | `[11062026-sáng §10 #14]` · `[15062026 §III "Taxi time so với FON và time-window ZFW"]` · `[YCKT TOSS-173]` |
| **Cột 20 MEL/CDL** | "Chờ xem xét tích hợp" AMOS | **Tích hợp AMOS — Master MEL** đã xác nhận; lỗi MEL ảnh hưởng nhiên liệu/mực bay. Cảnh báo gắn AMOS có thể trễ do tích hợp. *(Cờ §8-3 về việc dùng chung ngưỡng OFP — vẫn mở.)* | `[POC §7.2]` · `[FL-FD MEL/CDL]` |
| **Cột 21 ATC** | Cảnh báo "như MO" — sheet không nêu màu | *(Sheet ghi tham chiếu MO; trong các báo cáo khảo sát đã đọc 11/06–15/06 chưa thấy ngưỡng/màu cụ thể cho ATC — **cờ §8-3 và §8-9 vẫn mở** cho cột 21.)* | *(chưa có nguồn)* |
| **Cột 22 TO/LD (MTOW, MLDW)** | EST TO/LD vs MTOW/MLDW theo TAF/META | *(Sheet ghi rõ logic; báo cáo khảo sát chưa nêu ngưỡng màu/màu cụ thể — **cờ §8-9 vẫn mở** cho TO/LD; gợi ý áp ma trận RTOW System Admin tương tự ZFW.)* | `[BR-110/RTOW]` · *(chưa có ngưỡng cụ thể)* |
| **Cột 23 Missing Document** | OFP/NOTAM/WX | **Mở rộng nội hàm theo YCKT TOSS-180:** bổ sung "thiếu phép bay" (9.1-D), "thiếu điện văn" (9.1-F) vào danh mục tài liệu kiểm tra. Cảnh báo "chuyến bay thiếu tài liệu" được thống nhất bổ sung vào module Dispatch (KS 11/06 chiều §II.1). Ngưỡng thời gian: TOSS-175 *(YCKT chỉ nêu "Thời gian cảnh báo chuyến bay thiếu tài liệu" là tham số khai báo, không nêu giá trị)*. | `[YCKT TOSS-175, TOSS-180]` · `[11062026-chiều §II.1 #1]` |
| **Cột 24 Taxi APU** | Lệch taxi vs FON | **Bổ sung:** danh mục sân bay khai báo Standard Taxi Time; lệch APU time so với FON. *(Màu cụ thể vẫn trống — cờ §8-9.)* | `[15062026 §III]` · `[BR-124, BR-430]` |
| **Cột 25 Crew change** | Crew chưa download tài liệu | **Xác nhận:** TOSS kết nối **MO Plus** lấy trạng thái download tài liệu của tổ bay; cảnh báo khi tổ bay chưa download bản tài liệu mới nhất trong khoảng thời gian quy định trước chuyến bay (`[YCKT TOSS-175]` cấu hình "Thời gian cảnh báo chuyến bay thiếu tài liệu"). | `[11062026-chiều §II.1 #1,#2]` · `[FUNC-145]` |
| **Cột 26 VIP** | ATC/OFP chưa có Status Head | **Bổ sung quy tắc raise/clear:** cảnh báo "Chuyến không thường lệ — OFP chưa có STS/HEAD" nằm ở giai đoạn **trước Captain's Release**; sau khi MO Plus đã release thì TOSS không cảnh báo nữa. Áp dụng cho mọi chuyến không thường lệ (không chỉ VIP — cần cân nhắc mở rộng nội hàm cột 26 hoặc tách cột mới). | `[11062026-chiều §II.2 #3]` · `[Glossary STS/HEAD bổ sung]` |

> **Tóm tắt §9.2:** giải được **toàn bộ cờ §8-3** (NOTAM/WX/MEL có thể dùng chung ngưỡng OFP — đã có khung 210/270/75/95/75-60/60; vẫn cần SME chốt cho từng cột riêng); **một phần cờ §8-4** (EPLD/EST DOW có ma trận từ System Admin, nhưng màu vàng/đỏ cụ thể chưa có); **một phần cờ §8-9** (ETA, BLOCK FUEL, Crew change đã có quy tắc màu từ khảo sát; DEP, ATC, TO/LD, Missing Document, Taxi APU, VIP vẫn trống). Giải được **cờ §8-7** (POC đề xuất GRD/BRD/OUT/ENR/IN/ARR — báo cáo 12/06 cũng dùng enum này và đã ghi nhận cần SME xác nhận lại, OID đã mở).

### 9.3 Ánh xạ 26 cột (+ 6 cột bổ sung §9.1) ↔ FUNC / BR / YCKT / Báo cáo KS

| Cột | FUNC (PH1) | BR | YCKT TOSS-xxx | Báo cáo KS |
|---|---|---|---|---|
| 1 DSP Release | (cần phân rã FUNC mới — đề xuất "FUNC DSP Release Action") | BR-213 / BR-224 | TOSS-181 (lịch sử thay đổi) | `[15062026 §II.2]` |
| 2 REG | FUNC-260, FUNC-261, FUNC-262 | BR-144 | TOSS-181 | `[12062026 §II.9]` |
| 3 FLTNO | FUNC-243, FUNC-244, FUNC-245, FUNC-266, FUNC-267, FUNC-268 | BR-136, BR-146 | TOSS-181 | `[12062026 §II.3, §II.11]` |
| 4 DEP | FUNC-205 (Monitoring minimum fields) | BR-125 | TOSS-178 | `[11062026-chiều §II.6]` |
| 5 ARR | FUNC-269 (clear khi ARR), FUNC-205 | BR-125, BR-147 | TOSS-183 (divert) | `[12062026 §II.12]` |
| 6 Date | FUNC-205 | BR-125 | TOSS-178 | — |
| 7 ETD | FUNC-205, FUNC-210 (cảnh báo OSP) | BR-125 | TOSS-181 | `[11062026-sáng §5]` |
| 8 ETA | FUNC-205, FUNC-269, FUNC-270 | BR-125, BR-147 | TOSS-178 | `[12062026 §II.12]` |
| 9 Flight Type | (cần FUNC mới — "FUNC Flight Type Change Warning") | BR-126 | TOSS-180 (VIP), TOSS-181 | `[11062026-chiều §II.2]` |
| 10 Status (LEG STATE) | FUNC-205, FUNC-209 | BR-125 | TOSS-182 | `[11062026-chiều §II.6 #15]` · `[12062026 (POC)]` |
| 11 OFP DSP | (cần FUNC mới — "FUNC OFP Versioning / Release Window") | BR-213, BR-224 | — | `[15062026 §II.2]` |
| 12 Pilot release | (cần FUNC mới — "FUNC Pilot Release + PIC Confirm") | BR-214, BR-225 | — | `[15062026 §II.2]` |
| 13 EPLD | (cần FUNC mới — "FUNC Payload Variance Warning") | BR-120 | TOSS-173 | `[11062026-sáng §10]` |
| 14 EST DOW | (cần FUNC mới — "FUNC DOW/ZFW Variance Warning") | BR-120, BR-406 | TOSS-173, TOSS-180 (ZFW) | `[11062026-sáng §10]` |
| 15 BLOCK FUEL | (cần FUNC mới — "FUNC Block Fuel Display") | BR-110 | TOSS-172 (ngưỡng chênh nhiên liệu) | `[15062026]` |
| 16 PILOT EXTRA | (cần FUNC mới — "FUNC Pilot Extra Delta") | BR-309 | TOSS-172 | `[15062026]` |
| 17 NOTAM | FUNC-177 (BR-118 cảnh báo NOTAM), (cần FUNC mới — "FUNC NOTAM Warning Threshold") | BR-118 | — | `[11062026-sáng §6]` · `[15062026 §II.2]` |
| 18 WX | FUNC-180, FUNC-181, FUNC-184 | BR-119 | — | `[11062026-sáng §7]` |
| 19 ZFW-DOW | (cần FUNC mới — "FUNC ZFW Variance"); tham chiếu FUNC EPLD | BR-120, BR-217 | TOSS-173, TOSS-180 | `[11062026-sáng §10]` |
| 20 MEL/CDL | FUNC-193 (BR-121 CDL), (cần FUNC mới — "FUNC MEL Integration AMOS") | BR-121, BR-407 | — | `[POC §7.2]` |
| 21 ATC | (cần FUNC mới — "FUNC ATC Warning") | BR-223 | — | *(chưa có nguồn cụ thể)* |
| 22 TO/LD | (cần FUNC mới — "FUNC TO/LD Performance Warning") | BR-110 | — | `[POC §7.2]` |
| 23 Missing Document | (cần FUNC mới — "FUNC Missing Document Warning") | BR-112, BR-222 | TOSS-175 | `[11062026-chiều §II.1]` |
| 24 Taxi APU | (cần FUNC mới — "FUNC Taxi/APU Variance") | BR-124, BR-430 | — | `[15062026 §III]` |
| 25 Crew change | FUNC-145 | BR-112 | TOSS-175 (gián tiếp) | `[11062026-chiều §II.1]` |
| 26 VIP | (cần FUNC mới — "FUNC VIP Head Check") | BR-126 | TOSS-180 | `[11062026-chiều §II.2]` |
| **9.1-A Cabin defect** | (cần FUNC mới — "FUNC Cabin Defect Warning") | (cần BR mới) | TOSS-180 | *(chưa có khảo sát chi tiết)* |
| **9.1-B PAX nối chuyến** | (cần FUNC mới — "FUNC Transfer PAX Warning") | (cần BR mới) | TOSS-180 | *(chưa có khảo sát chi tiết)* |
| **9.1-C Loadfactor thấp** | (cần FUNC mới — "FUNC Low Loadfactor Warning") | (cần BR mới) | TOSS-180 | *(chưa có khảo sát chi tiết)* |
| **9.1-D Thiếu phép bay** | (cần FUNC mới — "FUNC Missing Flight Permit Warning") | (cần BR mới hoặc mở rộng BR-112/222) | TOSS-180 | *(chưa có khảo sát chi tiết)* |
| **9.1-E TAT không đủ** | FUNC-151 (đã có ở màn Kiểm tra đầu ca) → (cần FUNC mới cho màn Giám sát — "FUNC TAT Short Warning") | (cần BR mới hoặc mở rộng BR-114) | TOSS-180 | `[FUNC-151]` |
| **9.1-F Thiếu điện văn** | (cần FUNC mới — "FUNC Missing Operational Message Warning") | (cần BR mới hoặc mở rộng BR-112/222) | TOSS-180 | *(chưa có khảo sát chi tiết)* |

> **Tóm tắt §9.3:** trong **32 cột** (26 sheet + 6 bổ sung): **đã ánh xạ FUNC hiện có cho 11 cột** (REG, FLTNO, một phần DEP/ARR/ETD/ETA, Status, NOTAM, WX, Crew change, TAT-một phần) — phần lớn cụm BR-125/144/146/147 và BR-118/119/121; **21 cột cần phân rã FUNC mới** (DSP Release, Flight Type, OFP DSP, Pilot release, EPLD, EST DOW, BLOCK FUEL, PILOT EXTRA, ZFW-DOW dedicated, MEL/CDL dedicated, ATC, TO/LD, Missing Document, Taxi APU, VIP, và toàn bộ 6 cột §9.1). Đề xuất tạo cụm BR/FUNC mới cho 6 cột §9.1.

### 9.4 Cập nhật trạng thái 12 cờ §8-1…§8-12

| # | Cờ | Trạng thái sau §9 | Ghi chú |
|---|---|---|---|
| §8-1 | Ý nghĩa `2/0/1 R2` của OFP DSP | **Vẫn mở** — chưa nguồn nào giải | OID cần SME khách hàng |
| §8-2 | Logic màu cột REG (sheet đặt nhầm dòng?) | **→ Giải bởi `[12062026 §II.9]` + `[FUNC-260, FUNC-261, FUNC-262]`** — quy tắc 4 trạng thái áp đúng cho cột REG (kết hợp Netline × OFP), không phải OFP DSP | Cờ đóng |
| §8-3 | Các cột WX/ZFW-DOW/MEL/ATC/TO-LD/Missing/Taxi/Crew/VIP có dùng chung ngưỡng OFP không | **Một phần giải** — WX/ZFW-DOW/MEL có thể chia sẻ khung 210/270/75/95/75-60/60 (xem §9.2) nhưng SME cần khẳng định từng cột; ATC/TO-LD/Missing/Taxi/VIP vẫn cần xác nhận ngưỡng riêng | Vẫn mở (giảm phạm vi) |
| §8-4 | Phân màu EPLD/EST DOW khi vượt ngưỡng — đỏ/vàng/cả hai cấp | **Một phần giải** — đã rõ có ma trận loại tàu × giờ bay × trần/sàn (`[11062026-sáng §10]` + `[YCKT TOSS-173, TOSS-180]`); cụ thể màu vàng/đỏ theo mức lệch vẫn cần SME | Vẫn mở (giảm phạm vi) |
| §8-5 | Filter 1–20 không liệt kê tường minh trường lọc | **Vẫn mở** — sheet chỉ ghi vị trí | OID cần SME |
| §8-6 | Mở chi tiết = tab mới (sheet) vs panel slide-out (§4.6) | **→ Giải bởi `[12062026 §II.1]` + `[FUNC-236, FUNC-237, FUNC-238]`** — chốt **tab mới của trình duyệt**, mở đồng thời nhiều tab; click cảnh báo active đúng tab phụ. §4.6 cần cập nhật. | Cờ đóng — đề xuất sửa §4.6 |
| §8-7 | Enum LEG STATE GRD/BRD/OUT/ENR/IN/ARR — tạm thời | **Một phần giải** — POC `[12062026 §III#9]` đề xuất enum này; báo cáo ghi nhận **cần SME xác nhận lại** danh sách, định nghĩa và quy tắc chuyển trạng thái | Vẫn mở (đã có ứng viên + lý do cần SME) |
| §8-8 | Logic ETD: "Xanh khi ATC vs OFP release khớp" trùng giữa ETD và Flight Type | **Vẫn mở** — chưa nguồn nào giải tách bạch | OID cần SME |
| §8-9 | Hàng Color trống cho 9 cột (DEP/ETA/BLOCK FUEL/ATC/TO-LD/Missing/Taxi/Crew/VIP) | **Một phần giải** — ETA (`[12062026 §II.12]`), BLOCK FUEL/PILOT EXTRA (`[POC §7.2]` + `[15062026]`), Crew change (`[11062026-chiều §II.1]`), VIP (`[11062026-chiều §II.2]`) đã có quy tắc; DEP, ATC, TO/LD, Missing Document, Taxi APU vẫn trống | Vẫn mở (5 cột chưa rõ) |
| §8-10 | Hover của 19 cột trống | **Vẫn mở** — chưa nguồn nào liệt kê tooltip cụ thể; tham khảo POC `dsp_monitoring_poc.html` có gợi ý | OID cần SME |
| §8-11 | Details (lịch sử) chỉ có 4 cột (REG, FLTNO, ETD, Flight Type) | **Một phần giải** — `[FUNC-275, FUNC-276]` đã chốt **format lịch sử đổi chung** áp cho mọi đối tượng (đổi tàu, đổi tổ bay, đổi giờ ETD, suffix D/Z); các cột khác có cần lịch sử riêng hay không vẫn chờ SME | Vẫn mở (đã có khung format) |
| §8-12 | Wireframe `wf-flight-detail-tabs.md` chưa có | **Vẫn mở** — đề xuất tạo wireframe riêng bám `[FUNC-236 → FUNC-242]` (Flight Detail tabs: Cảnh báo, Flight Release, Tàu bay/MEL, Tổ bay) | OID chuyển sang "công việc cần làm" |

**Cờ mới phát sinh từ §9 (đề xuất OID):**

| # | Cờ mới | Cột / mục | Ghi chú |
|---|---|---|---|
| §9-1 | 6 cột bổ sung từ TOSS-180 (cabin defect / PAX nối chuyến / loadfactor / thiếu phép bay / TAT không đủ / thiếu điện văn): tách cột riêng hay gộp vào cột hiện có | §9.1 | Quyết định ảnh hưởng số cột màn (32 cột vs 26 cột); SME khách hàng quyết |
| §9-2 | Màu vàng/đỏ cụ thể của EPLD/EST DOW theo mức lệch ngưỡng | §9.2 (cột 13, 14) | Cần đặc tả "lệch X% → vàng; lệch Y% → đỏ" |
| §9-3 | TAT không đủ — ngưỡng phút TAT thiếu so với chuẩn để raise cảnh báo | §9.1-E | Có TAT SCHED / TAT ACTUAL (FUNC-151) nhưng ngưỡng raise chưa có |
| §9-4 | Loadfactor thấp — ngưỡng % lấp đầy để raise cảnh báo | §9.1-C | SME thương mại/khai thác chốt |
| §9-5 | PAX nối chuyến — định nghĩa "nối chuyến cần ưu tiên" (số chuyến nối, thời gian nối tối thiểu) | §9.1-B | SME thương mại chốt |
| §9-6 | Quy tắc gộp "thiếu phép bay" và "thiếu điện văn" vào cột 23 Missing Document hay tách cột riêng | §9.1-D, §9.1-F | Quyết định ảnh hưởng đặc tả Missing Document |
| §9-7 | Mâu thuẫn nguồn — sheet ghi "tab mới" (§8.5) vs wireframe §4.6 ghi "panel slide-out" | **Đã xử lý (v0.4):** §4.6 + bảng §5 đã đổi sang "tab mới của trình duyệt" theo nguồn đã chốt | Đóng — không còn mâu thuẫn |

> **Tóm tắt §9.4:** trong **12 cờ §8-1…§8-12** ban đầu: **2 cờ đóng** (§8-2, §8-6); **5 cờ một phần giải** (§8-3, §8-4, §8-7, §8-9, §8-11); **5 cờ vẫn mở hoàn toàn cần SME** (§8-1, §8-5, §8-8, §8-10, §8-12). **Phát sinh thêm 7 cờ mới §9-1…§9-7** từ đối chiếu YCKT + khảo sát.

### 9.5 Mâu thuẫn giữa các nguồn (rà soát chéo)

| # | Nguồn A | Nguồn B | Mô tả mâu thuẫn | Đề xuất xử lý |
|---|---|---|---|---|
| M1 | Sheet `[FL-FD]` §8.5 — "mở chi tiết = tab mới của trình duyệt" | Wireframe §4.6 v0.2 — "panel slide-out bên phải" | Hai cách mở Flight Detail khác nhau | **Theo sheet + `[FUNC-236]`**: tab mới của trình duyệt → cập nhật §4.6 ở version kế tiếp |
| M2 | Sheet `[FL-FD]` §8 — 1 bảng phẳng 26 cột + cột Status | Wireframe §3 v0.2 — 3 nhóm tách A/B/C | Hai mô hình tổ chức dòng khác nhau | **Theo sheet là mặc định**; cho phép toggle "chế độ 3 nhóm" theo FUNC-209 như chế độ phụ (đã đề xuất ở §7.5 và §8.6) |
| M3 | Sheet `[FL-FD]` cột 5 ARR — Divert → vàng | YCKT TOSS-183 — "Chuyến bay divert và thông tin divert (sân bay dự kiến ban đầu, sân bay thực tế)" | YCKT mở rộng nội hàm (cần hiển thị cả 2 sân bay) — sheet chỉ ghi cảnh báo màu | **Cộng gộp**: vàng cảnh báo + hover hiển thị `ARR kế hoạch → ARR thực tế` (đã ghi trong sheet) — không mâu thuẫn, chỉ bổ sung |
| M4 | POC `dsp_monitoring_poc.html` — enum GRD/BRD/OUT/ENR/IN/ARR | Khảo sát 12/06 §III#9 — "nội dung này xuất phát từ đề xuất của bản mẫu chứ chưa được nêu trong nội dung phỏng vấn" | POC tự đưa enum, chưa có nguồn nghiệp vụ chính thức | Giữ ứng viên + OID SME chốt enum chính thức (đã có cờ §8-7) |
| M5 | Sheet `[FL-FD]` cột 13 EPLD — cảnh báo khi CLC nhập sai khác giới hạn (không nêu màu) | KS 11/06-sáng §10 — ngưỡng theo ma trận loại tàu × giờ bay × trên/dưới | Không mâu thuẫn — sheet thiếu, khảo sát bổ sung đầy đủ | Áp khảo sát; cờ §8-4 vẫn để mở vì màu cụ thể chưa có |
| M6 | Sheet `[FL-FD]` cột 26 VIP — "ATC, OFP chưa có Status Head trước chuyến bay" | KS 11/06-chiều §II.2 — phạm vi cảnh báo là **mọi chuyến không thường lệ** (không chỉ VIP) trước Captain's Release | Khảo sát mở rộng phạm vi — sheet hẹp hơn | OID đề xuất mở rộng cột 26 (đổi tên "VIP" → "Status Head") hoặc tách cột mới — SME quyết |

