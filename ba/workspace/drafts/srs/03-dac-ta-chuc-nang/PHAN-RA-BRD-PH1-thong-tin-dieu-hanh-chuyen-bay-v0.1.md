---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-11"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH1"
---

# Phân rã BRD §7.1 → Yêu cầu chức năng (FUNC) — Phân hệ 1: Thông tin điều hành chuyến bay

> **Nguyên tắc tối thượng (CLAUDE.md §0):** Tài liệu này chỉ **phân rã + lắp ráp trung thực** các yêu cầu nghiệp vụ (BR) đã được ghi nhận trong nguồn. Tuyệt đối không suy diễn, không bịa chức năng, không tự "hoàn thiện" logic mà nguồn chưa nêu. Mỗi yêu cầu chức năng (FUNC — Functional Requirement) được phân rã đều phải truy vết về **BR cha** và **trích nguồn gốc** (file + mục §). Khi nguồn không cung cấp đủ chi tiết, ghi rõ **"(chưa có nguồn — cần SME bổ sung)"** thay vì tự điền.
>
> **Phạm vi tài liệu:** chỉ Phân hệ 1 — Thông tin điều hành chuyến bay (BR-101 … BR-119, theo `BRD-TOSS-001-khung-v0.1.md §7.1`). Phân rã ở mức **chức năng (FUNC)** — cụ thể hơn BR nhưng **chưa** tới mức Trường hợp sử dụng (UC — Use Case), màn hình hoặc trường dữ liệu chi tiết. Các tầng đó sẽ được làm tại SRS/FRD kế tiếp.
>
> **Quy ước đánh số:** `FUNC-1xx` cho Phân hệ 1 (1xx — lớp 100).

---

## 1. Phạm vi & quy ước

- **Nguồn chính:**
  - `ba/workspace/drafts/brd/BRD-TOSS-001-khung-v0.1.md` §7.1 — danh sách BR-101 … BR-119.
  - `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/02-giai-phap-nghiep-vu/01-phan-he-thong-tin-dieu-hanh-chuyen-bay.md` — bóc tách §II.1 Đề xuất giải pháp kỹ thuật v0.3.
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md` §II.4–II.7 (kiểm tra đầu ca, OSP, Divert, NOTAM, thời tiết).
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.1.md` §II.2, II.3, II.6 (hai nhóm giám sát, FMS, khách nối chuyến).
  - `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.1.md` §II.7 (đa Carrier trong BCAO).
- **Cờ truy vết:**
  - `(chưa có nguồn — cần SME bổ sung)` — nguồn đề cập nguyên tắc nhưng không nêu chi tiết để bóc xuống FUNC; chờ SME bổ sung.
  - `[cần xác nhận]` — nội dung nguồn còn cờ này (vd VMA, Lotang, VNCM/VNCS); giữ nguyên cờ trong FUNC để truy vết.
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

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-138 | Ghi nhận các bất thường phát sinh của chuyến bay và phân loại theo các nhóm nguyên nhân: thời tiết, kỹ thuật, lý do khách quan khác. | BR-112 | Đề xuất §II.1 — Phân loại bất thường; Khảo sát 09/06 §II.7 (cấu trúc BCAO, phần bất thường) |
| FUNC-139 | Cung cấp dashboard tài liệu chuyến bay: giám sát trạng thái chuyến đã có hay chưa có đối với từng loại tài liệu cần thiết. | BR-112 | Đề xuất §II.1 — Dashboard tài liệu |
| FUNC-140 | Theo dõi chi tiết luồng phê duyệt tài liệu theo trạng thái yêu cầu (Request), xác nhận (Confirm), từ chối (Reject) bởi từng đối tượng liên quan kèm dấu thời gian thực. | BR-112 | Đề xuất §II.1 — Luồng phê duyệt |
| FUNC-141 | Quản lý phiên bản tài liệu đính kèm chuyến bay: hiển thị số lượng và nội dung của các phiên bản; cho phép tải về toàn bộ bộ hồ sơ tài liệu chuyến bay khi cần. | BR-112 | Đề xuất §II.1 — Quản lý phiên bản |
| FUNC-142 | Phân quyền xem thông tin chi tiết chuyến bay đến từng người dùng theo vai trò nghiệp vụ trong môi trường điều hành khai thác. | BR-112 | Đề xuất §II.1 — Đoạn kết luận về phân quyền xem |
| FUNC-143 | Danh mục cụ thể "các loại tài liệu cần thiết" và quy tắc xác định "đã có / chưa có" trên dashboard tài liệu: (chưa có nguồn — cần SME bổ sung). | BR-112 | (chưa có nguồn — cần SME bổ sung) |

