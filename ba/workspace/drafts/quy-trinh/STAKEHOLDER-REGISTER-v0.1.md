---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Danh sách Stakeholder"
---

# Stakeholder Register — TOSS

> Danh sách stakeholder dự án, mức độ ảnh hưởng và chiến lược giao tiếp. **BA Lead điền thông tin nhân sự cụ thể** vào các ô đánh dấu `*(chưa có)*`.

---

## 1. Phân loại Mức độ

| Ký hiệu | Mức ảnh hưởng | Mức quan tâm | Chiến lược |
|---|---|---|---|
| **P1** | Cao | Cao | Quản lý chặt chẽ — họp thường xuyên, cập nhật đầy đủ |
| **P2** | Cao | Thấp | Duy trì sự hài lòng — báo cáo tóm tắt định kỳ |
| **P3** | Thấp | Cao | Cung cấp thông tin — cập nhật khi có thay đổi lớn |
| **P4** | Thấp | Thấp | Theo dõi — email định kỳ |

---

## 2. Danh sách Stakeholder

### 2.1 Nghiệp vụ (Business)

| # | Vai trò | Họ tên | Đơn vị | Phân loại | Kỳ vọng chính | Kênh liên lạc |
|---|---|---|---|---|---|---|
| SH-01 | Project Sponsor | *(chưa có)* | *(chưa có)* | P1 | Dự án đúng tiến độ, đúng ngân sách | Họp hàng tháng |
| SH-02 | Operations Controller / Dispatcher | *(chưa có)* | Trung tâm Kiểm soát Khai thác (OCC) | P1 | Hệ thống theo dõi chuyến bay real-time, xử lý sự cố nhanh | Workshop, thử nghiệm UAT |
| SH-03 | Crew Scheduling Officer | *(chưa có)* | Phòng Lập lịch Tổ bay | P1 | Lập lịch tổ bay tuân thủ FTL, quản lý dự phòng | Workshop, thử nghiệm UAT |
| SH-04 | Ground Operations Manager | *(chưa có)* | Phòng Khai thác Mặt đất | P1 | Điều phối quay vòng đúng giờ, phân công nguồn lực | Workshop, thử nghiệm UAT |
| SH-05 | Maintenance Planner | *(chưa có)* | Phòng Kỹ thuật Tàu bay | P1 | Kế hoạch bảo dưỡng tối ưu, theo dõi MEL | Workshop, thử nghiệm UAT |
| SH-06 | Manager / Director | *(chưa có)* | Ban Lãnh đạo | P2 | Dashboard KPI, báo cáo an toàn | Báo cáo tháng |
| SH-07 | Safety & Compliance Officer | *(chưa có)* | Phòng An toàn | P1 | Tuân thủ CAAV, ICAO; nhật ký kiểm toán | Review yêu cầu |

### 2.2 Kỹ thuật (Technical)

| # | Vai trò | Họ tên | Đơn vị | Phân loại | Kỳ vọng chính | Kênh liên lạc |
|---|---|---|---|---|---|---|
| SH-08 | Solution Architect | *(chưa có)* | Viettel / đơn vị triển khai | P1 | Yêu cầu rõ ràng, interface contract đầy đủ | Họp kỹ thuật hàng tuần |
| SH-09 | Lead Developer | *(chưa có)* | Viettel / đơn vị triển khai | P1 | SRS không mơ hồ, wireframe đầy đủ | Họp sprint |
| SH-10 | QC Lead | *(chưa có)* | Viettel / đơn vị triển khai | P2 | Test case từ user story rõ ràng | Review SRS |
| SH-11 | Infrastructure / DevOps | *(chưa có)* | Viettel / đơn vị triển khai | P3 | NFR rõ: hiệu năng, bảo mật, uptime | Cung cấp thông tin |

### 2.3 Quản lý Dự án

| # | Vai trò | Họ tên | Phân loại | Kỳ vọng chính | Kênh liên lạc |
|---|---|---|---|---|---|
| SH-12 | Project Manager | *(chưa có)* | P1 | Tiến độ đúng hạn, risk được quản lý | Daily standup |
| SH-13 | BA Lead | *(chưa có)* | P1 | Yêu cầu đầy đủ, team BA hiệu quả | Liên tục |

---

## 3. Power-Interest Grid

```
HIGH POWER
    │  P2 (Keep Satisfied)    │  P1 (Manage Closely)
    │  SH-06, SH-09           │  SH-01, SH-02, SH-03
    │                          │  SH-04, SH-05, SH-07
    │                          │  SH-08, SH-12, SH-13
    ├──────────────────────────┤
    │  P4 (Monitor)           │  P3 (Keep Informed)
    │                          │  SH-10, SH-11
    │                          │
LOW POWER
         LOW INTEREST               HIGH INTEREST
```

---

## 4. Ma trận RACI — Hoạt động BA Chính

| Hoạt động | BA Lead | Senior BA | Mid BA | SH-01 | SH-02~07 | SH-08~11 |
|---|---|---|---|---|---|---|
| Phỏng vấn stakeholder | A | R | C | I | C | I |
| Phân tích yêu cầu | A | R | R | I | C | I |
| Review BRD | A | R | C | A | C | I |
| Review SRS | A | R | R | I | A | C |
| UAT Sign-off | I | I | I | A | R | C |

*R=Responsible, A=Accountable, C=Consulted, I=Informed*

---

## 5. Kế hoạch Giao tiếp

| Kênh | Tần suất | Nội dung | Đối tượng |
|---|---|---|---|
| Họp kickoff | 1 lần | Phạm vi, mục tiêu, phân công | Tất cả |
| Họp weekly sync | Hàng tuần | Tiến độ, vướng mắc, quyết định | P1 |
| Báo cáo tiến độ | Hàng tháng | KPI, milestone, risk | P1, P2 |
| Workshop yêu cầu | Theo phân hệ | Phỏng vấn, As-Is/To-Be | SH-02~07 |
| Email thông báo | Khi có milestone | Kết quả review, phiên bản mới | Tất cả |

---

## 6. Nội dung Cần Làm Rõ

- [ ] Điền tên + thông tin liên lạc cụ thể cho tất cả ô `*(chưa có)*`
- [ ] Xác nhận đơn vị tổ chức của stakeholder phía khách hàng
- [ ] Thêm stakeholder bên thứ ba (hệ thống ACARS, GDS, Voffice tích hợp) nếu có
