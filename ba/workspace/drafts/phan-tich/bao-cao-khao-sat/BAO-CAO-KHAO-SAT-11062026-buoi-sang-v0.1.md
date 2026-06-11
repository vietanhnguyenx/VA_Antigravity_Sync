---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
survey_date: "2026-06-11"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Phỏng vấn Dispatcher buổi sáng 11/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi sáng 11/06/2026 (Phỏng vấn Dispatcher)

> Báo cáo này **gộp toàn bộ buổi sáng 11/06/2026** (Phần 1 + Phần 2) của buổi phỏng vấn điều phái viên (Dispatcher). Chủ đề 1–7 thuộc Phần 1; chủ đề 8–15 thuộc Phần 2 (nối tiếp).

## I. Thông tin chung

- **Thời gian:** buổi sáng ngày 11/06/2026 (gồm hai phần nối tiếp).
- **Mục đích:** đi sâu vào quy trình tác nghiệp của vị trí điều phái (Dispatcher): (Phần 1) quy trình lập & phát hành kế hoạch bay (OFP), cơ chế Dispatch Release, kiểm tra đầu ca, cảnh báo thay đổi lịch bay, cảnh báo NOTAM, cảnh báo thời tiết; (Phần 2) cảnh báo lệch tải OFP vs CLC/Lido, bảng dầu AHM, NAIL/CDL, phép bay, chứng chỉ tổ bay theo sân bay, đổi tổ bay, taxi time, Cost Index.
- **Đối tượng phỏng vấn:** điều phái viên (Dispatcher) của VNA — đại diện khối khai thác chuyến bay.
- **Phía khảo sát:** đội phân tích nghiệp vụ TOSS.
- **Cảnh báo chất lượng ghi âm (ASR):** chất lượng ghi âm kém ở phần cuối Phần 1 (thời tiết quốc tế, METAR/SPECI) và đặc biệt kém ở Phần 2 (nhiều thuật ngữ kỹ thuật bị nhận dạng sai). Các đoạn không suy luận chắc chắn được giữ nguyên và gắn cờ `[cần xác nhận]` để đối chiếu lại với người tham gia.

---

# PHẦN 1 — OFP, Dispatch Release, kiểm tra đầu ca, cảnh báo lịch bay/NOTAM/thời tiết

## II. Nội dung trao đổi

### 1. Quy trình phát hành kế hoạch bay (OFP) và gửi tài liệu lên MO Plus

#### Yêu cầu
- Điều phái cần một quy trình chuẩn hóa cho việc phát hành OFP và gửi tài liệu lên hệ thống MO Plus, kèm dấu hiệu nhận biết "bản cuối cùng" — bản đã được điều phái chốt.
- Hiện trạng được mô tả:
  - Hệ thống Lido tự động tạo OFP và tự động gửi (auto-link) sang MO Plus; chưa có bước review/action của điều phái trước khi tài liệu được phát hành cho phi công.
  - Thời điểm upload hiện hành: chuyến quốc tế upload trước 90 phút so với giờ khởi hành dự kiến (STD); chuyến nội địa upload trước 60 phút. Một số mốc khác được nhắc đến nhưng chưa rõ ngữ cảnh: 130 phút, 180 phút, 200 phút cho các giai đoạn chuyến quốc tế dài [cần xác nhận về phân loại chính xác].
  - Khi tải, dầu hoặc thông tin tàu bay thay đổi, hệ thống Lido có thể tự tạo lại OFP và tự gửi lên MO Plus mà không cần điều phái can thiệp.
- Vấn đề cốt lõi: vì việc gửi OFP lên MO Plus được tự động hóa hoàn toàn, hiện chưa có cơ chế nào để phi công (cũng như chính điều phái) phân biệt được đâu là phiên bản OFP đã được điều phái chốt, đâu là phiên bản hệ thống tự sinh do thay đổi tải/giờ.

#### Thảo luận – Đề xuất
- Phía khảo sát đề xuất: cần thêm một thao tác chủ động của điều phái — gọi tên là "Dispatch Release" — trên TOSS. Sau khi điều phái thực hiện Dispatch Release, OFP đó mới được coi là bản chính thức.
- Điều phái xác nhận: Lido vẫn có thể tiếp tục tự tạo OFP và đẩy lên MO Plus như hiện tại, nhưng phải có dấu hiệu rõ ràng để biết bản nào đã được điều phái Dispatch Release.
- Cách tiếp cận thống nhất: không chặn việc tài liệu lên MO Plus; thay vào đó gắn trạng thái "đã Dispatch Release" cho từng phiên bản OFP, làm tín hiệu để các bên hạ nguồn (MO Plus, phi công) sử dụng.

#### Kết luận
- Thống nhất bổ sung chức năng "Dispatch Release" trên TOSS như một thao tác chủ động của điều phái.
- Lido tiếp tục tự sinh OFP và tự đẩy lên MO Plus; tuy nhiên TOSS phải gắn được trạng thái "đã Dispatch Release" cho từng phiên bản tài liệu để nhận biết bản chốt.
- Các mốc thời điểm upload (130/180/200 phút) cần làm rõ thêm trong các buổi sau để chuẩn hóa quy định nghiệp vụ.

### 2. Cơ chế chặn Captain's Release khi điều phái chưa Dispatch Release

