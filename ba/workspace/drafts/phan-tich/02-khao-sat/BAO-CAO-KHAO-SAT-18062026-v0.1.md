---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-22"
survey_date: "2026-06-18"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — CLC & Điều phái buổi sáng+chiều 18/06/2026"
---

# Báo cáo Khảo sát ngày 18/06/2026 — Centralized Load Control (CLC) và Điều phái bay

## I. Thông tin chung

Buổi khảo sát ngày 18/06/2026 gồm hai phiên làm việc liên tục trong cùng một ngày, kéo dài cả sáng và chiều. Đối tượng khảo sát là đại diện bộ phận Centralized Load Control (CLC) và đại diện bộ phận Điều phái bay (Dispatcher) của hãng hàng không, cùng với đội phát triển TOSS. Mục đích của buổi làm việc là làm rõ thiết kế chi tiết của màn Monitoring (giám sát chuyến bay) trong phân hệ Điều phái, bao gồm bố cục và quy ước hiển thị, cơ chế cảnh báo theo từng nhóm thông tin (tải trọng, nhiên liệu, tài liệu chuyến bay, tổ bay, MEL/CDL, ATC FPL, thời tiết), mô hình tham số cảnh báo theo mốc thời gian và điều kiện sáng nút Dispatch Release. Phạm vi thảo luận tập trung vào màn Monitoring và các tab quản lý tham số có liên quan trong phân hệ Quản lý chặng bay; không đi sâu vào các phân hệ khác trong khuôn khổ buổi 18/06.

> **Cảnh báo chất lượng ASR:** Bản ghi tự động có nhiều đoạn lặp ký tự và nhiễu thuật ngữ (AMOS thường bị phiên thành Amos/Hamos, OFP thành OIP, Lido thành IDO/Lê Lê, NOTAM thành Notam/lô tam, DSP thành điều phái, CLC nhận diện ổn, DAO/DOW giữ nguyên nhưng có chỗ thành "đào"); các đoạn ASR chưa rõ được giữ nguyên kèm cờ [cần xác nhận].

## II. Nội dung thảo luận theo chủ đề

### 1. Màn Monitoring — bố cục, quy ước hiển thị và bộ lọc mặc định (buổi sáng)

**Yêu cầu.** Bộ phận Điều phái mong muốn màn Monitoring giúp họ "lia mắt một phát" là nhận ra chuyến nào cần xử lý; những chuyến bình thường hoặc chưa tới giờ phải làm thì cần ẩn đi để không gây nhiễu (sáng 00:00–00:46). Đồng thời, người dùng cần được phép ẩn hoặc hiện cột, ẩn hoặc hiện dòng, và lưu lại cấu hình hiển thị riêng cho từng người (sáng 01:13–01:38).

**Thảo luận và Đề xuất.** Hai bên thống nhất bộ lọc mặc định khi mở màn là chỉ hiển thị các chuyến bất thường, đồng thời vẫn cung cấp các bộ lọc khác như "normal và bất thường", "tất cả" để người dùng tự chọn (sáng 00:46–01:13). Quy ước hiển thị được thống nhất gồm ba màu đỏ, vàng, xanh; với hàm ý "đỏ là nặng nhất, vàng là chấp chới, xanh là ổn" (sáng 26:10–26:40). Trạng thái bình thường (không có gì để cảnh báo) hiển thị bằng dấu gạch ngang hoặc để trắng (sáng 26:41–27:37). Khi di chuột (hover) lên một dòng, dòng đó được làm sáng nhẹ để nhận diện hàng đang xem; click vào dòng mới mở chi tiết và làm sáng đậm hơn (sáng 28:37–29:27). Bộ phận điều phái xác nhận không cần phát âm thanh khi có cảnh báo; trường hợp cảnh báo lớn có thể cho hiệu ứng nháy (blink) trên màn hình để gây chú ý (chiều 53:42–54:15).

**Kết luận.** Màn Monitoring vận hành với bộ lọc mặc định chỉ hiện chuyến bất thường, hỗ trợ ẩn/hiện cột và dòng, lưu cấu hình theo người dùng; quy ước màu cảnh báo và quy ước "bình thường = gạch ngang/blank" được áp dụng đồng nhất trên toàn bộ các cột cảnh báo của màn.

### 2. Nút Dispatch Release — điều kiện sáng nút và phạm vi cảnh báo chặn (buổi sáng + chiều)

**Yêu cầu.** Nút Dispatch Release cần được kiểm soát chặt chẽ để chỉ "sáng lên" khi chuyến bay đủ điều kiện phát hành (sáng 01:38–02:06). Đây là chốt chặn cuối trước khi MO Plus cho phép phi công thực hiện Flight Release [YCKT sheet-04 §305 Dispatch Release].

