---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-12"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH5"
---

# Phân rã Yêu cầu nghiệp vụ (BR) → Yêu cầu chức năng (FUNC) — Phân hệ 5: Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng)

> **Phạm vi tài liệu:** Phân rã các Yêu cầu nghiệp vụ (BR) thuộc §7.5 của `BRD-TOSS-001-khung-v0.2.md` (BR-501 … BR-520) xuống lớp Yêu cầu chức năng (FUNC — Functional Requirement) / Yêu cầu phi chức năng (NFR — Non-functional Requirement). Mỗi FUNC truy vết về BR cha và cột "Nguồn" trích lại đúng tài liệu/sheet/mục đã ghi trong BRD.
>
> **Phiên bản này (v0.2 — 2026-06-12):** bổ sung phân rã FUNC cho hai BR mới của Phân hệ 5 trong BRD v0.2: BR-519 (mở rộng tích hợp các nguồn dữ liệu bổ sung — AMOS NAIL/CDL, QAR/QAI, ACARS trực tiếp, A-CDM, AIJS, Logitech/GDTN, ICON) và BR-520 (mở rộng cơ chế đồng bộ Dispatch Release / Unrelease với MO Plus). Không sửa nội dung phân rã BR-501 … BR-518 của bản v0.1; chỉ tiếp tục đánh số theo style `FUNC-5NN-NN`.
>
> **Nguyên tắc bắt buộc (CLAUDE.md §0):** Chỉ phân rã + lắp ráp trung thực. KHÔNG suy diễn năng lực kỹ thuật/UX/dữ liệu ngoài nguồn. Khi nguồn không nhắc tới, FUNC được gắn cờ `(chưa có nguồn — cần SME bổ sung)` hoặc `[cần xác nhận]` để BA Lead/SME xử lý ở vòng kế tiếp; không tự tạo logic hoặc trường thông tin.
>
> **Phân loại Loại:** `Functional` = chức năng người dùng/hệ thống thực thi; `Non-functional` = ràng buộc chất lượng/kiến trúc/vận hành/pháp lý. BR-512…BR-518 chủ yếu phi chức năng — vẫn được phân rã thành FUNC/NFR con để thuận tiện truy vết.

## 1. Bảng phân rã chi tiết (BR → FUNC)

### 1.1 BR-501 — Quản lý vòng đời người dùng (IAM)

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-501-01 | Cho phép tạo mới người dùng trong phân hệ IAM với thông tin định danh cá nhân. | Functional | BR-501 | Đề xuất §II.5 — "tạo mới" |
| FUNC-501-02 | Cho phép sửa đổi thông tin người dùng đã tạo. | Functional | BR-501 | Đề xuất §II.5 — "sửa đổi thông tin" |
| FUNC-501-03 | Cho phép vô hiệu hóa tài khoản người dùng (tạm khóa). | Functional | BR-501 | Đề xuất §II.5 — "vô hiệu hóa tài khoản" |
| FUNC-501-04 | Cho phép kích hoạt lại tài khoản đã vô hiệu hóa. | Functional | BR-501 | Đề xuất §II.5 — "kích hoạt lại" |
| FUNC-501-05 | Cho phép xóa người dùng khỏi hệ thống. | Functional | BR-501 | Đề xuất §II.5 — "xóa người dùng khỏi hệ thống" |
| FUNC-501-06 | Triển khai phân hệ IAM (Identity and Access Management) độc lập như một dịch vụ Authentication Service riêng biệt, để các hệ thống khác trong mạng lưới VNA có thể tích hợp sử dụng chung. | Functional | BR-501 | Đề xuất §II.5 — "Kiến trúc dịch vụ xác thực độc lập" |

### 1.2 BR-502 — RBAC chi tiết tới phân hệ/dịch vụ/API; tách quyền xem và quyền thao tác

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-502-01 | Cho phép gán cho mỗi người dùng một hoặc nhiều vai trò (Role) hoặc nhóm quyền (Group). | Functional | BR-502 | Đề xuất §II.5 — "gán một hoặc nhiều vai trò (Role) hoặc nhóm quyền (Group)" |
| FUNC-502-02 | Ánh xạ chi tiết vai trò ↔ quyền truy cập (Permissions) tới từng phân hệ nghiệp vụ. | Functional | BR-502 | Đề xuất §II.5 — "ánh xạ chi tiết với các quyền truy cập" |
| FUNC-502-03 | Ánh xạ chi tiết vai trò ↔ quyền truy cập tới từng dịch vụ nghiệp vụ. | Functional | BR-502 | Đề xuất §II.5 — "phân hệ, dịch vụ nghiệp vụ" |
| FUNC-502-04 | Ánh xạ chi tiết vai trò ↔ quyền truy cập tới từng phương thức API riêng biệt. | Functional | BR-502 | Đề xuất §II.5 — "phương thức API riêng biệt" |
| FUNC-502-05 | Tách rõ trên cấu hình vai trò: quyền chỉ xem (read-only) và quyền thao tác (write/action). | Functional | BR-502 | Khảo sát 09/06 §II.2 — "tách riêng quyền chỉ xem và quyền thao tác" |

### 1.3 BR-503 — Chính sách truy cập động (Dynamic Policies) và phân quyền theo thời gian thực

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-503-01 | Cho phép định nghĩa quy tắc truy cập linh hoạt theo khung giờ làm việc của người dùng. | Functional | BR-503 | Đề xuất §II.5 — "hạn chế quyền theo khung giờ làm việc" |
| FUNC-503-02 | Cho phép định nghĩa quy tắc truy cập dựa trên trạng thái hiện tại của phiên làm việc. | Functional | BR-503 | Đề xuất §II.5 — "dựa trên trạng thái hiện tại của phiên làm việc" |
| FUNC-503-03 | Cập nhật và áp dụng quyền người dùng theo thời gian thực (Real-time Permission), ngăn chặn truy cập vượt quyền ngay khi có thay đổi vị trí công tác. | Functional | BR-503 | Đề xuất §II.5 — "Phân quyền theo thời gian thực (Real-time Permission)" |

### 1.4 BR-504 — Phân quyền theo Carrier / sân bay / tàu bay (data scope)

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-504-01 | Cho phép phân quyền dữ liệu theo Carrier (hãng vận chuyển) — người dùng chỉ thấy dữ liệu của Carrier được gán. | Functional | BR-504 | YCKT NFR (PHAN-TICH-YCKT §2.A — "phân quyền theo Carrier / sân bay / tàu bay") |
| FUNC-504-02 | Cho phép phân quyền dữ liệu theo sân bay. | Functional | BR-504 | YCKT NFR (PHAN-TICH-YCKT §2.A) |
| FUNC-504-03 | Cho phép phân quyền dữ liệu theo tàu bay. | Functional | BR-504 | YCKT NFR (PHAN-TICH-YCKT §2.A) |
| FUNC-504-04 | Cho phép phân quyền dữ liệu chuyến bay theo căn cứ bay (base) ngoài phân quyền theo chức năng. | Functional | BR-504 | Khảo sát 09/06 §II.2 — "riêng dữ liệu chuyến bay phân theo căn cứ bay" |

