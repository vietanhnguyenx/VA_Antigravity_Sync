---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.3"
date: "2026-06-16"
survey_date: "2026-06-11"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Phỏng vấn Dispatcher buổi sáng 11/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi sáng 11/06/2026 (Phỏng vấn Dispatcher)

> Báo cáo này gộp toàn bộ buổi sáng 11/06/2026, gồm Phần 1 và Phần 2 nối tiếp của buổi phỏng vấn điều phái viên (Dispatcher). Các chủ đề 1 đến 7 thuộc Phần 1, các chủ đề 8 đến 15 thuộc Phần 2. Toàn bộ nội dung được lập lại trực tiếp từ bản ghi âm chuyển văn bản của buổi khảo sát.

## I. Thông tin chung

| Mục | Nội dung |
|---|---|
| **Thời gian** | Buổi sáng ngày 11/06/2026, gồm hai phần nối tiếp (Phần 1 từ đầu buổi đến khoảng 00:54, Phần 2 từ khoảng 00:55 đến 01:48). |
| **Mục đích** | Đi sâu vào quy trình tác nghiệp của vị trí điều phái viên. Phần 1 tập trung vào quy trình lập và phát hành kế hoạch bay (OFP), cơ chế Dispatch Release, kiểm tra đầu ca, cảnh báo thay đổi lịch bay, cảnh báo NOTAM và cảnh báo thời tiết. Phần 2 tiếp tục với cảnh báo lệch tải giữa OFP và CLC trên Lido, bảng dầu AHM, NAIL/CDL, phép bay, chứng chỉ tổ bay theo sân bay, đổi tổ bay, taxi time và Cost Index. |
| **Đối tượng phỏng vấn** | Điều phái viên (Dispatcher) của VNA, đại diện khối khai thác chuyến bay. |
| **Phía khảo sát** | Đội phân tích nghiệp vụ TOSS. |
| **Ghi chú chất lượng nguồn** | Chất lượng ghi âm ở cuối Phần 1 (đoạn về thời tiết, METAR và SPECI) và nhiều đoạn xuyên suốt Phần 2 bị hạn chế. Các đoạn không suy luận chắc chắn được giữ nguyên và gắn cờ `[cần xác nhận]` để rà soát bổ sung. |

---

# PHẦN 1 — OFP, Dispatch Release, kiểm tra đầu ca, cảnh báo lịch bay, NOTAM và thời tiết

## II. Nội dung trao đổi

### 1. Quy trình phát hành kế hoạch bay (OFP) và đẩy tài liệu lên MO Plus

**Yêu cầu**

Điều phái cần một quy trình chuẩn hóa cho việc phát hành kế hoạch bay (OFP — Operational Flight Plan) và đẩy tài liệu lên hệ thống MO Plus, kèm dấu hiệu rõ ràng để nhận biết phiên bản nào đã được điều phái chốt.

Hiện trạng được điều phái mô tả như sau. Hệ thống Lido tự động sinh OFP và tự động đẩy tài liệu lên MO Plus mà không có bước review hay thao tác chủ động nào của điều phái trước khi tài liệu được phát hành cho phi công. Về thời điểm upload, chuyến quốc tế được upload trước 90 phút so với giờ khởi hành dự kiến (STD), chuyến nội địa upload trước 60 phút. Trong buổi phỏng vấn, điều phái còn nhắc đến các mốc 130 phút, 180 phút và 200 phút cho các giai đoạn của chuyến quốc tế dài, tuy nhiên phân loại chính xác từng mốc cần làm rõ thêm `[cần xác nhận]`. Khi tải, dầu hoặc thông tin tàu bay có thay đổi, Lido có thể tự sinh lại OFP và tự đẩy bản mới lên MO Plus mà không cần điều phái can thiệp.

Vấn đề cốt lõi nằm ở chỗ vì việc đẩy OFP lên MO Plus được tự động hóa hoàn toàn, hiện chưa có cơ chế nào để phi công cũng như chính điều phái phân biệt được đâu là phiên bản OFP đã được điều phái chốt và đâu là phiên bản hệ thống tự sinh do thay đổi tải hoặc thay đổi giờ.

**Thảo luận và Đề xuất**

Phía khảo sát đề xuất bổ sung một thao tác chủ động của điều phái trên TOSS, gọi tên là "Dispatch Release". Sau khi điều phái thực hiện Dispatch Release, phiên bản OFP tương ứng mới được coi là bản chính thức. Điều phái xác nhận rằng Lido vẫn có thể tiếp tục tự sinh OFP và đẩy lên MO Plus như hiện tại, nhưng cần có dấu hiệu rõ ràng để biết bản nào đã được điều phái Dispatch Release.

Cách tiếp cận được hai bên thống nhất là không chặn việc tài liệu lên MO Plus mà thay vào đó gắn trạng thái "đã Dispatch Release" cho từng phiên bản OFP. Trạng thái này làm tín hiệu để các bên hạ nguồn gồm MO Plus và phi công sử dụng.

**Kết luận**

Hai bên thống nhất bổ sung chức năng Dispatch Release trên TOSS như một thao tác chủ động của điều phái. Lido tiếp tục tự sinh OFP và đẩy lên MO Plus, tuy nhiên TOSS phải gắn được trạng thái "đã Dispatch Release" cho từng phiên bản tài liệu để nhận biết bản chốt. Các mốc thời điểm upload 130, 180 và 200 phút cần được làm rõ thêm trong các buổi sau để chuẩn hóa quy định nghiệp vụ.

### 2. Cơ chế chặn Captain's Release khi điều phái chưa Dispatch Release

**Yêu cầu**

