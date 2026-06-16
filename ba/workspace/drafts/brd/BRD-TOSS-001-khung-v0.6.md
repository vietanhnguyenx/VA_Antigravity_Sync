---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.6"
date: "2026-06-12"
status: "Draft"
document_type: "Business Requirements Document (BRD)"
document_id: "BRD-TOSS-001"
---

# Tài liệu Yêu cầu Nghiệp vụ (BRD) — Khung top-down (v0.6)

> **Trạng thái:** Khung (skeleton) phục vụ thẩm định nội bộ trước khi đi vào chi tiết. Mọi nội dung trong tài liệu này được phân rã trung thực từ nguồn đã trích dẫn ở cột "Nguồn"; các điểm chưa có nguồn được đánh dấu rõ "(chưa có nguồn — cần BA Lead/SME bổ sung)" hoặc gắn cờ `[cần xác nhận]` và KHÔNG được tự suy diễn. Chi tiết bóc tách tới mức Yêu cầu chức năng (FR), Trường hợp sử dụng (UC), Câu chuyện người dùng (US) sẽ được thực hiện ở các tài liệu SRS/FRD kế tiếp.
>
> **Từ phiên bản v0.6:** Danh sách BR chi tiết (§7) được tách thành **5 file riêng theo phân hệ** để dễ phân công và quản lý. Tài liệu này giữ §1–§6 (khung chung), §7.6 (tổng kết), §8–§10.

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
| Phiên bản | 0.6 |
| Ngày phát hành | 2026-06-12 |
| Trạng thái | Draft (Khung — chưa có người duyệt) |
| Người soạn | BA Lead |
| Người duyệt | (chưa có nguồn — cần BA Lead/SME bổ sung) |

### Lịch sử thay đổi

| Phiên bản | Ngày | Người thay đổi | Mô tả |
|---|---|---|---|
| 0.1 | 2026-06-11 | BA Lead | Khởi tạo khung BRD top-down từ 3 báo cáo khảo sát (08/06, 09/06, 11/06), phân tích YCKT v0.1, 5 file phân hệ thuộc Đề xuất giải pháp kỹ thuật v0.3 và quy trình điều phái (FDOP §3.1–3.5). |
| 0.2 | 2026-06-12 | BA Lead | Bổ sung các yêu cầu nghiệp vụ mới từ hai báo cáo khảo sát mới: Khảo sát 11/06 buổi sáng (Phần 2 — lệch tải OFP/CLC, AHM, NAIL/CDL, phép bay, chứng chỉ tổ bay theo sân bay, APU/PAX time, Standard Taxi Time, Cost Index) và Khảo sát 11/06 buổi chiều (Release/Unrelease + version OFP, 6 phase quy trình, Monitoring real-time qua ACARS, Weather Multi-Flight, OFP 3 định dạng, Payload Extra, Flight Type Code/STS-HEAD…). Thêm Out-of-scope "Cảnh báo Cost Index" (bỏ giai đoạn này). Cập nhật BR-213, BR-214 (mở rộng mô tả; không đổi mã). Bổ sung 20 BR mới: PH1 BR-120…126; PH2 BR-218…222; PH3 BR-317; PH4 BR-417…420; PH5 BR-519…520. Cập nhật bảng đếm §7.6 (tổng 106 BR). Bổ sung tham chiếu báo cáo khảo sát buổi chiều ở §10. |
| 0.3 | 2026-06-12 | BA Lead | Bổ sung bottom-up từ Customer Docs: +53 BR mới và mở rộng ~30 BR từ Aircraft FIMS/Netline, YCKT V3 (478 dòng), FOS + sheet cảnh báo/logic/yêu cầu chung. Loại nguồn BBKS/BBLV (UBCKNN — sai domain). |
| 0.4 | 2026-06-12 | BA Lead | Bổ sung BR-516 chi tiết định cỡ hạ tầng từ `Sizing-update260609 - 4T.xlsx` (18TB data, 311 vCPU/964GB RAM/43.6TB, 27 VM, K8s + HAProxy, Cloud Firewall/Backup/Hybrid Connect, tái sử dụng giám sát MO Plus). Loại tài liệu "Quy trình sửa chữa tàu" (tàu thủy — sai domain). |
| 0.4 (đính chính) | 2026-06-12 | BA Lead | Đính chính ASR: "chuyến Lotang" = lỗi nhận dạng của NOTAM → bỏ khỏi BR-116 (gộp cảnh báo NOTAM vào BR-118); cập nhật §9.3, RISK-004. |
| 0.5 | 2026-06-12 | BA Lead | Bổ sung 18 BR mới (BR-133…150) từ Khảo sát 12/06 — thiết kế màn Giám sát chuyến bay (Flight Monitoring) & màn chi tiết chuyến bay (Flight Detail): Flight Detail tab model, Flight Number 3 cột Netline + leg history, bộ 4 mã màu thống nhất (tô màu ô, xanh-sau-đỏ, đổi màu tự động), cột REG/Dispatch Release/Flight Number(D-Z)/ETA-IN, time window cấu hình + Flight Watch + "vào gate chậm", quy ước UI (tiếng Anh/UTC/24h/dark mode), phân quyền 2 lớp + profile cá nhân, format lịch sử đổi chung. Chú thích "12/06 làm rõ" vào BR-102/103/104/113/125/502/504/505/529. Cập nhật §7.6 (PH1 50 BR; tổng 176), §9.3 (cờ mở mới). Đính chính ASR "off cộng cộng" = Ops++. |
| 0.6 | 2026-06-12 | BA Lead | Chia BRD thành các phần theo nội dung: tách §7.1–§7.5 thành 5 file BRD riêng theo phân hệ (BRD-TOSS-PHn-*.md); khung này giữ §1–§6 (khung chung), §7.6 (tổng kết), §8–§10. Các file PH đều ở cùng thư mục, version 0.1. |

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
9. **Cảnh báo Cost Index (CI)** — bỏ khỏi phạm vi TOSS giai đoạn này: nghiệp vụ VNA dùng 3 CI (Climb/Cruise/Descend) nhưng nền tảng Lido hiện chỉ trả một giá trị CI (Cruise CI), không đủ dữ liệu đối chiếu đầy đủ → cảnh báo CI không khả thi. Sẽ xem xét lại khi Lido hỗ trợ trả đầy đủ 3 CI (Nguồn: Khảo sát 11/06 buổi sáng §II.15).

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
> **Quy ước MoSCoW:** Must = bắt buộc, Should = nên có, Could = có thể có, Won't = không trong phạm vi đợt này.
>
> **Từ phiên bản 0.6**, danh sách BR chi tiết được tách thành **5 file theo phân hệ**. Truy cập từng file để xem/chỉnh sửa BR:

