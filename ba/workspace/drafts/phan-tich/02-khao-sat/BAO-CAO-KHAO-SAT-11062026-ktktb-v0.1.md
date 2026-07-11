---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-16"
survey_date: "2026-06-11"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Phòng Kỹ thuật khai thác bay (KTKTB) + Demo NOTOC 11/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi làm việc với Phòng Kỹ thuật khai thác bay (KTKTB), ngày 11/06/2026

> Báo cáo gộp 03 nội dung khảo sát/demo cùng ngày 11/06/2026 do VTIT phối hợp với VNA - Phòng Kỹ thuật khai thác bay (KTKTB) thực hiện. Phần khảo sát Buổi 2 và Buổi 3 do nhóm phân tích VTIT trực tiếp ghi nhận (biên bản cấu trúc sẵn). Phần Webex là buổi trình diễn module NOTOC do VTIT thực hiện cho VNA và phần Q&A nghiệp vụ. Mỗi điểm trong báo cáo có chú thích nguồn `(Buổi 2)`, `(Buổi 3)`, hoặc `(Webex NOTOC)`. Nội dung bám 100% theo nguồn; các mục chưa rõ được giữ nguyên ngữ cảnh hoặc gắn cờ `[cần xác nhận]`.

## I. Thông tin chung

| Mục | Nội dung |
|---|---|
| **Ngày khảo sát** | 11/06/2026 |
| **Lưu ý định dạng thư mục** | Thư mục nguồn được tạo tên `NOTOC_11262026`. Theo header transcript Webex (`Webex meeting 110626.txt`), giá trị `110626` tương ứng 11/06/2026, do đó hiểu là tên thư mục được đặt sai định dạng (đúng phải là `NOTOC_11062026`). |
| **Đơn vị khách hàng** | Tổng công ty Hàng không Việt Nam (VNA) — Phòng Kỹ thuật khai thác bay (KTKTB). Khác với nhóm Dispatcher/OCC đã khảo sát trong các buổi sáng/chiều cùng ngày. |
| **Phía khảo sát/trình bày** | Đội phân tích nghiệp vụ + đội phát triển NOTOC của VTIT (xuất hiện các tên: Hiếu, Nghĩa, Sơn, Tú, Quốc Anh, Cảnh Trị; phía VNA có anh Dũng tại Sài Gòn, anh Thành). (Webex NOTOC) |
| **Hình thức** | Hai phần khảo sát yêu cầu trực tiếp về 04 nhóm chức năng (MEL, W&B, Lập phương án đường bay, Thư viện khai thác) — biên bản dạng cấu trúc do VTIT chủ trì soạn. Một phần demo Webex hệ thống NOTOC (phim cargo) kèm Q&A về tình huống 2 NOTOC trên cùng chuyến bay tại Sài Gòn. |
| **Tài liệu nguồn** | (1) `ba/workspace/drafts/phan-tich/01-nguon/VNA-KTKTB-Buoi2.extracted.md` — Buổi 2: MEL + W&B. (2) `ba/workspace/drafts/phan-tich/01-nguon/VNA-KTKTB-Buoi3.extracted.md` — Buổi 3: Lập phương án đường bay + Thư viện khai thác + bổ sung W&B. (3) `ba/workspace/input/Customer_docs/meeting-notes/NOTOC_11262026/Webex meeting 110626.txt` — transcript demo NOTOC; chỉ phần có nội dung [00:12:00]–[00:55:00] được khai thác. |
| **Ghi chú chất lượng nguồn** | Biên bản Buổi 2 và Buổi 3 do VTIT soạn ở dạng đề mục, ngắn gọn, không có transcript đối chiếu — báo cáo bám sát từng gạch đầu dòng. Transcript Webex là ASR có chất lượng nhiễu (xuất hiện "nâu tốc"/"nô tốc" = NOTOC, "phi công" = Captain, "phim cargo" = FIM cargo `[cần xác nhận]`); các đoạn lặp `Cảm ơn mọi người` / `Em xin chào mọi người` là artifact của khoảng lặng nên đã bỏ qua. |

---

## II. Nội dung khảo sát

### 1. Phần mềm biên soạn tài liệu MEL (Buổi 2)

**Mục tiêu khảo sát**

Nhóm Phòng Kỹ thuật khai thác bay đặt vấn đề số hoá công cụ biên soạn tài liệu MEL (Minimum Equipment List) dùng chung cho hai dòng máy bay Boeing và Airbus. (Buổi 2)

**Hiện trạng**

- Tài liệu MEL của dòng Boeing đang được soạn/chỉnh sửa trên bộ công cụ Adobe FrameMaker kết hợp với IXP. (Buổi 2)
- Tài liệu MEL của dòng Airbus đang được soạn/chỉnh sửa trên phần mềm FODM phiên bản 10.8 (kèm một phiên bản khác chưa nêu rõ trong biên bản). (Buổi 2)

