---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
reviewer: "ba-reviewer (Agent 2)"
reviewed_by: "BA Lead"
date: "2026-06-17"
status: "Chờ Agent 3"
document_type: "Review BRD"
artifacts_reviewed:
  - BRD-TOSS-001-khung-v0.8.md        # v0.8: §9.3 gỡ list cờ → trỏ OID (M3)
  - BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.4.md  # v0.2 VATM; v0.3 C2/C3/M9/M10 55BR; v0.4 M3 gỡ cờ inline
  - BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.3.md  # v0.2 M2/Mi5 28BR; v0.3 M3 gỡ cờ inline
  - BRD-TOSS-PH3-bao-cao-toi-uu-v0.2.md       # v0.2: M3 gỡ cờ inline
  - BRD-TOSS-PH4-quan-ly-danh-muc-v0.2.md     # v0.2: M3 gỡ cờ inline
  - BRD-TOSS-PH5-quan-tri-he-thong-v0.2.md    # v0.2: M3 gỡ cờ inline
glossary_version: "v0.11"
---

# Báo cáo Review BRD Khung v0.7 + 5 BRD Phân hệ
**Ngày review:** 2026-06-17 | **Tổng phát hiện:** 38 (Critical: 3 · Major: 12 · Minor: 16 · Info: 7)

---

## A. Tóm tắt

| Mức | Số lượng |
|---|---|
| 🔴 Critical | 3 |
| 🟠 Major | 12 |
| 🟡 Minor | 16 |
| ℹ️ Info | 7 |

**Kết luận:** ⚠️ **CHƯA đủ điều kiện chuyển sang Agent 3** — cần xử lý 3 Critical + 5 Major bắt buộc trước.

---

## B. Điểm mạnh

- Cấu trúc khung tổng + 5 file phân hệ rõ ràng; tổng kết BR khớp đúng (50+31+34+32+29 = 176).
- Mọi BR đều có cột Nguồn; truy vết bottom-up §10.1b chi tiết.
- Tuân thủ §0: các điểm thiếu đều gắn cờ `[cần xác nhận]` hoặc "(chưa có nguồn)".
- Chú thích chéo "12/06 làm rõ → BR-1xx" giữa BR cũ và mới tốt.

---

## C. Chi tiết vấn đề

### 🔴 CRITICAL (bắt buộc sửa trước Agent 3)

**C1 · BRD-001-khung §6 vs BR-118 (PH1)** — Mâu thuẫn nguồn NOTAM.
Khung §9.3 đã đóng cờ VNCM→VATM (changelog v0.7 mục 2,3). Nhưng BR-118 vẫn viết `[cần xác nhận tên: VNCM/VNCS]`.
**Sửa:** PH1 BR-118 → "nguồn chính thức từ VATM" + gỡ cờ.

**C2 · BR-120 (PH1) lệch glossary** — CLC.
BR-120 ghi "CLC — Centralized Load Control `[cần xác nhận]`". Glossary v0.11 đã xác nhận: **CLC = Control Load Center** (FDOP §3.2).
**Sửa:** "CLC — Control Load Center" + gỡ cờ.

**C3 · BR-119 (PH1)** — VMA đã chốt nhưng cờ vẫn còn.
Khung §9.3 + Glossary v0.11 đã xác nhận VMA. BR-119 vẫn có `[cần xác nhận viết tắt]`.
**Sửa:** "ngưỡng VMA (ngưỡng thời tiết tối thiểu sân bay)" + gỡ cờ.

### 🟠 MAJOR

**M1 · OBJ-001, OBJ-002, OBJ-008, OBJ-009** — KPI chưa có ngưỡng định lượng. BRD v0.7 chưa "phê duyệt được" với OBJ thiếu ngưỡng đo.
**Đề xuất:** Workshop chốt 4 OBJ với SME trước khi chuyển Agent 3.

**M2 · BR-205 (PH2)** — Đoạn "(v0.3 bổ sung)" copy nhầm nội dung BR-203 (OFP parse) vào BR về NOTAM+WX Revision.
**Sửa:** Xóa đoạn đặt nhầm; kiểm tra nội dung đúng vị trí.

**M3 · Quản lý cờ `[cần xác nhận]` không thống nhất** — Có ở inline BR text, §9.3 khung, và OID — 3 nơi, không rõ "nguồn sự thật".
**Đề xuất:** Chọn OID-TOSS-001 làm sổ cái duy nhất; khung và phân hệ chỉ trỏ về OID.

