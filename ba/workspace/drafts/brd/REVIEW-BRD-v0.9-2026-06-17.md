---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
reviewer: "ba-reviewer (Agent 2)"
date: "2026-06-17"
status: "Chờ Agent 3"
document_type: "Review BRD"
artifacts_reviewed:
  - BRD-TOSS-001-khung-v0.9.md
  - BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.5.md
  - BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.4.md
  - BRD-TOSS-PH3-bao-cao-toi-uu-v0.3.md
  - BRD-TOSS-PH4-quan-ly-danh-muc-v0.3.md
  - BRD-TOSS-PH5-quan-tri-he-thong-v0.3.md
glossary_version: "v0.1"
---

# Báo cáo Review BRD — TOSS v0.9 (Hướng B viết lại)

**Ngày review:** 2026-06-17 | **Tổng phát hiện:** 31 (Critical: 6 · Major: 11 · Minor: 9 · Info: 5)

---

## A. Tóm tắt

| Mức | Số phát hiện |
|---|---|
| 🔴 Critical | 6 |
| 🟠 Major | 11 |
| 🟡 Minor | 9 |
| ℹ️ Info | 5 |

**Khuyến nghị:** ⚠️ **Revise (sửa)** — bộ tài liệu có chất lượng nội dung tốt, viết lại đúng tinh thần "trung thực với nguồn", song có một số mâu thuẫn số liệu giữa khung và 5 PHn và chồng lấn sở hữu PH3 ↔ PH4 (Performance Factor), PH1 ↔ PH5 (UI conventions / phân quyền) cần xử lý trước khi Agent 3 phân rã FUNC.

---

## B. Điểm mạnh

1. **Tuân thủ §0 (CLAUDE.md) rất tốt** — gần như mọi BR đều có cột Nguồn (file:mục) cụ thể; phần ghi chú "cờ chưa rõ" đều trỏ về OID-TOSS-001 không còn `[cần xác nhận]` inline.
2. **Tách atomic đúng tinh thần BRD** — BR-110a…BR-110f (PH1), BR-160…BR-176 (Dispatch Release/Unrelease) tách mỗi ý một BR.
3. **Nhóm chủ đề rõ trong từng PH** — PH1 chia §7.1.1…§7.1.8, PH3 chia 12 nhóm §7.3.1–§7.3.12, PH4 chia 11 nhóm A–K, PH5 chia 8 nhóm A–H.
4. **Định nghĩa phạm vi In-scope / Out-of-scope dứt khoát** ở khung §5.2 (13 mục Out-of-scope với nguồn) — tránh scope creep.
5. **Phần Constraints §9.2 (khung)** rất chắc về UI/UX — phục vụ Agent 3 dựng tiêu chuẩn FE nhất quán.

---

## C. Chi tiết vấn đề

### 🔴 CRITICAL — bắt buộc sửa trước Agent 3

**C1 · Mâu thuẫn số BR giữa khung và PHn**
Khung §7 ghi `PH1=55, PH2=28, PH3=34, PH4=32, PH5=29; Tổng=178` (số phiên bản cũ). Thực tế file hiện hành: PH1=76, PH2=56, PH3=66, PH4=73, PH5=55. Tổng thật ~326 — sai lệch 148 BR.
**Sửa:** Bump khung → v0.10, cập nhật §7 bảng PHn và §7.6 đúng số thực tế.

**C2 · Link sai phiên bản trong khung §5.1 và §7**
Khung v0.9 link đến `…PH1-…-v0.4.md`, `…PH2-…-v0.3.md`, `…PH3-…-v0.2.md`, `…PH4-…-v0.2.md`, `…PH5-…-v0.2.md`. Thực tế file là v0.5 / v0.4 / v0.3 / v0.3 / v0.3 (đã xóa phiên bản cũ). Người dùng/agent đi theo link sẽ 404.
**Sửa:** Sửa toàn bộ link trong khung v0.9 sang đúng tên file hiện tại, đồng bộ với INDEX.md.

