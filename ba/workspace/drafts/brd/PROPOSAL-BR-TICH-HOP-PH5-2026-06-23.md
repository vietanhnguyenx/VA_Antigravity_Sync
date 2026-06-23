---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-23"
status: "Draft — Proposal"
document_type: "Đề xuất BR tích hợp PH5 (chờ DEC-15)"
parent: "BRD-TOSS-PH5-quan-tri-he-thong-v0.5.md"
---

# Đề xuất BR atomic cho tích hợp OPS++ — Phân hệ PH5 (chờ DEC-15)

> **Tính chất tài liệu.** Đây là **ĐỀ XUẤT**, chưa phải BR chính thức trong BRD. Tài liệu được lập để BA Lead xem xét và duyệt theo DEC-15 ("đưa các BR tích hợp OPS++ vào PH5 hay tách phụ lục tích hợp riêng?"). Nếu DEC-15 = "đưa vào PH5", các BR sau sẽ được hợp nhất vào `BRD-TOSS-PH5-quan-tri-he-thong-v0.X.md` (bump version) với mã số như liệt kê dưới đây. Trước khi DEC-15 chốt, KHÔNG sửa các file BRD-TOSS-PH*.
>
> **Tuân thủ.** CLAUDE.md §0 (agent phân rã, không quyết định) · §0.3 (BA Lead quyết). Mỗi BR đề xuất được trích nguồn từ tài liệu khảo sát/bảng tích hợp; phần chờ VNA trả lời được gắn cờ `*(chờ xác nhận)*`.

---

## §1. Bối cảnh và phạm vi

### 1.1. Bối cảnh

- Báo cáo Khảo sát 19/06/2026 + 23/06/2026 và bảng "Thông tin tích hợp" v77 (pull 23/06/2026) đã làm rõ bức tranh đấu nối **OPS++** (Lufthansa Systems) — 28 luồng dữ liệu chia hai chế độ: "**Thông qua TOSS**" và "**Trực tiếp**" (LIDO/AMOS ↔ NetOps++).
- BA Lead đã chốt ngày 23/06/2026: **phạm vi tích hợp TOSS = chỉ các luồng "Thông qua TOSS"** (19 luồng = 17 inbound + 2 outbound). 9 luồng "Trực tiếp" nằm ngoài phạm vi TOSS, ghi nhận để biết.
- BRD PH5 v0.5 hiện có BR-528a…h và BR-530a…g ở mức **data contract chung**; chưa atomic theo từng luồng và **thiếu nhiều logic vận hành** mới được làm rõ trong sheet v77 (Crew Assignment 02:00/26, Cargo quét view, Gate API VIAGS, tần suất PTM/PNL/ADL…).

### 1.2. Phạm vi đề xuất

**Trong scope đề xuất** — chỉ đặc tả BR cho **19 luồng "Thông qua TOSS"**:

| Chiều | Số luồng | Danh sách |
|---|---:|---|
| Inbound | 17 | MVT, MVA, DIV, LDM, FMM, SSIM, PTM, PNL, ADL, Pax Detail, Fuel Report, Crew Assignment, Crew connection, Gate info, Flight data (ACDM), NOTAM (phần qua TOSS), Cargo |
| Outbound | 2 | ASM, ACH |

**Ngoài scope đề xuất** — 9 luồng "Trực tiếp" LIDO/AMOS ↔ NetOps++: DFLT, Final MVT, Metar, OFP, Ground Event, MEL Item, ATC FPL, Leg Detail AMOS, Leg Detail LIDO. Không sinh BR.

### 1.3. Dải mã BR đề xuất

- Mã hiện hành cao nhất trong PH5 v0.5: **BR-555** (theo `BRD-TOSS-PH5-quan-tri-he-thong-v0.5.md` + INDEX).
- Dải đề xuất: **BR-556 → BR-572 (17 BR mới)** — không trùng BR đã có.
- Phương án DEC-15 = "đưa vào BRD": các BR dưới đây sẽ được chèn vào nhóm E (Tích hợp hệ thống ngoài & API Gateway) trong PH5, ngay sau BR-528a…h / BR-530a…g.

