---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.3"
date: "2026-06-16"
survey_date: "2026-06-12"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Phỏng vấn Dispatcher buổi sáng 12/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi sáng 12/06/2026 (Phỏng vấn Dispatcher)

> Báo cáo tổng hợp buổi sáng ngày 12/06/2026 gồm hai phần nối tiếp. Phần 1 bàn về màn chi tiết chuyến bay (Flight Detail) và cấu trúc Flight Number trên Netline. Phần 2 đi sâu thiết kế màn hình Giám sát chuyến bay (Flight Monitoring) của điều phái, toàn bộ Phần 2 được thảo luận trực tiếp trên bản mẫu giao diện `dsp_monitoring_poc.html` do đội phân tích trình bày.

## I. Thông tin chung

| Mục | Nội dung |
|---|---|
| **Thời gian** | Buổi sáng ngày 12/06/2026 (hai phần nối tiếp) |
| **Đối tượng phỏng vấn** | Điều phái viên (Dispatcher) của VNA — chị Lê, anh Dũng, anh Bình |
| **Phía khảo sát** | Đội phân tích nghiệp vụ TOSS (anh Dương và nhóm) |
| **Tài liệu trực quan** | Bản mẫu giao diện `dsp_monitoring_poc.html` mô phỏng màn Flight Monitoring với sidebar điều hướng, topbar thống kê, thanh bộ lọc, bảng giám sát nhiều cột và mã màu trạng thái, được dùng làm cơ sở thảo luận thiết kế chi tiết |
| **Mục đích** | Thống nhất hình thức hiển thị Flight Detail và cấu trúc tab phụ. Làm rõ cấu trúc Flight Number trên Netline. Thiết kế chi tiết màn Giám sát bao gồm phân quyền theo phạm vi, quy ước giao diện chung, bộ mã màu cảnh báo, cơ chế trôi theo thời gian và logic cảnh báo của từng cột (Tàu bay, Dispatch Release, Flight Number, ETA/IN) |

---

# PHẦN 1 — Màn chi tiết Flight Detail và cấu trúc Flight Number trên Netline

## II. Nội dung trao đổi (chủ đề 1–3)

### 1. Hình thức hiển thị Flight Detail: pop-up từ trên xuống hay tab mới

**Yêu cầu**

Điều phái cần một cơ chế hiển thị chi tiết chuyến bay (Flight Detail) cho phép truy cập nhanh, hạn chế phải cuộn dài và có thể mở đồng thời nhiều chuyến để tham chiếu chéo trong quá trình theo dõi.

**Thảo luận và Đề xuất**

Phương án đầu tiên được đưa ra là pop-up dạng từ trên xuống dưới, gom thông tin theo các nhóm có thể thu gọn hoặc mở rộng. Nhược điểm của phương án này là độ dài các nhóm không đều nhau khiến người dùng phải kéo chuột nhiều, thao tác chậm hơn so với click. Khi được hỏi về nhu cầu so sánh hai chuyến cùng lúc, điều phái xác nhận rằng nghiệp vụ không phức tạp đến mức phải so sánh đồng thời trên một màn hình, khi cần thì có thể mở hai cửa sổ riêng.

Phương án thay thế được đề xuất là từ màn Giám sát, click vào một chuyến sẽ mở sang một tab mới chứa Flight Detail của chuyến đó và cho phép mở nhiều tab cùng lúc. Bên cạnh đó, khi điều phái click vào một cảnh báo cụ thể, hệ thống sẽ mở Flight Detail và đồng thời active đúng tab phụ chứa thông tin tương ứng. Ví dụ, click cảnh báo OFP Release sẽ dẫn tới tab OFP Release, click cảnh báo NOTAM hoặc thời tiết sẽ dẫn tới tab NOTAM hoặc thời tiết tương ứng.

**Kết luận**

Khi click chuyến từ màn Giám sát, hệ thống mở một tab mới chứa Flight Detail thay vì pop-up duy nhất, đồng thời cho phép mở nhiều tab song song. Khi click vào một cảnh báo, hệ thống mở Flight Detail và active sẵn đúng tab phụ tương ứng với cảnh báo đó.

### 2. Cấu trúc các tab phụ và lịch sử trong Flight Detail

**Yêu cầu**

Flight Detail phải hiển thị toàn bộ vết thông tin từ đầu đến cuối chuyến chứ không chỉ trạng thái cuối, nhằm phục vụ nhu cầu truy vết và đối chiếu khi xảy ra sự cố.

**Thảo luận và Đề xuất**

Điều phái hình dung sơ bộ cấu trúc Flight Detail gồm bốn nhóm tab phụ. Tab Cảnh báo (Warnings) ghi nhận toàn bộ cảnh báo phát sinh từ đầu đến cuối chuyến, trạng thái đã xử lý hay chưa, thời gian phát sinh và thời gian kích cảnh báo (raise time). Tab Flight Release bao gồm cả Dispatch Release và Pilot Release, bên ngoài chỉ thể hiện cảnh báo trạng thái tổng quát và việc Pilot Release đã đến bản cuối do điều phái phát hành hay chưa, còn bên trong hiển thị toàn bộ phiên bản OFP đã phát hành kèm thông tin cơ bản như Block Fuel kế hoạch, Block Fuel trên OFP, lượng phi công confirm, có lấy thêm tải hoặc dầu (extra) hay không và lý do kèm theo. Tab Tàu bay (Aircraft) phản ánh hiện trạng tàu cùng với MEL/CDL và các lưu ý về tàu quay đầu. Tab Tổ bay (Crew) ghi đầy đủ luồng thay đổi tổ bay, từ ai được gán ban đầu, ai đổi và đổi lúc nào, cho đến cuối cùng tổ bay là ai, đảm bảo lưu trọn câu chuyện thay đổi chứ không chỉ trạng thái cuối.

