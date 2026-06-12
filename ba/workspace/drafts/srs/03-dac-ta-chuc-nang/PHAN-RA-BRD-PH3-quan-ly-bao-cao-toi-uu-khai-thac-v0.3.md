---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.3"
date: "2026-06-12"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH3"
parent_document: "BRD-TOSS-PH3-bao-cao-toi-uu-v0.1.md"
subsystem: "Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác"
---

# Phân rã Yêu cầu nghiệp vụ → Yêu cầu chức năng — Phân hệ 3

> **Phiên bản này (v0.3 — 2026-06-12):** bản cập nhật từ v0.2 (giữ nguyên v0.2 làm lịch sử). Phân rã thêm 17 BR mới **BR-318 … BR-334** (FOS Report nền, Standard Filter, bố cục báo cáo chuẩn, scheduled report, ACARS Fuel Reliability, email coverage tuần, Performance Factor reports, Schedule Robustness, Fuel Invoice, FH Plan vs Actual Daily, Ground Service Gantt, MTOW Exceed, nước sạch, FORM D/E, sai lệch tải/thời gian, Flight List Backup Tool, logic nhiên liệu thực tế) thành các FUNC con FUNC-379 → FUNC-425; cập nhật bảng truy vết BR → FUNC; tham chiếu BRD đổi sang `BRD-TOSS-001-khung-v0.4.md` (phạm vi BR-301…334). Các FUNC-301…FUNC-378 từ v0.1/v0.2 được giữ nguyên không thay đổi.
>
> **Phiên bản v0.2 — 2026-06-12 (lịch sử):** bản cập nhật từ v0.1 (giữ nguyên v0.1 làm lịch sử). Phân rã thêm BR mới **BR-317** (báo cáo Pallet Relief — Payload Extra) thành các FUNC con FUNC-373 → FUNC-378; cập nhật bảng truy vết BR → FUNC; tham chiếu BRD đổi sang `BRD-TOSS-001-khung-v0.2.md` (phạm vi BR-301…317).

## Mục đích và nguyên tắc

Tài liệu này phân rã các Yêu cầu nghiệp vụ (BR — Business Requirement) BR-301 … BR-334 thuộc `BRD-TOSS-PH3-bao-cao-toi-uu-v0.1.md` (§7.3 trích từ `BRD-TOSS-001-khung-v0.6.md`) xuống lớp Yêu cầu chức năng (FUNC — Functional Requirement), tuân thủ tuyệt đối nguyên tắc tại CLAUDE.md §0:

- Chỉ **phân rã + lắp ráp trung thực** theo nguồn đã trích dẫn; **không suy diễn**, không bịa chỉ số/loại báo cáo ngoài nguồn.
- Mỗi FUNC nêu rõ **BR cha** và **nguồn** (file/mục cụ thể).
- Khi nguồn không nêu đủ chi tiết (luồng, ngưỡng, định dạng, đầu mối, danh mục…) sẽ gắn cờ "(chưa có nguồn — cần SME bổ sung)" hoặc `[cần xác nhận]` cho người (BA Lead/SME) bổ sung.

**Nguồn được phân rã:**

