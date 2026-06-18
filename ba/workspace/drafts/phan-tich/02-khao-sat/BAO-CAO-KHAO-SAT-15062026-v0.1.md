---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-16"
survey_date: "2026-06-15"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Màn hình Flight Dispatch & Quy trình OFP Release 15/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi 15/06/2026

> **Chủ đề:** Màn hình giám sát điều phái (Flight Dispatch / Monitoring), quy trình phát hành OFP và cảnh báo màu theo ngưỡng thời gian, tích hợp A-CDM.
> **Nguồn:** transcript ghi âm `meeting-notes/15062026/TOSS-15-06-{1,2,3}_fixed.txt` (3 phần). Đối chiếu thiết kế: tab "Màn hình Flight Dispatch" (`VNA-TOSS-Function-list-v1.0.extracted.md`, dòng 209–238) và mockup `dsp_monitoring_poc_v0.1.html`.

---

## I. Thông tin chung

| Mục | Nội dung |
|---|---|
| **Thời gian** | 15/06/2026 |
| **Mục đích** | Khảo sát thiết kế Màn hình Flight Dispatch (lưới giám sát chuyến bay), thống nhất quy trình phát hành OFP bao gồm Dispatch Release và Pilot Release, bộ cảnh báo màu theo ngưỡng thời gian, đồng thời làm rõ phạm vi tích hợp A-CDM cho các mốc thời gian và turnaround tàu bay. |
| **Phía khách hàng** | Bộ phận Điều phái (Dispatch/PIC), kỹ thuật Lido, đầu mối A-CDM và nhóm phân quyền vận hành. Tên cụ thể của từng người tham dự cần xác nhận lại (xem §IV). |
| **Phía khảo sát** | Đội phân tích TOSS (BA và Technical/Integration). |
| **Tài liệu trực quan** | Prototype lưới giám sát 22 cột `dsp_monitoring_poc_v0.1.html` và tab "Màn hình Flight Dispatch" trong Function list. |

---

## II. Nội dung trao đổi

### II.1 — Tích hợp A-CDM và mốc thời gian/quay đầu tàu bay

**Yêu cầu**

Màn hình giám sát cần tích hợp các mốc thời gian khai thác tại sân bay và thông tin quay đầu tàu bay (turnaround) để ước tính giờ khởi hành của chuyến kế tiếp. Phạm vi theo dõi bao gồm cả chuyến đến (inbound) và chuyến đi (outbound), trong đó vị trí đỗ (parking stand) cùng các mốc tàu bay đang ở mặt đất là dữ liệu thiết yếu.

**Thảo luận và Đề xuất**

Về nguồn dữ liệu mốc thời gian, A-CDM cung cấp khoảng 16 mốc theo chuỗi từ khi tàu bay hạ cánh (Landing), vào bãi đỗ (In-block), qua các bước Startup Approved và Push back cho đến cất cánh (Take-off). Các mốc này được cập nhật liên tục khi có thay đổi về ước tính tiếp cận hoặc hạ cánh.

Về vị trí đỗ, parking stand được lấy từ API của VIAGS với A-CDM là nguồn ưu tiên. Khi dữ liệu A-CDM chưa có, hệ thống sẽ dùng nguồn dự phòng thay thế. Tên nguồn dự phòng này chưa xác nhận được rõ ràng qua ghi âm và cần làm rõ thêm (xem §IV).

Thời gian quay đầu tàu bay (ITT) được tính từ thời điểm tàu vào bãi đỗ của chuyến trước đến khi tàu rời bãi đỗ của chuyến sau, trong đó có quy định về thời gian quay đầu tối thiểu. Tại sân bay Hà Nội (HAN), ITT điển hình vào khoảng 45 phút.

Về độ phủ dữ liệu, hiện tại chỉ có HAN và TSN có đầy đủ mốc A-CDM. Đối với các sân bay nước ngoài, hệ thống sẽ dùng Amadeus hoặc Flight Status làm nguồn thay thế. Một điểm quan trọng cần lưu ý là hiệu ứng dây chuyền: khi chuyến trước bị trễ, tất cả các mốc thời gian của chuyến sau sẽ bị dịch lùi theo cộng dồn.