### 1.5 BR-505 — Màn hình dùng chung — ẩn/hiện cột và nút theo quyền

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-505-01 | Cấu hình màn hình dùng chung cho nhiều nhóm đối tượng — tự động ẩn/hiện các cột thông tin theo quyền của người dùng đang đăng nhập. | Functional | BR-505 | Khảo sát 09/06 §II.2 — "các cột thông tin… ẩn hoặc hiện theo quyền người dùng (ví dụ bảng năm mươi cột, mỗi người chỉ thấy nhóm cột tương ứng quyền của mình)" |
| FUNC-505-02 | Tự động ẩn/hiện các nút thao tác (action button) trên màn hình dùng chung theo quyền của người dùng. | Functional | BR-505 | Khảo sát 09/06 §II.2 — "các… nút thao tác ẩn hoặc hiện theo quyền người dùng"; §III mục 2 — "ẩn/hiện cột và nút theo quyền" |

### 1.6 BR-506 — MFA/2FA bắt buộc + cơ chế Token-based (JWT)

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-506-01 | Bắt buộc xác thực hai bước hoặc đa yếu tố (MFA/2FA) đối với tài khoản quản trị viên. | Functional | BR-506 | Đề xuất §II.5 — "bắt buộc áp dụng xác thực hai bước hoặc đa yếu tố đối với nhóm quản trị viên" |
| FUNC-506-02 | Bắt buộc xác thực đa yếu tố đối với tài khoản có quyền truy cập dữ liệu nhạy cảm. | Functional | BR-506 | Đề xuất §II.5 — "tài khoản có quyền truy cập dữ liệu nhạy cảm" |
| FUNC-506-03 | Sử dụng cơ chế Token-based với công nghệ JWT (JSON Web Token) để xác thực giữa các dịch vụ Microservices. | Functional | BR-506 | Đề xuất §II.5 — "Sử dụng công nghệ JWT (JSON Web Token)… kiến trúc Microservices phân tán" |

### 1.7 BR-507 — SSO + tích hợp LDAP/AD

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-507-01 | Triển khai trải nghiệm Đăng nhập một lần (SSO — Single Sign-On) cho phép một tài khoản duy nhất truy cập đồng thời nhiều phân hệ/ứng dụng vệ tinh mà không cần đăng nhập lại. | Functional | BR-507 | Đề xuất §II.5 — "Trải nghiệm Single Sign-On (SSO)" |
| FUNC-507-02 | Tích hợp và đồng bộ danh tính sâu với hệ thống LDAP của Tổng công ty. | Functional | BR-507 | Đề xuất §II.5 — "kết nối và đồng bộ hóa sâu… LDAP" |
| FUNC-507-03 | Tích hợp và đồng bộ danh tính sâu với hệ thống Active Directory (AD) của Tổng công ty. | Functional | BR-507 | Đề xuất §II.5 — "Active Directory (AD)"; Phân tích YCKT v0.1 §3 — "AD/LDAP" (sheet Tích hợp dòng 38) |
| FUNC-507-04 | Cung cấp giao diện quản trị tập trung duy nhất để cấu hình, theo dõi hoạt động, thiết lập phân quyền và kiểm soát truy cập trên toàn bộ hệ thống liên kết. | Functional | BR-507 | Đề xuất §II.5 — "Quản trị tập trung" |

### 1.8 BR-508 — Kiểm soát phiên + quyền truy cập tạm thời có thời hạn

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-508-01 | Kiểm soát chặt chẽ các phiên làm việc của người dùng theo thời gian thực. | Functional | BR-508 | Đề xuất §II.5 — "kiểm soát chặt chẽ các phiên làm việc… theo thời gian thực" |
| FUNC-508-02 | Cho phép cấp quyền truy cập tạm thời có thời hạn cho nhân sự tham gia dự án hoặc chiến dịch đặc biệt. | Functional | BR-508 | Đề xuất §II.5 — "cấp quyền truy cập tạm thời có thời hạn" |
| FUNC-508-03 | Tự động thu hồi quyền ngay khi quyền truy cập tạm thời hết hạn. | Functional | BR-508 | Đề xuất §II.5 — "hệ thống sẽ tự động thu hồi quyền ngay khi hết hạn" |

### 1.9 BR-509 — Lưu vết và kiểm toán (Audit Log)

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-509-01 | Ghi nhật ký (Log) chi tiết mọi hành vi đăng nhập của người dùng. | Functional | BR-509 | Đề xuất §II.5 — "Mọi hành vi đăng nhập… đều được ghi nhật ký (Log) chi tiết" |
| FUNC-509-02 | Ghi nhật ký chi tiết mọi thay đổi quyền hạn (gán/thu hồi role, group, permission). | Functional | BR-509 | Đề xuất §II.5 — "thay đổi quyền hạn… đều được ghi nhật ký (Log) chi tiết" |
| FUNC-509-03 | Ghi nhật ký chi tiết mọi truy cập vào tài nguyên/dữ liệu nghiệp vụ. | Functional | BR-509 | Đề xuất §II.5 — "truy cập vào các tài nguyên/dữ liệu nghiệp vụ" |
| FUNC-509-04 | Cung cấp nhật ký phục vụ kiểm toán bảo mật, phân tích rủi ro và xử lý sự cố. | Functional | BR-509 | Đề xuất §II.5 — "phục vụ công tác kiểm toán bảo mật, phân tích rủi ro và xử lý sự cố" |

### 1.10 BR-510 — Cổng tích hợp API Gateway

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-510-01 | Xây dựng cổng tích hợp API Gateway thay thế các kết nối điểm-điểm hiện tại. | Functional | BR-510 | Đề xuất §I — "cổng tích hợp API Gateway thay thế kết nối điểm-điểm" |
| FUNC-510-02 | API Gateway bảo mật các điểm cuối (endpoint). | Non-functional | BR-510 | Đề xuất §I — "bảo mật điểm cuối" |
| FUNC-510-03 | API Gateway thực hiện phân phối tải (load balancing). | Non-functional | BR-510 | Đề xuất §I — "phân phối tải" |
| FUNC-510-04 | API Gateway thực thi rate-limit / điều tiết lưu lượng. | Non-functional | BR-510 | Đề xuất §I — "thực thi rate-limit"; YCKT NFR — "rate-limit/điều tiết lưu lượng" |
| FUNC-510-05 | Quản trị toàn diện vòng đời API, gồm versioning (đăng ký phiên bản API). | Functional | BR-510 | YCKT TOSS-058… (PHAN-TICH-YCKT §2.B — "quản lý vòng đời API (versioning)") |
| FUNC-510-06 | Hỗ trợ kỹ thuật truyền tải tệp lớn (nén, song song) qua API Gateway. | Non-functional | BR-510 | Đề xuất §I — "kỹ thuật truyền tải tệp lớn (nén, song song)" |

### 1.11 BR-511 — Tích hợp ~40 hệ thống nội bộ và bên ngoài (event-based + snapshot)

