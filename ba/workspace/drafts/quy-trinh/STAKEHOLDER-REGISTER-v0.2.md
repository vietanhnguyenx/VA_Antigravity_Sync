---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Danh sách Stakeholder"
source: "[Nguồn: VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf §6 + VNA_TOSS.pptx §5]"
---

# Stakeholder Register — TOSS

> Cập nhật từ v0.1: bổ sung thông tin thực tế từ tài liệu nguồn. Cột **Họ tên** vẫn cần BA Lead điền sau khi có danh sách nhân sự chính thức từ VNA và VTIT.

---

## 1. Bối cảnh Dự án

| Trường | Giá trị |
|---|---|
| Khách hàng (Chủ quản) | Tổng công ty Hàng không Việt Nam (VNA / TCTHK) |
| Nhà cung cấp (Triển khai) | Công ty TNHH MTV Đầu tư Công nghệ Viettel (VTIT) |
| Hợp đồng | Thuê trọn gói T8/2026 – T8/2031 (5 năm, bao gồm vận hành 24/7) |
| Phạm vi | 5 phân hệ TOSS + vận hành hạ tầng + SLA ≥ 99% |

---

## 2. Phân loại Mức độ

| Ký hiệu | Mức ảnh hưởng | Mức quan tâm | Chiến lược |
|---|---|---|---|
| **P1** | Cao | Cao | Quản lý chặt — họp thường xuyên, cập nhật đầy đủ |
| **P2** | Cao | Thấp | Giữ hài lòng — báo cáo định kỳ, không làm phiền chi tiết |
| **P3** | Thấp | Cao | Cung cấp thông tin — cập nhật khi có thay đổi lớn |
| **P4** | Thấp | Thấp | Theo dõi — email định kỳ |

---

## 3. Danh sách Stakeholder

### 3.1 Phía VNA — Lãnh đạo & Chỉ đạo

| # | Vai trò | Họ tên | Đơn vị | Loại | Kỳ vọng chính | Kênh liên lạc |
|---|---|---|---|---|---|---|
| SH-01 | Đại diện VNA ký hợp đồng / Project Sponsor | *(cần điền)* | Ban TGĐ / VNA | P1 | Dự án đúng tiến độ, đúng phạm vi, đúng cam kết SLA 99% | Báo cáo tháng |
| SH-02 | Ban Chỉ đạo VNA | *(cần điền)* | Ban TGĐ | P2 | Dashboard tóm tắt KPI; không làm phiền chi tiết kỹ thuật | Báo cáo quý |
| SH-03 | Đầu mối CNTT & ATTT VNA | *(cần điền)* | Trung tâm CNTT VNA | P1 | Tích hợp đúng chuẩn với hệ thống VNA; bảo mật; quyền sở hữu code & data | Họp kỹ thuật tuần |

### 3.2 Phía VNA — Nghiệp vụ (Người dùng chính)

| # | Vai trò | Họ tên | Đơn vị | Loại | Kỳ vọng chính | Kênh liên lạc |
|---|---|---|---|---|---|---|
| SH-04 | Trực ban OCC | *(cần điền)* | Trung tâm OCC | P1 | Giám sát toàn bộ chuyến bay theo ca; cảnh báo màu tức thì; không bị crash ca đêm | Workshop + UAT |
| SH-05 | Điều phái (Dispatcher) | *(cần điền)* | OCC — Bộ phận Điều phái | P1 | Soạn + ký Dispatch Release số; nhúng NOTAM/WX/OFP; đồng bộ với tổ bay qua Mobile | Workshop + UAT |
| SH-06 | Chuyên viên CLC (Cân bằng tải) | *(cần điền)* | OCC — Bộ phận CLC | P1 | Nhập tải, kiểm tra cân bằng tự động, cảnh báo vượt giới hạn | Workshop + UAT |
| SH-07 | Đại diện Sân bay (Station) | *(cần điền)* | Các trạm sân bay VNA | P3 | Điều phối tại trạm; báo cáo sự kiện nhanh; hoạt động được khi offline ngắn | Cung cấp thông tin |
| SH-08 | Quản trị Danh mục | *(cần điền)* | OCC hoặc CNTT | P3 | Dữ liệu tàu bay/sân bay/chặng bay chuẩn, cập nhật MEL từ AMOS tự động | Cung cấp thông tin |
| SH-09 | Quản trị Hệ thống VNA | *(cần điền)* | CNTT VNA | P3 | SSO/LDAP, phân quyền RBAC, ghi vết kiểm toán đầy đủ | Cung cấp thông tin |

### 3.3 Phía VNA — Hệ thống Tích hợp (Technical Stakeholder)