**Kết luận**

A-CDM sẽ được tích hợp theo từng giai đoạn, ưu tiên phủ HAN và TSN trước. Các sân bay ngoài phạm vi A-CDM sẽ dùng nguồn thay thế là Amadeus hoặc Flight Status. Phạm vi sân bay tích hợp trong đợt đầu tiên cần được xác nhận thêm (xem §IV).

---

### II.2 — Phát hành OFP và cảnh báo màu theo ngưỡng thời gian

**Yêu cầu**

Lưới giám sát cần hiển thị trạng thái OFP của từng chuyến bay kèm cảnh báo màu theo ngưỡng thời gian, đồng thời phân biệt rõ ràng Dispatch Release và Pilot Release.

**Thảo luận và Đề xuất**

OFP của một chuyến bay có thể ở một trong bốn trạng thái. Trạng thái đầu tiên là chưa có OFP, hiển thị bằng dấu gạch ngang. Trạng thái thứ hai là đã có OFP nhưng Dispatch chưa thực hiện release. Trạng thái thứ ba là Dispatch đã release nhưng Pilot chưa xác nhận. Trạng thái thứ tư là cả Dispatch và Pilot đều đã release, đây là trạng thái chốt của bản OFP.

Hệ thống cảnh báo màu hoạt động dựa trên ngưỡng thời gian tính trước giờ khởi hành dự kiến (ETD). Đối với chuyến nội địa, mốc bắt đầu lưu ý là 210 phút, thời điểm sớm nhất được phép release là 75 phút và muộn nhất là 60 phút trước ETD. Đối với chuyến quốc tế, ba ngưỡng tương ứng là 270 phút, 90 phút và 75 phút trước ETD. Màu trắng được dùng khi chuyến bay chưa đến ngưỡng lưu ý. Màu vàng báo hiệu chuyến đang tiến gần đến hạn release. Màu đỏ xuất hiện khi chuyến đã quá hạn release hoặc chưa được release trong khi thời gian cất cánh đã rất gần.

Sau khi đã release (hiển thị màu xanh), OFP không thể sửa trực tiếp. Để chỉnh sửa, Dispatcher phải thực hiện thao tác Un-Release: hệ thống tạo ra một phiên bản mới có số thứ tự cao hơn (ví dụ từ v2 lên v3), đưa chuyến về trạng thái chưa release, và đồng thời khóa cả Dispatch Release lẫn Pilot Release tạm thời. Sau khi Dispatcher sửa đổi và upload lại, việc release được thực hiện từ phiên bản mới. Màu cảnh báo được tính lại theo mốc thời gian của phiên bản đang xử lý.

Ngoài Dispatch Release và Pilot Release, phía khách hàng đề xuất bổ sung một cột riêng theo dõi PIC Confirm — tức là phi công xác nhận đã nhận và đọc OFP. Thời điểm xác nhận không bị ràng buộc cứng, có thể thực hiện từ vài giờ trước chuyến cho đến trong khoảng đang bay.

**Kết luận**

Các bên đã thống nhất bộ ngưỡng thời gian, mã màu và quy tắc release. Dispatcher được phép release trong cửa sổ từ sớm nhất 75 phút (nội địa) hoặc 90 phút (quốc tế) đến muộn nhất 60 phút (nội địa) hoặc 75 phút (quốc tế) trước ETD. Un-Release là thao tác duy nhất để chỉnh sửa OFP đã release và luôn sinh ra một phiên bản mới.

---

### II.3 — Phân quyền, tự động hóa và vận hành

**Yêu cầu**

Buổi khảo sát phần ba tập trung vào phân quyền phát hành OFP, cơ chế bàn giao ca trực, tự động hóa upload OFP, hệ thống thông báo qua email và quản lý nhiều phiên bản OFP trong ngày.

**Thảo luận và Đề xuất**

Về phân quyền, quyền thực hiện Release OFP được cấp theo từng người dùng do admin kích hoạt. Hệ thống ghi lại thông tin người đã thực hiện release để phục vụ kiểm tra về sau.