> **Ghi chú phân rã:** Danh sách tích hợp được nhóm theo sheet "Tich hop" (39 dòng) của YCKT cộng với Phân tích YCKT v0.1 §3 (bản đồ ~40 hệ thống). Mỗi FUNC ở mức "tích hợp với hệ thống X để trao đổi dữ liệu Y" — chỉ liệt kê tên hệ thống và loại dữ liệu nguồn có nhắc; KHÔNG mô tả phương thức kỹ thuật cụ thể nếu nguồn chưa khẳng định. Các trường hợp "phương thức (API/SFTP/điện văn/email) chưa xác định" được gắn cờ `[cần xác nhận]` (Phân tích YCKT v0.1 §5; RISK-009).

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-511-01 | Tích hợp với **Netline Flight Ops++** để trao đổi dữ liệu khai thác bay; phương thức tích hợp `[cần xác nhận]`. | Functional | BR-511 | Sheet Tích hợp dòng 1; PHAN-TICH-YCKT §3 (mã YCKT TOSS-066) |
| FUNC-511-02 | Tích hợp với **DWH/Lakehouse TCT** để cung cấp/đồng bộ dữ liệu phục vụ phân tích. | Functional | BR-511 | Sheet Tích hợp dòng 2; PHAN-TICH-YCKT §3 (TOSS-065) |
| FUNC-511-03 | Tích hợp với **Flight Scheduling System** để trao đổi điện văn SSIM, ASM, SSM. | Functional | BR-511 | Sheet Tích hợp dòng 3; PHAN-TICH-YCKT §3 (TOSS-067, 098, 099) |
| FUNC-511-04 | Tích hợp với **AVES** để nhận thông tin phi công, tiếp viên và lịch bay tổ bay. | Functional | BR-511 | Sheet Tích hợp dòng 4; PHAN-TICH-YCKT §3 (TOSS-068) |
| FUNC-511-05 | Tích hợp với **Crew Trip** để nhận chi phí khách sạn, chi phí xe chở tổ bay và dữ liệu sử dụng khách sạn thực tế. | Functional | BR-511 | Sheet Tích hợp dòng 5; PHAN-TICH-YCKT §3 (TOSS-069) |
| FUNC-511-06 | Tích hợp với **MO Plus** để trao đổi OFP/eOFP, Flight Release, Document Confirmation, Tài liệu Library. | Functional | BR-511 | Sheet Tích hợp dòng 6; PHAN-TICH-YCKT §3 (TOSS-070); Khảo sát 11/06 §II.1, II.2 |
| FUNC-511-07 | Tích hợp với **MRO/AMOS** để nhận lịch bảo dưỡng tàu bay, MEL/CDL, Techlog fuel/time. | Functional | BR-511 | Sheet Tích hợp dòng 7; PHAN-TICH-YCKT §3 (TOSS-071, 122…) |
| FUNC-511-08 | Tích hợp với **TIMS** để nhận thông tin khối kỹ thuật. | Functional | BR-511 | Sheet Tích hợp dòng 8; PHAN-TICH-YCKT §3 (TOSS-072) |
| FUNC-511-09 | Tích hợp với **eTechlog** để nhận Flight Log, Defect log, dữ liệu kỹ thuật máy bay, hạn định bảo dưỡng. | Functional | BR-511 | Sheet Tích hợp dòng 9; PHAN-TICH-YCKT §3 (TOSS-073) |
| FUNC-511-10 | Tích hợp với **Amadeus PSS (1A)** để nhận danh sách/số lượng hành khách, cấu hình tàu bay, cấu hình mở bán, hành khách nối chuyến/VIP/CIP. Kiểm chứng nguồn real-time hay bản sao `[cần xác nhận]`. | Functional | BR-511 | Sheet Tích hợp dòng 10; PHAN-TICH-YCKT §3 (TOSS-074); Khảo sát 08/06 §II.6 |
| FUNC-511-11 | Tích hợp với **Lido Flight 4D / Adapter Lido** (qua MO Plus) để nhận Kế hoạch bay, NOTAM, WX, filed ATC / điện thay đổi. | Functional | BR-511 | Sheet Tích hợp dòng 11; PHAN-TICH-YCKT §3 (TOSS-075, 076) |
| FUNC-511-12 | Tích hợp với **Lido mPilot**. Phương thức và phạm vi dữ liệu cụ thể `[cần xác nhận]`. | Functional | BR-511 | Sheet Tích hợp dòng 12; PHAN-TICH-YCKT §3 (TOSS-077) |
| FUNC-511-13 | Tích hợp với **Hệ thống VMS của VIAGS** để nhận thông tin khai thác tại sân bay. | Functional | BR-511 | Sheet Tích hợp dòng 13; PHAN-TICH-YCKT §3 (TOSS-078) |
| FUNC-511-14 | Tích hợp với **FM, Lotus Airport, PTS** (hệ thống thông tin dịch vụ mặt đất). | Functional | BR-511 | Sheet Tích hợp dòng 14; PHAN-TICH-YCKT §3 (TOSS-079) |
| FUNC-511-15 | Tích hợp với **ACDM** để nhận Milestone times, vị trí, trạng thái chuyến bay, thông tin điều phối mặt đất, điều phối không lưu, năng lực khai thác sân bay, cảnh báo và phân tích hiệu suất. | Functional | BR-511 | Sheet Tích hợp dòng 15; PHAN-TICH-YCKT §3 (TOSS-080) |
| FUNC-511-16 | Tích hợp với **RPS** — hệ thống quản trị chi phí, lợi nhuận của VNA. | Functional | BR-511 | Sheet Tích hợp dòng 16; PHAN-TICH-YCKT §3 (TOSS-081) |
| FUNC-511-17 | Tích hợp với **ANCM** để nhận chi phí điều hành bay, bay qua, hạ cất cánh và hóa đơn nhiên liệu. | Functional | BR-511 | Sheet Tích hợp dòng 17; PHAN-TICH-YCKT §3 (TOSS-082) |
| FUNC-511-18 | Tích hợp với **Cargo Spot** để nhận thông tin hàng hóa cho chuyến bay (đối chiếu độ trễ/độ chính xác với CLC). | Functional | BR-511 | Sheet Tích hợp dòng 18; PHAN-TICH-YCKT §3 (TOSS-083) |
| FUNC-511-19 | Tích hợp với **DCS** để nhận thông tin phục vụ hành khách. | Functional | BR-511 | Sheet Tích hợp dòng 19; PHAN-TICH-YCKT §3 (TOSS-084) |
| FUNC-511-20 | Tích hợp với **FlightRadar24** để hiển thị vị trí và hành trình bay thực tế trên bản đồ. | Functional | BR-511 | Sheet Tích hợp dòng 20; PHAN-TICH-YCKT §3 (TOSS-085); BR-105 |
| FUNC-511-21 | Tích hợp với **Flight Watch** để nhận dữ liệu thời tiết, dự báo theo đường bay và theo dõi chuyến bay. | Functional | BR-511 | Sheet Tích hợp dòng 21; PHAN-TICH-YCKT §3 (TOSS-086) |
| FUNC-511-22 | Tích hợp với **Hệ thống tiết kiệm nhiên liệu** để nhận kết quả thực hiện của từng giải pháp với từng chuyến bay. | Functional | BR-511 | Sheet Tích hợp dòng 22 |
| FUNC-511-23 | Tích hợp với **NetZero** để nhận dữ liệu Nhiên liệu kế hoạch và điện văn ACARS liên quan. | Functional | BR-511 | Sheet Tích hợp dòng 23 |
| FUNC-511-24 | Tích hợp với **WNI** để nhận Kế hoạch bay. | Functional | BR-511 | Sheet Tích hợp dòng 24; PHAN-TICH-YCKT §3 (TOSS-089) |
| FUNC-511-25 | Tích hợp với **Cirium** — kế hoạch bay; rà soát/nâng cấp để tăng tỷ lệ dữ liệu so với Cũ MVT + Supplemental. | Functional | BR-511 | Sheet Tích hợp dòng 25; PHAN-TICH-YCKT §3 (TOSS-090) |
| FUNC-511-26 | Tích hợp với **SPECTRA** (do Khối CĐS cung cấp/quản lý). | Functional | BR-511 | Sheet Tích hợp dòng 26; PHAN-TICH-YCKT §3 (TOSS-091) |
| FUNC-511-27 | Tích hợp với **ETS — Quản lý Khí thải** qua ACARS. | Functional | BR-511 | Sheet Tích hợp dòng 27; PHAN-TICH-YCKT §3 (TOSS-092) |
| FUNC-511-28 | Tích hợp với **Quản lý Hợp đồng (CMS)** (do Khối CĐS cung cấp/quản lý). | Functional | BR-511 | Sheet Tích hợp dòng 28 |
| FUNC-511-29 | Tích hợp với **LMS** (do Khối CĐS cung cấp/quản lý). | Functional | BR-511 | Sheet Tích hợp dòng 29; PHAN-TICH-YCKT §3 (TOSS-094) |
| FUNC-511-30 | Tích hợp tiêu thụ điện văn **ACARS** từ tàu bay. | Functional | BR-511 | Sheet Tích hợp dòng 30; PHAN-TICH-YCKT §3 (TOSS-095) |
| FUNC-511-31 | Tích hợp với **SITA TEXT** để nhận điện văn UCM, ASM. | Functional | BR-511 | Sheet Tích hợp dòng 31; PHAN-TICH-YCKT §3 (TOSS-096, 097) |
| FUNC-511-32 | Tích hợp với **AMHS, AFTN** — hệ thống trao đổi thông tin hàng không. | Functional | BR-511 | Sheet Tích hợp dòng 32; PHAN-TICH-YCKT §3 (TOSS-100) |
| FUNC-511-33 | Tích hợp với **Cassiopee Alpha** để nhận dữ liệu Analyzed QAR. | Functional | BR-511 | Sheet Tích hợp dòng 33; PHAN-TICH-YCKT §3 (TOSS-101) |
| FUNC-511-34 | Tích hợp NOTAM, WX VATM qua email. Tên đơn vị cung cấp NOTAM chính thức `[cần xác nhận: VNCM/VNCS]` (xem BR-118). | Functional | BR-511 | Sheet Tích hợp dòng 34; PHAN-TICH-YCKT §3 (TOSS-102); Khảo sát 11/06 §II.6; BRD §9.3 mục 3 |
| FUNC-511-35 | Tích hợp Weather data — website cung cấp TAF, METAR. | Functional | BR-511 | Sheet Tích hợp dòng 35; PHAN-TICH-YCKT §3 (TOSS-103) |
| FUNC-511-36 | Tích hợp Bảng kê nhiên liệu của các nhà cung ứng. | Functional | BR-511 | Sheet Tích hợp dòng 36; PHAN-TICH-YCKT §3 (TOSS-104) |
| FUNC-511-37 | Tích hợp **Migrate FIMS** để di trú cơ sở dữ liệu lịch bay, kế hoạch bay và các dữ liệu FIMS đã tích hợp liên quan đến chuyến bay. | Functional | BR-511 | Sheet Tích hợp dòng 37; PHAN-TICH-YCKT §3 (TOSS-105) |
| FUNC-511-38 | Tích hợp **AD/LDAP** để xác thực danh tính. | Functional | BR-511 | Sheet Tích hợp dòng 38; PHAN-TICH-YCKT §3 (TOSS-106); cùng với FUNC-507-02, FUNC-507-03 |
| FUNC-511-39 | Tích hợp **FOEM (Flight Ops Engineering)** để nhận Bảng DOW; trường hợp FOEM chưa sẵn sàng, dùng trước một file DOW fixed (tương tự Adapter hiện nay). | Functional | BR-511 | Sheet Tích hợp dòng 39 |
| FUNC-511-40 | Áp dụng cơ chế tích hợp chủ động (event-based) — chủ động trao đổi dữ liệu ngay khi phát sinh, kết hợp với ảnh chụp dữ liệu định kỳ. Phương thức cụ thể theo từng nguồn `[cần xác nhận]`. | Functional | BR-511 | YCKT TOSS-058… (PHAN-TICH-YCKT §2.B — "cơ chế tích hợp chủ động ngay khi phát sinh dữ liệu"); §5 mục 1 |
| FUNC-511-41 | Tích hợp các API "chờ sẵn": Overflight Permit API (phép bay qua), Slot & Takeoff/Landing Permit API (slot + phép cất/hạ). | Functional | BR-511 | PHAN-TICH-YCKT §3 — "API chờ sẵn" |