**Thảo luận và Đề xuất.** Hai bên thống nhất nút Dispatch Release chỉ sáng khi đến giờ thực hiện, đã đủ tài liệu chuyến bay, và mọi thông tin so khớp đều hiển thị xanh (sáng 02:06–02:28). Tuy nhiên không phải mọi cảnh báo đều chặn release; chỉ chọn ra một vài cảnh báo nghiêm trọng để chặn (chiều 01:14:34–01:14:58). Các điều kiện tối thiểu bắt buộc xanh trước khi cho phép release gồm tàu bay phải khớp, không còn cảnh báo về ETD vượt quá ba mươi phút (nếu ATD trên ba mươi phút phải chạy lại OFP), tổ bay phải đúng theo OFP, và Pilot Confirm đã được phi công xác nhận (chiều 01:14:58–01:15:31, chiều 01:26:24–01:26:46). Về sau, dự án sẽ bổ sung quy tắc (rule) cấu hình cảnh báo nào là cảnh báo chặn release theo thực tế vận hành (chiều 01:14:19–01:14:34).

**Kết luận.** Cơ chế bật/tắt nút Dispatch Release dựa trên kiểm tra đa điều kiện (đến giờ, đủ tài liệu, các trường thông tin so khớp xanh) và chỉ một tập con các cảnh báo nghiêm trọng được dùng làm điều kiện chặn; tập con này sẽ được tinh chỉnh sau khi đưa vào khai thác thực tế.

### 3. Mô hình tham số cảnh báo theo hai mức thời gian và phân biệt nội địa/quốc tế (buổi sáng)

**Yêu cầu.** Bộ phận Điều phái cần một mô hình tham số cảnh báo thống nhất giữa các nhóm thông tin (OFP, Payload, DAO, Tài liệu, Tổ bay, Thời tiết) để dễ quản lý và bảo trì (sáng 42:12–42:40).

**Thảo luận và Đề xuất.** Mô hình hai mức cảnh báo theo thời gian được thống nhất gồm mức 1 (vàng) bắt đầu ở mốc bảy mươi lăm phút trước giờ khởi hành đối với chuyến quốc nội và mốc chín mươi phút đối với chuyến quốc tế, mức 2 (đỏ) bắt đầu ở mốc sáu mươi phút trước giờ khởi hành đối với chuyến quốc nội và mốc bảy mươi lăm phút đối với chuyến quốc tế (sáng 30:02–30:52, chiều 56:30–57:32). Trước mốc cảnh báo lần đầu (vàng), nếu có lệch thì giữ trạng thái bình thường (gạch ngang) và không hiển thị cảnh báo (sáng 31:23–31:48). Sau khi đã cảnh báo đỏ, nếu có OFP mới hoặc dữ liệu cập nhật làm cho giá trị quay về dưới ngưỡng thì trạng thái chuyển về xanh; nếu chưa có thao tác nào của điều phái và CLC tiếp tục gửi điện cập nhật làm dữ liệu khớp lại, hệ thống cũng chuyển trạng thái về xanh do bản chất điều phái chưa có "lưu vết" thao tác (sáng 37:31–38:10). Các mức thời gian này áp dụng chung cho nhóm cảnh báo OFP/OFP revision, Payload, DAO, Tài liệu chuyến bay, Tổ bay; với mỗi nhóm có thể tách ra cặp tham số quốc nội/quốc tế riêng (sáng 42:40–43:03).

**Kết luận.** Mô hình tham số cảnh báo gồm hai mức thời gian (vàng và đỏ), mỗi mức có cặp tham số quốc nội/quốc tế (75/90 cho mức vàng, 60/75 cho mức đỏ); tham số được quản lý linh hoạt cho phép người dùng cập nhật khi có thay đổi [YCKT sheet-04 TOSS-175 / TOSS-177].

### 4. Cảnh báo tải trọng (Payload và ZFW) — có ngưỡng theo chặng × tàu (buổi sáng)

**Yêu cầu.** Khi CLC ước tính tải (estimate payload) và gửi qua điện hoặc qua email tới phân hệ điều phái, hệ thống phải so sánh với Payload trong OFP đã ban hành để cảnh báo nếu sai lệch vượt ngưỡng (sáng 11:22–12:21).

**Thảo luận và Đề xuất.** Ngưỡng lệch Payload được phân chia theo chặng bay và theo loại tàu bay (ví dụ A320, A321, A350, B787); mỗi cặp (chặng × tàu) có ngưỡng dương và ngưỡng âm tách biệt, cho phép dung sai tăng và giảm khác nhau (sáng 19:01–19:52). Ngưỡng có thể áp dụng theo thời gian hiệu lực (sáng 13:40–14:07). Vị trí khai báo và quản lý ngưỡng Payload nằm trong phân hệ Quản lý chặng bay dưới dạng tab "Ngưỡng Payload" (sáng 45:02–45:35). Khi vượt ngưỡng, hệ thống hiển thị số lệch (âm hoặc dương) tại ô tương ứng cùng với màu cảnh báo theo mốc thời gian; khi click vào dòng sẽ xem chi tiết gồm số OFP, số CLC và thời điểm cập nhật của từng bên (sáng 12:52–13:18, sáng 22:47–23:14). Hai bên cũng thống nhất cảnh báo Payload áp dụng cho cả màn tài liệu DSP (briefing) [YCKT sheet-04 §251 Cảnh báo ZFW ngoài giới hạn].

