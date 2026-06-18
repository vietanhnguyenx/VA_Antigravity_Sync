---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
status: "Draft"
document_type: "Wireframe (low-fidelity)"
document_id: "WF-PH1-START-OF-SHIFT"
---

# Wireframe — Màn hình tập trung kiểm tra đầu ca (Start-of-Shift Check)

## 1. Mục tiêu màn

Một màn hình tập trung cho điều phái viên (Dispatcher) khi vào ca, gom **9 nhóm kiểm tra** đầu ca vào cùng một giao diện (thay vì mở nhiều hệ thống nguồn rời rạc). Hệ thống **tự đối chiếu chéo** giữa các nguồn và sinh cảnh báo khi phát hiện lệch / bất thường. Vai trò của TOSS chỉ là **"view + cảnh báo"** (BR-115) — khi cần xử lý, deep-link sang hệ thống chuyên dụng (Lido / MO Plus / AMOS …) rồi tự đồng bộ ngược về.

## 2. BR / FUNC liên quan

| BR | FUNC | Vai trò |
|---|---|---|
| BR-114 | FUNC-148 | Màn hình tập trung gom 9 nhóm kiểm tra |
| BR-114 | FUNC-149 | Nhóm 1 — Lịch bay |
| BR-114 | FUNC-150 | Nhóm 2 — Loại tàu bay |
| BR-114 | FUNC-151 | Nhóm 3 — Tàu quay (Rotation) |
| BR-114 | FUNC-152 | Nhóm 4 — RFFS (cứu hỏa sân bay) |
| BR-114 | FUNC-153 | Nhóm 5 — Thời tiết |
| BR-114 | FUNC-154 | Nhóm 6 — Tải |
| BR-114 | FUNC-155 | Nhóm 7 — MEL/CDL |
| BR-114 | FUNC-156 | Nhóm 8 — Hạn chế (Restrictions: Slot, curfew…) |
| BR-114 | FUNC-157 | Nhóm 9 — Chứng chỉ tổ bay theo sân bay |
| BR-114 | FUNC-158 | Tự đối chiếu chéo giữa nguồn → sinh cảnh báo |
| BR-114 | FUNC-159 | Phân loại cảnh báo: bắt buộc xử lý / ghi nhận `[cần xác nhận tiêu chí]` |
| BR-115 | FUNC-160, 161, 162 | "View + cảnh báo", deep-link sang hệ thống chuyên dụng `[cần xác nhận danh sách]` |

