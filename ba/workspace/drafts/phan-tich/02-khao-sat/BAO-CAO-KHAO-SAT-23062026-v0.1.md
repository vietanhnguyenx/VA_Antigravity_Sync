---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "Agent BA (business-analyst)"
version: "0.1"
date: "2026-06-23"
survey_date: "2026-06-23"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Tích hợp TOSS ↔ NetLine/OPS++ 23/06/2026"
---

# Báo cáo Khảo sát ngày 23/06/2026 — Tích hợp TOSS với NetLine/OPS++

## I. Thông tin chung

**Thời gian.** Buổi làm việc ngày 23/06/2026, tiếp nối buổi khảo sát ngày 19/06/2026, kéo dài khoảng hai giờ.

**Mục đích.** Đi sâu vào chi tiết từng luồng dữ liệu trong danh mục tích hợp TOSS với NetLine Flight Ops++ (OPS++) mà bạn An phía Vietnam Airlines (VNA) đang tổng hợp. Buổi này nhằm chốt nguyên tắc lưu trữ, vai trò của ISB phía NetLine, phân định rõ luồng đi qua TOSS với luồng đi trực tiếp giữa các hệ thống của Lufthansa Systems, làm rõ phương thức truyền và thời điểm gửi cho 17 luồng inbound và 2 luồng outbound thuộc phạm vi TOSS (Thông qua TOSS) theo bảng tổng hợp tích hợp (file Google Sheet "Thông tin tích hợp" phiên bản 77 ngày 23/06/2026), đồng thời thống nhất chiến lược lấy dữ liệu outbound từ OPS++ trong bối cảnh OPS++ chạy trên hạ tầng đám mây và chưa cho phép truy vấn cơ sở dữ liệu trực tiếp.

**Đối tượng tham dự.** Đại diện VNA gồm bạn An và anh Nam phụ trách tổng hợp yêu cầu tích hợp, đại diện Viettel gồm anh Hiệp, chị Lê, anh Hùng và các thành viên dự án TOSS.

**Phạm vi khảo sát.** Buổi này tiếp tục phạm vi của buổi 19/06/2026, đi sâu chi tiết từng luồng theo bảng tổng hợp tích hợp (Google Sheet phiên bản 77 ngày 23/06/2026), không bao gồm các kết nối nội bộ giữa các hệ thống của Lufthansa Systems như Lido Fly4D đi thẳng sang NetLine hoặc AMOS đi thẳng sang NetLine. Buổi này cũng đặt câu hỏi mới về chiến lược lấy dữ liệu outbound từ OPS++ và phương án nhân bản cơ sở dữ liệu NetLine cũ phục vụ giai đoạn chuyển tiếp.

> **Cảnh báo chất lượng ASR:** Bản ghi gốc của buổi 23/06 do hệ thống nhận dạng giọng nói tự động sinh ra có chất lượng kém hơn buổi 19/06; nhiều đoạn lặp dài và một số đoạn liên quan tới crew connection, NOTAM hoặc cấu hình DB clone không thể giải mã hoàn toàn. Báo cáo này đã hiệu đính các nhầm lẫn thuật ngữ thường gặp (NetHawk/nét line/nét sọc → NetLine; ASV/Interprint Service Bus → ISB; top/laptop/tót/tóc → TOSS; LSTP/LFTP/NFTP/FTP → SFTP; VNL/VLA → VNA; Net Off → NetOps; HDQONVN/HDQONVM → địa chỉ điện SITA của VNA; lưu trị/lưu chữ → lưu trữ) và giữ nguyên các đoạn không giải mã được bằng cờ `[cần xác nhận]` để BA Lead nghe lại bản gốc.

---

## II. Nội dung khảo sát theo chủ đề

### II.1. Vai trò ISB của NetLine và nguyên tắc lưu trữ dữ liệu

**Yêu cầu.** Bạn An đặt vấn đề từ đầu buổi rằng phía VNA và NetOps không có yêu cầu TOSS phải lưu trữ dữ liệu phục vụ NetLine. Mục đích của luồng tích hợp là chuyển dữ liệu cho NetLine qua ISB, sau đó NetLine kéo từ ISB và lưu trữ ở phía nó. Câu hỏi mở là phần nào do TOSS phải lưu trữ, phần nào không.

**Thảo luận và đề xuất.** Bạn An mô tả NetLine có một hệ thống gọi là ISB (Integration Service Bus, bản ghi gốc đọc là "ASV" hoặc "Interprint Service Bus"), đóng vai trò adapter của NetLine cho tất cả luồng input và output, tương tự cách TOSS đóng vai trò một hệ thống tích hợp của VNA. Về nguyên tắc lưu trữ, NetOps không yêu cầu TOSS lưu giữ dữ liệu thay cho NetLine; TOSS chỉ chuyển dữ liệu sang ISB, sau đó NetLine kéo từ ISB về lưu trữ ở phía nó. Tuy nhiên trên thực tế, TOSS vẫn cần lưu một bản phía mình để phục vụ các nghiệp vụ điều hành nội bộ và các báo cáo của VNA, độc lập với việc NetLine có yêu cầu lưu trữ hay không. Hai bên đồng thuận rằng yêu cầu của NetOps chỉ là một mặt; phía TOSS tự quyết định khối lượng và phạm vi lưu trữ phục vụ chính TOSS.

**Kết luận.** NetOps không đặt yêu cầu lưu trữ dữ liệu phía TOSS. TOSS chuyển dữ liệu sang ISB của NetLine, NetLine tự kéo và lưu phía mình. Quyết định TOSS lưu gì và lưu bao lâu là quyết định nghiệp vụ riêng của TOSS, không bị NetLine ràng buộc. Hệ quả thiết kế là sơ đồ luồng dữ liệu cần tách rõ "TOSS lưu cho nghiệp vụ TOSS" với "TOSS chuyển tiếp cho NetLine" để tránh nhầm hai mục đích trong cùng một bảng kho dữ liệu.

### II.2. Phân định luồng "qua TOSS" với luồng "trực tiếp" — chốt phạm vi TOSS

**Yêu cầu.** Bảng tổng hợp tích hợp mà bạn An đang xây dựng mô tả tổng thể sơ đồ đấu nối vào OPS++. Trong đó có cột "Phương thức" với hai giá trị là "Thông qua TOSS" và "Trực tiếp". Cần phân định rõ luồng nào thuộc phạm vi TOSS và luồng nào ngoài phạm vi để tập trung thảo luận.

**Thảo luận và đề xuất.** Bạn An khẳng định tổng số luồng tích hợp thuộc phạm vi TOSS ("Thông qua TOSS") là 17 luồng inbound và 2 luồng outbound. Theo bảng tổng hợp tích hợp phiên bản 23/06/2026, các luồng "Trực tiếp" (ngoài phạm vi TOSS) gồm Lido Fly4D với các điện DFLT, Final MVT, METAR, OFP, ATC FPL; AMOS với Ground Event và MEL Item; cùng các luồng outbound Leg Detail AMOS và Leg Detail LIDO. Bạn An và anh Nam khẳng định những luồng "Trực tiếp" này được Lufthansa Systems tự kết nối nội bộ giữa Lido, AMOS và NetLine/OPS++, không đi qua TOSS, do đó Viettel chỉ ghi nhận và không tham gia thực hiện. Các luồng còn lại có giá trị "Thông qua TOSS" là phần thuộc trách nhiệm Viettel và TOSS phải triển khai. Có một luồng đặc biệt là NOTAM, ban đầu được liệt vào "Trực tiếp" theo phương án cũ lấy từ Lido, nhưng tại buổi 23/06 đang chuyển hướng sang lấy qua TOSS từ hệ thống Quản lý bay vì lý do mở rộng phạm vi và tính bền vững (chi tiết tại §II.11).

