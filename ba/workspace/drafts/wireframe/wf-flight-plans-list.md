---
project: "TOSS"
author: "sonpx@viettel.com.vn"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Wireframe — Low Fidelity"
screen_id: "WF-FP-001"
related_br: "BR-TOSS-001, BR-TOSS-003, BR-TOSS-006, BR-TOSS-014, BR-TOSS-017, BR-TOSS-026, BR-TOSS-027"
related_mm: "MM561, MM562, MM563, MM566, MM571, MM574, MM577, MM579, MM726"
---

# WF-FP-001 — Màn hình Danh sách Flight Plans (bảng chuyến bay + OFP viewer)

## 1. Mô tả màn hình

- **Mục đích:** cung cấp **bức tranh tổng quan** các chuyến bay đang/sắp khai thác (theo ngày/khoảng thời gian), cho phép Điều phái viên (Dispatcher) xem nhanh OFP, Flight Release, thông tin chi phí và lịch sử đồng bộ.
- **Người dùng chính:** SH-01 (Operations Controller / Dispatcher), SH-06 (Lãnh đạo — xem trực quan).
- **Navigation context:** Trang chủ → **Flight Plans** (menu chính). Là cửa ngõ để mở chi tiết chuyến bay (Tab Thông tin chung / Airport / Flight Docs / Weight & Fuel — các wireframe WF-FP-002…005).

---

## 2. Wireframe ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────┐
│ [LOGO VNA · TOSS]  Thông tin điều hành chuyến bay      [user ▼] [notif 3] [VI▼] │
├────────────────┬─────────────────────────────────────────────────────────────────┤
│ SIDEBAR        │ Trang chủ > Flight Plans                                        │
│                │                                                                  │
│ ▸ Trang chủ    │ ┌─ Bộ lọc ──────────────────────────────────────────────────┐  │
│ ▾ Flight Plans │ │ Từ ngày [2026-06-04▾]  Đến ngày [2026-06-05▾]            │  │
│   • Danh sách  │ │ Carrier [VN ▾]  Trạng thái [Tất cả ▾]  Số hiệu [______]  │  │
│   • Dashboard  │ │ Sân bay đi [___▾]  Sân bay đến [___▾]   [Tìm kiếm] [↻]   │  │
│ ▸ Crew         │ └────────────────────────────────────────────────────────────┘  │
│ ▸ Aircraft     │                                                                  │
│ ▸ Reports      │ ┌─ Hành động đồng bộ ──────────────────────────────────────┐   │
│ ▸ Settings     │ │ [↻ Sync data] (MM571)   [⟳ Lịch sử sync] (MM579)         │   │
│                │ └───────────────────────────────────────────────────────────┘   │
│                │                                                                  │
│                │ ┌─ Danh sách chuyến bay ───────────────────────────────────┐   │
│                │ │ ☐ │ F.No │ Route │ STD/ATD │ A/C │ T.Trạng │ OFP │ Chi phí │ │
│                │ ├───┼──────┼───────┼─────────┼─────┼─────────┼─────┼─────────┤ │
│                │ │ ☐ │VN101 │HAN-SGN│08:00/-- │A321 │ Schd    │[👁] │ [$]     │ │
│                │ │ ☐ │VN123 │HAN-DAD│09:30/9:35│A350│ Boarded │[👁] │ [$]    │ │
│                │ │ ☐ │VN204 │SGN-HAN│10:15/-- │A321 │ Delay   │[👁] │ [$]     │ │
│                │ │ ☐ │VN550 │HAN-NRT│11:45/-- │B787 │ Schd    │[👁] │ [$]    │ │
│                │ │ ... (phân trang)                                            │ │
│                │ │ [‹ 1 2 3 ... ›]                  Hiển thị 20 ▾ / 320 chuyến│ │
│                │ └────────────────────────────────────────────────────────────┘ │
│                │                                                                  │
│                │ ┌─ Khu vực preview (mở khi click 1 dòng) ─────────────────────┐│
│                │ │ Tab: [OFP] [Flight Release] [Chi phí & Lợi nhuận] [History] ││
│                │ │ ┌────────────────────────────────────────────────────────┐  ││
│                │ │ │ === OFP Viewer (MM561) ===                              │ ││
│                │ │ │ Chuyến: VN123 · 2026-06-04 · A350 VN-A892               │ ││
│                │ │ │ [PDF preview / nội dung OFP]                            │ ││
│                │ │ │                                                          │ ││
│                │ │ │                                                          │ ││
│                │ │ │ [⬇ Tải về] [⤢ Mở toàn màn hình]      Phiên bản v3 ▾    │ ││
│                │ │ └────────────────────────────────────────────────────────┘ ││
│                │ └──────────────────────────────────────────────────────────────┘│
│                │                                                                  │
│                │ [Mở chi tiết chuyến bay →]   (sang WF-FP-002 Tab Thông tin chung)│
└────────────────┴──────────────────────────────────────────────────────────────────┘
```

### 2.1 Khu vực preview — Tab "Flight Release" (MM574, MM726)

```
┌─ Flight Release ─────────────────────────────────────────┐
│ VN123 · 2026-06-04                                        │
│ ┌──────────────────────────────────────────────────────┐ │
│ │ [PDF preview Flight Release file]                     │ │
│ │ (MM726 — xem chi tiết file flight release)            │ │
│ └──────────────────────────────────────────────────────┘ │
│ [⬇ Tải về]  [In]                                          │
└──────────────────────────────────────────────────────────┘
```

### 2.2 Khu vực preview — Tab "Chi phí & Lợi nhuận" (MM563, MM566)

```
┌─ Chi phí & Lợi nhuận ────────────────────────────────────┐
│ Doanh thu dự kiến :   125,400 USD                         │
│ Chi phí nhiên liệu:    38,200 USD                         │
│ Chi phí sân bay   :    12,500 USD                         │
│ Chi phí khác      :     6,800 USD                         │
│ ─────────────────────────────────                         │
│ Lợi nhuận ước tính:    67,900 USD                         │
│                                                            │
│ [Xem chi tiết theo khoản mục ▾]                           │
└──────────────────────────────────────────────────────────┘
```

### 2.3 Khu vực preview — Tab "Flight History" (MM577) & "Sync History" (MM579)

```
┌─ Flight History — VN123 ─────────────────────────────────┐
│ Thời gian            │ Sự kiện                            │
│ 2026-06-04 07:15:32  │ Cập nhật STD: 08:00 → 08:15       │
│ 2026-06-04 07:42:18  │ Đổi tàu: VN-A871 → VN-A892        │
│ 2026-06-04 08:10:44  │ Phát hành OFP v3                   │
│ 2026-06-04 08:55:00  │ ATD ghi nhận: 09:35               │
└──────────────────────────────────────────────────────────┘

