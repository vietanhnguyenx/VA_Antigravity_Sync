---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-17"
status: "Draft"
document_type: "Đánh giá Tiến độ BA"
document_id: "TIEN-DO-001"
next_review: "2026-06-24"
---

# Đánh giá Tiến độ BA — TOSS · v0.2 (2026-06-17)

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
Phase 2 — Phân tích       ███████████████░░░░░░░░  60%
Phase 3 — Tài liệu hóa   ██████░░░░░░░░░░░░░░░░░  25%
Phase 4 — Review          ░░░░░░░░░░░░░░░░░░░░░░░   0%
Phase 5 — Handoff         ░░░░░░░░░░░░░░░░░░░░░░░   0%
```

| Phase | Đã xong | Còn thiếu |
|---|---|---|
| **Phase 1 · Discovery** | 7 buổi khảo sát · báo cáo M7/M8 đầy đủ · 15+ tài liệu extract · Glossary v0.11 · STAKEHOLDER-REGISTER v0.2 · As-Is Dispatcher SOP §3.1–3.5 | As-Is M9/M2/M3/M5/M6 · chưa có buổi Load Control, Crew, Scheduling |
| **Phase 2 · Phân tích** | BRD v0.12 (337 BR, 5 PH) · PHAN-RA-BRD PH1–PH5 · Subsystem interface map · YCKT 12 sheet · **S1b To-Be Process Models PH1–PH5 hoàn thành (5 file)** | Gap analysis chính thức · 50+ OID chưa chốt · Workshop xác nhận BR và TOBE với VNA chưa diễn ra · 16 FUNC PH3 + 9 nhóm PH5 chờ workshop |
| **Phase 3 · Tài liệu hóa** | BRD + PHAN-RA-BRD draft (workspace/) · Wireframe PH1 monitoring 4 màn · HTML mockup POC 1 màn · TOBE PH1–PH5 (sync/models/) | Wireframe PH2–PH5 · User Story · SRS chương tổng hợp (01–07) · RTM nội dung · Chưa promote BRD/PHAN-RA vào sync/ |
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
| **5** | Promote **BRD v0.12** vào `sync/requirements/brd/` sau BA Lead review | Mở Phase 4 |

---

## 5. Ghi nhận phiên 2026-06-17 (S1b)

> Mục này ghi nhận hoạt động đã hoàn thành trong phiên — không thêm task mới, không thay đổi quyết định, không tự promote trạng thái (CLAUDE.md §0 / §0.3 / §0.5).

**Đã hoàn thành:**
1. **BRD §8 bổ sung cột "To-Be model"** — bump v0.11 → v0.12. Cột mới liên kết BP-001…BP-015 sang các file `TOBE-PHn-*.md` trong `ba/sync/models/`. PH1 trỏ file hiện hành; PH2/PH3/PH4/PH5 ban đầu ghi *(đang tạo)*, nay đã có file (nguồn: `ba/workspace/drafts/brd/BRD-TOSS-001-khung-v0.12.md`; BA-VERSION-LOG dòng v0.12).
2. **S1b — To-Be Process Models cho 4 phân hệ mới** (status=`Draft` toàn bộ):
   - `ba/sync/models/TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md` — 8 sơ đồ (BP-006/007/008/011/012/013/014/015).
   - `ba/sync/models/TOBE-PH3-bao-cao-toi-uu-v0.1.md` — 3 sơ đồ (BCAO / OTP-OSP / Nhiên liệu) + 16 FUNC chờ.
   - `ba/sync/models/TOBE-PH4-quan-ly-danh-muc-v0.1.md` — 8 sơ đồ (Aircraft Master / Airport / Route / BP-005 / PF / Versioning).
   - `ba/sync/models/TOBE-PH5-quan-tri-he-thong-v0.1.md` — IAM/RBAC + Movement + Bản đồ tích hợp + 9 nhóm chờ workshop.
   - File đã có trước phiên: `ba/sync/models/TOBE-PH1-OCC-DISPATCH-v0.1.md`.
   - Đã liệt kê trong `ba/sync/models/INDEX.md` (dòng 7–11).
3. **Pipeline `PHAN-TACH-PHAM-VI-WORKFLOW` v0.4 → v0.5** — bổ sung bước **S1b** giữa S1 và S2; `PIPELINE-AGENT` cập nhật trigger Agent 4 (`process-modeler`).
4. **Agent definitions** — `business-analyst`, `ba-reviewer`, `ba-interviewer`, `process-modeler` thêm quy trình tra cứu `toss-glossary` trước khi soạn thảo.

**Tracker `ba/sync/models/deliverable-status.json` đã cập nhật** (v0.1 → v0.2): bổ sung BRD-TOSS-001 (v0.12) + TOBE-PH1…PH5; tất cả `passes:false` vì còn ở `Draft`, chưa qua `ba-reviewer` + `requirement-validator`, chưa workshop xác nhận với SME VNA.

**Không thay đổi (giữ chờ quyết định BA Lead):**
- Trạng thái batch (Batch 1 vẫn chưa freeze).
- Lịch khảo sát M9/M2/M3 (chưa lên lịch).
- Promote BRD/TOBE vào `sync/requirements/` (chờ review).

---

## 6. Bàn giao tiến độ — phiên kế tiếp

- **Vừa xong:** S1b — 4 file TOBE-PH2/3/4/5 ở `Draft`; BRD bump v0.12 thêm cột To-Be model §8; pipeline workflow lên v0.5 chèn bước S1b; 4 agent definitions thêm quy trình tra `toss-glossary`. (nguồn: §5 trên + `BA-VERSION-LOG.md` BRD v0.12 + `ba/sync/models/INDEX.md`:7–11)
- **Đang dở:** TOBE-PH3 còn 16 FUNC chờ mô hình hóa; TOBE-PH5 còn 9 nhóm chờ workshop M1. Tất cả TOBE-PHn chưa qua `ba-reviewer` + `requirement-validator`. BRD v0.12 cột mới §8 chưa review.
- **Việc tiếp theo đề xuất (ưu tiên cao nhất):** Workshop chốt OID còn mở với SME VNA (Ưu tiên #3 §4) — tiền đề để vừa xác nhận BR vừa khóa các nhánh TOBE còn để mở.
- **Quyết định đang chờ BA Lead:** (a) Lịch khảo sát M9/M2/M3 mở Batch 1+2; (b) Promote BRD v0.12 vào `sync/requirements/brd/`; (c) Có chuyển TOBE-PH1…PH5 sang Review trong tuần này không.

