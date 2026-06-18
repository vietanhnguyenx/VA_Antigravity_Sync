---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
status: "Draft"
document_type: "Wireframe (low-fidelity)"
document_id: "WF-PH1-MON-DOC-OFFICER"
---

# Wireframe — Màn giám sát của cán bộ tài liệu + Dashboard tài liệu chuyến

## 1. Mục tiêu màn

Cung cấp cho cán bộ tài liệu (Document Officer) một màn giám sát tập trung vào **tình trạng tài liệu chuyến bay**: tổ bay đã xác nhận / đã tải xuống hay chưa, các loại tài liệu (OFP, LS, GD, PM, NOTOC, Cargo Manifest, Mail Manifest, Flight Release) đã có / chưa có, luồng phê duyệt Request → Confirm → Reject, và quản lý phiên bản tài liệu. Cho phép tải gói hồ sơ tài liệu chuyến khi cần.

## 2. BR / FUNC liên quan

| BR | FUNC | Vai trò |
|---|---|---|
| BR-113 | FUNC-145 | Màn giám sát cán bộ tài liệu: trạng thái tài liệu, xác nhận / tải xuống của tổ bay |
| BR-113 | FUNC-146 | Nhiều cấp xem tổng quan → chi tiết chuyến → chi tiết phiên bản |
| BR-112 | FUNC-139 | Dashboard tài liệu chuyến: "đã có / chưa có" theo loại |
| BR-112 | FUNC-140 | Luồng phê duyệt Request / Confirm / Reject + dấu thời gian |
| BR-112 | FUNC-141 | Quản lý phiên bản, tải gói hồ sơ |
| BR-112 | FUNC-142 | Phân quyền xem chi tiết theo vai trò `[cần xác nhận ma trận]` |
| BR-112 | FUNC-143 | Danh mục loại tài liệu cần thiết + quy tắc "đã có / chưa có" `[cần SME]` |
| BR-102 | FUNC-104, 105 | Ẩn/hiện cột theo phiên |

