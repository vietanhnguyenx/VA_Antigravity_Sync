---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "Agent BA (business-analyst)"
version: "0.1"
date: "2026-06-22"
survey_date: "2026-06-19"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Tích hợp TOSS ↔ NetLine/OPS++ 19/06/2026"
---

# Báo cáo Khảo sát ngày 19/06/2026 — Tích hợp TOSS với NetLine/OPS++

## I. Thông tin chung

**Thời gian.** Buổi làm việc trực tuyến ngày 19/06/2026, kéo dài khoảng 43 phút.

**Mục đích.** Thống nhất phạm vi và phương thức tích hợp dữ liệu giữa hệ thống TOSS với hệ thống khai thác Netline Flight Ops++ (OPS++) mới mà Vietnam Airlines (VNA) đang triển khai cùng Lufthansa Systems (LHS). Buổi khảo sát xác định danh mục dữ liệu trao đổi hai chiều, phương thức truyền dữ liệu chính, cấu trúc thư mục lưu trữ và các mốc thời gian cần hoàn thành ngay trong tháng 6 và đầu tháng 7 năm 2026.

**Đối tượng tham dự.** Đại diện VNA gồm anh Nam và bạn An phụ trách tổng hợp yêu cầu tích hợp, đại diện đối tác triển khai NetLine từ phía Lufthansa Systems (gọi tắt là NetOps), đại diện Viettel gồm anh Sơn, anh Hiệp và chị Lê.

**Phạm vi khảo sát.** Buổi này tập trung vào hai câu hỏi lớn nhất là “gửi cái gì” và “gửi như nào” giữa TOSS và OPS++, chưa đi vào chi tiết từng trường dữ liệu của từng luồng. Phạm vi loại trừ các kết nối nội bộ của Lufthansa Systems (ví dụ Lido Fly4D đi thẳng sang NetLine) vì không thuộc trách nhiệm VNA và Viettel.

> **Cảnh báo chất lượng ASR:** Bản ghi gốc do hệ thống nhận dạng giọng nói tự động sinh ra nên còn nhiều lỗi chính tả thuật ngữ (NetLite/NetLite Off/Netop → NetLine/OPS++/NetOps; TOS/Top/Tóc/Tốt → TOSS; LSTP → SFTP `[cần xác nhận viết tắt]`; VNL/VLA → VNA; FN/FF/FFM/SSHM/MVT/MVA/LDM còn lẫn lộn) và một số đoạn lặp dài bị bỏ qua. Báo cáo này đã hiệu đính theo nội dung thực tế và gắn cờ `[cần xác nhận]` tại các vị trí ASR chưa rõ.

---

## II. Nội dung khảo sát theo chủ đề

### II.1. Mục tiêu và mức ưu tiên kết nối TOSS với NetLine/OPS++

**Yêu cầu.** Phía VNA xác định việc tích hợp TOSS với OPS++ là dự án rất quan trọng và là ưu tiên hàng đầu trong giai đoạn triển khai TOSS, đứng trước các kết nối với các hệ thống khác còn lại trong danh mục `[19062026 00:00:37]` `[19062026 00:02:05]`. Lý do được nêu là OPS++ là hệ khai thác chính mới của VNA do Lufthansa Systems cung cấp, cần được tích hợp đồng bộ dữ liệu với toàn bộ hệ thống hiện có của VNA, trong đó có TOSS.

**Thảo luận và đề xuất.** Phía VNA thông báo hiện tại VNA đang làm việc với đối tác Lufthansa Systems để lấy danh mục dữ liệu và định dạng (format) mà LHS yêu cầu. Tài liệu mô tả phía NetOps đã gửi cho Viettel trước buổi họp; Viettel được đề nghị xem trước và phản hồi câu hỏi qua VNA, VNA sẽ trả lời nếu thuộc phạm vi của mình hoặc chuyển tiếp về NetOps `[19062026 00:02:35]` `[19062026 00:03:02]`.

**Kết luận.** Hai bên thống nhất xem kết nối TOSS với OPS++ là mục tiêu ưu tiên cao nhất của giai đoạn này. Quy trình xử lý câu hỏi là Viettel gửi câu hỏi cho VNA, VNA chủ trì trả lời hoặc làm cầu nối với NetOps `[19062026 00:03:02]`.

### II.2. Phạm vi dữ liệu trao đổi hai chiều giữa TOSS và OPS++

**Yêu cầu.** Bạn An phía VNA đang tổng hợp toàn bộ kết nối dữ liệu hai chiều giữa TOSS và OPS++ theo bốn nội dung là chiều inbound vào OPS++, chiều outbound ra khỏi OPS++, mẫu điện trao đổi (sample), phương thức gửi và thời gian gửi `[19062026 00:03:02]` `[19062026 00:03:33]`. Bạn An trình bày trực tiếp bảng tổng hợp đang xây dựng và bản vẽ tổng thể luồng dữ liệu (high-level diagram) `[19062026 00:05:35]` `[19062026 00:10:29]`.

