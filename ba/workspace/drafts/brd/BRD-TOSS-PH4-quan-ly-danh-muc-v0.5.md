---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.5"
date: "2026-06-17"
status: "Draft"
document_type: "BRD"
document_id: "BRD-TOSS-PH4"
parent: "BRD-TOSS-001-khung-v0.10.md"
---

# Yêu cầu Nghiệp vụ — Phân hệ 4: Quản lý danh mục (Master Data) (v0.5)

> **Tài liệu con của [BRD-TOSS-001-khung-v0.10.md](BRD-TOSS-001-khung-v0.10.md).** Phân rã chi tiết §7.4 — Phân hệ 4. Mọi quy ước MoSCoW, phạm vi, bên liên quan tham chiếu từ tài liệu cha.
>
> **Vai trò chủ sở hữu (Master Data Owner):** PH4 là nơi định nghĩa và lưu trữ duy nhất của các danh mục dùng chung; PH1–PH3 và PH5 chỉ **tiêu thụ** (đọc) từ PH4. Khi một BR ở phân hệ khác phụ thuộc một danh mục, BR đó phải dẫn chiếu mã BR-4xx tương ứng.
>
> **Phân rã chức năng:** xem [PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.3.md](../srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.3.md).
>
> **Quản lý điểm cần xác nhận:** mọi cờ `[cần xác nhận]` được tập trung tại sổ cái duy nhất **OID-TOSS-001** (`ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md`). Trong tài liệu này chỉ giữ chú thích trỏ về OID dưới dạng `*(xem OID: <mã>)*` ở cuối mô tả BR liên quan.

## §7.4 Phân hệ 4 — Quản lý danh mục (Master Data)

### Nhóm A. Nguyên tắc tổ chức danh mục

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-401 | Hệ thống phải tổ chức phân hệ danh mục thành menu độc lập, tách khỏi các module nghiệp vụ tác nghiệp, đặt cùng nhóm quản trị với System Admin và Data Monitoring; mục đích nhằm bảo đảm nguồn sự thật duy nhất (Single Source of Truth) và phù hợp với khối lượng dữ liệu lớn ít thay đổi hằng ngày. | Functional | Must | KS 09/06 §II.1; Đề xuất §II.4 |
| BR-402 | Mọi danh mục phải được định nghĩa theo cấu trúc Metadata chuẩn, hỗ trợ phân loại theo lĩnh vực, nghiệp vụ hoặc hệ thống sử dụng; phân biệt rõ giữa **danh mục gốc** (meta data cố định: ICAO/IATA, mã tàu…) và **quản lý nghiệp vụ** (tham số thay đổi theo thời gian: hiệu lực khai thác, MEL/CDL active, hợp đồng thuê). | Functional | Must | KS 08/06 §II.8; YCKT TOSS-024 |
| BR-403 | Hệ thống phải quản lý phiên bản (Versioning) cho từng bản ghi danh mục: ai thay đổi, nội dung thay đổi, thời điểm; cho phép truy xuất trạng thái dữ liệu tại bất kỳ thời điểm nào trong quá khứ; lưu vết kiểm toán cấp bản ghi master (`last_update`, `last_update_user`, `record_id`). | Functional | Must | YCKT TOSS-024; nguồn Netline |
| BR-404 | Hệ thống phải đồng bộ dữ liệu danh mục chủ động (push) cho các hệ thống vệ tinh thông qua API hoặc Webhook ngay khi phát sinh thay đổi, không chỉ đồng bộ theo lịch định kỳ; có phân quyền truy cập danh mục đến từng hệ thống / nhóm người dùng. | Functional | Must | YCKT TOSS-025, TOSS-026, TOSS-107 |
| BR-405 | Hệ thống phải có cơ chế tổ chức riêng giữa **danh mục dùng chung cho nhiều hệ thống** và **danh mục chức năng nghiệp vụ riêng của TOSS**; cho phép quản lý các danh mục bổ trợ khác phát sinh trong quá trình xây dựng chức năng. | Functional | Must | YCKT TOSS-169, TOSS-170 |

