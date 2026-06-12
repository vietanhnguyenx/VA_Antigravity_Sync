---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
status: "Draft"
document_type: "BRD — Yêu cầu Nghiệp vụ Phân hệ 3"
document_id: "BRD-TOSS-PH3"
parent_document: "BRD-TOSS-001-khung-v0.6.md"
---

# Yêu cầu Nghiệp vụ — Phân hệ 3: Quản lý báo cáo, đánh giá tối ưu khai thác (v0.1)

> **Tài liệu con của [BRD-TOSS-001-khung-v0.6.md](BRD-TOSS-001-khung-v0.6.md).** Phân rã chi tiết §7.3 — Phân hệ 3. Mọi quy ước MoSCoW, phạm vi, bên liên quan tham chiếu từ tài liệu cha.
>
> **Phân rã chức năng:** xem [PHAN-RA-BRD-PH3-quan-ly-bao-cao-toi-uu-khai-thac-v0.3.md](../srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH3-quan-ly-bao-cao-toi-uu-khai-thac-v0.3.md).

## §7.3 Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác

| Mã | Mô tả yêu cầu nghiệp vụ (mức cao) | Loại | Ưu tiên (MoSCoW) | Nguồn |
|---|---|---|---|---|
| BR-301 | Hệ thống phải cung cấp nền tảng báo cáo với bộ lọc linh hoạt, cho phép tùy chọn cột hiển thị và xuất dữ liệu định dạng chuẩn (PDF, Excel, Docx). **(v0.3 bổ sung):** chuẩn 14 nhóm thông tin FOS (FLIGHT INFO, AIRCRAFT, TIME, FUEL UPLIFT, LOAD & WEIGHT, OFP, FLIGHT RELEASE, DOCUMENT STATUS, EOFP, QAR, CREW, AIRPORT, ACARS, COST & REVENUE); chọn cột theo nhóm hoặc theo trường, trường mặc định chọn sẵn. (FOS) | Functional | Must | Đề xuất §II.3 |
| BR-302 | Hệ thống phải số hóa Báo cáo điều hành ngày khai thác (BCAO) theo cấu trúc hiện hành: một văn bản duy nhất chia hai phần — thực hiện ngày hôm trước (số liệu) + kế hoạch ngày hôm nay (kèm APU/PACK, AOG, TAF, NOTAM, phụ lục kỹ thuật). Tự động thu thập dữ liệu tối đa từ lịch bay, các bộ phận chỉ nhập phần chuyên môn. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-303 | Hệ thống phải dùng chung một màn hình BCAO với phân quyền theo tab nguồn: tab tổng quan của trực ban trưởng, tab kỹ thuật do khối kỹ thuật nhập, tab dịch vụ do đơn vị dịch vụ nhập. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-304 | Hệ thống phải hỗ trợ luồng phê duyệt BCAO trước khi phát hành; phát hành qua thư điện tử (không yêu cầu ký số) tới danh sách đầu mối nhận báo cáo cấu hình sẵn. | Functional | Must | Khảo sát 08/06 §II.4; Khảo sát 09/06 §II.7 |
| BR-305 | Hệ thống phải nhập bất thường theo cách đa chiều: người nhập chọn tàu → hệ thống liệt kê các chuyến của tàu đó → tích chọn chuyến bị ảnh hưởng; hạn chế nhập tự do; ưu tiên chọn từ danh mục nguyên nhân do người dùng tự định nghĩa; hỗ trợ lọc theo khoảng thời gian và sân bay đi/đến; dùng cho cả báo cáo ngày và thống kê dài hạn. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-306 | Hệ thống phải nhận biết tự động yếu nhân và chuyên cơ khi nguồn có dữ liệu `[cần xác nhận tên hệ thống nguồn]`; phần còn lại tích chọn thủ công. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-307 | Hệ thống phải trình bày BCAO trực quan bằng biểu đồ, thay thế tệp Word thủ công. | Functional | Must | Khảo sát 09/06 §II.7 |
| BR-308 | Hệ thống phải cung cấp báo cáo lịch bay và hiệu suất: thống kê biến động (đổi giờ/tàu/cấu hình/code/hủy), phân loại tính chất chuyến (thường lệ, Charter, Ferry, VIP, khách/hàng), OTP/OSP chi tiết theo sân bay (chậm cất cánh/hạ cánh), sử dụng đội tàu (số cất hạ cánh, BH, thời gian dừng/nằm sân). **(v0.3 bổ sung):** báo cáo Aircraft Utilization và FH/FC ratio. (YCKT V3 dòng 368-369) | Functional | Must | Đề xuất §II.3 |
| BR-309 | Hệ thống phải cung cấp báo cáo nhiên liệu tiêu thụ: Fuel/FH theo loại tàu và chặng (Median/Mean/Max/Min, độ tin cậy %); đối soát kế hoạch ↔ thực tế; giám sát Pilot Extra Fuel; chỉ số kinh tế (Fuel Burn/RTK, Fuel Burn/BH). **(v0.3 bổ sung):** báo cáo Overfueling; Planned FH Fuel Flow; chuẩn hóa nhóm Fuel Uplift chi tiết. (YCKT V3 dòng 389,393; FOS) | Functional | Must | Đề xuất §II.3 |
| BR-310 | Hệ thống phải cung cấp báo cáo thời gian thực hiện chuyến bay: Taxi Time và khuyến nghị; BH (xu hướng, trung bình, theo mùa); phân tích Phase (Taxi-out, Takeoff, Climb, Cruise, Descent, Taxi-in); Holding; Ground Time / Turnaround Time. **(v0.3 bổ sung):** báo cáo Taxi Out Time by Hour; BH By Periods; BH Trend. (YCKT V3 dòng 402,404,408) | Functional | Must | Đề xuất §II.3 |
| BR-311 | Hệ thống phải cung cấp báo cáo kế hoạch bay (OFP) và dữ liệu bay thực tế: thời gian làm OFP so với quy định, độ chính xác tải trọng (Payload Accuracy), tối ưu hóa đường bay (sân bay dự bị, Flight Level, Cost Index, Route, Runway, SID, STAR). | Functional | Must | Đề xuất §II.3 |
| BR-312 | Hệ thống phải cung cấp báo cáo tải trọng, dịch vụ và tổ bay: Load Factor, VIP/CIP, hành lý/offload, NOTOC, Cargo Manifest, thay đổi tải sát giờ, mục tiêu giờ bay tổ bay, giờ bay/giờ làm việc, tổ bay dự bị, khai thác không đúng quy định. **(v0.3 bổ sung):** báo cáo ZFW/Payload Diff Summary (Diff Range bước 1000kg theo đội tàu × QT/QN). (YCKT V3 dòng 453) | Functional | Must | Đề xuất §II.3 |
| BR-313 | Hệ thống phải cung cấp báo cáo khai thác và môi trường: bất thường khai thác (thời tiết/kỹ thuật/khác), phân tích thời tiết chuyên sâu (quan trắc vs Minima, dự báo vs thực tế), hiệu quả tổng thể (Profitability). **(v0.3 bổ sung):** báo cáo Observed Weather (TAF/METAR) và TAF/METAR vs Minima. (YCKT V3 dòng 473-475) | Functional | Must | Đề xuất §II.3 |
| BR-314 | Hệ thống phải quản lý mục tiêu các chỉ số OTP và OSP với 4 mục tiêu chia cho 2 nhóm chỉ số; các chỉ số được tính tự động khi đủ nguồn dữ liệu (gồm dữ liệu sẵn có + dữ liệu nhập thêm). | Functional | Must | Khảo sát 09/06 §II.8 |
| BR-315 | Hệ thống phải tách màn hình giám sát dữ liệu riêng — báo cáo độ phủ và độ chính xác dữ liệu (vd tỷ lệ chuyến có điện văn theo từng đội tàu). **(v0.3 bổ sung):** báo cáo tỷ lệ độ phủ cho TẤT CẢ nguồn dữ liệu tích hợp (mở rộng từ ví dụ điện văn theo đội tàu). (sheet-11 #8) | Functional | Must | Khảo sát 09/06 §II.8 |
| BR-316 | Hệ thống phải cung cấp khuyến nghị tối ưu chính sách mang dầu bổ sung (Tankering Strategy) với tính chất khuyến nghị. | Functional | Should | Đề xuất §I |
| BR-317 | Hệ thống phải cung cấp báo cáo Pallet Relief (Payload Extra) liệt kê các chuyến bay và lượng dầu/nhiên liệu tổ bay tự đề nghị lấy thêm so với OFP của điều phái (thường ~30 phút trước khởi hành); báo cáo phải có cột Payload Extra và/hoặc cột Delta (Delta = Actual − OFP); hỗ trợ lọc theo ngày, đường bay, khung giờ cất cánh, loại tàu bay; với báo cáo nặng, áp dụng cơ chế trả kết quả ra tab riêng, lưu link tải trong 7 ngày và cho phép tải lại (tương tự luồng gửi báo cáo qua thư điện tử). | Functional | Must | Khảo sát 11/06 buổi chiều §II.10 |
| BR-318 | Cung cấp báo cáo nền FOS Report (Flight Operations Summary / Flight Integrated) tích hợp toàn bộ dữ liệu chuyến bay, làm nguồn dữ liệu cơ sở cho mọi báo cáo khác (cho phép báo cáo khác chọn thêm cột từ FOS). | Functional | Must | YCKT FOS (sheet-09); sheet-11 #10 |
| BR-319 | Chuẩn hóa Standard Filter cho mọi báo cáo (From/To Date, Local/UTC, Plan/Actual, Carrier) kèm bộ lọc riêng từng báo cáo. | Functional | Must | YCKT FOS (sheet-09) |
| BR-320 | Chuẩn hóa bố cục báo cáo (Standard Filter → bộ lọc riêng → biểu đồ → bảng chi tiết, chọn thêm cột từ FOS) + cảnh báo hiệu năng khi chọn khoảng thời gian dài/nhiều trường. | Functional | Must | YCKT sheet-11 #10; FOS |
| BR-321 | Gửi báo cáo định kỳ tự động (scheduled report) tới danh sách đầu mối; trạng thái chạy ngầm hiển thị trên màn đang thao tác. | Functional | Must | YCKT sheet-11 #11 |
| BR-322 | Báo cáo ACARS Fuel Integration Coverage và ACARS Fuel Reliability (Block/Trip fuel, OUT/OFF/ON/IN theo AC Type/Reg, min difference, illogical taxi/trip fuel, highlight tỷ lệ). | Functional | Must | YCKT V3 TOSS-095 (dòng 115-118) |
| BR-323 | Email báo cáo tỷ lệ độ phủ dữ liệu hàng tuần theo từng tàu (Performance email, ACARS OUT/OFF/ON/IN, OFP, QAR, booking, pax thực, tổ bay, Load Sheet). | Functional | Must | YCKT V3 dòng 151 |
| BR-324 | Báo cáo Performance Factor: PF Comparison (Previous vs Current), PF Trend by AC Type, PF Trend by AC Reg, PF Data Coverage theo Region/Cate. | Functional | Must | YCKT V3 dòng 188-191 |
| BR-325 | Báo cáo Schedule Robustness (độ ổn định lịch — khả năng chống delay dây chuyền). | Functional | Should | YCKT V3 dòng 373 |
| BR-326 | Báo cáo Fuel Invoice Summary theo AC Group, theo tháng, tổng theo Group và tổng toàn bộ. | Functional | Must | YCKT V3 dòng 396 |
| BR-327 | Báo cáo FH Plan vs Actual Daily Comparison (theo chặng × nhóm thân rộng/thân hẹp × ngày, cặp đi/về). | Functional | Must | YCKT V3 dòng 413 |
| BR-328 | Báo cáo Ground Service Gantt (mốc dịch vụ linh hoạt) và so sánh Standard Gantt vs Actual. | Functional | Must | YCKT V3 dòng 415-416 |
| BR-329 | Báo cáo MTOW Exceed (các chuyến vượt giới hạn MTOW). | Functional | Must | YCKT V3 dòng 454 |
| BR-330 | Báo cáo sử dụng nước sạch (upload điện nước Boeing/Airbus + bổ sung chuyến không nhận được điện). | Functional | Should | YCKT V3 TOSS-317/332 (dòng 450) |
| BR-331 | Báo cáo theo mẫu nhà chức trách FORM D và FORM E. `[cần xác nhận tên mẫu]` | Functional | Should | YCKT V3 dòng 478 |
| BR-332 | Báo cáo nhóm sai lệch tải/thời gian: sai lệch tải EST của CLC vs thực tế; hàng hóa thực tế (LS) vs OFP đầu/cuối; chênh BlockFuel OFP vs LS; chênh DOW/EPLD ba bên (CLC × OFP × LS); chênh thời gian nhập tải/Lido up OFP/upload MO. `[cần xác nhận với SME Tuấn Dương]` | Functional | Should | YCKT V3 dòng 439-446 |
| BR-333 | Báo cáo Flight List for Backup Tool — export lịch bay cập nhật nhất theo format chuẩn, định kỳ xuất ra SFTP độc lập với TOSS để import phần mềm backup Netline khi Ops++/TOSS lỗi. | Functional | Must | YCKT V3 TOSS-269 (dòng 358) |
| BR-334 | Báo cáo theo công thức tính nhiên liệu thực tế: Actual Remaining Fuel (ưu tiên ACARS ON → QAR ON); Standard OFP Remaining Fuel (Cont + Dest Alt + Final Reserve); Actual Trip Fuel (ACARS OFF−ON → QAR OFF−ON). | Functional | Must | YCKT sheet-12 Logic tính toán |

---

*BRD-TOSS-PH3 v0.1 — 2026-06-12. Tách từ BRD-TOSS-001-khung-v0.5 → v0.6. Tổng 34 BR (BR-301…334). Phân rã FUNC: PHAN-RA-BRD-PH3-quan-ly-bao-cao-toi-uu-khai-thac-v0.3.md.*