**Thảo luận và đề xuất.** Theo bạn An, bảng tổng hợp đã đánh dấu rõ các luồng inbound và outbound bằng màu vàng và gồm khoảng 19 luồng, trong đó 17 luồng inbound đi vào OPS++ và 2 luồng outbound đi ra từ OPS++ `[19062026 00:25:30]` `[19062026 00:30:17]`. Các nhóm dữ liệu inbound chính được điểm danh tại buổi họp gồm có:

- Bốn loại điện văn vận hành đi qua mạng SITA Text gồm điện movement MVT, điện MVA, điện divert (chuyển hướng) và điện LDM (load message tải) `[19062026 00:18:24]` `[19062026 00:18:48]`.
- Điện FFM (Field Management Message) là điện do TOSS phải tự sinh ra từ dữ liệu tổng hợp các nguồn khác để chuyển sang OPS++. Đại diện Viettel đã thắc mắc về định nghĩa FFM và được xác nhận đây là điện liên quan đến dữ liệu nhiên liệu (fuel management), không phải điện hàng hóa hay điện hành khách, không liên quan kỹ thuật bảo dưỡng `[19062026 00:19:14]` `[19062026 00:20:07]` `[19062026 00:20:33]`.
- Tệp tin lịch bay từ hệ thống Schedule Manager `[cần xác nhận tên đầy đủ]`, sinh ba lần trong một ngày, đẩy vào một thư mục trên máy chủ trung gian; TOSS có trách nhiệm lấy về và chuyển tiếp sang OPS++ `[19062026 00:18:48]` `[19062026 00:20:33]`.
- Bốn nhóm thông tin liên quan đến hành khách lấy từ Amadeus PSS gồm Pack Detail (thông tin chi tiết của từng khách), thông tin chung của khách (passenger summary), thông tin khách nối chuyến và booking, và các điện cập nhật sau khi đã có danh sách ban đầu `[19062026 00:20:33]` `[19062026 00:21:00]` `[19062026 00:21:22]`.
- Báo cáo Fuel Report tổng hợp sau chuyến bay, bao gồm nhiên liệu đã tiêu thụ và các thông tin liên quan như điện summary out-on-in `[19062026 00:21:22]` `[19062026 00:21:47]`.
- Crew Assignment là dữ liệu phân công tổ bay; Gate Info là thông tin cửa khởi hành `[19062026 00:21:47]` `[19062026 00:22:18]`.
- Fly Data lấy từ hệ thống ACDM (Airport Collaborative Decision Making) gồm các thông tin về T-SAT, C-TOT và các giờ liên quan `[19062026 00:22:18]`.
- Thông tin NOTAM dự kiến lấy trực tiếp (chủ trương vừa được chốt nội bộ ngày 18/06/2026, một ngày trước buổi họp) thông qua kết nối publish trực tiếp với cơ quan quản lý bay `[19062026 00:23:39]` `[19062026 00:24:10]`. Riêng cho mục đích đẩy sang OPS++, TOSS mặc định đã có NOTAM về và chỉ tập trung xác định nội dung cần chuyển sang OPS++ `[19062026 00:24:46]`.
- Thông tin tải hàng hóa lấy từ Cargo Spot và một số kênh khác `[19062026 00:23:39]`.

Về chiều outbound từ OPS++ ra ngoài, bạn An nhấn mạnh đây là phần đang vướng mắc nhất. Trong phạm vi dự án, dữ liệu outbound sẽ được lấy qua cổng giao tiếp ISB của Lufthansa Systems, cổng này hỗ trợ nhiều giao thức như API, Web Service, hàng đợi (Queue) và FTP để bên thu nạp lựa chọn `[19062026 00:07:31]` `[19062026 00:08:23]`. Tuy nhiên, do OPS++ phiên bản mới đặt trên hạ tầng đám mây của Lufthansa Systems và không có cơ sở dữ liệu nội bộ để truy vấn trực tiếp như phiên bản NetLine cũ, nên phía Lufthansa Systems không khuyến nghị lấy toàn bộ dữ liệu qua ISB mà chỉ cho phép lấy phần dữ liệu thực sự cần cho mục đích báo cáo. Để có dữ liệu đủ cho các nghiệp vụ điều hành của TOSS và các hệ thống khác, VNA đang triển khai thêm phương án nhân bản dữ liệu (data duplicate) sang một cơ sở dữ liệu trung gian của NetLine `[19062026 00:08:23]` `[19062026 00:09:48]`. VNA chưa chốt phương án cuối là chỉ dùng ISB hay phối hợp ISB với data duplicate `[19062026 00:09:21]` `[19062026 00:10:22]`.

