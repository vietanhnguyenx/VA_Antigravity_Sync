---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-11"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH4"
parent_document: "BRD-TOSS-001"
parent_section: "§7.4 Phân hệ 4 — Quản lý danh mục (Master Data)"
---

# Phân rã Yêu cầu nghiệp vụ (BR) xuống Yêu cầu chức năng (FUNC) — Phân hệ 4: Quản lý danh mục (Master Data)

## Mục đích và phạm vi

Tài liệu phân rã trung thực các Yêu cầu nghiệp vụ (BR — Business Requirement) thuộc **Phân hệ 4 — Quản lý danh mục (Master Data)** đã ghi nhận tại `BRD-TOSS-001-khung-v0.1.md` §7.4 (BR-401 … BR-416) xuống lớp **Yêu cầu chức năng (FUNC — Functional Requirement)**. Mỗi FUNC bám sát nội dung nguồn đã được trích dẫn, không suy diễn ngoài nguồn, không bịa thêm danh mục/thuộc tính.

## Nguyên tắc phân rã (CLAUDE.md §0 — bắt buộc)

1. **Chỉ phân rã và lắp ráp trung thực** từ nội dung do con người đã ghi nhận (Đề xuất giải pháp kỹ thuật v0.3 §II.4; Báo cáo khảo sát 09/06/2026 §II.1, II.5, II.6; BRD-TOSS-001 §7.4). Không suy diễn, không "hoàn thiện" logic, không bịa danh mục/thuộc tính.
2. **Mỗi FUNC truy vết về một BR cha** thuộc Phân hệ 4 và trích nguồn cụ thể (tài liệu, mục, trang/đoạn).
3. **Khi nguồn không bao phủ một khía cạnh nào**, ghi "(chưa có nguồn — cần SME bổ sung)" thay vì tự sinh nội dung.
4. **Bảo toàn các cờ `[cần xác nhận]`** đã có ở BR cha (ví dụ: Damp Lease trong BR-405).
5. **Thuật ngữ kỹ thuật** giữ tiếng Anh trong ngoặc đơn ở lần xuất hiện đầu tiên.

## Nguồn nguyên thủy đã đối chiếu

| Mã nguồn | Tài liệu | Mục đã đọc |
|---|---|---|
| NG-1 | `BRD-TOSS-001-khung-v0.1.md` | §7.4 — BR-401 … BR-416 |
| NG-2 | `vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/04-phan-he-quan-ly-danh-muc.md` (Đề xuất §II.4, trang 18–20) | Toàn bộ |
| NG-3 | `BAO-CAO-KHAO-SAT-09062026-v0.1.md` | §II.1 Cây menu và danh mục chức năng; §II.5 Quản lý tàu bay; §II.6 Quản lý sân bay và cảnh báo dịch vụ |

---

## 1. Bảng phân rã BR → FUNC

### 1.1 BR-401 — Tổ chức phân hệ danh mục tách biệt (Single Source of Truth)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-401-01 | Tổ chức phân hệ Quản lý danh mục thành module riêng, tách biệt với các module nghiệp vụ, đóng vai trò nguồn sự thật duy nhất (Single Source of Truth) cho dữ liệu danh mục dùng chung của hệ thống. | BR-401 | NG-2 §II.4 đoạn mở đầu; NG-1 §7.4 BR-401 |
| FUNC-401-02 | Bố trí phần bảo trì danh mục thành một menu riêng, đặt cùng cấp với menu quản trị hệ thống và menu giám sát dữ liệu, do khối lượng dữ liệu danh mục lớn. | BR-401 | NG-3 §II.1 (Kết quả: thống nhất tách bảo trì danh mục thành menu riêng); NG-1 §7.4 BR-401 |

### 1.2 BR-402 — Cấu trúc Metadata chuẩn cho mọi danh mục

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-402-01 | Định nghĩa mọi bản ghi danh mục theo cấu trúc Metadata chuẩn hóa thống nhất toàn hệ thống. | BR-402 | NG-2 §II.4 — Cấu trúc Metadata chuẩn |
| FUNC-402-02 | Cho phép phân loại bản ghi danh mục theo lĩnh vực, theo nghiệp vụ, hoặc theo hệ thống sử dụng để tối ưu hóa việc quản lý. | BR-402 | NG-2 §II.4 — Cấu trúc Metadata chuẩn |