### Nhóm B. Danh mục tàu bay (Aircraft Master)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-406 | Hệ thống phải quản lý thông tin chung của tàu bay: số đăng ký (Registration), loại tàu bay theo mã ICAO và mã IATA, tải trọng, chủ sở hữu, hình thức thuê hoặc mua, giới hạn chu kỳ bay (Flight Cycle — FC) và các thông tin cơ bản khác. | Functional | Must | YCKT TOSS-122; KS 09/06 §II.6 |
| BR-407 | Hệ thống phải hỗ trợ đa định danh cho tàu bay (REG / ALT_REG / logical_no / callsign) và đa bộ mã loại tàu (mã nội bộ, ICAO, IATA, model, biến thể CEO/NEO) kèm bảng ánh xạ giữa các bộ mã. | Functional | Must | Nguồn Netline (Aircraft_Netline.extracted.md) |
| BR-408 | Hệ thống phải quản lý lịch sử hiệu lực khai thác của tàu bay theo từng giai đoạn (`Valid_From` / `Valid_To`, nhiều bản ghi cho một số đăng ký), cho phép một tàu bay in/out đội bay nhiều lần, và phân biệt giai đoạn reconfig (tàu chưa xuất hiện trên lịch bay nhưng vẫn được quản lý). | Functional | Must | YCKT TOSS-123; KS 09/06 §II.6 |
| BR-409 | Hệ thống phải quản lý hình thức sở hữu của tàu bay: sở hữu (Owned), thuê khô (Dry Lease), thuê ướt (Wet Lease), và biến thể của Wet Lease trong đó bên đi thuê chỉ phụ trách phần nhiên liệu; phân biệt rõ giữa **bên khai thác** (operator) và **bên sở hữu / cho thuê** (owner / lessor) và quản lý danh mục bên cho thuê. *(Tên tiếng Việt chính thức cho biến thể "tự lo nhiên liệu" — xem OID: SME-10.)* | Functional | Must | KS 09/06 §II.6; KS 08/06 §II.12; YCKT TOSS-122 |
| BR-410 | Hệ thống phải quản lý các thuộc tính khai thác chi tiết của tàu bay: Taxi Fuel Flow, APU Fuel Flow, ACARS Fuel Unit, ACARS Fuel Multiplier (hệ số quy đổi FOB ACARS sang kg), MTOW, cấu hình ghế (Config C/W/Y), dung tích thùng nhiên liệu (Tank Capacity), dung tích thùng nước, dung tích khoang hàng (Cargo Capacity gồm bụng trên, bụng dưới và mũi), Center Tank, layout cabin chi tiết. | Functional | Must | YCKT TOSS-122; KS 09/06 §II.6; KS 08/06 §II.12 |
| BR-411 | Hệ thống phải quản lý chỉ số DOW (Dry Operating Weight) theo giai đoạn hoặc theo version, cập nhật mỗi khi tàu bay được reconfig hoặc thay đổi cấu hình; cho phép lưu lại nhiều phiên bản thông số cân của từng tàu bay và truy xuất theo thời điểm. | Functional | Must | KS 11/06 KTKTB Buổi 3 §2; YCKT TOSS-122 |
| BR-412 | Hệ thống phải hỗ trợ định nghĩa nhiều cấu hình ghế thay thế cho cùng một tàu bay (`STD_VERSION` + tối thiểu bốn cấu hình thay thế `STD_VERSION_ALT_1..4`). | Functional | Should | Nguồn Netline |
| BR-413 | Hệ thống phải quản lý AC_INDEX và cỡ tổ bay tiêu chuẩn (cockpit / cabin) ở mức master tàu bay. *(Ngữ nghĩa AC_INDEX — xem OID: SME-30.)* | Functional | Should | Nguồn Netline (AC_INDEX, CREWSIZE_COCKPIT/CABIN) |
| BR-414 | Hệ thống phải quản lý năng lực thiết bị tàu bay (ILS CAT, AUTOLAND, ACARS, SPECIAL_EQUIPMENT) để đối chiếu với tiêu chuẩn tối thiểu (Minima) của sân bay khi xếp tàu/đường bay. | Functional | Must | Nguồn Netline (ILS_EQUIPMENT, AUTOLAND, ACARS, SPECIAL_EQUIPMENT) |
| BR-415 | Hệ thống phải quản lý cấp tiếng ồn (NOISE) và thông tin liên lạc (RADIO / PHONE) của tàu bay phục vụ kiểm tra giới hạn khai thác đêm và giới hạn tiếng ồn theo sân bay. | Functional | Should | Nguồn Netline (NOISE, RADIO, PHONE) |
| BR-416 | Hệ thống phải quản lý hạn chế sân bay khai thác theo từng tàu bay (`AP_RESTRICTION`). *(Codeset AP_RESTRICTION — xem OID: SME-31.)* | Functional | Must | Nguồn Netline (AP_RESTRICTION) |
| BR-417 | Hệ thống phải quản lý trạng thái tàu bay theo codeset (đang khai thác / xuất đội / dùng đặc biệt / overflow); phân biệt tàu thuộc đội bay của hãng với tàu của hãng khác chỉ bay qua. *(Codeset AC_STATE — xem OID: SME-29.)* | Functional | Must | Nguồn Netline (AC_STATE, REMARK=OVERFLOW) |
| BR-418 | Hệ thống phải hợp nhất master tàu bay từ nhiều nguồn (FIMS + Netline) bằng khóa (số đăng ký + giai đoạn hiệu lực) thành golden record duy nhất; duy trì bảng ánh xạ codeset loại tàu giữa các nguồn. *(Quy tắc hợp nhất codeset FIMS↔Netline — xem OID: KS-30.)* | Functional | Must | Nguồn FIMS + Netline (đối chiếu cột); KS 08/06 §II.8 |
| BR-419 | Hệ thống phải **đồng bộ và lưu hiện trạng** lịch bảo dưỡng ngắn hạn và dài hạn, lịch AOG đột xuất từ AMOS (xem PH5 BR-528); **sinh cảnh báo** khi tàu bay sắp hết Flight Cycle (FC). Không tự quản lý bảo dưỡng — AMOS là hệ thống chủ. | Functional | Must | YCKT TOSS-124, TOSS-125; Out-of-scope §5.2 #3 |
| BR-420 | Hệ thống phải quản lý tình trạng APU và Packs của từng tàu bay, bao gồm khai báo tàu bay hỏng APU theo khoảng thời gian (`From_DT`, `To_DT` có thể chưa xác định) để làm cơ sở cảnh báo tàu hỏng APU không được khai thác đến các sân bay không cung cấp GPU/GPS/ASU. | Functional | Must | YCKT TOSS-127, AC APU INOP |

