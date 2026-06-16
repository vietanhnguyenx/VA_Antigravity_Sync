---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
date: "2026-06-08"
time: "00:00–02:43 (ghi âm part1 + part2, ~163 phút)"
location: "[Không rõ — cần xác nhận]"
meeting_type: "Workshop — Thống nhất kế hoạch khảo sát & overview phạm vi"
facilitator: "[Không rõ — cần xác nhận]"
note_taker: "Agent (chuyển từ bản ghi âm part1_00-64min.txt)"
attendees:
  - "Bạch Lê — Đại diện hãng bay (airline) [tương ứng 'chị Lê' trong ghi âm]"
  - "An — Đại diện hãng bay (airline)"
  - "Văn Hiệp — Đại diện công ty phần mềm (vendor) ['em'/nhóm triển khai]"
  - "Gio An — Đại diện công ty phần mềm (vendor)"
  - "Khác (nhắc trong ghi âm, vai trò cần xác nhận): Anh Nam, Anh Sơn / Sơn Phạm (S.A — VDL), Anh Hương, Huyền, Lam"
document_type: "Meeting Notes"
version: "1.0"
status: "Draft"
source: "ba/workspace/input/meeting-notes/part1_00-64min.txt + part2_64min-end.txt (transcript ASR, chất lượng thấp)"
---

# Biên bản Họp: Khảo sát & Overview phạm vi TOSS (part 1)

> **Cảnh báo chất lượng nguồn:** Biên bản lập từ bản ghi âm tự động (ASR) **chất lượng thấp, nhiều đoạn sai/nhiễu**. Mọi nội dung dưới đây là **diễn giải tốt nhất theo ngữ cảnh + domain-knowledge**; các chỗ không chắc đều gắn cờ `[cần xác nhận]`. **Phải đối chiếu người dự họp trước khi dùng làm căn cứ.** Tuân thủ CLAUDE.md §0 — không suy diễn ngoài nội dung ghi âm.

## Mục tiêu Buổi Họp
Thống nhất **lộ trình khảo sát (survey/discovery)** và **overview phạm vi** hệ thống TOSS: cách tổ chức khảo sát, các nhóm chức năng chính (giám sát, báo cáo), tích hợp dữ liệu, và hạ tầng/môi trường với các mốc thời gian ràng buộc.

## Nội dung Thảo luận

### 1. Kế hoạch khảo sát (Discovery/Survey)
- Đã có kế hoạch khảo sát chi tiết ~**20 ngày làm việc / 1 tháng**, chia theo từng ngày.
- Định hướng: khảo sát **song song số liệu (dữ liệu) và nghiệp vụ** thay vì tuần tự.
- Sau **10–15 ngày** đầu sẽ ra được **"khung"** (ưu tiên nghiệp vụ nào trước), rồi mới lập **kế hoạch sản xuất thực tế**; hiện kế hoạch sản xuất **chưa chốt** vì chưa qua khảo sát.
- Cách tiếp cận: 1–2 buổi đầu **overview nghiệp vụ** với team → xác định ưu tiên, cái gì đã rõ / chưa rõ thông tin → sau đó mới đi chi tiết ("great time") theo từng cơ quan/đơn vị.
- Để vào khảo sát đơn vị: cần **công văn yêu cầu** dựa trên **phê duyệt** [của lãnh đạo — tên cần xác nhận]; **thông báo trước ~1 tuần**; gửi trước **bộ câu hỏi khảo sát** đã chuẩn bị để đơn vị chuẩn bị tài liệu/người trả lời (giúp khảo sát nhanh, hiệu quả).
- Lãnh đạo yêu cầu **một lộ trình cụ thể** để báo cáo lên trên; quản lý dự án (PM) sẽ lập bản kế hoạch sau khi khảo sát tương đối ổn.