**Kết luận.** Cảnh báo Payload hoạt động trên cơ chế ngưỡng theo chặng × loại tàu × ngưỡng âm/dương × thời điểm hiệu lực; hiển thị số lệch tại ô cảnh báo và màu theo mốc thời gian (xem chủ đề 3) [YCKT sheet-04 TOSS-173].

### 5. Cảnh báo DAO/DOW — không có ngưỡng, lệch là cảnh báo, nguồn từ FOEM (buổi sáng)

**Yêu cầu.** Bộ phận Điều phái yêu cầu cảnh báo lệch DAO (Dry Operating Adjustment) giữa OFP và Actual DAO do CLC gửi, vì DAO ảnh hưởng trực tiếp đến tính toán nhiên liệu và tải khai thác (sáng 53:40–54:38).

**Thảo luận và Đề xuất.** Khác với Payload, DAO không có ngưỡng dung sai; nguyên tắc là "lệch là cảnh báo" (sáng 51:30–52:11). Tuy nhiên, để hệ thống linh hoạt, hai bên đồng ý tạm thời vẫn cho khai báo ngưỡng DAO với giá trị mặc định bằng không, để sau này có thể tinh chỉnh theo thực tế (sáng 52:11–52:35). Nguồn DAO chuẩn được lấy từ FOEM (Flight Ops Engineering, đơn vị cấp bảng DOW), thay cho cách hiện tại đang dùng file DOW cố định qua Adapter [YCKT sheet-06 §42 FOEM]. Hiện DAO chuẩn chỉ có trong tài liệu AFM/AM của FOE; dữ liệu DAO phụ thuộc nhiều yếu tố gồm loại tàu, chặng bay, số lượng tổ bay, số lượng tiếp viên và số lượng khách (sáng 46:11–47:21). Vị trí quản lý ngưỡng DAO nằm trong phân hệ Quản lý chặng bay dưới dạng tab "Ngưỡng DAO", song song với tab "Ngưỡng Payload" (sáng 52:35–53:15).

**Kết luận.** Cảnh báo DAO áp dụng quy tắc "lệch là cảnh báo", có khả năng khai báo ngưỡng linh hoạt với mặc định bằng không; nguồn DAO chuẩn lấy từ FOEM, có cơ chế fallback dùng file DOW cố định khi FOEM chưa sẵn sàng.

### 6. Cảnh báo tài liệu chuyến bay (Fly Doc) — NOTAM, thời tiết, Plotting và Icing chart (buổi chiều)

**Yêu cầu.** Hệ thống cần cảnh báo khi tài liệu chuyến bay chưa được tải lên đầy đủ trước thời điểm Dispatch Release (chiều 06:01–06:48).

**Thảo luận và Đề xuất.** Mọi chuyến bay đều phải có hai loại tài liệu cơ bản là NOTAM và thời tiết (Weather); riêng chuyến EDTO (Extended Diversion Time Operations) phải có thêm hai tài liệu là Plotting chart và Icing chart (chiều 10:49–13:18, chiều 15:22–16:01). Cơ chế nhận diện tài liệu dựa trên chuỗi ký tự trong tên file đã upload (chứa từ "plotting" và "icing"); dự án sẽ thống nhất quy ước đặt tên file qua trao đổi sau (chiều 18:12–18:53, chiều 13:18–13:49). Cảnh báo cột "Fly Doc" hiển thị thiếu một trong hai tài liệu (chuyến thường) hoặc một trong các tài liệu (chuyến EDTO); người dùng phải biết được cụ thể tài liệu nào đang thiếu (chiều 16:57–17:28). Mốc thời gian cảnh báo dùng chung mô hình hai mức (vàng tại mốc 75/90, đỏ tại mốc 60/75) như đã thống nhất ở chủ đề 3. Nếu thiếu tài liệu thì không cho phép Dispatch Release (chiều 17:28–18:12).

**Kết luận.** Cảnh báo Fly Doc kiểm tra sự hiện diện của NOTAM và Weather cho mọi chuyến, kiểm tra thêm Plotting và Icing cho chuyến EDTO; thiếu tài liệu sẽ chặn Dispatch Release.

### 7. Cảnh báo tổ bay — Crew Download, đổi tổ (Crew CHG), OFP rỗng tổ bay, matching PIC (buổi chiều)

**Yêu cầu.** Bộ phận Điều phái cần ba lớp cảnh báo về tổ bay gồm: tổ bay đã tải tài liệu hay chưa (chỉ kiểm tra PIC), có thay đổi tổ bay (Crew Change) hay không, và OFP có rỗng tổ bay (do AVES lỗi) hay không (chiều 19:50–20:53, chiều 01:00:16–01:02:18).