### 1.12 BR-512 — Cam kết ≥ 10 giao tiếp dữ liệu phát sinh không tính phí

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| NFR-512-01 | Cam kết cung cấp ít nhất 10 giao tiếp dữ liệu phát sinh (giao tiếp tích hợp mới, phát sinh trong quá trình vận hành) không tính phí trong toàn bộ vòng đời hợp đồng. | Non-functional | BR-512 | YCKT TOSS-058… (PHAN-TICH-YCKT §2.B — "≥10 giao tiếp dữ liệu phát sinh không tính phí") |

### 1.13 BR-513 — Nền tảng lưu trữ và xử lý dữ liệu quy mô lớn

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| NFR-513-01 | Hỗ trợ lưu trữ và xử lý dữ liệu đa định dạng: dữ liệu quan hệ (SQL), dữ liệu bán cấu trúc (JSON/XML), file phi cấu trúc. | Non-functional | BR-513 | Đề xuất §I — "đa định dạng (SQL, JSON/XML, file phi cấu trúc)" |
| NFR-513-02 | Hỗ trợ xử lý theo cơ chế Batch (ETL định kỳ). | Non-functional | BR-513 | Đề xuất §I — "xử lý Batch (ETL định kỳ)" |
| NFR-513-03 | Hỗ trợ xử lý theo cơ chế Streaming (Kafka/Spark Streaming hoặc tương đương) song song với Batch. | Non-functional | BR-513 | Đề xuất §I — "Streaming (Kafka/Spark Streaming hoặc tương đương) song song" |
| NFR-513-04 | Phân tách rõ ràng tầng lưu trữ và tầng xử lý dữ liệu để cho phép mở rộng độc lập. | Non-functional | BR-513 | Đề xuất §I — "phân tách tầng lưu trữ và tầng xử lý" |