### 2. Hai đối tượng người dùng chính & chức năng giám sát
- **Trực ban trưởng (OCC):** giám sát **trạng thái khai thác / chuyến bay**; quan tâm **khách nối chuyến** (đến/đi đâu), trạng thái và thông tin chuyến bay.
- **Cán bộ tài liệu (Documents):** giám sát **tài liệu chuyến bay** (OFP/CP, OAP…) — đã được **tổ bay confirm / download** hay chưa.
- **Quan tâm chung của cả hai:** delay, thông tin chuyến bay, và **cảnh báo (alert)** các yếu tố bất thường ảnh hưởng chuyến bay.
- **Đầu ra mong muốn = màn hình giám sát (dashboard) riêng cho từng đối tượng**, dạng danh sách chuyến bay kèm thông tin + cảnh báo (không phải "scratch check"); có **nhiều cấp xem (level)**: overview → danh sách chuyến → chi tiết chuyến → chi tiết hành khách (tên, số ghế…).
- Khác với hiện tại xem **fly release từng chuyến một**, TOSS cần **giám sát chung nhiều chuyến cùng lúc**.

### 3. Quản trị danh mục / Master data
- Cần module **"database maintenance"**: khai báo danh mục, cấu hình giám sát, **thiết lập cảnh báo (alert settings)**, **phân quyền**.
- **Cấu hình cột hiển thị:** admin đặt **maximum** (ví dụ 100 cột / 150 trường — [con số minh hoạ, cần xác nhận]); từng đối tượng/người dùng được hiển thị tập con tuỳ chọn.

### 4. Module Báo cáo (Reporting)
- Logic báo cáo **phức tạp hơn báo cáo thông thường**; mỗi **filter** áp một **logic khác nhau**.
- **Vấn đề hiện trạng:** cùng một chỉ số (vd **OTP**) nhưng **các báo cáo hiển thị số khác nhau**, không thống nhất, không rõ đúng/sai; **không sửa được logic** (bị hạn chế); một số báo cáo mong muốn **chưa làm được**.
- Cách làm: tiếp cận **2 chiều** để đỡ sót — (1) đi từ báo cáo ngược về dữ liệu, (2) đi từ dữ liệu tích hợp lên. Với mỗi báo cáo, người dùng phải chỉ rõ **thông tin lấy từ đâu + công thức tính**, đội triển khai chỉ "thừa kế" logic cho phù hợp.
- **Thứ tự ưu tiên:** làm **báo cáo daily (theo ngày)** trước → mở rộng dần **báo cáo theo thời gian (tổng hợp)**.
- **Hai nhóm báo cáo ưu tiên:**
  1. **Nhóm báo cáo lịch bay** từ hệ thống **Ops++** (đang mua mới để thay thế) — gồm nhiều báo cáo.
  2. **Báo cáo của trực ban trưởng** — nhiều nguồn đầu vào nhưng kết xuất ~1 báo cáo.
- **Báo cáo khách hàng / của trưởng ban:** gồm thống kê chuyến bay, **OTP**, hành khách, phi công–tiếp viên…; **nhiều bộ phận cung cấp số liệu** (trực điều hành, trực dịch vụ, trực kỹ thuật).
- Nguyên tắc: **tự động tổng hợp** những gì có thể; phần **chỉ con người biết** (vd "sương mù Hà Nội làm 10 chuyến không cất cánh được 7–8h") thì **cung cấp chức năng để đơn vị nhập tay** → dùng lại cho mọi báo cáo.
- **Phát hành báo cáo:** tổng hợp tự động → người dùng **review** → **publish** → gửi qua **email**; **không cần ký số**; chỉ cần **cấu hình địa chỉ email nhận**.
- **Evo Report / Echo Report:** Echo Report = báo cáo **Ops++**; **Evo Report** = công cụ tự build để **lấy dữ liệu lịch bay từ NetLine** (vì NetLine không tương thích báo cáo của Google) — hiện đáp ứng ~"3 số" [cần xác nhận].
- Bối cảnh: trước đây đã từng có đơn vị làm báo cáo này nhưng **không hoàn thành được do vướng thủ tục hợp đồng với VNA** → nay **làm lại từ đầu**.