### Nhóm C. Phân loại tàu bay (Aircraft Types & Categories)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-421 | Hệ thống phải quản lý danh mục loại tàu bay (Aircraft Type: A320, A321, A350, B787, ATR…) kèm chức năng thêm / sửa / xóa / disable; cho phép gán nhiều tàu bay (Registration) với từng loại; quản lý thuộc tính giới hạn lệch ZFW cho từng loại tàu bay theo từng khoảng thời gian bay (linh hoạt khai báo khoảng thời gian và giới hạn tương ứng). | Functional | Must | YCKT Aircraft Types (dòng 234); sheet-10 |
| BR-422 | Hệ thống phải hỗ trợ định nghĩa **nhiều Category (Fleet Grouping)** để phân nhóm đội tàu phục vụ các báo cáo khác nhau (Cate1, Cate2… đến tối đa Cate10, một số dùng làm dự phòng). Một tàu bay map vào tất cả các Category liên quan ngay khi khai báo lần đầu; khi tạo báo cáo, người dùng chỉ định Category sử dụng và hệ thống tự gom theo. Với mỗi chiều thông tin trong một báo cáo chỉ chọn một Category. | Functional | Must | KS 09/06 §II.11; YCKT sheet-10 |
| BR-423 | Hệ thống phải quản lý AC Subtype (đồng bộ từ Netline) ở mức chi tiết theo cấu hình từng tàu bay (ví dụ 32A, 32B, 32C…32X; 35A, 35B; 78A, 78B, 78C) phục vụ Commercial Config và phân tích chậm chuyến. | Functional | Must | YCKT sheet-10 (AC Subtype) |

