---
project: "TOSS"
author: "sonpx@viettel.com.vn"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Wireframe — Low Fidelity"
screen_id: "WF-FP-005"
related_br: "BR-TOSS-011, BR-TOSS-014"
related_mm: "MM697, MM698, MM701, MM702, MM703, MM704, MM705, MM707, MM708, MM709, MM710, MM721"
---

# WF-FP-005 — Xem chi tiết chuyến bay · Tab "Weight & Fuel"

## 1. Mô tả màn hình

- **Mục đích:** quản lý **Fuel Order, Fuel Discrepancy, Extra Fuel Reason** và **tải trọng ước tính (Payload)** của chuyến bay. Cho phép xem chi tiết, sửa, xác nhận với hệ thống ngoài.
- **Người dùng chính:** SH-01 (Dispatcher), SH-03 (Phi hành đoàn — input Discrepancy).
- **Navigation context:** từ WF-FP-002 → click tab "Weight & Fuel".

---

## 2. Wireframe ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────┐
│ Trang chủ > Flight Plans > VN123                                                  │
│ ╔════════════════════════════════════════════════════════════════════════════╗   │
│ ║ VN123  HAN ► DAD · STD 09:30 · A350 VN-A892 · 🟢 Boarded                 ║   │
│ ╚════════════════════════════════════════════════════════════════════════════╝   │
│ ┌─[ Thông tin chung ]─[ Airport ]─[ Flight Docs ]─[●Weight & Fuel●]─┐           │
│                                                                                    │
│ ╔══════════════════════ Khối A · Tải trọng ước tính (MM721) ═══════════════╗   │
│ ║                                                                              ║ │
│ ║  Hạng mục              │ OFP (kg) │ Thực tế (kg) │ Delta (kg) │ Cảnh báo  ║ │
│ ║  ─────────────────────────────────────────────────────────────────────────  ║ │
│ ║  Pax (khách + xách tay)│ 24,500   │ 24,820        │ +320       │ 🟢        ║ │
│ ║  Hành lý ký gửi        │  4,800   │  4,950        │ +150       │ 🟢        ║ │
│ ║  Hàng hóa (Cargo)      │  3,200   │  3,180        │  -20       │ 🟢        ║ │
│ ║  Thư (Mail)            │    150   │    150        │    0       │ 🟢        ║ │
│ ║  ULD                   │  2,400   │  2,400        │    0       │ 🟢        ║ │
│ ║  ─────────────────────────────────────────────────────────────────────────  ║ │
│ ║  Payload tổng          │ 35,050   │ 35,500        │ +450       │ 🟡 Theo dõi║ │
│ ║  DOW                   │ 142,000  │ 142,000       │    0       │ —         ║ │
│ ║  ZFW                   │ 177,050  │ 177,500       │ +450       │ 🟡        ║ │
│ ║  ZFW max               │ 195,000  │ —             │ —          │ 🟢        ║ │
│ ║                                                                              ║ │
│ ║  [↻ Tính toán lại]    Cập nhật lần cuối: 06-04 08:15:22                    ║ │
│ ╚════════════════════════════════════════════════════════════════════════════╝ │
│                                                                                    │
│ ╔══════════════════════ Khối B · Fuel Order (MM697/698) ═══════════════════╗   │
│ ║                                                                              ║ │
│ ║  Mã Fuel Order : FO-VN123-20260604-01                                        ║ │
│ ║  Trạng thái    : 🟢 Confirmed by Refueler                                    ║ │
│ ║  ─────────────────────────────────────────────────────────────                ║ │
│ ║  Trip Fuel     :  9,800 kg                                                   ║ │
│ ║  Contingency   :    490 kg                                                   ║ │
│ ║  Alternate     :  1,200 kg                                                   ║ │
│ ║  Final Reserve :    900 kg                                                   ║ │
│ ║  Extra Fuel    :    800 kg   → Lý do (MM704/705): Tankering HAN-DAD          ║ │
│ ║  ─────────────────────────────────────────────────────────────                ║ │
│ ║  Block Fuel    : 13,190 kg                                                   ║ │
│ ║  Taxi Fuel     :    200 kg                                                   ║ │
│ ║  Take-off Fuel : 12,990 kg                                                   ║ │
│ ║                                                                              ║ │
│ ║  [✎ Sửa Fuel Order (MM707/708)]   [⬇ Tải Fuel Slip]                         ║ │
│ ╚════════════════════════════════════════════════════════════════════════════╝ │
│                                                                                    │
│ ╔══════════════════════ Khối C · Fuel Discrepancy (MM701/702) ════════════╗   │
│ ║                                                                              ║ │
│ ║  Trạng thái: ◐ Đang nhập bởi Cmd Nguyễn Văn A                                ║ │
│ ║  ─────────────────────────────────────────────────────────                    ║ │
│ ║  Fuel theo OFP         : 13,190 kg                                           ║ │
│ ║  Fuel thực tế nạp      : [ 13,250 ] kg                                       ║ │
│ ║  Chênh lệch (Delta)    :    +60 kg                                           ║ │
│ ║  Lý do chênh lệch      : [____________________________________]              ║ │
│ ║  Ghi chú               : [____________________________________]              ║ │
│ ║                                                                              ║ │
│ ║  [✎ Sửa Discrepancy (MM709/710)]   [✓ Xác nhận về hệ thống (MM703)]         ║ │
│ ╚════════════════════════════════════════════════════════════════════════════╝ │
│                                                                                    │
│ ╔══════════════════════ Khối D · Extra Fuel Reason (MM704/705) ═══════════╗   │
│ ║                                                                              ║ │
│ ║  Lý do          : Tankering HAN-DAD                                          ║ │
│ ║  Phân loại      : Cost optimization                                          ║ │
│ ║  Trị giá KT     :   +800 kg                                                  ║ │
│ ║  Tiết kiệm dự kiến: ~ 180 USD                                                ║ │
│ ║  Ghi chú        : Giá nhiên liệu HAN < DAD 8% trong cửa sổ 06-04            ║ │
│ ║                                                                              ║ │
│ ║  Lịch sử thay đổi Extra Fuel Reason:                                         ║ │
│ ║  • 06-04 07:50  Tạo bởi Dispatcher Phạm D — Tankering                       ║ │
│ ║  • 06-04 08:05  Cập nhật bởi Dispatcher Phạm D — điều chỉnh từ 600→800     ║ │
│ ╚════════════════════════════════════════════════════════════════════════════╝ │
└──────────────────────────────────────────────────────────────────────────────────┘
```

### 2.1 Modal "Sửa Fuel Order" (MM707/708)

```
┌─ Sửa Fuel Order — FO-VN123-20260604-01 ─────────┐
│ Trip Fuel      : [  9,800 ] kg                    │
│ Contingency    : [    490 ] kg                    │
│ Alternate      : [  1,200 ] kg                    │
│ Final Reserve  : [    900 ] kg                    │
│ Extra Fuel     : [    800 ] kg                    │
│   Lý do Extra  : [Tankering HAN-DAD            ▾] │
│ Taxi Fuel      : [    200 ] kg                    │
│ ─────────────────────────────                     │
│ Block Fuel (auto): 13,190 kg                      │
│                                                    │
│ Lý do sửa     : [_______________________________] │
│                                                    │
│         [Hủy]      [Lưu thay đổi]                 │
└──────────────────────────────────────────────────┘
```

### 2.2 Modal "Sửa Fuel Discrepancy" (MM709/710)

```
┌─ Sửa Fuel Discrepancy ───────────────────────────┐
│ Fuel theo OFP     : 13,190 kg (read-only)         │
│ Fuel thực tế nạp  : [ 13,250 ] kg                 │
│ Delta             :     +60 kg (auto)             │
│ Lý do chênh lệch  : [______________________]      │
│ Ghi chú           : [______________________]      │
│                                                    │
│         [Hủy]      [Lưu]                          │
└──────────────────────────────────────────────────┘
```

---

## 3. Chú thích thành phần

| # | Element | MM code | BR code | Hành vi |
|---|---|---|---|---|
| 1 | Bảng tải trọng ước tính (Khối A) | MM721 | BR-TOSS-011 | Tính từ Pax + Bag + Cargo + Mail + ULD; so sánh OFP vs thực tế, hiển thị Delta |
| 2 | Khối Fuel Order — xem | MM697 (UI), MM698 (API) | BR-TOSS-014 | Trip/Contingency/Alt./FR/Extra/Taxi/Block |
| 3 | Sửa Fuel Order | MM707 (UI), MM708 (API) | BR-TOSS-014 | Modal sửa; ghi log audit |
| 4 | Fuel Discrepancy — xem & nhập | MM701 (UI), MM702 (API) | BR-TOSS-014 | Phi hành đoàn nhập Fuel thực tế |
| 5 | Confirm Discrepancy về hệ thống | MM703 | BR-TOSS-014 | API gửi xác nhận về hệ thống nhiên liệu ngoài |
| 6 | Sửa Fuel Discrepancy | MM709 (UI), MM710 (API) | BR-TOSS-014 | Modal sửa |
| 7 | Extra Fuel Reason — xem | MM704 (UI), MM705 (API) | BR-TOSS-014 | Hiển thị lý do, phân loại, lịch sử |

---

## 4. Luồng điều hướng

```
[Tab Weight & Fuel]
   │
   ├── Khối A — Auto refresh khi Pax/Cargo/Bag/Mail từ PSS thay đổi → tính lại MM721
   │
   ├── [✎ Sửa Fuel Order] → Modal MM707/708 → Lưu → cập nhật Khối B + Khối A
   │
   ├── Phi hành đoàn nhập Fuel thực tế → MM701/702 → click [✓ Xác nhận] → MM703 → đẩy về hệ thống
   │   └── Sau đó có thể sửa bằng MM709/710
   │
   └── Click "Lịch sử thay đổi Extra Fuel" → hiển thị timeline ai-khi-gì