### 5. Tích hợp dữ liệu & thay thế hệ thống cũ
- **Mục tiêu chính:** **thay thế hệ thống cũ FMS** (ASR đọc nhầm thành "tầm phim/tầng phim"); web **MMS** được xem là **tiền thân của TOSS** nhưng phạm vi nhỏ hơn nhiều (chỉ chạy trên EA/IE, phát triển ~2019). Một luồng dùng **FMS** hiện **rất chậm**.
- **Dữ liệu chuyển động (movement / MVT)** [ASR đọc là "mục mần"]: hiện phủ **~90% chuyến bay VNA** (các hãng khác ~99% theo report của **CDU**); **độ chính xác (accuracy) ~79%**; còn thiếu nhiều bản tin movement ("missing movement").
- Quy mô: VNA bay **~11.000 chuyến/tháng**, ~10.000+ có dữ liệu.
- **Điện văn gửi sang SITA** [ASR "siêu"]: MVT/movement, **FPHL** [cần xác nhận], **Supplemental ("Five Supplemental")**; format gửi đã OK.
- Cần **cơ chế cập nhật event-based + snapshot**: nhận event thì cập nhật từ snapshot trước, rồi **đối soát (reconcile) tại snapshot sau**. **Chưa chốt** cơ chế duy trì tập dữ liệu "gần nhất".
- **3 nguồn dữ liệu cho phân tích delay** (của anh Hương): (1) **LEFT** (lịch bay), (2) **LEFT history**, (3) **điện văn/telex** liên quan delay (delay code, cancel code, time code; nguyên nhân delay/huỷ/kéo dài). Loại quan tâm là **LEFT history** — cũng là dữ liệu "dễ nhất".

### 6. Hạ tầng & môi trường (Infrastructure)
- **Hai mốc deadline ràng buộc:**
  - Trước **~15/6**: phải có **hạ tầng** sẵn sàng.
  - Trước **30/6**: **thông kết nối** (FTP… — kết nối hai chiều giữa các hệ thống).
- Hiện đã **xây dựng hạ tầng UAT** (chưa lên prod/growth — sẽ xếp growth khi hệ kia lên growth).
- Kiến trúc công nghệ do **chị Lê** gửi; cần **chốt số lượng server** (~**27 con** [cần xác nhận]) để **xin IP**.
- **Khó khăn:** bên cấp hạ tầng (cloud) **cấp chậm**; credential/"cấp clan" hay bị hết hạn phải gia hạn → cân nhắc đi thẳng môi trường thật; **UAT của hệ M.O** chỉ truy cập **remote**, 2–3 máy, ràng buộc — đối tác chuyển đổi số cũng phải vậy.
- **Kênh phối hợp kỹ thuật:** nhóm **"top integration"**; liên hệ **S.A bên VDL (anh Sơn / Sơn Phạm)** để trao đổi tích hợp/hạ tầng.

### 7. Quan sát qua demo (web MMS hiện tại)
- Dispatcher (điều phái) dùng **mobile** cho **OSP/FTP**; chức năng **upload file** nằm rải rác nhiều chỗ; **không có một chỗ tập trung** để review/release.
- Màn hình quản lý tài liệu chuyến bay theo **OFP** (mỗi dòng = 1 OFP); một chuyến bay có **nhiều OFP/OAP** → nhiều dòng → **khó quan sát**.
- **Load CDDPM/CPM** [cần xác nhận] xử lý riêng; tách **app load** và **view**; phần **view rất chậm**; phân quyền tách (new vs view).
- Đau điểm hiện tại: **lấy 3 OFP mất ~15 phút**; cần màn hình tối ưu, đa màn hình (2 màn hình).

---

> **Phần dưới đây bổ sung từ part2 (`part2_64min-end.txt`, ~01:04→02:43).**

### 8. Hiện trạng báo cáo trên FMS (legacy)
- FMS có giao diện **Oracle Form**: chỉ xuất **một báo cáo tổng hợp chi tiết**, **không có overview/biểu đồ** → chị **export ra Excel** rồi **xử lý thủ công**.
- Báo cáo lấy **~190 trường**, **không cho chọn trường** → phải lấy hết rồi lọc/xoá thủ công, dựng pivot.
- Chị có **file Excel kèm công thức sẵn** → sẽ **gửi/giải thích công thức** cho vendor phân tích (để rút logic báo cáo).

