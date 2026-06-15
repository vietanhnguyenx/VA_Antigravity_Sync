---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "BRD"
document_id: "BRD-TOSS-001"
---

# BRD-TOSS-001 — Tài liệu Yêu cầu Nghiệp vụ (Business Requirements Document)
## Hệ thống Điều hành Khai thác Hãng Hàng không (TOSS)

> **Lưu ý phương pháp luận:** Tài liệu này được biên soạn theo phương pháp **top-down** từ nguồn duy nhất là tài liệu `VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` (đã được phân rã trong thư mục `ba/workspace/input/vnaocc-proposal-decomposed/`). Mọi yêu cầu nghiệp vụ (BR) đều có nguồn trích dẫn cụ thể. Những nội dung chưa có trong nguồn được đánh dấu **`(chưa có — cần làm rõ qua phỏng vấn SH-XX)`** để Người dùng/Stakeholder xác nhận. Tuân thủ nguyên tắc `CLAUDE.md §0`: agent **phân rã + tái cấu trúc theo nguồn**, KHÔNG suy diễn.

---

## 1. Giới thiệu tài liệu

### 1.1 Mục đích
Tài liệu Yêu cầu Nghiệp vụ (Business Requirements Document — BRD) này mô tả **các nhu cầu nghiệp vụ cấp cao** mà Hệ thống Điều hành Khai thác Hãng Hàng không (TOSS) cần đáp ứng cho Tổng công ty Hàng không Việt Nam (Vietnam Airlines — VNA). Tài liệu là cơ sở để:
- Thống nhất phạm vi và mục tiêu giữa các bên liên quan (Stakeholders).
- Làm đầu vào cho Tài liệu Đặc tả Yêu cầu Phần mềm (SRS) và các tài liệu thiết kế chi tiết tiếp theo.
- Phục vụ kiểm soát thay đổi yêu cầu và truy vết (BR → FR → FUNC → US/UC → TC).

### 1.2 Phạm vi tài liệu
BRD mô tả **các nhu cầu nghiệp vụ** ở năm phân hệ chính của TOSS — KHÔNG mô tả chi tiết chức năng kỹ thuật, giao diện hay thuật toán (các nội dung này sẽ thuộc SRS/FRD). Phạm vi bao trùm:
- Thông tin điều hành chuyến bay (phân hệ lõi).
- Quản lý tài liệu chuyến bay (số hóa và vòng đời).
- Báo cáo và đánh giá tối ưu khai thác.
- Quản lý danh mục (dữ liệu chủ).
- Quản trị hệ thống (IAM — định danh và phân quyền).
- Tích hợp với các hệ thống vệ tinh hiện hữu của VNA.

### 1.3 Tài liệu tham chiếu

| Mã | Tên tài liệu | Vị trí |
|---|---|---|
| REF-01 | VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf | `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` |
| REF-02 | Tổng quan giải pháp (phân rã) | `ba/workspace/input/vnaocc-proposal-decomposed/01-tong-quan-giai-phap/` |
| REF-03 | Giải pháp nghiệp vụ (5 phân hệ — phân rã) | `ba/workspace/input/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/` |
| REF-04 | Giải pháp kỹ thuật — Mục tiêu & Phạm vi | `ba/workspace/input/vnaocc-proposal-decomposed/03-giai-phap-ky-thuat/01-tong-quan-kien-truc-cong-nghe/` |
| REF-05 | Định cỡ hệ thống (Sizing) | `ba/workspace/input/vnaocc-proposal-decomposed/03-giai-phap-ky-thuat/13-sizing-he-thong/` |
| REF-06 | VNA_TOSS.pptx (bối cảnh & mục tiêu) | `ba/workspace/input/VNA_TOSS.pptx` *(chưa được phân rã chi tiết tại thời điểm v0.1 — cần làm rõ)* |
| REF-07 | CLAUDE.md §1–§3 (bối cảnh dự án, miền nghiệp vụ, persona) | `d:\TOSS\CLAUDE.md` |

### 1.4 Thuật ngữ & Viết tắt

| Viết tắt | Tiếng Việt | Tiếng Anh / Giải nghĩa |
|---|---|---|
| TOSS | Hệ thống Tối ưu Điều hành Khai thác | Tail Operations Support System (tên dự án) |
| VNA | Tổng công ty Hàng không Việt Nam | Vietnam Airlines |
| OCC | Trung tâm Kiểm soát Khai thác | Operational Control Center |
| OFP | Kế hoạch bay khai thác | Operational Flight Plan |
| NOTAM | Thông báo hàng không | Notice to Airmen |
| WX | Dữ liệu thời tiết | Weather |
| LS | Bảng cân bằng tải trọng | Load Sheet |
| GD | Tờ khai chung | General Declaration |
| PM | Danh sách hành khách | Passenger Manifest |
| NOTOC | Thông báo hàng nguy hiểm cho Cơ trưởng | Notification to Captain |
| MEL/CDL | Danh mục thiết bị tối thiểu / Cấu hình tối thiểu | Minimum Equipment List / Configuration Deviation List |
| AOG | Tàu bay dừng bay do kỹ thuật | Aircraft on Ground |
| ULD | Thiết bị chất xếp | Unit Load Device |
| PF | Chỉ số hiệu suất tàu bay | Performance Factor |
| DOW | Trọng lượng khô của tàu bay | Dry Operating Weight |
| ZFW | Trọng lượng không nhiên liệu | Zero Fuel Weight |
| RBAC | Phân quyền dựa trên vai trò | Role-Based Access Control |
| MFA/2FA | Xác thực đa yếu tố / hai yếu tố | Multi-Factor / Two-Factor Authentication |
| SSO | Đăng nhập một lần | Single Sign-On |
| LDAP/AD | Giao thức truy cập thư mục / Active Directory | Lightweight Directory Access Protocol / Active Directory |
| SLA | Thỏa thuận mức dịch vụ | Service Level Agreement |
| OTP | Tỷ lệ đúng giờ | On-Time Performance |
| CDM | Ra quyết định hiệp đồng | Collaborative Decision Making |
| CCU | Người dùng đồng thời | Concurrent Users |
| FC | Chu kỳ bay | Flight Cycle |
| FTL | Giới hạn thời gian bay | Flight Time Limitation |
| CAAV | Cục Hàng không Việt Nam | Civil Aviation Authority of Vietnam |
| ICAO | Tổ chức Hàng không Dân dụng Quốc tế | International Civil Aviation Organization |
| IATA | Hiệp hội Vận tải Hàng không Quốc tế | International Air Transport Association |

