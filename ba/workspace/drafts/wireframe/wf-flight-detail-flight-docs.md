---
project: "TOSS"
author: "sonpx@viettel.com.vn"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Wireframe — Low Fidelity"
screen_id: "WF-FP-004"
related_br: "BR-TOSS-006, BR-TOSS-007, BR-TOSS-008, BR-TOSS-009, BR-TOSS-026, BR-TOSS-027, BR-TOSS-029"
related_mm: "MM644, MM646, MM649, MM653, MM655, MM656, MM657, MM658, MM659, MM660, MM661, MM667, MM668, MM669, MM670, MM671, MM672, MM689, MM690, MM691, MM692, MM693, MM694, MM695, MM696"
---

# WF-FP-004 — Xem chi tiết chuyến bay · Tab "Flight Docs"

## 1. Mô tả màn hình

- **Mục đích:** trung tâm quản lý **toàn bộ tài liệu chuyến bay** (OFP, NOTAM, WX, LS/GD/PM, Briefing Sheet, NOTOC/Cargo, tài liệu khác) — xem file, quản lý phiên bản (Rev), xóa, và theo dõi trạng thái xác thực (Confirm/Reject/Request) từ MO Plus.
- **Người dùng chính:** SH-01 (Dispatcher), SH-03 (Phi hành đoàn — read), SH-07 (System Admin — audit).
- **Navigation context:** từ WF-FP-002 → click tab "Flight Docs".

---