┌─ Sync History (MM579) ───────────────────────────────────┐
│ Nguồn  │ Loại DL  │ Thời gian sync     │ Trạng thái      │
│ Lido   │ OFP      │ 2026-06-04 07:00   │ ✓ Thành công    │
│ AMOS   │ MEL/CDL  │ 2026-06-04 07:05   │ ✓ Thành công    │
│ MO Plus│ Confirm  │ 2026-06-04 07:10   │ ✗ Lỗi 504       │
│ PSS    │ LS/PM    │ 2026-06-04 07:15   │ ✓ Thành công    │
└──────────────────────────────────────────────────────────┘
```

---

## 3. Chú thích thành phần

| # | Element | MM code | BR code | Hành vi |
|---|---|---|---|---|
| 1 | Bảng danh sách chuyến bay (cột F.No, Route, STD/ATD, A/C, T.Trạng) | — (cấu trúc tổng) | BR-TOSS-001 | Hiển thị dữ liệu hợp nhất từ Lido + PSS + thực tế |
| 2 | Nút [👁] cột OFP → mở OFP Viewer | MM561 (UI), MM562 (API) | BR-TOSS-001, BR-TOSS-006 | Click mở khu vực preview tab OFP |
| 3 | Tab "Flight Release" trong preview | MM574, MM726 | BR-TOSS-006 | Xem file Flight Release đã phát hành |
| 4 | Tab "Chi phí & Lợi nhuận" | MM563 (UI), MM566 (API) | BR-TOSS-001, BR-TOSS-017 | Hiển thị doanh thu/chi phí/lợi nhuận ước tính |
| 5 | Nút [↻ Sync data] | MM571 | BR-TOSS-026, BR-TOSS-027 | Đồng bộ dữ liệu chuyến bay từ các hệ thống vệ tinh |
| 6 | Tab "Flight History" | MM577 | BR-TOSS-003 | Lịch sử thay đổi trạng thái/STD/tàu bay |
| 7 | Tab "Sync History" / nút [⟳] | MM579 | BR-TOSS-003, BR-TOSS-026 | Lịch sử các lần đồng bộ với hệ thống ngoài |
| 8 | Nút "Mở chi tiết chuyến bay" | — | BR-TOSS-001 | Điều hướng sang WF-FP-002 |

---

## 4. Luồng điều hướng

```
[Trang chủ]
    │
    ▼
[WF-FP-001 Danh sách Flight Plans] ──► click 1 dòng ──► [Preview pane (OFP/Release/Cost/History)]
    │
    │ click "Mở chi tiết chuyến bay"
    ▼
[WF-FP-002 Tab Thông tin chung]  ↔  [WF-FP-003 Tab Airport]  ↔  [WF-FP-004 Tab Flight Docs]  ↔  [WF-FP-005 Tab Weight & Fuel]
```

---

## 5. Câu hỏi cần làm rõ (UX)

- **Q-UX-001:** Cách hiển thị mặc định — dạng bảng (table) hay dạng timeline/Gantt (theo giờ trong ngày)?
- **Q-UX-002:** Mức làm tươi bảng — auto-refresh mỗi N giây hay manual?
- **Q-UX-003:** OFP Viewer — render PDF inline hay tải file? Nếu OFP có nhiều phiên bản, dropdown chọn phiên bản đặt ở đâu?
- **Q-UX-004:** Preview pane mở dưới bảng (split horizontal) hay bên phải (split vertical)? Chiều cao mặc định?
- **Q-UX-005:** Cảnh báo bất thường (BR-TOSS-002) hiển thị inline trong dòng (icon ⚠) hay panel riêng bên cạnh?
- **Q-UX-006:** Có hỗ trợ multi-select để batch action (vd. sync nhiều chuyến cùng lúc) không?

---

*Wireframe v0.1 — biên soạn theo MM codes nhóm 1, đối chiếu BRD-TOSS-001. Cập nhật khi UX guidelines của VNA được xác nhận.*