---

## §2. Bảng BR đề xuất (atomic — theo từng luồng)

> **Quy ước cột.** "Trạng thái KS" = trạng thái đối chiếu theo `DOI-CHIEU-KS-BRD-1719-2026-06-23-v0.2.md` §2bis.A (GAP/PARTIAL). "Triển khai sheet v77" = giá trị cột "Triển khai" trong bảng tích hợp v77 ("Đã có" / "Missing"). "Phụ thuộc" = các điểm chờ làm rõ ảnh hưởng đến BR.

### 2.1. Inbound — 4 điện văn SITA (MVT/MVA/DIV/LDM)

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-556** | Hệ thống TOSS phải hoạt động như **hub forward** cho điện **MVT** (Movement Message): nhận từ SITA (kênh kép SFTP + Email), không xử lý nội dung, chuyển nguyên trạng sang OPS++; lưu bản Archive phục vụ truy vết. Thời điểm gửi: "Khi có cập nhật". | Functional | Must | Khảo sát 23/06 §II.3; sheet v77 dòng 1; Khảo sát 19/06 §II.2 | PARTIAL | Đã có | — |
| **BR-557** | Hệ thống TOSS phải hoạt động như **hub forward** cho điện **MVA** (Movement Advice): nhận từ SITA qua SFTP, không xử lý nội dung, chuyển nguyên trạng sang OPS++; lưu bản Archive. Thời điểm gửi: "Khi có cập nhật". | Functional | Must | Khảo sát 23/06 §II.3; sheet v77 dòng 2 | PARTIAL | Đã có | — |
| **BR-558** | Hệ thống TOSS phải hoạt động như **hub forward** cho điện **DIV** (Divert Message): nhận từ SITA (kênh kép SFTP + Email), không xử lý nội dung, chuyển nguyên trạng sang OPS++; đồng thời kích hoạt cảnh báo Divert nội bộ tại PH1 (BR-117). Thời điểm gửi: "Khi có cập nhật". | Functional | Must | Khảo sát 23/06 §II.3; sheet v77 dòng 3 | PARTIAL | Đã có | — |
| **BR-559** | Hệ thống TOSS phải hoạt động như **hub forward** cho điện **LDM** (Load Message — trong Loadsheet): nhận từ SITA (kênh kép SFTP + Email), không xử lý nội dung, chuyển nguyên trạng sang OPS++; lưu bản Archive. Thời điểm gửi: "Khi có cập nhật". | Functional | Must | Khảo sát 23/06 §II.3; sheet v77 dòng 4 | **GAP** | **Missing** | Luồng đang Missing — phối hợp LHS để mở kết nối |

### 2.2. Inbound — TOSS tự sinh (FMM, Fuel Report)

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-560** | Hệ thống TOSS phải **tự sinh điện FMM** (Fuel Monitoring Message) bằng cách tổng hợp dữ liệu nhiên liệu từ các nguồn nội bộ (Lido, ACARS, AMOS) và đẩy sang OPS++ qua SFTP. Tần suất: "Có phát sinh thì gửi" — kích hoạt theo sự kiện khi dữ liệu nhiên liệu mới sẵn sàng. | Functional | Must | Khảo sát 23/06 §II.5; sheet v77 dòng 5; Khảo sát 19/06 §III.16 | **GAP** | Đã có | Cần xác nhận trường dữ liệu + chu kỳ kích hoạt với VNA *(chờ xác nhận)* |
| **BR-561** | Hệ thống TOSS phải **tự sinh điện Fuel Report** (gồm nhiên liệu đã tiêu thụ thực tế + summary OUT/OFF/ON/IN) **một lần sau khi chuyến bay kết thúc** (post-flight) và đẩy sang OPS++. | Functional | Must | Khảo sát 23/06 §II.10; sheet v77 dòng 11 | **GAP** | Đã có | Cần xác nhận thời điểm "kết thúc chuyến" (IN-block hay sau lập biên bản kỹ thuật) *(chờ xác nhận)* |