## 3. Bố cục ASCII

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│  TOSS — GIÁM SÁT TÀI LIỆU CHUYẾN BAY            Cán bộ tài liệu: PHẠM THỊ K   |   Ca: 06:00 - 18:00             │
│                                                  Cập nhật: tự động ● LIVE                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Carrier: [✓ VN] [✓ 0V] [✓ BL]   DEP: [▼ HAN]   ARR: [▼ Tất cả]                                                 │
│ Trạng thái tài liệu: [✓ Thiếu] [✓ Đang chờ confirm] [✓ Bị reject] [☐ Đã đủ]                                    │
│ Sắp ETD trong: [▼ 120 phút]   [⚙ Ẩn/Hiện cột]                                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                                  │
│  ── CẤP 1: DASHBOARD TÀI LIỆU TỔNG QUAN (FUNC-139) ──                                                           │
│ ┌──────────────────┬──────────────────┬──────────────────┬──────────────────┬──────────────────┐               │
│ │ Tổng chuyến      │ Đủ tài liệu      │ Thiếu tài liệu   │ Đang chờ confirm │ Bị reject        │               │
│ │       45         │      32          │ ⚠   10           │       2          │ ⚠   1            │               │
│ └──────────────────┴──────────────────┴──────────────────┴──────────────────┴──────────────────┘               │
│ ┌──────────────────┬──────────────────┬──────────────────┬──────────────────┬──────────────────┐               │
│ │ Tổ bay chưa      │ Tổ bay chưa tải  │ OFP còn phiên bản│ Flight Release   │ Cảnh báo "thiếu  │               │
│ │ confirm OFP      │ xuống tài liệu   │ chưa release     │ chưa có          │ TL trước ETD"    │               │
│ │ [cần XN trường]  │ [cần XN trường]  │                  │                  │                  │               │
│ │      5           │      8           │      3           │      4           │ ⚠   6           │               │
│ └──────────────────┴──────────────────┴──────────────────┴──────────────────┴──────────────────┘               │
│                                                                                                                  │
│  ── CẤP 2: MA TRẬN TÀI LIỆU × CHUYẾN (FUNC-139, FUNC-145) ──                                                    │
│ ┌────┬────────┬───────┬─────┬─────┬───────┬─────┬─────┬─────┬─────┬─────┬─────┬───────┬───────┬───────┐         │
│ │ #  │ FLT NO │ STD   │ DEP │ ARR │ AC REG│ OFP │ LS  │ GD  │ PM  │NOTOC│NOTOC│ Cargo │ Mail  │Flight │         │
│ │    │        │       │     │     │       │     │     │     │     │ BAG │ CGO │ Manif.│ Manif.│Release│         │
│ ├────┼────────┼───────┼─────┼─────┼───────┼─────┼─────┼─────┼─────┼─────┼─────┼───────┼───────┼───────┤         │
│ │ 1  │ VN162  │ 06:00 │ HAN │ SGN │VN-A861│✓ R2 │ ✓   │ ✓   │ ✓   │ ✓   │ ─   │  ✓   │  ─   │ ✓ FR1 │         │
│ │ 2  │ VN204  │ 07:00 │ HAN │ SGN │VN-A395│✓ R1 │ ⏳  │ ⏳  │ ─   │ ─   │ ─   │  ─   │  ─   │  ─   │         │
│ │ 3  │ VN217  │ 07:15 │ HAN │ DAD │VN-A689│✓ R2 │ ✓   │ ✓   │ ✓   │⚠ Pdg│ ─   │  ─   │  ─   │  ─   │         │
│ │ 4  │ VN1854 │ 08:00 │ HAN │ VCS │VN-A368│⚠ R3 │ ✗   │ ─   │ ─   │ ─   │ ─   │  ─   │  ─   │  ─   │         │
│ │    │        │       │     │     │       │Reject│      │     │     │     │     │       │       │       │         │
│ │ 5  │ VN422  │ 08:30 │ HAN │ DIN │VN-A1234│✓ R1│ ✓   │ ✓   │ ⏳  │ ─   │ ─   │  ─   │  ─   │  ─   │         │
│ │ …  │        │       │     │     │       │     │     │     │     │     │     │       │       │       │         │
│ └────┴────────┴───────┴─────┴─────┴───────┴─────┴─────┴─────┴─────┴─────┴─────┴───────┴───────┴───────┘         │
│  Chú thích: ✓ Confirmed | ⏳ Unconfirmed (đã upload, chờ tổ bay xác nhận) | ⚠ Pending/Reject | ✗ Chưa upload    │
│             ─ Không yêu cầu cho chuyến này   [cần xác nhận quy tắc "đã có / chưa có"]                          │
│                                                                                                                  │
│  ── CẤP 2 (mở rộng): TRẠNG THÁI TỔ BAY (FUNC-145) ──                                                            │
│ ┌────────┬─────────────┬──────────────────┬──────────────────┬──────────────────────────────────┐              │
│ │ FLT NO │ CREW SYNC   │ Tổ bay đã        │ Tổ bay đã        │ Cảnh báo                         │              │
│ │        │             │ confirm OFP      │ tải xuống        │                                  │              │
│ │        │             │ [cần xác nhận]   │ [cần xác nhận]   │                                  │              │
│ ├────────┼─────────────┼──────────────────┼──────────────────┼──────────────────────────────────┤              │
│ │ VN162  │ Đồng bộ     │  ✓ 06/06 05:45  │  ✓ 06/06 05:48  │ ─                                │              │
│ │ VN204  │ Đồng bộ     │  ─ Chưa         │  ─ Chưa         │ ⚠ ETD còn 30' — tổ bay chưa     │              │
│ │        │             │                  │                  │   confirm                        │              │
│ │ VN217  │ Đồng bộ     │  ✓ 06/06 06:50  │  ✓ 06/06 06:55  │ ⚠ NOTOC pending                  │              │
│ │ VN1854 │ ⚠ Lệch     │  ─               │  ─               │ ⚠ LS bị reject — cần upload lại │              │
│ └────────┴─────────────┴──────────────────┴──────────────────┴──────────────────────────────────┘              │
│                                                                                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ── CẤP 3: CHI TIẾT TÀI LIỆU CHUYẾN (slide-out khi click ô tài liệu hoặc FLT NO) ──                             │
│                                                                                                                  │
│   VN1854 · HAN → VCS · STD 08:00 · AC: VN-A368 (A320)                                                            │
│  ┌─────────────────────────────────────────────────────────────────────────────────────────────────┐            │
│  │ ▸ OFP (Operational Flight Plan)                                                                  │            │
│  │     OFP Number: LIDO-20260612-VN1854 · OFP Version (TOSS): R3 · OFP REV: 3 · IS RECLEAR: ✗      │            │
│  │     Lịch sử phiên bản (FUNC-141):                                                                │            │
│  │       ┌────┬─────────┬──────────────┬──────────────┬──────────────┬──────────────────────┐    │            │
│  │       │ Rev│ Status  │ Upload time  │ Confirm time │ Released by  │ Hành động            │    │            │
│  │       ├────┼─────────┼──────────────┼──────────────┼──────────────┼──────────────────────┤    │            │
│  │       │ R1 │ Confirm │ 12/06 06:00  │ 12/06 06:05  │ NGUYỄN V L    │ [Tải PDF]            │    │            │
│  │       │ R2 │ Confirm │ 12/06 06:30  │ 12/06 06:32  │ NGUYỄN V L    │ [Tải PDF]            │    │            │
│  │       │ R3 │ ⚠ Reject│ 12/06 07:15  │ 12/06 07:20  │ NGUYỄN V L    │ [Tải PDF] [Xem lý do]│    │            │
│  │       └────┴─────────┴──────────────┴──────────────┴──────────────┴──────────────────────┘    │            │
│  │                                                                                                  │            │
│  │ ▸ Luồng phê duyệt (FUNC-140)                                                                     │            │
│  │     R1 Request → Confirm (Tổ bay 12/06 06:05)                                                    │            │
│  │     R2 Request → Confirm (Tổ bay 12/06 06:32)                                                    │            │
│  │     R3 Request → ⚠ Reject (Tổ bay 12/06 07:20) — Lý do: "Cân bằng tải chưa phù hợp"             │            │
│  │                                                                                                  │            │
│  │ ▸ Các loại tài liệu khác                                                                         │            │
│  │     LS    Load Sheet           ✗ Chưa upload                                                      │            │
│  │     GD    General Declaration  ─ Chưa yêu cầu                                                    │            │
│  │     PM    Passenger Manifest   ─                                                                 │            │
│  │     NOTOC Notification to Captain  ─                                                              │            │
│  │     Cargo Manifest             ─                                                                  │            │
│  │     Mail Manifest              ─                                                                  │            │
│  │     Flight Release             ─ Chưa có (chưa đủ điều kiện release)                            │            │
│  │                                                                                                  │            │
│  │ ▸ [📦 Tải gói hồ sơ tài liệu chuyến]   [cần xác nhận cấu trúc gói]                              │            │
│  └─────────────────────────────────────────────────────────────────────────────────────────────────┘            │
│                                                                                                                  │
│  Quyền xem chi tiết theo vai trò (FUNC-142) — [cần xác nhận ma trận quyền]                                      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

