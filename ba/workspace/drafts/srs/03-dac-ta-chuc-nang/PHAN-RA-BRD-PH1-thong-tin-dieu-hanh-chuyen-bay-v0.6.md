---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.6"
date: "2026-06-18"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH1"
---

# Phân rã BRD §7.1 → Yêu cầu chức năng (FUNC) — Phân hệ 1: Thông tin điều hành chuyến bay

> **Nguyên tắc tối thượng (CLAUDE.md §0):** Tài liệu này chỉ **phân rã + lắp ráp trung thực** các yêu cầu nghiệp vụ (BR) đã được ghi nhận trong nguồn. Tuyệt đối không suy diễn, không bịa chức năng, không tự "hoàn thiện" logic mà nguồn chưa nêu. Mỗi yêu cầu chức năng (FUNC — Functional Requirement) được phân rã đều phải truy vết về **BR cha** và **trích nguồn gốc** (file + mục §). Khi nguồn không cung cấp đủ chi tiết, ghi rõ **"(chưa có nguồn — cần SME bổ sung)"** thay vì tự điền.
>
> **Phạm vi tài liệu (v0.6):** Phân hệ 1 — Thông tin điều hành chuyến bay (BR-101 … BR-150, theo `BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.2.md`; §7.1 từ `BRD-TOSS-001-khung-v0.7.md`). Phân rã ở mức **chức năng (FUNC)** — cụ thể hơn BR nhưng **chưa** tới mức Trường hợp sử dụng (UC — Use Case), màn hình hoặc trường dữ liệu chi tiết. Các tầng đó sẽ được làm tại SRS/FRD kế tiếp. **Riêng v0.6** bổ sung §2.51 — đặc tả chi tiết các **cột màn Flight Dispatch (Flight monitoring) đã rõ nguồn**, kèm **Tiêu chí chấp nhận (AC — Acceptance Criteria)** chép trung thực logic màu/ngưỡng từ sheet Function list và báo cáo khảo sát.
>
> **Quy ước đánh số:** `FUNC-1xx` cho Phân hệ 1 (1xx — lớp 100).
>
> **Lịch sử thay đổi:**
> - v0.1 (2026-06-11): khởi tạo phân rã FUNC-101 … FUNC-188 cho BR-101 … BR-119.
> - v0.2 (2026-06-12): bổ sung FUNC-189 … FUNC-214 cho các BR mới BR-120 … BR-126 (lệch tải OFP/CLC; NAIL/CDL; chứng chỉ tổ bay theo sân bay; đổi tổ bay; PAX time; Monitoring overview real-time qua ACARS; Flight Type Code/STS-HEAD) từ Khảo sát 11/06 buổi sáng (§II.8, II.10, II.12, II.13) và Khảo sát 11/06 buổi chiều (§II.2, II.6). Cập nhật tham chiếu BRD sang `BRD-TOSS-001-khung-v0.2.md`. Cập nhật bảng truy vết BR → FUNC và các danh sách FUNC "(chưa có nguồn)" / cờ `[cần xác nhận]`.
> - v0.3 (2026-06-12): bổ sung FUNC-215 … FUNC-235 cho các BR mới BR-127 … BR-132 từ bottom-up YCKT V3 + sheet-08 "Cảnh báo & Tham số": cảnh báo đã filed ATC FPL (BR-127), cảnh báo TAT không đủ (BR-128), Airport Constraints / Slot / curfew (BR-129), tự kiểm tra bất thường lịch bay thay công cụ Excel của Tổ Lịch Bay (BR-130), AC APU INOP đến sân không có GPU/ASU/ACU (BR-131), bật/tắt cảnh báo hai cấp (BR-132). Cập nhật tham chiếu BRD sang `BRD-TOSS-001-khung-v0.4.md`. Cập nhật bảng truy vết BR → FUNC và các danh sách FUNC "(chưa có nguồn)" / cờ `[cần xác nhận]`.
> - v0.4 (2026-06-12): bổ sung cột "Dữ liệu liên quan" cho các FUNC thuộc nhóm màn hình giám sát điều phái — BR-112 (dashboard tài liệu chuyến: FUNC-139…143), BR-113 (hai nhóm màn giám sát: FUNC-144, 145, 146), BR-114 (màn hình tập trung kiểm tra đầu ca: FUNC-148…159), BR-125 (Monitoring overview real-time: FUNC-204…210). Cột mới bám theo nhóm trường FOS Report (sheet-09) và Đề xuất §II.1; các trường/thực thể chưa có nguồn rõ giữ cờ `[cần xác nhận]`. Không thêm/bớt FUNC; bảng truy vết, danh sách "(chưa có nguồn)" và cờ `[cần xác nhận]` giữ nguyên.
> - v0.5 (2026-06-12): bổ sung FUNC-236 … FUNC-271 cho 18 BR mới BR-133 … BR-150 (Khảo sát 12/06 — thiết kế màn Giám sát chuyến bay & màn chi tiết Flight Detail trên bản mẫu `dsp_monitoring_poc.html`): Flight Detail tab model (BR-133…135), Flight Number 3 cột Netline + leg history (BR-136/137), bộ 4 mã màu thống nhất + tô màu ô + xanh-sau-đỏ + đổi màu tự động (BR-138…140), phân quyền 2 lớp + profile cá nhân + quy ước UI (BR-141…143), logic cột REG/Dispatch Release/Flight Number(D-Z)/ETA-IN (BR-144…147), time window + Flight Watch/"vào gate chậm" (BR-148/149), format lịch sử đổi chung (BR-150). Cập nhật tham chiếu BRD sang `BRD-TOSS-001-khung-v0.5.md`. Cập nhật bảng truy vết BR → FUNC, tổng, và danh sách "(chưa có nguồn)" / cờ `[cần xác nhận]`. Đính chính ASR "off cộng cộng" = Ops++ (FUNC liên quan BR-146).
> - v0.6 (2026-06-18): bổ sung FUNC-277 … FUNC-294 (§2.51) — phân rã chi tiết **các cột màn Flight Dispatch (Flight monitoring) đã rõ nguồn** từ `wf-monitoring-overview.md` §8 (sheet Function list `[FL-FD]`) + §9 (đối chiếu YCKT TOSS-175…182 + báo cáo KS 11/06, 12/06, 15/06): DSP Release (FUNC-277/278), OFP DSP (FUNC-279/280), Pilot release (FUNC-281/282), Flight Type (FUNC-283/284), BLOCK FUEL (FUNC-285), PILOT EXTRA (FUNC-286/287), NOTAM (FUNC-288/289/290), WX (FUNC-291/292), MEL/CDL (FUNC-293), Missing Document (FUNC-294). Mỗi FUNC kèm **Tiêu chí chấp nhận (AC)** chép trung thực logic màu/ngưỡng. **Các cột còn vướng cờ OID mở** (ATC, TO/LD, Taxi APU — KS-70; EPLD, EST DOW — KS-71; ZFW-DOW; 6 cột TOSS-180 — KS-76; Filter 1–20 — KS-72; tooltip hover — KS-74; Details cột khác — KS-75) **chưa phân rã FUNC** — xem §2.51.0. Cập nhật bảng truy vết BR → FUNC, tổng (176 → 194), danh sách "(chưa có nguồn)" / cờ `[cần xác nhận]`.

---

## 1. Phạm vi & quy ước

- **Nguồn chính:**
  - `ba/workspace/drafts/brd/BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.2.md` — danh sách BR-101 … BR-150 (§7.1 từ `BRD-TOSS-001-khung-v0.7.md`).
  - `ba/workspace/drafts/wireframe/PH1/wf-monitoring-overview.md` §8 (đặc tả 26 cột theo sheet Function list `[FL-FD]`) + §9 (đối chiếu/bổ sung từ YCKT TOSS-175…182 + báo cáo KS 11/06, 12/06, 15/06; ánh xạ cột↔FUNC; trạng thái 12 cờ §8 + 7 cờ §9) — **nguồn chính của §2.51 (v0.6)**.
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md` §II (chủ đề 1–13), §III (24 nội dung thống nhất) — nguồn BR-133 … BR-150.
  - `ba/workspace/drafts/phan-tich/yckt-trien-khai/sheet-08-cảnh-báo-tham-số.md` — sheet "Cảnh báo & Tham số" (BR-127 filed ATC, BR-128 TAT, BR-131 APU INOP, BR-132 bật/tắt cảnh báo hai cấp).
  - `ba/workspace/drafts/phan-tich/yckt-trien-khai/sheet-04-yckt-v3.md` dòng 374 (Airport Constraints — BR-129), dòng 376 (tự kiểm tra bất thường lịch bay — BR-130), dòng 167 (AC APU INOP / TOSS-126/127 — BR-131).
  - `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/01-phan-he-thong-tin-dieu-hanh-chuyen-bay.md` — bóc tách §II.1 Đề xuất giải pháp kỹ thuật v0.3.
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md` §II.4–II.7 (kiểm tra đầu ca, OSP, Divert, NOTAM, thời tiết) và §II.8, II.10, II.12, II.13 (lệch tải OFP/CLC, NAIL/CDL, chứng chỉ tổ bay theo sân bay, APU/PAX time — bổ sung v0.2).
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md` §II.2 (Flight Type Code, STS/HEAD) và §II.6 (Monitoring real-time qua ACARS) — bổ sung v0.2.
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-15062026-v0.1.md` §II.2 (cửa sổ release Dispatch / Pilot; ngưỡng NOTAM 210/270/75/95; Pilot Release 30′ trước ETD) — **bổ sung v0.6**.
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.2.md` §II.2, II.3, II.6 (hai nhóm giám sát, FMS, khách nối chuyến).
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.2.md` §II.7 (đa Carrier trong BCAO).
- **Cờ truy vết:**
  - `(chưa có nguồn — cần SME bổ sung)` — nguồn đề cập nguyên tắc nhưng không nêu chi tiết để bóc xuống FUNC; chờ SME bổ sung.
  - `[cần xác nhận]` — nội dung nguồn còn cờ này (vd VMA, VNCM/VNCS); giữ nguyên cờ trong FUNC để truy vết.
  - `[cần xác nhận — KS-xx]` (v0.6) — phần của cột Flight Dispatch còn vướng đúng cờ OID KS-xx đang mở; FUNC chỉ phân rã phần đã rõ, phần vướng cờ giữ nguyên cờ và không suy diễn.
- **Mã FUNC** đánh liên tiếp `FUNC-101 → FUNC-1xx`; mỗi FUNC ánh xạ tới đúng một BR cha (cùng FUNC có thể được tham chiếu chéo qua nhiều BR nếu nguồn cùng nêu, nhưng BR cha là BR mà FUNC trực tiếp phân rã từ đó).

---

## 2. Bảng phân rã FUNC theo từng BR

### 2.1 BR-101 — Danh sách chuyến bay hợp nhất kế hoạch / dự kiến / thực tế

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-101 | Hiển thị danh sách chuyến bay dạng trực quan với các thuộc tính định danh chuyến: số hiệu chuyến bay, chặng bay. | BR-101 | Đề xuất §II.1 — Thông tin chuyến bay (gạch đầu dòng "Hội tụ đầy đủ thông tin") |
| FUNC-102 | Hiển thị bộ ba mốc thời gian của từng chuyến bay: giờ kế hoạch (STD/STA), giờ dự kiến (ETD/ETA), giờ thực tế (ATD/ATA). | BR-101 | Đề xuất §II.1 — Thông tin chuyến bay |
| FUNC-103 | Trên cùng dòng chuyến bay, hiển thị các thuộc tính liên quan đi kèm: tàu bay, cấu hình cabin, thời tiết, NOTAM, tổ bay, hành khách, hàng hóa, doanh thu, chi phí. | BR-101 | Đề xuất §II.1 — Thông tin chuyến bay |

### 2.2 BR-102 — Cá nhân hóa giao diện theo phiên người dùng

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-104 | Cho phép người dùng ẩn / hiện linh hoạt các trường (cột) thông tin trên bảng điều khiển tổng quan danh sách chuyến bay. | BR-102 | Đề xuất §II.1 — Cá nhân hóa giao diện |
| FUNC-105 | Lưu tùy chỉnh ẩn / hiện cột theo từng phiên đăng nhập của cá nhân, không ảnh hưởng đến thiết lập của người dùng khác. | BR-102 | Đề xuất §II.1 — Cá nhân hóa giao diện |

### 2.3 BR-103 — Cảnh báo bằng màu sắc tại các trường thông tin

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-106 | Áp dụng cơ chế cảnh báo bằng màu sắc tại các trường thông tin trên danh sách chuyến bay khi phát hiện bất thường. | BR-103 | Đề xuất §II.1 — Hệ thống cảnh báo thông minh |
| FUNC-107 | Phát hiện và cảnh báo bằng màu sắc cho các loại bất thường: MEL/CDL, hỏng hóc cabin (cabin defect), khách VIP, khách nối chuyến, hệ số lấp đầy (load factor) thấp, chậm chuyến (delay), thiếu phép bay, thiếu điện văn hàng không. | BR-103 | Đề xuất §II.1 — Hệ thống cảnh báo thông minh |
| FUNC-108 | Ngưỡng và quy tắc cụ thể để xác định "hệ số lấp đầy thấp", "chậm chuyến", "thiếu phép bay", "thiếu điện văn" để kích hoạt cảnh báo màu: (chưa có nguồn — cần SME bổ sung). | BR-103 | (chưa có nguồn — cần SME bổ sung) |

### 2.4 BR-104 — Lịch sử thay đổi chuyến bay và quản lý Divert

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-109 | Hiển thị lịch sử thay đổi chi tiết của từng chuyến bay theo các trường: thời gian, tàu bay, loại chuyến bay, trạng thái. | BR-104 | Đề xuất §II.1 — Truy vết và Đối soát |
| FUNC-110 | Quản lý chuyến bay chuyển hướng (Divert): hiển thị sân bay dự kiến và sân bay hạ cánh thực tế cho phép so sánh trực tiếp. | BR-104 | Đề xuất §II.1 — Truy vết và Đối soát |
| FUNC-111 | Khi Divert phát sinh chuyến bay mới (chuyến bổ sung từ sân bay không dự kiến về điểm gốc), tạo cảnh báo "chuyến bay chưa có tài liệu" cho chuyến mới đó. | BR-104, BR-117 | Khảo sát 11/06 §II.5 — Cảnh báo Divert |

### 2.5 BR-105 — Tích hợp bản đồ trực quan (FlightRadar24)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-112 | Cung cấp liên kết nhúng từ chuyến bay sang FlightRadar24 để xem vị trí và hành trình bay thực tế của tàu bay. | BR-105 | Đề xuất §II.1 — Tích hợp bản đồ trực quan; YCKT TOSS-085 (theo BRD §7.1) |

### 2.6 BR-106 — Quản trị đa Carrier

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-113 | Hỗ trợ điều hành đồng thời các chuyến bay của nhiều hãng vận chuyển (Carriers) trên cùng một nền tảng. | BR-106 | Đề xuất §II.1 — Quản trị đa Carrier |
| FUNC-114 | Phạm vi Carrier ban đầu cần hỗ trợ: VNA, 0V, BL (theo cấu trúc BCAO hiện hành "số chuyến theo từng hãng trong nhóm — VN, 0V, BL"). | BR-106 | Khảo sát 09/06 §II.7 — Cấu trúc BCAO, phần "số chuyến theo từng hãng trong nhóm (VN, 0V, BL)" |

### 2.7 BR-107 — Hồ sơ và tình trạng tàu bay theo thời gian thực

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-115 | Hiển thị thông tin định danh tàu bay: loại tàu bay, số đăng ký, mã ICAO/IATA, thời điểm hiệu lực của các chứng chỉ khai thác. | BR-107 | Đề xuất §II.1 — Thông tin định danh |
| FUNC-116 | Theo dõi lịch khai thác của từng tàu bay: lịch sử bay gần nhất và kế hoạch khai thác sắp tới. | BR-107 | Đề xuất §II.1 — Lịch khai thác |
| FUNC-117 | Quản lý và lưu trữ lịch sử cập nhật chỉ số hiệu suất (PF — Performance Factor) cho từng tàu bay phục vụ lập kế hoạch bay và tối ưu nạp dầu. | BR-107 | Đề xuất §II.1 — Chỉ số hiệu suất (Performance Factor) |
| FUNC-118 | Hiển thị các danh mục MEL/CDL hiện có và các hỏng hóc (defects) của tàu bay; phân tích ảnh hưởng trực tiếp của chúng đến khả năng khai thác chuyến bay. | BR-107 | Đề xuất §II.1 — Tình trạng kỹ thuật |
| FUNC-119 | Theo dõi lịch bảo dưỡng định kỳ, tình trạng tàu bay dừng bay do kỹ thuật (AOG — Aircraft On Ground) và dự kiến thời gian khắc phục. | BR-107 | Đề xuất §II.1 — Bảo trì và AOG |
| FUNC-120 | Cập nhật số chu kỳ bay (FC — Flight Cycle) và kích hoạt cảnh báo khi tàu bay tiến gần đến giới hạn FC quy định. | BR-107 | Đề xuất §II.1 — Giới hạn chu kỳ bay |
| FUNC-121 | Ghi nhận chi phí vận hành động cơ phụ (APU — Auxiliary Power Unit) và các chi phí bảo dưỡng đặc thù theo từng tàu bay. | BR-107 | Đề xuất §II.1 — Phân tích chi phí |