Về tự động hóa, hiện có một bot (được đề cập với tên AOS) dùng chung một tài khoản người dùng để upload OFP. Khi hai ca trực dùng chung một tên tài khoản, hệ thống không phân biệt được ca nào đã thực hiện thao tác. Đề xuất là đặt tên tài khoản bot theo vai trò (ví dụ "Dispatch_Auto") hoặc tạo nhiều bot riêng biệt cho từng ca. Tên và nghĩa đầy đủ của AOS cần được xác nhận thêm (xem §IV).

Về bàn giao ca, mỗi ca trực cần đăng nhập bằng tài khoản riêng để hệ thống ghi nhận đúng người thực hiện. Tuy nhiên, khi ca trước upload OFP phiên bản gốc và ca sau lấy bản đó làm cơ sở, chỉnh sửa rồi upload thành phiên bản mới thì hệ thống chỉ ghi tên ca sau, chưa phản ánh đúng người làm bản gốc. Cơ chế ghi nhận attribution cho từng phiên bản cần được làm rõ thêm (xem §IV).

Khi thực hiện Un-Release, hệ thống đồng thời khóa tạm cả Dispatch Release và Pilot Release để đảm bảo tính nhất quán. Quy tắc là chỉ được release từ phiên bản hiện tại, không cho phép release từ phiên bản cũ đã có.

Về thông báo qua email, hệ thống sẽ gửi cảnh báo khi OFP có thay đổi hoặc khi một chuyến chưa được release trước ngưỡng quy định, với nội dung làm nổi bật các thay đổi quan trọng. Tính năng này hiện đang ở giai đoạn thử nghiệm và dự kiến đưa vào vận hành thực tế từ tháng 7.

Về quản lý phiên bản, màn hình cần hiển thị lịch sử toàn bộ phiên bản OFP kèm chức năng xóa từng bản. Đặc biệt, hệ thống cần hỗ trợ chọn nhiều bản để xóa hàng loạt nhằm xử lý hiệu quả những ngày có trên 200 chuyến.

**Kết luận**

Các bên đã thống nhất hướng triển khai: admin cấp quyền release theo từng người dùng kèm audit đầy đủ, tài khoản AOS được đặt tên theo vai trò, mỗi ca trực đăng nhập tài khoản riêng khi bàn giao, khóa release trong thời gian Un-Release, triển khai email cảnh báo từ tháng 7 và bổ sung chức năng xem lịch sử phiên bản cùng xóa hàng loạt.

---

## III. Các nội dung đã thống nhất

| # | Nội dung | Chủ đề |
|---|---|---|
| 1 | A-CDM cung cấp khoảng 16 mốc thời gian, cập nhật theo thời gian thực; tích hợp theo giai đoạn, ưu tiên HAN và TSN | II.1 |
| 2 | Parking stand lấy từ API VIAGS với A-CDM là nguồn ưu tiên, có nguồn dự phòng khi thiếu dữ liệu | II.1 |
| 3 | Sân bay ngoài HAN và TSN dùng Amadeus hoặc Flight Status cho các mốc thời gian | II.1 |
| 4 | OFP có bốn trạng thái phân biệt; Dispatch Release và Pilot Release được theo dõi riêng trên lưới giám sát | II.2 |
| 5 | Ngưỡng cảnh báo màu: nội địa 210/75/60 phút, quốc tế 270/90/75 phút trước ETD | II.2 |
| 6 | Mã màu Trắng/Vàng/Đỏ theo ngưỡng thời gian; màu đỏ khi quá hạn hoặc chưa release trước giờ cất cánh | II.2 |
| 7 | Un-Release là thao tác duy nhất để chỉnh sửa OFP đã release, luôn tạo phiên bản mới và khóa release tạm thời | II.2 |
| 8 | Bổ sung cột PIC Confirm riêng biệt; không ràng buộc thời điểm phi công phải xác nhận | II.2 |
| 9 | Quyền release do admin cấp theo từng người dùng với audit đầy đủ, mặc định cho phép | II.3 |
| 10 | Tài khoản AOS đặt tên theo vai trò để phân biệt ca; mỗi ca bàn giao đăng nhập tài khoản riêng | II.3 |
| 11 | Email cảnh báo khi OFP thay đổi hoặc chưa release trước ngưỡng, làm nổi bật thay đổi quan trọng; triển khai production tháng 7 | II.3 |
| 12 | Lịch sử phiên bản hiển thị đầy đủ kèm chức năng xóa từng bản và xóa hàng loạt cho các ngày có trên 200 chuyến | II.3 |