**Thảo luận và Đề xuất.** Cảnh báo Crew Download chỉ áp dụng cho PIC, vì chỉ cần PIC tải tài liệu là đủ điều kiện cho phép Flight Release; cảnh báo này hiển thị qua cột "Crew Download" trên màn Monitoring (chiều 20:21–20:53). Cảnh báo Crew CHG được đặt sau cột ATC và trước cột Payload trên thứ tự cột Monitoring (chiều 01:00:16–01:00:41). Trường hợp OFP rỗng tổ bay xảy ra khi hệ thống AVES bị lỗi không trả tổ bay sang OFP; khi đó hệ thống cảnh báo đỏ tại cột tổ bay theo mốc thời gian (chiều 01:01:13–01:01:30, chiều 01:04:14–01:04:39). Thuật toán matching PIC giữa OFP và AVES sử dụng so chuỗi (string matching) theo tỷ lệ phần trăm khớp; để tăng độ chính xác, Adapter sẽ ghép group code vào sau tên crew theo cấu trúc mặc định gồm mười sáu ký tự dành cho tên cộng bốn ký tự dành cho group code, tổng cộng giới hạn hai mươi ký tự do API Lido áp đặt (chiều 01:07:55–01:09:14, chiều 01:09:14–01:09:38). Phương án thay đổi cấu trúc trường dữ liệu trong file FPX gửi ATC vẫn đang chờ ý kiến của lãnh đạo dự án (chiều 01:09:38–01:10:07) [cần xác nhận].

**Kết luận.** Cảnh báo tổ bay gồm ba thành phần — Crew Download (chỉ PIC), Crew CHG (đổi tổ), OFP rỗng tổ bay — và thuật toán matching PIC dựa trên so chuỗi cộng group code; phương án nới giới hạn hai mươi ký tự của Adapter Lido cần được lãnh đạo dự án xem xét.

### 8. Cảnh báo MEL/CDL — đối chiếu ba lớp AMOS → danh mục FOE → OFP (buổi chiều)

**Yêu cầu.** Hệ thống phải cảnh báo khi giữa AMOS, danh mục MEL đã lọc của FOE trên Lido, và MEL đang có trong OFP có sự khác biệt về số lượng và mã item (chiều 34:01–35:30).

**Thảo luận và Đề xuất.** FOE duy trì một danh mục MEL chỉ chứa các MEL có ảnh hưởng đến khai thác (ảnh hưởng wind, fly level, fuel factor); danh mục này được upload lên Lido (chiều 34:25–34:59). Từ AMOS, dữ liệu MEL được lọc tại nguồn bằng truy vấn SQL theo trường phân loại (ảnh hưởng performance hay không) trước khi gửi sang Lido (chiều 44:13–44:48). Cảnh báo MEL/CDL hoạt động theo ba lớp: (1) lấy danh sách MEL của tàu từ AMOS cho chuyến đang xét, (2) lọc lại theo danh mục MEL trên Lido của FOE để có shortlist, (3) so sánh shortlist với danh mục MEL trong OFP do điều phái lập (chiều 47:54–48:54). Quy tắc cảnh báo: nếu OFP thiếu MEL so với shortlist thì cảnh báo đỏ; nếu OFP có dư MEL ngoài shortlist (do điều phái thêm tay) thì cũng cảnh báo, đồng thời có thể là do FOE chưa cập nhật danh mục dẫn đến thiếu — trường hợp này điều phái phản hồi để FOE bổ sung (chiều 48:54–49:39, chiều 49:39–50:07). Số lượng MEL và mã MEL phải khớp hai chiều; chỉ khớp số lượng mà sai mã cũng cảnh báo (chiều 50:07–50:38). Để xem riêng MEL theo tàu (không theo chuyến), người dùng truy cập tab "MEL/CDL" trong phân hệ Quản lý tàu bay (chiều 50:38–51:21) [YCKT sheet-04 TOSS-128 đến TOSS-135].

**Kết luận.** Cảnh báo MEL/CDL chạy quy trình ba lớp AMOS → shortlist FOE trên Lido → OFP; cảnh báo thiếu, thừa, sai mã đều được kích hoạt; tra cứu MEL theo tàu bay nằm ở phân hệ Quản lý tàu bay.

### 9. Cảnh báo ATC FPL — so khớp Filed ATC và ATC FPL trong OFP, xử lý cập nhật một phần (buổi chiều)

**Yêu cầu.** Cảnh báo phát hiện sai lệch giữa ATC FPL trong OFP và file ATC đã filed (Filed ATC) qua điện ATC (chiều 23:47–24:48) [YCKT sheet-04 §303 Cảnh báo màu sai lệch giữa ATC FPL trong OFP và filed ATC].

