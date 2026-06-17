---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.4"
date: "2026-06-16"
survey_date: "2026-06-09"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — buổi 09/06/2026"
source_transcripts:
  - "ba/workspace/input/Customer_docs/meeting-notes/09062026/TOSS_meeting_09062026_part1.txt"
  - "ba/workspace/input/Customer_docs/meeting-notes/09062026/TOSS_meeting_09062026_part2.txt"
---

# Báo cáo Khảo sát TOSS — Buổi 09/06/2026

## I. Thông tin chung

- **Thời gian khảo sát:** ngày 09/06/2026 (theo tên thư mục transcript).
- **Mục đích buổi làm việc:** trao đổi về cây menu tổng thể, cơ chế phân quyền, các nhóm chức năng nghiệp vụ (Flight Load Control, Station Manager, Báo cáo điều hành ngày, quản lý tàu bay và phân nhóm đội tàu) cùng các luồng dữ liệu liên quan.
- **Đối tượng được khảo sát:** đại diện nghiệp vụ phía hãng hàng không (xưng "chị" trong transcript) cùng nhân sự tham gia điện đàm.
- **Phía khảo sát:** nhóm phân tích nghiệp vụ TOSS (xưng "em" trong transcript).
- **Phạm vi nội dung:** cấu trúc menu, phân quyền, tài liệu chuyến bay, lưu trữ tài liệu, quản lý đội tàu, nhóm/Category tàu bay, báo cáo điều hành ngày BCAO.
- **Cảnh báo chất lượng ASR:** transcript có nhiều đoạn nhiễu, lặp từ, từ khóa thuật ngữ tiếng Anh bị phiên âm sai (ví dụ "Emo" → MO Plus, "Fly Lover Chorm" → Flight Load Control, "Lociet CDPM" → Loadsheet CDPM, "color love" → Crewlist). Các thuật ngữ không nghe rõ đã được gắn cờ `[cần xác nhận]`. Đoạn từ khoảng 01:36:00 đến 01:40:00 của Part 2 và rải rác trong Part 1 có nhiễu lớn, không trích nội dung kỹ thuật.

## II. Nội dung trao đổi

### 1. Cấu trúc cây menu và vị trí của danh mục (Part 1)

**Yêu cầu**

Đại diện nghiệp vụ phía hãng cho biết khối dữ liệu danh mục như tàu bay, sân bay, chặng bay, tổ bay và các danh mục cố định khác đóng vai trò dữ liệu cơ sở cho các nghiệp vụ ở tầng trên, do đó cần được đưa vào nhóm quản trị thay vì gộp chung với menu nghiệp vụ. Người sử dụng nghiệp vụ thông thường không cần nhìn thấy danh mục, mà chỉ vào khi có nhu cầu khai báo hoặc đối soát thực tế. Phía hãng đề xuất đặt nhóm quản trị danh mục, giám sát các nguồn tích hợp và thiết lập tham số, cảnh báo vào cùng một nhánh System Admin.

**Thảo luận và Đề xuất**

Hai bên trao đổi rằng các danh mục như loại tàu bay, đặc tính kỹ thuật, thông tin chặng bay được đồng bộ tự động hàng ngày từ hệ thống nguồn nên không cần đặt cạnh các chức năng tác nghiệp. Phía nghiệp vụ nhấn mạnh giá trị của danh mục nằm ở chỗ phục vụ cho cảnh báo và hỗ trợ ra quyết định ở tầng nghiệp vụ chứ không phải để người dùng vào xem hàng ngày. Phía phân tích đề xuất nhóm quản trị bao gồm ba phần là System Admin, Data Monitoring và Data Maintenance, đặt ngang cấp với năm nhóm nghiệp vụ. Phương án thay thế là gộp toàn bộ ba nhánh quản trị vào trong System Admin để rút lại còn sáu menu, hoặc tách hẳn ra thành tám menu nếu chấp nhận chia nhỏ. Hai bên cũng bàn về việc nếu chia quá nhỏ thì người dùng sẽ phải nhảy giữa các tab nhiều lần khi đối soát, do đó cần cân nhắc tính tiện dụng.

**Kết luận**

Hai bên thống nhất tách phần bảo trì danh mục ra khỏi menu nghiệp vụ tác nghiệp và đặt cùng nhóm quản trị với System Admin và Data Monitoring. Việc gom hay tách ba nhánh quản trị (gộp về sáu menu hay giữ tám menu) cần phía phân tích đề xuất phương án cụ thể trong bản thiết kế menu kế tiếp.

### 2. Mô hình phân quyền theo chức năng và theo dữ liệu (Part 1)

**Yêu cầu**