---

## IV. Vấn đề cần làm rõ

1. **Phạm vi sân bay tích hợp A-CDM đợt đầu:** Ngoài HAN và TSN, đợt triển khai đầu tiên sẽ bao gồm thêm những sân bay nào?

2. **Nguồn dự phòng cho parking stand:** Khi dữ liệu A-CDM không có, hệ thống sẽ dùng nguồn nào thay thế? Trong ghi âm nghe như "VR" nhưng chưa xác nhận được tên chính xác. `[cần xác nhận]`

3. **Nghĩa các viết tắt:** OAP, OSP và OMP (xuất hiện ở phần 2 và phần 3) cùng AOS (phần 3) chưa xác nhận được nghĩa đầy đủ qua ghi âm. `[cần xác nhận]`

4. **Cơ chế attribution khi bàn giao ca:** Khi ca sau upload một phiên bản OFP mới dựa trên bản của ca trước, hệ thống cần ghi nhận thông tin tác giả như thế nào để phản ánh đúng người thực hiện từng phiên bản?

5. **Ngưỡng cảnh báo PIC Confirm:** Hệ thống có cần gửi nhắc nhở hoặc cảnh báo khi phi công chưa xác nhận nhận OFP trong khoảng thời gian sát giờ bay không?

6. **Các điểm chưa thể hiện trong mockup v0.1:** Một số chức năng đã được mô tả trong Function list nhưng chưa có trong prototype, bao gồm suffix D/Z cho chuyến ARR Divert, lưu cấu hình cột và tìm kiếm, tích hợp cảnh báo MEL/CDL từ AMOS, cảnh báo taxi time so với FON, time-window ZFW và phân quyền theo carrier. Các mục này cần được đưa vào vòng cập nhật mockup và đặc tả trong bước tiếp theo.

7. **Các đoạn ghi âm chất lượng thấp:** Một số đoạn trong phần 1 (chi tiết mốc A-CDM) và phần 3 (cấu hình hệ thống) bị nhiễu, cần đối chiếu lại trực tiếp với người tham dự khi chốt số liệu.

---

## V. Thuật ngữ đề xuất bổ sung

Dưới đây là ba thuật ngữ phát sinh từ ngữ cảnh cụ thể của buổi 15/06 đề xuất bổ sung vào từ điển thuật ngữ dự án:

| Thuật ngữ | Mô tả | Ghi chú |
|---|---|---|
| **PIC Confirm** | Trạng thái phi công xác nhận đã nhận và đọc OFP sau khi Dispatch thực hiện release. Không có ràng buộc cứng về thời điểm xác nhận. | Cần bổ sung cột riêng trên lưới giám sát (xem §VI) |
| **AOS** | Tài khoản bot dùng để tự động upload OFP vào hệ thống, cần đặt tên theo vai trò ca trực để phân biệt. | Nghĩa đầy đủ chờ xác nhận (§IV mục 3) |
| **Ngưỡng release OFP** | Bộ tham số thời gian trước ETD xác định cửa sổ được phép release OFP: nội địa 210/75/60 phút, quốc tế 270/90/75 phút. | Xác nhận qua buổi 15/06 và đối chiếu với Function list |

---

## VI. Đối soát: Trao đổi 15/06 ↔ Function list ↔ Mockup

