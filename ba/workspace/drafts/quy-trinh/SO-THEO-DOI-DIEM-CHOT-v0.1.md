---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.11"
date: "2026-06-16"
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
| DEC-06 | Bổ sung **chỉ tiêu định lượng** cho mục tiêu (OBJ-001/002/008/009) + ma trận RACI | BRD §4, §6.1 | Nội bộ + stakeholder | 🔴 Mở | |

## B. Thuật ngữ & hệ thống cần SME xác nhận (SME)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| SME-01 | **VMA** — viết tắt chính xác cho "ngưỡng thời tiết tối thiểu sân bay" | BRD §9.3; KS 11/06 §II.7 | Dispatcher (phần 2) | 🔴 Mở | |
| SME-02 | **Lotang** — định nghĩa "chuyến Lotang" + tiêu chí đánh giá tác động | BRD §9.3; KS 11/06 §II.5 | Dispatcher (phần 2) | 🟢 Đã chốt | **12/06: "Lotang/lô tam/nô tam" = NOTAM (lỗi ASR — BA Lead xác nhận). KHÔNG có "chuyến Lotang"; gộp vào cảnh báo NOTAM (BR-118). Đã sửa glossary/BRD/FUNC/báo cáo.** |
| SME-03 | **VNCM/VNCS** — tên cơ quan cung cấp NOTAM nội địa | BRD §9.3; KS 11/06 §II.6 | Dispatcher / SME NOTAM | 🔴 Mở | |
| SME-04 | **"Vy Vy"** — tên nguồn METAR nội địa | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-05 | **UA PASMOS** — hệ thống thời tiết được nhắc đến | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-06 | **Sunweather** — tên đầy đủ + vai trò (được đánh giá "rủi ro") | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-07 | **"Phi Công 11"** — tên hệ thống tham khảo, không official | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
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
| KS-48 | **Bốn nhóm KPI gồm hai OTP và hai OSP** — định nghĩa + công thức chi tiết + tiêu chí mục tiêu 80% áp dụng nhóm nào | KS 09/06 §IV.4 | SME điều phái/lãnh đạo | 🔴 Mở | |
| KS-49 | **Cấu hình thời gian lưu trữ theo từng loại tài liệu** trong server lưu trữ tập trung (ngoài mức 3 ngày đã chốt cho tài liệu MO Plus) | KS 09/06 §IV.6 | SME tài liệu + hạ tầng | 🔴 Mở | |
| KS-50 | **Luồng tích chọn thủ công** cho trợ lý trực ban trưởng khi nguồn ANABS không trả mác phân loại chuyến đặc biệt | KS 09/06 §IV.7 | SME trực ban trưởng | 🔴 Mở | |
| KS-51 | **Định dạng dữ liệu nhập tay** cho yếu nhân/VIP (Chủ tịch nước, Chủ tịch Quốc hội, Thủ tướng, Tổng Bí thư…) + cấu trúc dữ liệu lưu | KS 09/06 §IV.9 | SME trực ban trưởng + master data | 🔴 Mở | |
| KS-52 | **Cơ chế đa phiên tham chiếu** từ hệ thống nước ngoài (multi-session theo vai trò) — TOSS có triển khai trong giai đoạn này hay không | KS 09/06 §IV.10 | Nội bộ + SME | 🔴 Mở | |
| KS-53 | **Cơ chế ghi nhận lịch sử làm lại OFP sát giờ** — định danh, version, audit trail | KS 11/06 P1 §IV.4 | SME điều phái | 🔴 Mở | |
| KS-54 | **Cảnh báo tổng quát tab Flight Release ("bên ngoài")** — nội dung + quy tắc hiển thị | KS 12/06 P1 §IV.2 | SME điều phái + UX | 🔴 Mở | |

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
| A. Quyết định BA Lead (QĐ) | 6 | 6 | 0 | 0 |
| B. Thuật ngữ/hệ thống (SME) | 41 | 39 | 1 | 1 |
| C. Nghiệp vụ-khảo sát (KS) | 54 | 52 | 2 | 0 |
| D. Tham số/dữ liệu (DL) | 5 | 5 | 0 | 0 |
| E. Hành chính/hạ tầng (HC) | 3 | 1 | 2 | 0 |
| **Tổng** | **109** | **103** | **5** | **1** |

