---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.3"
date: "2026-06-16"
survey_date: "2026-06-11"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Phỏng vấn Dispatcher buổi chiều 11/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi chiều 11/06/2026 (Phỏng vấn Dispatcher)

> Báo cáo này được lập trực tiếp từ transcript buổi chiều 11/06/2026 nối tiếp buổi sáng cùng ngày. Nội dung trao đổi tập trung vào hai cảnh báo còn thiếu liên quan đến tài liệu chuyến bay, cảnh báo chuyến không thường lệ thiếu STS/HEAD, kiến trúc sáu giai đoạn của quy trình điều phái trên TOSS, cơ chế Release và Unrelease OFP cùng quản lý phiên bản giữa TOSS, MO Plus và Lido, các yêu cầu giám sát real-time, chức năng upload file thời tiết đa chuyến, báo cáo Pallet Relief và Payload Extra, sửa thông số trên OFP, log truy cập tài liệu tổ bay và phương án backup khi Lido lỗi.

## I. Thông tin chung

| Mục | Nội dung |
|---|---|
| **Thời gian** | Buổi chiều ngày 11/06/2026, nối tiếp buổi sáng cùng ngày |
| **Mục đích** | Hoàn tất danh sách cảnh báo còn thiếu của khâu chuẩn bị chuyến bay, thống nhất kiến trúc sáu phase của quy trình điều phái trên TOSS, làm rõ cơ chế Dispatch Release và Unrelease cùng quản lý phiên bản OFP giữa TOSS, MO Plus và Lido, bàn về giám sát real-time trong Phase 4 và Phase 5, đồng thời thống nhất các chức năng phụ trợ gồm upload file thời tiết đa chuyến, báo cáo Pallet Relief với cột Payload Extra, sửa thông số trên OFP, log truy cập tài liệu và backup khi Lido lỗi |
| **Đối tượng phỏng vấn** | Điều phái viên (Dispatcher) của VNA, đại diện khối khai thác chuyến bay |
| **Phía khảo sát** | Đội phân tích nghiệp vụ TOSS |

---

## II. Nội dung trao đổi

### II.1 — Bổ sung cảnh báo "chuyến bay thiếu tài liệu" và "tổ bay chưa tải tài liệu mới nhất"

**Yêu cầu**

Tiếp nối danh sách cảnh báo đã thống nhất ở buổi sáng, điều phái đề nghị bổ sung hai cảnh báo còn thiếu liên quan đến tài liệu chuyến bay. Cảnh báo thứ nhất là "chuyến bay thiếu tài liệu", phát sinh khi đến thời điểm đáng lẽ phải có tài liệu OFP, NOTAM hay thời tiết nhưng tài liệu chưa lên hệ thống, hoặc khi luồng tự động đẩy tài liệu vì một lý do nào đó không hoạt động. Cảnh báo thứ hai là "tổ bay chưa tải tài liệu mới nhất", phát sinh khi tài liệu đã được đưa lên MO Plus nhưng tổ bay chưa download phiên bản mới hoặc bản tổ bay đang sử dụng đã lệch phiên bản so với bản mới nhất. Theo điều phái, anh Dũng từ trước cũng đã nêu nhu cầu có cảnh báo này để điều phái chủ động nhắc nhở tổ bay đối với các chuyến bay quan trọng.

**Thảo luận và Đề xuất**

MO Plus hiện đã ghi nhận lịch sử tổ bay đã vào xem hoặc đã tải tài liệu, do đó có sẵn cơ sở dữ liệu để TOSS đối chiếu. Nhóm phân tích đề xuất TOSS kết nối lấy dữ liệu này từ MO Plus và phát cảnh báo ngược về điều phái khi tổ bay chưa download bản tài liệu mới nhất trong khoảng thời gian quy định trước chuyến bay.

**Kết luận**

Hai bên thống nhất bổ sung vào module Dispatch của TOSS hai cảnh báo gồm "Chuyến bay thiếu tài liệu" và "Tổ bay chưa tải tài liệu mới nhất". TOSS cần kết nối với MO Plus để lấy trạng thái download tài liệu của tổ bay phục vụ cảnh báo thứ hai.

---

### II.2 — Cảnh báo chuyến không thường lệ thiếu STS/HEAD trong OFP

**Yêu cầu**

Đối với các chuyến không thường lệ như chuyên cơ, VIP, ferry hay charter, OFP cần có chỉ thị STS/HEAD theo quy định. Hiện trạng cho thấy có những chuyến không thường lệ đã phát hành nhưng OFP thiếu STS/HEAD, gây vướng quy định và ảnh hưởng tới khả năng claim miễn trừ phí khí thải về sau.

**Thảo luận và Đề xuất**

Việc nhận diện chuyến không thường lệ dựa vào mã loại chuyến (Flight Type Code). VNA hiện sử dụng các mã O, Z, G, H, A, P, V, S và một số mã khác, tuy nhiên danh mục đầy đủ cùng ý nghĩa từng mã cần xác nhận thêm. Trên flight plan, chuyến thường lệ được mã hóa là `S` (Scheduled) trong khi chuyến không thường lệ chuyển sang `N` (Non-scheduled), và TOSS dùng mã O để nhận diện thông qua trường Flight Type. Khi TOSS nhận một chuyến không thường lệ mang mã O mà OFP tương ứng không có STS/HEAD, hệ thống cần phát cảnh báo để điều phái chỉnh OFP bổ sung trường này.

Lý do nghiệp vụ then chốt được điều phái nhấn mạnh là về sau nếu hãng muốn claim miễn trừ phí khí thải cho các chuyến bay không thường lệ, hồ sơ phải căn cứ vào dữ liệu thể hiện trong OFP. Nếu OFP không có STS/HEAD thì hãng phải tranh luận với cơ quan thu phí và có rủi ro mất quyền miễn trừ.

**Kết luận**

TOSS bổ sung cảnh báo "Chuyến không thường lệ — OFP chưa có STS/HEAD". Phạm vi cảnh báo nằm ở giai đoạn trước chuyến bay, cụ thể là trước khi Captain's Release. Sau khi MO Plus đã release phần này thì TOSS không tiếp tục cảnh báo nữa. Danh mục mã loại chuyến đầy đủ và cơ chế chuyển mã `S` sang `N` sẽ được làm rõ ở buổi khảo sát sau. `[cần xác nhận]`

---

### II.3 — Quy trình điều phái chia sáu giai đoạn và phạm vi TOSS trong từng giai đoạn

**Yêu cầu**