| Chủ đề / Cột | Trao đổi 15/06 | Function list "Màn hình Flight Dispatch" | Mockup dsp_monitoring_poc_v0.1 | Trạng thái |
|---|---|---|---|---|
| **Trạng thái chuyến (GRD/BRD/OUT/ENR/IN/ARR)** | Không bàn sâu | Có đủ 6 trạng thái và nhấp nháy khi chuyển | Có đủ 6 badge và nhấp nháy cho BRD và OUT | Khớp |
| **OFP DSP Release** | Bốn trạng thái OFP, màu theo ngưỡng | Cột "OFP DSP": Xanh khi release khớp Netline, Vàng khi revision cũ, Đỏ khi chưa release | Cột "OFP Rev" với icon check, cảnh báo và cross | Khớp (mockup gọn hơn) |
| **Pilot Release** | Phân biệt rõ Dispatch và Pilot Release | Cột "Pilot Release": Vàng khi chưa release trước 30 phút EDT, Xanh khi đã release | Có cột Pilot Release (icon) | Khớp |
| **PIC Confirm** | Đề xuất thêm cột theo dõi phi công xác nhận | Chưa có cột confirm riêng | Chưa có | Mới — cần bổ sung cột |
| **Ngưỡng cảnh báo màu** | Xác nhận 210/75/60 phút nội địa và 270/90/75 phút quốc tế | Có quy tắc màu nhưng không ghi ngưỡng phút cụ thể | Chỉ có legend màu, không có ngưỡng | Mới — meeting bổ sung ngưỡng cụ thể |
| **A-CDM 16 mốc và turnaround** | Khoảng 16 mốc, ITT khoảng 45 phút, parking từ VIAGS | Function list không liệt kê 16 mốc riêng lẻ (có ở FOS sheet) | Mockup không thể hiện turnaround và A-CDM | Mới — meeting bổ sung |
| **Un-Release và phiên bản OFP** | Un-release tạo phiên bản mới và khóa release | Function list không mô tả logic phiên bản | Mockup không có flow Un-Release | Mới — meeting bổ sung logic |
| **ARR Divert / suffix D và Z** | Không bàn | Suffix D và Z hiển thị vàng khi mất thì đỏ; ARR vàng khi đổi sân | Không thể hiện suffix và divert | Lệch — mockup chưa có |
| **Lưu cấu hình cột và tìm kiếm** | Không bàn | Có yêu cầu lưu cấu hình bảng biểu và tìm kiếm | Không có kéo thả và lưu layout | Lệch — mockup chưa có |
| **MEL/CDL tích hợp AMOS** | Không bàn sâu | Cảnh báo MEL/CDL từ AMOS Master | Chỉ có icon mô phỏng, chưa tích hợp thật | Lệch — mockup chưa tích hợp |
| **Taxi time so với FON và time-window ZFW** | Ngưỡng 60/90 phút được nhắc đến | Cảnh báo taxi so với FON; ZFW lệch trên 60 phút nội địa và 90 phút quốc tế | Không thể hiện time-window | Lệch — mockup chưa có |
| **Phân quyền theo carrier** | Phân quyền release do admin cấp | Có yêu cầu phân quyền theo carrier | Không thể hiện | Lệch — mockup chưa có |

Nhận định chung: Mockup phiên bản 0.1 đã phủ được bố cục 22 cột, các trạng thái chuyến bay và quy tắc màu tổng quát, đạt khoảng 85% so với Function list. Buổi khảo sát ngày 15/06 bổ sung thêm bốn yếu tố quan trọng chưa có trong cả Function list lẫn mockup, gồm cột PIC Confirm, ngưỡng phút cụ thể cho cảnh báo màu, chi tiết 16 mốc A-CDM và turnaround, cùng logic Un-Release và quản lý phiên bản. Các điểm còn lệch giữa mockup và Function list bao gồm suffix D/Z, lưu cấu hình, tích hợp AMOS, taxi-FON, time-window ZFW và phân quyền carrier; tất cả sẽ được đưa vào vòng cập nhật mockup và đặc tả trong các bước tiếp theo.

---

*Báo cáo v0.2 — Draft. Bước tiếp: (a) cập nhật OID theo các ngưỡng cảnh báo, PIC Confirm, phạm vi A-CDM và attribution ca trực vừa thống nhất; (b) bổ sung cột PIC Confirm và ngưỡng phút vào đặc tả Màn hình Flight Dispatch (PH1) và mockup v0.2; (c) xác nhận lại các mục cần làm rõ ở §IV.*
