---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.4"
date: "2026-06-16"
survey_date: "2026-06-08"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — buổi 08/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi 08/06/2026

## I. Thông tin chung

- **Thời gian:** ngày 08/06/2026, ghi âm gồm hai phần (Part 1 từ phút 00 đến phút 64, Part 2 từ phút 64 đến phút 163).
- **Mục đích:** thống nhất lộ trình khảo sát và xác lập bức tranh tổng quan về phạm vi hệ thống TOSS, bao gồm hai nhóm đối tượng giám sát chính, tích hợp dữ liệu thay thế hệ thống cũ, cụm báo cáo, luồng tài liệu chuyến bay, quản lý danh mục và tàu bay, hạ tầng và môi trường triển khai, cùng các điểm nghiệp vụ ưu tiên tiếp theo.
- **Đối tượng khảo sát:** đại diện nghiệp vụ và quản lý dự án của Hãng (chị Lê và anh trong vai lãnh đạo), trao đổi với nhóm triển khai (Văn Hiệp và các bạn). Trong nội dung còn nhắc tới anh Nam phụ trách phần tích hợp, anh Sơn (Sơn Phạm) là kiến trúc giải pháp bên VDL, anh Hương quản lý phân tích chậm chuyến, chị Huyền chủ trì nội dung chuyển đối số, cùng các đầu mối khác chưa được định danh đầy đủ trong ghi âm.
- **Phạm vi:** trao đổi mang tính overview để định hình khung khảo sát chi tiết các tuần tiếp theo, không đi vào đặc tả chức năng cụ thể.
- **Cảnh báo chất lượng nguồn:** báo cáo lập trên cơ sở bản ghi âm tự động (ASR) chất lượng thấp với nhiều đoạn nhiễu. Các đoạn không nghe rõ hoặc viết tắt nội bộ chưa xác nhận đều được gắn cờ `[cần xác nhận]` và phải được người dự họp đối chiếu trước khi sử dụng làm căn cứ chính thức.

## II. Nội dung trao đổi

### 1. Lộ trình và phương pháp khảo sát

***Yêu cầu / Thảo luận.***

Phía Hãng đặt yêu cầu nhóm triển khai phải có một lộ trình khảo sát cụ thể để báo cáo lãnh đạo, đồng thời ràng buộc rằng mỗi lần làm việc với một đơn vị nghiệp vụ đều phải có công văn yêu cầu dựa trên tờ trình đã được phê duyệt và phải thông báo trước khoảng một tuần để đơn vị bố trí nhân sự. Nhóm triển khai báo cáo đã chuẩn bị sẵn kế hoạch khảo sát chi tiết cho khoảng hai mươi ngày làm việc đầu tiên, với định hướng chạy song song giữa khảo sát số liệu và khảo sát nghiệp vụ thay vì tuần tự, nhằm rút ngắn tổng thời lượng. Sau khoảng mười đến mười lăm ngày đầu, nhóm dự kiến đưa ra được khung ưu tiên các mảng nghiệp vụ, từ đó mới xây dựng kế hoạch sản xuất thực tế.

Để vào khảo sát từng đơn vị, hai bên thống nhất cách làm là gửi trước bộ câu hỏi khảo sát đã được chuẩn bị sẵn cho đơn vị, kèm công văn đề nghị bố trí người và tài liệu hệ thống. Cách làm này được đánh giá là giúp đơn vị chủ động chuẩn bị, tránh tình trạng đến nơi mới hỏi và người được hỏi không nắm rõ nội dung. Nhóm triển khai cũng đề xuất một đến hai buổi đầu sẽ làm việc tổng quan với từng nhóm đơn vị để xác định ưu tiên triển khai, phân loại nội dung đã rõ thông tin và nội dung chưa rõ, sau đó mới đi vào chi tiết.

***Kết luận.***

Các bên thống nhất triển khai khảo sát theo hướng song song số liệu và nghiệp vụ, làm overview trước rồi mới đi chi tiết. Nhóm triển khai chịu trách nhiệm gửi công văn yêu cầu và bộ câu hỏi khảo sát trước mỗi đợt làm việc, đồng thời sau khoảng mười đến mười lăm ngày đầu sẽ chốt khung ưu tiên các phân hệ để làm cơ sở lập kế hoạch sản xuất chính thức.

### 2. Hai nhóm đối tượng giám sát chính

***Yêu cầu / Thảo luận.***

Phía Hãng làm rõ rằng hoạt động giám sát khai thác hiện đang phục vụ hai nhóm người dùng có nhu cầu khác biệt rõ rệt. Nhóm thứ nhất là trực ban trưởng, tập trung vào trạng thái khai thác chuyến bay, các chỉ số chậm chuyến, hủy chuyến và đặc biệt là thông tin khách nối chuyến đến và đi đâu. Nhóm thứ hai là cán bộ tài liệu, chỉ tập trung vào tài liệu chuyến bay như đã được tổ bay xác nhận hay tải xuống hay chưa. Hai nhóm này có một số thông tin quan tâm chung như chậm chuyến và cảnh báo bất thường, đồng thời cũng có nhiều thông tin riêng biệt.

Hiện trạng giao diện cho phép xem từng chuyến bay một, mở chi tiết Fly Release và tài liệu cho từng chuyến, nhưng chưa có khả năng giám sát tổng hợp nhiều chuyến cùng lúc. Nhóm triển khai đề xuất xây dựng màn hình giám sát riêng cho từng nhóm đối tượng theo dạng danh sách chuyến bay kèm thông tin và cảnh báo đi kèm. Cấu trúc giao diện được hình dung gồm nhiều cấp xem, từ tổng quan toàn mạng bay xuống danh sách chuyến, sau đó vào chi tiết chuyến và cuối cùng đến chi tiết hành khách bao gồm tên và số ghế.