## 3. Bố cục ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  TOSS — KIỂM TRA ĐẦU CA (Start-of-Shift Check)            Dispatcher: NGUYỄN VĂN A   Ca: 06:00 - 18:00          │
│  Phạm vi: 20 chuyến trong ca   |   ⚠ Bắt buộc xử lý: 3   |   ⓘ Ghi nhận: 7                                      │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ ┌──── Tổng quan ─────────────────────────────────────────────────────────────────────────────────────────┐      │
│ │  [1] Lịch bay         ● 2 cảnh báo  [▶ Mở]                [6] Tải                ● 1 cảnh báo  [▶ Mở] │      │
│ │  [2] Loại tàu bay     ○ OK          [▶ Mở]                [7] MEL/CDL            ● 3 cảnh báo  [▶ Mở] │      │
│ │  [3] Tàu quay         ● 1 cảnh báo  [▶ Mở]                [8] Hạn chế (Slot…)    ○ OK          [▶ Mở] │      │
│ │  [4] RFFS sân bay     ● 1 cảnh báo  [▶ Mở]                [9] Chứng chỉ tổ bay   ● 2 cảnh báo  [▶ Mở] │      │
│ │  [5] Thời tiết        ● 2 cảnh báo  [▶ Mở]                                                            │      │
│ └─────────────────────────────────────────────────────────────────────────────────────────────────────────┘      │
│                                                                                                                  │
│ ── [1] LỊCH BAY (FUNC-149) ──────────────────────────────────────────────────────────────────────────── ▼ ──── │
│ ┌────────┬─────┬─────┬───────┬───────┬─────────┬──────────┬──────────┬─────────────────────────────────┐       │
│ │ FLT NO │ DEP │ ARR │ STD   │ STA   │ LEG TYPE│IRREGULAR │ DIVERTED │ Cảnh báo (kèm mức)              │       │
│ ├────────┼─────┼─────┼───────┼───────┼─────────┼──────────┼──────────┼─────────────────────────────────┤       │
│ │ VN204  │ HAN │ SGN │ 07:00 │ 09:55 │ thường  │   ─      │   ─      │ ─                               │       │
│ │ VN217  │ HAN │ DAD │ 07:15 │ 08:35 │ thường  │   ✓      │   ─      │ ⚠ Lịch bay bất thường (BR-130) │       │
│ │ …      │     │     │       │       │         │          │          │                                 │       │
│ └────────┴─────┴─────┴───────┴───────┴─────────┴──────────┴──────────┴─────────────────────────────────┘       │
│                                                                                                                  │
│ ── [3] TÀU QUAY / ROTATION (FUNC-151) ─────────────────────────────────────────────────────────────── ▼ ─────── │
│ ┌─────────┬───────────────────────────────────────────────────────────┬─────────┬──────────┐                   │
│ │ AC REG  │ Chuỗi chặng (leg_no → leg_no+1 …)                         │ TAT     │ Cảnh báo │                   │
│ ├─────────┼───────────────────────────────────────────────────────────┼─────────┼──────────┤                   │
│ │VN-A395  │ VN161 SGN→HAN 05:30/07:00 → VN204 HAN→SGN 07:00/09:55 →… │ 25'     │ ─        │                   │
│ │VN-A689  │ VN1183 HAN→DAD 06:00/07:20 → VN217 HAN→DAD 07:15/08:35 …│ 15'⚠   │⚠ TAT<min │                   │
│ └─────────┴───────────────────────────────────────────────────────────┴─────────┴──────────┘                   │
│                                                                                                                  │
│ ── [4] RFFS SÂN BAY (FUNC-152) ───────────────────────────────────────────────────────────────────── ▼ ─────── │
│ ┌─────┬──────────────────────────┬──────────────┬──────────────────────────────────────────────┐               │
│ │ IATA│ RFFS Cat [cần xác nhận]  │ NOTAM cứu hỏa│ Chuyến bị ảnh hưởng                          │               │
│ ├─────┼──────────────────────────┼──────────────┼──────────────────────────────────────────────┤               │
│ │ VCS │ Cat 7                    │ ⚠ Có        │ VN1854, VN1856                               │               │
│ │ HAN │ Cat 9                    │  ─           │ ─                                            │               │
│ └─────┴──────────────────────────┴──────────────┴──────────────────────────────────────────────┘               │
│                                                                                                                  │
│ ── [5] THỜI TIẾT (FUNC-153) ──────────────────────────────────────────────────────────────────────── ▼ ─────── │
│ ┌─────┬───────────────────┬──────────┬──────────┬───────────────┬──────────────────────────────────┐           │
│ │ IATA│ METAR/SPECI giờ   │ Tầm nhìn │ Trần mây │ Hiện tượng    │ Đối chiếu VMA + margin           │           │
│ │     │ quan trắc         │ (m)      │ (ft)     │ (TSRA…)       │ [cần xác nhận VMA]               │           │
│ ├─────┼───────────────────┼──────────┼──────────┼───────────────┼──────────────────────────────────┤           │
│ │ DAD │ 06:30 METAR       │ 4000     │ 1500     │ TSRA          │ ⚠ Dưới VMA + margin              │           │
│ │ HAN │ 06:30 METAR       │ 8000     │ 3000     │ ─             │ ○ OK                              │           │
│ └─────┴───────────────────┴──────────┴──────────┴───────────────┴──────────────────────────────────┘           │
│                                                                                                                  │
│ ── [6] TẢI (FUNC-154) ────────────────────────────────────────────────────────────────────────────── ▼ ─────── │
│ ┌────────┬──────────┬──────────┬──────────┬──────────┬──────────────────────────────────┐                     │
│ │ FLT NO │ OFP ZFW  │ LS ZFW   │ Δ ZFW    │ OFP TOW  │ Đối chiếu OFP ↔ LS (BR-120)      │                     │
│ ├────────┼──────────┼──────────┼──────────┼──────────┼──────────────────────────────────┤                     │
│ │ VN162  │ 58,200   │ 57,950   │ -250 kg  │ 71,400   │ ○ Trong ngưỡng                   │                     │
│ │ VN217  │ 56,800   │ 58,300   │ +1,500   │ 70,000   │ ⚠ Vượt ngưỡng [cần SME ngưỡng]  │                     │
│ └────────┴──────────┴──────────┴──────────┴──────────┴──────────────────────────────────┘                     │
│                                                                                                                  │
│ ── [7] MEL/CDL (FUNC-155) ────────────────────────────────────────────────────────────────────────── ▼ ─────── │
│ ┌─────────┬──────────┬──────────┬────────────────┬─────────────────────────────┐                              │
│ │ AC REG  │ Mã lỗi   │ Loại     │ Khoảng hiệu lực│ Ảnh hưởng khai thác         │                              │
│ ├─────────┼──────────┼──────────┼────────────────┼─────────────────────────────┤                              │
│ │VN-A861  │ 21-50-01 │ MEL      │ 11/06 → 18/06  │ ⚠ Hạn chế độ cao            │                              │
│ │VN-A689  │ APU INOP │ MEL      │ 10/06 → 25/06  │ ⚠ Đến VCS không có GPU/ASU  │                              │
│ │         │          │          │                │   (BR-131 / FUNC-230)       │                              │
│ └─────────┴──────────┴──────────┴────────────────┴─────────────────────────────┘                              │
│                                                                                                                  │
│ ── [8] HẠN CHẾ — Slot, Curfew, khác [cần xác nhận đầy đủ] (FUNC-156, BR-129) ──────────────────── ▼ ─────── │
│ ┌────────┬─────┬───────────┬───────────────┬───────────────────────────┐                                       │
│ │ FLT NO │ ARR │ Curfew    │ Slot           │ Hạn chế khác              │                                       │
│ ├────────┼─────┼───────────┼───────────────┼───────────────────────────┤                                       │
│ │ VN1186 │ HAN │ 23:30–05:30│ 09:25 (assigned)│ ─                        │                                       │
│ │ VN217  │ DAD │ ─         │ 08:35 (assigned)│ OFP REMARKS: …            │                                       │
│ └────────┴─────┴───────────┴───────────────┴───────────────────────────┘                                       │
│                                                                                                                  │
│ ── [9] CHỨNG CHỈ TỔ BAY (FUNC-157) ───────────────────────────────────────────────────────────────── ▼ ────── │
│ ┌────────┬──────────────┬─────────────────────┬──────────────────────────────────────────┐                    │
│ │ FLT NO │ ARR đặc biệt │ Tổ bay (PIC + FO)    │ Đối chiếu chứng chỉ [cần xác nhận trường]│                    │
│ ├────────┼──────────────┼─────────────────────┼──────────────────────────────────────────┤                    │
│ │ VN1854 │ VCS (Côn Đảo)│ PIC: NGUYỄN VĂN B    │ ⚠ Thiếu chứng chỉ VCS — đổi tổ?         │                    │
│ │ VN1854 │              │ FO:  TRẦN THỊ C      │                                          │                    │
│ │ VN422  │ DIN (Điện Biên)│ PIC: LÊ VĂN D       │ ○ Đủ chứng chỉ DIN                      │                    │
│ └────────┴──────────────┴─────────────────────┴──────────────────────────────────────────┘                    │
│                                                                                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ── BẢNG CẢNH BÁO TỔNG HỢP (FUNC-158, FUNC-159) ──                                                              │
│ ┌─────────────┬──────────┬───────────────────────────────┬────────────────┬─────────────────────────────┐       │
│ │ Loại cảnh   │ Mức      │ Mô tả                          │ Chuyến / Tàu   │ Hành động                  │       │
│ │ báo         │          │                                │                │                            │       │
│ ├─────────────┼──────────┼───────────────────────────────┼────────────────┼─────────────────────────────┤       │
│ │ RFFS        │ ⚠ BẮT    │ NOTAM cứu hỏa VCS              │ VN1854, VN1856 │[Mở NOTAM] [Sang Lido →]    │       │
│ │             │  BUỘC    │                                │                │                            │       │
│ │ WX-VMA      │ ⚠ BẮT    │ DAD dưới VMA+margin            │ VN217          │[Xem METAR] [Sang Lido →]   │       │
│ │             │  BUỘC    │                                │                │                            │       │
│ │ Tải OFP↔LS  │ ⚠ BẮT    │ Vượt ngưỡng (Δ ZFW +1500kg)   │ VN217          │[Mở chi tiết] [Sang CLC →]  │       │
│ │             │  BUỘC    │                                │                │                            │       │
│ │ TAT < min   │ ⓘ Ghi   │ Quay đầu VN-A689 chỉ 15'      │ VN-A689        │[Mở rotation]               │       │
│ │             │  nhận    │                                │                │                            │       │
│ │ Chứng chỉ   │ ⓘ Ghi   │ PIC thiếu chứng chỉ VCS        │ VN1854         │[Sang MO Plus →]            │       │
│ │             │  nhận    │                                │                │                            │       │
│ │ Lịch bay    │ ⓘ Ghi   │ Bất thường (BR-130)            │ VN217          │[Xem chi tiết]              │       │
│ │ bất thường  │  nhận    │                                │                │                            │       │
│ │ MEL ảnh     │ ⓘ Ghi   │ Hạn chế độ cao                 │ VN-A861        │[Sang AMOS →]               │       │
│ │ hưởng       │  nhận    │                                │                │                            │       │
│ └─────────────┴──────────┴───────────────────────────────┴────────────────┴─────────────────────────────┘       │
│                                                                                                                  │
│  ⓘ Sau khi xử lý xong ở hệ thống chuyên dụng (Lido / MO Plus / AMOS / CLC), dữ liệu đồng bộ ngược về TOSS       │
│     và cảnh báo tự tắt (FUNC-161). Danh sách deep-link [cần xác nhận FUNC-162].                                │
└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

