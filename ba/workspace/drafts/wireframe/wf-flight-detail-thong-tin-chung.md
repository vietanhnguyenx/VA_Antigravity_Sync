---
project: "TOSS"
author: "sonpx@viettel.com.vn"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Wireframe — Low Fidelity"
screen_id: "WF-FP-002"
related_br: "BR-TOSS-001, BR-TOSS-002, BR-TOSS-005, BR-TOSS-028"
related_mm: "MM598, MM599, MM600, MM601, MM602, MM603, MM606, MM607, MM608, MM609, MM614, MM615, MM616, MM617, MM620, MM621, MM622, MM623"
---

# WF-FP-002 — Xem chi tiết chuyến bay · Tab "Thông tin chung"

## 1. Mô tả màn hình

- **Mục đích:** hiển thị **bức tranh tổng quan của một chuyến bay đơn lẻ**, gồm 3 khối: (a) Thông tin chuyến bay, (b) Thông tin tàu bay (kèm MEL/CDL, lịch bảo dưỡng AOG, lịch khai thác), (c) Thông tin tổ bay (kèm hành trình, Flight Time, Duty Time).
- **Người dùng chính:** SH-01 (Dispatcher), SH-02 (Crew Scheduling), SH-05 (Maintenance Planner).
- **Navigation context:** điều hướng từ WF-FP-001 → mở chi tiết. Đây là tab MẶC ĐỊNH khi vào màn chi tiết.

---

## 2. Wireframe ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────┐
│ [LOGO] TOSS                                       [user ▼] [notif] [VI▼]         │
├────────────────┬─────────────────────────────────────────────────────────────────┤
│ SIDEBAR        │ Trang chủ > Flight Plans > VN123 (HAN-DAD · 2026-06-04)        │
│                │                                                                  │
│ ▾ Flight Plans │ ╔══════════════════════════════════════════════════════════════╗│
│   • Danh sách  │ ║ VN123  HAN ► DAD  · STD 09:30 · A350 VN-A892  · 🟢 Boarded   ║│
│                │ ╚══════════════════════════════════════════════════════════════╝│
│                │                                                                  │
│                │ ┌─[ Thông tin chung ]─[ Airport ]─[ Flight Docs ]─[ W&F ]─┐    │
│                │ │ ▼ active tab                                              │    │
│                │ └───────────────────────────────────────────────────────────┘    │
│                │                                                                  │
│                │ ╔═ Khối A · Thông tin chuyến bay (MM598/599) ═════════════════╗ │
│                │ ║ Số hiệu       : VN123          Loại chuyến: Khách           ║ │
│                │ ║ Carrier       : VN             Cấu hình   : C28/Y277        ║ │
│                │ ║ Sân bay đi    : HAN (Nội Bài)  STD: 09:30  ETD: 09:30      ║ │
│                │ ║ Sân bay đến   : DAD (Đà Nẵng)  STA: 11:00  ETA: 11:05      ║ │
│                │ ║ Đường bay     : HAN-VVNB-DAD                                ║ │
│                │ ║ Trạng thái    : 🟢 Boarded                                  ║ │
│                │ ╚═════════════════════════════════════════════════════════════╝ │
│                │                                                                  │
│                │ ╔═ Khối B · Thông tin tàu bay ════════════════════════════════╗ │
│                │ ║ Reg/Loại: VN-A892 · A350-900     Cấu hình: C28/Y277         ║ │
│                │ ║ FH/FC tích lũy: 12,450 h / 4,820 FC      (MM600/601)        ║ │
│                │ ║                                                              ║ │
│                │ ║ ┌─ Lịch khai thác gần nhất / sắp tới (MM602/603) ─────────┐ ║ │
│                │ ║ │ Trước│VN104 HAN-SGN 2026-06-04 06:00 → 08:10           │ ║ │
│                │ ║ │ Sau  │VN125 DAD-HAN 2026-06-04 12:30 → 14:00           │ ║ │
│                │ ║ │ Sau  │VN550 HAN-NRT 2026-06-05 02:15 → ...             │ ║ │
│                │ ║ └────────────────────────────────────────────────────────┘ ║ │
│                │ ║                                                              ║ │
│                │ ║ ┌─ MEL/CDL & Defects hiện có (MM606/607) ──── [+ AMOS] ─┐ ║ │
│                │ ║ │ MEL-12-31-01  Brake temp sensor #2 INOP   Hết: 06-08 │ ║ │
│                │ ║ │ Defect DEF-553 Cabin light row 14L flickering         │ ║ │
│                │ ║ │ ⚠ Ảnh hưởng: giảm khả năng chở khách hạng C 2 ghế     │ ║ │
│                │ ║ └────────────────────────────────────────────────────────┘ ║ │
│                │ ║                                                              ║ │
│                │ ║ ┌─ Lịch bảo dưỡng / AOG (MM608/609) ────────────────────┐ ║ │
│                │ ║ │ A-Check    │ 2026-06-08 22:00 (HAN)  │ Đã lên kế hoạch│ ║ │
│                │ ║ │ AOG hiện tại: KHÔNG                                    │ ║ │
│                │ ║ └────────────────────────────────────────────────────────┘ ║ │
│                │ ╚═════════════════════════════════════════════════════════════╝ │
│                │                                                                  │
│                │ ╔═ Khối C · Thông tin tổ bay ═════════════════════════════════╗ │
│                │ ║ ┌─ Danh sách tổ bay (MM614/615) ───────────────────────┐ ║ │
│                │ ║ │ Vai trò│ Họ tên          │ Mã NV   │ Hạng/Năng định│ ║ │
│                │ ║ │ CMD    │ Nguyễn Văn A    │ VNP1234 │ A350 CAPT     │ ║ │
│                │ ║ │ F/O    │ Trần Thị B      │ VNP2345 │ A350 F/O      │ ║ │
│                │ ║ │ PURSER │ Lê Văn C        │ VNC3456 │ A350 SCC      │ ║ │
│                │ ║ │ FA × 6 │ [+ Xem tất cả]                              │ ║ │
│                │ ║ └────────────────────────────────────────────────────────┘ ║ │
│                │ ║                                                              ║ │
│                │ ║ ┌─ Hành trình tổ bay 7 ngày (MM616/617) ────────────────┐ ║ │
│                │ ║ │ NV: Nguyễn Văn A (CMD)                                 │ ║ │
│                │ ║ │ 06-02 VN104 HAN-SGN  06-03 OFF  06-04 VN123 HAN-DAD  │ ║ │
│                │ ║ │ 06-05 VN550 HAN-NRT  06-06 OFF  06-07 VN551 NRT-HAN  │ ║ │
│                │ ║ └────────────────────────────────────────────────────────┘ ║ │
│                │ ║                                                              ║ │
│                │ ║ ┌─ Flight Time / Duty Time — FTL (MM620-623) ──────────┐ ║ │
│                │ ║ │           │ Tháng này│ Ngưỡng│ Còn lại│ Trạng thái  │ ║ │
│                │ ║ │ Flight T. │  68h     │ 100h  │ 32h    │ 🟢 OK       │ ║ │
│                │ ║ │ Duty T.   │  142h    │ 190h  │ 48h    │ 🟡 Theo dõi │ ║ │
│                │ ║ │ ⚠ Cảnh báo: PURSER Lê C đã đạt 92% Duty tháng        │ ║ │
│                │ ║ └────────────────────────────────────────────────────────┘ ║ │
│                │ ╚═════════════════════════════════════════════════════════════╝ │
└────────────────┴──────────────────────────────────────────────────────────────────┘
```

---

## 3. Chú thích thành phần

| # | Element | MM code | BR code | Hành vi |
|---|---|---|---|---|
| 1 | Khối A — Thông tin chuyến bay | MM598 (UI), MM599 (API) | BR-TOSS-001 | Hiển thị STD/STA/ETD/ETA/đường bay/trạng thái |
| 2 | Khối B — Thông tin tàu bay (Reg, FH/FC) | MM600 (UI), MM601 (API) | BR-TOSS-001 | Dữ liệu master từ phân hệ Danh mục |
| 3 | Lịch khai thác gần nhất / sắp tới | MM602 (UI), MM603 (API) | BR-TOSS-001 | Hiển thị 1 chuyến trước + N chuyến sau |
| 4 | MEL/CDL, defect hiện có | MM606 (UI), MM607 (API) | BR-TOSS-002, BR-TOSS-028 | Dữ liệu đồng bộ từ AMOS; highlight MEL mới |
| 5 | Lịch bảo dưỡng, AOG, dự kiến khắc phục | MM608 (UI), MM609 (API) | BR-TOSS-002, BR-TOSS-028 | Hiển thị check tiếp theo + AOG hiện tại |
| 6 | Danh sách tổ bay | MM614 (UI), MM615 (API) | BR-TOSS-005 | Vai trò, tên, hạng/năng định |
| 7 | Hành trình tổ bay (7 ngày) | MM616 (UI), MM617 (API) | BR-TOSS-005 | Hiển thị theo từng nhân viên |
| 8 | Flight time | MM620 (UI), MM621 (API) | BR-TOSS-005 | Tích lũy theo kỳ tháng/quý/năm so với ngưỡng FTL |
| 9 | Duty time | MM622 (UI), MM623 (API) | BR-TOSS-005 | Tích lũy giờ làm việc; cảnh báo khi đạt ≥ 90% ngưỡng |

---

## 4. Luồng điều hướng

```
[WF-FP-001 Danh sách] ──► click chuyến ──► [WF-FP-002 Thông tin chung] (tab mặc định)
                                                  │
                                                  ├──► tab "Airport" → [WF-FP-003]
                                                  ├──► tab "Flight Docs" → [WF-FP-004]
                                                  └──► tab "Weight & Fuel" → [WF-FP-005]