### 1.3 BR-403 — Quản lý phiên bản (Versioning) cho từng bản ghi danh mục

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-403-01 | Lưu trữ đầy đủ lịch sử thay đổi cho từng bản ghi danh mục, ghi nhận: ai thay đổi, nội dung thay đổi là gì, thời điểm cập nhật. | BR-403 | NG-2 §II.4 — Quản lý phiên bản (Versioning) |
| FUNC-403-02 | Cho phép truy xuất trạng thái dữ liệu danh mục tại bất kỳ thời điểm nào trong quá khứ. | BR-403 | NG-2 §II.4 — Quản lý phiên bản (Versioning) |

### 1.4 BR-404 — Đồng bộ chủ động qua API/Webhook và phân quyền truy cập

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-404-01 | Cung cấp và đẩy dữ liệu danh mục cho các hệ thống vệ tinh qua API. | BR-404 | NG-2 §II.4 — Đồng bộ hóa dữ liệu chủ động |
| FUNC-404-02 | Cung cấp và đẩy dữ liệu danh mục qua cơ chế Webhook ngay khi phát sinh thay đổi. | BR-404 | NG-2 §II.4 — Đồng bộ hóa dữ liệu chủ động |
| FUNC-404-03 | Thiết lập quyền truy cập và khai thác dữ liệu danh mục chi tiết theo từng hệ thống sử dụng hoặc từng nhóm người dùng cụ thể. | BR-404 | NG-2 §II.4 — Phân quyền dữ liệu |
| FUNC-404-04 | Đồng bộ dữ liệu danh mục tự động hằng ngày theo lịch định kỳ. | BR-404 | NG-3 §II.1 (VNA: danh mục là lớp dữ liệu cơ sở, đồng bộ tự động hằng ngày) |

### 1.5 BR-405 — Danh mục Tàu bay: định danh, sở hữu/thuê và lịch sử khai thác

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-405-01 | Quản lý nhóm thuộc tính định danh tàu bay: số đăng ký, loại tàu bay theo mã ICAO/IATA, trọng tải, chủ sở hữu. | BR-405 | NG-2 §II.4 — Thông tin định danh |
| FUNC-405-02 | Quản lý nhóm thuộc tính mã nhận dạng quốc tế của tàu bay: IATA Designator và ICAO Designator. | BR-405 | NG-3 §II.5 (VNA — các thuộc tính cần quản lý) |
| FUNC-405-03 | Quản lý hình thức thuê/mua của tàu bay theo danh mục: sở hữu, thuê khô (Dry Lease), thuê ướt (Wet Lease), thuê ướt kết hợp (Damp Lease) `[cần xác nhận]` — trong đó với Damp Lease bên cho thuê cung cấp toàn bộ trừ nhiên liệu, VNA tự cấp nhiên liệu cho tàu đó. | BR-405 | NG-3 §II.5 (VNA — hình thức sở hữu); NG-1 §7.4 BR-405 (giữ cờ `[cần xác nhận]`) |
| FUNC-405-04 | Quản lý thời điểm hiệu lực khai thác của tàu bay theo từng giai đoạn. | BR-405 | NG-2 §II.4 — Thông tin định danh |
| FUNC-405-05 | Quản lý tàu bay theo lịch sử khai thác: cho phép một tàu vào/ra đội bay nhiều lần và thay đổi cấu hình khoang theo từng giai đoạn. | BR-405 | NG-3 §II.5 (VNA — mỗi tàu cần quản lý theo lịch sử khai thác) |

### 1.6 BR-406 — Thuộc tính khai thác tàu bay và phân nhóm đội tàu

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-406-01 | Quản lý cấu hình khoang của tàu bay. | BR-406 | NG-3 §II.5 (VNA — các thuộc tính cần quản lý) |
| FUNC-406-02 | Quản lý dung tích thùng nhiên liệu và dung tích thùng nước của tàu bay. | BR-406 | NG-3 §II.5 |
| FUNC-406-03 | Quản lý khoang hàng của tàu bay. | BR-406 | NG-3 §II.5 |
| FUNC-406-04 | Cho phép định nghĩa nhóm đội tàu phục vụ báo cáo, theo cơ chế mỗi tàu chỉ được gán vào duy nhất một nhóm tại một thời điểm. | BR-406 | NG-3 §II.5 (VTIT — cơ chế định nghĩa nhóm đội tàu để mỗi tàu chỉ gán một lần); NG-1 §7.4 BR-406 |