| Phân hệ | File BR chi tiết | Số BR | Dải mã |
|---|---|---|---|
| Phân hệ 1 — Thông tin điều hành chuyến bay | [BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.1.md](BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.1.md) | 50 | BR-101…150 |
| Phân hệ 2 — Quản lý tài liệu chuyến bay | [BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.1.md](BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.1.md) | 31 | BR-201…231 |
| Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác | [BRD-TOSS-PH3-bao-cao-toi-uu-v0.1.md](BRD-TOSS-PH3-bao-cao-toi-uu-v0.1.md) | 34 | BR-301…334 |
| Phân hệ 4 — Quản lý danh mục (Master Data) | [BRD-TOSS-PH4-quan-ly-danh-muc-v0.1.md](BRD-TOSS-PH4-quan-ly-danh-muc-v0.1.md) | 32 | BR-401…432 |
| Phân hệ 5 — Quản trị hệ thống (IAM/RBAC, Tích hợp, Hạ tầng) | [BRD-TOSS-PH5-quan-tri-he-thong-v0.1.md](BRD-TOSS-PH5-quan-tri-he-thong-v0.1.md) | 29 | BR-501…529 |

### 7.6 Tổng kết số lượng BR theo phân hệ

| Phân hệ | Số BR | Ghi chú |
|---|---|---|
| Phân hệ 1 — Thông tin điều hành chuyến bay | 50 | +6 BR (BR-127…132); +18 BR v0.5 (BR-133…150) — Flight Monitoring & Flight Detail, Khảo sát 12/06 |
| Phân hệ 2 — Quản lý tài liệu chuyến bay | 31 | +9 BR mới (BR-223…231) |
| Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác | 34 | +17 BR mới (BR-318…334) |
| Phân hệ 4 — Quản lý danh mục (Master Data) | 32 | +12 BR mới (BR-421…432) |
| Phân hệ 5 — Quản trị hệ thống | 29 | +9 BR mới (BR-521…529) |
| **Tổng** | **176** | +18 BR v0.5 (158 → 176) |

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
| RISK-004 | Nhiều thuật ngữ chuyên môn còn chưa xác nhận (VMA, VNCM/VNCS, "Vy Vy", UA PASMOS, Sunweather, Phi Công 11) → có nguy cơ hiểu sai yêu cầu thời tiết/NOTAM. *(Lotang đã đính chính = NOTAM, 12/06.)* | Cao | Trung bình | Tổ chức workshop với SME điều phái để chuẩn hóa thuật ngữ; cập nhật `toss-glossary-v0.1.md`. | Khảo sát 11/06 §IV; Phân tích YCKT v0.1 §4 |
| RISK-005 | Báo cáo BCAO hiện có nhiều nguồn nhập tay không đồng nhất; số hóa có thể gặp khó khăn về danh mục nguyên nhân bất thường. | Trung bình | Trung bình | Định nghĩa danh mục nguyên nhân chuẩn hóa cùng SME; cho phép người dùng tự định nghĩa và bổ sung. | Khảo sát 09/06 §II.7, §IV |
| RISK-006 | Phương án parse METAR/SPECI chưa chốt (tự xây vs dùng thư viện/dịch vụ); có rủi ro về chính xác và bản quyền. | Trung bình | Trung bình | Đánh giá phương án kỹ thuật trong giai đoạn thiết kế kế tiếp. | Khảo sát 11/06 §IV |
| RISK-007 | Nguồn dữ liệu hành khách chưa kiểm chứng là real-time hay bản sao; ảnh hưởng việc ra quyết định nối chuyến. | Trung bình | Trung bình | Kiểm chứng nguồn trước khi dùng làm căn cứ ra quyết định. | Khảo sát 08/06 §II.6, §IV |
| RISK-008 | Danh mục dịch vụ sân bay đang quản lý thủ công, nguồn nhập liệu ban đầu cho TOSS có thể không đầy đủ. | Trung bình | Trung bình | Lập danh mục dịch vụ sân bay phối hợp các đơn vị mặt đất; xác định nguồn cập nhật định kỳ. | Khảo sát 09/06 §II.6, §IV |
| RISK-009 | Phụ thuộc nhiều hệ thống bên ngoài (~40 nguồn): Lido, MO Plus, AMOS, Amadeus PSS, DCS, AVES, ACDM, ACARS, AFTN/AMHS…; rủi ro tích hợp về phương thức (API/SFTP/điện văn/email), đầu mối từng CQĐV chưa đủ contact. | Cao | Cao | Hoàn thiện sheet Nhân sự/Tích hợp; xác định phương thức + cơ chế chủ động cho từng nguồn theo TASK. | Phân tích YCKT v0.1 §5, §6 |
| RISK-010 | Một số mốc thời gian upload OFP (130/180/200 phút) và phân loại chuyến tương ứng chưa được xác nhận. | Trung bình | Trung bình | Phỏng vấn bổ sung điều phái để chốt mốc thời điểm và áp vào tham số hệ thống. | Khảo sát 11/06 §IV |
| RISK-011 | Đoạn ghi âm phỏng vấn dispatcher (phần thời tiết) bị nhiễu nặng — một số kết luận (SIGMET, nguồn quốc tế, parsing) cần đối chiếu lại trước khi sử dụng làm căn cứ chính thức. | Trung bình | Trung bình | Phỏng vấn bổ sung phần thời tiết; đối chiếu với SME khí tượng. | Khảo sát 11/06 §V |