**Thảo luận và Đề xuất.** Hệ thống bóc tách ra năm thành phần cần cảnh báo trong file ATC (chiều 30:48–31:18). Cảnh báo phát sinh ngay khi có lệch (không chờ mốc thời gian như nhóm Payload/DAO) (chiều 24:50–25:18, chiều 27:16–28:01). Khi nhận điện cập nhật từ ATC, hệ thống phải xác định điện đó là cập nhật của thành phần nào trong năm thành phần; trường hợp cập nhật chỉ một phần nhỏ bên trong một thành phần (ví dụ đổi một điểm trong route, đổi mực bay) thì cần thuật toán matching chuỗi sâu hơn để vẫn nhận biết được sự thay đổi và làm nổi đúng đoạn lệch (chiều 30:17–31:47, chiều 32:10–32:41). Trường hợp đặc biệt: nếu route thêm một điểm ở giữa nhưng giữ nguyên các điểm còn lại thì có cảnh báo; nếu chỉ đổi fly level mà giữ nguyên các điểm thì không cảnh báo (chiều 01:17:37–01:18:01).

**Kết luận.** Cảnh báo ATC FPL phát sinh ngay khi có lệch, không phụ thuộc mốc thời gian; cần xây dựng thuật toán matching và làm nổi chính xác từng thành phần thay đổi; quy tắc xử lý cập nhật một phần (đổi điểm, đổi mực bay) đã được phân loại sơ bộ.

### 10. Cảnh báo thời tiết theo Minima sân bay (buổi chiều)

**Yêu cầu.** Cảnh báo khi điều kiện thời tiết quan trắc thực tế (METAR/TAF) chạm hoặc vi phạm giá trị Minima của sân bay (chiều 01:19:00–01:21:01).

**Thảo luận và Đề xuất.** Minima sân bay do FOE ban hành ban đầu, tuy nhiên điều phái có quyền sửa Minima cho từng tình huống cụ thể trên giao diện điều phái; FOE không trực tiếp sửa trên giao diện này (chiều 01:22:43–01:23:32). Khi METAR mới phát hành (thường vào các mốc giờ chẵn 0h00, 0h30) có chứa các hiện tượng thời tiết xấu như TSA (Thunderstorm Activity) và giá trị chạm vào margin của Minima sân bay đến của chuyến, hệ thống cảnh báo vàng và làm nháy dòng chuyến đó; nếu vi phạm Minima thì cảnh báo đỏ; cảnh báo áp dụng cả cho chuyến đang bay trên trời nhưng estimate arrival gần sân chạm Minima (chiều 01:19:28–01:20:31, chiều 01:20:31–01:21:01) [YCKT sheet-04 §474 Báo cáo thời tiết quan trắc thực tế so với Minima]. Riêng nhóm Notam được hai bên thống nhất tách thành buổi làm việc riêng để phân loại chi tiết do số lượng tình huống lớn (chiều 01:23:32–01:23:58).

**Kết luận.** Cảnh báo thời tiết theo Minima sân bay gồm hai mức (vàng khi chạm margin, đỏ khi vi phạm); Minima do FOE ban hành và điều phái được phép sửa; tích hợp luồng METAR/TAF tự động; chủ đề Notam tách buổi riêng.

### 11. Cột nhiên liệu — Pilot Confirm, Pilot AXA, Block Fuel (buổi chiều)

**Yêu cầu.** Bộ phận Điều phái đã yêu cầu các cột nhiên liệu phục vụ giám sát: Pilot Confirm (PIC xác nhận release), Pilot AXA (dầu thực tế phi công đã nhập kèm lý do), và Block Fuel (sáng 23:32–24:35, chiều 06:48–07:18, chiều 01:00–02:18).

**Thảo luận và Đề xuất.** Pilot Confirm hiển thị trạng thái phi công đã xác nhận release hay chưa; chỉ khi Pilot Confirm xanh thì mới được phép phát hành tài liệu chuyến bay (chiều 01:26:24–01:26:46). Pilot AXA hiển thị chênh lệch giữa dầu phi công tự ý lấy thêm và dầu kế hoạch, kèm lý do do phi công nhập; điều phái xem nhanh qua chế độ hover trên ô (chiều 02:18–02:51). Block Fuel hiển thị số kilogram khi cần; mặc định chỉ hiện cảnh báo khi giá trị quá ngưỡng (chiều 06:48–07:46). Khi hover lên ô của các cột nhiên liệu, hiển thị thông tin nhanh; khi click vào ô, mở chi tiết lịch sử cập nhật (chiều 01:23:46–01:25:00). Riêng cột Pilot AXA chưa thống nhất rõ phải cảnh báo gì ngoài việc cho điều phái biết phi công đã ghi lý do hay chưa (chiều 02:18–02:51) [cần xác nhận].

**Kết luận.** Ba cột nhiên liệu được hiển thị theo nguyên tắc tối giản: chỉ hiện số khi vượt ngưỡng hoặc khi có chênh lệch; tương tác hover xem nhanh và click xem chi tiết; quy tắc cảnh báo cụ thể của Pilot AXA cần làm rõ thêm.

### 12. Tích hợp và rủi ro Adapter — AMOS, Lido Import file, ưu tiên Actual Fuel ACARS (buổi sáng + chiều)