#### Yêu cầu
- Phi công chỉ được phép thực hiện thao tác xác nhận tài liệu (Captain's Release) sau khi điều phái đã hoàn tất Dispatch Release cho chuyến bay tương ứng.
- Nếu điều phái chưa Dispatch Release, hệ thống MO Plus phải hiển thị thông báo và chặn thao tác Captain's Release của phi công.

#### Thảo luận – Đề xuất
- Phía khảo sát đề xuất mô hình kết hợp hai phía: TOSS quản lý hành động Dispatch Release; MO Plus tiêu thụ trạng thái Dispatch Release để quyết định cho phép hoặc chặn Captain's Release. Yêu cầu này dẫn đến nhu cầu điều chỉnh cả TOSS và MO Plus.
- Điều phái nhấn mạnh nguyên tắc phối hợp: "phải đặt tay nhau làm việc" — phi công vẫn có thể mở xem OFP/tài liệu trên MO Plus, nhưng không được Confirm/Release nếu chưa có Dispatch Release từ điều phái.
- Phi công cần được hiển thị thông báo dạng "Dispatch chưa Release" để biết trạng thái và không thực hiện Captain's Release sai thời điểm.

#### Kết luận
- Thống nhất nguyên tắc: phi công chỉ được Captain's Release sau khi điều phái đã Dispatch Release trên TOSS.
- MO Plus cần được điều chỉnh để chặn thao tác Captain's Release khi chưa có Dispatch Release tương ứng và hiển thị thông báo rõ ràng cho phi công.
- Phạm vi tích hợp giữa TOSS và MO Plus cần được làm rõ trong buổi làm việc tiếp theo (giao diện trạng thái, thời điểm đồng bộ, cơ chế thông báo).

### 3. Quy tắc làm lại OFP khi thay đổi sát giờ khởi hành

#### Yêu cầu
- Cần quy tắc rõ ràng về việc điều phái có/không cần phát hành lại OFP khi xảy ra thay đổi tải, dầu hoặc thông tin chuyến bay ở các mốc thời gian sát STD.

#### Thảo luận – Đề xuất
- Điều phái mô tả nguyên tắc hiện đang vận hành:
  - Khi dưới 60 phút trước STD (đối với nội địa), nếu phát sinh thay đổi tải, điều phái không tự động làm lại OFP.
  - Trường hợp tổ bay có yêu cầu làm lại OFP thì phải gọi điện thoại trực tiếp cho điều phái; chỉ khi đó điều phái mới thực hiện làm lại.
  - Lý do: ở thời điểm sát giờ, dầu mỡ đã được nạp và khách đã lên gần xong; nếu phải refill (nạp thêm dầu) thì hành khách phải xuống tàu lại — tốn nhiều thời gian và rủi ro chậm chuyến.
- Phía khảo sát ghi nhận quy tắc này như một ràng buộc nghiệp vụ; chưa đặt vấn đề tự động hóa quyết định trong tình huống này (vẫn để con người quyết định).

#### Kết luận
- Quy tắc nghiệp vụ: dưới 60 phút trước STD (nội địa), không tự làm lại OFP cho thay đổi tải; chỉ làm lại khi tổ bay yêu cầu qua điện thoại.
- TOSS không cần can thiệp/tự động hóa quy tắc này, nhưng cần ghi nhận lịch sử các lần làm lại OFP sát giờ (kèm lý do "tổ bay yêu cầu") để phục vụ truy vết.

### 4. Kiểm tra đầu ca (Start-of-Shift Check) và màn hình tập trung

#### Yêu cầu
- Đầu ca, điều phái phải kiểm tra toàn bộ lịch bay thuộc ca trực, bao gồm: Check Flight Schedule (lịch bay); Check loại tàu bay; Check tàu quay (rotation); Check cứu hỏa sân bay (RFFS category); Check thời tiết; Check tải; Check MEL/CDL; Check hạn chế (restrictions); Check chứng chỉ tổ bay.
- Vấn đề hiện trạng:
  - Mỗi nội dung kiểm tra đang nằm ở một ứng dụng/tab riêng (nhiều phần mềm rời rạc), điều phái phải mở 5–7 ứng dụng để hoàn tất kiểm tra đầu ca.
  - Một số kiểm tra đang được làm thủ công (manual), không có hệ thống tự đối chiếu tự động.
- Mong muốn: có một màn hình tập trung trên TOSS, gom các đầu mối cần lưu ý của ca trực; hệ thống tự đối chiếu các nguồn dữ liệu và tự sinh cảnh báo khi có bất thường.

#### Thảo luận – Đề xuất
- Phía khảo sát đề xuất:
  - TOSS gom toàn bộ dữ liệu (lịch bay, tàu bay, tài liệu chuyến, thời tiết, NOTAM, tải…) vào một nguồn tập trung.
  - Hệ thống tự đối chiếu (compare) hai chiều giữa các nguồn và tự sinh cảnh báo khi phát hiện không khớp hoặc có biến động bất thường.
  - Điều phái chỉ "view" trên TOSS, không thao tác tích từng mục; thao tác (xác nhận tài liệu, làm lại OFP) vẫn ở hệ thống chuyên dụng (Lido, MO Plus).
  - Khi cần giải quyết một cảnh báo, điều phái chuyển sang đúng hệ thống chuyên dụng để xử lý; sau khi xử lý xong, dữ liệu tự đồng bộ và cảnh báo tự tắt.
- Điều phái phản hồi: không phân tách rõ ưu tiên 1/2/3 giữa các mục kiểm tra — "cái nào cũng quan trọng". Khi vào ca, kiểm tra đầu tiên là tàu quay, sau đó là thời tiết, rồi tới các mục còn lại.

#### Kết luận
- Thống nhất TOSS xây dựng một màn hình tập trung phục vụ kiểm tra đầu ca, gom đầy đủ các nội dung kiểm tra đã liệt kê.
- Nguyên tắc thiết kế: TOSS là nơi "view + cảnh báo"; thao tác nghiệp vụ vẫn ở hệ thống chuyên dụng tương ứng (không trùng lặp chức năng).
- Không cần phân cấp mức ưu tiên giữa các mục kiểm tra; tuy nhiên hệ thống cần phân loại được loại cảnh báo (nội dung nào "bắt buộc", nội dung nào "ghi nhận để báo cáo") — chi tiết sẽ chốt ở các buổi tiếp theo.

### 5. Cảnh báo thay đổi lịch bay (Flight Schedule Change)

#### Yêu cầu
- TOSS cần cảnh báo khi lịch bay có biến động vượt ngưỡng OSP hoặc khi loại chuyến thay đổi gây ảnh hưởng đến công tác điều phái.

#### Thảo luận – Đề xuất
- Hai yếu tố chính cần cảnh báo:
  - **Thay đổi giờ bay:** lệch giờ từ 15 phút trở lên so với kế hoạch (ngưỡng OSP) thì cảnh báo. Áp dụng cho cả hai chiều — sớm hơn hoặc muộn hơn.
  - **Thay đổi loại tàu (aircraft type) và thay đổi tàu bay cụ thể (tail number):** cần cảnh báo vì ảnh hưởng đến cấu hình khai thác và tài liệu chuyến.
- Cảnh báo chuyển đổi loại chuyến bay:
  - Phát sinh **chuyến ferry** (chuyến không thương mại, chỉ điều chuyển tàu bay) cần highlight để điều phái xử lý tài liệu riêng.
  - Chuyển từ chuyến thường sang **VIP**: phải highlight, do thay đổi cấp độ phục vụ và yêu cầu tài liệu khác.
  - Chuyển từ VIP về thường (downgrade): chỉ ghi nhận, không cần cảnh báo đặc biệt.
  - Phát sinh **chuyến Lotang** (chuyến đường dài/đặc thù [cần xác nhận định nghĩa chính xác]): cảnh báo "Lotang mới phát sinh"; sau đó cần bước đánh giá tác động riêng.
  - Trả tải (đổi nhân sự trả tải): kế hoạch thường lập sẵn, không thay đổi sát giờ → không cần cảnh báo riêng.
- Cảnh báo chuyến chuyển hướng (Divert):
  - Tách thành một nhóm cảnh báo riêng vì Divert là tình huống đặc thù phát sinh sau khi chuyến đã cất cánh.
  - Khi Divert phát sinh chuyến bay mới, TOSS cảnh báo "chuyến bay chưa có tài liệu" cho chuyến mới này.

#### Kết luận
- Ngưỡng cảnh báo thay đổi giờ bay: ±15 phút (theo OSP) — áp dụng cả sớm và muộn.
- Các trường hợp cần cảnh báo: thay đổi loại tàu, thay đổi tàu bay, phát sinh chuyến ferry, chuyển sang VIP, phát sinh chuyến Lotang.
- Chuyển từ VIP về thường: ghi nhận, không cảnh báo.
- Divert tách thành một nhóm cảnh báo riêng; Divert phát sinh chuyến bay mới thì cảnh báo "chưa có tài liệu".
- Định nghĩa chính xác "Lotang" và tiêu chí đánh giá tác động cần làm rõ ở buổi sau.

### 6. Cảnh báo NOTAM

#### Yêu cầu
- TOSS cần tích hợp NOTAM, phân loại tự động và cảnh báo các NOTAM ảnh hưởng trực tiếp đến chuyến bay của điều phái đang phụ trách.

#### Thảo luận – Đề xuất
- Hiện trạng:
  - Nguồn NOTAM lấy từ trang quản lý của cơ quan quản lý bay ("VNCM" trong transcript [cần xác nhận chính xác VNCS hay đơn vị nào]); điều phái đang tra cứu thủ công.
  - Tài liệu cứu hỏa sân bay (RFFS) thực tế cũng nằm trong NOTAM, không tách riêng.
- Vấn đề: NOTAM có hàng trăm loại, không phải tất cả đều ảnh hưởng đến chuyến bay; không thể đọc/đánh giá toàn bộ thủ công.
- Đề xuất tiếp cận nhiều mức:
  - **Mức 1 — Trích xuất NOTAM** từ nguồn chính thức.
  - **Mức 2 — Phân loại NOTAM:** NOTAM sân bay / NOTAM vùng trời / NOTAM đường bay. Phân loại chi tiết cần workshop riêng với SME điều phái.
  - **Mức 3 — Đánh giá mức độ ảnh hưởng** tới chuyến cụ thể để highlight.
- Trường hợp NOTAM cứu hỏa (RFFS): mỗi sân bay có cấp cứu hỏa cố định gắn loại tàu được phép khai thác; khi cấp thay đổi → NOTAM tương ứng phát ra. TOSS chỉ cần phát hiện NOTAM cứu hỏa là đủ để cảnh báo (không cần lưu bảng tiêu chuẩn RFFS hiện hành). Để đánh giá ảnh hưởng cụ thể, sau này cần thông tin tiêu chuẩn từng sân bay.
- Điều phái sẽ cung cấp tài liệu định nghĩa NOTAM + ảnh trang quản lý để đội phân tích chuẩn bị buổi làm việc riêng.

#### Kết luận
- TOSS tích hợp NOTAM từ nguồn chính thức và phân loại 3 nhóm: NOTAM sân bay, vùng trời, đường bay.
- Khi có NOTAM cứu hỏa (RFFS) phát ra, TOSS cảnh báo trực tiếp; không cần duy trì danh sách tiêu chuẩn RFFS hiện hành.
- Cần workshop riêng với SME để chi tiết hóa phân loại NOTAM + tiêu chí đánh giá ảnh hưởng tới chuyến cụ thể.
- Điều phái cung cấp tài liệu NOTAM và quyền truy cập trang quản lý để đội phân tích nghiên cứu trước.

### 7. Cảnh báo thời tiết

#### Yêu cầu
- TOSS cần tích hợp và cảnh báo thời tiết tại các sân bay khai thác, phục vụ điều phái ra quyết định trước và trong khai thác.

#### Thảo luận – Đề xuất
- Nguyên tắc cảnh báo: chỉ cảnh báo khi thông số tiến gần hoặc xuống dưới ngưỡng tối thiểu (VMA [cần xác nhận viết tắt]) cộng một biên an toàn (margin).
- Các thông số cần cảnh báo cho **sân bay (cất/hạ cánh)**: **Tầm nhìn** (Visibility); **Trần mây** (Cloud Ceiling); **Mưa dông — TSRA** (Thunderstorm + Rain).
- **Thời tiết đường bay** (en-route): liên quan SIGMET và bản tin chuyên dụng [đoạn transcript nhiễu nặng, cần xác nhận lại].
- Nguồn dữ liệu thời tiết:
  - **Sân bay nội địa:** METAR và SPECI từ cơ quan khí tượng hàng không VN ("Vy Vy" [cần xác nhận]) — nguồn chính thức.
  - **Sân bay quốc tế:** dùng nguồn trong gói Lido; Lido chỉ "release" theo gói tài liệu chuyến bay, không phải quan trắc liên tục.
  - **UA PASMOS** [cần xác nhận] — giao diện hiển thị dữ liệu thời tiết, có thể export; cần phương án kỹ thuật để tích hợp.
  - **Sunweather** [cần xác nhận] — bị đánh giá "rủi ro/không ổn định", cần cân nhắc.
  - **"Phi Công 11"** [cần xác nhận] — không official, chỉ tham khảo.
- METAR/SPECI: METAR là quan trắc định kỳ; SPECI là bản tin đặc biệt khi biến động đáng kể, cùng cấu trúc METAR. Cả hai là văn bản mã hóa, cần parse ra các trường để đối chiếu ngưỡng.

#### Kết luận
- Cảnh báo thời tiết sân bay tập trung 3 thông số: tầm nhìn, trần mây, TSRA — so với VMA + biên an toàn.
- Nguồn nội địa: cơ quan khí tượng hàng không VN (METAR/SPECI) — cần xác nhận tên cụ thể.
- Nguồn quốc tế: ưu tiên gói Lido làm official; Sunweather/Phi Công 11 chỉ tham khảo.
- TOSS phải tích hợp METAR + SPECI và parse được nội dung để cảnh báo tự động.
- Chi tiết thời tiết en-route (SIGMET, nguồn quốc tế, parse) cần làm rõ buổi riêng — đoạn ghi âm nhiễu, cần đối chiếu lại.

---

# PHẦN 2 — Lệch tải, bảng dầu, NAIL/CDL, phép bay, tổ bay, taxi time, Cost Index

> **Cảnh báo ASR:** chất lượng ghi âm Phần 2 kém hơn Phần 1; nhiều thuật ngữ bị nhận dạng sai (vd "loft power", "phi vết", "quả đấy dầu", "nail", "cuộn tui"…) đã được suy luận theo ngữ cảnh kèm cờ `[cần xác nhận]`.

### 8. Cảnh báo lệch tải/trọng lượng giữa OFP và số liệu thực tế (CLC vs Lido)

#### Yêu cầu
- Cần cơ chế so sánh giữa **số liệu thực tế do bộ phận tải/cân bằng (CLC [cần xác nhận tên đầy đủ])** nhập và **số liệu trên OFP** điều phái đang dùng; phát cảnh báo khi sai lệch vượt ngưỡng.
- Luồng hiện hành: CLC nhập số liệu trước (ZFW, payload…), điều phái dựa vào đó hoàn thiện OFP; CLC có thể nhập lại nhiều lần → TOSS lấy con số nhập cuối cùng đối chiếu với OFP cuối cùng.

#### Thảo luận – Đề xuất
- Đối tượng so sánh: cột **ZFW** trên OFP với cột ZFW từ nguồn thực tế (Lido); khi số thực tế **vượt qua** số kế hoạch thì cảnh báo.
- Cấu hình ngưỡng cảnh báo — **cấu trúc nhiều chiều:**
  - **Ngưỡng trên / ngưỡng dưới** (không đối xứng) — ví dụ cho phép thiếu hơn 1,5 tấn nhưng chỉ cho phép cao hơn 1 tấn.
  - Theo **loại tàu bay**.
  - Theo **khoảng giờ bay** (chia dải, vd <3h, 3–6h, >6h).
  - Theo yếu tố **tăng/giảm** (dương/âm có ngưỡng khác nhau).
  - Áp dụng cho: **ZFW**, **payload**, **patch down** [cần xác nhận — có thể "touchdown weight"], **take-off weight** [ASR "loft power"] — riêng take-off weight tính cả dầu, dầu extra, dầu riêng.
- Khái niệm "trọng lượng khô/ướt": ZFW là trọng lượng khô (chưa dầu, chưa nước) [cần xác nhận khái niệm "trọng lượng ướt"].

#### Kết luận
- TOSS xây dựng cảnh báo so sánh OFP với số liệu thực tế (Lido/CLC) trên các trường trọng lượng/tải: ZFW, payload, take-off weight.
- Ngưỡng cảnh báo cấu hình theo ma trận: **loại tàu × khoảng giờ bay × ngưỡng trên/dưới (không đối xứng)**. Cấu hình cụ thể cung cấp buổi sau.
- TOSS lưu lịch sử nhập của CLC để luôn lấy con số nhập cuối cùng.

### 9. Bảng dầu (AHM) và phương án thay thế tạm thời

#### Yêu cầu
- Điều phái cần tra cứu bảng dầu (theo loại tàu, điều kiện khai thác) khi lập kế hoạch bay; bảng này hiện quản lý ở phần mềm IFV của anh Kiếm [cần xác nhận tên đầy đủ].

#### Thảo luận – Đề xuất
- Hướng dài hạn: khi phần mềm IFV hoàn thành, TOSS lấy kết quả bảng dầu từ đó.
- Hướng tạm thời: điều phái **chủ động khai báo** bảng dầu trong TOSS; nhập danh mục bảng dầu ["quả đấy dầu" — cần xác nhận cách gọi], TOSS cảnh báo khi có thay đổi (thay cho cuộc gọi điện hiện hành từ CLC).
- Phía khảo sát đề nghị được cung cấp **tài liệu AHM** để xác định phạm vi tích hợp; điều phái xác nhận sẽ gửi.
- Lido hiện lấy bảng dầu của "anh Ngọt" [cần xác nhận] qua import — Lido mở form cho người nhập tay (không gọi API); TOSS làm tương tự giai đoạn chuyển tiếp.

#### Kết luận
- TOSS hỗ trợ điều phái **khai báo bảng dầu thủ công** giai đoạn đầu; chuyển sang tích hợp tự động với IFV khi sẵn sàng.
- TOSS cảnh báo khi bảng dầu thay đổi.
- Cần lấy tài liệu AHM để xác định cấu trúc dữ liệu bảng dầu.

### 10. Cảnh báo phát sinh NAIL / CDL (lỗi kỹ thuật tàu bay)

#### Yêu cầu
- TOSS phải nhận biết khi tàu bay được lên kế hoạch khai thác phát sinh **NAIL** [cần xác nhận viết tắt] hoặc **CDL** trong khoảng thời gian chuyến bay đang phụ trách, để cảnh báo. Đây là các lỗi kỹ thuật (vd APU hỏng) buộc mang thêm dầu / có hạn chế khai thác.

#### Thảo luận – Đề xuất
- Quy tắc cảnh báo theo thời điểm NAIL phát sinh:
  - NAIL có **khoảng hiệu lực** (active period); raise tại một thời điểm và kéo dài tới khi release.
  - Chuyến đã cất cánh trước khi NAIL raise: không cảnh báo.
  - Chuyến rơi vào khoảng hiệu lực và chưa khai thác: cảnh báo (kể cả khi tại thời điểm đó chưa bị ảnh hưởng — vì thay đổi tải có thể dẫn tới chạy lại OFP vướng NAIL).
  - NAIL kéo dài sang ngày khác: chuyến sau khoảng hiệu lực thì không cảnh báo nữa.
- Khi NAIL ảnh hưởng quay tàu, điều phái có thao tác **chuyển kế hoạch khai thác giữa các tàu** [ASR "chuyển nát" — cần xác nhận].
- Nguồn dữ liệu NAIL: tích hợp **AMOS** [cần xác nhận]; khi AMOS phát một NAIL mới active, TOSS lấy về và cảnh báo.
- Khái niệm **master NAIL → sub-NAIL**: NAIL gốc có thời hạn (vd 6 tháng), bẻ ra các sub-NAIL active theo [cần xác nhận thuật ngữ].
- Xử lý đặc biệt: nếu Lido đã tính NAIL vào dầu thì cảnh báo bổ sung của TOSS có thể không cần — cần làm rõ ranh giới TOSS↔Lido.

#### Kết luận
- TOSS tích hợp **AMOS** để nhận NAIL/CDL phát sinh + active period.
- Quy tắc: chỉ cảnh báo cho chuyến nằm trong khoảng hiệu lực NAIL **và chưa cất cánh**.
- Khi NAIL ảnh hưởng quay tàu, TOSS hỗ trợ điều phái chuyển kế hoạch giữa các tàu (input cho thao tác Lido).
- Cần làm rõ: viết tắt "NAIL" + mô hình master→sub; ranh giới TOSS (cảnh báo) vs Lido (đã tính NAIL vào dầu).

### 11. Phép bay (Flight Permission) và cấu trúc dữ liệu phép bay

#### Yêu cầu
- TOSS cần quản lý phép bay — kiểm tra phép còn hiệu lực, đường bay có khớp với phép xin không.
- Hiện trạng: phép bay **nhập thủ công**, chưa có phần mềm chuyên dụng. Đội SkyCheck (cùng tổng công ty) đang triển khai module phép bay nhưng vướng khâu input.

#### Thảo luận – Đề xuất
- Bản chất phép bay:
  - Xin theo **mùa lịch bay** (6–7 tháng); một lần xin cho toàn bộ lịch thường lệ của mùa.
  - Lịch thường lệ: thêm mùa lịch bay là gần như đủ phép bay.
  - Chuyến VIP/charter: cấp phép riêng (theo từng chuyến, có thể sát giờ).
  - Đổi dự bị/đổi điểm hạ cánh: phải xin bổ sung.
- Cấu trúc thông tin phép bay đề xuất: theo **quốc gia × loại tàu × khoảng thời gian hiệu lực × đường bay/waypoint**.
- Phối hợp SkyCheck: phía khảo sát đề nghị **không phụ thuộc** SkyCheck — tự định nghĩa cấu trúc dữ liệu phép bay trong TOSS, cho nhập trực tiếp, TOSS tự sinh báo cáo; nhưng kiểm tra **tiến độ phân tích nghiệp vụ** SkyCheck để tận dụng (chị quản lý liên hệ qua anh Hùng).

#### Kết luận
- TOSS xây module quản lý phép bay: quốc gia × loại tàu × đường bay × thời gian hiệu lực; trước mắt cho nhập trực tiếp, TOSS tự sinh báo cáo.
- Rà soát tích hợp/tận dụng phân tích SkyCheck qua anh Hùng; không phụ thuộc SkyCheck.
- Lịch thường lệ + thêm mùa → phép bay gần như đủ; xử lý bổ sung cho VIP/charter và thay đổi đột xuất.

### 12. Chứng chỉ tổ bay theo sân bay đặc biệt (Captain Certification per Aerodrome)

#### Yêu cầu
- Một số sân bay địa hình/điều kiện đặc biệt (vd Điện Biên, Đồng Hới [cần xác nhận "Đế Pân"]) yêu cầu cơ trưởng/tổ bay có **chứng chỉ riêng** / **điều kiện kinh nghiệm** cụ thể mới được khai thác.

#### Thảo luận – Đề xuất
- Tính chất: không phải bằng lái thông thường mà là **điều kiện bổ sung** gắn theo từng sân bay khó; khi tổ bay không đủ điều kiện → cảnh báo để điều phái đề nghị đổi tổ.
- Tranh luận phạm vi: có ý kiến đây là việc của trực ban trưởng; chốt nguyên tắc — cứ liệt kê toàn bộ cảnh báo cần có, sau đó phân loại điều phái/trực ban trưởng, không bỏ sót.
- Cảnh báo **đổi tổ bay**: khi chuyến đổi tổ (tên tổ bay mới), TOSS cảnh báo điều phái. Khi điều phái vào Lido, Lido đã có tổ bay mới (Lido đóng vai trò TIC [cần xác nhận]); điều phái chỉ thao tác lại, không phải đẩy tổ bay vào Lido.

#### Kết luận
- TOSS cần danh mục **điều kiện đặc biệt theo sân bay** và đối chiếu chứng chỉ tổ bay được phân; cảnh báo khi không thỏa mãn.
- TOSS phát cảnh báo **đổi tổ bay** (kèm tên tổ bay mới) — cảnh báo cho điều phái.
- Cảnh báo "phân tổ bay ban đầu" có thể thuộc trực ban trưởng — phân loại sau khi liệt kê đầy đủ.

### 13. APU time, PAX time và lịch PAX

#### Yêu cầu
- TOSS cần cảnh báo thay đổi liên quan **APU time** và **PAX time / lịch PAX**.

#### Thảo luận – Đề xuất
- Hiện trạng kỹ thuật: **OFP của Lido không thể hiện APU time**; phone (báo điện tử tổ bay) cũng không. → nếu cảnh báo thì chỉ theo **PAX time** (số PAX có trong OFP).
- Cảnh báo lịch PAX: cảnh báo trước STD bao nhiêu phút thì kiểm tra lịch PAX [cần xác nhận ngưỡng phút]; trường hợp "phone bằng một kiếm" [cần xác nhận] nhưng chưa nhập báo mạng thì chỉ cảnh báo khi thay phó hoặc nhập Lido sai/sót.

#### Kết luận
- TOSS không cảnh báo APU time (OFP/Lido/phone không cung cấp).
- TOSS cảnh báo PAX time / lịch PAX dựa trên số liệu có sẵn trên OFP/Lido.
- Ngưỡng theo phút + các trường hợp cụ thể sẽ chốt sau (đoạn ghi âm không rõ).

### 14. Taxi time chuẩn (Standard Taxi Time)

#### Yêu cầu
- TOSS cần dùng **Standard Taxi Time** làm dữ liệu đầu vào cho tính toán chuyến bay.

#### Thảo luận – Đề xuất
- Hiện trạng: **bên MOI** [cần xác nhận] đang quản lý Standard Taxi Time; mỗi sân bay có giá trị standard riêng + **thời gian hiệu lực**.
- Quy tắc cập nhật: bình thường ít thay đổi; chỉ thay trong **kỳ cao điểm** (Tết/đặc biệt) → cần monitor và thông báo.
- Tích hợp Lido: nếu Lido có API/database master → TOSS push tự động; nếu không → nhập tay từng sân (Lido "rất nóng"/kén tích hợp) → hệ quả nhập hai lần.
- Thống kê: TOSS **tự thống kê** Standard Taxi Time từ dữ liệu thực tế (QAR/QAI, phân tích dưới hệ thống "long" [cần xác nhận]); trình điều phái duyệt trước khi áp dụng. Nguồn QAI lấy qua **API** hoặc **Database View** của tổng công ty.

#### Kết luận
- TOSS quản lý **Standard Taxi Time theo sân bay + thời gian hiệu lực**.
- TOSS tự thống kê từ QAR/QAI (API hoặc Database View), trình điều phái duyệt.
- Cảnh báo khi sân bay thay đổi Standard Taxi Time, đặc biệt đợt cao điểm.
- Phương án push sang Lido cần khảo sát kỹ thuật; nếu không, chấp nhận "nhập hai lần" giai đoạn đầu.
- Làm rõ MOI là đơn vị/hệ thống nào.

### 15. Cost Index (CI) — bỏ cảnh báo

#### Yêu cầu
- YCKT ban đầu đề cập cần cảnh báo về **Cost Index (CI)**.

#### Thảo luận – Đề xuất
- Hiện trạng: nghiệp vụ VNA dùng **3 CI** (Climb/Cruise/Descend) [cần xác nhận]; platform Lido hiện chỉ trả **một** giá trị CI (Cruise CI) → không đủ dữ liệu đối chiếu đầy đủ → cảnh báo CI không khả thi.
- Đề xuất: **bỏ cảnh báo Cost Index** khỏi phạm vi TOSS giai đoạn này.

#### Kết luận
- **Bỏ cảnh báo Cost Index** giai đoạn này (nhất trí).
- Khi Lido hỗ trợ trả đầy đủ 3 CI, xem xét bổ sung lại.

---

## III. Các nội dung đã thống nhất (toàn buổi sáng)

| # | Nội dung thống nhất | Phần |
|---|---|---|
| 1 | Bổ sung chức năng "Dispatch Release" trên TOSS làm thao tác chủ động của điều phái | 1 |
| 2 | Lido vẫn tự sinh OFP và gửi lên MO Plus; TOSS gắn trạng thái "đã Dispatch Release" cho từng phiên bản | 1 |
| 3 | MO Plus chặn Captain's Release của phi công nếu điều phái chưa Dispatch Release | 1 |
| 4 | Dưới 60 phút trước STD (nội địa) không tự làm lại OFP; chỉ làm lại khi tổ bay yêu cầu qua điện thoại | 1 |
| 5 | TOSS xây màn hình tập trung kiểm tra đầu ca với 9 nhóm nội dung | 1 |
| 6 | TOSS đóng vai trò "view + cảnh báo"; thao tác nghiệp vụ vẫn ở hệ thống chuyên dụng | 1 |
| 7 | Ngưỡng cảnh báo thay đổi giờ bay: ±15 phút (OSP) — cả sớm và muộn | 1 |
| 8 | Cảnh báo: thay đổi loại tàu, thay đổi tàu bay, phát sinh ferry, chuyển sang VIP, phát sinh Lotang; VIP→thường chỉ ghi nhận | 1 |
| 9 | Divert tách nhóm cảnh báo riêng; Divert phát sinh chuyến mới → cảnh báo "chưa có tài liệu" | 1 |
| 10 | NOTAM phân 3 nhóm: sân bay / vùng trời / đường bay; cần workshop SME chi tiết hóa | 1 |
| 11 | NOTAM cứu hỏa (RFFS) phát ra → cảnh báo trực tiếp; không lưu danh sách tiêu chuẩn RFFS hiện hành | 1 |
| 12 | Cảnh báo thời tiết sân bay 3 thông số: tầm nhìn, trần mây, TSRA — so với VMA + biên an toàn | 1 |
| 13 | TOSS tích hợp & parse METAR + SPECI; ưu tiên nguồn chính thức (nội địa; gói Lido cho quốc tế) | 1 |
| 14 | So sánh OFP với số liệu thực tế CLC/Lido (ZFW, payload, take-off weight); ngưỡng theo ma trận loại tàu × giờ bay × trên/dưới | 2 |
| 15 | TOSS luôn dùng số liệu CLC nhập cuối cùng để đối chiếu với OFP cuối cùng | 2 |
| 16 | TOSS cho điều phái khai báo bảng dầu (AHM) thủ công giai đoạn đầu; chuyển sang IFV khi sẵn sàng | 2 |
| 17 | TOSS cảnh báo khi bảng dầu thay đổi (thay cuộc gọi điện hiện hành) | 2 |
| 18 | TOSS tích hợp AMOS nhận NAIL/CDL; cảnh báo chuyến trong khoảng hiệu lực NAIL và chưa cất cánh | 2 |
| 19 | Hỗ trợ điều phái chuyển kế hoạch khai thác giữa các tàu khi NAIL ảnh hưởng quay tàu | 2 |
| 20 | TOSS quản lý phép bay: quốc gia × loại tàu × đường bay × thời gian hiệu lực; trước mắt nhập trực tiếp | 2 |
| 21 | Rà soát phối hợp SkyCheck (qua anh Hùng) để tận dụng phân tích nếu có, không phụ thuộc | 2 |
| 22 | TOSS quản lý chứng chỉ tổ bay theo sân bay đặc biệt; cảnh báo khi tổ bay không đủ điều kiện | 2 |
| 23 | TOSS cảnh báo đổi tổ bay (kèm tên tổ bay mới); cảnh báo phân tổ ban đầu có thể thuộc trực ban trưởng | 2 |
| 24 | TOSS không cảnh báo APU time (OFP/Lido/phone không cung cấp); chỉ cảnh báo PAX time / lịch PAX | 2 |
| 25 | TOSS quản lý Standard Taxi Time theo sân bay + thời gian hiệu lực; tự thống kê từ QAR/QAI (API/Database View), trình điều phái duyệt | 2 |
| 26 | **Bỏ cảnh báo Cost Index** giai đoạn này (Lido chỉ trả 1 CI); xem xét lại khi Lido hỗ trợ đủ 3 CI | 2 |

## IV. Vấn đề cần làm rõ (toàn buổi sáng)

**Từ Phần 1:**
- Xác nhận các mốc upload OFP quốc tế (90/130/180/200 phút) và phân loại chuyến tương ứng.
- Xác nhận tên/viết tắt: VMA, VNCM/VNCS, "Vy Vy", UA PASMOS, Sunweather, "Phi Công 11".
- Định nghĩa "chuyến Lotang" và tiêu chí đánh giá tác động.
- Giao diện & cơ chế đồng bộ trạng thái Dispatch Release giữa TOSS và MO Plus (timing, payload, fail-safe).
- Cơ chế ghi nhận lịch sử làm lại OFP sát giờ.
- Phương án parse METAR/SPECI (tự xây vs thư viện/dịch vụ).
- Quy tắc đánh giá mức độ ảnh hưởng NOTAM tới chuyến cụ thể — workshop SME.
- Nguồn thời tiết quốc tế ngoài gói Lido; chi tiết en-route/SIGMET (đoạn ghi âm nhiễu).

**Từ Phần 2:**
- **CLC** — tên đầy đủ + phạm vi nghiệp vụ.
- **Take-off weight ("load power")**, **trọng lượng ướt ("phi vết")** — chuẩn hóa thuật ngữ + cách tính.
- **Bảng ngưỡng cảnh báo lệch tải** chi tiết (loại tàu × dải giờ bay × ngưỡng trên/dưới).
- **Phần mềm IFV** (anh Kiếm), **danh mục "quả đấy dầu"**, **"anh Ngọt"** (nguồn bảng dầu Lido).
- **NAIL** viết tắt + phân biệt CDL; **mô hình master NAIL → sub-NAIL**.
- **AMOS** xác nhận + cơ chế tích hợp (API/event/poll); **ranh giới Lido↔TOSS với NAIL**.
- **MOI** (quản lý Standard Taxi Time); **Lido có API/master để push Standard Taxi Time hay không**.
- **TIC (Lido)** viết tắt; **hệ thống "long"** phân tích QAR/QAI.
- **Danh mục sân bay đặc biệt** (Điện Biên, Đồng Hới…) + điều kiện chứng chỉ cơ trưởng.
- **Ngưỡng cảnh báo PAX time** (phút trước STD); **3 CI** + điều kiện Lido trả đủ 3 CI.
- **Đội SkyCheck** — đầu mối + tiến độ phân tích nghiệp vụ phép bay.

> Các điểm trên đã được ghi nhận tập trung tại sổ theo dõi `SO-THEO-DOI-DIEM-CHOT-v0.1.md` (OID-TOSS-001) — nhóm SME/KS.

## V. Thuật ngữ domain-knowledge (đề xuất + trạng thái cập nhật glossary)

> Phần 1 (mục 1–10): đã thêm vào `toss-glossary-v0.1.md` v0.5. Phần 2 (mục 11–25): các từ rõ + AMOS đã thêm v0.6 (BA Lead confirm 12/06); các từ còn `[cần xác nhận]` chưa thêm, theo dõi qua OID-TOSS-001.

| # | Thuật ngữ | Trạng thái glossary | Nguồn |
|---|---|---|---|
| 1 | Dispatch Release | ✅ v0.5 | P1 §1 |
| 2 | Captain's Release | ✅ v0.5 | P1 §2 |
| 3 | Thời điểm phát hành OFP (60'/90'/130/180/200) | ✅ v0.5 (mốc 130/180/200 còn cờ) | P1 §1 |
| 4 | Chuyến Ferry | ✅ v0.5 | P1 §5 |
| 5 | Chuyến Lotang | ✅ v0.5 (còn cờ định nghĩa) | P1 §5 |
| 6 | RFFS (cảnh báo qua NOTAM) | ✅ v0.5 | P1 §6 |
| 7 | SPECI | ✅ v0.5 | P1 §7 |
| 8 | TSRA | ✅ v0.5 | P1 §7 |
| 9 | VMA | ✅ v0.5 (còn cờ viết tắt) | P1 §7 |
| 10 | Phân loại NOTAM 3 nhóm | ✅ v0.5 | P1 §6 |
| 11 | ZFW (Zero Fuel Weight) | ✅ v0.6 | P2 §8 |
| 12 | CLC | ⏳ đã có sẵn "Control Load Center" (FDOP); P2 gọi "Centralized Load Control" — theo dõi OID SME-12 | P2 §8 |
| 13 | AHM (bảng dầu) | ✅ v0.6 | P2 §9 |
| 14 | NAIL | ⏳ chờ xác nhận — OID SME-13/KS-12 | P2 §10 |
| 15 | CDL | ✅ đã có sẵn trong glossary | P2 §10 |
| 16 | AMOS | ✅ v0.6 (cơ chế tích hợp còn cờ OID SME-14) | P2 §10 |
| 17 | Flight Permission / Phép bay | ✅ đã có sẵn trong glossary | P2 §11 |
| 18 | SkyCheck | ⏳ chờ — OID KS-15 | P2 §11 |
| 19 | APU Time | ✅ v0.6 | P2 §13 |
| 20 | Standard Taxi Time | ✅ v0.6 | P2 §14 |
| 21 | QAR/QAI | ⏳ chờ — OID KS-19 | P2 §14 |
| 22 | Cost Index (CI) — 3 CI | ✅ v0.6 (3 CI còn cờ OID KS-17) | P2 §15 |
| 23 | Captain Certification per Aerodrome | ✅ v0.6 (danh mục sân bay còn cờ OID SME-18) | P2 §12 |
| 24 | TIC (Lido) | ⏳ chờ — OID SME-17 | P2 §12 |
| 25 | PAX time / Lịch PAX | ⏳ chờ — OID KS-18 | P2 §13 |

---

*Báo cáo gộp buổi sáng 11/06/2026 (Phần 1 + Phần 2), lập 2026-06-12. Một số đoạn ghi âm (cuối Phần 1 — thời tiết; Phần 2 — nhiều thuật ngữ kỹ thuật) chất lượng kém; các nội dung gắn cờ `[cần xác nhận]` cần phỏng vấn bổ sung / đối chiếu SME trước khi đưa vào tài liệu yêu cầu chính thức. Điểm cần chốt được theo dõi tại OID-TOSS-001.*