Đội khảo sát cần thống nhất với điều phái về kiến trúc tổng thể của module Dispatch trên TOSS, bao gồm số giai đoạn của quy trình, giai đoạn nào do TOSS đảm nhận và giai đoạn nào thuộc các hệ thống khác.

**Thảo luận và Đề xuất**

Phía khảo sát đề xuất chia quy trình điều phái thành sáu giai đoạn chính. Giai đoạn đầu tiên là chuẩn bị đầu ca, trong đó điều phái xem các thông tin ban đầu khi vào trực và nạp dữ liệu. Giai đoạn thứ hai là chuẩn bị OFP, gồm việc đánh giá các cảnh báo của giai đoạn một để quyết định làm OFP, sau đó gửi tài liệu CCD và đóng gói tài liệu chuyến bay. Giai đoạn thứ ba là Post-Release Transition, trong đó sau khi đã Dispatch Release hệ thống vẫn tiếp tục quét cảnh báo và khi có thay đổi về NOTAM, thời tiết, tàu bay hay tải trọng thì cập nhật OFP phiên bản mới. Giai đoạn thứ tư là theo dõi chuẩn bị khởi hành, gồm việc giám sát chuyến đang ở giai đoạn taxi-out hay cất cánh đúng giờ hay trễ. Giai đoạn thứ năm là theo dõi trong khi bay theo cơ chế giám sát tổng quan và cập nhật cảnh báo NOTAM, thời tiết ảnh hưởng phần đường bay còn lại. Giai đoạn cuối cùng là sau chuyến bay và bàn giao ca trực, bao gồm tổng hợp tình hình, lập báo cáo và bàn giao ca.

Điều phái xác nhận rằng buổi sáng cùng đầu buổi chiều mới hoàn tất giai đoạn một và một phần giai đoạn hai, các giai đoạn còn lại sẽ tiếp tục ở buổi khảo sát kế tiếp. Về tiếp cận thiết kế, mỗi giai đoạn trên TOSS gồm ba lớp là giao diện hệ thống, các trường thông tin và logic kiểm tra cảnh báo. Đối với mỗi cảnh báo cần xác định rõ thời điểm phát cảnh báo, màu sắc hiển thị và hành động đề xuất kèm theo.

**Kết luận**

Quy trình Dispatch trên TOSS được chia thành sáu giai đoạn với tên tạm chốt gồm chuẩn bị đầu ca, chuẩn bị OFP, Post-Release Transition, theo dõi chuẩn bị khởi hành, theo dõi trong khi bay và sau chuyến bay cùng bàn giao ca. Buổi sáng và đầu buổi chiều đã hoàn tất giai đoạn một, trong khi giai đoạn hai đang dở dang với các cảnh báo bổ sung tại §II.1 và §II.2. Các giai đoạn ba đến sáu sẽ tiếp tục bàn ở buổi khảo sát kế tiếp, trong đó phạm vi giai đoạn sáu sơ bộ chỉ là báo cáo và bàn giao ca, không phát sinh thao tác nghiệp vụ riêng.

---

### II.4 — Cơ chế Release và Unrelease OFP cùng quản lý phiên bản giữa TOSS, MO Plus và Lido

**Yêu cầu**

Đây là nội dung trọng tâm và dài nhất của buổi chiều, làm rõ kiến trúc dữ liệu OFP qua ba hệ thống. Mô hình hiện tại vận hành theo luồng Lido tự sinh OFP, adapter lấy về rồi đẩy sang MO Plus, sau đó MO Plus gọi ngược về Lido khi cần và chưa có TOSS trong luồng này. Khi TOSS được đưa vào vận hành, TOSS đứng giữa và quyết định MO Plus sử dụng phiên bản nào, tuy nhiên TOSS không phải là nguồn dữ liệu gốc. Vấn đề cần giải quyết là tổ bay có thể không chấp nhận phiên bản OFP mới và đòi quay về phiên bản OFP cũ hơn, và TOSS phải hỗ trợ tình huống này mà không làm rối luồng dữ liệu.

**Thảo luận và Đề xuất**

Tình huống ví dụ xuyên suốt cuộc thảo luận diễn ra như sau. Lido sinh OFP lần lượt phiên bản 1, 2 và 3. Phi công đã accept phiên bản 2, sau đó điều phái đã release phiên bản 3 và phi công cũng đã release phiên bản 3. Tuy nhiên vì lý do của tổ quay, tổ bay đòi quay lại phiên bản trước. Lý do thường gặp được điều phái nêu là tổ quay cũ chở ít dầu hơn tổ quay mới, khiến nếu lấy theo bản OFP mới thì tổ bay phải xả dầu cho đúng định mức của tổ quay cũ.

Phương án ban đầu được đưa ra là Lido sinh tiếp phiên bản 4 lấy thông số của phiên bản 2 rồi push tiếp lên MO Plus. Phương án này bị loại do làm tăng thời gian xử lý cho điều phái, phải làm lại OFP cho mỗi lần quay lui, đồng thời gây phức tạp cho quy trình.

Phương án được thống nhất là điều phái thao tác hoàn toàn trên TOSS mà không phải lên Lido làm lại. TOSS lưu danh sách phiên bản OFP nhận từ luồng MO Plus và adapter. Khi cần quay về phiên bản cũ, điều phái bấm Unrelease phiên bản hiện tại trên TOSS. TOSS lấy phiên bản cũ mà điều phái chọn từ danh sách OFP rồi đẩy phiên bản đó sang MO Plus như một revision mới. Phi công trên MO Plus thấy bản mới và confirm lại, còn ở phía điều phái không phải lên Lido thao tác lại.

Về nguyên tắc đánh phiên bản, điều phái nhấn mạnh rằng Lido không có khái niệm phiên bản mà chỉ có số OFP, còn phiên bản là do TOSS tự gán. TOSS gán theo thứ tự nhận, ví dụ nhận lần một là R1, nhận lần hai là R2 và tiếp tục như vậy. Khi quay về phiên bản cũ, TOSS có thể đặt tên phiên bản mới là 2.1 với ý nghĩa "né việc gọi là phiên bản chính thức mới mà thực ra đẩy lại bản 2", hoặc có thể auto-tăng số phiên bản lên 4. Trên MO Plus, hệ thống áp dụng cơ chế luôn lấy bản mới nhất, do đó để quay lui thì TOSS phải đẩy bản cũ dưới dạng phiên bản mới hơn để MO Plus override được.

Về cơ chế Confirm Release trên MO Plus, khi TOSS Unrelease một phiên bản thì trạng thái Confirm Release của phi công được reset và đính sang bản dân kia, do đó phi công phải Confirm Release lại trên phiên bản mới. Cơ chế notification trên app cần được thiết kế tương ứng để phi công nhận biết được sự thay đổi và xác nhận lại.