Nguyên tắc xuyên suốt là mỗi tab phụ đại diện cho một nhóm thông tin nghiệp vụ độc lập, và mọi cảnh báo bên ngoài đều có đích đến chính xác là tab tương ứng khi điều phái click vào.

**Kết luận**

Flight Detail được tổ chức thành nhiều tab phụ với cấu trúc tối thiểu gồm Cảnh báo, Flight Release (bao gồm Dispatch Release và Pilot Release), Tàu bay kèm MEL/CDL, và Tổ bay. Mỗi tab hiển thị đầy đủ lịch sử thay đổi từ đầu đến cuối chuyến, riêng tab Cảnh báo hiển thị thêm raise time và trạng thái xử lý. Chi tiết hóa từng tab sẽ được tiếp tục ở các buổi khảo sát sau.

### 3. Cấu trúc dữ liệu Flight Number trên Netline và lịch sử đổi giờ EPD

**Yêu cầu**

Hai bên cần thống nhất cách tách dữ liệu Flight Number trên Netline khi tích hợp về TOSS, phục vụ cả hiển thị trên màn Giám sát lẫn phân quyền và lọc theo hãng.

**Thảo luận và Đề xuất**

Trên Netline, Flight Number được tách thành ba cột riêng biệt. Cột thứ nhất là Carrier — mã hãng (ví dụ VN…) hoặc mã khác. Cột thứ hai là Fly Number — chỉ phần số của số hiệu chuyến (ví dụ 247). Cột thứ ba là FN Surface, hay còn gọi là suffix, mang ký tự hậu tố `Z` hoặc `D` cho biết chuyến có chuyển hoặc delay sang ngày sau hay không. Khi tích hợp Netline, TOSS sẽ lấy dữ liệu theo đúng cấu trúc ba cột này, từ đó phân biệt được 393 (cột 2) khác với 393D (cột 2 kết hợp cột 3).

Về lịch sử đổi giờ, Netline đã duy trì leg history ghi nhận từng lần thay đổi giờ EPD của chuyến, bao gồm thời điểm thay đổi, chuyển từ ngày nào sang ngày khác và mức delay bao nhiêu giờ. Điều phái khẳng định dữ liệu này đầy đủ nên TOSS sẽ đối chiếu và đồng bộ trực tiếp từ Netline thay vì tự xây dựng song song một module lịch sử khác.

**Kết luận**

TOSS lấy Flight Number ba cột tách biệt từ Netline gồm carrier, fly number và FN suffix D/Z, sau đó hiển thị gộp trên màn Giám sát. Lịch sử thay đổi giờ EPD (leg history) cũng được lấy trực tiếp từ Netline. Ý nghĩa chính xác của ký tự `Z` so với `D` còn chưa rõ và cần được làm rõ ở buổi sau.

---

# PHẦN 2 — Thiết kế màn hình Giám sát chuyến bay (trên bản mẫu dsp_monitoring_poc.html)

### 4. Bản mẫu giao diện Giám sát và quy ước thể hiện cảnh báo trong ô bảng

**Yêu cầu**

Màn Giám sát phải đóng vai trò một bảng tổng quan nhiều chuyến, cảnh báo các vấn đề cần lưu ý trước, trong và sau chuyến như NOTAM, thời tiết, đổi giờ, lệch tải, MEL/CDL, Dispatch Release và nhiều yếu tố khác. Người dùng cần xem được chi tiết của từng lưu ý để biết hành động cần thực hiện. Toàn bộ cảnh báo được xây dựng theo bộ quy trình chuẩn của điều phái, trong đó bản quy trình chỉ mang tính tham khảo còn vận hành thực tế vẫn linh hoạt phối hợp giữa TOSS và Lido.

**Thảo luận và Đề xuất**

Đội phân tích trình bày một bản mẫu giao diện làm cơ sở thống nhất chi tiết thiết kế, trong đó mỗi dòng tương ứng với một chuyến và các cột thể hiện tàu, tuyến, giờ, trạng thái cùng các cảnh báo. Về cách thể hiện cảnh báo trong ô, các bên thống nhất tô màu cả ô (cell-level) thay vì bo box hay chỉ đổi màu chữ, lý do là điều phái đã quen với thói quen nhìn nguyên ô được tô màu khi giám sát. Trên bản mẫu hiện đang đặt cạnh nhau hai kiểu thể hiện để lựa chọn, trong đó cột Missing Document được bó thành box còn các cột khác chỉ đổi màu chữ. Điều phái không thích kiểu phức tạp và ưu tiên ký hiệu trạng thái đơn giản như dấu tích hoặc tam giác, với nguyên tắc càng đơn giản càng tốt, riêng cột Missing Document được giữ nguyên kiểu danh sách tài liệu thiếu như hiện có. Cuối cùng, dù bản mẫu đang vẽ nhiều màu để minh họa, thực tế đa phần các dòng sẽ ở trạng thái phông nền bình thường (không màu) và cảnh báo chỉ chiếm số ít.

**Kết luận**

Màn Giám sát được trình bày dưới dạng bảng với mỗi dòng tương ứng một chuyến, sử dụng cách tô màu cả ô để thể hiện cảnh báo thay vì bo box hay chỉ đổi màu chữ. Ký hiệu trạng thái được ưu tiên thiết kế đơn giản, riêng cột Missing Document tiếp tục giữ cách thể hiện danh sách tài liệu thiếu.