Phía nghiệp vụ yêu cầu hệ thống phân quyền chủ yếu theo chức năng. Riêng đối với dữ liệu chuyến bay, phân quyền phải đi theo căn cứ bay (main base) để mỗi căn cứ chỉ tiếp cận phần dữ liệu thuộc trách nhiệm khai thác của mình. Ngoài quyền thao tác cần phân biệt rõ với quyền chỉ xem để tránh việc một người dùng vô tình tác động đến nghiệp vụ của người khác.

**Thảo luận và Đề xuất**

Phía phân tích đề xuất dùng chung một màn hình danh sách chuyến bay cho nhiều đối tượng người dùng khác nhau, trong đó các cột thông tin và nút thao tác sẽ ẩn hoặc hiện theo quyền của từng vai trò. Ví dụ một bảng có khoảng năm mươi cột thì có khoảng mười cột chung mà ai cũng nhìn thấy, mười cột liên quan đến Loadsheet/NOTOC/VDM dành cho nghiệp vụ tải, mười cột khác liên quan đến Flight Release và mười cột tiếp theo liên quan đến Load and Weight. Nếu một người chỉ có quyền xem một nhóm chức năng thì các cột thuộc nhóm khác sẽ được ẩn đi. Phía nghiệp vụ chấp nhận cách tiếp cận này nhưng nhấn mạnh phải phân quyền cả ở cấp nút thao tác (tải lên, rà soát, xác nhận) và lưu vết người thao tác. Đối với danh sách chuyến bay, dữ liệu vẫn ăn theo phân quyền căn cứ bay, không tách thêm theo phòng ban nhỏ hơn. Phía phân tích cũng giới thiệu chức năng cho phép người dùng tự lưu cấu hình hiển thị cột của riêng mình một lần và áp dụng cho các lần đăng nhập tiếp theo.

**Kết luận**

Hai bên thống nhất áp dụng mô hình phân quyền theo chức năng cho thao tác, phân quyền theo căn cứ bay cho dữ liệu chuyến bay, dùng chung một màn hình danh sách chuyến bay cho nhiều vai trò và điều khiển ẩn hoặc hiện cột, nút theo quyền của người dùng. Hệ thống cũng cần cho phép người dùng lưu cấu hình hiển thị cột cá nhân.

### 3. Phân hệ Flight Load Control và tài liệu chuyến bay (Part 1)

**Yêu cầu**

Phía nghiệp vụ mô tả phân hệ Flight Load Control bao gồm bốn nhóm chức năng chính là nhập Load and Weight, cấp tài liệu chuyến bay, lập NOTOC kèm Cargo NOTOC và lập Cargo Manifest. Mặc dù các nhóm chức năng phục vụ các đối tượng người dùng khác nhau, nhưng dưới góc nhìn quản lý vẫn cần gom về một module duy nhất để người quản lý chỉ phải vào một nơi để giám sát toàn bộ.

**Thảo luận và Đề xuất**

Hai bên trao đổi rằng việc upload tài liệu phục vụ chuyến bay có thể thực hiện theo hai cách. Cách thứ nhất là người dùng chọn từng chuyến bay trên danh sách rồi upload tài liệu tương ứng cho chuyến đó. Cách thứ hai là người dùng vào một tab riêng để upload nhiều tài liệu cho nhiều chuyến bay cùng lúc, ví dụ một tệp khí tượng nội địa áp dụng chung cho tất cả chuyến bay nội địa trong ngày. Phía phân tích đề xuất hệ thống phải nhận biết được mã chuyến bay từ tên tệp theo một định dạng quy ước, từ đó tự động gắn tài liệu vào đúng chuyến tương ứng. Phương án nhận biết qua nội dung tệp được đánh giá là tốn tài nguyên hệ thống hơn so với nhận biết qua tên tệp, do đó hai bên ưu tiên ràng buộc người dùng đặt tên tệp đúng quy ước. Phía nghiệp vụ đề nghị có một buổi làm việc riêng với nguồn xuất Loadsheet CDPM để xác định quy tắc đặt tên tệp cụ thể. Việc upload nhiều tài liệu cho nhiều chuyến bay sẽ được thiết kế thành một tab riêng nhằm tạo trải nghiệm thao tác công nghiệp, song song với chức năng upload từng chuyến trên màn hình danh sách.

**Kết luận**

Hai bên thống nhất giữ phân hệ Flight Load Control là một module duy nhất nhưng tách bên trong thành các tab theo chức năng, trong đó có một tab riêng cho việc upload công nghiệp nhiều tài liệu cho nhiều chuyến bay. Cơ chế nhận biết chuyến bay sẽ ưu tiên thông qua tên tệp theo quy ước. Hai bên hẹn một buổi làm việc tiếp theo để khảo sát chi tiết luồng Loadsheet CDPM và quy tắc đặt tên tệp.