***Kết luận.***

Các bên thống nhất tách màn hình giám sát thành hai cấu phần riêng phục vụ trực ban trưởng và cán bộ tài liệu, đồng thời thiết kế nhiều cấp xem từ tổng quan đến chi tiết. Quản trị danh mục dùng chung cho hai màn hình sẽ được gom về một module riêng phục vụ cấu hình giám sát, cảnh báo và phân quyền.

### 3. Cụm báo cáo

***Yêu cầu / Thảo luận.***

Phía Hãng mô tả rằng logic báo cáo trong nghiệp vụ điều hành khai thác phức tạp hơn báo cáo thông thường, bởi mỗi bộ lọc cần áp dụng một logic tính khác nhau. Vấn đề lớn nhất hiện nay là cùng một chỉ số đúng giờ nhưng các báo cáo khác nhau cho ra những con số khác nhau, không rõ con số nào đúng và không sửa được logic do hệ thống hiện tại bị giới hạn. Một số báo cáo cần thiết đến nay vẫn chưa làm được. Trước đây đã có đơn vị nhận triển khai báo cáo này nhưng không hoàn thành do vướng thủ tục hợp đồng với Hãng, nay phải làm lại từ đầu.

Hệ thống hiện tại của Hãng cung cấp giao diện Oracle Form chỉ xuất được một báo cáo tổng hợp chi tiết, không có biểu đồ hay overview. Mỗi lần báo cáo, cán bộ phải lấy ra khoảng một trăm chín mươi trường dữ liệu mà không được phép chọn trường, sau đó xuất ra Excel rồi xử lý thủ công bằng công thức để dựng pivot và lọc số liệu cần. Chị Lê có sẵn bộ file Excel kèm công thức và sẽ chia sẻ cho nhóm triển khai để phân tích logic.

Nhóm triển khai đề xuất tiếp cận theo hai chiều để tránh sót, một là đi từ báo cáo ngược về dữ liệu nguồn, hai là đi từ dữ liệu đã tích hợp lên báo cáo. Với mỗi báo cáo, người dùng phải chỉ rõ thông tin lấy từ đâu và công thức tính như thế nào, đội triển khai chỉ kế thừa logic cho phù hợp. Về thứ tự ưu tiên, hai bên thống nhất làm báo cáo hàng ngày trước rồi mới mở rộng dần lên báo cáo theo thời gian dài hơn. Hai nhóm báo cáo được ưu tiên gồm nhóm báo cáo lịch bay từ hệ thống FMS đang được mua mới để thay thế và nhóm báo cáo của trực ban trưởng. Nhóm báo cáo trực ban trưởng có nhiều nguồn đầu vào nhưng chỉ kết xuất một báo cáo cuối cùng, gồm thống kê chuyến bay, OTP, hành khách, phi công và tiếp viên, do nhiều bộ phận như trực điều hành, trực dịch vụ, trực kỹ thuật cùng cung cấp số liệu.

Về nguyên tắc xử lý, những gì có thể tự động tổng hợp thì hệ thống tự động, còn những thông tin chỉ con người mới có như sương mù tại sân bay Hà Nội làm mười chuyến không cất cánh được trong khung giờ 7 giờ đến 8 giờ thì hệ thống cần cung cấp chức năng cho đơn vị nhập tay, sau đó dữ liệu này được tái sử dụng cho mọi báo cáo. Về phát hành báo cáo, sau khi hệ thống tổng hợp tự động, người dùng rà soát và phát hành, hệ thống gửi qua thư điện tử đến địa chỉ đã cấu hình sẵn, không yêu cầu ký số. Ngoài ra, công cụ Evo Report do bên Hãng tự xây trước đây để rút dữ liệu lịch bay từ NetLine hiện đã đáp ứng được khoảng `[cần xác nhận]` của nhu cầu, nhưng vẫn còn vấn đề lệch số liệu giữa các báo cáo.

***Kết luận.***

Các bên thống nhất ưu tiên xử lý nhóm báo cáo hàng ngày trước, với hai nhóm trọng tâm là báo cáo lịch bay phục vụ FMS thay thế và báo cáo trực ban trưởng. Báo cáo được phát hành qua thư điện tử đến địa chỉ cấu hình sẵn, không yêu cầu ký số. Hãng sẽ gửi file Excel kèm công thức cho nhóm triển khai để phân tích logic, đồng thời thống nhất cách làm hai chiều giữa báo cáo và dữ liệu để tránh sót.

### 4. Tích hợp dữ liệu và thay thế hệ thống cũ

***Yêu cầu / Thảo luận.***

Mục tiêu cốt lõi của tích hợp được xác định là thay thế hệ thống cũ mà phía Hãng gọi là FMS, vốn đang có một luồng vận hành rất chậm. Hệ thống web tiền thân là MMS hiện chỉ chạy được trên Internet Explorer và được phát triển từ khoảng năm 2019, có phạm vi hẹp hơn nhiều so với TOSS dự kiến.

Về dữ liệu chuyển động chuyến bay gửi sang SITA, hiện tại Hãng đang phủ được khoảng 90% số chuyến của mình, trong khi các hãng khác theo báo cáo của CDU đạt từ 99% trở lên. Quy mô khai thác của Hãng khoảng mười một nghìn chuyến mỗi tháng, trong đó khoảng hơn mười nghìn chuyến có dữ liệu chuyển động. Độ chính xác hiện tại mới đạt khoảng 79%. Các điện văn đang gửi sang gồm điện chuyển động chuyến bay và điện bổ sung cuối ngày, định dạng đã được phía nhận chấp nhận.