**Yêu cầu.** Phân hệ Điều phái phụ thuộc vào nhiều luồng tích hợp gồm AMOS (cấp MEL, defect, techlog), Lido (kế hoạch bay, gói tài liệu chuyến bay, OFP), FOEM (cấp DOW), AVES (cấp tổ bay), CLC (cấp điện payload, DAO actual) (sáng 06:22–07:10, sáng 23:32–24:11) [YCKT sheet-06 §14, §40, §42].

**Thảo luận và Đề xuất.** Luồng dữ liệu tải trọng tự động từ CLC chạy real time qua Lido Import file, đồng thời người dùng có thể nhập tay khi điện tự động không gửi được (sáng 23:51–24:35). Luồng dữ liệu DAO được kỳ vọng lấy từ FOEM khi sẵn sàng, tạm thời dùng file DOW fixed qua Adapter (sáng 07:43–08:31). Một rủi ro lớn được nêu trong buổi chiều là Adapter giữa AVES và Lido bị giới hạn hai mươi ký tự cho trường tên crew, dẫn đến phải cắt tên dài và làm sai lệch thuật toán matching PIC giữa OFP và AVES; phương án hiện nay là cắt mười sáu ký tự cho tên cộng bốn ký tự cho group code (chiều 01:07:25–01:09:38) [cần xác nhận về quyết định nới giới hạn]. Cơ chế ưu tiên Actual Fuel ưu tiên lấy từ ACARS trước, sau đó mới đến QAR; trường hợp các luồng tích hợp Lido/AMOS bị lỗi thì cho phép điều phái upload tài liệu thủ công làm phương án thay thế (chiều 01:27:43–01:30:23) [YCKT sheet-04 §310 TOSS-228 cho phép upload file NOTAM/WX thủ công].

**Kết luận.** Sơ đồ tích hợp gồm bốn nguồn dữ liệu chính (AMOS, Lido, FOEM, AVES) cộng luồng CLC qua Lido Import file; rủi ro giới hạn hai mươi ký tự của Adapter Lido cần phương án xử lý dứt điểm; cơ chế dự phòng upload thủ công khi tích hợp lỗi đã được ghi nhận.

### 13. Màn Flight Plan dạng danh sách — duy trì song song với màn Monitoring (buổi chiều)

**Yêu cầu.** Bộ phận Điều phái mong muốn duy trì một màn hình thứ hai dạng danh sách (giống Netline hiện hữu) bên cạnh màn Monitoring để xem nhiều thông tin về OFP theo dạng bảng, lọc nhanh theo người làm OFP, lọc theo trạng thái, và xem các thông số như Block view, Taxi, CI (chiều 21:20–23:46).

**Thảo luận và Đề xuất.** Hai bên thống nhất giữ song song hai màn: màn Monitoring là màn vận hành chính với các cột cảnh báo và mốc thời gian, màn Flight Plan dạng danh sách phục vụ tra cứu, thống kê thông tin OFP, có thể thêm các cột thông tin tùy chọn theo nhu cầu người dùng (chiều 21:59–23:17). Màn Monitoring và màn Flight Plan dùng chung dữ liệu nhưng khác về mục đích sử dụng: Monitoring tập trung vào cảnh báo, Flight Plan tập trung vào xem và thống kê (chiều 23:17–23:46).

**Kết luận.** Hệ thống cung cấp hai màn song song trong phân hệ Điều phái: Màn Monitoring (giám sát cảnh báo) và Màn Flight Plan dạng danh sách (xem và thống kê OFP), cùng truy cập từ menu điều phái.

## III. Các nội dung đã thống nhất

