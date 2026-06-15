---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
status: "Draft"
document_type: "Wireframe (low-fidelity)"
document_id: "WF-PH1-MON-DUTY-MANAGER"
---

# Wireframe — Màn giám sát của trực ban trưởng (OCC Duty Manager)

## 1. Mục tiêu màn

Cung cấp cho trực ban trưởng (OCC Duty Manager) một màn hình giám sát tập trung vào **trạng thái khai thác** và **khách nối chuyến** trên phạm vi nhiều chuyến cùng lúc (thay vì xem lần lượt từng chuyến như hiện trạng). Cho phép xem ở **nhiều cấp**: tổng quan trạm/căn cứ → danh sách chuyến → chi tiết chuyến → chi tiết hành khách.

## 2. BR / FUNC liên quan

| BR | FUNC | Vai trò |
|---|---|---|
| BR-113 | FUNC-144 | Màn giám sát trực ban trưởng: trạng thái khai thác + khách nối chuyến |
| BR-113 | FUNC-146 | Hỗ trợ nhiều cấp xem tổng quan → chi tiết; nhiều chuyến cùng lúc |
| BR-113 | FUNC-147 | Theo dõi khách nối chuyến (nối vào / nối ra) và cảnh báo nguy cơ lỡ nối |
| BR-102 | FUNC-104, 105 | Ẩn/hiện cột theo phiên |
| BR-106 | FUNC-113, 114 | Đa Carrier (VN, 0V, BL) |