| # | Hệ thống | Loại tích hợp | Đầu mối kỹ thuật | Ghi chú |
|---|---|---|---|---|
| SH-10 | Ops++ | Dữ liệu vào + ra | *(cần điền)* | Hệ thống khai thác chính VNA hiện tại |
| SH-11 | AVES | Dữ liệu vào | *(cần điền)* | Dữ liệu chuyến bay |
| SH-12 | FSS | Dữ liệu vào | *(cần điền)* | Fuel/flight status |
| SH-13 | Crew Trip | Dữ liệu vào | *(cần điền)* | Lịch bay tổ bay |
| SH-14 | MO+ | Dữ liệu vào + ra | *(cần điền)* | Đồng bộ tài liệu chuyến bay |
| SH-15 | MRO/AMOS | Dữ liệu vào | *(cần điền)* | MEL/CDL theo dõi bảo dưỡng |
| SH-16 | LIDO | Dữ liệu vào | *(cần điền)* | OFP/Flight plan |

### 3.4 Phía VTIT — Dự án

| # | Vai trò | Họ tên | Loại | Trách nhiệm |
|---|---|---|---|---|
| SH-17 | Giám đốc Dự án VTIT | *(cần điền)* | P1 | Điều phối toàn bộ VTIT; ký biên bản, leo thang vấn đề |
| SH-18 | Kiến trúc sư Giải pháp | *(cần điền)* | P1 | Kiến trúc hệ thống; quyết định kỹ thuật lớn |
| SH-19 | BA Lead (người dùng hiện tại) | sonpx@viettel.com.vn | P1 | Thu thập yêu cầu, tài liệu hóa, phối hợp stakeholder |
| SH-20 | Tech Lead / Lead Developer | *(cần điền)* | P1 | Nhận và triển khai SRS + wireframe |
| SH-21 | QA Lead | *(cần điền)* | P2 | Nhận test case từ BA, thiết kế test plan |
| SH-22 | DevOps & Bảo mật | *(cần điền)* | P3 | Hạ tầng, CI/CD, bảo mật; nhận NFR từ BA |

---

## 4. Power-Interest Grid

```
HIGH POWER
    │  P2 (Giữ hài lòng)       │  P1 (Quản lý chặt)
    │  SH-02 (Ban chỉ đạo)     │  SH-01 (Sponsor)
    │  SH-17 (PM VTIT)         │  SH-03 (CNTT VNA)
    │  SH-18 (Architect)       │  SH-04 (OCC)
    │                           │  SH-05 (Dispatcher)
    │                           │  SH-06 (CLC)
    │                           │  SH-19 (BA Lead)
    │                           │  SH-20 (Tech Lead)
    ├───────────────────────────┤
    │  P4 (Theo dõi)           │  P3 (Cung cấp thông tin)
    │  SH-22 (DevOps)          │  SH-07 (Station)
    │                           │  SH-08 (Quản trị DM)
    │                           │  SH-09 (Quản trị HT)
    │                           │  SH-21 (QA Lead)
    │                           │  SH-10..16 (Hệ thống)
    │
LOW POWER
         LOW INTEREST               HIGH INTEREST
```

---

## 5. Kế hoạch Giao tiếp

| Kênh | Tần suất | Nội dung | Đối tượng |
|---|---|---|---|
| Kickoff meeting | 1 lần | Phạm vi, phân công, cam kết | SH-01 đến SH-09 + VTIT |
| Review tiến độ | Chiều thứ Sáu hàng tuần | Tiến độ sprint, vướng mắc, quyết định | P1 |
| Workshop yêu cầu | Theo phân hệ (3 phân hệ đầu) | Phỏng vấn, As-Is/To-Be, xác nhận | SH-04 đến SH-09 |
| Báo cáo tháng | Cuối tháng | KPI, milestone, rủi ro | SH-01, SH-02 |
| Email thông báo | Khi có milestone | Phiên bản tài liệu mới, kết quả review | Tất cả |
| Phản hồi kỹ thuật | Trong 6 giờ (cam kết) | Vấn đề kỹ thuật khẩn | SH-03, SH-18, SH-20 |

---

## 6. Nội dung Cần Làm Rõ / Bổ sung

- [ ] Điền họ tên cụ thể cho tất cả SH từ VNA (liên hệ SH-01/SH-03 để lấy danh sách)
- [ ] Xác nhận đầu mối kỹ thuật cho từng hệ thống tích hợp (SH-10 đến SH-16)
- [ ] Hỏi VNA: có thêm stakeholder từ phòng An toàn Bay, Kỹ thuật không?
- [ ] Xác nhận kênh giao tiếp ưu tiên phía VNA (Teams / Email / Jira?)

*[Nguồn: VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf §6 — Cơ cấu phối hợp dự án]*