**Kết luận.** Phạm vi tích hợp của TOSS được chốt là **17 luồng inbound và 2 luồng outbound thuộc phạm vi TOSS (Thông qua TOSS)** theo cột "Phương thức = Thông qua TOSS" trong bảng tổng hợp tích hợp phiên bản 23/06/2026 (2 luồng outbound gồm ASM, ACH). Các luồng "Trực tiếp" do Lufthansa Systems tự thực hiện giữa Lido/AMOS với NetLine/OPS++ là ngoài phạm vi TOSS; ngoài ra trên sơ đồ tổng còn các luồng đấu nối trực tiếp LIDO/AMOS → NetOps++ nằm ngoài phạm vi TOSS. Hệ quả thiết kế là tài liệu BRD/SRS chỉ đặc tả các luồng "Thông qua TOSS"; các luồng "Trực tiếp" chỉ xuất hiện trong sơ đồ kiến trúc tổng thể để minh họa, không sinh yêu cầu cho TOSS.

### II.3. Bốn điện văn nền MVT, MVA, DIV, LDM — kênh kép SITA và email

**Yêu cầu.** Bốn điện văn nền trong nhóm tích hợp là điện chuyển động tàu bay MVT (Movement), điện movement đặc thù MVA (Movement Advice), điện chuyển hướng DIV (Divert), và điện phân bổ tải LDM (Load Message). Cần xác định kênh nhận, phương thức xử lý kênh kép trong giai đoạn chuyển tiếp, và quy tắc ưu tiên khi cùng một chuyến bay có dữ liệu từ cả hai kênh.

**Thảo luận và đề xuất.** Hiện trạng đang dùng SITA Text để gửi và nhận bốn điện này. Cụ thể với điện MVA, tàu bay gửi điện qua máy chủ Sitatex của VNA tại địa chỉ HDQONVN; máy chủ Sitatex chuyển tiếp sang một loạt địa chỉ trong đó có một địa chỉ trung gian (hiện chưa xác định cụ thể là routing nào) để đưa vào NetLine cũ. Với điện MVT do sân bay gửi, hiện sân bay đang thao tác thủ công bằng tay hoặc qua phần mềm riêng, không qua máy chủ Econ.

Định hướng nhất quán của VNA, theo tâm huyết của anh Hùng, là dần thay thế SITA bằng email để giảm chi phí Sitatex. Trong giai đoạn chuyển tiếp, hai bên thống nhất chạy song song hai kênh SITA và email; cả hai kênh đều gửi cùng dữ liệu, TOSS nhận cả hai, so sánh để đảm bảo tính đầy đủ và đúng đắn, sau khi xác nhận kênh email ổn định mới ngắt kênh SITA.

Về quy tắc lấy dữ liệu khi có cả hai kênh, bạn An đính chính khái niệm "primary/secondary" sang "kênh có hiệu lực / kênh không hiệu lực": tại từng thời điểm chỉ một kênh duy nhất có hiệu lực, không tồn tại đồng thời cả hai để chọn ưu tiên. Hệ quả là TOSS phải có cơ chế cấu hình kênh hiệu lực theo từng sân bay và từng giai đoạn, do tốc độ chuyển từ SITA sang email khác nhau giữa các sân bay (một số sân bay hiện chỉ dùng email — bản ghi ASR đọc "size", tạm hiểu là SGN/Sài Gòn — `[cần xác nhận: sân bay nào hiện chỉ dùng email và không phát MVT qua SITA]`).

Khi đang ở giai đoạn chạy song song để kiểm tra, việc so sánh đối chiếu hai kênh thuộc trách nhiệm của TOSS chứ không phải của user. Tuy nhiên anh Hiệp đặt câu hỏi việc đối chiếu sẽ làm bằng công cụ tự động hay bằng tay, và bạn An xác nhận đây là việc tổ triển khai có thể làm thủ công vì thời gian chuyển tiếp ngắn; không bắt buộc TOSS phải có chức năng so sánh chính thức trong sản phẩm.

Riêng điện DIV, ban đầu có lúc bị nhầm DIV chỉ phát từ sân bay, nhưng tại buổi 23/06 anh Hùng đính chính DIV phát từ cả tàu bay và sân bay. Hệ quả là nếu DIV đi đường tàu bay thì đi cùng kênh điện MVA, còn nếu DIV đi đường sân bay thì đi cùng kênh điện MVT. Trong cả hai trường hợp đều áp dụng nguyên tắc kênh kép SITA và email, một trong hai có hiệu lực.

**Kết luận.** Cả bốn điện MVT, MVA, DIV, LDM thuộc phạm vi TOSS với phương thức "Thông qua TOSS", nguồn SITA, hình thức đồng bộ qua SFTP và email. Giai đoạn chuyển tiếp chạy song song hai kênh để đối chiếu, sau đó tắt kênh SITA khi email đã ổn định. TOSS cần cơ chế cấu hình kênh hiệu lực theo từng sân bay theo từng thời điểm, không dùng mô hình primary/secondary đồng thời. Hệ quả thiết kế là cần một bảng cấu hình kênh điện theo sân bay với mốc hiệu lực, một module nhận điện qua email và một module so sánh đối chiếu cho giai đoạn chuyển tiếp (có thể là công cụ phụ trợ chứ không phải chức năng chính thức).

### II.4. Mapping ổ đĩa SITA HDQONVN giữa máy SITA và NetLine

**Yêu cầu.** Hiện trạng giữa máy Sitatex và máy NetLine Classic có cơ chế chia sẻ ổ đĩa để truyền điện văn. TOSS cần biết cơ chế này để xác định cách lấy điện trong giai đoạn quá độ.

**Thảo luận và đề xuất.** Bạn An mô tả trên máy Sitatex có một ổ đĩa chứa input và output của các điện SITA gửi đến địa chỉ HDQONVN; ổ này được map sang máy NetLine Classic để NetLine đọc các điện vào thư mục mapping tương ứng. Trong giai đoạn quá độ, TOSS có thể được phép share-write hoặc share-read vào ổ đĩa này để lấy điện. Phương án dự kiến là TOSS đọc ổ chia sẻ, sau đó NetLine cũ ngắt luồng từ Econ về địa chỉ HDQONVN; như vậy ngắt được một luồng SITA của điện MVA. Tiếp tục khi sân bay chuyển sang gửi email, ngắt thêm một luồng nữa. Mục tiêu cuối cùng là đến ngày go-live NetLine mới (dự kiến tháng 3 năm sau), TOSS không cần đọc ổ này nữa mà toàn bộ chuyển sang email.