---

## 2. Bối cảnh & Vấn đề Nghiệp vụ

### 2.1 Bối cảnh dự án
Ngành hàng không dân dụng đang chuyển từ mô hình quản trị phản ứng (reactive management) sang **tối ưu hóa dựa trên dữ liệu thực và dự báo (predictive optimization)**. VNA hiện vận hành trong môi trường có độ phức tạp cao: biến động giá nhiên liệu, áp lực về tỷ lệ đúng giờ (OTP), quy định an toàn bay khắt khe, đòi hỏi năng lực xử lý thông tin tập trung. Xu hướng chủ đạo là thay thế các hệ thống rời rạc bằng **kiến trúc nền tảng hợp nhất** luồng dữ liệu từ lịch bay, tổ bay, hành khách, kỹ thuật, NOTAM, khí tượng, theo dõi chuyến bay thời gian thực — nhằm thiết lập môi trường **Ra quyết định hiệp đồng (CDM)** và nâng cao **Năng lực nhận diện tình huống (Situational Awareness)**. *[Nguồn: REF-02 / 01-tong-quan-giai-phap.md §Tổng quan]*

### 2.2 Vấn đề hiện tại (Pain Points)
*Lưu ý: nguồn `VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` chỉ nêu **bối cảnh ngành**, không liệt kê pain point cụ thể của VNA dưới dạng danh sách. Mục dưới đây tổng hợp từ ngữ cảnh nguồn — phần chi tiết cần bổ sung qua phỏng vấn stakeholder.*

| Mã | Pain Point (từ nguồn) | Trích dẫn |
|---|---|---|
| PP-01 | Hệ thống điều hành hiện tại còn **rời rạc**, dữ liệu phân tán nhiều nguồn, thiếu khả năng hợp nhất | REF-02 §Tổng quan |
| PP-02 | Quản lý tài liệu chuyến bay (OFP, NOTAM, WX, LS, GD, PM, NOTOC, Manifest…) chưa được **số hóa và kiểm soát phiên bản** toàn diện | REF-03 / 02-phan-he-quan-ly-tai-lieu-chuyen-bay.md |
| PP-03 | Thiếu **báo cáo phân tích tổng hợp** trên nguồn dữ liệu duy nhất, gây khó khăn cho công tác đánh giá tối ưu khai thác | REF-03 / 03-phan-he-quan-ly-bao-cao-danh-gia-toi-uu-khai-thac.md |
| PP-04 | Tích hợp giữa các hệ thống còn theo mô hình **point-to-point**, khó mở rộng và kiểm soát | REF-04 / III.1.1 §Tích hợp |
| PP-05 | Chưa có cơ chế **quản lý danh mục dữ liệu chủ tập trung (Single Source of Truth)** cho tàu bay, sân bay, chặng bay, tổ bay | REF-03 / 04-phan-he-quan-ly-danh-muc.md |
| PP-06 | Pain point chi tiết theo từng vai trò (Dispatcher, Crew Scheduling, Ground Ops, Maintenance Planner, Director) | *(chưa có — cần làm rõ qua phỏng vấn SH-01…SH-05)* |

### 2.3 Cơ hội cải thiện
- Thiết lập **môi trường dữ liệu hợp nhất** (converged data) cho điều hành khai thác. *[REF-02]*
- **Số hóa toàn diện** vòng đời tài liệu chuyến bay với kiểm soát phiên bản (Revision Control). *[REF-03 / 02]*
- Hợp nhất báo cáo trên **một nguồn dữ liệu duy nhất** sau khi thu thập đa nguồn, làm sạch và chuẩn hóa. *[REF-03 / 03]*
- Triển khai chính sách **tối ưu mang dầu bổ sung (Tankering Strategy)** mang tính khuyến nghị nhằm tiết giảm chi phí nhiên liệu. *[REF-03 / 03]*
- Đảm bảo **tuân thủ Nghị định 53/2022/NĐ-CP** (lưu trữ dữ liệu tại Việt Nam) và **Nghị định 13/2023/NĐ-CP** (bảo vệ dữ liệu cá nhân). *[REF-02]*

---

## 3. Mục tiêu Nghiệp vụ (Business Goals)

Trích từ REF-04 / 01-muc-tieu.md và REF-02:

| Mã | Mục tiêu nghiệp vụ | Nguồn |
|---|---|---|
| **BG-001** | Cung cấp **nền tảng công nghệ thống nhất, hiện đại** đáp ứng yêu cầu quản lý, điều hành và tối ưu hóa hoạt động khai thác của VNA trong môi trường đa hệ thống | REF-04 §Mục tiêu |
| **BG-002** | **Chuẩn hóa và tập trung hóa dữ liệu khai thác**, đảm bảo dữ liệu được quản lý tập trung, có kiểm soát chất lượng và lịch sử thay đổi | REF-04 §Mục tiêu |
| **BG-003** | Xây dựng **nền tảng tích hợp (Integration Layer) thống nhất** — loại bỏ kết nối point-to-point, thay bằng API Gateway và dịch vụ trung gian | REF-04 §Mục tiêu |
| **BG-004** | Hỗ trợ **xử lý dữ liệu thời gian thực và gần thời gian thực** (streaming + batch song song), độ trễ thấp | REF-04 §Mục tiêu |
| **BG-005** | Đảm bảo **hiệu năng, khả năng mở rộng theo tải** và **tính sẵn sàng cao** (HA) — vận hành liên tục 24/7/365 | REF-04 §Mục tiêu + REF-02 |
| **BG-006** | Thiết lập **cơ chế bảo mật, định danh và phân quyền tập trung** (SSO, RBAC, LDAP/AD, MFA), ghi log/audit phục vụ kiểm toán | REF-04 §Mục tiêu + REF-03 / 05 |
| **BG-007** | **Tuân thủ pháp luật Việt Nam** — Nghị định 53/2022/NĐ-CP (lưu trữ dữ liệu trên lãnh thổ VN) và Nghị định 13/2023/NĐ-CP (bảo vệ dữ liệu cá nhân) | REF-02 §Pháp lý |
| **BG-008** | Đảm bảo **quyền sở hữu toàn diện** của VNA đối với kiến trúc, mã nguồn và dữ liệu khai thác | REF-02 §Pháp lý |
| **BG-009** | Hiện thực hóa mục tiêu trở thành **hãng hàng không số hàng đầu** của VNA thông qua nền tảng số sẵn sàng tích hợp các công nghệ phân tích tiên tiến trong tương lai | REF-03 / 00-tong-quan-nghiep-vu.md |