Về cơ chế cập nhật, nhóm triển khai đề xuất kết hợp event-based và snapshot. Khi nhận được sự kiện, hệ thống cập nhật từ ảnh chụp gần nhất trước đó, sau đó đối soát lại tại ảnh chụp tiếp theo để bảo đảm dữ liệu ở trạng thái gần nhất. Tuy nhiên cơ chế cụ thể chưa được chốt do còn phụ thuộc bên cung cấp dữ liệu.

Phía Hãng nêu thêm rằng có ba nguồn dữ liệu chính phục vụ phân tích chậm chuyến của anh Hương, gồm lịch bay, lịch sử lịch bay và các loại điện văn liên quan đến mã chậm chuyến, mã hủy, mã kéo dài cùng nguyên nhân tương ứng. Trong ba nguồn này, lịch sử lịch bay là loại dữ liệu dễ tiếp cận nhất.

***Kết luận.***

Các bên thống nhất mục tiêu chính của tích hợp dữ liệu là thay thế hệ thống FMS cũ, ưu tiên tích hợp phục vụ cho FMS thay thế trước. Cơ chế cập nhật event-based kết hợp snapshot được chấp nhận về nguyên tắc, nhưng chi tiết triển khai sẽ tiếp tục làm rõ với phía cung cấp dữ liệu. Việc nâng độ phủ dữ liệu chuyển động lên trên 90% và cải thiện độ chính xác khỏi mức 79% được giao cho nhóm triển khai phối hợp với CDU.

### 5. Hạ tầng và môi trường triển khai

***Yêu cầu / Thảo luận.***

Phía Hãng đặt ra hai mốc thời gian ràng buộc theo lịch của lãnh đạo cấp trên. Mốc thứ nhất là trước khoảng giữa tháng Sáu phải có hạ tầng sẵn sàng. Mốc thứ hai là trước ngày 30 tháng Sáu phải thông kết nối với tất cả các hệ thống tích hợp, bao gồm FTP và các kênh khác. Hiện tại đã xây dựng được hạ tầng cho môi trường kiểm thử, còn môi trường thật sẽ được xếp khi hệ kia lên môi trường thật.

Khó khăn lớn nhất nằm ở việc bên cấp hạ tầng đám mây cấp tài nguyên rất chậm và thông tin xác thực thường xuyên phải gia hạn. Đối với hệ MO, môi trường kiểm thử chỉ cho truy cập từ xa, giới hạn hai đến ba máy, là ràng buộc chung mà các đối tác chuyển đổi số khác cũng phải chấp nhận. Kiến trúc công nghệ do chị Lê gửi xác định cần khoảng `[cần xác nhận]` máy chủ để xin cấp địa chỉ mạng.

Về kênh phối hợp kỹ thuật, hai bên đã có nhóm trao đổi mang tên top integration. Đầu mối kỹ thuật bên VDL được giới thiệu là anh Sơn (Sơn Phạm) phụ trách kiến trúc giải pháp, sẽ trao đổi cụ thể về tích hợp và hạ tầng.

***Kết luận.***

Các bên thống nhất nhóm triển khai sẽ chốt số lượng máy chủ và xin cấp địa chỉ mạng sớm, đồng thời trao đổi với bên cấp hạ tầng đề nghị cấp cụm tài nguyên sớm hơn nếu có thể. Kênh phối hợp kỹ thuật chính là nhóm top integration, đầu mối bên VDL là anh Sơn. Trong trường hợp bên cấp hạ tầng vẫn không cấp kịp, sẽ cân nhắc phương án dùng tài nguyên đám mây của Hãng để bảo đảm mốc giữa tháng Sáu.

### 6. Luồng tài liệu chuyến bay và phiếu cân bằng tải

***Yêu cầu / Thảo luận.***

Phía Hãng mô tả chi tiết luồng tài liệu chuyến bay gồm bốn bước chính. Bước thứ nhất, nhân viên CLC nhập trọng tải ước tính, gồm số khách dự kiến, khối lượng hàng hóa và số ULB dự kiến chất tải, từ đó xác định tải trọng cho chuyến bay. Bước thứ hai, điều phái lấy thông tin của bước thứ nhất kết hợp với dữ liệu từ Lido adapter để lập kế hoạch bay, bước này hiện đã được tự động hóa. Bước thứ ba, kế hoạch bay được đưa lên hệ thống MO và phi công thực hiện Fly Release. Bước thứ tư có hai nhánh song song, trong đó đại diện sân bay nhìn Fly Release để lập phiếu cân bằng tải ở nhánh 4.1, và nhìn Fuel Order để điều phối nạp dầu ở nhánh 4.2.

Về phân vai tài khoản, Hãng chỉ cấp tài khoản cho đại diện sân bay (là người của Hãng hoặc người làm vai trò đại diện sân bay), không cấp tài khoản cho bên nạp dầu. Thông tin cho bên nạp dầu được đại diện sân bay truyền đạt lại. Hệ thống bộ ba TOSS, MO và Lido adapter được khẳng định là cụm tích hợp chặt không thể tách rời.

Nhóm triển khai đề nghị cần có hai sơ đồ tách biệt thay vì gộp chung, một là sơ đồ luồng nghiệp vụ người dùng thể hiện đối tượng, dòng thời gian, trạng thái và bước thủ công hay tự động, hai là sơ đồ luồng tích hợp giữa các hệ thống, để tránh rối khi đọc.

***Kết luận.***

Các bên thống nhất giữ nguyên luồng bốn bước hiện hành làm căn cứ thiết kế, đồng thời nhóm triển khai sẽ vẽ hai sơ đồ tách biệt phục vụ phân tích. Field Order được nhận định có giao diện giống nhau giữa các loại tàu và giữa nội địa hay quốc tế, chỉ khác về người sử dụng, do đó coi như cùng một vai trò người dùng.

### 7. Lịch sử cập nhật số khách