### 5. Phân quyền view theo phạm vi và lưu cấu hình theo profile

**Yêu cầu**

Mỗi điều phái phụ trách một phạm vi chức nhiệm khác nhau, có người phụ trách khu vực châu Âu, Mỹ, Hàn hay các khu vực khác. Vì vậy màn Giám sát cần mặc định hiển thị đúng phạm vi của từng người nhưng vẫn cho phép mở rộng để xem các phạm vi khác khi cần.

**Thảo luận và Đề xuất**

Các bên thống nhất chức năng giữa các user là giống nhau, chỉ khác nhau ở phạm vi dữ liệu (view) theo role. Trên cơ sở đó, hệ thống phân quyền hai lớp gồm phân quyền chức năng (ai dùng chức năng gì) và phân quyền dữ liệu (scope theo carrier, khu vực hoặc đường bay). Ở cấp quản trị, super admin xem được toàn bộ dữ liệu, đồng thời có thêm vai trò sub-admin để phân chia view theo nhiệm vụ vì điều phái có thể rotate vị trí trong ca trực. Mỗi user có thể được định nghĩa nhiều role và chủ động chọn xem theo role của mình hoặc role của người khác (switch view).

Về cấu hình, filter mặc định gắn theo phạm vi của role được gán, người dùng vẫn có thể search hoặc chọn phạm vi khác khi cần. Khi user mở tab Giám sát, hệ thống sẽ load cấu hình đã lưu của user đó bao gồm cột hiển thị và filter. Cấu hình này được lưu vào profile cá nhân ở mức user thay vì theo máy, đảm bảo khi đăng nhập ở máy nào người dùng cũng giữ nguyên trải nghiệm. Ở mức tối thiểu, hệ thống chỉ cần lưu trạng thái gần nhất (last-used) chứ không cần lưu lại data. Ngoài ra, thanh bộ lọc được thiết kế có cơ chế thu mở (expand/collapse) để tối ưu diện tích hiển thị, với cấu hình mặc định ở trạng thái mở.

**Kết luận**

Hệ thống áp dụng phân quyền hai lớp gồm phân quyền chức năng và phân quyền dữ liệu theo carrier, khu vực hoặc role. Mỗi user có thể được gán nhiều role và switch view giữa các role, super admin xem được toàn bộ và có thêm sub-admin để phân chia theo nhiệm vụ. Filter, cấu hình hiển thị và trạng thái gần nhất được lưu ở profile cá nhân thay vì theo máy. Bộ lọc trên màn Giám sát có cơ chế thu mở để tối ưu không gian.

### 6. Quy ước giao diện chung về ngôn ngữ, giờ, format và theme

**Yêu cầu**

Các bên cần chốt quy ước giao diện chung ngay từ đầu để đội phát triển nắm bắt và áp dụng đồng nhất, tránh phải sửa đổi về sau.

**Thảo luận và Đề xuất**

Chị Lê chốt bốn quy ước cơ bản áp dụng toàn bộ TOSS. Thứ nhất, ngôn ngữ giao diện sử dụng 100% tiếng Anh, không dùng tiếng Việt. Thứ hai, mọi giờ trong hệ thống đều là UTC, kể cả khi người dùng submit từ thiết bị đang theo giờ Việt Nam thì history vẫn được ghi nhận theo UTC, riêng bản demo hiện còn vướng phần giờ cần được sửa lại. Thứ ba, format giờ luôn theo chuẩn 24 giờ, không dùng định dạng 12 giờ kèm AM/PM. Thứ tư, về theme hiển thị, giai đoạn đầu ưu tiên tối ưu dark mode vì điều phái thường làm ca đêm và nhìn nền trắng gây lóa, mỏi mắt, đồng thời trên nền tối các màu cảnh báo cũng nổi bật hơn, còn light mode sẽ được tinh chỉnh ở giai đoạn sau.

**Kết luận**

Toàn bộ giao diện TOSS thống nhất sử dụng tiếng Anh, giờ UTC, format 24 giờ và ưu tiên dark mode ở giai đoạn đầu.

### 7. Bộ mã màu cảnh báo bốn trạng thái áp dụng thống nhất mọi cột

**Yêu cầu**

Hệ thống cần một bộ mã màu thống nhất dùng xuyên suốt mọi cột trên màn Giám sát, tránh tình trạng cùng một màu lại mang nghĩa khác nhau ở các cột khác nhau gây nhầm lẫn cho điều phái.

**Thảo luận và Đề xuất**

Các bên thống nhất bộ mã màu gồm bốn trạng thái sắp xếp từ nặng đến nhẹ. Màu đỏ thể hiện cảnh báo cần action ngay và chưa được xử lý, bắt buộc phải xử lý để mất đỏ. Màu vàng thể hiện thông tin cần lưu ý, có thể chưa cần xử lý ngay nhưng phải theo dõi. Màu xanh lá xuất hiện khi một cảnh báo đỏ đã được xử lý xong, với quy tắc nghiêm ngặt là xanh chỉ xuất hiện sau khi đã từng có đỏ, không có trường hợp xanh từ đầu. Trạng thái còn lại là không màu (phông nền bình thường) áp dụng cho các chuyến không phát sinh cảnh báo, đây là trạng thái mặc định và chiếm đa phần các dòng trên bảng. Tổng số màu được giới hạn ở mức 4 đến 5 màu để giữ tính dễ đọc.