---

## 4. Phạm vi Dự án

### 4.1 Trong phạm vi (In-Scope)
Hệ thống TOSS bao gồm **5 phân hệ nghiệp vụ chính** *[Nguồn: REF-03 / 00-tong-quan-nghiep-vu.md]*:

1. **Phân hệ Thông tin điều hành chuyến bay** — tích hợp đa nguồn, giám sát thông tin chuyến bay, tàu bay, tổ bay, tải trọng, hành khách, đường bay, nhiên liệu, khai thác sân bay, ghi nhận bất thường và giám sát tài liệu. *[REF-03 / 01]*
2. **Phân hệ Quản lý tài liệu chuyến bay** — số hóa vòng đời OFP, NOTAM, WX, Briefing Package, LS, GD, PM, NOTOC, Cargo/Mail Manifest; quản lý phiên bản; luồng xác thực (Request/Confirm/Reject); giao diện độc lập dự phòng; phiên bản Web Mobile (iOS, Android, iPadOS). *[REF-03 / 02]*
3. **Phân hệ Quản lý báo cáo, đánh giá tối ưu khai thác** — báo cáo khai thác hàng ngày, OTP, nhiên liệu, thời gian thực hiện chuyến bay, OFP và dữ liệu bay thực tế, tải trọng, dịch vụ, tổ bay, bất thường và môi trường. *[REF-03 / 03]*
4. **Phân hệ Quản lý danh mục** — dữ liệu chủ (Master Data) cho tàu bay, sân bay, chặng bay & tối ưu hóa, danh mục bổ trợ và tham số hệ thống; kiểm soát phiên bản; đồng bộ chủ động qua API/Webhook. *[REF-03 / 04]*
5. **Phân hệ Quản trị hệ thống (IAM)** — quản lý vòng đời người dùng, RBAC, chính sách truy cập động, phân quyền thời gian thực, MFA/2FA, SSO, tích hợp LDAP/AD, kiểm soát phiên, audit log. *[REF-03 / 05]*

**Các hệ thống/dịch vụ vệ tinh được TOSS tích hợp** (theo nguồn): MO Plus, Lido, AMOS, PSS/DCS, Flight Radar24, LDAP/AD của Tổng công ty. *[REF-03 / 01, 02, 04, 05]*

### 4.2 Ngoài phạm vi (Out-of-Scope)
Các nội dung dưới đây **KHÔNG thuộc phạm vi TOSS** dựa trên cách nguồn mô tả TOSS như một hệ thống điều hành khai thác (chứ không phải hệ thống lõi của các mảng dưới):

| # | Hạng mục ngoài phạm vi | Lý do/Ghi chú |
|---|---|---|
| OOS-01 | Hệ thống lập kế hoạch bay chi tiết (Lido) — TOSS chỉ **đồng bộ** OFP từ Lido, không thay thế Lido | REF-03 / 02 |
| OOS-02 | Hệ thống quản lý bảo dưỡng tàu bay (AMOS) — TOSS chỉ **đồng bộ** MEL/CDL/defects từ AMOS | REF-03 / 04 |
| OOS-03 | Hệ thống PSS/DCS (đặt chỗ, làm thủ tục hành khách) — TOSS chỉ **thu nạp** dữ liệu thương mại từ PSS/DCS | REF-03 / 02 |
| OOS-04 | Hệ thống MO Plus — TOSS chỉ **đồng bộ trạng thái tài liệu** với MO Plus theo thời gian thực | REF-02 |
| OOS-05 | Theo dõi vị trí tàu bay theo thời gian thực — TOSS cung cấp **liên kết nhúng** Flight Radar24, không tự xây dựng năng lực này | REF-03 / 01 |
| OOS-06 | Hệ thống LDAP/AD của VNA — TOSS **tích hợp** chứ không thay thế | REF-03 / 05 |
| OOS-07 | Phạm vi nghiệp vụ chi tiết khác như: rostering tổ bay nâng cao, dispatching tự động, an toàn — báo cáo sự cố, ground handling chi tiết (turnaround, gate assignment) | *(chưa có — cần làm rõ qua phỏng vấn SH-01, SH-04; CLAUDE.md §2 có nêu các mảng này nhưng nguồn PDF không khẳng định TOSS đảm nhận đầy đủ)* |

### 4.3 Ranh giới hệ thống (System Boundary)
TOSS là **nền tảng hợp nhất** giữa các hệ thống vệ tinh, đóng vai trò:
- **Người tiêu thụ dữ liệu** (consumer): từ Lido, AMOS, PSS/DCS, MO Plus, các nguồn NOTAM/WX, LDAP/AD.
- **Người cung cấp dữ liệu** (provider): cung cấp dữ liệu chủ (Master Data) cho hệ sinh thái VNA thông qua API/Webhook.
- **Trung tâm xác thực** (Authentication Service) độc lập — các hệ thống khác trong mạng VNA có thể sử dụng chung. *[REF-03 / 05]*

---

## 5. Stakeholders