**Ý tưởng VTIT trình bày & phản hồi khách hàng**

| Ý tưởng | Phản hồi khách hàng |
|---|---|
| Một công cụ soạn thảo MEL duy nhất hỗ trợ cả Boeing và Airbus | **"Khách hàng rất thích ý này"** (Buổi 2) |
| Hỗ trợ revision (theo dõi thay đổi/chỉnh sửa giữa các phiên bản) | Khách hàng tiếp nhận (Buổi 2) |
| Quản lý trạng thái bộ tài liệu theo vòng đời `Airbus → Working → Pending → Airline` | Khách hàng tiếp nhận (Buổi 2) |
| Hỗ trợ hiển thị compare giữa các version tài liệu | **"Khách hàng rất thích ý này"** (Buổi 2) |
| Xuất tài liệu ra các định dạng phù hợp Airbus và Boeing — XML, OPS và "1 định dạng nữa" `[cần xác nhận tên định dạng thứ ba]` | Khách hàng tiếp nhận (Buổi 2) |
| Riêng dòng Airbus A350 cần "thẻ ký": VTIT đề xuất giữ bước ký thủ công bằng FODM (không làm trực tiếp trên tool mới) | **Khách hàng đồng ý** giữ thủ công bằng FODM cho bước ký A350 (Buổi 2) |
| Khi hãng máy bay phát hành hotfix (SB — Service Bulletin), tool phải so sánh và áp dụng nhanh hotfix vào đúng tài liệu, hỗ trợ áp dụng theo loại tàu/số hiệu tàu | Khách hàng tiếp nhận (Buổi 2) |
| Phân loại và áp dụng riêng tài liệu cho từng loại tàu bay/số hiệu tàu bay | Khách hàng tiếp nhận (Buổi 2) |

Kết luận chung của khách hàng cho nhóm chức năng này: **"Khách hàng hài lòng với đề xuất ý tưởng của VTIT."** (Buổi 2)

### 2. Tính toán cân bằng trọng tải — Weight & Balance (Buổi 2 + Buổi 3)

**Mục tiêu khảo sát**

Tìm hiểu quy trình khai báo dữ liệu và tính toán cân bằng trọng tải của tàu bay, đầu ra tài liệu W&B. (Buổi 2). Buổi 3 thu thập bổ sung nhu cầu mở rộng. (Buổi 3)

**Ý tưởng VTIT trình bày tại Buổi 2 & phản hồi khách hàng**

- Tool cho phép khai báo dữ liệu cố định theo loại tàu bay và theo số hiệu tàu bay. (Buổi 2)
- Tool cho phép import dữ liệu tàu bay từ Nhà sản xuất theo định dạng file `.wbd`. (Buổi 2)
- Tool áp dụng các công thức tính toán cân bằng trọng tải từ file Excel để tính ra các thông số `DOW`, `DOI`, `DOCG` của tàu bay. (Buổi 2)
- Tool xuất kết quả ra Word (theo template), Excel, PDF. (Buổi 2)

Phản hồi khách hàng tại Buổi 2: **"Khách hàng hài lòng với đề xuất ý tưởng của VTIT."** (Buổi 2)

**Bổ sung yêu cầu tại Buổi 3**

- Hệ thống cần **lưu lại các phiên bản thông số cân của từng tàu bay**. (Buổi 3)
- Cho phép xuất tài liệu W&B thành **5–6 trang PDF theo template của VNA**. (Buổi 3)

Phản hồi khách hàng tại Buổi 3 cho toàn bộ các yêu cầu mở rộng: **"Khách hàng hài lòng với đề xuất ý tưởng của VTIT."** (Buổi 3)

### 3. Lập phương án đường bay (Buổi 3)

**Mục tiêu khảo sát**

Tìm hiểu quy trình sử dụng phần mềm tạo đường bay và quy trình soạn phương án đường bay tại Phòng KTKTB. (Buổi 3)

**Ý tưởng VTIT trình bày & phản hồi khách hàng**

- Cho phép người dùng khai báo cơ sở dữ liệu (CSDL) sân bay hoặc **import file PDF từ nhà cung cấp LIDO (LIDO Chart)**: hệ thống quét PDF để lấy các trường thuộc tính sân bay. (Buổi 3)
- CSDL sân bay có các trường checkbox cho phép người dùng đánh dấu sân bay đã đủ tài liệu theo nghiệp vụ. (Buổi 3)
- Hỗ trợ tạo dữ liệu trong file phương án bay thông qua thao tác chọn sân bay đi/đến/dự bị. (Buổi 3)
- Hỗ trợ **quét file PDF CFP** để lấy dữ liệu các phép bay (Flight Permission) trong đường bay và **tạo bảng thống kê phép bay** dựa trên dữ liệu quét được. (Buổi 3)
- Hỗ trợ tính Payload đường bay khi chọn sân bay đi/đến. (Buổi 3)

