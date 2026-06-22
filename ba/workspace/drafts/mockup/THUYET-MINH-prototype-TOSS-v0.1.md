---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-18"
status: "Draft"
document_type: "Hướng dẫn Thuyết minh Prototype"
prototype_file: "toss-prototype-v0.4.html"
---

# Hướng dẫn Thuyết minh Prototype TOSS

> ⚠️ **CẢNH BÁO PHIÊN BẢN:** Tài liệu này mô tả bố cục **prototype v0.4** (OCC Dashboard và Flight Dispatch là **hai màn tách riêng**). Prototype hiện hành là **v0.6** đã **gộp OCC + Dispatch thành một màn "Flight Dispatch" 26 cột** (bám sheet "Màn hình Flight Dispatch") + thêm màn Upload Documents. Phần "Màn 1 — OCC Dashboard" và "Màn 2 — Flight Dispatch" dưới đây **đã lỗi thời về bố cục** — cần cập nhật cho v0.6 trước khi dùng demo. Các màn Flight Detail / MEL-CDL và kịch bản nghiệp vụ vẫn còn giá trị.

Tài liệu này hướng dẫn người trình bày (BA) demo prototype TOSS cho khách hàng và stakeholder kỹ thuật. Nội dung gồm: mô tả từng màn hình, các luồng nghiệp vụ thao tác được, và một kịch bản demo xuyên suốt. Mọi vùng giao diện trong prototype đều gắn dẫn chiếu nguồn (`data-src`) về báo cáo khảo sát 08–17/06/2026.

## Lưu ý trước khi trình bày

Prototype là bản mẫu trực quan để duyệt bố cục và luồng, không phải sản phẩm hoàn chỉnh. Khi thuyết minh cần nói rõ ba điểm: số liệu hiển thị là dữ liệu mẫu, bố cục và màu sắc là đề xuất cần khách hàng duyệt, và các phần đánh dấu `[TBD]` là điểm còn chờ xác nhận từ nghiệp vụ. Các tích hợp với hệ thống ngoài (MO Plus, AMOS, Lido, ACARS) được mô phỏng bằng nút bấm có nhãn "giả lập demo", thực tế do hệ thống tương ứng xử lý.

Giao diện hiển thị toàn bộ bằng tiếng Anh theo yêu cầu đã thống nhất với điều phái, chế độ nền tối, đồng hồ và mốc giờ theo UTC.

## Phạm vi 4 màn hình

Prototype dựng bốn màn hình cốt lõi của vòng điều hành khai thác, điều hướng qua thanh bên trái:

1. **OCC Dashboard** — màn giám sát chuyến bay thời gian thực, điểm khởi đầu của ca trực.
2. **Flight Dispatch** — phát hành kế hoạch bay (OFP Release) và thu hồi (Unrelease).
3. **Flight Detail** — chi tiết một chuyến bay với sáu tab thông tin.
4. **MEL/CDL Management** — quản lý danh mục thiết bị tối thiểu và metadata khai thác.

Mục "Settings" trên thanh bên là ranh giới ngoài phạm vi v0.4, khi bấm sẽ hiện màn placeholder ghi rõ "chưa xây dựng trong prototype này".

---

## Màn 1 — OCC Dashboard

**Mục đích:** Cho điều phái cái nhìn tổng quan toàn bộ chuyến bay trong ca và làm nổi các chuyến cần xử lý ngay. `[12062026 §8]`

**Các vùng chính khi thuyết minh:**

Hàng chỉ số (KPI) phía trên gồm năm thẻ: tổng chuyến trong ngày, số chuyến đang bay (ENR), số chuyến chờ phát hành OFP, số cảnh báo đỏ cần xử lý, và chỉ số đúng giờ OTP. Đây là điểm nhìn đầu tiên giúp điều phái nắm nhanh tình hình ca trực. `[12062026 §8]`

Thanh lọc cho phép lọc theo hãng khai thác, theo trạng thái chuyến, và theo khoảng thời gian, kèm ô tìm kiếm và nút làm mới. `[12062026 §5]`

Bảng chuyến bay là trọng tâm màn hình, mỗi hàng là một chuyến với các cột: cảnh báo, số hiệu, số đăng ký tàu (REG), chặng bay, giờ khởi hành và đến theo kế hoạch (STD/STA), trạng thái, tiến độ phát hành Dispatch và Pilot, số lượng MEL đang áp dụng. `[12062026 §2,§8; 11062026-chiều §II.6]`

**Luồng thao tác để demo:**