Về sự đối xứng với việc Dispatch Release, hai bên đồng ý rằng khi điều phái Unrelease một bản OFP thì mặc định trên TOSS và MO Plus sẽ có một revision mới, và để bản mới đó được khai thác chính thức thì điều phái phải bấm Dispatch Release thêm một lần nữa lên bản đấy. Việc Unrelease tự sinh revision mới giúp tiết kiệm công lấy lại bản từ Lido, còn việc Dispatch Release lần nữa vẫn cần thực hiện để bản đó được chính thức.

Về tình huống phi công sau khi đã accept một bản OFP mà muốn quay về phiên bản trước, hai bên thống nhất chỉ cần TOSS cho phép điều phái chọn phiên bản OFP cũ từ danh sách, không cần Release nhiều lần. Lý do tổ bay từ chối bản OFP mới và lấy bản OFP cũ chủ yếu liên quan đến số lượng dầu mỡ giữa các tổ quay khác nhau.

**Kết luận**

Mô hình phiên bản OFP được chốt như sau. Lido có số OFP, còn TOSS gán phiên bản theo thứ tự nhận với quy ước có thể là R1, R2 hoặc 2.1, và phiên bản chỉ tồn tại trên TOSS và MO Plus. Unrelease là thao tác chủ động trên TOSS, trong đó khi điều phái Unrelease thì TOSS sinh revision mới với nội dung của phiên bản cũ được chọn từ danh sách OFP của MO Plus, bắn sang MO Plus, đồng thời reset Confirm Release của phi công và phi công phải Confirm Release lại trên bản mới. Trong tình huống quay lui, phi công không thao tác Lido và điều phái cũng không cần lên Lido, toàn bộ xử lý diễn ra trên TOSS. Cơ chế notification trên app MO Plus cần khớp với đội MO Plus và quy ước gán phiên bản (auto-tăng so với sub-version 2.1) cần được chọn chính thức. `[cần xác nhận]`

---

### II.5 — Phase 3 (Post-Release Transition): TOSS chỉ quét cảnh báo và tham chiếu, không cập nhật OFP

**Yêu cầu**

Phase 3 được định nghĩa là giai đoạn sau khi đã Release OFP nhưng vẫn cần tiếp tục quét cảnh báo liên tục về NOTAM, thời tiết, tàu bay và tải trọng cho đến trước khi cất cánh. Vấn đề cần làm rõ là việc làm lại OFP phiên bản mới ở phase này được thực hiện trên TOSS hay trên Lido.

**Thảo luận và Đề xuất**

Điều phái khẳng định rằng thao tác cập nhật OFP phiên bản mới sau khi đã release nằm ở Lido chứ không nằm trên TOSS. Ở phase này TOSS chỉ làm hai việc là quét cảnh báo và tham chiếu để đề xuất cập nhật OFP. Khi có cảnh báo thì điều phái đánh giá và nếu cần cập nhật thì mở Lido làm OFP mới. Lido không phát cảnh báo thời tiết hay NOTAM mới theo kiểu real-time mà chỉ cảnh báo tại thời điểm làm bước bay khi sinh OFP, do đó TOSS phải đảm nhận vai trò giám sát và cảnh báo liên tục. Phạm vi cảnh báo phase 3 gồm thay đổi loại tàu, thay đổi tàu cụ thể, tải trọng, NOTAM và thời tiết, về cơ bản tương đồng các cảnh báo phase 1 nhưng được duy trì cho đến lúc cất cánh.

**Kết luận**

TOSS ở Phase 3 chỉ thực hiện cảnh báo và tham chiếu, không có chức năng cập nhật OFP trực tiếp. Khi điều phái cần làm OFP phiên bản mới sau Release thì mở Lido, do đó bước cập nhật tài liệu OFP phiên bản mới trong Phase 3 thuộc về Lido. TOSS duy trì quét cảnh báo liên tục từ thời điểm Release cho đến khi cất cánh. Khi tàu cất cánh, các cảnh báo về tải trọng và nhiên liệu chuẩn bị chuyến bay sẽ tắt, trong khi các cảnh báo về NOTAM và thời tiết en-route vẫn duy trì cho đến khi tàu hạ cánh.

---

### II.6 — Phase 4 và Phase 5 (Monitoring): tích hợp ACARS, refresh real-time và cơ chế hiển thị nhấp nháy

**Yêu cầu**

Phase 4 và Phase 5 gồm theo dõi chuẩn bị khởi hành và theo dõi trong khi bay đòi hỏi TOSS cung cấp một màn hình giám sát tổng quan để điều phái mở cả ngày, theo dõi từng chuyến bay đang ở giai đoạn nào từ taxi-out, cất cánh, đang bay đến taxi-in. Về trải nghiệm sử dụng, màn hình phải cập nhật real-time mà không bắt điều phái nhấn nút refresh, đồng thời có cơ chế cảnh báo bằng màu sắc và hiệu ứng nhấp nháy.

**Thảo luận và Đề xuất**

Về nguồn dữ liệu mốc thời gian thực tế, TOSS lấy từ ACARS bằng cách đọc message ACARS để bóc tách các mốc bao gồm giờ thực tế đi và đến. Hệ thống Mission Watch hiện hành cũng tích hợp ACARS, tuy nhiên TOSS sẽ lấy thẳng từ nguồn ACARS thay vì đi qua Mission Watch.

Thông tin cần giám sát đối với mỗi chuyến bay bao gồm ETA, giờ thực tế đi và đến, giờ kế hoạch để so sánh sớm hoặc trễ bao nhiêu phút, tình trạng hiện tại như đang taxi gian (taxi-out), đã cất cánh, đang bay hay đã in (taxi-in). Đối với chuyến đang chuẩn bị, cần thêm dự kiến cất cánh và mức độ đã phục vụ đến giai đoạn nào tại sân, các thông tin này được tích hợp từ A-CDM.

Về cơ chế refresh, TOSS sẽ không sử dụng nút refresh thủ công vì điều phái mở màn hình cả ngày và không thể bấm refresh mỗi vài giây. Phương án đề xuất là sử dụng webhook hoặc cơ chế tương đương để server đẩy thay đổi xuống client. Hệ thống có thể chỉ làm tươi từng phần dữ liệu thay vì reload toàn trang. Về hạ tầng, ví dụ điển hình là khoảng hai mươi hàng với mỗi hàng từ hai mươi đến ba mươi cột, tải lại theo phần thay đổi thay vì cả màn hình. Cơ chế hiển thị tham khảo Sketch Check (Schedule Check), một màn hình tương tự đang được sử dụng có khả năng cập nhật real-time mà không cần người dùng bấm nút.

