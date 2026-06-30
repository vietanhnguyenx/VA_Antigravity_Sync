---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Gap Analysis"
document_id: "GAP-PH1-PH2"
source_asis: "ba/workspace/drafts/phan-tich/04-quy-trinh/ASIS-OCC-DISPATCH-v0.1.md"
source_br_ph1: "ba/workspace/drafts/brd/BRD-TOSS-PH1-thong-tin-dieu-hanh-v0.2.md"
source_br_ph2: "ba/workspace/drafts/brd/BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.1.md"
---

# Gap Analysis Chính thức — Phân hệ 1 (PH1) & Phân hệ 2 (PH2)

> **Nguyên tắc (CLAUDE.md §0):** Tài liệu này chỉ mô tả những gì đã được ghi nhận trong nguồn (ASIS-OCC-DISPATCH-v0.1, BRD-TOSS-PH1, BRD-TOSS-PH2, PHAN-RA-BRD-PH1 v0.5, PHAN-RA-BRD-PH2 v0.3). Không suy diễn thêm. Mỗi gap truy vết về BR và mã FUNC tương ứng. Nơi nguồn còn cờ `[cần xác nhận]` thì giữ nguyên cờ.

---

## Mục lục

1. [Bảng Gap — Phân hệ 1 (PH1)](#1-bảng-gap--phân-hệ-1-ph1)
2. [Bảng Gap — Phân hệ 2 (PH2)](#2-bảng-gap--phân-hệ-2-ph2)
3. [Tổng hợp — Số lượng gap theo loại](#3-tổng-hợp--số-lượng-gap-theo-loại)
4. [Nhóm ưu tiên xử lý](#4-nhóm-ưu-tiên-xử-lý)
5. [Giả định và ràng buộc](#5-giả-định-và-ràng-buộc)

---

## 1. Bảng Gap — Phân hệ 1 (PH1)

> Nguồn As-Is: ASIS-OCC-DISPATCH-v0.1.md. Nguồn To-Be: BRD-TOSS-PH1 (BR-101…BR-150).

| GAP | Quy trình As-Is | Tình trạng hiện tại | To-Be theo BRD | Loại Gap | Độ phức tạp |
|---|---|---|---|---|---|
| GAP-PH1-001 | Xem tổng hợp thông tin chuyến bay | OCC/Dispatcher mở đồng thời 5–7 hệ thống (Ops++, AVES, FSS, Crew Trip, LIDO, AMOS, WNI) để có đủ thông tin một chuyến | TOSS hiển thị danh sách chuyến bay hợp nhất đầy đủ: STD/STA, ETD/ETA, ATD/ATA, tàu bay, cấu hình, thời tiết, NOTAM, tổ bay, hành khách, hàng hóa (BR-101) | Thay thế thủ công | Cao |
| GAP-PH1-002 | Phát hiện bất thường chuyến bay | Phụ thuộc nhân viên nhìn màn hình; không có cảnh báo tự động tập trung | TOSS sinh cảnh báo màu tự động cho MEL/CDL, hỏng cabin, khách VIP, hệ số lấp đầy thấp, delay, thiếu phép bay, thiếu điện văn (BR-103) | Thiếu tính năng | Cao |
| GAP-PH1-003 | Kiểm tra đầu ca | Điều phái tra thủ công riêng lẻ từng hệ thống; không có quy trình tập trung | TOSS cung cấp màn hình kiểm tra đầu ca tập trung 9 nhóm, tự đối chiếu và sinh cảnh báo (BR-114) | Tính năng mới | Trung bình |
| GAP-PH1-004 | Giám sát chuyến bay đang bay (real-time) | Theo dõi rời rạc trên nhiều màn; không có bảng hợp nhất real-time | TOSS cung cấp màn Monitoring overview real-time qua webhook/SSE, time window trôi, cảnh báo màu, 3 nhóm trạng thái (BR-125, BR-148) | Thiếu tính năng | Cao |
| GAP-PH1-005 | Phân loại và cảnh báo thay đổi lịch bay | Không có cảnh báo tự động theo ngưỡng thay đổi | TOSS sinh cảnh báo khi thay đổi giờ ±15 phút (OSP), đổi loại tàu, đổi tàu cụ thể, phát sinh ferry, chuyển VIP (BR-116) | Thiếu tính năng | Trung bình |
| GAP-PH1-006 | Cảnh báo và quản lý Divert | Không có cơ chế cảnh báo Divert tập trung; chuyến phát sinh từ Divert không được theo dõi tự động | TOSS tách cảnh báo Divert thành nhóm riêng; khi Divert phát sinh chuyến mới, cảnh báo "chưa có tài liệu" (BR-117) | Thiếu tính năng | Trung bình |
| GAP-PH1-007 | Tích hợp và phân tích NOTAM | Dispatcher tra web nguồn bên ngoài thủ công `[Cần xác nhận As-Is]` | TOSS tích hợp NOTAM từ nguồn chính thức `[VNCM/VNCS — cần xác nhận]`, phân loại 3 nhóm (sân bay/vùng trời/đường bay), đánh giá ảnh hưởng đến từng chuyến, cảnh báo RFFS (BR-118) | Tích hợp mới | Cao |
| GAP-PH1-008 | Tích hợp và cảnh báo thời tiết | Dispatcher tra WNI thủ công `[Cần xác nhận As-Is]` | TOSS parse METAR/SPECI, cảnh báo 3 thông số (tầm nhìn, trần mây, TSRA) so ngưỡng VMA `[cần xác nhận]` cộng biên an toàn; ưu tiên nguồn METAR nội địa (BR-119) | Tích hợp mới | Cao |
| GAP-PH1-009 | Kiểm tra MEL/CDL và NAIL ảnh hưởng chuyến | Tra Ops++/AMOS riêng; không có cảnh báo tự động gắn với khoảng hiệu lực chuyến | TOSS sinh cảnh báo NAIL/CDL theo khoảng hiệu lực (active period), chỉ cảnh báo chuyến chưa cất cánh nằm trong khoảng, hỗ trợ chuyển kế hoạch khai thác (BR-121) | Tích hợp mới | Cao |
| GAP-PH1-010 | Đối soát lệch tải OFP vs thực tế | `[Chưa rõ quy trình As-Is — cần làm rõ với VNA]` | TOSS sinh cảnh báo lệch tải giữa OFP và số liệu CLC, ngưỡng ma trận đa chiều (loại tàu × khoảng giờ bay × ngưỡng không đối xứng), lưu lịch sử nhập CLC (BR-120) | Tích hợp mới | Cao |
| GAP-PH1-011 | Kiểm tra chứng chỉ tổ bay theo sân bay | Tra Crew Trip thủ công; không có đối chiếu tự động điều kiện sân bay đặc thù | TOSS đối chiếu chứng chỉ tổ bay vs điều kiện sân bay địa hình/đặc thù `[danh sách cần xác nhận]`, sinh cảnh báo cho điều phái đề nghị đổi tổ (BR-122) | Tích hợp mới | Trung bình |
| GAP-PH1-012 | Cảnh báo đổi tổ bay | Không có cảnh báo tự động khi tổ bay thay đổi | TOSS sinh cảnh báo đổi tổ bay kèm tên tổ mới; phân loại đối tượng nhận cảnh báo chốt sau `[cần xác nhận]` (BR-123) | Thiếu tính năng | Thấp |
| GAP-PH1-013 | Cảnh báo PAX time | Không có cảnh báo tự động từ OFP | TOSS sinh cảnh báo PAX time từ số liệu OFP/Lido; không sinh cảnh báo APU time (nguồn không cung cấp); ngưỡng phút trước STD `[cần xác nhận]` (BR-124) | Thiếu tính năng | Thấp |
| GAP-PH1-014 | Cảnh báo chuyến không thường lệ thiếu STS/HEAD | Không có cơ chế cảnh báo tự động; bỏ sót STS/HEAD ảnh hưởng claim CORSIA/EU ETS | TOSS sinh cảnh báo "Chuyến không thường lệ — OFP chưa có STS/HEAD" theo mã loại chuyến `[danh mục cần xác nhận]`, áp dụng trước Captain's Release (BR-126) | Thiếu tính năng | Trung bình |
| GAP-PH1-015 | Cảnh báo đã filed ATC FPL | Không có cảnh báo tự động | TOSS sinh cảnh báo "đã filed ATC FPL hay chưa" cho từng chuyến (BR-127) | Thiếu tính năng | Thấp |
| GAP-PH1-016 | Cảnh báo TAT không đủ | Không có cảnh báo tự động | TOSS sinh cảnh báo khi TAT thực tế không đủ so với Scheduled TAT chuẩn (BR-128) | Thiếu tính năng | Thấp |
| GAP-PH1-017 | Cảnh báo Airport Constraints (Slot, curfew) | Không có cảnh báo tự động | TOSS sinh cảnh báo Airport Constraints (Slot, giờ giới nghiêm, hạn chế sân bay) ảnh hưởng chuyến (BR-129) | Tích hợp mới | Trung bình |
| GAP-PH1-018 | Kiểm tra bất thường lịch bay (thay Excel Tổ Lịch Bay) | Dùng công cụ Excel thủ công để kiểm tra: lệch đầu, vặn tàu DAD, tàu hỏng APU đến sân không có thiết bị điện mặt đất, Ground time vs tiêu chuẩn, vi phạm phép bay | TOSS tự kiểm tra bất thường lịch bay thay thế hoàn toàn công cụ Excel của Tổ Lịch Bay (BR-130) | Thay thế thủ công | Cao |
| GAP-PH1-019 | Cảnh báo AC APU INOP đến sân không có GPU/ASU/ACU | Không có cảnh báo tự động; phụ thuộc kinh nghiệm điều phái | TOSS sinh cảnh báo khi tàu hỏng APU theo khoảng From/To được hoạch định đến sân không cung cấp GPU/ASU/ACU (BR-131) | Tích hợp mới | Trung bình |
| GAP-PH1-020 | Cơ chế bật/tắt cảnh báo | Không có cơ chế cá nhân hóa cảnh báo | TOSS cung cấp cơ chế bật/tắt 2 cấp: mặc định toàn hệ thống (admin) + cấu hình cá nhân từng user (BR-132) | Tính năng mới | Thấp |
| GAP-PH1-021 | Xem chi tiết chuyến bay (Flight Detail) | Không có giao diện chi tiết tập trung; tra từng hệ thống riêng | TOSS mở Flight Detail ở tab mới khi click; mở nhiều tab đồng thời; active đúng tab phụ tương ứng với cảnh báo được click (BR-133, BR-134, BR-135) | Tính năng mới | Trung bình |
| GAP-PH1-022 | Phân quyền dữ liệu màn Giám sát | Phân quyền theo hệ thống riêng lẻ; không có phân quyền tổng hợp | TOSS phân quyền 2 lớp (chức năng + dữ liệu theo carrier/khu vực/role); hỗ trợ nhiều role, switch view; sub-admin phân chia theo nhiệm vụ (BR-141) | Tính năng mới | Cao |
| GAP-PH1-023 | Lưu cấu hình hiển thị cá nhân | Không có | TOSS lưu filter, cột, trạng thái theo profile user (không theo máy) (BR-142) | Tính năng mới | Thấp |
| GAP-PH1-024 | Lịch sử thay đổi theo format thống nhất | Không có audit trail tập trung `[Cần xác nhận As-Is]` | TOSS áp dụng format lịch sử đổi thống nhất (timeline kéo dọc, mũi tên kèm giờ UTC) cho tàu bay, tổ bay, giờ ETD, suffix D/Z (BR-150) | Tính năng mới | Thấp |
| GAP-PH1-025 | Tích hợp bản đồ FlightRadar24 | Xem FlightRadar24 trên màn hình riêng biệt | TOSS tích hợp liên kết nhúng FlightRadar24 từ chuyến bay (BR-105) | Tích hợp mới | Thấp |
| GAP-PH1-026 | Quản lý hồ sơ và tình trạng tàu bay thời gian thực | Tra AMOS/Ops++ riêng | TOSS quản lý định danh, lịch khai thác, PF, MEL/CDL, lịch bảo dưỡng, AOG, FC, chi phí APU (BR-107) | Dữ liệu thiếu / Tích hợp mới | Cao |
| GAP-PH1-027 | Thông tin tổ bay và kiểm soát FTL | Tra Crew Trip thủ công; không có cảnh báo FTL tự động | TOSS quản lý hồ sơ phi hành đoàn, FTL/Duty Time, cảnh báo Crew Feasibility (BR-108) | Tích hợp mới | Cao |
| GAP-PH1-028 | Theo dõi Payload và thông tin hành khách realtime | Tra nhiều hệ thống riêng | TOSS hiển thị realtime số khách theo hạng/nhóm đặc biệt; quản lý Payload (BR-109) | Tích hợp mới | Cao |
| GAP-PH1-029 | Khuyến nghị tối ưu (tankering, CI, sân bay dự bị) | Phân tích thủ công, phụ thuộc kinh nghiệm | TOSS cung cấp khuyến nghị tối ưu; tích hợp NOTAM, thời tiết, SID/STAR; quản trị nhiên liệu (BR-110) | Tính năng mới | Cao |
| GAP-PH1-030 | Theo dõi mốc khai thác sân bay (A-CDM) | Không có chuẩn hóa mốc thời gian A-CDM tập trung | TOSS chuẩn hóa bộ mốc A-CDM/ICAO (ELDT/ALDT/SOBT/EOBT/TOBT/AOBT/TSAT/CTOT/ATOT…) phục vụ OTP (BR-111) | Tích hợp mới | Cao |
| GAP-PH1-031 | Quản trị đa Carrier (VNA, 0V, BL) | Phân quyền theo từng hệ thống riêng | TOSS hỗ trợ điều hành đồng thời nhiều Carrier trên cùng nền tảng (BR-106) | Tính năng mới | Trung bình |
| GAP-PH1-032 | Ghi nhận delay code | Thủ công `[Cần xác nhận As-Is]` | `[Chưa rõ trong nguồn BRD PH1 — cần làm rõ với VNA]` | Chưa rõ | — |

---

## 2. Bảng Gap — Phân hệ 2 (PH2)

> Nguồn As-Is: ASIS-OCC-DISPATCH-v0.1.md (§2 — tài liệu chuyến bay). Nguồn To-Be: BRD-TOSS-PH2 (BR-201…BR-231).

| GAP | Quy trình As-Is | Tình trạng hiện tại | To-Be theo BRD | Loại Gap | Độ phức tạp |
|---|---|---|---|---|---|
| GAP-PH2-001 | Tổng hợp tài liệu chuyến bay (OFP/NOTAM/WX) | Dispatcher lấy OFP từ Lido thủ công; NOTAM từ web bên ngoài; WX từ WNI; không có gắn kết tự động với từng chuyến | TOSS tự động đồng bộ OFP, NOTAM, WX, Briefing Package từ Lido gắn với từng chuyến (BR-201) | Thay thế thủ công / Tích hợp mới | Cao |
| GAP-PH2-002 | Quản lý phiên bản OFP | Không rõ cơ chế quản lý phiên bản `[Cần xác nhận As-Is]` | TOSS quản lý đa phiên bản OFP: hiển thị trạng thái, xem/tải xuống mọi phiên bản, lịch sử tạo kèm thông số kỹ thuật; TOSS tự gán phiên bản R1/R2… (Lido chỉ có OFP Number) (BR-202, BR-213) | Thiếu tính năng | Trung bình |
| GAP-PH2-003 | Xem nhanh thông tin điều phái từ OFP | Phải mở file OFP đầy đủ để tra từng trường | TOSS hiển thị nhanh: người lập kế hoạch, Payload, Fuel Order, PIC, thông số Flight Release; parse và lưu toàn bộ OFP kể cả trường không dùng trong FOS report (BR-203) | Thiếu tính năng | Trung bình |
| GAP-PH2-004 | Briefing Sheet kỹ thuật số | Briefing dùng giấy hoặc file tĩnh `[Cần xác nhận As-Is]` | TOSS cung cấp Briefing Sheet tương tác: ghi chú/chú thích cho NOTAM, WX, MEL/CDL, Special Ops; tự cập nhật khi có thay đổi nguồn (BR-204) | Thay thế thủ công | Trung bình |
| GAP-PH2-005 | Quản lý Revision NOTAM/WX | Không rõ `[Cần xác nhận As-Is]` | TOSS kiểm soát Revision NOTAM/WX; mặc định hiển thị phiên bản cuối; vẫn xem được nội dung và thời gian upload các phiên bản trước (BR-205) | Thiếu tính năng | Thấp |
| GAP-PH2-006 | Upload tài liệu bổ sung (đa định dạng) | Upload thủ công qua email hoặc hệ thống riêng `[Cần xác nhận As-Is]` | TOSS hỗ trợ đa định dạng (PDF, DOCX, ảnh, TXT); upload thủ công cho từng chuyến hoặc nhiều chuyến; giao diện dự phòng khi adapter lỗi (BR-206) | Thiếu tính năng | Thấp |
| GAP-PH2-007 | Tích hợp Load Sheet, GD, PM, NOTOC, Cargo/Mail Manifest | Tích hợp thủ công từ PSS/DCS; không gắn kết tự động với chuyến | TOSS tự động tích hợp và gắn LS, GD, PM, NOTOC, Cargo/Mail Manifest từ PSS/DCS; bóc tách và lưu trữ trường dữ liệu quan trọng phục vụ tìm kiếm và báo cáo (BR-207) | Tích hợp mới | Cao |
| GAP-PH2-008 | Luồng xác thực tài liệu | Không có luồng Confirmation tập trung; xác nhận qua email hoặc giấy `[Cần xác nhận As-Is]` | TOSS kiểm soát Confirmation Workflow: Unconfirmed/Confirmed/Rejected theo từng đối tượng; phân quyền xác nhận một phần hoặc toàn bộ (BR-208) | Thay thế thủ công | Cao |
| GAP-PH2-009 | Truy vết Request/Confirm/Reject | Không có audit trail cho từng phiên bản tài liệu | TOSS truy vết Request — phản hồi chi tiết (lý do, thời gian, comment) cho từng phiên bản; cho phép download trang xác nhận (BR-209) | Tính năng mới | Thấp |
| GAP-PH2-010 | Truy cập tài liệu cho tổ bay trên mobile | Tổ bay nhận tài liệu qua giấy hoặc email `[Cần xác nhận As-Is — Q04 ASIS]` | TOSS cung cấp Web Mobile iOS/Android/iPadOS cho tổ bay quản lý thông tin, xem tài liệu, xác nhận điện tử tại hiện trường (BR-210) | Tính năng mới | Cao |
| GAP-PH2-011 | Tải tài liệu hàng loạt theo khu vực | Upload từng file một `[Cần xác nhận As-Is]` | TOSS hỗ trợ tải hàng loạt theo khu vực; tự gắn tài liệu vào đúng chuyến dựa trên quy ước đặt tên tệp (BR-211) | Thiếu tính năng | Thấp |
| GAP-PH2-012 | Chính sách lưu trữ tài liệu ngoài | Tài liệu từ hệ thống ngoài được lưu lâu dài không rõ quy tắc `[Cần xác nhận As-Is]` | TOSS áp dụng nguyên tắc: tài liệu TOSS sinh ra lưu trong hệ thống; tài liệu từ ngoài kéo về khi người dùng tải, lưu tối đa 3 ngày sau hạ cánh rồi tự xóa (BR-212) | Tính năng mới | Thấp |
| GAP-PH2-013 | Dispatch Release của điều phái | Dispatch Release thủ công hoặc chưa số hóa đồng bộ `[Cần xác nhận As-Is — Q01 ASIS]` | TOSS bổ sung Dispatch Release là thao tác chủ động: gắn trạng thái DR cho từng phiên bản OFP; module Flight Dispatch 3 chức năng cốt lõi (nhận OFP/Release/Unrelease) (BR-213) | Số hóa / Thay thế thủ công | Cao |
| GAP-PH2-014 | Đồng bộ trạng thái DR sang MO Plus | Chưa có kết nối tự động TOSS → MO Plus | TOSS đồng bộ trạng thái DR sang MO Plus; MO Plus chặn Captain's Release khi chưa có DR; khi Unrelease → MO Plus reset Confirm Release của phi công về 0 (BR-214) | Tích hợp mới | Cao |
| GAP-PH2-015 | Ghi nhận lịch sử làm lại OFP sát giờ | Không có lưu vết lý do làm lại OFP `[Cần xác nhận As-Is]` | TOSS ghi nhận lịch sử các lần làm lại OFP dưới 60 phút trước STD (nội địa) kèm lý do "tổ bay yêu cầu"; không tự động hóa quyết định (BR-215) | Tính năng mới | Thấp |
| GAP-PH2-016 | Quản lý tải trọng (Load management) | Tính toán tải trọng thủ công hoặc qua hệ thống riêng `[Cần xác nhận As-Is]` | TOSS tự động tính trọng lượng PAX/hành lý theo cấu hình chuẩn; quản lý hàng/mail; quản lý ULD (AKE, PMC) với quy đổi tự động; tính Payload và ZFW ước tính (BR-216) | Thiếu tính năng | Cao |
| GAP-PH2-017 | Đối soát an toàn ZFW | Không có đối soát tự động DOW/ZFW | TOSS đối soát ZFW: so sánh DOW và ZFW từ OFP với ZFW thực tế tính toán; cảnh báo Delta khi sai lệch; nhập thủ công khi cần và ghi lịch sử (BR-217) | Thiếu tính năng | Trung bình |
| GAP-PH2-018 | Chức năng Unrelease OFP | Không có cơ chế Unrelease có kiểm soát | TOSS cung cấp Unrelease đối xứng với Release: hiển thị danh sách phiên bản cũ để điều phái chọn quay về; sinh revision mới đẩy sang MO Plus; quy ước gán số phiên bản sau Unrelease `[cần xác nhận]` (BR-218) | Tính năng mới | Cao |
| GAP-PH2-019 | Chức năng dự phòng khi Lido lỗi | Khi Lido lỗi, điều phái không có quy trình backup có kiểm soát `[Cần xác nhận As-Is]` | TOSS cung cấp backup: tải file raw chuyến tương tự (PDF+TXT+HTML), sửa thông số chính, upload lại; TOSS đẩy đủ 3 định dạng lên MO Plus theo đúng quy tắc bóc tách (BR-219) | Tính năng mới | Cao |
| GAP-PH2-020 | Upload thời tiết áp nhiều chuyến | Upload file thời tiết lần lượt từng chuyến `[Cần xác nhận As-Is]` | TOSS cung cấp Weather Multi-Flight: chọn khoảng thời gian hiệu lực, upload 1 lần, TOSS tự gắn vào tất cả chuyến có ETD trong khoảng; hỗ trợ song song file riêng/file chung (BR-220) | Thiếu tính năng | Trung bình |
| GAP-PH2-021 | Sửa thông số OFP trước khi đẩy MO Plus | Sửa thủ công trên file gốc `[Cần xác nhận As-Is]` | TOSS hỗ trợ sửa các trường thông số OFP ưu tiên (FL Climb/Cruise/Descend, dầu mỡ, giờ, Brady, ADC `[cần xác nhận]`); phương án triển khai PA1 vs PA2 chốt sau `[cần xác nhận]` (BR-221) | Thiếu tính năng | Cao |
| GAP-PH2-022 | Cảnh báo "Chuyến thiếu tài liệu" và "Tổ bay chưa tải tài liệu mới nhất" | Không có cảnh báo tự động về trạng thái tài liệu | TOSS sinh 2 cảnh báo: (a) "Chuyến bay thiếu tài liệu" khi đến mốc thời gian chưa có tài liệu hoặc luồng tự động lỗi; (b) "Tổ bay chưa tải tài liệu mới nhất" đối chiếu download history từ MO Plus (BR-222) | Thiếu tính năng | Trung bình |
| GAP-PH2-023 | Cảnh báo lệch ATC FPL vs điện ATC đã filed | Không có đối soát tự động | TOSS sinh cảnh báo màu khi ATC FPL trong OFP sai lệch với điện ATC đã filed (BR-223) | Thiếu tính năng | Trung bình |
| GAP-PH2-024 | Cảnh báo phiên bản OFP mới khác bản cũ ở các trường then chốt | Không có đối soát phiên bản tự động | TOSS sinh cảnh báo khi OFP mới khác bản cũ ở: AC Reg, ETD, DEP, ARR, PAX, DOW/Payload vượt giới hạn, đổi tổ bay (BR-224) | Thiếu tính năng | Trung bình |
| GAP-PH2-025 | Số hóa và lưu EOFP (OFP thực tế sau chuyến) | Không có số hóa EOFP tập trung | TOSS số hóa và lưu EOFP: off-block/takeoff/landing/in-block + EOFP CORR các giá trị trọng lượng/nhiên liệu (BR-225) | Dữ liệu thiếu | Trung bình |
| GAP-PH2-026 | Số hóa và lưu trường ATC FPL | Không có lưu trữ số hóa ATC FPL | TOSS số hóa và lưu: type of flight, wake turbulence, equipment, surveillance, speed, FL, route, SID, STS, FIRS (BR-226) | Dữ liệu thiếu | Thấp |
| GAP-PH2-027 | Số hóa và lưu RCL (Re-Clearance) | Không có lưu trữ số hóa RCL | TOSS số hóa và lưu RCL: decision point, route, final/enroute dest, giá trị nhiên liệu/thời gian; phạm vi nghiệp vụ RCL cần xác nhận `[cần xác nhận]` (BR-227) | Dữ liệu thiếu | Trung bình |
| GAP-PH2-028 | Số hóa và lưu EDTO Critical Point | Không có lưu trữ số hóa | TOSS số hóa và lưu EDTO Critical Point trong OFP (LAT/LON/SAP/time/dist/FL/FOB…) (BR-228) | Dữ liệu thiếu | Thấp |
| GAP-PH2-029 | Số hóa và lưu ACARS CDA | Không có lưu trữ số hóa ACARS CDA | TOSS số hóa và lưu ACARS CDA: CLR time/runway/squawk/FL restrict/SID/TSAT/ADT/gate (BR-229) | Dữ liệu thiếu | Thấp |
| GAP-PH2-030 | Chức năng Attach file trực tiếp lên MO Plus | Không có thao tác riêng ngoài adapter Lido | TOSS bổ sung chức năng "Attach file lên MO Plus" như thao tác riêng (BR-230) | Thiếu tính năng | Thấp |
| GAP-PH2-031 | Giám sát và cảnh báo luồng tự động Lido 4D | Không có giám sát luồng tự động | TOSS giám sát và cảnh báo lỗi adapter Lido 4D, lỗi parse, lỗi đẩy OFP sang MO Plus; danh mục cảnh báo cụ thể `[cần xác nhận]` (BR-231) | Tính năng mới | Trung bình |

---

## 3. Tổng hợp — Số lượng gap theo loại

### 3.1 Phân hệ 1 (PH1)

| Loại Gap | Số lượng | Ví dụ gap điển hình |
|---|---|---|
| Thiếu tính năng | 11 | GAP-PH1-002 (cảnh báo bất thường), GAP-PH1-004 (Monitoring real-time), GAP-PH1-005 (cảnh báo thay đổi lịch), GAP-PH1-006 (Divert), GAP-PH1-012, 013, 014, 015, 016, 021, 027 |
| Tích hợp mới | 10 | GAP-PH1-007 (NOTAM), GAP-PH1-008 (WX), GAP-PH1-009 (MEL/CDL/NAIL), GAP-PH1-010 (lệch tải), GAP-PH1-011 (chứng chỉ tổ bay), GAP-PH1-017 (Airport Constraints), GAP-PH1-019 (APU INOP), GAP-PH1-025 (FlightRadar24), GAP-PH1-027 (FTL), GAP-PH1-028 (Payload), GAP-PH1-030 (A-CDM) |
| Thay thế thủ công | 4 | GAP-PH1-001 (tổng hợp thông tin chuyến), GAP-PH1-003 (kiểm tra đầu ca), GAP-PH1-013 (Dispatch Release), GAP-PH1-018 (thay Excel Tổ Lịch Bay) |
| Tính năng mới | 7 | GAP-PH1-003, GAP-PH1-020, GAP-PH1-021, GAP-PH1-022, GAP-PH1-023, GAP-PH1-024, GAP-PH1-029, GAP-PH1-031 |
| Dữ liệu thiếu | 1 | GAP-PH1-026 (hồ sơ tàu bay thời gian thực) |
| Chưa rõ | 1 | GAP-PH1-032 (ghi nhận delay code) |
| **Tổng** | **32** | |

> Lưu ý: một số gap có thể thuộc nhiều loại (ví dụ GAP-PH1-026 vừa là Dữ liệu thiếu vừa là Tích hợp mới); bảng trên ghi loại chính theo tình trạng As-Is nổi bật nhất.

### 3.2 Phân hệ 2 (PH2)

| Loại Gap | Số lượng | Ví dụ gap điển hình |
|---|---|---|
| Thiếu tính năng | 10 | GAP-PH2-002, 003, 005, 006, 011, 016, 017, 020, 021, 022, 023, 024, 030 |
| Tích hợp mới | 3 | GAP-PH2-001 (OFP/NOTAM/WX từ Lido), GAP-PH2-007 (LS/NOTOC từ PSS/DCS), GAP-PH2-014 (TOSS ↔ MO Plus) |
| Thay thế thủ công | 4 | GAP-PH2-001, GAP-PH2-004, GAP-PH2-008, GAP-PH2-013 |
| Tính năng mới | 8 | GAP-PH2-009, 010, 012, 015, 018, 019, 025, 031 |
| Dữ liệu thiếu | 4 | GAP-PH2-025, 026, 027, 028, 029 |
| **Tổng** | **31** | |

### 3.3 Tổng hợp hai phân hệ

| Loại Gap | PH1 | PH2 | Tổng |
|---|---|---|---|
| Thiếu tính năng | 11 | 10 | 21 |
| Tích hợp mới | 10 | 3 | 13 |
| Thay thế thủ công | 4 | 4 | 8 |
| Tính năng mới | 7 | 8 | 15 |
| Dữ liệu thiếu | 1 | 5 | 6 |
| Chưa rõ | 1 | 0 | 1 |
| **Tổng** | **32** | **31** | **63** |

---

## 4. Nhóm ưu tiên xử lý

> Phân nhóm dựa trên độ phức tạp Cao và tính liên kết nghiệp vụ cốt lõi.

### 4.1 Ưu tiên 1 — Nền tảng giám sát (cần xây trước để PH1 hoạt động)

| GAP | Mô tả ngắn | BR | Độ phức tạp |
|---|---|---|---|
| GAP-PH1-001 | Bảng chuyến bay hợp nhất | BR-101 | Cao |
| GAP-PH1-004 | Monitoring real-time | BR-125, BR-148 | Cao |
| GAP-PH1-022 | Phân quyền 2 lớp | BR-141 | Cao |
| GAP-PH2-013 | Dispatch Release số hóa | BR-213 | Cao |
| GAP-PH2-014 | Đồng bộ TOSS ↔ MO Plus | BR-214 | Cao |
| GAP-PH2-001 | Tự động đồng bộ OFP/NOTAM/WX | BR-201 | Cao |

### 4.2 Ưu tiên 2 — Cảnh báo cốt lõi (an toàn và OTP)

| GAP | Mô tả ngắn | BR | Độ phức tạp |
|---|---|---|---|
| GAP-PH1-002 | Cảnh báo bất thường màu sắc | BR-103 | Cao |
| GAP-PH1-007 | Tích hợp NOTAM | BR-118 | Cao |
| GAP-PH1-008 | Tích hợp thời tiết METAR/SPECI | BR-119 | Cao |
| GAP-PH1-009 | Cảnh báo NAIL/CDL | BR-121 | Cao |
| GAP-PH1-010 | Cảnh báo lệch tải OFP vs CLC | BR-120 | Cao |
| GAP-PH1-027 | Kiểm soát FTL tổ bay | BR-108 | Cao |
| GAP-PH1-018 | Thay Excel kiểm tra lịch bay | BR-130 | Cao |
| GAP-PH2-022 | Cảnh báo thiếu tài liệu / tổ bay chưa tải | BR-222 | Trung bình |

### 4.3 Ưu tiên 3 — Tích hợp dữ liệu và số hóa

| GAP | Mô tả ngắn | BR | Độ phức tạp |
|---|---|---|---|
| GAP-PH1-026 | Hồ sơ tàu bay thời gian thực | BR-107 | Cao |
| GAP-PH1-028 | Payload / PAX real-time | BR-109 | Cao |
| GAP-PH1-030 | Mốc khai thác A-CDM | BR-111 | Cao |
| GAP-PH2-007 | LS/NOTOC từ PSS/DCS | BR-207 | Cao |
| GAP-PH2-016 | Quản lý tải trọng tự động | BR-216 | Cao |
| GAP-PH2-018 | Unrelease OFP | BR-218 | Cao |
| GAP-PH2-019 | Dự phòng khi Lido lỗi | BR-219 | Cao |
| GAP-PH2-021 | Sửa thông số OFP | BR-221 | Cao |

### 4.4 Ưu tiên 4 — Lưu trữ và tiện ích bổ sung

| GAP | Mô tả ngắn | BR | Độ phức tạp |
|---|---|---|---|
| GAP-PH2-025–029 | Số hóa EOFP, ATC FPL, RCL, EDTO, ACARS CDA | BR-225…229 | Thấp–Trung bình |
| GAP-PH1-023, 024 | Profile cá nhân, audit trail | BR-142, BR-150 | Thấp |
| GAP-PH2-009, 012, 015 | Truy vết xác nhận, chính sách lưu trữ, lịch sử làm lại OFP | BR-209, 212, 215 | Thấp |

---

## 5. Giả định và ràng buộc

| # | Nội dung | Loại | Nguồn |
|---|---|---|---|
| GA-01 | Phân tích As-Is dựa trên ASIS-OCC-DISPATCH-v0.1.md vốn được suy diễn từ tài liệu đề xuất kỹ thuật v0.3; nhiều bước As-Is vẫn cần xác nhận qua phỏng vấn trực tiếp (Q01–Q08 trong ASIS). | Giới hạn nguồn | ASIS §6 |
| GA-02 | TOSS PH1 đóng vai trò "view + cảnh báo"; không thực hiện chức năng nghiệp vụ chuyên dụng của Lido, MO Plus, AMOS, Crew Trip. | Ràng buộc thiết kế | BR-115 |
| GA-03 | Các gap gắn cờ `[Cần xác nhận As-Is]` cần được xác nhận qua phỏng vấn Dispatcher/OCC trước khi ước tính công sức thiết kế. | Cần làm rõ | ASIS §6 |
| GA-04 | GAP-PH1-032 (ghi nhận delay code) chưa có trong BRD PH1 — cần xác nhận phạm vi với VNA; nếu là yêu cầu thì sẽ sinh BR mới. | Chưa rõ phạm vi | ASIS §2 |
| GA-05 | Phạm vi giao diện cụ thể TOSS ↔ MO Plus (GAP-PH2-014) cần làm rõ với đội MO Plus. | Cần làm rõ kỹ thuật | BR-214 |
| GA-06 | Phương án triển khai sửa thông số OFP (PA1 vs PA2, GAP-PH2-021) cần quyết định sau phân tích kỹ thuật. | Quyết định chờ | BR-221 `[cần xác nhận]` |
| GA-07 | Tên hệ thống TIMS trong danh sách tích hợp As-Is chưa được làm rõ chức năng. | Cần làm rõ | ASIS §1.1 `[SH-03]` |
| GA-08 | Số liệu đo lường As-Is (thời gian soạn Dispatch Release, % OTP hiện tại…) chưa thu thập được — cần VNA cung cấp để định lượng impact của từng gap. | Dữ liệu thiếu | ASIS §5 |

---

*GAP-ANALYSIS-PH1-PH2 v0.1 — 2026-06-17. Nguồn: ASIS-OCC-DISPATCH-v0.1.md, BRD-TOSS-PH1 (BR-101…150), BRD-TOSS-PH2 (BR-201…231), PHAN-RA-BRD-PH1 v0.5, PHAN-RA-BRD-PH2 v0.3.*