### Nhóm D. MEL, CDL, Defect

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-424 | Hệ thống phải quản lý Master MEL: tự động đọc file XML MEL (cùng file gửi sang AMOS) để lấy danh mục MEL cho từng đội tàu bay, các quy định Interval, Installed, Required, Procedure, điều kiện khai thác (bao gồm danh sách tàu bay áp dụng). | Functional | Must | YCKT TOSS-128 |
| BR-425 | Hệ thống phải hỗ trợ công cụ biên soạn tài liệu MEL dùng chung cho hai dòng tàu bay Boeing và Airbus (hiện trạng: Boeing dùng FrameMaker + IXP, Airbus dùng FODM 10.8); hỗ trợ revision, quản lý trạng thái bộ tài liệu theo vòng đời `Airbus → Working → Pending → Airline`, hiển thị compare giữa các version, xuất ra các định dạng XML / OPS / một định dạng nữa. Riêng dòng Airbus A350 giữ bước ký thủ công bằng FODM. *(Tên định dạng thứ ba — xem OID: SME-44.)* | Functional | Must | KS 11/06 KTKTB Buổi 2 §1 |
| BR-426 | Hệ thống phải hỗ trợ áp dụng nhanh hotfix MEL (Service Bulletin — SB) do hãng sản xuất tàu bay phát hành: so sánh nội dung và áp dụng vào đúng tài liệu, hỗ trợ áp dụng theo loại tàu hoặc theo từng số hiệu tàu. | Functional | Should | KS 11/06 KTKTB Buổi 2 §1 |
| BR-427 | Hệ thống phải đồng bộ thông tin MEL / CDL / Defect từ AMOS; cho phép tra cứu, chỉnh sửa, cập nhật; lọc theo nhóm ảnh hưởng (phi công / cockpit, tiếp viên / cabin, thợ máy); tự động highlight các mục mới; cho phép ẩn / hiện các mục đã hết hạn; cho phép người dùng ghi nhận tính chất từng MEL có ảnh hưởng hay không tới khai thác và phân loại theo phạm vi ảnh hưởng; liên kết và cho phép xem tài liệu MEL hiện hành. | Functional | Must | YCKT TOSS-129…135; KS 08/06 §II.12 |

### Nhóm E. Performance Factor

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-428 | Hệ thống phải cho phép upload file dữ liệu của các đội tàu bay và tính toán Performance Factor (PF) từ dữ liệu; tích hợp với email nhận điện ACARS để tập hợp thành file message phục vụ tính toán; cho phép view và download file message; bảo đảm input cho các phần mềm BackPACK / PEP / PET / FOS chạy đúng. Chu kỳ tính PF trung bình hai tuần hoặc một tháng một lần, bao gồm cả chuyến có MEL và chuyến không có MEL. *(Tên đầy đủ pgepoid — xem OID: SME-38.)* | Functional | Must | YCKT TOSS-136; KS 08/06 §II.12; sheet-04 d.180 |
| BR-429 | Hệ thống phải quản lý PF Data Period: thêm / sửa / xóa các kỳ cập nhật PF data với các trường Data Period Label, Historical From Date, Historical To Date; ghi nhận kết quả tính toán theo thời gian hiệu lực mong muốn. | Functional | Must | YCKT TOSS-137; PF Data Period |
| BR-430 | Hệ thống phải hỗ trợ Import Performance Data dạng upload multiple file, tổng hợp thành bảng PF; tàu bay không có dữ liệu trong kỳ thì fallback lấy PF của kỳ trước; cho phép correct số liệu thủ công; chọn AC Reg để cập nhật PF (mặc định all); chọn kỳ cập nhật và khoảng dữ liệu tính toán; lưu trữ PF đã cập nhật. | Functional | Must | YCKT Import Performance Data |
| BR-431 | Hệ thống phải lưu trữ lịch sử PF data theo từng giai đoạn (Data Period), cảnh báo khi tàu bay thiếu PF hoặc PF đã hết hiệu lực; sinh cảnh báo đội tàu chưa được chạy PF trong kỳ. **Báo cáo PF: xem PH3 BR-351…BR-356.** | Functional | Must | YCKT TOSS-138…141 |