### 1.14 BR-514 — Kiến trúc Microservices, Cloud Native, phân tách 3 tầng

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| NFR-514-01 | Toàn bộ giải pháp tuân thủ kiến trúc Microservices và Cloud Native theo tiêu chuẩn CNCF (Cloud Native Computing Foundation). | Non-functional | BR-514 | Đề xuất §I; YCKT NFR (PHAN-TICH-YCKT §2.A — "Microservices / Cloud Native (CNCF)") |
| NFR-514-02 | Phân tách tuyệt đối ba tầng: tầng giao diện, tầng nghiệp vụ và tầng dữ liệu. | Non-functional | BR-514 | YCKT NFR (PHAN-TICH-YCKT §2.A — "phân tách tầng (giao diện/nghiệp vụ/dữ liệu)") |
| NFR-514-03 | Mở rộng tài nguyên linh hoạt (scale) mà không phải dừng dịch vụ (no downtime). | Non-functional | BR-514 | YCKT NFR (PHAN-TICH-YCKT §2.A — "scale không downtime") |
| NFR-514-04 | Cập nhật/triển khai tính năng mới không gián đoạn dịch vụ (restart không gián đoạn nhờ node dự phòng). | Non-functional | BR-514 | YCKT NFR (PHAN-TICH-YCKT §2.A — "restart không gián đoạn (node dự phòng)") |

### 1.15 BR-515 — SLA ≥ 99% + HA + rate-limit + phân tách tài nguyên

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| NFR-515-01 | Đạt SLA độ sẵn sàng dịch vụ tối thiểu 99%. | Non-functional | BR-515 | Đề xuất §I; YCKT NFR |
| NFR-515-02 | Triển khai cấu hình HA (High Availability) theo mô hình active-active hoặc active-standby. | Non-functional | BR-515 | YCKT NFR (PHAN-TICH-YCKT §2.A — "HA active-active/active-standby") |
| NFR-515-03 | Bảo đảm thời gian chuyển đổi dự phòng (failover) dưới 1 giờ. | Non-functional | BR-515 | YCKT NFR (PHAN-TICH-YCKT §2.A — "chuyển đổi < 1h") |
| NFR-515-04 | Áp dụng rate-limit / điều tiết lưu lượng để bảo vệ hệ thống trước tải đột biến. | Non-functional | BR-515 | YCKT NFR (PHAN-TICH-YCKT §2.A — "rate-limit/điều tiết lưu lượng") |
| NFR-515-05 | Phân tách tài nguyên tính toán/lưu trữ cho ba nhóm: ứng dụng (app), cơ sở dữ liệu (DB), nhật ký (log). | Non-functional | BR-515 | YCKT NFR (PHAN-TICH-YCKT §2.A — "phân tách tài nguyên app/DB/log") |
| NFR-515-06 | Hỗ trợ thao tác restart không gián đoạn dịch vụ. | Non-functional | BR-515 | YCKT NFR (PHAN-TICH-YCKT §2.A — "restart không gián đoạn") |
| NFR-515-07 | Triển khai giám sát toàn bộ thành phần phục vụ SLA. | Non-functional | BR-515 | YCKT NFR (PHAN-TICH-YCKT §2.A — "giám sát toàn bộ thành phần") |

### 1.16 BR-516 — Cloud của VNA + 3 môi trường + quy mô người dùng

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| NFR-516-01 | Triển khai trên hạ tầng Cloud của VNA. | Non-functional | BR-516 | YCKT NFR (PHAN-TICH-YCKT §2.A — "triển khai trên Cloud của VNA"); Khảo sát 08/06 §II.7 |
| NFR-516-02 | Triển khai môi trường Production (Prod). | Non-functional | BR-516 | YCKT NFR (PHAN-TICH-YCKT §2.A — "Prod/Dev-Test/Standby-Backup") |
| NFR-516-03 | Triển khai môi trường Phát triển — Kiểm thử (Dev-Test). | Non-functional | BR-516 | YCKT NFR (PHAN-TICH-YCKT §2.A) |
| NFR-516-04 | Triển khai môi trường Dự phòng — Sao lưu (Standby-Backup). | Non-functional | BR-516 | YCKT NFR (PHAN-TICH-YCKT §2.A) |
| NFR-516-05 | Đáp ứng quy mô tối thiểu 4000 người dùng. | Non-functional | BR-516 | YCKT NFR (PHAN-TICH-YCKT §2.A — "≥4000 user") |
| NFR-516-06 | Đáp ứng quy mô 200 người dùng đồng thời. | Non-functional | BR-516 | YCKT NFR (PHAN-TICH-YCKT §2.A — "đồng thời 200") |
| NFR-516-07 | Cấp hạ tầng UAT/TEST LHS và thông kết nối trước ngày 30/06/2026 (mốc bắt buộc với Khối CĐS-CN). | Non-functional | BR-516 | Khảo sát 08/06 §II.7; PHAN-TICH-YCKT §6 (TASK — "thông UAT/TEST LHS trước 30/06/2026") |

### 1.17 BR-517 — Vận hành 24/7/365 trong 60 tháng + giám sát tập trung + bàn giao mã nguồn

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| NFR-517-01 | Vận hành dịch vụ 24/7/365. | Non-functional | BR-517 | YCKT NFR (PHAN-TICH-YCKT §2.A — "dịch vụ 24/7/365") |
| NFR-517-02 | Duy trì vận hành trong 60 tháng kể từ thời điểm go-live. | Non-functional | BR-517 | YCKT NFR (PHAN-TICH-YCKT §2.A — "60 tháng kể từ go-live") |
| NFR-517-03 | Triển khai giám sát tập trung toàn hệ thống. | Non-functional | BR-517 | YCKT NFR (PHAN-TICH-YCKT §2.A — "giám sát tập trung") |
| NFR-517-04 | Sinh cảnh báo bất thường tự động phục vụ vận hành. | Non-functional | BR-517 | YCKT NFR (PHAN-TICH-YCKT §2.A — "cảnh báo bất thường") |
| NFR-517-05 | Bàn giao mã nguồn và tài liệu thuộc sở hữu VNA cho VNA sau khi hết thuê (60 tháng). | Non-functional | BR-517 | YCKT NFR (PHAN-TICH-YCKT §2.A — "mã nguồn + tài liệu thuộc sở hữu VNA; bàn giao source sau khi hết thuê") |