### 2.13 BR-113 — Hai nhóm màn hình giám sát: trực ban trưởng và cán bộ tài liệu

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-144 | Cung cấp màn hình giám sát dành cho trực ban trưởng (OCC Duty Manager) tập trung vào trạng thái khai thác và khách nối chuyến. | BR-113 | Khảo sát 08/06 §II.2 — Hai nhóm đối tượng giám sát |
| FUNC-145 | Cung cấp màn hình giám sát dành cho cán bộ tài liệu, tập trung vào tình trạng tài liệu chuyến bay (đã được tổ bay xác nhận / tải xuống hay chưa). | BR-113 | Khảo sát 08/06 §II.2 — Hai nhóm đối tượng giám sát |
| FUNC-146 | Hỗ trợ nhiều cấp xem từ tổng quan đến chi tiết từng chuyến và từng hành khách trong hai nhóm màn hình giám sát; cho phép giám sát nhiều chuyến cùng lúc (thay vì xem lần lượt từng chuyến như hiện trạng). | BR-113 | Khảo sát 08/06 §II.2 — Hai nhóm đối tượng giám sát |
| FUNC-147 | Theo dõi khách nối chuyến (nối vào / nối ra) và cảnh báo nguy cơ lỡ nối chuyến khi chậm chuyến. | BR-113 | Khảo sát 08/06 §II.6 — Khách nối chuyến |

### 2.14 BR-114 — Màn hình tập trung kiểm tra đầu ca (Start-of-Shift Check)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-148 | Cung cấp một màn hình tập trung kiểm tra đầu ca cho điều phái viên (Dispatcher), gom toàn bộ các đầu mối cần kiểm tra của ca trực vào cùng một giao diện. | BR-114 | Khảo sát 11/06 §II.4 — Kiểm tra đầu ca |
| FUNC-149 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Lịch bay (Flight Schedule). | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-150 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Loại tàu bay. | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-151 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Tàu quay (Rotation) — đối chiếu tàu được phân cho chuyến với lịch quay. | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-152 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Cứu hỏa sân bay (RFFS — Rescue and Fire Fighting Service category). | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-153 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Thời tiết. | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-154 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Tải. | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-155 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: MEL/CDL. | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-156 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Hạn chế (Restrictions). | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-157 | Trên màn hình kiểm tra đầu ca, hiển thị nhóm kiểm tra: Chứng chỉ tổ bay. | BR-114 | Khảo sát 11/06 §II.4 |
| FUNC-158 | Tự đối chiếu (compare) hai chiều giữa các nguồn dữ liệu — ví dụ giữa lịch bay với loại tàu, giữa kế hoạch ca trước với tình trạng tàu hiện tại — và tự sinh cảnh báo khi phát hiện không khớp hoặc có biến động bất thường. | BR-114 | Khảo sát 11/06 §II.4 — Thảo luận – Đề xuất |
| FUNC-159 | Phân loại cảnh báo trên màn hình kiểm tra đầu ca theo mức "bắt buộc xử lý" vs "ghi nhận để báo cáo"; tiêu chí cụ thể của từng nhóm cảnh báo: (chưa có nguồn — cần SME bổ sung). | BR-114 | Khảo sát 11/06 §II.4 — Kết luận (cờ "chi tiết sẽ chốt ở các buổi tiếp theo") |

### 2.15 BR-115 — TOSS đóng vai trò "view + cảnh báo", không trùng lặp chức năng

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-160 | Trên các màn hình điều hành chuyến bay, điều phái viên chỉ thực hiện thao tác "view" + xử lý cảnh báo; KHÔNG cung cấp thao tác nghiệp vụ chuyên dụng đã có ở hệ thống nguồn (Lido lập kế hoạch bay, MO Plus xác nhận tài liệu phi công, AMOS bảo dưỡng…). | BR-115 | Khảo sát 11/06 §II.4 — Nguyên tắc thiết kế |
| FUNC-161 | Khi điều phái viên cần giải quyết một cảnh báo, cung cấp đường dẫn / cơ chế chuyển sang hệ thống chuyên dụng tương ứng để xử lý; sau khi xử lý xong, dữ liệu phải tự đồng bộ về TOSS và cảnh báo tự tắt. | BR-115 | Khảo sát 11/06 §II.4 — Thảo luận – Đề xuất |
| FUNC-162 | Danh sách cụ thể các hệ thống nguồn được phép "deep link" từ TOSS và cơ chế đồng bộ ngược (timing, payload): (chưa có nguồn — cần SME bổ sung). | BR-115 | (chưa có nguồn — cần SME bổ sung) |