**C3 · PH3 ↔ PH4 trùng sở hữu Performance Factor Reports**
PH4 BR-431 viết "*sinh báo cáo PF Comparison, PF Trend by AC Type, PF Trend by AC Reg, PF Data Coverage*". PH3 §7.3.9 đã sở hữu chính bốn báo cáo này (BR-351, 352, 353, 354).
**Sửa:** PH4 BR-431 rút gọn còn "quản lý dữ liệu PF + lịch sử cập nhật + cảnh báo tàu thiếu PF"; trỏ chéo "Báo cáo PF: xem PH3 §7.3.9".

**C4 · PH3 BR-324 ↔ PH4 BR-422 trùng owner Category (Fleet Grouping)**
Cả hai dùng động từ "định nghĩa" → trùng owner.
**Sửa:** PH3 BR-324 → "phải **tiêu thụ Category** do PH4 BR-422 quản lý; mỗi báo cáo chọn Category để phân nhóm".

**C5 · PH1 tích hợp NOTAM/WX/A-CDM/ACARS chồng PH5 BR-528/BR-530**
PH1 BR-118/119/180 nói "tích hợp" — PH5 cũng nói "tích hợp" — không rõ ai owner data contract, ai owner business rule.
**Sửa:** PH5 = kênh tích hợp (data contract, transport, retry). PH1 = logic nghiệp vụ tiêu thụ. PH1 BR-118/119/180 sửa: "phải **sử dụng dữ liệu NOTAM/WX/A-CDM** do PH5 BR-528 tích hợp để sinh cảnh báo…".

**C6 · OID references trỏ mã không tồn tại hoặc trùng**
- PH1 BR-119 trỏ SME-42/SME-43 — trùng nghĩa với SME-04 và SME-06/07 trong sổ.
- PH4 BR-425 ghi "*(xem OID mới cần bổ sung)*" — chưa có mã chính thức.
**Sửa:** (a) Rà soát toàn bộ trỏ OID trong 5 PHn, đối chiếu sổ v0.12. (b) Gộp SME-42/43 ↔ SME-04/06/07 nếu trùng nghĩa. (c) Đặt mã SME-44 cho "định dạng thứ ba MEL Airbus" tại PH4 BR-425.

---

### 🟠 MAJOR

| # | Vị trí | Vấn đề | Đề xuất |
|---|---|---|---|
| M1 | PH4 BR-425/426 ↔ PH2 BR-242/243/244 | Trùng sở hữu MEL Authoring Tool (cùng nguồn KS 11/06 KTKTB §1) | PH4 = master MEL data; PH2 = tài liệu MEL phát hành. Xóa PH4 BR-425/426 hoặc chuyển hẳn về PH2. |
| M2 | PH5 BR-528 | Atomic violation nặng: ~22 hệ thống trong 1 BR — không testable | Tách 7–10 BR theo nhóm chức năng tích hợp |
| M3 | PH5 BR-530 | 7 nguồn (AMOS, QAR, ACARS, A-CDM, AIJS, Logitech/GDTN, ICON) + 3 cờ OID trong 1 BR | Tách 7 BR atomic |
| M4 | PH1 BR-143 ↔ PH5 BR-517/518 | Quy ước giao diện chung toàn hệ thống xuất hiện cả ở PH1 và PH5 | Xóa BR-143 khỏi PH1; chỉ giữ tham chiếu "xem PH5 BR-517/518" |
| M5 | PH1 BR-102 ↔ PH3 BR-309 ↔ PH5 BR-507 | Lưu cấu hình hiển thị cột cá nhân xuất hiện 3 lần | Owner = PH5 BR-507; PH1/PH3 chỉ trỏ chéo |
| M6 | PH1 BR-141 ↔ PH5 BR-501/502/503 | Phân quyền 2 lớp + switch view khai báo 2 lần | PH1 BR-141 sửa thành "áp dụng khung RBAC PH5 BR-501–503 cho màn Giám sát" |
| M7 | PH2 BR-235 ↔ PH5 BR-542 | Sandbox/test mode và đồng bộ TEST↔PROD trùng phạm vi | PH5 BR-542 = owner; PH2 BR-235 trở thành "kế thừa PH5 BR-542 cho riêng module NOTOC" |
| M8 | PH4 BR-419 | "Quản lý lịch bảo dưỡng + AOG" vi phạm Out-of-scope #3 (AMOS owner) | Sửa: "đồng bộ và lưu hiện trạng từ AMOS; sinh cảnh báo sắp hết FC". Không nói "quản lý". |
| M9 | PH2 BR-247 ↔ PH4 BR-472 | Service Order tự động đọc email LIDO trùng ở 2 phân hệ | Owner = PH4; xóa khỏi PH2 hoặc giữ tham chiếu |
| M10 | PH4 Nhóm K (BR-470/471/473) | "Quản lý phần mềm tàu bay + SkyOffice + công việc KTKTB" không phải master data | Chuyển Nhóm K sang PH2 hoặc tạo PH2-KTKTB |
| M11 | PH3 BR-321 (4 KPI OTP/OSP) | Chưa testable — định nghĩa 4 KPI chưa có (OID KS-48 chưa chốt) | Nâng RISK; Agent 3 không phân rã FUNC cho BR này khi OID KS-48 chưa xong. Workshop SME cần ưu tiên. |