### 4. Lưu trữ tài liệu chuyến bay trên TOSS (Part 1)

**Yêu cầu**

Phía nghiệp vụ yêu cầu phân biệt rõ giữa tài liệu sinh ra từ TOSS và tài liệu lấy từ hệ thống ngoài. Đối với tài liệu xuất phát từ TOSS như Loadsheet CDPM hay NOTOC, TOSS phải lưu trữ đầy đủ. Đối với tài liệu lấy về từ hệ thống Flight Operations bên ngoài (ASR phiên là "Emo", thực tế tham chiếu MO Plus hoặc bộ tài liệu Flydop) thì TOSS chỉ lưu trữ trong thời gian ngắn để phục vụ in ấn tại thời điểm cận khởi hành.

**Thảo luận và Đề xuất**

Phía phân tích đề xuất khi người dùng thực hiện download tài liệu từ hệ thống ngoài thì hệ thống chỉ trả file qua trình duyệt mà không lưu trên TOSS. Phía nghiệp vụ đề nghị một phương án linh hoạt hơn là TOSS lấy tài liệu về và lưu tối đa ba ngày sau thời điểm hạ cánh, sau đó có job tự động xóa. Lý do là phi công đã xác nhận tài liệu trước khi bay, nhưng khi MO Plus gặp lỗi thì người dùng vẫn cần một bản dự phòng để in ra cấp cho phi công. Đồng thời, hệ thống phải có một server lưu trữ tập trung dùng chung cho nhiều nghiệp vụ, cấu hình thời gian lưu khác nhau theo từng loại tài liệu.

**Kết luận**

Hai bên thống nhất với tài liệu xuất phát từ TOSS thì lưu trữ đầy đủ trên TOSS, còn tài liệu lấy về từ hệ thống ngoài thì lưu trên TOSS tối đa ba ngày sau khi hạ cánh rồi tự động xóa. Cần xây dựng cơ chế quản lý vòng đời tài liệu theo từng loại với thời gian lưu cấu hình được.

### 5. Phân hệ Station Manager (Part 1)

**Yêu cầu**

Phía nghiệp vụ mô tả phân hệ Station Manager hiện nay chủ yếu xoay quanh checklist an ninh (security checklist). Đối tượng người dùng của Station Manager là độc lập, không thay đổi vai trò qua lại với người dùng Flight Load Control.

**Thảo luận và Đề xuất**

Phía phân tích đề xuất tách Station Manager thành một menu riêng vì đối tượng người dùng cố định và phạm vi nghiệp vụ hẹp, gồm checklist an ninh và lưu trữ tài liệu liên quan. Phía nghiệp vụ đồng ý không chia nhỏ quyền thêm theo căn cứ bay vì sẽ phá vỡ tính thống nhất khi cần luân chuyển ca trực giữa các sân bay.

**Kết luận**

Hai bên thống nhất tách Station Manager thành menu độc lập, phạm vi gồm checklist an ninh và lưu trữ tài liệu kèm theo checklist. Không phân quyền nhỏ hơn cấp căn cứ bay.

### 6. Quản lý tàu bay và lịch sử thuộc tính (Part 1, từ ~00:56:00 trở đi)

**Yêu cầu**

Phía nghiệp vụ yêu cầu TOSS phải quản lý được lịch sử của tàu bay, không chỉ trạng thái hiện hành. Mỗi tàu bay có một mã đăng ký (Registration) và tại một thời điểm chỉ thuộc một hãng, nhưng theo thời gian một tàu có thể đã từng được khai thác bởi nhiều hãng, hoặc đang ở giai đoạn reconfig nên chưa xuất hiện trên lịch bay. Vì vậy việc quản lý tàu bay không thể chỉ dựa vào danh sách hiện hành lấy từ lịch bay.

**Thảo luận và Đề xuất**