## 3. Bố cục ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  TOSS — GIÁM SÁT TRỰC BAN TRƯỞNG               Trực ban trưởng: TRẦN VĂN E   |   Ca: 06:00 - 18:00              │
│                                                Cập nhật: tự động ● LIVE       |   Phạm vi: VNA + 0V + BL        │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Carrier: [✓ VN] [✓ 0V] [✓ BL]   Căn cứ: [▼ HAN]   ARR: [▼ Tất cả]   Trạng thái: [▼ Tất cả]                    │
│ Cảnh báo: [✓ OSP] [✓ Divert] [✓ Đổi tổ] [✓ Khách nối chuyến] [✓ Tài liệu]   [⚙ Ẩn/Hiện cột]                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                                  │
│  ── CẤP 1: TỔNG QUAN KHAI THÁC (Dashboard tiles, FUNC-146) ──                                                   │
│ ┌──────────────────┬──────────────────┬──────────────────┬──────────────────┬──────────────────┐               │
│ │ Tổng chuyến      │ Đã cất cánh      │ Đang bay         │ Đã hạ cánh       │ Bất thường       │               │
│ │       45         │      18          │      14          │      13          │ ⚠ 5             │               │
│ │ (in scope ca)    │ (OUT)            │ (OFF→IN)         │ (IN)             │ Divert / Delay   │               │
│ └──────────────────┴──────────────────┴──────────────────┴──────────────────┴──────────────────┘               │
│ ┌──────────────────┬──────────────────┬──────────────────┬──────────────────┬──────────────────┐               │
│ │ OTP On-time      │ OSP On-schedule  │ Cảnh báo đang    │ Khách nối chuyến │ Tổ bay đổi       │               │
│ │ 89% (40/45)      │ 85% (38/45)      │ raise: 9         │ rủi ro lỡ nối: 3 │ trong ca: 2      │               │
│ └──────────────────┴──────────────────┴──────────────────┴──────────────────┴──────────────────┘               │
│                                                                                                                  │
│  ── CẤP 2: DANH SÁCH CHUYẾN — TRẠNG THÁI KHAI THÁC (FUNC-144, FUNC-146) ──                                      │
│ ┌────┬────────┬─────┬─────┬───────┬───────┬───────┬───────┬───────┬─────────┬───────┬──────┬──────┬─────────┐  │
│ │ #  │ FLT NO │ DEP │ ARR │ STD   │ ETD   │ ATD   │ STA   │ ETA   │ LEG     │ AC    │ Delay│Delay │ Cảnh   │  │
│ │    │        │     │     │       │       │       │       │       │ STATE   │ TYPE  │ Code │ phút │ báo    │  │
│ ├────┼────────┼─────┼─────┼───────┼───────┼───────┼───────┼───────┼─────────┼───────┼──────┼──────┼─────────┤  │
│ │ 1  │ VN162  │ HAN │ SGN │ 06:00 │ 06:00 │ 06:08 │ 08:10 │ 08:14 │ airborne│A321   │  ─   │  ─   │ ─       │  │
│ │ 2  │ VN204  │ HAN │ SGN │ 07:00 │ 07:00 │  ─    │ 09:55 │  ─    │ on-gate │A359   │  ─   │  ─   │ ─       │  │
│ │ 3  │ VN217  │ HAN │ DAD │ 07:15 │ 07:30 │  ─    │ 08:35 │ 08:50 │ taxi-out│A321   │  41  │ +15  │⚠OSP+15' │  │
│ │ 4  │ VN1854 │ HAN │ VCS │ 08:00 │ 08:00 │  ─    │ 09:30 │  ─    │ on-gate │A320   │  ─   │  ─   │⚠RFFS    │  │
│ │ 5  │ VN1186 │ DAD │ HAN │ 06:30 │ 06:33 │ 06:42 │ 07:55 │ 08:02 │ airborne│A321   │  ─   │  +7  │⚠Divert? │  │
│ │ 6  │ 0V8202 │ HAN │ HPH │ 07:25 │ 07:25 │  ─    │ 08:15 │  ─    │ taxi-out│ATR72  │  ─   │  ─   │ ─       │  │
│ │ …  │        │     │     │       │       │       │       │       │         │       │      │      │         │  │
│ └────┴────────┴─────┴─────┴───────┴───────┴───────┴───────┴───────┴─────────┴───────┴──────┴──────┴─────────┘  │
│                                                                                                                  │
│  ── CẤP 2 (mở rộng): KHÁCH NỐI CHUYẾN (FUNC-147, BR-113) ──                                                     │
│ ┌────────┬─────┬─────┬───────────┬───────────┬───────────┬─────────────────────────────────────────────┐       │
│ │ FLT NO │ DEP │ ARR │Transfer-IN│Transfer-OUT│ Min Conn  │ Chuyến nối tiếp / Cảnh báo                  │       │
│ │        │     │     │ [cần XN]  │ [cần XN]  │ Time (MCT)│ [cần xác nhận nguồn]                        │       │
│ ├────────┼─────┼─────┼───────────┼───────────┼───────────┼─────────────────────────────────────────────┤       │
│ │ VN217  │ HAN │ DAD │    12     │     8     │ 45'       │ ⚠ Rủi ro lỡ nối VN322 DAD→HAN (8 PAX nối)  │       │
│ │ VN1186 │ DAD │ HAN │     6     │    18     │ 60'       │ ⚠ Rủi ro lỡ nối VN54 HAN→PAR (4 PAX nối)   │       │
│ │ VN162  │ HAN │ SGN │    25     │    14     │ 45'       │ ○ Trong thời gian nối                       │       │
│ └────────┴─────┴─────┴───────────┴───────────┴───────────┴─────────────────────────────────────────────┘       │
│                                                                                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ── CẤP 3: CHI TIẾT CHUYẾN (slide-out panel khi click FLT NO) ──                                                │
│                                                                                                                  │
│   VN217 · HAN → DAD · STD 07:15 · ETD 07:30 · LEG STATE: taxi-out · AC: VN-A689 (A321)                          │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────────┐            │
│  │ ▸ Khai thác         STD 07:15 | STA 08:35 | ETD 07:30 | ETA 08:50 | DELAY 41 (15')             │            │
│  │ ▸ Tàu bay           AC REG: VN-A689 | AC TYPE: A321 | Cấu hình C8/Y186                          │            │
│  │ ▸ Tổ bay (PIC)      Nguyễn Văn F (PIC), Trần Thị G (FO), Lê Thị H (PUR) ⚠ Đổi tổ trong ca      │            │
│  │ ▸ Tài liệu          OFP R2 ✓ Confirmed | LS ✓ | GD ✓ | PM ✓ | NOTOC ⚠ Pending                  │            │
│  │ ▸ Khách / Tải       LS ADULT 152 / CHILD 8 / INFANT 2 | LS TTL 162 | OFP PAX 165 | ZFW 56,800  │            │
│  │ ▸ Cảnh báo          ⚠ OSP +15' (BR-116) | ⚠ Lệch tải OFP↔LS (BR-120)                          │            │
│  │ ▸ Khách nối chuyến  Transfer-IN 12 [cần XN] | Transfer-OUT 8 [cần XN]                          │            │
│  │   - 8 PAX nối VN322 DAD→HAN STD 10:15, MCT 45' — rủi ro lỡ nối (BR-113 / FUNC-147)             │            │
│  └─────────────────────────────────────────────────────────────────────────────────────────────────┘            │
│                                                                                                                  │
│  ── CẤP 4: CHI TIẾT HÀNH KHÁCH (drilldown từ Transfer-IN/OUT) ──                                                │
│  ┌────┬─────────────┬─────┬──────────────┬──────────────┬───────────┬──────────────────────┐                   │
│  │ #  │ PAX Name    │ Seq │ Chuyến nối IN│ Chuyến nối OUT│ MCT thực  │ Cảnh báo             │                   │
│  ├────┼─────────────┼─────┼──────────────┼──────────────┼───────────┼──────────────────────┤                   │
│  │ 1  │ NGUYEN V P  │ 12A │ VN217        │ VN322        │ 30' (<45')│ ⚠ Lỡ nối              │                   │
│  │ 2  │ TRAN T Q    │ 14B │ VN217        │ VN322        │ 30'       │ ⚠ Lỡ nối              │                   │
│  │ …  │             │     │              │              │           │                      │                   │
│  └────┴─────────────┴─────┴──────────────┴──────────────┴───────────┴──────────────────────┘                   │
│  ⓘ Trường nguồn Transfer PAX [cần xác nhận — FOS sheet-09 không có cột trực tiếp]                              │
└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