Bấm vào chấm cảnh báo đỏ ở đầu một hàng chuyến: hệ thống mở thẳng màn Flight Detail và tự kích hoạt đúng tab cảnh báo tương ứng. Đây là minh họa cho yêu cầu "điều phái bấm cảnh báo thì hệ thống đưa tới đúng nội dung cần xử lý". `[12062026 §1]`

Bấm vào số hiệu chuyến (gạch chân) hoặc biểu tượng mở chi tiết ở cuối hàng cũng dẫn sang màn Flight Detail của chuyến đó.

Với chuyến đang chờ phát hành, nút "Release" xuất hiện ngay trong hàng để điều phái xử lý nhanh mà không cần rời màn tổng quan.

Di chuột lên ô số đăng ký tàu (REG) hiển thị lịch sử đổi tàu của chuyến, phục vụ tình huống chuyến bị thay tàu sát giờ. `[12062026 §9]`

---

## Màn 2 — Flight Dispatch (OFP Release)

**Mục đích:** Quản lý việc phát hành kế hoạch bay (OFP) cho phi công, gồm cả thu hồi khi có thay đổi. `[15062026 §II.2,§II.3]`

**Các vùng chính khi thuyết minh:**

Thanh tiến trình năm bước ở phía trên mô tả vòng đời một OFP: Lido sinh OFP, tải lên MO Plus, Dispatch phát hành, Pilot xác nhận, và cất cánh. Bước hiện hành được làm nổi để người xem biết chuyến đang ở giai đoạn nào. `[11062026-sáng §1,§2]`

Bảng phát hành liệt kê các chuyến kèm thời điểm đến hạn phát hành. Cột "Release Deadline" dùng màu để cảnh báo: nền đỏ cho chuyến đã quá hạn, nền vàng cho chuyến sắp đến hạn. Bảng còn so sánh nhiên liệu kế hoạch với nhiên liệu trên OFP để điều phái thấy chênh lệch trước khi phát hành. Ngưỡng thời gian phát hành khác nhau giữa chuyến nội địa và quốc tế được trình bày trong thẻ thông tin riêng. `[15062026 §II.2,§II.3]`

**Luồng thao tác để demo:**

Với chuyến quá hạn (ví dụ VN 302), bấm "Release Now" mở hộp thoại xác nhận hiển thị số hiệu chuyến, phiên bản OFP, chênh lệch nhiên liệu và thông tin người phát hành. Bấm "Confirm Release" cập nhật trạng thái chuyến sang đã phát hành. Đây là luồng phát hành cơ bản. `[11062026-sáng §1; 15062026 §II.3]`

Với chuyến đã phát hành nhưng phi công chưa xác nhận (ví dụ VN 208), nút "Unrelease" cho phép thu hồi. Hộp thoại thu hồi yêu cầu chọn lý do và cảnh báo rằng thao tác này sẽ đặt lại trạng thái phía MO Plus và phi công. Đây là tình huống khi có MEL phát sinh hoặc thay đổi tải sau khi đã phát hành. `[11062026-chiều §II.4]`

Sau khi xác nhận, hệ thống ghi nhận người thực hiện và thời điểm để phục vụ kiểm tra về sau.

---

## Màn 3 — Flight Detail

**Mục đích:** Tập hợp toàn bộ thông tin một chuyến bay vào một màn, tổ chức theo sáu tab. Màn demo lấy chuyến mẫu VN 208 (SGN–HAN, A321). `[12062026 §1,§2]`

**Sáu tab và nội dung:**

Tab **Warnings** (mặc định) liệt kê các cảnh báo đang mở của chuyến, mỗi cảnh báo có thời điểm phát sinh và trạng thái xử lý. Từ một cảnh báo MEL, người dùng bấm "Go to Aircraft/MEL" để nhảy sang đúng tab chi tiết; từ cảnh báo chênh nhiên liệu, bấm "Go to Weather/NOTAM". `[12062026 §2]`

Tab **Flight Release** hiển thị lịch sử các phiên bản OFP, gồm cả bản đã bị thu hồi (hiển thị mờ, đánh dấu đã hủy) kèm lý do thu hồi. `[11062026-chiều §II.4; 15062026 §II.3]`

Tab **Aircraft / MEL** trình bày thông tin tàu bay và các MEL đang áp dụng cho chuyến, kèm mức ảnh hưởng khai thác (phạt nhiên liệu, giảm tải, trần bay, giới hạn thiết bị). `[12062026 §2; 17062026 §2,§3]`

Tab **Weather / NOTAM** hiển thị thông tin thời tiết (METAR) và các NOTAM liên quan, trong đó NOTAM khẩn cấp được làm nổi. `[11062026-sáng §6,§7]`

Tab **Crew** trình bày tổ bay hiện tại và lịch sử thay đổi tổ, ghi rõ ai thay đổi và thời điểm. `[12062026 §2]`