Phía nghiệp vụ giải thích mỗi tàu có hai hình thức sở hữu chính là sở hữu của hãng và đi thuê. Hình thức thuê được chia thành hai loại. Loại thứ nhất là thuê khô (Dry Lease), tức là chỉ thuê thân tàu, toàn bộ đội vận hành gồm phi công, tiếp viên và đội bảo dưỡng là của bên đi thuê. Loại thứ hai là thuê ướt (Wet Lease), tức là thuê toàn bộ chuyến bay bao gồm tàu bay, phi công, tiếp viên và dịch vụ mặt đất của bên cho thuê, hãng đi thuê chỉ đưa khách của mình lên. Tàu bay thuê ướt vẫn được đưa vào lịch bay của hãng đi thuê, nhưng bên cho thuê chịu trách nhiệm cung cấp người và dịch vụ. Gần đây xuất hiện trường hợp biến thể của Wet Lease là bên đi thuê chỉ phụ trách phần nhiên liệu và đảm bảo nhiên liệu, các phần còn lại do bên cho thuê thực hiện. Bên cạnh hình thức sở hữu, mỗi tàu bay còn có nhiều thuộc tính kỹ thuật như cấu hình ghế (ví dụ 30 hạng C, 30 hạng Deluxe, 30 hạng Y), số chỗ, dung lượng bình nhiên liệu (Fuel Tank Capacity), dung lượng bình nước, dung lượng dầu, dung lượng khoang hàng (Cargo Capacity gồm bụng trên, bụng dưới và mũi). Một số thuộc tính có thể thay đổi khi tàu được reconfig, do đó cần lưu lịch sử thay đổi theo giai đoạn hiệu lực.

**Kết luận**

Hai bên thống nhất TOSS phải quản lý lịch sử tàu bay theo giai đoạn hiệu lực, bao gồm hình thức sở hữu (sở hữu, thuê khô, thuê ướt và biến thể thuê ướt chỉ tự lo nhiên liệu), thuộc tính kỹ thuật (cấu hình ghế, Fuel Tank Capacity, dung lượng nước, dung lượng dầu, Cargo Capacity) và các thay đổi sau reconfig. Dữ liệu thuộc tính tàu bay sẽ được tích hợp từ phần mềm IFV. Tên đầy đủ của IFV và cơ chế tích hợp cần làm rõ thêm.

### 7. Báo cáo điều hành ngày BCAO và chuyến bay bất thường (Part 2)

**Yêu cầu**

Phía nghiệp vụ trình bày báo cáo điều hành ngày hiện đang được trợ lý trực ban trưởng soạn thủ công bằng cách mở file Word từ đầu ca trực, ghi nhận sự vụ dần theo thời gian rồi đóng file cuối ca và tạo file mới cho ngày tiếp theo. Báo cáo này phục vụ lãnh đạo tổng công ty xem hàng ngày và được cấp thẳng cho cấp lãnh đạo cao nhất. Yêu cầu đặt ra là TOSS phải hỗ trợ tự tổng hợp báo cáo, tự động lấy các thông tin từ hệ thống và để người dùng nhập tay những phần còn lại theo cấu trúc chuẩn.

**Thảo luận và Đề xuất**

Phía nghiệp vụ chỉ ra báo cáo gồm hai phần. Phần thứ nhất là tổng kết ca trực vừa kết thúc, phần thứ hai là tổng kết của ngày khai thác hiện tại. Một số thông tin có thể tổng hợp tự động từ lịch bay như số chuyến khai thác, số tổ bay khai thác, số tổ bay dự bị, số khách, OTP và OSP. Một số thông tin khác phải lấy từ các đầu mối dịch vụ và kỹ thuật cung cấp, ví dụ các sự kiện hỏng hóc kỹ thuật được nhập từ ông trực kỹ thuật, các sự vụ dịch vụ được nhập từ ông trực dịch vụ. Phía phân tích đề xuất tạo một menu chung cho trực ban trưởng và các trực phụ trách chuyên môn, trong đó có nhiều tab phục vụ từng đối tượng. Trực ban trưởng có tab xem tổng quan, ông trực kỹ thuật có tab nhập thông tin kỹ thuật ảnh hưởng đến chuyến bay nào, ông trực dịch vụ có tab nhập thông tin dịch vụ. Cấu trúc nhập liệu phải hạn chế tối đa trường free text, thay vào đó cho phép người dùng chọn tàu bay liên quan, các chuyến bay bị ảnh hưởng, thời gian ảnh hưởng và để lại phần ghi chú chi tiết là free text. Đối với chuyến bay đặc biệt như chuyên cơ chở chủ tịch nước, chủ tịch quốc hội, thủ tướng chính phủ, tổng bí thư hoặc chuyến chở VIP A, hệ thống cần nhận biết qua tích hợp ANABS hoặc cho phép trợ lý trực ban trưởng tích chọn từ danh sách chuyến bay được lọc. Lãnh đạo tổng công ty chỉ quan tâm các trang đầu của báo cáo gồm chỉ tiêu chính và phần bất thường, các trang chi tiết sau là dành cho các bộ phận chuyên môn.

**Kết luận**