### 2.8 BR-108 — Thông tin tổ bay và kiểm soát giờ bay / giờ làm việc

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-122 | Hiển thị danh sách tổ bay thực hiện chuyến bay với hồ sơ phi hành đoàn: họ tên, chức vụ, thông tin liên lạc, hộ chiếu, mã số tổ bay. | BR-108 | Đề xuất §II.1 — Hồ sơ phi hành đoàn |
| FUNC-123 | Theo dõi chi tiết hành trình của tổ bay và lưu trữ lịch sử các lần thay đổi tổ bay trên chuyến bay. | BR-108 | Đề xuất §II.1 — Giám sát hành trình |
| FUNC-124 | Theo dõi giờ bay (Flight Time) và giờ làm việc (Duty Time) của tổ bay để đảm bảo không vi phạm các tiêu chuẩn an toàn hàng không. | BR-108 | Đề xuất §II.1 — Kiểm soát thời gian |
| FUNC-125 | Ngưỡng cụ thể của giờ bay / giờ làm việc (FTL — Flight Time Limitation) và quy tắc cảnh báo: (chưa có nguồn — cần SME bổ sung). | BR-108 | (chưa có nguồn — cần SME bổ sung) |

### 2.9 BR-109 — Tải trọng, hành khách và lịch sử thay đổi tải

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-126 | Hiển thị realtime số lượng khách mở bán, khách booking và khách thực tế theo từng hạng ghế (Adult / Child / Infant). | BR-109 | Đề xuất §II.1 — Dữ liệu hành khách |
| FUNC-127 | Hiển thị realtime các nhóm khách đặc biệt: VIP, CIP, khách nối chuyến. | BR-109 | Đề xuất §II.1 — Dữ liệu hành khách |
| FUNC-128 | Hiển thị thông tin Payload (tải trọng): trọng lượng hành khách, hành lý, hàng hóa, trọng lượng khô (DOW — Dry Operating Weight), danh mục thiết bị chất xếp (ULD — Unit Load Device). | BR-109 | Đề xuất §II.1 — Quản trị Payload |
| FUNC-129 | Hiển thị lịch sử các lần thay đổi tải trọng của chuyến bay. | BR-109 | Đề xuất §II.1 — Quản trị Payload |
| FUNC-130 | Cập nhật thông tin dịch vụ và hàng hóa đặc biệt của chuyến bay: suất ăn, phục vụ hành khách, hàng hóa nguy hiểm (NOTOC — Notification to Captain), hàng hóa đặc biệt và các hạn chế dịch vụ kèm theo. | BR-109 | Đề xuất §II.1 — Dịch vụ và Hàng hóa đặc biệt |

### 2.10 BR-110 — Đường bay, thời gian, nhiên liệu và quỹ đạo bay

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-131 | Hiển thị các thông tin khuyến nghị tối ưu cho chuyến bay: nạp dầu hộ (Tankering), thời gian lăn bánh (Taxi Out), chỉ số chi phí (Cost Index — CI), các sân bay dự bị (Alternate Airports). | BR-110 | Đề xuất §II.1 — Khuyến nghị tối ưu |
| FUNC-132 | Cập nhật thông tin NOTAM và thời tiết được bóc tách tự động từ các nguồn tích hợp và tài liệu chuyến bay. | BR-110 | Đề xuất §II.1 — Dữ liệu môi trường |
| FUNC-133 | Theo dõi và hiển thị các mức nhiên liệu của chuyến bay: nhiên liệu kế hoạch, nhiên liệu phi công yêu cầu (Fuel Order), nhiên liệu trên Load Sheet, các mức nhiên liệu dự phòng / extra. | BR-110 | Đề xuất §II.1 — Quản trị nhiên liệu |
| FUNC-134 | Hiển thị phương thức cất cánh (SID — Standard Instrument Departure) và phương thức tiếp cận (STAR — Standard Terminal Arrival Route) theo kế hoạch và thực tế. | BR-110 | Đề xuất §II.1 — Quỹ đạo bay |

### 2.11 BR-111 — Cột mốc khai thác sân bay phục vụ OTP

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-135 | Hiển thị vị trí đỗ tàu bay tại cả sân bay đi và sân bay đến. | BR-111 | Đề xuất §II.1 — Vị trí đỗ |
| FUNC-136 | Cập nhật số cửa khởi hành (Boarding Gate) và giờ bắt đầu đón khách thực tế (Boarding start). | BR-111 | Đề xuất §II.1 — Tiến độ Boarding |
| FUNC-137 | Hiển thị thông tin băng chuyền hành lý tại sân bay đến và các dịch vụ hỗ trợ khai thác mặt đất khác. | BR-111 | Đề xuất §II.1 — Phục vụ mặt đất |

### 2.12 BR-112 — Ghi nhận bất thường, dashboard tài liệu và luồng phê duyệt

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn | Dữ liệu liên quan |
|---|---|---|---|---|
| FUNC-138 | Ghi nhận các bất thường phát sinh của chuyến bay và phân loại theo các nhóm nguyên nhân: thời tiết, kỹ thuật, lý do khách quan khác. | BR-112 | Đề xuất §II.1 — Phân loại bất thường; Khảo sát 09/06 §II.7 (cấu trúc BCAO, phần bất thường) | — (không thuộc phạm vi cột "Dữ liệu liên quan" của v0.4 — chức năng ghi nhận bất thường, không phải màn giám sát) |
| FUNC-139 | Cung cấp dashboard tài liệu chuyến bay: giám sát trạng thái chuyến đã có hay chưa có đối với từng loại tài liệu cần thiết. | BR-112 | Đề xuất §II.1 — Dashboard tài liệu | Chuyến bay (FLT NO, STD, DEP, ARR, AC REG); Tài liệu chuyến (nhóm FOS "DOCUMENT STATUS": OFP REV COUNT, LS REV COUNT, GD REV COUNT, PM REV COUNT, NOTOC BAGGAGE REV COUNT, NOTOC CARGO REV COUNT, CARGO MANIFEST REV COUNT, MAIL MANIFEST REV COUNT cùng các mốc UPLOAD TIME / CONFIRM TIME tương ứng); trạng thái "đã có / chưa có" theo từng loại tài liệu `[cần xác nhận quy tắc xác định]`. |
| FUNC-140 | Theo dõi chi tiết luồng phê duyệt tài liệu theo trạng thái yêu cầu (Request), xác nhận (Confirm), từ chối (Reject) bởi từng đối tượng liên quan kèm dấu thời gian thực. | BR-112 | Đề xuất §II.1 — Luồng phê duyệt | Tài liệu chuyến (loại tài liệu, phiên bản); Sự kiện phê duyệt (trạng thái Request / Confirm / Reject, đối tượng thực hiện, dấu thời gian); tham chiếu các mốc FOS: LS UPLOAD TIME, LS CONFIRM TIME, GD UPLOAD TIME, GD CONFIRM TIME, PM UPLOAD TIME, PM CONFIRM TIME, NOTOC BAGGAGE UPLOAD/CONFIRM TIME, NOTOC CARGO UPLOAD/CONFIRM TIME, CARGO MANIFEST UPLOAD/CONFIRM TIME, MAIL MANIFEST UPLOAD/CONFIRM TIME, FLIGHT RELEASE TIME, RELEASED BY. |
| FUNC-141 | Quản lý phiên bản tài liệu đính kèm chuyến bay: hiển thị số lượng và nội dung của các phiên bản; cho phép tải về toàn bộ bộ hồ sơ tài liệu chuyến bay khi cần. | BR-112 | Đề xuất §II.1 — Quản lý phiên bản | Tài liệu chuyến (loại tài liệu, số phiên bản, file đính kèm); chỉ số phiên bản từ FOS: OFP REV, OFP REV COUNT, OFP NUMBER, IS RECLEAR OFP, OFP REV RELEASED, FLIGHT RELEASE COUNT, LS VERSION, LS REV COUNT, GD REV COUNT, PM REV COUNT, NOTOC/CARGO/MAIL MANIFEST REV COUNT; gói hồ sơ tài liệu chuyến (file bundle) `[cần xác nhận cấu trúc gói tải về]`. |
| FUNC-142 | Phân quyền xem thông tin chi tiết chuyến bay đến từng người dùng theo vai trò nghiệp vụ trong môi trường điều hành khai thác. | BR-112 | Đề xuất §II.1 — Đoạn kết luận về phân quyền xem | Người dùng (User ID, họ tên, vai trò nghiệp vụ); Vai trò (Role) và ma trận phân quyền theo trường/màn hình chi tiết chuyến `[cần xác nhận danh mục vai trò và ma trận quyền]`. |
| FUNC-143 | Danh mục cụ thể "các loại tài liệu cần thiết" và quy tắc xác định "đã có / chưa có" trên dashboard tài liệu: (chưa có nguồn — cần SME bổ sung). | BR-112 | (chưa có nguồn — cần SME bổ sung) | Danh mục loại tài liệu cần thiết theo chuyến (gợi ý các nhóm FOS: OFP, Load Sheet — LS, General Declaration — GD, Passenger Manifest — PM, NOTOC Baggage, NOTOC Cargo, Cargo Manifest, Mail Manifest, Flight Release) `[cần xác nhận danh mục đầy đủ và quy tắc "đã có / chưa có"]`. |

### 2.13 BR-113 — Hai nhóm màn hình giám sát: trực ban trưởng và cán bộ tài liệu

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn | Dữ liệu liên quan |
|---|---|---|---|---|
| FUNC-144 | Cung cấp màn hình giám sát dành cho trực ban trưởng (OCC Duty Manager) tập trung vào trạng thái khai thác và khách nối chuyến. | BR-113 | Khảo sát 08/06 §II.2 — Hai nhóm đối tượng giám sát | Chuyến bay (FLT NO, DEP, ARR, STD, STA, ETD, ETA, ATD, ATA, LEG STATE, IRREGULAR, DIVERTED, DELAY GROUP, DELAY CODE, DELAY MINS); Tàu bay (AC TYPE, AC REG); Hành khách nối chuyến (PAX nối vào / nối ra — theo BOOKING/LS PAX và OFP PAX) `[cần xác nhận trường nguồn — FOS sheet-09 không có cột Transfer PAX trực tiếp]`; Cảnh báo khai thác (nguồn từ hệ thống cảnh báo nội tại). |
| FUNC-145 | Cung cấp màn hình giám sát dành cho cán bộ tài liệu, tập trung vào tình trạng tài liệu chuyến bay (đã được tổ bay xác nhận / tải xuống hay chưa). | BR-113 | Khảo sát 08/06 §II.2 — Hai nhóm đối tượng giám sát | Chuyến bay (FLT NO, STD, DEP, ARR, AC REG); Tổ bay (CREW SYNC, PIC); Tài liệu chuyến (nhóm FOS DOCUMENT STATUS: OFP REV/REV COUNT, LS UPLOAD/CONFIRM TIME, GD UPLOAD/CONFIRM TIME, PM UPLOAD/CONFIRM TIME, NOTOC BAGGAGE/CARGO UPLOAD/CONFIRM TIME, CARGO MANIFEST UPLOAD/CONFIRM TIME, MAIL MANIFEST UPLOAD/CONFIRM TIME, FLIGHT RELEASE TIME, RELEASED BY); trạng thái "tổ bay đã xác nhận / đã tải xuống" `[cần xác nhận trường nguồn]`. |
| FUNC-146 | Hỗ trợ nhiều cấp xem từ tổng quan đến chi tiết từng chuyến và từng hành khách trong hai nhóm màn hình giám sát; cho phép giám sát nhiều chuyến cùng lúc (thay vì xem lần lượt từng chuyến như hiện trạng). | BR-113 | Khảo sát 08/06 §II.2 — Hai nhóm đối tượng giám sát | Danh sách chuyến bay (FLT NO, DEP, ARR, STD/STA, AC REG, LEG STATE); Chi tiết chuyến (toàn bộ nhóm FOS Report — FLIGHT INFO, AIRCRAFT, TIME, LOAD & WEIGHT, OFP, DOCUMENT STATUS, CREW, AIRPORT, ACARS); Chi tiết hành khách (LS ADULT, LS CHILD, LS INFANT, LS MALE, LS FEMALE, LS TTL, OFP PAX; PAX nối chuyến); cấu hình hiển thị (lựa chọn ẩn/hiện cột — tham chiếu BR-102). |
| FUNC-147 | Theo dõi khách nối chuyến (nối vào / nối ra) và cảnh báo nguy cơ lỡ nối chuyến khi chậm chuyến. | BR-113 | Khảo sát 08/06 §II.6 — Khách nối chuyến | — (không thuộc phạm vi cột "Dữ liệu liên quan" của v0.4 theo phân định 4 BR áp dụng) |

### 2.14 BR-114 — Màn hình tập trung kiểm tra đầu ca (Start-of-Shift Check)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn | Dữ liệu liên quan |
|---|---|---|---|---|
| FUNC-148 | Cung cấp một màn hình tập trung kiểm tra đầu ca cho điều phái viên (Dispatcher), gom toàn bộ các đầu mối cần kiểm tra của ca trực vào cùng một giao diện. | BR-114 | Khảo sát 11/06 §II.4 — Kiểm tra đầu ca | Ca trực (Dispatcher, thời gian ca, phạm vi chuyến bay phụ trách); Danh sách chuyến bay trong ca (FLT NO, STD, STA, DEP, ARR, AC REG, LEG STATE); các nhóm kiểm tra con (xem FUNC-149 → FUNC-157). |
| FUNC-149 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Lịch bay (Flight Schedule). | BR-114 | Khảo sát 11/06 §II.4 | Lịch bay (FLT NO, STD, STA, DEP, ARR, SECTOR, LEG TYPE, LEG STATE, ETD, ETA, ETD CAAV); IRREGULAR; DIVERTED. |
| FUNC-150 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Loại tàu bay. | BR-114 | Khảo sát 11/06 §II.4 | Tàu bay (AC TYPE, AC SUBTYPE, AC CATEGORY, AC REG, AC GROUP 1…5); cấu hình cabin (AC CONFIG C/W/Y/CWY). |
| FUNC-151 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Tàu quay (Rotation) — đối chiếu tàu được phân cho chuyến với lịch quay. | BR-114 | Khảo sát 11/06 §II.4 | Tàu bay (AC REG); chuỗi chặng quay tàu (FLT NO, STD, STA, DEP, ARR theo thứ tự LEG_NO); TAT SCHED, TAT ACTUAL; lịch khai thác tàu trước/sau (kế hoạch khai thác — Đề xuất §II.1 "Lịch khai thác"). |
| FUNC-152 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Cứu hỏa sân bay (RFFS — Rescue and Fire Fighting Service category). | BR-114 | Khảo sát 11/06 §II.4 | Sân bay (DEP, ARR); cấp RFFS / NOTAM cứu hỏa của sân bay (tham chiếu BR-118 / FUNC-177) `[cần xác nhận trường lưu cấp RFFS — nguồn FOS sheet-09 không liệt kê trường này]`. |
| FUNC-153 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Thời tiết. | BR-114 | Khảo sát 11/06 §II.4 | Bản tin METAR / SPECI cho sân bay đi/đến (tham chiếu BR-119); OFP WX PROG; AVG WC, AVG WIND, ISA DEV, MAX SHR; ngưỡng VMA `[cần xác nhận viết tắt VMA]`. |
| FUNC-154 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Tải. | BR-114 | Khảo sát 11/06 §II.4 | LOAD & WEIGHT (CORR DOW, CORR PLD, CORR ZFW, CORR TOW, CORR TOF, CORR LDW, CORR TRIP FUEL, CORR TAXI FUEL); Load Sheet (LS DOW, LS ZFW, LS ZFW MAX, LS TOW, LS TOW MAX, LS LAW, LS LAW MAX, LS PAYLOAD, LS TAKE OFF FUEL, LS TRIP FUEL); OFP (OFP DOW, OFP ZFW, OFP TOW, OFP LDW, OFP PAYLOAD, OFP TRIP FUEL); chênh lệch OFP↔LS (tham chiếu BR-120). |
| FUNC-155 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: MEL/CDL. | BR-114 | Khảo sát 11/06 §II.4 | Tàu bay (AC REG); danh mục MEL hiện hành của tàu (OFP MEL); danh mục CDL hiện hành (tham chiếu BR-121 / FUNC-193 — CDL); khoảng hiệu lực; ảnh hưởng đến khả năng khai thác chuyến (tham chiếu Đề xuất §II.1 "Tình trạng kỹ thuật"). |
| FUNC-156 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Hạn chế (Restrictions). | BR-114 | Khảo sát 11/06 §II.4 | Sân bay (DEP, ARR); Airport Constraints — slot, curfew, hạn chế khác (tham chiếu BR-129 / FUNC-219); phép bay; OFP SPECIAL OPS; OFP REMARKS; DSP NOTES `[cần xác nhận danh mục loại hạn chế đầy đủ]`. |
| FUNC-157 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Chứng chỉ tổ bay. | BR-114 | Khảo sát 11/06 §II.4 | Tổ bay (PIC, DISPATCHER, DSP LICENSE NUMBER, OFP PIC, OFP PILOTS, CREW SYNC, FC, CC); chứng chỉ / điều kiện đặc biệt theo sân bay (tham chiếu BR-122 / FUNC-197); FH SCHED, FH ACTUAL, BH SCHED, BH ACTUAL (theo dõi giờ bay tổ bay — tham chiếu BR-108) `[cần xác nhận trường lưu chứng chỉ tổ bay — FOS sheet-09 chưa liệt kê]`. |
| FUNC-158 | Tự đối chiếu (compare) hai chiều giữa các nguồn dữ liệu — ví dụ giữa lịch bay với loại tàu, giữa kế hoạch ca trước với tình trạng tàu hiện tại — và tự sinh cảnh báo khi phát hiện không khớp hoặc có biến động bất thường. | BR-114 | Khảo sát 11/06 §II.4 — Thảo luận – Đề xuất | Cặp nguồn đối chiếu: Lịch bay (FLT NO, AC TYPE) ↔ Tàu thực phân (AC REG, AC TYPE); Kế hoạch ca trước ↔ Tình trạng tàu hiện tại (AC REG, LEG STATE, IRREGULAR, DIVERTED); chênh lệch OFP ↔ LS (LOAD & WEIGHT); NAIL/CDL hiệu lực ↔ Lịch khai thác. Cảnh báo (loại, mức độ, đối tượng nhận). |
| FUNC-159 | Phân loại cảnh báo trên màn hình kiểm tra đầu ca theo mức "bắt buộc xử lý" vs "ghi nhận để báo cáo"; tiêu chí cụ thể của từng nhóm cảnh báo: (chưa có nguồn — cần SME bổ sung). | BR-114 | Khảo sát 11/06 §II.4 — Kết luận (cờ "chi tiết sẽ chốt ở các buổi tiếp theo") | Cảnh báo (mã cảnh báo, mô tả, mức "bắt buộc xử lý" / "ghi nhận để báo cáo", tiêu chí kích hoạt) `[cần xác nhận tiêu chí phân loại từng nhóm cảnh báo]`. |