Bảng dưới đây tổng hợp từ CLAUDE.md §3 (persona) và các đối tượng được nhắc trong nguồn PDF. Mức độ ảnh hưởng/quan tâm theo khung **P1 (chủ động cao, ảnh hưởng cao)** đến **P4 (giám sát).**

| Mã | Vai trò | Tổ chức | Loại | Kỳ vọng / Mối quan tâm chính | Nguồn |
|---|---|---|---|---|---|
| SH-01 | Điều phái viên / Điều hành viên (Operations Controller / Dispatcher) | OCC — VNA | P1 | Giám sát chuyến bay thời gian thực, quản lý gián đoạn, tuân thủ quy định | CLAUDE.md §3; REF-03 / 01 |
| SH-02 | Cán bộ Lịch trình tổ bay (Crew Scheduling Officer) | VNA | P1 | Tuân thủ FTL, theo dõi giờ bay/giờ làm việc, quản lý tổ bay dự bị | CLAUDE.md §3; REF-03 / 01 |
| SH-03 | Phi hành đoàn (Phi công, Tiếp viên) | VNA | P1 | Truy cập tài liệu chuyến bay (OFP, NOTAM, WX, Briefing) qua Web Mobile; xác nhận điện tử (Confirm/Reject) | REF-03 / 02 |
| SH-04 | Quản lý Khai thác mặt đất (Ground Operations Manager) | VNA | P2 | Phối hợp turnaround, gate, dịch vụ mặt đất, OTP | CLAUDE.md §3 |
| SH-05 | Kỹ sư Kế hoạch Bảo dưỡng (Maintenance Planner) | VNA | P2 | Đồng bộ MEL/CDL/defects từ AMOS, theo dõi AOG, chu kỳ bay (FC) | REF-03 / 01, 04 |
| SH-06 | Lãnh đạo / Giám đốc khai thác (Manager / Director) | VNA | P2 | Dashboard OTP, KPI khai thác, chỉ số an toàn, kiểm toán | CLAUDE.md §3 |
| SH-07 | Quản trị viên Hệ thống (System Administrator) | VNA — IT | P1 | Quản lý vòng đời người dùng, RBAC, MFA, log/audit, vận hành 24/7 | REF-03 / 05 |
| SH-08 | Đại diện cơ quan quản lý hàng không | CAAV | P3 | Tuân thủ ICAO, IATA, quy định an toàn | CLAUDE.md §2 |
| SH-09 | Cơ quan quản lý nhà nước về CNTT & dữ liệu | (Bộ TT&TT / Bộ Công an) | P3 | Tuân thủ NĐ 53/2022 và NĐ 13/2023 | REF-02 |
| SH-10 | Chủ sở hữu sản phẩm phía VNA (Product Owner) | VNA | P1 | Phê duyệt yêu cầu, ra quyết định nghiệp vụ | *(chưa có — cần làm rõ tên cụ thể qua phỏng vấn)* |
| SH-11 | Nhà cung cấp giải pháp (Viettel) | Viettel | P1 | Triển khai, vận hành, bảo trì TOSS theo SLA | REF-01 |

> **Ghi chú:** Bản đồ RACI chi tiết theo từng phân hệ và quy trình sẽ được lập riêng trong Tài liệu Phân công vai trò (`PHAN-CONG-ROLE-BA-vX.Y.md`) khi đã có danh sách nhân sự cụ thể. *(chưa có — cần làm rõ qua phỏng vấn SH-10)*

---

## 6. Yêu cầu Nghiệp vụ (Business Requirements)

> **Quy tắc:** Mỗi BR mô tả **NHU CẦU NGHIỆP VỤ** (TẠI SAO làm), KHÔNG mô tả chức năng kỹ thuật (LÀM GÌ — sẽ ở SRS). Ưu tiên theo **MoSCoW**: **M** = Must Have, **S** = Should Have, **C** = Could Have, **W** = Won't Have (giai đoạn này).

### 6.1 Phân hệ Thông tin điều hành chuyến bay

| Mã | Tên | Mô tả nhu cầu nghiệp vụ | Nguồn | Ưu tiên |
|---|---|---|---|---|
| **BR-TOSS-001** | Hợp nhất thông tin chuyến bay đa chiều | VNA cần một **bức tranh toàn cảnh duy nhất** về mỗi chuyến bay, hội tụ thông tin kế hoạch (STD/STA), dự kiến (ETD/ETA), thực tế (ATD/ATA), tàu bay, cabin, thời tiết, NOTAM, tổ bay, hành khách, hàng hóa, doanh thu, chi phí | REF-03 / 01 §Thông tin chuyến bay | M |
| **BR-TOSS-002** | Nhận diện bất thường trong khai thác bằng cảnh báo trực quan | Điều phái viên cần **phát hiện nhanh các bất thường** (MEL/CDL, hỏng hóc cabin, khách VIP, khách nối chuyến, hệ số lấp đầy thấp, chậm chuyến, thiếu phép bay, thiếu điện văn) để xử lý kịp thời | REF-03 / 01 §Hệ thống cảnh báo thông minh | M |
| **BR-TOSS-003** | Truy vết lịch sử thay đổi chuyến bay & chuyến chuyển hướng (Divert) | VNA cần khả năng **xem lại lịch sử thay đổi** (thời gian, tàu bay, loại chuyến, trạng thái) và quản lý đầy đủ thông tin chuyến chuyển hướng phục vụ đối soát và rút kinh nghiệm | REF-03 / 01 §Truy vết và Đối soát | M |
| **BR-TOSS-004** | Quản trị đa Carrier trên cùng nền tảng | VNA cần điều hành đồng thời **nhiều hãng vận chuyển (Carriers)** trên cùng một nền tảng TOSS | REF-03 / 01 §Quản trị đa Carrier | S |
| **BR-TOSS-005** | Giám sát tổ bay tuân thủ giới hạn an toàn (FTL) | Cán bộ Lịch trình tổ bay cần theo dõi nghiêm ngặt **giờ bay (Flight Time) và giờ làm việc (Duty Time)** đảm bảo không vi phạm giới hạn an toàn hàng không | REF-03 / 01 §Thông tin tổ bay | M |