### 9. Luồng nghiệp vụ tài liệu chuyến bay & Loadsheet (4 bước)
- Vai trò: **CLC** (lập loadsheet), **Đại diện sân bay** (người VNA — nhìn Fuel Order để điều phối nạp dầu), **bên nạp dầu** (KHÔNG được cấp tài khoản; nhận thông tin qua đại diện sân bay).
- Bộ tài liệu/luồng:
  1. **CLC** nhập **trọng tải ước tính** (số khách, hàng kg, ULD load) → xác định tải trọng chuyến bay.
  2. (**đã tự động**) **Điều phái** lấy thông tin bước 1 + **Lido adapter** để lập **flight plan (OFP)**.
  3. Flight plan đưa lên **MO**; **phi công** thực hiện **Fly Release**.
  4. **4.1** Đại diện sân bay nhìn **Fly Release** để làm **load sheet**; **4.2** nhìn **Fuel Order** để nạp dầu.
- **Bộ tích hợp chặt không tách rời: TOSS – FMS – MO – Lido adapter.**
- **Cần 2 sơ đồ tách biệt:** (a) **luồng nghiệp vụ người dùng** (actor / dòng thời gian / trạng thái / bước manual–auto); (b) **luồng tích hợp hệ thống** — để không rối.
- **Field Order:** UI giống nhau giữa các loại tàu / nội địa–quốc tế; chỉ người sử dụng khác → coi như một **user role**.

### 10. Lịch sử cập nhật số khách (SQS / history)
- **SQS** (thông tin số khách) thay đổi **rất nhiều lần/chuyến** (book/cancel); màn hình hiện chỉ hiện **trạng thái cuối cùng**.
- Chị cần **cả chuỗi lịch sử** (ai nhập, lúc nào, payload — VA/BC/CAA…) để **đánh giá** (vd telex đầu tiên có đúng quy định "cung cấp 1 tiếng trước chuyến bay" không).
- Hiện phải **dùng code/Excel** xử lý → cần **báo cáo riêng theo nhiều chiều**.

### 11. Quản lý danh mục / Master data (kiến trúc)
- Phân biệt **Danh mục gốc (meta data — thông tin chung cố định:** mã ICAO, mã tàu) **vs Quản lý nghiệp vụ (tham số hay thay đổi theo thời gian:** hiệu lực khai thác, **MEL/CDL**, hợp đồng **thuê khô/ướt**).
- Danh mục: **tàu bay, sân bay, chặng bay**. "Quản lý tàu bay" là **chức năng riêng** dựa trên danh mục.
- Tổ chức **theo nhóm thông tin/đối tượng** (mọi thứ về tàu A xem một chỗ; về sân bay xem một chỗ) cho hợp tư duy người dùng.
- Cụm quản trị: **System Admin, Data Maintenance, Data/Sub Monitoring** (chỉ người quản trị); tách module **"Quản lý" (tàu/sân/chặng)** khỏi **"Data Maintenance" (chỉ khai báo)**.
- "Chức năng min": **quản trị người dùng tập trung (IAM/eu-rap), phân quyền, danh mục, cấu hình**.

### 12. Phân quyền & module theo đối tượng
- **Phân quyền theo CHỨC NĂNG**, không phân quyền theo dữ liệu/chuyến (khác MO hiện tại — MO chỉ append/review, không phân theo PIC/Purser/chuyến).
- Module theo persona: **chủ văn (cơ trưởng?), điều phái, CLC, đại diện sân bay**. **CLC** quan tâm **load & balance** (load/CDDPM); có thể **gộp vai trò CLC** để tiện (vừa app load CCD vừa nhập weight & balance một chỗ).

### 13. Màn giám sát điều phái = monitoring + BACKUP cho Lido
- Trước đây điều phái **upload OFP + NOTAM/thời tiết thủ công**; nay **tự động** từ **Lido/video** về **OAP + NOTAM/thời tiết**.
- Vai trò màn này: **chủ yếu monitoring** + **kênh backup** khi Lido/adapter sập (cho phép điều phái tự lấy lại OFP chuyến trước, sửa, đẩy lên MO).
- **Cảnh báo:** Lido chưa cảnh báo được; hiện cảnh báo qua email → cần **list cảnh báo** để record vào hệ thống.