> Cập nhật sau khi regenerate 5 báo cáo khảo sát (rà 2026-06-16): +4 SME (SME-38…41: pgepoid, Vasco+HT 30-31, take-off/wet weight, "quả đấy dầu"/"anh Ngọt") và +11 KS (KS-44…54: SITA điện văn bổ sung, môi trường kiểm thử, BackPACK RPA, FMS thay thế, 4 KPI OTP/OSP, retention theo loại tài liệu, luồng thủ công ANABS, định dạng dữ liệu VIP, multi-session, lịch sử OFP sát giờ, cảnh báo tab Flight Release "bên ngoài"). SME-09 cập nhật chú thích ASR "ANABS/ANABIOS". Không có điểm nào được đóng trong đợt này (§IV chỉ liệt kê câu hỏi, không kèm kết quả). Tổng 109 điểm (103 Mở / 5 Đang xử lý / 1 Đã chốt).

> Đính chính ASR 12/06: **SME-02 (Lotang) → 🟢 Đã chốt = NOTAM** (lỗi ASR; không có "chuyến Lotang"). Điểm 🟢 đầu tiên của sổ.

> Cập nhật sau buổi 12/06 sáng (rà 2026-06-12): +4 SME (SME-34…37), +5 KS (KS-33…37). 12/06 bổ sung một phần cho KS-32/KS-26/KS-08/KS-25/SME-08 (vẫn 🔴/🟡); trọng tâm 12/06 là thiết kế chi tiết màn Monitoring Overview.

> Cập nhật sau tham khảo POC dsp_monitoring (rà 2026-06-12): +1 KS (KS-32 enum LEG STATE — POC đề xuất GRD/BRD/OUT/ENR/IN/ARR, 🟡 chờ SME chốt).

> Cập nhật sau bổ sung BRD v0.3 bottom-up (rà 2026-06-12): +5 SME (SME-29…33), +5 KS (KS-27…31) từ Customer Docs (Aircraft FIMS/Netline, YCKT V3/FOS). Loại nguồn BBKS/BBLV (UBCKNN — đã xóa khỏi repo).

> Cập nhật sau buổi 11/06 Phần 2 (rà 2026-06-12): +7 SME (SME-12…18), +8 KS (KS-12…19). Phần 2 KHÔNG làm rõ điểm mở nào của Phần 1.
> Cập nhật sau buổi 11/06 buổi chiều (rà 2026-06-12): +10 SME (SME-19…28), +7 KS (KS-20…26). Buổi chiều KHÔNG làm rõ điểm mở nào của buổi sáng — trọng tâm sang nội dung mới (Release/Unrelease + version OFP, 6 phase quy trình, Monitoring real-time, Weather Multi-Flight, Payload Extra).

> Cập nhật sau khi viết lại báo cáo 12/06 sáng (rà 2026-06-12): +1 KS (KS-38 — quy tắc clear/giữ đỏ sau cất cánh cho cảnh báo "vẫn bay"). Các điểm IV còn lại của báo cáo đã có sẵn trong sổ (SME-34…37, KS-32…37, KS-21). Tổng 89 điểm (85 Mở / 3 Đang xử lý / 1 Đã chốt).

---

## H. Liên kết tài liệu nguồn

- BRD §9 (rủi ro/giả định/cờ) — bản hiện hành: `ba/workspace/drafts/brd/BRD-TOSS-001-khung-v0.6.md` (khung, 176 BR; v0.1…v0.5 là lịch sử; §7 tách 5 file BRD-TOSS-PHn-v0.1)
- Phân rã FUNC (ô "chưa có nguồn"): `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH1-…-v0.5.md` (FUNC-101…276) và `PHAN-RA-BRD-PH{2..5}-*-v0.3.md`
- Báo cáo khảo sát §IV: `…/BAO-CAO-KHAO-SAT-08062026-v0.2.md`, `…-09062026-v0.2.md`, `…-11062026-buoi-sang-v0.1.md` (11/06 gộp Phần 1+2; tham chiếu "KS 11/06 P2 §II.x" tương ứng chủ đề §II.8–15 của báo cáo gộp), `…-12062026-buoi-sang-v0.1.md` (Monitoring & Flight Detail)
- Phương án workflow §9: `ba/workspace/drafts/quy-trinh/PHAN-TACH-PHAM-VI-WORKFLOW-v0.4.md`
- Stakeholder: `ba/workspace/drafts/quy-trinh/STAKEHOLDER-REGISTER-v0.2.md`
- Glossary: `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md`

---

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