### 2.16 BR-116 — Cảnh báo thay đổi lịch bay (OSP, loại tàu, ferry, VIP, Lotang)

| Mã FUNC | Mô tả chức năng (bám nguồn) | BR cha | Nguồn |
|---|---|---|---|
| FUNC-163 | Phát hiện và cảnh báo thay đổi giờ bay khi lệch ≥ 15 phút so với kế hoạch (ngưỡng OSP — Operational Schedule Performance — đang áp dụng); áp dụng cho cả hai chiều: sớm hơn và muộn hơn. | BR-116 | Khảo sát 11/06 §II.5 — Thảo luận – Đề xuất, Kết luận |
| FUNC-164 | Phát hiện và cảnh báo thay đổi loại tàu bay (aircraft type). | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-165 | Phát hiện và cảnh báo thay đổi tàu bay cụ thể (tail number) trên cùng chuyến. | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-166 | Phát hiện và cảnh báo (highlight) khi phát sinh chuyến ferry (chuyến không thương mại, dùng để điều chuyển tàu bay) để điều phái viên xử lý tài liệu riêng. | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-167 | Phát hiện và cảnh báo (highlight) khi chuyển từ chuyến thường (regular) sang chuyến VIP (do thay đổi cấp độ phục vụ và yêu cầu tài liệu khác). | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-168 | Khi chuyển từ chuyến VIP về chuyến thường (downgrade), chỉ ghi nhận, KHÔNG cảnh báo đặc biệt. | BR-116 | Khảo sát 11/06 §II.5 — Kết luận |
| FUNC-169 | Phát hiện và cảnh báo "chuyến Lotang mới phát sinh" `[cần xác nhận định nghĩa chính xác]` khi lịch bay phát sinh chuyến loại này. | BR-116 | Khảo sát 11/06 §II.5 |
| FUNC-170 | Bổ sung bước đánh giá tác động của chuyến Lotang đến hoạt động khai thác chung sau khi cảnh báo phát sinh; tiêu chí đánh giá tác động cụ thể: (chưa có nguồn — cần SME bổ sung) `[cần xác nhận]`. | BR-116 | Khảo sát 11/06 §II.5 — Kết luận |
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
| BR-110 | 4 | FUNC-131, FUNC-132, FUNC-133, FUNC-134 |
| BR-111 | 3 | FUNC-135, FUNC-136, FUNC-137 |
| BR-112 | 6 | FUNC-138, FUNC-139, FUNC-140, FUNC-141, FUNC-142, FUNC-143 |
| BR-113 | 4 | FUNC-144, FUNC-145, FUNC-146, FUNC-147 |
| BR-114 | 12 | FUNC-148, FUNC-149, FUNC-150, FUNC-151, FUNC-152, FUNC-153, FUNC-154, FUNC-155, FUNC-156, FUNC-157, FUNC-158, FUNC-159 |
| BR-115 | 3 | FUNC-160, FUNC-161, FUNC-162 |
| BR-116 | 9 | FUNC-163, FUNC-164, FUNC-165, FUNC-166, FUNC-167, FUNC-168, FUNC-169, FUNC-170, FUNC-171 |
| BR-117 | 2 | FUNC-172, FUNC-173 (tham chiếu chéo FUNC-111 từ BR-104) |
| BR-118 | 6 | FUNC-174, FUNC-175, FUNC-176, FUNC-177, FUNC-178, FUNC-179 |
| BR-119 | 9 | FUNC-180, FUNC-181, FUNC-182, FUNC-183, FUNC-184, FUNC-185, FUNC-186, FUNC-187, FUNC-188 |
| **Tổng** | **88** | FUNC-101 … FUNC-188 |

---

## 4. Danh sách các FUNC "(chưa có nguồn — cần SME bổ sung)"