---

### 🟡 MINOR

| # | Vị trí | Vấn đề | Đề xuất |
|---|---|---|---|
| m1 | PH1 BR-110b | Ghép 2 ý: khuyến nghị Taxi Out + ghi nhận Cost Index out-of-scope | BR-110b chỉ giữ ý Taxi Out; câu Cost Index đã có ở §5.2 #9 |
| m2 | PH1 §7.1.7 (Tích hợp ACARS + A-CDM) | Nội dung integration thuộc PH5, không phải logic nghiệp vụ | BR-180/181/182 → PH5; BR-183/184 (cảnh báo Phase Trigger) giữ PH1 |
| m3 | PH3 BR-304 | NFR hành vi (cảnh báo hiệu năng khi khoảng thời gian dài) đặt trong Functional | Đặt BR-304 loại NFR hoặc chuyển vào §9.2 khung |
| m4 | PH4 BR-409 (Damp Lease) | Định nghĩa "bên đi thuê chỉ phụ trách phần nhiên liệu" không có nguồn rõ — suy diễn nhẹ | Rút gọn: "biến thể Damp Lease *(xem OID: SME-10)*" |
| m5 | PH2 BR-219/220 (Bot AOS + tài khoản ca) | Thuộc IAM/RBAC → PH5 owner | Chuyển BR-219/220 sang PH5; PH2 trỏ chéo |
| m6 | PH3 BR-310 (API FOS) ↔ PH5 BR-531 | Trùng API ra | Owner = PH5; PH3 trỏ chéo |
| m7 | PH3 BR-308 ↔ PH4 BR-465 ↔ PH5 BR-537 | Danh sách email nhận báo cáo xuất hiện 3 lần | Owner = PH5 BR-537; xóa PH3 BR-308 và PH4 BR-465 |
| m8 | PH5 BR-529 (cam kết 10 giao tiếp không tính phí) | Cam kết hợp đồng/SOW — không phải yêu cầu hệ thống | Chuyển vào §9 Constraints của khung |
| m9 | Khung §6.1 Ma trận RACI | Chỉ có 1 câu "(xem OID: DEC-06 — chưa có)" — trống | Nâng OID DEC-06 lên ưu tiên cao; Agent 3 cần RACI để phân vai FR |

---

### ℹ️ INFO

| # | Gợi ý |
|---|---|
| I1 | Các BR chưa map ngược về OBJ-00x. Agent 3 sẽ phải tự dò. Gợi ý thêm cột "OBJ" hoặc ghi `→ OBJ-003` ở cuối BR có map. |
| I2 | PH1 BR-101 rất rộng (danh sách chuyến hợp nhất kế hoạch/dự kiến/thực tế + tàu/cabin/WX/NOTAM/tổ bay/PAX/hàng hóa/doanh thu/chi phí) — có yếu tố "skylight BR". Xem xét tách atomic hơn. |
| I3 | PH5 §H NFR hạ tầng — nên thêm bảng "Mục tiêu nghiệp vụ ↔ NFR hỗ trợ" để DEV ước lượng dễ hơn. |
| I4 | PH4 BR-457 "sản lượng UHT/KH" — nên thêm note ngắn giải thích thuật ngữ VNA nội bộ. |
| I5 | Khung §10 có 33 tài liệu nguồn — bổ sung cột "ưu tiên đọc" cho Agent 3 (vd FDOP §3.1 = bắt buộc, Aircraft_FIMS.extracted.md = tra cứu). |