Về cảnh báo bằng màu và hiệu ứng nhấp nháy, hệ thống hiển thị màu đỏ chuyển sang xanh theo trạng thái và có thể có hiệu ứng nhấp nháy để thu hút sự chú ý. Khi tàu bay cất cánh, các cảnh báo chuẩn bị chuyến bay tự động tắt và chuyển sang màu xanh. Một số ô như cảnh báo thời tiết mưa dông sẽ tự tắt sau khi bản tin được clear. Về quy tắc gắn cảnh báo với mốc ACARS, hệ thống chia tinh hơn theo loại cảnh báo, ví dụ cảnh báo A đến mốc OFF thì tắt, cảnh báo B đến mốc ON thì tắt và cảnh báo C đến mốc IN thì tắt.

Về phân nhóm trên màn hình giám sát tổng quan, hệ thống chia tối thiểu ba nhóm gồm chưa cất cánh, đang bay và đã hạ cánh.

Về theo dõi sự kiện phát sinh trong khi bay, điều phái lưu ý rằng TOSS không có dữ liệu tiêu hao dầu real-time của chuyến đang bay, do đó không thể monitoring chi tiết về tiêu hao dầu trong khi bay. Dữ liệu chi tiết về tiêu hao dầu chỉ có sau khi chuyến bay kết thúc và tàu về in-block, dùng cho mục đích báo cáo và phân tích Post-Flight.

**Kết luận**

TOSS cung cấp một màn Monitoring tổng quan phục vụ Phase 4 và Phase 5 để điều phái mở cả ngày, cập nhật real-time qua webhook hoặc cơ chế tương đương, chỉ cập nhật phần dữ liệu có thay đổi và không reload toàn trang. Nguồn dữ liệu mốc thời gian lấy thẳng từ ACARS. Cơ chế cảnh báo sử dụng màu sắc kết hợp hiệu ứng nhấp nháy theo trạng thái, mỗi cảnh báo có quy tắc raise và clear rõ ràng gắn với mốc ACARS riêng. Chuyến trên màn tổng quan được phân thành ba nhóm gồm chưa cất cánh, đang bay và đã hạ cánh. Trong Phase 5, TOSS không monitoring chi tiết tiêu hao dầu real-time do không có dữ liệu live, hệ thống chỉ cập nhật trạng thái các mốc bay. Phân tích chi tiết về tiêu hao dầu và đường bay thuộc về báo cáo Post-Flight được lập sau khi tàu về in-block.

---

### II.7 — Phase 6 (Post-Flight và Shift Handover): chỉ là báo cáo

**Yêu cầu**

Phase 6 diễn ra sau khi chuyến bay kết thúc, gồm các hoạt động tổng hợp tình hình và bàn giao ca trực.

**Thảo luận và Đề xuất**

Phase 6 thuần túy là hoạt động báo cáo theo trình tự chuyến đáp, đóng trễ và tổng hợp tình hình. Dữ liệu chuyến đã hạ cánh cùng với Confirm Release của phi công đã được lưu bên MO Plus, do đó TOSS chỉ kéo dữ liệu về để báo cáo và không phát sinh thao tác nghiệp vụ.

**Kết luận**

Phase 6 trên TOSS bao gồm hai hoạt động là báo cáo và bàn giao ca, không cần thiết kế chức năng nghiệp vụ riêng cho phase này.

---

### II.8 — Module Flight Dispatch chỉ có ba chức năng chính

**Yêu cầu**

Sau khi đi qua đủ sáu phase, các bên thống nhất rằng trên TOSS, module Flight Dispatch chỉ có một số ít chức năng xử lý dữ liệu OFP thực sự, phần còn lại là cảnh báo và monitoring.

**Thảo luận và Đề xuất**

Điều phái và đội khảo sát thống nhất rằng module Flight Dispatch của TOSS không có nhiều chức năng theo kiểu import. Các chức năng chính chỉ thuần đưa dữ liệu OFP lên hệ thống, sau đó Release và Unrelease. Các chức năng còn lại liên quan đến cảnh báo và monitoring được coi là lớp hỗ trợ dựa trên dữ liệu OFP cùng các nguồn ngoài như NOTAM, thời tiết, tàu bay và ACARS.

**Kết luận**

Module Flight Dispatch trên TOSS chốt ba chức năng cốt lõi gồm đẩy OFP, Release và Unrelease. Ngoài ra, hệ thống còn cung cấp các chức năng phụ trợ là cảnh báo và monitoring tương ứng theo từng phase đã trình bày ở các mục trên.

---

### II.9 — Upload tài liệu thời tiết đa chuyến (Weather Multi-Flight)

**Yêu cầu**

Hiện trạng đối với tài liệu thời tiết khu vực hoặc đường bay là điều phái gửi qua mail, sau đó hệ thống AIJS tự nhận diện và đính file vào nhiều chuyến cùng lúc theo khung giờ hiệu lực. Tên đầy đủ của AIJS cần được xác nhận, có khả năng là phần mềm soạn và đính tài liệu bay nội bộ. `[cần xác nhận]`

**Thảo luận và Đề xuất**

TOSS cần cung cấp một menu upload file thời tiết đa chuyến, cho phép người dùng chọn khoảng thời gian hiệu lực từ ngày X giờ Y đến ngày Z giờ T, sau đó hệ thống tự gắn file vào tất cả chuyến có giờ cất cánh nằm trong khoảng hiệu lực này.

Về quy tắc xếp chồng file, một chuyến có thể có nhiều file gồm một file chung và một file riêng. File chung Weather Multi-Flight áp dụng cho mọi chuyến trong khoảng hiệu lực, trong khi file riêng được attach từ FME (giả định Flight Management Editor, cần xác nhận) áp dụng cho từng chuyến cụ thể. Khoảng hiệu lực thường vào khoảng ba tiếng, ví dụ điều phái upload lúc 6 giờ sáng thì file hiệu lực đến 9 giờ sáng và mọi chuyến cất cánh trong khung 6 đến 9 giờ đều được attach. Nếu hai khoảng hiệu lực chồng nhau trong một chuyến thì chuyến đó nhận cả hai file.

Về định dạng và đặt tên file, nếu hai file cùng cấu trúc tên thì MO Plus thực hiện replace tức là ghi đè, còn nếu khác cấu trúc tên thì theo lý thuyết MO Plus giữ cả hai và hiển thị song song. Trên thực tế MO Plus đang hardcode chỉ hiển thị file cuối cùng theo tên, do đó cần phối hợp với đội MO Plus để xử lý đúng theo nguyên tắc trên.