### 2.15 BR-115 — TOSS đóng vai trò "view + cảnh báo", không trùng lặp chức năng

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-160 | Trên các màn hình điều hành chuyến bay, điều phái viên chỉ thực hiện thao tác "view" + xử lý cảnh báo; KHÔNG cung cấp thao tác nghiệp vụ chuyên dụng đã có ở hệ thống nguồn (Lido lập kế hoạch bay, MO Plus xác nhận tài liệu phi công, AMOS bảo dưỡng…). | BR-115 | Khảo sát 11/06 §II.4 — Nguyên tắc thiết kế |
| FUNC-161 | Khi điều phái viên cần giải quyết một cảnh báo, cung cấp đường dẫn / cơ chế chuyển sang hệ thống chuyên dụng tương ứng để xử lý; sau khi xử lý xong, dữ liệu phải tự đồng bộ về TOSS và cảnh báo tự tắt. | BR-115 | Khảo sát 11/06 §II.4 — Thảo luận – Đề xuất |
| FUNC-162 | Danh sách cụ thể các hệ thống nguồn được phép "deep link" từ TOSS và cơ chế đồng bộ ngược (timing, payload): (chưa có nguồn — cần SME bổ sung). | BR-115 | (chưa có nguồn — cần SME bổ sung) |

### 2.16 BR-116 — Cảnh báo thay đổi lịch bay (OSP, loại tàu, ferry, VIP)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-163 | Phát hiện và cảnh báo thay đổi giờ bay khi lệch ≥ 15 phút so với kế hoạch (ngưỡng OSP — Operational Schedule Performance — đang áp dụng); áp dụng cho cả hai chiều: sớm hơn và muộn hơn. | BR-116 | Khảo sát 11/06 §II.5 — Thảo luận – Đề xuất, Kết luận |
| FUNC-164 | Phát hiện và cảnh báo thay đổi loại tàu bay (aircraft type). | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-165 | Phát hiện và cảnh báo thay đổi tàu bay cụ thể (tail number) trên cùng chuyến. | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-166 | Phát hiện và cảnh báo (highlight) khi phát sinh chuyến ferry (chuyến không thương mại, dùng để điều chuyển tàu bay) để điều phái viên xử lý tài liệu riêng. | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-167 | Phát hiện và cảnh báo (highlight) khi chuyển từ chuyến thường (regular) sang chuyến VIP (do thay đổi cấp độ phục vụ và yêu cầu tài liệu khác). | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-168 | Khi chuyển từ chuyến VIP về chuyến thường (downgrade), chỉ ghi nhận, KHÔNG cảnh báo đặc biệt. | BR-116 | Khảo sát 11/06 §II.5 — Kết luận |
| ~~FUNC-169~~ | **BỎ (đính chính 12/06):** "chuyến Lotang" = lỗi ASR của NOTAM → không có loại chuyến này. Cảnh báo "NOTAM mới phát sinh" thuộc BR-118 (FUNC-178). | ~~BR-116~~ → BR-118 | Đính chính ASR 12/06 (transcript 11/06 d.670) |
| ~~FUNC-170~~ | **BỎ (đính chính 12/06):** "đánh giá tác động Lotang" = đánh giá ảnh hưởng NOTAM tới chuyến → thuộc BR-118 (FUNC-179). | ~~BR-116~~ → BR-118 | Đính chính ASR 12/06 |
| FUNC-171 | Không tạo cảnh báo riêng khi đổi nhân sự trả tải (vì kế hoạch trả tải đã lập sẵn và không thay đổi sát giờ). | BR-116 | Khảo sát 11/06 §II.5 — Thảo luận – Đề xuất |

### 2.17 BR-117 — Cảnh báo Divert tách thành nhóm riêng

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-172 | Tách cảnh báo Divert thành một nhóm cảnh báo riêng (không gộp chung với nhóm "thay đổi lịch bay") vì Divert là tình huống đặc thù phát sinh sau khi chuyến đã cất cánh. | BR-117 | Khảo sát 11/06 §II.5 — Cảnh báo Divert, Kết luận |
| FUNC-173 | Khi Divert phát sinh chuyến bay mới (chuyến bổ sung từ sân bay không dự kiến về điểm gốc), tạo cảnh báo "chuyến bay chưa có tài liệu" cho chuyến mới đó. *(Chức năng này cũng được tham chiếu từ BR-104; xem FUNC-111 — ghi đôi nhằm đảm bảo truy vết từ cả hai BR cha.)* | BR-117 | Khảo sát 11/06 §II.5 — Kết luận |

### 2.18 BR-118 — Tích hợp NOTAM, phân loại 3 nhóm, cảnh báo RFFS

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-174 | Tích hợp / thu nạp NOTAM phục vụ chuyến bay từ nguồn chính thức `[cần xác nhận tên: VNCM / VNCS hoặc đơn vị quản lý bay khác]`. | BR-118 | Khảo sát 11/06 §II.6 — Mức 1 Trích xuất NOTAM, Kết luận |
| FUNC-175 | Phân loại NOTAM theo ba nhóm cơ bản: NOTAM sân bay, NOTAM vùng trời, NOTAM đường bay. | BR-118 | Khảo sát 11/06 §II.6 — Mức 2 Phân loại NOTAM, Kết luận |
| FUNC-176 | Đánh giá mức độ ảnh hưởng của từng NOTAM đến chuyến bay cụ thể và highlight các NOTAM có ảnh hưởng trực tiếp tới chuyến cho điều phái viên. | BR-118 | Khảo sát 11/06 §II.6 — Mức 3 Đánh giá mức độ ảnh hưởng |
| FUNC-177 | Khi phát hiện NOTAM cứu hỏa sân bay (RFFS) phát ra, tạo cảnh báo trực tiếp cho điều phái viên. | BR-118 | Khảo sát 11/06 §II.6 — RFFS, Kết luận |
| FUNC-178 | Không duy trì bảng tiêu chuẩn cấp cứu hỏa (RFFS) hiện hành của các sân bay riêng trong TOSS cho mục đích cảnh báo cơ bản (cảnh báo căn cứ trực tiếp vào sự xuất hiện của NOTAM cứu hỏa). | BR-118 | Khảo sát 11/06 §II.6 — Kết luận |
| FUNC-179 | Tiêu chí phân loại chi tiết và quy tắc đánh giá mức độ ảnh hưởng của NOTAM tới chuyến bay cụ thể: (chưa có nguồn — cần SME bổ sung; sẽ làm rõ qua workshop riêng với SME điều phái). | BR-118 | Khảo sát 11/06 §II.6 — Kết luận |

### 2.19 BR-119 — Tích hợp METAR + SPECI, cảnh báo thời tiết sân bay 3 thông số

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-180 | Tích hợp / thu nạp bản tin thời tiết METAR và SPECI cho các sân bay khai thác. | BR-119 | Khảo sát 11/06 §II.7 — Bản tin METAR và SPECI, Kết luận |
| FUNC-181 | Parse (bóc tách) bản tin METAR và SPECI để decode các trường thông số phục vụ đối chiếu ngưỡng cảnh báo. | BR-119 | Khảo sát 11/06 §II.7 — Yêu cầu kỹ thuật |
| FUNC-182 | Cảnh báo thời tiết sân bay (cất cánh / hạ cánh) dựa trên ba thông số: tầm nhìn (Visibility), trần mây (Cloud Ceiling), mưa dông (TSRA — Thunderstorm + Rain). | BR-119 | Khảo sát 11/06 §II.7 — Kết luận |
| FUNC-183 | So sánh giá trị quan trắc của ba thông số trên với ngưỡng thời tiết tối thiểu của sân bay (VMA `[cần xác nhận viết tắt]`) cộng thêm một biên an toàn (margin — chặt hơn ngưỡng tối thiểu) để cảnh báo sớm. | BR-119 | Khảo sát 11/06 §II.7 — Thảo luận – Đề xuất, Kết luận |
| FUNC-184 | Ưu tiên nguồn METAR / SPECI nội địa từ cơ quan khí tượng hàng không Việt Nam `[cần xác nhận tên đơn vị]` làm nguồn chính thức (official) cho sân bay nội địa. | BR-119 | Khảo sát 11/06 §II.7 — Nguồn dữ liệu thời tiết, Kết luận |
| FUNC-185 | Ưu tiên gói thời tiết trong Lido làm nguồn official cho sân bay quốc tế. | BR-119 | Khảo sát 11/06 §II.7 — Nguồn dữ liệu thời tiết, Kết luận |
| FUNC-186 | Các nguồn thời tiết khác (Sunweather, "Phi Công 11" `[cần xác nhận tên]`, UA PASMOS `[cần xác nhận]`) chỉ dùng tham khảo, KHÔNG dùng làm căn cứ cảnh báo chính thức. | BR-119 | Khảo sát 11/06 §II.7 — Kết luận |
| FUNC-187 | Cảnh báo thời tiết đường bay (en-route) liên quan đến SIGMET và các bản tin chuyên dụng: (chưa có nguồn — cần SME bổ sung; đoạn ghi âm cuối bị nhiễu, cần khảo sát bổ sung). | BR-119 | Khảo sát 11/06 §II.7 — Thảo luận, Vấn đề cần làm rõ |
| FUNC-188 | Giá trị cụ thể của biên an toàn (margin) so với VMA cho từng thông số (tầm nhìn / trần mây / TSRA) tại từng sân bay: (chưa có nguồn — cần SME bổ sung). | BR-119 | (chưa có nguồn — cần SME bổ sung) |

### 2.20 BR-120 — Cảnh báo lệch tải giữa OFP và số liệu thực tế (CLC vs Lido)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-189 | So sánh các trường trọng lượng/tải giữa OFP (kế hoạch của điều phái) và số liệu thực tế do bộ phận tải/cân bằng (CLC — Centralized Load Control `[cần xác nhận tên đầy đủ]`) nhập, gồm tối thiểu các trường: trọng lượng không nhiên liệu (ZFW — Zero Fuel Weight), tải trọng (Payload), trọng lượng cất cánh (Take-off Weight). Phát cảnh báo khi mức chênh lệch vượt ngưỡng cấu hình. | BR-120 | Khảo sát 11/06 sáng §II.8 — Yêu cầu + Thảo luận – Đề xuất + Kết luận |
| FUNC-190 | Cấu hình ngưỡng cảnh báo lệch tải theo ma trận đa chiều: **loại tàu bay × khoảng giờ bay × ngưỡng trên/ngưỡng dưới không đối xứng** (cho phép thiếu khác mức cho phép vượt — ví dụ nguồn nêu: thiếu hơn 1,5 tấn vs cao hơn 1 tấn); cấu hình cụ thể từng combo sẽ cung cấp ở buổi sau (chưa có nguồn — cần SME bổ sung). | BR-120 | Khảo sát 11/06 sáng §II.8 — Thảo luận – Đề xuất + Kết luận |
| FUNC-191 | Lưu lịch sử các lần CLC nhập số liệu (CLC có thể nhập lại nhiều lần trong cùng một chuyến) để TOSS luôn lấy con số nhập **cuối cùng** đối chiếu với OFP **cuối cùng**. | BR-120 | Khảo sát 11/06 sáng §II.8 — Yêu cầu + Kết luận |
| FUNC-192 | Phạm vi cụ thể các trường tải bổ sung ngoài ZFW/Payload/Take-off Weight (vd "patch down" `[cần xác nhận — có thể "touchdown weight"]`, "loft power" `[ASR — cần xác nhận]`), khái niệm "trọng lượng ướt" và cấu hình ngưỡng cụ thể cho từng loại tàu × khoảng giờ bay: (chưa có nguồn — cần SME bổ sung). | BR-120 | Khảo sát 11/06 sáng §II.8 — Thảo luận – Đề xuất (cờ `[cần xác nhận]` trong nguồn) |

### 2.21 BR-121 — Cảnh báo phát sinh NAIL / CDL ảnh hưởng chuyến

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-193 | Tích hợp / thu nạp NAIL `[cần xác nhận viết tắt]` và CDL (Configuration Deviation List) từ hệ thống bảo dưỡng kỹ thuật (AMOS `[cần xác nhận]`) — khi AMOS phát một NAIL/CDL mới active, TOSS lấy về kèm khoảng hiệu lực (active period: thời điểm raise và thời điểm release). | BR-121 | Khảo sát 11/06 sáng §II.10 — Thảo luận – Đề xuất + Kết luận |
| FUNC-194 | Quy tắc cảnh báo theo thời điểm: (a) chuyến đã cất cánh trước khi NAIL raise → KHÔNG cảnh báo; (b) chuyến rơi vào khoảng hiệu lực NAIL và chưa khai thác → cảnh báo (kể cả khi tại thời điểm đó chưa bị ảnh hưởng, vì thay đổi tải có thể dẫn tới chạy lại OFP vướng NAIL); (c) chuyến sau khoảng hiệu lực NAIL (khi NAIL kéo dài sang ngày khác) → KHÔNG cảnh báo. | BR-121 | Khảo sát 11/06 sáng §II.10 — Thảo luận – Đề xuất + Kết luận |
| FUNC-195 | Khi NAIL ảnh hưởng quay tàu (rotation), hỗ trợ điều phái viên thao tác **chuyển kế hoạch khai thác giữa các tàu bay** (input cho thao tác trên Lido) `[ASR "chuyển nát" — cần xác nhận thuật ngữ]`. | BR-121 | Khảo sát 11/06 sáng §II.10 — Thảo luận – Đề xuất + Kết luận |
| FUNC-196 | Mô hình master NAIL → sub-NAIL (NAIL gốc có thời hạn ví dụ 6 tháng, bẻ ra các sub-NAIL active theo) và ranh giới giữa TOSS (cảnh báo) vs Lido (đã tính NAIL vào dầu — nếu Lido đã tính thì có thể không cần cảnh báo bổ sung): (chưa có nguồn — cần SME bổ sung). | BR-121 | Khảo sát 11/06 sáng §II.10 — Thảo luận – Đề xuất + Kết luận (cờ "cần làm rõ") |

### 2.22 BR-122 — Đối chiếu chứng chỉ tổ bay với sân bay đặc biệt

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-197 | Duy trì danh mục **điều kiện đặc biệt theo sân bay** (chứng chỉ riêng / điều kiện kinh nghiệm bổ sung gắn theo từng sân bay địa hình/điều kiện đặc thù như Điện Biên, Đồng Hới `[cần xác nhận "Đế Pân"]`); chứng chỉ này không phải bằng lái thông thường mà là điều kiện bổ sung. | BR-122 | Khảo sát 11/06 sáng §II.12 — Yêu cầu + Thảo luận – Đề xuất + Kết luận |
| FUNC-198 | Đối chiếu chứng chỉ của tổ bay được phân cho chuyến với điều kiện đặc biệt của sân bay khai thác; sinh cảnh báo cho điều phái viên khi tổ bay không đủ điều kiện để đề nghị đổi tổ. Danh mục đầy đủ các sân bay đặc biệt: (chưa có nguồn — cần SME bổ sung). | BR-122 | Khảo sát 11/06 sáng §II.12 — Thảo luận – Đề xuất + Kết luận |