### 9.2 Giả định

- Hãng (VNA) vừa sở hữu vừa đi thuê tàu bay (lessee); TOSS hỗ trợ cả hai nguồn tàu bay với 3 hình thức (sở hữu, Dry Lease, Wet Lease) và biến thể Damp Lease (Nguồn: Khảo sát 09/06 §II.5).
- Báo cáo BCAO phát hành qua email và không yêu cầu ký số (Nguồn: Khảo sát 08/06 §II.4).
- Việc phỏng vấn các đơn vị (CQĐV) cần công văn đề nghị và thông báo trước khoảng một tuần (Nguồn: Khảo sát 08/06 §II.1).
- Lido tiếp tục giữ vai trò sinh OFP tự động và đẩy lên MO Plus; TOSS chỉ bổ sung trạng thái "đã Dispatch Release" (Nguồn: Khảo sát 11/06 §II.1).
- Các chuẩn quốc tế (ICAO, IATA, FAA) chỉ tham khảo và giải thích khi cần; deliverable bám sát yêu cầu thực tế của hãng VNA (Nguồn: Khảo sát 09/06 §II.9).
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
2. ~~**Lotang** — định nghĩa "chuyến Lotang"~~ → **ĐÃ ĐÍNH CHÍNH (12/06):** "Lotang/lô tam/nô tam" = lỗi ASR của **NOTAM**; không có "chuyến Lotang" — gộp vào cảnh báo NOTAM (BR-118). *(OID SME-02 đã chốt.)*
3. **VNCM/VNCS** — tên cơ quan cung cấp NOTAM nội địa `[cần xác nhận]` (Khảo sát 11/06 §II.6).
4. **"Vy Vy"** — tên nguồn METAR nội địa (có thể là VNMC hoặc đơn vị khí tượng VNA đang sử dụng) `[cần xác nhận]` (Khảo sát 11/06 §II.7).
5. **UA PASMOS** — hệ thống thời tiết được nhắc đến, có thể kết xuất (export) `[cần xác nhận]` (Khảo sát 11/06 §II.7).
6. **Sunweather** — tên đầy đủ và vai trò; được đánh giá "rủi ro/không ổn định" `[cần xác nhận]` (Khảo sát 11/06 §II.7).
7. **"Phi Công 11"** — tên hệ thống tham khảo, không official `[cần xác nhận]` (Khảo sát 11/06 §II.7).
8. **Mốc thời điểm upload OFP quốc tế** — 90/130/180/200 phút và phân loại chuyến tương ứng `[cần xác nhận]` (Khảo sát 11/06 §II.1, §IV).
9. **Tên hệ thống nguồn nhận biết yếu nhân và chuyên cơ** trong BCAO `[cần xác nhận]` (Khảo sát 09/06 §II.7, §IV).
10. **Định nghĩa Damp Lease** trong phạm vi TOSS và yêu cầu báo cáo riêng phần nhiên liệu VNA tự cấp `[cần xác nhận]` (Khảo sát 09/06 §II.5, §IV).
11. **Bộ trạng thái vòng đời chuyến (LEG STATE)** — danh sách/định nghĩa/quy tắc chuyển; bản mẫu POC đề xuất GRD/BRD/OUT/ENR/IN/ARR `[cần xác nhận]` (Khảo sát 12/06 §IV; OID KS-32).
12. **Mã hóa khu vực điều phái** (châu Âu/Mỹ/Hàn/ĐNA…) dùng cho phân quyền dữ liệu màn Giám sát `[cần xác nhận]` (Khảo sát 12/06 §IV; OID SME-36).
13. **Ngưỡng "vào gate chậm"** (số phút trễ so với ETA kết điểm) để sinh cảnh báo `[cần xác nhận]` (Khảo sát 12/06 §IV; OID KS-34).
14. **Hành vi hệ thống Ops++** khi chuyến `D` quay về ngày gốc (Lido xin OFP cũ hay sinh mới) `[cần xác nhận]` (Khảo sát 12/06 §IV; OID SME-35/KS-36).
15. **Cơ chế giữ chuyến đường dài chưa đáp** ngoài time window (để trôi/giữ bảng/filter phụ/scroll) `[cần xác nhận]` (Khảo sát 12/06 §IV; OID KS-33).
16. **Quy tắc clear/giữ "đỏ" sau khi chuyến cất cánh** cho các cảnh báo "vẫn bay" (vd thời tiết), theo từng cột `[cần xác nhận]` (Khảo sát 12/06 §IV; OID KS-38).
17. **Ý nghĩa hậu tố `Z`** (so với `D`) trong FN Surface + điều kiện sinh `Z` `[cần xác nhận]` (Khảo sát 12/06 §IV; OID SME-34).