Phía Viettel hỏi về sơ đồ tổng thể luồng dữ liệu để hiểu cách TOSS đứng giữa các nguồn dữ liệu và OPS++ `[19062026 00:10:29]`. Bạn An giải thích nguyên tắc là TOSS sẽ vươn ra để lấy dữ liệu từ các hệ thống nguồn, một số dữ liệu sẽ được chuyển thẳng sang OPS++, một số khác cần xử lý và sinh ra tệp tin theo định dạng OPS++ yêu cầu trước khi gửi qua giao thức truyền tệp `[19062026 00:11:26]` `[19062026 00:12:00]` `[19062026 00:12:18]`. Đại diện Viettel đề xuất hướng tiếp cận chuẩn hóa, theo đó các hệ thống nguồn đẩy vào TOSS rồi TOSS tự phân giã. Bạn An không đồng tình với cách này và làm rõ rằng trong phạm vi (scope) dự án, TOSS phải chủ động vươn ra lấy dữ liệu, không phải các hệ thống đẩy vào TOSS; lý do là các hệ thống nguồn là hệ thống đã có sẵn, không thể yêu cầu sửa đổi để chủ động gửi cho TOSS `[19062026 00:13:51]` `[19062026 00:14:18]` `[19062026 00:14:39]`. Ngoại lệ là các kênh đặc thù như mạng SITA thì các điện văn có thể được gửi tới một địa chỉ TOSS hứng nhận.

Bạn An cũng phân biệt hai loại điện dễ nhầm. Điện FFM là mẫu điện được gửi theo từng thời điểm trong chuyến bay, trong khi Fuel Report là báo cáo gửi một lần sau khi chuyến bay kết thúc và tổng hợp toàn bộ thông tin nhiên liệu đã tiêu thụ `[19062026 00:21:22]` `[19062026 00:21:47]`. Phân biệt giữa luồng đi qua TOSS và luồng đi trực tiếp giữa các hệ thống Lufthansa Systems được làm rõ thêm, theo đó các luồng giữa Lido Flight 4D và NetLine do Lufthansa Systems tự kết nối nội bộ, Viettel và TOSS chỉ ghi nhận, không tham gia thực hiện `[19062026 00:22:45]` `[19062026 00:23:38]`.

**Kết luận.** Hai bên thống nhất nguyên tắc TOSS là bên chủ động lấy dữ liệu từ các hệ thống nguồn rồi chuyển sang OPS++; danh mục dữ liệu inbound đầu tiên có khoảng 17 luồng và outbound có 2 luồng, sẽ được chi tiết hóa trong tệp tin Excel làm việc chung. Phía VNA chịu trách nhiệm hoàn thiện sample điện văn và phối hợp với Lufthansa Systems làm rõ định dạng cho từng luồng `[19062026 00:07:31]` `[19062026 00:30:17]` `[19062026 00:33:31]`.

### II.3. Phương thức tích hợp dữ liệu và cấu trúc thư mục

**Yêu cầu.** Phương thức truyền dữ liệu chính được VNA đề xuất là giao thức truyền tệp an toàn (SFTP — Secure File Transfer Protocol) `[cần xác nhận viết tắt LSTP/SFTP]`. VNA sẽ chủ trì xây dựng máy chủ SFTP đặt trên hạ tầng của VNA, cấp quyền truy cập cho phía Lufthansa Systems để bên đó kết nối vào lấy và đẩy dữ liệu `[19062026 00:03:33]` `[19062026 00:04:00]` `[19062026 00:06:36]` `[19062026 00:07:06]`.

**Thảo luận và đề xuất.** Phía NetOps không có yêu cầu đặc biệt nào về máy chủ SFTP. NetOps đề nghị VNA cài đặt theo chuẩn thông thường và cung cấp các thông tin xác thực gồm Private Key (khóa riêng) và User Path (đường dẫn người dùng). Yêu cầu quan trọng nhất từ phía NetOps là VNA xây dựng cấu trúc thư mục đúng theo kiến nghị NetOps đưa ra `[19062026 00:04:00]` `[19062026 00:04:23]`. Thời điểm cập nhật dữ liệu lên máy chủ SFTP cho từng chiều inbound và outbound, cũng như chu kỳ đồng bộ, thời gian lưu trữ và thời điểm xóa dữ liệu cũ sẽ được làm việc thêm với Lufthansa Systems cho từng loại dữ liệu cụ thể `[19062026 00:04:23]` `[19062026 00:04:39]`. Đối chiếu với YCKT sheet-06 (Tích hợp) dòng 1 "Netline Flight Ops++" cho thấy mục này hiện chưa kèm danh sách dữ liệu chi tiết, nên thời điểm gửi và quy tắc lưu trữ vẫn là khoảng trống cần VNA phối hợp với Lufthansa Systems bổ sung.

Bạn An mô tả cấu trúc thư mục được NetOps đề xuất. Mỗi đầu dữ liệu sẽ có một thư mục riêng (ví dụ thư mục tên `OPS_NAM` cho một loại dữ liệu cụ thể). Trong thư mục này có ba thư mục con gồm thư mục tạm (Temp) để hệ thống ghi tệp tin đang chuyển dở, thư mục lấy (Pickup) để phía Lufthansa Systems đọc tệp đã hoàn tất, và thư mục lưu trữ (Archive) để giữ tệp đã chuyển khi cần lưu vết. Cơ chế ghi gồm hai bước nhằm tránh việc phía nhận sao chép nhầm tệp đang ghi dở, theo đó hệ thống gửi sẽ tải tệp vào thư mục Temp, sau khi hoàn tất mới sao chép sang thư mục Pickup cho phía nhận lấy đi, có thể xóa sau khi đã được lấy thành công `[19062026 00:27:46]` `[19062026 00:28:20]` `[19062026 00:28:47]` `[19062026 00:29:17]`.

