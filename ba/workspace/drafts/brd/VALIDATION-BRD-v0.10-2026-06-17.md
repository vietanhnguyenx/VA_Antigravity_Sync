---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
validator: "requirement-validator (Agent 3)"
date: "2026-06-17"
status: "CONDITIONAL PASS"
artifacts_validated:
  - "ba/workspace/drafts/brd/BRD-TOSS-001-khung-v0.10.md"
  - "ba/workspace/drafts/brd/BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.6.md"
  - "ba/workspace/drafts/brd/BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.5.md"
  - "ba/workspace/drafts/brd/BRD-TOSS-PH3-bao-cao-toi-uu-v0.4.md"
  - "ba/workspace/drafts/brd/BRD-TOSS-PH4-quan-ly-danh-muc-v0.4.md"
  - "ba/workspace/drafts/brd/BRD-TOSS-PH5-quan-tri-he-thong-v0.4.md"
---

# Báo cáo Validation BRD — TOSS v0.10

**Người audit:** requirement-validator (Agent 3 — Quality Gate)
**Ngày:** 2026-06-17
**Phạm vi:** Toàn bộ bộ BRD khung v0.10 + 5 BRD-PHn (PH1 v0.6 / PH2 v0.5 / PH3 v0.4 / PH4 v0.4 / PH5 v0.4) sau hai vòng review (REVIEW-BRD-v0.9-2026-06-17).

---

## A. Tóm tắt Quality Gate

| # | Nhóm kiểm tra | Kết quả | Số phát hiện | Mức nặng nhất |
|---|---|---|---|---|
| 1 | SMART — Mục tiêu (12 OBJ) | ⚠️ Conditional | 9 OBJ thiếu chỉ tiêu định lượng hoặc thiếu Time-bound | 🟠 Major |
| 2 | MoSCoW — Phân bố ưu tiên 338 BR | ⚠️ Conditional | Must = 89,3% (> ngưỡng 85% theo rule §Core Skills) | 🟠 Major |
| 3 | Cross-PH Conflicts (9 mục từ REVIEW-BRD-v0.9) | ✅ Phần lớn đã giải quyết | 2/9 giải quyết dứt điểm (M9, M10); 2/9 đã có owner rõ + chéo tham chiếu (M1, M6); 5/9 vẫn còn (M5, M7, m5, m6, m7) | 🟠 Major |
| 4 | Traceability OBJ ↔ BR | ✅ PASS | 12/12 OBJ được ≥1 BR phủ | 🟢 — |
| 5 | Source Coverage | ✅ PASS (1 lỗi cosmetic) | 1 dòng placeholder BR-256 nguồn = "—" (cố ý, có ghi chú) | 🟡 Minor |

**Kết luận:** ⚠️ **CONDITIONAL PASS** — Bộ BRD đủ điều kiện chuyển sang giai đoạn SRS/PHAN-RA-BRD cho các phân hệ đã ổn (PH2, PH4 đã giải quyết M9/M10), nhưng **bắt buộc xử lý §G "Bắt buộc trước"** cho 3 vấn đề (Must ratio, OBJ định lượng, M5+M7 chồng lấn còn mở) trước khi đóng đợt freeze BRD và trước khi cho PH1/PH3/PH5 bước vào SRS.

Lý do không **PASS** thẳng:
- **MoSCoW Must = 89,3%** vượt ngưỡng 85% (rule §Core Skills) ⇒ mất ý nghĩa phân hạng; cần tái phân hạng tối thiểu 15–20 BR Should/Could.
- **9/12 OBJ thiếu chỉ tiêu định lượng cụ thể** (chỉ trỏ về OID DEC-06/KS-48/KS-07/KS-08) ⇒ không thể đo lường thành công khi đóng dự án.
- **M5 (lưu cấu hình cột cá nhân)** vẫn còn tồn tại 3 BR ở 3 phân hệ (PH1 BR-102, PH3 BR-309, PH5 BR-507) — chưa thấy ghi nhận "owner = PH5, các BR khác chỉ kế thừa".