### 1.7 BR-407 — Master MEL và đồng bộ MEL/CDL, defects từ AMOS

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-407-01 | Quản lý Master MEL (Master Minimum Equipment List) làm danh mục chuẩn cho toàn hệ thống. | BR-407 | NG-2 §II.4 — Tình trạng kỹ thuật & MEL/CDL |
| FUNC-407-02 | Đồng bộ thông tin MEL/CDL và hỏng hóc (defects) từ hệ thống AMOS về phân hệ danh mục. | BR-407 | NG-2 §II.4 — Tình trạng kỹ thuật & MEL/CDL |
| FUNC-407-03 | Cho phép lọc danh sách lỗi theo nhóm ảnh hưởng: phi công, tiếp viên, thợ máy. | BR-407 | NG-2 §II.4 |
| FUNC-407-04 | Tự động làm nổi bật (highlight) các MEL/lỗi mới phát sinh. | BR-407 | NG-2 §II.4 |
| FUNC-407-05 | Cho phép người dùng nhập ghi chú tính chất ảnh hưởng của MEL đối với khai thác. | BR-407 | NG-2 §II.4 |
| FUNC-407-06 | Cung cấp liên kết xem trực tiếp tài liệu MEL hiện hành từ bản ghi MEL. | BR-407 | NG-2 §II.4 |

### 1.8 BR-408 — Chỉ số PF (Performance Factor)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-408-01 | Cho phép thu nạp file dữ liệu từ các đội tàu để tính toán chỉ số PF thực tế. | BR-408 | NG-2 §II.4 — Chỉ số hiệu suất (PF) |
| FUNC-408-02 | Tính PF từ điện văn ACARS đối với các tàu có nguồn dữ liệu này. | BR-408 | NG-1 §7.4 BR-408 |
| FUNC-408-03 | Áp dụng PF của kỳ trước cho các tàu thiếu dữ liệu tính toán trong kỳ hiện tại. | BR-408 | NG-1 §7.4 BR-408 |
| FUNC-408-04 | Lưu trữ lịch sử cập nhật PF cho từng tàu theo các kỳ tính toán. | BR-408 | NG-2 §II.4 — Chỉ số hiệu suất (PF) |
| FUNC-408-05 | Thống kê biến động PF của tàu bay theo thời gian. | BR-408 | NG-2 §II.4 |
| FUNC-408-06 | Cảnh báo các tàu bay thiếu dữ liệu tính toán PF. | BR-408 | NG-2 §II.4 |

### 1.9 BR-409 — Giới hạn chu kỳ bay (FC), lịch bảo dưỡng và AOG

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-409-01 | Theo dõi giới hạn chu kỳ bay (FC — Flight Cycle) cho từng tàu bay. | BR-409 | NG-2 §II.4 — Giới hạn khai thác |
| FUNC-409-02 | Theo dõi lịch bảo dưỡng ngắn hạn và lịch bảo dưỡng dài hạn cho từng tàu bay. | BR-409 | NG-2 §II.4 — Giới hạn khai thác |
| FUNC-409-03 | Theo dõi tình trạng AOG (Aircraft on Ground) và dự kiến thời gian khắc phục. | BR-409 | NG-2 §II.4 — Giới hạn khai thác |
| FUNC-409-04 | Cảnh báo khi tàu bay tiến gần giới hạn FC. | BR-409 | NG-1 §7.4 BR-409 |