### 1.18 BR-518 — Tuân thủ pháp lý: ND 53/2022, ND 13/2023, ANTT TCTHK

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| NFR-518-01 | Tuân thủ Nghị định 53/2022/NĐ-CP — toàn bộ dữ liệu phải được lưu trữ tại Việt Nam. | Non-functional | BR-518 | Đề xuất §I; YCKT NFR (PHAN-TICH-YCKT §2.A — "NĐ 53/2022 (dữ liệu lưu tại VN)") |
| NFR-518-02 | Tuân thủ Nghị định 13/2023/NĐ-CP về bảo vệ dữ liệu cá nhân. | Non-functional | BR-518 | Đề xuất §I; YCKT NFR (PHAN-TICH-YCKT §2.A — "NĐ 13/2023 (bảo vệ dữ liệu cá nhân)") |
| NFR-518-03 | Tuân thủ quy chế An ninh thông tin Tổng công ty Hàng không (ANTT TCTHK). | Non-functional | BR-518 | YCKT NFR (PHAN-TICH-YCKT §2.A — "tuân thủ ANTT TCTHK") |
| NFR-518-04 | Không chia sẻ dữ liệu nghiệp vụ ra ngoài khi chưa được cho phép. | Non-functional | BR-518 | YCKT NFR (PHAN-TICH-YCKT §2.A — "không chia sẻ dữ liệu khi chưa cho phép") |

### 1.19 BR-519 — Mở rộng tích hợp các nguồn dữ liệu bổ sung phục vụ cảnh báo và chức năng mới

> **Ghi chú phân rã:** BR-519 mô tả việc mở rộng phạm vi tích hợp của TOSS với 7 nhóm nguồn dữ liệu bổ sung (so với danh mục ~40 hệ thống đã liệt kê tại BR-511). Mỗi nhóm được bóc thành một FUNC riêng ở mức "tích hợp với hệ thống X để nhận dữ liệu Y phục vụ chức năng Z". Phương thức kỹ thuật cụ thể (API/event/poll/Database View) và tên một số hệ thống còn được nguồn gắn cờ `[cần xác nhận]` — giữ nguyên cờ này, KHÔNG tự suy diễn.

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-519-01 | Tích hợp với **AMOS** để nhận NAIL `[cần xác nhận viết tắt]` và CDL (Configuration Deviation List) mới phát sinh kèm khoảng hiệu lực (active period), làm nguồn cho cảnh báo NAIL/CDL ảnh hưởng chuyến bay (xem BR-121). Phương thức tích hợp (API/event/poll) `[cần xác nhận]`. | Functional | BR-519 | Khảo sát 11/06 sáng §II.10 |
| FUNC-519-02 | Tích hợp với **QAR/QAI** (Quick Access Recorder / Quick Access Information) của Tổng công ty qua **API** để thống kê tự động Standard Taxi Time theo sân bay phục vụ BR-418 và phân tích Post-Flight. | Functional | BR-519 | Khảo sát 11/06 sáng §II.14 |
| FUNC-519-03 | Tích hợp với **QAR/QAI** qua **Database View** của Tổng công ty (phương án thay thế song song với API ở FUNC-519-02) để thống kê Standard Taxi Time và phân tích Post-Flight. | Functional | BR-519 | Khảo sát 11/06 sáng §II.14 |
| FUNC-519-04 | Tích hợp trực tiếp **ACARS** (không qua Mission Watch `[cần xác nhận tên hệ thống]`) để lấy các mốc thời gian thực tế OUT/OFF/ON/IN, làm nguồn dữ liệu cập nhật real-time cho màn hình Monitoring tổng quan (xem BR-125) và làm trigger cho quy tắc raise/clear cảnh báo theo từng mốc phase. | Functional | BR-519 | Khảo sát 11/06 chiều §II.6 |
| FUNC-519-05 | Tích hợp với **A-CDM** để biết chuyến bay đã được phục vụ đến giai đoạn nào tại sân (boarding, đóng cửa, push-back, taxi-out, take-off), bổ sung cho màn hình Monitoring overview của điều phái. | Functional | BR-519 | Khảo sát 11/06 chiều §II.6 |
| FUNC-519-06 | Tích hợp với **AIJS** `[cần xác nhận tên đầy đủ — hệ thống trung gian nội bộ VNA đang nhận diện và đính file Weather Multi-Flight vào nhiều chuyến]` để phối hợp/thay thế luồng đính file thời tiết đa chuyến hiện hành (phục vụ BR-220). Phương thức và phạm vi tích hợp `[cần xác nhận]`. | Functional | BR-519 | Khảo sát 11/06 chiều §II.9 |
| FUNC-519-07 | Tích hợp với nguồn **Logitech/GDTN** `[cần xác nhận tên chính xác — ASR có thể đọc sai thuật ngữ nội bộ VNA]` để lấy log tổ bay upload/truy cập tài liệu, phục vụ hiển thị cho điều phái biết tổ bay đã vào xem/tải tài liệu hay chưa (bổ trợ BR-222). | Functional | BR-519 | Khảo sát 11/06 chiều §II.12 |
| FUNC-519-08 | Tích hợp với **ICON** `[cần xác nhận tên hệ thống — có khả năng là hệ thống tham số khí tượng/lập kế hoạch]` để lấy tham số Flight Level theo Climb/Cruise/Descend, làm nguồn tham chiếu cho chức năng sửa Flight Level trên OFP trước khi đẩy lên MO Plus (xem BR-221). | Functional | BR-519 | Khảo sát 11/06 chiều §II.11 |

### 1.20 BR-520 — Mở rộng cơ chế đồng bộ Dispatch Release / Unrelease với MO Plus

> **Ghi chú phân rã:** BR-520 mở rộng cơ chế tích hợp trạng thái giữa TOSS và MO Plus được nêu tại BR-214 (đã có FUNC-tương đương trong phân rã PH2). Ở góc nhìn Phân hệ 5 (Quản trị hệ thống / Tích hợp), các FUNC dưới đây mô tả các tín hiệu/payload/cơ chế kỹ thuật cần xác lập giữa TOSS và MO Plus — KHÔNG mô tả lại nghiệp vụ Release/Unrelease (đã phân rã ở PH2). Mọi chi tiết quy ước payload/timing/notification còn ở mức `[cần xác nhận]` theo nguồn.