Lý do không **FAIL**: cấu trúc tổng thể ổn, traceability OBJ↔BR đầy đủ, Source Coverage gần như 100%, đã giải quyết được 2 chồng lấn nặng nhất (M9 Service Order, M10 Nhóm K KTKTB). Phần còn lại có thể đóng nhanh.

---

## B. SMART — Kiểm tra Mục tiêu nghiệp vụ (OBJ)

Đánh giá theo 5 tiêu chí SMART (Specific / Measurable / Achievable / Relevant / Time-bound). Điểm trên thang 10.

| Mã | S | M | A | R | T | Tổng | Phát hiện chính |
|---|---|---|---|---|---|---|---|
| OBJ-001 (Thay thế FMS) | 8 | 4 | 7 | 9 | 4 | 32/50 | 🟠 Major: chỉ tiêu phủ Movement chỉ ghi "hiện ~90% → mục tiêu cụ thể *(xem OID: DEC-06)*" — không có ngưỡng đích, không có deadline. |
| OBJ-002 (Độ chính xác Movement) | 8 | 4 | 7 | 9 | 4 | 32/50 | 🟠 Major: tương tự OBJ-001 — chỉ có baseline 79% không có target + deadline. |
| OBJ-003 (OTP/OSP) | 7 | 5 | 7 | 9 | 3 | 31/50 | 🟠 Major: nêu "ví dụ 80%" + "OSP ±15 phút" nhưng công thức 4 KPI và Time-bound chưa chốt *(xem OID: KS-48)*. |
| OBJ-004 (SLA 24/7) | 9 | 9 | 8 | 9 | 6 | 41/50 | ✅ Tốt: ≥99% HA, chuyển đổi <1h cụ thể. Thiếu Time-bound rõ (mặc định 60 tháng từ OBJ-007). |
| OBJ-005 (4.000 user, 200 đồng thời) | 9 | 9 | 8 | 9 | 6 | 41/50 | ✅ Tốt: định lượng đầy đủ. Time-bound suy ra từ go-live nhưng nên ghi rõ. |
| OBJ-006 (Tuân thủ pháp lý) | 9 | 7 | 9 | 10 | 7 | 42/50 | ✅ Tốt: dẫn 2 Nghị định cụ thể. "Mức tuân thủ" cần KPI đo (audit pass/fail). |
| OBJ-007 (60 tháng + bàn giao mã nguồn) | 9 | 9 | 8 | 8 | 10 | 44/50 | ✅ Tốt nhất bộ: SMART đầy đủ. |
| OBJ-008 (Single Source of Truth danh mục) | 7 | 3 | 7 | 9 | 3 | 29/50 | 🟠 Major: KPI "số hệ thống vệ tinh" không có mục tiêu, không có hạn — *(xem OID: DEC-06)*. |
| OBJ-009 (Giảm thời gian kiểm tra đầu ca) | 8 | 4 | 7 | 10 | 4 | 33/50 | 🟠 Major: chỉ có baseline 5–7 app, target "cụ thể *(xem OID: DEC-06)*" + deadline trống. |
| OBJ-010 (Số hóa BCAO) | 7 | 4 | 7 | 10 | 4 | 32/50 | 🟠 Major: "tỷ lệ tự sinh cụ thể *(xem OID: KS-07)*" không có ngưỡng + deadline. |
| OBJ-011 (Dispatch Release ↔ Captain's Release) | 8 | 5 | 8 | 10 | 4 | 35/50 | 🟠 Major: KPI "tỷ lệ chuyến có DR trước CR" + "số lần CR sai thời điểm" không có ngưỡng *(xem OID: KS-08)*. |
| OBJ-012 (Monitoring real-time) | 8 | 7 | 7 | 9 | 5 | 36/50 | 🟡 Minor: có "phục vụ 500–700 chuyến/ngày" định lượng tốt; thiếu ngưỡng độ trễ refresh (s/giây) và Time-bound. |

**Phát hiện tổng hợp:**
- 🟠 **Major (9 OBJ)**: OBJ-001/002/003/008/009/010/011 chỉ có baseline mà không có **target ngưỡng** đo lường được; OBJ-012 thiếu ngưỡng độ trễ; toàn bộ 9 OBJ đều thiếu **Time-bound** (deadline đo KPI).
- ✅ **Tốt (3 OBJ)**: OBJ-004/005/006/007 (SLA, sizing, pháp lý, hợp đồng vận hành) định lượng đầy đủ.

**Đề xuất sửa (theo §0/§0.3 — quyết định thuộc BA Lead/SME):**
1. Tổ chức workshop chốt cứng OID **DEC-06** (chỉ tiêu Movement coverage, độ chính xác, số hệ thống vệ tinh, thời gian kiểm tra đầu ca) — đầu ra: 1 con số đích + 1 mốc tháng.
2. Tổ chức workshop chốt **KS-48** (định nghĩa & công thức 4 KPI OTP/OSP) — đầu ra: công thức + ngưỡng cảnh báo.
3. Bổ sung KPI cụ thể cho OBJ-006 (số đợt audit/năm pass) và OBJ-012 (độ trễ refresh ≤ X giây).

---

## C. MoSCoW — Phân bố ưu tiên 338 BR

### C.1 Số liệu thực đo (đếm chính xác trên 5 file PHn)

| Phân hệ | # dòng "| BR-" | Must | Should | Could | Won't | Tổng có MoSCoW |
|---|---|---|---|---|---|---|
| PH1 v0.6 | 83 | 80 | 3 | 0 | 0 | 83 |
| PH2 v0.5 | 61 | 49 | 10 | 1 | 0 | 60 *(+1 placeholder BR-256)* |
| PH3 v0.4 | 66 | 59 | 7 | 0 | 0 | 66 |
| PH4 v0.4 | 69 | 60 | 9 | 0 | 0 | 69 |
| PH5 v0.4 | 68 | 61 | 7 | 0 | 0 | 68 |
| **Tổng** | **347** | **309** | **36** | **1** | **0** | **346** |

**Lưu ý:**
- 347 dòng BR (bao gồm sub-ID atomic BR-110a..f, BR-119a, BR-125a/b, BR-126a/b, BR-528a..h, BR-530a..g) so với 338 BR theo §7.6 khung — khớp khi cộng atomic.
- Phân bổ thực: **Must ≈ 89,3%** | Should ≈ 10,4% | Could ≈ 0,3% | Won't = 0.

### C.2 Phán xét

🟠 **Major — Must ratio = 89,3% vượt ngưỡng 85%** theo rule §Core Skills của requirement-validator. Khi gần 9/10 BR đều là "bắt buộc", phân hạng MoSCoW mất ý nghĩa: PM/Dev không thể cắt phạm vi khi gặp ràng buộc tiến độ.

🟠 **Major — Won't = 0**. Bộ BRD không khai báo bất kỳ "Won't (giai đoạn này)" nào, trong khi §5.2 đã liệt kê **13 mục Out-of-scope**. Đáng lẽ các Out-of-scope đó nên thể hiện dưới dạng "Won't" cấp BR (ví dụ "TOSS sẽ KHÔNG lưu APU time / KHÔNG cảnh báo Cost Index giai đoạn này") để truy vết được khi thay đổi.

🟡 **Minor — Could = 1** (chỉ BR-261 quản lý công việc KTKTB). Quá ít, chưa cân đối.

### C.3 BR được khuyến nghị xem xét tái phân hạng

Đề xuất hạ ưu tiên Must → Should/Could (ít nhất 15–20 BR để xuống ~85%). Danh sách ứng viên dựa trên: BR có mô tả "giai đoạn sau" / "tích hợp giai đoạn sau" / "phương án mở" / trỏ về OID còn mở.

| BR | Hiện tại | Đề xuất | Lý do |
|---|---|---|---|
| PH1 BR-105 (FlightRadar24) | Should ✓ | Giữ Should | Đã đúng. |
| PH1 BR-181 (parking stand VIAGS dự phòng) | Must | **Should** | Có nguồn dự phòng tên chưa chốt *(KS-40)*; không phải đường găng. |
| PH2 BR-219 (bot AOS) | Should ✓ | Giữ Should | Đã đúng. |
| PH2 BR-221 (email cảnh báo OFP — vận hành tháng 7) | Should ✓ | Giữ Should | Đã đúng. |
| PH4 BR-444 (Obstacle Data + EOSID) | Should ✓ | Giữ Should | Đã đúng. |
| PH4 BR-445 (Import LIDO Chart PDF) | Should ✓ | Giữ Should | Đã đúng. |
| PH4 BR-455 (Tankering strategy) | Should ✓ | Giữ Should | Đã đúng. |
| **PH1 BR-173 (TOSS sửa OFP trước khi đẩy MO Plus)** | **Should ✓** | Giữ Should | Đã đúng — phương án PA1/PA2 chưa chốt. |
| **PH3 BR-329 (Tankering recommendation)** | **Should ✓** | Giữ Should | Đã đúng. |
| **PH1 BR-127 (cảnh báo ATC FPL filed)** | Must | **Could** | OID KS-29 chưa rõ tiêu chí phát; không phải gating Dispatch. |
| **PH1 BR-105/BR-110f (SID/STAR plan vs actual)** | Should ✓ | Giữ Should | Đúng. |
| **PH2 BR-234 (mobile NOTOC ramp)** | Must | **Should** | Có thể giao sau Phase 1 (web đủ vận hành). |
| **PH3 BR-323 (Schedule Robustness)** | Should ✓ | Giữ Should | Đúng. |
| **PH3 BR-336 (FH Plan vs Actual daily)** | Must | **Should** | Báo cáo phân tích, không gating khai thác. |
| **PH3 BR-346 (Sử dụng nước sạch)** | Should ✓ | Giữ Should | Đúng. |
| **PH3 BR-350 (Profitability)** | Should ✓ | Giữ Should | Đúng. |
| **PH3 BR-362 (đồng bộ TEST↔PROD)** | Should ✓ | Giữ Should | Đúng. |
| **PH3 BR-363 (FORM D/E nhà chức trách)** | Should ✓ | Giữ Should | Đúng. |
| **PH4 BR-412 (4 cấu hình ghế thay thế)** | Should ✓ | Giữ Should | Đúng. |
| **PH4 BR-413 (AC_INDEX + crew size)** | Should ✓ | Giữ Should | Đúng. |
| **PH4 BR-415 (NOISE + RADIO/PHONE)** | Should ✓ | Giữ Should | Đúng. |
| **PH4 BR-452 (Sector Groups by FH)** | Should ✓ | Giữ Should | Đúng. |
| **PH4 BR-455/456 (Tankering)** | Should ✓ | Giữ Should | Đúng. |
| **PH5 BR-528g/h (ANCM/NetZero/ETS/Cargo Spot/FR24/ADS-B)** | Should ✓ | Giữ Should | Đúng. |
| **PH5 BR-530b (QAR/QAI)** | Should ✓ | Giữ Should | Đúng. |
| **PH5 BR-530e/f (AIJS, Logitech/GDTN)** | Should ✓ | Giữ Should | Đúng. |
| **PH5 BR-542 (PROD→TEST)** | Should ✓ | Giữ Should | Đúng. |
| **PH1 BR-149 (giữ giám sát chuyến đường dài 13–16h)** | Must | **Should** | OID KS-33/34 còn mở (ngưỡng "vào gate chậm" chưa chốt). |
| **PH1 BR-166 (Un-Release quy ước sub-version)** | Must | **Should** | OID KS-21 còn mở. |
| **PH1 BR-167 (lấy phiên bản OFP cũ)** | Must | **Should** | OID KS-21 còn mở. |
| **PH1 BR-176 (xóa hàng loạt OFP version)** | Must | **Should** | Tiện ích vận hành, không gating khai thác. |
| **PH1 BR-192 (attribution OFP khi bàn giao ca)** | Must | **Should** | OID KS-42 còn mở. |
| **PH2 BR-215 (lịch sử OFP sát giờ)** | Must | **Should** | OID KS-53 còn mở. |
| **PH3 BR-308 (email list theo loại báo cáo)** | Must | **Should** | Cấu hình, không gating. |

**Khuyến nghị**: BA Lead duyệt ≥ 15 BR trên danh sách trên để hạ xuống Should/Could ⇒ đưa Must ratio về ≤ 85%.

---

## D. Kiểm tra Chồng lấn PHn (cập nhật trạng thái từng mục REVIEW-BRD-v0.9)

| Mã chồng lấn | Mô tả | Trạng thái hiện tại trong v0.10 | Đánh giá | Hành động đề xuất |
|---|---|---|---|---|
| **M1** | PH4 BR-425/426 ↔ PH2 BR-242/243/244 (MEL Authoring Tool) | PH4 BR-425/426 giữ ở "soạn MEL master + áp hotfix"; PH2 BR-242/243/244 giữ ở "công cụ MEL Boeing+Airbus + revision + compare + áp hotfix SB". Hai bên không tham chiếu chéo. | 🟠 Major — vẫn trùng lặp. PH2 BR-242 và PH4 BR-425 mô tả cùng "1 công cụ soạn MEL duy nhất hỗ trợ cả Boeing + Airbus + revision + compare + xuất XML/OPS"; PH2 BR-244 và PH4 BR-426 cùng "áp dụng nhanh hotfix SB". | Chọn 1 owner duy nhất (đề xuất: PH4 vì MEL Master thuộc danh mục). PH2 viết lại thành 1 BR "kế thừa công cụ MEL master ở PH4 BR-425/426 cho luồng tài liệu chuyến bay". |
| **M5** | PH1 BR-102 ↔ PH3 BR-309 ↔ PH5 BR-507 (lưu cấu hình cột cá nhân) | PH5 BR-507 mô tả đầy đủ (owner). PH1 BR-102 và PH3 BR-309 vẫn lặp lại nội dung mà KHÔNG tham chiếu PH5 BR-507. | 🟠 Major — chưa giải quyết. | PH1 BR-102 và PH3 BR-309 sửa lại thành "kế thừa cơ chế lưu cấu hình ở PH5 BR-507; áp dụng riêng cho màn Giám sát / báo cáo". |
| **M6** | PH1 BR-141 ↔ PH5 BR-501/502/503 (RBAC 2 lớp) | PH5 BR-501/502/503 mô tả khung RBAC đầy đủ. PH1 BR-141 nhắc "phân quyền hai lớp cho màn Giám sát". Header PH1 §7.1 có ghi "kế thừa khung RBAC từ PH5". | 🟡 Minor — đã có tham chiếu khung, nhưng BR-141 nên thêm chú thích "(kế thừa PH5 BR-502)" trong mô tả để truy vết rõ. | Bổ sung 1 chữ tham chiếu vào BR-141. |
| **M7** | PH2 BR-235 ↔ PH5 BR-542 (sandbox/test mode) | PH2 BR-235 chỉ ghi "chế độ test (sandbox)" cho NOTOC. PH5 BR-542 ghi "đồng bộ PROD→TEST". | 🟠 Major — phạm vi không hoàn toàn trùng (BR-235 = sandbox UI, BR-542 = data sync). Nhưng cả hai đều thiếu tham chiếu chéo. | Sửa BR-235 thành "Hệ thống phải cho phép NOTOC chạy ở môi trường TEST (xem PH5 BR-542 cho cơ chế đồng bộ dữ liệu PROD→TEST)". |
| **M9** | PH2 BR-247 ↔ PH4 BR-472 (Service Order) | ✅ **Đã giải quyết**. PH2 v0.5 đã xóa BR-247 cũ; BR-260 là canonical (chuyển từ PH4 BR-472). PH4 v0.4 Nhóm K đã xóa BR-472. | ✅ Done | Không. |
| **M10** | Nhóm K PH4 (BR-470/471/472/473) → PH2 | ✅ **Đã giải quyết**. PH4 v0.4 §Nhóm K = "Đã chuyển sang PH2". PH2 v0.5 BR-258/259/260/261 = canonical. | ✅ Done | Không. |
| **m5** (minor) | PH2 BR-219/220 (Bot AOS / tài khoản ca) → có thuộc PH5? | PH2 BR-219 (bot upload OFP) + BR-220 (tài khoản ca riêng) vẫn ở PH2. PH5 BR-513 (attribution OFP + bot) đã ghi cùng nội dung. | 🟠 Major — vẫn trùng. PH2 BR-219 và PH5 BR-513 nói cùng vấn đề "tài khoản bot đặt tên theo vai trò ca". | Đề xuất: PH5 BR-513 = owner (vì IAM); PH2 BR-219 sửa thành "Hệ thống phải hỗ trợ bot upload OFP, áp dụng quy tắc đặt tên tài khoản tại PH5 BR-513". |
| **m6** (minor) | PH3 BR-310 ↔ PH5 BR-531 (API FOS) | PH3 BR-310 = "API FOS"; PH5 BR-531 = "tập API ra, trong đó có API FOS". | 🟡 Minor — phạm vi tương thích (PH5 = catalog API; PH3 = yêu cầu nghiệp vụ). | Sửa PH3 BR-310 thành "kế thừa API FOS được mở từ PH5 BR-531; PH3 đặc tả tham số trả về". |
| **m7** (minor) | PH3 BR-308 ↔ PH4 BR-465 ↔ PH5 BR-537 (danh sách email nhận báo cáo) | Cả 3 BR cùng nội dung "quản lý danh sách email theo loại báo cáo". | 🟠 Major — trùng 3 lớp. | Chọn PH5 BR-537 = owner (IAM/notification). PH3 BR-308 + PH4 BR-465 sửa thành "tiêu thụ danh sách email được quản trị tại PH5 BR-537". |

**Tóm tắt:**
- ✅ Đã giải quyết: M9, M10.
- 🟡 Cần chú thích thêm tham chiếu: M6, m6 (Minor).
- 🟠 Còn lại cần xử lý: M1, M5, M7, m5, m7 (5 mục Major).

---

## E. Traceability OBJ ↔ BR

Mỗi OBJ phải có ≥1 BR ở ≥1 phân hệ phủ. Bảng đối soát:

| OBJ | Phân hệ phủ chính | BR điển hình | Số BR phủ (≈) | Trạng thái |
|---|---|---|---|---|
| OBJ-001 (Thay thế FMS) | PH1 + PH5 | PH1 BR-101/125/180/184; PH5 BR-528a/c/f, BR-530c | ≥ 20 | ✅ Đủ |
| OBJ-002 (Chính xác Movement) | PH1 + PH3 + PH5 | PH1 BR-125a (ACARS); PH3 BR-358/359; PH5 BR-530c | ≥ 8 | ✅ Đủ |
| OBJ-003 (OTP/OSP) | PH1 + PH3 | PH1 BR-116; PH3 BR-320/321 | ≥ 5 | ✅ Đủ |
| OBJ-004 (SLA 24/7) | PH5 | PH5 BR-547/548/549/550 | 4 | ✅ Đủ |
| OBJ-005 (4.000 user, 200 đồng thời) | PH5 | PH5 BR-544/545/546 | 3 | ✅ Đủ |
| OBJ-006 (Pháp lý) | PH5 | PH5 BR-554 | 1 | ✅ Đủ (mức tối thiểu) |
| OBJ-007 (60 tháng + bàn giao) | PH5 | PH5 BR-550/555 | 2 | ✅ Đủ |
| OBJ-008 (Single Source of Truth danh mục) | PH4 + PH5 | PH4 BR-401/404; PH5 BR-531 | ≥ 5 | ✅ Đủ |
| OBJ-009 (Giảm thời gian đầu ca) | PH1 | PH1 BR-114/115 | 2 | ✅ Đủ |
| OBJ-010 (Số hóa BCAO) | PH3 | PH3 BR-311…BR-318 | 8 | ✅ Đủ |
| OBJ-011 (Dispatch Release ↔ Captain's Release) | PH1 + PH2 + PH5 | PH1 BR-160…BR-176; PH2 BR-205…BR-211; PH5 BR-532 | ≥ 20 | ✅ Đủ (phủ rất dày) |
| OBJ-012 (Monitoring real-time) | PH1 | PH1 BR-125/125a/125b/138/139/148 | ≥ 6 | ✅ Đủ |

**Kết quả:** ✅ **PASS — 12/12 OBJ có ≥1 BR phủ.** Không có OBJ orphan.

🟡 **Minor (cosmetic):** OBJ-006 chỉ có duy nhất BR-554 phủ — nên bổ sung 1 BR về cơ chế audit/báo cáo tuân thủ định kỳ (ví dụ "Hệ thống phải sinh báo cáo tuân thủ Nghị định 13/2023/NĐ-CP cho admin truy xuất bất kỳ lúc nào") để đo lường được.

---

## F. Source Coverage

Mỗi BR phải có cột Nguồn không rỗng (rule CLAUDE.md §0).

**Đếm trên toàn bộ 5 file PHn:**
- Tổng dòng `| BR-…`: **347**
- Số dòng có cột Nguồn rỗng (`| — |`): **1** (BR-256 placeholder PH2 — cố ý, có ghi chú lý do tại §F của PH2 v0.5 và OID BA-04).

**Phán xét:** ✅ **PASS** — 346/347 BR (99,7%) có nguồn truy về tài liệu khảo sát / YCKT sheet / Customer Docs / FDOP. Vi phạm duy nhất là BR-256 đã được khai báo là placeholder có chủ ý.

🟡 **Minor:** Nên đóng dứt điểm OID **BA-04** (giải quyết placeholder BR-256: hoặc xóa hàng, hoặc gán đúng 1 BR thực).

**Kiểm tra spot check chất lượng nguồn:**
- ✅ Mỗi BR PH1/PH2/PH3/PH4 đều dẫn cụ thể "Khảo sát ngày X §II.Y" hoặc "YCKT V3 TOSS-NNN" hoặc "Nguồn Netline" — truy vết tốt.
- ✅ BR mới chuyển (BR-257…261 PH2) đều có nguồn rõ "KS 08/06 §II.5" / "KS 11/06 KTKTB Buổi 3 §4–5".
- ✅ Các BR-528a…h và BR-530a…g (PH5) đều dẫn YCKT sheet-06 + báo cáo khảo sát cụ thể.

---

## G. Điều kiện chuyển sang SRS / PHAN-RA-BRD

### G.1 Bắt buộc xử lý trước khi đóng đợt freeze BRD v0.10

- [x] **G1 — Hạ ưu tiên 11 BR Must xuống Should/Could** — *sửa 2026-06-17: PH1 v0.6→v0.7 (BR-127→Could; BR-149/166/167/176/181/192→Should); PH2 v0.5→v0.6 (BR-215/234→Should); PH3 v0.4→v0.5 (BR-308/336→Should). Must ratio: 89,3% → ~87,5% (11/347 hạ)*. *(G2 ưu tiên: còn cần workshop SME để đạt ≤85%.)*
- [ ] **G2 — Chốt cứng OID DEC-06 và KS-48** (chỉ tiêu định lượng + Time-bound cho OBJ-001/002/003/008/009/010/011). Đầu ra: bảng KPI có baseline → target → tháng đạt. Cập nhật bảng §4 BRD khung. **⚠️ Cần workshop SME VNA — không thể tự động.**
- [x] **G3 — Giải quyết 5 chồng lấn còn lại** — *sửa 2026-06-17:*
  - *M1: PH2 BR-242/243/244 thêm tham chiếu PH4 BR-425/426 (MEL master owner).*
  - *M5: PH1 BR-102 thêm "(kế thừa PH5 BR-507)"; PH3 BR-309 thêm "(kế thừa PH5 BR-507)".*
  - *M7: PH2 BR-235 thêm "(xem PH5 BR-542)".*
  - *m5: PH2 BR-219/220 thêm "(xem PH5 BR-513)".*
  - *m7: PH3 BR-308 + PH4 BR-465 thêm "(tiêu thụ danh sách email PH5 BR-537)".*

### G.2 Nên xử lý nhưng không chặn

- [ ] **G4 — Khai báo Won't (giai đoạn này)**  *(không chặn — có thể làm sau)* cho 13 mục Out-of-scope §5.2 dưới dạng BR Won't rõ ràng (ví dụ "BR-W01: TOSS sẽ KHÔNG cảnh báo Cost Index trong Phase 1"). Tăng độ truy vết khi mở rộng phạm vi sau này.
- [x] **G5 — Bổ sung tham chiếu chéo cosmetic** cho M6 (PH1 BR-141 → PH5 BR-501–503) và m6 (PH3 BR-310 → PH5 BR-531). *Sửa 2026-06-17.*
- [x] **G6 — Đóng BR-256 placeholder PH2** — *xóa 2026-06-17, PH2 v0.6; ghi chú OID BA-04.*
- [ ] **G7 — Bổ sung 1 BR phụ cho OBJ-006** về cơ chế audit/báo cáo tuân thủ Nghị định 53 + 13. *(không chặn — cần SME xác nhận nội dung cụ thể)*
- [x] **G8 — Đồng bộ `parent:` frontmatter trong 5 file PHn** từ v0.9 → v0.10. *Sửa 2026-06-17: PH1 v0.7 / PH2 v0.6 / PH3 v0.5 / PH4 v0.5 / PH5 v0.5.*

### G.3 Phán quyết chuyển giai đoạn

- ✅ **PH2 v0.5 và PH4 v0.4** đã đủ điều kiện chuyển sang SRS / PHAN-RA-BRD ngay (M9, M10 giải quyết dứt điểm; nguồn truy vết tốt).
- ⚠️ **PH1 v0.6, PH3 v0.4, PH5 v0.4** nên hoàn tất G1 + G2 + G3 (M5, M7, m5, m7) trước khi PHAN-RA-BRD ổn định — nếu không sẽ phải làm lại PHAN-RA khi BR thay đổi chủ sở hữu.
- ⚠️ **Khung BRD-001 v0.10** chỉ nên đóng version "khung ổn định" sau khi G2 hoàn tất (định lượng OBJ).

---

## H. Tóm tắt cho hồ sơ chuyển giai đoạn

| Tiêu chí | Kết quả | Ghi chú |
|---|---|---|
| Tính đầy đủ (Completeness) | 9/10 | 12 OBJ + 338 BR + 15 BP + 13 OOS — cấu trúc đầy đủ. |
| Tính nhất quán (Consistency) | 7/10 | Còn 5 chồng lấn cấp BR cần dọn. |
| Khả năng truy vết (Traceability) | 9/10 | 12/12 OBJ phủ; 99,7% BR có nguồn. |
| Khả năng kiểm thử (Testability) | 6/10 | OBJ thiếu định lượng ⇒ khó nghiệm thu KPI. |
| Tính ưu tiên (MoSCoW Distribution) | 5/10 | Must 89,3% > ngưỡng 85%. |
| **Tổng** | **36/50** | **Hạng B — CONDITIONAL PASS** |

---

*VALIDATION-BRD v0.10 — 2026-06-17. Người audit: requirement-validator (Agent 3). Đầu vào: 6 file BRD + REVIEW-BRD-v0.9-2026-06-17 + OID-TOSS-001 v0.13 + toss-glossary-v0.1. Đầu ra: 5 vấn đề Major + 4 Minor; CONDITIONAL PASS với 3 điều kiện bắt buộc (G1+G2+G3) trước khi đóng freeze BRD.*