---

## 10. Phụ lục (Appendix)

### 10.1 Tài liệu nguồn đã tham chiếu

| # | Tài liệu | Đường dẫn |
|---|---|---|
| 1 | Báo cáo Khảo sát TOSS — Buổi 08/06/2026 | `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.2.md` |
| 2 | Báo cáo Khảo sát TOSS — Buổi 09/06/2026 | `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.2.md` |
| 3 | Báo cáo Khảo sát TOSS — Buổi sáng 11/06/2026 (Phỏng vấn Dispatcher, gộp Phần 1 + Phần 2) | `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md` |
| 3b | Báo cáo Khảo sát TOSS — Buổi chiều 11/06/2026 (Phỏng vấn Dispatcher) | `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md` |
| 3c | Báo cáo Khảo sát TOSS — Buổi sáng 12/06/2026 (Flight Monitoring & Flight Detail, trên bản mẫu dsp_monitoring_poc.html) | `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md` |
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

### 10.1b Truy vết bottom-up (nguồn → BR)

> Các nguồn Customer Docs đã khai thác bottom-up để bổ sung các BR mới (BR-127…132, 223…231, 318…334, 421…432, 521…529) và mở rộng ~28 BR sẵn có trong phiên bản v0.3:

| # | Nguồn | Đường dẫn |
|---|---|---|
| a | Aircraft FIMS (trích xuất) | `customer-docs-source/Aircraft_FIMS.extracted.md` |
| b | Aircraft Netline (trích xuất) | `customer-docs-source/Aircraft_Netline.extracted.md` |
| c | YCKT V3 (478 dòng) | `yckt-trien-khai/sheet-04-yckt-v3.md` |
| d | FOS (Flight Operations Summary) | `yckt-trien-khai/sheet-09-fos.md` |
| e | Sheet cảnh báo | `yckt-trien-khai/sheet-08` |
| f | Sheet logic tính toán | `yckt-trien-khai/sheet-12` |
| g | Sheet yêu cầu chung | `yckt-trien-khai/sheet-11` |
| h | Sheet MO Plus / attach | `yckt-trien-khai/sheet-05` |
| i | Sizing hạ tầng (v0.4 — bổ sung BR-516) | `customer-docs-source/Sizing-update-260609-4T.extracted.md` |