Phía Viettel đặt câu hỏi về phương thức kết nối mạng giữa máy chủ SFTP của VNA và hệ thống Lufthansa Systems. VNA xác nhận hai bên sẽ kết nối qua đường mạng riêng ảo (VPN) trên nền dải IP nội bộ, dự kiến cấu hình trong buổi làm việc ngày 24/06/2026 với sự tham gia của cả khối Chuyển đổi số (CĐS) và Hạ tầng phía VNA cùng đại diện Viettel `[19062026 00:30:49]` `[19062026 00:31:35]` `[19062026 00:32:02]`.

**Kết luận.** Hai bên thống nhất phương thức tích hợp chính là SFTP `[cần xác nhận viết tắt]`. VNA chịu trách nhiệm xây dựng máy chủ SFTP và cấu trúc thư mục theo kiến nghị NetOps gồm ba thư mục con Temp, Pickup, Archive cho mỗi đầu dữ liệu. Phương thức kết nối là VPN trên dải IP nội bộ `[19062026 00:31:35]` `[19062026 00:32:02]`.

**Đối chiếu sơ đồ và YCKT.** Sơ đồ Inbound/Outbound Architecture của OPS++ (file `Sơ đồ tích hợp Ops++.png` và bản `Ops++-integration-architecture.drawio`) minh hoạ rõ ISB đứng vai trò "integration gateway of OPS++" cho cả hai chiều dữ liệu. Sơ đồ cho thấy phía Inbound các hệ thống (TOSS, SITA, SABRE SCHED, AMADEUS, AVES, A-CDM, Flight, Cargo Spot) đi qua khối TOSS rồi qua ISB vào trung tâm NetLine/OPS++; phía Outbound dữ liệu đi từ NetLine/OPS++ qua ISB sang TOSS rồi phân phối tới SSIM, SABRE SCHED, VNA Others System, AMADEUS, AMOS, Flight sched, Lido Flight 4D. Hình ảnh này khớp với mô tả của bạn An là TOSS đứng trung gian giữa các hệ thống nguồn và OPS++, và phù hợp với việc lấy outbound qua ISB chứ không truy cập trực tiếp vào lõi OPS++ `[Ops++ sơ đồ]`. Đối chiếu danh mục dữ liệu với YCKT sheet-06 (Tích hợp), các nhóm hệ thống mà transcript đã nhắc đến có mặt trong sheet này gồm Netline Flight Ops++ (dòng 1), Schedule (SSIM/ASM/SSM — dòng 6), AMOS (dòng 10), Amadeus PSS (dòng 13), Lido Flight 4D (dòng 14), ACDM (dòng 18), Cargo Spot (dòng 21) và SITA TEXT (dòng 34). Như vậy danh mục buổi 19/06 khớp khung danh mục sheet-06, đồng thời bổ sung tên các điện văn chi tiết (MVT/MVA/divert/LDM/FFM/Fuel Report) mà sheet-06 chưa nêu cụ thể `[YCKT sheet-06]`.

### II.4. Vai trò và quy trình phối hợp giữa VNA, Lufthansa Systems và Viettel

**Yêu cầu.** Buổi họp xác lập rõ ba bên liên quan trong quá trình tích hợp gồm VNA chủ trì điều phối, Lufthansa Systems sở hữu hệ thống OPS++ và đưa ra tài liệu hướng dẫn tích hợp, và Viettel là đơn vị xây dựng TOSS, cần đối chiếu yêu cầu kỹ thuật và đặt câu hỏi nghiệp vụ `[19062026 00:02:35]` `[19062026 00:03:02]` `[19062026 00:03:32]`.

**Thảo luận và đề xuất.** Phía VNA làm việc với Lufthansa Systems để lấy danh mục dữ liệu và định dạng. Viettel có trách nhiệm xem trước tài liệu LHS đã gửi, nêu vấn đề hoặc câu hỏi qua VNA. Nếu vướng mắc thuộc phạm vi VNA, VNA sẽ trả lời ngay; nếu vướng mắc thuộc kỹ thuật của OPS++ hoặc Lufthansa Systems thì VNA chuyển tiếp về NetOps `[19062026 00:03:02]` `[19062026 00:03:32]`. Phía Viettel xác nhận chỉ quan tâm đến các luồng tô vàng (các luồng VNA đã đánh dấu là trong phạm vi TOSS phải xử lý), không quan tâm các luồng nội bộ Lufthansa Systems `[19062026 00:23:11]` `[19062026 00:23:38]`.