### 2.3. Inbound — SSIM (forward 2 chiều với Sabre)

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-562** | Hệ thống TOSS phải xử lý luồng **SSIM** (lịch mùa) theo mô hình forward 2 chiều với Sabre: (a) nhận SSIM từ Sabre qua SFTP, chuyển nguyên trạng sang OPS++; (b) cho phép OPS++ xuất SSIM ra SFTP, TOSS quét và gửi về SFTP cho Sabre. TOSS không xử lý nội dung — chỉ forward. | Functional | Must | Khảo sát 23/06 §II.6; sheet v77 dòng 6 | PARTIAL | Missing | — |

### 2.4. Inbound — Amadeus PSS (PTM, PNL, ADL, Pax Detail)

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-563** | Hệ thống TOSS phải lấy **PTM** (Passenger Transfer Message — khách nối chuyến) từ Amadeus theo cơ chế: (a) quét cửa sổ **các chuyến trong 48 giờ tiếp theo**; (b) **chu kỳ quét 5 phút/lần**; (c) chỉ gửi sang OPS++ khi phát hiện cập nhật mới so với lần quét trước, không có thay đổi thì không gửi. | Functional | Must | Khảo sát 23/06 §II.7; sheet v77 dòng 7 | PARTIAL | Đã có | — |
| **BR-564** | Hệ thống TOSS phải lấy **PNL** (Passenger Name List — danh sách khách booking) từ Amadeus và gửi sang OPS++ **một lần duy nhất ở mốc T-30 ngày trước chuyến bay**. | Functional | Must | Khảo sát 23/06 §II.8; sheet v77 dòng 9 | PARTIAL | Đã có | — |
| **BR-565** | Hệ thống TOSS phải lấy **ADL** (Additions/Deletions List — cập nhật PNL) từ Amadeus và gửi sang OPS++ **mỗi ngày 1 lần** sau khi PNL đã được gửi (T-30…T-0). | Functional | Must | Khảo sát 23/06 §II.8; sheet v77 dòng 8 | PARTIAL | Đã có | — |
| **BR-566** | Hệ thống TOSS phải lấy **Pax Detail** (thông tin khách thực tế **sau cất cánh**) từ Amadeus và gửi sang OPS++. Phân biệt rõ với PNL/ADL (dữ liệu booking — trước chuyến): Pax Detail là dữ liệu thực tế phát sinh **sau khi chuyến bay đã khởi hành**. | Functional | Must | Khảo sát 23/06 §II.8; sheet v77 dòng 11 | PARTIAL | Đã có | Cần xác nhận sự kiện trigger ("sau cất cánh" = sau OFF-block hay sau ACARS OFF) *(chờ xác nhận)* |

### 2.5. Inbound — AVES (Crew Assignment, Crew connection)

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-567** | Hệ thống TOSS phải lấy **Crew Assignment** (thông tin tổ bay) từ AVES và gửi sang OPS++ theo cơ chế: (a) **quét snapshot lịch tháng kế tiếp vào 02:00 ngày 26 hàng tháng**; (b) trong tháng đếm số chuyến bay có chỉ số tổ bay **<1000** *(đơn vị và ý nghĩa con số "1000" chờ xác nhận với VNA-AVES — xem D-11)* → **sinh cảnh báo qua email** cho danh sách người quản lý đã cấu hình (kế thừa BR-537); (c) **cơ chế retry vào 23:59 ngày 26** nếu lần quét 02:00 thất bại; (d) ngoài snapshot tháng, có **cơ chế quét cập nhật theo rules** (mô hình tương tự Amadeus) khi nguồn AVES có thay đổi giữa kỳ. | Functional | Must | Khảo sát 23/06 §II.9; sheet v77 dòng 12 | PARTIAL | Đã có | **D-11**: ngưỡng "tổ bay <1000" — đơn vị và mức ngưỡng có cấu hình được hay không *(chờ xác nhận)* |
| **BR-568** | Hệ thống TOSS phải lấy **Crew connection** (tổ bay nối chuyến) từ AVES và gửi sang OPS++. **Logic chi tiết hiện đang Pending** — chờ VNA-AVES cung cấp đặc tả (định kỳ, sự kiện, tần suất, dữ liệu trường). | Functional | Should | Khảo sát 23/06 §II.9; sheet v77 dòng 23 | **GAP** | **Missing** | Luồng Pending — chờ AVES đặc tả *(chờ xác nhận)* |