| Mã FUNC | Mô tả chức năng | Loại | BR cha | Nguồn |
|---|---|---|---|---|
| FUNC-520-01 | TOSS bắn sang MO Plus tín hiệu trạng thái "đã Dispatch Release" gắn với từng phiên bản OFP cụ thể (mở rộng BR-214). Cấu trúc payload, kênh truyền, timing `[cần xác nhận]`. | Functional | BR-520 | Khảo sát 11/06 chiều §II.4 |
| FUNC-520-02 | TOSS bắn sang MO Plus một revision/version OFP mới khi điều phái viên thực hiện Unrelease (mở rộng BR-218); cấu trúc payload bao gồm số hiệu version mới (ví dụ 2.1 hoặc auto-tăng) và nội dung của version cũ được chọn quay về. Quy ước số phiên bản cụ thể `[cần xác nhận]`. | Functional | BR-520 | Khảo sát 11/06 chiều §II.4 |
| FUNC-520-03 | TOSS bắn sang MO Plus tín hiệu kích hoạt **reset trạng thái Confirm Release của phi công về 0** khi Unrelease và phát hành revision mới; MO Plus tiêu thụ tín hiệu này để xóa Confirm Release hiện hành. Phương thức tín hiệu (cờ trong payload OFP hay endpoint riêng) `[cần xác nhận]`. | Functional | BR-520 | Khảo sát 11/06 chiều §II.4 |
| FUNC-520-04 | TOSS bắn sang MO Plus tín hiệu yêu cầu **gửi notification trên ứng dụng MO Plus tới phi công** để yêu cầu Confirm Release lại trên phiên bản mới; cơ chế notification cụ thể (loại thông báo, nội dung mặc định, kênh đẩy) `[cần xác nhận — phối hợp với đội phát triển MO Plus]`. | Functional | BR-520 | Khảo sát 11/06 chiều §II.4 |
| FUNC-520-05 | Tuân thủ quy ước "luôn lấy bản mới nhất theo tên file" (latest by filename) đang được MO Plus áp dụng: khi cần quay lui về phiên bản OFP cũ, TOSS đẩy bản cũ sang MO Plus dưới dạng một revision có tên/số phiên bản mới hơn để cơ chế override của MO Plus chấp nhận. | Functional | BR-520 | Khảo sát 11/06 chiều §II.4 |
| FUNC-520-06 | TOSS và MO Plus phối hợp định nghĩa hợp đồng giao tiếp (interface contract) gồm: tín hiệu Release, tín hiệu Unrelease + revision mới, tín hiệu reset Confirm Release, tín hiệu notification phi công; timing đồng bộ; cơ chế fail-safe khi mất tín hiệu `[cần xác nhận toàn bộ — phối hợp đội MO Plus]`. | Functional | BR-520 | Khảo sát 11/06 chiều §II.4; RISK-003 |

---

## 2. Bảng truy vết tổng hợp (BR → FUNC/NFR)

| BR | Tên ngắn | Số FUNC/NFR | Danh sách mã |
|---|---|---|---|
| BR-501 | Vòng đời người dùng (IAM) | 6 | FUNC-501-01 … 06 |
| BR-502 | RBAC chi tiết | 5 | FUNC-502-01 … 05 |
| BR-503 | Dynamic Policies + real-time permission | 3 | FUNC-503-01 … 03 |
| BR-504 | Phân quyền Carrier/sân bay/tàu bay | 4 | FUNC-504-01 … 04 |
| BR-505 | Màn hình dùng chung — ẩn/hiện theo quyền | 2 | FUNC-505-01, 02 |
| BR-506 | MFA/2FA + JWT | 3 | FUNC-506-01 … 03 |
| BR-507 | SSO + LDAP/AD + quản trị tập trung | 4 | FUNC-507-01 … 04 |
| BR-508 | Phiên + quyền truy cập tạm thời | 3 | FUNC-508-01 … 03 |
| BR-509 | Audit Log | 4 | FUNC-509-01 … 04 |
| BR-510 | API Gateway | 6 | FUNC-510-01 … 06 |
| BR-511 | Tích hợp ~40 hệ thống | 41 | FUNC-511-01 … 41 |
| BR-512 | ≥ 10 giao tiếp phát sinh không tính phí | 1 | NFR-512-01 |
| BR-513 | Big Data Batch + Streaming | 4 | NFR-513-01 … 04 |
| BR-514 | Microservices + Cloud Native + 3 tầng | 4 | NFR-514-01 … 04 |
| BR-515 | SLA 99% + HA + rate-limit | 7 | NFR-515-01 … 07 |
| BR-516 | Cloud VNA + 3 môi trường + quy mô | 7 | NFR-516-01 … 07 |
| BR-517 | 24/7/365 + 60 tháng + bàn giao source | 5 | NFR-517-01 … 05 |
| BR-518 | Pháp lý (ND 53, ND 13, ANTT) | 4 | NFR-518-01 … 04 |
| BR-519 | Mở rộng tích hợp (AMOS NAIL/CDL, QAR/QAI, ACARS trực tiếp, A-CDM, AIJS, Logitech/GDTN, ICON) | 8 | FUNC-519-01 … 08 |
| BR-520 | Mở rộng đồng bộ Release/Unrelease ↔ MO Plus | 6 | FUNC-520-01 … 06 |
| **Tổng** | | **127** | |

### 2.1 Phân loại theo Loại

| Loại | Số lượng | Ghi chú |
|---|---|---|
| Functional | 98 | 84 dòng `Functional` thuộc BR-501 … BR-511 (giữ nguyên từ v0.1) + 8 dòng `Functional` thuộc BR-519 + 6 dòng `Functional` thuộc BR-520. |
| Non-functional | 29 | Không đổi so với v0.1: 4 NFR API Gateway (BR-510) + 25 NFR thuộc BR-512 … BR-518. BR-519 và BR-520 không phát sinh NFR mới. |

> **Lưu ý đếm:** Bốn FUNC trong BR-510 (FUNC-510-02 "bảo mật điểm cuối", FUNC-510-03 "phân phối tải", FUNC-510-04 "rate-limit", FUNC-510-06 "truyền tệp lớn") được phân loại Non-functional vì chúng là ràng buộc chất lượng của cổng API; hai dòng còn lại (FUNC-510-01 dựng cổng, FUNC-510-05 quản trị vòng đời API/versioning) là Functional. Toàn bộ 14 FUNC mới của BR-519 và BR-520 đều là `Functional` (tích hợp dữ liệu/tín hiệu cụ thể, không phải ràng buộc chất lượng). Tổng FUNC/NFR: **127**.

---

## 3. Danh sách "(chưa có nguồn)" và cờ `[cần xác nhận]`

Các điểm dưới đây không thể phân rã tiếp do nguồn chưa đủ thông tin. **Không tự suy diễn — chờ BA Lead/SME bổ sung trong buổi khảo sát kế tiếp.**

### 3.1 Cờ `[cần xác nhận]` đã phát sinh trong tài liệu này

| # | Vị trí | Nội dung cần xác nhận | Tham chiếu |
|---|---|---|---|
| 1 | FUNC-511-01 | Phương thức tích hợp Netline Flight Ops++ (API/file/SFTP) | Phân tích YCKT v0.1 §5; RISK-009 |
| 2 | FUNC-511-10 | Nguồn dữ liệu Amadeus PSS là real-time hay bản sao (replicate) | Khảo sát 08/06 §II.6, §IV |
| 3 | FUNC-511-12 | Phương thức và phạm vi dữ liệu của Lido mPilot | PHAN-TICH-YCKT §3 |
| 4 | FUNC-511-34 | Tên đơn vị cung cấp NOTAM chính thức (VNCM/VNCS) | Khảo sát 11/06 §II.6; BRD §9.3 mục 3 |
| 5 | FUNC-511-40 | Phương thức tích hợp chủ động (event-based) cụ thể cho từng nguồn (API vs SFTP vs điện văn vs email) | PHAN-TICH-YCKT §5 mục 1, mục 6 |
| 6 | FUNC-519-01 | Viết tắt **NAIL** và phương thức tích hợp với AMOS (API/event/poll); mô hình master NAIL → sub-NAIL | Khảo sát 11/06 sáng §II.10 |
| 7 | FUNC-519-04 | Tên hệ thống **Mission Watch** và quan hệ với ACARS — TOSS lấy thẳng từ ACARS hay qua Mission Watch | Khảo sát 11/06 chiều §II.6 |
| 8 | FUNC-519-06 | Viết tắt **AIJS** và phạm vi tích hợp (nhận diện file Weather Multi-Flight + đính chuyến tự động) | Khảo sát 11/06 chiều §II.9 |
| 9 | FUNC-519-07 | Tên chính xác nguồn dữ liệu log tổ bay tải/truy cập tài liệu — **Logitech / GDTN / Logitech.com** (ASR có thể đọc sai) | Khảo sát 11/06 chiều §II.12 |
| 10 | FUNC-519-08 | Tên hệ thống **ICON** — có khả năng là hệ thống tham số khí tượng/lập kế hoạch cung cấp Flight Level | Khảo sát 11/06 chiều §II.11 |
| 11 | FUNC-520-01 … 06 | Toàn bộ hợp đồng giao tiếp TOSS ↔ MO Plus: cấu trúc payload Release/Unrelease, quy ước số phiên bản sau Unrelease, phương thức tín hiệu reset Confirm Release, cơ chế notification trên app MO Plus, timing và fail-safe | Khảo sát 11/06 chiều §II.4; RISK-003 |