Hai bên thống nhất TOSS sẽ tự sinh báo cáo điều hành ngày dựa trên dữ liệu hệ thống kết hợp với thông tin do các trực chuyên môn nhập vào theo cấu trúc chuẩn. Menu báo cáo điều hành ngày là menu chung cho nhiều vai trò, trong đó mỗi vai trò có một tab nhập liệu riêng và một tab xem tổng quan. Mục tiêu là cải thiện chất lượng báo cáo (xếp đẹp, dễ đọc, trực quan) và để báo cáo phục vụ được nhiều mục đích thống kê khác về sau. Cấu trúc dữ liệu nhập của các sự kiện bất thường phải có liên kết tới tàu bay, chuyến bay, sân bay và mã nguyên nhân chuẩn để có thể truy xuất, thống kê dài hạn.

### 8. Quản lý mục tiêu OTP và OSP (Part 2)

**Yêu cầu**

Phía nghiệp vụ yêu cầu TOSS phải quản lý cả mục tiêu (target) của OTP và OSP, không chỉ giá trị thực tế. Mục tiêu được phía nghiệp vụ nêu là tám mươi phần trăm và có bốn nhóm mục tiêu, gồm hai mục tiêu cho OTP và hai mục tiêu cho OSP.

**Thảo luận và Đề xuất**

Hai bên trao đổi rằng nếu hệ thống có đủ nguồn dữ liệu và công thức tính toán chính xác thì việc giám sát mức độ đạt mục tiêu là khả thi. Phía nghiệp vụ mong muốn báo cáo hiện thị được cảnh báo khi tỷ lệ thực hiện thấp hơn mục tiêu, ví dụ như khi sản lượng quá lớn dẫn đến tỷ lệ hỏng hóc tăng. Một tiêu chuẩn ngầm là chuyến bay được coi là đúng giờ khi cất cánh chậm không quá mười bốn phút so với giờ dự kiến, chỉ cần chậm hơn một phút là chuyến đó bị tính là chậm.

**Kết luận**

Hai bên thống nhất TOSS sẽ quản lý đồng thời mục tiêu và giá trị thực tế của bốn nhóm KPI là hai mục tiêu OTP và hai mục tiêu OSP. Việc xác định công thức chi tiết và nguồn dữ liệu cho từng nhóm sẽ được làm rõ ở các buổi khảo sát tiếp theo.

### 9. Đồng bộ dữ liệu và thời gian thực (Part 1, đoạn ~00:29:00)

**Yêu cầu**

Phía nghiệp vụ nhấn mạnh thời điểm chuẩn bị cất cánh rất khắc nghiệt về thời gian. Một chuyến bay chỉ cần chậm hơn một phút so với mốc cho phép là đã bị tính là chậm. Vì vậy với các thông báo và thay đổi gần thời điểm khởi hành, việc đồng bộ dữ liệu giữa các hệ thống phải gần thời gian thực, ngay cả chu kỳ đồng bộ một phút cũng có thể không đủ.

**Thảo luận và Đề xuất**

Phía phân tích đề xuất cần cơ chế truyền tin tức thời theo sự kiện, đặc biệt với những thay đổi gần thời điểm khởi hành thay vì chỉ dựa vào lịch đồng bộ định kỳ. Cụ thể với các thay đổi do MO Plus phát đi gần giờ cất cánh, hệ thống cần cập nhật trạng thái cho người vận hành kịp thời để in ra hoặc thông báo cho phi công.

**Kết luận**

Hai bên thống nhất cơ chế đồng bộ phải hỗ trợ truyền theo sự kiện cho các nghiệp vụ thời gian thực gần giờ cất cánh, không chỉ dựa vào đồng bộ định kỳ.

### 10. Tham chiếu chuẩn quốc tế FAA và ICAO (Part 1, đoạn ~00:51:00)

**Yêu cầu**

Phía phân tích đặt câu hỏi hãng có tham chiếu quy trình của FAA và ICAO hay không.

**Thảo luận và Đề xuất**

Phía nghiệp vụ xác nhận có tham chiếu các chuẩn quốc tế (FAA, ICAO, IATA) ở mức quy trình cấp một và cấp hai vì là một phần bắt buộc khi hãng tuân thủ tiêu chuẩn quốc tế. Tuy nhiên quy trình chi tiết bên dưới thì mỗi hãng tự xây dựng theo đặc thù vận hành của mình. Nguồn quốc tế chỉ dùng để tham khảo, không thay thế cho yêu cầu nghiệp vụ cụ thể của hãng.

**Kết luận**

Tài liệu khảo sát của TOSS sẽ ưu tiên bám sát quy trình nội bộ của hãng. FAA và ICAO chỉ được dùng làm tài liệu tham khảo cấp khái niệm, không sao chép trực tiếp vào đặc tả nghiệp vụ.

### 11. Nhóm đội tàu (Category / Fleet Grouping) phục vụ báo cáo (Part 2, đoạn ~01:40:00 trở đi)