***Yêu cầu / Thảo luận.***

Phía Hãng mô tả rằng thông tin số khách trong một chuyến bay thay đổi rất nhiều lần do hành khách liên tục đặt thêm hoặc hủy chỗ. Mỗi lần cập nhật, hệ thống phải ghi nhận người cập nhật, thời điểm cập nhật và toàn bộ payload đi kèm gồm các phân lớp khách. Tuy nhiên màn hình hiện tại chỉ hiển thị trạng thái cuối cùng, không cho phép xem chuỗi lịch sử thay đổi.

Hãng cần truy xuất được toàn bộ chuỗi lịch sử để phục vụ đánh giá. Một ví dụ điển hình là kiểm tra điện văn đầu tiên có đáp ứng đúng quy định cung cấp thông tin trước chuyến bay một tiếng hay không, vì nếu cung cấp quá sớm thì dữ liệu dễ bị sai. Hiện tại để xử lý chuỗi lịch sử này, chị Lê phải tự dùng code và Excel xử lý thủ công, dẫn đến tốn thời gian.

***Kết luận.***

Các bên thống nhất TOSS sẽ phải lưu được chuỗi lịch sử cập nhật số khách kèm thông tin người cập nhật, thời điểm và toàn bộ payload đi kèm. Trên cơ sở đó, hệ thống sẽ xây dựng các báo cáo riêng theo nhiều chiều để hỗ trợ Hãng đánh giá chất lượng cung cấp thông tin từng chuyến.

### 8. Quản lý danh mục và quản lý tàu bay

***Yêu cầu / Thảo luận.***

Phía Hãng và nhóm triển khai cùng phân tích sự khác biệt giữa danh mục gốc và quản lý nghiệp vụ. Danh mục gốc mang tính chất dữ liệu siêu (meta data) cố định như mã ICAO, mã tàu bay, gần như không thay đổi theo thời gian. Quản lý nghiệp vụ chứa các tham số hay thay đổi theo thời gian như hiệu lực khai thác, danh sách MEL và CDL, hợp đồng thuê khô hay thuê ướt từ bên cho thuê.

Các danh mục chính được xác định gồm tàu bay, sân bay và chặng bay. Quản lý tàu bay là chức năng nghiệp vụ riêng được xây dựng dựa trên danh mục tàu bay. Triết lý tổ chức được thống nhất là theo nhóm thông tin và đối tượng để phù hợp tư duy người dùng, nghĩa là tất cả thông tin liên quan đến một tàu A được xem ở một chỗ, mọi thông tin về sân bay được xem ở một chỗ khác. Cách tổ chức này tránh tình trạng người dùng phải chuyển sang nhiều màn hình khác nhau để tra cứu một đối tượng.

Cụm quản trị bao gồm System Admin, Data Maintenance và Data Sub Monitoring chỉ dành cho người quản trị. Module quản lý ba đối tượng tàu bay, sân bay và chặng bay được tách riêng ra khỏi Data Maintenance để có chức năng quản lý nghiệp vụ riêng. Nhóm chức năng tối thiểu của hệ thống được xác định gồm quản trị người dùng tập trung, phân quyền, danh mục và cấu hình.

***Kết luận.***

Các bên thống nhất tổ chức Master data theo nguyên tắc tách danh mục gốc khỏi quản lý nghiệp vụ, đồng thời quy hoạch theo nhóm thông tin và đối tượng. Module quản lý tàu bay được tách thành chức năng nghiệp vụ riêng, có thể chứa các tab phụ như Master MEL, MEL active, hợp đồng thuê và performance factor. Buổi tiếp theo sẽ đi sâu vào nội dung quản lý tàu bay.

### 9. Phân quyền và mô hình module theo đối tượng

***Yêu cầu / Thảo luận.***

Phía Hãng làm rõ rằng phân quyền của TOSS chỉ áp dụng theo chức năng, không phân quyền theo dữ liệu hay theo chuyến bay. Cơ chế này khác với hệ MO hiện tại, nơi MO chỉ phân biệt được vai trò bổ sung và rà soát nhưng không phân theo PIC hay Purser hay chuyến cụ thể. Tuy nhiên trong một số trường hợp như đại diện sân bay, hệ thống cần lọc theo sân bay mà người đó phụ trách để hiển thị các chuyến bay đi và đến từ sân bay đó.

Mô hình module theo persona được hình dung gồm các nhóm chính như chủ văn (cơ trưởng) `[cần xác nhận]`, điều phái, CLC và đại diện sân bay. Riêng vai trò CLC quan tâm đến load and balance, có thể gộp vai trò để tiện cho người dùng, cụ thể là cùng một người vừa app load CCD vừa nhập weight and balance ở một chỗ thay vì phải chuyển sang nhiều màn hình.

Nhóm triển khai và Hãng cùng thảo luận rằng việc tách module theo người dùng có ưu điểm là rõ ràng nhưng lại gây bất tiện nếu trong tương lai tổ chức thay đổi hoặc một người mang nhiều vai trò. Do đó định hướng đề xuất là tổ chức theo nhóm thông tin mà người dùng quản lý thay vì cứng nhắc theo vai trò, đồng thời tận dụng cơ chế phân quyền chi tiết đến chức năng để cấp các tab tương ứng cho từng vai trò.

***Kết luận.***

Các bên thống nhất phân quyền của TOSS thực hiện theo chức năng, không phân quyền theo dữ liệu hay theo chuyến. Mô hình module quy hoạch theo nhóm thông tin và đối tượng, không tách cứng theo vai trò người dùng, đồng thời cho phép một người có thể có nhiều vai trò bằng cách cấp các tab và chức năng tương ứng.

### 10. Màn giám sát điều phái với vai trò sao lưu cho Lido

***Yêu cầu / Thảo luận.***