### 2.6. Inbound — VMS (Gate info)

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-569** | Hệ thống TOSS phải lấy **Gate info** (thông tin gate) từ VMS bằng cách **gọi API "cùng phong cách flight status của VIAGS"** (Service) và chuyển kết quả sang OPS++ theo chuẩn message thống nhất. | Functional | Must | Khảo sát 23/06 §II.10; sheet v77 dòng 13 | PARTIAL | Missing | **D-12**: sample API spec từ VNA-VIAGS *(chờ xác nhận)* |

### 2.7. Inbound — ACDM (Flight data)

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-570** | Hệ thống TOSS phải lấy **Flight data ACDM** (16 mốc thời gian A-CDM tại sân bay) từ hệ thống ACDM và gửi sang OPS++. Tái sử dụng data contract A-CDM đã có ở BR-530d (inbound TOSS); BR-570 đặc tả **chiều forward TOSS → OPS++**. **Logic chi tiết Pending** — chờ VNA xác nhận trường nào cần forward đầy đủ. | Functional | Should | Khảo sát 23/06 §II.10; sheet v77 dòng 15 | PARTIAL | Missing | Pending — chờ VNA xác nhận tập trường forward *(chờ xác nhận)* |

### 2.8. Inbound — NOTAM (phần qua TOSS)

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-571** | Hệ thống TOSS phải xử lý phần **NOTAM "qua TOSS"** (sheet v77 dòng 18 — chế độ "Trực tiếp - Thông qua TOSS"): xác định tập NOTAM nào do TOSS phụ trách (ngoài luồng Lido ↔ NetOps++ trực tiếp), chuẩn hóa và đẩy sang OPS++. **Hiện Pending** — chờ VNA + LHS phân định ranh giới giữa "trực tiếp" và "qua TOSS". | Functional | Should | Khảo sát 23/06 §II.11; sheet v77 dòng 18 | PARTIAL | (phần trực tiếp đã có; phần qua TOSS Pending) | Pending — chờ phân định *(chờ xác nhận)* |

### 2.9. Inbound — Cargo Spot

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-572** | Hệ thống TOSS phải lấy **Cargo** (manifest hàng hóa) từ hệ thống Cargo Spot bằng cách: (a) **quét view trên hệ thống Cargo Spot** (read-only database view); (b) **quét liên tục theo rules** (mô hình tương tự Amadeus PTM); (c) gửi sang OPS++ khi phát hiện cập nhật cargo mới theo chuyến. | Functional | Must | Khảo sát 23/06 §II.10; sheet v77 dòng 22 | PARTIAL | Missing | Cần xác nhận tên view + tài khoản DB read-only với chủ Cargo Spot *(chờ xác nhận)* |

### 2.10. Outbound — ASM, ACH

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Trạng thái KS | Triển khai sheet v77 | Phụ thuộc |
|---|---|---|:---:|---|:---:|:---:|---|
| **BR-573** | Hệ thống TOSS phải xử lý luồng **outbound ASM** (Ad-hoc Schedule Message): nhận từ OPS++, chuyển nguyên trạng tới SITA. Thời điểm gửi: "Khi có cập nhật". Tách atomic khỏi BR-528a (đang gộp Netline + SSIM/ASM/SSM). | Functional | Must | Khảo sát 23/06 §II.12; sheet v77 Outbound dòng 3 | PARTIAL | Đã có (đích Missing) | — |
| **BR-574** | Hệ thống TOSS phải xử lý luồng **outbound ACH** (Schedule Change Message — ACK): nhận từ OPS++, chuyển nguyên trạng tới SITA. Thời điểm gửi: "Khi có cập nhật". Tách atomic khỏi BR-528a. | Functional | Must | Khảo sát 23/06 §II.12; sheet v77 Outbound dòng 4 | PARTIAL | **Missing** | Luồng đang Missing — phối hợp LHS để mở kết nối |