## 4. Danh sách thành phần + trường dữ liệu

### 4.1 Header & Tổng quan 9 nhóm

| Thành phần | Trường / Thực thể |
|---|---|
| Dispatcher, ca trực, phạm vi | `NGUOI_DUNG`, `CA_TRUC` |
| 9 thẻ tổng quan (mỗi nhóm hiển thị số lượng cảnh báo) | Đếm từ `CANH_BAO` theo `loai` (lịch bay / loại tàu / rotation / RFFS / WX / tải / MEL/CDL / hạn chế / chứng chỉ) |

### 4.2 Khối từng nhóm kiểm tra (1–9)

| Nhóm | Trường dữ liệu (bám entity map) |
|---|---|
| [1] Lịch bay (FUNC-149) | `CHUYEN_BAY`: flight_no, dep_iata, arr_iata, std, sta, leg_type, irregular, diverted, etd, eta |
| [2] Loại tàu bay (FUNC-150) | `TAU_BAY`: ac_type, ac_subtype, ac_reg, config_cwy; cross-check vs lịch phân |
| [3] Tàu quay / Rotation (FUNC-151) | `TAU_BAY.ac_reg` + chuỗi `CHUYEN_BAY` theo `leg_no`; TAT SCHED vs TAT ACTUAL |
| [4] RFFS (FUNC-152) | `SAN_BAY.iata`, `rffs_cat [cần xác nhận trường lưu]`; `NOTAM.rffs = true` |
| [5] Thời tiết (FUNC-153) | `THOI_TIET`: iata, loai (METAR/SPECI), tam_nhin, tran_may, hien_tuong, gio_quan_trac; ngưỡng VMA `[cần xác nhận]` |
| [6] Tải (FUNC-154) | `TAI_TRONG`: ofp ZFW/Payload/TOW vs ls ZFW/Payload/TOW; ngưỡng lệch (BR-120) |
| [7] MEL/CDL (FUNC-155) | `MEL_CDL`: ac_reg, ma_loi, loai (MEL/CDL), anh_huong_khai_thac |
| [8] Hạn chế (FUNC-156) | `SAN_BAY`: curfew, slot; `CHUYEN_BAY.std/sta` đối chiếu; danh mục hạn chế khác `[cần xác nhận]` |
| [9] Chứng chỉ tổ bay (FUNC-157) | `PHAN_CONG_TO_BAY` → `TO_BAY`; `CHUNG_CHI_SAN_BAY.dieu_kien` `[cần xác nhận trường]`; sân bay đặc biệt (VCS, DIN, …) |