| # | Nội dung đã thống nhất |
|---|---|
| 1 | Màn Monitoring mặc định chỉ hiển thị các chuyến bất thường; người dùng có thể ẩn/hiện cột, ẩn/hiện dòng và lưu cấu hình hiển thị riêng. |
| 2 | Quy ước hiển thị thống nhất ba màu đỏ, vàng, xanh; trạng thái bình thường (không có gì để cảnh báo) hiển thị bằng dấu gạch ngang hoặc để trắng. |
| 3 | Tương tác trên dòng: hover làm sáng nhẹ để nhận diện hàng, click mở chi tiết và làm sáng đậm hơn; không phát âm thanh, có thể cho phép nháy dòng khi cảnh báo nghiêm trọng. |
| 4 | Nút Dispatch Release chỉ sáng khi đến giờ, đủ tài liệu, mọi trường so khớp xanh; chỉ một tập con cảnh báo nghiêm trọng được dùng làm điều kiện chặn release. |
| 5 | Mô hình tham số cảnh báo theo hai mức thời gian: mức vàng tại mốc bảy mươi lăm phút (quốc nội) và chín mươi phút (quốc tế); mức đỏ tại mốc sáu mươi phút (quốc nội) và bảy mươi lăm phút (quốc tế); trước mốc vàng giữ trạng thái bình thường. |
| 6 | Cảnh báo Payload có ngưỡng theo chặng × loại tàu × ngưỡng âm/dương × thời điểm hiệu lực; ngưỡng quản lý qua tab "Ngưỡng Payload" trong phân hệ Quản lý chặng bay. |
| 7 | Cảnh báo DAO không có ngưỡng (lệch là cảnh báo); vẫn cho khai báo ngưỡng linh hoạt với mặc định bằng không; quản lý qua tab "Ngưỡng DAO" trong phân hệ Quản lý chặng bay. |
| 8 | Nguồn DAO chuẩn lấy từ FOEM; trường hợp FOEM chưa sẵn sàng thì sử dụng file DOW cố định qua Adapter làm phương án dự phòng. |
| 9 | Cảnh báo tài liệu chuyến bay (Fly Doc): chuyến thường yêu cầu NOTAM và Weather; chuyến EDTO yêu cầu thêm Plotting chart và Icing chart; nhận diện qua chuỗi tên file. Thiếu tài liệu chặn Dispatch Release. |
| 10 | Cảnh báo Crew Download chỉ áp dụng cho PIC, hiển thị qua cột "Crew Download"; chỉ cần PIC đã tải tài liệu là đủ điều kiện. |
| 11 | Thứ tự cột Monitoring: Pilot Confirm → ATC → MEL/CDL, với cột Crew CHG đặt sau ATC và trước Payload. |
| 12 | Cảnh báo OFP rỗng tổ bay (do AVES lỗi) hiển thị đỏ tại cột tổ bay theo mốc thời gian. |
| 13 | Cảnh báo MEL/CDL chạy quy trình ba lớp: AMOS → shortlist FOE trên Lido → MEL trong OFP; bắt cả ba trường hợp thiếu, thừa, sai mã. |
| 14 | Cảnh báo ATC FPL phát sinh ngay khi có lệch, không phụ thuộc mốc thời gian. |
| 15 | Cảnh báo thời tiết theo Minima: vàng khi chạm margin, đỏ khi vi phạm; điều phái được phép sửa Minima trên giao diện điều phái. |
| 16 | Block Fuel và các cột nhiên liệu hiển thị tối giản: chỉ hiện số khi vượt ngưỡng hoặc có chênh lệch; hover xem nhanh, click xem chi tiết lịch sử cập nhật. |
| 17 | Phương án dự phòng cho phép upload thủ công tài liệu NOTAM/Weather khi luồng tích hợp Lido/AMOS bị lỗi. |
| 18 | Duy trì song song hai màn trong phân hệ Điều phái: Màn Monitoring (giám sát cảnh báo) và Màn Flight Plan dạng danh sách (xem và thống kê OFP). |
| 19 | Cảnh báo Payload áp dụng cho cả màn Monitoring và màn tài liệu DSP (briefing). |
| 20 | Tham số cảnh báo (mốc thời gian, ngưỡng, danh mục) được quản lý linh hoạt cho phép cập nhật khi có thay đổi mà không phải triển khai lại hệ thống. |

## IV. Các nội dung cần làm rõ

1. Pilot AXA có cần cảnh báo gì cụ thể ngoài việc cho điều phái biết phi công đã nhập lý do hay chưa? Quy tắc bật cảnh báo (theo ngưỡng chênh lệch, theo mốc thời gian) chưa được làm rõ trong buổi 18/06.
2. Tập con cảnh báo nào được dùng làm điều kiện chặn nút Dispatch Release? Cần liệt kê cụ thể từng cảnh báo và phân loại "chặn" hoặc "không chặn".
3. Cấu trúc của năm thành phần trong file ATC dùng cho thuật toán matching và làm nổi cập nhật một phần là gì? Cần đặc tả từng thành phần và quy tắc bóc tách.
4. Phương án xử lý giới hạn hai mươi ký tự của Adapter Lido cho trường tên crew: có nới lên được hay không, hay cố định phương án mười sáu cho tên cộng bốn cho group code? Đang chờ ý kiến lãnh đạo dự án.
5. Quy ước đặt tên file của Plotting chart và Icing chart: dự án sẽ thống nhất quy ước nào (chứa chuỗi "plotting" và "icing")? Cần chốt với điều phái và đội phát triển trước khi triển khai.
6. Cảnh báo Notam (phân loại theo sân bay, vùng trời, en-route, theo mức ảnh hưởng) cần tách thành buổi làm việc riêng để phân loại chi tiết — chưa làm trong buổi 18/06.
7. Quy ước hiển thị màn Flight Plan dạng danh sách cụ thể: các cột mặc định nào, các cột tùy chọn nào, các bộ lọc nào? Cần làm rõ trong buổi tiếp theo.
8. Mặc dù DAO không có ngưỡng cố định, có cần phân biệt mức cảnh báo theo độ lớn lệch (ví dụ trên một tấn cảnh báo vàng, trên ba tấn cảnh báo đỏ) hay chỉ một mức duy nhất? Buổi 18/06 thống nhất "lệch là cảnh báo" nhưng chưa loại trừ khả năng phân mức về sau.
9. Cơ chế "khôi phục về xanh" khi điều phái chưa có thao tác nào nhưng CLC gửi điện cập nhật làm dữ liệu khớp lại: có cần "lưu vết" cảnh báo đã từng phát sinh để theo dõi, hay tự động chuyển xanh là đủ?
10. Quy tắc cảnh báo khi route ATC thêm một điểm ở giữa nhưng giữ nguyên các điểm còn lại đã được thống nhất là "có cảnh báo"; tuy nhiên trường hợp thêm điểm kèm đổi fly level cần làm rõ là cảnh báo theo điểm hay theo fly level hay cả hai.

