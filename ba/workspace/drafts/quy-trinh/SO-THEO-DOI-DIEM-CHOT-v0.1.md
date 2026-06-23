---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.18"
date: "2026-06-23"
status: "Draft"
document_type: "Sổ theo dõi Điểm cần chốt & Câu hỏi mở (Open Items & Decisions Register)"
document_id: "OID-TOSS-001"
---

# Sổ theo dõi Điểm cần chốt & Câu hỏi mở — TOSS

> **Mục đích:** Gom toàn bộ điểm cần chốt / câu hỏi mở rải rác trong các tài liệu (BRD, phân rã FUNC, báo cáo khảo sát, workflow) vào **một nơi duy nhất**, rà soát và cập nhật **sau mỗi buổi meeting**.
>
> **Nguyên tắc §0:** Sổ này chỉ **ghi nhận trung thực** điểm chưa rõ + nguồn; KHÔNG tự suy diễn câu trả lời. Mỗi điểm được con người (BA Lead/SME) chốt, rồi ghi kết quả + ngày.
>
> **Quy ước trạng thái:** 🔴 Mở · 🟡 Đang xử lý / đã hỏi chờ trả lời · 🟢 Đã chốt.
>
> **Phân loại (Loại):** `QĐ` = Quyết định BA Lead · `SME` = Cần SME/khách hàng xác nhận · `KS` = Cần khảo sát bổ sung · `DL` = Tham số/mô hình dữ liệu chưa có nguồn · `HC` = Hành chính/hạ tầng.

---

## A. Quyết định của BA Lead (QĐ)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| DEC-01 | Thứ tự triển khai **PH3 Báo cáo trước hay PH2 Tài liệu trước** (đề xuất PH3 trước) | WF-TOSS-001 §4, §9 | Nội bộ BA Lead | 🔴 Mở | |
| DEC-02 | Gán **mốc thời gian** cho 3 giai đoạn (giữ ràng buộc thông kết nối 30/06/2026) | WF-TOSS-001 §4; KS 08/06 §7 | Nội bộ + project schedule | 🔴 Mở | |
| DEC-03 | Bổ sung **danh sách member** team BA (hoặc cấp `gh`/token để đọc collaborator repo private) | WF-TOSS-001 §8 | Nội bộ BA Lead | 🔴 Mở | |
| DEC-04 | **Gán tên người** vào ma trận Lai (chủ trì/hỗ trợ/chuyên gia) + chọn kịch bản đội hình | WF-TOSS-001 §5, §8 | Nội bộ BA Lead | 🔴 Mở | |
| DEC-05 | Duyệt **ánh xạ 7 phân hệ cũ → 5 phân hệ mới**, cập nhật `PHAN-CONG-ROLE-BA §3` | WF-TOSS-001 §2 | Nội bộ BA Lead | 🔴 Mở | |
| DEC-06 | Bổ sung **chỉ tiêu định lượng + Time-bound** cho mục tiêu OBJ-001 (phủ Movement), OBJ-002 (chính xác Movement), OBJ-008 (Single Source of Truth danh mục), OBJ-009 (thời gian kiểm tra đầu ca) — cần workshop SME VNA để chốt baseline→target→tháng đạt; + ma trận RACI | BRD §4, §6.1 / VALIDATION-BRD-v0.10 §B | Workshop SME VNA | 🔴 Mở (chặn freeze BRD PH1/PH3/PH5 theo VALIDATION-BRD-v0.10 §G.1 G2) | |
| G2-FREEZE | **Freeze BRD PH1/PH3/PH5 bị chặn** chờ workshop SME VNA chốt OID DEC-06 + KS-48 (định lượng 7 OBJ). Sau workshop: cập nhật §4 BRD khung → bump v0.12. Phán quyết: PH2 + PH4 đã sẵn sàng SRS, không chờ G2. | VALIDATION-BRD-v0.10 §G.1 G2 | Workshop SME VNA | 🔴 Mở (chặn) | Lên lịch workshop với VNA trong tuần tới |
| DEC-07 | 🔴 **Nới giới hạn 20 ký tự Adapter Lido cho tên crew** — chấp nhận hiện trạng (16 ký tự tên + 4 ký tự group code) hay sửa cấu trúc FPX gửi ATC để nới? Ảnh hưởng trực tiếp độ chính xác matching PIC. | KS 18/06 §11 | Lãnh đạo dự án | 🔴 Mở | |
| DEC-08 | **Cơ chế lưu vết cảnh báo đã từng phát sinh** — khi điều phái chưa thao tác nhưng CLC gửi điện cập nhật làm dữ liệu khớp lại: có lưu lịch sử "đã từng cảnh báo" để theo dõi hay tự động chuyển xanh là đủ? | KS 18/06 sáng 37:31–38:10 | BA Lead + điều phái | 🔴 Mở | |
| DEC-09 | 🔴 **Vị trí tab "Ngưỡng Payload" và "Ngưỡng DAO"** — đặt trong phân hệ Quản lý chặng bay (PH4) theo lời CLC, hay phân hệ Quản trị hệ thống (PH5) vì là tham số cấu hình? | KS 18/06 sáng 45:02–53:15 | BA Lead + workshop danh mục | 🔴 Mở | |
| DEC-10 | **Vị trí tab "MEL/CDL theo tàu"** trong phân hệ Quản lý tàu bay — xác nhận phân hệ chứa và quan hệ với màn Monitoring (theo chuyến). | KS 18/06 chiều 50:38–51:21 | BA Lead + workshop danh mục | 🔴 Mở | |
| DEC-11 | **BR cha cho phân quyền sửa Minima sân bay** — điều phái sửa trên giao diện điều phái, FOE ban hành ban đầu không sửa; cần xác định BR cha (chưa nằm trong BR-101…150) và đối chiếu BRD. | `PHAN-RA-BRD-PH1-v0.7 §2.52.9` (FUNC-313); KS 18/06 chiều 01:22:43–01:23:32 | BA Lead + đối chiếu BRD | 🔴 Mở | |
| DEC-12 | **BR cha cho cơ chế Dispatch Release** (FUNC-315/316) — bật/tắt nút release đa điều kiện + khôi phục trạng thái; xác định BR cha (chưa nằm trong BR-101…150) và đối chiếu BRD. Tập con cảnh báo chặn (KS-79) là phạm vi nghiệp vụ, không thay thế quyết định BR cha. | `PHAN-RA-BRD-PH1-v0.7 §2.52.11`; KS 18/06 sáng 02:06–02:28; KS 18/06 chiều 01:14:34–01:15:31 | BA Lead + đối chiếu BRD | 🔴 Mở | |
| DEC-13 | **BR cha cho màn Flight Plan dạng danh sách** (FUNC-317) — màn song song với Monitoring, dùng chung dữ liệu nhưng khác mục đích (tra cứu + thống kê OFP); xác định BR cha (chưa nằm trong BR-101…150) và đối chiếu BRD. | `PHAN-RA-BRD-PH1-v0.7 §2.52.12`; KS 18/06 chiều 21:20–23:46 | BA Lead + đối chiếu BRD | 🔴 Mở | |
| DEC-14 | **BR cha + thứ tự ưu tiên nguồn Actual Fuel** (FUNC-318) — ACARS > QAR + cho phép tải tài liệu thủ công khi luồng Lido/AMOS lỗi; trật tự ưu tiên cần đối chiếu sheet-04 §310 TOSS-228 (cờ inline `[ưu tiên nguồn chờ — Q8]`); xác định BR cha (BR-118 hay BR mới). | `PHAN-RA-BRD-PH1-v0.7 §2.52.12`; KS 18/06 chiều 01:27:43–01:30:23; YCKT sheet-04 §310 TOSS-228 | BA Lead + đối chiếu BRD | 🔴 Mở | |
| DEC-15 | **Phạm vi BR cho 11 GAP nghiêm trọng trong 24 luồng OPS++** — bổ sung BR atomic cho từng luồng (đề xuất BR-557…566) hay giữ ở mức data contract chung BR-528a/530 và đẩy chi tiết sang SRS/Tài liệu tích hợp. | DOI-CHIEU-KS-BRD-1719 §4 (D-1); §3.B (28 luồng inbound+outbound, 11 GAP/PARTIAL nghiêm trọng) | BA Lead | 🔴 Mở | |
| DEC-16 | **Nguồn cấp MEL/CDL cho OPS++** — (i) Báo cáo 17/06 chốt TOSS là hub forward AMOS → OPS++ cho MEL/CDL; (ii) bảng tích hợp (pull 23/06) ghi MEL Item và Ground Event là kết nối trực tiếp AMOS ↔ NetOps++. | DOI-CHIEU-KS-BRD-1719 §4 (D-2); KS 17/06 §II.1, §III.1; bảng tích hợp dòng 20–21 | BA Lead | 🟢 Đã chốt | **23/06 (BA Lead): KHÔNG mâu thuẫn.** Bảng tích hợp mô tả sơ đồ đấu nối vào OPS++; phạm vi TOSS = các dòng **"Phương thức = Thông qua TOSS"** (Nguồn → TOSS → OPS++). MEL Item + Ground Event là **"Trực tiếp" AMOS → NetOps++ → ngoài phạm vi tích hợp TOSS** cấp cho OPS++. Việc TOSS tổng hợp/cảnh báo MEL/CDL ba lớp (17/06) là **chức năng GIÁM SÁT NỘI BỘ** của TOSS, tách biệt với luồng cấp dữ liệu cho OPS++. |
| DEC-17 | **Phạm vi "xử lý dữ liệu nội bộ TOSS sau khi nhận từ OPS++"** — VNA tuyên bố không thuộc scope dự án tích hợp NetLine; cần BA Lead chốt: phần xử lý này thuộc phạm vi BRD TOSS (cần BR) hay tách dự án riêng. | DOI-CHIEU-KS-BRD-1719 §4 (D-3); KS 19/06 §III.14, §IV-9 | BA Lead + VNA (họp tổng kết giai đoạn) | 🔴 Mở | |
| DEC-18 | **Hạ ưu tiên BR-127 từ Could → Must** — BR-127 (cảnh báo "đã filed ATC FPL hay chưa") hiện ở Could; KS 18/06 §III.14 yêu cầu cảnh báo 5 thành phần ATC FPL ngay khi có lệch — mức nghiệp vụ Must. Cần BA Lead review lại ưu tiên. | DOI-CHIEU-KS-BRD-1719 §4 (D-4); KS 18/06 §III.14 | BA Lead | 🔴 Mở | |
| DEC-19 | **Khung 2 mức thời gian thống nhất vs khung OFP 3 mức (210/75/60 và 270/90/75)** tại BR-163 — chọn (a) giữ song song hai khung, (b) thống nhất khung 2 mức cho tất cả, hay (c) khung 3 mức cho OFP + khung 2 mức cho các nhóm còn lại. | DOI-CHIEU-KS-BRD-1719 §4 (D-5); BR-163; KS 18/06 §III.5 | BA Lead | 🔴 Mở | |
| DEC-20 | **Cutover NetLine cũ → OPS++ năm chính xác** — KS 19/06 ghi "khoảng tháng 3" nhưng năm chưa rõ; ước tính 03/2027. Cần BA Lead xác nhận với anh Nam (VNA) để chốt mốc trong BRD/roadmap. (Đồng thời là §IV-7 báo cáo 19/06.) | DOI-CHIEU-KS-BRD-1719 §4 (D-6); KS 19/06 §III.13, §IV-7 | BA Lead + anh Nam (VNA) | 🔴 Mở | |
| DEC-21 | **Năm nhóm cố định AOG/MNT Code (AOC/Định kỳ/Line check kỹ thuật/Bảo quản/Standby) trong source code** vs khả năng mở rộng — KS 17/06 §III.24 chốt 5 nhóm cứng; cần BA Lead xác nhận có chấp nhận dài hạn hay cần codeset mở rộng được. | DOI-CHIEU-KS-BRD-1719 §4 (D-7); KS 17/06 §II.8, §III.23, §III.24 | BA Lead + VNA | 🔴 Mở | |
| DEC-22 | **Quy ước đặt tên file Plotting chart / Icing chart** — KS 18/06 §IV-5 để mở: chuỗi "plotting"/"icing" ở vị trí nào, phân biệt hoa thường? Ảnh hưởng BR-262 đề xuất. | DOI-CHIEU-KS-BRD-1719 §4 (D-8); KS 18/06 §III.9, §IV-5 | BA Lead + workshop điều phái | 🔴 Mở (trùng KS-80 — cần đồng bộ hoặc đóng KS-80) | |
| DEC-23 | **Phạm vi tham gia của ASM/ACH/SSIM/SITA trong các BR PH5** — BR-528a hiện gộp "Netline, SSIM/ASM/SSM" làm một; bảng tích hợp 23/06 cho thấy ASM (Đã có) và ACH (Missing) là outbound qua TOSS riêng biệt với SSIM (inbound qua TOSS). Cần BA Lead quyết tách BR-528a thành các BR atomic ASM/ACH/SSIM riêng (đề xuất BR-566). | DOI-CHIEU-KS-BRD-1719 §4 (D-9); bảng tích hợp Inbound dòng 6 + Outbound dòng 3–4 | BA Lead | 🔴 Mở | |
| DEC-24 | **BR cho cấu trúc thư mục SFTP Temp/Pickup/Archive** là BR functional hay NFR/kỹ thuật — Đề xuất BR-560 ở §3.B; tính chất kỹ thuật mạnh — có thể chỉ cần ghi vào tài liệu thiết kế tích hợp thay vì BRD. BA Lead quyết mức tài liệu phù hợp. | DOI-CHIEU-KS-BRD-1719 §4 (D-10); KS 19/06 §III.6 | BA Lead | 🔴 Mở | |