### 2.23 BR-123 — Cảnh báo đổi tổ bay

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-199 | Phát hiện khi chuyến bay được phân tổ bay khác so với phân ban đầu (tên tổ bay mới khác tổ bay cũ); sinh cảnh báo "đổi tổ bay" kèm **tên tổ bay mới** gửi cho điều phái viên. Khi điều phái mở Lido, Lido đã có tổ bay mới (Lido đóng vai trò TIC `[cần xác nhận]`); điều phái chỉ thao tác lại, không phải đẩy tổ bay vào Lido. | BR-123 | Khảo sát 11/06 sáng §II.12 — Thảo luận – Đề xuất + Kết luận |
| FUNC-200 | Phân loại đối tượng nhận cảnh báo: cảnh báo "đổi tổ bay" gửi điều phái; cảnh báo "phân tổ bay ban đầu" có thể thuộc thẩm quyền trực ban trưởng — phân loại đối tượng nhận sẽ chốt sau (chưa có nguồn — cần SME bổ sung) `[cần xác nhận phân loại đối tượng]`. | BR-123 | Khảo sát 11/06 sáng §II.12 — Kết luận |

### 2.24 BR-124 — Cảnh báo PAX time / lịch PAX (không cảnh báo APU time)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-201 | Sinh cảnh báo PAX time / lịch PAX (số lượng và lịch hành khách — PAX) dựa trên số liệu PAX có sẵn trên OFP của Lido. | BR-124 | Khảo sát 11/06 sáng §II.13 — Thảo luận – Đề xuất + Kết luận |
| FUNC-202 | KHÔNG sinh cảnh báo APU time: hiện trạng OFP của Lido không thể hiện APU time, báo điện tử tổ bay (phone) cũng không cung cấp dữ liệu APU — vì vậy TOSS không có cơ sở dữ liệu để cảnh báo APU time. | BR-124 | Khảo sát 11/06 sáng §II.13 — Thảo luận – Đề xuất + Kết luận |
| FUNC-203 | Ngưỡng theo phút trước STD để kiểm tra lịch PAX và các trường hợp cụ thể cần cảnh báo (vd thay phó, nhập Lido sai/sót, "phone bằng một kiếm" `[cần xác nhận]`): (chưa có nguồn — cần SME bổ sung; đoạn ghi âm liên quan không rõ). | BR-124 | Khảo sát 11/06 sáng §II.13 — Thảo luận – Đề xuất + Kết luận |

### 2.25 BR-125 — Màn hình Monitoring overview real-time (Phase 4–5)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn | Dữ liệu liên quan |
|---|---|---|---|---|
| FUNC-204 | Cung cấp một màn hình Monitoring overview cho điều phái viên (Phase 4 Pre-Departure Monitoring + Phase 5 In-Flight Monitoring) — điều phái mở suốt ca trực, không cần thao tác refresh thủ công. | BR-125 | Khảo sát 11/06 chiều §II.6 — Yêu cầu + Kết luận | Ca trực điều phái (Dispatcher, phạm vi chuyến bay phụ trách); Danh sách chuyến bay trong phạm vi Phase 4 + Phase 5 (FLT NO, STD, STA, DEP, ARR, AC REG, LEG STATE). |
| FUNC-205 | Hiển thị mỗi chuyến bay trên overview tối thiểu các thông tin: trạng thái thực tế (đang taxi-out / đã cất cánh / đang bay / taxi-in / đã hạ cánh), giờ thực tế đi/đến so với giờ kế hoạch (sớm/trễ bao nhiêu phút), ETA (Estimated Time of Arrival). | BR-125 | Khảo sát 11/06 chiều §II.6 — Thảo luận – Đề xuất + Kết luận | Chuyến bay (FLT NO, DEP, ARR, AC REG); Giờ kế hoạch (STD, STA); Giờ thực tế từ ACARS (ATD/OUT TIME, OFF TIME, ON TIME, ATA/IN TIME — nhóm FOS TIME); ETA (EIBT — Estimated In-Block Time, ELDT — Estimated Landing Time); trạng thái LEG STATE (taxi-out / airborne / taxi-in / arrived) `[cần xác nhận danh mục enum LEG STATE]`; DELAY MINS (chênh lệch sớm/trễ). |
| FUNC-206 | Với chuyến chuẩn bị (chưa cất cánh), hiển thị thêm: dự kiến cất cánh giờ; đã phục vụ đến giai đoạn nào tại sân (boarding, đóng cửa, push-back…) — lấy từ tích hợp ACDM. | BR-125 | Khảo sát 11/06 chiều §II.6 — Thảo luận – Đề xuất | Mốc A-CDM (SOBT — Schedule Off-Block Time, EOBT — Estimated Off-Block Time, TOBT — Target Off-Block Time, AOBT — Actual Off-Block Time, ASBT — Actual Start Boarding Time, ARDT — Actual Ready for Departure Time, ASRT — Actual Start-up Request Time, TSAT — Target Startup Approval Time, ASAT — Actual Startup Approval Time, CTOT — Calculated Take-Off Time, TTOT — Target Take-Off Time, ATOT — Actual Take-Off Time); cửa/đỗ (DGATE — Departure Gate, DPRK — Departure Parking, DRWY — Departure Runway); DOORS OPENED TIME, DOORS CLOSED TIME, PAX LOADING START, PAX LOADING END. |
| FUNC-207 | Nguồn dữ liệu các mốc thời gian thực tế: lấy thẳng từ **ACARS** (đọc message ACARS để bóc tách các mốc out/off/on/in), không qua Mission Watch `[cần xác nhận tên hệ thống/màn hình hiện hành]`. | BR-125 | Khảo sát 11/06 chiều §II.6 — Thảo luận – Đề xuất + Kết luận | Điện văn ACARS (nhóm FOS ACARS: ACARS MED, ACARS OUT TIME, ACARS OFF TIME, ACARS ON TIME, ACARS IN TIME, ACARS GATE, ACARS OUT FUEL, ACARS OFF FUEL, ACARS ON FUEL, ACARS IN FUEL, ACARS TRIP FUEL, ACARS BLOCK FUEL, ACARS TXO FUEL, ACARS TXI FUEL); mốc bốn cơ bản OUT/OFF/ON/IN (FOS TIME: OUT TIME, OFF TIME, ON TIME, IN TIME). |
| FUNC-208 | Cập nhật real-time bằng cơ chế server-push (WebSocket / Server-Sent Events / Webhook) làm phương án 1; phương án 2 dự phòng là auto-refresh theo chu kỳ **chỉ phần dữ liệu có thay đổi**, không reload toàn trang. Tải lại theo phạm vi/ô có thay đổi (Show On / từng ô), với cấu hình hiển thị tham chiếu ~20 row × ~20–30 cột. | BR-125 | Khảo sát 11/06 chiều §II.6 — Thảo luận – Đề xuất + Kết luận | Sự kiện cập nhật (loại sự kiện, mã chuyến FLT NO, trường thay đổi, giá trị mới, dấu thời gian); cấu hình hiển thị overview (số hàng/cột người dùng chọn — tham chiếu BR-102); cơ chế truyền (WebSocket / SSE / Webhook) `[cần xác nhận giao thức cuối cùng]`. |
| FUNC-209 | Phân nhóm chuyến trên overview tối thiểu 3 nhóm: (a) chưa cất cánh / chuẩn bị cất cánh; (b) đang bay; (c) đã hạ cánh. | BR-125 | Khảo sát 11/06 chiều §II.6 — Thảo luận – Đề xuất + Kết luận | Chuyến bay (FLT NO, LEG STATE); mốc ACARS OFF (đã cất cánh) và ACARS ON / IN (đã hạ cánh) để phân loại nhóm; tiêu chí phân nhóm dựa trên LEG STATE + mốc OUT/OFF/ON/IN. |
| FUNC-210 | Cảnh báo trên overview bằng màu sắc / nhấp nháy (đỏ → xanh theo trạng thái); mỗi loại cảnh báo gắn với một mốc ACARS riêng để xác định lúc "raise" và lúc "clear" — ví dụ "cảnh báo A clear khi nhận OFF; cảnh báo B clear khi nhận ON; cảnh báo C clear khi nhận IN"; cảnh báo thời tiết (vd mưa dông) tự tắt khi bản tin được clear. Trong Phase 5 (In-Flight) KHÔNG monitoring chi tiết tiêu hao dầu real-time (không có dữ liệu live) — chỉ cập nhật trạng thái mốc bay; phân tích chi tiết dầu/đường bay thuộc báo cáo Post-Flight. | BR-125 | Khảo sát 11/06 chiều §II.6 — Thảo luận – Đề xuất + Kết luận | Cảnh báo (mã cảnh báo, mô tả, mốc ACARS gắn để raise/clear — OUT/OFF/ON/IN, trạng thái màu/nhấp nháy); Bản tin thời tiết (METAR/SPECI — tham chiếu BR-119) làm điều kiện clear cảnh báo thời tiết; mốc ACARS OFF/ON/IN (FOS ACARS); KHÔNG dùng dữ liệu tiêu hao nhiên liệu live (ACARS FUEL chỉ ghi tại các mốc OUT/OFF/ON/IN — không live trip fuel). |

### 2.26 BR-126 — Cảnh báo "Chuyến không thường lệ — OFP chưa có STS/HEAD"

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-211 | Nhận diện chuyến bay **không thường lệ** dựa vào mã loại chuyến (Flight Type Code) do VNA quy định — danh mục các mã được nguồn nêu: O, Z, G, H, A, P, V, S `[cần xác nhận danh mục đầy đủ và ý nghĩa từng code]`. Tham chiếu ATC FPL: chuyến thường lệ mang code `S` (Scheduled); chuyến không thường lệ chuyển sang `N` (Non-scheduled). | BR-126 | Khảo sát 11/06 chiều §II.2 — Thảo luận – Đề xuất + Kết luận |
| FUNC-212 | Kiểm tra OFP tương ứng của chuyến không thường lệ có chứa chỉ thị **STS/HEAD** (chỉ thị trạng thái đặc biệt trong mục 18 của ATC FPL theo ICAO Doc 4444) hay không; nếu OFP không có STS/HEAD → sinh cảnh báo "Chuyến không thường lệ — OFP chưa có STS/HEAD" cho điều phái viên để yêu cầu chỉnh OFP bổ sung. | BR-126 | Khảo sát 11/06 chiều §II.2 — Yêu cầu + Thảo luận – Đề xuất + Kết luận |
| FUNC-213 | Phạm vi áp dụng cảnh báo: chỉ ở giai đoạn **trước Captain's Release**; sau khi MO Plus đã release phần này, TOSS không cảnh báo nữa. | BR-126 | Khảo sát 11/06 chiều §II.2 — Kết luận |
| FUNC-214 | Lý do nghiệp vụ then chốt được ghi lại để truy vết: STS/HEAD là **căn cứ để hãng claim miễn trừ phí khí thải (CORSIA / EU ETS `[cần xác nhận tên cơ chế]`)** — nếu thiếu STS/HEAD, hãng phải chứng minh bằng tài liệu khác để được miễn trừ. Danh mục mã loại chuyến đầy đủ (O, Z, G, H, A, P, V, S…) và cơ chế chuyển sang `N` ở ATC FPL: (chưa có nguồn — cần SME bổ sung; sẽ làm rõ buổi sau). | BR-126 | Khảo sát 11/06 chiều §II.2 — Thảo luận – Đề xuất + Kết luận |

### 2.27 BR-127 — Cảnh báo đã filed ATC FPL cho chuyến bay

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-215 | Hiển thị trạng thái "đã filed ATC FPL hay chưa" cho từng chuyến bay trên danh sách chuyến bay điều hành. | BR-127 | YCKT sheet-08 #3 — "Cảnh báo filed ATC" |
| FUNC-216 | Sinh cảnh báo khi chuyến bay chưa được filed ATC FPL tại thời điểm cần kiểm tra. Tham số thời điểm kiểm tra (vd: bao nhiêu phút trước STD), nguồn dữ liệu xác nhận đã filed (AFTN/AMHS hay hệ thống nào khác), và phân loại đối tượng nhận cảnh báo: (chưa có nguồn — cần SME bổ sung). | BR-127 | YCKT sheet-08 #3 — chỉ liệt kê tên cảnh báo, chưa chi tiết hóa |

### 2.28 BR-128 — Cảnh báo TAT (Turn-Around Time) không đủ

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-217 | So sánh thời gian quay đầu thực tế (TAT — Turn-Around Time) của tàu bay tại sân với Scheduled TAT chuẩn theo quy định khai thác. | BR-128 | YCKT sheet-08 #20 — "Cảnh báo TAT không đủ quy định" |
| FUNC-218 | Sinh cảnh báo khi TAT không đủ so với Scheduled TAT chuẩn. Giá trị Scheduled TAT chuẩn theo loại tàu bay / sân bay / loại chuyến, ngưỡng cảnh báo cụ thể và đối tượng nhận: (chưa có nguồn — cần SME bổ sung). | BR-128 | YCKT sheet-08 #20 — chỉ liệt kê tên cảnh báo, chưa chi tiết hóa |

### 2.29 BR-129 — Cảnh báo Airport Constraints (Slot, curfew, hạn chế sân bay)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-219 | Quản lý / thu nạp dữ liệu Airport Constraints theo từng sân bay khai thác: slot, giờ giới nghiêm (curfew), các hạn chế sân bay khác. | BR-129 | YCKT sheet-04 dòng 374 (Airport Constraints) |
| FUNC-220 | Đối chiếu giờ kế hoạch / dự kiến của chuyến bay với Slot và khung giờ curfew của sân bay đi/đến để phát hiện vi phạm. | BR-129 | YCKT sheet-04 dòng 374 |
| FUNC-221 | Sinh cảnh báo khi chuyến bay có nguy cơ vi phạm Slot, curfew hoặc các hạn chế khác của sân bay. Danh mục đầy đủ các loại hạn chế sân bay được hỗ trợ và ngưỡng cảnh báo cụ thể: (chưa có nguồn — cần SME bổ sung). | BR-129 | YCKT sheet-04 dòng 374 — chỉ nêu hạng mục Airport Constraints, chưa chi tiết hóa |

### 2.30 BR-130 — Tự kiểm tra bất thường lịch bay (thay công cụ Excel của Tổ Lịch Bay)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-222 | Tự kiểm tra "lệch đầu" trên lịch bay và sinh cảnh báo khi phát hiện. Định nghĩa chính xác "lệch đầu" `[cần xác nhận]`: (chưa có nguồn — cần SME bổ sung). | BR-130 | YCKT sheet-04 dòng 376 — "lệch đầu" (mục tự kiểm tra bất thường lịch bay) |
| FUNC-223 | Tự kiểm tra "vặn tàu" tại sân bay Đà Nẵng (DAD) và các sân bay khác trên lịch bay, sinh cảnh báo khi phát hiện. Quy tắc xác định "vặn tàu" `[cần xác nhận]` và danh mục sân bay áp dụng: (chưa có nguồn — cần SME bổ sung). | BR-130 | YCKT sheet-04 dòng 376 — "vặn tàu tại DAD và sân bay khác" |
| FUNC-224 | Tự kiểm tra tàu bay hỏng APU có lịch khai thác đến sân bay không có thiết bị điện mặt đất; sinh cảnh báo khi phát hiện. *(Tham chiếu chéo BR-131; xem FUNC-228 — cùng năng lực nhưng BR cha BR-131 mô tả chi tiết hơn dưới dạng AC APU INOP.)* | BR-130, BR-131 | YCKT sheet-04 dòng 376 — "tàu hỏng APU đến sân không có thiết bị điện mặt đất" |
| FUNC-225 | Tự kiểm tra Ground Time của chuyến bay so với tiêu chuẩn quy định; sinh cảnh báo khi không đạt. Giá trị tiêu chuẩn Ground Time theo loại tàu / sân bay / loại chuyến: (chưa có nguồn — cần SME bổ sung). | BR-130 | YCKT sheet-04 dòng 376 — "Ground time vs tiêu chuẩn" |
| FUNC-226 | Tự kiểm tra BH (Block Hours) thực tế / kế hoạch so với BH mùa (BH theo mùa khai thác); sinh cảnh báo khi lệch. Định nghĩa "BH mùa" `[cần xác nhận]` và ngưỡng lệch: (chưa có nguồn — cần SME bổ sung). | BR-130 | YCKT sheet-04 dòng 376 — "BH vs BH mùa" |
| FUNC-227 | Tự kiểm tra tàu bay vi phạm phép bay (chuyến bay có lịch nhưng phép bay không hiệu lực / không bao trùm) và sinh cảnh báo. Quy tắc xác định "vi phạm phép bay" và nguồn dữ liệu phép bay: (chưa có nguồn — cần SME bổ sung). | BR-130 | YCKT sheet-04 dòng 376 — "tàu vi phạm phép bay" |