## V. Thuật ngữ đề xuất (chưa ghi glossary, chờ confirm)

| # | Thuật ngữ | Định nghĩa đề xuất (theo ngữ cảnh buổi 18/06) | Nguồn timestamp |
|---|---|---|---|
| 1 | Crew Download | Cột trên màn Monitoring kiểm tra trạng thái PIC đã tải tài liệu chuyến bay hay chưa; chỉ áp dụng cho PIC, không áp dụng cho các thành viên tổ bay còn lại. | [18062026 chiều 20:21–20:53] |
| 2 | Crew CHG | Cảnh báo phát hiện thay đổi tổ bay (đổi PIC hoặc đổi thành viên) giữa OFP cũ và OFP mới; đặt sau cột ATC và trước cột Payload trên màn Monitoring. | [18062026 chiều 01:00:42–01:01:13] |
| 3 | Pilot AXA | Cột hiển thị nhiên liệu thực tế (extra fuel) do phi công lấy thêm so với kế hoạch, kèm lý do do phi công nhập. | [18062026 chiều 02:18–02:51] |
| 4 | Fly Doc | Nhóm tài liệu chuyến bay gồm NOTAM, Weather (mọi chuyến) và Plotting/Icing chart (chuyến EDTO); cảnh báo khi thiếu một trong các tài liệu của nhóm. | [18062026 chiều 10:18–10:49] |
| 5 | Ngưỡng Payload | Tab trong phân hệ Quản lý chặng bay, cho phép khai báo ngưỡng dung sai chênh lệch Payload theo chặng bay × loại tàu × ngưỡng âm/dương × thời điểm hiệu lực. | [18062026 sáng 45:02–45:35] |
| 6 | Ngưỡng DAO | Tab trong phân hệ Quản lý chặng bay, cho phép khai báo ngưỡng dung sai chênh lệch DAO; mặc định bằng không (lệch là cảnh báo). | [18062026 sáng 52:35–53:15] |
| 7 | Mô hình cảnh báo hai mức | Quy ước mức 1 (vàng) tại mốc bảy mươi lăm phút quốc nội và chín mươi phút quốc tế trước giờ khởi hành; mức 2 (đỏ) tại mốc sáu mươi phút quốc nội và bảy mươi lăm phút quốc tế. | [18062026 sáng 30:02–30:52] · [18062026 chiều 56:30–57:32] |
| 8 | Shortlist MEL | Danh mục MEL đã được FOE lọc từ Master MEL của AMOS để giữ lại các MEL có ảnh hưởng đến khai thác (wind, fly level, fuel factor); upload lên Lido làm tham chiếu cho cảnh báo MEL/CDL trong OFP. | [18062026 chiều 34:25–35:30] |
| 9 | Matching PIC | Thuật toán so khớp tên PIC giữa OFP và AVES dùng so chuỗi theo tỷ lệ phần trăm khớp; bổ sung group code để tăng độ chính xác. | [18062026 chiều 01:07:55–01:09:14] |
| 10 | OFP rỗng tổ bay | Trường hợp đặc biệt khi hệ thống AVES bị lỗi không trả tổ bay sang OFP; cảnh báo đỏ tại cột tổ bay theo mốc thời gian. | [18062026 chiều 01:01:13–01:04:14] |
| 11 | Minima sân bay | Giá trị tham số tối thiểu (visibility, ceiling, RVR) của sân bay dùng cho cảnh báo thời tiết; do FOE ban hành ban đầu, điều phái được phép sửa trên giao diện điều phái. | [18062026 chiều 01:22:43–01:23:32] |
| 12 | Pilot Confirm | Cột trên màn Monitoring hiển thị trạng thái phi công đã xác nhận release; chỉ khi xanh mới được phép phát hành tài liệu chuyến bay. | [18062026 sáng 11:00–11:21] · [18062026 chiều 01:26:24–01:26:46] |
| 13 | Filed ATC | Bản ATC FPL đã nộp cho cơ quan kiểm soát không lưu qua điện ATC; đối tượng so khớp với ATC FPL trong OFP để cảnh báo lệch. | [18062026 chiều 23:47–24:48] |
| 14 | Lido Import file | Adapter của Lido nhận điện tải trọng tự động từ CLC để bắn sang phân hệ Điều phái; thay tên cũ "ePot" đã được sửa. | [18062026 sáng 23:51–24:35] |