Định hướng kỹ thuật là tạo một địa chỉ email trung gian (có thể đặt là `netline@...` hoặc tương tự) để nhận tất cả các loại điện văn bao gồm MVT, MVA, DIV, LDM và sau này có thể có thêm các điện khác. Việc dùng một địa chỉ email hay nhiều địa chỉ email cho các loại điện khác nhau sẽ bàn thêm.

**Kết luận.** Trong giai đoạn quá độ trước khi tất cả sân bay chuyển sang email, TOSS phải kết nối vào ổ đĩa chia sẻ giữa máy SITA và máy NetLine (mapping của HDQONVN) để lấy điện văn. Cách kết nối cụ thể (LTV, share-write hay share-read) sẽ làm việc thêm. Hệ quả thiết kế là TOSS phải hỗ trợ ít nhất hai phương thức nhận điện song song trong giai đoạn quá độ là đọc ổ đĩa chia sẻ và nhận email; sau go-live NetLine mới chỉ còn email.

### II.5. Điện FMM (Fuel Monitoring Message) — TOSS tự sinh

**Yêu cầu.** FMM là điện liên quan đến nhiên liệu mà NetLine cần nhận. Hiện không có nguồn sẵn sinh ra điện này, nên TOSS phải tự sinh từ dữ liệu mình tổng hợp.

**Thảo luận và đề xuất.** Bạn An xác nhận FMM trong bảng tích hợp là điện cần TOSS tự generate vì hiện không có nguồn sẵn. Định dạng điện, dữ liệu nguồn và tiền điều kiện sinh điện chưa được xác định cụ thể, cần xem yêu cầu đầu ra của NetLine để biết cần dữ liệu gì. Chị Lê và bạn An thảo luận về thời điểm gửi điện này: theo nguyên tắc "có cập nhật thì gửi", nhưng FMM phụ thuộc vào thời điểm nạp dầu thực tế nên rất khó xác định khi nào là kết thúc nạp dầu. Một số mốc rõ là OUT, OFF, ON, IN qua điện ACARS; còn nếu yêu cầu gửi đúng lúc vừa nạp xong khi tàu còn ở bãi đỗ thì lại phụ thuộc vào thông tin từ đơn vị nạp dầu (Skypec hoặc các nhà cung cấp khác).

Bạn An đề xuất phương án mặc định lấy thông tin nhiên liệu tại mốc block-off; nếu phía NetLine yêu cầu khác sẽ điều chỉnh. Nguồn dữ liệu nhiên liệu có thể là phiếu dầu trên FIMS, nhưng phiếu dầu được nhập sau khi chuyến bay kết thúc nên có độ trễ. Anh Hùng được nêu là người sẽ trao đổi với phía cung cấp dữ liệu nhiên liệu (Skypec không phải nhà cung cấp duy nhất, nên cần quy định mọi nhà cung cấp đều phải cung cấp dữ liệu theo định dạng chung nếu lấy nó làm nguồn bắt buộc). Một số đoạn thảo luận về cách lấy dữ liệu nạp dầu trên đoạn này bản ghi không rõ `[cần xác nhận: chi tiết phương án lấy dữ liệu nhiên liệu từ Skypec và FIMS]`.

**Kết luận.** Điện FMM thuộc phạm vi TOSS với phương thức "Thông qua TOSS", nguồn dữ liệu là TOSS tự tổng hợp và sinh ra (cột Nguồn = TOSS, Ghi chú = "Hiện không có sẵn, nếu muốn sử dụng cần tự động generate"). Đây là điện pending về thời điểm gửi và nguồn dữ liệu nhiên liệu, cần làm việc thêm với anh Hùng và phía cung cấp dầu. Hệ quả thiết kế là phải mở một mục công việc riêng "Quy tắc sinh điện FMM" với các nội dung con là định dạng điện, thời điểm gửi, nguồn dữ liệu nhiên liệu, đơn vị nạp dầu bắt buộc.

### II.6. Điện SSIM (lịch mùa) — forward hai chiều giữa Sabre và NetLine

**Yêu cầu.** SSIM là tệp lịch mùa (seasonal schedule) trao đổi giữa hệ thống lịch bay Sabre Scheduling Manager và NetLine/OPS++. Cần xác định cách TOSS forward tệp SSIM giữa hai hệ thống.

**Thảo luận và đề xuất.** Bạn An mô tả Sabre Scheduling Manager hiện đang sinh ra một tệp lịch trong một thư mục SFTP; TOSS sẽ phải lấy tệp này về và đẩy sang OPS++ qua SFTP. Theo tần suất, tệp SSIM sinh ra ba lần trong ngày, TOSS chỉ cần forward khi có tệp mới. Chiều ngược lại từ OPS++ về Sabre cũng tương tự: OPS++ xuất ra một tệp SSIM theo định dạng yêu cầu của Sabre, TOSS lấy về và chuyển sang Sabre. Tuy nhiên định dạng tệp SSIM hiện Sabre đang sử dụng có thể là một biến thể cũ của NetLine Classic chứ không phải đúng chuẩn SSIM IATA; trong trường hợp này, TOSS phía Viettel sẽ chịu trách nhiệm tạo tệp theo định dạng cũ mà Sabre đang dùng và theo tần suất Sabre mong muốn.

Bạn An lưu ý điểm khó là Sabre nhận điện theo ba đường khác nhau, gồm điện do TOSS chế biến từ ASM/ACH của NetLine, điện ASM gốc của NetLine, và một đường thứ ba từ hệ thống khác (bản ghi ASR không rõ, có thể là Lido) `[cần xác nhận: ba nguồn vào Sabre — TOSS chế biến từ ASM/ACH, ASM gốc NetLine, và đường thứ ba là nguồn nào]`. Sabre dùng cả ASM và SSIM để tạo ra schedule master của Sabre. Đôi khi giữa schedule của Sabre và schedule của NetLine có sai khác và phía Sabre phải chỉnh tay; quá trình này không cần TOSS xử lý mà do user của Sabre tự làm.

Câu hỏi của anh Hiệp là việc chế biến điện này thuộc TOSS hay thuộc ISB của NetLine. Bạn An đề xuất nếu cả hai bên đều thống nhất dùng chuẩn ASM/SSIM IATA thì không cần chế biến, chỉ chuyển tệp; nếu Sabre nhận định dạng khác chuẩn thì việc chế biến nên thuộc ISB của NetLine chứ không phải TOSS, để tránh TOSS phải hiểu logic biến thể của Sabre.

**Kết luận.** SSIM thuộc phạm vi TOSS với phương thức "Thông qua TOSS", phương thức truyền là SFTP, nguồn là Sabre, đích là OPS++. TOSS forward tệp không xử lý nội dung khi cả hai bên dùng chuẩn IATA. Trường hợp Sabre dùng định dạng riêng, ưu tiên ISB của NetLine chế biến thay vì TOSS. Hệ quả thiết kế là cần một module forward tệp SFTP có khả năng đẩy ra Sabre trong chiều outbound, cùng với việc xác nhận lại với phía Sabre và NetLine về định dạng thực tế đang dùng.

### II.7. Điện PTM (khách nối chuyến) — quét cửa sổ thời gian từ Amadeus

**Yêu cầu.** PTM (Passenger Transfer Message) là điện thông tin khách nối chuyến từ một chuyến bay sang một hoặc nhiều chuyến bay khác cùng hãng. Nguồn là Amadeus PSS. Cần xác định tần suất quét, cách định danh chuyến bay cần quét, và quy tắc gửi khi có cập nhật.