### 1.10 BR-410 — Danh mục Sân bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-410-01 | Quản lý nhóm thuộc tính định danh sân bay: mã ICAO và mã IATA. | BR-410 | NG-2 §II.4 — Thông tin hạ tầng |
| FUNC-410-02 | Quản lý nhóm thuộc tính hạ tầng sân bay: hệ thống đường băng, đường lăn, bãi đỗ. | BR-410 | NG-2 §II.4 — Thông tin hạ tầng |
| FUNC-410-03 | Quản lý nhóm trang thiết bị hỗ trợ cất hạ cánh tại sân bay. | BR-410 | NG-2 §II.4 — Thông tin hạ tầng |
| FUNC-410-04 | Quản lý nhóm thuộc tính khí tượng và tiêu chuẩn tối thiểu (Minima) của sân bay. | BR-410 | NG-2 §II.4 — Khí tượng & Minima |
| FUNC-410-05 | Cung cấp chức năng tra cứu thời tiết (WX) gắn với từng sân bay. | BR-410 | NG-2 §II.4 — Khí tượng & Minima |
| FUNC-410-06 | Quản lý các đặc điểm địa hình đặc thù của sân bay. | BR-410 | NG-2 §II.4 — Khí tượng & Minima |
| FUNC-410-07 | Quản lý các thủ tục bay theo sân bay: SID, STAR, IAP. | BR-410 | NG-2 §II.4 — Dịch vụ & Thủ tục |
| FUNC-410-08 | Quản lý quy định về Slot, phép bay và khung giờ khai thác của sân bay. | BR-410 | NG-2 §II.4 — Dịch vụ & Thủ tục |
| FUNC-410-09 | Quản lý khả năng phục vụ mặt đất tại sân bay: nhiên liệu, kỹ thuật, điện mặt đất. | BR-410 | NG-2 §II.4 — Dịch vụ & Thủ tục |
| FUNC-410-10 | Cập nhật NOTAM liên quan đến sân bay. | BR-410 | NG-2 §II.4 — Chi phí & An toàn |
| FUNC-410-11 | Cập nhật tình hình an ninh tại sân bay. | BR-410 | NG-2 §II.4 — Chi phí & An toàn |
| FUNC-410-12 | Quản lý các loại phí khai thác thương mại của sân bay: phí cất hạ cánh, phí tiếng ồn. | BR-410 | NG-2 §II.4 — Chi phí & An toàn |

### 1.11 BR-411 — Danh mục dịch vụ sân bay phục vụ cảnh báo

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-411-01 | Quản lý danh mục dịch vụ sân bay để ghi nhận năng lực phục vụ của từng sân bay (ví dụ: sân bay không hỗ trợ tàu hỏng động cơ phụ trợ — APU). | BR-411 | NG-3 §II.6 (VNA — cần danh mục dịch vụ sân bay để ghi nhận năng lực phục vụ) |
| FUNC-411-02 | Cung cấp cơ chế cảnh báo dựa trên danh mục dịch vụ sân bay, hỗ trợ điều hành đổi tàu khi cần. | BR-411 | NG-3 §II.6 (VTIT — xây danh mục và cơ chế cảnh báo, hỗ trợ điều hành đổi tàu) |

### 1.12 BR-412 — Danh mục chặng bay (Route & Optimization)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-412-01 | Quản lý thông tin chặng bay: điểm đi, điểm đến, khoảng cách (GCD — Great Circle Distance). | BR-412 | NG-2 §II.4 — Thông tin chặng bay |
| FUNC-412-02 | Quản lý chỉ số chi phí (Cost Index) gắn với chặng bay. | BR-412 | NG-2 §II.4 — Thông tin chặng bay |
| FUNC-412-03 | Quản lý nhiên liệu dự phòng (Final Reserve) cho chặng bay. | BR-412 | NG-2 §II.4 — Thông tin chặng bay |
| FUNC-412-04 | Quản lý thông tin EDTO (Extended Diversion Time Operations) cho chặng bay. | BR-412 | NG-2 §II.4 — Thông tin chặng bay |
| FUNC-412-05 | Quản lý và lưu trữ dữ liệu chi phí điều hành bay, chi phí bay qua theo từng giai đoạn. | BR-412 | NG-2 §II.4 — Chi phí hành lang bay |
| FUNC-412-06 | Quản lý và lưu trữ các tệp thông tin MCMR theo từng giai đoạn. | BR-412 | NG-2 §II.4 — Chi phí hành lang bay |

### 1.13 BR-413 — Quy tắc Tankering

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-413-01 | Thu nạp dữ liệu giá nhiên liệu phục vụ tính toán khuyến nghị Tankering. | BR-413 | NG-2 §II.4 — Quy tắc Tankering |
| FUNC-413-02 | Tính toán khuyến nghị Tankering dựa trên hiệu quả chi phí cho từng giai đoạn. | BR-413 | NG-2 §II.4 — Quy tắc Tankering |
| FUNC-413-03 | Cho phép cập nhật linh hoạt các chặng bay và loại tàu bay áp dụng Tankering. | BR-413 | NG-2 §II.4 — Quy tắc Tankering |
| FUNC-413-04 | Xuất dữ liệu khuyến nghị Tankering theo thời gian hiệu lực. | BR-413 | NG-2 §II.4 — Quy tắc Tankering |