### 6.2 Phân hệ Quản lý tài liệu chuyến bay

| Mã | Tên | Mô tả nhu cầu nghiệp vụ | Nguồn | Ưu tiên |
|---|---|---|---|---|
| **BR-TOSS-006** | Số hóa & quản lý vòng đời tài liệu khai thác bay | VNA cần **trung tâm quản lý tập trung** dạng số hóa toàn bộ tài liệu khai thác: OFP, NOTAM, WX, Briefing Package, LS, GD, PM, NOTOC Cargo/Baggage, Cargo Manifest, Mail Manifest | REF-02 + REF-03 / 02 | M |
| **BR-TOSS-007** | Kiểm soát phiên bản tài liệu (Revision Control) | Mọi tài liệu chuyến bay cần được **kiểm soát phiên bản** với lịch sử ban hành chi tiết (người tạo, thời gian, thông số kỹ thuật) để bảo đảm tính toàn vẹn | REF-03 / 02 §Quản lý đa phiên bản | M |
| **BR-TOSS-008** | Luồng xác thực điện tử Request/Confirm/Reject | VNA cần ghi nhận **trạng thái xác thực thời gian thực** của tài liệu bởi từng đối tượng (Phi hành đoàn, Điều phái) — yêu cầu, xác nhận hoặc từ chối — kèm dấu thời gian | REF-02 + REF-03 / 02 §Confirmation Workflow | M |
| **BR-TOSS-009** | Đảm bảo tính liên tục khi mất kết nối tự động | Khi các kênh tích hợp tự động gặp sự cố, nhân viên điều phái vẫn phải có **giao diện và phương thức độc lập** để cung cấp tài liệu cho tổ bay trước giờ khởi hành theo quy định khai thác | REF-02 + REF-03 / 02 §Tính linh hoạt và Khả năng dự phòng | M |
| **BR-TOSS-010** | Truy cập tài liệu cho phi hành đoàn tại hiện trường (Web Mobile) | Phi công và tổ bay cần **xem tài liệu, xác nhận điện tử ngay tại hiện trường** trên thiết bị di động (iOS, Android, iPadOS) | REF-03 / 02 §Hỗ trợ di động toàn diện | M |
| **BR-TOSS-011** | Đối soát an toàn tải trọng giữa OFP và thực tế | VNA cần **đối soát Payload/ZFW** giữa OFP và tính toán thực tế (Khách + Hành lý + Hàng + Mail + ULD); cảnh báo khi sai lệch (Delta) để ra quyết định kịp thời | REF-03 / 02 §Quản lý tải trọng | M |

### 6.3 Phân hệ Báo cáo & Tối ưu khai thác

| Mã | Tên | Mô tả nhu cầu nghiệp vụ | Nguồn | Ưu tiên |
|---|---|---|---|---|
| **BR-TOSS-012** | Báo cáo khai thác hàng ngày tổng hợp tự động | VNA cần **báo cáo tổng hợp 24 giờ** toàn mạng bay, tự động thu thập từ các nguồn tích hợp, có luồng rà soát/xác nhận trước khi gửi đầu mối nhận | REF-03 / 03 §Báo cáo thông tin khai thác hàng ngày | M |
| **BR-TOSS-013** | Đánh giá hiệu suất đúng giờ (OTP/OSP) & biến động lịch bay | Lãnh đạo cần **phân tích tỷ lệ chuyến bay đúng giờ**, thống kê chậm chuyến, chuyển hướng, đổi giờ/tàu/cấu hình/code/hủy chuyến | REF-03 / 03 §Báo cáo OTP | M |
| **BR-TOSS-014** | Phân tích tiêu thụ nhiên liệu & tối ưu Tankering | VNA cần **kiểm soát chi phí nhiên liệu trọng yếu** thông qua phân tích Fuel/FH, đối soát kế hoạch–thực tế, giám sát Pilot Extra Fuel, và khuyến nghị mang dầu bổ sung (Tankering) | REF-02 + REF-03 / 03 §Báo cáo nhiên liệu | M |
| **BR-TOSS-015** | Phân tích thời gian thực hiện chuyến bay theo từng phase | VNA cần **phân tích thời gian từng giai đoạn bay** (Taxi-out, Takeoff, Climb, Cruise, Descent, Taxi-in, Holding, Ground/Turnaround Time) để tìm cơ hội tối ưu | REF-03 / 03 §Báo cáo thời gian thực hiện chuyến bay | S |
| **BR-TOSS-016** | Báo cáo tải trọng, dịch vụ và quản trị nguồn lực tổ bay | VNA cần báo cáo **Load Factor, booking, VIP/CIP, hành lý, Cargo Manifest, NOTOC**, đồng thời theo dõi mục tiêu giờ bay của phi công/tiếp viên và các vi phạm quy định | REF-03 / 03 §Báo cáo tải trọng, dịch vụ và Tổ bay | S |
| **BR-TOSS-017** | Xuất báo cáo đa định dạng & bộ lọc linh hoạt | Người dùng cần **tùy chọn cột hiển thị** và **xuất báo cáo** ra PDF, Excel, Docx phục vụ truyền thông và lưu trữ | REF-03 / 03 §Mở đầu | M |

### 6.4 Phân hệ Quản lý danh mục