**Thảo luận và đề xuất.** Anh Hiệp đề xuất phương án quét theo cửa sổ thời gian (time window) thay vì gọi cho từng chuyến: TOSS gọi API Amadeus với một khoảng thời gian, Amadeus trả về danh sách chuyến bay nằm trong khoảng đó cùng dữ liệu nối chuyến. Khoảng thời gian được phân lớp bậc thang theo các mốc T, T+1, T+2, T+3, T+4, T+15, T+16 tính theo thời gian đến thời điểm cất cánh dự kiến `[cần xác nhận: định nghĩa mốc T/T+1/T+2/T+3/T+4/T+15/T+16 và cận thời gian cụ thể của mỗi tầng]`.

Phương án tần suất cụ thể đã chốt phân thành 5 tầng theo bậc thang: (a) từ T đến T+1: quét thời gian thực (real-time); (b) từ T+1 đến T+2: quét 5 phút một lần; (c) từ T+2 đến T+3: quét 30 phút một lần; (d) từ T+4 đến T+15: quét 3 giờ một lần; (e) từ T+16 trở ra: quét 3 lần một ngày, tại các mốc 6 giờ, 12 giờ và 18 giờ theo giờ Việt Nam (có thể dịch sang 6:30, 12:30, 18:30 nếu giờ "tròn" trùng với các tải lớn khác).

Quy tắc gửi PTM về OPS++ là gửi nếu có cập nhật, không có cập nhật thì không gửi. Để biết có cập nhật hay không, TOSS phải lưu một cơ sở dữ liệu tạm về danh sách khách nối chuyến của từng chuyến và mỗi lần quét so sánh với bản đã lưu; nếu danh sách thay đổi mới gửi. Cách định danh chuyến để quét là Amadeus trả về danh sách chuyến trong khoảng thời gian (lọc theo ngày bay hoặc theo trường Inside-Dev tức là chuyến có thay đổi trong khoảng), TOSS không cần liệt kê từng chuyến.

Phía Viettel cảnh báo việc gọi liên tục 5 phút một lần với một số lượng chuyến lớn có thể vượt rate limit của Amadeus; cần kiểm tra với Amadeus và có cơ chế đo lường. Phía Viettel cũng nhắc bài học các nhà cung cấp API thường có cơ chế chống robot khi gọi quá nhiều, nên việc thử nghiệm phải có cảnh báo phía Amadeus, không tự đấm.

**Kết luận.** PTM thuộc phạm vi TOSS với phương thức "Thông qua TOSS", nguồn Amadeus. Tần suất gửi về OPS++ phân bậc thang theo 5 tầng: T→T+1 real-time; T+1→T+2 = 5 phút/lần; T+2→T+3 = 30 phút/lần; T+4→T+15 = 3 giờ/lần; từ T+16 trở ra = 3 lần/ngày (6h/12h/18h giờ VN). Hệ quả thiết kế là (a) TOSS cần cơ sở dữ liệu tạm để lưu danh sách khách nối chuyến hiện tại của từng chuyến trong cửa sổ quét, (b) cơ chế so sánh để chỉ gửi khi có cập nhật, (c) cơ chế scheduler đa tầng theo mốc T+n, (d) phải xác nhận với Amadeus về rate limit trước khi triển khai.

### II.8. PNL, ADL và Pax Detail — danh sách khách và cập nhật

**Yêu cầu.** Ba điện liên quan đến danh sách hành khách là PNL (Passenger Name List — danh sách đặt chỗ ban đầu), ADL (Addition/Deletion List — cập nhật bổ sung) và Pax Detail (chi tiết khách thực tế sau cất cánh). Cần xác định tần suất và quy tắc gửi.

**Thảo luận và đề xuất.** PNL gửi một lần duy nhất tại thời điểm bắt đầu vào cửa sổ 30 ngày trước cất cánh (T-30). Lý do là số khách đặt sớm hơn 30 ngày thường ít và không có giá trị nghiệp vụ cho điều hành; bắt đầu T-30 mới quét và issue một PNL. Anh Hiệp giải thích cơ chế như "issue cho cái clip của chuyến bay đó, sau đó cứ additional vào".

ADL gửi tiếp sau PNL với tần suất một ngày một lần cho đến sát ATD (Actual Time of Departure), cập nhật bổ sung danh sách khách so với bản đã gửi. Đến gần ngày bay (trong ngày bay), cập nhật liên tục theo nhịp khoảng 30 phút một lần. Khi quét, TOSS phải lưu danh sách khách của từng chuyến trong cơ sở dữ liệu tạm, so sánh với bản đã gửi; nếu có khách mới mới gửi ADL bổ sung, không có thay đổi thì không gửi.

Pax Detail là điện gửi sau khi chuyến bay đã cất cánh, mang thông tin khách thực tế đã lên (passengers boarded), tổng hợp ở mức chuyến bay sau khi chốt boarding. Đoạn này bản ghi có một số chỗ chưa rõ về việc Pax Detail có chứa Load Sheet đầy đủ hay không và có cần lấy từ Amadeus hay từ nguồn khác `[cần xác nhận: nguồn Pax Detail và quan hệ với Load Sheet]`.

**Kết luận.** Cả ba điện PNL, ADL, Pax Detail thuộc phạm vi TOSS với phương thức "Thông qua TOSS", nguồn Amadeus. Tần suất: PNL gửi một lần tại T-30; ADL mỗi ngày một lần đến gần ngày bay, tăng tần suất khi gần cất cánh; Pax Detail sau khi chốt boarding. Hệ quả thiết kế là TOSS cần cùng một cơ chế cơ sở dữ liệu tạm và so sánh delta như đã mô tả ở PTM (§II.7) cho cả PNL/ADL; Pax Detail là điện một lần cho mỗi chuyến sau cất cánh.

### II.9. Crew Assignment và Crew Connection — AVES, quét lịch tháng và cập nhật

**Yêu cầu.** Hai điện liên quan tổ bay là Crew Assignment (phân công tổ bay theo từng chuyến) và Crew Connection (tổ bay nối chuyến — chuyển từ chuyến này sang chuyến khác trong cùng một ngày). Nguồn cả hai là AVES. Cần xác định tần suất quét, quy tắc lấy lịch tháng và cơ chế cảnh báo khi thiếu dữ liệu.

**Thảo luận và đề xuất.** Lịch tổ bay tại VNA do một đơn vị lập lịch tổ bay (`[cần xác nhận tên đơn vị lập lịch tổ bay — báo cáo trước đó ghi "Ban Điều hành phòng" do bản ghi ASR không rõ]`) lập theo tháng, với deadline ngày 25 của tháng trước cho tháng kế tiếp; trễ tiến độ phạt nặng (chi tiết phạt được nêu cụ thể trong buổi nhưng không cần đưa vào yêu cầu hệ thống). TOSS quét initial vào 2 giờ sáng ngày 26 hàng tháng để lấy toàn bộ lịch tổ bay tháng kế tiếp. Đếm số chuyến bay trong tháng có dữ liệu tổ bay; nếu dưới 1000 chuyến có dữ liệu thì coi là chưa xong, sinh cảnh báo (mail) cho người sử dụng. Có cơ chế retry trong cùng ngày 26 nếu lần quét initial chưa đủ dữ liệu (bản ghi nhắc các mốc "6 tiếng sau chạy lại" hoặc "6 giờ sáng quét tiếp"); mốc giờ retry cụ thể chưa chốt `[cần xác nhận: mốc giờ retry trong ngày 26]`.