### Nhóm F. Danh mục sân bay (Airport Master)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-432 | Hệ thống phải quản lý thông tin chung của sân bay: mã ICAO, mã IATA, tên sân bay, quốc gia, station contact, các địa chỉ SITA / AFTN / AMHS, loại tàu có khả năng phục vụ, Region (EU / US / NEA / SEA / Domestic VN…), Approach Type sử dụng để lấy Minima, tình trạng GPU / ASU (Y/N), danh sách Terminal / Gate / Parking Stand / Air Bridge và các thông tin cơ bản khác. | Functional | Must | YCKT TOSS-142 |
| BR-433 | Hệ thống phải quản lý danh mục sân bay dự bị đến (Alternate Airports), hỗ trợ chọn nhanh khi lập kế hoạch bay. | Functional | Must | YCKT TOSS-143 |
| BR-434 | Hệ thống phải quản lý thông tin hạ tầng cất hạ cánh: đường băng (Runway), hệ thống hỗ trợ cất hạ cánh, taxiway layout, bãi đỗ. | Functional | Must | YCKT TOSS-144 |
| BR-435 | Hệ thống phải quản lý Weather Landing Minima của sân bay theo từng Approach Type (ILS CAT I / II / III, RNAV, VOR, NDB) bao gồm các tham số tối thiểu (Visibility…); tích hợp tra cứu WX sân bay và đặc điểm địa hình. | Functional | Must | YCKT TOSS-145, Weather Landing Minima |
| BR-436 | Hệ thống phải quản lý quy định khai thác và thủ tục bay tại sân bay: thủ tục cất hạ cánh, tiếp cận (SID / STAR / IAP), giới hạn tiếng ồn, khung giờ cho phép khai thác, quy định về slot và phép bay, quy định khác của nhà chức trách. | Functional | Must | YCKT TOSS-146 |
| BR-437 | Hệ thống phải quản lý thông tin phục vụ mặt đất tại sân bay: bãi đỗ, cầu ống lồng, thiết bị điện / khí mặt đất (GPU / GPS / ASU), khả năng nạp nhiên liệu, giá nhiên liệu, chi phí thiết bị mặt đất và các dịch vụ tại sân bay. | Functional | Must | YCKT TOSS-147 |
| BR-438 | Hệ thống phải quản lý danh sách Parking Stand chi tiết theo từng sân bay với các trường Airport, Parking Stand name, Air Bridge Availability (Yes / No / Undefined); cho phép phân quyền riêng cho từng đầu sân bay tự cập nhật thông tin này. | Functional | Must | YCKT Parking Stand Information |
| BR-439 | Hệ thống phải quản lý thông tin an toàn và hạn chế của sân bay: NOTAM, tình hình an ninh và các thông tin khác. | Functional | Must | YCKT TOSS-148 |
| BR-440 | Hệ thống phải quản lý thông tin khai thác thương mại của sân bay: phí hạ cất cánh, chi phí tiếng ồn, các chi phí khác. | Functional | Must | YCKT TOSS-149 |
| BR-441 | Hệ thống phải quản lý danh mục dịch vụ sân bay đặc thù (ví dụ sân bay không hỗ trợ tàu hỏng APU) phục vụ cảnh báo và hỗ trợ điều hành đổi tàu khi cần. *(Nguồn danh mục dịch vụ sân bay hiện đang quản lý thủ công — xem OID: KS-06.)* | Functional | Must | KS 09/06 §II.6 |
| BR-442 | Hệ thống phải quản lý danh mục sân bay đặc biệt (sân bay địa hình hoặc điều kiện đặc thù như Điện Biên, Đồng Hới) và điều kiện chứng chỉ / kinh nghiệm bổ sung của cơ trưởng và tổ bay tương ứng; làm cơ sở cho cảnh báo chứng chỉ tổ bay theo sân bay và cảnh báo đổi tổ trong PH1. *(Danh mục sân bay đặc biệt đầy đủ — xem OID: SME-18.)* | Functional | Must | KS 11/06 sáng §II.12 |
| BR-443 | Hệ thống phải quản lý danh mục Standard Taxi Time theo sân bay và thời gian hiệu lực: cho phép tự thống kê từ dữ liệu thực tế (QAR / QAI) qua API hoặc Database View của Tổng công ty và trình điều phái viên duyệt trước khi áp dụng; sinh cảnh báo khi sân bay thay đổi Standard Taxi Time, đặc biệt trong các đợt cao điểm. *(Phương án push Lido — xem OID: KS-16; đơn vị MOI quản lý hiện hành — xem OID: SME-15.)* | Functional | Must | KS 11/06 sáng §II.14 |
| BR-444 | Hệ thống phải quản lý Obstacle Data và EOSID (Engine Out Standard Instrument Departure) gắn theo từng sân bay; cho phép import file `.stx` của nhà chức trách sân bay để gán vào sân bay; lưu và cho truy xuất nhật ký các chỉnh sửa. | Functional | Should | KS 11/06 KTKTB Buổi 3 §5 |
| BR-445 | Hệ thống phải hỗ trợ tạo / cập nhật CSDL sân bay bằng cách import file PDF LIDO Chart từ nhà cung cấp LIDO, quét PDF để lấy các trường thuộc tính sân bay; cung cấp checkbox đánh dấu sân bay đã đủ tài liệu theo nghiệp vụ. | Functional | Should | KS 11/06 KTKTB Buổi 3 §3 |