Một câu hỏi đặt ra là tại sao giữ "xanh đã xử lý" thay vì cho về không màu. Lý do là để điều phái biết rõ mình đã xử lý cảnh báo, đồng thời phục vụ thống kê khối lượng công việc theo ngày hoặc theo giờ cao điểm. Số lượng ô xanh trong một khoảng thời gian là cơ sở để đánh giá cường độ làm việc, từ đó phân chia ca trực cũng như tăng giảm nhân lực phù hợp.

Về cơ chế đổi màu, điều phái không tự tick để chuyển trạng thái mà màu sẽ đổi tự động khi điều phái xử lý ở hệ thống nguồn, ví dụ như làm lại OFP trên Lido hoặc bấm Dispatch Release, sau đó TOSS tích hợp tín hiệu để cập nhật màu. Nguyên tắc xuyên suốt là màn Giám sát chỉ giám sát và cảnh báo chứ không cho thao tác trực tiếp trên bảng để thay đổi data, mọi hành động đều thực hiện trên hệ thống chuyên dụng.

**Kết luận**

Bộ mã màu thống nhất gồm bốn trạng thái Đỏ, Vàng, Xanh lá và Không màu, áp dụng cho mọi cột trên màn Giám sát. Xanh chỉ xuất hiện sau khi đã có đỏ và được xử lý xong, không có trường hợp xanh từ đầu, còn không màu thể hiện trạng thái bình thường. Màu được đổi tự động theo trạng thái dữ liệu nguồn, điều phái không tick thủ công. Màn Giám sát chỉ đóng vai trò view và cảnh báo, không cho thao tác trực tiếp, ngoại trừ cột Dispatch Release sẽ được trình bày ở §10. Trạng thái xanh được giữ lại nhằm phục vụ thống kê khối lượng công việc theo ngày và giờ cao điểm.

### 8. Cơ chế trôi theo thời gian, time window và chuyến đường dài chưa đáp

**Yêu cầu**

Lịch bay một ngày của VNA có thể lên tới khoảng 500–700 chuyến nên không thể hiển thị hết trên một bảng. Hệ thống cần một time window quanh thời điểm hiện tại để lọc các chuyến đang cần theo dõi.

**Thảo luận và Đề xuất**

Bảng Giám sát được thiết kế trôi theo giờ thực, các chuyến mới có ETD sắp tới được đẩy vào bảng còn các chuyến cũ trôi xuống và ra khỏi vùng hiển thị. Time window phải cấu hình được chứ không hardcode, bao gồm khoảng lùi lại (look-back) ví dụ 15 phút, 30 phút hoặc 1 giờ và khoảng tiến tới (look-ahead) ví dụ 30 phút hoặc 1 giờ. Do mốc upload OFP cho chuyến quốc tế là 240 phút (4 giờ) trước STD nên look-ahead cần đủ rộng để bao phủ thời điểm này, mốc 240 phút cũng nhất quán với mốc upload OFP đã được ghi nhận ở các buổi trước trong tài liệu domain-knowledge.

Quy trình cấu hình diễn ra hai cấp: admin cấu hình mặc định theo từng vị trí hoặc role, sau đó user vẫn có thể scroll để xem ngoài window và tự đặt lại cấu hình cá nhân (cấu hình này được lưu trong profile như §5 đã mô tả). Về mật độ hiển thị, số dòng thường trực vào khoảng 25 dòng để điều phái nhìn nhanh không phải scroll, nhưng vẫn cho phép kéo bảng khi cần. Mặc định danh sách được sắp xếp theo ETD.

Một vấn đề đặc thù được nêu ra là các chuyến đường dài chưa đáp như chuyến đi Mỹ kéo dài khoảng 13–16 tiếng. Mặc dù ETD đã trôi qua từ lâu nhưng chuyến chưa kết thúc thì điều phái vẫn phải monitor đến khi tàu vào gate, vì vậy cần có cơ chế giữ lại các chuyến này trong bảng. Phương án cụ thể là để trôi tự nhiên, giữ lại trong bảng giám sát, hay đưa vào filter phụ, hoặc dùng scroll vẫn chưa được chốt. Bên cạnh đó, việc giám sát giai đoạn đang bay đến lúc vào gate cũng được nhắc tới gắn với Flight Watch, là một màn hoặc giai đoạn riêng biệt. Liên quan tới chủ đề này, anh Phúc trong buổi 11/06 đã nêu yêu cầu hệ thống phải cảnh báo vào gate chậm khi chuyến vào gate chậm so với ETA kết điểm, vì điều phái có trách nhiệm monitor đến tận chặng hạ cánh vào gate.

**Kết luận**

Màn Giám sát sử dụng time window cấu hình được gồm look-back và look-ahead, trong đó admin set mặc định theo role còn user được phép override và lưu cấu hình vào profile cá nhân. Bảng trôi theo giờ thực và mặc định sắp xếp theo ETD. Các chuyến đường dài chưa đáp vẫn phải được monitor đến khi vào gate, tuy nhiên cơ chế giữ lại cụ thể chưa được chốt và sẽ tiếp tục làm rõ. Hệ thống cảnh báo vào gate chậm so với ETA kết điểm, nội dung này gắn phạm vi Flight Watch.

### 9. Cột Aircraft Registration: logic màu, hover, lịch sử đổi tàu và hiển thị

**Yêu cầu**