Phản hồi khách hàng: **"Khách hàng hài lòng với đề xuất ý tưởng của VTIT."** (Buổi 3)

### 4. Thư viện khai thác (Buổi 3)

**Mục tiêu khảo sát**

Tìm hiểu quy trình đăng tải tài liệu lên SkyOffice và MO; nhu cầu tích hợp với MO Plus và VNA Library (cả hai đang trong quá trình phát triển); nhu cầu quản lý hoá đơn, tự động tính thuế; quy trình tạo Service Order. (Buổi 3)

**Ý tưởng VTIT trình bày & phản hồi khách hàng**

- Cho phép đăng tải tài liệu **tại SkyOffice một lần**, hệ thống tự động đẩy bản đã đăng tải sang các hệ thống khác: MO, MO Plus, VNA Library — giảm thao tác đăng tải thủ công nhiều lần. (Buổi 3)
- Quy trình tự động hoá Service Order: nhà cung cấp LIDO gửi email vào **địa chỉ email cố định của VNA**; hệ thống tự động đọc email và tạo Service Order theo máy bay. Sau khi order hoàn thành và VNA tiếp nhận thông tin, **người dùng đánh dấu thủ công** trạng thái hoàn thành trên hệ thống. (Buổi 3)

Phản hồi khách hàng: **"Khách hàng hài lòng với đề xuất ý tưởng của VTIT."** (Buổi 3)

### 5. Mở rộng quản lý dữ liệu tàu bay/sân bay (Buổi 3 — bổ sung)

**Mục tiêu khảo sát**

Thu thập thêm nhu cầu của khách hàng về các chức năng quản lý: quản lý công việc, quản lý Obstacle Data, quản lý EOSID, quản lý các phần mềm và tính năng máy bay. (Buổi 3)

**Ý tưởng VTIT trình bày & phản hồi khách hàng**

- **Quản lý công việc:** hệ thống cho phép tạo việc, giao việc, nhân viên báo cáo, xuất báo cáo tuần, vẽ biểu đồ báo cáo. (Buổi 3)
- **Quản lý Obstacle Data và EOSID:** hệ thống cho phép quản lý thuộc tính trong sân bay bao gồm EOSID và Obstacle Data; lưu và cho truy xuất nhật ký các chỉnh sửa; có thể import file `.stx` để gán vào sân bay. (Buổi 3)
- **Quản lý phần mềm/tính năng máy bay:** hệ thống cho tạo bản ghi lưu lại các lần chỉnh sửa phần mềm theo từng máy bay; người dùng có thể comment và đánh dấu tàu bay có cần cập nhật hay không. (Buổi 3)

Phản hồi khách hàng: **"Khách hàng hài lòng với đề xuất ý tưởng của VTIT."** (Buổi 3)

### 6. Demo NOTOC + Q&A — Tình huống 2 NOTOC trên cùng một chuyến bay tại Sài Gòn (Webex NOTOC)

**Bối cảnh**

Buổi Webex là demo hệ thống NOTOC (module NOTOC trên trang web "phim cargo" `[cần xác nhận: FIM cargo]`) do VTIT trình bày cho VNA. Trong quá trình demo, anh Dũng (đại diện VNA tại Sài Gòn) đặt 03 câu hỏi nghiệp vụ, dẫn dắt sang một vấn đề chưa giải quyết được: **trên cùng một chuyến bay nội địa cất cánh từ Tân Sơn Nhất có thể tồn tại đồng thời hai NOTOC** (một cho hàng nội địa, một cho hàng quốc tế transit). (Webex NOTOC)

**Quy trình hiện hành của hệ thống NOTOC (theo phần trả lời của Hiếu/Nghĩa - VTIT)**