**Yêu cầu**

Phía nghiệp vụ yêu cầu TOSS phải hỗ trợ nhiều cách phân nhóm đội tàu khác nhau, vì các báo cáo khác nhau dùng các cách phân nhóm khác nhau. Một số báo cáo gom A320 và A321 thành một nhóm, một số báo cáo lại tách riêng A350, 787, 777 và ATR, một số báo cáo phân theo thân rộng và thân hẹp. Báo cáo về fuel flow, taxi time và định mức nhiên liệu mỗi loại sử dụng cách chia nhóm riêng.

**Thảo luận và Đề xuất**

Phía nghiệp vụ đề xuất cho phép định nghĩa nhiều Category, mỗi tàu được map vào tất cả các Category liên quan ngay khi khai báo lần đầu. Khi tạo báo cáo, người dùng chỉ cần chỉ định báo cáo đó dùng Category nào và hệ thống tự gom theo. Với mỗi chiều thông tin trong báo cáo chỉ chọn một Category, không chọn đồng thời nhiều Category. Hệ thống cần định nghĩa sẵn một số kiểu gom phổ biến để người dùng chọn. Bên cạnh các nhóm theo loại tàu, tàu bay còn cần khai báo các thông tin chuẩn như Registration, ICAO Designator, IATA Designator, thuộc đội bay nào, hãng dạng (subfleet) và Configuration. Các phần linh hoạt khác cần được làm bằng form động (Dynamic Form). Ngoài ra, đơn vị nhiên liệu nhận về từ ACARS có thể khác nhau theo giai đoạn nên cần một hệ số quy đổi có hiệu lực theo thời gian, mặc định đơn vị nội bộ là kilogram.

**Kết luận**

Hai bên thống nhất TOSS cho phép định nghĩa nhiều Category để phân nhóm đội tàu phục vụ các báo cáo khác nhau. Mỗi tàu bay map nhiều Category một lần khi khai báo, mỗi báo cáo chọn một Category cho một chiều thông tin. Phần thuộc tính linh hoạt của tàu bay được làm bằng form động. Hệ thống quản lý hệ số quy đổi đơn vị nhiên liệu theo giai đoạn hiệu lực.

### 12. Module Data Monitoring (Part 1, cuối Part 1)

**Yêu cầu**

Phía nghiệp vụ yêu cầu có một module riêng để giám sát chất lượng nguồn dữ liệu tích hợp. Module này không phải báo cáo nghiệp vụ điều hành mà là báo cáo về tính đầy đủ và độ chính xác của dữ liệu (data completeness, data accuracy) theo ngày, tuần, tháng.

**Thảo luận và Đề xuất**

Phía nghiệp vụ ví dụ rằng việc tích hợp dữ liệu từ ACARS không đầy đủ cho toàn bộ đội tàu, ví dụ chỉ năm mươi phần trăm chuyến bay của đội A321 có dữ liệu ACARS, trong khi đội 787 đạt khoảng bảy mươi đến tám mươi phần trăm và đội A350 đạt khoảng chín mươi phần trăm. Hãng có một đầu mối phụ trách công việc theo dõi tỷ lệ phủ dữ liệu này. Vì vậy Data Monitoring không nên gộp vào báo cáo nghiệp vụ vì có mục đích hoàn toàn khác. Phía phân tích đồng tình tách thành một menu riêng nhưng cũng cho phép kết xuất ra ngoài.

**Kết luận**

Hai bên thống nhất Data Monitoring là một menu độc lập trong nhóm quản trị, có chức năng kết xuất báo cáo nhưng không trộn lẫn với báo cáo nghiệp vụ điều hành.

### 13. Cơ chế đa phiên (Multi-session) tham khảo từ hệ thống nước ngoài (Part 1, đoạn ~00:48:00)

**Yêu cầu**

Phía nghiệp vụ tham chiếu một hệ thống nước ngoài cho phép một người dùng mở đồng thời nhiều phiên làm việc theo các vai trò khác nhau (ví dụ session TAC, session Probe) và đề xuất TOSS xem xét cơ chế tương tự.

**Thảo luận và Đề xuất**

Hệ thống tham khảo cho phép chọn vai trò ngay từ màn hình đăng nhập, ví dụ Database Maintainer hoặc List Pack, mỗi vai trò mở ra một bộ menu riêng. Phía phân tích lưu ý đây là cơ chế phức tạp, có thể tham khảo cho định hướng đa luồng nhưng cần đánh giá thêm.

**Kết luận**

TOSS ghi nhận tham khảo, chưa quyết định triển khai cơ chế đa phiên trong giai đoạn này.

## III. Các nội dung đã thống nhất