Cột Aircraft Registration (REG — số đăng ký tàu bay) phải cảnh báo khi tàu thực tế trên Netline bị đổi so với phiên bản OFP đã phát hành, đồng thời cho phép điều phái xem lịch sử đổi tàu của chuyến đó.

**Thảo luận và Đề xuất**

Logic màu của cột REG được xây dựng dựa trên hai chốt kiểm soát là tàu Netline và tàu trên OFP đã được Dispatch Release. Ô có màu đỏ khi tàu trên Netline khác với tàu trên OFP đã được Dispatch Release, lúc này điều phái phải làm lại OFP cho tàu mới. Ô có màu vàng khi đã có OFP mới khớp tàu Netline nhưng chưa được Dispatch Release, cần thực hiện bước Release. Ô có màu xanh khi đã có OFP mới khớp tàu và đã Dispatch Release. Ô không màu áp dụng cho trường hợp chưa có OFP hoặc OFP chưa release, tức là chuyến còn ở giai đoạn sớm. Có thể tóm gọn rằng hai điều kiện để ô chuyển xanh là tàu Netline khớp tàu trên OFP và OFP đã được Dispatch Release, nếu thỏa một điều kiện thì ô chuyển vàng còn không thỏa điều kiện nào thì ô chuyển đỏ.

Cột REG và cột Dispatch Release liên kết với nhau, khi điều phái bấm Release ở cột Dispatch Release thì hệ thống cũng clear luôn vàng ở cột REG nếu lý do duy nhất khiến cột REG ở trạng thái vàng là chưa được release. Riêng trường hợp Unrelease, hệ thống quay về phiên bản OFP trước đó và sinh ra một revision mới mang dữ liệu cũ. Nếu phiên bản đó có tàu khác với tàu Netline hiện tại thì cột REG sẽ chuyển đỏ trở lại, đòi hỏi điều phái phải release lại bản OFP mới.

Về tương tác, khi điều phái rê chuột vào ô REG, hệ thống hiển thị REG cũ kèm REG mới theo dạng có mũi tên và giờ đổi trên Netline theo định dạng `HH:MM` (UTC). Khi điều phái click vào REG, hệ thống mở Flight Detail và active tab Aircraft hiển thị đầy đủ lịch sử đổi tàu, ví dụ chuyến đã đổi tàu ba lần thì điều phái xem được đủ ba lần. Về cách hiển thị REG trên bảng, với nhóm VNA và VNB hệ thống lược bỏ tiền tố VN để tiết kiệm không gian (ví dụ VNA893 hiển thị thành A893, VNB… hiển thị thành B…), trong khi các nhóm khác như XU sẽ giữ nguyên đầy đủ vì không thống nhất được một mẫu cắt chung.

**Kết luận**

Cột REG được tô màu theo logic giao giữa tàu Netline và tàu trên OFP đã Release. Đỏ khi lệch tàu và đã release, Vàng khi khớp tàu nhưng chưa release, Xanh khi khớp tàu và đã release, Không màu khi chưa có OFP hoặc OFP chưa release. Hover hiển thị REG cũ và REG mới kèm giờ đổi trên Netline theo UTC, click mở tab Aircraft chứa lịch sử đổi tàu đầy đủ. Hiển thị REG cắt tiền tố VN cho nhóm VNA và VNB, nhóm XU và các nhóm khác giữ nguyên.

### 10. Cột Dispatch Release: cột riêng và action bấm trực tiếp

**Yêu cầu**

Trên màn Giám sát cần có một cột riêng dành cho Dispatch Release để điều phái nhìn nhanh chuyến đã release hay chưa, đồng thời cho phép bấm Dispatch Release ngay trên màn giám sát như một action shortcut.

**Thảo luận và Đề xuất**

Các bên thống nhất bổ sung một cột Dispatch Release với hai trạng thái rõ ràng. Khi điều phái bấm Release ngay tại cột này, trạng thái chuyển sang xanh và kết thúc phần việc của điều phái. Cột Dispatch Release liên kết với cột REG, khi bấm Release ở đây hệ thống sẽ clear đồng bộ trạng thái vàng của các cột liên quan, vì Dispatch Release đóng vai trò chốt cuối để các cột cùng chuyển về xanh.

Một câu hỏi khác là có cần tạo thêm màn hình thứ hai để xem chi tiết OFP của toàn bộ chuyến hay không. Các bên thống nhất không tạo màn riêng cho mục đích này, nếu cần xem chi tiết OFP của một chuyến thì điều phái vào menu báo cáo riêng. Màn Giám sát vẫn giữ vai trò overview, chỉ liệt kê các trường cần thiết kèm cảnh báo.

**Kết luận**

Màn Giám sát có thêm cột Dispatch Release với hai trạng thái chưa release và đã release, đồng thời cho phép bấm Dispatch Release ngay tại cột. Khi điều phái bấm Release ở cột này, hệ thống clear đồng bộ vàng các cột liên quan như REG. Không tạo màn thứ hai để hiển thị chi tiết OFP toàn bộ, nếu cần chi tiết của một chuyến thì điều phái vào Flight Detail hoặc menu báo cáo riêng. Đây là ngoại lệ duy nhất của nguyên tắc "Giám sát chỉ view và cảnh báo, không action" đã trình bày ở §7.

### 11. Cột Flight Number: cảnh báo theo suffix D/Z và lịch sử

**Yêu cầu**

Cột Flight Number phải cảnh báo khi chuyến có suffix `D` hoặc `Z`, tức là chuyến đã chuyển sang ngày hôm sau hoặc rơi vào tình huống đặc biệt cần điều phái lưu ý.

