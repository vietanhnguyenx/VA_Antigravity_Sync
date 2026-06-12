---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.3"
date: "2026-06-11"
status: "Draft"
document_type: "Quy trình — Phân tách Phạm vi & Workflow theo Role"
document_id: "WF-TOSS-001"
---

# Phân tách Phạm vi Công việc & Workflow theo Role — Team BA TOSS

> **Mục đích:** Sắp xếp workflow để chia rõ phạm vi cho từng member theo role, **bám sát kết quả phân rã** (BRD-TOSS-001 → 86 BR → 421 FUNC, 5 phân hệ) **và căn cứ các buổi khảo sát 08/06, 09/06, 11/06**.
>
> **Quyết định nền (BA Lead chốt 2026-06-11):**
> - **Trục phân hệ:** 5 phân hệ sản phẩm (theo BRD/FUNC).
> - **Phương án triển khai:** **THEO GIAI ĐOẠN** — 3 đợt, **thứ tự bám theo: (a) độ ưu tiên khách hàng nêu trong khảo sát, (b) mức độ đã khảo sát đủ để phân tích, (c) phụ thuộc dữ liệu.**
> - **Bố trí nhân sự trong mỗi giai đoạn:** **Lai** — chủ trì dọc theo phân hệ + chuyên gia dùng chung (Data Model, Wireframe/UX).
> - **Workflow nội dung:** P4 — Co-evolution Hybrid.
>
> **Nguyên tắc §0/§0.3:** đề xuất theo cấp role; **gán tên người, phê duyệt, mốc thời gian, chốt ưu tiên** là thẩm quyền BA Lead.

---

## 1. Căn cứ từ các buổi khảo sát (định hình thứ tự giai đoạn)

> Đây là cơ sở quyết định thứ tự — KHÔNG suy diễn, mỗi dòng dẫn nguồn.

| Tín hiệu từ khảo sát | Nguồn | Hệ quả cho giai đoạn |
|---|---|---|
| "Làm tổng quan trước → khung ưu tiên → chi tiết sau" | 08/06 §II.1 | Đã làm (BRD khung → FUNC) |
| Khảo sát chi tiết **bắt đầu từ bộ phận điều phái** | 08/06 §V | PH1 đi **sớm** (đã phỏng vấn dispatcher 11/06) |
| **"Ưu tiên xử lý báo cáo hàng ngày"**; quan trọng nhất là báo cáo lịch bay + báo cáo trực ban trưởng | 08/06 §II.4 | **PH3 Báo cáo ưu tiên CAO** (đẩy lên GĐ2) |
| **BCAO khảo sát rất chi tiết** (2 phần, tab nguồn, danh mục bất thường) | 09/06 §II.7 | PH3 **đã đủ dữ liệu** để phân tích sớm |
| "Danh mục là lớp dữ liệu cơ sở, đồng bộ tự động hàng ngày" | 09/06 §II.1 | PH4 Master Data là **nền tảng** → GĐ1 |
| Mục tiêu cốt lõi = **thay thế FMS** (movement 90%→99%, chính xác 79%) | 08/06 §II.3 | Thu nạp movement (PH5 nền + PH1) là lõi GĐ1 |
| Tách **hai màn giám sát** (trực ban trưởng / cán bộ tài liệu) | 08/06 §II.2 | Thuộc PH1 — GĐ1 |
| **Chờ buổi khảo sát chuyên đề luồng tài liệu + điện văn ACARS** | 09/06 §II.3, §V | PH2 Tài liệu **bị chặn một phần** → lùi GĐ3 |
| Logic từng báo cáo "chỉ mô tả kỹ khi có số liệu thật" | 08/06 §IV | PH3 phân tích **song song đối chiếu số liệu thật** |
| Giao diện trạng thái **TOSS↔MO Plus chưa rõ** | 11/06 §II.2 | PH2 phụ thuộc làm rõ MO Plus → lùi GĐ3 |
| Hạ tầng: thông kết nối trước **30/06/2026** | 08/06 §II.7 | PH5 nền tích hợp phải xong sớm (GĐ1) |

### 1.1 Mức độ sẵn sàng khảo sát (để biết phân hệ nào phân tích được ngay)

