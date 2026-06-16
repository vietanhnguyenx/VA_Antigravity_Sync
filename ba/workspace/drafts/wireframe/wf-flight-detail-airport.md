---
project: "TOSS"
author: "sonpx@viettel.com.vn"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Wireframe — Low Fidelity"
screen_id: "WF-FP-003"
related_br: "BR-TOSS-001, BR-TOSS-002, BR-TOSS-014"
related_mm: "MM624, MM625, MM626, MM627, MM628, MM629, MM630, MM631, MM634, MM635, MM636, MM637, MM638, MM639"
---

# WF-FP-003 — Xem chi tiết chuyến bay · Tab "Airport"

## 1. Mô tả màn hình

- **Mục đích:** hiển thị thông tin **liên quan đến hai sân bay đi/đến**: vị trí tàu bay, gate, băng chuyền, NOTAM/thời tiết, khuyến nghị, thông tin nhiên liệu.
- **Người dùng chính:** SH-01 (Dispatcher), SH-04 (Ground Ops Manager).
- **Navigation context:** từ WF-FP-002 → click tab "Airport".

---

## 2. Wireframe ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────┐
│ Trang chủ > Flight Plans > VN123 (HAN-DAD · 2026-06-04)                          │
│ ╔════════════════════════════════════════════════════════════════════════════╗   │
│ ║ VN123  HAN ► DAD  · STD 09:30 · A350 VN-A892  · 🟢 Boarded                ║   │
│ ╚════════════════════════════════════════════════════════════════════════════╝   │
│ ┌─[ Thông tin chung ]─[●Airport●]─[ Flight Docs ]─[ W&F ]─┐                    │
│                                                                                    │
│ ╔══════════════════════ Sân bay đi: HAN (Nội Bài) ════════════════════════╗     │
│ ║                                                                            ║     │
│ ║ ┌─ Vị trí tàu bay tại sân bay đi (MM624/625) ────────────────────────┐ ║     │
│ ║ │ Bay đỗ: A07            Terminal: T2             Cách gate: 320m    │ ║     │
│ ║ │ [bản đồ sơ đồ sân bay hiển thị vị trí A07]                          │ ║     │
│ ║ └────────────────────────────────────────────────────────────────────┘ ║     │
│ ║                                                                            ║     │
│ ║ ┌─ Boarding Gate & Giờ boarding (MM626/627) ─────────────────────────┐ ║     │
│ ║ │ Gate: 22A    Boarding Time: 08:50    Boarding hiện trạng: 🟢 Open │ ║     │
│ ║ │ Final call: 09:20    Door close: 09:25                             │ ║     │
│ ║ └────────────────────────────────────────────────────────────────────┘ ║     │
│ ╚════════════════════════════════════════════════════════════════════════════╝   │
│                                                                                    │
│ ╔══════════════════════ Sân bay đến: DAD (Đà Nẵng) ═══════════════════════╗     │
│ ║                                                                            ║     │
│ ║ ┌─ Vị trí đỗ tàu bay tại sân bay đến (MM630/631) ────────────────────┐ ║     │
│ ║ │ Bay đỗ dự kiến: B12     Terminal: T1     Cách bay đến: 18 phút     │ ║     │
│ ║ └────────────────────────────────────────────────────────────────────┘ ║     │
│ ║                                                                            ║     │
│ ║ ┌─ Băng chuyền hành lý (MM628/629) ──────────────────────────────────┐ ║     │
│ ║ │ Băng chuyền: 5     ETA hành lý đầu: 11:18                          │ ║     │
│ ║ └────────────────────────────────────────────────────────────────────┘ ║     │
│ ╚════════════════════════════════════════════════════════════════════════════╝   │
│                                                                                    │
│ ╔══════════════════════ Khuyến nghị & Thời tiết & Nhiên liệu ════════════╗      │
│ ║                                                                            ║     │
│ ║ ┌─ Khuyến nghị cho chuyến bay (MM634/635) ───────────────────────────┐ ║     │
│ ║ │ ⓘ Khuyến nghị mang dầu Tankering: +800 kg (chênh giá HAN-DAD)      │ ║     │
│ ║ │ ⓘ Hạn chế hạ cánh DAD trong khung 11:00-11:30 (NOTAM RWY work)     │ ║     │
│ ║ │ ⓘ Tải trọng đề xuất: Y full, C cabin còn 2 ghế khả dụng            │ ║     │
│ ║ └────────────────────────────────────────────────────────────────────┘ ║     │
│ ║                                                                            ║     │
│ ║ ┌─ NOTAM & Weather (MM636/637) ──────────────────────────────────────┐ ║     │
│ ║ │ Tab: [NOTAM HAN] [NOTAM DAD] [WX HAN] [WX DAD] [WX ENR]            │ ║     │
│ ║ │ ──────────────────────────────────────────────────────────────────  │ ║     │
│ ║ │ NOTAM A1234/26 RWY 11L/29R CLSD 0400-1100 (RWY maintenance)        │ ║     │
│ ║ │ NOTAM A1456/26 NAVAID VOR/DME u/s                                  │ ║     │
│ ║ │ ...                                                                 │ ║     │
│ ║ │ [Xem đầy đủ trong Flight Docs →]                                   │ ║     │
│ ║ └────────────────────────────────────────────────────────────────────┘ ║     │
│ ║                                                                            ║     │
│ ║ ┌─ Thông tin nhiên liệu (MM638/639) ─────────────────────────────────┐ ║     │
│ ║ │ Trip Fuel    :  9,800 kg                                            │ ║     │
│ ║ │ Contingency  :    490 kg                                            │ ║     │
│ ║ │ Alternate    :  1,200 kg                                            │ ║     │
│ ║ │ Final Reserve:    900 kg                                            │ ║     │
│ ║ │ Extra Fuel   :    800 kg (Tankering recommend)                      │ ║     │
│ ║ │ ─────────────────────                                               │ ║     │
│ ║ │ Total Block  : 13,190 kg                                            │ ║     │
│ ║ │ [→ Chi tiết Fuel Order tại Tab Weight & Fuel]                       │ ║     │
│ ║ └────────────────────────────────────────────────────────────────────┘ ║     │
│ ╚════════════════════════════════════════════════════════════════════════════╝   │
└──────────────────────────────────────────────────────────────────────────────────┘
```

---

## 3. Chú thích thành phần

| # | Element | MM code | BR code | Hành vi |
|---|---|---|---|---|
| 1 | Vị trí tàu bay tại sân bay đi | MM624 (UI), MM625 (API) | BR-TOSS-001 | Hiển thị bay đỗ + sơ đồ sân bay |
| 2 | Boarding Gate, giờ boarding | MM626 (UI), MM627 (API) | BR-TOSS-001 | Gate, boarding time, final call, door close |
| 3 | Băng chuyền hành lý sân bay đến | MM628 (UI), MM629 (API) | BR-TOSS-001 | Số băng chuyền + ETA hành lý đầu |
| 4 | Vị trí đỗ tàu bay sân bay đến | MM630 (UI), MM631 (API) | BR-TOSS-001 | Bay đỗ dự kiến |
| 5 | Khuyến nghị cho chuyến bay | MM634 (UI), MM635 (API) | BR-TOSS-002, BR-TOSS-014 | Bao gồm Tankering, hạn chế khai thác, đề xuất tải trọng |
| 6 | NOTAM & Weather (tab nội bộ) | MM636 (UI), MM637 (API) | BR-TOSS-001 | NOTAM HAN/DAD + WX HAN/DAD/ENR |
| 7 | Thông tin nhiên liệu (Trip/Cont./Alt./FR/Extra) | MM638 (UI), MM639 (API) | BR-TOSS-014 | Dữ liệu từ OFP; link sang Tab W&F |

---

## 4. Luồng điều hướng

```
[Tab Thông tin chung] ◄──► [Tab Airport (đây)] ◄──► [Tab Flight Docs] ◄──► [Tab Weight & Fuel]