**Thảo luận và Đề xuất**

Logic màu của cột Flight Number gồm ba mức. Ô không màu áp dụng cho số hiệu chuyến bình thường, không có suffix. Ô màu vàng áp dụng khi chuyến có suffix `D` hoặc `Z`, đây là chuyến đặc biệt đã chuyển sang ngày sau và hệ thống luôn giữ vàng để điều phái lưu ý chứ không chuyển sang xanh dù đã release. Ô màu đỏ áp dụng cho trường hợp chuyến đang ở suffix `D` nhưng sau đó mất `D` do khắc phục sớm đưa về ngày gốc, lý do là điều phái có thể đã báo khách hoặc đã soạn tài liệu theo phương án ngày gốc nên cần làm lại.

Về tương tác, khi điều phái hover lên ô Flight Number, hệ thống hiển thị lịch sử D/Z gồm thời điểm Netline thêm D/Z, và nếu chuyến mất `D` thì hiển thị thời điểm mất, phục vụ truy vết cũng như báo cáo cấp trên. Cần lưu ý rằng trường hợp chuyến chuyển sang ngày hôm sau mà không qua D/Z (chỉ đổi ETD) thì cột Flight Number sẽ không màu, cảnh báo về thay đổi ngày khi đó nằm ở cột ETD và lịch sử đổi giờ cũng xem ngay tại ô ETD. Cuối cùng, trạng thái đỏ ở cột Flight Number được clear khi chuyến đã IN hoặc ARR, nội dung này gắn với §12.

**Kết luận**

Cột Flight Number áp dụng ba mức màu gồm Không màu khi không có suffix, Vàng khi có D/Z (luôn giữ vàng không sang xanh), và Đỏ khi trước có D/Z nay mất tức là giật về ngày gốc. Hover hiển thị lịch sử D/Z kèm thời điểm thay đổi trên Netline. Trường hợp chuyển ngày sau mà không qua D/Z thì cảnh báo nằm ở cột ETD chứ không phải Flight Number. Trạng thái đỏ của cột Flight Number được clear khi chuyến IN hoặc ARR.

### 12. Cột ETA, IN và ARR: tín hiệu hoàn tất chuyến và nguồn dữ liệu

**Yêu cầu**

Cột ETA, IN, ARR biểu thị thời điểm hoàn tất chuyến và đóng vai trò tín hiệu để clear hoặc chuyển trạng thái cuối cho các cảnh báo khác trên bảng.

**Thảo luận và Đề xuất**

Tín hiệu chuyển trạng thái xanh (hoàn tất) được kích hoạt khi chuyến nhận điện IN rồi chuyển sang ARR, trạng thái IN khiến ô chuyển xanh. Về nguồn dữ liệu giờ hạ cánh và vào gate, hệ thống lấy từ hai luồng chính. Đối với sân bay nội địa, TOSS tích hợp A-CDM (Airport Collaborative Decision Making) để lấy giờ hạ cánh và vào gate thực tế với độ trễ gần real-time. Đối với sân bay quốc tế, A-CDM có độ trễ lớn hơn nên phải chấp nhận độ trễ này. Song song, điện ARR/IN qua ACARS cũng được tiếp nhận, trong đó Netline tích hợp điện và cập nhật trạng thái ARR về TOSS, ưu tiên lấy theo Netline vì Netline thường cập nhật nhanh hơn so với riêng điện ACARS.

Khi cột ETA/IN chuyển xanh thì các cảnh báo đỏ liên quan trong cùng chuyến được clear hoặc chuyển sang trạng thái cuối tương ứng, riêng cảnh báo vào gate chậm đã trình bày ở §8 được giữ riêng. Với các cảnh báo mà điều phái vẫn bay dù đỏ hoặc vàng (ví dụ thời tiết), khi chuyến đã cất cánh thì tùy cột có thể giữ nguyên đỏ để biết rằng từng có đỏ nhưng không action, hoặc clear về xanh khi đã đáp. Chi tiết theo từng cột chưa được chốt đồng nhất và sẽ tiếp tục làm rõ.

**Kết luận**

Cột ETA, IN, ARR chuyển xanh khi nhận điện IN dẫn đến ARR, với nguồn dữ liệu là A-CDM (nội địa gần real-time, quốc tế trễ hơn) và điện ACARS ARR/IN qua Netline, ưu tiên lấy theo Netline. Khi ô chuyển xanh, các cảnh báo đỏ liên quan của chuyến được clear hoặc chuyển sang trạng thái cuối. Quy tắc clear hoặc giữ đỏ sau khi cất cánh theo từng cột chưa được chốt đồng nhất và sẽ tiếp tục làm rõ ở buổi sau.

### 13. Format hiển thị lịch sử đổi chung (history timeline)

**Yêu cầu**

Nhiều đối tượng trên màn Giám sát đều cần hiển thị lịch sử thay đổi như đổi tàu, đổi tổ bay, đổi giờ ETD hay đổi suffix D/Z, vì vậy hệ thống cần một format chung để áp dụng đồng nhất.

**Thảo luận và Đề xuất**