| Mã | Tên | Mô tả nhu cầu nghiệp vụ | Nguồn | Ưu tiên |
|---|---|---|---|---|
| **BR-TOSS-018** | Quản trị Dữ liệu chủ tập trung (Single Source of Truth) | VNA cần duy trì **tính nhất quán dữ liệu chủ** cho các danh mục cốt lõi: Tàu bay, Sân bay, Chặng bay, Tổ bay — theo cấu trúc metadata chuẩn, có quản lý phiên bản và lưu vết | REF-02 + REF-03 / 04 §Đặc tính quản trị nền tảng | M |
| **BR-TOSS-019** | Đồng bộ dữ liệu danh mục cho hệ sinh thái qua API/Webhook | VNA cần **chủ động đẩy dữ liệu danh mục** ra các hệ thống vệ tinh theo phân quyền ngay khi phát sinh thay đổi | REF-02 + REF-03 / 04 §Đồng bộ hóa dữ liệu chủ động | M |
| **BR-TOSS-020** | Tham số vận hành hệ thống linh hoạt cho người dùng có thẩm quyền | VNA cần **cấu hình tham số nghiệp vụ trên giao diện** (hệ số độ tin cậy chuyến bay, ngưỡng chênh lệch nhiên liệu, ngưỡng chênh lệch trọng tải, deadline OFP, thời gian cảnh báo thiếu tài liệu) mà không cần triển khai mã nguồn | REF-03 / 04 §Tham số vận hành hệ thống | M |

### 6.5 Phân hệ Quản trị hệ thống (IAM)

| Mã | Tên | Mô tả nhu cầu nghiệp vụ | Nguồn | Ưu tiên |
|---|---|---|---|---|
| **BR-TOSS-021** | Quản trị vòng đời người dùng tập trung | VNA cần **quản lý toàn bộ vòng đời người dùng** (tạo mới, sửa đổi, vô hiệu hóa, kích hoạt lại, xóa) bảo đảm minh bạch và an toàn dữ liệu điều hành | REF-03 / 05 §Quản lý thực thể người dùng | M |
| **BR-TOSS-022** | Phân quyền chi tiết theo vai trò (RBAC) tới từng API | VNA cần **gán vai trò (Role) hoặc nhóm quyền (Group)** ánh xạ tới từng phân hệ, dịch vụ nghiệp vụ và phương thức API riêng biệt, bảo vệ dữ liệu nhạy cảm | REF-02 + REF-03 / 05 §RBAC | M |
| **BR-TOSS-023** | Xác thực mạnh (MFA/2FA) cho quản trị viên & dữ liệu nhạy cảm | VNA cần **bắt buộc xác thực đa yếu tố** đối với quản trị viên và tài khoản truy cập dữ liệu nhạy cảm | REF-02 + REF-03 / 05 §MFA | M |
| **BR-TOSS-024** | SSO & tích hợp danh tính LDAP/AD của VNA | Người dùng VNA cần **đăng nhập một lần** truy cập nhiều phân hệ/ứng dụng vệ tinh; hệ thống tích hợp với LDAP/AD hiện hữu | REF-02 + REF-03 / 05 §SSO | M |
| **BR-TOSS-025** | Lưu vết & kiểm toán toàn diện | Mọi hành vi đăng nhập, thay đổi quyền hạn, truy cập tài nguyên/dữ liệu nghiệp vụ cần được **ghi nhật ký chi tiết** phục vụ kiểm toán bảo mật, phân tích rủi ro và xử lý sự cố | REF-02 + REF-03 / 05 §Lưu vết và Kiểm toán | M |

### 6.6 Yêu cầu Tích hợp

| Mã | Tên | Mô tả nhu cầu nghiệp vụ | Nguồn | Ưu tiên |
|---|---|---|---|---|
| **BR-TOSS-026** | Đồng bộ trạng thái tài liệu với MO Plus theo thời gian thực | TOSS cần **đồng bộ trạng thái tài liệu** (Request/Confirm/Reject + dấu thời gian) hai chiều với MO Plus | REF-02 §Số hóa và quản lý vòng đời tài liệu | M |
| **BR-TOSS-027** | Tích hợp Lido cho OFP, NOTAM, WX, Briefing Package | TOSS cần **tự động đồng bộ** Kế hoạch bay và tài liệu hàng không từ Lido | REF-03 / 02 §Tích hợp và Thu nạp tự động | M |
| **BR-TOSS-028** | Tích hợp AMOS cho MEL/CDL/defects | TOSS cần **đồng bộ MEL/CDL và hỏng hóc** từ AMOS, hỗ trợ lọc theo nhóm ảnh hưởng và highlight lỗi mới | REF-03 / 04 §MEL/CDL | M |
| **BR-TOSS-029** | Tích hợp PSS/DCS cho dữ liệu thương mại | TOSS cần **tự động tích hợp** LS, GD, PM, NOTOC, Cargo/Mail Manifest từ PSS/DCS vào từng chuyến bay tương ứng | REF-03 / 02 §Hợp nhất dữ liệu thương mại | M |
| **BR-TOSS-030** | Liên kết theo dõi vị trí tàu bay (Flight Radar24) | TOSS cần **liên kết nhúng** để xem vị trí và hành trình bay thực tế qua Flight Radar24 | REF-03 / 01 §Tích hợp bản đồ trực quan | S |

---

## 7. Ràng buộc (Constraints)

### 7.1 Ràng buộc Pháp lý
| Mã | Ràng buộc | Nguồn |
|---|---|---|
| CON-LEG-01 | Tuân thủ **Nghị định 53/2022/NĐ-CP** — toàn bộ dữ liệu khai thác phải lưu trữ trên lãnh thổ Việt Nam | REF-02 §Pháp lý |
| CON-LEG-02 | Tuân thủ **Nghị định 13/2023/NĐ-CP** — bảo vệ dữ liệu cá nhân (hành khách, nhân sự, tổ bay) | REF-02 §Pháp lý |
| CON-LEG-03 | Tuân thủ quy định an toàn bay của **CAAV** và các tiêu chuẩn quốc tế (**ICAO Annex 6, IATA OCC standards**) | CLAUDE.md §2 |
| CON-LEG-04 | **Quyền sở hữu toàn diện** đối với kiến trúc, mã nguồn, dữ liệu khai thác thuộc về VNA | REF-02 §Pháp lý |

