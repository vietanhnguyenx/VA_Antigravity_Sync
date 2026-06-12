---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
status: "Draft"
document_type: "BRD — Yêu cầu Nghiệp vụ Phân hệ 5"
document_id: "BRD-TOSS-PH5"
parent_document: "BRD-TOSS-001-khung-v0.6.md"
---

# Yêu cầu Nghiệp vụ — Phân hệ 5: Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng) (v0.1)

> **Tài liệu con của [BRD-TOSS-001-khung-v0.6.md](BRD-TOSS-001-khung-v0.6.md).** Phân rã chi tiết §7.5 — Phân hệ 5. Mọi quy ước MoSCoW, phạm vi, bên liên quan tham chiếu từ tài liệu cha.
>
> **Phân rã chức năng:** xem [PHAN-RA-BRD-PH5-quan-tri-he-thong-v0.3.md](../srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH5-quan-tri-he-thong-v0.3.md).

## §7.5 Phân hệ 5 — Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-501 | Hệ thống phải quản lý toàn bộ vòng đời người dùng (tạo, sửa, vô hiệu hóa, kích hoạt lại, xóa) thông qua phân hệ Quản trị danh tính (IAM — Identity and Access Management) độc lập. | Functional | Must | Đề xuất §II.5; YCKT NFR |
| BR-502 | Hệ thống phải áp dụng cơ chế phân quyền dựa trên vai trò (RBAC — Role-Based Access Control) chi tiết hóa đến từng phân hệ, dịch vụ và API; tách riêng quyền chỉ xem và quyền thao tác. *(12/06 làm rõ: phân quyền 2 lớp (chức năng + dữ liệu) + user nhiều role + switch view trên màn Giám sát → BR-141.)* | Functional | Must | Đề xuất §II.5; Khảo sát 09/06 §II.2 |
| BR-503 | Hệ thống phải hỗ trợ chính sách truy cập động (Dynamic Policies): hạn chế quyền theo khung giờ làm việc hoặc trạng thái phiên; cập nhật phân quyền theo thời gian thực. | Functional | Must | Đề xuất §II.5 |
| BR-504 | Hệ thống phải phân quyền theo Carrier / sân bay / tàu bay (ngoài phân quyền theo chức năng), bao gồm dữ liệu chuyến bay phân theo căn cứ bay. *(12/06 làm rõ: phân quyền dữ liệu theo carrier/khu vực/role + filter mặc định theo role trên màn Giám sát → BR-141.)* | Functional | Must | YCKT NFR; Khảo sát 09/06 §II.2 |
| BR-505 | Hệ thống phải hỗ trợ một màn hình dùng chung cho nhiều đối tượng — ẩn/hiện cột và nút thao tác theo quyền người dùng. *(12/06 làm rõ: lưu cấu hình/filter/"trạng thái gần nhất" theo profile cá nhân + bộ lọc thu/mở → BR-142.)* | Functional | Must | Khảo sát 09/06 §II.2 |
| BR-506 | Hệ thống phải áp dụng xác thực đa yếu tố (MFA/2FA) bắt buộc cho quản trị viên và tài khoản có quyền truy cập dữ liệu nhạy cảm; sử dụng cơ chế Token-based (JWT). | Functional | Must | Đề xuất §II.5 |
| BR-507 | Hệ thống phải hỗ trợ Single Sign-On (SSO) và tích hợp danh tính với LDAP / Active Directory của Tổng công ty. | Functional | Must | Đề xuất §II.5 |
| BR-508 | Hệ thống phải kiểm soát phiên làm việc theo thời gian thực, hỗ trợ quyền truy cập tạm thời có thời hạn (tự thu hồi khi hết hạn). | Functional | Must | Đề xuất §II.5 |
| BR-509 | Hệ thống phải ghi nhật ký (Log) chi tiết mọi hành vi đăng nhập, thay đổi quyền, truy cập dữ liệu nghiệp vụ phục vụ kiểm toán bảo mật. | Functional | Must | Đề xuất §II.5 |
| BR-510 | Hệ thống phải xây dựng cổng tích hợp API Gateway thay thế kết nối điểm-điểm; bảo mật điểm cuối, phân phối tải, thực thi rate-limit; quản trị toàn diện vòng đời API (versioning); kỹ thuật truyền tải tệp lớn (nén, song song). | Functional | Must | Đề xuất §I; YCKT TOSS-058… |
| BR-511 | Hệ thống phải hỗ trợ tích hợp với khoảng 40 hệ thống/nguồn nội bộ và bên ngoài (Lido, MO Plus, AMOS, Amadeus PSS, DCS, AVES, ACDM, VMS/VIAGS, ACARS, AFTN/AMHS, FlightRadar24, Flight Watch, DWH/Lakehouse, NOTAM/WX…); cơ chế tích hợp chủ động (event-based) khi phát sinh dữ liệu, kết hợp ảnh chụp dữ liệu định kỳ. **(v0.3 bổ sung):** đích danh & phương thức nguồn: UCM, SITA TEXT, LOMS, Cassiopee Alpha, NOTAM/WX qua email, website thời tiết, bảng kê nhiên liệu nhà cung ứng; cấu hình tần suất/hình thức thu thập theo từng nguồn. (YCKT V3 TOSS-096/097/101-104) | Functional | Must | Phân tích YCKT v0.1 §3; YCKT TOSS-058…121; Khảo sát 08/06 §II.3 |
| BR-512 | Hệ thống phải bảo đảm ≥ 10 giao tiếp dữ liệu phát sinh không tính phí trong vòng đời hợp đồng. | Non-functional | Must | YCKT TOSS-058… |
| BR-513 | Hệ thống phải hỗ trợ nền tảng lưu trữ và xử lý dữ liệu quy mô lớn: đa định dạng (SQL, JSON/XML, file phi cấu trúc); xử lý Batch (ETL định kỳ) và Streaming (Kafka/Spark Streaming hoặc tương đương) song song; phân tách tầng lưu trữ và tầng xử lý. | Non-functional | Must | Đề xuất §I |
| BR-514 | Hệ thống phải kiến trúc Microservices, Cloud Native (tuân thủ tiêu chuẩn CNCF); phân tách tuyệt đối tầng giao diện / nghiệp vụ / dữ liệu; mở rộng tài nguyên linh hoạt và cập nhật tính năng không gián đoạn dịch vụ. | Non-functional | Must | Đề xuất §I; YCKT NFR |
| BR-515 | Hệ thống phải đạt SLA độ sẵn sàng ≥ 99%; HA active-active / active-standby; chuyển đổi < 1h; rate-limit / điều tiết lưu lượng; phân tách tài nguyên app/DB/log; restart không gián đoạn. | Non-functional | Must | Đề xuất §I; YCKT NFR |
| BR-516 | Hệ thống phải triển khai trên Cloud của VNA với 3 môi trường Prod / Dev-Test / Standby-Backup; đáp ứng quy mô ≥ 4000 người dùng, đồng thời 200. **(v0.4 bổ sung — định cỡ hạ tầng cụ thể):** dữ liệu ~18 TB (5.5 TB DB + 12.5 TB file); tải mục tiêu 200 CCU / 500 request-giây / 10Kb-request; tài nguyên Cloud ~311 vCPU, 964 GB RAM, 43.6 TB storage, 27 VM, 3 Public IP; Cloud Firewall; Cloud Backup ~31.5 TB; Hybrid Connect (vHC 200Mbps + VPN L2); kiến trúc Kubernetes (Proxy HAProxy ở DMZ theo HA, 3 Master node quorum etcd, các Worker node); tái sử dụng một phần hệ thống giám sát của MO Plus. (Nguồn: Sizing-update260609 - 4T.xlsx) | Non-functional | Must | YCKT NFR; Sizing-update260609 |
| BR-517 | Hệ thống phải vận hành 24/7/365 trong 60 tháng kể từ go-live; giám sát tập trung, cảnh báo bất thường; bàn giao mã nguồn và tài liệu cho VNA sau khi hết thuê. **(v0.3 bổ sung):** dịch vụ vận hành & hỗ trợ 24/7/365 gồm tiếp nhận sự cố, quản lý change request, báo cáo vận hành định kỳ và báo cáo sự cố bất thường. (YCKT V3 TOSS-036-045) | Non-functional | Must | YCKT NFR |
| BR-518 | Hệ thống phải tuân thủ Nghị định 53/2022/NĐ-CP (lưu trữ dữ liệu tại Việt Nam) và Nghị định 13/2023/NĐ-CP (bảo vệ dữ liệu cá nhân); tuân thủ ANTT TCTHK; không chia sẻ dữ liệu khi chưa cho phép. | Non-functional | Must | Đề xuất §I; YCKT NFR |
| BR-519 | Hệ thống phải mở rộng tích hợp với các nguồn dữ liệu bổ sung phục vụ các cảnh báo và chức năng mới: (a) AMOS — nhận NAIL/CDL phát sinh kèm khoảng hiệu lực (cơ chế tích hợp API/event/poll `[cần xác nhận]`); (b) QAR/QAI (Quick Access Recorder / Quick Access Information) qua API hoặc Database View của Tổng công ty để thống kê Standard Taxi Time và phân tích Post-Flight; (c) ACARS trực tiếp (không qua Mission Watch `[cần xác nhận hệ thống]`) làm nguồn mốc thời gian thực tế (OUT/OFF/ON/IN) cho màn Monitoring real-time; (d) A-CDM để biết chuyến đã phục vụ đến giai đoạn nào tại sân (boarding, đóng cửa, push-back…); (e) [cần xác nhận] AIJS (hệ thống trung gian hiện hành đính file Weather Multi-Flight) và (f) [cần xác nhận] Logitech/GDTN (log tổ bay upload/truy cập tài liệu); (g) ICON cho tham số Flight Level. **(v0.3 bổ sung):** tích hợp giá trị Techlog uplift FOB từ AMOS (nhiên liệu trên tàu sau uplift). (sheet-12) | Functional | Must | Khảo sát 11/06 buổi sáng §II.10, §II.14; Khảo sát 11/06 buổi chiều §II.6, §II.9, §II.11, §II.12 |
| BR-520 | Hệ thống phải mở rộng cơ chế đồng bộ Dispatch Release / Unrelease với MO Plus: ngoài việc bắn trạng thái "đã Dispatch Release" (xem BR-214), TOSS phải bắn revision/version mới khi Unrelease và kích hoạt MO Plus reset trạng thái Confirm Release của phi công về 0; cơ chế notification trên ứng dụng MO Plus phải thông báo cho phi công Confirm lại; quy ước tín hiệu, payload, timing và hành vi notification cụ thể phối hợp với đội phát triển MO Plus `[cần xác nhận]`. | Functional | Must | Khảo sát 11/06 buổi chiều §II.4 |
| BR-521 | Áp dụng quy trình CI/CD cho phát triển/triển khai/nâng cấp (tự động kiểm thử và phát hành). | NFR | Must | YCKT V3 TOSS-029 |
| BR-522 | Nâng cấp ứng dụng web và mobile tương thích phiên bản mới của hệ điều hành/trình duyệt trong vòng 30 ngày kể từ phát hành. | NFR | Must | YCKT V3 TOSS-034 |
| BR-523 | Bàn giao đầy đủ tài liệu hệ thống (đặc tả yêu cầu, kiến trúc, thiết kế chi tiết, mã nguồn + đặc tả mã nguồn) và tổ chức đào tạo/chuyển giao công nghệ. | Functional | Must | YCKT V3 TOSS-053-055 |
| BR-524 | Di trú (migrate) dữ liệu lịch sử từ hệ thống FIMS và Netline hiện hành sang TOSS. | Functional | Must | YCKT V3 TOSS-105; sheet-11 #5 |
| BR-525 | Cung cấp tập API ra cho hệ thống vệ tinh tiêu thụ dữ liệu TOSS: API báo cáo FOS; API Fuel-Weight-Time (MO Plus); API thời tiết sân bay cho Quản trị EFB; Aircraft API (thuộc tính + PF mới nhất); API tương tác MO Plus (Dispatch Release/Flight Release/Confirm Document); API cung cấp gói tài liệu chuyến bay phiên bản cuối có phân quyền; API đẩy Library/Notices vào Draft. | Functional | Must | YCKT V3 TOSS-108-109 (dòng 137-144) |
| BR-526 | Giao diện giám sát tổng quan luồng dữ liệu vào/ra (theo loại dữ liệu/nguồn, hệ thống nguồn/đích, ngày cập nhật cuối); quản lý riêng luồng vào và luồng ra. | Functional | Must | YCKT V3 TOSS-110-115 |
| BR-527 | Cơ chế đồng bộ dữ liệu từ môi trường PROD sang môi trường TEST để kiểm thử với dữ liệu thực tế. | NFR | Should | YCKT sheet-11 #1 |
| BR-528 | Khảo sát và cấu hình tích hợp với các cơ quan đơn vị (CĐV): phương thức kết nối, trường dữ liệu, tần suất/hình thức thu thập cấu hình theo từng nguồn. | Functional | Must | YCKT sheet-11 #6 |
| BR-529 | Chuẩn UX/UI toàn hệ thống: chuẩn hóa uppercase khi xử lý/đối sánh dữ liệu; dropdown tải một lần (không spinner chờ); hiển thị bảng nhỏ kiểu tile (title-value); hỗ trợ Dark Mode/Light Mode. *(12/06 làm rõ: quy ước UI toàn hệ thống — 100% tiếng Anh + giờ UTC + format 24h + dark mode ưu tiên → BR-143.)* | NFR | Must | YCKT sheet-11 #2,3,7,9 |

---

*BRD-TOSS-PH5 v0.1 — 2026-06-12. Tách từ BRD-TOSS-001-khung-v0.5 → v0.6. Tổng 29 BR (BR-501…529). Phân rã FUNC: PHAN-RA-BRD-PH5-quan-tri-he-thong-v0.3.md.*