## 4. Danh sách thành phần + trường dữ liệu

### 4.1 Header + Bộ lọc

| Thành phần | Trường / Thực thể |
|---|---|
| Cán bộ tài liệu, ca | `NGUOI_DUNG` (vai_tro = Cán bộ tài liệu), `CA_TRUC` |
| Lọc theo trạng thái tài liệu | `TAI_LIEU_CHUYEN.trang_thai` |
| Lọc "sắp ETD trong N phút" | so `CHUYEN_BAY.etd` với now() |

### 4.2 Cấp 1 — Dashboard tổng quan (FUNC-139)

| Tile | Trường |
|---|---|
| Tổng / Đủ / Thiếu / Đang chờ / Reject | đếm trạng thái `TAI_LIEU_CHUYEN.trang_thai` theo `flight_no` |
| Tổ bay chưa confirm OFP | `[cần xác nhận trường nguồn]` |
| Tổ bay chưa tải xuống | `[cần xác nhận trường nguồn]` |
| OFP còn phiên bản chưa release | `TAI_LIEU_CHUYEN` (doc_type=OFP, `flight_release_time` null) |
| Flight Release chưa có | `TAI_LIEU_CHUYEN.flight_release_time` null |
| Cảnh báo "thiếu TL trước ETD" | so `etd` với danh mục tài liệu chưa đủ |

### 4.3 Cấp 2 — Ma trận tài liệu × chuyến (FUNC-139, FUNC-145)

| Cột | Trường (entity map) |
|---|---|
| FLT NO, STD, DEP, ARR, AC REG | `CHUYEN_BAY` + `TAU_BAY` |
| OFP | `TAI_LIEU_CHUYEN` (doc_type=OFP): trang_thai + `ofp_version` (R1/R2/R3) |
| LS | `TAI_LIEU_CHUYEN` (doc_type=LS): trạng thái Confirmed/Unconfirmed/Reject |
| GD, PM, NOTOC BAG, NOTOC CGO, Cargo Manifest, Mail Manifest | tương tự, từ `TAI_LIEU_CHUYEN.doc_type` + `trang_thai` |
| Flight Release | `TAI_LIEU_CHUYEN.flight_release_time` + `released_by` |

Trạng thái mỗi ô:
- `✓` = `trang_thai = Confirmed`
- `⏳` = `trang_thai = Unconfirmed` (đã upload, chờ tổ bay xác nhận)
- `⚠ Pdg` / `⚠ Reject` = `trang_thai = Reject` hoặc pending xử lý
- `✗` = chưa upload
- `─` = không yêu cầu cho chuyến này `[cần xác nhận quy tắc — FUNC-143]`

### 4.4 Cấp 2 mở rộng — Trạng thái tổ bay (FUNC-145)