| STT | Nội dung thống nhất | Phân hệ liên quan |
|---|---|---|
| 1 | Tách bảo trì danh mục thành menu độc lập, đặt cùng nhóm quản trị với System Admin và Data Monitoring. | Quản trị |
| 2 | Phân quyền theo chức năng cho thao tác, phân quyền theo căn cứ bay cho dữ liệu chuyến bay. | Toàn hệ thống |
| 3 | Một màn hình danh sách chuyến bay dùng chung cho nhiều vai trò, ẩn hoặc hiện cột và nút theo quyền. | Flight Load Control |
| 4 | Cho phép người dùng lưu cấu hình hiển thị cột cá nhân. | Toàn hệ thống |
| 5 | Flight Load Control là một module duy nhất, bên trong chia tab theo chức năng nghiệp vụ. | Flight Load Control |
| 6 | Có tab riêng cho upload công nghiệp nhiều tài liệu cho nhiều chuyến bay; nhận biết chuyến bay qua tên tệp theo quy ước. | Flight Load Control |
| 7 | Tài liệu xuất phát từ TOSS được lưu đầy đủ; tài liệu lấy từ hệ thống ngoài chỉ lưu tối đa ba ngày sau hạ cánh rồi tự động xóa. | Lưu trữ tài liệu |
| 8 | Station Manager là menu độc lập, phạm vi gồm checklist an ninh và tài liệu kèm; không phân quyền nhỏ hơn cấp căn cứ bay. | Station Manager |
| 9 | Quản lý tàu bay theo lịch sử hiệu lực, bao gồm hình thức sở hữu (sở hữu, thuê khô, thuê ướt và biến thể thuê ướt tự lo nhiên liệu) và thuộc tính kỹ thuật. | Danh mục tàu bay |
| 10 | Báo cáo điều hành ngày BCAO được tự sinh từ dữ liệu hệ thống kết hợp với nhập liệu của các trực chuyên môn theo cấu trúc chuẩn. | Báo cáo điều hành |
| 11 | TOSS quản lý đồng thời mục tiêu và giá trị thực tế của bốn nhóm KPI gồm hai cho OTP và hai cho OSP. | Báo cáo điều hành |
| 12 | Cơ chế đồng bộ phải hỗ trợ truyền theo sự kiện cho các nghiệp vụ thời gian thực gần giờ cất cánh. | Tích hợp |
| 13 | FAA và ICAO là tài liệu tham khảo cấp khái niệm; đặc tả nghiệp vụ bám sát quy trình nội bộ của hãng. | Phương pháp luận |
| 14 | Cho phép định nghĩa nhiều Category để phân nhóm đội tàu phục vụ các báo cáo khác nhau; mỗi báo cáo chọn một Category cho một chiều thông tin. | Danh mục tàu bay / Báo cáo |
| 15 | Quản lý hệ số quy đổi đơn vị nhiên liệu ACARS theo giai đoạn hiệu lực, đơn vị nội bộ là kilogram. | Tích hợp ACARS |
| 16 | Data Monitoring là menu độc lập, không trộn lẫn với báo cáo nghiệp vụ. | Quản trị |

## IV. Vấn đề cần làm rõ

1. Tên đầy đủ và cơ chế tích hợp của phần mềm IFV — nguồn dữ liệu tích hợp cho thuộc tính tàu bay (Fuel Tank Capacity, Cargo Capacity…) `[cần xác nhận]`.
2. Quy tắc đặt tên tệp chuẩn của Loadsheet CDPM, NOTOC, METAR và các loại tài liệu khác để TOSS tự gắn vào đúng chuyến bay — cần một buổi làm việc riêng với nguồn xuất Loadsheet CDPM `[cần xác nhận]`.
3. Tên đầy đủ và phạm vi của hệ thống ANABS dùng để nhận biết chuyến chuyên cơ và VIP — phỏng âm ASR là "ANABIOS" `[cần xác nhận]`.
4. Định nghĩa và công thức chi tiết của bốn nhóm KPI gồm hai OTP và hai OSP, kèm tiêu chí mục tiêu tám mươi phần trăm áp dụng cho nhóm nào `[cần xác nhận]`.
5. Mã nguyên nhân chuẩn của các sự kiện bất thường (kỹ thuật, thời tiết, sân bay, chuyến bay) sẽ được phía hãng cung cấp danh mục master sau buổi này `[cần xác nhận]`.
6. Cấu hình thời gian lưu trữ theo từng loại tài liệu trong server lưu trữ tập trung (ngoài mức ba ngày đã chốt cho tài liệu từ MO Plus) `[cần xác nhận]`.
7. Cơ chế nhập thông tin chuyến bay đặc biệt khi nguồn ANABS không trả mác phân loại — cần xác định luồng tích chọn thủ công cho trợ lý trực ban trưởng `[cần xác nhận]`.
8. Tên đầy đủ của Vasco, ý nghĩa của các "HT 30-31" trong câu chuyện hợp nhất khai thác — đề cập trong đoạn cuối Part 2 nhưng nghe không rõ `[cần xác nhận]`.
9. Định dạng dữ liệu nhập tay cho các yếu nhân và VIP, bao gồm chủ tịch nước, chủ tịch quốc hội, thủ tướng chính phủ, tổng bí thư — cần xác định danh sách kèm cấu trúc dữ liệu lưu `[cần xác nhận]`.
10. Cơ chế đa phiên tham chiếu từ hệ thống nước ngoài — TOSS có triển khai trong phạm vi giai đoạn này hay không `[cần xác nhận]`.