- **Nguồn điện FM:** hệ thống đang bóc tách điện FM từ Cita và đẩy tự động lên trang web phim cargo. Hệ thống lấy điện FM từ mail (gửi đến một địa chỉ email được cấp), tiến hành đọc bóc tách, sau đó đẩy thành file PDF lên trang web. (Webex NOTOC)
- **Quy trình revision khi phát hiện sai sót sau khi đã submit:** khi bên phục vụ mặt đất đã submit và đẩy NOTOC lên "MO Overload" (`[cần xác nhận viết tắt: có thể là MO upload]`), nếu bên phục vụ hàng hóa phát hiện sai, họ có thể upload lại file (Excel) hoặc gửi lại điện FM. Hệ thống sẽ đẩy thành **revision mới** lại cho bên phục vụ mặt đất; mặt đất submit tiếp đến phi công. (Webex NOTOC)
- **Quy tắc tạo revision mới:** không chỉnh sửa lại file tài liệu cũ với revision cũ — phải bắt đầu lại quy trình tạo revision mới. (Webex NOTOC)
- **Điều kiện tạo revision mới:** user phục vụ hàng hóa tạo được revision mới **với điều kiện phi công chưa confirm OK với tài liệu trước**. Tuy nhiên anh Sơn (VNA) yêu cầu mở lại: kể cả phi công đã confirm OK rồi vẫn phải cho phép revision 2 (lý do: "trong cái không có lúc khai thác làm mình không thể đóng chết được một lần"; quy trình hiện nay vẫn cho phép chỉnh sửa thành revision 2 để captain upload lại). VTIT (Hiếu) xác nhận sẽ **mở phần upload NOTOC theo revision mới kể cả khi phi công đã confirm**. (Webex NOTOC)
- **Phân biệt reject toàn phần/từng phần của Captain:** hệ thống hiển thị bằng màu sắc — reject toàn phần là **màu đỏ**, reject một phần là **màu cam** `[cần xác nhận màu chính xác: transcript ghi "màu cổng quá"]`. Hệ thống có lịch sử chi tiết khi phi công gửi phản hồi (ví dụ về số/vị trí chất xếp). (Webex NOTOC)

**Vấn đề nghiệp vụ — 2 NOTOC/chuyến bay (anh Dũng - Sài Gòn nêu)**

- Tại Tân Sơn Nhất có hai luồng dịch vụ: **nội địa và quốc tế**. Trên cùng một chuyến bay nội địa có thể đồng thời tồn tại hai NOTOC giấy: một NOTOC cho hàng nội địa, một NOTOC cho hàng quốc tế transit (hàng nguy hiểm có ở cả hai luồng — hàng transit từ quốc tế về có NOTOC, và hàng nội địa từ xưởng/A75 cũng thường xuyên có hàng nguy hiểm). (Webex NOTOC)
- Tần suất: **bình quân ngày một lần** xảy ra trên Hồ Chí Minh bay. (Webex NOTOC)
- Đặc thù hàng từ xưởng: thời gian ra kho rất bất thường, không có thông báo gì trước; cứ thông báo hàng AOG và hàng "DZ cần cứu tàu" `[cần xác nhận viết tắt DZ]` ra là nhập kho là đi → không có thời gian để chập 2 NOTOC quốc tế và nội địa thành một. (Webex NOTOC)
- **Quy định nghiệp vụ về trách nhiệm (anh Dũng nhấn mạnh):** đối với cơ trưởng chỉ cần đảm bảo thông tin hàng hóa lên tàu bay được cung cấp đầy đủ, một NOTOC hay hai NOTOC đều được. Tuy nhiên về quy định của IATA và quy định của VNA, người lập NOTOC phải có trách nhiệm cụ thể; nếu một người cover cho hai NOTOC thì phải có quy trình và phân định trách nhiệm rõ ràng. **Kết luận của anh Dũng: "vẫn để tồn tại hai NOTOC như thực tế NOTOC giấy hiện nay là tốt nhất"**. (Webex NOTOC)

**Hiện trạng hệ thống & các phương án đã đề xuất trong buổi**

- Hệ thống hiện tại **chưa cover** được tình huống 2 NOTOC/chuyến: quy tắc hiện hành là khi phê duyệt bản sau thì sẽ huỷ bản trước, do đó **không tồn tại được hai bản NOTOC trên cùng một chuyến bay**. (Webex NOTOC)
- **Phương án A — "part 1, part 2"** (anh Nghĩa đề xuất, tham khảo cách làm với weather NOTAM trên hệ thống FIM): cho phép một revision chứa nhiều file (`Revision 1 part 1`, `Revision 1 part 2`...); hệ thống FIM hiện đang dựa vào tên file đặt trước để nhận diện part. Hạn chế: cần điều chỉnh quy trình khá nhiều và cần đặt tên file theo quy ước trước. (Webex NOTOC)
- **Phương án B — gộp form nhập** (Hiếu — VTIT đề xuất kết luận tạm thời): bổ sung thêm form nhập trên website, cho phép người dùng nhập đặc biệt hai NOTOC nhưng kết quả khi hệ thống generate ra sẽ là **một file NOTOC có hai trang** gửi lên cho phi công. Form thứ hai sẽ là tuỳ chọn (option), bấm nút để tạo thêm — không bắt buộc cho mọi sân bay. (Webex NOTOC)
- **Phương án C — gắn nhãn quốc tế/quốc nội** (đề xuất từ phía VNA `[cần xác nhận người đề xuất]`): trên hệ thống cho chọn nhãn quốc tế/quốc nội cho hai zip riêng biệt; khi upload thì gán nhãn; sau khi hai form hoàn tất, mặt đất cầm bay 2 file và chuyển đến phi công **một lần** để tránh trường hợp Captain bị refile khi cầm bay tách rời. (Webex NOTOC)
- **Hạn chế của phương án gộp khi nhập tự động qua điện NTM:** Sài Gòn nhập tay nên có thể gộp; nhưng các sân bay khác (ví dụ Nội Bài) dùng điện NTM tự động — không xác định được điện NTM sẽ "chui vào form trên hay form dưới". Hiếu (VTIT) đề xuất: các sân dùng NTM sẽ vẫn dùng 1 form như bình thường; form thứ hai chỉ là tuỳ chọn cho sân nhập tay. (Webex NOTOC)
- **Quan điểm bám quy trình giấy (đại diện VNA nêu):** "hiện nay thực ra quy trình giấy như thế nào thì chúng ta cứ căn cứ vào cái công tác phối hợp đấy để xây dựng cái hình thức 2 NOTOC này"; bộ phận giám sát chất xếp của VR `[cần xác nhận viết tắt VR]` ở dưới ramp căn cứ vào toàn bộ thông tin hàng nguy hiểm/đặc biệt để xác định vị trí — nếu thiếu thông tin thì chưa trình lên cơ trưởng được. (Webex NOTOC)