## B. Thuật ngữ & hệ thống cần SME xác nhận (SME)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| SME-01 | **VMA** — viết tắt chính xác cho "ngưỡng thời tiết tối thiểu sân bay" | BRD §9.3; KS 11/06 §II.7 | Dispatcher (phần 2) | 🔴 Mở | |
| SME-02 | **Lotang** — định nghĩa "chuyến Lotang" + tiêu chí đánh giá tác động | BRD §9.3; KS 11/06 §II.5 | Dispatcher (phần 2) | 🟢 Đã chốt | **12/06: "Lotang/lô tam/nô tam" = NOTAM (lỗi ASR — BA Lead xác nhận). KHÔNG có "chuyến Lotang"; gộp vào cảnh báo NOTAM (BR-118). Đã sửa glossary/BRD/FUNC/báo cáo.** |
| SME-03 | **VNCM/VNCS** — tên cơ quan cung cấp NOTAM nội địa | BRD §9.3; KS 11/06 §II.6 | Dispatcher / SME NOTAM | 🔴 Mở | |
| SME-04 | **"Vy Vy"** — tên nguồn METAR nội địa | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-05 | **UA PASMOS** — hệ thống thời tiết được nhắc đến | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-06 | **Sunweather** — tên đầy đủ + vai trò (được đánh giá "rủi ro / không ổn định") | BRD §9.3; BRD Khung §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-07 | **"Phi Công 11"** — tên hệ thống tham khảo, không official | BRD §9.3; BRD Khung §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-08 | **Mốc upload OFP** 90/130/180/200 phút + phân loại chuyến tương ứng | BRD §9.3; KS 11/06 §II.1 | Dispatcher (phần 2) | 🔴 Mở | |
| SME-09 | **Tên hệ thống nguồn** nhận biết yếu nhân/chuyên cơ trong BCAO (ứng viên ASR: ANABS/ANABIOS) | BRD §9.3; KS 09/06 §II.7, §IV.3 | SME trực ban trưởng | 🔴 Mở | |
| SME-10 | **Damp Lease** — tên tiếng Việt chính thức + có cần báo cáo riêng phần nhiên liệu VNA tự cấp | BRD §9.3; KS 09/06 §II.5, §IV | SME khai thác/tài chính | 🔴 Mở | |
| SME-11 | Phân loại **NOTAM 3 nhóm** chi tiết + quy tắc đánh giá ảnh hưởng tới chuyến | FUNC-179 (PH1) | Workshop NOTAM | 🔴 Mở | |
| SME-12 | **CLC** — tên đầy đủ (Centralized Load Control?) + phạm vi nghiệp vụ | KS 11/06 P2 §II.1 | SME tải/cân bằng | 🔴 Mở | |
| SME-13 | **NAIL** — viết tắt + định nghĩa + phân biệt với CDL/MEL | KS 11/06 P2 §II.3 | SME kỹ thuật/bảo dưỡng | 🔴 Mở | |
| SME-14 | **AMOS** — xác nhận hệ thống + cơ chế tích hợp (API/event/poll) | KS 11/06 P2 §II.3 | SME kỹ thuật + workshop tích hợp | 🔴 Mở | |
| SME-15 | **MOI** — đơn vị/hệ thống quản lý Standard Taxi Time | KS 11/06 P2 §II.7 | Dispatcher / quản trị nội bộ | 🔴 Mở | |
| SME-16 | **IFV** (anh Kiếm) — tên đầy đủ phần mềm quản lý bảng dầu AHM | KS 11/06 P2 §II.2 | Dispatcher / anh Kiếm | 🔴 Mở | |
| SME-17 | **TIC (Lido)** — viết tắt + vai trò trong nghiệp vụ tổ bay | KS 11/06 P2 §II.5 | Workshop Lido | 🔴 Mở | |
| SME-18 | **Sân bay đặc biệt** — danh mục đầy đủ + điều kiện chứng chỉ cơ trưởng theo sân bay | KS 11/06 P2 §II.5 | SME tổ bay | 🔴 Mở | |
| SME-19 | Danh mục **Flight Type Code** đầy đủ (O/Z/G/H/A/P/V/S…) + code nào cần STS/HEAD | KS 11/06 chiều §II.2 | SME điều phái | 🔴 Mở | |
| SME-20 | Cơ chế **claim phí khí thải** (CORSIA / EU ETS) — STS/HEAD là căn cứ miễn trừ | KS 11/06 chiều §II.2 | SME điều phái/môi trường | 🔴 Mở | |
| SME-21 | **CCD** (Phase 2) — viết tắt gì (CSD/CRD/nội bộ?) | KS 11/06 chiều §II.3 | SME điều phái | 🔴 Mở | |
| SME-22 | **Mission Watch** — tên hệ thống chính thức + ranh giới với ACARS | KS 11/06 chiều §II.6 | SME điều phái | 🔴 Mở | |
| SME-23 | **AIJS** — viết tắt + phạm vi (nhận diện Weather Multi-Flight) | KS 11/06 chiều §II.9 | SME điều phái/tích hợp | 🔴 Mở | |
| SME-24 | **FME** — viết tắt (Flight Management Editor?) | KS 11/06 chiều §II.9 | SME điều phái | 🔴 Mở | |
| SME-25 | **ICON** — tên hệ thống/tham số khí tượng (Flight Level) | KS 11/06 chiều §II.11 | SME điều phái/khí tượng | 🔴 Mở | |
| SME-26 | **Logitech / GDTN** — tên nguồn log tổ bay upload/truy cập | KS 11/06 chiều §II.12 | SME điều phái | 🔴 Mở | |
| SME-27 | **Sketch Check / Schedule Check** — tên hệ thống tham khảo (real-time + nhấp nháy) | KS 11/06 chiều §II.6 | SME điều phái | 🔴 Mở | |
| SME-28 | **Brady / ADC** — viết tắt + trường cụ thể trong OFP/TXT | KS 11/06 chiều §II.11 | SME điều phái | 🔴 Mở | |
| SME-29 | **AC_STATE** — codeset trạng thái tàu bay (R/O…) | BRD v0.3 BR-421 (Netline) | SME master data | 🔴 Mở | |
| SME-30 | **AC_INDEX** — ngữ nghĩa chỉ số + lý do mẫu = 0 | BRD v0.3 BR-423 (Netline) | SME master data | 🔴 Mở | |
| SME-31 | **AP_RESTRICTION** — codeset hạn chế sân bay theo tàu | BRD v0.3 BR-426 (Netline) | SME điều phái/master data | 🔴 Mở | |
| SME-32 | **FORM D / FORM E** — tên mẫu báo cáo nhà chức trách | BRD v0.3 BR-331 (YCKT V3 d.478) | SME điều phái | 🔴 Mở | |
| SME-33 | **FLIGHT BASE TIME FOR CAAV** — giá trị mặc định (vd 20:00) + quy tắc chốt lịch | BRD v0.3 BR-415 (YCKT sheet-08 #1) | SME điều phái | 🔴 Mở | |
| SME-34 | **FN Surface `Z`** — định nghĩa hậu tố Z (so với D = delay sang ngày sau) trong cột Flight Number Netline | KS 12/06 P1 §3; P2 §11 | SME điều phái + Netline | 🔴 Mở | |
| SME-35 | **Ops++** (trước chép "OFF cộng cộng") — vai trò khi xử lý chuyến `D` quay về ngày gốc | KS 12/06 P2 §11 | SME điều phái | 🟡 Đang xử lý | **12/06: tên hệ thống = Ops++ (BA Lead xác nhận). Hành vi xử lý chuyến `D` về gốc còn mở — gắn KS-36.** |
| SME-36 | **Mã khu vực điều phái** (ĐNA/Hàn/Âu/Mỹ…) dùng trong phân quyền dữ liệu | KS 12/06 P2 §4 | SME điều phái + admin | 🔴 Mở | |
| SME-37 | **"FTP Mail CDL"** trong tab Tàu bay (khả năng MEL/CDL) — xác nhận viết tắt FTP | KS 12/06 P1 §2 | SME điều phái | 🔴 Mở | |
| SME-38 | **pgepoid** — tên đầy đủ phần mềm liên quan luồng performance factor | KS 08/06 §IV.8, §V | SME kỹ thuật/khai thác | 🔴 Mở | |
| SME-39 | **Vasco** (tên đầy đủ) + ý nghĩa **"HT 30-31"** trong câu chuyện hợp nhất khai thác | KS 09/06 §IV.8 (cuối Part 2 nhiễu) | SME điều phái/lãnh đạo | 🔴 Mở | |
| SME-40 | Chuẩn hóa thuật ngữ **take-off weight** (ASR ghi "loft power") và **trọng lượng ướt** (ASR ghi "phi vết") — cách tính chính xác | KS 11/06 P2 §IV.9 | SME tải/cân bằng | 🔴 Mở | |
| SME-41 | **"Quả đấy dầu"** và **"anh Ngọt"** — danh mục/nguồn bảng dầu Lido (ASR có thể đọc lệch) | KS 11/06 P2 §IV.11 | Dispatcher / SME bảng dầu | 🔴 Mở | |
| SME-42 | **Sunweather** — tên đầy đủ và vai trò (được đánh giá "rủi ro/không ổn định") | BRD Khung §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🟢 Đã gộp | **17/06: Đã gộp vào SME-06 (trùng nội dung — cùng là Sunweather). Nguồn BRD Khung §9.3 đã bổ sung vào dòng nguồn của SME-06.** |
| SME-43 | **"Phi Công 11"** — tên hệ thống tham khảo, không official | BRD Khung §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🟢 Đã gộp | **17/06: Đã gộp vào SME-07 (trùng hoàn toàn — cùng là "Phi Công 11"). Nguồn BRD Khung §9.3 đã bổ sung vào dòng nguồn của SME-07.** |
| SME-44 | **Định dạng thứ ba MEL Airbus** (ngoài FrameMaker+IXP và FODM 10.8) — cần SME KTKTB xác nhận tên hệ thống/công cụ và lý do chọn | PH4 BR-425 | SME KTKTB / SME tài liệu kỹ thuật | 🔴 Mở | |
| SME-45 | **Tên đầy đủ hệ thống "FOEM"** trong transcript 17/06 — ASR ghi nhiều dạng: "FOIE", "FOI", "FOEM", "FOM"; đây là hệ thống gì của VNA và tên chính xác? | KS 17/06 §1 | SME bên VNA | 🟢 Đã chốt | **17/06: ban đầu chốt là e-FON. Hiệu chỉnh 18/06: hệ thống chính là OPS++ (Netline Flight Ops++) — hệ khai thác chính của VNA; cụm ASR "FOIE/FOI/FOEM/FOM" đều chỉ OPS++. BA Lead xác nhận. Glossary v0.18: gỡ entry e-FON, gộp vào OPS++; entry FON gỡ link e-FON.** |
| SME-46 | **Danh sách MEL item "ảnh hưởng khai thác"** cần cảnh báo Dispatcher — số lượng, tiêu chí lọc, và file danh sách từ Nga (VNA) | KS 17/06 §3 | Nga (VNA maintenance) | 🔴 Mở | |
| SME-47 | **Hệ thống DDMS** (Document & Data Management System) VNA đang nghiên cứu — tên đầy đủ, tiến độ, khả năng export MEL dạng số hóa và tích hợp TOSS về sau | KS 17/06 §4 | SME VNA / đội DDMS | 🔴 Mở | |
| SME-48 | **Logic lọc BCAO** — bộ phận trực ban kỹ thuật phát Báo cáo Khai thác Hàng ngày (BCAO) dùng tiêu chí nào để lọc danh sách MEL ảnh hưởng khai thác; cần khảo sát bộ phận này | KS 17/06 §3 | SME trực ban kỹ thuật VNA | 🔴 Mở | |
| SME-49 | **Enum LEG STATE** màn Flight Dispatch (GRD/BRD/OUT/ENR/IN/ARR) — xác nhận danh sách đầy đủ, định nghĩa từng trạng thái và quy tắc chuyển (theo mốc ACARS OUT/OFF/ON/IN). Sheet ghi "tạm thời" | wf-monitoring §8-7; Function list "Màn hình Flight Dispatch" | SME điều phái VNA | 🔴 Mở | |
| SME-50 | **Cấu trúc 5 thành phần trong file ATC FPL** dùng cho thuật toán so khớp và làm nổi cập nhật một phần — từng thành phần là gì, quy tắc bóc tách. | KS 18/06 chiều 30:48–31:18 | SME điều phái + SME ATC | 🔴 Mở | |
| SME-51 | **Tên đầy đủ + vai trò của FOEM (Flight Ops Engineering)** — phân biệt với FOE; cấu trúc bảng DOW cấp ra; tần suất cập nhật. | KS 18/06 sáng 46:11–47:21 | SME khai thác | 🔴 Mở | |
| SME-52 | **Hệ thống "Schedule Manager"** sinh tệp lịch bay 3 lần/ngày — tên đầy đủ chính xác (bản ghi 19/06 nghe chưa rõ), vai trò trong luồng SSIM/ASM, quan hệ với Sabre. | KS 19/06 §IV-5 | Bạn An (VNA) | 🔴 Mở | |
| SME-53 | **Bốn nhóm thông tin hành khách từ Amadeus PSS** — số thứ tự chính xác trong bảng làm việc chung (bản ghi nhắc các số "10, 11, 7, 8, 9" nhưng không thống nhất giữa "số 11/số 789" và "số 10/số 5"). | KS 19/06 §IV-8 | Đối chiếu với bảng làm việc của bạn An | 🔴 Mở | |

## C. Vấn đề nghiệp vụ cần làm rõ qua khảo sát (KS)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| KS-01 | **Cơ chế duy trì dữ liệu gần nhất** (ảnh chụp định kỳ vs theo sự kiện) | KS 08/06 §IV, §II.3 | Khảo sát số liệu/kỹ thuật | 🔴 Mở | |
| KS-02 | **Logic chi tiết từng báo cáo** — chỉ mô tả kỹ khi có số liệu thật | KS 08/06 §IV | GĐ2 (đối chiếu số liệu) | 🔴 Mở | |
| KS-03 | **Kiểm chứng nguồn dữ liệu hành khách** (thời gian thực hay bản sao) trước khi dùng ra quyết định nối chuyến | KS 08/06 §II.6, §IV | Khảo sát PSS/DCS | 🔴 Mở | |
| KS-04 | **Phương án khi hệ thống lập kế hoạch bay (Lido) không cho tích hợp trực tiếp** | KS 08/06 §IV | Workshop tích hợp | 🔴 Mở | |
| KS-05 | **Phân biệt tài liệu khi tải hàng loạt** theo tên tệp hay nội dung + quy ước đặt tên | KS 09/06 §II.3, §IV | Workshop luồng tài liệu | 🔴 Mở | |
| KS-06 | **Nguồn danh mục dịch vụ sân bay** (đang quản lý thủ công) | KS 09/06 §II.6, §IV | SME mặt đất | 🔴 Mở | |
| KS-07 | **Danh mục nguyên nhân bất thường BCAO** — nghiệp vụ + danh mục tham chiếu trước khi số hóa | KS 09/06 §II.7, §IV | SME trực ban trưởng | 🔴 Mở | |
| KS-08 | **Giao diện trạng thái TOSS↔MO Plus** (Dispatch Release → chặn Captain's Release): timing, payload, cơ chế thông báo, fail-safe | KS 11/06 §II.2; FUNC-256/257/258 (PH2) | Workshop + đối tác MO Plus | 🔴 Mở | |
| KS-09 | **Phương án parse METAR/SPECI** (tự xây vs thư viện/dịch vụ) — chính xác + bản quyền | KS 11/06 §IV | Workshop kỹ thuật/khí tượng | 🔴 Mở | |
| KS-10 | **Đơn vị nhiên liệu trong điện văn** theo giai đoạn/từng tàu — hệ số quy đổi | KS 09/06 §II.5, §IV | Workshop điện văn ACARS | 🔴 Mở | |
| KS-11 | Đối chiếu lại **phần thời tiết quốc tế / SIGMET** (đoạn ghi âm 11/06 nhiễu nặng) | KS 11/06 §V; FUNC-187 (PH1) | Dispatcher (phần 2) | 🔴 Mở | Phần 2 KHÔNG cover — vẫn cần phỏng vấn bổ sung riêng |
| KS-12 | **Mô hình master NAIL → sub-NAIL** — định nghĩa + thời hạn + quy tắc kích hoạt | KS 11/06 P2 §II.3 | Workshop NAIL/CDL | 🔴 Mở | |
| KS-13 | **Ranh giới Lido↔TOSS với NAIL** (Lido đã tính NAIL vào dầu chưa) → tránh cảnh báo thừa | KS 11/06 P2 §II.3 | Workshop tích hợp Lido | 🔴 Mở | |
| KS-14 | **Bảng ngưỡng cảnh báo lệch tải** chi tiết (loại tàu × dải giờ bay × ngưỡng trên/dưới) | KS 11/06 P2 §II.1 | Dispatcher cung cấp bảng tra | 🔴 Mở | |
| KS-15 | **Tích hợp SkyCheck** (phép bay) — tiến độ phân tích nghiệp vụ + tận dụng kết quả | KS 11/06 P2 §II.4 | Liên hệ qua anh Hùng | 🔴 Mở | |
| KS-16 | **Lido push Standard Taxi Time** — có API/master cho phép push tự động không | KS 11/06 P2 §II.7 | Workshop kỹ thuật Lido | 🔴 Mở | |
| KS-17 | **3 CI (Climb/Cruise/Descend)** — điều kiện để Lido trả đủ 3 CI thay vì 1 | KS 11/06 P2 §II.8 | Đối tác Lido | 🔴 Mở | |
| KS-18 | **Ngưỡng cảnh báo PAX time / lịch PAX** — số phút cụ thể trước STD | KS 11/06 P2 §II.6 | Dispatcher (đoạn nhiễu — phỏng vấn bổ sung) | 🔴 Mở | |
| KS-19 | **Hệ thống "long"** phân tích QAR/QAI — tên đầy đủ + quan hệ với QAI | KS 11/06 P2 §II.7 | SME dữ liệu vận hành | 🔴 Mở | |
| KS-20 | Cơ chế phối hợp **TOSS↔MO Plus khi reset Confirm Release** (signal/payload/timing/notification UX) | KS 11/06 chiều §II.4 | Workshop + đối tác MO Plus | 🔴 Mở | |
| KS-21 | Quy ước **TOSS gán version OFP sau Unrelease** ("2.1" vs auto-tăng "v4") | KS 11/06 chiều §II.4 | Nội bộ + SME | 🟡 Đang xử lý | 15/06: chốt **auto-tăng version cao hơn** khi Un-Release (v2→v3), quay về trạng thái "có OFP chưa release"; quy ước số cụ thể (2.1 vs v4) vẫn chờ. |
| KS-22 | Quy tắc **bóc tách nguồn 3 file OFP (TXT+HTML+PDF)** phía MO Plus | KS 11/06 chiều §II.13 | Workshop MO Plus/Lido | 🔴 Mở | |
| KS-23 | **TOSS sửa OFP** — chọn PA1 (form trên TOSS) hay PA2 (sửa tay + upload) | KS 11/06 chiều §II.11 | Nội bộ + SME | 🔴 Mở | |
| KS-24 | **MO Plus "latest by name"** (hardcode) — phối hợp đội MO Plus điều chỉnh | KS 11/06 chiều §II.9 | Đối tác MO Plus | 🔴 Mở | |
| KS-25 | **Cơ chế refresh real-time** màn Monitoring (WebSocket/SSE/webhook/auto-refresh) | KS 11/06 chiều §II.6 | Workshop kỹ thuật | 🔴 Mở | |
| KS-26 | **Phase Trigger mapping** — danh sách cảnh báo × mốc ACARS raise/clear | KS 11/06 chiều §II.6 | SME điều phái | 🔴 Mở | |
| KS-27 | **RCL (Re-Clearance)** — phạm vi nghiệp vụ + quan hệ EDTO | BRD v0.3 BR-227 (YCKT FOS) | SME điều phái | 🔴 Mở | |
| KS-28 | **Danh mục cảnh báo luồng Lido 4D** (adapter/parse/đẩy MO Plus) | BRD v0.3 BR-231 (YCKT sheet-08 #24) | SME điều phái/tích hợp | 🔴 Mở | |
| KS-29 | **filed ATC** — quy tắc trigger cảnh báo (thời điểm filed, ngưỡng) | BRD v0.3 BR-127/BR-223 (sheet-08 #3/#4) | SME điều phái | 🔴 Mở | |
| KS-30 | **Golden record + ánh xạ codeset loại tàu** FIMS↔Netline (hợp nhất master) | BRD v0.3 BR-427 | Workshop master data/tích hợp | 🔴 Mở | |
| KS-31 | **Báo cáo sai lệch tải/thời gian** (EST CLC vs thực tế; OFP đầu/cuối vs LS; 3 bên DOW/EPLD) | BRD v0.3 BR-332 (YCKT V3 d.439-446) | SME Tuấn Dương | 🔴 Mở | |
| KS-32 | **Enum LEG STATE / Status chuyến** — POC dsp_monitoring đề xuất GRD/BRD/OUT/ENR/IN/ARR (+ OFP Rev 3 màu) | Wireframe wf-monitoring-overview §7; POC; KS 12/06 | SME điều phái | 🟡 Đang xử lý | POC đề xuất GRD/BRD/OUT/ENR/IN/ARR. 12/06: chốt **ARR/IN** = tín hiệu xanh cột ETA/IN (Netline ARR hoặc ACARS IN, nguồn tới trước); chưa chốt GRD/BRD/OUT/ENR — chờ SME |
| KS-33 | **Giữ chuyến đường dài chưa đáp ngoài time window** — phương án UX (filter phụ/giữ bảng/scroll) | KS 12/06 P2 §7,§8 | SME điều phái + UX | 🔴 Mở | |
| KS-34 | **Ngưỡng phút "vào gate chậm"** so với ETA kết điểm để cảnh báo (Phase 5) | KS 12/06 P2 §8 | SME điều phái | 🔴 Mở | |
| KS-35 | **Chính sách hiển thị Registration** (lược "VN" cho VNA/VNB) — đồng nhất hay cho user cấu hình | KS 12/06 P2 §9 | Nội bộ + SME | 🔴 Mở | |
| KS-36 | **Hành vi Lido khi chuyến mất `D`** (giật về ngày gốc): xin OFP cũ hay sinh OFP mới [ASR nhiễu] | KS 12/06 P2 §11 | Workshop Lido + SME | 🔴 Mở | |
| KS-37 | **Action shortcut "Dispatch Release" trên Monitoring** ↔ clear cảnh báo vàng đa cột (REG+DR…) — cơ chế đồng bộ | KS 12/06 P2 §9,§10 | Nội bộ + SME | 🔴 Mở | |
| KS-38 | **Quy tắc clear/giữ "đỏ" sau khi chuyến cất cánh** cho các cảnh báo "vẫn bay dù đỏ/vàng" (vd thời tiết): giữ nguyên đỏ để ghi nhận "có đỏ nhưng không action" hay clear về xanh khi đã đáp — chưa chốt đồng nhất theo từng cột | KS 12/06 P2 §12 | SME điều phái | 🔴 Mở | |
| KS-39 | **Phạm vi sân bay tích hợp A-CDM đợt đầu** (ngoài HAN/TSN gồm những đâu; sân bay ngoài dùng Amadeus/Flight Status) | KS 15/06 §II.1 | SME + tích hợp | 🔴 Mở | |
| KS-40 | **Nguồn dự phòng parking stand** khi thiếu A-CDM (cụm nghe như "VR" — `[cần xác nhận]`) | KS 15/06 §II.1 | SME điều phái | 🔴 Mở | |
| KS-41 | **Cột PIC confirm** — có ngưỡng nhắc/cảnh báo nếu Pilot chưa confirm sát giờ không (không quy định cứng thời điểm) | KS 15/06 §II.2 | SME điều phái | 🔴 Mở | |
| KS-42 | **Attribution khi bàn giao ca** — version OFP mới do ca sau up mang tên ai; cơ chế ghi nhận đúng người thực hiện từng version | KS 15/06 §II.3 | Nội bộ + SME | 🔴 Mở | |
| KS-43 | **Nghĩa viết tắt nghe trong ghi âm 15/06**: OAP / OSP / OMP / AOS — `[cần xác nhận]` (có thể chuyển nhóm SME) | KS 15/06 §IV | SME điều phái | 🔴 Mở | |
| KS-44 | **Điện văn bổ sung gửi SITA** (ngoài điện chuyển động chuyến bay) — TOSS có xử lý đầy đủ hay không | KS 08/06 §IV.5 | Workshop điện văn ACARS/SITA | 🔴 Mở | |
| KS-45 | **Môi trường kiểm thử** — đi thẳng vào tài nguyên thật hay phải có môi trường riêng tách bạch | KS 08/06 §IV.6 | Workshop hạ tầng/CĐS-CN | 🔴 Mở | |
| KS-46 | **BackPACK + pgepoid** — có hỗ trợ RPA/tự đọc dữ liệu được không (đang nhập tay) | KS 08/06 §IV.8 | SME kỹ thuật + Hãng sản xuất tàu bay | 🔴 Mở | |
| KS-47 | **Cụm dữ liệu phục vụ FMS thay thế** — sẵn có chưa và lấy qua phương thức gì (dự kiến thứ Tư mới có thông tin) | KS 08/06 §IV.10 | Workshop tích hợp FMS | 🔴 Mở | |
| KS-48 | **Bốn nhóm KPI gồm hai OTP và hai OSP** — định nghĩa + công thức chi tiết + tiêu chí mục tiêu 80% áp dụng nhóm nào + ngưỡng cảnh báo cụ thể (OBJ-003) | KS 09/06 §IV.4 / VALIDATION-BRD-v0.10 §B | Workshop SME VNA | 🔴 Mở (chặn freeze BRD PH1/PH3/PH5 theo VALIDATION-BRD-v0.10 §G.1 G2) | |
| KS-49 | **Cấu hình thời gian lưu trữ theo từng loại tài liệu** trong server lưu trữ tập trung (ngoài mức 3 ngày đã chốt cho tài liệu MO Plus) | KS 09/06 §IV.6 | SME tài liệu + hạ tầng | 🔴 Mở | |
| KS-50 | **Luồng tích chọn thủ công** cho trợ lý trực ban trưởng khi nguồn ANABS không trả mác phân loại chuyến đặc biệt | KS 09/06 §IV.7 | SME trực ban trưởng | 🔴 Mở | |
| KS-51 | **Định dạng dữ liệu nhập tay** cho yếu nhân/VIP (Chủ tịch nước, Chủ tịch Quốc hội, Thủ tướng, Tổng Bí thư…) + cấu trúc dữ liệu lưu | KS 09/06 §IV.9 | SME trực ban trưởng + master data | 🔴 Mở | |
| KS-52 | **Cơ chế đa phiên tham chiếu** từ hệ thống nước ngoài (multi-session theo vai trò) — TOSS có triển khai trong giai đoạn này hay không | KS 09/06 §IV.10 | Nội bộ + SME | 🔴 Mở | |
| KS-53 | **Cơ chế ghi nhận lịch sử làm lại OFP sát giờ** — định danh, version, audit trail | KS 11/06 P1 §IV.4 | SME điều phái | 🔴 Mở | |
| KS-54 | **Cảnh báo tổng quát tab Flight Release ("bên ngoài")** — nội dung + quy tắc hiển thị | KS 12/06 P1 §IV.2 | SME điều phái + UX | 🔴 Mở | |
| KS-55 | **Cấu trúc DB AMOS cho MEL active**: bảng/trường nào lưu MEL item active, tàu áp dụng, trạng thái, và level tối đa AMOS kích hoạt (level 3 hay 4?) | KS 17/06 §2, §5 | Workshop AMOS/VICO | 🔴 Mở | |
| KS-56 | **Cơ chế tích hợp AMOS → TOSS cho dữ liệu MEL active**: API realtime, polling (tần suất?), hay batch export? Format dữ liệu trao đổi? | KS 17/06 §1, §5 | Workshop AMOS/VICO | 🔴 Mở | |
| KS-57 | **Format file MEL nhà sản xuất**: Boeing dùng "FILMATER" và Airbus dùng **FODM** (Flight Ops Documentation Manager) — tên phần mềm/format chính xác và khả năng parse/import tự động | KS 17/06 §4 | SME tài liệu kỹ thuật (Nga) | 🟡 Đang xử lý | **17/06: Airbus = FODM (Flight Ops Documentation Manager) — BA Lead xác nhận. Glossary v0.17 cập nhật.** Boeing "FILMATER" vẫn cần xác nhận tên chính xác. |
| KS-58 | **Format Lido Import file** — mô tả chi tiết từng trường, kiểu dữ liệu, mapping sang MEL data TOSS; xin template từ VNA | KS 17/06 §4 | VNA (Nga) cung cấp template | 🔴 Mở | |
| KS-59 | **Vấn đề "insert vs update" trong XML Lido Import file** — nguyên nhân và cách xử lý trong quy trình import MEL | KS 17/06 §4 | Workshop kỹ thuật Lido | 🔴 Mở | |
| KS-60 | **Hiện trạng Data Warehouse AMOS** do nhóm Hà Tần đã kết nối — dữ liệu đã lấy về gồm những gì, cấu trúc, mức đầy đủ | KS 17/06 §5 | TOSS + nhóm Hà Tần | 🔴 Mở | |
| KS-61 | **Mức chấp nhận bóc tách tự động** item code/tên MEL (~60–70% theo trao đổi) — ngưỡng chấp nhận, phần còn lại nhập tay | KS 17/06 §4 | TOSS + Nga | 🔴 Mở | |
| KS-62 | **Tương thích ngược Lido Import file** — định dạng có thay đổi cấu trúc giữa các phiên bản không; cơ chế TOSS thích ứng khi Lido nâng cấp | KS 17/06 §4 | TOSS + Lido | 🔴 Mở | |
| KS-63 | **Chi tiết trường AMOS cho lịch bảo dưỡng** (service order/work order/task): tên trường, kiểu dữ liệu, cách lấy về — khảo sát riêng với VICO | KS 17/06 §II.7 | Workshop AMOS/VICO | 🔴 Mở | |
| KS-64 | **Chi tiết Performance Factor**: cấu trúc màn, danh sách trường, quy tắc cập nhật, liên kết Engine Water Wash — khảo sát riêng với FOE | KS 17/06 §II.9 | SME FOE (Nga) | 🔴 Mở | |
| KS-65 | **Taxi time chuẩn theo tàu × sân bay** (gợi ý + thời gian hiệu lực) — thuộc danh mục Sân bay hay Quản lý tàu bay? | KS 17/06 §II.6 | Buổi khảo sát Sân bay | 🔴 Mở | |
| KS-66 | **Cơ chế đồng bộ lịch bảo dưỡng OPS++↔AMOS** và chiều ghi ngược từ TOSS (nếu có): API, độ trễ, nguồn dữ liệu chuẩn (system of record) | KS 17/06 §II.7 | Workshop tích hợp OPS++ | 🔴 Mở | |
| KS-67 | **Recalculate báo cáo nhiên liệu** khi sửa ACARS fuel multiplier theo Valid From–To đã qua — tính lại báo cáo đã phát hành hay chỉ cập nhật lần xem kế tiếp? | KS 17/06 §II.6 | TOSS + Nga | 🔴 Mở | |
| KS-68 | **Rủi ro FN_Carrier mới chưa khai báo AOG/MNT Code** dẫn đến bỏ sót kỳ bảo dưỡng — cơ chế phát hiện/cảnh báo | KS 17/06 §II.8 | TOSS | 🔴 Mở | |
| KS-69 | **Định dạng OFP DSP `2/0/1 R2`** màn Flight Dispatch — ý nghĩa 3 con số đầu (số OFP / rev đã release / rev chưa release?) | wf-monitoring §8-1; Function list | SME điều phái | 🔴 Mở | |
| KS-70 | **Quy tắc màu + ngưỡng cảnh báo cho các cột sheet để trống**: DEP, ATC, TO/LD (MTOW/MLDW), Missing Document, Taxi APU — mỗi cột dùng ngưỡng riêng hay chung khung NOTAM (210/270/75/95)? | wf-monitoring §8-3, §8-9; Function list | SME điều phái | 🔴 Mở | |
| KS-71 | **Phân màu EPLD / EST DOW** theo mức lệch CLC ↔ OFP — ngưỡng vàng/đỏ cụ thể (lệch X% → vàng, Y% → đỏ); cấu hình trong System Admin | wf-monitoring §8-4, §9-2 | SME điều phái + System Admin | 🔴 Mở | |
| KS-72 | **Danh sách 20 filter** màn Flight Dispatch — trường lọc cụ thể cho từng filter (sheet chỉ ghi vị trí Filter 1–20) | wf-monitoring §8-5; Function list | SME điều phái | 🔴 Mở | |
| KS-73 | **Logic màu "Xanh"** xuất hiện ở cả cột ETD và Flight Type ("ATC vs OFP release khớp") — có khác/trùng giữa hai cột không | wf-monitoring §8-8 | SME điều phái | 🔴 Mở | |
| KS-74 | **Nội dung tooltip hover** cho 19/26 cột màn Flight Dispatch còn trống trong sheet | wf-monitoring §8-10 | SME điều phái | 🔴 Mở | |
| KS-75 | **Details (lịch sử) cho các cột ngoài REG/FLTNO/ETD/Flight Type** — cột nào cần lịch sử riêng (đã có format chung FUNC-275/276) | wf-monitoring §8-11 | SME điều phái | 🔴 Mở | |
| KS-76 | **6 cột cảnh báo bổ sung từ YCKT TOSS-180** (cabin defect, PAX nối chuyến, loadfactor thấp, thiếu phép bay, TAT không đủ, thiếu điện văn) — tách cột riêng hay gộp vào cột hiện có (ảnh hưởng 26 vs 32 cột) | wf-monitoring §9-1, §9-6; YCKT TOSS-180 | SME điều phái | 🔴 Mở | |
| KS-77 | **Ngưỡng raise cảnh báo** cho các cột bổ sung: TAT thiếu (số phút), loadfactor thấp (%), định nghĩa "PAX nối chuyến cần ưu tiên" (số chuyến/thời gian nối tối thiểu) | wf-monitoring §9-3, §9-4, §9-5 | SME thương mại/khai thác | 🔴 Mở | |
| KS-78 | **Quy tắc cảnh báo cột Pilot AXA** — ngưỡng chênh lệch extra fuel nào kích cảnh báo; theo mốc thời gian không; chỉ "đã nhập lý do hay chưa" hay cảnh báo theo lượng. | KS 18/06 chiều 02:18–02:51 | Workshop điều phái | 🔴 Mở | |
| KS-79 | **Tập con cảnh báo chặn nút Dispatch Release** — phân loại tất cả cảnh báo theo "chặn/không chặn" (18/06 mới chốt 4 nhóm: tàu, ETD ≤ 30′, tổ bay đúng OFP, Pilot Confirm). | KS 18/06 chiều 01:14:34–01:15:31 | Workshop điều phái + tinh chỉnh sau khai thác | 🔴 Mở | |
| KS-80 | **Quy ước đặt tên file Plotting/Icing chart** — chuỗi "plotting"/"icing" ở vị trí nào trong tên file; phân biệt hoa thường. | KS 18/06 chiều 13:18–18:53 | Workshop điều phái + đội phát triển | 🔴 Mở | |
| KS-81 | **Phân loại NOTAM chi tiết** (sân bay/vùng trời/en-route × mức ảnh hưởng) — tách buổi làm việc riêng. | KS 18/06 chiều 01:23:32–01:23:58 | Workshop NOTAM riêng | 🔴 Mở | |
| KS-82 | **Đặc tả màn Flight Plan dạng danh sách** — cột mặc định, cột tùy chọn, bộ lọc. | KS 18/06 chiều 21:20–23:46 | Buổi khảo sát tiếp theo | 🔴 Mở | |
| KS-83 | **Phân mức cảnh báo DAO theo độ lớn lệch** — một mức ("lệch là cảnh báo") hay nhiều mức. | KS 18/06 sáng 51:30–52:11 | Workshop điều phái | 🔴 Mở | |
| KS-84 | **Quy tắc cảnh báo route ATC khi thêm điểm KÈM đổi fly level** — cảnh báo theo điểm, theo fly level, hay cả hai. | KS 18/06 chiều 01:17:37–01:18:01 | Workshop điều phái | 🔴 Mở | |
| KS-85 | **Mô hình hai mức 75′/60′ và 90′/75′ áp cho nhóm Tổ bay** — xác nhận có ngoại lệ cho Crew Download/Crew CHG không (18/06 nói "áp dụng chung" chưa demo case). | KS 18/06 sáng 42:40–43:03 | Workshop điều phái | 🔴 Mở | |
| KS-86 | **Cơ chế kích hoạt OFP rỗng tổ bay** — tần suất AVES lỗi, nhật ký log, có thông báo riêng cho ADM/IT không. | KS 18/06 chiều 01:01:13–01:04:39 | SME tích hợp AVES | 🔴 Mở | |
| KS-87 | **Danh mục đầy đủ + mã hoá từng luồng trong 17 inbound + 2 outbound** kèm tên hệ thống nguồn, loại dữ liệu, mẫu điện đại diện — buổi 19/06 chỉ liệt kê các nhóm chính, chưa đủ triển khai. | KS 19/06 §IV-1 | Bạn An (VNA) cung cấp bảng Excel hoàn chỉnh trước thứ ba 24/06 | 🟡 Đang xử lý | **23/06: Bảng "Thông tin tích hợp" (live) đã cung cấp 24 luồng. PHẠM VI TOSS (BA Lead 23/06) = 16 luồng "Phương thức = Thông qua TOSS" (Nguồn → TOSS → OPS++); 7 luồng "Trực tiếp" (DFLT/Final MVT/Metar/OFP/ATC qua LIDO; Ground Event/MEL qua AMOS) là đấu nối thẳng vào NetOps++, NGOÀI scope tích hợp TOSS. Một số ô còn "Làm rõ" → còn mở một phần.** |
| KS-88 | **Định dạng dữ liệu Lufthansa Systems yêu cầu cho từng luồng** (kể cả mẫu điện FMM mà TOSS phải tự sinh) — cần định dạng chuẩn để TOSS sinh đúng tệp và truyền qua SFTP. | KS 19/06 §IV-2 | VNA làm việc với LHS, gửi tài liệu định dạng cho Viettel | 🔴 Mở | |
| KS-89 | **Cấu trúc thư mục chuẩn (folder structure) cho từng đầu dữ liệu** kèm quy tắc đặt tên thư mục, quy tắc đặt tên tệp, mã hoá ký tự — tiền đề cấu hình máy chủ SFTP. | KS 19/06 §IV-3, §III.6 | Lấy tài liệu kiến nghị của NetOps | 🔴 Mở | |
| KS-90 | **Mốc thời gian gửi và đồng bộ dữ liệu cho từng luồng inbound/outbound**, kèm thời gian lưu trữ trên SFTP và thời điểm xoá tệp — quyết định kiến trúc lưu trữ và lịch chạy tác vụ TOSS. | KS 19/06 §IV-4 | VNA làm việc tiếp với LHS | 🟡 Đang xử lý | **23/06: bảng tích hợp có cột Frequency một phần; nhiều ô vẫn "Làm rõ".** |
| KS-91 | **Phương án outbound cuối cùng từ OPS++** qua ISB hay phối hợp ISB cùng data duplicate — ảnh hưởng kiến trúc thu nạp dữ liệu phía TOSS; VNA chưa chốt. | KS 19/06 §IV-6, §II.2 | VNA chốt sau khi làm rõ với LHS | 🔴 Mở | (liên quan DEC-15) |
| KS-92 | **Khoảng trống tích hợp — các luồng "Thông qua TOSS" chưa có BR atomic** (PHẠM VI ĐÃ THU HẸP theo BA Lead 23/06: chỉ 16 luồng "Thông qua TOSS", KHÔNG tính 7 luồng "Trực tiếp" LIDO/AMOS→NetOps++). Đặc biệt FMM & Fuel Report do TOSS tự sinh = GAP hoàn toàn; MVT/MVA/LDM/DIV forward, Crew connection, Cargo, Gate, Flight data ACDM chỉ có BR-528a chung. | DOI-CHIEU-KS-BRD-1719 §3.B (đề xuất BR-557…566 — lọc lại theo scope); bảng tích hợp pull 23/06 | BA Lead duyệt (DEC-15) + workshop tích hợp | 🔴 Mở | |

## D. Tham số/ngưỡng & mô hình dữ liệu chưa có nguồn (DL)

> Chi tiết từng ô nằm trong 5 file phân rã FUNC; bảng này gom theo nhóm để theo dõi.

| ID | Nhóm điểm cần chốt | Nguồn (file FUNC) | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| DL-01 | **Ngưỡng cảnh báo**: load factor thấp / chậm chuyến / FTL / Delta ZFW / biên an toàn VMA / rate-limit API | PH1 (FUNC-108,125,188), PH2 (FUNC-273), PH5 | SME từng phân hệ | 🔴 Mở | 15/06: chốt **ngưỡng release/cảnh báo màu OFP** — quốc nội **210/75/60′**, quốc tế **270/90/75′** trước ETD (lưu ý/sớm nhất/muộn nhất release). Các ngưỡng khác (load factor, FTL, VMA, Delta ZFW…) vẫn mở. |
| DL-02 | **Mô hình dữ liệu chi tiết**: bộ trường danh mục sân bay, Master MEL, công thức Tankering, tham số vận hành | PH4 §3.2 | GĐ1 (data model) + SME | 🔴 Mở | |
| DL-03 | **Data contract** API/Webhook + danh sách hệ thống vệ tinh nhận dữ liệu danh mục | PH4 (FUNC-404), PH5 (FUNC-511) | Workshop tích hợp | 🔴 Mở | |
| DL-04 | **Ô YCKT V3 còn trống** (TOSS-003/004/021–024/058–061…) + sheet Nhân sự CQĐV thiếu đầu mối | PH5 §3.2; PHAN-TICH-YCKT | Rà soát YCKT với khách hàng | 🔴 Mở | |
| DL-05 | **Phương thức tích hợp** từng hệ thống (Netline/Flight Ops++, Amadeus PSS real-time?, Lido mPilot) | PH5 (FUNC-511-01/10/12/40) | Workshop tích hợp | 🔴 Mở | |

## E. Hành chính & hạ tầng (HC)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| HC-01 | **Danh sách người dự + vai trò + thẩm quyền quyết định** từng bên (cập nhật STAKEHOLDER-REGISTER) | KS 08/06 §IV; KS 09/06 §IV | Mỗi buổi meeting | 🟡 Đang thu thập | |
| HC-02 | **Tiến độ cấp hạ tầng đám mây** + chốt số máy chủ & địa chỉ mạng (ràng buộc 30/06/2026) | KS 08/06 §II.7, §IV | Phối hợp CĐS-CN | 🟡 Đang xử lý | |
| HC-03 | **Lịch buổi khảo sát chuyên đề luồng tài liệu + điện văn ACARS** (gỡ chặn PH2) | KS 09/06 §II.3, §V; WF-TOSS-001 §9 | BA Lead lên lịch | 🔴 Mở | |
| HC-04 | **Lịch buổi khảo sát riêng với team AMOS/VICO** để xác định cấu trúc DB AMOS phục vụ tích hợp MEL (đã thống nhất trong 17/06) | KS 17/06 §5 | BA Lead + VNA sắp xếp | 🔴 Mở | |

---

## F. Quy trình rà soát sau mỗi buổi meeting (BẮT BUỘC)

> Thực hiện ngay sau khi tổng hợp biên bản/báo cáo khảo sát của mỗi buổi.

1. **Đối chiếu §IV của báo cáo khảo sát mới** với sổ này — điểm nào đã được trả lời thì:
   - Đổi trạng thái sang 🟢 **Đã chốt**, ghi **kết quả + ngày** vào cột cuối + dẫn nguồn (buổi nào, mục nào).
   - Nếu là quyết định BA Lead → có thể thêm mã `DEC-` chính thức và cập nhật tài liệu liên quan (BRD/FUNC/workflow).
2. **Bổ sung điểm mở mới** phát sinh trong buổi (gắn ID kế tiếp theo nhóm A–E, dẫn nguồn).
3. **Cập nhật ngược tài liệu nguồn**: khi một cờ `[cần xác nhận]` được chốt → sửa BRD §9.3 / file FUNC / glossary tương ứng và xóa cờ.
4. **Làm giàu glossary**: thuật ngữ vừa xác nhận → cập nhật `toss-glossary-v0.1.md` (theo quy tắc 1 file chung).
5. **Bump version** sổ này (v0.1 → v0.2…) + ghi dòng changelog ai/ngày/điểm nào chốt.
6. **Báo cáo nhanh cho BA Lead**: số điểm 🟢 chốt / 🔴 còn mở sau buổi.

> **Tần suất rà soát:** sau **mỗi** buổi khảo sát/workshop; ngoài ra rà tổng thể tại BA Weekly Sync.

---

## G. Bảng tổng hợp trạng thái (cập nhật mỗi lần rà)

| Nhóm | Tổng | 🔴 Mở | 🟡 Đang xử lý | 🟢 Đã chốt |
|---|---|---|---|---|
| A. Quyết định BA Lead (QĐ) | 25 | 24 | 0 | 1 |
| B. Thuật ngữ/hệ thống (SME) | 53 | 48 | 1 | 4 (gồm 2 "Đã gộp" + 2 "Đã chốt") |
| C. Nghiệp vụ-khảo sát (KS) | 92 | 87 | 5 | 0 |
| D. Tham số/dữ liệu (DL) | 5 | 5 | 0 | 0 |
| E. Hành chính/hạ tầng (HC) | 4 | 3 | 1 | 0 |
| **Tổng** | **179** | **167** | **7** | **5** |

> Cập nhật sau khi regenerate 5 báo cáo khảo sát (rà 2026-06-16): +4 SME (SME-38…41: pgepoid, Vasco+HT 30-31, take-off/wet weight, "quả đấy dầu"/"anh Ngọt") và +11 KS (KS-44…54: SITA điện văn bổ sung, môi trường kiểm thử, BackPACK RPA, FMS thay thế, 4 KPI OTP/OSP, retention theo loại tài liệu, luồng thủ công ANABS, định dạng dữ liệu VIP, multi-session, lịch sử OFP sát giờ, cảnh báo tab Flight Release "bên ngoài"). SME-09 cập nhật chú thích ASR "ANABS/ANABIOS". Tổng 109 điểm sau 2026-06-16 (103 Mở / 5 Đang xử lý / 1 Đã chốt).
>
> **Cập nhật 2026-06-17 (sau KS MEL/CDL buổi 17/06):** +3 SME (SME-45: tên hệ thống FOEM; SME-46: danh sách MEL item ảnh hưởng khai thác; SME-47: DDMS), +5 KS (KS-55: cấu trúc DB AMOS MEL; KS-56: cơ chế tích hợp AMOS→TOSS; KS-57: format file MEL nhà sản xuất; KS-58: Lido ePot mapping; KS-59: XML insert/update), +1 HC (HC-04: lịch buổi khảo sát AMOS/VICO). **Đóng SME-45** (e-FON = Electronic Flight Operations Notice — BA Lead xác nhận 17/06). Tổng 122 điểm (114 Mở / 4 Đang xử lý / 4 Đã chốt).

> **Cập nhật 2026-06-22 (áp dụng proposal khảo sát 18/06 — CLC & Điều phái):** +4 DEC (DEC-07 🔴 Adapter Lido 20 ký tự; DEC-08 lưu vết cảnh báo; DEC-09 🔴 vị trí tab Ngưỡng Payload/DAO; DEC-10 vị trí tab MEL/CDL theo tàu), +2 SME (SME-50 cấu trúc 5 thành phần ATC FPL; SME-51 FOEM), +9 KS (KS-78 Pilot AXA; KS-79 tập cảnh báo chặn release; KS-80 đặt tên Plotting/Icing; KS-81 phân loại NOTAM; KS-82 màn Flight Plan list; KS-83 phân mức DAO; KS-84 ATC route+fly level; KS-85 mô hình 2 mức cho Tổ bay; KS-86 OFP rỗng tổ bay). Nguồn: PROPOSAL-18062026-enrichment §4. **2 rủi ro 🔴**: DEC-07, DEC-09. Tổng 157 điểm (148 Mở / 5 Đang xử lý / 4 Đã chốt).
>
> **Cập nhật 2026-06-18 (đối chiếu màn Flight Dispatch ↔ Function list + nguồn liên quan):** +1 SME (SME-49: enum LEG STATE) +9 KS (KS-69 định dạng OFP DSP "2/0/1 R2"; KS-70 màu/ngưỡng 5 cột trống; KS-71 màu EPLD/EST DOW; KS-72 20 filter; KS-73 logic "Xanh" ETD vs Flight Type; KS-74 tooltip hover 19 cột; KS-75 Details cột khác; KS-76 6 cột bổ sung TOSS-180 tách/gộp; KS-77 ngưỡng TAT/loadfactor/PAX nối chuyến). Nguồn: wf-monitoring-overview v0.3 §8–§9 đối chiếu sheet "Màn hình Flight Dispatch" + YCKT TOSS-175…182 + KS 11–15/06. Hai cờ §8-2/§8-6 đã được nguồn khác giải (không mở OID). Tổng 142 điểm (133 Mở / 5 Đang xử lý / 4 Đã chốt).
>
> **Cập nhật 2026-06-18 (rà soát đầy đủ buổi 17/06 + báo cáo v0.3):** +1 SME (SME-48: logic lọc BCAO), +9 KS (KS-60 Data Warehouse Hà Tần; KS-61 ngưỡng bóc tách tự động MEL; KS-62 tương thích ngược Lido Import file; KS-63 chi tiết trường AMOS lịch bảo dưỡng; KS-64 chi tiết Performance Factor; KS-65 taxi time theo sân; KS-66 đồng bộ lịch bảo dưỡng OPS++↔AMOS; KS-67 recalculate báo cáo khi sửa ACARS multiplier; KS-68 rủi ro FN_Carrier chưa khai báo AOG/MNT Code). Phát sinh từ nửa sau buổi 17/06 (Quản lý tàu bay/AOG-MNT) chưa được v0.2 phủ. Tổng 132 điểm (123 Mở / 5 Đang xử lý / 4 Đã chốt).
>
> **Hiệu chỉnh 2026-06-18:** SME-45 — hệ thống ghi nhận 17/06 là "e-FON" được xác định lại là **OPS++** (Netline Flight Ops++) — hệ khai thác chính hiện hữu của VNA; "e-FON" là nhận định nhầm. Cập nhật báo cáo KS 17/06 + glossary v0.18 (gỡ entry e-FON, gộp OPS++).
>
> Đính chính ASR 12/06: **SME-02 (Lotang) → 🟢 Đã chốt = NOTAM** (lỗi ASR; không có "chuyến Lotang"). Điểm 🟢 đầu tiên của sổ.

> Cập nhật sau buổi 12/06 sáng (rà 2026-06-12): +4 SME (SME-34…37), +5 KS (KS-33…37). 12/06 bổ sung một phần cho KS-32/KS-26/KS-08/KS-25/SME-08 (vẫn 🔴/🟡); trọng tâm 12/06 là thiết kế chi tiết màn Monitoring Overview.

> Cập nhật sau tham khảo POC dsp_monitoring (rà 2026-06-12): +1 KS (KS-32 enum LEG STATE — POC đề xuất GRD/BRD/OUT/ENR/IN/ARR, 🟡 chờ SME chốt).

> Cập nhật sau bổ sung BRD v0.3 bottom-up (rà 2026-06-12): +5 SME (SME-29…33), +5 KS (KS-27…31) từ Customer Docs (Aircraft FIMS/Netline, YCKT V3/FOS). Loại nguồn BBKS/BBLV (UBCKNN — đã xóa khỏi repo).

> Cập nhật sau buổi 11/06 Phần 2 (rà 2026-06-12): +7 SME (SME-12…18), +8 KS (KS-12…19). Phần 2 KHÔNG làm rõ điểm mở nào của Phần 1.
> Cập nhật sau buổi 11/06 buổi chiều (rà 2026-06-12): +10 SME (SME-19…28), +7 KS (KS-20…26). Buổi chiều KHÔNG làm rõ điểm mở nào của buổi sáng — trọng tâm sang nội dung mới (Release/Unrelease + version OFP, 6 phase quy trình, Monitoring real-time, Weather Multi-Flight, Payload Extra).

> Cập nhật sau khi viết lại báo cáo 12/06 sáng (rà 2026-06-12): +1 KS (KS-38 — quy tắc clear/giữ đỏ sau cất cánh cho cảnh báo "vẫn bay"). Các điểm IV còn lại của báo cáo đã có sẵn trong sổ (SME-34…37, KS-32…37, KS-21). Tổng 89 điểm (85 Mở / 3 Đang xử lý / 1 Đã chốt).

---

## H. Liên kết tài liệu nguồn

- BRD §9 (rủi ro/giả định/cờ) — bản hiện hành: `ba/workspace/drafts/brd/BRD-TOSS-001-khung-v0.7.md` (khung, 176 BR; v0.1…v0.5 là lịch sử; §7 tách 5 file BRD-TOSS-PHn-v0.1)
- Phân rã FUNC (ô "chưa có nguồn"): `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH1-…-v0.5.md` (FUNC-101…276) và `PHAN-RA-BRD-PH{2..5}-*-v0.3.md`
- Báo cáo khảo sát §IV: `…/BAO-CAO-KHAO-SAT-08062026-v0.2.md`, `…-09062026-v0.2.md`, `…-11062026-buoi-sang-v0.1.md` (11/06 gộp Phần 1+2; tham chiếu "KS 11/06 P2 §II.x" tương ứng chủ đề §II.8–15 của báo cáo gộp), `…-12062026-buoi-sang-v0.1.md` (Monitoring & Flight Detail)
- Phương án workflow §9: `ba/workspace/drafts/quy-trinh/PHAN-TACH-PHAM-VI-WORKFLOW-v0.4.md`
- Stakeholder: `ba/workspace/drafts/quy-trinh/STAKEHOLDER-REGISTER-v0.2.md`
- Glossary: `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md`

---

*OID-TOSS-001 v0.18 — 2026-06-23. BA Lead làm rõ phạm vi bảng "Thông tin tích hợp": bảng mô tả sơ đồ đấu nối vào OPS++; **phạm vi TOSS = các dòng "Phương thức = Thông qua TOSS"** (Nguồn → TOSS → OPS++); các dòng "Trực tiếp" (LIDO/AMOS → NetOps++) ngoài scope tích hợp TOSS. Hệ quả: **đóng DEC-16 🟢** (MEL Item + Ground Event là "Trực tiếp" → không mâu thuẫn với 17/06; việc TOSS tổng hợp/cảnh báo MEL/CDL là giám sát NỘI BỘ, tách biệt luồng cấp OPS++); **thu hẹp KS-92** xuống 16 luồng "Thông qua TOSS" (loại 7 luồng trực tiếp: DFLT/Final MVT/Metar/OFP/ATC qua LIDO + Ground Event/MEL qua AMOS); KS-87 ghi chú phạm vi 16 luồng. Tổng 179 điểm (167 Mở / 7 Đang xử lý / 5 Đã chốt). Còn 2 🔴 rủi ro (DEC-07, DEC-09).*
*OID-TOSS-001 v0.17 — 2026-06-23. Rà sau buổi KS 19/06 (tích hợp TOSS↔OPS++) + đối chiếu KS↔BRD (file `DOI-CHIEU-KS-BRD-1719-2026-06-23.md`): **+10 DEC (DEC-15…DEC-24)** ánh xạ 10 điểm BA Lead cần quyết của §4 đối chiếu — DEC-15 phạm vi BR cho 11 GAP nghiêm trọng; **DEC-16 🔴 rủi ro** (mâu thuẫn nguồn cấp MEL/CDL: 17/06 chốt TOSS làm hub vs bảng tích hợp 23/06 ghi trực tiếp AMOS–NetOps++); DEC-17 phạm vi xử lý nội bộ TOSS sau OPS++; DEC-18 hạ ưu tiên BR-127 Could→Must; DEC-19 khung 2 mức vs 3 mức cho OFP; DEC-20 năm cutover (trùng nhóm IV-7 19/06); DEC-21 năm nhóm cố định AOG/MNT Code; DEC-22 quy ước tên file Plotting/Icing (trùng KS-80); DEC-23 tách BR-528a thành ASM/ACH/SSIM atomic; DEC-24 SFTP thư mục functional hay NFR. **+2 SME (SME-52, SME-53)** — SME-52 "Schedule Manager" (IV-5 19/06); SME-53 4 nhóm số thứ tự Amadeus PSS (IV-8 19/06). **+6 KS (KS-87…KS-92)** — KS-87 🟡 danh mục 24 luồng (đã có dữ liệu một phần từ bảng tích hợp 23/06, còn ô "Làm rõ"); KS-88 định dạng LHS từng luồng (IV-2); KS-89 cấu trúc thư mục SFTP (IV-3, đồng bộ DEC-24); KS-90 🟡 mốc gửi/đồng bộ (IV-4 — có một phần từ bảng tích hợp); KS-91 phương án outbound ISB/duplicate (IV-6, liên quan DEC-15); KS-92 khoảng trống tích hợp 11/24 luồng chưa có BR atomic (đặc biệt FMM & Fuel Report TOSS tự sinh = GAP hoàn toàn). Ghi chú: IV-7 (năm cutover) và IV-9 (ranh giới scope TOSS nội bộ) trùng DEC-20/DEC-17 — không tạo entry mới; IV-1/IV-4 đã có dữ liệu một phần từ bảng tích hợp live nên gắn 🟡 + ghi chú thay vì 🔴. Tổng 179 điểm (168 Mở / 7 Đang xử lý / 4 Đã chốt). Nguồn: `DOI-CHIEU-KS-BRD-1719-2026-06-23.md`, `BAO-CAO-KHAO-SAT-19062026-v0.1.md` §IV, `TOSS-Thong-tin-tich-hop-OpsPlus.extracted.md`.*

*OID-TOSS-001 v0.16 — 2026-06-22. Ghi nhận tồn đọng sau khi hoàn tất PHAN-RA-BRD-PH1 v0.7 (bổ sung 25 FUNC-295…319 từ KS 18/06). Thêm 4 DEC mới về BR cha chưa nằm trong BR-101…150 (cần đối chiếu BRD — thẩm quyền BA Lead): **DEC-11** phân quyền sửa Minima sân bay (FUNC-313); **DEC-12** cơ chế Dispatch Release (FUNC-315/316); **DEC-13** màn Flight Plan dạng danh sách (FUNC-317); **DEC-14** thứ tự ưu tiên nguồn Actual Fuel (FUNC-318, gắn cờ `[Q8]` trong FUNC). Ghi chú: DEC-09 (tab Ngưỡng Payload/DAO — FUNC-300/301) và DEC-10 (tab MEL/CDL theo tàu — FUNC-309) đã có từ v0.15 (rà 22/06). Các nhánh KS phụ trợ đã có từ trước: KS-78/79/82/83 (ngưỡng Pilot AXA, tập cảnh báo chặn release, đặc tả màn Flight Plan list, phân mức DAO), SME-49/50/51 (LEG STATE, 5 thành phần ATC FPL, FOEM), DEC-07 (Adapter Lido 20 ký tự), DEC-08 (lưu vết cảnh báo). RTM chi tiết FUNC-295…319 chưa hợp nhất vào §3 — chờ BA Lead chốt vị trí phân hệ (DEC-09/10/11/12/13/14) rồi mới hợp nhất. Tổng 161 điểm (152 Mở / 5 Đang xử lý / 4 Đã chốt). Nguồn: `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH1-thong-tin-dieu-hanh-chuyen-bay-v0.7.md` §2.52, §3 (dòng tổng kết "Bổ sung v0.7").*

*OID-TOSS-001 v0.14 — 2026-06-17. Ghi nhận điểm treo **G2** từ VALIDATION-BRD-v0.10 (CONDITIONAL PASS): (a) cập nhật **DEC-06** — bổ sung chỉ tiêu Time-bound cho OBJ-001/002/008/009 (workshop SME VNA), trạng thái → "🔴 Mở (chặn freeze BRD PH1/PH3/PH5)"; (b) cập nhật **KS-48** — bổ sung "+ ngưỡng cảnh báo cụ thể (OBJ-003)", trạng thái → "🔴 Mở (chặn freeze BRD PH1/PH3/PH5)"; (c) **G2-FREEZE mới** trong nhóm A — entry tổng hợp điểm treo freeze BRD PH1/PH3/PH5 chờ workshop SME VNA chốt DEC-06+KS-48; sau workshop bump khung v0.12; PH2+PH4 không chờ. Tổng 113 điểm (105 Mở / 5 Đang xử lý / 3 Đã chốt).*

*OID-TOSS-001 v0.13 — 2026-06-17. Quyết định C6 — chuẩn hóa trùng lặp SME-42/43 và bổ sung SME-44: (a) SME-42 (Sunweather) đã gộp vào **SME-06** (trùng nội dung — cùng là Sunweather "rủi ro/không ổn định"); nguồn `BRD Khung §9.3` được merge vào dòng nguồn SME-06; SME-42 đổi trạng thái 🟢 Đã gộp + ghi chú. (b) SME-43 ("Phi Công 11") đã gộp vào **SME-07** (trùng hoàn toàn); nguồn `BRD Khung §9.3` được merge vào dòng nguồn SME-07; SME-43 đổi trạng thái 🟢 Đã gộp + ghi chú. (c) **SME-44 mới** — Định dạng thứ ba MEL Airbus (ngoài FrameMaker+IXP và FODM 10.8) — cần SME KTKTB xác nhận tên hệ thống/công cụ và lý do chọn (nguồn PH4 BR-425). Lưu ý: SME-04 ("Vy Vy" — METAR nội địa) KHÔNG trùng SME-42/Sunweather (khác hệ thống) nên không gộp về SME-04 như đề xuất ban đầu. Tổng 112 điểm (104 Mở / 5 Đang xử lý / 3 Đã chốt — gồm 2 "Đã gộp" + 1 "Đã chốt" trước đó).*

*OID-TOSS-001 v0.12 — 2026-06-17. M3 hợp nhất quản lý cờ `[cần xác nhận]`: chuyển toàn bộ cờ inline trong 5 BRD phân hệ + §9.3 BRD khung về OID (sổ cái duy nhất). Mỗi cờ inline được thay bằng chú thích `*(xem OID: <mã>)*`; §9.3 khung gọn còn 1 dòng tham chiếu. Bổ sung 2 SME mới (SME-42 Sunweather, SME-43 "Phi Công 11"). Tổng 111 điểm (105 Mở / 5 Đang xử lý / 1 Đã chốt).*

*OID-TOSS-001 v0.11 — 2026-06-16. Rà sau khi regenerate 5 báo cáo khảo sát (08/06, 09/06, 11/06 sáng, 11/06 chiều, 12/06 sáng) theo SKILL survey-report Option B: +4 SME (SME-38 pgepoid; SME-39 Vasco + HT 30-31; SME-40 chuẩn hóa take-off weight/"loft power" & trọng lượng ướt/"phi vết"; SME-41 "quả đấy dầu" + "anh Ngọt"), +11 KS (KS-44 SITA điện văn bổ sung; KS-45 môi trường kiểm thử; KS-46 BackPACK + pgepoid RPA; KS-47 cụm dữ liệu FMS thay thế; KS-48 định nghĩa/công thức 4 KPI OTP/OSP + tiêu chí 80%; KS-49 retention theo loại tài liệu; KS-50 luồng tích chọn thủ công khi ANABS thiếu mác; KS-51 định dạng dữ liệu nhập tay VIP; KS-52 multi-session tham chiếu; KS-53 lịch sử làm lại OFP sát giờ; KS-54 cảnh báo tab Flight Release "bên ngoài"). Cập nhật SME-09 ghi chú ứng viên ASR "ANABS/ANABIOS". Không đóng điểm nào — §IV của 5 báo cáo chỉ liệt kê câu hỏi chưa có kết quả. Tổng 109 điểm (103 Mở / 5 Đang xử lý / 1 Đã chốt).*
*OID-TOSS-001 v0.10 — 2026-06-16. Rà sau buổi 15/06 (Màn hình Flight Dispatch & quy trình OFP Release): +5 KS (KS-39…43: phạm vi A-CDM đợt đầu, nguồn dự phòng parking stand "VR", cột PIC confirm ngưỡng nhắc, attribution bàn giao ca, nghĩa viết tắt OAP/OSP/OMP/AOS). 15/06 trả lời một phần: KS-21 (auto-tăng version sau Un-Release) → 🟡; DL-01 (ngưỡng release/cảnh báo màu OFP: quốc nội 210/75/60′, quốc tế 270/90/75′ trước ETD). Tổng 94 điểm (88 Mở / 5 Đang xử lý / 1 Đã chốt).*
*OID-TOSS-001 v0.9 — 2026-06-12. Đính chính ASR: SME-35 "off cộng cộng" = **Ops++** (tên hệ thống, BA Lead xác nhận) → 🟡 Đang xử lý (hành vi xử lý chuyến `D` về gốc còn mở, gắn KS-36). Tổng 89 điểm (84 Mở / 4 Đang xử lý / 1 Đã chốt).*
*OID-TOSS-001 v0.8 — 2026-06-12. Rà sau khi viết lại báo cáo 12/06 sáng: +1 KS-38 (quy tắc clear/giữ đỏ sau cất cánh cho cảnh báo "vẫn bay"). Các điểm IV còn lại đã có sẵn (SME-34…37, KS-32…37, KS-21). Tổng 89 điểm (85 Mở / 3 Đang xử lý / 1 Đã chốt).*
*OID-TOSS-001 v0.7 — 2026-06-12. Đính chính ASR: SME-02 (Lotang) chốt 🟢 = NOTAM (lỗi ASR; không có "chuyến Lotang"). Lan tỏa sửa glossary/BRD/FUNC/báo cáo. Tổng 88 điểm (84 Mở / 3 Đang xử lý / 1 Đã chốt).*
*OID-TOSS-001 v0.6 — 2026-06-12. Rà sau buổi 12/06 sáng: +4 SME (SME-34…37: FN Surface Z, "OFF cộng cộng", mã khu vực điều phái, FTP Mail CDL), +5 KS (KS-33…37: giữ chuyến ngoài time window, ngưỡng vào gate chậm, hiển thị Registration, hành vi Lido mất D, action shortcut Dispatch Release). Tổng 88 điểm (85 Mở / 3 Đang xử lý). 12/06 bổ sung một phần KS-32/26/08/25, SME-08.*
*OID-TOSS-001 v0.5 — 2026-06-12. Rà sau tham khảo POC dsp_monitoring: +1 KS-32 (enum LEG STATE — POC đề xuất GRD/BRD/OUT/ENR/IN/ARR, 🟡 chờ SME). Tổng 79 điểm (76 Mở / 3 Đang xử lý).*
*OID-TOSS-001 v0.4 — 2026-06-12. Rà sau bổ sung BRD v0.3 bottom-up: thêm 10 điểm (SME-29…33: AC_STATE, AC_INDEX, AP_RESTRICTION, FORM D/E, FLIGHT BASE TIME CAAV; KS-27…31: RCL, cảnh báo Lido 4D, filed ATC trigger, golden-record codeset FIMS↔Netline, báo cáo sai lệch tải). Tổng 78 điểm (76 Mở). Nguồn BBKS/BBLV (UBCKNN) đã loại + xóa khỏi repo.*
*OID-TOSS-001 v0.3 — 2026-06-12. Rà sau buổi 11/06 buổi chiều: thêm 17 điểm mở (SME-19…28: Flight Type Code, claim phí khí thải, CCD, Mission Watch, AIJS, FME, ICON, Logitech/GDTN, Sketch Check, Brady/ADC; KS-20…26: reset Confirm Release TOSS↔MO Plus, version sau Unrelease, bóc tách 3 file OFP, TOSS sửa OFP PA1/PA2, MO Plus latest-by-name, refresh real-time, Phase Trigger mapping). Tổng 68 điểm (66 Mở / 2 Đang xử lý). Buổi chiều không cover điểm mở buổi sáng.*
*OID-TOSS-001 v0.2 — 2026-06-12. Rà sau buổi 11/06 Phần 2: thêm 15 điểm mở (SME-12…18 thuật ngữ/hệ thống: CLC, NAIL, AMOS, MOI, IFV, TIC, sân bay đặc biệt; KS-12…19 nghiệp vụ: NAIL master/sub, ranh giới Lido↔TOSS, ngưỡng lệch tải, SkyCheck, Standard Taxi Time push, 3 CI, PAX time, hệ thống QAR/QAI). Tổng 51 điểm (49 Mở / 2 Đang xử lý). Phần 2 không cover điểm mở Phần 1.*
*OID-TOSS-001 v0.1 — 2026-06-11. Khởi tạo sổ theo dõi gom 36 điểm cần chốt từ BRD, 5 file phân rã FUNC, 3 báo cáo khảo sát và phương án workflow. Rà soát + cập nhật sau mỗi buổi meeting (quy trình §F).*