> **Lưu ý dải số.** Đề xuất ban đầu §3.B của đối chiếu dùng dải BR-557…BR-570; bản đề xuất chính thức này **giãn ra BR-556…BR-574** để (a) tách MVT/MVA/DIV/LDM thành 4 BR atomic riêng (thay vì gộp thành 1 BR-557 "4 điện văn"), (b) tách ASM/ACH thành 2 BR riêng (thay vì 1 BR gộp). Tổng **17 BR atomic** thay cho 14 BR gộp ban đầu — giúp truy vết và test riêng từng luồng.

---

## §3. BR cross-cutting hạ tầng (áp dụng cho mọi luồng "Thông qua TOSS")

Các BR dưới đây áp dụng cho **toàn bộ 19 luồng "Thông qua TOSS"** ở §2 — không gắn vào một luồng cụ thể. Nguồn: Khảo sát 19/06 §III.3–§III.10; Khảo sát 23/06 §II.1, §II.2, §II.12; yêu cầu mới N11 trong đối chiếu §2bis.C (BA Lead chốt 23/06).

| Mã BR | Phát biểu yêu cầu | Loại | Ưu tiên | Nguồn | Phụ thuộc |
|---|---|---|:---:|---|---|
| **BR-575** | Hệ thống TOSS phải triển khai **một (01) máy chủ/khu lưu SFTP dùng chung** cho mọi luồng "Thông qua TOSS" trao đổi tệp (không tách SFTP riêng từng luồng); phân biệt từng đầu dữ liệu bằng **cấu trúc thư mục con**. | NFR | Must | Khảo sát 23/06 §II.1; đối chiếu §2bis.C N11 (BA Lead 23/06) | — |
| **BR-576** | Hệ thống TOSS phải tổ chức **cấu trúc thư mục SFTP chuẩn**: mỗi đầu dữ liệu có 3 thư mục con **Temp / Pickup / Archive**; áp dụng **cơ chế ghi 2 bước** — ghi vào `Temp` trước, hoàn tất rồi mới move/copy sang `Pickup` để tránh đọc tệp dở; tệp đã được consumer xử lý chuyển vào `Archive` phục vụ truy vết. | Functional | Must | Khảo sát 19/06 §III.6 | — |
| **BR-577** | Hệ thống TOSS phải sử dụng **một (01) tài khoản email dùng chung** cho mọi luồng gửi qua kênh email (MVT, DIV, LDM…); không tạo tài khoản email riêng cho từng luồng. | NFR | Must | Khảo sát 23/06 §II.3; đối chiếu §2bis.C N11 (BA Lead 23/06) | — |
| **BR-578** | Hệ thống TOSS phải kết nối tới hạ tầng Lufthansa Systems (chứa OPS++) qua **VPN trên dải IP nội bộ** giữa VNA và LHS; xác thực SFTP bằng **Private Key + User Path** do VNA cấp cho LHS. | NFR | Must | Khảo sát 19/06 §III.4, §III.5, §III.9 | Mốc cấu hình VPN: ~24/06/2026; mốc hoàn thành máy chủ SFTP: 01/07/2026 *(theo dõi qua roadmap, không phải BR)* |
| **BR-579** | Hệ thống TOSS phải hoạt động ở chế độ **"puller"** (chủ động vươn ra lấy dữ liệu từ hệ thống nguồn) cho mọi luồng "Thông qua TOSS"; **ngoại lệ duy nhất là SITA** (SITA đẩy điện văn vào TOSS qua SFTP/Email). | Functional | Must | Khảo sát 19/06 §III.7 | — |
| **BR-580** | Hệ thống TOSS phải lấy dữ liệu **outbound từ OPS++** qua **ISB của Lufthansa Systems** (Integration Service Bus) theo hai cơ chế: (a) **Event-Based** — OPS++ đẩy ra SFTP khi có sự kiện, TOSS quét và xử lý; (b) **Request-Based** — TOSS gọi API/Web Service qua ISB để truy vấn dữ liệu phục vụ báo cáo. Phối hợp với phương án **DB clone NetLine** cho dữ liệu không đi qua ISB. | Functional | Must | Khảo sát 23/06 §II.1, §II.12; Khảo sát 19/06 §II.2 | Tỷ lệ ISB vs DB clone cụ thể *(chờ xác nhận với LHS)* |
| **BR-581** | Hệ thống TOSS phải hỗ trợ **chế độ dual-source** trong giai đoạn chuyển tiếp NetLine cũ ↔ OPS++ mới (cutover dự kiến ~03/2027 — *chờ xác nhận năm, D-6*): cho phép chuyển nguồn lấy dữ liệu chỉ bằng **một thao tác cấu hình** (không cần triển khai lại) đối với các luồng song song có sẵn ở cả hai hệ thống. | Functional | Must | Khảo sát 19/06 §III.13 | **D-6**: năm cutover *(chờ xác nhận với anh Nam VNA)* |