**Nguồn dữ liệu nhập NOTOC**

- NOTOC bắt buộc phải lấy dữ liệu từ **tài liệu giấy** (tờ khai của khách hàng, thông tin chất xếp thực tế từ kho hàng hóa). Không lấy dữ liệu trực tiếp từ hệ thống Go Support hay bất cứ hệ thống nào khác — **phải nhập tay lên hệ thống NOTOC**. (Webex NOTOC)
- Đối với các sân bay sử dụng điện NTM (ví dụ Nội Bài), dữ liệu được tự động đưa vào form. (Webex NOTOC)

**Câu hỏi mở rộng cuối buổi**

- **Phiên bản mobile cho giám sát chất xếp ngoài tàu bay:** anh Sơn (VNA) yêu cầu nếu có thể thì cho biết phiên bản mobile có khác biệt gì so với phiên bản máy tính, vì toàn bộ công tác ngoài ramp size đều thực hiện trên mobile. VTIT đã demo nhanh phiên bản mobile: các chức năng tương tự web (module, filter tìm chuyến bay, status tài liệu, upload tài liệu, upload manifest, ghi lịch sử xử lý tài liệu, nhập vị trí chất xếp, unsubmit/submit/review). (Webex NOTOC)
- **Chế độ test (sandbox):** một thành viên VNA hỏi trong quá trình thử nghiệm có chế độ test riêng không (vì hiện tại user và thông tin gửi lên đều là thật, lo ngại ảnh hưởng hệ thống nếu sai). VTIT (Hiếu) cho biết bên VTIT sẽ thực hiện **phần size test** trước khi mình thực hiện thật `[cần xác nhận cách diễn đạt — "size test" có thể là "set test" / "site test"]`. (Webex NOTOC)

---

## III. Các điểm khách hàng đặc biệt quan tâm / đã đồng ý