Phía Hãng mô tả rằng trước đây bộ phận điều phái phải upload OFP, NOTAM và thông tin thời tiết thủ công vì hệ thống cũ chưa tự động. Nay với việc tích hợp Lido qua adapter và kênh thông tin thời tiết tự động, các bạn điều phái chủ yếu sử dụng màn này cho mục đích giám sát thay vì thao tác trực tiếp.

Bên cạnh chức năng giám sát, màn này được định hướng đóng thêm vai trò kênh sao lưu cho Lido. Trong trường hợp Lido hoặc adapter bị sự cố và không lấy được OFP, điều phái có thể lấy lại OFP của chuyến trước trên cùng tuyến (ví dụ Hà Nội đến Sài Gòn), chỉnh sửa thông số tàu bay phù hợp rồi đẩy lên MO. Hiện Lido chưa hỗ trợ phát cảnh báo trên giao diện này, các cảnh báo đang đi qua thư điện tử. Hãng đề nghị nhóm triển khai lập danh sách các cảnh báo mong muốn để ghi nhận vào hệ thống mới.

***Kết luận.***

Các bên thống nhất màn giám sát điều phái có hai vai trò song song, vai trò chính là giám sát và vai trò phụ là kênh sao lưu cho Lido khi xảy ra sự cố. Nhóm triển khai sẽ thu thập danh sách các cảnh báo từ điều phái để đưa vào thiết kế.

### 11. Lưu trữ tài liệu và thời hạn giữ dữ liệu

***Yêu cầu / Thảo luận.***

Phía Hãng làm rõ rằng tài liệu xuất phát từ TOSS như loadsheet sẽ được TOSS lưu trữ. Các tài liệu xuất phát từ hệ thống khác như OFP và OSP đã được lưu ở hệ MO thì TOSS không lưu lại, chỉ kéo về để hiển thị khi người dùng cần xem. Cách làm này nhằm tiết kiệm bộ nhớ vì người dùng phía giám sát chỉ xem tài liệu khi cần thiết, chủ yếu vẫn theo dõi qua dữ liệu trên dashboard.

Theo quy định của Cục, tệp tin được giữ một trăm ngày, còn dữ liệu được giữ lâu hơn để phục vụ phân tích về sau. Tuy nhiên cần xây dựng một kịch bản lưu trữ chung cho toàn hệ thống, xác định rõ cái gì cần lưu lịch sử, cái gì cần lưu dữ liệu, cái gì cần lưu tệp, lưu trong bao lâu và cơ chế xóa từ mốc thời gian nào.

Phía Hãng và nhóm triển khai cùng rút ra bài học từ lần triển khai trước rằng lưu toàn bộ trường mà API trả về sẽ làm phình bộ nhớ rất nhanh, do đó lần này chỉ lưu các trường thực sự cần dùng.

***Kết luận.***

Các bên thống nhất TOSS không lưu trực tiếp các tệp do hệ thống khác sinh ra, chỉ kéo về để hiển thị khi cần. Dữ liệu đã được bóc tách thì đồng bộ về TOSS để phục vụ báo cáo và hiển thị menu nghiệp vụ. Nhóm triển khai sẽ xây dựng kịch bản lưu trữ chung trong giai đoạn khảo sát, áp dụng nguyên tắc chỉ lưu các trường cần thiết và tuân thủ thời hạn một trăm ngày cho tệp theo quy định.

### 12. MEL, CDL và Performance Factor

***Yêu cầu / Thảo luận.***

Phía Hãng giới thiệu hai loại danh mục MEL và CDL trên tàu bay. Master MEL là danh mục cố định theo loại tàu, định nghĩa toàn bộ các hỏng hóc có thể xảy ra, hỏng nào được phép bay hay không, thời hạn khắc phục thường là ba mươi ngày, và mức ảnh hưởng đến hiệu năng cùng nhiên liệu. Master MEL được tích hợp từ Hãng sản xuất tàu bay. MEL active là tập hỏng hóc đang xảy ra trên tàu cụ thể, được lấy từ hệ thống bảo dưỡng AMOS.

Phía FOM của Hãng đang phải khai báo ảnh hưởng nhiên liệu của từng MEL, ví dụ MEL số 3 ảnh hưởng thêm một phần trăm, MEL số 5 ảnh hưởng thêm một phẩy năm phần trăm. Tổng phần trăm của các MEL active cùng với performance factor được Lido cộng vào block fuel khi tính kế hoạch bay.

Performance Factor là một khái niệm độc lập với MEL, được tính từ thực tế khai thác. Quy trình hiện tại của Hãng là chị Lê nhận điện qua thư điện tử, sau đó nhập tay vào phần mềm BackPACK chạy local trên máy của Hãng sản xuất tàu bay. Phần mềm này tính ra performance factor, sau đó chị Lê nhập kết quả lên cả Lido và FMC trên tàu bay. Performance factor trung bình được tính chu kỳ hai tuần hoặc một tháng một lần, bao gồm cả chuyến có MEL và chuyến không có MEL, để ước lượng cho tháng kế tiếp.

Nhóm triển khai đề xuất tích hợp như sau, một là tiếp nhận điện từ thư điện tử và xuất ra tệp định dạng đầu vào của BackPACK, hai là dùng RPA thao tác BackPACK để tính tự động, ba là đưa kết quả trở lại Lido. Trong trường hợp không RPA được, vẫn có thể tự đọc dữ liệu để hỗ trợ khoảng bốn mươi đến năm mươi phần trăm công đoạn. Phần mềm BackPACK và `[cần xác nhận tên đầy đủ pgepoid]` cần được khảo sát thêm để xác định khả năng tích hợp.