Sau quét initial, TOSS quét cập nhật theo cơ chế tương tự Amadeus (so sánh và gửi delta). Cần xác nhận với phía AVES về rate limit và tần suất tối đa cho phép. Một số đoạn thảo luận về việc gọi lịch tháng tiếp theo có ảnh hưởng đến tải hệ thống không, sẽ trao đổi thêm với anh Hùng (phụ trách phía AVES) `[cần xác nhận: tần suất quét cập nhật Crew Assignment]`.

Crew Connection (tổ bay nối chuyến) là yêu cầu phụ trợ: trên một chuyến bay có những phi công và tiếp viên đang bay chuyến trước, sau khi đến sẽ chuyển sang bay chuyến kế tiếp. Câu hỏi mở là phía NetLine sẽ tự tính nối chuyến từ dữ liệu phân công TOSS gửi (cô X bay chuyến A rồi chuyến B), hay TOSS phải tự tính và gửi sẵn dữ liệu nối chuyến theo định dạng riêng. Phía NetOps đang hỏi lại nội bộ, chưa có câu trả lời. Bản ghi đoạn này có nhiều chỗ không giải mã được `[cần xác nhận: ai chịu trách nhiệm tính Crew Connection, TOSS hay NetLine]`.

**Kết luận.** Crew Assignment thuộc phạm vi TOSS với phương thức "Thông qua TOSS", nguồn AVES, đã có mẫu điện. Tần suất: initial 2 giờ sáng ngày 26 hàng tháng cho tháng sau, có cơ chế retry trong cùng ngày 26 nếu lần quét initial chưa đủ dữ liệu (mốc giờ retry cụ thể chưa chốt); cập nhật theo cơ chế delta. Cảnh báo khi dưới 1000 chuyến có dữ liệu. Crew Connection vẫn ở trạng thái pending, chờ NetLine xác nhận trách nhiệm tính toán. Hệ quả thiết kế là cần một job scheduler có khả năng cấu hình lịch quét tháng + retry trong ngày, cùng module cảnh báo qua email cho người sử dụng; phần Crew Connection để mở chờ NetLine trả lời.

### II.10. Cargo, Gate, Flight Data ACDM, Fuel Report

**Yêu cầu.** Bốn luồng phụ trợ là Cargo (thông tin tải hàng), Gate Info (thông tin cửa khởi hành), Flight Data từ ACDM (các mốc thời gian theo chuẩn A-CDM), và Fuel Report (báo cáo nhiên liệu sau chuyến bay).

**Thảo luận và đề xuất.** Cargo lấy qua Cargo Spot bằng cách quét một view trên cơ sở dữ liệu của Cargo Spot; tần suất quét liên tục theo cùng nguyên tắc với Amadeus (quét và gửi khi có cập nhật). Hiện trạng tại bảng tổng hợp tích hợp là "Missing", tức là chưa có mẫu điện cụ thể.

Gate Info lấy qua API "flight status" của hệ thống VIAGS để lấy thông tin gate. Trong bảng tổng hợp tích hợp, Gate Info được liệt là phương thức "Thông qua TOSS", nguồn ghi trong bảng tích hợp là VMS, hình thức là Service, trạng thái "Missing" tức là chưa có mẫu điện cụ thể `[cần xác nhận: nghĩa đầy đủ của VMS và endpoint cụ thể của API Flight Status — bản ghi đọc "GAT lấy từ BMF" nhưng không rõ định danh đầy đủ]`.

Flight Data từ ACDM ở trạng thái pending trong bảng tổng hợp; nội dung gồm các mốc A-CDM (T-SAT, C-TOT và các mốc liên quan), nguồn ACDM, chưa có mẫu điện và chưa được làm rõ trong buổi 23/06.

Fuel Report là báo cáo nhiên liệu tổng hợp sau khi chuyến bay kết thúc. Trong bảng tổng hợp tích hợp, Fuel Report cùng nhóm với FMM về tính chất (TOSS tự sinh từ dữ liệu mình tổng hợp), khác ở chỗ FMM là điện trong quá trình bay còn Fuel Report là điện sau chuyến bay. Trạng thái và thời điểm gửi cần làm rõ thêm.

**Kết luận.** Cả bốn luồng thuộc phạm vi TOSS với phương thức "Thông qua TOSS"; Cargo nguồn Cargo Spot dùng quét DB view; Gate nguồn VMS qua API VIAGS; Flight Data nguồn ACDM còn pending; Fuel Report TOSS tự sinh. Hệ quả thiết kế là cần các connector riêng cho Cargo Spot (database query), VIAGS (REST API), và một logic tổng hợp sinh Fuel Report sau khi chuyến bay kết thúc. Riêng Flight Data ACDM tiếp tục để pending chờ làm việc tiếp.

### II.11. NOTAM — chuyển hướng từ Lido sang Quản lý bay

**Yêu cầu.** Trước buổi 23/06, NOTAM được liệt vào nhóm luồng "Trực tiếp" giữa Lido và NetLine theo phương án ban đầu. Buổi 23/06 thông báo chuyển hướng: VNA đang triển khai lấy NOTAM trực tiếp từ hệ thống của Quản lý bay (cơ quan quản lý hàng không Việt Nam), thay vì lấy qua Lido.

**Thảo luận và đề xuất.** Lý do chuyển hướng là Lido chỉ giữ NOTAM trong khoảng 48 giờ (theo công bố chính thức của Lido) hoặc 48 giờ đã clean sạch (theo phía anh Hùng), không đủ cho yêu cầu nghiệp vụ. Phía Lido cũng không có câu trả lời rõ về khả năng cung cấp NOTAM dài hạn hơn. Hệ thống của Quản lý bay đã đồng ý cho TOSS kết nối trực tiếp vào để lấy dữ liệu (bản ghi ASR đọc "DP-Link", tạm hiểu là VPN) `[cần xác nhận: loại kết nối thực tế Quản lý bay cho phép — VPN, DP-Link, hay đường truyền chuyên dụng khác]`; tuy nhiên Quản lý bay chưa chốt cho lấy dữ liệu gì và các trường/cột nào. Bạn An đang phải lấy đủ cấu trúc dữ liệu để xây dựng lại theo định dạng giống Lido cung cấp (vì phía OPS++ đang ăn theo định dạng của Lido). Cùng lúc, anh Hùng đã xin ý kiến để bạn An nói với Lufthansa Systems chuyển đổi: "tao có nguồn NOTAM mới, tao sẽ lấy từ Quản lý bay và đẩy lên theo định dạng mày yêu cầu". Phương án này khả năng phải đợi khoảng 2 năm để hoàn thiện chứ không kịp giai đoạn đầu của TOSS.