## V. Thuật ngữ đề xuất bổ sung domain-knowledge

| Thuật ngữ | Mô tả từ ngữ cảnh | Nguồn dòng (Part / mốc) |
|---|---|---|
| **IFV** | Phần mềm nội bộ quản lý thuộc tính kỹ thuật tàu bay (Fuel Tank Capacity, Cargo Capacity…) — nguồn tích hợp cho TOSS. Tên đầy đủ chưa rõ. | Part 1 ~01:03–01:06 |
| **Reconfig (Reconfiguration)** | Quá trình sửa đổi lại cấu hình tàu bay (cấu hình ghế, hệ thống nội thất). Trong giai đoạn reconfig tàu không xuất hiện trên lịch bay nhưng vẫn cần quản lý. | Part 1 ~00:58 |
| **Damp Lease (biến thể Wet Lease)** | Biến thể của Wet Lease trong đó bên đi thuê chỉ phụ trách phần nhiên liệu, các phần còn lại do bên cho thuê thực hiện. | Part 1 ~01:01 |
| **Fuel Tank Capacity** | Dung lượng bình nhiên liệu của tàu bay — một trong các thuộc tính kỹ thuật cần lưu. | Part 1 ~01:04 |
| **Cargo Capacity** | Dung lượng khoang hàng gồm bụng trên, bụng dưới và mũi — thuộc tính kỹ thuật của tàu bay. | Part 1 ~01:05 |
| **Category (Fleet Grouping)** | Cách phân nhóm đội tàu phục vụ báo cáo. Một tàu bay có thể map vào nhiều Category. Mỗi báo cáo chọn một Category cho một chiều thông tin. | Part 2 ~01:40–01:46 |
| **Data Monitoring** | Module giám sát tính đầy đủ và độ chính xác của các nguồn dữ liệu tích hợp (ACARS, Lido…), kết xuất báo cáo theo ngày/tuần/tháng. Khác với báo cáo nghiệp vụ. | Part 1 ~00:44–00:47 |
| **BCAO (báo cáo điều hành ngày)** | Báo cáo do trợ lý trực ban trưởng soạn thủ công, ghi nhận sự vụ trong ca và tổng kết ngày khai thác phục vụ lãnh đạo tổng công ty. TOSS sẽ tự sinh thay cho soạn tay. | Part 2 ~01:08–01:30 |
| **Subfleet / Hãng dạng (đội bay)** | Phân nhóm con của đội tàu, ví dụ A350-900 vs A350-1000, 787-9 vs 787-10. Một số báo cáo dùng cấp subfleet thay vì cấp loại tàu tổng. | Part 2 ~01:40–01:43 |
| **ICAO Designator / IATA Designator** | Hai mã định danh loại tàu bay theo chuẩn ICAO (4 ký tự) và IATA (3 ký tự) — cần khai báo trong danh mục tàu bay. | Part 1 ~00:55–00:56 |
| **Hệ số quy đổi đơn vị nhiên liệu (ACARS)** | Hệ số quy đổi đơn vị nhiên liệu nhận từ ACARS về đơn vị kilogram nội bộ; có giai đoạn hiệu lực để xử lý trường hợp tàu bay đổi đơn vị truyền theo thời gian. | Part 2 ~01:48–01:51 |
| **Multi-session / Đa phiên** | Cơ chế cho phép một người dùng mở đồng thời nhiều phiên làm việc theo các vai trò khác nhau — tham chiếu hệ thống nước ngoài. | Part 1 ~00:48–00:51 |

---

*Báo cáo này được lập trực tiếp từ hai tệp transcript đã liệt kê tại frontmatter, không tham chiếu báo cáo cũ. Mọi nội dung không nghe rõ trong transcript đều được gắn cờ `[cần xác nhận]` để chờ buổi khảo sát tiếp theo làm rõ.*