### 1.14 BR-414 — Danh mục bổ trợ

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-414-01 | Quản lý danh sách phi công. | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-02 | Quản lý danh sách tiếp viên. | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-03 | Quản lý danh sách quốc gia. | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-04 | Quản lý danh sách FIR (Flight Information Region). | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-05 | Quản lý danh mục đơn vị ULD (Unit Load Device). | BR-414 | NG-2 §II.4 — Danh mục nhân sự & Hành chính |
| FUNC-414-06 | Thiết lập danh sách email linh hoạt để hệ thống gửi thông báo tự động. | BR-414 | NG-2 §II.4 — Quản trị liên lạc |

### 1.15 BR-415 — Cấu hình tham số vận hành

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-415-01 | Cấu hình hệ số độ tin cậy chuyến bay (%) làm tham số tính toán. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-02 | Cấu hình ngưỡng chênh lệch nhiên liệu nạp giữa yêu cầu của phi công và kế hoạch. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-03 | Cấu hình ngưỡng chênh lệch trọng tải. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-04 | Cấu hình quy định thời gian (deadline) lập OFP cho chuyến bay quốc tế và chuyến bay quốc nội. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-05 | Cấu hình thời gian cảnh báo thiếu tài liệu chuyến bay. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |
| FUNC-415-06 | Cho phép người dùng có thẩm quyền cập nhật trực tiếp các tham số nói trên trên giao diện khi có thay đổi nghiệp vụ. | BR-415 | NG-2 §II.4 — Tham số vận hành hệ thống |

### 1.16 BR-416 — Hệ số quy đổi đơn vị nhiên liệu trong điện văn

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-416-01 | Quản lý hệ số quy đổi đơn vị nhiên liệu trong điện văn từ tàu bay, có hiệu lực theo từng giai đoạn (do đơn vị nhiên liệu có thể thay đổi theo giai đoạn). | BR-416 | NG-3 §II.5 (VTIT — đơn vị nhiên liệu trong điện văn có thể đổi theo giai đoạn, cần hệ số quy đổi về cùng đơn vị chuẩn theo thời gian hiệu lực) |
| FUNC-416-02 | Cho phép hệ số quy đổi đơn vị nhiên liệu được cấu hình theo từng tàu bay cụ thể. | BR-416 | NG-1 §7.4 BR-416 (hệ số quy đổi… theo từng tàu) |

---

## 2. Ma trận truy vết BR → FUNC

| BR | Số FUNC | Danh sách FUNC |
|---|---|---|
| BR-401 | 2 | FUNC-401-01, FUNC-401-02 |
| BR-402 | 2 | FUNC-402-01, FUNC-402-02 |
| BR-403 | 2 | FUNC-403-01, FUNC-403-02 |
| BR-404 | 4 | FUNC-404-01, FUNC-404-02, FUNC-404-03, FUNC-404-04 |
| BR-405 | 5 | FUNC-405-01, FUNC-405-02, FUNC-405-03, FUNC-405-04, FUNC-405-05 |
| BR-406 | 4 | FUNC-406-01, FUNC-406-02, FUNC-406-03, FUNC-406-04 |
| BR-407 | 6 | FUNC-407-01 … FUNC-407-06 |
| BR-408 | 6 | FUNC-408-01 … FUNC-408-06 |
| BR-409 | 4 | FUNC-409-01 … FUNC-409-04 |
| BR-410 | 12 | FUNC-410-01 … FUNC-410-12 |
| BR-411 | 2 | FUNC-411-01, FUNC-411-02 |
| BR-412 | 6 | FUNC-412-01 … FUNC-412-06 |
| BR-413 | 4 | FUNC-413-01 … FUNC-413-04 |
| BR-414 | 6 | FUNC-414-01 … FUNC-414-06 |
| BR-415 | 6 | FUNC-415-01 … FUNC-415-06 |
| BR-416 | 2 | FUNC-416-01, FUNC-416-02 |
| **Tổng** | **73** | — |

---