| Cột | Trường |
|---|---|
| CREW SYNC | từ nhóm FOS CREW (CREW SYNC) |
| Tổ bay đã confirm OFP | `[cần xác nhận trường nguồn]` — gắn cờ |
| Tổ bay đã tải xuống | `[cần xác nhận trường nguồn]` — gắn cờ |
| Cảnh báo | "ETD còn N' — tổ bay chưa confirm", "Pending/Reject", "Tổ bay lệch sync" |

### 4.5 Cấp 3 — Panel chi tiết tài liệu (slide-out)

| Nhóm | Trường |
|---|---|
| Định danh OFP | `ofp_number` (Lido) + `ofp_version` (TOSS R-codes) + `rev_count` + IS RECLEAR |
| Lịch sử phiên bản (FUNC-141) | bảng các revision: rev, trang_thai, upload_time, confirm_time, released_by, hành động (Tải PDF) |
| Luồng phê duyệt (FUNC-140) | chuỗi Request → Confirm/Reject + dấu thời gian + đối tượng thực hiện + lý do reject |
| Các loại tài liệu khác | từng dòng (LS / GD / PM / NOTOC BAG / NOTOC CGO / Cargo Manifest / Mail Manifest / Flight Release) — trạng thái, upload_time, confirm_time |
| Tải gói hồ sơ | `[cần xác nhận cấu trúc gói]` |

## 5. Tương tác & trạng thái

| Tương tác | Mô tả |
|---|---|
| **Server-push** | Khi có sự kiện tài liệu mới (upload / confirm / reject), cập nhật trực tiếp ô tương ứng + cập nhật tile Cấp 1. |
| **Click ô tài liệu (vd "✓ R2" / "⚠ R3 Reject")** | Mở Panel Cấp 3 và cuộn đến đúng loại tài liệu (FUNC-141). |
| **Click [FLT NO]** | Mở Panel Cấp 3 đầy đủ — phần OFP mặc định mở rộng đầu tiên. |
| **Cảnh báo "thiếu TL trước ETD"** | Khi `etd - now() ≤ ngưỡng [cần SME]` và có ô `✗` / `⏳` / `⚠ Reject` → tile "Cảnh báo thiếu TL trước ETD" tăng + dòng chuyến highlight vàng/đỏ. |
| **Cảnh báo "Reject"** | OFP / LS / GD / PM bị reject → badge `⚠ Reject` + dòng đỏ. Click để xem lý do reject. |
| **Tải gói hồ sơ** (FUNC-141) | Nút `[📦 Tải gói hồ sơ tài liệu chuyến]` → tải file nén/PDF gộp `[cần xác nhận cấu trúc gói]`. |
| **Phân quyền xem** (FUNC-142) | Ẩn/hiện block / cột theo vai trò (`NGUOI_DUNG.vai_tro`); ma trận `[cần xác nhận]`. |
| **Lọc nhanh** | Bộ lọc "Trạng thái tài liệu" multi-select; "Sắp ETD trong N phút" giúp ưu tiên xử lý các chuyến gần ETD. |

## 6. Ghi chú `[cần xác nhận]`

| # | Vấn đề | FUNC | Ảnh hưởng wireframe |
|---|---|---|---|
| 1 | Quy tắc xác định "đã có / chưa có" theo từng loại tài liệu | FUNC-139, FUNC-143 | Mỗi ô có 5 trạng thái (`✓ / ⏳ / ⚠ / ✗ / ─`) — `─` là điểm cờ chính |
| 2 | Trường nguồn "Tổ bay đã confirm OFP" và "Tổ bay đã tải xuống" | FUNC-145 | 2 cột trong khối "Trạng thái tổ bay" đều gắn cờ |
| 3 | Cấu trúc gói hồ sơ tải về | FUNC-141 | Nút "Tải gói hồ sơ" có tooltip cờ |
| 4 | Danh mục vai trò + ma trận quyền xem chi tiết chuyến | FUNC-142 | Ghi chú quyền xem ở cuối Cấp 3 |
| 5 | Ngưỡng "ETD còn bao nhiêu phút" để cảnh báo thiếu TL | (suy ra từ FUNC-143) | Bộ lọc "Sắp ETD trong N phút" — N mặc định 120' minh họa |
| 6 | Danh mục đầy đủ "các loại tài liệu cần thiết" theo từng chuyến (theo Carrier / loại chuyến / sân bay quốc tế) | FUNC-143 | Cột "─" trong ma trận gắn cờ |
| 7 | Lý do reject — có chuẩn hóa danh mục lý do không? | FUNC-140 | Cột "Xem lý do" hiển thị text tự do trong wireframe |