Về việc ẩn hiện tài liệu trên MO Plus, một số tài liệu sau khi áp lên có thể không phù hợp và cần được ẩn không hiển thị cho tổ bay. TOSS cần cung cấp chức năng cho điều phái quyết định ẩn hay hiện tài liệu trên app MO Plus, áp dụng cho cả file chung và file riêng. Tuy nhiên việc xử lý cho file riêng phức tạp hơn nên trước mắt chỉ làm cho file chung.

**Kết luận**

TOSS cung cấp chức năng Upload Weather Multi-Flight cho phép chọn khoảng thời gian hiệu lực và tự gắn file vào toàn bộ chuyến nằm trong khoảng. Hệ thống hỗ trợ song song hai luồng gồm attach file riêng cho từng chuyến tương đương luồng FME hiện hành và upload file chung cho nhiều chuyến. TOSS có thể tổ chức thành hai menu hoặc hai tab cho hai luồng này. Đội phân tích cần đối chiếu với đội MO Plus về cơ chế hiển thị hai file cùng lúc theo nguyên tắc latest by name so với giữ cả hai. TOSS bổ sung chức năng ẩn hiện tài liệu trên MO Plus, áp dụng cho file chung trước, file riêng sẽ xem xét ở giai đoạn sau.

---

### II.10 — Payload Extra (dầu và nhiên liệu tổ bay lấy thêm) cùng báo cáo Pallet Relief

**Yêu cầu**

Điều phái cần một báo cáo giúp xem nhanh đối với những chuyến cùng đường bay và cùng khung giờ, chuyến nào tổ bay đã lấy thêm dầu cùng số lượng đã cộng, nhằm đánh giá quyết định cộng dầu cho chuyến hiện tại có hợp lý hay không. Ví dụ tiêu biểu được nêu là các chuyến về Sài Gòn trong cùng khung giờ chiều muộn. Hiện trạng cho thấy thông tin Payload Extra chỉ có thể xem được bằng cách mở từng chuyến với khoảng hai mươi chuyến mỗi sortie, do đó việc mở từng chuyến không khả thi trong thực tế khai thác.

**Thảo luận và Đề xuất**

Về khái niệm, Payload Extra là phần dầu hoặc nhiên liệu mà tổ bay tự đề nghị lấy thêm so với OFP của điều phái, thường được đưa ra trước khoảng ba mươi phút trước khởi hành. Việc điều phái cộng dầu vào OFP và việc tổ bay lấy thêm là hai hành động độc lập nhưng đều dẫn đến lượng dầu thực tế cao hơn OFP gốc.

TOSS đã có báo cáo Pallet Relief liệt kê các chuyến cùng Payload Extra theo ngày và có khả năng lọc theo đường bay. Cải tiến yêu cầu là bổ sung cột Payload Extra trong báo cáo, hoặc thay vào đó tính sẵn delta giữa OFP và giá trị thực tế của phi công rồi đưa vào một cột delta để điều phái nhìn nhanh. Hệ thống có thể hiển thị cả hai giá trị hoặc chỉ hiển thị delta tùy lựa chọn. Cơ chế tính delta là lấy dầu thực tế tổ bay lấy trừ đi dầu OFP để ra số kilogram lấy thêm. Báo cáo hỗ trợ truy vấn theo ngày, đường bay (ví dụ HAN-SGN), khung giờ cất cánh và loại tàu.

Về hiệu năng, query có thể lớn nên cần chuẩn xác dữ liệu để query nhanh. Đối với các báo cáo nặng, hệ thống áp dụng cơ chế trả kết quả ra một tab riêng, lưu link tải kết quả trong vòng bảy ngày để người dùng tải lại khi cần, tương tự cơ chế gửi mail báo cáo. Bản chất là di chuyển link từ mail sang tab này thay vì người dùng phải vào mail tải.

**Kết luận**

TOSS bổ sung cột Payload Extra hoặc cột delta tính bằng Actual trừ OFP vào báo cáo Pallet Relief. Báo cáo cho phép lọc theo ngày, đường bay, khung giờ và loại tàu. Cơ chế trải nghiệm sử dụng cho báo cáo nặng là trả kết quả ra tab riêng, lưu link tải trong vòng bảy ngày và hỗ trợ tải lại, tương đương luồng gửi mail báo cáo.

---

### II.11 — Tự sửa thông số trên OFP (Flight Level) trước khi đẩy lên MO Plus

**Yêu cầu**

Một số chuyến điều phái cần sửa Flight Level trên OFP, ví dụ lấy Flight Level từ ICON để chèn vào tài liệu, trong đó ICON cung cấp Flight Level cho các giai đoạn Climb, Cruise và Descend. Tên đầy đủ của ICON cần được xác nhận. Hiện trạng cho thấy điều phái phải sửa ở cả hai file nguồn là TXT và email gốc để MO Plus bốc tách đúng, công việc này vất vả và dễ phát sinh sai sót.

**Thảo luận và Đề xuất**

Hai phương án sửa OFP được đưa ra để cân nhắc. Phương án thứ nhất là TOSS sửa giúp, trong đó TOSS cung cấp form sửa Flight Level theo các giai đoạn Climb, Cruise và Descend, sau đó tự đồng bộ sửa cả TXT và email gốc rồi đẩy lên MO Plus. Phương án thứ hai là điều phái sửa thủ công, trong đó TOSS chỉ ra những trường cần sửa cùng giá trị cần sửa, điều phái download file gốc, sửa tay rồi upload lại lên TOSS và TOSS đẩy lên MO Plus.

Về ràng buộc kỹ thuật phía MO Plus, hệ thống yêu cầu cả PDF, TXT và email vì luật bốc tách phụ thuộc các nguồn này, do đó không thể chỉ sửa PDF. Các trường thường sửa gồm giờ, Brady, dầu mỡ và ADC, trong đó chủ yếu là dầu mỡ. Tên đầy đủ của Brady và ADC cần được xác nhận. Các trường gần như cố định không cần sửa là số hiệu tàu bay và đường bay.

Hai bên thống nhất nguyên tắc TOSS sẽ chỉ ra rõ chỗ cần sửa và giá trị cần sửa để điều phái cố gắng sửa cho tương thích, sau đó hệ thống nhập lên MO Plus theo đúng luật bốc tách. Phương án thuận tiện nhất cho điều phái là sửa tay trên file gốc rồi upload, MO Plus sẽ nhận thêm nguồn từ TOSS, bốc tách rồi đẩy sang app.

**Kết luận**