Bạn An đề xuất tổ chức tài liệu chi tiết theo từng luồng dữ liệu, trong đó tệp tin Excel tổng hợp giữ vai trò bảng làm việc chung và mỗi luồng có một thư mục riêng chứa mẫu điện và sample dữ liệu chi tiết `[19062026 00:36:14]` `[19062026 00:37:01]` `[19062026 00:37:24]`. Hai bên đồng thuận bắt đầu công việc chi tiết từ tuần kế tiếp, dự kiến từ thứ ba tuần sau (24/06/2026) `[19062026 00:38:10]` `[19062026 00:41:08]` `[19062026 00:42:07]`.

**Kết luận.** VNA chủ trì phối hợp, làm cầu nối với Lufthansa Systems. Viettel phản hồi tài liệu và đặt câu hỏi qua VNA. Tài liệu chi tiết được tổ chức theo từng luồng dữ liệu, có tệp tin Excel làm bảng tổng hợp. Lịch làm việc tiếp theo bắt đầu từ thứ ba 24/06/2026 `[19062026 00:42:37]`.

### II.5. Mốc thời gian triển khai SFTP và VPN

**Yêu cầu.** Hai mốc thời gian được nhắc lại nhiều lần trong buổi họp gồm ngày 24/06/2026 là buổi làm việc cấu hình VPN giữa hai bên, và ngày 01/07/2026 là hạn hoàn thành máy chủ SFTP để đường truyền dữ liệu sẵn sàng `[19062026 00:30:49]` `[19062026 00:32:25]` `[19062026 00:34:21]` `[19062026 00:34:47]`.

**Thảo luận và đề xuất.** Phía Viettel cho biết trước ngày 24/06/2026 cần thiết lập xong máy chủ và có thư mục SFTP để buổi làm việc 24/06 có thể tiến hành cấu hình VPN cùng khối Chuyển đổi số và Hạ tầng của VNA cùng Lufthansa Systems `[19062026 00:32:58]` `[19062026 00:33:30]`. Trường hợp chưa kịp cấu trúc thư mục đầy đủ, hai bên thống nhất chỉ cần có máy chủ và mở cổng (port) SFTP để test kết nối thông `[19062026 00:34:08]` `[19062026 00:34:21]`. Mục tiêu cuối là trước ngày 01/07/2026 máy chủ SFTP phải hoàn tất vận hành `[19062026 00:34:47]`.

Phía Viettel cũng đặt vấn đề hệ điều hành và cài đặt máy chủ chưa hoàn tất, cần điều chỉnh thêm; phía VNA đề nghị Viettel xác nhận trả lời về khả năng đáp ứng mốc 24/06 trong chiều 19/06 sau khi nội bộ thống nhất `[19062026 00:33:31]` `[19062026 00:34:08]`. Buổi 24/06 có sự tham gia của các bên Viettel, Chuyển đổi số và Hạ tầng VNA, và đại diện Lufthansa Systems để cấu hình VPN, kết nối thử và xác nhận thông luồng `[19062026 00:32:02]` `[19062026 00:32:25]`.

**Kết luận.** Hai bên thống nhất hai mốc cứng gồm máy chủ SFTP sẵn sàng test kết nối trong ngày 24/06/2026, máy chủ SFTP hoàn tất cùng cấu trúc thư mục trước ngày 01/07/2026 `[19062026 00:34:47]` `[19062026 00:38:10]`.

### II.6. Lộ trình go-live OPS++ và song hành với NetLine cũ

**Yêu cầu.** Phía Viettel đề cập trong giai đoạn chuyển tiếp TOSS vẫn phải sẵn sàng cả hai kênh lấy dữ liệu là NetLine cũ và OPS++ mới, để khi Lufthansa Systems cắt chuyển (cutover) thì TOSS có thể chuyển nguồn lấy dữ liệu chỉ bằng một thao tác `[19062026 00:38:10]` `[19062026 00:38:38]`.

**Thảo luận và đề xuất.** Phía VNA xác nhận giai đoạn chuyển tiếp sẽ ưu tiên dùng NetLine cho các luồng nghiệp vụ chính, đồng thời chuẩn bị nền tảng để khi OPS++ go-live thì chỉ cần bật chuyển sang OPS++. Lịch dự kiến cho mốc cắt chuyển là khoảng đầu tháng 03/2027 `[cần xác nhận năm chính xác]` `[19062026 00:38:38]` `[19062026 00:39:06]`. Phía VNA giải thích thời điểm OPS++ go-live (đi vào vận hành chính thức) dự kiến vào khoảng tháng 9, sau đó chạy song song với NetLine cũ đến khoảng tháng 3 năm sau mới cắt chuyển hoàn toàn `[19062026 00:39:06]` `[19062026 00:39:40]`.

Phía VNA làm rõ rằng giai đoạn duy trì hai nguồn không nằm trong phạm vi (scope) dự án tích hợp NetLine. Phần thuộc dự án dừng ở việc đảm bảo đầu ra của NetLine mới đi vào TOSS hoạt động đúng; phần TOSS xử lý dữ liệu sau khi đã có từ NetLine mới về là việc nội bộ TOSS và không thuộc phạm vi tích hợp `[19062026 00:39:46]` `[19062026 00:40:15]` `[19062026 00:40:42]` `[19062026 00:41:08]`. Tinh thần chung là phần tích hợp với OPS++ phải hoàn thiện trước, các nhiệm vụ liên quan sẽ được TOSS xử lý tiếp sau đó.