### 7.2 Ràng buộc Kỹ thuật
| Mã | Ràng buộc | Nguồn |
|---|---|---|
| CON-TEC-01 | Kiến trúc **Microservices, Cloud-native theo chuẩn CNCF**, tách biệt tầng giao diện – nghiệp vụ – dữ liệu | REF-02 + REF-04 |
| CON-TEC-02 | **SLA tối thiểu 99%** về độ sẵn sàng cao (High Availability) | REF-02 §Giám sát vận hành |
| CON-TEC-03 | Sizing: hỗ trợ **200 CCU**, **500 request/giây**, **10 KB/request** | REF-05 §Sizing |
| CON-TEC-04 | Dung lượng dữ liệu mục tiêu: **5 TB** (1.5 TB DB + 3.5 TB file) | REF-05 §Sizing |
| CON-TEC-05 | **Tái sử dụng một phần** hệ thống giám sát của MO Plus | REF-05 §Sizing |
| CON-TEC-06 | Tích hợp qua **API Gateway** + Webhook + Message Queue, loại bỏ kết nối point-to-point | REF-02 + REF-04 |
| CON-TEC-07 | Hỗ trợ song song **Batch + Streaming** (ví dụ Kafka/Spark Streaming) | REF-02 §Nền tảng lưu trữ |
| CON-TEC-08 | Đa định dạng dữ liệu: SQL, JSON/XML, phi cấu trúc (PDF, ảnh) | REF-02 |
| CON-TEC-09 | Phiên bản Web Mobile tương thích **iOS, Android, iPadOS** | REF-03 / 02 §Web Mobile |

### 7.3 Ràng buộc Thời gian & Phạm vi triển khai
| Mã | Ràng buộc | Nguồn |
|---|---|---|
| CON-TIM-01 | Mốc thời gian triển khai TOSS: **T8/2026 → T8/2031** *(theo yêu cầu task; chưa thấy mốc cụ thể trong các file phân rã đã đọc)* | *(chưa có — cần đối chiếu trong PDF nguồn gốc; cần làm rõ qua SH-10/SH-11)* |
| CON-TIM-02 | Dự án hiện đang ở **giai đoạn Discovery & Requirements Analysis** | CLAUDE.md §1 |
| CON-TIM-03 | Workflow tài liệu áp dụng: **P4 — Co-evolution Hybrid** (phân tích chức năng + mô hình dữ liệu song song với wireframe/mockup) | CLAUDE.md §1 |

---

## 8. Giả định & Phụ thuộc

### 8.1 Giả định (Assumptions)
| Mã | Giả định | Cần xác nhận bởi |
|---|---|---|
| ASM-01 | Các hệ thống vệ tinh (Lido, AMOS, PSS/DCS, MO Plus, LDAP/AD) **hiện có và sẵn sàng cung cấp API/Webhook/cơ chế đồng bộ** cho TOSS | SH-07, SH-11 |
| ASM-02 | VNA sẽ **cung cấp tài khoản truy cập** vào các hệ thống vệ tinh để TOSS tích hợp | SH-10, SH-07 |
| ASM-03 | VNA đã có **danh sách vai trò (Role) và ma trận phân quyền** ban đầu để khởi tạo RBAC | SH-07 |
| ASM-04 | VNA sẵn sàng **tham gia phỏng vấn stakeholder** (SH-01…SH-07) trong giai đoạn Discovery để xác nhận pain point và quy trình As-Is | SH-10 |
| ASM-05 | Hạ tầng cloud (theo bảng Sizing — Server Cloud, Cloud Firewall, Cloud Backup, Hybrid Connect) sẽ được **Viettel cung cấp** theo Đề xuất kỹ thuật | REF-05 |
| ASM-06 | Vận hành liên tục **24/7/365** | REF-03 / 00 |

### 8.2 Phụ thuộc bên ngoài
| Mã | Phụ thuộc | Bên cung cấp |
|---|---|---|
| DEP-01 | Dữ liệu OFP, NOTAM, WX, Briefing Package | Lido (hoặc các nguồn hàng không liên quan) |
| DEP-02 | Dữ liệu MEL/CDL, defects, lịch bảo dưỡng | AMOS |
| DEP-03 | Dữ liệu thương mại (LS, GD, PM, NOTOC, Cargo/Mail Manifest) | PSS/DCS |
| DEP-04 | Trạng thái tài liệu chuyến bay | MO Plus |
| DEP-05 | Định danh người dùng VNA | LDAP/AD Tổng công ty |
| DEP-06 | Vị trí và hành trình bay thực tế (liên kết nhúng) | Flight Radar24 |
| DEP-07 | Hạ tầng cloud + đường truyền | Viettel (theo bảng Sizing REF-05) |

---

## 9. Tiêu chí Thành công

| Mã | Tiêu chí thành công (đo lường được) | Nguồn |
|---|---|---|
| KSI-01 | Hệ thống đạt **SLA ≥ 99%** thời gian sẵn sàng | REF-02 + CON-TEC-02 |
| KSI-02 | Hỗ trợ đồng thời **200 CCU** và **500 request/giây** trong môi trường production | REF-05 |
| KSI-03 | **100% tài liệu chuyến bay** (OFP, NOTAM, WX, Briefing, LS, GD, PM, NOTOC, Manifest) được số hóa và quản lý phiên bản trên TOSS | REF-02 + REF-03 / 02 |
| KSI-04 | **100% danh mục dữ liệu chủ** (Tàu bay, Sân bay, Chặng bay, Tổ bay) được quản lý tập trung với metadata chuẩn và lịch sử thay đổi | REF-03 / 04 |
| KSI-05 | **100% truy cập tài nguyên/dữ liệu nghiệp vụ** được ghi log/audit phục vụ kiểm toán | REF-03 / 05 |
| KSI-06 | **Loại bỏ hoàn toàn kết nối point-to-point** giữa TOSS và các hệ thống vệ tinh, thay bằng API Gateway/Message/Streaming | REF-02 + REF-04 |
| KSI-07 | Cải thiện đo lường được về **OTP**, **tỷ lệ phát hành OFP đúng deadline**, **chênh lệch tải trọng OFP vs thực tế**, **tiết kiệm nhiên liệu nhờ Tankering** | *(chưa có giá trị mục tiêu cụ thể — cần làm rõ qua SH-06, SH-10)* |
| KSI-08 | **Tuân thủ 100%** Nghị định 53/2022/NĐ-CP và Nghị định 13/2023/NĐ-CP (xác nhận bởi đánh giá pháp lý) | CON-LEG-01, CON-LEG-02 |