| Mã FUNC | BR cha | Nội dung cần SME bổ sung |
|---|---|---|
| FUNC-108 | BR-103 | Ngưỡng và quy tắc cụ thể cho cảnh báo "hệ số lấp đầy thấp", "chậm chuyến", "thiếu phép bay", "thiếu điện văn". |
| FUNC-125 | BR-108 | Ngưỡng giờ bay / giờ làm việc (FTL — Flight Time Limitation) và quy tắc cảnh báo. |
| FUNC-143 | BR-112 | Danh mục đầy đủ "các loại tài liệu cần thiết" và quy tắc xác định "đã có / chưa có" trên dashboard tài liệu. |
| FUNC-159 | BR-114 | Phân loại cảnh báo trên màn hình kiểm tra đầu ca theo mức "bắt buộc xử lý" vs "ghi nhận để báo cáo"; tiêu chí của từng nhóm. |
| FUNC-162 | BR-115 | Danh sách các hệ thống nguồn được phép "deep link" từ TOSS và cơ chế đồng bộ ngược (timing, payload). |
| FUNC-170 | BR-116 | Tiêu chí đánh giá tác động của chuyến Lotang đến hoạt động khai thác chung. |
| FUNC-179 | BR-118 | Tiêu chí phân loại NOTAM chi tiết và quy tắc đánh giá mức độ ảnh hưởng tới chuyến bay cụ thể (chờ workshop SME điều phái). |
| FUNC-187 | BR-119 | Cảnh báo thời tiết đường bay (en-route): SIGMET, bản tin chuyên dụng, nguồn dữ liệu. |
| FUNC-188 | BR-119 | Giá trị cụ thể của biên an toàn (margin) so với VMA cho từng thông số (tầm nhìn / trần mây / TSRA) tại từng sân bay. |

---

## 5. Danh sách các FUNC mang cờ `[cần xác nhận]`

| Mã FUNC | BR cha | Cờ `[cần xác nhận]` |
|---|---|---|
| FUNC-169 | BR-116 | Định nghĩa chính xác "chuyến Lotang" (nguồn mô tả "chuyến đường dài / đặc thù" nhưng cần SME xác nhận). |
| FUNC-170 | BR-116 | Tiêu chí đánh giá tác động chuyến Lotang gắn cờ `[cần xác nhận]` cùng với "(chưa có nguồn)". |
| FUNC-174 | BR-118 | Tên đơn vị cung cấp NOTAM nội địa (VNCM / VNCS / khác). |
| FUNC-183 | BR-119 | Viết tắt "VMA" cho ngưỡng thời tiết tối thiểu sân bay. |
| FUNC-184 | BR-119 | Tên đơn vị khí tượng hàng không Việt Nam cung cấp METAR / SPECI nội địa. |
| FUNC-186 | BR-119 | Tên các nguồn thời tiết tham khảo: "Phi Công 11", "UA PASMOS". |

---

## 6. Ghi chú lắp ráp

- **FUNC-111** xuất hiện ở BR-104 (mục 2.4) là chức năng "khi Divert phát sinh chuyến mới, cảnh báo chuyến mới chưa có tài liệu". **FUNC-173** ở BR-117 (mục 2.17) mô tả lại đúng cùng năng lực nhưng với BR cha là BR-117. Hai mã được ghi đôi có chủ đích để bảo đảm truy vết hai chiều từ cả hai BR cha (BR-104 nhấn mạnh "quản lý Divert"; BR-117 nhấn mạnh "tách Divert thành nhóm cảnh báo riêng và cảnh báo chưa có tài liệu cho chuyến mới"). Khi sang SRS/FRD, hai mã này nên được hợp nhất hoặc giữ tham chiếu chéo tùy quyết định của BA Lead.
- Các FUNC thuộc BR-114 (kiểm tra đầu ca) đánh mã 1-1 cho 9 nhóm nội dung theo đúng danh sách kết luận Khảo sát 11/06 §II.4 (lịch bay → chứng chỉ tổ bay), cộng thêm hai FUNC khung (FUNC-148 màn hình tập trung và FUNC-158 tự đối chiếu) + một FUNC cờ chưa có nguồn (FUNC-159). Tổng 12 FUNC.
- Các FUNC thuộc BR-119 (thời tiết) chia hai nhóm: FUNC-180…FUNC-183 mô tả năng lực tích hợp + cảnh báo (đã có nguồn rõ); FUNC-184…FUNC-186 mô tả ưu tiên nguồn (đã có nguồn rõ); FUNC-187…FUNC-188 là hai khoảng trống nguồn / cờ chưa rõ.