### 2.31 BR-131 — Cảnh báo AC APU INOP đến sân không có GPU/ASU/ACU

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-228 | Quản lý / khai báo tàu bay hỏng APU (AC APU INOP) với các trường: số đăng ký tàu bay (AC REG), thời điểm bắt đầu hiệu lực (From date time), thời điểm kết thúc hiệu lực (To date time — có thể chưa xác định). | BR-131 | YCKT sheet-04 dòng 167 (TOSS-126/127) — "AC APU INOP" |
| FUNC-229 | Duy trì danh mục sân bay theo khả năng cung cấp thiết bị điện/khí mặt đất: GPU (Ground Power Unit), ASU (Air Starter Unit), ACU (Air Conditioning Unit) — Available (Y/N) cho từng sân bay. | BR-131 | YCKT sheet-04 dòng 167; sheet-04 dòng 367–368 (GPU/ASU Available Y/N theo sân bay) |
| FUNC-230 | Đối chiếu các tàu bay APU INOP trong khoảng hiệu lực với lịch khai thác đến các sân bay không cung cấp GPU/ASU/ACU; sinh cảnh báo "tàu bay hỏng APU có lịch bay đến sân bay không cung cấp điện khí mặt đất". | BR-131 | YCKT sheet-08 #10 — "Cảnh báo tàu bay hỏng APU có lịch bay đến các sân bay không cung cấp điện khí mặt đất"; YCKT sheet-04 dòng 167 |