Tab **Load** tổng hợp các chỉ số tải trọng (trọng lượng không nhiên liệu, tải hàng/khách, nhiên liệu chuyến, chênh lệch) kèm trạng thái so với ngưỡng. `[11062026-sáng §8; 11062026-chiều §II.10]`

**Luồng thao tác để demo:** Chuyển qua lại giữa các tab để cho thấy mọi thông tin của chuyến nằm gọn trong một màn, không phải mở nhiều cửa sổ. Minh họa luồng "từ cảnh báo nhảy thẳng tới chi tiết liên quan" bằng các nút "Go to →".

---

## Màn 4 — MEL/CDL Management

**Mục đích:** Quản lý danh mục thiết bị tối thiểu (MEL) gồm nội dung gốc từ nhà sản xuất và lớp metadata khai thác do hãng xây dựng. `[17062026 §1,§2]`

**Ba tab con:**

Tab **Master MEL** chia hai cột. Cột trái là cây tra cứu MEL theo chương ATA, bấm để mở rộng từng nhánh tới từng item. Cột phải hiển thị item được chọn với hai lớp nội dung: "Original Content" là nội dung gốc của nhà sản xuất, và "VNA Operational Metadata" là lớp biên soạn của hãng gồm phân loại áp dụng (x1/x2/x3), hệ số nhiên liệu, mức giảm tải, trần bay, giới hạn thiết bị và ghi chú nghiệp vụ. `[17062026 §2,§4; 08062026 §12]`

Tab **Fleet MEL Active** là dashboard tổng hợp MEL đang áp dụng trên toàn đội tàu, phục vụ trực ban trưởng theo dõi và lập báo cáo hằng ngày. `[17062026 §3]`

Tab **Version Update** cảnh báo khi nhà sản xuất phát hành phiên bản MEL mới, liệt kê các item thay đổi cần rà soát. `[17062026 §2]`

**Luồng thao tác để demo:**

Trên cây Master MEL, bấm mở rộng chương 21 rồi chọn item 21-25-01 để xem chi tiết. Chuyển giữa hai tab "Original Content" và "VNA Operational Metadata" để minh họa cấu trúc hai lớp. Đây là điểm nghiệp vụ cốt lõi: hệ thống tách bạch nội dung gốc bất biến và lớp metadata khai thác do hãng chủ động duy trì. `[17062026 §2]`

Tại tab Version Update, bấm "Review" trên một item thay đổi mở hộp thoại so sánh phiên bản cũ và mới, làm nổi phần thay đổi, để người duyệt cập nhật lại metadata khai thác cho khớp. `[17062026 §2]`

---

## Kịch bản demo xuyên suốt (gợi ý trình bày)

Để demo mạch lạc, có thể đi theo một câu chuyện điều hành liền mạch thay vì giới thiệu rời từng màn:

Mở đầu ca trực ở **OCC Dashboard**, điều phái nhìn hàng chỉ số và thấy có chuyến cảnh báo đỏ. Bấm vào cảnh báo, hệ thống đưa thẳng tới **Flight Detail** của chuyến đó, mở đúng tab Warnings. Tại đây điều phái thấy nguyên nhân là một MEL vừa phát sinh, bấm "Go to Aircraft/MEL" để xem mức ảnh hưởng khai thác.

Vì MEL ảnh hưởng tới kế hoạch, điều phái sang **Flight Dispatch** thu hồi OFP đã phát hành (Unrelease) với lý do MEL phát sinh, rồi phát hành lại bản OFP mới. Cuối cùng, để hiểu nguồn gốc MEL, mở **MEL/CDL Management**, tra item trong Master MEL và xem lớp metadata khai thác hãng đã thiết lập.

Câu chuyện này đi qua cả bốn màn theo đúng trình tự một tình huống thực tế, cho khách hàng thấy các màn liên kết với nhau ra sao.

---

## Phần chờ xác nhận khi trình bày

Một số nội dung trong prototype gắn nhãn `[TBD]` do nguồn khảo sát còn để mở, người trình bày nên chủ động nêu là điểm cần chốt với nghiệp vụ thay vì trình bày như đã quyết. Các điểm chính gồm: định nghĩa và quy tắc chuyển trạng thái vòng đời chuyến, các mốc thời gian upload OFP quốc tế (130/180/200 phút), quy ước đánh số phiên bản OFP sau khi thu hồi, danh sách đầy đủ lý do thu hồi, và cơ chế tích hợp với AMOS. Chi tiết các điểm mở được liệt kê trong báo cáo soát `toss-prototype-v0.3-review.md`.