Tuy nhiên có một ràng buộc cần lưu ý là phía Lido hiện không cho tích hợp boost lên, do đó nếu khai báo MEL active hay performance factor thì TOSS phải khai báo trực tiếp lên Lido thay vì để FOM khai báo qua TOSS.

***Kết luận.***

Các bên thống nhất TOSS sẽ hỗ trợ FOM khai báo Master MEL và tiếp nhận MEL active từ AMOS, đồng thời tích hợp luồng performance factor từ thư điện tử qua BackPACK đến Lido bằng cơ chế RPA hoặc tự đọc tệp. Phạm vi tích hợp cụ thể với Lido sẽ tiếp tục được khảo sát do Lido hiện không cho boost dữ liệu lên.

### 13. Khách nối chuyến và xác minh nguồn Amadeus

***Yêu cầu / Thảo luận.***

Phía Hãng mô tả nhu cầu của trực ban trưởng cần biết khách nối vào và khách nối ra của mỗi chuyến. Khách nối vào là khách từ các chuyến trước đáp xuống điểm trung chuyển rồi lên chuyến hiện tại. Khách nối ra là khách đi chuyến hiện tại rồi nối sang các chuyến tiếp theo, có thể tỏa ra nhiều điểm khác nhau. Với mỗi chuyến, hệ thống cần xác định được tổng số khách nối vào và nối ra, đồng thời chi tiết từng khách nối từ hoặc đi chuyến nào.

Mục đích của thông tin này là phục vụ ra quyết định trong tình huống chậm chuyến. Khi một chuyến bị chậm, hệ thống phải cảnh báo nguy cơ lỡ nối chuyến để trực ban trưởng quyết định mức chậm tối đa cho phép. Trong trường hợp buộc phải chậm vượt ngưỡng, hệ thống phải hỗ trợ thông báo chậm chuyến cho các chuyến kế tiếp.

Hiện tại nguồn dữ liệu duy nhất là Amadeus, nhưng chỉ có một người dùng trong nhóm được tiếp cận giao diện Amadeus và còn bị hạn chế về nghiệp vụ. Chị Lê dự định kéo thêm người quen Amadeus tham gia khảo sát, cần thiết có thể mời thêm bên trực dịch vụ. Về phía API Amadeus đã cấp cho nhóm triển khai trước đây, đến nay chưa có đơn vị nào sử dụng để ra quyết định, và nhóm cũng chưa kiểm chứng được dữ liệu trả về là thời gian thực từ hệ thống chính hay chỉ là bản sao có độ trễ. Đã có hiện tượng hệ MO hiển thị số khách khác với Amadeus tại cùng thời điểm do dữ liệu biến động.

Phía nhóm triển khai lưu ý rằng tổng tải (to to pack) đã lấy được, trạng thái chuyến bay chỉ mang tính hiển thị tham khảo, nhưng khách nối chuyến phải có tính chính xác để hỗ trợ ra quyết định.

***Kết luận.***

Các bên thống nhất nhóm triển khai cần xác minh lại nguồn API Amadeus, làm rõ là dữ liệu thời gian thực hay bản sao có độ trễ. Chị Lê chịu trách nhiệm kéo thêm người quen Amadeus và cần thiết có thể mời bên trực dịch vụ tham gia khảo sát chi tiết. Đây là điểm phải làm sâu trong giai đoạn tích hợp tiếp theo.

### 14. Cam kết phối hợp xuyên suốt giai đoạn tích hợp

***Yêu cầu / Thảo luận.***

Phía Hãng rút kinh nghiệm từ lần triển khai trước rằng việc Hãng không tham gia sâu trong giai đoạn tích hợp đã dẫn đến lệch giữa hai bên. Chị Lê cam kết lần này sẽ đi cùng nhóm triển khai xuyên suốt giai đoạn tích hợp, cố gắng đào sâu nhất có thể. Trong trường hợp cả hai bên cùng không gỡ được, sẽ báo cáo lên anh Hùng để có hỗ trợ.

Về tinh thần làm việc, chị Lê khẳng định có thể nhắn hỏi bất kỳ lúc nào kể cả cuối tuần, nếu không trả lời ngay thì sẽ trả lời sau. Phía nhóm triển khai cũng thể hiện sự đồng thuận về cách phối hợp này.

***Kết luận.***

Các bên thống nhất cam kết phối hợp chặt chẽ xuyên suốt giai đoạn tích hợp, với cơ chế trao đổi linh hoạt qua các kênh nhắn tin. Vướng mắc vượt khả năng giải quyết của hai bên sẽ được báo cáo lên cấp trên kịp thời.

### 15. Kế hoạch các buổi làm việc tiếp theo

***Yêu cầu / Thảo luận.***

Hai bên thảo luận lịch các buổi làm việc trong tuần tiếp theo. Thứ ba sáng dự kiến nhóm triển khai cùng anh Nam làm việc về tích hợp, trong khi chiều thứ ba lãnh đạo bận đi học. Chiều thứ tư lãnh đạo dành thời gian định hướng cho dự án, đồng thời làm việc về hạ tầng với anh Nam. Sau ngày 10 tháng Sáu, bên kia hoàn tất cài đặt IP và cụm tài nguyên, hai bên sẽ thông kết nối và dùng dữ liệu giả để kiểm tra gọi. Đến ngày 15 tháng Sáu hạ tầng gốc phải sẵn sàng kèm đồng bộ dữ liệu cho FMS thay thế. Đến ngày 30 tháng Sáu thông kết nối toàn bộ.

Phía Hãng đề nghị nhóm triển khai cung cấp hình ảnh giao diện sớm nhất có thể, ưu tiên hiển thị dữ liệu thật trên giao diện để lãnh đạo có thể sờ được và nhìn được, từ đó hình dung được hệ thống thay vì chỉ trao đổi bằng lời.