Anh Hiệp đặt câu hỏi cốt lõi: người dùng trên OPS++ quan tâm NOTAM để làm cái gì. Nếu không trả lời được, việc TOSS tích hợp một nhiệm vụ siêu phức tạp vào một hệ thống mà không rõ mục đích là không hợp lý. Câu hỏi này được ghi nhận pending để bạn An làm rõ với anh Hùng và phía điều phái.

**Kết luận.** NOTAM ban đầu là luồng "Trực tiếp" qua Lido nhưng đang chuyển hướng sang phương thức "Thông qua TOSS" với nguồn là Quản lý bay (kết nối trực tiếp; loại kết nối cụ thể — VPN hay DP-Link — chưa chốt). Trạng thái hiện tại là pending về cấu trúc dữ liệu, định dạng đẩy sang OPS++, và mục đích sử dụng phía OPS++. Hệ quả thiết kế là cần để mục NOTAM trong bảng tổng hợp tích hợp ở trạng thái "Pending — chờ Quản lý bay chốt cấu trúc + chờ làm rõ mục đích sử dụng"; chưa đưa NOTAM vào danh mục bắt buộc cho release đầu.

### II.12. Outbound từ OPS++ và chiến lược DB clone cho NetLine cũ

**Yêu cầu.** Chiều outbound từ OPS++ ra ngoài (TOSS và các hệ thống khác) là phần phức tạp nhất. Cần thống nhất phương thức lấy, cấu trúc dữ liệu, và chiến lược lấy dữ liệu khi OPS++ chưa cho phép truy vấn cơ sở dữ liệu trực tiếp.

**Thảo luận và đề xuất.** Bạn An mô tả phía OPS++ phân chia output thành hai nhóm. Nhóm thứ nhất là Event-Based, gồm các điện chủ động sinh ra khi có sự kiện (ví dụ ASM, ACH); cách lấy là OPS++ đẩy file lên SFTP theo cấu trúc thư mục đã chuẩn hóa và TOSS quét folder để lấy. Nhóm thứ hai là Request-Based, gồm các dữ liệu TOSS chủ động request qua ISB; ISB cấp API REST hoặc Web Service tương ứng. Tuy nhiên phần Request-Based vẫn chưa làm xong chi tiết, và OPS++ chỉ cho phép query phần dữ liệu cần thiết cho mục đích báo cáo (vì OPS++ trên cloud, không cho phép query toàn bộ DB do tải).

Hệ quả là TOSS không thể có đủ dữ liệu OPS++ chỉ qua ISB. Để giải bài toán, VNA đang triển khai phương án "DB Replicate" (clone): tạo một cơ sở dữ liệu trung gian (gọi tắt là Clone DB của NetLine cũ — chính là cấu trúc cơ sở dữ liệu NetLine Classic), đồng bộ data từ OPS++ về. Tuy nhiên dự án Clone DB này là một hợp đồng phụ riêng, nằm độc lập ngoài hợp đồng dự án TOSS hiện tại; tức là TOSS không thể chắc chắn sẽ có Clone DB kịp tiến độ.

Để giảm rủi ro phụ thuộc, anh Hiệp đề xuất chiến lược như sau. Bước một là TOSS xây dựng một DB nội bộ có cấu trúc bảng giống NetLine Classic (DB cũ của NetLine Classic). Bước hai là TOSS dùng Event-Based qua ISB để fill dữ liệu vào DB này (mỗi event đến từ OPS++ qua ISB cập nhật vào bảng tương ứng). Bước ba là TOSS truy vấn lên DB nội bộ này để phục vụ mọi nghiệp vụ của TOSS. Khi Clone DB chính thức hình thành (do hợp đồng phụ kia hoàn thành), TOSS chỉ cần switch connection từ DB nội bộ sang Clone DB — vì cấu trúc bảng đã đồng nhất, không phải sửa logic truy vấn.

Chị Lê đặt vấn đề về tính tương đồng giữa DB nội bộ của TOSS và Clone DB: không phải tương tự mà phải là exactly. Anh Hiệp đề nghị phải so sánh chính xác bảng nào giống bảng nào khác trước khi triển khai. Bạn An xác nhận hiện trạng phải sống bằng DB nội bộ của TOSS cho đến khi Clone DB sẵn sàng, vì Clone DB không thuộc dự án TOSS. Một số đoạn liên quan đến mô hình data structure, mapping API và DB replicate trong phần này bản ghi có nhiều chỗ chưa rõ `[cần xác nhận: bảng nào của NetLine Classic là exactly bảng nào trong Clone DB; cơ chế đồng bộ Event-Based vào DB nội bộ]`.

**Kết luận.** Outbound từ OPS++ chia hai nhóm Event-Based (qua SFTP) và Request-Based (qua ISB API). Vì OPS++ chỉ cho query một phần qua ISB, TOSS xây dựng một DB nội bộ có cấu trúc bảng giống NetLine Classic, dùng Event-Based để fill dữ liệu; khi Clone DB chính thức của VNA hoàn thành, TOSS chỉ switch connection. Hệ quả thiết kế là kiến trúc DB nội bộ TOSS phải tách lớp truy vấn (data access layer) ra khỏi logic nghiệp vụ để có thể switch connection sau này không phải sửa code; danh sách bảng cần fill phải so sánh chính xác (không phải tương tự) với cấu trúc NetLine Classic.

---

## III. Các nội dung đã thống nhất

| Số | Nội dung |
|---|---|
| 1 | NetOps không yêu cầu TOSS lưu trữ dữ liệu cho NetLine; TOSS chuyển sang ISB, NetLine kéo về lưu phía nó. TOSS tự quyết định lưu gì cho nghiệp vụ TOSS. |
| 2 | Phạm vi TOSS chốt là **17 luồng inbound và 2 luồng outbound thuộc phạm vi TOSS (Thông qua TOSS)** theo bảng tổng hợp tích hợp phiên bản 23/06/2026; các luồng "Trực tiếp" (Lido, AMOS → NetLine/OPS++) nằm ngoài phạm vi. |
| 3 | Bốn điện MVT, MVA, DIV, LDM dùng kênh kép SITA và email trong giai đoạn chuyển tiếp; chạy song song để đối chiếu rồi tắt SITA khi email ổn định. |
| 4 | Quy tắc kênh là "có hiệu lực / không hiệu lực" theo từng sân bay và theo giai đoạn, không phải primary/secondary đồng thời. |
| 5 | DIV phát từ cả tàu bay (đi theo kênh MVA) và sân bay (đi theo kênh MVT), không chỉ từ sân bay như nhầm tưởng ban đầu. |
| 6 | Trong giai đoạn quá độ, TOSS kết nối vào ổ đĩa chia sẻ HDQONVN giữa máy SITA và máy NetLine để lấy điện văn; sau go-live NetLine mới chỉ còn email. |
| 7 | Tạo một địa chỉ email trung gian (ví dụ netline@...) nhận tất cả các loại điện MVT/MVA/DIV/LDM và sau này thêm các điện khác. |
| 8 | PTM quét theo cửa sổ thời gian phân bậc thang 5 tầng: T→T+1 real-time; T+1→T+2 = 5 phút/lần; T+2→T+3 = 30 phút/lần; T+4→T+15 = 3 giờ/lần; từ T+16 trở ra = 3 lần/ngày (6h/12h/18h giờ VN); chỉ gửi khi có cập nhật. |
| 9 | PNL gửi một lần tại T-30; ADL mỗi ngày một lần đến gần ngày bay, tăng tần suất khi gần cất cánh. |
| 10 | Crew Assignment quét initial 2 giờ sáng ngày 26 hàng tháng cho tháng kế tiếp, có cơ chế retry trong cùng ngày 26 nếu lần quét initial chưa đủ dữ liệu (mốc giờ retry cụ thể chưa chốt); cảnh báo qua mail khi dưới 1000 chuyến có dữ liệu. |
| 11 | SSIM forward 2 chiều giữa Sabre và OPS++ qua SFTP; nếu Sabre dùng định dạng khác chuẩn IATA thì việc chế biến nên thuộc ISB chứ không phải TOSS. |
| 12 | Outbound từ OPS++ chia hai nhóm: Event-Based (qua SFTP) và Request-Based (qua ISB API); OPS++ trên cloud không cho query toàn bộ DB. |
| 13 | TOSS xây dựng DB nội bộ có cấu trúc giống NetLine Classic, fill bằng Event-Based; khi Clone DB của VNA hoàn thành, TOSS chỉ switch connection. |
| 14 | NOTAM chuyển hướng từ Lido sang lấy qua TOSS từ Quản lý bay (kết nối trực tiếp; loại kết nối VPN/DP-Link chưa chốt); chưa chốt cấu trúc dữ liệu và mục đích sử dụng phía OPS++. |
| 15 | Cargo lấy qua view DB của Cargo Spot; Gate Info lấy qua API Flight Status của VIAGS, nguồn ghi trong bảng tích hợp là VMS (nghĩa đầy đủ chưa xác nhận). |
| 16 | Việc đối chiếu hai kênh SITA và email trong giai đoạn chuyển tiếp thuộc trách nhiệm tổ triển khai, có thể làm thủ công, không bắt buộc TOSS có chức năng so sánh chính thức. |