> **Ghi chú:** Các tài liệu sau đã bị LOẠI khỏi truy vết bottom-up vì SAI DOMAIN (không áp dụng cho TOSS), đã gỡ khỏi repo: **BBKS/BBLV** (UBCKNN — chứng khoán); **"Quy trình sửa chữa tàu"** (tàu thủy/đóng tàu — không phải tàu bay). Riêng **ACARS/** và **PEP5.16/** là dữ liệu mẫu / phần mềm bên thứ ba (Airbus), chỉ xác nhận BR tích hợp đã có, không sinh BR mới.

### 10.2 Glossary

Tham chiếu từ điển thuật ngữ dự án: `ba/workspace/drafts/phan-tich/toss-glossary-v0.1.md` (làm giàu sau mỗi buổi khảo sát).

### 10.3 Các bước kế tiếp đề xuất

1. BA Lead xem xét khung BRD, đặc biệt các ô "(chưa có nguồn — cần BA Lead/SME bổ sung)" để bổ sung mục tiêu định lượng OBJ-001, OBJ-002, OBJ-008, OBJ-009 và ma trận RACI (§6.1).
2. Tổ chức workshop xác nhận thuật ngữ với SME điều phái (xử lý 10 cờ `[cần xác nhận]` ở §9.3).
3. Bóc tách BR theo từng phân hệ thành Yêu cầu chức năng (FR), Trường hợp sử dụng (UC), Câu chuyện người dùng (US) trong các SRS phân hệ tương ứng (theo Workflow P4 — song song với wireframe/mockup).
4. Lập Ma trận truy vết (Requirements Traceability Matrix) BR → FR → US/UC → TC sau khi có FR.

---

*BRD-TOSS-001 v0.6 — 2026-06-12. Chia §7 thành 5 file BRD-TOSS-PHn theo phân hệ; khung này giữ §1–§6, §7.6, §8–§10. Tổng 176 BR (50/31/34/32/29 theo PH1–PH5). Tài liệu mức cao, dùng làm cơ sở cho các bước phân rã chi tiết tiếp theo (SRS/FRD). Mọi BR ở §7 chỉ ở mức tổng quát theo nguyên tắc top-down; chi tiết sẽ được phát triển ở các tài liệu kế tiếp dưới sự kiểm soát của BA Lead.*