Chủ đề ưu tiên kế tiếp được xác định gồm quản lý tàu bay và danh mục, tích hợp FMS thay thế trước, lịch làm việc với bộ phận điều phái và xác minh nguồn dữ liệu Amadeus.

***Kết luận.***

Các bên thống nhất lịch làm việc trong tuần tiếp theo theo phân bổ nêu trên. Nhóm triển khai chịu trách nhiệm chuẩn bị hình ảnh giao diện sớm để lãnh đạo Hãng có cơ sở định hướng và phản hồi. Các mốc thời gian 10 tháng Sáu, 15 tháng Sáu và 30 tháng Sáu được giữ làm ràng buộc cứng cho công tác hạ tầng và tích hợp.

## III. Các nội dung đã thống nhất

| # | Nội dung thống nhất |
| --- | --- |
| 1 | Khảo sát song song giữa số liệu và nghiệp vụ, làm overview trước rồi mới chi tiết, bộ câu hỏi và công văn gửi trước mỗi đợt làm việc với đơn vị |
| 2 | Tách hai màn hình giám sát riêng cho trực ban trưởng và cán bộ tài liệu, thiết kế nhiều cấp xem từ tổng quan đến chi tiết |
| 3 | Ưu tiên báo cáo hàng ngày trước, hai nhóm trọng tâm là báo cáo lịch bay FMS thay thế và báo cáo trực ban trưởng |
| 4 | Báo cáo phát hành qua thư điện tử đến địa chỉ cấu hình sẵn, không yêu cầu ký số |
| 5 | Mục tiêu cốt lõi của tích hợp là thay thế hệ thống FMS cũ |
| 6 | Cơ chế cập nhật dữ liệu kết hợp event-based và snapshot về nguyên tắc, chi tiết tiếp tục làm rõ |
| 7 | Hai mốc hạ tầng cứng là giữa tháng Sáu cho hạ tầng sẵn sàng và 30 tháng Sáu cho thông kết nối toàn bộ |
| 8 | Phối hợp kỹ thuật qua nhóm top integration, đầu mối kiến trúc giải pháp bên VDL là anh Sơn |
| 9 | Giữ nguyên luồng tài liệu chuyến bay bốn bước hiện hành, vẽ hai sơ đồ tách biệt cho luồng nghiệp vụ và luồng tích hợp |
| 10 | TOSS lưu chuỗi lịch sử cập nhật số khách cùng người cập nhật, thời điểm và payload |
| 11 | Tổ chức master data theo nguyên tắc tách danh mục gốc khỏi quản lý nghiệp vụ, quy hoạch theo nhóm thông tin và đối tượng |
| 12 | Phân quyền theo chức năng, không phân quyền theo dữ liệu hay theo chuyến |
| 13 | Màn giám sát điều phái có hai vai trò song song gồm giám sát và sao lưu cho Lido khi sự cố |
| 14 | TOSS không lưu tệp do hệ ngoài sinh ra, chỉ kéo về hiển thị khi cần, tuân thủ hạn lưu một trăm ngày cho tệp theo quy định Cục |
| 15 | Chỉ lưu các trường dữ liệu thực sự cần dùng để tránh phình bộ nhớ |
| 16 | Tích hợp luồng MEL active từ AMOS và performance factor qua BackPACK đến Lido bằng RPA hoặc tự đọc tệp |
| 17 | Xác minh lại nguồn API Amadeus trước khi sử dụng dữ liệu khách nối chuyến để ra quyết định khai thác |
| 18 | Hãng cam kết tham gia cùng nhóm triển khai xuyên suốt giai đoạn tích hợp |
| 19 | Nhóm triển khai cung cấp hình ảnh giao diện sớm để lãnh đạo Hãng có thể sờ được, nhìn được, ưu tiên hiển thị dữ liệu thật |

## IV. Vấn đề cần làm rõ

1. Cơ chế cập nhật dữ liệu chuyển động kết hợp event-based và snapshot sẽ được chốt cụ thể như thế nào và phụ thuộc vào bên cung cấp dữ liệu nào?
2. Logic chi tiết của từng báo cáo trong nhóm ưu tiên hàng ngày là gì, và khi nào nhóm triển khai có đủ số liệu thật để mô tả đầy đủ?
3. Tiến độ cấp phát hạ tầng đám mây hiện ở giai đoạn nào và liệu có kịp cho mốc giữa tháng Sáu hay không?
4. Số lượng máy chủ cụ thể cần cho hạ tầng triển khai là bao nhiêu, và đã đủ căn cứ để xin cấp địa chỉ mạng chưa?
5. Ngoài điện chuyển động chuyến bay, các điện văn bổ sung gửi sang SITA có được xử lý đầy đủ hay không?
6. Môi trường kiểm thử có khả năng đi thẳng vào tài nguyên thật hay phải có môi trường riêng tách bạch?
7. API Amadeus trả dữ liệu thời gian thực từ hệ thống chính hay chỉ là bản sao có độ trễ?
8. Phần mềm BackPACK và `[cần xác nhận tên đầy đủ pgepoid]` có hỗ trợ RPA hoặc tự đọc dữ liệu được không?
9. Việc Lido không cho phép boost dữ liệu lên ảnh hưởng đến mức nào tới phương án tích hợp MEL active và performance factor?
10. Từng cụm dữ liệu phục vụ FMS thay thế có sẵn không và lấy qua phương thức gì, dự kiến đến thứ Tư mới có thông tin cụ thể?
11. Định danh đầy đủ về người chủ trì và người ra quyết định trong từng nội dung, cùng địa điểm họp chính thức là gì?
12. Tên đầy đủ và vai trò chính thức của các đầu mối kỹ thuật được nhắc đến (anh Nam, anh Sơn, anh Hương, chị Huyền, anh Hùng) cần được xác nhận lại bằng văn bản.

