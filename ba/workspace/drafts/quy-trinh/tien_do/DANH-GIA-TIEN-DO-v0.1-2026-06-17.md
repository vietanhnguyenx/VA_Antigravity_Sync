---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Đánh giá Tiến độ BA"
document_id: "TIEN-DO-001"
next_review: "2026-06-24"
---

# Đánh giá Tiến độ BA — TOSS · v0.1 (2026-06-17)

> Báo cáo tiến độ định kỳ của nhóm BA. Đối chiếu với hai khung tham chiếu: **BA-ROADMAP-v0.1.md** (5 phase) và **Kế hoạch khảo sát TOSS.xlsx** (10 module / 20 ngày / 3 batch). Cập nhật mỗi tuần hoặc sau mỗi đợt khảo sát lớn — tạo file version mới, ghi lịch sử vào `BA-VERSION-LOG.md`.

---

## 1. Khung tham chiếu kép

| Nguồn | Cấu trúc | Tình trạng |
|---|---|---|
| **BA-ROADMAP-v0.1.md** | 5 phase (Discovery → Handoff) | Khung tổng thể — ngày chưa điền |
| **Kế hoạch khảo sát TOSS.xlsx** | 10 module · 20 ngày · 3 batch gối đầu | Kế hoạch chi tiết phỏng vấn — A2: 4 tuần làm việc |

**Map module → phân hệ BRD:**

| Module Kế hoạch | Phân hệ BRD |
|---|---|
| M7 (OCC/Giám sát) | PH1 |
| M8 (Tài liệu chuyến bay) + M9 (Payload) | PH2 |
| M10 (Báo cáo & KPI) | PH3 |
| M2 (Scheduling) + M3 (Crew) + M4 (Tàu bay/Kỹ thuật) + M5 (Sân bay) | PH4 (Master Data) |
| M1 (Tích hợp & dữ liệu dùng chung) | PH5 (Quản trị) |
| M6 (Route/Nhiên liệu) | PH1 + PH2 (cross-cutting) |

---

## 2. Tiến độ khảo sát theo Kế hoạch (20 ngày / 4 tuần)

> Kế hoạch: Batch 1 freeze cuối Tuần 1 → Batch 2 freeze cuối Tuần 2 → Batch 3 freeze cuối Tuần 3 → Chốt baseline cuối Tuần 4.

| Module | Batch | Buổi đã khảo sát | Trạng thái |
|---|---|---|---|
| **M7** — Điều hành chuyến bay / OCC | Critical / Batch 1 | 08/06 · 11/06 chiều · 12/06 sáng · 15/06 | ✅ Đủ |
| **M8** — Tài liệu chuyến bay | Critical / Batch 1 | 11/06 sáng · 11/06 KTKTB · 15/06 | ✅ Đủ — còn OID upload OFP |
| **M9** — Tải trọng / Pax / Cargo | Critical / Batch 1 | *(chưa có buổi với Load Control/DCS/Cargo/PSS)* | ❌ Chưa |
| **M1** — Kiến trúc tích hợp | Critical / Batch 1 | 09/06 (high-level) | 🔄 Sơ bộ |
| **M4** — Tàu bay & Kỹ thuật | High / Batch 2 | 11/06 KTKTB Buổi 2+3 | 🔄 Một phần |
| **M2** — Lập lịch bay | High / Batch 2 | *(chưa)* | ❌ Chưa |
| **M3** — Tổ bay / Crew | High / Batch 2 | *(chưa)* | ❌ Chưa |
| **M5** — Sân bay & ràng buộc | Medium / Batch 2 | 15/06 (A-CDM sơ lược) | ⏳ Rất sơ lược |
| **M6** — Route / Nhiên liệu | High / Batch 3 | 11/06 sáng (Cost Index → out-of-scope) | ⏳ Sơ lược |
| **M10** — Báo cáo & KPI | Medium / Batch 3 | 09/06 · 11/06 KTKTB | 🔄 Một phần |

**Tình trạng batch:**

| Batch | Điều kiện freeze | Tình trạng |
|---|---|---|
| Batch 1 (M7+M8+M9+M1) | Cuối Tuần 1 | ❌ Chưa freeze — M9 chưa khảo sát |
| Batch 2 (M2+M3+M4+M5) | Cuối Tuần 2 | ❌ Chưa — M2/M3 chưa bắt đầu |
| Batch 3 (M6+M10+cross) | Cuối Tuần 3 | ❌ Chưa |

---

## 3. Tiến độ theo BA-ROADMAP (5 phase)

```
Phase 1 — Discovery       ████████████████░░░░░░░  70%
Phase 2 — Phân tích       ██████████████░░░░░░░░░  55%
Phase 3 — Tài liệu hóa   ██████░░░░░░░░░░░░░░░░░  25%
Phase 4 — Review          ░░░░░░░░░░░░░░░░░░░░░░░   0%
Phase 5 — Handoff         ░░░░░░░░░░░░░░░░░░░░░░░   0%
```

| Phase | Đã xong | Còn thiếu |
|---|---|---|
| **Phase 1 · Discovery** | 7 buổi khảo sát · báo cáo M7/M8 đầy đủ · 15+ tài liệu extract · Glossary v0.11 · STAKEHOLDER-REGISTER v0.2 · As-Is Dispatcher SOP §3.1–3.5 | As-Is M9/M2/M3/M5/M6 · chưa có buổi Load Control, Crew, Scheduling |
| **Phase 2 · Phân tích** | BRD v0.7 (176 BR, 5 PH) · PHAN-RA-BRD PH1–PH5 · Subsystem interface map · YCKT 12 sheet | Gap analysis chính thức · To-Be diagram · 50+ OID chưa chốt · Workshop xác nhận BR với VNA chưa diễn ra |
| **Phase 3 · Tài liệu hóa** | BRD + PHAN-RA-BRD draft (workspace/) · Wireframe PH1 monitoring 4 màn · HTML mockup POC 1 màn | Wireframe PH2–PH5 · User Story · SRS chương tổng hợp (01–07) · RTM nội dung · Chưa promote vào sync/ |
| **Phase 4 · Review** | — | Tất cả — `sync/requirements/` hiện chỉ có README |
| **Phase 5 · Handoff** | Word export 7 báo cáo khảo sát | BRD/SRS chưa export Word · DEV handoff chưa bắt đầu |

---

## 4. Ưu tiên hành động

| # | Hành động | Lý do |
|---|---|---|
| **1** | Lên lịch buổi khảo sát **M9** (Load Control/DCS/Cargo/PSS) | Batch 1 chưa thể freeze vì thiếu M9 |
| **2** | Lên lịch **M2** (Scheduling/NetLine) và **M3** (Crew/AVES) | Mở Batch 2 |
| **3** | Workshop chốt **50+ OID** còn mở với SME VNA | Điều kiện hoàn thành Phase 2 |
| **4** | Lập **Gap Analysis** chính thức (dữ liệu cross-reference audit 17/06 có sẵn) | Milestone Phase 2 |
| **5** | Promote **BRD v0.7** vào `sync/requirements/brd/` sau BA Lead review | Mở Phase 4 |