## 4. Danh sách thành phần + trường dữ liệu

### 4.1 Header + Bộ lọc

| Thành phần | Trường / Thực thể |
|---|---|
| Trực ban trưởng, ca | `NGUOI_DUNG`, `CA_TRUC` (vai_tro = Trực ban trưởng) |
| Lọc Carrier | `CHUYEN_BAY.carrier` |
| Lọc căn cứ (DEP) / ARR | `CHUYEN_BAY.dep_iata`, `arr_iata` |
| Lọc trạng thái | `CHUYEN_BAY.leg_state` |
| Lọc loại cảnh báo | `CANH_BAO.loai` |

### 4.2 Cấp 1 — Dashboard tiles

| Tile | Trường tính toán |
|---|---|
| Tổng chuyến | count(`CHUYEN_BAY` in scope ca) |
| Đã cất cánh / Đang bay / Đã hạ cánh | count phân theo `MOC_KHAI_THAC.out/off/in` |
| Bất thường | count(`CHUYEN_BAY.irregular = true` OR `diverted = true`) |
| OTP / OSP | tính từ `CHUYEN_BAY.atd/ata` vs `std/sta` |
| Cảnh báo đang raise | count(`CANH_BAO` chưa `clear_time`) |
| Khách nối chuyến rủi ro lỡ nối | count `[cần xác nhận nguồn Transfer PAX]` |
| Tổ bay đổi trong ca | count(`PHAN_CONG_TO_BAY.doi_to = true`) |

### 4.3 Cấp 2 — Danh sách chuyến (FUNC-144, FUNC-146)

| Cột | Trường (entity map) |
|---|---|
| FLT NO, DEP, ARR | `CHUYEN_BAY.flight_no, dep_iata, arr_iata` |
| STD, STA, ETD, ETA, ATD | `CHUYEN_BAY.std, sta, etd, eta, atd` |
| LEG STATE | `CHUYEN_BAY.leg_state` `[cần xác nhận enum]` |
| AC TYPE | `TAU_BAY.ac_type` |
| Delay Code / phút | `CHUYEN_BAY.delay_code, delay_mins` |
| Cảnh báo | `CANH_BAO.loai, muc_do` |

### 4.4 Cấp 2 mở rộng — Khách nối chuyến (FUNC-147)

| Cột | Trường |
|---|---|
| Transfer-IN / Transfer-OUT | `TAI_TRONG.transfer_pax` `[cần xác nhận nguồn]` |
| Min Connection Time (MCT) | `SAN_BAY.minima` `[cần xác nhận lưu MCT]` |
| Chuyến nối tiếp / Cảnh báo | suy ra từ `CHUYEN_BAY` cùng PAX list `[cần xác nhận]` |