---

## IV. Các nội dung cần làm rõ

| Số | Nội dung |
|---|---|
| 1 | Quy tắc sinh điện FMM (Fuel Monitoring Message): định dạng điện, thời điểm gửi cụ thể (block-off hay khi nào khác), nguồn dữ liệu nhiên liệu (Skypec / FIMS / phiếu dầu), đơn vị nạp dầu nào là bắt buộc trong dữ liệu nguồn. |
| 2 | Routing trung gian từ máy chủ Sitatex (HDQONVN) vào NetLine cũ — hiện chưa xác định là routing nào. |
| 3 | Cách kết nối TOSS vào ổ đĩa chia sẻ giữa máy SITA và máy NetLine (LTV, share-write hay share-read) — cần khảo sát hạ tầng. |
| 4 | Định dạng tệp SSIM mà Sabre đang dùng — chuẩn IATA hay biến thể của NetLine Classic — và ai chịu trách nhiệm chế biến nếu khác chuẩn. |
| 5 | Rate limit Amadeus cho phép quét 5 phút một lần cho cửa sổ 48 giờ — cần xác nhận với Amadeus trước khi triển khai. |
| 6 | Tần suất quét cập nhật Crew Assignment sau khi đã có lịch tháng — đoạn này bản ghi không rõ. |
| 7 | Crew Connection (tổ bay nối chuyến): NetLine tự tính từ dữ liệu phân công TOSS gửi, hay TOSS phải tự tính và gửi theo định dạng riêng — chờ NetOps trả lời nội bộ. |
| 8 | Nguồn Pax Detail và quan hệ với Load Sheet — đoạn bản ghi chưa rõ Pax Detail có chứa Load Sheet đầy đủ không. |
| 9 | NOTAM lấy từ Quản lý bay: cấu trúc dữ liệu cụ thể, các trường/cột Quản lý bay sẽ cho phép lấy. |
| 10 | NOTAM phía OPS++: mục đích sử dụng cụ thể trên màn hình OPS++ — chờ anh Hùng và phía điều phái làm rõ. |
| 11 | Flight Data từ ACDM: nội dung mẫu điện và phương thức truyền — pending từ bảng tổng hợp tích hợp. |
| 12 | Cách so sánh chính xác (exactly) bảng nào của NetLine Classic ứng với bảng nào trong Clone DB của VNA — cần một đợt phân tích so sánh schema riêng. |
| 13 | Cơ chế đồng bộ Event-Based vào DB nội bộ TOSS: tần suất, độ trễ, xử lý event đến không thứ tự, xử lý event bị mất. |
| 14 | Cargo Spot: TOSS quét trực tiếp DB view của Cargo Spot hay phải qua một bản nhân bản trung gian; quy tắc rate-limit. |
| 15 | Các đoạn bản ghi ASR nhiễu nặng không giải mã được, gồm: đoạn quanh phút 19:00–19:30 (lặp "tí" rất dài); đoạn quanh phút 24:43–25:14 (lặp "mở"); đoạn 33:18–34:21 (thảo luận sample điện không rõ); đoạn 49:02–50:02 (thảo luận tốc độ đọc và sample); đoạn 55:59–56:28 (lặp "chứ không phải"); đoạn 57:55–58:21 (lặp "tên"); đoạn 58:55–59:27 (thảo luận về mở Web/code); đoạn 1:04:40–1:04:57 (cách Amadeus lọc khoảng thời gian); đoạn 1:08:00–1:09:22 (lặp "ông khách này"); đoạn 1:13:12–1:13:29 (thảo luận về T-30); đoạn 1:14:24–1:14:51 (đấm thử Amadeus); đoạn 1:17:27–1:17:58 (thảo luận về fact say và Load Sheet); đoạn 1:18:17–1:18:42 (Covin/Comment); đoạn 1:19:23–1:19:52 (gửi sau chuyến bay); đoạn 1:21:19–1:22:09 (rank tiếp viên); đoạn 1:22:46–1:23:18 (free text, dữ liệu dài, Lido chuẩn); đoạn 1:25:30–1:25:57 (lọc gửi mail); đoạn 1:30:22–1:30:51 (giờ quét và cảnh báo); đoạn 1:33:16–1:34:14 (lặp "cho"); đoạn 1:35:14–1:35:43 (tần suất T+1/T+2…); đoạn 1:40:13–1:41:33 (thảo luận decode tổ bay); đoạn 1:48:25–1:49:31 (Cargo và View DB); đoạn 1:55:42–2:00:26 (DB Clone và đồng bộ — bản chất rõ, chi tiết thiếu); đoạn 2:01:24–2:03:00 (so sánh exactly bảng). Cần BA Lead nghe lại bản gốc để giải mã. |
| 16 | Định nghĩa các mốc T/T+1/T+2/T+3/T+4/T+15/T+16 trong cơ chế quét PTM — cận thời gian cụ thể của mỗi tầng (PTM §II.7). |
| 17 | Tên đơn vị lập lịch tổ bay tại VNA — báo cáo trước đó ghi "Ban Điều hành phòng" do bản ghi ASR không rõ; cần xác nhận tên chính thức (Crew Assignment §II.9). |
| 18 | Mốc giờ retry trong ngày 26 cho Crew Assignment khi lần quét initial chưa đủ dữ liệu (§II.9). |
| 19 | Nghĩa đầy đủ của ký hiệu "VMS" trong bảng tích hợp 23/06/2026 (cột Nguồn của Gate Info) và endpoint API Flight Status của VIAGS (§II.10 + §V). |
| 20 | Loại kết nối Quản lý bay cho phép TOSS lấy NOTAM — VPN, DP-Link, hay đường truyền chuyên dụng khác (bản ghi ASR đọc "DP-Link", §II.11). |
| 21 | Sân bay nào hiện chỉ dùng email và không phát MVT qua SITA — bản ghi ASR đọc "size", tạm hiểu là SGN/Sài Gòn (§II.3). |
| 22 | Ba nguồn vào Sabre — TOSS chế biến từ ASM/ACH, ASM gốc NetLine, và đường thứ ba (bản ghi không rõ, có thể là Lido) — cần xác nhận đường thứ ba (§II.6). |
| 23 | Thuật ngữ "phim" trong bản ghi (đoạn liên quan dữ liệu chuyến bay) có phải là FIMS hay không — cần BA Lead nghe lại bản gốc. |
| 24 | Người trao đổi với đơn vị nạp dầu (Skypec và các nhà cung cấp khác) — báo cáo gán "anh Hùng" do bản ghi ASR nhiễu; cần xác nhận đúng người phụ trách (§II.5). |