**Kết luận.** Lộ trình go-live OPS++ dự kiến vào tháng 9, chạy song song với NetLine cũ và cắt chuyển hoàn toàn vào khoảng tháng 3 năm sau `[cần xác nhận năm]`. TOSS phải sẵn sàng cơ chế chuyển nguồn dữ liệu giữa hai kênh chỉ bằng một thao tác. Phần xử lý dữ liệu nội bộ TOSS sau khi đã thu nhận từ OPS++ không thuộc phạm vi tích hợp với NetLine `[19062026 00:40:42]`.

---

## III. Đã thống nhất

| STT | Nội dung thống nhất | Tham chiếu |
|---|---|---|
| 1 | Kết nối TOSS với OPS++ là ưu tiên hàng đầu trong giai đoạn triển khai TOSS, đứng trước các kết nối khác. | `[19062026 00:00:37]` `[19062026 00:02:05]` |
| 2 | Quy trình câu hỏi đi qua VNA. VNA trả lời nếu thuộc phạm vi của VNA hoặc chuyển tiếp về NetOps. | `[19062026 00:03:02]` |
| 3 | Phương thức truyền dữ liệu chính giữa TOSS và OPS++ là SFTP. | `[19062026 00:03:33]` `[19062026 00:07:06]` |
| 4 | VNA chủ trì xây dựng máy chủ SFTP đặt tại hạ tầng VNA, cấp quyền cho Lufthansa Systems kết nối vào. | `[19062026 00:06:36]` `[19062026 00:07:06]` |
| 5 | NetOps không có yêu cầu đặc biệt về cài đặt SFTP, chỉ yêu cầu Private Key, User Path và cấu trúc thư mục theo kiến nghị. | `[19062026 00:04:00]` `[19062026 00:04:23]` |
| 6 | Cấu trúc thư mục chuẩn gồm ba thư mục con cho mỗi đầu dữ liệu là Temp, Pickup và Archive. | `[19062026 00:27:46]` `[19062026 00:29:17]` |
| 7 | Nguyên tắc TOSS chủ động vươn ra lấy dữ liệu từ các hệ thống nguồn, không phải các hệ thống đẩy vào TOSS. Ngoại lệ là các kênh đặc thù như mạng SITA. | `[19062026 00:14:18]` `[19062026 00:14:39]` |
| 8 | Phạm vi tích hợp bao gồm khoảng 17 luồng inbound đi vào OPS++ và 2 luồng outbound đi ra từ OPS++. | `[19062026 00:25:30]` `[19062026 00:30:17]` |
| 9 | Phương thức kết nối mạng giữa SFTP của VNA và Lufthansa Systems là VPN trên dải IP nội bộ. | `[19062026 00:31:35]` `[19062026 00:32:02]` |
| 10 | Mốc 24/06/2026 là buổi cấu hình VPN giữa Viettel, khối Chuyển đổi số và Hạ tầng VNA, và Lufthansa Systems. Trước mốc này máy chủ SFTP cần sẵn sàng để test thông kết nối. | `[19062026 00:30:49]` `[19062026 00:32:58]` |
| 11 | Mốc 01/07/2026 là hạn cuối hoàn thành máy chủ SFTP và cấu trúc thư mục để đường truyền dữ liệu sẵn sàng. | `[19062026 00:34:47]` |
| 12 | Tài liệu chi tiết tổ chức theo từng luồng dữ liệu, có tệp tin Excel làm bảng tổng hợp chung và thư mục riêng chứa sample điện văn của từng luồng. | `[19062026 00:37:01]` `[19062026 00:37:24]` |
| 13 | Trong giai đoạn chuyển tiếp, TOSS phải sẵn sàng cơ chế chuyển nguồn giữa NetLine cũ và OPS++ chỉ bằng một thao tác. | `[19062026 00:38:10]` `[19062026 00:38:38]` |
| 14 | Phần xử lý dữ liệu nội bộ TOSS sau khi đã nhận từ OPS++ không thuộc phạm vi dự án tích hợp NetLine. | `[19062026 00:40:42]` `[19062026 00:41:08]` |
| 15 | Công việc chi tiết tiếp theo bắt đầu từ thứ ba 24/06/2026. | `[19062026 00:42:07]` `[19062026 00:42:37]` |
| 16 | Điện FFM (Field Management Message) là điện về nhiên liệu, không phải điện hàng hóa, hành khách hay kỹ thuật bảo dưỡng. | `[19062026 00:19:14]` `[19062026 00:20:33]` |

---

## IV. Cần làm rõ