---

## 10. Câu hỏi Mở / Nội dung Cần Làm Rõ

> Danh sách câu hỏi nghiệp vụ cần thu thập **trước khi chuyển sang SRS**. Đề nghị tổ chức phỏng vấn stakeholder để chốt.

### 10.1 Câu hỏi cho SH-01 (Điều phái viên / Dispatcher)
- Q-01: Các pain point cụ thể trong quy trình giám sát chuyến bay hiện tại? Mất bao lâu để phát hiện và xử lý gián đoạn?
- Q-02: Hệ thống/công cụ hiện tại đang dùng là gì? Hạn chế chính nằm ở đâu?
- Q-03: Danh sách trường thông tin **mặc định** nên hiển thị trên bảng điều khiển tổng quan?

### 10.2 Câu hỏi cho SH-02 (Crew Scheduling)
- Q-04: Tiêu chuẩn FTL áp dụng cho VNA (CAAV vs nội bộ) khác nhau ở đâu? Quy tắc tính giờ bay/giờ làm việc?
- Q-05: Quy trình xử lý khi tổ bay vi phạm giới hạn — thông báo cho ai, mức nào cần can thiệp?

### 10.3 Câu hỏi cho SH-03 (Phi hành đoàn)
- Q-06: Quy trình **Request/Confirm/Reject** tài liệu hiện tại đang vận hành thế nào trên MO Plus? Khác biệt mong muốn trên TOSS?
- Q-07: Yêu cầu UX cho phiên bản Web Mobile — kích thước thiết bị mục tiêu (iPad, smartphone), điều kiện kết nối tại hiện trường?

### 10.4 Câu hỏi cho SH-04 (Ground Operations)
- Q-08: TOSS có cần đảm nhận **các chức năng Ground Handling chi tiết** (turnaround coordination, gate assignment, ground service requests) như CLAUDE.md §2 nêu, hay chỉ **hiển thị thông tin** từ hệ thống ground handling khác?

### 10.5 Câu hỏi cho SH-05 (Maintenance Planner)
- Q-09: Cơ chế đồng bộ MEL/CDL/defects với AMOS — định kỳ hay theo sự kiện? Khối lượng dữ liệu trung bình/ngày?

### 10.6 Câu hỏi cho SH-06 (Lãnh đạo)
- Q-10: KPI cụ thể mà Ban Lãnh đạo VNA mong muốn theo dõi trên Dashboard TOSS? **Giá trị mục tiêu** cho OTP, tiết kiệm nhiên liệu Tankering, độ chính xác Payload?

### 10.7 Câu hỏi cho SH-07 (System Admin)
- Q-11: Danh sách **vai trò (Role) ban đầu** và ma trận quyền sơ bộ?
- Q-12: Cơ chế kết nối LDAP/AD hiện tại của VNA (giao thức, đường truyền, danh tính kỹ thuật)?

### 10.8 Câu hỏi tổng thể cho SH-10/SH-11
- Q-13: **Mốc thời gian** triển khai cụ thể (T8/2026 → T8/2031 đã được khẳng định trong tài liệu nguồn nào?)
- Q-14: Ưu tiên triển khai **theo phân hệ** hay **theo wave** (MVP → mở rộng)?
- Q-15: Danh sách **hãng vận chuyển (Carriers)** dự kiến điều hành trên cùng nền tảng TOSS (BR-TOSS-004)?
- Q-16: Phạm vi **Out-of-Scope OOS-07** (rostering nâng cao, an toàn — báo cáo sự cố, ground handling chi tiết) — TOSS có đảm nhận trong các phase tiếp theo không?
- Q-17: Tệp nguồn `VNA_TOSS.pptx` (REF-06) chưa được phân rã — có nội dung bối cảnh/mục tiêu khác biệt so với PDF không?
- Q-18: Mục **"Băng thông"** trong bảng Sizing (REF-05) bị thiếu giá trị — giá trị thực tế là bao nhiêu?

---

## 11. Phụ lục — Ma trận truy vết sơ bộ (BR → Phân hệ → Nguồn)

| BR | Phân hệ | File nguồn phân rã |
|---|---|---|
| BR-TOSS-001…005 | 1. Thông tin điều hành chuyến bay | `02-giai-phap-nghiep-vu/01-phan-he-thong-tin-dieu-hanh-chuyen-bay.md` |
| BR-TOSS-006…011 | 2. Quản lý tài liệu chuyến bay | `02-giai-phap-nghiep-vu/02-phan-he-quan-ly-tai-lieu-chuyen-bay.md` |
| BR-TOSS-012…017 | 3. Báo cáo & Tối ưu khai thác | `02-giai-phap-nghiep-vu/03-phan-he-quan-ly-bao-cao-danh-gia-toi-uu-khai-thac.md` |
| BR-TOSS-018…020 | 4. Quản lý danh mục | `02-giai-phap-nghiep-vu/04-phan-he-quan-ly-danh-muc.md` |
| BR-TOSS-021…025 | 5. Quản trị hệ thống (IAM) | `02-giai-phap-nghiep-vu/05-phan-he-quan-tri-he-thong.md` |
| BR-TOSS-026…030 | Tích hợp (cross-cutting) | `02-giai-phap-nghiep-vu/01,02,04` + `01-tong-quan-giai-phap/01-tong-quan-giai-phap.md` |

---

*BRD-TOSS-001 v0.1 — Bản nháp đầu tiên do business-analyst agent biên soạn theo phương pháp top-down, tuân thủ nguyên tắc CLAUDE.md §0 (phân rã + tái cấu trúc theo nguồn, không suy diễn). Mọi yêu cầu được truy vết về tài liệu nguồn. Các nội dung thiếu được đánh dấu `(chưa có — cần làm rõ)` và tập hợp tại §10 để xử lý qua phỏng vấn stakeholder.*