Trong tab này:
- Click "Xem đầy đủ trong Flight Docs" trong khối NOTAM → chuyển sang Tab Flight Docs, scroll tới phần NOTAM/WX.
- Click "Chi tiết Fuel Order tại Tab Weight & Fuel" trong khối Nhiên liệu → chuyển sang Tab Weight & Fuel.
- Click 1 NOTAM item → modal hiển thị nội dung NOTAM raw + bản dịch.
```

---

## 5. Câu hỏi cần làm rõ

- **Q-UX-013:** Sơ đồ sân bay tích hợp từ đâu (dataset nội bộ, Lido, hay nhà cung cấp bản đồ thứ ba)? Hỗ trợ bao nhiêu sân bay?
- **Q-UX-014:** Boarding/Gate/Băng chuyền — nguồn dữ liệu (PSS/DCS hay AODB sân bay)? Tần suất cập nhật?
- **Q-UX-015:** Khuyến nghị cho chuyến bay (MM634) sinh tự động hay nhập tay? Engine logic có cấu hình được không?
- **Q-UX-016:** NOTAM hiển thị raw (mã ICAO) hay đã decode? Có cần đa ngôn ngữ không?
- **Q-UX-017:** Khi NOTAM/WX cập nhật mới, có push notification cho người dùng đang xem không?
- **Q-UX-018:** Sân bay alternate (ALT) — có cần hiển thị một section riêng cho ALT không?

---

*Wireframe v0.1 — phủ đầy đủ 14 MM nhóm 3 (Airport).*