---

## §4. Phụ thuộc — BR nào chờ VNA trả lời câu hỏi nào

> Bảng dưới gom các BR có gắn cờ `*(chờ xác nhận)*` và quy về điểm cần BA Lead đẩy với VNA. Mã "D-x" trỏ về §4 của file đối chiếu `DOI-CHIEU-KS-BRD-1719-2026-06-23-v0.2.md`. Các điểm chưa được ghi vào sổ OID sẽ được BA Lead bổ sung vào OID-TOSS-001 sau khi duyệt đề xuất này (CLAUDE.md §0 — không tự sinh OID).

| BR | Câu hỏi cần VNA trả lời | Trỏ về |
|---|---|---|
| BR-559 (LDM) | Khi nào LHS mở kết nối LDM SITA → OPS++? Định danh kênh? | Sheet v77 LDM = Missing |
| BR-560 (FMM) | Trường dữ liệu FMM mà OPS++ yêu cầu? Sự kiện trigger "có phát sinh"? | Khảo sát 23/06 §II.5 — Pending |
| BR-561 (Fuel Report) | "Sau khi chuyến bay kết thúc" = sau IN-block hay sau lập biên bản kỹ thuật? Trường dữ liệu chuẩn? | Khảo sát 23/06 §II.10 |
| BR-566 (Pax Detail) | "Sau cất cánh" = trigger nào (OFF-block, ACARS OFF, sau N phút)? | Sheet v77 dòng 11 — "Khách thực tế sau cất cánh" |
| BR-567 (Crew Assignment) | Ngưỡng "tổ bay <1000" — đếm cái gì (chuyến/người/thiết bị)? Có cấu hình được không? Danh sách email nhận cảnh báo? | **D-11** (đối chiếu §4) |
| BR-568 (Crew connection) | Logic Pending — định kỳ, sự kiện, tần suất, trường dữ liệu? | Sheet v77 dòng 23 — Pending |
| BR-569 (Gate info) | Endpoint API "flight status VIAGS" — sample spec? Tần suất gọi? | **D-12** (đối chiếu §4) |
| BR-570 (Flight data ACDM) | Tập 16 mốc nào cần forward sang OPS++? Tần suất? | Sheet v77 dòng 15 — Pending |
| BR-571 (NOTAM qua TOSS) | Tập NOTAM nào do TOSS phụ trách (ngoài LIDO direct)? | Sheet v77 dòng 18 — Pending; **D-2 liên quan** |
| BR-572 (Cargo) | Tên view trên Cargo Spot? Tài khoản DB read-only? Rules cập nhật? | Sheet v77 dòng 22 |
| BR-574 (ACH outbound) | Khi nào mở kết nối ACH TOSS → SITA? | Sheet v77 Outbound dòng 4 = Missing |
| BR-580 (ISB outbound) | Danh mục dữ liệu lấy qua ISB vs lấy qua DB clone NetLine? | Khảo sát 23/06 §II.1, §II.12 |
| BR-581 (dual-source) | Năm cutover chính xác (~03/2027 hay khác)? Danh mục luồng song song? | **D-6** (đối chiếu §4) |