| # | Nội dung | Trạng thái | Nguồn |
|---|---|---|---|
| 1 | Tool soạn thảo MEL hỗ trợ cả Boeing và Airbus | **"Khách hàng rất thích ý này"** | Buổi 2 |
| 2 | Hỗ trợ hiển thị compare các version tài liệu MEL | **"Khách hàng rất thích ý này"** | Buổi 2 |
| 3 | Bước ký A350 vẫn giữ thủ công bằng FODM (không tích hợp vào tool mới) | **Khách hàng đồng ý** | Buổi 2 |
| 4 | Hỗ trợ revision MEL + quản lý trạng thái Airbus→Working→Pending→Airline | Khách hàng tiếp nhận | Buổi 2 |
| 5 | Xuất MEL ra XML, OPS và 1 định dạng nữa | Khách hàng tiếp nhận | Buổi 2 |
| 6 | So sánh và áp dụng nhanh hotfix (SB) vào tài liệu theo loại tàu/số hiệu | Khách hàng tiếp nhận | Buổi 2 |
| 7 | Tool W&B: khai báo dữ liệu theo loại tàu + số hiệu; import `.wbd`; tính DOW/DOI/DOCG; xuất Word/Excel/PDF | "Khách hàng hài lòng" | Buổi 2 |
| 8 | W&B mở rộng: lưu phiên bản thông số cân theo từng tàu bay; xuất 5–6 trang PDF theo template VNA | "Khách hàng hài lòng" | Buổi 3 |
| 9 | Lập phương án đường bay: import PDF LIDO Chart để quét thuộc tính sân bay; checkbox đủ tài liệu; chọn sân bay đi/đến/dự bị | "Khách hàng hài lòng" | Buổi 3 |
| 10 | Quét file PDF CFP tự động lấy phép bay + tạo bảng thống kê phép bay | "Khách hàng hài lòng" | Buổi 3 |
| 11 | Tính Payload đường bay khi chọn sân bay đi/đến | "Khách hàng hài lòng" | Buổi 3 |
| 12 | Thư viện khai thác: đăng tải 1 lần tại SkyOffice, tự động đẩy sang MO / MO Plus / VNA Library | "Khách hàng hài lòng" | Buổi 3 |
| 13 | Service Order: đọc email cố định của VNA do LIDO gửi, tự tạo Service Order; người dùng đánh dấu thủ công khi hoàn thành | "Khách hàng hài lòng" | Buổi 3 |
| 14 | Quản lý công việc: tạo việc/giao việc/báo cáo tuần/biểu đồ | "Khách hàng hài lòng" | Buổi 3 |
| 15 | Quản lý Obstacle Data + EOSID + import `.stx` + lưu nhật ký chỉnh sửa theo sân bay | "Khách hàng hài lòng" | Buổi 3 |
| 16 | Quản lý phần mềm/tính năng máy bay: bản ghi lần chỉnh sửa, comment, đánh dấu cần update | "Khách hàng hài lòng" | Buổi 3 |
| 17 | NOTOC: cho phép tạo revision mới kể cả khi phi công đã confirm OK (mở khoá quy tắc cũ) | **VTIT (Hiếu) xác nhận sẽ điều chỉnh** | Webex NOTOC |
| 18 | NOTOC: phương án tạm thời "gộp 2 form nhập + xuất 1 file 2 trang" — form thứ hai là tuỳ chọn cho sân nhập tay; sân dùng NTM giữ 1 form | VTIT (Hiếu) đề xuất, các bên thống nhất "trước mắt cứ thử theo hướng này xem nó có hướng được hay không" | Webex NOTOC |

---

## IV. Vấn đề cần làm rõ / công việc tiếp theo

**Từ Buổi 2 — MEL & W&B (do VTIT ghi nhận tại biên bản):**

1. Nghiên cứu cách đọc/sửa file định dạng XML trên FrameMaker. (Buổi 2)
2. Nghiên cứu cách đọc/sửa file định dạng XML trên FODM. (Buổi 2)
3. Nghiên cứu cách xuất file qua các định dạng XML, OPS. (Buổi 2)
4. Đọc/tìm hiểu các trường dữ liệu cần khai báo cho W&B. (Buổi 2)
5. Phân tích file Excel để lấy về các công thức tính toán W&B. (Buổi 2)
6. Phân tích file `.wbd` từ nhà sản xuất máy bay. (Buổi 2)
7. **Khách hàng có nêu nhu cầu đấu nối với dự án MO Plus** — **chưa rõ tính năng nào trong MO Plus** cần đấu nối; cần khảo sát bổ sung. (Buổi 2)

**Từ Buổi 3 — Lập phương án đường bay, Thư viện khai thác, mở rộng:**

8. Đọc/thống kê dữ liệu cần quét và lấy về trong file PDF từ LIDO Chart. (Buổi 3)
9. Phân tích/thống kê các trường dữ liệu cho CSDL sân bay. (Buổi 3)
10. Nghiên cứu quy tắc quét file CFP để tạo bảng thống kê phép bay. (Buổi 3)
11. Phân tích thêm cách tính Payload dựa trên thuộc tính sân bay và DOW. (Buổi 3)
12. Liên hệ với đầu mối CĐS (Chuyển đổi số) của VNA để tìm hiểu cách thức tích hợp với SkyOffice. (Buổi 3)
13. Tham khảo hệ thống Service Order hiện tại của VNA. (Buổi 3)
14. Nghiên cứu API đọc email của Microsoft Outlook (gồm lấy nội dung và file đính kèm) — phục vụ tạo Service Order tự động từ email LIDO. (Buổi 3)
15. Phân tích tài liệu Obstacle Data và EOSID để thiết kế CSDL sân bay. (Buổi 3)
16. Phân tích file `.stx` của nhà chức trách sân bay phục vụ Obstacle Data + EOSID. (Buổi 3)

**Từ Webex NOTOC — vấn đề chưa giải quyết hoàn toàn:**