## 2. Wireframe ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────┐
│ Trang chủ > Flight Plans > VN123                                                  │
│ ╔════════════════════════════════════════════════════════════════════════════╗   │
│ ║ VN123  HAN ► DAD · STD 09:30 · A350 VN-A892 · 🟢 Boarded                 ║   │
│ ╚════════════════════════════════════════════════════════════════════════════╝   │
│ ┌─[ Thông tin chung ]─[ Airport ]─[●Flight Docs●]─[ W&F ]─┐                     │
│                                                                                    │
│ ┌─ Bộ lọc nhóm tài liệu ─────────────────────────────────────────────────┐      │
│ │ ●Tất cả  ○OFP  ○NOTAM/WX  ○LS/GD/PM  ○Briefing  ○NOTOC/Cargo  ○Khác   │      │
│ │ Trạng thái: [Tất cả ▾]   Phiên bản: [Mới nhất ▾]   [+ Tải tài liệu]   │      │
│ └─────────────────────────────────────────────────────────────────────────┘      │
│                                                                                    │
│ ╔═══════════════════════════════ Cột trái: Danh sách tài liệu ═══════════════╗ │
│ ║                                                                              ║ │
│ ║ ┌─ OFP (MM644) ─────────────────────────────────────────────────────────┐ ║ │
│ ║ │ ▸ OFP_VN123_20260604_v3.pdf   Rev 3  ▣ Confirmed  06-04 08:15  ⋮     │ ║ │
│ ║ │ ▸ OFP_VN123_20260604_v2.pdf   Rev 2  ▣ Superseded                    │ ║ │
│ ║ │ ▸ OFP_VN123_20260604_v1.pdf   Rev 1  ▣ Superseded                    │ ║ │
│ ║ │ [+ Rev mới] (MM667/668)   [⚙ Xử lý bóc OFP (MM659)]                  │ ║ │
│ ║ └─────────────────────────────────────────────────────────────────────┘ ║ │
│ ║                                                                              ║ │
│ ║ ┌─ NOTAM & WX (MM646) ──────────────────────────────────────────────────┐ ║ │
│ ║ │ ▸ NOTAM_HAN_20260604.pdf      Rev 1  ▣ Confirmed  ⋮                  │ ║ │
│ ║ │ ▸ NOTAM_DAD_20260604.pdf      Rev 1  ▣ Confirmed  ⋮                  │ ║ │
│ ║ │ ▸ WX_HAN_DAD_20260604.pdf     Rev 2  ▣ Confirmed  ⋮                  │ ║ │
│ ║ │ [⚙ Xử lý bóc NOTAM (MM660)] [⚙ Xử lý bóc WX (MM661)]                 │ ║ │
│ ║ └─────────────────────────────────────────────────────────────────────┘ ║ │
│ ║                                                                              ║ │
│ ║ ┌─ LS / GD / PM (MM649) ────────────────────────────────────────────────┐ ║ │
│ ║ │ ▸ LoadSheet_VN123_v2.pdf      Rev 2  ▣ Confirmed                     │ ║ │
│ ║ │ ▸ GD_VN123.pdf                Rev 1  ◐ Requested                     │ ║ │
│ ║ │ ▸ PaxManifest_VN123.pdf       Rev 1  ▣ Confirmed                     │ ║ │
│ ║ └─────────────────────────────────────────────────────────────────────┘ ║ │
│ ║                                                                              ║ │
│ ║ ┌─ Briefing Sheet (MM653) ──────────────────────────────────────────────┐ ║ │
│ ║ │ ▸ BriefingSheet_VN123.pdf     Rev 1  ▣ Confirmed                     │ ║ │
│ ║ └─────────────────────────────────────────────────────────────────────┘ ║ │
│ ║                                                                              ║ │
│ ║ ┌─ NOTOC / Cargo (MM655/656) ───────────────────────────────────────────┐ ║ │
│ ║ │ ▸ NOTOC_VN123.pdf             Rev 1  ▣ Confirmed                     │ ║ │
│ ║ │ ▸ CargoManifest_VN123.pdf     Rev 1  ▣ Confirmed                     │ ║ │
│ ║ │ ▸ MailManifest_VN123.pdf      Rev 1  ✗ Rejected   (MM693)            │ ║ │
│ ║ └─────────────────────────────────────────────────────────────────────┘ ║ │
│ ║                                                                              ║ │
│ ║ ┌─ Tài liệu Khác (MM657/658) ───────────────────────────────────────────┐ ║ │
│ ║ │ ▸ SpecialReq_VN123.pdf        Rev 1  ◐ Requested                     │ ║ │
│ ║ └─────────────────────────────────────────────────────────────────────┘ ║ │
│ ╚════════════════════════════════════════════════════════════════════════════╝ │
│                                                                                    │
│ ╔═══════════════════════════════ Cột phải: Preview ══════════════════════════╗ │
│ ║ Tài liệu đang xem: OFP_VN123_20260604_v3.pdf  · Rev 3  (MM669/670)        ║ │
│ ║ ┌────────────────────────────────────────────────────────────────────┐  ║ │
│ ║ │ [PDF preview]                                                        │  ║ │
│ ║ │                                                                      │  ║ │
│ ║ │                                                                      │  ║ │
│ ║ │                                                                      │  ║ │
│ ║ └────────────────────────────────────────────────────────────────────┘  ║ │
│ ║                                                                              ║ │
│ ║ ┌─ Trạng thái Confirm/Reject/Request (MM689-696) ────────────────────┐ ║ │
│ ║ │ ✓ Confirm (MM691/692):                                              │ ║ │
│ ║ │   • Cmd Nguyễn Văn A    06-04 08:20:14  [Xem file confirm MM689]   │ ║ │
│ ║ │   • F/O Trần Thị B      06-04 08:21:42                              │ ║ │
│ ║ │ ✗ Reject (MM693/694):  (không có)                                   │ ║ │
│ ║ │ ◐ Request (MM695/696):                                              │ ║ │
│ ║ │   • Purser Lê Văn C — đang chờ phiên bản Rev 3 (06-04 08:18)        │ ║ │
│ ║ └─────────────────────────────────────────────────────────────────────┘ ║ │
│ ║                                                                              ║ │
│ ║ [⬇ Tải về] [🖶 In] [🗑 Xóa (MM671/672)] [📤 Đẩy MO Plus]                  ║ │
│ ╚════════════════════════════════════════════════════════════════════════════╝ │
└──────────────────────────────────────────────────────────────────────────────────┘
```

### 2.1 Modal "Rev mới tài liệu" (MM667/668)

```
┌─ Tạo phiên bản mới (Rev) — OFP_VN123_20260604 ─┐
│ Phiên bản hiện tại : Rev 3                       │
│ Phiên bản mới      : Rev 4 (auto)                │
│ Tải file mới       : [Chọn file...]              │
│ Lý do thay đổi     : [____________________]      │
│ Ghi chú            : [____________________]      │
│                                                   │
│ ☐ Tự động thông báo phi hành đoàn để Confirm lại │
│ ☐ Đánh dấu Rev 3 là Superseded                   │
│                                                   │
│            [Hủy]      [Tạo Rev 4]                │
└──────────────────────────────────────────────────┘
```

---

## 3. Chú thích thành phần

| # | Element | MM code | BR code | Hành vi |
|---|---|---|---|---|
| 1 | Danh sách tài liệu OFP | MM644 | BR-TOSS-006 | Tích hợp Lido (MM659 xử lý bóc) |
| 2 | Danh sách NOTAM/WX | MM646 | BR-TOSS-006, BR-TOSS-027 | MM660 bóc NOTAM, MM661 bóc WX |
| 3 | Danh sách LS/GD/PM | MM649 | BR-TOSS-006, BR-TOSS-029 | Tích hợp PSS/DCS |
| 4 | Danh sách Briefing Sheet | MM653 | BR-TOSS-006 | |
| 5 | Danh sách NOTOC/Cargo | MM655 (UI), MM656 (API) | BR-TOSS-006, BR-TOSS-029 | |
| 6 | Danh sách tài liệu khác | MM657 (UI), MM658 (API) | BR-TOSS-006 | |
| 7 | Xử lý bóc OFP | MM659 | BR-TOSS-027 | Auto extract metadata Lido |
| 8 | Xử lý bóc NOTAM | MM660 | BR-TOSS-027 | |
| 9 | Xử lý bóc WX | MM661 | BR-TOSS-027 | |
| 10 | Rev tài liệu (UI/API) | MM667, MM668 | BR-TOSS-007 | Modal tạo Rev mới + lịch sử |
| 11 | Xem file | MM669 (UI), MM670 (API) | BR-TOSS-006 | PDF preview cột phải |
| 12 | Xóa file | MM671 (UI), MM672 (API) | BR-TOSS-006 | Cần confirm + audit log |
| 13 | Xem file Confirm Docs | MM689 (UI), MM690 (API) | BR-TOSS-008 | File chứa chữ ký xác nhận |
| 14 | Trạng thái Confirm | MM691 (UI), MM692 (API) | BR-TOSS-008, BR-TOSS-026 | Đồng bộ MO Plus |
| 15 | Trạng thái Reject | MM693 (UI), MM694 (API) | BR-TOSS-008, BR-TOSS-026 | Hiển thị lý do reject |
| 16 | Trạng thái Request | MM695 (UI), MM696 (API) | BR-TOSS-008, BR-TOSS-026 | Phi hành đoàn yêu cầu cập nhật |

---

## 4. Luồng điều hướng

```
[Tab Flight Docs]
   │
   ├── Click 1 tài liệu trong danh sách → cập nhật cột Preview (MM669)
   ├── Click [+ Rev mới] → Modal MM667/668 → tạo Rev mới
   ├── Click [🗑 Xóa] → Modal xác nhận → MM671/672
   ├── Click [📤 Đẩy MO Plus] → đồng bộ trạng thái với MO Plus (BR-TOSS-026)
   ├── Click trên 1 dòng Confirm/Reject → modal hiển thị chi tiết người + thời gian
   └── Click [+ Tải tài liệu] (header) → modal upload thủ công (dự phòng khi mất kết nối auto — BR-TOSS-009)
```

---

## 5. Câu hỏi cần làm rõ

- **Q-UX-019:** Trong bóc dữ liệu tự động (MM659–661), nếu file Lido có format mới làm extract thất bại — UX xử lý thế nào (banner cảnh báo, retry, fallback manual)?
- **Q-UX-020:** Khi tạo Rev mới — có buộc phi hành đoàn confirm lại Rev mới không, hay confirm Rev cũ vẫn còn hiệu lực?
- **Q-UX-021:** Quyền xóa file (MM671) — chỉ Dispatcher hay cần thêm cấp duyệt?
- **Q-UX-022:** Trạng thái Reject (MM693) — phi hành đoàn nhập lý do reject ở Web Mobile, hiển thị ra sao tại đây?
- **Q-UX-023:** Cột phải Preview có hỗ trợ so sánh 2 phiên bản (side-by-side diff) không?
- **Q-UX-024:** Upload thủ công (BR-TOSS-009): có giới hạn loại tài liệu / kích thước / cần checksum không?
- **Q-UX-025:** Tab này có cần search box trong từng nhóm tài liệu không (vd. tìm theo tên file)?

---

*Wireframe v0.1 — phủ đầy đủ 25 MM nhóm 4 (Flight Docs).*