### Nhóm G. Danh mục chặng bay (Route Master) & Tankering

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-446 | Hệ thống phải quản lý thông tin chung của chặng bay (Sector): điểm đi (DEP), điểm đến (ARR), Great Circle Distance (GCD), Ground Distance (GD), Cost Index, Final Reserve và các trường mở rộng (Group by FH, Group for TAT, Included Baggage Allowance, Commercial Config, chi phí điều hành bay / bay qua, sân bay dự bị dọc đường, MCMR theo giai đoạn). | Functional | Must | YCKT TOSS-150 |
| BR-447 | Hệ thống phải quản lý thông tin EDTO của chặng bay: có khai thác EDTO hay không, loại hình EDTO. | Functional | Must | YCKT TOSS-151 |
| BR-448 | Hệ thống phải quản lý danh mục sân bay dự bị dọc đường theo hình thức khai thác của chặng bay. | Functional | Must | YCKT TOSS-152 |
| BR-449 | Hệ thống phải quản lý chi phí MCMR (Maintenance Cost Maintenance Reserve): cho phép upload file MCMR theo từng giai đoạn, lưu trữ và tra cứu. | Functional | Must | YCKT TOSS-153 |
| BR-450 | Hệ thống phải hiển thị thông tin chi phí điều hành bay và chi phí bay qua theo chặng / giai đoạn. | Functional | Must | YCKT TOSS-154 |
| BR-451 | Hệ thống phải quản lý Included Baggage Allowance theo nhóm đường bay (từ quốc gia × đến quốc gia × hạng khách). | Functional | Must | YCKT Included baggage allowance (d.206) |
| BR-452 | Hệ thống phải quản lý Sector Groups by FH: định nghĩa nhóm chặng bay theo giờ bay với các tham số nội địa / quốc tế, khoảng FH, tên nhóm. | Functional | Should | YCKT Sector Groups by FH (d.207) |
| BR-453 | Hệ thống phải quản lý Scheduled TAT (Turn-Around Time) tiêu chuẩn theo từng nhóm nối chặng (QT TRUNG–QT NGAN, QT NGAN–NĐ…). | Functional | Must | YCKT Scheduled TAT (d.208) |
| BR-454 | Hệ thống phải quản lý Commercial Config: số ghế mở bán C / W / Y theo chặng × giai đoạn × AC subtype; cho phép upload file LBM chi tiết và trích xuất tự động, đồng thời cho phép sửa hoặc cập nhật thủ công. | Functional | Must | YCKT Commercial Config (d.209) |
| BR-455 | Hệ thống phải quản lý quy tắc Tankering: tính toán và đưa ra khuyến nghị tankering dựa trên giá nhiên liệu upload, hiệu quả chi phí dự kiến; cho phép cập nhật linh hoạt chặng bay / tàu bay áp dụng theo giai đoạn hiệu lực; lưu trữ và xuất khuyến nghị tankering theo chặng × tàu × giai đoạn; sinh báo cáo hiệu quả tankering tổng hợp và chi tiết. Lưu ý giá nhiên liệu từ Việt Nam đi quốc tế khác giá Việt Nam đi nội địa, cần tính cả hai giá. | Functional | Should | YCKT TOSS-155…162 |
| BR-456 | Hệ thống phải hỗ trợ upload file khuyến nghị Tankering gồm các trường: loại tàu bay, chặng bay (đơn chặng hoặc liên chặng), ngày bắt đầu áp dụng, ngày dừng áp dụng, hiệu quả chi phí khi tankering một tấn nhiên liệu. | Functional | Should | YCKT TOSS-157 |
| BR-457 | Hệ thống phải quản lý Planned Version (version sản lượng): thêm / sửa / xóa version theo Năm × loại UHT/KH × tên version do người dùng tự đặt, kèm danh sách chuyến bay sản lượng (SECTOR, AC_CARRIER, FLT_MONTH, FLT_YEAR, FLT_TYPES, FLS). | Functional | Must | YCKT Planned Version (d.235) |