| STT | Câu hỏi cần làm rõ | Lý do | Đề xuất xử lý |
|---|---|---|---|
| 1 | Viết tắt SFTP hay LSTP. Bản ghi gốc thường ghi “LSTP”, nội dung thực tế nói về SFTP (Secure File Transfer Protocol) nhưng cần xác nhận lại với phía VNA và NetOps. | Tránh viết sai chuẩn giao thức trong tài liệu kỹ thuật. | Hỏi xác nhận trong buổi 24/06/2026 và ghi nhận vào sổ OID. |
| 2 | Danh mục đầy đủ và mã hóa từng luồng trong 17 luồng inbound và 2 luồng outbound. Cần có bảng đầy đủ kèm tên hệ thống nguồn, loại dữ liệu, mẫu điện đại diện. | Buổi này chỉ liệt kê các nhóm chính, chưa đủ cho việc triển khai. | Yêu cầu bạn An phía VNA cung cấp bảng tổng hợp Excel hoàn chỉnh trước thứ ba 24/06. |
| 3 | Định dạng dữ liệu Lufthansa Systems yêu cầu cho từng luồng (kể cả mẫu điện FFM mà TOSS phải tự sinh). | Cần định dạng chuẩn để TOSS sinh đúng tệp tin và truyền qua SFTP. | VNA làm việc với Lufthansa Systems, gửi tài liệu định dạng cho Viettel xem trước. |
| 4 | Cấu trúc thư mục chuẩn (folder structure) cho từng đầu dữ liệu kèm quy tắc đặt tên thư mục, quy tắc đặt tên tệp, mã hóa ký tự. | Là tiền đề cấu hình máy chủ SFTP. | Lấy tài liệu kiến nghị của NetOps. |
| 5 | Mốc thời gian gửi và đồng bộ dữ liệu cho từng luồng inbound và outbound, kèm thời gian lưu trữ trên SFTP và thời điểm xóa tệp. | Quyết định kiến trúc lưu trữ và lịch chạy tác vụ của TOSS. | VNA làm việc tiếp với Lufthansa Systems. |
| 6 | Định nghĩa hệ thống Schedule Manager `[cần xác nhận tên đầy đủ]` sinh tệp lịch bay ba lần một ngày. | Buổi họp đề cập nhưng tên chưa rõ ràng trong bản ghi. | Hỏi xác nhận với bạn An. |
| 7 | Phương án outbound cuối cùng từ OPS++ qua ISB hay phối hợp ISB cùng data duplicate. | VNA chưa chốt phương án. Ảnh hưởng kiến trúc thu nạp dữ liệu phía TOSS. | Đề nghị VNA chốt sau khi làm rõ với Lufthansa Systems. |
| 8 | Năm chính xác của mốc cắt chuyển hoàn toàn từ NetLine cũ sang OPS++ (bản ghi nêu “tháng 3”). | Bản ghi không nêu rõ năm; cần xác nhận để lập kế hoạch chuyển tiếp. | Hỏi xác nhận với anh Nam phía VNA. |
| 9 | Bốn nhóm thông tin hành khách lấy từ Amadeus PSS được đề cập tới các số “10, 11, 7, 8, 9” trong sample. Cần đối chiếu lại số thứ tự chính xác trong bảng làm việc chung. | Bản ghi gốc không thống nhất giữa “số 11 và số 789” và “số 10 với cả số 5”. | Đối chiếu với bảng làm việc của bạn An. |
| 10 | Trách nhiệm cuối cùng về phần TOSS xử lý dữ liệu nội bộ sau khi đã nhận từ OPS++. Phía VNA nói phần này “không thuộc scope dự án tích hợp NetLine” nhưng vẫn là việc TOSS phải làm. | Cần làm rõ để tránh xung đột về phạm vi giữa các gói dự án. | Đưa vào sổ OID và nêu trong cuộc họp tổng kết giai đoạn. |

---

## V. Thuật ngữ đề xuất

> Bảng dưới chỉ là **đề xuất từ buổi 19/06/2026**. Việc cập nhật `toss-glossary-v0.1.md` sẽ thực hiện sau khi BA Lead xác nhận.

