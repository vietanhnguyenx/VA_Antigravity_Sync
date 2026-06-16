---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Traceability Matrix — BR ↔ MM"
related_brd: "BRD-TOSS-001 v0.1"
related_module: "Phân hệ Thông tin điều hành chuyến bay — Flight Plans"
---

# Ma trận đối chiếu BR ↔ MM (Business Requirement ↔ Mã chức năng)
## Phân hệ 1 — Thông tin điều hành chuyến bay · Module: Flight Plans

> **Mục đích:** đối chiếu 78 mã chức năng (MM561–MM726) được liệt kê trong XLSX module **Flight Plans** với các Yêu cầu Nghiệp vụ (BR) trong `BRD-TOSS-001 v0.1`. Kết quả phục vụ:
> - Xác định độ bao phủ (coverage) của BRD với danh sách MM.
> - Phát hiện khoảng trống (gap) khi có MM không thuộc bất kỳ BR nào (chỉ báo BRD cần bổ sung).
> - Phát hiện BR chưa được phân rã thành MM (chỉ báo SRS/FRD cần bổ sung).
>
> **Quy ước:** mỗi MM được nhóm theo **5 nhóm màn hình** (Group 1–5) tương ứng cấu trúc tab UI dự kiến.

---

## 1. Bảng đối chiếu chính