### 3.2 "(chưa có nguồn — cần SME bổ sung)" cấp BR

Tất cả 20 BR (BR-501 → BR-520, bao gồm BR-519 và BR-520 bổ sung ở v0.2) đã có ít nhất một nguồn được trích trong cột "Nguồn" của bảng phân rã. Tuy nhiên, các điểm sau **nguồn nhắc đến nhưng chưa đủ chi tiết để bóc tiếp ở mức FUNC con**:

| # | BR | Nội dung chưa đủ nguồn | Hành động đề xuất |
|---|---|---|---|
| 1 | BR-503 | Định nghĩa cụ thể các "khung giờ làm việc" của từng vai trò (Dispatcher, Duty Manager, Cán bộ tài liệu…) | Phỏng vấn SME OCC để chuẩn hóa khung giờ |
| 2 | BR-504 | Mô hình dữ liệu phân quyền theo Carrier/sân bay/tàu bay/căn cứ bay (cấu trúc thực thể) | Workshop với CĐS-CN; đối chiếu meeting 08/06 §12 — "khác MO hiện tại chỉ phân quyền chức năng" |
| 3 | BR-506 | Danh mục "dữ liệu nhạy cảm" cần bắt buộc MFA (ví dụ: hồ sơ tổ bay, chi phí, lương) | Phỏng vấn SME ANTT/Pháp chế |
| 4 | BR-509 | Thời hạn lưu trữ Audit Log; cơ chế bảo vệ chống chỉnh sửa nhật ký | Phỏng vấn SME ANTT; đối chiếu ND 53/2022 |
| 5 | BR-510 | Mức ngưỡng rate-limit, danh mục API và chính sách versioning cụ thể | Workshop kỹ thuật giai đoạn thiết kế kế tiếp |
| 6 | BR-511 | Hai mươi mốt ô **TOSS-003/004/021-024/058-061…** trống nội dung trên sheet YCKT V3 | Đối chiếu bản gốc với VNA — đã ghi nhận tại PHAN-TICH-YCKT §5 |
| 7 | BR-511 | Sheet "Nhân sự" còn thiếu tên/contact đầu mối các CQĐV (ATCL/KT/DVHK/VIAGS) → ảnh hưởng việc khảo sát phương thức tích hợp | PHAN-TICH-YCKT §6 — bổ sung sheet Nhân sự |
| 8 | BR-515 | Định nghĩa "downtime cho phép trong 1% SLA" — phân bổ theo tháng/quý | Phỏng vấn SME vận hành |
| 9 | BR-516 | Sizing chi tiết môi trường (số máy chủ, vCPU/RAM/Storage) cho từng môi trường Prod/Dev-Test/Standby-Backup | Khảo sát 08/06 §II.7 — VTIT cần chốt số lượng máy chủ và địa chỉ mạng |
| 10 | BR-517 | Quy chuẩn giám sát tập trung (công cụ, ngưỡng cảnh báo, đầu mối nhận cảnh báo) | Workshop vận hành giai đoạn kế tiếp |
| 11 | BR-518 | Bản đồ trường dữ liệu cá nhân (PII) phải bảo vệ theo ND 13/2023 | Phối hợp Pháp chế VNA |
| 12 | BR-519 | Ranh giới TOSS ↔ Lido khi NAIL đã được Lido tính vào dầu — TOSS có cần cảnh báo bổ sung không | Workshop với SME điều phái + đội Lido |
| 13 | BR-519 | Đối chiếu tên hai hệ thống Mission Watch và AIJS với danh mục hệ thống chính thức của VNA | Phỏng vấn SME OCC + CĐS-CN |
| 14 | BR-520 | Đặc tả kỹ thuật hợp đồng giao tiếp TOSS ↔ MO Plus (sequence diagram, payload schema, mã lỗi, fail-safe) | Workshop kỹ thuật chung TOSS + MO Plus |

---

## 4. Ghi chú phương pháp luận

- Phân rã thực hiện theo Workflow P4 (Co-evolution Hybrid) — bóc tách FUNC song song với mô hình dữ liệu/wireframe ở các bước kế tiếp.
- Mọi FUNC chỉ giữ lại các năng lực được nguồn nói **rõ ràng**. Các năng lực ngầm hiểu (ví dụ "phải có giao diện quản trị người dùng" — nguồn chỉ nói "Quản trị tập trung… giao diện quản trị duy nhất" nên đã giữ lại tại FUNC-507-04; còn các UI thao tác chi tiết để BA Lead bổ sung khi đặc tả wireframe).
- Các FUNC tích hợp (BR-511) chỉ dừng ở mức "tích hợp với hệ thống X để trao đổi dữ liệu Y" — chiều inbound/outbound, định dạng dữ liệu chi tiết, phương thức (REST/SOAP/Kafka/SFTP/SMTP/SITA) sẽ được bổ sung khi sheet "Tich hop" được làm rõ và sheet Nhân sự CQĐV đã đầy đủ.

---

*FUNC-DEC-PH5 v0.2 — 2026-06-12. Bản cập nhật từ v0.1 (giữ nguyên làm lịch sử). Tài liệu này là đầu vào cho SRS Phân hệ 5 (mục 03-dac-ta-chuc-nang) và Ma trận truy vết yêu cầu (RTM). Mọi thay đổi BR cha phải được phản ánh ngược trở lại các FUNC con tương ứng.*

*v0.2 — 2026-06-12: bổ sung 14 FUNC mới (FUNC-519-01 … 08 và FUNC-520-01 … 06) cho hai BR mới của Phân hệ 5 trong BRD v0.2; tham chiếu BRD chuyển sang `BRD-TOSS-001-khung-v0.2.md` (phạm vi BR-501 … 520); cập nhật bảng truy vết (tổng 127 FUNC/NFR; trong đó 98 Functional + 29 Non-functional); bổ sung 6 nhóm cờ `[cần xác nhận]` mới vào §3.1 và 3 điểm cần SME bổ sung vào §3.2.*