### 14. Lưu trữ & retention dữ liệu/file
- File **OFP/OSP lưu ở MO**; **TOSS không lưu file** — chỉ **kéo về để view khi cần** (tiết kiệm bộ nhớ). Data đã **"bóc tách"** thì đồng bộ về TOSS để báo cáo + hiển thị menu nghiệp vụ.
- **Quy định Cục:** file giữ **100 ngày**; data giữ lâu hơn để phân tích.
- Cần **kịch bản retention chung**: cái gì lưu lịch sử/data/file, **lưu bao lâu**, **cơ chế purge** từ mốc nào.
- **Bài học:** lần trước lưu **toàn bộ field API trả về** → tốn bộ nhớ; lần này **chỉ lưu field cần**.

### 15. MEL/CDL & Performance Factor (tích hợp AMOS / BackPACK)
- **MEL/CDL** gồm 2 phần: **Master MEL** (danh mục cố định theo loại tàu — định nghĩa mọi MEL có thể có, hỏng nào được/không được bay, thời hạn khắc phục ~30 ngày, ảnh hưởng performance/nhiên liệu; tích hợp từ Hãng/nhà sản xuất) và **MEL active (đang hỏng)** lấy từ **AMOS**.
- **FOM** khai báo **ảnh hưởng nhiên liệu** từng MEL (vd MEL#3 +1%, MEL#5 +1.5%) → **tổng % cảnh báo** lên màn giám sát điều phái.
- **Performance Factor** (độc lập với MEL): tính từ khai thác thực tế; chị nhận điện qua **email** → nhập **phần mềm BackPACK** (WinForm local của nhà SX) → ra performance factor → nhập lên **Lido + FMC tàu bay** (2 nơi).
  - **Đề xuất:** vendor tích hợp điện email → **xuất file đầu vào BackPACK** → **RPA** thao tác BackPACK → trả kết quả lên Lido; nếu không RPA được thì **tự đọc file giúp ~40–50%**. Phần mềm BackPACK/"pgepoid" [tên cần xác nhận] cần khảo sát thêm.
- **Performance factor trung bình** tính 2 tuần/1 tháng/lần (gồm chuyến có & không MEL-CDL) để estimate tháng sau; **Lido cộng % MEL active + performance factor vào block fuel**.

### 16. Khách nối chuyến (connecting passengers) — Amadeus
- Trực ban trưởng cần **khách nối vào (inbound) + nối ra (outbound)**: tổng số + **chi tiết từng khách** nối từ/đi chuyến nào.
- Mục đích: khi chuyến **delay** → cảnh báo **nguy cơ mất khách nối chuyến (misconnect)** → quyết định **delay tối đa bao nhiêu phút** / action (báo delay chuyến kế tiếp).
- Hiện chỉ **1 người dùng được giao diện Amadeus** (hạn chế nghiệp vụ) → chị **kéo thêm người quen Amadeus**, có thể cần **trực dịch vụ**.
- **API Amadeus** cấp cho vendor trước đây **chưa bên nào dùng để ra quyết định**; vendor **chưa verify** data là real-time từ hệ thống chính hay **replicate/image**. MO hiển thị số **khác** Amadeus tại cùng thời điểm (số biến động) → **cần verify nguồn API**.
- **ToToPACK** (tổng tải) đã lấy được; **Flight Status** chỉ hiển thị trạng thái (không mang tính quyết định); nhưng **khách nối chuyến mang tính quyết định → cần chính xác + verify**.

## Quyết định Chính
> *DEC-ID đề xuất tiếp nối DEC-001 (đang ở template). **Cần xác nhận người quyết định** vì ASR không định danh rõ.*

| # | Quyết định | Người quyết định | Ghi chú |
|---|---|---|---|
| DEC-002 | Khảo sát **song song số liệu + nghiệp vụ**; overview trước, đi chi tiết sau | Lãnh đạo dự án ('anh') — [xác nhận] | |
| DEC-003 | Ưu tiên làm **báo cáo daily** trước, rồi mở rộng theo thời gian | 'Chị' đề xuất, đồng thuận — [xác nhận] | |
| DEC-004 | **Tách giao diện giám sát riêng** cho 2 đối tượng (trực ban trưởng / tài liệu), không gộp chung | [xác nhận] | Lý do: tối ưu |
| DEC-005 | **Mục tiêu chính của tích hợp = thay thế hệ thống cũ FMS** | [xác nhận] | ASR đọc nhầm FMS thành "tầm phim" |
| DEC-006 | Báo cáo **không dùng ký số**; chỉ cấu hình **email nhận** + review/publish | [xác nhận] | |
| DEC-007 | **Hai nhóm báo cáo ưu tiên:** lịch bay (Ops++) + báo cáo trực ban trưởng | [xác nhận] | |
| DEC-008 | **Phân quyền theo CHỨC NĂNG**, không phân quyền theo dữ liệu/chuyến | [xác nhận] | |
| DEC-009 | **Master data: tách Danh mục gốc (meta) vs Quản lý nghiệp vụ**; tổ chức theo đối tượng (tàu/sân/chặng) | [xác nhận] | |
| DEC-010 | Màn **giám sát điều phái = monitoring + BACKUP cho Lido** khi sự cố | [xác nhận] | |
| DEC-011 | **File OFP/OSP lưu ở MO; TOSS không lưu file**, chỉ kéo về view khi cần; lưu data đã bóc tách theo retention (file 100 ngày theo Cục) | [xác nhận] | |
| DEC-012 | **Chỉ lưu field cần** (không lưu toàn bộ API trả về) — chống phình bộ nhớ | [xác nhận] | Bài học lần trước |
| DEC-013 | **Ưu tiên tích hợp phục vụ Ops++ trước**; dùng **fake data** test thông kết nối | [xác nhận] | |
| DEC-014 | **Hãng (chị) cam kết tham gia cùng vendor xuyên suốt giai đoạn tích hợp** | Bạch Lê — [xác nhận] | Lần trước không tham gia → lệch nhau |

## Action Items
| # | Nhiệm vụ | Người thực hiện | Deadline |
|---|---|---|---|
| 1 | Gửi **tài liệu sản xuất** (LIS, biểu mẫu import, diagram/flowchart) + **clip/example** quy trình chuyển đổi dữ liệu (format, ví dụ) | 'Em' (nhóm triển khai) | [Trong buổi/ngay — cần xác nhận] |
| 2 | **Order lịch làm việc với điều phái (Dispatcher)** ngay trong tuần | 'Chị' | Trong tuần này |
| 3 | Trao đổi với **S.A bên VDL (anh Sơn)** qua nhóm "top integration" về hạ tầng/IP | 'Em' | [Chưa có deadline] |
| 4 | Trao đổi bên **cấp hạ tầng** để xin cấp **cụm cloud/UAT sớm** | 'Em' | [Chưa có deadline] |
| 5 | **Chốt số lượng server (~27)** để xin IP | 'Em' / [SA] | [Chưa có — gắn mốc 15/6 hạ tầng] |
| 6 | Làm việc với **CDU** nâng độ phủ **movement (90%)** & accuracy (79%) | 'Em' | ~4 ngày [đã chốt ~1 tuần với CDU — cần xác nhận] |
| 7 | Gửi **bộ câu hỏi khảo sát** + **công văn** yêu cầu đơn vị bố trí người trước khi khảo sát | 'Em' | Trước mỗi đợt khảo sát (báo trước ~1 tuần) |
| 8 | Gửi **sơ đồ phạm vi** (các hệ thống/nguồn dữ liệu cần quan tâm để stand-up) | 'Em' | [Chưa có deadline] |
| 9 | Gửi **file Excel + công thức báo cáo (FMS)** cho vendor phân tích | 'Chị' (Bạch Lê) | [Chưa có deadline] |
| 10 | Vẽ **2 sơ đồ**: luồng nghiệp vụ người dùng + luồng tích hợp hệ thống | 'Em' | [Chưa có deadline] |
| 11 | Xây **kịch bản retention chung** (file/data/lịch sử, thời hạn, cơ chế purge) | 'Em' | [Chưa có deadline] |
| 12 | Khảo sát **MEL/CDL** (Master MEL từ Hãng/nhà SX; MEL active từ **AMOS**) + tích hợp AMOS | 'Em' | [Chưa có deadline] |
| 13 | Đề xuất tích hợp **Performance Factor**: điện email → file BackPACK → RPA/tự đọc → Lido; khảo sát phần mềm BackPACK | 'Em' | [Chưa có deadline] |
| 14 | **Verify nguồn API Amadeus** (real-time hệ thống chính vs replicate/image) | 'Em' | [Chưa có deadline] |
| 15 | **Kéo thêm người quen Amadeus** (có thể trực dịch vụ) cho khảo sát khách nối chuyến | 'Chị' | [Chưa có deadline] |
| 16 | Cung cấp **hình ảnh/giao diện sớm** (ưu tiên cho thấy dữ liệu thật trên UI — "sờ được, nhìn được") | 'Em' | Sớm nhất có thể |

## Câu hỏi Chưa Giải quyết
- [ ] Cơ chế duy trì tập dữ liệu "gần nhất": **snapshot vs event** kết hợp thế nào — **chưa chốt**.
- [ ] **Logic/filter từng báo cáo** cụ thể — cần có **số liệu thật** mới mô tả kỹ được.
- [ ] Bên cấp hạ tầng có **cấp cloud/UAT sớm** không (ảnh hưởng mốc 15/6)?
- [ ] Ngoài MVT/movement, các điện văn **FPHL / Supplemental** có tích hợp/xử lý được hết không?
- [ ] Môi trường UAT đi thẳng "con thật" hay cấp riêng — phương án cuối?
- [ ] **API Amadeus** trả real-time từ hệ thống chính hay **replicate/image** — chưa verify.
- [ ] Phần mềm **BackPACK / "pgepoid"** có **RPA/tự đọc** được không (tên cần xác nhận).
- [ ] **Lido không cho tích hợp (boost)** → ảnh hưởng tích hợp MEL/Performance Factor.
- [ ] Từng **"cục" dữ liệu Ops++** có sẵn không, qua phương thức gì — **đến ~thứ Tư** mới rõ.
- [ ] Định danh **người chủ trì / người quyết định** từng DEC; **địa điểm họp**.

## Ghi chú Bổ sung
- **Thuật ngữ (đối chiếu domain-knowledge / glossary):** OFP = Operational Flight Plan; OTP = On-time Performance; OSP = Operational Schedule Performance; MVT = Movement message; NOTOC/Loadsheet/CPM thuộc bộ tài liệu chuyến bay; Dispatcher = Điều phái/Kiểm soát viên khai thác. Một số từ ASR đã được suy luận: "mục mần"→movement, "siêu"→SITA, **"tầm phim/tầng phim"→FMS (hệ thống cũ cần thay thế)**, "load CDDPM"→CPM/loadsheet [cần xác nhận].
- **Rủi ro:** (1) hạ tầng/cloud cấp chậm đe doạ mốc 15/6 & 30/6; (2) độ phủ & độ chính xác dữ liệu movement của VNA thấp hơn mặt bằng (90%/79%); (3) logic báo cáo hiện không thống nhất (OTP lệch giữa các báo cáo).

## Buổi Họp Tiếp theo
- **Thứ 3 (sáng):** 'Em' + **anh Nam** khảo sát **tích hợp**; chiều — 'anh' bận đi học.
- **Thứ 4 (chiều):** 'anh' dành thời gian **định hướng**; làm việc với **anh Nam** về hạ tầng.
- **Mốc:** sau **10/6** bên kia cài đặt IP/cụm xong → **thông kết nối** → **fake data** test gọi; **15/6** hạ tầng gốc sẵn sàng + đồng bộ data cho Ops++ (NetOps); **30/6** thông kết nối toàn bộ.
- **Chủ đề kế tiếp:** khảo sát **quản lý tàu bay / danh mục**; **tích hợp Ops++ trước**; lịch làm việc với **điều phái**; xác minh nguồn **Amadeus**.
- **Cơ chế phối hợp:** chị đi cùng vendor xuyên suốt tích hợp; bí thì **báo anh Hùng**. Nhắn hỏi bất kỳ lúc nào (kể cả cuối tuần).

---
*Bổ sung part2 ngày 2026-06-09. Toàn bộ nội dung trích từ ASR chất lượng thấp — đối chiếu người dự họp trước khi dùng làm căn cứ (CLAUDE.md §0).*