1. BRD Phân hệ 3: `ba/workspace/drafts/brd/BRD-TOSS-PH3-bao-cao-toi-uu-v0.1.md` (BR-301…334; khung cha: `BRD-TOSS-001-khung-v0.6.md` §7.3).
2. Đề xuất giải pháp kỹ thuật — Phân hệ 3 (chi tiết các loại báo cáo): `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/03-phan-he-quan-ly-bao-cao-danh-gia-toi-uu-khai-thac.md`.
3. Báo cáo khảo sát ngày 09/06/2026: `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.2.md` §II.7 (BCAO), §II.8 (giám sát dữ liệu, quản lý mục tiêu).
4. Báo cáo khảo sát ngày 08/06/2026: `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.2.md` §II.4 (báo cáo, phát hành qua thư điện tử, không ký số).
5. Báo cáo khảo sát buổi chiều ngày 11/06/2026: `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md` §II.10 (Payload Extra — báo cáo Pallet Relief).
6. Bóc tách YCKT triển khai V3 (Customer Docs) — sheet 4 (478 dòng): `ba/workspace/drafts/phan-tich/yckt-trien-khai/sheet-04-yckt-v3.md` (các dòng 115-191 ACARS/PF; 358 Flight List Backup; 373 Schedule Robustness; 396 Fuel Invoice; 413 FH Plan vs Actual; 415-416 Ground Service Gantt; 439-446 sai lệch tải/thời gian; 450 nước sạch; 454 MTOW Exceed; 478 FORM D/E).
7. Bóc tách YCKT triển khai V3 — sheet 9 (FOS): `ba/workspace/drafts/phan-tich/yckt-trien-khai/sheet-09-fos.md` (FOS Report, Standard Filter, 14 nhóm thông tin, các trường mặc định/tùy chọn).
8. Bóc tách YCKT triển khai V3 — sheet 11 (Yêu cầu chung): `ba/workspace/drafts/phan-tich/yckt-trien-khai/sheet-11-yêu-cầu-chung.md` (#10 bố cục báo cáo chuẩn, #11 scheduled report).
9. Bóc tách YCKT triển khai V3 — sheet 12 (Logic tính toán): `ba/workspace/drafts/phan-tich/yckt-trien-khai/sheet-12-logic-tính-toán.md` (công thức Actual Remaining Fuel, Standard OFP Remaining Fuel, Actual Trip Fuel).

**Quy ước mã FUNC:** lớp 3xx (`FUNC-301` …), trùng dải số phân hệ của BR cha.

---

## Bảng phân rã chi tiết

### BR-301 — Nền tảng báo cáo, bộ lọc, tùy chọn cột, xuất chuẩn

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-301 | Cung cấp nền tảng báo cáo cho phép thiết lập bộ lọc linh hoạt theo các tiêu chí dữ liệu của báo cáo. | BR-301 | Đề xuất §II.3 (đoạn mở đầu) |
| FUNC-302 | Cho phép người dùng tùy chọn các cột thông tin hiển thị trên báo cáo. | BR-301 | Đề xuất §II.3 (đoạn mở đầu) |
| FUNC-303 | Xuất dữ liệu báo cáo ra các định dạng chuẩn: PDF, Excel, Docx. | BR-301 | Đề xuất §II.3 (đoạn mở đầu) |

### BR-302 — Số hóa BCAO theo cấu trúc hiện hành (hai phần)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-304 | Số hóa BCAO thành **một văn bản duy nhất** gồm hai phần: phần thực hiện ngày hôm trước và phần kế hoạch ngày hôm nay. | BR-302 | Khảo sát 09/06 §II.7 (đoạn mở đầu, "một văn bản duy nhất chia làm hai phần") |
| FUNC-305 | Phần thực hiện ngày hôm trước hiển thị số liệu khai thác theo từng hãng trong nhóm (VN, 0V, BL): số chuyến, số khách quốc nội/quốc tế, hàng hóa, chuyến ferry. | BR-302 | Khảo sát 09/06 §II.7 (cấu trúc BCAO — Số liệu khai thác) |
| FUNC-306 | Phần thực hiện ngày hôm trước hiển thị chỉ số OTP và OSP đi/đến, so sánh với mục tiêu. | BR-302 | Khảo sát 09/06 §II.7 (Chỉ số đúng giờ và OSP) |
| FUNC-307 | Phần thực hiện ngày hôm trước hiển thị hệ số sử dụng ghế (LF) theo từng đường trục với bảng số chuyến đi/đến, LF đi/đến, LF trung bình. | BR-302 | Khảo sát 09/06 §II.7 (Hệ số sử dụng ghế) |
| FUNC-308 | Phần thực hiện ngày hôm trước hiển thị số tàu đang khai thác và tàu dự bị theo từng đội tàu kèm chú thích tình trạng (bảo quản, bảo dưỡng, kiểm tra định kỳ). | BR-302 | Khảo sát 09/06 §II.7 (Số tàu khai thác / dự bị) |
| FUNC-309 | Phần thực hiện ngày hôm trước hiển thị chuyến chuyên cơ (VIP A), chuyến chở yếu nhân (VIP Khác) kèm chức danh, chuyến lưu ý đặc biệt (ví dụ chở hàng tươi sống), và danh sách chuyến ferry. | BR-302 | Khảo sát 09/06 §II.7 (Chuyến VIP, ferry, lưu ý đặc biệt) |
| FUNC-310 | Phần thực hiện ngày hôm trước ghi nhận bất thường trong ngày phân theo loại (kỹ thuật, GTB, thời tiết, nguyên nhân khác) cùng đánh giá sơ bộ nguyên nhân chậm chuyến theo tỷ lệ phần trăm. | BR-302 | Khảo sát 09/06 §II.7 (Bất thường trong ngày) |
| FUNC-311 | Phần kế hoạch ngày hôm nay hiển thị các mục số liệu, LF, tàu bay, VIP, ferry theo kế hoạch (cùng cấu trúc với phần thực hiện hôm trước). | BR-302 | Khảo sát 09/06 §II.7 (Phần kế hoạch ngày hôm nay) |
| FUNC-312 | Phần kế hoạch ngày hôm nay bổ sung bảng kiểm soát APU/PACK: phân loại tàu theo tình trạng động cơ phụ trợ và điều hòa (APU hỏng phát điện, APU hỏng cấp khí, APU có mùi, APU hỏng hoàn toàn) cùng thiết bị mặt đất cần hỗ trợ (GPU, ASU, ACU). | BR-302 | Khảo sát 09/06 §II.7 (APU/PACK) |
| FUNC-313 | Phần kế hoạch ngày hôm nay bổ sung danh mục sân bay không có xe hỗ trợ tàu hỏng APU (xe khởi động khí, xe làm mát, xe điện) kèm ghi chú thời điểm phát sinh. | BR-302 | Khảo sát 09/06 §II.7 (Danh mục sân bay hỗ trợ APU) |
| FUNC-314 | Phần kế hoạch ngày hôm nay bổ sung danh sách tàu nằm đất và lỗi kỹ thuật ảnh hưởng khai thác (AOG/defect). | BR-302 | Khảo sát 09/06 §II.7 (AOG/defect) |
| FUNC-315 | Phần kế hoạch ngày hôm nay bổ sung lưu ý thời tiết theo bản tin dự báo (TAF) cho từng sân bay trong nước và quốc tế; NOTAM trong nước và quốc tế. | BR-302 | Khảo sát 09/06 §II.7 (TAF, NOTAM) |
| FUNC-316 | Phần kế hoạch ngày hôm nay bổ sung phụ lục kỹ thuật do bộ phận trực kỹ thuật cung cấp: bảng AOG kèm thời gian dự kiến đưa vào khai thác và bảng lệnh công việc đang thực hiện. | BR-302 | Khảo sát 09/06 §II.7 (Phụ lục kỹ thuật) |
| FUNC-317 | Tự động thu thập (tổng hợp tự động tối đa) các trường dữ liệu BCAO từ lịch bay: số chuyến, khách, OTP/OSP, số tàu khai thác và dự bị. | BR-302 | Khảo sát 09/06 §II.7 (VTIT — tổng hợp tự động tối đa) |
| FUNC-318 | Các bộ phận chỉ nhập phần dữ liệu chuyên môn của mình (không nhập lại các trường đã tổng hợp tự động). | BR-302 | Khảo sát 09/06 §II.7 (VTIT — chỉ nhập phần chuyên môn) |

### BR-303 — Màn hình BCAO dùng chung, phân quyền theo tab nguồn

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-319 | Cung cấp một màn hình BCAO dùng chung tổ chức theo tab nguồn dữ liệu. | BR-303 | Khảo sát 09/06 §II.7 (VTIT — dùng chung một màn hình phân quyền theo tab) |
| FUNC-320 | Tab "Tổng quan" do trực ban trưởng nhập / quản lý. | BR-303 | Khảo sát 09/06 §II.7 (tab tổng quan của trực ban trưởng) |
| FUNC-321 | Tab "Kỹ thuật" do khối kỹ thuật nhập. | BR-303 | Khảo sát 09/06 §II.7 (tab kỹ thuật) |
| FUNC-322 | Tab "Dịch vụ" do đơn vị dịch vụ nhập. | BR-303 | Khảo sát 09/06 §II.7 (tab dịch vụ) |
| FUNC-323 | Phân quyền truy cập từng tab tương ứng với đầu mối nhập. | BR-303 | Khảo sát 09/06 §II.7 (phân quyền theo tab nguồn) |

### BR-304 — Luồng phê duyệt và phát hành BCAO

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-324 | Hỗ trợ luồng phê duyệt BCAO trước khi phát hành (báo cáo phải được phê duyệt). | BR-304 | Khảo sát 09/06 §II.7 ("báo cáo phải được phê duyệt trước khi phát hành") |
| FUNC-325 | Phát hành BCAO qua thư điện tử (email) sau khi được phê duyệt. | BR-304 | Khảo sát 08/06 §II.4 ("phát hành báo cáo qua thư điện tử") |
| FUNC-326 | Không yêu cầu ký số đối với BCAO khi phát hành. | BR-304 | Khảo sát 08/06 §II.4 ("không yêu cầu ký số") |
| FUNC-327 | Quản lý danh sách đầu mối nhận BCAO cấu hình sẵn (cấu hình trước trên hệ thống). | BR-304 | Đề xuất §II.3 (BCAO — "danh sách đầu mối nhận báo cáo được cấu hình sẵn") |

### BR-305 — Nhập bất thường đa chiều và lọc

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-328 | Cho phép người nhập chọn tàu bay → hệ thống liệt kê các chuyến của tàu đó → tích chọn chuyến bị ảnh hưởng. | BR-305 | Khảo sát 09/06 §II.7 (VTIT — bất thường, chọn tàu → liệt kê chuyến → tích chọn) |
| FUNC-329 | Hạn chế nhập tự do; ưu tiên chọn nguyên nhân từ danh mục nguyên nhân do người dùng tự định nghĩa và bổ sung. | BR-305 | Khảo sát 09/06 §II.7 (hạn chế nhập tự do; danh mục nguyên nhân tự định nghĩa) |
| FUNC-330 | Cho phép ghi chú chi tiết kèm theo mỗi bản ghi bất thường. | BR-305 | Khảo sát 09/06 §II.7 ("kèm ghi chú chi tiết") |
| FUNC-331 | Hỗ trợ lọc bất thường theo khoảng thời gian. | BR-305 | Khảo sát 09/06 §II.7 ("hỗ trợ lọc theo khoảng thời gian") |
| FUNC-332 | Hỗ trợ lọc bất thường theo sân bay đi/đến. | BR-305 | Khảo sát 09/06 §II.7 ("và sân bay đi/đến") |
| FUNC-333 | Sử dụng dữ liệu bất thường đã nhập cho cả báo cáo ngày (BCAO) và thống kê dài hạn (ví dụ đánh giá số tàu hỏng trong cao điểm Tết). | BR-305 | Khảo sát 09/06 §II.7 ("phục vụ cả báo cáo ngày và thống kê dài hạn") |

### BR-306 — Yếu nhân và chuyên cơ (tự động + thủ công)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-334 | Nhận biết tự động chuyến yếu nhân và chuyên cơ khi nguồn dữ liệu có thông tin phân biệt được. `[cần xác nhận tên hệ thống nguồn]` | BR-306 | Khảo sát 09/06 §II.7 ("Yếu nhân và chuyên cơ: nhận biết tự động khi nguồn có dữ liệu") |
| FUNC-335 | Cho phép người dùng tích chọn thủ công yếu nhân/chuyên cơ khi nguồn không phân biệt được. | BR-306 | Khảo sát 09/06 §II.7 ("phần còn lại tích chọn thủ công") |

### BR-307 — Trình bày BCAO trực quan bằng biểu đồ

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-336 | Trình bày BCAO trực quan bằng biểu đồ, thay thế tệp Word thủ công hiện hành. | BR-307 | Khảo sát 09/06 §II.7 ("Trình bày trực quan bằng biểu đồ, thay thế tệp Word thủ công") |

### BR-308 — Báo cáo lịch bay và hiệu suất

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-337 | Báo cáo thống kê biến động chuyến bay so với kế hoạch: đổi giờ, đổi tàu, thay đổi cấu hình ghế, đổi code, hủy chuyến. | BR-308 | Đề xuất §II.3 (Thống kê biến động) |
| FUNC-338 | Báo cáo phân loại chuyến bay theo tính chất khai thác: thường lệ, Charter (thuê chuyến), Ferry, VIP, chở khách, chở hàng hóa. | BR-308 | Đề xuất §II.3 (Phân loại tính chất) |
| FUNC-339 | Báo cáo OTP/OSP: phân tích tỷ lệ chuyến đúng giờ; thống kê chậm chuyến tại các đầu sân bay (chậm cất cánh / chậm hạ cánh). | BR-308 | Đề xuất §II.3 (Chỉ số đúng giờ — OTP/OSP) |
| FUNC-340 | Báo cáo các chuyến bay chuyển hướng (Divert). | BR-308 | Đề xuất §II.3 (Chỉ số đúng giờ — báo cáo Divert) |
| FUNC-341 | Báo cáo sử dụng đội tàu: thống kê số lần cất hạ cánh, giờ máy bay (Flight Hours), hành trình bay, thời gian tàu dừng và nằm sân nhằm tối ưu hóa vòng quay tàu bay. | BR-308 | Đề xuất §II.3 (Sử dụng đội tàu) |

### BR-309 — Báo cáo nhiên liệu tiêu thụ

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-342 | Báo cáo tiêu thụ nhiên liệu trên mỗi giờ bay (Fuel/FH) theo loại tàu bay và chặng bay, kèm các giá trị thống kê Median, Mean, Max, Min và độ tin cậy %. | BR-309 | Đề xuất §II.3 (Phân tích nhiên liệu tiêu thụ) |
| FUNC-343 | Báo cáo đối soát kế hoạch ↔ thực tế: so sánh trực quan lượng nhiên liệu dự kiến trên kế hoạch bay và lượng tiêu thụ thực tế. | BR-309 | Đề xuất §II.3 (Đối soát kế hoạch) |
| FUNC-344 | Báo cáo giám sát quyết định của phi công: lượng dầu nạp thêm theo yêu cầu của phi công (Pilot Extra Fuel) và các loại nhiên liệu Extra khác. | BR-309 | Đề xuất §II.3 (Giám sát quyết định của Phi công) |
| FUNC-345 | Báo cáo chỉ số kinh tế nhiên liệu: định mức nhiên liệu, Fuel Burn/RTK, Fuel Burn/BH. | BR-309 | Đề xuất §II.3 (Chỉ số kinh tế) |

### BR-310 — Báo cáo thời gian thực hiện chuyến bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-346 | Báo cáo phân tích Taxi Time và đưa ra khuyến nghị thời gian lăn bánh (Taxi-in/out) tại từng sân bay phục vụ xây dựng kế hoạch bay sát thực tế. | BR-310 | Đề xuất §II.3 (Phân tích Taxi Time) |
| FUNC-347 | Báo cáo đánh giá thời gian khai thác (BH): xu hướng BH, BH trung bình, BH theo lịch bay mùa nhằm khuyến nghị điều chỉnh tham số kế hoạch. | BR-310 | Đề xuất §II.3 (Đánh giá thời gian khai thác — BH) |
| FUNC-348 | Báo cáo phân tích chi tiết Phase: giờ thực hiện chuyến bay theo từng giai đoạn Taxi-out, Takeoff, Climb, Cruise, Descent, Taxi-in. | BR-310 | Đề xuất §II.3 (Phân tích chi tiết Phase) |
| FUNC-349 | Báo cáo theo dõi các chuyến bay phải bay vòng chờ (Holding). | BR-310 | Đề xuất §II.3 (Phase — Holding) |
| FUNC-350 | Báo cáo chỉ số thời gian quay vòng và nằm sân của tàu bay (Ground Time / Turnaround Time). | BR-310 | Đề xuất §II.3 (Ground Time / Turnaround Time) |

### BR-311 — Báo cáo OFP và dữ liệu bay thực tế

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-351 | Báo cáo hiệu quả lập kế hoạch: đánh giá thời gian làm OFP so với quy định và phân tích chi tiết thông tin các bản OFP đã ban hành. | BR-311 | Đề xuất §II.3 (Hiệu quả lập kế hoạch) |
| FUNC-352 | Báo cáo độ chính xác tải trọng (Payload Accuracy): sự sai lệch giữa tải trọng ước tính khi lập kế hoạch và tải trọng thực tế khai thác. | BR-311 | Đề xuất §II.3 (Độ chính xác tải trọng) |
| FUNC-353 | Báo cáo tối ưu hóa đường bay: phân tích việc sử dụng sân bay dự bị, mức bay (Flight Level), chỉ số chi phí (Cost Index), các đường bay thực tế (Route) và phương thức cất hạ cánh (Runway, SID, STAR). | BR-311 | Đề xuất §II.3 (Tối ưu hóa đường bay) |

### BR-312 — Báo cáo tải trọng, dịch vụ và tổ bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-354 | Báo cáo dữ liệu thương mại: Load Factor, tình hình booking khách, hành khách VIP/CIP, thông tin hành lý ký gửi và hành lý bị offload. | BR-312 | Đề xuất §II.3 (Dữ liệu thương mại) |
| FUNC-355 | Báo cáo hàng hóa & tải trọng: thống kê chuyến bay có hàng hóa nguy hiểm (NOTOC), Cargo Manifest. | BR-312 | Đề xuất §II.3 (Hàng hóa & Tải trọng — NOTOC, Cargo Manifest) |
| FUNC-356 | Báo cáo thay đổi tải trọng sát giờ bay. | BR-312 | Đề xuất §II.3 (thay đổi tải trọng sát giờ bay) |
| FUNC-357 | Báo cáo các chuyến bay đạt giới hạn tải trọng. | BR-312 | Đề xuất §II.3 (các chuyến bay đạt giới hạn tải trọng) |
| FUNC-358 | Báo cáo quản trị nguồn lực tổ bay: theo dõi mục tiêu giờ bay thiết lập cho phi công và tiếp viên. | BR-312 | Đề xuất §II.3 (Quản trị nguồn lực Tổ bay — mục tiêu giờ bay) |
| FUNC-359 | Báo cáo chi tiết giờ bay (Flight Time), giờ làm việc (Duty Time) của tổ bay. | BR-312 | Đề xuất §II.3 (giờ bay, giờ làm việc) |
| FUNC-360 | Báo cáo tổ bay dự bị. | BR-312 | Đề xuất §II.3 (tổ bay dự bị) |
| FUNC-361 | Báo cáo thống kê các trường hợp khai thác không đúng quy định liên quan tổ bay. | BR-312 | Đề xuất §II.3 (khai thác không đúng quy định) |

### BR-313 — Báo cáo khai thác và môi trường

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-362 | Báo cáo bất thường khai thác: thống kê chuyến bay bất thường do thời tiết, do kỹ thuật và do các lý do khác. | BR-313 | Đề xuất §II.3 (Bất thường khai thác) |
| FUNC-363 | Báo cáo phân tích thời tiết chuyên sâu — so sánh thời tiết quan trắc thực tế với tiêu chuẩn tối thiểu (Minima). | BR-313 | Đề xuất §II.3 (Phân tích thời tiết chuyên sâu — quan trắc vs Minima) |
| FUNC-364 | Báo cáo phân tích thời tiết chuyên sâu — đối soát giữa thời tiết dự báo và thực tế để đánh giá rủi ro. | BR-313 | Đề xuất §II.3 (dự báo vs thực tế) |
| FUNC-365 | Báo cáo hiệu quả tổng thể chuyến bay (Profitability). | BR-313 | Đề xuất §II.3 (Hiệu quả tổng thể — Profitability) |
| FUNC-366 | Cho phép phát sinh các báo cáo khác theo đặc thù nghiệp vụ OCC. (chưa có nguồn — cần SME bổ sung danh sách báo cáo phát sinh cụ thể) | BR-313 | Đề xuất §II.3 ("và các báo cáo phát sinh khác theo đặc thù nghiệp vụ OCC") |

### BR-314 — Quản lý mục tiêu chỉ số OTP/OSP

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-367 | Cho phép thiết lập và quản lý 4 mục tiêu chia cho 2 nhóm chỉ số OTP (đúng giờ) và OSP (hiệu quả thực hiện lịch khai thác). Mức cụ thể của từng mục tiêu (chưa có nguồn — cần SME bổ sung; nguồn chỉ nêu ví dụ 80%). | BR-314 | Khảo sát 09/06 §II.8 ("có tất cả bốn mục tiêu, chia cho hai nhóm chỉ số") |
| FUNC-368 | Tự động tính các chỉ số OTP/OSP khi đủ nguồn dữ liệu (gồm dữ liệu sẵn có trên hệ thống và dữ liệu nhập thêm). | BR-314 | Khảo sát 09/06 §II.8 (VTIT — tính tự động khi đủ nguồn dữ liệu) |

### BR-315 — Màn hình giám sát dữ liệu (độ phủ, độ chính xác)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-369 | Tách màn hình giám sát dữ liệu thành màn riêng (không gộp chung với báo cáo nghiệp vụ). | BR-315 | Khảo sát 09/06 §II.8 ("tách thành màn hình riêng"; mục III thống nhất số 5) |
| FUNC-370 | Báo cáo độ phủ dữ liệu (ví dụ tỷ lệ chuyến bay có điện văn theo từng đội tàu). | BR-315 | Khảo sát 09/06 §II.8 ("báo cáo về độ phủ … của dữ liệu — tỷ lệ chuyến bay có điện văn theo từng đội tàu") |
| FUNC-371 | Báo cáo độ chính xác dữ liệu. Chỉ số/tiêu chí định lượng cụ thể (chưa có nguồn — cần SME bổ sung). | BR-315 | Khảo sát 09/06 §II.8 ("độ phủ và độ chính xác của dữ liệu") |

### BR-316 — Khuyến nghị Tankering Strategy

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-372 | Cung cấp khuyến nghị tối ưu chính sách mang dầu bổ sung (Tankering Strategy) với tính chất khuyến nghị (không bắt buộc thực thi). Tham số đầu vào và công thức cụ thể (chưa có nguồn — cần SME bổ sung; BR-413 quy định nguyên tắc dữ liệu tham số Tankering ở phân hệ Master Data). | BR-316 | Đề xuất §I (khuyến nghị Tankering) |

### BR-317 — Báo cáo Pallet Relief (Payload Extra) — dầu/nhiên liệu tổ bay đề nghị lấy thêm

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-373 | Cung cấp báo cáo Pallet Relief liệt kê các chuyến bay và lượng Payload Extra — phần dầu/nhiên liệu tổ bay tự đề nghị lấy thêm so với OFP của điều phái (thường phát sinh khoảng 30 phút trước khởi hành). | BR-317 | Khảo sát 11/06 chiều §II.10 (khái niệm Payload Extra; "báo cáo nội bộ liệt kê chuyến và payload extra theo ngày") |
| FUNC-374 | Báo cáo phải hiển thị cột Payload Extra (lượng dầu thực tế tổ bay lấy thêm so với OFP, tính theo công thức: dầu thực tế tổ bay lấy − dầu OFP, đơn vị kg). | BR-317 | Khảo sát 11/06 chiều §II.10 ("Hiển thị thêm cột Payload Extra trong báo cáo"; "Cơ chế tính: lấy dầu thực tế tổ bay lấy − dầu OFP = số kg lấy thêm") |
| FUNC-375 | Báo cáo phải hỗ trợ cột Delta = Actual − OFP (chênh lệch giữa giá trị thực tế của phi công và giá trị trên OFP); cho phép cấu hình hiển thị cả hai giá trị Actual và OFP hoặc chỉ hiển thị cột Delta. `[cần xác nhận: hiển thị mặc định là cả hai giá trị hay chỉ Delta]` | BR-317 | Khảo sát 11/06 chiều §II.10 ("trừ luôn giữa OFP và X-actual của phi công → đưa vào một cột Delta"; "chấp nhận hiển thị cả hai giá trị hoặc chỉ delta") |
| FUNC-376 | Báo cáo phải hỗ trợ bộ lọc theo bốn chiều: ngày, đường bay (ví dụ HAN-SGN), khung giờ cất cánh, loại tàu bay. | BR-317 | Khảo sát 11/06 chiều §II.10 ("Truy vấn theo: ngày, đường bay (vd HAN-SGN), khung giờ cất cánh, loại tàu"; Kết luận: "Cho phép lọc theo: ngày, đường bay, khung giờ, loại tàu") |
| FUNC-377 | Với báo cáo có khối lượng dữ liệu lớn (heavy report), hệ thống phải áp dụng cơ chế trả kết quả ra tab riêng (không khóa giao diện chính) — tương đương luồng gửi báo cáo qua thư điện tử hiện hành. | BR-317 | Khảo sát 11/06 chiều §II.10 ("với report nặng, áp dụng cơ chế tab kết quả + lưu link 7 ngày — tương đương luồng gửi mail báo cáo") |
| FUNC-378 | Hệ thống phải lưu liên kết tải kết quả báo cáo Pallet Relief trong 7 ngày và cho phép người dùng tải lại nhiều lần trong khoảng thời gian đó. | BR-317 | Khảo sát 11/06 chiều §II.10 ("lưu link tải trong 7 ngày, hỗ trợ tải lại") |

### BR-318 — Báo cáo nền FOS Report (Flight Operations Summary / Flight Integrated)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-379 | Cung cấp báo cáo nền FOS Report (Flight Operations Summary / Flight Integrated) tích hợp toàn bộ dữ liệu chuyến bay theo 14 nhóm thông tin: FLIGHT INFO, AIRCRAFT, TIME, FUEL UPLIFT, LOAD & WEIGHT, OFP, FLIGHT RELEASE, DOCUMENT STATUS, EOFP, QAR, CREW, AIRPORT, ACARS, COST & REVENUE. | BR-318 | Sheet-09 FOS dòng 1, 8 (14 nhóm) |
| FUNC-380 | Cho phép người dùng chọn toàn bộ trường của một số nhóm hoặc chọn từng trường của từng nhóm để hiển thị trên FOS Report. | BR-318 | Sheet-09 FOS dòng 7 ("Có thể chọn toàn bộ trường của 1 số nhóm hoặc chọn từng trường của từng nhóm") |
| FUNC-381 | Đánh dấu các trường mặc định (các trường màu xanh lá cây trong nguồn) được chọn sẵn khi mở FOS Report. Danh mục cụ thể các trường mặc định `[cần xác nhận với SME]`. | BR-318 | Sheet-09 FOS dòng 6 ("Các trường màu xanh lá cây là mặc định chọn") |
| FUNC-382 | FOS Report đóng vai trò nguồn dữ liệu cơ sở cho mọi báo cáo khác — các báo cáo chi tiết khác được phép chọn thêm cột dữ liệu (các cột thuộc FOS) vào bảng dữ liệu chi tiết của mình. | BR-318 | Sheet-11 #10 ("Cho phép chọn thêm cột dữ liệu vào báo cáo data chi tiết (các cột thuộc FOS) — Các dữ liệu cơ sở thì để ở FOS report") |
| FUNC-383 | Số hóa và bóc tách toàn bộ OFP, kể cả những thông tin không yêu cầu trong báo cáo FOS, để đảm bảo độ phủ dữ liệu cơ sở. | BR-318 | Sheet-11 #13 ("Số hóa, bóc tách toàn bộ OFP, kể cả những thông tin không yêu cầu trong báo cáo FOS") |

### BR-319 — Standard Filter chuẩn cho mọi báo cáo

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-384 | Cung cấp bộ lọc chuẩn (Standard Filter) áp dụng cố định cho mọi báo cáo gồm: From Date, To Date, Local time / UTC, Plan / Actual Time, Carrier. | BR-319 | Sheet-09 FOS dòng 3 ("đây là bộ lọc cố định đối với mọi báo cáo") |
| FUNC-385 | Cho phép bổ sung trường lọc riêng cho từng báo cáo đặc biệt (ngoài Standard Filter), tùy nhu cầu nghiệp vụ. | BR-319 | Sheet-09 FOS dòng 3 ("Ngoài ra có thêm trường lọc riêng cho từng báo cáo đặc biệt") |
| FUNC-386 | Cung cấp các bộ lọc bổ sung phổ biến: AC Category, AC Type, AC Reg, Flt Type, Flt State; Region, DEP, ARR, FLT NO. | BR-319 | Sheet-09 FOS dòng 4, 5 |

### BR-320 — Bố cục báo cáo chuẩn và cảnh báo hiệu năng

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-387 | Bố trí mọi báo cáo theo cấu trúc chuẩn: Standard Filter → bộ lọc riêng của báo cáo (nếu cần) → khu vực biểu đồ → khu vực bảng dữ liệu chi tiết. | BR-320 | Sheet-11 #10 (bố cục báo cáo) |
| FUNC-388 | Bảng dữ liệu chi tiết của mỗi báo cáo phải chứa các dữ liệu, đầu vào, tính toán riêng của báo cáo đó và cho phép chọn thêm cột dữ liệu từ FOS Report. | BR-320 | Sheet-11 #10 ("mỗi báo cáo chi tiết các dữ liệu, đầu vào, tính toán của riêng báo cáo đó. Cho phép chọn thêm cột dữ liệu vào báo cáo data chi tiết (các cột thuộc FOS)") |
| FUNC-389 | Hiển thị cảnh báo hiệu năng khi người dùng chọn khoảng thời gian quá dài và/hoặc số lượng trường dữ liệu quá nhiều có thể dẫn tới giảm hiệu năng truy vấn. Ngưỡng cảnh báo cụ thể `[cần xác nhận]`. | BR-320 | Sheet-09 FOS dòng 7 ("Cảnh báo hiệu năng lúc người dùng chọn thời gian/số lượng trường nhiều có thể dẫn tới giảm hiệu năng") |

### BR-321 — Scheduled Report (gửi báo cáo định kỳ tự động)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-390 | Cho phép thiết lập gửi tự động các báo cáo thường kỳ tới danh sách đầu mối đã cấu hình. Tần suất, định dạng cụ thể `[cần xác nhận]`. | BR-321 | Sheet-11 #11 ("Tự động gửi những báo cáo thường kỳ") |
| FUNC-391 | Hiển thị trạng thái chạy ngầm (background) của tác vụ gửi báo cáo định kỳ trên màn hình mà người dùng đang thao tác, không khóa giao diện chính. | BR-321 | Sheet-11 #11 ("ms trang đang thực hiện" — message trên trang đang thực hiện) |

### BR-322 — Báo cáo ACARS Fuel Integration Coverage và ACARS Fuel Reliability

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-392 | Báo cáo ACARS Fuel Integration by AC Type — Standard Filter; kết quả theo từng AC Type theo từng tháng trong giai đoạn được chọn, gồm 4 bảng: Bảng 1 Fls by Month, Bảng 2 ACARS Time Data Coverage, Bảng 3 ACARS Block Fuel Data Coverage, Bảng 4 ACARS Trip Fuel Data Coverage. | BR-322 | Sheet-04 YCKT V3 dòng 115-116 (TOSS-095) |
| FUNC-393 | Báo cáo ACARS Fuel Integration by AC Reg — Standard Filter; kết quả theo từng AC Reg theo từng tháng trong giai đoạn được chọn (4 bảng tương tự FUNC-392). | BR-322 | Sheet-04 YCKT V3 dòng 117 ("Tham khảo TEMPLATE Tỷ lệ dữ liệu ACARS") |
| FUNC-394 | Báo cáo ACARS Fuel Reliability All AC — Standard Filter; cho phép nhập tham số Min Difference (tỷ lệ sai lệch chấp nhận giữa ACARS OUT FUEL và Fuel Order, mặc định gợi ý 10%); bảng kết quả theo từng AC Type. | BR-322 | Sheet-04 YCKT V3 dòng 117 ("Min Difference: cho nhập tỷ lệ 10% sai lệch giữa ACARS OUT FUEL và Fuel Order") |
| FUNC-395 | Báo cáo ACARS Fuel Reliability by AC Reg — Standard Filter; không cho chọn quá 1 AC Reg; mỗi dòng là 1 tháng của Registration được chọn. | BR-322 | Sheet-04 YCKT V3 dòng 118 ("không cho chọn quá 1 AC Reg") |
| FUNC-396 | Áp dụng quy ước tô màu kết quả: với 2 tỷ lệ (i) (ii) nếu ≤ 50% dùng màu đỏ dịu càng nhỏ càng đậm, nếu > 50% dùng màu xanh lá càng lớn càng đậm; với các tỷ lệ (iii) đến (vi) dùng màu đỏ dịu càng bé càng nhạt càng lớn càng đậm. `[cần xác nhận định nghĩa cụ thể 6 tỷ lệ]`. | BR-322 | Sheet-04 YCKT V3 dòng 186-187 |
| FUNC-397 | Báo cáo phải nhận biết và đánh dấu (highlight) các điểm bất hợp lý: illogical taxi fuel, illogical trip fuel (theo template tỷ lệ dữ liệu ACARS). Tiêu chí "illogical" cụ thể `[cần xác nhận]`. | BR-322 | BR-322 BRD ("illogical taxi/trip fuel, highlight tỷ lệ"); Sheet-04 V3 dòng 117 |

### BR-323 — Email báo cáo độ phủ dữ liệu theo tuần

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-398 | Gửi định kỳ hàng tuần email Performance Email báo cáo tỷ lệ độ phủ dữ liệu theo từng tàu bay (Registration). | BR-323 | Sheet-04 YCKT V3 dòng 151 |
| FUNC-399 | Báo cáo độ phủ tuần phải bao gồm các nhóm dữ liệu: ACARS OUT/OFF/ON/IN, OFP, QAR, booking, pax thực, tổ bay, Load Sheet. | BR-323 | Sheet-04 YCKT V3 dòng 151 (danh sách nhóm dữ liệu phủ) |
| FUNC-400 | Cho phép cấu hình danh sách email nhận báo cáo độ phủ (Email list for Data Coverage Report) — linh hoạt thêm/bớt địa chỉ. | BR-323 | Sheet-04 YCKT V3 dòng 230 (TOSS-168 + "Email list for Data Coverage Report") |

### BR-324 — Báo cáo Performance Factor (PF)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-401 | Báo cáo PF Comparison — bộ lọc Previous Data Period, Current Data Period, AC Reg (multi-select, mặc định chọn tất, cho phép bỏ chọn từng Reg); bảng PF từng tàu bay theo từng AC Type, format để gửi OCD và copy CV dùng chung. | BR-324 | Sheet-04 YCKT V3 dòng 188 |
| FUNC-402 | Báo cáo PF Trend by AC Type — bộ lọc From Date, To Date, Aircraft Category 2; bảng cột AC Category (theo Cate2), Data Period, AVG PF; biểu đồ dây mỗi Category một dây PF theo từng Data Period kèm đường xu hướng. AVG PF của mỗi AC Cate lấy trung bình PF của các tàu trong Cate. | BR-324 | Sheet-04 YCKT V3 dòng 189 |
| FUNC-403 | Báo cáo PF Trend by AC Reg — bộ lọc From Date, To Date, AC Reg (multi-select, mặc định không chọn); bảng cột AC Reg, Data Period, PF; khi chọn 1 AC Reg thì hiển thị biểu đồ dây PF qua từng Data Period. | BR-324 | Sheet-04 YCKT V3 dòng 190 |
| FUNC-404 | Báo cáo PF Data Coverage — bộ lọc From Date, To Date, Aircraft Category 2; bảng cột AC Reg, Data Period, PF Data Coverage. Công thức PF Data Coverage của 1 tàu trong 1 kỳ: tỷ lệ số chuyến bay có message PF (qua ACARS) / tổng số chuyến bay tàu đó có khai thác trong kỳ. | BR-324 | Sheet-04 YCKT V3 dòng 191 |

### BR-325 — Báo cáo Schedule Robustness

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-405 | Báo cáo Schedule Robustness — đánh giá độ ổn định lịch bay, đo khả năng chống delay dây chuyền của lịch khai thác. Phương pháp tính, ngưỡng đánh giá, biểu đồ thể hiện cụ thể (chưa có nguồn — cần SME bổ sung). | BR-325 | Sheet-04 YCKT V3 dòng 373 ("Schedule Robustness — độ ổn định lịch — Khả năng chống delay dây chuyền") |

### BR-326 — Báo cáo Fuel Invoice Summary

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-406 | Báo cáo Fuel Invoice Summary — Standard Filter; bảng kết quả theo AC Group 1: cột "AC Group 1", mỗi tháng trong giai đoạn chọn là một cột (giá trị là tổng Fuel Invoice kg đối với từng AC Group 1 trong tháng), cột Total (tổng theo từng AC Group 1), dòng cuối là Total từng tháng của tất cả các Group 1 và tổng toàn bộ. | BR-326 | Sheet-04 YCKT V3 dòng 396 |

### BR-327 — Báo cáo FH Plan vs Actual Daily Comparison

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-407 | Báo cáo FH Plan vs Actual Daily Comparison — Standard Filter; bảng kết quả FH theo từng chặng bay, theo từng nhóm tàu bay thân rộng / thân hẹp, theo từng ngày (tương tự sheet theo dõi ngày trên Flight Ops Data). | BR-327 | Sheet-04 YCKT V3 dòng 413 |
| FUNC-408 | Báo cáo FH Plan vs Actual Daily phải hiển thị đầy đủ các chặng bay / tàu bay có khai thác trong giai đoạn được chọn, sắp xếp theo cặp đi / về. | BR-327 | Sheet-04 YCKT V3 dòng 413 ("cần phải ra full các chặng bay/tàu bay có khai thác trong giai đoạn đó. Sắp xếp theo cặp đi/về") |

### BR-328 — Báo cáo Ground Service Gantt và so sánh Standard vs Actual

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-409 | Cung cấp công cụ quản lý và khai báo linh hoạt các mốc trong sơ đồ Gantt dịch vụ mặt đất (Ground Service Gantt). | BR-328 | Sheet-04 YCKT V3 dòng 415 |
| FUNC-410 | Báo cáo Standard Gantt vs Actual — so sánh các mốc thời gian phục vụ mặt đất (PVMĐ) theo tiêu chuẩn và thực tế. | BR-328 | Sheet-04 YCKT V3 dòng 416 |

### BR-329 — Báo cáo MTOW Exceed

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-411 | Báo cáo MTOW Exceed — liệt kê các chuyến bay vượt giới hạn trọng lượng cất cánh tối đa (MTOW — Maximum Take-off Weight). Tiêu chí, các cột hiển thị, ngưỡng vượt cụ thể (chưa có nguồn — cần SME bổ sung). | BR-329 | Sheet-04 YCKT V3 dòng 454 |

### BR-330 — Báo cáo sử dụng nước sạch

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-412 | Báo cáo sử dụng nước sạch — cho phép người dùng upload báo cáo điện nước sạch tải từ website Boeing / Airbus. | BR-330 | Sheet-04 YCKT V3 dòng 450 (TOSS-317) |
| FUNC-413 | Báo cáo sử dụng nước sạch cho phép bổ sung thông tin các chuyến không nhận được điện (gửi qua email) để hợp nhất vào báo cáo. | BR-330 | Sheet-04 YCKT V3 dòng 450 ("bổ sung các chuyến ko nhận đc điện qua email") |

### BR-331 — Báo cáo theo mẫu nhà chức trách FORM D và FORM E

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-414 | Báo cáo theo mẫu nhà chức trách FORM D `[cần xác nhận tên đầy đủ và đối tượng nhận]`. Cấu trúc cụ thể, trường dữ liệu (chưa có nguồn — cần SME bổ sung). | BR-331 | Sheet-04 YCKT V3 dòng 478 ("Báo cáo FORM D, FORM E") |
| FUNC-415 | Báo cáo theo mẫu nhà chức trách FORM E `[cần xác nhận tên đầy đủ và đối tượng nhận]`. Cấu trúc cụ thể, trường dữ liệu (chưa có nguồn — cần SME bổ sung). | BR-331 | Sheet-04 YCKT V3 dòng 478 |

### BR-332 — Báo cáo nhóm sai lệch tải và thời gian (Payload/Time Discrepancy)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-416 | Báo cáo sai lệch tải EST của CLC (Centralized Load Control) so với tải thực tế. `[cần xác nhận với SME Tuấn Dương cách tính cụ thể]`. | BR-332 | Sheet-04 YCKT V3 dòng 445 ("Báo cáo sai lệch tải EST của CLC so với thực tế") |
| FUNC-417 | Báo cáo so sánh hàng hóa thực tế (lấy số Load Sheet) với số nhập OFP ban đầu và OFP lần cuối; chỉ đánh giá theo lần OFP cuối thì lấy số thực so với số lập lần cuối; các lần nhập khác tách ra từng cột riêng. `[cần xác nhận với SME Tuấn Dương + Ban TTHH]`. | BR-332 | Sheet-04 YCKT V3 dòng 446 |
| FUNC-418 | Báo cáo chênh lệch Block Fuel giữa OFP và Load Sheet theo từng version Load Sheet. `[cần xác nhận với SME Tuấn Dương]`. | BR-332 | Sheet-04 YCKT V3 dòng 444 |
| FUNC-419 | Báo cáo chênh lệch tải EPLD giữa con số của 3 bên: CLC, OFP và Load Sheet theo từng version OFP. `[cần xác nhận với SME Tuấn Dương]`. | BR-332 | Sheet-04 YCKT V3 dòng 442 |
| FUNC-420 | Báo cáo chênh lệch DOW (Dry Operating Weight) giữa con số của 3 bên: CLC, OFP và Load Sheet theo từng version OFP. `[cần xác nhận với SME Tuấn Dương]`. | BR-332 | Sheet-04 YCKT V3 dòng 443 |
| FUNC-421 | Báo cáo chênh lệch thời gian nhập tải so với quy định ban đầu — nếu lệch ngoài khoảng quy định (số lần nhập, thời gian từng lần trước ETD) thì đánh dấu lỗi từ khâu nhập tải. `[cần xác nhận quy tắc số lần và mốc thời gian với SME Tuấn Dương]`. | BR-332 | Sheet-04 YCKT V3 dòng 439 |
| FUNC-422 | Báo cáo chênh lệch thời gian giữa lần nhập tải và thời điểm Lido up OFP — phân hai trường hợp: TH1 chênh 1–2 phút là đúng rule (thời gian máy tính toán); TH2 chênh quá nhiều là lỗi hệ thống tự động Lido hoặc người dùng không làm đúng quy trình. `[cần xác nhận với SME Tuấn Dương]`. | BR-332 | Sheet-04 YCKT V3 dòng 440 |
| FUNC-423 | Báo cáo chênh lệch thời gian upload lên MO Plus so với rule mốc thời gian trước ETD — đánh dấu khoanh vùng kiểm tra kỹ khi lệch quá nhiều. `[cần xác nhận rule với SME Tuấn Dương]`. | BR-332 | Sheet-04 YCKT V3 dòng 441 |

### BR-333 — Flight List for Backup Tool

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-424 | Cung cấp chức năng download Flight List for Backup Tool theo Standard Filter — xuất lịch bay cập nhật nhất theo format chuẩn để user import vào phần mềm backup Netline trong trường hợp Ops++ lỗi nhưng TOSS vẫn hoạt động bình thường. | BR-333 | Sheet-04 YCKT V3 dòng 358 (TOSS-269) |
| FUNC-425 | Định kỳ xuất file Flight List for Backup Tool ra một SFTP độc lập với TOSS, phục vụ trường hợp Ops++ lỗi và TOSS cũng lỗi (truy cập file từ SFTP). Tần suất xuất, đường dẫn SFTP, định dạng tên file cụ thể `[cần xác nhận]`. | BR-333 | Sheet-04 YCKT V3 dòng 358 ("Đồng thời định kỳ xuất file này ra 1 SFTP độc lập với TOSS để lấy file (trường hợp Ops++ lỗi và TOSS cũng lỗi)") |

### BR-334 — Logic tính toán nhiên liệu thực tế

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-426 | Hệ thống phải tính chỉ số Actual Remaining Fuel theo thứ tự ưu tiên: (1) ACARS ON FUEL, (2) QAR ON FUEL — chỉ dùng QAR khi không có ACARS. | BR-334 | Sheet-12 Logic tính toán dòng 2 |
| FUNC-427 | Hệ thống phải tính chỉ số Standard OFP Remaining Fuel theo công thức: Cont Fuel + Dest Alt Fuel + Final Reserve. | BR-334 | Sheet-12 Logic tính toán dòng 3 |
| FUNC-428 | Hệ thống phải tính chỉ số Actual Trip Fuel theo thứ tự ưu tiên: (1) ACARS OFF FUEL − ACARS ON FUEL, (2) QAR OFF FUEL − QAR ON FUEL — chỉ dùng QAR khi không có ACARS. | BR-334 | Sheet-12 Logic tính toán dòng 4 |
| FUNC-429 | Hệ thống phải tích hợp giá trị Techlog uplift FOB từ AMOS (remaining after uplift) — ý nghĩa: nhiên liệu có trên tàu bay sau khi uplift. | BR-334 | Sheet-12 Logic tính toán dòng 5 |

---

## Bảng truy vết BR → FUNC

| BR | Số FUNC | Danh sách mã FUNC |
|---|---|---|
| BR-301 | 3 | FUNC-301, FUNC-302, FUNC-303 |
| BR-302 | 15 | FUNC-304 → FUNC-318 |
| BR-303 | 5 | FUNC-319 → FUNC-323 |
| BR-304 | 4 | FUNC-324, FUNC-325, FUNC-326, FUNC-327 |
| BR-305 | 6 | FUNC-328 → FUNC-333 |
| BR-306 | 2 | FUNC-334, FUNC-335 |
| BR-307 | 1 | FUNC-336 |
| BR-308 | 5 | FUNC-337 → FUNC-341 |
| BR-309 | 4 | FUNC-342, FUNC-343, FUNC-344, FUNC-345 |
| BR-310 | 5 | FUNC-346 → FUNC-350 |
| BR-311 | 3 | FUNC-351, FUNC-352, FUNC-353 |
| BR-312 | 8 | FUNC-354 → FUNC-361 |
| BR-313 | 5 | FUNC-362 → FUNC-366 |
| BR-314 | 2 | FUNC-367, FUNC-368 |
| BR-315 | 3 | FUNC-369, FUNC-370, FUNC-371 |
| BR-316 | 1 | FUNC-372 |
| BR-317 | 6 | FUNC-373 → FUNC-378 |
| BR-318 | 5 | FUNC-379 → FUNC-383 |
| BR-319 | 3 | FUNC-384, FUNC-385, FUNC-386 |
| BR-320 | 3 | FUNC-387, FUNC-388, FUNC-389 |
| BR-321 | 2 | FUNC-390, FUNC-391 |
| BR-322 | 6 | FUNC-392 → FUNC-397 |
| BR-323 | 3 | FUNC-398, FUNC-399, FUNC-400 |
| BR-324 | 4 | FUNC-401 → FUNC-404 |
| BR-325 | 1 | FUNC-405 |
| BR-326 | 1 | FUNC-406 |
| BR-327 | 2 | FUNC-407, FUNC-408 |
| BR-328 | 2 | FUNC-409, FUNC-410 |
| BR-329 | 1 | FUNC-411 |
| BR-330 | 2 | FUNC-412, FUNC-413 |
| BR-331 | 2 | FUNC-414, FUNC-415 |
| BR-332 | 8 | FUNC-416 → FUNC-423 |
| BR-333 | 2 | FUNC-424, FUNC-425 |
| BR-334 | 4 | FUNC-426 → FUNC-429 |
| **Tổng** | **129** | **FUNC-301 … FUNC-429** |

---

## Các điểm "(chưa có nguồn)" và cờ `[cần xác nhận]` cần SME/BA Lead bổ sung

| # | Mã FUNC | Nội dung cần làm rõ |
|---|---|---|
| 1 | FUNC-327 | Quy ước cụ thể về danh sách đầu mối nhận BCAO (cấu hình bằng giao diện nào, ai có quyền cấu hình, có theo Carrier/sân bay không) — chưa có nguồn. |
| 2 | FUNC-334 | `[cần xác nhận tên hệ thống nguồn]` cung cấp dữ liệu phân biệt yếu nhân/chuyên cơ tự động (Khảo sát 09/06 §IV ghi nhận cần xác nhận). |
| 3 | FUNC-366 | Danh sách "các báo cáo phát sinh khác theo đặc thù nghiệp vụ OCC" — Đề xuất §II.3 nêu chung, chưa có danh mục cụ thể; cần SME bổ sung. |
| 4 | FUNC-367 | Mức cụ thể của 4 mục tiêu OTP/OSP — nguồn chỉ nêu ví dụ 80%; chưa có nguồn chính thức cho mỗi mục tiêu. |
| 5 | FUNC-371 | Chỉ số định lượng và tiêu chí "độ chính xác dữ liệu" — nguồn chỉ nêu khái niệm, chưa có công thức/ngưỡng cụ thể. |
| 6 | FUNC-372 | Tham số đầu vào, công thức, định dạng đầu ra của khuyến nghị Tankering Strategy — chưa có nguồn chi tiết trong §II.3; tham chiếu BR-413 ở phân hệ Master Data cần phối hợp. |
| 7 | FUNC-305 | Danh mục hãng trong nhóm hiện ghi "VN, 0V, BL" theo khảo sát; cần xác nhận có cố định hay cấu hình động theo Master Data Carrier. |
| 8 | FUNC-310 | Định nghĩa cụ thể nhóm "GTB" trong phân loại bất thường — nguồn không định nghĩa thuật ngữ; cần SME xác nhận. |
| 9 | FUNC-324 | Luồng phê duyệt BCAO chi tiết (số cấp, vai trò, thời gian) — nguồn chỉ nêu "phải được phê duyệt", chưa có luồng chi tiết. |
| 10 | FUNC-329 | Phạm vi quản lý danh mục nguyên nhân bất thường (theo Khảo sát 09/06 §IV ghi nhận "cần làm rõ nghiệp vụ và danh mục tham chiếu trước khi số hóa"). |
| 11 | FUNC-375 | `[cần xác nhận]` chế độ hiển thị mặc định của báo cáo Pallet Relief: hiển thị cả hai giá trị (Actual + OFP) song song với cột Delta, hay chỉ hiển thị cột Delta. Nguồn chỉ nêu "chấp nhận hiển thị cả hai giá trị hoặc chỉ delta" — chưa chốt mặc định. |
| 12 | FUNC-381 | `[cần xác nhận với SME]` Danh mục cụ thể các trường mặc định của FOS Report (nguồn chỉ nêu nguyên tắc "các trường màu xanh lá cây là mặc định chọn" — chưa liệt kê đầy đủ trường). |
| 13 | FUNC-389 | `[cần xác nhận]` Ngưỡng cảnh báo hiệu năng FOS Report (khoảng thời gian tối đa và/hoặc số lượng trường tối đa) chưa được nguồn nêu. |
| 14 | FUNC-390 | `[cần xác nhận]` Tần suất gửi mặc định, định dạng file đính kèm (PDF/Excel/Docx) của scheduled report — nguồn chỉ nêu nguyên tắc "tự động gửi báo cáo thường kỳ". |
| 15 | FUNC-396 | `[cần xác nhận]` Định nghĩa cụ thể 6 tỷ lệ (i) đến (vi) trong báo cáo ACARS Fuel Reliability — nguồn chỉ nêu quy ước màu, chưa định nghĩa từng tỷ lệ. |
| 16 | FUNC-397 | `[cần xác nhận]` Tiêu chí "illogical taxi fuel" và "illogical trip fuel" — nguồn chỉ nêu yêu cầu highlight, chưa định nghĩa công thức/ngưỡng. |
| 17 | FUNC-405 | Phương pháp tính, ngưỡng đánh giá, biểu đồ thể hiện của báo cáo Schedule Robustness (chưa có nguồn — cần SME bổ sung). |
| 18 | FUNC-411 | Tiêu chí, các cột hiển thị, ngưỡng vượt cụ thể của báo cáo MTOW Exceed (chưa có nguồn — cần SME bổ sung). |
| 19 | FUNC-414, FUNC-415 | `[cần xác nhận tên đầy đủ và đối tượng nhận]` của FORM D và FORM E; cấu trúc + trường dữ liệu cụ thể (chưa có nguồn — cần SME bổ sung). |
| 20 | FUNC-416 → FUNC-423 | `[cần xác nhận với SME Tuấn Dương]` Toàn bộ 8 báo cáo nhóm sai lệch tải / thời gian (BR-332): công thức cụ thể, rule mốc thời gian nhập tải, rule upload MO, định nghĩa ngưỡng "chênh quá nhiều" — nguồn chỉ ghi nhận "Hỏi Tuấn Dương" hoặc "Đặt lịch làm việc với Ban TTHH". |
| 21 | FUNC-425 | `[cần xác nhận]` Tần suất xuất file Flight List for Backup Tool ra SFTP, đường dẫn SFTP cụ thể, định dạng tên file (chưa có nguồn). |

> **Ghi chú:** Tất cả các điểm nêu trên cần được BA Lead/SME làm rõ trong các buổi khảo sát kế tiếp trước khi chuyển sang đặc tả chi tiết Use Case / User Story trong SRS.