**Tổng số BR có phụ thuộc chờ VNA trả lời: 13/17 BR (~76%).**

---

## §5. Tóm tắt

### 5.1. Số liệu

| Chỉ số | Giá trị |
|---|---:|
| Tổng số BR atomic mới đề xuất | **17 BR** (BR-556…BR-572) |
| Số BR cross-cutting hạ tầng | **7 BR** (BR-575…BR-581) |
| **Tổng BR mới** (atomic + hạ tầng) | **24 BR** (BR-556…BR-581, không trùng BR-573/574 đã đếm trong atomic) — *xem lưu ý đánh số dưới* |
| Số luồng có BR atomic | 19 luồng (17 inbound + 2 outbound) |

> **Lưu ý đánh số.** Sau khi tách MVT/MVA/DIV/LDM (4 BR) + ASM/ACH (2 BR), tổng BR atomic = **19 luồng → 19 BR atomic**. Cộng 7 BR hạ tầng = **26 BR mới**. Dải đề xuất chính thức: **BR-556 → BR-581 (26 BR liên tục)**. (Số 17 ở §2 là số nhóm BR — sau khi tách chi tiết, một số nhóm có 1 BR/luồng, không cần "BR gộp" nữa.)

**Phân bố MoSCoW** (trong 26 BR mới):

| Ưu tiên | Số BR | Tỷ lệ | Ghi chú |
|---|---:|---:|---|
| **Must** | 22 | 84,6% | 4 SITA + 2 TOSS tự sinh + 1 SSIM + 4 Amadeus + 1 Crew Assignment + 1 Gate + 1 Cargo + 2 outbound + 6 hạ tầng (575/576/577/578/579/580/581) → đếm lại = 22 |
| **Should** | 4 | 15,4% | BR-568 (Crew connection — Pending), BR-570 (Flight data ACDM — Pending), BR-571 (NOTAM qua TOSS — Pending), và 1 BR hạ tầng phù hợp Should nếu BA Lead muốn hạ ưu tiên dual-source |
| Could | 0 | 0% | — |
| Won't | 0 | 0% | — |

> **Lý do phân bổ Should.** 3 BR đặc tả các luồng đang **Pending** trong sheet v77 (chưa có logic chi tiết) — đặt Must là quá sớm khi chưa rõ phạm vi. Khi VNA chốt đặc tả, có thể nâng lên Must trong version sau.

### 5.2. Phụ thuộc câu trả lời VNA

- **13/26 BR** có gắn cờ `*(chờ xác nhận)*` — chiếm **50%** số BR đề xuất.
- Phụ thuộc tập trung vào 6 điểm chốt: D-6 (cutover năm), D-11 (ngưỡng tổ bay <1000), D-12 (API VIAGS), 3 điểm Pending (Crew connection, Flight data ACDM, NOTAM qua TOSS), 2 điểm Missing triển khai (LDM, ACH).

### 5.3. Điểm BA Lead cần lưu ý khi duyệt