TOSS hỗ trợ điều phái sửa OFP theo một trong hai phương án trên, lựa chọn cuối cùng sẽ chốt sau khi có phân tích kỹ thuật chi tiết. Phương án 1 cung cấp form trên TOSS để TOSS sửa file gốc, trong khi phương án 2 là TOSS chỉ ra chỗ cần sửa và điều phái sửa tay rồi upload lại. Trường sửa ưu tiên gồm Flight Level lấy từ ICON, dầu mỡ, giờ, Brady và ADC. Đầu ra phải đúng format để MO Plus bốc tách. `[cần xác nhận tên đầy đủ ICON, Brady, ADC]`

---

### II.12 — Logitech, GDTN, Logitech.com (tài liệu và dịch vụ liên quan đến upload)

**Yêu cầu**

Điều phái nhắc đến các tên Logitech, GDTN và Logitech.com khi bàn về quản lý chứng cứ tổ bay đã upload tài liệu. Các tên này có thể bị nhận dạng sai do chất lượng âm thanh và cần được xác nhận tên chính xác. `[cần xác nhận]`

**Thảo luận và Đề xuất**

Theo ngữ cảnh, đây có vẻ là trang hoặc cổng cho tổ bay tự khai báo đã upload một số tài liệu, và TOSS muốn xem được thông tin tổ bay đã upload hay chưa để hiển thị cho điều phái. Để hỗ trợ quy trình, khi tổ bay vào xem cổng tài liệu, điều phái cần có log để biết tổ bay đã xem hay chưa và đã lấy thêm câu hỏi nào. TOSS có thể hiển thị thêm thông tin log truy cập tại đây cho điều phái khi cần. Một phương án giao diện được nhắc tới là hiển thị thêm cột log hoặc đếm số lần truy cập.

**Kết luận**

TOSS bổ sung chức năng hiển thị log truy cập và upload tài liệu của tổ bay từ nguồn Logitech hoặc GDTN. Phạm vi cụ thể là chỉ đọc hay có thao tác sẽ được làm rõ ở buổi khảo sát sau.

---

### II.13 — Backup nguồn dữ liệu khi Lido lỗi

**Yêu cầu**

Khi Lido lỗi và không sinh được OFP, TOSS phải có cách giúp đẩy OFP lên MO Plus để chuyến bay vẫn khai thác được.

**Thảo luận và Đề xuất**

Lido xuất ra ba định dạng song song là PDF, TXT và HTML, và cả ba định dạng đều cần thiết cho luồng vận hành. Định dạng TXT dùng để bốc tách NOTAM và giờ. Định dạng HTML dùng để bốc tách group và một số phần khác. Định dạng PDF dùng cho hiển thị. Hiện tại adapter Lido cung cấp đủ ba nguồn này và MO Plus mix lại.

Khi Lido lỗi, phương án xử lý là TOSS dùng nguồn ba file gốc đã từng lưu để cho điều phái lấy chuyến tương tự ngày trước làm template. Adapter hiện đã lưu file raw, do đó TOSS cung cấp link download để điều phái lấy về sửa. Điều phái xem một danh sách dạng gói tài liệu chuyến bay, download cả gói gồm email và TXT, sửa nội dung cần thiết bao gồm chủ yếu là giờ, Brady, dầu mỡ và ADC, sau đó upload lại lên TOSS và TOSS đẩy ba định dạng lên MO Plus. Các trường giữ nguyên gồm số hiệu tàu bay và đường bay. Trường ADC chỉ cần đúng số hiệu tàu và đường bay là phù hợp.

Hai bên cũng cân nhắc phương án sửa duy nhất file PDF rồi nhờ AI document phân tích lại, tuy nhiên đánh giá là không khả thi do MO Plus phụ thuộc cả ba nguồn để bốc tách đúng theo luật. Người dùng sửa tay không tránh được sai sót, do đó cần TOSS chỉ rõ chỗ cần sửa và cách sửa để giảm rủi ro, sau đó vẫn upload đầy đủ ba định dạng để MO Plus xử lý theo luồng cũ.

**Kết luận**

TOSS có chức năng backup khi Lido lỗi với hai hoạt động chính. Hoạt động thứ nhất là cho phép download file raw PDF, TXT và HTML của chuyến trước hoặc chuyến tương tự làm template. Hoạt động thứ hai là cho phép điều phái sửa tay theo phương án đã chọn tại §II.11, sau đó upload lại lên TOSS và TOSS đẩy đủ ba định dạng lên MO Plus. Định dạng đầu ra của TOSS phải đúng luật bốc tách của MO Plus.

---

## III. Các nội dung đã thống nhất (buổi chiều)