---

## D. Câu hỏi mở cho tác giả

1. **Số BR khung vs số BR thật**: đồng bộ khung với số thực tế ~326, hay cố ý giữ số nhỏ?
2. **Quy ước owner Tích hợp vs Nghiệp vụ**: thống nhất PH5 sở hữu mọi BR tích hợp (data contract), PH1–PH4 sở hữu logic nghiệp vụ tiêu thụ — đồng ý không?
3. **PH4 Nhóm K**: tách thành PH2-KTKTB hay giữ trong PH4?
4. **PF Reports ở PH3 + PF Data ở PH4**: xác nhận chiến lược "Owner Master ở PH4 — Owner Report ở PH3" (sửa PH4 BR-431 theo C3)?
5. **OID trùng ID** — SME-04 ↔ SME-42, SME-06/07 ↔ SME-43: gộp hay giữ riêng?
6. **PH1 BR-112** đã ghi chú "chuyển sang PH2" — xác nhận chính thức?

---

## E. Điều kiện chuyển sang Agent 3

**Bắt buộc xử lý trước:**
- [x] C1: Đồng bộ số BR khung ↔ 5 PHn (bump khung v0.10) — *sửa 2026-06-17, khung v0.9→v0.10 (338 BR)*
- [x] C2: Sửa toàn bộ link sai phiên bản trong khung §5.1 + §7 — *sửa 2026-06-17, khung v0.10*
- [x] C3: PF Reports — rút khỏi PH4 BR-431, chỉ giữ ở PH3 §7.3.9 — *sửa 2026-06-17, PH4 v0.3→v0.4*
- [x] C4: Category Owner — PH3 BR-324 thành "tiêu thụ từ PH4 BR-422" — *sửa 2026-06-17, PH3 v0.3→v0.4*
- [x] C5: Tách owner Tích hợp (PH5) vs owner Cảnh báo (PH1) cho NOTAM/WX/A-CDM/ACARS — *sửa 2026-06-17, PH1 v0.5→v0.6 + PH5 v0.3→v0.4*
- [x] C6: Rà soát + sửa OID references không tồn tại / trùng; đặt mã SME-44 — *sửa 2026-06-17, OID v0.12→v0.13 (SME-42→SME-06, SME-43→SME-07, +SME-44)*
- [x] M2: Tách PH5 BR-528 thành atomic (~7–10 BR) — *sửa 2026-06-17, PH5 v0.3→v0.4 (BR-528a…h)*
- [x] M3: Tách PH5 BR-530 thành 7 BR atomic — *sửa 2026-06-17, PH5 v0.4 (BR-530a…g)*
- [x] M4: Xóa PH1 BR-143; trỏ về PH5 BR-517/518 — *sửa 2026-06-17, PH1 v0.6*
- [x] M8: PH4 BR-419 — đổi "quản lý" thành "đồng bộ + cảnh báo" — *sửa 2026-06-17, PH4 v0.4*

**Quyết định kiến trúc đã chốt (D-decisions 2026-06-17):**
- [x] D3: Nhóm K (BR-470/471/473) từ PH4 chuyển sang PH2 v0.5 (BR-258…261) — *PH4 v0.4 xóa Nhóm K; PH2 v0.5 nhận Khối F*
- [x] D6: BR-112 chính thức chuyển sang PH2 v0.5 (BR-257) — *luồng phê duyệt tài liệu chuyến bay*

**Có thể để Agent 3 xử lý:**
- M1, M5, M6, M7, M9, M10, M11, m1–m9, I1–I5