### 4.3 Bảng cảnh báo tổng hợp (FUNC-158, FUNC-159)

| Cột | Trường |
|---|---|
| Loại cảnh báo | `CANH_BAO.loai` |
| Mức | `CANH_BAO.muc_do` (Bắt buộc xử lý / Ghi nhận `[cần xác nhận tiêu chí]`) |
| Mô tả | sinh từ rule đối chiếu |
| Chuyến / Tàu | `flight_no` / `ac_reg` |
| Hành động | nút deep-link sang hệ thống chuyên dụng (FUNC-161) `[cần xác nhận FUNC-162]` |

## 5. Tương tác & trạng thái

| Tương tác | Mô tả |
|---|---|
| **Mở nhóm** | Click [▶ Mở] trên thẻ tổng quan → cuộn đến block tương ứng; click lại để gập (`▶` / `▼`). |
| **Tự đối chiếu chéo** (FUNC-158) | Khi load màn, chạy rule đối chiếu các cặp: Lịch bay ↔ Loại tàu; Kế hoạch ca trước ↔ Tình trạng tàu hiện tại; OFP ↔ LS; NAIL/CDL ↔ Lịch khai thác. Chạy lại khi dữ liệu nguồn cập nhật (server-push). |
| **Cảnh báo phân 2 mức** (FUNC-159) | Đỏ + nhãn "⚠ BẮT BUỘC" và Vàng + nhãn "ⓘ Ghi nhận". Tiêu chí phân loại từng nhóm cụ thể `[cần xác nhận]`. |
| **Deep-link "Sang Lido / MO Plus / AMOS / CLC →"** (FUNC-161) | Mở tab mới đến hệ thống chuyên dụng. Sau khi user xử lý xong, hệ thống nguồn đẩy ngược dữ liệu về TOSS → cảnh báo tự tắt (raise → clear). |
| **TOSS chỉ view + cảnh báo** (FUNC-160) | Không cung cấp thao tác lập kế hoạch bay / xác nhận tài liệu phi công / bảo dưỡng — đó là chức năng của hệ thống chuyên dụng. |
| **Refresh khi load** | Mỗi lần dispatcher mở màn này (đầu ca, sau giải lao), tự rerun rule đối chiếu để hiển thị cảnh báo cập nhật. |

