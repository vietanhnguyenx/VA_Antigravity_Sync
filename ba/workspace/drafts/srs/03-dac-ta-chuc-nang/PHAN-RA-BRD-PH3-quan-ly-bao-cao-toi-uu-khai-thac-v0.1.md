---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-11"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH3"
parent_document: "BRD-TOSS-001 §7.3"
subsystem: "Phân hệ 3 — Quản lý báo cáo, đánh giá tối ưu khai thác"
---

# Phân rã Yêu cầu nghiệp vụ → Yêu cầu chức năng — Phân hệ 3

## Mục đích và nguyên tắc

Tài liệu này phân rã các Yêu cầu nghiệp vụ (BR — Business Requirement) BR-301 … BR-316 thuộc §7.3 của Khung BRD `BRD-TOSS-001` xuống lớp Yêu cầu chức năng (FUNC — Functional Requirement), tuân thủ tuyệt đối nguyên tắc tại CLAUDE.md §0:

- Chỉ **phân rã + lắp ráp trung thực** theo nguồn đã trích dẫn; **không suy diễn**, không bịa chỉ số/loại báo cáo ngoài nguồn.
- Mỗi FUNC nêu rõ **BR cha** và **nguồn** (file/mục cụ thể).
- Khi nguồn không nêu đủ chi tiết (luồng, ngưỡng, định dạng, đầu mối, danh mục…) sẽ gắn cờ "(chưa có nguồn — cần SME bổ sung)" hoặc `[cần xác nhận]` cho người (BA Lead/SME) bổ sung.

**Nguồn được phân rã:**

1. Khung BRD: `ba/workspace/drafts/brd/BRD-TOSS-001-khung-v0.1.md` §7.3.
2. Đề xuất giải pháp kỹ thuật — Phân hệ 3 (chi tiết các loại báo cáo): `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/03-phan-he-quan-ly-bao-cao-danh-gia-toi-uu-khai-thac.md`.
3. Báo cáo khảo sát ngày 09/06/2026: `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.1.md` §II.7 (BCAO), §II.8 (giám sát dữ liệu, quản lý mục tiêu).
4. Báo cáo khảo sát ngày 08/06/2026: `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.1.md` §II.4 (báo cáo, phát hành qua thư điện tử, không ký số).

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
| **Tổng** | **72** | **FUNC-301 … FUNC-372** |

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

> **Ghi chú:** Tất cả các điểm nêu trên cần được BA Lead/SME làm rõ trong các buổi khảo sát kế tiếp trước khi chuyển sang đặc tả chi tiết Use Case / User Story trong SRS.