| STT | Thuật ngữ | Đề xuất tiếng Việt | Mô tả ngắn | Nguồn |
|---|---|---|---|---|
| 1 | **OPS++ (Netline Flight Ops++)** | Hệ khai thác bay OPS++ | Hệ khai thác bay mới của VNA do Lufthansa Systems triển khai, phiên bản kế tiếp của NetLine, đặt trên hạ tầng đám mây của Lufthansa Systems. | `[19062026 00:02:05]` `[19062026 00:08:50]` |
| 2 | **NetOps** | Bộ phận vận hành NetLine của Lufthansa Systems | Đầu mối vận hành NetLine/OPS++ phía Lufthansa Systems làm việc trực tiếp với VNA về cấu hình tích hợp. | `[19062026 00:03:32]` `[19062026 00:04:00]` |
| 3 | **LHS (Lufthansa Systems)** | Lufthansa Systems | Đối tác cung cấp NetLine và OPS++; sở hữu các hệ thống Lido Flight 4D và Lido mPilot trong danh mục tích hợp. | `[19062026 00:02:35]` `[19062026 00:22:45]` |
| 4 | **ISB** | Cổng giao tiếp tích hợp của OPS++ | Cổng giao tiếp do Lufthansa Systems cung cấp để bên ngoài lấy dữ liệu từ OPS++. Hỗ trợ nhiều giao thức (API, Web Service, Queue, FTP). Chỉ cho phép lấy dữ liệu phục vụ báo cáo, không lấy toàn bộ. | `[19062026 00:07:31]` `[19062026 00:08:23]` `[19062026 00:09:21]` |
| 5 | **Data duplicate** | Nhân bản dữ liệu OPS++ | Phương án nhân bản dữ liệu của OPS++ sang một cơ sở dữ liệu trung gian của NetLine để phục vụ nghiệp vụ của TOSS và các hệ thống khác. | `[19062026 00:09:21]` `[19062026 00:09:48]` |
| 6 | **SFTP (Secure File Transfer Protocol)** | Giao thức truyền tệp an toàn | Phương thức truyền dữ liệu chính giữa TOSS và OPS++. bản ghi gốc thường ghi nhầm là LSTP `[cần xác nhận viết tắt]`. | `[19062026 00:03:33]` `[19062026 00:04:00]` |
| 7 | **Private Key** | Khóa riêng | Thông tin xác thực TOSS cung cấp cho Lufthansa Systems để kết nối vào máy chủ SFTP. | `[19062026 00:04:00]` `[19062026 00:04:23]` |
| 8 | **User Path** | Đường dẫn người dùng | Đường dẫn truy cập tài khoản trên máy chủ SFTP do TOSS cấp cho phía Lufthansa Systems. | `[19062026 00:04:00]` |
| 9 | **Temp / Pickup / Archive folder** | Thư mục tạm / lấy / lưu trữ | Ba thư mục con của mỗi đầu dữ liệu trên máy chủ SFTP. Temp là nơi ghi tệp đang chuyển dở, Pickup là nơi tệp đã hoàn tất chờ Lufthansa Systems lấy, Archive là nơi lưu vết. | `[19062026 00:27:46]` `[19062026 00:29:17]` |
| 10 | **MVT (Movement Message)** | Điện vận hành chuyến bay | Điện báo trạng thái chuyến bay (cất cánh, hạ cánh, delay…) qua mạng SITA. | `[19062026 00:18:24]` |
| 11 | **MVA** | Điện MVA `[cần xác nhận định nghĩa đầy đủ]` | Một trong bốn loại điện đi qua mạng SITA được đề cập trong danh mục. | `[19062026 00:18:24]` |
| 12 | **Điện divert** | Điện chuyển hướng | Điện báo chuyến bay chuyển hướng sang sân bay khác, đi qua mạng SITA. | `[19062026 00:18:24]` |
| 13 | **LDM (Load Message)** | Điện tải | Điện thông tin tải của chuyến bay, đi qua mạng SITA. | `[19062026 00:18:24]` |
| 14 | **FFM (Field Management Message)** | Điện quản lý nhiên liệu | Điện do TOSS sinh ra từ dữ liệu tổng hợp, liên quan đến dữ liệu nhiên liệu (không phải hàng hóa, hành khách, kỹ thuật bảo dưỡng). | `[19062026 00:19:14]` `[19062026 00:20:33]` |
| 15 | **Schedule Manager** `[cần xác nhận tên đầy đủ]` | Hệ thống sinh tệp lịch bay | Hệ thống sinh tệp tin lịch bay ba lần mỗi ngày vào một thư mục máy chủ trung gian. TOSS có trách nhiệm lấy về và chuyển tiếp sang OPS++. | `[19062026 00:18:48]` |
| 16 | **Pack Detail** | Chi tiết hành khách | Một trong bốn nhóm thông tin hành khách lấy từ Amadeus PSS. | `[19062026 00:20:33]` `[19062026 00:21:00]` |
| 17 | **Fuel Report** | Báo cáo nhiên liệu | Báo cáo tổng hợp nhiên liệu đã tiêu thụ và các điện summary out-on-in, gửi một lần sau khi chuyến bay kết thúc. | `[19062026 00:21:22]` `[19062026 00:21:47]` |
| 18 | **Crew Assignment** | Phân công tổ bay | Dữ liệu phân công tổ bay; nằm trong danh mục dữ liệu đẩy sang OPS++. | `[19062026 00:21:47]` |
| 19 | **Gate Info** | Thông tin cửa khởi hành | Thông tin về gate (cửa khởi hành) của chuyến bay; nằm trong danh mục dữ liệu đẩy sang OPS++. | `[19062026 00:22:18]` |
| 20 | **Fly Data (ACDM)** | Dữ liệu chuyến bay từ ACDM | Dữ liệu lấy từ hệ thống ACDM gồm các mốc thời gian như T-SAT, C-TOT và các giờ liên quan. | `[19062026 00:22:18]` |
| 21 | **Cutover** | Cắt chuyển | Sự kiện cắt chuyển hoàn toàn từ NetLine cũ sang OPS++; dự kiến khoảng tháng 3 năm sau go-live `[cần xác nhận năm]`. | `[19062026 00:38:38]` `[19062026 00:39:06]` |