### 2.32 BR-132 — Bật/tắt cảnh báo hai cấp (mặc định hệ thống + cá nhân user)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-231 | Cung cấp giao diện cấu hình bật/tắt cảnh báo ở mức **mặc định toàn hệ thống** dành cho quản trị viên (admin) — áp dụng làm trạng thái khởi tạo cho mọi người dùng. | BR-132 | YCKT sheet-08 #22 — "Cho phép cấu hình bật tắt cảnh báo mặc định và mỗi user tự cấu hình bật tắt cảnh báo của mình" |
| FUNC-232 | Cung cấp giao diện cấu hình bật/tắt cảnh báo ở mức **cá nhân từng người dùng** — cho phép từng user tự bật/tắt cảnh báo của riêng mình, ghi đè trạng thái mặc định của hệ thống. | BR-132 | YCKT sheet-08 #22 |
| FUNC-233 | Áp dụng nguyên tắc ghi đè: trạng thái cá nhân (nếu được thiết lập) ưu tiên hơn trạng thái mặc định hệ thống khi quyết định hiển thị cảnh báo. | BR-132 | YCKT sheet-08 #22 |
| FUNC-234 | Phạm vi danh mục cảnh báo được phép bật/tắt: toàn bộ cảnh báo của Phân hệ 1 đã liệt kê trong sheet-08 (tổ bay chưa download tài liệu, filed ATC, OFP có thay đổi, code O không có STS/HEAD, sắp hết Flight Cycle, APU INOP, không có Performance Factor, thiếu tài liệu trước ETD, MEL ảnh hưởng, VIP/nối chuyến, Loadfactor thấp, delay, đổi tổ bay, divert, thiếu phép bay, TAT không đủ, thiếu điện văn). | BR-132 | YCKT sheet-08 — toàn bộ danh mục cảnh báo (#2 → #21) |
| FUNC-235 | Lưu vết các lần thay đổi cấu hình bật/tắt cảnh báo (cấp hệ thống và cấp cá nhân) phục vụ truy vết. Quy tắc lưu vết cụ thể (trường ghi nhận, thời hạn lưu): (chưa có nguồn — cần SME bổ sung). | BR-132 | (chưa có nguồn — cần SME bổ sung) |

> **Bổ sung v0.5 — Khảo sát 12/06 (màn Giám sát chuyến bay & Flight Detail, trên bản mẫu `dsp_monitoring_poc.html`).** Nguồn dẫn: KS 12/06 = `BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md`; §III#n = nội dung thống nhất thứ n.

### 2.33 BR-133 — Flight Detail mở ở tab mới (nhiều tab)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-236 | Khi điều phái click một chuyến trên màn Giám sát, mở màn chi tiết chuyến bay (Flight Detail) của chuyến đó ở **một tab mới** (không dùng pop-up gộp). | BR-133 | KS 12/06 §II.1; §III#1 |
| FUNC-237 | Cho phép mở **đồng thời nhiều tab Flight Detail** (mỗi chuyến một tab) để tham chiếu/so sánh nhiều chuyến. | BR-133 | KS 12/06 §II.1; §III#1 |

### 2.34 BR-134 — Click cảnh báo → active đúng tab phụ

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-238 | Khi click một cảnh báo cụ thể trên màn Giám sát, điều hướng tới Flight Detail và **active đúng tab phụ** tương ứng (vd cảnh báo OFP Release → tab Flight Release; cảnh báo NOTAM/thời tiết → tab NOTAM/thời tiết). | BR-134 | KS 12/06 §II.1; §III#2 |

### 2.35 BR-135 — Tab phụ Flight Detail + đầy đủ lịch sử

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-239 | Tổ chức Flight Detail thành các tab phụ tối thiểu: Cảnh báo (Warnings), Flight Release (Dispatch Release + Pilot Release), Tàu bay (kèm MEL/CDL), Tổ bay. | BR-135 | KS 12/06 §II.2; §III#3 |
| FUNC-240 | Tab Cảnh báo hiển thị toàn bộ cảnh báo từ đầu đến cuối chuyến kèm **thời điểm phát sinh (raise time)** và **trạng thái xử lý** từng cảnh báo. | BR-135 | KS 12/06 §II.2 |
| FUNC-241 | Tab Flight Release hiển thị **toàn bộ phiên bản OFP đã phát hành** + thông tin cơ bản từng bản (Block Fuel kế hoạch/OFP, lượng phi công confirm, có lấy thêm tải/dầu extra + lý do). | BR-135 | KS 12/06 §II.2 |
| FUNC-242 | Mỗi tab phụ hiển thị **đầy đủ lịch sử thay đổi** từ đầu đến cuối chuyến (không chỉ trạng thái cuối) — áp format lịch sử đổi chung (xem FUNC-275 / BR-150). | BR-135 | KS 12/06 §II.2; §III#3 |

### 2.36 BR-136 — Flight Number 3 cột tách biệt từ Netline

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-243 | Tiếp nhận Flight Number từ Netline ở **3 cột tách biệt**: Carrier, Fly Number (phần số), FN Surface (hậu tố D/Z). | BR-136 | KS 12/06 §II.3; §III#4 |
| FUNC-244 | Hiển thị gộp Flight Number (carrier + number + suffix) trên màn Giám sát, đồng thời giữ riêng từng cột phục vụ lọc/phân quyền dữ liệu. | BR-136 | KS 12/06 §II.3 |
| FUNC-245 | Ý nghĩa hậu tố `Z` (so với `D`) và điều kiện sinh `Z`: (chưa có nguồn — cần SME bổ sung). | BR-136 | KS 12/06 §IV (OID SME-34) |

### 2.37 BR-137 — Đồng bộ leg history từ Netline

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-246 | Đồng bộ **leg history** từ Netline cho mỗi chuyến: từng lần đổi giờ EPD (thời điểm, chuyển ngày, mức delay); TOSS đối chiếu/hiển thị, không tự ghi nhận song song. | BR-137 | KS 12/06 §II.3; §III#4 |

### 2.38 BR-138 — Bộ 4 mã màu thống nhất + tô màu cả ô

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-247 | Định nghĩa **bộ mã màu 4 trạng thái** dùng chung cho mọi cột: Đỏ (xử lý ngay) / Vàng (lưu ý) / Xanh (đã xử lý) / Không màu (bình thường); tối đa ~4–5 màu. | BR-138 | KS 12/06 §II.7; §III#5,#9 |
| FUNC-248 | Thể hiện cảnh báo bằng **tô màu cả ô (cell-level)**, không bo box, không chỉ đổi màu chữ; ký hiệu trạng thái đơn giản (tích/tam giác) cho các cột dùng biểu tượng. | BR-138 | KS 12/06 §II.4, §II.7 |

### 2.39 BR-139 — Xanh-sau-đỏ + đổi màu tự động

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-249 | Áp quy tắc **Xanh chỉ phát sinh sau khi đã từng có Đỏ và được xử lý xong**; Không màu là mặc định, không tự chuyển Xanh. | BR-139 | KS 12/06 §II.7; §III#10 |
| FUNC-250 | Đổi màu cảnh báo **tự động** theo thay đổi trạng thái dữ liệu nguồn (Lido/Netline/MO Plus/ACARS); điều phái **không tick thủ công** trên màn Giám sát. | BR-139 | KS 12/06 §II.7; §III#11 |

### 2.40 BR-140 — View-only (ngoại lệ Dispatch Release) + thống kê khối lượng

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-251 | Màn Giám sát chỉ "view + cảnh báo", **không cho thao tác trực tiếp** thay đổi dữ liệu trên bảng — ngoại lệ duy nhất là cột Dispatch Release (xem FUNC-264). | BR-140 | KS 12/06 §II.7; §III#12 |
| FUNC-252 | Lưu lượng trạng thái "Xanh đã xử lý" theo thời gian phục vụ **thống kê khối lượng công việc** (ngày yên/cao điểm) — cơ sở chia ca/nhân lực. Quy tắc thống kê cụ thể: (chưa có nguồn — cần SME bổ sung). | BR-140 | KS 12/06 §II.7; §III#13 |

### 2.41 BR-141 — Phân quyền 2 lớp + nhiều role + switch view

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-253 | Phân quyền **2 lớp**: (a) chức năng (ai dùng chức năng nào); (b) dữ liệu (scope theo carrier/khu vực/role). | BR-141 | KS 12/06 §II.5; §III#6 |
| FUNC-254 | Hỗ trợ một user có **nhiều role** và **switch view** sang role khác; super admin xem toàn bộ; sub-admin phân chia phạm vi theo nhiệm vụ (điều phái rotate vị trí trong ca). | BR-141 | KS 12/06 §II.5 |
| FUNC-255 | Filter mặc định gắn theo phạm vi của role khi user mở màn Giám sát; user vẫn chọn/search phạm vi khác khi cần. | BR-141 | KS 12/06 §II.5 |
| FUNC-256 | Mã hóa khu vực điều phái (Âu/Mỹ/Hàn/ĐNA…) dùng cho phân quyền dữ liệu: (chưa có nguồn — cần SME bổ sung). | BR-141 | KS 12/06 §IV (OID SME-36) |

### 2.42 BR-142 — Profile cá nhân + bộ lọc thu/mở

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-257 | Lưu **filter + cấu hình hiển thị (cột, sort) + "trạng thái gần nhất"** theo **profile cá nhân (mức user)**, không theo máy; khôi phục khi user mở lại màn Giám sát ở bất kỳ máy nào. | BR-142 | KS 12/06 §II.5; §III#7 |
| FUNC-258 | Thanh bộ lọc có cơ chế **thu/mở (expand/collapse)** để tối ưu diện tích hiển thị. | BR-142 | KS 12/06 §II.4, §II.5 |

### 2.43 BR-143 — Quy ước giao diện chung (EN/UTC/24h/dark)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-259 | Áp quy ước giao diện toàn hệ thống: **100% tiếng Anh**; **mọi giờ UTC** (kể cả history khi submit từ thiết bị giờ Việt Nam); **format 24h**; **dark mode ưu tiên** (light mode tinh chỉnh sau). | BR-143 | KS 12/06 §II.6; §III#8 |

### 2.44 BR-144 — Cột Aircraft Registration (REG)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-260 | Cột REG cảnh báo theo logic kết hợp (tàu Netline × tàu trên OFP đã Dispatch Release): Đỏ = lệch tàu + đã release; Vàng = khớp tàu nhưng chưa release; Xanh = khớp + đã release; Không màu = chưa có OFP. | BR-144 | KS 12/06 §II.9; §III#17 |
| FUNC-261 | Hover ô REG hiển thị **REG cũ → REG mới + giờ đổi trên Netline (UTC)**; click ô REG mở Flight Detail tab Tàu bay với **lịch sử đổi tàu** đầy đủ. | BR-144 | KS 12/06 §II.9; §III#18 |
| FUNC-262 | Hiển thị REG: lược tiền tố "VN" cho nhóm VNA/VNB (VNA893 → A893; VNB… → B…); nhóm khác (vd XU) giữ nguyên. Chính sách đồng nhất hay cho user cấu hình: (chưa có nguồn — cần SME bổ sung). | BR-144 | KS 12/06 §II.9; §III#19 (OID KS-35) |

### 2.45 BR-145 — Cột Dispatch Release (action shortcut)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-263 | Bổ sung **cột Dispatch Release** trên màn Giám sát với 2 trạng thái (chưa/đã release). | BR-145 | KS 12/06 §II.10; §III#20 |
| FUNC-264 | Cho phép điều phái **bấm Dispatch Release trực tiếp** tại cột (action shortcut) — ngoại lệ "có action" duy nhất của màn Giám sát. | BR-145 | KS 12/06 §II.10 |
| FUNC-265 | Áp cơ chế "2 chốt kiểm soát": bấm Release tại cột này **clear đồng bộ** trạng thái Vàng ở các cột liên quan (REG…) khi thỏa điều kiện. | BR-145 | KS 12/06 §II.9, §II.10; §III#20 |

### 2.46 BR-146 — Cột Flight Number (cảnh báo suffix D/Z)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-266 | Cột Flight Number cảnh báo theo hậu tố: **Vàng** khi có D/Z (giữ Vàng, không chuyển Xanh — chuyến đặc thù); **Đỏ** khi trước có D/Z nay mất (giật về ngày gốc). | BR-146 | KS 12/06 §II.11; §III#21 |
| FUNC-267 | Hover hiển thị **lịch sử D/Z** (thời điểm thêm/mất trên Netline) phục vụ truy vết/báo cáo cấp trên. | BR-146 | KS 12/06 §II.11 |
| FUNC-268 | Trường hợp chuyển sang ngày sau **không qua D/Z** (chỉ đổi ETD) → cảnh báo ở **cột ETD**, không phải Flight Number. Hành vi hệ thống **Ops++** khi chuyến mất D/giật về gốc: (chưa có nguồn — cần SME bổ sung). | BR-146 | KS 12/06 §II.11; §III#22 (OID SME-35/KS-36) |

### 2.47 BR-147 — Cột ETA / IN / ARR

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-269 | Cột ETA/IN/ARR chuyển **Xanh (hoàn tất chuyến)** khi nhận **điện IN (→ ARR)**; lấy nguồn **Netline (trạng thái ARR)** HOẶC **điện ACARS IN** — nguồn tới trước (tham chiếu FUNC-205/207 — mốc ACARS). | BR-147 | KS 12/06 §II.12; §III#23 |
| FUNC-270 | Nguồn giờ hạ cánh/vào gate: **A-CDM** nội địa (gần real-time) + quốc tế (chấp nhận trễ); khi cột Xanh → clear/chuyển trạng thái cuối các cảnh báo liên quan của chuyến. | BR-147 | KS 12/06 §II.8, §II.12 |

### 2.48 BR-148 — Time window cấu hình + trôi theo giờ thực

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-271 | Áp **time window cấu hình** (look-back + look-ahead; look-ahead đủ rộng cho mốc upload OFP quốc tế 240 phút); admin set mặc định theo role, user override + lưu profile (FUNC-257). | BR-148 | KS 12/06 §II.8; §III#14 |
| FUNC-272 | Bảng **trôi theo giờ thực** (chuyến mới đẩy vào, chuyến IN/ARR rời khỏi); ~25 dòng thường trực, vẫn scroll xem ngoài window; **sắp xếp mặc định theo ETD**. | BR-148 | KS 12/06 §II.8; §III#14,#16 |

### 2.49 BR-149 — Flight Watch (chuyến chưa đáp) + "vào gate chậm"

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-273 | Giữ giám sát **chuyến đường dài chưa đáp** đến khi nhận IN/ARR dù đã ngoài time window (phạm vi Flight Watch / In-Flight Monitoring Phase 5); cơ chế giữ lại (filter phụ/giữ bảng/scroll): (chưa có nguồn — cần SME bổ sung). | BR-149 | KS 12/06 §II.8; §III#15 (OID KS-33) |
| FUNC-274 | Sinh cảnh báo **"vào gate chậm"** khi chuyến vào gate chậm so với ETA kết điểm; ngưỡng phút trễ cụ thể: (chưa có nguồn — cần SME bổ sung). | BR-149 | KS 12/06 §II.8 (OID KS-34) |

### 2.50 BR-150 — Format hiển thị "lịch sử đổi" chung

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-275 | Áp **một format hiển thị "lịch sử đổi" chung** (ưu tiên timeline **kéo dọc**, mỗi mốc nối nhau bằng mũi tên kèm giờ thay đổi theo UTC) cho mọi đối tượng cần truy vết. | BR-150 | KS 12/06 §II.13; §III#24 |
| FUNC-276 | Áp trước cho: lịch sử đổi tàu (FUNC-261), đổi tổ bay, đổi giờ ETD, lịch sử suffix D/Z (FUNC-267). | BR-150 | KS 12/06 §II.13 |

---

> **Bổ sung v0.6 — Đặc tả cột màn Flight Dispatch (Flight monitoring).** Nguồn dẫn: `wf-monitoring-overview.md` §8 (sheet Function list `[FL-FD]`) + §9 (đối chiếu YCKT TOSS-175…182 + báo cáo KS). Chỉ phân rã FUNC cho **các cột đã rõ nguồn, KHÔNG vướng cờ OID mở**; các cột còn cờ liệt kê tại §2.51.0 (lý do bỏ qua). Mỗi FUNC kèm **Tiêu chí chấp nhận (AC — Acceptance Criteria)** chép trung thực logic màu/ngưỡng; phần còn cờ giữ nguyên `[cần xác nhận — KS-xx]`, không suy diễn (CLAUDE.md §0).

## 2.51 Đặc tả cột màn Flight Dispatch — các cột đã rõ nguồn (v0.6)

### 2.51.0 Các cột BỎ QUA (còn vướng cờ OID mở — chưa phân rã FUNC)

| Cột | Lý do bỏ qua (cờ OID) | Khi nào phân rã được |
|---|---|---|
| ATC (cột 21) | Màu/ngưỡng chưa có nguồn — `[KS-70]`; sheet chỉ ghi "như MO", báo cáo KS chưa nêu ngưỡng. | Sau khi SME chốt quy tắc màu/ngưỡng ATC. |
| TO/LD — MTOW/MLDW (cột 22) | Màu/ngưỡng chưa có nguồn — `[KS-70]`; sheet có logic EST TO/LD vs MTOW/MLDW nhưng không nêu màu. | Sau khi SME chốt ngưỡng RTOW/màu (gợi ý ma trận System Admin). |
| Taxi APU (cột 24) | Màu/ngưỡng chưa có nguồn — `[KS-70]`; chỉ ghi "lệch Taxi/APU so với FON". | Sau khi SME chốt Standard Taxi Time + màu. |
| EPLD (cột 13) | Ngưỡng màu vàng/đỏ cụ thể chưa rõ — `[KS-71]`; chỉ có ma trận loại tàu × giờ bay × trần/sàn (chưa map ra màu). | Sau khi SME chốt "lệch X → vàng; lệch Y → đỏ". |
| EST DOW (cột 14) | Như EPLD — ngưỡng màu chưa rõ — `[KS-71]`. | Như EPLD. |
| ZFW-DOW (cột 19) | §9.2 có khung 60′ nội địa / 90′ quốc tế + ma trận System Admin nhưng **màu cụ thể vẫn trống** (cờ §8-4 / KS-71); ranh giới với EPLD/EST DOW chưa chốt. | Sau khi SME chốt màu + ranh giới với EPLD/EST DOW. |
| 6 cột bổ sung TOSS-180 (cabin defect / PAX nối chuyến / loadfactor thấp / thiếu phép bay / TAT không đủ / thiếu điện văn) | Tách cột riêng hay gộp vào cột hiện có chưa chốt — `[KS-76]` (§9-1). | Sau khi SME quyết tách/gộp + ngưỡng từng trường. |
| Filter 1–20 (§8.3) | Trường lọc tường minh chưa liệt kê — `[KS-72]` (§8-5). | Sau khi SME xác nhận từng filter. |
| Tooltip hover 19 cột (§8.7 §8-10) | Nội dung tooltip cụ thể chưa có — `[KS-74]`. | Sau khi SME bổ sung tooltip. |
| Details (lịch sử) các cột ngoài REG/FLTNO/ETD/Flight Type | Cột nào cần Details riêng chưa chốt — `[KS-75]` (§8-11). | Sau khi SME bổ sung; khung format chung đã có (FUNC-275/276). |

### 2.51.1 Cột DSP Release (checkbox + action release)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-277 | Hiển thị cột **DSP Release** dạng ô chọn (checkbox) trên màn Flight Dispatch; ô chỉ **active** khi OFP của chuyến đã tới thời điểm cần release (cửa sổ release Dispatch). | BR-213, BR-224 | `[wf-monitoring §8.2 cột 1]` · `[FL-FD]` · `[15062026 §II.2 #5,#6]` |
| FUNC-278 | Khi điều phái bấm ô DSP Release đang active → thực hiện **release OFP**; điều kiện active còn ràng buộc **bóc tách OFP để đối chiếu user DSP đang đăng nhập với số license trên DSP license trong thông tin user** (chỉ user có license phù hợp mới release được). | BR-213, BR-224 | `[wf-monitoring §8.2 cột 1]` · `[FL-FD]` |

**FUNC-277 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** một chuyến chưa tới cửa sổ release Dispatch, **When** màn Flight Dispatch hiển thị, **Then** ô DSP Release của chuyến ở trạng thái **inactive** (không bấm được).
- [ ] **Given** OFP của chuyến đã tới thời điểm cần release (cửa sổ: sớm nhất 75′ quốc nội / 90′ quốc tế; muộn nhất 60′ quốc nội / 75′ quốc tế trước ETD — `[15062026 §II.2 #5,#6]`), **When** màn hiển thị, **Then** ô DSP Release **active**.

**FUNC-278 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** ô DSP Release active và user đang đăng nhập **có** số DSP license khớp với license yêu cầu (bóc tách từ OFP), **When** user bấm ô, **Then** hệ thống thực hiện release OFP của chuyến đó.
- [ ] **Given** ô DSP Release active nhưng user đang đăng nhập **không** có DSP license phù hợp, **When** user bấm ô, **Then** hệ thống **không** cho release (chỉ user có license phù hợp mới release được).
- [ ] Quy tắc màu riêng cho ô checkbox này: *(sheet không định nghĩa màu cho ô DSP Release — không suy diễn).*

### 2.51.2 Cột OFP DSP (hiển thị + logic màu theo trạng thái revision)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-279 | Hiển thị cột **OFP DSP**: OFP number và OFP Revision cuối; định dạng chuỗi `2/0/1 R2` `[cần xác nhận ý nghĩa các số 2/0/1 — KS-69 / §8-1]`. | BR-213, BR-224 | `[wf-monitoring §8.2 cột 11]` · `[FL-FD]` |
| FUNC-280 | Phân màu cột OFP DSP theo trạng thái revision cuối so với Dispatch Release (3 màu); bổ sung ngưỡng thời gian cùng nhóm với NOTAM (xem AC). | BR-213, BR-224 | `[wf-monitoring §8.2 cột 11]` · `[FL-FD]` · `[15062026 §II.2 #5,#6]` |

**FUNC-279 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** chuyến có OFP, **When** màn hiển thị, **Then** cột OFP DSP hiển thị OFP number + Revision cuối.
- [ ] Định dạng chuỗi `2/0/1 R2`: hiển thị đúng theo sheet, **giữ cờ** `[cần xác nhận ý nghĩa 2/0/1 — KS-69]` (chưa diễn giải ý nghĩa 3 số đầu — không suy diễn).

**FUNC-280 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** Revision cuối đã được Dispatch Release, **Then** ô OFP DSP **Xanh**.
- [ ] **Given** Revision cuối **chưa** release nhưng có một revision trước đó đã release, **Then** ô OFP DSP **Vàng**.
- [ ] **Given** Revision cuối chưa release và **trước đó chưa có revision nào** được DSP release, **Then** ô OFP DSP **Đỏ**.
- [ ] **Given** chuyến **chưa có OFP**, **Then** ô OFP DSP **Không màu**.
- [ ] Ngưỡng thời gian (cùng nhóm cột NOTAM — `[15062026 §II.2]`): khi đã có OFP mà DSP chưa release → **Vàng** từ 75→60′ quốc nội (90→75′ quốc tế); **Đỏ** từ 60′ quốc nội / 75′ quốc tế trước ETD.
- [ ] Hover ô hiển thị: `Thời gian upload, Tên DSP, thời gian release` (theo sheet).

### 2.51.3 Cột Pilot release (trạng thái + logic màu)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-281 | Hiển thị cột **Pilot release**: chưa confirm → gạch trắng; đã confirm → hiển thị phiên bản OFP (vd `R01`); phân màu theo trạng thái release/Reject (3 màu). | BR-214, BR-225 | `[wf-monitoring §8.2 cột 12]` · `[FL-FD]` |
| FUNC-282 | Cảnh báo **Vàng** khi 30 phút trước ETD mà Pilot chưa release. | BR-214, BR-225 | `[wf-monitoring §9.2 cột 12]` · `[15062026 §II.2 #7,#8]` |

**FUNC-281 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** Pilot chưa confirm, **Then** ô Pilot release hiển thị **gạch trắng**.
- [ ] **Given** Pilot đã confirm, **Then** ô hiển thị phiên bản OFP (vd `R01`).
- [ ] **Given** Pilot đã release đúng OFP cuối mà DSP đã release, **Then** ô **Xanh**.
- [ ] **Given** Pilot đã release một OFP **trước** OFP cuối (OFP release), **Then** ô **Vàng**.
- [ ] **Given** Pilot **Reject**, **Then** ô **Đỏ**.
- [ ] Hover ô hiển thị: `Thời gian release` (theo sheet).

**FUNC-282 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** còn 30 phút trước ETD mà Pilot **chưa** release, **Then** sinh cảnh báo **Vàng** tại cột Pilot release (`[15062026 §II.2 #7,#8]`).
- [ ] *Ghi chú nguồn:* "PIC Confirm" là cột đề xuất bổ sung tách riêng khỏi Pilot release (`[YCKT TOSS-181]`) — **chưa phân rã FUNC riêng** (chờ SME chốt tách cột); Un-Release luôn sinh phiên bản mới và khóa release tạm thời `[ghi nhận nguồn — chưa đủ chi tiết để phân rã]`.

### 2.51.4 Cột Flight Type (chip loại chuyến + lịch sử + logic màu)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-283 | Hiển thị cột **Flight Type** dạng chip loại chuyến (J/G/P/A/VIP/Ferry/Thường); cho phép kiểm tra/đổi loại chuyến và **lưu lịch sử thay đổi loại** (VIP ↔ Thường; Thường ↔ Ferry và ngược lại). | BR-126 | `[wf-monitoring §8.2 cột 9]` · `[FL-FD]` |
| FUNC-284 | Phân màu cột Flight Type theo trạng thái đổi loại + đối chiếu Status head ATC/OFP (xem AC). | BR-126 | `[wf-monitoring §8.2 cột 9]` · `[FL-FD]` · `[11062026-chiều §II.2]` |

**FUNC-283 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** một chuyến, **Then** cột Flight Type hiển thị chip loại chuyến theo flight type.
- [ ] **Given** loại chuyến thay đổi (VIP ↔ Thường, hoặc Thường ↔ Ferry), **Then** hệ thống **lưu lịch sử** thay đổi (đổi từ code nào sang code nào + thời điểm).
- [ ] Hover/Details hiển thị lịch sử đổi code (theo sheet — hàng Hover/Details của cột 9).

**FUNC-284 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** chuyến đã có ATC và OFP ra nhưng **chưa release**, **Then** ô Flight Type **Vàng**.
- [ ] **Given** chuyến đổi **Thường ↔ Ferry**, **Then** ô **Đỏ**.
- [ ] **Given** chuyến đổi **Thường ↔ VIP**, **Then** ô **Đỏ**.
- [ ] **Given** Status head ATC và OFP đã release **khớp** (áp dụng chuyển Thường → VIP và ngược lại), **Then** ô **Xanh**.
- [ ] **Given** chuyển Thường ↔ Ferry, **Then** việc xác định dựa vào **số pax trong OFP** (theo sheet).

### 2.51.5 Cột BLOCK FUEL (hiển thị OFP Block Fuel)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-285 | Hiển thị cột **BLOCK FUEL** = giá trị OFP Block Fuel của chuyến. | BR-110 | `[wf-monitoring §8.2 cột 15]` · `[FL-FD]` |

**FUNC-285 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** chuyến có OFP, **Then** cột BLOCK FUEL hiển thị giá trị OFP Block Fuel.
- [ ] Quy tắc màu riêng cho cột BLOCK FUEL: *(sheet để trống hàng Color — §8-9; không suy diễn).* Cảnh báo "30′ trước ETD pilot chưa release" được thể hiện ở cột PILOT EXTRA (FUNC-287), không tại cột BLOCK FUEL.

### 2.51.6 Cột PILOT EXTRA (delta + cảnh báo)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-286 | Hiển thị cột **PILOT EXTRA** = `Pilot Release − OFP Block Fuel` của đúng revision OFP được Pilot release; **bỏ trống** nếu chuyến chưa có Flight Release. | BR-309 | `[wf-monitoring §8.2 cột 16]` · `[FL-FD]` |
| FUNC-287 | Cảnh báo màu **Đỏ** tại cột PILOT EXTRA khi 30 phút trước EDT/ETD mà Pilot chưa release. | BR-309 | `[wf-monitoring §8.2 cột 16]` · `[wf-monitoring §9.2 cột 16]` · `[POC §7.2]` · `[15062026 §II.2]` |

**FUNC-286 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** chuyến **chưa** có Flight Release, **Then** cột PILOT EXTRA **bỏ trống**.
- [ ] **Given** chuyến đã có Pilot Release, **Then** cột hiển thị giá trị `Pilot Release − OFP Block Fuel` của đúng revision OFP được Pilot release (+ thêm / − ít).

**FUNC-287 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** còn 30 phút trước EDT/ETD mà Pilot **chưa** release, **Then** cột PILOT EXTRA cảnh báo màu **Đỏ** (đồng nhất với cảnh báo Vàng tại Pilot release FUNC-282; màu Đỏ tại cột PILOT EXTRA theo `[wf-monitoring §9.2 cột 16]`).

### 2.51.7 Cột NOTAM (cảnh báo theo ngưỡng thời gian)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-288 | Cột **NOTAM** — nhánh **chưa có OFP**: cảnh báo theo ngưỡng thời gian trước giờ tham chiếu (Vàng 210′ nội địa / 270′ quốc tế; Đỏ 75′ nội địa / 95′ quốc tế). | BR-118 | `[wf-monitoring §8.2 cột 17]` · `[FL-FD]` · `[15062026 §II.2]` · `[11062026-sáng §6 #10,#11]` |
| FUNC-289 | Cột **NOTAM** — nhánh **đã có OFP, DSP chưa release**: hiển thị phiên bản OFP; Vàng từ 75→60′ nội địa (90→75′ quốc tế); Đỏ từ 60′ nội địa / 75′ quốc tế. | BR-118 | `[wf-monitoring §8.2 cột 17]` · `[FL-FD]` · `[15062026 §II.2]` |
| FUNC-290 | Cột **NOTAM** — nhánh **đã có OFP, DSP đã release**: hiển thị phiên bản OFP; ô **Xanh**. | BR-118 | `[wf-monitoring §8.2 cột 17]` · `[FL-FD]` |

**FUNC-288 — Tiêu chí chấp nhận (AC):** *(nhánh chưa có OFP)*
- [ ] **Given** chuyến chưa có OFP và **chưa** tới giờ tham chiếu, **Then** ô NOTAM hiển thị `(-)` (không màu).
- [ ] **Given** chuyến chưa có OFP và **sắp** tới giờ ở mức cảnh báo sớm — còn **210′ quốc nội / 270′ quốc tế** — **Then** ô NOTAM `(!)` **Vàng**.
- [ ] **Given** chuyến chưa có OFP và **sắp** tới giờ ở mức cảnh báo gấp — còn **75′ quốc nội / 95′ quốc tế** — **Then** ô NOTAM `(!)` **Đỏ**.

**FUNC-289 — Tiêu chí chấp nhận (AC):** *(nhánh đã có OFP, DSP chưa release)*
- [ ] **Given** chuyến đã có OFP nhưng DSP **chưa** release, **Then** ô NOTAM hiển thị phiên bản OFP.
- [ ] **Given** còn **75→60′ quốc nội (90→75′ quốc tế)** trước giờ tham chiếu, **Then** ô NOTAM **Vàng**.
- [ ] **Given** còn **dưới 60′ quốc nội / 75′ quốc tế**, **Then** ô NOTAM **Đỏ**.

**FUNC-290 — Tiêu chí chấp nhận (AC):** *(nhánh đã có OFP, DSP đã release)*
- [ ] **Given** chuyến đã có OFP và DSP **đã** release, **Then** ô NOTAM hiển thị phiên bản OFP và ô **Xanh**.
- [ ] *Ghi chú nguồn:* NOTAM phân 3 nhóm (sân bay / vùng trời / đường bay) — tham chiếu FUNC-175; NOTAM cứu hỏa (RFFS) khi phát ra cảnh báo trực tiếp — tham chiếu FUNC-177. Việc các cột MEL/WX/ZFW có dùng đúng cùng ngưỡng nhóm này hay không còn cờ `[cần xác nhận — §8-3]`.

### 2.51.8 Cột WX (cảnh báo thời tiết 3 thông số)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-291 | Cột **WX** — cảnh báo thời tiết sân bay (cất/hạ cánh) dựa trên 3 thông số: tầm nhìn (Visibility), trần mây (Cloud Ceiling), mưa giông (TSRA), so với VMA + biên an toàn (margin). | BR-119 | `[wf-monitoring §8.2 cột 18]` · `[wf-monitoring §9.2 cột 18]` · `[11062026-sáng §7 #12,#13]` |
| FUNC-292 | Cột **WX** — nguồn dữ liệu & chu kỳ: căn cứ bản tin **METAR (30 phút/lần)** + **SPECI** khi có biến động; nguồn nội địa = VATM/VNCM, quốc tế = Lido. | BR-119 | `[wf-monitoring §9.2 cột 18]` · `[11062026-sáng §7]` |

**FUNC-291 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** bản tin thời tiết của sân bay cất/hạ cánh, **When** một trong 3 thông số (tầm nhìn / trần mây / TSRA) vượt ngưỡng **VMA `[cần xác nhận viết tắt — §8-5]` + biên an toàn**, **Then** cột WX phát cảnh báo (so với VMA + margin để cảnh báo sớm — tham chiếu FUNC-182/183).
- [ ] Cảnh báo tự **clear** khi bản tin METAR/SPECI mới đưa thời tiết về trong ngưỡng (tham chiếu FUNC-210 — clear theo bản tin mới).
- [ ] Quy tắc màu vàng/đỏ riêng theo mức vượt: WX **áp cùng ngưỡng nhóm với NOTAM** nhưng việc dùng chung cờ `[cần xác nhận — §8-3]` (chưa diễn giải mức màu riêng — không suy diễn).

**FUNC-292 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** sân bay nội địa, **Then** ưu tiên nguồn METAR/SPECI từ VATM/VNCM (tham chiếu FUNC-184).
- [ ] **Given** sân bay quốc tế, **Then** ưu tiên nguồn thời tiết trong Lido (tham chiếu FUNC-185).
- [ ] Hệ thống cập nhật theo **METAR 30 phút/lần** và **SPECI** khi có biến động.

### 2.51.9 Cột MEL/CDL (cảnh báo tích hợp AMOS)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-293 | Cột **MEL/CDL** — cảnh báo lỗi kỹ thuật MEL/CDL tích hợp từ AMOS (Master MEL) ảnh hưởng nhiên liệu / mực bay. | BR-121, BR-407 | `[wf-monitoring §8.2 cột 20]` · `[wf-monitoring §9.2 cột 20]` · `[FL-FD]` |

**FUNC-293 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** một MEL/CDL từ AMOS (Master MEL) ảnh hưởng nhiên liệu hoặc mực bay của chuyến, **Then** cột MEL/CDL phát cảnh báo (tham chiếu FUNC-193/194 — quy tắc theo khoảng hiệu lực).
- [ ] *Ghi chú nguồn:* tích hợp AMOS — "Chờ xem xét tích hợp"; cảnh báo gắn AMOS có thể trễ do tích hợp. Quy tắc màu riêng + việc dùng chung ngưỡng OFP với NOTAM còn cờ `[cần xác nhận — §8-3]` (không suy diễn).

### 2.51.10 Cột Missing Document (cảnh báo thiếu tài liệu)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-294 | Cột **Missing Document** — cảnh báo chuyến bay thiếu tài liệu (OFP, NOTAM, WX). | BR-112, BR-222 | `[wf-monitoring §8.2 cột 23]` · `[FL-FD]` · `[11062026-chiều §II.1 #1]` · `[YCKT TOSS-175]` |

**FUNC-294 — Tiêu chí chấp nhận (AC):**
- [ ] **Given** một chuyến thiếu một trong các tài liệu OFP / NOTAM / WX, **Then** cột Missing Document cảnh báo (liệt kê tài liệu còn thiếu).
- [ ] *Ghi chú nguồn:* ngưỡng thời gian cảnh báo là tham số khai báo (`[YCKT TOSS-175]` "Thời gian cảnh báo chuyến bay thiếu tài liệu" — chưa nêu giá trị); việc **mở rộng nội hàm** sang "thiếu phép bay" / "thiếu điện văn" (TOSS-180) còn cờ `[cần xác nhận — KS-76 / §9-6]` (không suy diễn). Quy tắc màu riêng: sheet để trống hàng Color (§8-9) — không suy diễn.

---

## 3. Bảng truy vết BR → FUNC

| BR cha | Số FUNC | Danh sách FUNC con |
|---|---|---|
| BR-101 | 3 | FUNC-101, FUNC-102, FUNC-103 |
| BR-102 | 2 | FUNC-104, FUNC-105 |
| BR-103 | 3 | FUNC-106, FUNC-107, FUNC-108 |
| BR-104 | 3 | FUNC-109, FUNC-110, FUNC-111 |
| BR-105 | 1 | FUNC-112 |
| BR-106 | 2 | FUNC-113, FUNC-114 |
| BR-107 | 7 | FUNC-115, FUNC-116, FUNC-117, FUNC-118, FUNC-119, FUNC-120, FUNC-121 |
| BR-108 | 4 | FUNC-122, FUNC-123, FUNC-124, FUNC-125 |
| BR-109 | 5 | FUNC-126, FUNC-127, FUNC-128, FUNC-129, FUNC-130 |
| BR-110 | 5 | FUNC-131, FUNC-132, FUNC-133, FUNC-134, FUNC-285 (BLOCK FUEL — v0.6) |
| BR-111 | 3 | FUNC-135, FUNC-136, FUNC-137 |
| BR-112 | 7 | FUNC-138, FUNC-139, FUNC-140, FUNC-141, FUNC-142, FUNC-143, FUNC-294 (Missing Document — v0.6) |
| BR-113 | 4 | FUNC-144, FUNC-145, FUNC-146, FUNC-147 |
| BR-114 | 12 | FUNC-148, FUNC-149, FUNC-150, FUNC-151, FUNC-152, FUNC-153, FUNC-154, FUNC-155, FUNC-156, FUNC-157, FUNC-158, FUNC-159 |
| BR-115 | 3 | FUNC-160, FUNC-161, FUNC-162 |
| BR-116 | 7 | FUNC-163, FUNC-164, FUNC-165, FUNC-166, FUNC-167, FUNC-168, FUNC-171 *(FUNC-169/170 đã bỏ — Lotang = NOTAM, gộp BR-118)* |
| BR-117 | 2 | FUNC-172, FUNC-173 (tham chiếu chéo FUNC-111 từ BR-104) |
| BR-118 | 9 | FUNC-174, FUNC-175, FUNC-176, FUNC-177, FUNC-178, FUNC-179, FUNC-288, FUNC-289, FUNC-290 (NOTAM ngưỡng — v0.6) |
| BR-119 | 11 | FUNC-180, FUNC-181, FUNC-182, FUNC-183, FUNC-184, FUNC-185, FUNC-186, FUNC-187, FUNC-188, FUNC-291, FUNC-292 (WX cột Flight Dispatch — v0.6) |
| BR-120 | 4 | FUNC-189, FUNC-190, FUNC-191, FUNC-192 |
| BR-121 | 5 | FUNC-193, FUNC-194, FUNC-195, FUNC-196, FUNC-293 (MEL/CDL cột Flight Dispatch — v0.6; tham chiếu chéo BR-407) |
| BR-122 | 2 | FUNC-197, FUNC-198 |
| BR-123 | 2 | FUNC-199, FUNC-200 |
| BR-124 | 3 | FUNC-201, FUNC-202, FUNC-203 |
| BR-125 | 7 | FUNC-204, FUNC-205, FUNC-206, FUNC-207, FUNC-208, FUNC-209, FUNC-210 |
| BR-126 | 6 | FUNC-211, FUNC-212, FUNC-213, FUNC-214, FUNC-283, FUNC-284 (Flight Type cột — v0.6) |
| BR-127 | 2 | FUNC-215, FUNC-216 |
| BR-128 | 2 | FUNC-217, FUNC-218 |
| BR-129 | 3 | FUNC-219, FUNC-220, FUNC-221 |
| BR-130 | 6 | FUNC-222, FUNC-223, FUNC-224, FUNC-225, FUNC-226, FUNC-227 (tham chiếu chéo BR-131 qua FUNC-224) |
| BR-131 | 3 | FUNC-228, FUNC-229, FUNC-230 (tham chiếu chéo FUNC-224 từ BR-130) |
| BR-132 | 5 | FUNC-231, FUNC-232, FUNC-233, FUNC-234, FUNC-235 |
| BR-133 | 2 | FUNC-236, FUNC-237 |
| BR-134 | 1 | FUNC-238 |
| BR-135 | 4 | FUNC-239, FUNC-240, FUNC-241, FUNC-242 |
| BR-136 | 3 | FUNC-243, FUNC-244, FUNC-245 |
| BR-137 | 1 | FUNC-246 |
| BR-138 | 2 | FUNC-247, FUNC-248 |
| BR-139 | 2 | FUNC-249, FUNC-250 |
| BR-140 | 2 | FUNC-251, FUNC-252 |
| BR-141 | 4 | FUNC-253, FUNC-254, FUNC-255, FUNC-256 |
| BR-142 | 2 | FUNC-257, FUNC-258 |
| BR-143 | 1 | FUNC-259 |
| BR-144 | 3 | FUNC-260, FUNC-261, FUNC-262 |
| BR-145 | 3 | FUNC-263, FUNC-264, FUNC-265 |
| BR-146 | 3 | FUNC-266, FUNC-267, FUNC-268 |
| BR-147 | 2 | FUNC-269, FUNC-270 |
| BR-148 | 2 | FUNC-271, FUNC-272 |
| BR-149 | 2 | FUNC-273, FUNC-274 |
| BR-150 | 2 | FUNC-275, FUNC-276 |
| BR-213 / BR-224 | 4 | FUNC-277, FUNC-278 (DSP Release), FUNC-279, FUNC-280 (OFP DSP) — v0.6 *(BR cha thuộc Dispatch Release/OFP versioning; BR-213/224 nằm ngoài dải BR-101…150, đề xuất bổ sung vào BRD PH1 — xem §6 ghi chú lắp ráp)* |
| BR-214 / BR-225 | 2 | FUNC-281, FUNC-282 (Pilot release) — v0.6 *(BR cha thuộc Captain's/Pilot Release; đề xuất bổ sung vào BRD)* |
| BR-309 | 2 | FUNC-286, FUNC-287 (PILOT EXTRA) — v0.6 *(BR cha Pilot Extra; đề xuất xác nhận thuộc PH1 hay phân hệ khác)* |
| **Tổng** | **194** | FUNC-101 … FUNC-294 |

> **Ghi chú bảng truy vết v0.6:** 18 FUNC mới (FUNC-277 → FUNC-294) phân bổ vào (a) BR sẵn có trong dải BR-101…150 (BR-110, BR-112, BR-118, BR-119, BR-121, BR-126) và (b) cụm BR Dispatch/Pilot Release ngoài dải (BR-213/224, BR-214/225, BR-309) — các BR (b) hiện được tham chiếu từ wireframe §8.8/§9.3 nhưng **chưa nằm trong BRD PH1 hiện hành**; đề xuất BA Lead bổ sung BR tương ứng vào BRD (xem §6).

---

## 4. Danh sách các FUNC "(chưa có nguồn — cần SME bổ sung)"

| Mã FUNC | BR cha | Nội dung cần SME bổ sung |
|---|---|---|
| FUNC-108 | BR-103 | Ngưỡng và quy tắc cụ thể cho cảnh báo "hệ số lấp đầy thấp", "chậm chuyến", "thiếu phép bay", "thiếu điện văn". |
| FUNC-125 | BR-108 | Ngưỡng giờ bay / giờ làm việc (FTL — Flight Time Limitation) và quy tắc cảnh báo. |
| FUNC-143 | BR-112 | Danh mục đầy đủ "các loại tài liệu cần thiết" và quy tắc xác định "đã có / chưa có" trên dashboard tài liệu. |
| FUNC-159 | BR-114 | Phân loại cảnh báo trên màn hình kiểm tra đầu ca theo mức "bắt buộc xử lý" vs "ghi nhận để báo cáo"; tiêu chí của từng nhóm. |
| FUNC-162 | BR-115 | Danh sách các hệ thống nguồn được phép "deep link" từ TOSS và cơ chế đồng bộ ngược (timing, payload). |
| FUNC-179 | BR-118 | Tiêu chí phân loại NOTAM chi tiết và quy tắc đánh giá mức độ ảnh hưởng tới chuyến bay cụ thể (chờ workshop SME điều phái). *(Đã gộp nội dung "đánh giá tác động Lotang" — Lotang = NOTAM, đính chính 12/06.)* |
| FUNC-187 | BR-119 | Cảnh báo thời tiết đường bay (en-route): SIGMET, bản tin chuyên dụng, nguồn dữ liệu. |
| FUNC-188 | BR-119 | Giá trị cụ thể của biên an toàn (margin) so với VMA cho từng thông số (tầm nhìn / trần mây / TSRA) tại từng sân bay. |
| FUNC-190 | BR-120 | Cấu hình ngưỡng cảnh báo lệch tải cụ thể cho từng combo loại tàu × khoảng giờ bay × ngưỡng trên/dưới không đối xứng. |
| FUNC-192 | BR-120 | Phạm vi cụ thể các trường tải bổ sung ngoài ZFW/Payload/Take-off Weight (vd "patch down"/touchdown weight, "loft power") và khái niệm "trọng lượng ướt". |
| FUNC-196 | BR-121 | Mô hình master NAIL → sub-NAIL (NAIL gốc có thời hạn, bẻ ra sub-NAIL active theo) và ranh giới giữa TOSS (cảnh báo) vs Lido (đã tính NAIL vào dầu). |
| FUNC-198 | BR-122 | Danh mục đầy đủ các sân bay có điều kiện đặc biệt yêu cầu chứng chỉ tổ bay riêng (ngoài Điện Biên, Đồng Hới). |
| FUNC-200 | BR-123 | Phân loại đối tượng nhận cảnh báo "phân tổ bay ban đầu" (điều phái vs trực ban trưởng). |
| FUNC-203 | BR-124 | Ngưỡng theo phút trước STD để kiểm tra lịch PAX và các trường hợp cụ thể cần cảnh báo (thay phó, nhập Lido sai/sót…). |
| FUNC-214 | BR-126 | Danh mục mã loại chuyến đầy đủ (O, Z, G, H, A, P, V, S…) và cơ chế chuyển sang `N` ở ATC FPL. |
| FUNC-216 | BR-127 | Tham số thời điểm kiểm tra "đã filed ATC FPL" (vd phút trước STD), nguồn dữ liệu xác nhận đã filed (AFTN/AMHS hay khác), phân loại đối tượng nhận cảnh báo. |
| FUNC-218 | BR-128 | Giá trị Scheduled TAT chuẩn theo loại tàu bay / sân bay / loại chuyến và ngưỡng cảnh báo TAT không đủ; đối tượng nhận. |
| FUNC-221 | BR-129 | Danh mục đầy đủ các loại Airport Constraints được hỗ trợ (ngoài slot, curfew) và ngưỡng cảnh báo cụ thể cho từng loại. |
| FUNC-222 | BR-130 | Định nghĩa chính xác "lệch đầu" trong tự kiểm tra bất thường lịch bay. |
| FUNC-223 | BR-130 | Quy tắc xác định "vặn tàu" và danh mục sân bay áp dụng (ngoài DAD). |
| FUNC-225 | BR-130 | Giá trị tiêu chuẩn Ground Time theo loại tàu / sân bay / loại chuyến. |
| FUNC-226 | BR-130 | Định nghĩa "BH mùa" (Block Hours theo mùa khai thác) và ngưỡng lệch để cảnh báo. |
| FUNC-227 | BR-130 | Quy tắc xác định "vi phạm phép bay" và nguồn dữ liệu phép bay được đối chiếu. |
| FUNC-235 | BR-132 | Quy tắc lưu vết các lần thay đổi cấu hình bật/tắt cảnh báo (trường ghi nhận, thời hạn lưu). |
| FUNC-245 | BR-136 | Ý nghĩa hậu tố `Z` (so với `D`) và điều kiện sinh `Z` trong FN Surface (Netline). |
| FUNC-252 | BR-140 | Quy tắc thống kê khối lượng công việc từ lượng "Xanh đã xử lý" (trường, chu kỳ, chỉ số). |
| FUNC-256 | BR-141 | Mã hóa khu vực điều phái (Âu/Mỹ/Hàn/ĐNA…) dùng cho phân quyền dữ liệu. |
| FUNC-262 | BR-144 | Chính sách hiển thị Registration (lược "VN" cho VNA/VNB) — đồng nhất hay cho user cấu hình. |
| FUNC-268 | BR-146 | Hành vi hệ thống Ops++ khi chuyến mất D/giật về ngày gốc (Lido xin OFP cũ hay sinh mới). |
| FUNC-273 | BR-149 | Cơ chế giữ chuyến đường dài chưa đáp ngoài time window (filter phụ / giữ bảng / scroll). |
| FUNC-274 | BR-149 | Ngưỡng phút "vào gate chậm" so với ETA kết điểm để sinh cảnh báo. |

---

## 5. Danh sách các FUNC mang cờ `[cần xác nhận]`

| Mã FUNC | BR cha | Cờ `[cần xác nhận]` |
|---|---|---|
| FUNC-174 | BR-118 | Tên đơn vị cung cấp NOTAM nội địa (VNCM / VNCS / khác). |
| FUNC-183 | BR-119 | Viết tắt "VMA" cho ngưỡng thời tiết tối thiểu sân bay. |
| FUNC-184 | BR-119 | Tên đơn vị khí tượng hàng không Việt Nam cung cấp METAR / SPECI nội địa. |
| FUNC-186 | BR-119 | Tên các nguồn thời tiết tham khảo: "Phi Công 11", "UA PASMOS". |
| FUNC-189 | BR-120 | Tên đầy đủ của bộ phận CLC (Centralized Load Control). |
| FUNC-192 | BR-120 | Thuật ngữ "patch down" (touchdown weight?), "loft power" (ASR), khái niệm "trọng lượng ướt". |
| FUNC-193 | BR-121 | Viết tắt "NAIL" và hệ thống nguồn dữ liệu (AMOS). |
| FUNC-195 | BR-121 | Thuật ngữ "chuyển nát" (ASR) — thao tác chuyển kế hoạch khai thác giữa các tàu bay. |
| FUNC-197 | BR-122 | Tên sân bay "Đế Pân" (ASR) — có thể là Đồng Hới hoặc sân bay khác. |
| FUNC-199 | BR-123 | Vai trò "TIC" của Lido trong việc lưu trữ tổ bay mới. |
| FUNC-200 | BR-123 | Phân loại đối tượng nhận cảnh báo "phân tổ bay ban đầu" (điều phái vs trực ban trưởng). |
| FUNC-203 | BR-124 | Trường hợp "phone bằng một kiếm" (ASR). |
| FUNC-207 | BR-125 | Tên hệ thống/màn hình hiện hành "Mission Watch". |
| FUNC-211 | BR-126 | Danh mục mã loại chuyến đầy đủ (O, Z, G, H, A, P, V, S…) và ý nghĩa từng code. |
| FUNC-214 | BR-126 | Tên cơ chế phí khí thải (CORSIA / EU ETS). |
| FUNC-222 | BR-130 | Thuật ngữ "lệch đầu" — cần SME xác nhận định nghĩa. |
| FUNC-223 | BR-130 | Thuật ngữ "vặn tàu" — cần SME xác nhận quy tắc xác định. |
| FUNC-226 | BR-130 | Thuật ngữ "BH mùa" — cần SME xác nhận. |
| FUNC-279 | BR-213/224 | Ý nghĩa định dạng `2/0/1 R2` của OFP DSP (3 số đầu) — `[KS-69 / §8-1]`. |
| FUNC-291 | BR-119 | WX dùng chung ngưỡng nhóm với NOTAM hay ngưỡng riêng; mức màu vàng/đỏ cụ thể — `[§8-3]`. Viết tắt "VMA" — `[§8-5]`. |
| FUNC-293 | BR-121/407 | MEL/CDL dùng chung ngưỡng OFP với NOTAM hay riêng — `[§8-3]`; tích hợp AMOS "chờ xem xét". |
| FUNC-294 | BR-112/222 | Mở rộng Missing Document sang "thiếu phép bay"/"thiếu điện văn" (TOSS-180) — `[KS-76 / §9-6]`; ngưỡng thời gian cảnh báo (TOSS-175). |

---

## 6. Ghi chú lắp ráp

- **FUNC-111** xuất hiện ở BR-104 (mục 2.4) là chức năng "khi Divert phát sinh chuyến mới, cảnh báo chuyến mới chưa có tài liệu". **FUNC-173** ở BR-117 (mục 2.17) mô tả lại đúng cùng năng lực nhưng với BR cha là BR-117. Hai mã được ghi đôi có chủ đích để bảo đảm truy vết hai chiều từ cả hai BR cha (BR-104 nhấn mạnh "quản lý Divert"; BR-117 nhấn mạnh "tách Divert thành nhóm cảnh báo riêng và cảnh báo chưa có tài liệu cho chuyến mới"). Khi sang SRS/FRD, hai mã này nên được hợp nhất hoặc giữ tham chiếu chéo tùy quyết định của BA Lead.
- Các FUNC thuộc BR-114 (kiểm tra đầu ca) đánh mã 1-1 cho 9 nhóm nội dung theo đúng danh sách kết luận Khảo sát 11/06 §II.4 (lịch bay → chứng chỉ tổ bay), cộng thêm hai FUNC khung (FUNC-148 màn hình tập trung và FUNC-158 tự đối chiếu) + một FUNC cờ chưa có nguồn (FUNC-159). Tổng 12 FUNC.
- Các FUNC thuộc BR-119 (thời tiết) chia hai nhóm: FUNC-180…FUNC-183 mô tả năng lực tích hợp + cảnh báo (đã có nguồn rõ); FUNC-184…FUNC-186 mô tả ưu tiên nguồn (đã có nguồn rõ); FUNC-187…FUNC-188 là hai khoảng trống nguồn / cờ chưa rõ.
- **Bổ sung v0.2:**
  - **BR-120 (lệch tải OFP/CLC)**: 4 FUNC (FUNC-189…192) — 2 FUNC có nguồn rõ (FUNC-189 đối tượng so sánh, FUNC-191 lưu lịch sử CLC); 2 FUNC khung khoảng trống nguồn (FUNC-190 cấu hình ngưỡng cụ thể, FUNC-192 trường tải bổ sung "patch down"/"loft power").
  - **BR-121 (NAIL/CDL)**: 4 FUNC (FUNC-193…196) — 3 FUNC có nguồn rõ (FUNC-193 nguồn dữ liệu AMOS, FUNC-194 quy tắc theo thời điểm, FUNC-195 chuyển kế hoạch giữa tàu); 1 FUNC khoảng trống (FUNC-196 mô hình master→sub + ranh giới TOSS↔Lido).
  - **BR-122 (chứng chỉ tổ bay theo sân bay)**: 2 FUNC (FUNC-197 danh mục điều kiện đặc biệt + FUNC-198 đối chiếu & cảnh báo). Danh mục đầy đủ sân bay đặc biệt là khoảng trống nguồn.
  - **BR-123 (đổi tổ bay)**: 2 FUNC (FUNC-199 cảnh báo đổi tổ + FUNC-200 phân loại đối tượng nhận); FUNC-200 mang đồng thời cờ `[cần xác nhận]` và `(chưa có nguồn)`.
  - **BR-124 (PAX time)**: 3 FUNC (FUNC-201 cảnh báo PAX time + FUNC-202 KHÔNG cảnh báo APU time + FUNC-203 ngưỡng cụ thể là khoảng trống).
  - **BR-125 (Monitoring overview)**: 7 FUNC (FUNC-204…210) — toàn bộ có nguồn rõ từ Khảo sát 11/06 chiều §II.6; FUNC-207 (ACARS) và FUNC-208 (cơ chế refresh server-push) mô tả kiến trúc kỹ thuật theo đúng nguồn.
  - **BR-126 (Flight Type Code STS/HEAD)**: 4 FUNC (FUNC-211…214) — FUNC-211 nhận diện chuyến không thường lệ (danh mục mã code có cờ `[cần xác nhận]`), FUNC-212 kiểm tra STS/HEAD trên OFP và sinh cảnh báo, FUNC-213 phạm vi áp dụng (trước Captain's Release), FUNC-214 ghi lại lý do nghiệp vụ then chốt (CORSIA/EU ETS) để truy vết.
  - **Tổng v0.2:** 26 FUNC mới (FUNC-189 → FUNC-214), nâng tổng số FUNC của Phân hệ 1 từ 88 lên **114** FUNC.
- **Bổ sung v0.3:**
  - **BR-127 (filed ATC FPL)**: 2 FUNC (FUNC-215 hiển thị trạng thái + FUNC-216 cảnh báo); chi tiết tham số kiểm tra là khoảng trống nguồn.
  - **BR-128 (TAT không đủ)**: 2 FUNC (FUNC-217 so sánh + FUNC-218 cảnh báo); giá trị Scheduled TAT chuẩn là khoảng trống nguồn.
  - **BR-129 (Airport Constraints)**: 3 FUNC (FUNC-219 quản lý dữ liệu + FUNC-220 đối chiếu + FUNC-221 cảnh báo); danh mục đầy đủ loại hạn chế ngoài Slot/curfew là khoảng trống nguồn.
  - **BR-130 (tự kiểm tra bất thường lịch bay)**: 6 FUNC (FUNC-222…227) bám đúng 6 hạng mục nguồn liệt kê (lệch đầu, vặn tàu, APU đến sân không thiết bị mặt đất, Ground time, BH vs BH mùa, vi phạm phép bay). FUNC-224 ghi đôi để truy vết hai chiều với BR-131. Nhiều thuật ngữ trong nhóm này còn cờ `[cần xác nhận]` (lệch đầu, vặn tàu, BH mùa).
  - **BR-131 (AC APU INOP)**: 3 FUNC (FUNC-228 khai báo tàu APU INOP với AC REG/From/To + FUNC-229 danh mục sân bay GPU/ASU/ACU Available + FUNC-230 đối chiếu & cảnh báo). Nguồn rõ từ YCKT V3 dòng 167 (TOSS-126/127) và sheet-08 #10.
  - **BR-132 (bật/tắt cảnh báo hai cấp)**: 5 FUNC (FUNC-231 admin mặc định + FUNC-232 cá nhân user + FUNC-233 nguyên tắc ghi đè + FUNC-234 danh mục cảnh báo áp dụng theo sheet-08 + FUNC-235 lưu vết). FUNC-235 là khoảng trống nguồn về quy tắc lưu vết cụ thể.
  - **Tổng v0.3:** 21 FUNC mới (FUNC-215 → FUNC-235), nâng tổng số FUNC của Phân hệ 1 từ 114 lên **135** FUNC.
- **Bổ sung v0.4:** thêm cột "Dữ liệu liên quan" cho các FUNC thuộc nhóm màn hình giám sát điều phái, không thêm/bớt FUNC.
- **Đính chính ASR 12/06:** bỏ FUNC-169/170 (Lotang) — "Lotang/lô tam/nô tam" = lỗi ASR của NOTAM, không có "chuyến Lotang"; cảnh báo + đánh giá ảnh hưởng NOTAM thuộc BR-118 (FUNC-178/179). BR-116 còn 7 FUNC.
  - **BR-112 (dashboard tài liệu chuyến)**: bổ sung dữ liệu liên quan cho FUNC-139, 140, 141, 142, 143 (5 FUNC). FUNC-138 (ghi nhận bất thường) không nằm trong phạm vi giám sát → để trống cột.
  - **BR-113 (hai nhóm màn giám sát)**: bổ sung dữ liệu liên quan cho FUNC-144, 145, 146 (3 FUNC) theo phạm vi yêu cầu. FUNC-147 (khách nối chuyến) không nằm trong phạm vi 4 BR áp dụng → để trống cột.
  - **BR-114 (kiểm tra đầu ca)**: bổ sung dữ liệu liên quan cho FUNC-148 → FUNC-159 (12 FUNC).
  - **BR-125 (Monitoring overview real-time)**: bổ sung dữ liệu liên quan cho FUNC-204 → FUNC-210 (7 FUNC).
  - **Tổng v0.4:** 27 FUNC được bổ sung cột "Dữ liệu liên quan" (5 + 3 + 12 + 7). Cột này bám theo nhóm trường FOS Report (sheet-09) và Đề xuất §II.1; các điểm còn cờ `[cần xác nhận]` mới được thêm tập trung ở: trường lưu cấp RFFS (FUNC-152), trường lưu chứng chỉ tổ bay (FUNC-157), viết tắt VMA (FUNC-153 — đã có ở v0.2/v0.3), giao thức server-push (FUNC-208), gói tải về tài liệu (FUNC-141), danh mục vai trò + ma trận quyền xem chi tiết (FUNC-142), quy tắc xác định "đã có / chưa có" tài liệu (FUNC-139, FUNC-143 — đã có trong "(chưa có nguồn)"), trạng thái "tổ bay đã xác nhận / đã tải xuống" (FUNC-145), danh mục loại hạn chế đầy đủ (FUNC-156).
- **Bổ sung v0.5 (Khảo sát 12/06 — màn Giám sát chuyến bay & Flight Detail):** 41 FUNC mới (FUNC-236 → FUNC-276) cho 18 BR mới BR-133…150.
  - **Flight Detail (BR-133…135):** mở tab mới + nhiều tab (FUNC-236/237), click cảnh báo → active tab phụ (FUNC-238), tab phụ + đầy đủ lịch sử (FUNC-239…242).
  - **Flight Number/Netline (BR-136/137):** 3 cột tách biệt (FUNC-243/244), hậu tố Z là khoảng trống nguồn (FUNC-245), leg history (FUNC-246).
  - **Bộ mã màu (BR-138…140):** 4 trạng thái + tô màu ô (FUNC-247/248), xanh-sau-đỏ + đổi màu tự động (FUNC-249/250), view-only (ngoại lệ Dispatch Release) + thống kê khối lượng (FUNC-251/252 — thống kê là khoảng trống).
  - **Phân quyền/UI/profile (BR-141…143):** 2 lớp + nhiều role + switch view (FUNC-253…256; mã khu vực là khoảng trống FUNC-256), profile cá nhân + bộ lọc thu/mở (FUNC-257/258), quy ước UI EN/UTC/24h/dark (FUNC-259).
  - **Logic cột (BR-144…147):** REG 4 màu + hover/click + hiển thị lược VN (FUNC-260…262; chính sách hiển thị là khoảng trống FUNC-262), Dispatch Release action + 2 chốt (FUNC-263…265), Flight Number D/Z (FUNC-266…268; hành vi Ops++ là khoảng trống FUNC-268), ETA/IN/ARR nguồn OR Netline/ACARS + A-CDM (FUNC-269/270).
  - **Time window/Flight Watch (BR-148/149):** time window cấu hình + trôi + sort ETD (FUNC-271/272), giữ chuyến chưa đáp + "vào gate chậm" (FUNC-273/274 — đều là khoảng trống về cơ chế/ngưỡng).
  - **History timeline (BR-150):** format chung kéo dọc (FUNC-275/276).
  - **Tổng v0.5:** 41 FUNC mới (FUNC-236 → FUNC-276), nâng tổng số FUNC của Phân hệ 1 từ 135 lên **176** FUNC.
- **Bổ sung v0.6 (§2.51 — đặc tả cột màn Flight Dispatch đã rõ nguồn):** 18 FUNC mới (FUNC-277 → FUNC-294), nâng tổng số FUNC của Phân hệ 1 từ 176 lên **194** FUNC. Nguồn chính: `wf-monitoring-overview.md` §8 (`[FL-FD]`) + §9 (đối chiếu YCKT + KS 11/06, 12/06, 15/06).
  - **DSP Release (FUNC-277/278):** checkbox active theo cửa sổ release + kiểm DSP license của user.
  - **OFP DSP (FUNC-279/280):** hiển thị OFP number/Rev (định dạng `2/0/1 R2` giữ cờ `[KS-69]`) + logic màu 3 trạng thái (Xanh/Vàng/Đỏ) + Không màu (chưa có OFP) + ngưỡng thời gian nhóm NOTAM.
  - **Pilot release (FUNC-281/282):** gạch trắng/`R01`/Xanh/Vàng/Đỏ (Reject) + cảnh báo Vàng 30′ trước ETD.
  - **Flight Type (FUNC-283/284):** chip loại + lưu lịch sử đổi + màu (Đỏ Thường↔Ferry/VIP; Vàng đã ATC/OFP chưa release; Xanh khi Status head khớp).
  - **BLOCK FUEL (FUNC-285):** hiển thị OFP Block Fuel (màu riêng để trống — §8-9).
  - **PILOT EXTRA (FUNC-286/287):** delta `Pilot Release − OFP Block Fuel` + Đỏ 30′ trước ETD chưa release.
  - **NOTAM (FUNC-288/289/290):** 3 nhánh ngưỡng (chưa có OFP: Vàng 210/270′, Đỏ 75/95′; đã có OFP chưa release: Vàng 75→60/90→75′, Đỏ 60/75′; đã release: Xanh).
  - **WX (FUNC-291/292):** 3 thông số (tầm nhìn/trần mây/TSRA) so VMA + biên an toàn; METAR 30′/lần + SPECI; nguồn nội địa VATM/VNCM, quốc tế Lido. Mức màu riêng giữ cờ `[§8-3]`.
  - **MEL/CDL (FUNC-293):** cảnh báo MEL/CDL tích hợp AMOS ảnh hưởng nhiên liệu/mực bay.
  - **Missing Document (FUNC-294):** cảnh báo thiếu OFP/NOTAM/WX (mở rộng phép bay/điện văn giữ cờ `[KS-76]`).
  - **Đề xuất BR mới (cho BA Lead):** các FUNC OFP/Dispatch/Pilot Release (FUNC-277…282) và PILOT EXTRA (FUNC-286/287) tham chiếu BR-213/224, BR-214/225, BR-309 — **các BR này hiện chưa nằm trong BRD PH1 (BR-101…150)**; đề xuất bổ sung BR tương ứng (Dispatch Release / Captain's & Pilot Release / Pilot Extra) vào BRD PH1 để đóng truy vết hai chiều BR → FUNC.
  - **Cột bỏ qua (còn cờ OID — xem §2.51.0):** ATC, TO/LD, Taxi APU (KS-70); EPLD, EST DOW, ZFW-DOW (KS-71/§8-4); 6 cột TOSS-180 (KS-76); Filter 1–20 (KS-72); tooltip hover (KS-74); Details cột khác (KS-75) — **chưa phân rã FUNC**, chờ SME chốt ngưỡng/màu/tách-gộp.