**M4 · BR-141 (PH1) chồng lấn BR-502/BR-504 (PH5)** — Phân quyền 2 lớp xuất hiện ở cả 2 phân hệ.
**Đề xuất:** PH5 sở hữu cơ chế RBAC chung; PH1 BR-141 chỉ "áp dụng quy tắc PH5 cho màn Giám sát".

**M5 · BR-143 (PH1) đặt sai phân hệ** — "Quy ước giao diện chung toàn hệ thống TOSS" là chuẩn toàn hệ thống, thuộc PH5 BR-529.
**Đề xuất:** Chuyển BR-143 vào PH5; PH1 chỉ trỏ về.

**M6 · BR-203 (PH2) trộn 2 yêu cầu** — Hiển thị thông tin điều phái + parse/lưu toàn bộ OFP.
**Đề xuất:** Tách thành BR-203a (hiển thị) và BR-203b (parse/lưu).

**M7 · BR-213/214/218 (PH2) vs BR-520 (PH5)** — Logic Release/Unrelease không rõ ai sở hữu.
**Đề xuất:** PH2 sở hữu nghiệp vụ + version policy; PH5 chỉ định nghĩa kênh tích hợp + payload.

**M8 · BR-516 (PH5)** — Trộn thiết kế kỹ thuật (K8s/HAProxy/etcd) vào BR.
**Đề xuất:** Giữ ngưỡng định cỡ (vCPU/RAM/VM); chuyển chi tiết kiến trúc sang SRS/SAD.

**M9 · BR-110 (PH1)** — Gộp 7 ý độc lập (tankering, CI, sân bay dự bị, nhiên liệu, SID/STAR…).
**Sửa:** Tách thành 4–5 BR riêng: BR-110a tankering; BR-110b taxi/CI; BR-110c sân bay dự bị; BR-110d nhiên liệu; BR-110e SID/STAR.

**M10 · BR-107 (PH1) chồng lấn BR-405/BR-406 (PH4)** — Thuộc tính tàu bay xuất hiện ở cả PH1 và PH4.
**Đề xuất:** PH4 sở hữu master tàu; PH1 BR-107 chỉ "tiêu thụ và hiển thị real-time".

**M11 · BR-308 (PH3)** — OTP/OSP yêu cầu nhưng OBJ-003 chưa có ngưỡng chính thức.
**Đề xuất:** Liên kết BR-308 ↔ OBJ-003 + làm rõ ngưỡng OTP/OSP.

**M12 · BR-419 (PH4) vs BR-122/BR-123 (PH1)** — Cờ `[cần xác nhận danh mục đầy đủ]` lặp ở 2 nơi.
**Đề xuất:** PH4 BR-419 sở hữu cờ duy nhất; PH1 chỉ trỏ "theo danh mục PH4 BR-419".

### 🟡 MINOR (16 mục)

| # | BR | Vấn đề | Đề xuất |
|---|---|---|---|
| Mi1 | PH1 §7.1 | Thiếu cột "Yêu cầu chấp nhận sơ bộ" / "Verification method" | Bổ sung trước khi xuống SRS |
| Mi2 | BR-126 | Cờ CORSIA / EU ETS có thể đóng ngay — tên cơ chế quốc tế đã rõ | Gỡ cờ |
| Mi3 | BR-219 + BR-221 | Cờ "ADC `[cần xác nhận]`" lặp ở 2 BR | Gộp 1 cờ |
| Mi4 | BR-220 | ICON đã có glossary → có thể đóng cờ tên | Gỡ cờ tên |
| Mi5 | BR-225/226/228/229 | Liệt kê trường dữ liệu cấp FR — vi phạm quy ước BRD §7 | Gom thành 1 BR mức cao, đẩy chi tiết xuống SRS |
| Mi6 | BR-322 | Mô tả OFP/QAR khó hiểu với người không thạo domain | Thêm 1 dòng định nghĩa |
| Mi7 | BR-331 | Cờ "FORM D/E" — cần ghi rõ cơ quan CAAV | Thêm "cơ quan nhà chức trách CAAV" |
| Mi8 | BR-411 vs BR-114 | Chồng nhẹ "sân bay không hỗ trợ APU" | Thêm chú thích chéo |
| Mi9 | BR-415 | Gộp 6 loại tham số khác chủng loại | Tách theo nhóm |
| Mi10 | BR-510 | Trộn API Gateway + performance NFR (truyền file lớn) | Tách NFR riêng |
| Mi11 | BR-512 | "≥10 giao tiếp không tính phí" là điều khoản thương mại | Chuyển sang Phụ lục Thương mại |
| Mi12 | BR-519 | 7 nguồn tích hợp + 3 cờ trong 1 BR | Tách thành ≥7 BR con |
| Mi13 | BR-525 | 7 API ra trong 1 BR | Chuyển thành bảng phụ |
| Mi14 | BR-529 | 3 ý không liên quan (uppercase, dropdown, Dark/Light Mode) | Tách riêng |
| Mi15 | Khung §6 | Thiếu stakeholder: Đội MO Plus, Lido/Sabre vendor, Đơn vị quản lý slot | Bổ sung vào §6 |
| Mi16 | Khung §8 BP-003 | Nhãn "PH1+PH5" nhưng PH5 không có BR cho chuyến VIP | Kiểm tra lại hoặc gỡ nhãn PH5 |

