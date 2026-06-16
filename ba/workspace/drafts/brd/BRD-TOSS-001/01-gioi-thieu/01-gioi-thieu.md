---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-10"
status: "Draft"
document_type: "BRD — §1 Giới thiệu"
parent: "BRD-TOSS-001-v0.2.md §1"
---

# §1 — Giới thiệu tài liệu

## 1.1 Mục đích
Tài liệu Yêu cầu Nghiệp vụ (Business Requirements Document — BRD) này mô tả **các nhu cầu nghiệp vụ cấp cao** mà Hệ thống Điều hành Khai thác Hãng Hàng không (TOSS) cần đáp ứng cho Tổng công ty Hàng không Việt Nam (Vietnam Airlines — VNA). Tài liệu là cơ sở để:
- Thống nhất phạm vi và mục tiêu giữa các bên liên quan (Stakeholders).
- Làm đầu vào cho Tài liệu Đặc tả Yêu cầu Phần mềm (SRS) và các tài liệu thiết kế chi tiết tiếp theo.
- Phục vụ kiểm soát thay đổi yêu cầu và truy vết (BR → FR → FUNC → US/UC → TC).

## 1.2 Phạm vi tài liệu
BRD mô tả **các nhu cầu nghiệp vụ** ở năm phân hệ chính của TOSS — KHÔNG mô tả chi tiết chức năng kỹ thuật, giao diện hay thuật toán (các nội dung này sẽ thuộc SRS/FRD). Phạm vi bao trùm:
- Thông tin điều hành chuyến bay (phân hệ lõi)
- Quản lý tài liệu chuyến bay (số hóa và vòng đời)
- Báo cáo và đánh giá tối ưu khai thác
- Quản lý danh mục (dữ liệu chủ)
- Quản trị hệ thống (IAM — định danh và phân quyền)
- Tích hợp với các hệ thống vệ tinh hiện hữu của VNA

## 1.3 Tài liệu tham chiếu

| Mã | Tên tài liệu | Vị trí |
|---|---|---|
| REF-01 | VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf | `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` |
| REF-02 | Tổng quan giải pháp (phân rã) | `ba/workspace/input/vnaocc-proposal-decomposed/01-tong-quan-giai-phap/` |
| REF-03 | Giải pháp nghiệp vụ — 5 phân hệ (phân rã) | `ba/workspace/input/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/` |
| REF-04 | Giải pháp kỹ thuật — Mục tiêu & Phạm vi | `ba/workspace/input/vnaocc-proposal-decomposed/03-giai-phap-ky-thuat/01-tong-quan-kien-truc-cong-nghe/` |
| REF-05 | Định cỡ hệ thống (Sizing) | `ba/workspace/input/vnaocc-proposal-decomposed/03-giai-phap-ky-thuat/13-sizing-he-thong/` |
| REF-06 | VNA_TOSS.pptx (bối cảnh & mục tiêu) | `ba/workspace/input/TOSS - Transformative Operations Support System.pdf` |
| REF-07 | CLAUDE.md §1–§3 | `d:\TOSS\CLAUDE.md` |
| REF-08 | MM-20260609 — Biên bản họp Thiết kế Function List / Menu + rà soát YCKT (09/06/2026) | `ba/workspace/input/Customer_docs/meeting-notes/MM-20260609-thiet-ke-function-list-YCKT-TOSS.md` *(từ transcript ASR; người dự/người quyết định chờ xác nhận)* |

## 1.4 Thuật ngữ & Viết tắt

| Viết tắt | Tiếng Việt | Giải nghĩa |
|---|---|---|
| TOSS | Hệ thống Tối ưu Điều hành Khai thác | Tail Operations Support System |
| VNA | Tổng công ty Hàng không Việt Nam | Vietnam Airlines |
| OCC | Trung tâm Kiểm soát Khai thác | Operational Control Center |
| OFP | Kế hoạch bay khai thác | Operational Flight Plan |
| NOTAM | Thông báo hàng không | Notice to Airmen |
| WX | Dữ liệu thời tiết | Weather |
| LS | Bảng cân bằng tải trọng | Load Sheet |
| GD | Tờ khai chung | General Declaration |
| GENDEC (CD/GDPM) | Tờ khai chung — danh sách tổ bay (phi công, tiếp viên, nhân viên mặt đất lên tàu) | General Declaration *(REF-08 §3)* |
| PM | Danh sách hành khách | Passenger Manifest |
| NOTOC | Thông báo hàng nguy hiểm cho Cơ trưởng — 2 loại: hành khách + cargo *(REF-08 §3)* | Notification to Captain |
| CM | Bản kê khai hàng hóa | Cargo Manifest |
| MEL/CDL | Danh mục thiết bị tối thiểu / Cấu hình tối thiểu | Minimum Equipment List / Configuration Deviation List |
| AOG | Tàu bay dừng bay do kỹ thuật | Aircraft on Ground |
| ULD | Thiết bị chất xếp | Unit Load Device |
| PF | Chỉ số hiệu suất tàu bay | Performance Factor |
| DOW | Trọng lượng khô của tàu bay | Dry Operating Weight |
| ZFW | Trọng lượng không nhiên liệu | Zero Fuel Weight |
| ACARS | Hệ thống liên lạc dữ liệu tàu bay – mặt đất | Aircraft Communications Addressing and Reporting System |
| APU | Động cơ phụ trợ trên tàu bay | Auxiliary Power Unit |
| Dry Lease | Thuê khô — thuê tàu bay không kèm tổ bay/dịch vụ *(REF-08 §5)* | — |
| Wet Lease | Thuê ướt — thuê tàu bay kèm phi công/tiếp viên/dịch vụ của bên cho thuê *(REF-08 §5)* | — |
| RBAC | Phân quyền dựa trên vai trò | Role-Based Access Control |
| MFA/2FA | Xác thực đa yếu tố / hai yếu tố | Multi-Factor / Two-Factor Authentication |
| SSO | Đăng nhập một lần | Single Sign-On |
| LDAP/AD | Giao thức truy cập thư mục / Active Directory | Lightweight Directory Access Protocol |
| SLA | Thỏa thuận mức dịch vụ | Service Level Agreement |
| OTP | Tỷ lệ đúng giờ | On-Time Performance |
| OSP | Hiệu suất bám sát lịch khai thác | Operational Schedule Performance |
| CCU | Người dùng đồng thời | Concurrent Users |
| FTL | Giới hạn thời gian bay | Flight Time Limitation |
| CAAV | Cục Hàng không Việt Nam | Civil Aviation Authority of Vietnam |
| ICAO | Tổ chức Hàng không Dân dụng Quốc tế | International Civil Aviation Organization |
| IATA | Hiệp hội Vận tải Hàng không Quốc tế | International Air Transport Association |