Hai phương án trình bày timeline được đưa ra là kéo ngang (horizontal) hoặc kéo dọc (vertical), trong đó các bên ưu tiên kéo dọc vì dễ nhìn các mốc thời gian hơn. Cấu trúc một timeline lấy ví dụ trường hợp đổi tàu được trình bày dạng tàu đầu tiên (giá trị khi chuyến sinh ra), sau đó mũi tên kèm giờ đổi trên Netline theo định dạng `HH:MM`, tiếp đến tàu thứ hai và tiếp tục cho các lần đổi sau. Đối với bảng lịch sử của một chuyến, mỗi lần update là một dòng và được sắp xếp theo thứ tự update, điều phái nhìn các dòng để biết trường nào thay đổi (ví dụ đổi tàu bay), do ai và vào thời điểm nào. Format này được áp dụng chung cho lịch sử đổi Registration (§9), đổi tổ bay (Phần 1, §2), đổi giờ ETD và lịch sử D/Z (§11).

**Kết luận**

TOSS dùng một format hiển thị lịch sử đổi chung cho mọi đối tượng cần truy vết, ưu tiên timeline kéo dọc với các mốc nối nhau bằng mũi tên kèm giờ thay đổi theo UTC. Format này được áp dụng trước cho lịch sử đổi tàu, đổi tổ bay, đổi giờ ETD và lịch sử D/Z.

---

## III. Các nội dung đã thống nhất (toàn buổi sáng)

| # | Nội dung thống nhất | Chủ đề |
|---|---|---|
| 1 | Click chuyến trên màn Giám sát mở một tab mới chứa Flight Detail thay vì pop-up, đồng thời cho phép mở nhiều tab cùng lúc | 1 |
| 2 | Click cảnh báo mở Flight Detail và active đúng tab phụ tương ứng với cảnh báo đó | 1 |
| 3 | Flight Detail gồm nhiều tab phụ tối thiểu là Cảnh báo, Flight Release, Tàu bay kèm MEL/CDL và Tổ bay, mỗi tab hiển thị đầy đủ lịch sử thay đổi | 2 |
| 4 | TOSS lấy Flight Number ba cột tách biệt từ Netline gồm carrier, fly number và FN suffix D/Z, đồng thời lấy leg history từ Netline | 3 |
| 5 | Cảnh báo thể hiện bằng cách tô màu cả ô thay vì bo box hay chỉ đổi màu chữ, ký hiệu trạng thái ưu tiên thiết kế đơn giản | 4 |
| 6 | Phân quyền hai lớp gồm chức năng và dữ liệu theo carrier/khu vực/role, user có thể có nhiều role và switch view, super admin xem toàn bộ | 5 |
| 7 | Filter, cấu hình hiển thị và trạng thái gần nhất được lưu ở profile cá nhân thay vì theo máy, bộ lọc có cơ chế thu mở | 5 |
| 8 | Quy ước giao diện chung gồm tiếng Anh, giờ UTC, format 24 giờ và ưu tiên dark mode | 6 |
| 9 | Bộ mã màu bốn trạng thái gồm Đỏ (action ngay), Vàng (cần lưu ý), Xanh (đã xử lý), Không màu (bình thường) | 7 |
| 10 | Xanh chỉ xuất hiện sau khi đã có đỏ và xử lý xong, không có trường hợp xanh từ đầu | 7 |
| 11 | Màu được đổi tự động theo trạng thái dữ liệu nguồn, điều phái không tick thủ công | 7 |
| 12 | Màn Giám sát chỉ view và cảnh báo, không thao tác trực tiếp, ngoại lệ duy nhất là cột Dispatch Release | 7, 10 |
| 13 | Giữ trạng thái xanh để phục vụ thống kê khối lượng công việc theo ngày và giờ cao điểm | 7 |
| 14 | Time window cấu hình được gồm look-back và look-ahead, admin set mặc định và user override lưu vào profile, bảng trôi theo giờ thực | 8 |
| 15 | Chuyến đường dài chưa đáp vẫn được monitor đến khi IN/ARR, hệ thống cảnh báo vào gate chậm so với ETA kết điểm | 8 |
| 16 | Sắp xếp danh sách mặc định theo ETD | 8 |
| 17 | Cột REG được tô màu theo giao giữa tàu Netline và tàu trên OFP đã Release với bốn trạng thái Đỏ, Vàng, Xanh, Không màu | 9 |
| 18 | Hover ô REG hiển thị REG cũ và REG mới kèm giờ đổi theo UTC, click ô REG mở tab Aircraft chứa lịch sử đổi tàu | 9 |
| 19 | Hiển thị REG cắt tiền tố VN cho nhóm VNA và VNB (thành A… và B…), nhóm XU và các nhóm khác giữ nguyên | 9 |
| 20 | Thêm cột Dispatch Release với action bấm shortcut, clear đồng bộ vàng các cột liên quan theo nguyên tắc hai chốt kiểm soát | 10 |
| 21 | Cột Flight Number áp dụng ba mức Không màu, Vàng khi có D/Z (giữ vàng), và Đỏ khi trước có D/Z nay mất | 11 |
| 22 | Trường hợp chuyển ngày sau không qua D/Z thì cảnh báo nằm ở cột ETD chứ không phải Flight Number | 11 |
| 23 | Cột ETA/IN/ARR chuyển xanh khi nhận điện IN dẫn đến ARR, nguồn từ A-CDM và điện ACARS qua Netline, ưu tiên Netline | 12 |
| 24 | Áp dụng một format hiển thị lịch sử đổi chung với timeline kéo dọc, mũi tên kèm giờ UTC | 13 |

## IV. Vấn đề cần làm rõ (toàn buổi sáng)

**Phần 1:**

1. Ý nghĩa chính xác của ký tự `Z` trong FN Surface so với `D` và điều kiện sinh `Z` chưa được làm rõ.
2. Diễn đạt cảnh báo tổng quát của tab Flight Release ("bên ngoài") cần được làm rõ về nội dung và quy tắc hiển thị.