### 4.5 Cấp 3 — Panel chi tiết chuyến (slide-out)

| Nhóm | Trường |
|---|---|
| Khai thác | std, sta, etd, eta, delay_code, delay_mins |
| Tàu bay | ac_reg, ac_type, ac_subtype, config_cwy |
| Tổ bay | `PHAN_CONG_TO_BAY` → `TO_BAY` (PIC/FO/PUR), `doi_to` |
| Tài liệu | `TAI_LIEU_CHUYEN` (doc_type, trang_thai) — tham chiếu BR-112 |
| Khách / Tải | `TAI_TRONG`: booking, ls_pax_total, ofp_pax, payload, zfw |
| Cảnh báo | `CANH_BAO` lọc theo flight_no chưa clear |
| Khách nối chuyến | transfer_pax IN/OUT + danh sách chuyến nối `[cần xác nhận]` |

### 4.6 Cấp 4 — Chi tiết hành khách (drilldown)

| Cột | Trường |
|---|---|
| PAX Name, Seq | từ danh sách PAX `[cần xác nhận nguồn]` |
| Chuyến nối IN / OUT | flight_no nối |
| MCT thực | tính từ giờ thực tế chuyến IN → chuyến OUT |

## 5. Tương tác & trạng thái

| Tương tác | Mô tả |
|---|---|
| **Drilldown 4 cấp** (FUNC-146) | Cấp 1 (tile) → Cấp 2 (bảng chuyến) → Cấp 3 (panel chuyến) → Cấp 4 (danh sách PAX nối). Click vào tile lọc danh sách Cấp 2; click FLT NO mở Panel Cấp 3; click số Transfer-IN/OUT mở Cấp 4. |
| **Server-push** (BR-125 lan tỏa) | Tự cập nhật ô khi nhận ACARS OUT/OFF/ON/IN — không reload trang. |
| **Cảnh báo OSP +15'** (BR-116 / FUNC-163) | Highlight khi lệch ≥ 15 phút (sớm/trễ); badge "⚠ OSP +N'" trong cột cảnh báo. |
| **Cảnh báo Divert** (BR-117 / FUNC-172) | Nhóm cảnh báo riêng "⚠ Divert?" — không gộp chung với OSP. |
| **Cảnh báo Đổi tổ bay** (BR-123 / FUNC-199) | Badge "⚠ Đổi tổ" trong panel chi tiết tổ bay, kèm tên tổ bay mới. |
| **Cảnh báo Khách nối chuyến rủi ro lỡ nối** (BR-113 / FUNC-147) | Khi MCT thực < MCT chuẩn → highlight đỏ. Trường nguồn `[cần xác nhận]`. |
| **Đa Carrier** (BR-106 / FUNC-114) | Bộ lọc Carrier VN / 0V / BL — checkbox mặc định ✓ cả 3. |
| **Ẩn/Hiện cột** (BR-102) | Lưu theo phiên cá nhân trực ban trưởng. |

## 6. Ghi chú `[cần xác nhận]`

| # | Vấn đề | FUNC | Ảnh hưởng wireframe |
|---|---|---|---|
| 1 | Enum LEG STATE đầy đủ | FUNC-205 | Tạm dùng `on-gate / taxi-out / airborne / taxi-in / arrived` |
| 2 | Nguồn Transfer-IN / Transfer-OUT (FOS sheet-09 không có cột trực tiếp) | FUNC-144, FUNC-147 | Cột gắn cờ; Cấp 4 PAX list cũng gắn cờ |
| 3 | Trường lưu Min Connection Time (MCT) | FUNC-147 | Cột MCT gắn cờ; tạm dùng `SAN_BAY.minima` |
| 4 | Nguồn danh sách PAX để drilldown Cấp 4 | FUNC-147 | Cờ trên đầu bảng Cấp 4 |
| 5 | Tiêu chí "rủi ro lỡ nối" (lệch bao nhiêu phút so MCT?) | FUNC-147 | Highlight quy ước MCT thực < MCT chuẩn; tham số cụ thể chờ SME |
| 6 | Danh mục Delay Code chuẩn (IATA Delay Codes?) | FUNC-144 | Cột Delay Code hiển thị mã thô, chờ SME đối chiếu IATA Delay Codes |
