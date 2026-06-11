---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-11"
status: "Draft"
document_type: "Business Requirements Document (BRD)"
document_id: "BRD-TOSS-001"
---

# Tài liệu Yêu cầu Nghiệp vụ (BRD) — Khung top-down

> **Trạng thái:** Khung (skeleton) phục vụ thẩm định nội bộ trước khi đi vào chi tiết. Mọi nội dung trong tài liệu này được phân rã trung thực từ nguồn đã trích dẫn ở cột "Nguồn"; các điểm chưa có nguồn được đánh dấu rõ "(chưa có nguồn — cần BA Lead/SME bổ sung)" hoặc gắn cờ `[cần xác nhận]` và KHÔNG được tự suy diễn. Chi tiết bóc tách tới mức Yêu cầu chức năng (FR), Trường hợp sử dụng (UC), Câu chuyện người dùng (US) sẽ được thực hiện ở các tài liệu SRS/FRD kế tiếp.

## Mục lục

1. [Kiểm soát tài liệu (Document Control)](#1-kiểm-soát-tài-liệu-document-control)
2. [Tóm tắt điều hành (Executive Summary)](#2-tóm-tắt-điều-hành-executive-summary)
3. [Bối cảnh nghiệp vụ (Business Context)](#3-bối-cảnh-nghiệp-vụ-business-context)
4. [Mục tiêu nghiệp vụ (Business Objectives)](#4-mục-tiêu-nghiệp-vụ-business-objectives)
5. [Phạm vi (Scope)](#5-phạm-vi-scope)
6. [Các bên liên quan (Stakeholders)](#6-các-bên-liên-quan-stakeholders)
7. [Yêu cầu nghiệp vụ chi tiết (Detailed Business Requirements)](#7-yêu-cầu-nghiệp-vụ-chi-tiết-detailed-business-requirements)
8. [Quy trình nghiệp vụ (Business Process)](#8-quy-trình-nghiệp-vụ-business-process)
9. [Rủi ro và Giả định (Risks & Assumptions)](#9-rủi-ro-và-giả-định-risks--assumptions)
10. [Phụ lục (Appendix)](#10-phụ-lục-appendix)

---

## 1. Kiểm soát tài liệu (Document Control)

| Trường | Giá trị |
|---|---|
| Tên dự án | TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không (Airline Operations Management System) |
| Mã dự án | TOSS |
| Mã tài liệu | BRD-TOSS-001 |
| Phiên bản | 0.1 |
| Ngày phát hành | 2026-06-11 |
| Trạng thái | Draft (Khung — chưa có người duyệt) |
| Người soạn | BA Lead |
| Người duyệt | (chưa có nguồn — cần BA Lead/SME bổ sung) |

### Lịch sử thay đổi

| Phiên bản | Ngày | Người thay đổi | Mô tả |
|---|---|---|---|
| 0.1 | 2026-06-11 | BA Lead | Khởi tạo khung BRD top-down từ 3 báo cáo khảo sát (08/06, 09/06, 11/06), phân tích YCKT v0.1, 5 file phân hệ thuộc Đề xuất giải pháp kỹ thuật v0.3 và quy trình điều phái (FDOP §3.1–3.5). |

---

## 2. Tóm tắt điều hành (Executive Summary)

Hệ thống Tối ưu Điều hành Khai thác (TOSS — Total Operations Support System) được Tổng công ty Hàng không Việt Nam đặt ra với mục tiêu thiết lập một nền tảng số hội tụ phục vụ Trung tâm Kiểm soát Khai thác (OCC — Operational Control Center), thay thế các hệ thống rời rạc hiện hành (trọng tâm là thay thế FMS đang vận hành chậm) và hợp nhất luồng dữ liệu khai thác bay từ lịch bay, tổ bay, kỹ thuật, thương mại đến các thông báo hàng không và khí tượng theo thời gian thực (Nguồn: Đề xuất §I; Khảo sát 08/06 §II.3).

Giải pháp được quy hoạch thành năm phân hệ nghiệp vụ: (i) Thông tin điều hành chuyến bay; (ii) Quản lý tài liệu chuyến bay; (iii) Quản lý báo cáo, đánh giá tối ưu khai thác; (iv) Quản lý danh mục (Master Data); và (v) Quản trị hệ thống (IAM/RBAC, tích hợp, hạ tầng) (Nguồn: Đề xuất §II tổng quan).

Trên cơ sở khảo sát, TOSS đóng vai trò là nguồn dữ liệu tập trung và lớp giám sát — cảnh báo cho điều phái viên (Dispatcher), trực ban trưởng, cán bộ tài liệu và lãnh đạo; các thao tác nghiệp vụ chuyên dụng (Lido lập kế hoạch bay, MO Plus xác nhận tài liệu phi công, AMOS bảo dưỡng…) vẫn diễn ra ở hệ thống chuyên dụng tương ứng, TOSS không trùng lặp chức năng (Nguồn: Khảo sát 11/06 §II.4). Bên cạnh đó, TOSS bổ sung thao tác chủ động "Dispatch Release" để xác nhận bản kế hoạch bay (OFP — Operational Flight Plan) chính thức, làm tiền đề cho thao tác "Captain's Release" trên MO Plus (Nguồn: Khảo sát 11/06 §II.1, II.2).

Mức kỳ vọng vận hành: dịch vụ 24/7/365, độ sẵn sàng SLA tối thiểu 99%, hỗ trợ ≥ 4000 người dùng (đồng thời 200), tuân thủ Nghị định 53/2022/NĐ-CP (lưu trữ dữ liệu tại Việt Nam) và Nghị định 13/2023/NĐ-CP (bảo vệ dữ liệu cá nhân) (Nguồn: Đề xuất §I; YCKT TOSS-001 → ~057).

---

## 3. Bối cảnh nghiệp vụ (Business Context)

### 3.1 Hiện trạng

- Hệ thống FMS đang vận hành chậm; dữ liệu chuyển động chuyến bay (Movement) hiện chỉ phủ khoảng 90% số chuyến của hãng (các hãng khác đạt khoảng 99%), độ chính xác khoảng 79%; quy mô khoảng 11.000 chuyến/tháng (Nguồn: Khảo sát 08/06 §II.3).
- Báo cáo điều hành ngày khai thác (BCAO) hiện được lập bằng tệp Word, phát hành hằng ngày qua thư điện tử, phải được phê duyệt trước khi phát hành; cùng một chỉ số đúng giờ nhưng các báo cáo khác nhau cho ra con số khác nhau, thiếu nhất quán (Nguồn: Khảo sát 08/06 §II.4; Khảo sát 09/06 §II.7).
- Điều phái viên (Dispatcher) đang phải mở 5–7 ứng dụng/tab riêng để hoàn tất kiểm tra đầu ca (9 nhóm nội dung: lịch bay, loại tàu, tàu quay, cứu hỏa sân bay RFFS, thời tiết, tải, MEL/CDL, hạn chế, chứng chỉ tổ bay); một số kiểm tra đang thủ công, không có cơ chế tự đối chiếu (Nguồn: Khảo sát 11/06 §II.4).
- Hệ thống Lido tự sinh OFP và tự đẩy lên MO Plus mà không có bước "review/action" của điều phái; phi công và chính điều phái không phân biệt được đâu là bản OFP đã được chốt, đâu là bản hệ thống tự sinh khi tải/dầu thay đổi (Nguồn: Khảo sát 11/06 §II.1).
- Nhiều thông tin nghiệp vụ đang quản lý thủ công, khó trích xuất và tổng hợp: danh mục dịch vụ sân bay (vd sân bay không hỗ trợ tàu hỏng APU); NOTAM phải tra cứu thủ công trên trang web cơ quan quản lý bay; danh sách bất thường được tổng hợp đa nguồn vào tệp Word (Nguồn: Khảo sát 09/06 §II.6; Khảo sát 11/06 §II.6).
- Cấp phát hạ tầng đám mây còn chậm; môi trường kiểm thử đã được dựng, có hai mốc ràng buộc: hạ tầng sẵn sàng trước giữa tháng 06/2026 và thông kết nối trước ngày 30/06/2026 (Nguồn: Khảo sát 08/06 §II.7).

### 3.2 Vấn đề chính

- Dữ liệu khai thác phân tán, không hợp nhất; ra quyết định hiệp đồng (CDM — Collaborative Decision Making) và nhận diện tình huống (Situational Awareness) gặp khó khăn (Nguồn: Đề xuất §I).
- Báo cáo thiếu nhất quán; tổng hợp thủ công gây tốn thời gian và rủi ro sai số.
- Thiếu cơ chế xác nhận "bản OFP chính thức" giữa điều phái và phi công.
- Thiếu màn hình giám sát tập trung cho điều phái viên và trực ban trưởng; phải tự đối chiếu nhiều ứng dụng.
- Thiếu nguồn sự thật duy nhất (Single Source of Truth) cho dữ liệu danh mục (tàu bay, sân bay, chặng bay, tổ bay…).

### 3.3 Cơ hội nghiệp vụ

- Số hóa toàn bộ chu trình điều hành khai thác trong một nền tảng hội tụ; hợp nhất luồng dữ liệu từ lập kế hoạch → dispatch → giám sát thực hiện → đóng chuyến → báo cáo (Nguồn: Đề xuất §I, §II tổng quan).
- Bổ sung lớp giám sát — cảnh báo tự động hóa các kiểm tra đầu ca, các thay đổi vượt ngưỡng OSP ±15 phút, NOTAM/thời tiết ảnh hưởng đến chuyến cụ thể (Nguồn: Khảo sát 11/06 §II.4, §II.5, §II.6, §II.7).
- Tạo nguồn dữ liệu danh mục chuẩn hóa, đồng bộ chủ động cho các hệ thống vệ tinh thông qua API/Webhook (Nguồn: Đề xuất §II.4).

---

## 4. Mục tiêu nghiệp vụ (Business Objectives)

| Mã | Mục tiêu | Chỉ số (KPI) | Chỉ tiêu định lượng | Nguồn |
|---|---|---|---|---|
| OBJ-001 | Thay thế hệ thống FMS hiện hành | Tỷ lệ phủ dữ liệu chuyển động chuyến bay (Movement) | Hiện ~90% → mục tiêu định lượng cụ thể (chưa có nguồn — cần BA Lead/SME bổ sung) | Khảo sát 08/06 §II.3 |
| OBJ-002 | Nâng cao độ chính xác dữ liệu chuyển động chuyến bay | Tỷ lệ độ chính xác Movement | Hiện ~79% → mục tiêu cụ thể (chưa có nguồn — cần BA Lead/SME bổ sung) | Khảo sát 08/06 §II.3 |
| OBJ-003 | Duy trì tỷ lệ đúng giờ (OTP) và hiệu quả thực hiện lịch khai thác (OSP) | OTP, OSP đi/đến | 4 mục tiêu chia cho 2 nhóm chỉ số (mức cụ thể nguồn nêu ví dụ "80%"); ngưỡng cảnh báo OSP ±15 phút áp dụng cả sớm và muộn | Khảo sát 09/06 §II.8; Khảo sát 11/06 §II.5 |
| OBJ-004 | Bảo đảm tính sẵn sàng dịch vụ điều hành 24/7/365 | SLA độ sẵn sàng | ≥ 99% (HA active-active/active-standby; chuyển đổi < 1h) | Đề xuất §I; YCKT TOSS-001…057 |
| OBJ-005 | Đáp ứng quy mô người dùng OCC | Số người dùng / số đồng thời | ≥ 4000 người dùng, đồng thời 200 | YCKT TOSS-001…057 |
| OBJ-006 | Tuân thủ pháp lý dữ liệu | Mức tuân thủ | Tuân thủ tuyệt đối Nghị định 53/2022/NĐ-CP (lưu trữ dữ liệu tại VN) và Nghị định 13/2023/NĐ-CP (bảo vệ dữ liệu cá nhân) | Đề xuất §I; YCKT NFR |
| OBJ-007 | Vận hành liên tục theo cam kết hợp đồng | Thời hạn vận hành / bảo trì | 60 tháng kể từ go-live; bàn giao mã nguồn cho VNA sau khi hết thuê | YCKT TOSS-001…057 |
| OBJ-008 | Hợp nhất nguồn dữ liệu danh mục (Single Source of Truth) | Số hệ thống vệ tinh nhận dữ liệu danh mục từ TOSS | (chưa có nguồn — cần BA Lead/SME bổ sung) | Đề xuất §II.4 |
| OBJ-009 | Giảm thời gian kiểm tra đầu ca của điều phái viên | Số ứng dụng/tab phải mở; thời gian hoàn tất kiểm tra đầu ca | Hiện 5–7 ứng dụng/tab → mục tiêu định lượng (chưa có nguồn — cần BA Lead/SME bổ sung) | Khảo sát 11/06 §II.4 |

> **Lưu ý:** Nhiều mục tiêu định lượng cụ thể (tỷ lệ phủ Movement mục tiêu, OTP/OSP theo từng nhóm chỉ số, thời gian hoàn tất kiểm tra đầu ca…) chưa được nguồn chốt; BA Lead/SME cần bổ sung trong các buổi khảo sát kế tiếp.

---

## 5. Phạm vi (Scope)

### 5.1 Trong phạm vi (In-scope)

1. **Phân hệ Thông tin điều hành chuyến bay** — danh sách chuyến bay đa chiều (kế hoạch/dự kiến/thực tế); thông tin tàu bay, tổ bay, tải trọng, hành khách, đường bay, thời gian và nhiên liệu, khai thác sân bay; ghi nhận bất thường; giám sát tài liệu; quản trị đa Carrier; cảnh báo bằng màu sắc (Nguồn: Đề xuất §II.1).
2. **Phân hệ Quản lý tài liệu chuyến bay** — quản lý OFP, NOTAM, WX, Briefing Package; quản lý tài liệu thương mại và phục vụ (LS, GD, PM, NOTOC, Cargo/Mail Manifest); quản lý tải trọng và đối soát ZFW; Dispatch Release; hỗ trợ Web Mobile (iOS/Android/iPadOS) và giao diện độc lập khi mất kết nối (Nguồn: Đề xuất §II.2; Khảo sát 11/06 §II.1, II.2).
3. **Phân hệ Quản lý báo cáo, đánh giá tối ưu khai thác** — báo cáo điều hành ngày khai thác (BCAO) số hóa hai phần (thực hiện hôm trước + kế hoạch hôm nay); báo cáo lịch bay & OTP/OSP; báo cáo nhiên liệu tiêu thụ; báo cáo thời gian thực hiện chuyến bay; báo cáo OFP & dữ liệu bay thực tế; báo cáo tải trọng, dịch vụ, tổ bay; báo cáo khai thác và môi trường; quản lý mục tiêu các chỉ số (Nguồn: Đề xuất §II.3; Khảo sát 09/06 §II.7, II.8).
4. **Phân hệ Quản lý danh mục (Master Data)** — danh mục tàu bay, sân bay, chặng bay & tối ưu hóa, danh mục bổ trợ và tham số hệ thống; quản lý phiên bản, đồng bộ chủ động qua API/Webhook; phân quyền dữ liệu (Nguồn: Đề xuất §II.4; Khảo sát 09/06 §II.1).
5. **Phân hệ Quản trị hệ thống** — IAM/RBAC, MFA/2FA, SSO, tích hợp LDAP/AD, JWT, phân quyền theo Carrier/sân bay/tàu bay, lưu vết & kiểm toán; cổng tích hợp API Gateway; nền tảng dữ liệu lớn (Batch + Streaming); giám sát vận hành (Nguồn: Đề xuất §II.5; YCKT TOSS-001…057).
6. **Tích hợp** với khoảng 40 hệ thống/nguồn dữ liệu nội bộ và bên ngoài (Lido, MO Plus, AMOS, Amadeus PSS, DCS, AVES, ACDM, VMS/VIAGS, ACARS, AFTN/AMHS, FlightRadar24, Flight Watch, DWH/Lakehouse, LDAP/AD…) (Nguồn: Phân tích YCKT v0.1 §3; YCKT TOSS-058…121).
7. **Số hóa các quy trình điều phái viên (FDOP)** đã được khách hàng cung cấp: quy trình end-to-end (FDOP §3.1); vai trò theo ca trực (FDOP §3.2); chuyến bay VIP (FDOP §3.3); chuyến bay qua vùng trời không kiểm soát (FDOP §3.4); nhận tàu bay (FDOP §3.5) (Nguồn: FDOP §3.1–3.5).
8. **Triển khai trên Cloud của VNA** với 3 môi trường Prod / Dev-Test / Standby-Backup (Nguồn: YCKT NFR; Khảo sát 08/06 §II.7).

### 5.2 Ngoài phạm vi (Out-of-scope)

1. **Lập kế hoạch bay (Flight Planning) tự động** — vẫn do Lido thực hiện; TOSS chỉ thu nạp OFP từ Lido, không thay thế chức năng tạo OFP (Nguồn: Khảo sát 11/06 §II.1).
2. **Xác nhận tài liệu chuyến bay bởi phi công (Captain's Release)** — vẫn diễn ra trên MO Plus; TOSS chỉ phát hành trạng thái "đã Dispatch Release" để MO Plus tiêu thụ (Nguồn: Khảo sát 11/06 §II.2).
3. **Hệ thống bảo dưỡng kỹ thuật (MEL/CDL, defect, AOG)** — vẫn do AMOS quản lý; TOSS chỉ đồng bộ dữ liệu để hiển thị và cảnh báo (Nguồn: YCKT TOSS-122 …; Đề xuất §II.4).
4. **Hệ thống đặt chỗ và bán vé (PSS — Passenger Service System)** — vẫn do Amadeus PSS quản lý; TOSS chỉ tiêu thụ dữ liệu hành khách (Nguồn: Đề xuất §II.1; Phân tích YCKT v0.1).
5. **Hệ thống làm thủ tục khách (DCS — Departure Control System)** — không thuộc TOSS; TOSS chỉ tiêu thụ dữ liệu khách thực tế và tài liệu LS/PM (Nguồn: Đề xuất §II.2; Phân tích YCKT v0.1).
6. **Lưu trữ tài liệu dài hạn từ hệ thống ngoài** — tài liệu từ hệ thống ngoài chỉ kéo về khi người dùng tải xuống và lưu tối đa 3 ngày sau khi chuyến bay hạ cánh; chỉ tài liệu do chính TOSS sinh ra mới lưu trong hệ thống (Nguồn: Khảo sát 09/06 §II.4).
7. **Ký số phát hành báo cáo** — báo cáo phát hành qua thư điện tử, không yêu cầu ký số (Nguồn: Khảo sát 08/06 §II.4).
8. **Quản lý tiêu chuẩn cấp cứu hỏa sân bay (RFFS) hiện hành** — không cần duy trì danh sách tiêu chuẩn RFFS hiện hành cho mục đích cảnh báo cơ bản; TOSS chỉ phát hiện NOTAM cứu hỏa là cảnh báo (Nguồn: Khảo sát 11/06 §II.6).

### 5.3 Các phạm vi cần làm rõ thêm

- Phương án khi hệ thống lập kế hoạch bay không cho phép tích hợp trực tiếp (Khảo sát 08/06 §IV).
- Phạm vi tích hợp Dispatch Release ↔ Captain's Release giữa TOSS và MO Plus (giao diện trạng thái, thời điểm đồng bộ, cơ chế thông báo — Khảo sát 11/06 §II.2 phần Kết luận).
- Phạm vi xử lý phần nhiên liệu VNA tự cấp cho tàu thuê ướt kết hợp (Damp Lease) (Khảo sát 09/06 §IV).

---

## 6. Các bên liên quan (Stakeholders)

| Bên liên quan | Vai trò | Mức quan tâm | Mức ảnh hưởng | Kỳ vọng chính | Nguồn |
|---|---|---|---|---|---|
| Trực ban trưởng (OCC Duty Manager) | Giám sát trạng thái khai thác, khách nối chuyến; lập BCAO; phê duyệt báo cáo | Cao | Cao | Giám sát đồng thời nhiều chuyến bay; số hóa BCAO; tổng hợp tự động tối đa | Khảo sát 08/06 §II.2; Khảo sát 09/06 §II.7 |
| Điều phái viên (Dispatcher) | Lập/phát hành OFP; Dispatch Release; kiểm tra đầu ca; xử lý cảnh báo | Cao | Cao | Màn hình tập trung kiểm tra đầu ca; cảnh báo NOTAM/thời tiết theo chuyến phụ trách; thao tác Dispatch Release rõ ràng | Khảo sát 11/06 §II.1, II.4, II.6, II.7; FDOP §3.1–3.5 |
| Cán bộ tài liệu chuyến bay | Theo dõi tình trạng tài liệu chuyến (đã được tổ bay xác nhận/tải xuống chưa) | Cao | Trung bình | Dashboard tài liệu riêng cho nhóm này | Khảo sát 08/06 §II.2 |
| Phi công (PIC — Pilot-in-Command) / Tổ bay | Captain's Release; xác nhận tài liệu trên MO Plus | Cao | Cao | MO Plus chặn Captain's Release khi điều phái chưa Dispatch Release; hiển thị thông báo rõ ràng | Khảo sát 11/06 §II.2 |
| Khối kỹ thuật / Trực kỹ thuật | Cung cấp dữ liệu MEL/CDL, AOG, APU/PACK; nhập tab kỹ thuật trong BCAO | Trung bình | Cao | Tab nhập riêng trong BCAO; đồng bộ AMOS | Khảo sát 09/06 §II.7; YCKT TOSS-122… |
| Đơn vị dịch vụ mặt đất (VIAGS) | Nhập tab dịch vụ trong BCAO; phục vụ mặt đất, turnaround | Trung bình | Trung bình | Tab nhập riêng cho dịch vụ | Khảo sát 09/06 §II.7; Phân tích YCKT v0.1 §3 |
| Lãnh đạo VNA / Tổng công ty Hàng không Việt Nam | Phê duyệt BCAO; theo dõi KPI khai thác, an toàn, chi phí | Cao | Cao | Trang đầu BCAO + phần bất thường trực quan; báo cáo phải được phê duyệt trước phát hành | Khảo sát 09/06 §II.7 |
| Cơ quan quản lý: Cục Hàng không Việt Nam (CAAV) | Phê chuẩn điều phái viên VIP hằng năm; quy chế khai thác | Trung bình | Cao | Tuân thủ AOC và quy định CAAV | FDOP §3.2, §3.3 |
| VTIT (đơn vị phát triển) | Triển khai TOSS; tích hợp; đào tạo | Cao | Cao | Khảo sát song song số liệu/nghiệp vụ; tổng quan trước, chi tiết sau | Khảo sát 08/06 §II.1 |
| Khối Chuyển đổi số — Công nghệ (CĐS-CN) VNA | Cấp hạ tầng đám mây; phối hợp tích hợp; cung cấp dữ liệu DWH | Cao | Cao | Cấp hạ tầng UAT đúng tiến độ; thông kết nối trước 30/06/2026 | Khảo sát 08/06 §II.7; Phân tích YCKT v0.1 §6 |
| Đơn vị phát hành NOTAM (cơ quan quản lý bay) | Cung cấp NOTAM | Trung bình | Trung bình | Cung cấp nguồn NOTAM chính thức để TOSS tích hợp `[cần xác nhận tên đơn vị: VNCM/VNCS]` | Khảo sát 11/06 §II.6 |
| Cơ quan khí tượng hàng không Việt Nam | Cung cấp METAR/SPECI | Trung bình | Trung bình | Cung cấp nguồn thời tiết chính thức cho nội địa `[cần xác nhận tên đơn vị]` | Khảo sát 11/06 §II.7 |
| Nhóm chủ sở hữu/đi thuê tàu bay (VNA — vừa sở hữu, vừa lessee) | Cung cấp thông tin sở hữu tàu, hình thức thuê (Dry/Wet/Damp Lease) | Trung bình | Trung bình | Quản lý đa hình thức sở hữu trong cùng nền tảng | Khảo sát 09/06 §II.5; YCKT TOSS-122… |

### 6.1 Ma trận RACI — (chưa có nguồn — cần BA Lead/SME bổ sung)

> Nguồn hiện chưa cung cấp ma trận RACI chính thức; phần này sẽ được BA Lead bổ sung sau khi xác nhận với các đầu mối CQĐV trên sheet "Nhân sự" của YCKT.

---

## 7. Yêu cầu nghiệp vụ chi tiết (Detailed Business Requirements)

> **Phạm vi mức:** Mỗi BR là một câu yêu cầu nghiệp vụ tổng quát, KHÔNG bóc xuống chức năng cụ thể, trường dữ liệu hay use case. Việc phân rã chi tiết tới Yêu cầu chức năng (FR — Functional Requirement), Trường hợp sử dụng (UC — Use Case), Câu chuyện người dùng (US — User Story) sẽ được thực hiện ở tài liệu SRS/FRD kế tiếp.
>
> **Quy ước MoSCoW:** Must = bắt buộc, Should = nên có, Could = có thể có, Won't = không trong phạm vi đợt này. Các BR đánh "Must" là các yêu cầu được nguồn (khảo sát/đề xuất/YCKT) khẳng định bắt buộc; các BR đánh "Should/Could" cần BA Lead xác nhận lại với khách hàng.

### 7.1 Phân hệ 1 — Thông tin điều hành chuyến bay

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-101 | Hệ thống phải cung cấp danh sách chuyến bay trực quan, hợp nhất đầy đủ thông tin kế hoạch (STD/STA) — dự kiến (ETD/ETA) — thực tế (ATD/ATA) cùng các thuộc tính liên quan: tàu bay, cấu hình cabin, thời tiết, NOTAM, tổ bay, hành khách, hàng hóa, doanh thu và chi phí. | Functional | Must | Đề xuất §II.1 |
| BR-102 | Hệ thống phải cho phép cá nhân hóa giao diện (ẩn/hiện cột) và lưu tùy chỉnh theo từng phiên người dùng, không ảnh hưởng người khác. | Functional | Must | Đề xuất §II.1 |
| BR-103 | Hệ thống phải hiển thị cảnh báo bằng màu sắc tại các trường thông tin cho các bất thường: MEL/CDL, hỏng cabin, khách VIP, khách nối chuyến, hệ số lấp đầy thấp, chậm chuyến, thiếu phép bay, thiếu điện văn hàng không. | Functional | Must | Đề xuất §II.1 |
| BR-104 | Hệ thống phải cho phép xem lịch sử thay đổi chi tiết của từng chuyến bay (thời gian, tàu bay, loại chuyến, trạng thái) và hỗ trợ quản lý chuyến bay chuyển hướng (Divert) với so sánh sân bay dự kiến — sân bay hạ cánh thực tế. | Functional | Must | Đề xuất §II.1; Khảo sát 11/06 §II.5 |
| BR-105 | Hệ thống phải tích hợp bản đồ trực quan (FlightRadar24) cho phép xem vị trí và hành trình thực tế của tàu bay. | Functional | Must | Đề xuất §II.1; YCKT TOSS-085 |
| BR-106 | Hệ thống phải hỗ trợ quản trị đa Carrier — điều hành đồng thời các chuyến bay của nhiều hãng vận chuyển trên cùng nền tảng (VNA, 0V, BL). | Functional | Must | Đề xuất §II.1; Khảo sát 09/06 §II.7 |
| BR-107 | Hệ thống phải quản lý hồ sơ và tình trạng tàu bay theo thời gian thực: định danh (loại tàu, số đăng ký, mã ICAO/IATA, chứng chỉ), lịch khai thác, chỉ số hiệu suất (PF — Performance Factor), tình trạng MEL/CDL, lịch bảo dưỡng và AOG, giới hạn chu kỳ bay (FC), chi phí APU. | Functional | Must | Đề xuất §II.1; YCKT TOSS-122…; Khảo sát 09/06 §II.5 |
| BR-108 | Hệ thống phải quản lý thông tin tổ bay: hồ sơ phi hành đoàn, hành trình tổ bay, kiểm soát giờ bay (Flight Time) và giờ làm việc (Duty Time) đảm bảo tuân thủ tiêu chuẩn an toàn. | Functional | Must | Đề xuất §II.1 |
| BR-109 | Hệ thống phải hiển thị realtime số khách mở bán / booking / thực tế theo từng hạng (Adult/Child/Infant) và các nhóm đặc biệt (VIP, CIP, nối chuyến); quản trị Payload (trọng lượng khách, hành lý, hàng hóa, DOW, ULD) và lịch sử thay đổi tải. | Functional | Must | Đề xuất §II.1 |
| BR-110 | Hệ thống phải cung cấp khuyến nghị tối ưu cho chuyến bay (tankering, taxi out, Cost Index, sân bay dự bị); tích hợp NOTAM và thời tiết bóc tách tự động; quản trị nhiên liệu (kế hoạch, fuel order, Load Sheet, dự phòng/extra); hiển thị SID/STAR kế hoạch và thực tế. | Functional | Must | Đề xuất §II.1 |
| BR-111 | Hệ thống phải theo dõi các cột mốc khai thác sân bay phục vụ OTP: vị trí đỗ, cửa khởi hành (Boarding Gate), giờ bắt đầu đón khách thực tế, băng chuyền hành lý, dịch vụ mặt đất. | Functional | Must | Đề xuất §II.1 |
| BR-112 | Hệ thống phải ghi nhận và phân loại bất thường (thời tiết, kỹ thuật, lý do khách quan khác); cung cấp dashboard tài liệu chuyến và luồng phê duyệt request/confirm/reject kèm dấu thời gian thực; quản lý phiên bản và tải về toàn bộ hồ sơ tài liệu. | Functional | Must | Đề xuất §II.1; Khảo sát 09/06 §II.7 |
| BR-113 | Hệ thống phải cung cấp hai nhóm màn hình giám sát riêng cho hai nhóm đối tượng: trực ban trưởng (trạng thái khai thác, khách nối chuyến) và cán bộ tài liệu (tình trạng tài liệu chuyến bay). | Functional | Must | Khảo sát 08/06 §II.2 |
| BR-114 | Hệ thống phải cung cấp một màn hình tập trung kiểm tra đầu ca (Start-of-Shift Check) gom 9 nhóm nội dung: lịch bay, loại tàu, tàu quay, cứu hỏa sân bay (RFFS), thời tiết, tải, MEL/CDL, hạn chế, chứng chỉ tổ bay; tự đối chiếu dữ liệu giữa các nguồn và tự sinh cảnh báo khi bất thường. | Functional | Must | Khảo sát 11/06 §II.4 |
| BR-115 | Hệ thống phải đóng vai trò "view + cảnh báo"; các thao tác nghiệp vụ chuyên dụng (Lido, MO Plus, AMOS…) vẫn thực hiện ở hệ thống chuyên dụng tương ứng, không trùng lặp chức năng. | Functional | Must | Khảo sát 11/06 §II.4 |
| BR-116 | Hệ thống phải sinh cảnh báo thay đổi lịch bay khi thay đổi giờ ±15 phút (theo OSP) áp dụng cả sớm và muộn; thay đổi loại tàu; thay đổi tàu bay cụ thể; phát sinh chuyến ferry; chuyển sang VIP; phát sinh chuyến Lotang `[cần xác nhận định nghĩa chính xác]`. | Functional | Must | Khảo sát 11/06 §II.5 |
| BR-117 | Hệ thống phải tách cảnh báo Divert thành nhóm riêng; khi Divert phát sinh chuyến mới, cảnh báo "chưa có tài liệu" cho chuyến mới. | Functional | Must | Khảo sát 11/06 §II.5 |
| BR-118 | Hệ thống phải tích hợp NOTAM từ nguồn chính thức `[cần xác nhận tên: VNCM/VNCS]`, phân loại theo 3 nhóm (sân bay / vùng trời / đường bay) và đánh giá mức độ ảnh hưởng đến chuyến cụ thể; khi có NOTAM cứu hỏa (RFFS) phát ra thì cảnh báo trực tiếp. | Functional | Must | Khảo sát 11/06 §II.6 |
| BR-119 | Hệ thống phải tích hợp và parse được METAR + SPECI, cảnh báo thời tiết sân bay tập trung 3 thông số (tầm nhìn, trần mây, TSRA) so với ngưỡng VMA `[cần xác nhận viết tắt]` cộng biên an toàn; ưu tiên nguồn chính thức (METAR/SPECI nội địa, gói Lido cho quốc tế). | Functional | Must | Khảo sát 11/06 §II.7 |

### 7.2 Phân hệ 2 — Quản lý tài liệu chuyến bay

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-201 | Hệ thống phải tự động đồng bộ OFP, NOTAM, WX và Briefing Package từ Lido (hoặc các nguồn dữ liệu hàng không liên quan) gắn với từng chuyến bay. | Functional | Must | Đề xuất §II.2 |
| BR-202 | Hệ thống phải quản lý đa phiên bản (Versioning) OFP — hiển thị trạng thái, cho phép xem/tải xuống toàn bộ các phiên bản đã phát hành, kèm lịch sử người tạo, thời gian, thông số kỹ thuật. | Functional | Must | Đề xuất §II.2 |
| BR-203 | Hệ thống phải hiển thị nhanh thông tin điều phái chi tiết từ OFP: người lập kế hoạch, Payload, Fuel Order, Cơ trưởng (PIC), thông số Flight Release. | Functional | Must | Đề xuất §II.2 |
| BR-204 | Hệ thống phải cung cấp Briefing Sheet kỹ thuật số tương tác — cho phép nhập ghi chú/chú thích cho NOTAM, WX, MEL/CDL, Special Ops; tự động cập nhật khi có thay đổi từ nguồn. | Functional | Must | Đề xuất §II.2 |
| BR-205 | Hệ thống phải kiểm soát Revision và lưu vết của file NOTAM và thời tiết; mặc định hiển thị phiên bản cuối nhưng vẫn cho xem lại nội dung và thời gian upload của các phiên bản trước. | Functional | Must | Đề xuất §II.2 |
| BR-206 | Hệ thống phải hỗ trợ đa định dạng file (PDF, DOCX, ảnh, TXT) và cho phép upload thủ công cho từng chuyến hoặc nhiều chuyến cùng lúc; cung cấp giao diện độc lập để điều phái cấp tài liệu cho tổ bay khi tích hợp tự động gặp sự cố kết nối. | Functional | Must | Đề xuất §II.2; Khảo sát 09/06 §II.3 |
| BR-207 | Hệ thống phải tự động tích hợp và gắn kết LS, GD, PM, NOTOC, Cargo/Mail Manifest từ PSS/DCS vào từng chuyến tương ứng; tự bóc tách và lưu trữ các trường dữ liệu quan trọng phục vụ tìm kiếm và báo cáo. | Functional | Must | Đề xuất §II.2 |
| BR-208 | Hệ thống phải kiểm soát luồng xác thực tài liệu (Confirmation Workflow): Unconfirmed / Confirmed / Rejected theo từng đối tượng; cho phép phân quyền xác nhận một phần hoặc toàn bộ tài liệu. | Functional | Must | Đề xuất §II.2 |
| BR-209 | Hệ thống phải truy vết yêu cầu (Request) — phản hồi (Confirm/Reject) chi tiết (lý do, thời gian, comment) cho từng phiên bản tài liệu; cho phép download trang xác nhận. | Functional | Must | Đề xuất §II.2 |
| BR-210 | Hệ thống phải cung cấp phiên bản Web Mobile tương thích iOS / Android / iPadOS cho phép phi công và tổ bay quản lý thông tin, xem tài liệu và xác nhận điện tử tại hiện trường. | Functional | Must | Đề xuất §II.2 |
| BR-211 | Hệ thống phải hỗ trợ tải tài liệu hàng loạt theo khu vực riêng (vẫn giữ tải thủ công), tự gắn tài liệu vào đúng chuyến dựa trên quy ước đặt tên tệp. | Functional | Must | Khảo sát 09/06 §II.3 |
| BR-212 | Hệ thống phải áp dụng nguyên tắc lưu trữ: tài liệu do TOSS sinh ra → lưu trong hệ thống; tài liệu từ hệ thống ngoài → chỉ kéo về khi người dùng tải xuống và lưu tối đa 3 ngày sau khi chuyến bay hạ cánh, sau đó tự xóa. | Functional | Must | Khảo sát 09/06 §II.4 |
| BR-213 | Hệ thống phải bổ sung chức năng "Dispatch Release" làm thao tác chủ động của điều phái viên — gắn trạng thái "đã Dispatch Release" cho từng phiên bản OFP, làm tín hiệu cho MO Plus và phi công. Lido vẫn tự sinh OFP và đẩy lên MO Plus như hiện hành. | Functional | Must | Khảo sát 11/06 §II.1 |
| BR-214 | Hệ thống phải đồng bộ trạng thái "đã Dispatch Release" sang MO Plus để MO Plus chặn thao tác Captain's Release của phi công khi chưa có Dispatch Release tương ứng và hiển thị thông báo "Dispatch chưa Release". Phạm vi giao diện cụ thể giữa TOSS — MO Plus cần làm rõ. | Functional | Must | Khảo sát 11/06 §II.2 |
| BR-215 | Hệ thống phải ghi nhận lịch sử các lần làm lại OFP sát giờ (dưới 60 phút trước STD cho nội địa) kèm lý do "tổ bay yêu cầu" để phục vụ truy vết; không tự động hóa quyết định làm lại OFP trong tình huống này. | Functional | Must | Khảo sát 11/06 §II.3 |
| BR-216 | Hệ thống phải hỗ trợ quản lý tải trọng: tự động tính trọng lượng hành khách/hành lý theo cấu hình tham số chuẩn; quản lý hàng/mail; quản lý ULD (AKE, PMC) với quy đổi tự động; tính Payload và ZFW ước tính. | Functional | Must | Đề xuất §II.2 |
| BR-217 | Hệ thống phải đối soát an toàn ZFW: so sánh DOW và ZFW từ OFP với ZFW thực tế tính toán; cảnh báo Delta khi có sai lệch; cho phép nhập thủ công khi cần và ghi nhận lịch sử cập nhật. | Functional | Must | Đề xuất §II.2 |

### 7.3 Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-301 | Hệ thống phải cung cấp nền tảng báo cáo với bộ lọc linh hoạt, cho phép tùy chọn cột hiển thị và xuất dữ liệu định dạng chuẩn (PDF, Excel, Docx). | Functional | Must | Đề xuất §II.3 |
| BR-302 | Hệ thống phải số hóa Báo cáo điều hành ngày khai thác (BCAO) theo cấu trúc hiện hành: một văn bản duy nhất chia hai phần — thực hiện ngày hôm trước (số liệu) + kế hoạch ngày hôm nay (kèm APU/PACK, AOG, TAF, NOTAM, phụ lục kỹ thuật). Tự động thu thập dữ liệu tối đa từ lịch bay, các bộ phận chỉ nhập phần chuyên môn. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-303 | Hệ thống phải dùng chung một màn hình BCAO với phân quyền theo tab nguồn: tab tổng quan của trực ban trưởng, tab kỹ thuật do khối kỹ thuật nhập, tab dịch vụ do đơn vị dịch vụ nhập. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-304 | Hệ thống phải hỗ trợ luồng phê duyệt BCAO trước khi phát hành; phát hành qua thư điện tử (không yêu cầu ký số) tới danh sách đầu mối nhận báo cáo cấu hình sẵn. | Functional | Must | Khảo sát 08/06 §II.4; Khảo sát 09/06 §II.7 |
| BR-305 | Hệ thống phải nhập bất thường theo cách đa chiều: người nhập chọn tàu → hệ thống liệt kê các chuyến của tàu đó → tích chọn chuyến bị ảnh hưởng; hạn chế nhập tự do; ưu tiên chọn từ danh mục nguyên nhân do người dùng tự định nghĩa; hỗ trợ lọc theo khoảng thời gian và sân bay đi/đến; dùng cho cả báo cáo ngày và thống kê dài hạn. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-306 | Hệ thống phải nhận biết tự động yếu nhân và chuyên cơ khi nguồn có dữ liệu `[cần xác nhận tên hệ thống nguồn]`; phần còn lại tích chọn thủ công. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-307 | Hệ thống phải trình bày BCAO trực quan bằng biểu đồ, thay thế tệp Word thủ công. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-308 | Hệ thống phải cung cấp báo cáo lịch bay và hiệu suất: thống kê biến động (đổi giờ/tàu/cấu hình/code/hủy), phân loại tính chất chuyến (thường lệ, Charter, Ferry, VIP, khách/hàng), OTP/OSP chi tiết theo sân bay (chậm cất cánh/hạ cánh), sử dụng đội tàu (số cất hạ cánh, BH, thời gian dừng/nằm sân). | Functional | Must | Đề xuất §II.3 |
| BR-309 | Hệ thống phải cung cấp báo cáo nhiên liệu tiêu thụ: Fuel/FH theo loại tàu và chặng (Median/Mean/Max/Min, độ tin cậy %); đối soát kế hoạch ↔ thực tế; giám sát Pilot Extra Fuel; chỉ số kinh tế (Fuel Burn/RTK, Fuel Burn/BH). | Functional | Must | Đề xuất §II.3 |
| BR-310 | Hệ thống phải cung cấp báo cáo thời gian thực hiện chuyến bay: Taxi Time và khuyến nghị; BH (xu hướng, trung bình, theo mùa); phân tích Phase (Taxi-out, Takeoff, Climb, Cruise, Descent, Taxi-in); Holding; Ground Time / Turnaround Time. | Functional | Must | Đề xuất §II.3 |
| BR-311 | Hệ thống phải cung cấp báo cáo kế hoạch bay (OFP) và dữ liệu bay thực tế: thời gian làm OFP so với quy định, độ chính xác tải trọng (Payload Accuracy), tối ưu hóa đường bay (sân bay dự bị, Flight Level, Cost Index, Route, Runway, SID, STAR). | Functional | Must | Đề xuất §II.3 |
| BR-312 | Hệ thống phải cung cấp báo cáo tải trọng, dịch vụ và tổ bay: Load Factor, VIP/CIP, hành lý/offload, NOTOC, Cargo Manifest, thay đổi tải sát giờ, mục tiêu giờ bay tổ bay, giờ bay/giờ làm việc, tổ bay dự bị, khai thác không đúng quy định. | Functional | Must | Đề xuất §II.3 |
| BR-313 | Hệ thống phải cung cấp báo cáo khai thác và môi trường: bất thường khai thác (thời tiết/kỹ thuật/khác), phân tích thời tiết chuyên sâu (quan trắc vs Minima, dự báo vs thực tế), hiệu quả tổng thể (Profitability). | Functional | Must | Đề xuất §II.3 |
| BR-314 | Hệ thống phải quản lý mục tiêu các chỉ số OTP và OSP với 4 mục tiêu chia cho 2 nhóm chỉ số; các chỉ số được tính tự động khi đủ nguồn dữ liệu (gồm dữ liệu sẵn có + dữ liệu nhập thêm). | Functional | Must | Khảo sát 09/06 §II.8 |
| BR-315 | Hệ thống phải tách màn hình giám sát dữ liệu riêng — báo cáo độ phủ và độ chính xác dữ liệu (vd tỷ lệ chuyến có điện văn theo từng đội tàu). | Functional | Must | Khảo sát 09/06 §II.8 |
| BR-316 | Hệ thống phải cung cấp khuyến nghị tối ưu chính sách mang dầu bổ sung (Tankering Strategy) với tính chất khuyến nghị. | Functional | Should | Đề xuất §I |

### 7.4 Phân hệ 4 — Quản lý danh mục (Master Data)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-401 | Hệ thống phải tổ chức phân hệ danh mục tách biệt với các module nghiệp vụ để bảo đảm nguồn sự thật duy nhất (Single Source of Truth); tách bảo trì danh mục thành menu riêng do khối lượng dữ liệu lớn. | Functional | Must | Đề xuất §II.4; Khảo sát 09/06 §II.1 |
| BR-402 | Mọi danh mục phải được định nghĩa theo cấu trúc Metadata chuẩn, hỗ trợ phân loại theo lĩnh vực, nghiệp vụ hoặc hệ thống sử dụng. | Functional | Must | Đề xuất §II.4 |
| BR-403 | Hệ thống phải quản lý phiên bản (Versioning) cho từng bản ghi danh mục (ai thay đổi, nội dung thay đổi, thời điểm) và cho phép truy xuất trạng thái dữ liệu tại bất kỳ thời điểm nào trong quá khứ. | Functional | Must | Đề xuất §II.4 |
| BR-404 | Hệ thống phải đồng bộ hóa dữ liệu danh mục chủ động cho các hệ thống vệ tinh thông qua API hoặc Webhook ngay khi phát sinh thay đổi; có phân quyền truy cập danh mục đến từng hệ thống / nhóm người dùng. | Functional | Must | Đề xuất §II.4; YCKT TOSS-058… |
| BR-405 | Hệ thống phải quản lý danh mục tàu bay: số đăng ký, loại theo mã ICAO/IATA, trọng tải, chủ sở hữu, hình thức thuê/mua (sở hữu, thuê khô — Dry Lease, thuê ướt — Wet Lease, thuê ướt kết hợp — Damp Lease), thời điểm hiệu lực khai thác; quản lý theo lịch sử khai thác (tàu có thể vào/ra đội bay nhiều lần, thay đổi cấu hình khoang). | Functional | Must | Đề xuất §II.4; Khảo sát 09/06 §II.5 |
| BR-406 | Hệ thống phải quản lý các thuộc tính khai thác của tàu bay: cấu hình khoang, dung tích thùng nhiên liệu và thùng nước, khoang hàng; phân nhóm đội tàu (mỗi tàu chỉ gán một lần) phục vụ báo cáo. | Functional | Must | Khảo sát 09/06 §II.5 |
| BR-407 | Hệ thống phải quản lý Master MEL và đồng bộ MEL/CDL, defects từ AMOS; lọc theo nhóm ảnh hưởng (phi công/tiếp viên/thợ máy); highlight MEL mới; ghi chú ảnh hưởng khai thác; liên kết xem tài liệu MEL hiện hành. | Functional | Must | Đề xuất §II.4; YCKT TOSS-122… |
| BR-408 | Hệ thống phải quản lý chỉ số PF (Performance Factor): thu nạp file dữ liệu đội tàu để tính PF; PF tính từ điện văn ACARS; tàu thiếu dữ liệu dùng PF kỳ trước; lưu lịch sử, thống kê biến động và cảnh báo tàu thiếu dữ liệu. | Functional | Must | Đề xuất §II.4; YCKT TOSS-122…; Khảo sát 08/06 §II.5 |
| BR-409 | Hệ thống phải theo dõi giới hạn chu kỳ bay (FC), lịch bảo dưỡng ngắn/dài hạn, AOG và dự kiến thời gian khắc phục; cảnh báo khi tiến gần giới hạn FC. | Functional | Must | Đề xuất §II.4 |
| BR-410 | Hệ thống phải quản lý danh mục sân bay: mã ICAO/IATA, đường băng, đường lăn, bãi đỗ, trang thiết bị hỗ trợ cất hạ cánh; tiêu chuẩn tối thiểu (Minima); WX; địa hình; SID/STAR/IAP; Slot, phép bay, khung giờ khai thác; khả năng phục vụ mặt đất (nhiên liệu/kỹ thuật/điện mặt đất); NOTAM; an ninh; phí khai thác. | Functional | Must | Đề xuất §II.4 |
| BR-411 | Hệ thống phải quản lý danh mục dịch vụ sân bay (vd sân bay không hỗ trợ tàu hỏng APU) để phục vụ cảnh báo và hỗ trợ điều hành đổi tàu khi cần. | Functional | Must | Khảo sát 09/06 §II.6 |
| BR-412 | Hệ thống phải quản lý danh mục chặng bay (Route & Optimization): điểm đi/đến, GCD, Cost Index, Final Reserve, EDTO; chi phí điều hành bay / bay qua / MCMR theo từng giai đoạn. | Functional | Must | Đề xuất §II.4 |
| BR-413 | Hệ thống phải quản lý quy tắc Tankering: thu nạp giá nhiên liệu, tính khuyến nghị theo hiệu quả chi phí từng giai đoạn; cập nhật linh hoạt chặng bay/loại tàu áp dụng; xuất khuyến nghị theo thời gian hiệu lực. | Functional | Should | Đề xuất §II.4 |
| BR-414 | Hệ thống phải quản lý danh mục bổ trợ: phi công, tiếp viên, quốc gia, FIR, đơn vị ULD, danh sách email phục vụ thông báo tự động. | Functional | Must | Đề xuất §II.4 |
| BR-415 | Hệ thống phải cho phép cấu hình tham số vận hành: hệ số độ tin cậy chuyến bay (%), ngưỡng chênh lệch nhiên liệu nạp (phi công yêu cầu vs kế hoạch), ngưỡng chênh lệch trọng tải, deadline lập OFP (quốc tế/quốc nội), thời gian cảnh báo thiếu tài liệu; mọi tham số linh hoạt cập nhật trực tiếp trên giao diện bởi người dùng có thẩm quyền. | Functional | Must | Đề xuất §II.4 |
| BR-416 | Hệ thống phải hỗ trợ hệ số quy đổi đơn vị nhiên liệu trong điện văn theo thời gian hiệu lực (vì đơn vị nhiên liệu có thể đổi theo giai đoạn và theo từng tàu). | Functional | Must | Khảo sát 09/06 §II.5 |

### 7.5 Phân hệ 5 — Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-501 | Hệ thống phải quản lý toàn bộ vòng đời người dùng (tạo, sửa, vô hiệu hóa, kích hoạt lại, xóa) thông qua phân hệ Quản trị danh tính (IAM — Identity and Access Management) độc lập. | Functional | Must | Đề xuất §II.5; YCKT NFR |
| BR-502 | Hệ thống phải áp dụng cơ chế phân quyền dựa trên vai trò (RBAC — Role-Based Access Control) chi tiết hóa đến từng phân hệ, dịch vụ và API; tách riêng quyền chỉ xem và quyền thao tác. | Functional | Must | Đề xuất §II.5; Khảo sát 09/06 §II.2 |
| BR-503 | Hệ thống phải hỗ trợ chính sách truy cập động (Dynamic Policies): hạn chế quyền theo khung giờ làm việc hoặc trạng thái phiên; cập nhật phân quyền theo thời gian thực. | Functional | Must | Đề xuất §II.5 |
| BR-504 | Hệ thống phải phân quyền theo Carrier / sân bay / tàu bay (ngoài phân quyền theo chức năng), bao gồm dữ liệu chuyến bay phân theo căn cứ bay. | Functional | Must | YCKT NFR; Khảo sát 09/06 §II.2 |
| BR-505 | Hệ thống phải hỗ trợ một màn hình dùng chung cho nhiều đối tượng — ẩn/hiện cột và nút thao tác theo quyền người dùng. | Functional | Must | Khảo sát 09/06 §II.2 |
| BR-506 | Hệ thống phải áp dụng xác thực đa yếu tố (MFA/2FA) bắt buộc cho quản trị viên và tài khoản có quyền truy cập dữ liệu nhạy cảm; sử dụng cơ chế Token-based (JWT). | Functional | Must | Đề xuất §II.5 |
| BR-507 | Hệ thống phải hỗ trợ Single Sign-On (SSO) và tích hợp danh tính với LDAP / Active Directory của Tổng công ty. | Functional | Must | Đề xuất §II.5 |
| BR-508 | Hệ thống phải kiểm soát phiên làm việc theo thời gian thực, hỗ trợ quyền truy cập tạm thời có thời hạn (tự thu hồi khi hết hạn). | Functional | Must | Đề xuất §II.5 |
| BR-509 | Hệ thống phải ghi nhật ký (Log) chi tiết mọi hành vi đăng nhập, thay đổi quyền, truy cập dữ liệu nghiệp vụ phục vụ kiểm toán bảo mật. | Functional | Must | Đề xuất §II.5 |
| BR-510 | Hệ thống phải xây dựng cổng tích hợp API Gateway thay thế kết nối điểm-điểm; bảo mật điểm cuối, phân phối tải, thực thi rate-limit; quản trị toàn diện vòng đời API (versioning); kỹ thuật truyền tải tệp lớn (nén, song song). | Functional | Must | Đề xuất §I; YCKT TOSS-058… |
| BR-511 | Hệ thống phải hỗ trợ tích hợp với khoảng 40 hệ thống/nguồn nội bộ và bên ngoài (Lido, MO Plus, AMOS, Amadeus PSS, DCS, AVES, ACDM, VMS/VIAGS, ACARS, AFTN/AMHS, FlightRadar24, Flight Watch, DWH/Lakehouse, NOTAM/WX…); cơ chế tích hợp chủ động (event-based) khi phát sinh dữ liệu, kết hợp ảnh chụp dữ liệu định kỳ. | Functional | Must | Phân tích YCKT v0.1 §3; YCKT TOSS-058…121; Khảo sát 08/06 §II.3 |
| BR-512 | Hệ thống phải bảo đảm ≥ 10 giao tiếp dữ liệu phát sinh không tính phí trong vòng đời hợp đồng. | Non-functional | Must | YCKT TOSS-058… |
| BR-513 | Hệ thống phải hỗ trợ nền tảng lưu trữ và xử lý dữ liệu quy mô lớn: đa định dạng (SQL, JSON/XML, file phi cấu trúc); xử lý Batch (ETL định kỳ) và Streaming (Kafka/Spark Streaming hoặc tương đương) song song; phân tách tầng lưu trữ và tầng xử lý. | Non-functional | Must | Đề xuất §I |
| BR-514 | Hệ thống phải kiến trúc Microservices, Cloud Native (tuân thủ tiêu chuẩn CNCF); phân tách tuyệt đối tầng giao diện / nghiệp vụ / dữ liệu; mở rộng tài nguyên linh hoạt và cập nhật tính năng không gián đoạn dịch vụ. | Non-functional | Must | Đề xuất §I; YCKT NFR |
| BR-515 | Hệ thống phải đạt SLA độ sẵn sàng ≥ 99%; HA active-active / active-standby; chuyển đổi < 1h; rate-limit / điều tiết lưu lượng; phân tách tài nguyên app/DB/log; restart không gián đoạn. | Non-functional | Must | Đề xuất §I; YCKT NFR |
| BR-516 | Hệ thống phải triển khai trên Cloud của VNA với 3 môi trường Prod / Dev-Test / Standby-Backup; đáp ứng quy mô ≥ 4000 người dùng, đồng thời 200. | Non-functional | Must | YCKT NFR |
| BR-517 | Hệ thống phải vận hành 24/7/365 trong 60 tháng kể từ go-live; giám sát tập trung, cảnh báo bất thường; bàn giao mã nguồn và tài liệu cho VNA sau khi hết thuê. | Non-functional | Must | YCKT NFR |
| BR-518 | Hệ thống phải tuân thủ Nghị định 53/2022/NĐ-CP (lưu trữ dữ liệu tại Việt Nam) và Nghị định 13/2023/NĐ-CP (bảo vệ dữ liệu cá nhân); tuân thủ ANTT TCTHK; không chia sẻ dữ liệu khi chưa cho phép. | Non-functional | Must | Đề xuất §I; YCKT NFR |

### 7.6 Tổng kết số lượng BR theo phân hệ

| Phân hệ | Số BR |
|---|---|
| Phân hệ 1 — Thông tin điều hành chuyến bay | 19 |
| Phân hệ 2 — Quản lý tài liệu chuyến bay | 17 |
| Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác | 16 |
| Phân hệ 4 — Quản lý danh mục (Master Data) | 16 |
| Phân hệ 5 — Quản trị hệ thống | 18 |
| **Tổng** | **86** |

---

## 8. Quy trình nghiệp vụ (Business Process)

> **Phạm vi mức:** Chỉ liệt kê tên các quy trình chính đã có nguồn cùng một dòng mô tả. KHÔNG vẽ BPMN chi tiết ở khung này; chi tiết hóa BPMN As-Is / To-Be sẽ thực hiện ở các tài liệu phân tích quy trình riêng theo Workflow P4.

| Mã | Tên quy trình | Mô tả ngắn | Nguồn |
|---|---|---|---|
| BP-001 | Quy trình điều phái end-to-end (End-to-end Flight Dispatch) | Luồng đầu-cuối từ chuẩn bị kế hoạch bay và đánh giá rủi ro tới phát hành OFP, dispatch, theo dõi thực hiện và đóng chuyến. | FDOP §3.1 |
| BP-002 | Vai trò điều phái viên theo ca trực (Duty-based Dispatcher Roles) | Phân vai chức danh điều phái viên (FD — Flight Dispatcher) theo ca trực 24/7 tại Trung tâm Kiểm soát Khai thác (OCC); tuân thủ quy định CAAV/AOC. | FDOP §3.2 |
| BP-003 | Quy trình chuyến bay VIP (VIP Flight Procedure) | Quy trình áp dụng cho chuyến bay VIP với nhân viên điều phái được CAAV phê chuẩn hằng năm; phân vai giám sát chuyên trách cho chuyến dài (≥ 8 giờ) hoặc phức tạp về khai thác. | FDOP §3.3 |
| BP-004 | Quy trình chuyến bay qua vùng trời không kiểm soát (Uncontrolled Airspace Flights) | Áp dụng cho chuyến bay qua vùng trời không kiểm soát (vd Afghanistan); quy định bổ sung về waypoint, callsign, hoạt động bay. | FDOP §3.4 |
| BP-005 | Quy trình nhận tàu bay (Aircraft Delivery Procedure) | Quy trình tiếp nhận tàu bay mới hoặc tàu được chuyển từ nguồn khác; bao gồm chuyến Ferry, payload, DOW, OFP, briefing. | FDOP §3.5 |
| BP-006 | Quy trình Dispatch Release → Captain's Release | Điều phái thực hiện Dispatch Release trên TOSS → trạng thái đồng bộ sang MO Plus → phi công mới được thực hiện Captain's Release; chặn Captain's Release khi chưa có Dispatch Release. | Khảo sát 11/06 §II.1, II.2 |
| BP-007 | Quy trình kiểm tra đầu ca (Start-of-Shift Check) | Điều phái kiểm tra 9 nhóm nội dung đầu ca trên màn hình tập trung; TOSS tự đối chiếu nguồn và sinh cảnh báo; điều phái sang hệ thống chuyên dụng để xử lý cảnh báo. | Khảo sát 11/06 §II.4 |
| BP-008 | Quy trình lập và phát hành Báo cáo điều hành ngày khai thác (BCAO) | Các bộ phận nghiệp vụ nhập tab nguồn của mình (kỹ thuật / dịch vụ); trực ban trưởng tổng hợp tab tổng quan; phê duyệt; phát hành qua email đến danh sách đầu mối. | Khảo sát 09/06 §II.7; Khảo sát 08/06 §II.4 |
| BP-009 | Quy trình quản lý tải hàng loạt tài liệu chuyến (Bulk Document Upload) | Khu vực tải hàng loạt riêng; hệ thống tự gắn tài liệu vào đúng chuyến theo quy ước đặt tên tệp; vẫn giữ tải thủ công. | Khảo sát 09/06 §II.3 |
| BP-010 | Quy trình quản lý vòng đời tài liệu chuyến (Document Lifecycle) | Tài liệu TOSS sinh ra lưu trong hệ thống; tài liệu từ hệ thống ngoài kéo về khi tải xuống, lưu tối đa 3 ngày sau hạ cánh rồi tự xóa. | Khảo sát 09/06 §II.4 |
| BP-011 | Quy trình lập phiếu cân bằng tải (Load Balance) — 4 bước | Quy trình 4 bước từ nhập trọng tải ước tính đến phục vụ tại sân bay; gắn kết chặt giữa nhiều hệ thống. | Khảo sát 08/06 §II.5 |

> Các quy trình chi tiết khác (vd vòng đời người dùng IAM, quy trình đồng bộ danh mục qua Webhook, quy trình tích hợp ACARS/AFTN/AMHS…) sẽ được mô tả trong tài liệu phân tích quy trình chuyên đề. Nguồn hiện chưa cung cấp BPMN As-Is/To-Be hoàn chỉnh — chi tiết các quy trình này sẽ được khảo sát chuyên đề theo TASK trong YCKT.

---

## 9. Rủi ro và Giả định (Risks & Assumptions)

### 9.1 Rủi ro

| Mã | Mô tả rủi ro | Xác suất | Tác động | Biện pháp giảm thiểu | Nguồn |
|---|---|---|---|---|---|
| RISK-001 | Hệ thống Lido không cho phép tích hợp trực tiếp / hạn chế (boost), ảnh hưởng PF và MEL. | Trung bình | Cao | Xác định phương án thay thế (nhập file định kỳ, parsing tài liệu) khi không có API; làm rõ trong buổi khảo sát chuyên đề. | Phân tích YCKT v0.1 §5; Khảo sát 08/06 §IV |
| RISK-002 | Cấp phát hạ tầng đám mây của VNA chậm, có thể ảnh hưởng mốc thông kết nối trước 30/06/2026. | Cao | Cao | Phối hợp CĐS-CN để chốt sớm số lượng máy chủ và địa chỉ mạng; bám sát mốc giữa tháng 06/2026. | Khảo sát 08/06 §II.7, §IV |
| RISK-003 | Thay đổi tài liệu MO Plus để chặn Captain's Release đòi hỏi phối hợp đồng thời TOSS + MO Plus; nếu lệch tiến độ sẽ tạo lỗ hổng nghiệp vụ. | Trung bình | Cao | Lập kế hoạch chung TOSS — MO Plus; định nghĩa giao diện trạng thái Dispatch Release rõ ràng (timing, payload, fail-safe). | Khảo sát 11/06 §II.2, §IV |
| RISK-004 | Nhiều thuật ngữ chuyên môn còn chưa xác nhận (VMA, Lotang, VNCM/VNCS, "Vy Vy", UA PASMOS, Sunweather, Phi Công 11) → có nguy cơ hiểu sai yêu cầu thời tiết/NOTAM. | Cao | Trung bình | Tổ chức workshop với SME điều phái để chuẩn hóa thuật ngữ; cập nhật `toss-glossary-v0.1.md`. | Khảo sát 11/06 §IV; Phân tích YCKT v0.1 §4 |
| RISK-005 | Báo cáo BCAO hiện có nhiều nguồn nhập tay không đồng nhất; số hóa có thể gặp khó khăn về danh mục nguyên nhân bất thường. | Trung bình | Trung bình | Định nghĩa danh mục nguyên nhân chuẩn hóa cùng SME; cho phép người dùng tự định nghĩa và bổ sung. | Khảo sát 09/06 §II.7, §IV |
| RISK-006 | Phương án parse METAR/SPECI chưa chốt (tự xây vs dùng thư viện/dịch vụ); có rủi ro về chính xác và bản quyền. | Trung bình | Trung bình | Đánh giá phương án kỹ thuật trong giai đoạn thiết kế kế tiếp. | Khảo sát 11/06 §IV |
| RISK-007 | Nguồn dữ liệu hành khách chưa kiểm chứng là real-time hay bản sao; ảnh hưởng việc ra quyết định nối chuyến. | Trung bình | Trung bình | Kiểm chứng nguồn trước khi dùng làm căn cứ ra quyết định. | Khảo sát 08/06 §II.6, §IV |
| RISK-008 | Danh mục dịch vụ sân bay đang quản lý thủ công, nguồn nhập liệu ban đầu cho TOSS có thể không đầy đủ. | Trung bình | Trung bình | Lập danh mục dịch vụ sân bay phối hợp các đơn vị mặt đất; xác định nguồn cập nhật định kỳ. | Khảo sát 09/06 §II.6, §IV |
| RISK-009 | Phụ thuộc nhiều hệ thống bên ngoài (~40 nguồn): Lido, MO Plus, AMOS, Amadeus PSS, DCS, AVES, ACDM, ACARS, AFTN/AMHS…; rủi ro tích hợp về phương thức (API/SFTP/điện văn/email), đầu mối từng CQĐV chưa đủ contact. | Cao | Cao | Hoàn thiện sheet Nhân sự/Tích hợp; xác định phương thức + cơ chế chủ động cho từng nguồn theo TASK. | Phân tích YCKT v0.1 §5, §6 |
| RISK-010 | Một số mốc thời gian upload OFP (130/180/200 phút) và phân loại chuyến tương ứng chưa được xác nhận. | Trung bình | Trung bình | Phỏng vấn bổ sung điều phái để chốt mốc thời điểm và áp vào tham số hệ thống. | Khảo sát 11/06 §IV |
| RISK-011 | Đoạn ghi âm phỏng vấn dispatcher (phần thời tiết) bị nhiễu nặng — một số kết luận (SIGMET, nguồn quốc tế, parsing) cần đối chiếu lại trước khi sử dụng làm căn cứ chính thức. | Trung bình | Trung bình | Phỏng vấn bổ sung phần thời tiết; đối chiếu với SME khí tượng. | Khảo sát 11/06 §V |

### 9.2 Giả định

- Hãng (VNA) vừa sở hữu vừa đi thuê tàu bay (lessee); TOSS hỗ trợ cả hai nguồn tàu bay với 3 hình thức (sở hữu, Dry Lease, Wet Lease) và biến thể Damp Lease (Nguồn: Khảo sát 09/06 §II.5; memory `project-toss-airline-is-lessee`).
- Báo cáo BCAO phát hành qua email và không yêu cầu ký số (Nguồn: Khảo sát 08/06 §II.4).
- Việc phỏng vấn các đơn vị (CQĐV) cần công văn đề nghị và thông báo trước khoảng một tuần (Nguồn: Khảo sát 08/06 §II.1).
- Lido tiếp tục giữ vai trò sinh OFP tự động và đẩy lên MO Plus; TOSS chỉ bổ sung trạng thái "đã Dispatch Release" (Nguồn: Khảo sát 11/06 §II.1).
- Các chuẩn quốc tế (ICAO, IATA, FAA) chỉ tham khảo và giải thích khi cần; deliverable bám sát yêu cầu thực tế của hãng VNA (Nguồn: Khảo sát 09/06 §II.9; memory `feedback-faa-icao-reference-advisory`).
- Các điểm chưa rõ ràng dưới đây giả định KHÔNG được tự suy diễn mà phải xác nhận ở các buổi khảo sát kế tiếp:
  - Cơ chế duy trì dữ liệu gần nhất (snapshot vs event-based) (Khảo sát 08/06 §IV).
  - Phương án khi hệ thống lập kế hoạch bay không cho tích hợp trực tiếp (Khảo sát 08/06 §IV).
  - Cách kiểm chứng nguồn dữ liệu hành khách (Khảo sát 08/06 §IV).
  - Phân biệt tài liệu khi tải hàng loạt theo tên tệp hay theo nội dung (Khảo sát 09/06 §IV).
  - Damp Lease — có cần theo dõi và báo cáo riêng phần nhiên liệu VNA tự cấp hay không (Khảo sát 09/06 §IV).
  - Danh mục nguyên nhân bất thường trong BCAO + tên hệ thống nguồn nhận biết yếu nhân (Khảo sát 09/06 §IV).
  - Danh sách người dự, vai trò và thẩm quyền quyết định của từng bên (Khảo sát 08/06 §IV; Khảo sát 09/06 §IV).

### 9.3 Các điểm cần làm rõ — cờ `[cần xác nhận]`

> Các điểm dưới đây được trích trực tiếp từ các điểm gắn cờ `[cần xác nhận]` trong báo cáo khảo sát 11/06 và các vấn đề cần làm rõ ở 08/06, 09/06. KHÔNG được tự suy diễn — chờ BA Lead/SME bổ sung.

1. **VMA** — viết tắt chính xác cho "ngưỡng thời tiết tối thiểu sân bay" `[cần xác nhận]` (Khảo sát 11/06 §II.7).
2. **Lotang** — định nghĩa chính xác "chuyến Lotang" (chuyến đường dài/đặc thù?) và tiêu chí đánh giá tác động `[cần xác nhận]` (Khảo sát 11/06 §II.5).
3. **VNCM/VNCS** — tên cơ quan cung cấp NOTAM nội địa `[cần xác nhận]` (Khảo sát 11/06 §II.6).
4. **"Vy Vy"** — tên nguồn METAR nội địa (có thể là VNMC hoặc đơn vị khí tượng VNA đang sử dụng) `[cần xác nhận]` (Khảo sát 11/06 §II.7).
5. **UA PASMOS** — hệ thống thời tiết được nhắc đến, có thể kết xuất (export) `[cần xác nhận]` (Khảo sát 11/06 §II.7).
6. **Sunweather** — tên đầy đủ và vai trò; được đánh giá "rủi ro/không ổn định" `[cần xác nhận]` (Khảo sát 11/06 §II.7).
7. **"Phi Công 11"** — tên hệ thống tham khảo, không official `[cần xác nhận]` (Khảo sát 11/06 §II.7).
8. **Mốc thời điểm upload OFP quốc tế** — 90/130/180/200 phút và phân loại chuyến tương ứng `[cần xác nhận]` (Khảo sát 11/06 §II.1, §IV).
9. **Tên hệ thống nguồn nhận biết yếu nhân và chuyên cơ** trong BCAO `[cần xác nhận]` (Khảo sát 09/06 §II.7, §IV).
10. **Định nghĩa Damp Lease** trong phạm vi TOSS và yêu cầu báo cáo riêng phần nhiên liệu VNA tự cấp `[cần xác nhận]` (Khảo sát 09/06 §II.5, §IV).

---

## 10. Phụ lục (Appendix)

### 10.1 Tài liệu nguồn đã tham chiếu

| # | Tài liệu | Đường dẫn |
|---|---|---|
| 1 | Báo cáo Khảo sát TOSS — Buổi 08/06/2026 | `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.1.md` |
| 2 | Báo cáo Khảo sát TOSS — Buổi 09/06/2026 | `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.1.md` |
| 3 | Báo cáo Khảo sát TOSS — Buổi sáng 11/06/2026 (Phỏng vấn Dispatcher, gộp Phần 1+2) | `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md` |
| 4 | Phân tích Yêu cầu Kỹ thuật TOSS (YCKT) v0.1 | `ba/workspace/drafts/phan-tich/yckt-trien-khai/PHAN-TICH-YCKT-v0.1.md` |
| 5 | Đề xuất giải pháp kỹ thuật v0.3 — Tổng quan giải pháp (§I) | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/01-tong-quan-giai-phap/01-tong-quan-giai-phap.md` |
| 6 | Đề xuất giải pháp kỹ thuật v0.3 — Tổng quan nghiệp vụ (§II) | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/00-tong-quan-nghiep-vu.md` |
| 7 | Đề xuất giải pháp kỹ thuật v0.3 — Phân hệ Thông tin điều hành chuyến bay (§II.1) | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/01-phan-he-thong-tin-dieu-hanh-chuyen-bay.md` |
| 8 | Đề xuất giải pháp kỹ thuật v0.3 — Phân hệ Quản lý tài liệu chuyến bay (§II.2) | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/02-phan-he-quan-ly-tai-lieu-chuyen-bay.md` |
| 9 | Đề xuất giải pháp kỹ thuật v0.3 — Phân hệ Quản lý báo cáo (§II.3) | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/03-phan-he-quan-ly-bao-cao-danh-gia-toi-uu-khai-thac.md` |
| 10 | Đề xuất giải pháp kỹ thuật v0.3 — Phân hệ Quản lý danh mục (§II.4) | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/04-phan-he-quan-ly-danh-muc.md` |
| 11 | Đề xuất giải pháp kỹ thuật v0.3 — Phân hệ Quản trị hệ thống (§II.5) | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/05-phan-he-quan-tri-he-thong.md` |
| 12 | FDOP §3.1 — Luồng quy trình đầu-cuối (End-to-end process flow) | `ba/workspace/drafts/phan-tich/flight-dispatcher-procedure/3.1-end-to-end-process-flow-vi.md` |
| 13 | FDOP §3.2 — Vai trò điều phối viên theo ca trực | `ba/workspace/drafts/phan-tich/flight-dispatcher-procedure/3.2-duty-based-dispatcher-roles-vi.md` |
| 14 | FDOP §3.3 — Quy trình chuyến bay VIP | `ba/workspace/drafts/phan-tich/flight-dispatcher-procedure/3.3-vip-flight-procedure-vi.md` |
| 15 | FDOP §3.4 — Quy trình chuyến bay qua vùng trời không kiểm soát | `ba/workspace/drafts/phan-tich/flight-dispatcher-procedure/3.4-uncontrolled-airspace-flights-vi.md` |
| 16 | FDOP §3.5 — Quy trình nhận tàu bay | `ba/workspace/drafts/phan-tich/flight-dispatcher-procedure/3.5-aircraft-delivery-procedure-vi.md` |

### 10.2 Glossary

Tham chiếu từ điển thuật ngữ dự án: `ba/workspace/drafts/phan-tich/toss-glossary-v0.1.md` (theo memory `feedback-enrich-asr-dictionary` — làm giàu sau mỗi buổi khảo sát).

### 10.3 Các bước kế tiếp đề xuất

1. BA Lead xem xét khung BRD, đặc biệt các ô "(chưa có nguồn — cần BA Lead/SME bổ sung)" để bổ sung mục tiêu định lượng OBJ-001, OBJ-002, OBJ-008, OBJ-009 và ma trận RACI (§6.1).
2. Tổ chức workshop xác nhận thuật ngữ với SME điều phái (xử lý 10 cờ `[cần xác nhận]` ở §9.3).
3. Bóc tách BR theo từng phân hệ thành Yêu cầu chức năng (FR), Trường hợp sử dụng (UC), Câu chuyện người dùng (US) trong các SRS phân hệ tương ứng (theo Workflow P4 — song song với wireframe/mockup).
4. Lập Ma trận truy vết (Requirements Traceability Matrix) BR → FR → US/UC → TC sau khi có FR.

---

*Khung BRD-TOSS-001 v0.1 — 2026-06-11. Tài liệu mức cao, dùng làm cơ sở cho các bước phân rã chi tiết tiếp theo (SRS/FRD). Mọi BR ở §7 chỉ ở mức tổng quát theo nguyên tắc top-down; chi tiết sẽ được phát triển ở các tài liệu kế tiếp dưới sự kiểm soát của BA Lead.*