---

## V. Thuật ngữ đề xuất bổ sung vào toss-glossary-v0.1.md (chờ BA Lead xác nhận)

| Thuật ngữ | Đề xuất tiếng Việt | Đề xuất mô tả trong TOSS |
|---|---|---|
| **ISB** (Integration Service Bus) | Trục tích hợp dịch vụ của NetLine | Adapter của NetLine/OPS++ do Lufthansa Systems cung cấp; chịu trách nhiệm xử lý mọi input và output giữa OPS++ với các hệ thống bên ngoài (TOSS, Sabre, AMADEUS…). Hỗ trợ nhiều giao thức (API REST, Web Service, Queue, FTP). Bản ghi ASR thường đọc là "ASV" hoặc "Interprint Service Bus". |
| **PTM** (Passenger Transfer Message) | Điện thông tin khách nối chuyến | Điện văn ngành mô tả danh sách khách từ một chuyến bay đến nối sang một hoặc nhiều chuyến bay khác của cùng hãng. Nguồn từ Amadeus PSS. TOSS quét cửa sổ 48 giờ trước cất cánh, 5 phút/lần, gửi sang OPS++ khi có cập nhật. |
| **PNL** (Passenger Name List) | Danh sách hành khách đặt chỗ ban đầu | Điện văn ngành chứa danh sách khách đã đặt chỗ cho một chuyến bay. TOSS gửi một lần tại thời điểm 30 ngày trước cất cánh (T-30). |
| **ADL** (Addition/Deletion List) | Danh sách cập nhật khách bổ sung | Điện văn ngành cập nhật danh sách khách so với PNL ban đầu. TOSS gửi mỗi ngày một lần đến gần ngày bay; trong ngày bay tăng tần suất theo nhịp khoảng 30 phút một lần. |
| **FMM** (Fuel Monitoring Message) | Điện theo dõi nhiên liệu | Điện ngành liên quan đến dữ liệu nhiên liệu; trong dự án TOSS, không có nguồn sẵn nên TOSS phải tự generate từ dữ liệu tổng hợp. Thời điểm gửi, nguồn dữ liệu và định dạng đang pending. |
| **Fuel Report** | Báo cáo nhiên liệu sau chuyến bay | Báo cáo tổng hợp nhiên liệu đã tiêu thụ và các thông tin liên quan, sinh ra một lần sau khi chuyến bay kết thúc. Trong TOSS, do TOSS tự sinh tương tự FMM nhưng vào thời điểm khác. |
| **PTM/PNL/ADL** chung | Bộ ba điện danh sách khách Amadeus | Bộ ba điện liên quan đến danh sách khách (booking → nối chuyến → cập nhật) cùng nguồn Amadeus PSS, dùng chung cơ chế cơ sở dữ liệu tạm và quét delta. |
| **NetLine Classic** | NetLine Classic (phiên bản cũ) | Phiên bản NetLine hiện đang chạy của VNA trước khi chuyển sang OPS++ trên cloud; có cơ sở dữ liệu nội bộ truy vấn được trực tiếp. Cấu trúc bảng của NetLine Classic là tham chiếu cho Clone DB và DB nội bộ TOSS. |
| **OPS++ (NetLine Flight Ops++)** | OPS++ — NetLine Flight Ops++ | Phiên bản mới của NetLine do Lufthansa Systems cung cấp, đặt trên hạ tầng đám mây của LHS; không có cơ sở dữ liệu nội bộ cho phép truy vấn trực tiếp, mọi tích hợp đi qua ISB. Đã có trong glossary v0.22 nhưng cần bổ sung mô tả về cloud-hosted. |
| **Clone DB** | Bản nhân bản cơ sở dữ liệu NetLine | Cơ sở dữ liệu trung gian của VNA (hợp đồng phụ tách riêng dự án TOSS) nhân bản dữ liệu từ OPS++ về, có cấu trúc bảng tương đương NetLine Classic, để các hệ thống nội bộ VNA (gồm TOSS) truy vấn thay cho việc query trực tiếp OPS++. |
| **Event-Based output** | Đầu ra theo sự kiện (Event-Based) | Nhóm output từ OPS++ phát theo sự kiện (ví dụ ASM, ACH); OPS++ chủ động đẩy file lên SFTP, TOSS quét folder để lấy. |
| **Request-Based output** | Đầu ra theo yêu cầu (Request-Based) | Nhóm output từ OPS++ mà TOSS chủ động request qua API REST hoặc Web Service của ISB. |
| **VIAGS Flight Status API** | API trạng thái chuyến VIAGS | API của hệ thống VIAGS (Vietnam Airlines Ground Services) cung cấp trạng thái chuyến bay và thông tin gate; TOSS gọi để lấy Gate Info. Trong bảng tích hợp 23/06/2026, cột Nguồn ghi là "VMS" — nghĩa đầy đủ của ký hiệu VMS chưa được xác nhận `[cần xác nhận]`. |
| **Crew Connection** | Tổ bay nối chuyến | Thông tin các phi công và tiếp viên kết nối giữa các chuyến bay trong cùng một ngày (sau khi đáp chuyến A sẽ bay tiếp chuyến B). Nguồn AVES. Trách nhiệm tính toán (TOSS hay NetLine) chưa chốt. |
| **HDQONVN / HDQONVM** | Địa chỉ điện SITA của VNA | Địa chỉ SITA của VNA dùng để nhận các điện ACARS/MVA. TOSS sẽ đăng ký nhận song song qua địa chỉ này trong giai đoạn quá độ. (Lưu ý: bản ghi ASR có chỗ đọc nhầm là HDQONVM.) |

---

> **Ghi chú dành riêng cho bước hậu xử lý (không gửi khách hàng).** Báo cáo này KHÔNG cập nhật OID hoặc glossary trực tiếp; các điểm trong §IV cần được đưa vào sổ OID-TOSS-001 ở bước rà soát điểm cần chốt sau meeting; các thuật ngữ trong §V cần được BA Lead duyệt trước khi ghi vào `toss-glossary-v0.1.md`.