17. Bài toán **2 NOTOC trên cùng chuyến bay** tại Sài Gòn vẫn chưa có lời giải hoàn chỉnh trong version 1 hiện hành. VTIT (Hiếu) kết luận: sẽ làm việc thêm với các bạn ATS để định hướng. Phương án gộp 2 form chỉ là phương án thử nghiệm; cần xác nhận chính thức sau khi làm việc với ATS. (Webex NOTOC)
18. Xác nhận hành vi của hệ thống khi áp Final Talk nội địa rồi phi công đã confirm, sau đó áp Final Talk quốc tế: phi công phải confirm lại hay xử lý ra sao — "luồng hiện tại đang chưa cover được case này". (Webex NOTOC)
19. Xử lý kỹ thuật cho phương án "part 1/part 2" trên NOTOC: việc nhận diện part qua tên file (như đã làm với weather NOTAM trên FIM) chưa khả thi với NOTOC; cần "bên em nghiên cứu thêm xem có thực hiện được không" (anh Nghĩa - VTIT). (Webex NOTOC)
20. Làm rõ phiên bản mobile NOTOC có khác biệt chức năng gì so với phiên bản web (anh Sơn - VNA đặt câu hỏi, VTIT đã demo nhanh nhưng chưa hệ thống hoá khác biệt). (Webex NOTOC)
21. Xác nhận chế độ test (sandbox) trước khi vận hành thật — VTIT cho biết sẽ làm "size test" trước, nhưng chưa làm rõ quy trình kích hoạt chế độ test ở phía VNA. (Webex NOTOC)
22. Làm rõ các từ viết tắt và tên gọi trong biên bản: `FIM cargo` (hay "phim cargo"), `MO Overload` (hay MO upload), `VR` (bộ phận giám sát chất xếp dưới ramp), `DZ` (hàng "DZ cần cứu tàu"), `AOG` (`AOZ` trong ASR), `Cita` (hay CITA — hệ thống nguồn điện FM). (Webex NOTOC)

> Tất cả các điểm trên cần được đưa vào sổ theo dõi `OID-TOSS-001` (Open Items / Open Issues / Decisions) thuộc nhóm SME/KS để theo dõi đến khi đóng.

---

## V. Thuật ngữ mới / ghi chú nội bộ

> **Chỉ dùng nội bộ (BA + agent).** Mục này KHÔNG xuất hiện trong bản Word giao khách hàng. Khi export Word phải strip toàn bộ §V và các đính chính ASR trong báo cáo.

### V.1 — Thuật ngữ đề xuất bổ sung vào `toss-glossary-v0.1.md`

| # | Thuật ngữ | Ngữ cảnh | Trạng thái glossary | Nguồn |
|---|---|---|---|---|
| 1 | MEL (Minimum Equipment List) | Tài liệu danh mục thiết bị tối thiểu cho phép khai thác — soạn bằng FrameMaker+IXP (Boeing), FODM 10.8 (Airbus) | Đề xuất bổ sung — cần confirm | Buổi 2 §1 |
| 2 | FrameMaker (Adobe) + IXP | Bộ công cụ soạn MEL cho dòng Boeing | Đề xuất bổ sung | Buổi 2 §1 |
| 3 | FODM 10.8 | Phần mềm soạn MEL cho dòng Airbus | Đề xuất bổ sung | Buổi 2 §1 |
| 4 | SB (Service Bulletin) | Hotfix tài liệu kỹ thuật do hãng máy bay phát hành | Đề xuất bổ sung | Buổi 2 §1 |
| 5 | DOW / DOI / DOCG | Bộ thông số cân bằng trọng tải tàu bay (Dry Operating Weight / Index / Center of Gravity) | Đề xuất bổ sung | Buổi 2 §2 |
| 6 | `.wbd` (file format) | Định dạng file dữ liệu tàu bay từ nhà sản xuất, dùng import vào tool W&B | Đề xuất bổ sung | Buổi 2 §2 |
| 7 | LIDO Chart | Sản phẩm bản đồ/sân bay dạng PDF của nhà cung cấp LIDO; nguồn để quét thuộc tính sân bay | Đề xuất bổ sung | Buổi 3 §1 |
| 8 | CFP (file PDF) | File chứa thông tin các phép bay trong đường bay; được quét để tạo bảng thống kê phép bay `[cần xác nhận viết tắt CFP]` | Đề xuất bổ sung — cần confirm CFP | Buổi 3 §1 |
| 9 | SkyOffice | Hệ thống nội bộ VNA để đăng tải tài liệu khai thác — tích hợp với MO/MO Plus/VNA Library | Đề xuất bổ sung | Buổi 3 §2 |
| 10 | VNA Library | Hệ thống thư viện tài liệu của VNA đang phát triển | Đề xuất bổ sung | Buổi 3 §2 |
| 11 | Service Order (ngữ cảnh thư viện) | Đơn yêu cầu cập nhật tài liệu khai thác theo máy bay do LIDO gửi qua email | Đề xuất bổ sung | Buổi 3 §2 |
| 12 | Obstacle Data | Dữ liệu chướng ngại vật sân bay, gắn theo từng sân bay | Đề xuất bổ sung | Buổi 3 §3 |
| 13 | EOSID (Engine Out Standard Instrument Departure) | Quy trình cất cánh khi một động cơ ngừng hoạt động `[cần xác nhận tên đầy đủ]` | Đề xuất bổ sung — cần confirm | Buổi 3 §3 |
| 14 | `.stx` (file format) | Định dạng file của nhà chức trách sân bay phục vụ Obstacle Data + EOSID | Đề xuất bổ sung | Buổi 3 §3 |
| 15 | NOTOC (Notification to Captain) | Tài liệu thông báo cho cơ trưởng về hàng nguy hiểm/đặc biệt | Đã có/đề xuất bổ sung | Webex NOTOC |
| 16 | Điện FM | Điện liên lạc hàng không, bóc tách từ Cita (hệ thống nguồn) — đẩy thành PDF lên hệ thống NOTOC | Đề xuất bổ sung | Webex NOTOC |
| 17 | Cita | Hệ thống nguồn điện FM `[cần xác nhận viết tắt — có thể là CITA: Société Internationale de Télécommunications Aéronautiques]` | Đề xuất bổ sung — cần confirm | Webex NOTOC |
| 18 | NTM | Loại điện dùng để nhập NOTOC tự động (Nội Bài dùng NTM, Sài Gòn không dùng được) `[cần xác nhận viết tắt NTM]` | Đề xuất bổ sung — cần confirm | Webex NOTOC |
| 19 | DGS | Dangerous Goods Safety (?) — phần nhập thông tin DGS trên form NOTOC `[cần xác nhận viết tắt]` | Đề xuất bổ sung — cần confirm | Webex NOTOC |
| 20 | A75 | Xưởng A75 — đơn vị có hàng nguy hiểm nội địa đi thường xuyên | Đề xuất bổ sung | Webex NOTOC |
| 21 | Go Support | Hệ thống không được phép lấy dữ liệu NOTOC trực tiếp (NOTOC phải nhập từ giấy) | Đề xuất bổ sung | Webex NOTOC |
| 22 | AOG | Aircraft On Ground — hàng cứu tàu khẩn cấp (ASR ghi nhầm "AOZ") | Đề xuất bổ sung | Webex NOTOC |