## V. Thuật ngữ đề xuất bổ sung domain-knowledge

Các thuật ngữ dưới đây xuất hiện trong buổi khảo sát ngày 08/06/2026 và được đề xuất bổ sung vào `toss-glossary-v0.1.md`. Đây mới chỉ là đề xuất, chưa được ghi vào glossary, cần BA Lead xác nhận trước khi cập nhật.

| Thuật ngữ | Mô tả từ ngữ cảnh | Nguồn dòng |
| --- | --- | --- |
| BackPACK | Phần mềm WinForm local do Hãng sản xuất tàu bay cung cấp, dùng để tính performance factor từ điện văn nhận qua thư điện tử. Hiện chị Lê nhập tay rồi đẩy kết quả lên Lido và FMC. | Part 2, đoạn 02:21–02:25 |
| pgepoid | Tên phần mềm liên quan đến luồng performance factor (cần khảo sát thêm và xác nhận tên chính xác). | Part 2, đoạn 02:24:40 |
| EvoDM (Evo Report) | Công cụ tự xây của Hãng để rút dữ liệu lịch bay từ NetLine do NetLine không tương thích với hệ thống báo cáo gốc, hiện đáp ứng được khoảng `[cần xác nhận]` nhu cầu. | Part 1, đoạn 00:17–00:19 |
| Echo Report | Báo cáo gắn với hệ thống FMS thay thế (Ops++), thuộc nhóm báo cáo lịch bay được ưu tiên xử lý. | Part 1, đoạn 00:17:55 |
| Lido video | Adapter tự động kéo OFP, NOTAM và thời tiết về TOSS, thay thế thao tác upload thủ công của điều phái. | Part 2, đoạn 02:03 |
| SQS (Special Service Request) | Thông tin cập nhật số khách trong một chuyến bay, có thể thay đổi nhiều lần trong một chuyến do hành khách book hoặc hủy chỗ. Cần lưu chuỗi lịch sử để Hãng đánh giá. | Part 2, đoạn 01:22 |
| Master MEL | Danh mục cố định theo loại tàu, định nghĩa toàn bộ các MEL có thể xảy ra trên tàu, ảnh hưởng đến hiệu năng và nhiên liệu, tích hợp từ Hãng sản xuất. | Part 2, đoạn 02:15 |
| MEL active | Tập MEL đang ở trạng thái exit ra trên một tàu cụ thể, lấy từ hệ thống bảo dưỡng AMOS. | Part 2, đoạn 02:16–02:18 |
| Top integration | Tên nhóm trao đổi kỹ thuật giữa hai bên về tích hợp và hạ tầng. | Part 1, đoạn 00:41 |
| Trực ban trưởng | Nhóm người dùng quản lý trạng thái khai thác và khách nối chuyến, một trong hai nhóm đối tượng giám sát chính của TOSS. | Part 1, đoạn 00:08–00:10 |
| Cán bộ tài liệu | Nhóm người dùng quản lý tài liệu chuyến bay (OFP, OAP, CP), giám sát trạng thái xác nhận và tải xuống. | Part 1, đoạn 00:08–00:11 |
| Field Order | Thông tin order trên giao diện loadsheet, được nhận định là giống nhau giữa các loại tàu và giữa nội địa hay quốc tế, chỉ khác về người sử dụng. | Part 2, đoạn 01:18–01:19 |
| Cấp clan `[cần xác nhận]` | Khái niệm liên quan đến cấp thông tin xác thực truy cập hạ tầng, hay bị hết hạn phải gia hạn. | Part 1, đoạn 00:35–00:36 |
| FMS | Hệ thống cũ mà TOSS hướng tới thay thế (ASR đọc nhầm thành "tầm phim" hoặc "tầng phim"), có một luồng vận hành rất chậm. | Part 1, đoạn 00:23–00:24 |
| MMS | Hệ thống web tiền thân của TOSS, chỉ chạy được trên Internet Explorer, phát triển khoảng năm 2019, phạm vi hẹp hơn nhiều so với TOSS. | Part 1, đoạn 00:53–00:54 |

---

*Báo cáo lập trên cơ sở ghi nhận trực tiếp từ hai phần ghi âm transcript ASR của buổi 08/06/2026. Mọi nội dung không nghe rõ hoặc viết tắt chưa xác nhận đều được gắn cờ `[cần xác nhận]`. Người dự họp cần đối chiếu lại các điểm cờ trước khi sử dụng báo cáo làm căn cứ chính thức (CLAUDE.md §0).*

*v0.4 (2026-06-16): tái lập trực tiếp từ transcript ASR (Option B — regenerate from source) theo SKILL `.claude/skills/survey-report/SKILL.md`. So với v0.3, bổ sung mới các chủ đề luồng tài liệu chuyến bay bốn bước, lịch sử cập nhật số khách (SQS), quản lý danh mục và tàu bay, phân quyền theo chức năng, màn giám sát điều phái với vai trò sao lưu Lido, lưu trữ và retention dữ liệu, MEL/CDL với Performance Factor qua BackPACK, khách nối chuyến và xác minh nguồn Amadeus, cam kết phối hợp xuyên suốt, kế hoạch các buổi tiếp theo. Mở rộng §III từ 5 lên 19 nội dung thống nhất, §IV từ 6 lên 12 câu hỏi, bổ sung §V với 15 thuật ngữ đề xuất glossary. Văn phong giữ nguyên văn xuôi liền mạch theo SKILL §0.1.*
*v0.3 (2026-06-16): chuyển toàn bộ §II từ bullet point sang văn xuôi BA liền mạch.*
*v0.2 (2026-06-12): chuẩn hóa cấu trúc §II sang Yêu cầu / Thảo luận–Đề xuất / Kết luận.*