| BR | Tên BR | Ưu tiên | Nhóm MM liên quan | Nhận xét coverage |
|---|---|---|---|---|
| **BR-TOSS-001** | Hợp nhất thông tin chuyến bay đa chiều (kế hoạch, dự kiến, thực tế, tàu bay, cabin, thời tiết, NOTAM, tổ bay, hành khách, hàng hóa, doanh thu, chi phí) | M | G1: MM561, MM562, MM563, MM566, MM571, MM574, MM726 · G2: MM598, MM599, MM600, MM601, MM602, MM603, MM614, MM615 · G3: MM624, MM625, MM626, MM627, MM628, MM629, MM630, MM631, MM636, MM637, MM638, MM639 · G5: MM697, MM698, MM704, MM705 | **Coverage tốt** — phần lớn MM thuộc G1, G2, G3, G5 đều đóng góp vào "bức tranh toàn cảnh chuyến bay" |
| **BR-TOSS-002** | Nhận diện bất thường trong khai thác bằng cảnh báo trực quan (MEL/CDL, hỏng hóc, VIP, chậm chuyến, thiếu phép bay, thiếu điện văn) | M | G2: MM606, MM607, MM608, MM609 · G3: MM634, MM635 · G5: MM701, MM702 | **Coverage một phần** — MM606–609 phủ MEL/CDL & lịch bảo dưỡng; MM634/635 cho khuyến nghị; MM701/702 cho Fuel Discrepancy. **Còn thiếu** MM cho cảnh báo VIP, chậm chuyến, thiếu phép bay, thiếu điện văn (sẽ phủ ở module khác — Alerts/Notifications) |
| **BR-TOSS-003** | Truy vết lịch sử thay đổi & chuyến chuyển hướng (Divert) | M | G1: MM577 (Flight history), MM579 (Sync history) | **Coverage tốt** cho lịch sử chuyến bay & lịch sử đồng bộ. **Còn thiếu** chức năng quản lý chuyến chuyển hướng (Divert) chuyên biệt — cần làm rõ MM ở module khác |
| **BR-TOSS-004** | Quản trị đa Carrier trên cùng nền tảng | S | *(không có MM tương ứng trong danh sách 78 items)* | **Gap** — đa Carrier là yêu cầu cấp nền tảng; cần MM ở module Cấu hình/Admin |
| **BR-TOSS-005** | Giám sát tổ bay tuân thủ FTL (Flight Time / Duty Time) | M | G2: MM614, MM615, MM616, MM617, MM620, MM621, MM622, MM623 | **Coverage tốt** — thông tin tổ bay, hành trình, Flight time, Duty time đều có |
| **BR-TOSS-006** | Số hóa & quản lý vòng đời tài liệu (OFP, NOTAM, WX, Briefing, LS, GD, PM, NOTOC, Cargo/Mail Manifest) | M | G1: MM561, MM562, MM574, MM726 · G4: MM644, MM646, MM649, MM653, MM655, MM656, MM657, MM658 · G4: MM659, MM660, MM661 (xử lý bóc dữ liệu OFP/NOTAM/WX) | **Coverage tốt** — đầy đủ các loại tài liệu theo BRD |
| **BR-TOSS-007** | Kiểm soát phiên bản tài liệu (Revision Control) | M | G4: MM667, MM668 (Rev tài liệu) | **Coverage cơ bản** — có MM cho Rev. **Khuyến nghị** SRS bổ sung MM cho xem lịch sử phiên bản chi tiết |
| **BR-TOSS-008** | Luồng xác thực điện tử Request/Confirm/Reject | M | G4: MM689, MM690, MM691, MM692, MM693, MM694, MM695, MM696 | **Coverage rất tốt** — đầy đủ 3 trạng thái Confirm/Reject/Request cả UI và API |
| **BR-TOSS-009** | Đảm bảo tính liên tục khi mất kết nối tự động (giao diện độc lập dự phòng) | M | G4: MM669, MM670 (Xem file), MM671, MM672 (Xóa file) | **Coverage một phần** — có chức năng xem/xóa thủ công. **Còn thiếu** chức năng upload thủ công khi mất kết nối auto-sync |
| **BR-TOSS-010** | Truy cập tài liệu cho phi hành đoàn tại hiện trường (Web Mobile iOS/Android/iPadOS) | M | *(thuộc module Web Mobile riêng — không nằm trong 78 MM Flight Plans web)* | **Out-of-scope** module này — cần đối chiếu với module Mobile |
| **BR-TOSS-011** | Đối soát an toàn tải trọng OFP vs thực tế (Payload/ZFW) | M | G5: MM721 (Tính toán và hiển thị tải trọng ước tính) | **Coverage một phần** — có tính toán tải trọng. **Còn thiếu** MM cho cảnh báo Delta sai lệch ZFW |
| **BR-TOSS-012** | Báo cáo khai thác hàng ngày tự động | M | *(thuộc Phân hệ 3 — Báo cáo)* | **Out-of-scope** module này |
| **BR-TOSS-013** | Đánh giá OTP/OSP & biến động lịch bay | M | *(thuộc Phân hệ 3 — Báo cáo)* | **Out-of-scope** module này |
| **BR-TOSS-014** | Phân tích tiêu thụ nhiên liệu & Tankering (Pilot Extra Fuel) | M | G5: MM697, MM698 (Fuel Order) · MM701, MM702, MM703 (Fuel Discrepancy) · MM704, MM705 (Extra Fuel Reason) · MM707, MM708 (Sửa Fuel Order) · MM709, MM710 (Sửa Fuel Discrepancy) | **Coverage rất tốt** ở mức Flight Plans — đầy đủ Fuel Order, Discrepancy, Extra Fuel Reason. Báo cáo phân tích tổng hợp thuộc Phân hệ 3 |
| **BR-TOSS-015** | Phân tích thời gian từng phase bay | S | *(thuộc Phân hệ 3 — Báo cáo)* | **Out-of-scope** module này |
| **BR-TOSS-016** | Báo cáo tải trọng, dịch vụ, tổ bay | S | *(thuộc Phân hệ 3 — Báo cáo)* | **Out-of-scope** module này |
| **BR-TOSS-017** | Xuất báo cáo đa định dạng (PDF, Excel, Docx) | M | G1: MM563, MM566 (Thông tin chi phí, lợi nhuận — view UI/API) | **Coverage gián tiếp** — view chi phí có khả năng kèm xuất; cần xác nhận MM xuất dữ liệu Flight Plan |
| **BR-TOSS-018** | Quản trị Dữ liệu chủ tập trung (Tàu bay, Sân bay, Chặng bay, Tổ bay) | M | *(thuộc Phân hệ 4 — Danh mục)* | **Out-of-scope** module này |
| **BR-TOSS-019** | Đồng bộ dữ liệu danh mục qua API/Webhook | M | *(thuộc Phân hệ 4 — Danh mục)* | **Out-of-scope** module này |
| **BR-TOSS-020** | Tham số vận hành hệ thống linh hoạt | M | *(thuộc Phân hệ 4 — Danh mục/Tham số)* | **Out-of-scope** module này |
| **BR-TOSS-021…025** | IAM (User Lifecycle, RBAC, MFA, SSO, Audit) | M | *(thuộc Phân hệ 5 — IAM)* | **Out-of-scope** module này |
| **BR-TOSS-026** | Đồng bộ trạng thái tài liệu với MO Plus theo thời gian thực | M | G1: MM571 (Sync data) · G4: MM689–696 (trạng thái confirm/reject/request) | **Coverage tốt** — sync data + trạng thái đầy đủ |
| **BR-TOSS-027** | Tích hợp Lido cho OFP, NOTAM, WX, Briefing | M | G4: MM659 (bóc OFP), MM660 (bóc NOTAM), MM661 (bóc WX) · G1: MM561, MM574 | **Coverage tốt** — xử lý bóc dữ liệu Lido có mặt cho 3 loại tài liệu chính |
| **BR-TOSS-028** | Tích hợp AMOS cho MEL/CDL/defects | M | G2: MM606, MM607, MM608, MM609 | **Coverage tốt** — MEL/CDL + lịch bảo dưỡng AOG |
| **BR-TOSS-029** | Tích hợp PSS/DCS cho dữ liệu thương mại | M | G4: MM649 (LS, GD, PM), MM655, MM656 (NOTOC, Cargo) | **Coverage tốt** — đầy đủ tài liệu thương mại |
| **BR-TOSS-030** | Liên kết Flight Radar24 | S | *(không có MM tương ứng — sẽ ở module bản đồ trực quan)* | **Gap** — cần xác nhận MM ở module Map |