## 3. Danh sách "(chưa có nguồn — cần SME bổ sung)" và cờ `[cần xác nhận]`

### 3.1 Cờ `[cần xác nhận]` được bảo toàn từ BR cha

| FUNC | Cờ | Nội dung cần xác nhận | Nguồn cờ |
|---|---|---|---|
| FUNC-405-03 | `[cần xác nhận]` | Hình thức "thuê ướt kết hợp (Damp Lease)" — tên gọi tiếng Việt chính thức, quy ước hạch toán, và đặc biệt phạm vi xử lý phần nhiên liệu VNA tự cấp cho tàu thuê ướt kết hợp (xem BRD-TOSS-001 §5.3 phạm vi cần làm rõ). | NG-1 §7.4 BR-405 |

### 3.2 Hạng mục "(chưa có nguồn — cần SME bổ sung)"

Trong phạm vi Phân hệ 4, các BR-401 … BR-416 đã có nguồn trích dẫn rõ ràng từ NG-1/NG-2/NG-3; chưa phát sinh FUNC nào thuộc dạng "(chưa có nguồn — cần SME bổ sung)" tại đợt phân rã v0.1. Một số khía cạnh đã được nhận diện thuộc nhóm "cần làm rõ ở các đợt khảo sát kế tiếp" nhưng KHÔNG được tạo thành FUNC giả định trong tài liệu này (tuân thủ §0 — không suy diễn):

| Khía cạnh chưa được nguồn mô tả đủ để phân rã thành FUNC ở v0.1 | BR liên quan | Ghi chú |
|---|---|---|
| Quy ước cụ thể của "cấu trúc Metadata chuẩn" (các trường metadata bắt buộc, kiểu dữ liệu, ràng buộc) | BR-402 | Nguồn mới nêu nguyên tắc; cần SME bổ sung chuẩn metadata cụ thể trước khi phân rã sâu hơn. |
| Danh sách hệ thống vệ tinh sẽ tiêu thụ dữ liệu danh mục qua API/Webhook và hợp đồng dữ liệu (data contract) | BR-404 | Phụ thuộc tài liệu tích hợp (Phân tích YCKT v0.1 §3 và tài liệu API Gateway) — sẽ phân rã ở SRS phân hệ tích hợp. |
| Bộ trường thuộc tính chi tiết của các nhóm (đường băng, đường lăn, Minima, SID/STAR/IAP, Slot…) trong danh mục Sân bay | BR-410 | Nguồn chỉ nêu nhóm thuộc tính; bộ trường chi tiết cần SME hàng không bổ sung trước khi xuống mức trường dữ liệu. |
| Bộ trường thuộc tính chi tiết của Master MEL (cấu trúc bản ghi MEL chuẩn) | BR-407 | Nguồn nêu "quản lý Master MEL" nhưng chưa liệt kê trường; cần SME kỹ thuật bổ sung. |
| Định nghĩa cụ thể của "khuyến nghị Tankering" (công thức, đầu vào, đầu ra hiển thị) | BR-413 | Nguồn nêu nguyên tắc theo hiệu quả chi phí; công thức cụ thể cần SME. |
| Danh sách tham số vận hành đầy đủ ngoài 5 tham số đã nêu (BR-415) | BR-415 | Nguồn liệt kê 5 tham số làm ví dụ "như"; có thể phát sinh thêm khi phân rã các phân hệ khác. |

### 3.3 Tham chiếu phạm vi cần làm rõ ở BRD §5.3

- "Phương án khi hệ thống lập kế hoạch bay không cho phép tích hợp trực tiếp" — không thuộc Phân hệ 4 nhưng có ảnh hưởng tới FUNC-404 (đồng bộ chủ động) nếu Lido không cho phép kết nối API.
- "Phạm vi xử lý phần nhiên liệu VNA tự cấp cho tàu thuê ướt kết hợp (Damp Lease)" — liên quan trực tiếp FUNC-405-03; cần làm rõ trước khi phân rã FUNC này xuống mức quy trình hạch toán.

---

*Phiên bản 0.1 — 2026-06-11 — BA Lead — Khởi tạo phân rã FUNC cho Phân hệ 4 (BR-401 … BR-416) từ BRD-TOSS-001 §7.4, Đề xuất §II.4 và Khảo sát 09/06/2026 §II.1, II.5, II.6.*