| # | Nội dung thống nhất | Liên kết §II |
|---|---|---|
| 1 | Bổ sung cảnh báo "Chuyến bay thiếu tài liệu" vào module Dispatch | §II.1 |
| 2 | Bổ sung cảnh báo "Tổ bay chưa tải tài liệu mới nhất", TOSS kéo trạng thái download từ MO Plus | §II.1 |
| 3 | Bổ sung cảnh báo "Chuyến không thường lệ — OFP chưa có STS/HEAD", chuyến nhận diện qua mã O hoặc trường Flight Type | §II.2 |
| 4 | Quy trình điều phái trên TOSS chia sáu giai đoạn gồm chuẩn bị đầu ca, chuẩn bị OFP, Post-Release Transition, theo dõi chuẩn bị khởi hành, theo dõi trong khi bay và sau chuyến bay cùng bàn giao ca | §II.3 |
| 5 | Buổi hôm nay đã hoàn tất giai đoạn một và một phần giai đoạn hai, các giai đoạn còn lại sẽ tiếp tục ở buổi khảo sát kế tiếp | §II.3 |
| 6 | Lido không có khái niệm phiên bản, TOSS gán phiên bản theo thứ tự nhận với quy ước R1, R2 hoặc 2.1, Lido chỉ có số OFP | §II.4 |
| 7 | Cơ chế Unrelease: điều phái bấm Unrelease trên TOSS, TOSS sinh revision mới với nội dung của phiên bản cũ được chọn từ danh sách rồi bắn sang MO Plus | §II.4 |
| 8 | MO Plus phải reset trạng thái Confirm Release của phi công khi nhận revision mới từ TOSS, phi công phải Confirm Release lại | §II.4 |
| 9 | Sau Unrelease, điều phái phải bấm Dispatch Release thêm một lần nữa trên revision mới để bản đó được khai thác chính thức | §II.4 |
| 10 | Phi công và điều phái không cần lên Lido trong tình huống quay lui, toàn bộ xử lý qua TOSS | §II.4 |
| 11 | TOSS Phase 3 (Post-Release Transition) chỉ quét cảnh báo và tham chiếu, không cập nhật OFP, thao tác cập nhật phiên bản mới nằm ở Lido | §II.5 |
| 12 | Cảnh báo chuẩn bị chuyến bay tắt khi tàu cất cánh, cảnh báo NOTAM và thời tiết en-route duy trì đến khi hạ cánh | §II.5, §II.6 |
| 13 | Phase 4 và Phase 5 (Monitoring) lấy mốc thời gian thực tế từ ACARS trực tiếp, không qua Mission Watch | §II.6 |
| 14 | Màn Monitoring tổng quan cập nhật real-time qua webhook hoặc cơ chế tương đương, chỉ refresh phần dữ liệu có thay đổi, không reload toàn trang | §II.6 |
| 15 | Cảnh báo có quy tắc raise và clear theo mốc ACARS riêng cho mỗi loại, chuyến phân thành ba nhóm chưa cất cánh, đang bay và đã hạ cánh | §II.6 |
| 16 | Phase 5 (In-Flight) không monitoring chi tiết tiêu hao dầu real-time, phân tích chi tiết thuộc báo cáo Post-Flight | §II.6 |
| 17 | Phase 6 trên TOSS gồm báo cáo và bàn giao ca, không phát sinh chức năng nghiệp vụ riêng | §II.7 |
| 18 | Module Flight Dispatch TOSS có ba chức năng cốt lõi: đẩy OFP, Release và Unrelease | §II.8 |
| 19 | TOSS có chức năng Upload Weather Multi-Flight theo khoảng thời gian hiệu lực, tự gắn vào toàn bộ chuyến trong khoảng | §II.9 |
| 20 | TOSS hỗ trợ song song hai luồng: attach file riêng cho từng chuyến và upload file chung cho nhiều chuyến | §II.9 |
| 21 | TOSS bổ sung chức năng ẩn hiện tài liệu trên MO Plus, áp dụng cho file chung trước, file riêng xem xét ở giai đoạn sau | §II.9 |
| 22 | TOSS bổ sung cột Payload Extra hoặc delta tính bằng Actual trừ OFP vào báo cáo Pallet Relief, cho phép lọc theo ngày, đường bay, khung giờ và loại tàu | §II.10 |
| 23 | Báo cáo nặng trả tab kết quả riêng và lưu link tải bảy ngày | §II.10 |
| 24 | TOSS hỗ trợ điều phái sửa Flight Level, dầu mỡ, giờ và ADC trên OFP, đảm bảo đầu ra TXT và email đúng format để MO Plus bốc tách | §II.11 |
| 25 | TOSS hiển thị log upload và truy cập tài liệu của tổ bay từ nguồn Logitech hoặc GDTN `[tên cần xác nhận]` | §II.12 |
| 26 | TOSS có chức năng backup khi Lido lỗi gồm download file raw template, sửa tay và upload lại, sau đó đẩy đủ ba định dạng PDF, TXT và HTML lên MO Plus | §II.13 |

---

## IV. Vấn đề cần làm rõ (buổi chiều)

1. **Danh mục mã loại chuyến (Flight Type Code):** Liệt kê đầy đủ các mã O, Z, G, H, A, P, V, S cùng những mã khác chưa được nêu, kèm ý nghĩa từng mã và phân loại mã nào yêu cầu STS/HEAD trong OFP, mã nào không.

2. **Tên cơ chế claim phí khí thải:** Cơ chế là CORSIA, EU ETS hay cả hai, mục đích để TOSS xếp trường STS/HEAD vào nhóm trường có ảnh hưởng quy định và quản lý chi phí.

3. **Cơ chế phối hợp TOSS với MO Plus khi reset Confirm Release:** Cần làm rõ tín hiệu, payload, timing và hành vi notification trên app MO Plus khi MO Plus reset Confirm Release của phi công.

4. **Cách TOSS gán phiên bản sau Unrelease:** Hệ thống dùng quy ước sub-version dạng 2.1 hay quy ước auto-tăng dạng 4, cần chọn quy ước chính thức.

5. **Viết tắt CCD trong giai đoạn chuẩn bị OFP:** Tên đầy đủ và phạm vi tài liệu CCD được điều phái nhắc tới ở phần kế trình hôm sáng.

6. **Tên hệ thống Mission Watch và quan hệ với ACARS:** TOSS lấy thẳng từ ACARS hay qua Mission Watch, và Mission Watch có còn vai trò song song trong giai đoạn theo dõi không.

7. **Viết tắt AIJS:** Tên đầy đủ và phạm vi của hệ thống AIJS hiện đang nhận diện file Weather Multi-Flight và đính chuyến tự động.

8. **Viết tắt FME:** Có phải là Flight Management Editor hay không, hiện đang là chỗ điều phái attach file riêng cho từng chuyến.

9. **Tên hệ thống hoặc tham số ICON:** Cung cấp Flight Level cho các giai đoạn Climb, Cruise và Descend.

10. **Tên chính xác Logitech, GDTN, Logitech.com:** Nguồn dữ liệu log tổ bay upload tài liệu, các tên trên có thể bị nhận dạng sai và cần xác nhận tên gốc.

11. **Sketch Check trong tài liệu monitoring:** Có phải Schedule Check hay không, cách hiển thị tham khảo của hệ thống này.

12. **Viết tắt Brady và ADC ở §II.11:** Tên đầy đủ và các trường cụ thể trong OFP hoặc TXT cần sửa.

13. **Hệ thống xử lý nguồn ba file TXT, HTML và PDF ở phía MO Plus:** Quy tắc bốc tách chi tiết để TOSS đảm bảo đầu ra đúng format khi backup Lido.

> Các điểm trên cần được ghi nhận tập trung tại sổ theo dõi `SO-THEO-DOI-DIEM-CHOT-v0.1.md` (OID-TOSS-001), đề xuất mã kế tiếp SME-19 trở đi và KS-20 trở đi.

---

## V. Thuật ngữ đề xuất bổ sung domain-knowledge

> **Chỉ đề xuất, không tự ghi vào glossary.** Chờ BA Lead confirm theo quy ước "Glossary: trình đề xuất trước khi ghi".