## 6. Ghi chú `[cần xác nhận]`

| # | Vấn đề | FUNC | Ảnh hưởng wireframe |
|---|---|---|---|
| 1 | Trường lưu cấp RFFS sân bay | FUNC-152 | Hiển thị "RFFS Cat" có cờ; tạm dùng giá trị "Cat 7"/"Cat 9" minh họa |
| 2 | Viết tắt VMA | FUNC-153 | Để label "VMA + margin `[cần xác nhận]`" trong cột đối chiếu thời tiết |
| 3 | Trường lưu chứng chỉ tổ bay theo sân bay | FUNC-157 | Cột "Đối chiếu chứng chỉ" gắn cờ, hiển thị badge `⚠ Thiếu` / `○ Đủ` |
| 4 | Danh mục loại hạn chế đầy đủ (ngoài Slot, curfew) | FUNC-156, BR-129 | Cột "Hạn chế khác" để trống/`[cần xác nhận]` |
| 5 | Tiêu chí phân loại cảnh báo "Bắt buộc xử lý" vs "Ghi nhận" | FUNC-159 | Mức cảnh báo trong bảng minh họa kèm cờ — chờ SME chốt |
| 6 | Danh sách hệ thống cho deep-link + cơ chế đồng bộ ngược | FUNC-162 | Các nút "Sang Lido / MO Plus / AMOS / CLC" minh họa — chờ SME chốt danh sách + timing/payload |
| 7 | Danh mục sân bay đặc biệt (ngoài VCS, DIN, Điện Biên, Đồng Hới) | FUNC-198 | Cột "ARR đặc biệt" lọc dựa danh mục `[cần xác nhận]` |
| 8 | Ngưỡng lệch tải cụ thể (ma trận loại tàu × giờ bay × trên/dưới) | FUNC-190 | Cột "Đối chiếu OFP ↔ LS" gắn cờ ngưỡng `[cần SME ngưỡng]` |