### ℹ️ INFO (7 mục)

| # | Gợi ý |
|---|---|
| I1 | Lịch sử thay đổi thiếu cột "ảnh hưởng tới BR nào" |
| I2 | Liên kết OBJ-007 ↔ BR-517 + BR-523 |
| I3 | Xác nhận BR-110 PH1 không nhắc "cảnh báo CI" (chỉ "khuyến nghị") — OK |
| I4 | Thêm "tham chiếu glossary v0.11" ở header mỗi BRD |
| I5 | Thống nhất 1 quy ước duy nhất cho cờ `[cần xác nhận]` |
| I6 | ~95% BR là "Must" — MoSCoW gần như mất ý nghĩa; xem lại phân bổ ưu tiên |
| I7 | Khung §6.1 RACI vẫn "(chưa có nguồn)" — cản trở khi xuống use case |

---

## D. Câu hỏi mở cho tác giả

1. Gộp BR-141 vào BR-504 và BR-143 vào BR-529?
2. BR-225/226/228/229 (PH2) đẩy hết xuống SRS hay giữ ở BRD mức cao?
3. OBJ-001/002/008/009 — workshop nào trong tuần tới chốt ngưỡng định lượng?
4. Quy ước cờ `[cần xác nhận]` — inline BR / §9.3 / OID: chọn cái nào làm "nguồn sự thật"?
5. BR-512 (≥10 giao tiếp không tính phí) — NFR hay điều khoản thương mại?

---

## E. Điều kiện chuyển sang Agent 3

**Bắt buộc sửa trước:**
- [x] C1: BR-118 VATM (gỡ cờ) — *sửa 2026-06-17, PH1 → v0.2*
- [x] C2: BR-120 CLC = Control Load Center (gỡ cờ) — sửa 2026-06-17, PH1 → v0.3
- [x] C3: BR-119 VMA (gỡ cờ) — sửa 2026-06-17
- [x] M2: Xóa đoạn nhầm BR-205 — sửa 2026-06-17, PH2 → v0.2
- [x] M3: Thống nhất 1 nơi sở hữu cờ — sửa 2026-06-17, OID-TOSS-001 làm sổ cái duy nhất; gỡ toàn bộ cờ inline ở 5 BRD-PHn (chuyển về chú thích `*(xem OID: <mã>)*`); §9.3 BRD khung rút gọn thành 1 dòng tham chiếu OID; bump version: khung v0.7→v0.8, PH1 v0.3→v0.4, PH2 v0.2→v0.3, PH3 v0.1→v0.2, PH4 v0.1→v0.2, PH5 v0.1→v0.2; OID bump v0.11→v0.12 (+2 SME-42/43 Sunweather + Phi Công 11).
- [x] M9: Tách BR-110 thành BR atomic — sửa 2026-06-17
- [x] M10: PH4 sở hữu master tàu, PH1 chỉ tiêu thụ — sửa 2026-06-17
- [x] Mi5: Gom BR-225/226/228/229 về mức BR — sửa 2026-06-17, PH2 → v0.2

**Có thể để Agent 3 xử lý:** M4, M5, M6, M7, M8, M11, M12, Mi1–Mi16.