| # | Thuật ngữ | Mô tả từ ngữ cảnh | Nguồn dòng |
|---|---|---|---|
| 1 | **STS/HEAD** (đã có trong glossary, đề xuất mở rộng) | Bổ sung ngữ cảnh: chỉ thị bắt buộc cho mọi chuyến không thường lệ chứ không chỉ riêng VIP. Là căn cứ claim miễn trừ phí khí thải, nếu OFP không có STS/HEAD thì hãng có thể bị tính phí cho chuyến đó. Cảnh báo "OFP chưa có STS/HEAD" cho chuyến không thường lệ là cảnh báo bắt buộc trước Captain's Release | dòng 50–115 |
| 2 | **Flight Type Code (O, Z, G, H, A, P, V, S)** | Mã loại chuyến nội bộ VNA dùng để phân biệt chuyến thường và không thường lệ, nhận diện ở Lido và flight plan. Một số mã (ví dụ mã O) tương ứng "non-scheduled" với chuyển đổi `S` sang `N`. Danh mục đầy đủ chưa rõ | dòng 80–95 |
| 3 | **Dispatch Release** (đã có, đề xuất mở rộng) | Bổ sung: Release và Unrelease là cặp thao tác đối xứng trên TOSS. Sau Unrelease, điều phái phải bấm Dispatch Release thêm một lần nữa trên revision mới để bản đó được khai thác chính thức | dòng 220–620 |
| 4 | **Unrelease (TOSS)** | Thao tác chủ động của điều phái trên TOSS để hủy bỏ Dispatch Release của phiên bản hiện tại và quay về một phiên bản OFP cũ hơn. TOSS sinh revision mới (ví dụ 2.1 hoặc 4 chứa data của 2) rồi đẩy lên MO Plus. Phi công không thao tác Lido | dòng 270–620 |
| 5 | **OFP Number so với OFP Version** | OFP Number là định danh do Lido sinh, OFP Version là chỉ số do TOSS gán theo dãy R1, R2. Lido không có khái niệm version | dòng 525–545 |
| 6 | **Confirm Release** | Hành động phi công xác nhận đã nhận tài liệu OFP đã Dispatch Release trên MO Plus. Bị reset về không khi TOSS Unrelease và sinh revision mới. ASR đôi chỗ đọc lệch thành "Reload OSP" nhưng ngữ cảnh chính xác là "Confirm Release" trong nghiệp vụ Captain's Release | dòng 583–614 |
| 7 | **Post-Release Transition (Phase 3)** | Giai đoạn sau Release đến trước cất cánh, TOSS quét cảnh báo liên tục về NOTAM, thời tiết, tàu bay và tải, thao tác cập nhật OFP phiên bản mới nằm ở Lido | dòng 635–745 |
| 8 | **Mission Watch** | Hệ thống hoặc màn hình giám sát chuyến bay hiện hành ngoài TOSS, đã tích hợp ACARS để biết chuyến đang ở phase nào. TOSS tham chiếu nhưng lấy thẳng nguồn ACARS chứ không qua Mission Watch | dòng 765–815 |
| 9 | **A-CDM** (đã có) bổ sung ngữ cảnh phase 4 | TOSS dùng A-CDM để biết chuyến đã phục vụ đến giai đoạn nào tại sân, phục vụ màn monitoring tổng quan | dòng 832–845 |
| 10 | **ACARS Phase Trigger** | Quy tắc raise và clear cảnh báo gắn với mốc ACARS riêng cho mỗi loại cảnh báo: cảnh báo loại A tắt khi OFF, cảnh báo loại B tắt khi ON, cảnh báo loại C tắt khi IN | dòng 903–910 |
| 11 | **Sketch Check / Schedule Check** | Hệ thống hoặc màn hình tham khảo cho cơ chế hiển thị real-time kết hợp hiệu ứng nhấp nháy và auto-refresh theo chu kỳ ngắn | dòng 1020–1030 |
| 12 | **Weather Multi-Flight** | File thời tiết khu vực hoặc đường bay áp cho nhiều chuyến trong khoảng thời gian hiệu lực, thường khoảng ba tiếng. Upload qua TOSS và tự đính vào toàn bộ chuyến trong khoảng | dòng 1199–1265 |
| 13 | **AIJS** | Hệ thống hoặc phần mềm trung gian nội bộ VNA hiện đang nhận diện file Weather Multi-Flight gửi qua email và tự đính vào nhiều chuyến. TOSS sẽ thay thế hoặc phối hợp | dòng 1275–1310 |
| 14 | **FME** | Chỗ điều phái hiện đang attach file riêng cho từng chuyến (giả định Flight Management Editor, cần xác nhận) | dòng 1285–1290 |
| 15 | **Payload Extra (Pallet Relief)** | Lượng dầu hoặc nhiên liệu tổ bay tự đề nghị lấy thêm so với OFP của điều phái, thường khoảng ba mươi phút trước khởi hành. Báo cáo Pallet Relief hiện đang liệt kê các chuyến cùng Payload Extra theo ngày và đường bay. TOSS bổ sung cột delta tính bằng Actual trừ OFP để điều phái đối chiếu nhanh | dòng 1542–1600 |
| 16 | **ICON** | Hệ thống hoặc tham số khí tượng cung cấp Flight Level cho các giai đoạn Climb, Cruise và Descend. Điều phái lấy Flight Level từ ICON và sửa vào OFP (TXT cùng email) để MO Plus bốc tách đúng | dòng 1700–1715 |
| 17 | **OFP Source — ba định dạng PDF, TXT, HTML** | Lido xuất OFP ở ba định dạng song song. TXT dùng để bốc tách NOTAM và giờ, HTML dùng để bốc tách group, PDF dùng hiển thị. MO Plus mix ba nguồn. TOSS backup phải đẩy đủ ba nguồn | dòng 1626–1660 |
| 18 | **MO Plus Latest by Filename** | Cơ chế MO Plus chỉ hiển thị file cuối cùng theo tên (replace), file khác tên theo lý thuyết sẽ giữ song song nhưng thực tế thuật toán đang hardcode replace | dòng 1437–1500 |
| 19 | **Logitech / GDTN** `[tên chưa xác nhận]` | Nguồn dữ liệu log tổ bay đã upload và truy cập tài liệu. TOSS hiển thị cho điều phái biết tổ bay đã vào xem hay chưa | dòng 1504–1525 |
| 20 | **Report Tab + Link 7-day** | Cơ chế trải nghiệm sử dụng cho báo cáo nặng: trả kết quả ra tab riêng, lưu link tải bảy ngày và hỗ trợ tải lại, tương tự gửi mail báo cáo | dòng 1614–1623 |

---

*Báo cáo buổi chiều 11/06/2026, lập ngày 2026-06-16, phiên bản v0.3. Các điểm gắn cờ `[cần xác nhận]` cần phỏng vấn bổ sung hoặc đối chiếu SME trước khi đưa vào tài liệu yêu cầu chính thức. Điểm cần chốt được theo dõi tại OID-TOSS-001.*