**Phần 2:**

3. Tên và mã hóa khu vực điều phái (châu Âu, Mỹ, Hàn, khu vực khác) dùng cho phân quyền dữ liệu cần được xác nhận chính thức.
4. Cơ chế giữ lại chuyến đường dài chưa đáp ngoài time window chưa được chốt, các phương án để trôi tự nhiên, giữ trong bảng, đưa vào filter phụ hay dùng scroll cần được lựa chọn.
5. Ngưỡng vào gate chậm tính theo số phút trễ so với ETA kết điểm cần được xác định cụ thể.
6. Quy tắc clear hoặc giữ đỏ sau khi chuyến cất cánh cho các cảnh báo "vẫn bay" như thời tiết chưa được chốt đồng nhất theo từng cột.
7. Quy ước version OFP khi Unrelease (ví dụ `2.1` hay auto-tăng) đã được ghi nhận ở buổi 11/06 và nhắc lại trong buổi này nhưng chưa chốt.
8. Hành vi của hệ thống nguồn (Lido) khi chuyến `D` quay về ngày gốc cần làm rõ, cụ thể là Lido xin lại OFP cũ hay sinh OFP mới. `[cần xác nhận]`
9. Bộ trạng thái vòng đời chuyến hiển thị trên bản mẫu gồm GRD, BRD, OUT, ENR, IN, ARR cần SME điều phái xác nhận lại danh sách, định nghĩa và quy tắc chuyển trạng thái, do nội dung này xuất phát từ đề xuất của bản mẫu chứ chưa được nêu trong nội dung phỏng vấn.

> Các điểm trên được tổng hợp vào sổ theo dõi điểm chốt OID-TOSS-001.

## V. Thuật ngữ đề xuất bổ sung domain-knowledge

> Đây là danh sách đề xuất, chờ BA Lead confirm trước khi ghi vào glossary chính thức.

| # | Thuật ngữ | Mô tả từ ngữ cảnh trong buổi | Nguồn |
|---|---|---|---|
| 1 | **FN Surface (suffix D/Z)** | Cột thứ ba của Flight Number trên Netline, là ký tự hậu tố cho biết chuyến chuyển hoặc delay sang ngày sau (`D`) hoặc rơi vào tình huống đặc biệt (`Z`), đồng thời là khóa kích hoạt cảnh báo của cột Flight Number. | Phần 1 chủ đề 3, Phần 2 chủ đề 11 |
| 2 | **Leg History (Netline)** | Lịch sử các lần thay đổi giờ EPD hoặc delay của chuyến, bao gồm thời điểm thay đổi, chuyển từ ngày nào sang ngày khác và mức delay bao nhiêu, được lưu sẵn trong Netline. | Phần 1 chủ đề 3 |
| 3 | **Flight Detail (tab/trang)** | Trang chi tiết một chuyến bay, mở ở tab mới khi điều phái click chuyến trên màn Giám sát, gồm nhiều tab phụ là Cảnh báo, Flight Release, Tàu bay và Tổ bay. | Phần 1 chủ đề 1 |
| 4 | **Time Window (Giám sát)** | Khoảng thời gian quanh giờ hiện tại để lọc chuyến hiển thị trên màn Giám sát, gồm look-back và look-ahead, có thể cấu hình bởi cả admin và user. | Phần 2 chủ đề 8 |
| 5 | **Color Scheme cảnh báo (4 trạng thái)** | Bộ mã màu thống nhất gồm Đỏ (action ngay), Vàng (cần lưu ý), Xanh (đã xử lý) và Không màu (bình thường), trong đó xanh chỉ xuất hiện sau khi đã có đỏ. | Phần 2 chủ đề 7 |
| 6 | **History Timeline (lịch sử đổi)** | Format chung cho mọi lịch sử thay đổi trên TOSS, sử dụng timeline kéo dọc với các mốc nối bằng mũi tên kèm giờ UTC. | Phần 2 chủ đề 13 |
| 7 | **Dispatch Release (cột + action)** | Cột trên màn Giám sát cho phép điều phái bấm phát hành Dispatch Release trực tiếp, đồng thời clear đồng bộ các cột liên quan khi thực hiện action. | Phần 2 chủ đề 10 |
| 8 | **A-CDM (giờ hạ cánh/vào gate)** | Nguồn dữ liệu giờ hạ cánh và vào gate thực tế, trong đó sân bay nội địa cập nhật gần real-time còn sân bay quốc tế có độ trễ lớn hơn. | Phần 2 chủ đề 12 |
| 9 | **Monitoring User Profile** | Cấu hình cá nhân của user trên màn Giám sát gồm filter, cột hiển thị và trạng thái gần nhất, được lưu theo user thay vì theo máy. | Phần 2 chủ đề 5 |
| 10 | **Carrier (cột & phân quyền)** | Mã hãng, vừa là cột thứ nhất của Flight Number vừa là một chiều phân quyền dữ liệu trên màn Giám sát. | Phần 1 chủ đề 3, Phần 2 chủ đề 5 |

---

*Báo cáo buổi sáng 12/06/2026 gồm Phần 1 và Phần 2, regenerate trực tiếp từ transcript `_fixed` Part1 + Part2 (v0.3 ngày 2026-06-16). Phần 2 thảo luận trực tiếp trên bản mẫu giao diện dsp_monitoring_poc.html. Các điểm cần làm rõ được tổng hợp tại §IV và theo dõi trong sổ điểm chốt OID-TOSS-001.*