### Nhóm H. Danh mục nhiên liệu (Fuel)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-458 | Hệ thống phải quản lý giá nhiên liệu (Fuel Price Management) với đơn vị USD/tấn tại từng sân bay theo từng kỳ giá (một tuần, hai tuần, một tháng); cho phép upload theo template gồm các trường IATA AP CODE, Fuel Price, Valid From, Valid To; cho phép sửa tay sau khi upload; trường hợp overlap thì lấy giá của lần upload sau; sử dụng làm đầu vào cho tính Tankering. | Functional | Must | YCKT TOSS-166 |
| BR-459 | Hệ thống phải quản lý hệ số quy đổi đơn vị nhiên liệu trong điện văn theo thời gian hiệu lực và theo từng tàu bay; đơn vị nội bộ mặc định là kilogram; trường master `FUEL_MEASURE_UNIT` nhận giá trị KG hoặc LB. | Functional | Must | KS 09/06 §II.11; nguồn Netline |
| BR-460 | Hệ thống phải quản lý danh mục bảng dầu (AHM — Aircraft Handling Manual) phục vụ điều phái lập kế hoạch bay: giai đoạn đầu cho điều phái viên chủ động khai báo thủ công trên TOSS (theo loại tàu, điều kiện khai thác); giai đoạn tiếp theo tích hợp tự động với phần mềm IFV khi sẵn sàng; TOSS sinh cảnh báo khi bảng dầu có thay đổi (thay thế cho cuộc gọi điện thoại hiện hành từ Trung tâm CLC). *(Tên đầy đủ phần mềm IFV — xem OID: SME-16.)* | Functional | Must | KS 11/06 sáng §II.9 |