```

---

## 5. Câu hỏi cần làm rõ

- **Q-UX-026:** Ngưỡng cảnh báo Delta Payload — bao nhiêu kg/% để chuyển 🟢→🟡→🔴? Cấu hình ở BR-TOSS-020 (tham số hệ thống)?
- **Q-UX-027:** Khi Delta ZFW vượt ngưỡng — có chặn xác nhận Fuel Order hay chỉ cảnh báo?
- **Q-UX-028:** Fuel Discrepancy: phi hành đoàn nhập trên Web Mobile (BR-TOSS-010) hay chỉ Dispatcher nhập tại đây?
- **Q-UX-029:** Sau khi MM703 (confirm về hệ thống) thành công — có khóa các trường sửa nữa không? Sửa lại phải qua quy trình khác?
- **Q-UX-030:** Extra Fuel Reason — danh sách phân loại (Tankering, Weather, Holding…) có chuẩn hóa thành danh mục cấu hình được không?
- **Q-UX-031:** Có cần tính phí Tankering chi tiết hơn (giá nhiên liệu hai sân bay × khối lượng + chi phí mang dầu) hay chỉ ghi nhận "tiết kiệm dự kiến"?
- **Q-UX-032:** Khối A (MM721) có cần liên kết tới Tab Flight Docs (LS Rev mới) khi Payload thay đổi đáng kể không?

---

*Wireframe v0.1 — phủ đầy đủ 12 MM nhóm 5 (Weight & Fuel).*