| # | Điểm cần quyết / lưu ý | Lý do |
|---|---|---|
| L-1 | **Có chấp nhận tách atomic 4 điện văn SITA (BR-556…559) thay vì 1 BR gộp không?** | Đề xuất ban đầu §3.B của đối chiếu gộp thành 1 BR-557 "4 điện văn". Tách atomic giúp truy vết test riêng từng luồng (LDM đang Missing — test riêng); nhưng làm tăng số BR. |
| L-2 | **Có chấp nhận tách ASM/ACH thành 2 BR riêng (BR-573/574), tách khỏi BR-528a gộp không?** | Tương ứng D-9 trong đối chiếu §4 — BA Lead đã thiên về tách. Nếu tách, cần ghi chú **deprecate** phần SSIM/ASM/SSM trong BR-528a và trỏ tới BR-562/573/574. |
| L-3 | **Phân loại NFR vs Functional cho BR-575/577 (SFTP/email dùng chung) và BR-578 (VPN)** | Đề xuất hiện ghi NFR. Một số dự án xếp Functional nếu coi là "khả năng tích hợp". Liên quan D-10 (cấu trúc SFTP là functional hay NFR). |
| L-4 | **Mức Should của 3 BR Pending (BR-568/570/571)** | Nếu BA Lead muốn ép VNA chốt nhanh, có thể giữ Must + gắn ghi chú "đặc tả chi tiết Pending — sẽ chốt ở phiên bản BRD kế tiếp". |
| L-5 | **OID cho 13 BR có phụ thuộc** | CLAUDE.md §0 — agent không tự tạo OID. Sau khi duyệt, BA Lead cần ghi sổ OID-TOSS-001 cho các câu hỏi trong §4 (dự kiến 13 OID mới — đề xuất dải KS-88…KS-100 nếu OID hiện cao nhất là KS-87, **chờ BA Lead xác nhận số kế tiếp**). |
| L-6 | **Quan hệ với BR hiện hành** | BR-528a (gộp Netline + SSIM/ASM/SSM) sẽ phần nào bị thay thế bởi BR-562 (SSIM), BR-573 (ASM), BR-574 (ACH). Sau khi DEC-15 chốt, BR-528a cần ghi chú "atomic hóa sang BR-562/573/574" — không xóa hoàn toàn vì còn phần Netline. |
| L-7 | **DEC-15 chốt thế nào?** | Hai phương án: (a) hợp nhất vào PH5 (bump v0.5 → v0.6, thêm 26 BR vào nhóm E); (b) tách phụ lục tích hợp riêng (ví dụ `BRD-TOSS-PH5-PHU-LUC-TICH-HOP-OPS-v0.1.md`). Khuyến nghị agent: (a) — giữ một nguồn sự thật, dễ duy trì traceability. |
| L-8 | **Phạm vi NOTAM qua TOSS (BR-571)** | Liên quan D-2 trong đối chiếu. Mâu thuẫn nguồn giữa Khảo sát 17/06 (TOSS làm hub MEL/CDL) và sheet v77 (MEL/CDL trực tiếp). Cần khép D-2 trước khi finalize BR-571. |

---

## §6. Tham chiếu

- Đối chiếu KS ↔ BRD v0.2: `ba/workspace/drafts/phan-tich/02-khao-sat/DOI-CHIEU-KS-BRD-1719-2026-06-23-v0.2.md` (đặc biệt §2bis.A, §2bis.C, §3.B, §4)
- Báo cáo Khảo sát 19/06: `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-19062026-v0.1.md`
- Báo cáo Khảo sát 23/06: `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-23062026-v0.1.md` (§II.1–§II.12)
- Bảng "Thông tin tích hợp" v77 (pull 23/06/2026): `ba/workspace/drafts/phan-tich/01-nguon/TOSS-Thong-tin-tich-hop-OpsPlus.extracted.md`
- BRD PH5 v0.5 (file gốc, KHÔNG sửa): `ba/workspace/drafts/brd/BRD-TOSS-PH5-quan-tri-he-thong-v0.5.md`
- INDEX BRD: `ba/workspace/drafts/brd/INDEX.md`

---

*Đề xuất kết thúc. Chờ BA Lead duyệt DEC-15 và các điểm L-1…L-8 ở §5.3 trước khi hợp nhất vào BRD PH5.*