### V.2 — Đính chính lỗi ASR (chỉ tồn tại trên bản `.md` nội bộ, KHÔNG xuất hiện bản Word giao KH)

| Từ ASR ghi | Đính chính |
|---|---|
| "nâu tốc" / "nô tốc" / "Notebook" (trong ngữ cảnh hàng hóa cơ trưởng) | **NOTOC** (Notification to Captain) |
| "phim cargo" | **FIM cargo** `[cần xác nhận]` — có thể là tên trang web nội bộ |
| "phi công" (trong "phi công confirm") | **Captain / cơ trưởng** |
| "kích công" | **Captain** |
| "Reversion" | **Revision** |
| "Final Talk" | **NOTOC** (trong ngữ cảnh áp file) `[cần xác nhận lại]` |
| "Cảm ơn mọi người" / "Em xin chào mọi người" lặp liên tục | Artifact ASR của khoảng lặng — bỏ qua |
| "MO Overload" | Có thể là **MO upload** hoặc tên module riêng `[cần xác nhận]` |
| "size test" / "phần size test" | Có thể là **set test** / **site test** — môi trường thử nghiệm `[cần xác nhận]` |
| "AOZ" | **AOG** (Aircraft On Ground) |

### V.3 — Lưu ý cho BA Lead

- Báo cáo này gộp ba nguồn có bản chất khác nhau: 2 biên bản khảo sát cấu trúc + 1 transcript demo ASR — cần đánh giá xem có nên tách thành 2 báo cáo riêng (KTKTB-khảo-sát + NOTOC-demo) khi xuất Word giao khách hàng hay không.
- Cụm "Khách hàng rất thích ý này" (xuất hiện 2 lần ở Buổi 2) là tín hiệu mạnh để ưu tiên đưa vào phạm vi MoSCoW = **Must**.
- Bài toán 2 NOTOC/chuyến bay là vấn đề **chưa đóng** — cần đưa vào OID-TOSS-001 với độ ưu tiên cao do liên quan đến quy định IATA và trách nhiệm pháp lý của người lập NOTOC.
- Tên thư mục nguồn `NOTOC_11262026` có thể được đặt theo định dạng MMDDYYYY (Mỹ) thay vì DDMMYYYY (VN); nội dung transcript xác nhận ngày 11/06/2026 → đề xuất đổi tên thư mục về `NOTOC_11062026` cho thống nhất.

---

*Báo cáo v0.1 (2026-06-16) — lập từ ba nguồn ngày 11/06/2026 với Phòng Kỹ thuật khai thác bay VNA. Các điểm gắn `[cần xác nhận]` được theo dõi tại OID-TOSS-001. Khi xuất Word giao khách hàng, strip toàn bộ §V và các đính chính ASR trong nội dung báo cáo.*