### Nhóm I. Danh mục bổ trợ (Supporting Catalogs)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-461 | Hệ thống phải quản lý danh mục Phi công và Tiếp viên (đồng bộ tham chiếu từ MO Plus là chính); không tự chỉnh sửa thông tin gốc, chỉ phục vụ tra cứu và phân quyền theo căn cứ bay. | Functional | Must | YCKT TOSS-163 |
| BR-462 | Hệ thống phải quản lý danh mục Quốc gia phục vụ phân loại chặng bay, phép bay, hạn chế khai thác. | Functional | Must | YCKT TOSS-164 |
| BR-463 | Hệ thống phải quản lý danh mục FIR (Flight Information Region) như một danh mục độc lập. | Functional | Must | YCKT TOSS-165 |
| BR-464 | Hệ thống phải quản lý danh mục ULD (Unit Load Device) chi tiết: loại × serial, kích thước, trọng lượng, thuộc tính tàu bay áp dụng và các thuộc tính khác; mỗi chuyến bay tự load ra các loại ULD tương ứng, cho phép nhập số lượng và tự động tính trọng lượng. | Functional | Must | YCKT TOSS-167 |
| BR-465 | Hệ thống phải quản lý danh sách email nhận các thông báo tự động: với mỗi loại thông báo qua email cho phép linh hoạt thêm / bớt email; tối thiểu có hai danh sách dùng riêng — danh sách nhận báo cáo tỷ lệ dữ liệu tích hợp (Data Coverage Report) và danh sách nhận báo cáo điều hành ngày (Daily Operations Report của Trực ban trưởng). *(danh sách email được quản trị tập trung tại PH5 BR-537; PH4 tiêu thụ theo loại báo cáo danh mục.)* | Functional | Must | YCKT TOSS-168; Email list for Data Coverage / Daily Operations Report |
| BR-466 | Hệ thống phải quản lý danh mục phép bay (Flight Permission) theo cấu trúc đa chiều: quốc gia × loại tàu bay × khoảng thời gian hiệu lực × đường bay / waypoint; phân biệt phép bay theo mùa lịch bay (khoảng sáu đến bảy tháng cho lịch thường lệ) và phép bay cấp riêng cho từng chuyến (VIP / charter, đổi sân bay dự bị / đổi điểm hạ cánh); cho phép nhập trực tiếp trên TOSS giai đoạn đầu (chưa phụ thuộc SkyCheck); TOSS tự sinh báo cáo phép bay. Hệ thống đồng thời chuẩn bị hai API nhận dữ liệu phép bay (xây dựng chờ sẵn): **Overflight Permit API** (nhận phép bay qua, gồm phép mùa và phép bổ sung) và **Slot and Takeoff/Landing Permit API** (nhận Slot, phép cất hạ cánh, gồm slot mùa và slot bổ sung). *(Tiến độ tích hợp SkyCheck — xem OID: KS-15.)* | Functional | Must | KS 11/06 sáng §II.11; YCKT TOSS-107, d.132-133 |
| BR-467 | Hệ thống phải quản lý danh mục Flight Type Code (mã loại chuyến nội bộ — O, Z, G, H, A, P, V, S…) làm cơ sở nhận diện chuyến không thường lệ và phục vụ các cảnh báo liên quan (ví dụ cảnh báo chuyến code O không có STS HEAD trong ATC FPL). *(Danh mục Flight Type Code đầy đủ — xem OID: SME-19.)* | Functional | Must | KS 11/06 chiều §II.2; YCKT sheet-08 #5 |

### Nhóm J. Tham số vận hành (Operational Parameters)

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-468 | Hệ thống phải cho phép cấu hình các tham số vận hành chính: hệ số độ tin cậy chuyến bay (%) dùng để tính thời gian bay, nhiên liệu tiêu thụ, mức bay; ngưỡng chênh lệch giữa lượng nhiên liệu phi công yêu cầu nạp và tổng nhiên liệu kế hoạch theo chặng × loại tàu; ngưỡng chênh lệch giữa trọng tải ước tính và tải kế hoạch theo đội tàu × thời gian bay × giai đoạn hiệu lực; thời gian quy định cần làm OFP cho chuyến quốc tế / quốc nội; thời gian cảnh báo chuyến bay thiếu tài liệu; trọng lượng khách tiêu chuẩn (để tính pax weight và payload). Mọi tham số linh hoạt cập nhật trực tiếp trên giao diện bởi người dùng có thẩm quyền. | Functional | Must | YCKT TOSS-171…177 |
| BR-469 | Hệ thống phải quản lý tham số `FLIGHT BASE TIME FOR CAAV` — thời điểm chốt lịch bay căn cứ với CHK (mặc định 20 giờ ngày hôm trước cho lịch bay ngày hôm sau) phục vụ báo cáo CAAV. *(Giá trị mặc định và quy tắc chốt lịch — xem OID: SME-33.)* | Functional | Must | YCKT sheet-08 #1 |

### Nhóm K. *(Đã chuyển sang PH2)*

> *Nhóm K (Tài liệu khai thác KTKTB) đã chuyển sang **PH2 v0.5** (BR-257–BR-261) theo quyết định phân loại 2026-06-17. Bao gồm: quản lý phiên bản phần mềm tàu bay, SkyOffice → MO/MO Plus/VNA Library, Service Order tự động từ email LIDO, quản lý công việc KTKTB. Trong PH4 v0.5 không còn BR-470…BR-473.*

---

*BRD-TOSS-PH4 v0.5 — 2026-06-17. Tổng 69 BR (BR-401…469) chia 10 nhóm A–J. Nhóm K đã chuyển sang PH2. Lịch sử version: xem `BA-VERSION-LOG.md`. Phân rã FUNC: PHAN-RA-BRD-PH4-quan-ly-danh-muc-v0.3.md.*