---

## 2. Tổng kết coverage theo BR

| Mức coverage | Số BR | Mã BR |
|---|---|---|
| **Tốt / Đầy đủ trong module Flight Plans** | 11 | BR-001, 002 (một phần), 003 (một phần), 005, 006, 007, 008, 011 (một phần), 014, 026, 027, 028, 029 |
| **Out-of-scope module này (thuộc phân hệ khác)** | 14 | BR-010 (Mobile), 012–017 (Báo cáo), 018–020 (Danh mục), 021–025 (IAM) |
| **Gap — cần bổ sung MM hoặc nằm ở module chưa được liệt kê** | 3 | BR-004 (đa Carrier), BR-009 (upload thủ công khi mất kết nối), BR-030 (Flight Radar24 link) |

---

## 3. Tổng kết coverage theo MM (78 items)

| Tình trạng | Số MM | Ghi chú |
|---|---|---|
| **Đã map vào ≥ 1 BR** | 78 / 78 (100%) | Tất cả MM trong danh sách đều có BR cha hợp lệ |
| MM không có BR cha | 0 | Không có gap ngược |

**Kết luận:** Không có MM nào "lạc" khỏi BRD — tốt cho traceability ngược (MM → BR).

---

## 4. Khuyến nghị

1. **Phía BRD:** Cập nhật để bổ sung yêu cầu chi tiết hơn cho:
   - BR-TOSS-002: liệt kê đầy đủ kiểu cảnh báo (VIP, chậm chuyến, thiếu phép bay, thiếu điện văn) — hiện chỉ phủ MEL/CDL trong module này.
   - BR-TOSS-009: làm rõ chức năng upload thủ công khi mất kết nối tự động (hiện chỉ có view/xóa).
   - BR-TOSS-011: bổ sung yêu cầu cảnh báo Delta sai lệch Payload/ZFW (hiện chỉ có hiển thị tính toán).
2. **Phía danh sách MM (XLSX):**
   - **Cần xác nhận** có MM cho: cảnh báo VIP/chậm chuyến/thiếu phép bay, quản lý Divert chuyên biệt, upload thủ công khi auto-sync fail, cảnh báo Delta ZFW, xuất Flight Plan ra file (PDF/Excel).
   - **Đề xuất tách module:** đa Carrier (BR-004) và Flight Radar24 (BR-030) thuộc module cấu hình/map riêng — cần xác nhận với SH-10.
3. **Câu hỏi cần làm rõ:**
   - Q-TR-01: BR-TOSS-004 (đa Carrier) sẽ được phủ ở module nào trong cấu trúc XLSX tổng thể?
   - Q-TR-02: BR-TOSS-009 (giao diện dự phòng khi mất kết nối) có yêu cầu chức năng upload tài liệu thủ công không?
   - Q-TR-03: BR-TOSS-011 cảnh báo Delta tải trọng có MM tương ứng ở module nào?

---

*Ma trận này phục vụ Quality Gate giữa BRD và SRS — tuân thủ CLAUDE.md §0 (không suy diễn). Mọi nhận xét coverage dựa trực tiếp trên tên MM và mô tả BR. Cập nhật khi danh sách MM hoặc BRD thay đổi.*