| Phân hệ | Đã khảo sát | Mức sẵn sàng | Còn chờ |
|---|---|---|---|
| PH4 Master Data | 09/06 §1,5,6 (menu, tàu bay, sân bay) | ●●● Khá đủ | Damp Lease, danh mục dịch vụ sân bay |
| PH1 Điều hành chuyến bay | 08/06 §2,3,6 + 09/06 + 11/06 (dispatcher) | ●●● Khá đủ | Cờ mở (VMA, Lotang, NOTAM); dispatcher phần 2 |
| PH3 Báo cáo & tối ưu | 09/06 §7 (BCAO rất chi tiết) + §8 | ●●● Khá đủ | Logic báo cáo cần số liệu thật; danh mục nguyên nhân |
| PH5 Quản trị hệ thống | 09/06 §2 (phân quyền) + YCKT | ●● Một phần | Chi tiết tích hợp ~40 hệ thống (buổi chuyên đề) |
| PH2 Tài liệu chuyến bay | 09/06 §3,4 + 11/06 (Dispatch Release) | ●● Một phần | **Buổi chuyên đề luồng tài liệu + ACARS (chưa diễn ra)**; giao diện MO Plus |

> **Kết luận:** PH4, PH1, PH3 đã đủ dữ liệu để phân tích; PH2 và phần tích hợp PH5 còn chờ khảo sát chuyên đề → xếp sau.

---

## 2. Đồng bộ trục phân hệ — Ánh xạ 7 cũ → 5 mới

| Trục cũ (7 phân hệ nghiệp vụ) | Thuộc về phân hệ sản phẩm (5) |
|---|---|
| 3.1 Quản lý Khai thác Bay | → PH1 + PH2 |
| 3.2 Quản lý Tổ bay | → PH1 (thông tin tổ bay) + PH4 (danh mục) |
| 3.3 Bảo dưỡng & Kỹ thuật Tàu bay | → PH1 (hiển thị MEL/AOG) + PH4 (Master MEL, AMOS) |
| 3.4 Khai thác Mặt đất | → PH1 (cột mốc sân bay) + PH4 (dịch vụ sân bay) |
| 3.5 An toàn & Tuân thủ | → PH5 + rải PH1/PH3 |
| 3.6 Báo cáo & Thống kê | → PH3 |
| 3.7 Master Data | → PH4 |
| *(mới)* | → PH5 Quản trị hệ thống (IAM, tích hợp ~40 hệ thống, NFR) |

---

## 3. Gói phạm vi theo phân hệ (Scope Package)

| Phân hệ | Mã | Dải BR | Số BR | Số FUNC | Tải |
|---|---|---|---|---|---|
| PH1 — Điều hành chuyến bay | 3.1 | BR-101…119 | 19 | 88 | ●●●● Cao |
| PH2 — Tài liệu chuyến bay | 3.2 | BR-201…217 | 17 | 75 | ●●● TB-cao |
| PH3 — Báo cáo, đánh giá tối ưu | 3.3 | BR-301…316 | 16 | 72 | ●●● TB |
| PH4 — Danh mục (Master Data) | 3.4 | BR-401…416 | 16 | 73 | ●●● TB |
| PH5 — Quản trị hệ thống | 3.5 | BR-501…518 | 18 | 113 (84F+29NF) | ●●●●● Rất cao |
| **Tổng** | | | **86** | **421** | |

---

## 4. Lộ trình triển khai theo GIAI ĐOẠN (đã hiệu chỉnh theo khảo sát)

### Giai đoạn 1 — Nền tảng dữ liệu & Lõi điều hành

| Mục | Nội dung |
|---|---|
| **Phân hệ trong đợt** | **PH4 Master Data** (lớp dữ liệu cơ sở) · **PH1 Điều hành chuyến bay** (lõi + 2 màn giám sát) · **PH5 phần nền** (IAM/RBAC BR-501…509; API Gateway + nền tảng dữ liệu BR-510/513/514; thu nạp movement thay FMS) |
| **Căn cứ khảo sát** | Danh mục = lớp cơ sở đồng bộ hàng ngày (09/06 §1); khảo sát chi tiết bắt đầu từ điều phái (08/06 §V); mục tiêu cốt lõi thay FMS (08/06 §3); 2 màn giám sát (08/06 §2); hạ tầng/tích hợp trước 30/06 (08/06 §7) |
| **FUNC trọng tâm** | PH4 (73) + PH1 (88) + PH5 nền (~30) |
| **Exit** | ERD lõi duyệt; SRS nháp PH4 + PH1; khung IAM/RBAC + khung tích hợp chốt; **làm rõ cờ PH1 với SME** (VMA, Lotang, NOTAM, METAR/SPECI); luồng movement thay FMS thông |

### Giai đoạn 2 — Báo cáo & Giám sát (ưu tiên lãnh đạo)