Phi công chỉ được phép thực hiện thao tác xác nhận tài liệu (Captain's Release) sau khi điều phái đã hoàn tất Dispatch Release cho chuyến bay tương ứng. Nếu điều phái chưa Dispatch Release, hệ thống MO Plus phải hiển thị thông báo và chặn thao tác Captain's Release của phi công.

**Thảo luận và Đề xuất**

Phía khảo sát đề xuất mô hình kết hợp hai phía, trong đó TOSS quản lý hành động Dispatch Release còn MO Plus tiêu thụ trạng thái Dispatch Release để quyết định cho phép hoặc chặn Captain's Release. Yêu cầu này dẫn đến nhu cầu điều chỉnh đồng thời cả TOSS và MO Plus.

Điều phái nhấn mạnh nguyên tắc phối hợp giữa hai vị trí. Phi công vẫn có thể mở xem OFP và tài liệu trên MO Plus nhưng không được thực hiện Confirm hay Release khi chưa có Dispatch Release từ điều phái. Phi công cần được hiển thị thông báo dạng "Dispatch chưa Release" để biết trạng thái và không thực hiện Captain's Release sai thời điểm.

**Kết luận**

Hai bên thống nhất nguyên tắc phi công chỉ được Captain's Release sau khi điều phái đã Dispatch Release trên TOSS. MO Plus cần được điều chỉnh để chặn thao tác Captain's Release khi chưa có Dispatch Release tương ứng và hiển thị thông báo rõ ràng cho phi công. Phạm vi tích hợp giữa TOSS và MO Plus, bao gồm giao diện trạng thái, thời điểm đồng bộ và cơ chế thông báo, cần được làm rõ trong buổi làm việc tiếp theo.

### 3. Quy tắc làm lại OFP khi thay đổi sát giờ khởi hành

**Yêu cầu**

Hai bên cần thống nhất quy tắc rõ ràng về việc điều phái có hay không cần phát hành lại OFP khi xảy ra thay đổi về tải, dầu hoặc thông tin chuyến bay ở các mốc thời gian sát STD.

**Thảo luận và Đề xuất**

Điều phái mô tả nguyên tắc đang vận hành hiện nay. Khi thời điểm còn dưới 60 phút trước STD đối với chuyến nội địa, nếu phát sinh thay đổi tải thì điều phái không tự động làm lại OFP. Trường hợp tổ bay có yêu cầu làm lại OFP thì phải gọi điện thoại trực tiếp cho điều phái, và chỉ khi đó điều phái mới thực hiện làm lại. Lý do là ở thời điểm sát giờ, dầu đã được nạp và khách đã lên gần xong nên nếu phải nạp lại dầu thì hành khách phải xuống tàu lại, tốn nhiều thời gian và có rủi ro chậm chuyến.

Phía khảo sát ghi nhận quy tắc này như một ràng buộc nghiệp vụ và chưa đặt vấn đề tự động hóa quyết định trong tình huống này, để con người tiếp tục là người quyết định.

**Kết luận**

Quy tắc nghiệp vụ được xác nhận: dưới 60 phút trước STD đối với chuyến nội địa, điều phái không tự làm lại OFP cho thay đổi tải, chỉ làm lại khi tổ bay yêu cầu qua điện thoại. TOSS không cần tự động hóa quy tắc này nhưng cần ghi nhận lịch sử các lần làm lại OFP sát giờ kèm lý do để phục vụ truy vết.

### 4. Kiểm tra đầu ca (Start-of-Shift Check) và màn hình tập trung

**Yêu cầu**

Đầu ca, điều phái phải kiểm tra toàn bộ lịch bay thuộc ca trực, bao gồm các nội dung sau. Điều phái cần kiểm tra lịch bay (Flight Schedule), loại tàu bay, tàu quay (rotation), cứu hỏa sân bay (RFFS category), thời tiết, tải, MEL và CDL, các hạn chế khai thác và chứng chỉ tổ bay.

Vấn đề hiện trạng là mỗi nội dung kiểm tra đang nằm ở một ứng dụng hoặc tab riêng. Điều phái phải mở từ 5 đến 7 ứng dụng rời rạc để hoàn tất kiểm tra đầu ca, và một số bước đang được làm thủ công, không có hệ thống tự đối chiếu tự động. Mong muốn của điều phái là có một màn hình tập trung trên TOSS gom các đầu mối cần lưu ý của ca trực, hệ thống tự đối chiếu các nguồn dữ liệu và tự sinh cảnh báo khi có bất thường.

**Thảo luận và Đề xuất**

Phía khảo sát đề xuất TOSS gom toàn bộ dữ liệu gồm lịch bay, tàu bay, tài liệu chuyến, thời tiết, NOTAM và tải vào một nguồn tập trung. Hệ thống sẽ tự đối chiếu hai chiều giữa các nguồn và tự sinh cảnh báo khi phát hiện không khớp hoặc có biến động bất thường. Điều phái chỉ "view" trên TOSS, không phải thao tác tích từng mục, trong khi các thao tác nghiệp vụ như xác nhận tài liệu hoặc làm lại OFP vẫn ở hệ thống chuyên dụng như Lido hoặc MO Plus. Khi cần giải quyết một cảnh báo, điều phái chuyển sang đúng hệ thống chuyên dụng để xử lý, và sau khi xử lý xong thì dữ liệu tự đồng bộ và cảnh báo tự tắt.

Điều phái phản hồi rằng không phân tách ưu tiên giữa các mục kiểm tra vì "cái nào cũng quan trọng". Khi vào ca, mục được kiểm tra đầu tiên là tàu quay, sau đó là thời tiết, rồi tới các mục còn lại.

**Kết luận**

Hai bên thống nhất TOSS xây dựng một màn hình tập trung phục vụ kiểm tra đầu ca, gom đầy đủ các nội dung kiểm tra đã liệt kê. Nguyên tắc thiết kế là TOSS đóng vai trò "view và cảnh báo", còn thao tác nghiệp vụ vẫn nằm ở hệ thống chuyên dụng tương ứng để không trùng lặp chức năng. Không cần phân cấp mức ưu tiên giữa các mục kiểm tra, tuy nhiên hệ thống cần phân loại được loại cảnh báo nào là bắt buộc và loại nào chỉ ghi nhận để báo cáo. Chi tiết sẽ được chốt ở các buổi tiếp theo.

### 5. Cảnh báo thay đổi lịch bay (Flight Schedule Change)

**Yêu cầu**

TOSS cần cảnh báo khi lịch bay có biến động vượt ngưỡng OSP hoặc khi loại chuyến thay đổi gây ảnh hưởng đến công tác điều phái.

**Thảo luận và Đề xuất**

Có hai yếu tố chính cần cảnh báo. Yếu tố thứ nhất là thay đổi giờ bay. Khi giờ bay lệch từ 15 phút trở lên so với kế hoạch theo ngưỡng OSP thì cảnh báo được phát ra, áp dụng cho cả hai chiều sớm hơn hoặc muộn hơn. Yếu tố thứ hai là thay đổi loại tàu (aircraft type) và thay đổi tàu bay cụ thể (tail number), cần cảnh báo vì ảnh hưởng đến cấu hình khai thác và tài liệu chuyến.

Về cảnh báo chuyển đổi loại chuyến bay, các bên thống nhất một số tình huống cụ thể. Khi phát sinh chuyến ferry (chuyến không thương mại, chỉ điều chuyển tàu bay), hệ thống cần highlight để điều phái xử lý tài liệu riêng. Khi chuyển từ chuyến thường sang VIP, hệ thống phải highlight do thay đổi cấp độ phục vụ và yêu cầu tài liệu khác. Ngược lại, khi chuyển từ VIP về thường (downgrade), hệ thống chỉ ghi nhận mà không cần cảnh báo đặc biệt. Đối với việc trả tải qua đổi nhân sự, kế hoạch thường được lập sẵn và không thay đổi sát giờ nên không cần cảnh báo riêng.

Trong transcript xuất hiện các cụm "Lotang", "lô tam" và "nô tam" — đây là lỗi nhận dạng giọng nói (ASR) của thuật ngữ NOTAM, không tồn tại khái niệm "chuyến Lotang". Nội dung thực là cảnh báo NOTAM mới phát sinh kèm đánh giá ảnh hưởng, được gộp vào chủ đề NOTAM ở mục 6.

Về cảnh báo chuyến chuyển hướng (Divert), các bên đồng thuận tách thành một nhóm cảnh báo riêng vì Divert là tình huống đặc thù phát sinh sau khi chuyến đã cất cánh. Khi Divert phát sinh chuyến bay mới, TOSS cảnh báo "chuyến bay chưa có tài liệu" cho chuyến mới này.

**Kết luận**

Ngưỡng cảnh báo thay đổi giờ bay được chốt ở mức cộng/trừ 15 phút theo OSP, áp dụng cho cả trường hợp sớm và muộn. Các trường hợp cần cảnh báo bao gồm thay đổi loại tàu, thay đổi tàu bay, phát sinh chuyến ferry và chuyển sang VIP. Trường hợp chuyển từ VIP về thường chỉ ghi nhận mà không cảnh báo. Divert được tách thành một nhóm cảnh báo riêng và khi Divert phát sinh chuyến bay mới thì cảnh báo "chưa có tài liệu" được phát ra.

### 6. Cảnh báo NOTAM

**Yêu cầu**

TOSS cần tích hợp NOTAM, phân loại tự động và cảnh báo các NOTAM ảnh hưởng trực tiếp đến chuyến bay mà điều phái đang phụ trách.

**Thảo luận và Đề xuất**

Hiện trạng cho thấy nguồn NOTAM được lấy từ trang quản lý của cơ quan quản lý bay (trong transcript ghi nhận là "VNCM" `[cần xác nhận]`), và điều phái đang tra cứu thủ công. Tài liệu cứu hỏa sân bay (RFFS) trên thực tế cũng nằm trong NOTAM chứ không tách riêng. Vấn đề nằm ở chỗ NOTAM có hàng trăm loại, không phải tất cả đều ảnh hưởng đến chuyến bay, nên không thể đọc và đánh giá toàn bộ một cách thủ công.

Phía khảo sát đề xuất tiếp cận theo nhiều mức. Mức một là trích xuất NOTAM từ nguồn chính thức. Mức hai là phân loại NOTAM thành NOTAM sân bay, NOTAM vùng trời và NOTAM đường bay, trong đó phân loại chi tiết cần workshop riêng với chuyên gia nghiệp vụ (SME) điều phái. Mức ba là đánh giá mức độ ảnh hưởng tới chuyến cụ thể để highlight.

Trường hợp NOTAM cứu hỏa (RFFS) có đặc thù riêng. Mỗi sân bay có cấp cứu hỏa cố định gắn với loại tàu được phép khai thác, và khi cấp này thay đổi thì NOTAM tương ứng sẽ được phát ra. TOSS chỉ cần phát hiện NOTAM cứu hỏa là đủ để cảnh báo, không cần lưu bảng tiêu chuẩn RFFS hiện hành. Để đánh giá ảnh hưởng cụ thể, sau này hệ thống cần được cung cấp thông tin tiêu chuẩn của từng sân bay. Điều phái sẽ cung cấp tài liệu định nghĩa NOTAM cùng ảnh trang quản lý để đội phân tích chuẩn bị buổi làm việc riêng.

**Kết luận**

TOSS sẽ tích hợp NOTAM từ nguồn chính thức và phân loại theo ba nhóm là NOTAM sân bay, NOTAM vùng trời và NOTAM đường bay. Khi có NOTAM cứu hỏa (RFFS) phát ra, TOSS sẽ cảnh báo trực tiếp mà không cần duy trì danh sách tiêu chuẩn RFFS hiện hành. Hai bên thống nhất cần một workshop riêng với SME để chi tiết hóa phân loại NOTAM và tiêu chí đánh giá ảnh hưởng tới chuyến cụ thể. Điều phái sẽ cung cấp tài liệu NOTAM và quyền truy cập trang quản lý để đội phân tích nghiên cứu trước.

### 7. Cảnh báo thời tiết

**Yêu cầu**

TOSS cần tích hợp và cảnh báo thời tiết tại các sân bay khai thác, phục vụ điều phái ra quyết định cả trước và trong quá trình khai thác.

**Thảo luận và Đề xuất**

Nguyên tắc cảnh báo được thống nhất là chỉ phát cảnh báo khi thông số tiến gần hoặc xuống dưới ngưỡng tối thiểu (VMA `[cần xác nhận viết tắt]`) cộng thêm một biên an toàn (margin). Một con số biên cụ thể là 500m đã được nhắc tới trong thảo luận, gắn với ngưỡng tầm nhìn. Đối với sân bay cất cánh và hạ cánh, ba thông số cần cảnh báo bao gồm tầm nhìn (Visibility), trần mây (Cloud Ceiling) và mưa dông TSRA (Thunderstorm và Rain). Thời tiết đường bay (en-route) liên quan đến SIGMET và bản tin chuyên dụng, tuy nhiên đoạn transcript ở phần này bị nhiễu nặng nên cần xác nhận lại.

Về nguồn dữ liệu thời tiết, đối với sân bay nội địa, METAR và SPECI được lấy từ cơ quan khí tượng hàng không Việt Nam (transcript ghi nhận là "Vy Vy" `[cần xác nhận]`) và đây là nguồn chính thức. Đối với sân bay quốc tế, hệ thống dùng nguồn trong gói Lido, lưu ý rằng Lido chỉ "release" theo gói tài liệu chuyến bay chứ không phải quan trắc liên tục. Nguồn "UA PASMOS" `[cần xác nhận]` là giao diện hiển thị dữ liệu thời tiết có thể export và cần phương án kỹ thuật để tích hợp. Nguồn "Sunweather" `[cần xác nhận]` bị đánh giá là rủi ro và không ổn định nên cần cân nhắc khi sử dụng. Nguồn "Phi Công 11" `[cần xác nhận]` không phải nguồn chính thức và chỉ dùng để tham khảo.

Về METAR và SPECI, METAR là bản tin quan trắc định kỳ trong khi SPECI là bản tin đặc biệt được phát khi có biến động đáng kể, cả hai có cùng cấu trúc. Hai loại bản tin này đều ở dạng văn bản mã hóa, cần được parse ra các trường để đối chiếu với ngưỡng cảnh báo.

**Kết luận**

Cảnh báo thời tiết sân bay tập trung vào ba thông số là tầm nhìn, trần mây và TSRA, so sánh với VMA cộng biên an toàn. Nguồn nội địa là cơ quan khí tượng hàng không Việt Nam cung cấp METAR và SPECI, tên cụ thể cần xác nhận. Nguồn quốc tế ưu tiên gói Lido làm nguồn chính thức, còn Sunweather và "Phi Công 11" chỉ dùng để tham khảo. TOSS phải tích hợp METAR và SPECI, đồng thời parse được nội dung để cảnh báo tự động. Chi tiết về thời tiết en-route bao gồm SIGMET, nguồn quốc tế và cơ chế parse cần làm rõ ở buổi riêng do đoạn ghi âm bị nhiễu.

---

# PHẦN 2 — Lệch tải, bảng dầu, NAIL/CDL, phép bay, tổ bay, taxi time và Cost Index

### 8. Cảnh báo lệch tải và trọng lượng giữa OFP và số liệu thực tế (CLC trên Lido)

**Yêu cầu**

Hệ thống cần cơ chế so sánh giữa số liệu thực tế do bộ phận tải và cân bằng (CLC `[cần xác nhận tên đầy đủ]`) nhập với số liệu trên OFP mà điều phái đang dùng, đồng thời phát cảnh báo khi sai lệch vượt ngưỡng. Luồng hiện hành là CLC nhập số liệu trước (bao gồm ZFW và payload) rồi điều phái dựa vào đó hoàn thiện OFP. CLC có thể nhập lại nhiều lần, do đó TOSS sẽ lấy con số nhập cuối cùng để đối chiếu với OFP cuối cùng.

**Thảo luận và Đề xuất**

Đối tượng so sánh chính là cột ZFW trên OFP với cột ZFW từ nguồn thực tế trên Lido. Khi số thực tế vượt qua số kế hoạch thì cảnh báo được phát ra.

Cấu hình ngưỡng cảnh báo có cấu trúc nhiều chiều. Ngưỡng được chia thành ngưỡng trên và ngưỡng dưới, không bắt buộc đối xứng, ví dụ cho phép thiếu hơn 1,5 tấn nhưng chỉ cho phép cao hơn 1 tấn. Ngưỡng cũng phân theo loại tàu bay, theo khoảng giờ bay chia dải (dưới 3 giờ, từ 3 đến 6 giờ, trên 6 giờ) và theo yếu tố tăng giảm với ngưỡng dương và âm khác nhau. Cấu hình này áp dụng cho các trường ZFW, payload, "patch down" `[cần xác nhận — có thể là touchdown weight]` và take-off weight (ASR ghi là "loft power"). Riêng take-off weight tính cả dầu, dầu extra và dầu riêng.

Về khái niệm trọng lượng khô và trọng lượng ướt, điều phái mô tả rằng có hai con số trên tài liệu cân bằng tải, trong đó một con số là "trọng lượng khô" tương ứng zero fuel weight (chưa dầu, chưa nước) và một con số là "trọng lượng ướt" (ASR ghi không rõ thành "phi vết") cộng cả hai mới ra giá trị cuối. Khái niệm "trọng lượng ướt" cần được xác nhận thêm `[cần xác nhận]`.

**Kết luận**

TOSS xây dựng cảnh báo so sánh OFP với số liệu thực tế (từ Lido và CLC) trên các trường trọng lượng và tải, bao gồm ZFW, payload và take-off weight. Ngưỡng cảnh báo được cấu hình theo ma trận loại tàu × khoảng giờ bay × ngưỡng trên/dưới không đối xứng, với cấu hình cụ thể được cung cấp ở buổi sau. TOSS cũng lưu lịch sử nhập của CLC để luôn lấy được con số nhập cuối cùng.

### 9. Bảng dầu (AHM) và phương án thay thế tạm thời

**Yêu cầu**

Điều phái cần tra cứu bảng dầu theo loại tàu và điều kiện khai thác khi lập kế hoạch bay. Bảng này hiện đang được quản lý ở phần mềm IFV của "anh Kiếm" `[cần xác nhận tên đầy đủ]`.

**Thảo luận và Đề xuất**

Hướng dài hạn được thống nhất là khi phần mềm IFV hoàn thành, TOSS sẽ lấy kết quả bảng dầu từ đó. Trong giai đoạn chuyển tiếp, hướng tạm thời là điều phái chủ động khai báo bảng dầu trong TOSS bằng cách nhập danh mục (trong transcript ghi nhận "quả đấy dầu" `[cần xác nhận cách gọi chính xác]`), và TOSS sẽ cảnh báo khi có thay đổi, thay cho cuộc gọi điện hiện hành từ CLC.

Phía khảo sát đề nghị được cung cấp tài liệu AHM để xác định phạm vi tích hợp, và điều phái xác nhận sẽ gửi tài liệu. Lido hiện lấy bảng dầu của "anh Ngọt" `[cần xác nhận]` qua import, trong đó Lido mở form cho người nhập tay chứ không gọi API. TOSS sẽ làm tương tự trong giai đoạn chuyển tiếp.

**Kết luận**

TOSS sẽ hỗ trợ điều phái khai báo bảng dầu thủ công trong giai đoạn đầu, sau đó chuyển sang tích hợp tự động với IFV khi hệ thống này sẵn sàng. TOSS cảnh báo khi bảng dầu thay đổi. Hai bên cần lấy tài liệu AHM để xác định cấu trúc dữ liệu bảng dầu.

### 10. Cảnh báo phát sinh NAIL hoặc CDL (lỗi kỹ thuật tàu bay)

**Yêu cầu**

TOSS phải nhận biết khi tàu bay được lên kế hoạch khai thác phát sinh NAIL `[cần xác nhận viết tắt]` hoặc CDL trong khoảng thời gian chuyến bay đang phụ trách, để phát cảnh báo. Đây là các lỗi kỹ thuật, chẳng hạn APU hỏng, buộc chuyến bay phải mang thêm dầu hoặc chịu các hạn chế khai thác.

**Thảo luận và Đề xuất**

Quy tắc cảnh báo được xây dựng theo thời điểm NAIL phát sinh. NAIL có khoảng hiệu lực (active period), được raise tại một thời điểm và kéo dài cho tới khi release. Chuyến đã cất cánh trước khi NAIL được raise thì không cần cảnh báo. Chuyến rơi vào khoảng hiệu lực và chưa khai thác thì cần cảnh báo, kể cả khi tại thời điểm đó chưa bị ảnh hưởng, vì thay đổi tải có thể dẫn tới chạy lại OFP và vướng NAIL. Khi NAIL kéo dài sang ngày khác, các chuyến nằm sau khoảng hiệu lực thì không cần cảnh báo nữa.

Khi NAIL ảnh hưởng quay tàu, điều phái có thao tác chuyển kế hoạch khai thác giữa các tàu (transcript ghi là "chuyển nát" `[cần xác nhận]`). Nguồn dữ liệu NAIL được tích hợp từ AMOS `[cần xác nhận cơ chế]`, và khi AMOS phát một NAIL mới active thì TOSS lấy về để cảnh báo.

Về khái niệm master NAIL và sub-NAIL, NAIL gốc có thời hạn (chẳng hạn 6 tháng) sẽ được tách ra thành các sub-NAIL active theo từng giai đoạn `[cần xác nhận thuật ngữ]`. Có một xử lý đặc biệt cần lưu ý: nếu Lido đã tính NAIL vào dầu thì cảnh báo bổ sung của TOSS có thể không cần. Ranh giới giữa TOSS và Lido trong xử lý NAIL cần được làm rõ thêm.

**Kết luận**

TOSS tích hợp AMOS để nhận thông tin NAIL hoặc CDL phát sinh kèm active period. Quy tắc cảnh báo là chỉ cảnh báo cho chuyến nằm trong khoảng hiệu lực NAIL và chưa cất cánh. Khi NAIL ảnh hưởng quay tàu, TOSS hỗ trợ điều phái chuyển kế hoạch giữa các tàu, đóng vai trò input cho thao tác Lido. Hai bên cần làm rõ viết tắt NAIL, mô hình master và sub, cũng như ranh giới giữa TOSS (cảnh báo) và Lido (đã tính NAIL vào dầu).

### 11. Phép bay (Flight Permission) và cấu trúc dữ liệu phép bay

**Yêu cầu**

TOSS cần quản lý phép bay, bao gồm kiểm tra phép còn hiệu lực và đường bay có khớp với phép xin hay không. Hiện trạng là phép bay đang được nhập thủ công, chưa có phần mềm chuyên dụng. Đội SkyCheck (cùng tổng công ty) đang triển khai module phép bay nhưng vướng khâu input.

**Thảo luận và Đề xuất**

Về bản chất, phép bay được xin theo mùa lịch bay (6 đến 7 tháng), trong đó một lần xin cho toàn bộ lịch thường lệ của mùa. Với lịch thường lệ, việc thêm mùa lịch bay là gần như đủ phép bay. Riêng chuyến VIP hoặc charter được cấp phép riêng theo từng chuyến, có thể sát giờ. Khi đổi sân bay dự bị hoặc đổi điểm hạ cánh, hệ thống cần xin phép bổ sung.

Cấu trúc thông tin phép bay được đề xuất phân theo quốc gia × loại tàu × khoảng thời gian hiệu lực × đường bay và waypoint.

Về phối hợp với SkyCheck, phía khảo sát đề nghị không phụ thuộc SkyCheck bằng cách tự định nghĩa cấu trúc dữ liệu phép bay trong TOSS, cho nhập trực tiếp và TOSS tự sinh báo cáo. Đội cũng sẽ kiểm tra tiến độ phân tích nghiệp vụ SkyCheck để tận dụng, với chị quản lý liên hệ qua anh Hùng.

**Kết luận**

TOSS sẽ xây module quản lý phép bay theo cấu trúc quốc gia × loại tàu × đường bay × thời gian hiệu lực. Trước mắt cho nhập trực tiếp và TOSS tự sinh báo cáo. Đội rà soát tích hợp và tận dụng phân tích SkyCheck qua anh Hùng nhưng không phụ thuộc vào SkyCheck. Với lịch thường lệ, việc thêm mùa là gần như đủ phép bay, còn các trường hợp VIP, charter và thay đổi đột xuất sẽ được xử lý bổ sung.

### 12. Chứng chỉ tổ bay theo sân bay đặc biệt (Captain Certification per Aerodrome)

**Yêu cầu**

Một số sân bay có địa hình hoặc điều kiện đặc biệt, chẳng hạn Điện Biên và Đồng Hới (transcript ghi "Đế Pân" `[cần xác nhận]`), yêu cầu cơ trưởng hoặc tổ bay có chứng chỉ riêng hoặc đáp ứng điều kiện kinh nghiệm cụ thể mới được khai thác.

**Thảo luận và Đề xuất**

Về tính chất, đây không phải là bằng lái thông thường mà là điều kiện bổ sung gắn theo từng sân bay khó. Khi tổ bay không đủ điều kiện, hệ thống sẽ cảnh báo để điều phái đề nghị đổi tổ. Về phạm vi, có ý kiến cho rằng đây là việc của trực ban trưởng. Hai bên chốt nguyên tắc liệt kê toàn bộ cảnh báo cần có trước, sau đó phân loại thuộc điều phái hay trực ban trưởng, không bỏ sót.

Về cảnh báo đổi tổ bay, khi chuyến đổi tổ và có tên tổ bay mới thì TOSS sẽ cảnh báo cho điều phái. Khi điều phái vào Lido, Lido đã có tổ bay mới (Lido đóng vai trò TIC `[cần xác nhận]`), nên điều phái chỉ thao tác lại mà không phải đẩy tổ bay vào Lido.

**Kết luận**

TOSS cần danh mục điều kiện đặc biệt theo sân bay và đối chiếu với chứng chỉ tổ bay được phân, cảnh báo khi không thỏa mãn. TOSS phát cảnh báo đổi tổ bay kèm tên tổ bay mới để điều phái nắm. Cảnh báo phân tổ bay ban đầu có thể thuộc trực ban trưởng và sẽ được phân loại sau khi liệt kê đầy đủ.

### 13. APU time, PAX time và lịch PAX

**Yêu cầu**

TOSS cần cảnh báo các thay đổi liên quan đến APU time, PAX time và lịch PAX.

**Thảo luận và Đề xuất**

Về hiện trạng kỹ thuật, OFP của Lido không thể hiện APU time và "phone" (báo điện tử tổ bay) cũng không có thông tin này. Do đó, nếu cảnh báo thì chỉ có thể dựa trên PAX time, tức số PAX có trong OFP.

Về cảnh báo lịch PAX, hệ thống cảnh báo trước STD bao nhiêu phút thì kiểm tra lịch PAX `[cần xác nhận ngưỡng phút]`. Trường hợp "phone bằng một kiếm" `[cần xác nhận]` nhưng chưa nhập báo mạng thì hệ thống chỉ cảnh báo khi có thay phó hoặc khi nhập Lido sai sót.

**Kết luận**

TOSS không cảnh báo APU time do OFP, Lido và "phone" đều không cung cấp dữ liệu này. TOSS cảnh báo PAX time và lịch PAX dựa trên số liệu có sẵn trên OFP và Lido. Ngưỡng theo phút cùng các trường hợp cụ thể sẽ được chốt sau do đoạn ghi âm không rõ.

### 14. Taxi time chuẩn (Standard Taxi Time)

**Yêu cầu**

TOSS cần dùng Standard Taxi Time làm dữ liệu đầu vào cho tính toán chuyến bay.

**Thảo luận và Đề xuất**

Hiện trạng cho thấy bên MOI `[cần xác nhận]` đang quản lý Standard Taxi Time. Mỗi sân bay có giá trị chuẩn riêng kèm thời gian hiệu lực. Về quy tắc cập nhật, bình thường Standard Taxi Time ít thay đổi, chỉ thay đổi trong kỳ cao điểm như Tết hoặc dịp đặc biệt, do đó cần được monitor và thông báo.

Về tích hợp với Lido, nếu Lido có API hoặc database master thì TOSS sẽ push tự động. Trường hợp ngược lại, điều phái sẽ phải nhập tay từng sân do Lido khá kén tích hợp ("rất nóng"), dẫn đến hệ quả nhập hai lần. Về mặt thống kê, TOSS có thể tự thống kê Standard Taxi Time từ dữ liệu thực tế (QAR và QAI), phân tích dưới hệ thống "long" `[cần xác nhận]`, rồi trình điều phái duyệt trước khi áp dụng. Nguồn QAI được lấy qua API hoặc Database View của tổng công ty.

**Kết luận**

TOSS quản lý Standard Taxi Time theo sân bay và thời gian hiệu lực. TOSS tự thống kê từ QAR và QAI qua API hoặc Database View và trình điều phái duyệt. Hệ thống cảnh báo khi sân bay thay đổi Standard Taxi Time, đặc biệt trong các đợt cao điểm. Phương án push sang Lido cần khảo sát kỹ thuật, và nếu không khả thi thì chấp nhận "nhập hai lần" trong giai đoạn đầu. Hai bên cần làm rõ MOI là đơn vị hoặc hệ thống nào.

### 15. Cost Index (CI) — bỏ cảnh báo

**Yêu cầu**

Yêu cầu kỹ thuật ban đầu đề cập cần có cảnh báo về Cost Index (CI).

**Thảo luận và Đề xuất**

Về hiện trạng, nghiệp vụ VNA dùng 3 CI tương ứng cho ba giai đoạn Climb, Cruise và Descend. Tuy nhiên, platform Lido hiện chỉ trả về một giá trị CI duy nhất là Cruise CI, dẫn đến không đủ dữ liệu để đối chiếu đầy đủ và do đó cảnh báo CI không khả thi. Đề xuất là bỏ cảnh báo Cost Index khỏi phạm vi TOSS trong giai đoạn này.

**Kết luận**

Hai bên nhất trí bỏ cảnh báo Cost Index trong giai đoạn này. Khi Lido hỗ trợ trả đầy đủ 3 CI, cảnh báo này sẽ được xem xét bổ sung lại.

---

## III. Các nội dung đã thống nhất (toàn buổi sáng)

| # | Nội dung thống nhất | Phần |
|---|---|---|
| 1 | Bổ sung chức năng Dispatch Release trên TOSS làm thao tác chủ động của điều phái | 1 |
| 2 | Lido vẫn tự sinh OFP và gửi lên MO Plus; TOSS gắn trạng thái "đã Dispatch Release" cho từng phiên bản | 1 |
| 3 | MO Plus chặn Captain's Release của phi công nếu điều phái chưa Dispatch Release | 1 |
| 4 | Dưới 60 phút trước STD đối với chuyến nội địa, không tự làm lại OFP; chỉ làm lại khi tổ bay yêu cầu qua điện thoại | 1 |
| 5 | TOSS xây màn hình tập trung kiểm tra đầu ca với 9 nhóm nội dung | 1 |
| 6 | TOSS đóng vai trò "view và cảnh báo"; thao tác nghiệp vụ vẫn ở hệ thống chuyên dụng | 1 |
| 7 | Ngưỡng cảnh báo thay đổi giờ bay cộng/trừ 15 phút (OSP), áp dụng cả sớm và muộn | 1 |
| 8 | Cảnh báo thay đổi loại tàu, thay đổi tàu bay, phát sinh ferry và chuyển sang VIP; trường hợp VIP chuyển về thường chỉ ghi nhận; cảnh báo NOTAM mới (transcript chép nhầm "Lotang") thuộc mục NOTAM | 1 |
| 9 | Divert tách thành nhóm cảnh báo riêng; Divert phát sinh chuyến mới thì cảnh báo "chưa có tài liệu" | 1 |
| 10 | NOTAM phân thành 3 nhóm: sân bay, vùng trời và đường bay; cần workshop SME để chi tiết hóa | 1 |
| 11 | NOTAM cứu hỏa (RFFS) khi phát ra thì cảnh báo trực tiếp; không lưu danh sách tiêu chuẩn RFFS hiện hành | 1 |
| 12 | Cảnh báo thời tiết sân bay tập trung 3 thông số: tầm nhìn, trần mây và TSRA, so với VMA cộng biên an toàn | 1 |
| 13 | TOSS tích hợp và parse METAR cùng SPECI; ưu tiên nguồn chính thức là nội địa và gói Lido cho quốc tế | 1 |
| 14 | So sánh OFP với số liệu thực tế CLC/Lido trên ZFW, payload, take-off weight; ngưỡng theo ma trận loại tàu × giờ bay × trên/dưới | 2 |
| 15 | TOSS luôn dùng số liệu CLC nhập cuối cùng để đối chiếu với OFP cuối cùng | 2 |
| 16 | TOSS cho điều phái khai báo bảng dầu (AHM) thủ công trong giai đoạn đầu; chuyển sang IFV khi sẵn sàng | 2 |
| 17 | TOSS cảnh báo khi bảng dầu thay đổi, thay cho cuộc gọi điện hiện hành | 2 |
| 18 | TOSS tích hợp AMOS nhận NAIL/CDL; cảnh báo chuyến trong khoảng hiệu lực NAIL và chưa cất cánh | 2 |
| 19 | Hỗ trợ điều phái chuyển kế hoạch khai thác giữa các tàu khi NAIL ảnh hưởng quay tàu | 2 |
| 20 | TOSS quản lý phép bay theo quốc gia × loại tàu × đường bay × thời gian hiệu lực; trước mắt nhập trực tiếp | 2 |
| 21 | Rà soát phối hợp SkyCheck qua anh Hùng để tận dụng phân tích nếu có, không phụ thuộc | 2 |
| 22 | TOSS quản lý chứng chỉ tổ bay theo sân bay đặc biệt; cảnh báo khi tổ bay không đủ điều kiện | 2 |
| 23 | TOSS cảnh báo đổi tổ bay kèm tên tổ bay mới; cảnh báo phân tổ ban đầu có thể thuộc trực ban trưởng | 2 |
| 24 | TOSS không cảnh báo APU time do OFP, Lido và phone không cung cấp; chỉ cảnh báo PAX time và lịch PAX | 2 |
| 25 | TOSS quản lý Standard Taxi Time theo sân bay và thời gian hiệu lực; tự thống kê từ QAR/QAI qua API hoặc Database View, trình điều phái duyệt | 2 |
| 26 | Bỏ cảnh báo Cost Index trong giai đoạn này do Lido chỉ trả 1 CI; xem xét lại khi Lido hỗ trợ đủ 3 CI | 2 |

## IV. Vấn đề cần làm rõ (toàn buổi sáng)

**Từ Phần 1:**

1. Xác nhận các mốc upload OFP quốc tế (90, 130, 180 và 200 phút) và phân loại chuyến tương ứng.
2. Xác nhận tên và viết tắt của các thuật ngữ: VMA, VNCM/VNCS, "Vy Vy", UA PASMOS, Sunweather và "Phi Công 11". `[cần xác nhận]`
3. Làm rõ giao diện và cơ chế đồng bộ trạng thái Dispatch Release giữa TOSS và MO Plus, bao gồm timing, payload và cơ chế fail-safe.
4. Xác định cơ chế ghi nhận lịch sử làm lại OFP sát giờ.
5. Lựa chọn phương án parse METAR và SPECI: tự xây hay dùng thư viện/dịch vụ.
6. Tổ chức workshop với SME để xây quy tắc đánh giá mức độ ảnh hưởng NOTAM tới chuyến cụ thể.
7. Khảo sát nguồn thời tiết quốc tế ngoài gói Lido và chi tiết en-route/SIGMET (đoạn ghi âm bị nhiễu).

**Từ Phần 2:**

8. Xác nhận tên đầy đủ và phạm vi nghiệp vụ của CLC. `[cần xác nhận]`
9. Chuẩn hóa thuật ngữ và cách tính cho take-off weight (ASR ghi "loft power") và trọng lượng ướt (ASR ghi "phi vết").
10. Cung cấp bảng ngưỡng cảnh báo lệch tải chi tiết theo loại tàu × dải giờ bay × ngưỡng trên/dưới.
11. Xác nhận tên phần mềm IFV ("anh Kiếm"), danh mục "quả đấy dầu" và "anh Ngọt" là nguồn bảng dầu Lido. `[cần xác nhận]`
12. Xác nhận viết tắt NAIL, phân biệt với CDL và mô hình master NAIL chia thành sub-NAIL.
13. Xác nhận AMOS và cơ chế tích hợp (API, event hay poll); làm rõ ranh giới giữa Lido và TOSS trong xử lý NAIL.
14. Xác nhận MOI là đơn vị quản lý Standard Taxi Time và làm rõ Lido có API/master để push Standard Taxi Time hay không.
15. Xác nhận viết tắt TIC trong ngữ cảnh Lido và hệ thống "long" dùng phân tích QAR/QAI. `[cần xác nhận]`
16. Cung cấp danh mục sân bay đặc biệt (Điện Biên, Đồng Hới…) và điều kiện chứng chỉ cơ trưởng tương ứng.
17. Xác định ngưỡng cảnh báo PAX time (phút trước STD) và điều kiện để Lido trả đủ 3 CI.
18. Xác định đầu mối và tiến độ phân tích nghiệp vụ phép bay của đội SkyCheck.

> Các điểm trên được ghi nhận tập trung tại sổ theo dõi `SO-THEO-DOI-DIEM-CHOT-v0.1.md` (OID-TOSS-001), thuộc nhóm SME/KS.

## V. Thuật ngữ domain-knowledge (đề xuất bổ sung và trạng thái cập nhật glossary)

> Phần 1 (mục 1 đến 10) đã được thêm vào `toss-glossary-v0.1.md` phiên bản v0.5. Phần 2 (mục 11 đến 25) gồm các từ rõ ràng và AMOS đã được thêm ở phiên bản v0.6 (BA Lead xác nhận 12/06). Các từ còn cờ `[cần xác nhận]` chưa được thêm và đang theo dõi qua OID-TOSS-001.

| # | Thuật ngữ | Trạng thái glossary | Nguồn |
|---|---|---|---|
| 1 | Dispatch Release | Đã thêm v0.5 | P1 §1 |
| 2 | Captain's Release | Đã thêm v0.5 | P1 §2 |
| 3 | Thời điểm phát hành OFP (60, 90, 130, 180, 200 phút) | Đã thêm v0.5 (các mốc 130, 180, 200 còn cờ) | P1 §1 |
| 4 | Chuyến Ferry | Đã thêm v0.5 | P1 §5 |
| 5 | "Chuyến Lotang" → đính chính thành NOTAM | Đã thêm v0.10 — đính chính ASR: "Lotang", "lô tam" và "nô tam" đều là NOTAM, không có "chuyến Lotang" | P1 §5 |
| 6 | RFFS (cảnh báo qua NOTAM) | Đã thêm v0.5 | P1 §6 |
| 7 | SPECI | Đã thêm v0.5 | P1 §7 |
| 8 | TSRA | Đã thêm v0.5 | P1 §7 |
| 9 | VMA | Đã thêm v0.5 (còn cờ viết tắt) | P1 §7 |
| 10 | Phân loại NOTAM 3 nhóm | Đã thêm v0.5 | P1 §6 |
| 11 | ZFW (Zero Fuel Weight) | Đã thêm v0.6 | P2 §8 |
| 12 | CLC | Chờ xác nhận — đã có sẵn "Control Load Center" (FDOP) nhưng P2 gọi là "Centralized Load Control"; theo dõi OID SME-12 | P2 §8 |
| 13 | AHM (bảng dầu) | Đã thêm v0.6 | P2 §9 |
| 14 | NAIL | Chờ xác nhận — OID SME-13/KS-12 | P2 §10 |
| 15 | CDL | Đã có sẵn trong glossary | P2 §10 |
| 16 | AMOS | Đã thêm v0.6 (cơ chế tích hợp còn cờ OID SME-14) | P2 §10 |
| 17 | Flight Permission / Phép bay | Đã có sẵn trong glossary | P2 §11 |
| 18 | SkyCheck | Chờ xác nhận — OID KS-15 | P2 §11 |
| 19 | APU Time | Đã thêm v0.6 | P2 §13 |
| 20 | Standard Taxi Time | Đã thêm v0.6 | P2 §14 |
| 21 | QAR/QAI | Chờ xác nhận — OID KS-19 | P2 §14 |
| 22 | Cost Index (CI) — 3 CI | Đã thêm v0.6 (3 CI còn cờ OID KS-17) | P2 §15 |
| 23 | Captain Certification per Aerodrome | Đã thêm v0.6 (danh mục sân bay còn cờ OID SME-18) | P2 §12 |
| 24 | TIC (Lido) | Chờ xác nhận — OID SME-17 | P2 §12 |
| 25 | PAX time / Lịch PAX | Chờ xác nhận — OID KS-18 | P2 §13 |

---

*Báo cáo gộp buổi sáng 11/06/2026 (Phần 1 và Phần 2). Bản v0.3 (2026-06-16) được lập lại trực tiếp từ transcript Part1 và Part2 thay vì chỉnh sửa bản trước. Một số đoạn ghi âm (cuối Phần 1 về thời tiết và xuyên suốt Phần 2 với nhiều thuật ngữ kỹ thuật) có chất lượng kém. Các nội dung gắn cờ `[cần xác nhận]` cần được phỏng vấn bổ sung hoặc đối chiếu với SME trước khi đưa vào tài liệu yêu cầu chính thức. Điểm cần chốt được theo dõi tại OID-TOSS-001.*