```

Trong khối tổ bay:
- Click tên thành viên → modal/sidesheet hiển thị Hành trình + Flight Time + Duty Time của riêng người đó.
- Click MEL/CDL item → modal hiển thị chi tiết + tệp đính kèm (liên kết tới module Maintenance).

---

## 5. Câu hỏi cần làm rõ

- **Q-UX-007:** Lịch khai thác gần nhất / sắp tới — hiển thị bao nhiêu chuyến trước/sau? (đề xuất 1/3)
- **Q-UX-008:** FTL — ngưỡng tính theo **CAAV** hay **chính sách nội bộ VNA**? Có cần hiển thị cả hai cột không?
- **Q-UX-009:** Khi MEL/CDL có ảnh hưởng tới khả năng chở khách hạng nào, có liên kết tự động sang Tab Weight & Fuel để tính lại Payload không?
- **Q-UX-010:** Hành trình tổ bay 7 ngày: hiển thị mặc định cho người dùng nào (chỉ Crew Scheduling) hay tất cả?
- **Q-UX-011:** Khi AOG hiện hành — cần đặt banner cảnh báo nổi bật ở đầu màn không?
- **Q-UX-012:** Có cho phép sửa thủ công thông tin chuyến bay tại đây (override) không, hay chỉ read-only?

---

*Wireframe v0.1 — đầy đủ 18 MM của nhóm 2 (Thông tin chung). Cập nhật khi xác nhận chính sách FTL.*