| Mục | Nội dung |
|---|---|
| **Phân hệ trong đợt** | **PH3 Báo cáo & tối ưu** (BCAO số hóa, OTP/OSP, nhiên liệu, giám sát dữ liệu) · **PH5 tích hợp nguồn dữ liệu báo cáo** (DWH/Lakehouse) |
| **Căn cứ khảo sát** | **"Ưu tiên xử lý báo cáo hàng ngày"** (08/06 §4); BCAO đã khảo sát rất chi tiết (09/06 §7); quản lý mục tiêu OTP/OSP (09/06 §8). Chạy ngay sau khi PH1/PH4 (GĐ1) cấp dữ liệu |
| **FUNC trọng tâm** | PH3 (72) + PH5 tích hợp báo cáo |
| **Lưu ý** | Logic chi tiết từng báo cáo cần **số liệu thật** (08/06 §IV) → vừa phân tích vừa đối chiếu; danh mục nguyên nhân bất thường làm rõ với SME |
| **Exit** | SRS nháp PH3; BCAO số hóa 2 phần + tab nguồn; danh mục nguyên nhân chốt; chỉ số OTP/OSP tính tự động |

### Giai đoạn 3 — Tài liệu/Dispatch & Hoàn thiện nền tảng

| Mục | Nội dung |
|---|---|
| **Phân hệ trong đợt** | **PH2 Tài liệu chuyến bay** (Dispatch Release → Captain's Release, versioning, LS/GD/PM/NOTOC) · **PH5 còn lại** (tích hợp dispatch Lido/MO Plus/ACARS/NOTAM/WX; NFR/HA/compliance BR-512/515…518) |
| **Căn cứ khảo sát** | PH2 **chờ buổi khảo sát chuyên đề luồng tài liệu + ACARS** (09/06 §3, §V) và **làm rõ giao diện MO Plus** (11/06 §2) → xếp sau khi đã có dữ liệu khảo sát; NFR/tuân thủ chốt cuối trước handoff |
| **FUNC trọng tâm** | PH2 (75) + PH5 còn lại (tích hợp + 29 NFR) |
| **Exit** | SRS nháp PH2; giao diện TOSS↔MO Plus làm rõ với đối tác; **RTM toàn hệ thống**; compliance trace (ND 53/2022, ND 13/2023) hoàn tất |

> **ĐIỂM CẦN BA LEAD CHỐT — thứ tự PH2 vs PH3:** Đề xuất đặt **PH3 trước PH2** vì (a) khách hàng nêu rõ ưu tiên báo cáo hàng ngày, (b) BCAO đã khảo sát đủ, (c) PH2 còn chờ workshop chuyên đề. **Tuy nhiên** Dispatch Release là pain point lớn của dispatcher (11/06) — nếu BA Lead đánh giá Dispatch Release ưu tiên hơn báo cáo, có thể **hoán đổi GĐ2 ↔ GĐ3** (nhưng phải đẩy nhanh buổi khảo sát chuyên đề luồng tài liệu trước).
>
> **Mốc thời gian:** *(BA Lead gắn theo project schedule; giữ ràng buộc thông kết nối trước 30/06/2026 — 08/06 §7).*
> **Chồng lấn:** đội đủ người → GĐ chồng lấn; đội nhỏ → tuần tự.
> **Lưu ý P4 co-evolution:** khảo sát vẫn đang tiếp diễn (dispatcher phần 2, luồng tài liệu, tổ bay/kỹ thuật/mặt đất chưa khảo sát chi tiết) → sản xuất SRS chạy song song khảo sát bổ sung; phân hệ nào đủ dữ liệu thì làm trước.

---

## 5. Bố trí nhân sự theo giai đoạn — Mô hình Lai

### 5.1 Chủ trì dọc (kích hoạt theo giai đoạn đã hiệu chỉnh)

| Phân hệ | Kích hoạt ở | Cấp role đề xuất — Chủ trì | Hỗ trợ | Tên (BA Lead điền) |
|---|---|---|---|---|
| PH4 — Master Data | **GĐ1** | Senior BA (kiêm Chuyên gia Data Model) | Mid BA | Chủ trì: ___ · Hỗ trợ: ___ |
| PH1 — Điều hành chuyến bay | **GĐ1** | Senior BA (lõi, nhiều SME) | Mid BA | Chủ trì: ___ · Hỗ trợ: ___ |
| PH3 — Báo cáo & tối ưu | **GĐ2** | Mid BA (BCAO đã khảo sát) | Junior BA | Chủ trì: ___ · Hỗ trợ: ___ |
| PH2 — Tài liệu chuyến bay | **GĐ3** | Senior/Mid BA (dep MO Plus) | Junior BA | Chủ trì: ___ · Hỗ trợ: ___ |
| PH5 — Quản trị hệ thống | **GĐ1→2→3** (cắt nhỏ) | Senior BA (phối hợp SA/Dev) | Mid BA + BA Lead sát | Chủ trì: ___ · Hỗ trợ: ___ |

### 5.2 Chuyên gia dùng chung (xuyên suốt)

| Vai trò | Phạm vi | Cấp role | Sản phẩm | Tên |
|---|---|---|---|---|
| **Chuyên gia Data Model** | ERD toàn hệ thống; front-load GĐ1 (neo PH4) | Senior BA | `ba/sync/models/` | ___ |
| **Chuyên gia Wireframe/UX** | Wireframe + mockup nhất quán cho phân hệ đang mở | Mid BA + `gen-mockup` | `drafts/wireframe/` + `mockup/` | ___ |
| **(Tùy chọn) Chuyên gia Tích hợp** | Bản đồ tích hợp ~40 hệ thống; bận nhất GĐ3 | Senior BA (neo PH5) | `sync/models/subsystem-interface-map` | ___ |

---

## 6. Workflow P4 — chuỗi công đoạn trong mỗi phân hệ

| # | Công đoạn | Chủ trì (R) | Tư vấn (C) | Duyệt (A) | Đầu ra |
|---|---|---|---|---|---|
| S0 | **Đã xong** — Phân rã FUNC | (đã có) | — | BA Lead | `PHAN-RA-BRD-PH{n}-*.md` |
| S1 | Làm rõ cờ `[cần xác nhận]` với SME | Chủ trì phân hệ | SME, BA Lead | BA Lead | FUNC + glossary cập nhật |
| S2 | Phân rã **UC / User Story + AC** | Chủ trì phân hệ | Hỗ trợ | BA Lead | `US-*`, `UC-*` |
| S3a | **Data model / ERD** (∥ S3b) | Chuyên gia Data Model | Chủ trì phân hệ | BA Lead | `sync/models/` ERD |
| S3b | **Wireframe** (∥ S3a) | Chuyên gia Wireframe | Chủ trì phân hệ | BA Lead | `drafts/wireframe/PH{n}/` |
| S4 | **Mockup** (`gen-mockup`) | Chuyên gia Wireframe | Chủ trì phân hệ | BA Lead | `drafts/mockup/PH{n}/` |
| S5 | Tổng hợp **SRS phân hệ** | Chủ trì phân hệ | Hỗ trợ | BA Lead | `drafts/srs/PH{n}` |
| S6 | **Review + RTM** | BA Lead | `ba-reviewer` | BA Lead | RTM, status→Approved |
| S7 | Publish `sync/` + Export Word QT02 | Chủ trì/Senior | — | BA Lead ký | `sync/requirements/srs/` + `.docx` |

> Cổng `drafts/` → `sync/` cần BA Lead **Approve**; sửa sau Approve phải tạo NKLR (`CHANGE-CONTROL-SOP`, `QUALITY-GATE`).

---

## 7. Sơ đồ lộ trình theo giai đoạn (đã hiệu chỉnh)

```
 GIAI ĐOẠN 1 (Nền tảng & Lõi)    GIAI ĐOẠN 2 (Báo cáo & Giám sát)   GIAI ĐOẠN 3 (Tài liệu & Hoàn thiện)
 ┌───────────────────────────┐  ┌──────────────────────────────┐   ┌────────────────────────────────┐
 │ PH4 Master Data (ERD)     │  │ PH3 Báo cáo (BCAO, OTP/OSP,    │   │ PH2 Tài liệu chuyến bay         │
 │ PH1 Điều hành chuyến bay  │─►│  nhiên liệu, giám sát dữ liệu) │──►│  (Dispatch→Captain Release)     │
 │ PH5 nền (IAM+khung tích   │  │ PH5 tích hợp DWH/báo cáo       │   │  [sau workshop luồng tài liệu]  │
 │  hợp+thu nạp movement)    │  │                                │   │ PH5 còn lại (tích hợp dispatch  │
 │ [thay FMS]                │  │ [ưu tiên lãnh đạo - 08/06 §4]  │   │  + NFR/HA/compliance) + RTM     │
 └───────────────────────────┘  └──────────────────────────────┘   └────────────────────────────────┘
   ▲ Data Model & Wireframe/UX (chuyên gia dùng chung) — xuyên suốt 3 giai đoạn ▲
                         ▲ BA Lead: review + approve + SME + RTM ▲
  (PH2 vs PH3 có thể hoán đổi nếu BA Lead ưu tiên Dispatch Release hơn — xem §4)
```

---

## 8. Cân tải theo đội hình × giai đoạn

> Đội hình thực tế **chưa đọc được từ git** (repo private; collaborator chưa commit; `gh`/token chưa có). BA Lead bổ sung danh sách.

| Đội hình | Cách chạy giai đoạn |
|---|---|
| **Lead + 1 Senior + 1–2 Mid** (nhỏ) | Tuần tự. GĐ1: Senior PH1 + Data Model, Mid PH4 + PH5 nền. GĐ2: dồn lực PH3. GĐ3: PH2 + NFR. |
| **Lead + 2 Senior + 2 Mid (+Jr/Intern)** (vừa) | GĐ1–2 chồng lấn: Senior A PH1, Senior B PH4+PH5 nền; Mid mở PH3 khi GĐ1 đủ chín. GĐ3 mở PH2. Jr/Intern: domain research, ghi chép, wireframe. |
| **Chỉ Lead + 1–2 người** (tối thiểu) | Tuần tự, mỗi GĐ chỉ phân hệ ưu tiên cao nhất: GĐ1 PH1+PH4, GĐ2 PH3 (BCAO), GĐ3 PH2; PH5 chỉ phần bắt buộc. |

---

## 9. Việc cần BA Lead quyết / bổ sung

| # | Nội dung | Trạng thái |
|---|---|---|
| 1 | **Chốt thứ tự PH3 vs PH2** (đề xuất PH3 trước; hoán đổi nếu ưu tiên Dispatch Release) | *(chờ BA Lead)* |
| 2 | **Đẩy lịch buổi khảo sát chuyên đề luồng tài liệu + ACARS** (gỡ chặn PH2) | *(chờ BA Lead)* |
| 3 | Gắn **mốc thời gian** từng giai đoạn (ràng buộc 30/06/2026) | *(chờ BA Lead)* |
| 4 | Bổ sung **danh sách member** (hoặc cấp `gh`/token đọc collaborator) | *(chờ BA Lead)* |
| 5 | Gán **tên người** §5.1, §5.2 + chọn kịch bản đội hình §8 | *(chờ BA Lead)* |
| 6 | Duyệt ánh xạ §2 → cập nhật `PHAN-CONG-ROLE-BA-v0.1.md §3` | *(chờ BA Lead)* |

---

## 10. Liên kết tài liệu

- Khảo sát: `bao-cao-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.1.md`, `…-09062026-v0.1.md`, `…-11062026-buoi-sang-v0.1.md` (11/06 đã gộp Phần 1+2).
- BRD (bản hiện hành): `brd/BRD-TOSS-001-khung-v0.3.md` (158 BR; v0.1/v0.2 là lịch sử) · Phân rã FUNC: `srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH{1..5}-*-v0.2.md` (theo BR của v0.2; 53 BR bottom-up mới của v0.3 chưa phân rã).
- Phân công Role: `PHAN-CONG-ROLE-BA-v0.1.md` (§3/§6 cập nhật theo tài liệu này).
- Lộ trình BA: `BA-ROADMAP-v0.1.md` · Chất lượng: `QUALITY-GATE-v0.1.md`, `REVIEW-APPROVAL-FLOW-v0.1.md`, `CHANGE-CONTROL-SOP-v0.1.md`.
- Workflow P4: `.claude/knowledge/ba-workflow-patterns.md §P4`.

---

*WF-TOSS-001 v0.3 — 2026-06-11. Hiệu chỉnh thứ tự giai đoạn theo căn cứ khảo sát 08/06, 09/06, 11/06: PH4+PH1 (nền tảng+lõi, GĐ1) → PH3 Báo cáo (ưu tiên lãnh đạo, đã khảo sát đủ, GĐ2) → PH2 Tài liệu (chờ workshop chuyên đề, GĐ3); PH5 cắt nhỏ trải 3 GĐ. Thứ tự PH2/PH3 và mốc thời gian chờ BA Lead chốt (§0, §0.1, §0.3).*
*v0.2 — 2026-06-11: phương án theo giai đoạn (3 đợt) lần đầu (PH2 GĐ2, PH3 GĐ3 — đã sửa ở v0.3).*
*v0.1 — 2026-06-11: mô hình Lai song song 5 phân hệ.*
