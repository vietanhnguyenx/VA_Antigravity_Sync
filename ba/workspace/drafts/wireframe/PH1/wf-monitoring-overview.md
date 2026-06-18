---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
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

### 4.6 Panel chi tiết chuyến (slide-out khi click FLT NO)

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
| **Click [FLT NO]** | Mở Panel chi tiết bên phải (xem §4.6). |
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
