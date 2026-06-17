---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "Việt Anh"
version: "1.0"
date: "2026-06-17"
status: "Draft"
document_type: "Báo cáo Đánh giá BRD"
---

# BÁO CÁO ĐÁNH GIÁ DỰ THẢO BRD MODULE NƯỚC SẠCH (PORTABLE WATER SERVICE)

Tài liệu này đánh giá tính chính xác và đầy đủ của dự thảo [BRD-Portable-Water-Service-v1.1.docx](file:///c:/Users/anhnlv/Downloads/TOSS-20260611T014328Z-3-001/TOSS/ba/workspace/drafts/brd/BRD-Portable-Water-Service-v1.1.docx) dựa trên nội dung thảo luận nội bộ được ghi nhận tại hai file transcript cuộc họp:
1. [audio_hop_160626.txt](file:///c:/Users/anhnlv/Downloads/TOSS-20260611T014328Z-3-001/TOSS/ba/workspace/input/Customer_docs/meeting-notes/Hop_noi_bo/audio_hop_160626.txt) (Thảo luận về tổng thể hệ thống, phân hệ TOS, layout Dashboard Web)
2. [audio_hop_160626_2.txt](file:///c:/Users/anhnlv/Downloads/TOSS-20260611T014328Z-3-001/TOSS/ba/workspace/input/Customer_docs/meeting-notes/Hop_noi_bo/audio_hop_160626_2.txt) (Thảo luận chi tiết về Module Nước sạch - Portable Water Service)

---

## 1. Bản dịch thuật thuật ngữ và Hiệu chỉnh lỗi nhận diện giọng nói (Speech-to-Text Errors)

Do hai file văn bản cuộc họp là kết quả chuyển đổi tự động từ âm thanh sang văn bản (Speech-to-Text), có rất nhiều lỗi nhận diện từ đồng âm hoặc sai lệch thuật ngữ chuyên ngành hàng không. Dưới đây là bảng hiệu chỉnh giúp làm rõ nội dung thảo luận thực tế:

| Từ gốc trong file Text | Từ chính xác / Thuật ngữ chuyên ngành | Giải nghĩa nghiệp vụ |
|:---|:---|:---|
| **file logic** / **logic** | **File Loadsheet** (hoặc LDM) | Tài liệu hướng dẫn xếp tải chuyến bay, chứa số lượng khách (Pax) thực tế cuối cùng. |
| **tàn bệnh khách** | **Phân bổ hành khách** / **Số khách (Pax)** | Số lượng khách thực tế phân bổ trên các khoang máy bay. |
| **bán xuyên** | **Bản tin** / **Thông tin chuyến bay** | Thông tin hiển thị của chuyến bay trên ứng dụng. |
| **tổ chứa** / **tay nước** | **Bể chứa** / **Bình chứa (Tank)** | Bình chứa nước sạch trên máy bay. |
| **chuyến giao tiết** | **Chuyến bay tiếp theo** | Các chuyến bay kế tiếp sử dụng cùng loại tàu hoặc cùng chặng. |
| **bắt vơ lên 5 người** | **Buffer thêm 5 người** | Biên an toàn cộng thêm tương đương lượng nước tiêu thụ của 5 khách. |
| **FB** / **app OO** | **App MO (Mobile Office)** | Ứng dụng trên thiết bị di động (iPad) dành cho tổ bay/tiếp viên. |
| **màn kỳ khỏi** | **Màn cấu hình / quản trị** | Giao diện quản trị dữ liệu danh mục trên Website. |
| **SITTER MIN** / **Sites.min** | **System Admin** | Phân hệ Quản trị hệ thống. |
| **DATA MIN** | **Data Admin** | Phân hệ Quản trị dữ liệu danh mục. |
| **DATA SUBMONITORING** | **Data Monitoring** | Phân hệ Giám sát dữ liệu. |
| **giày ITC** / **giày PC** | **Giờ UTC** | Giờ quốc tế (phối hợp chuẩn trên toàn hệ thống TOS). |
| **giày logo** / **local** | **Giờ Local** | Giờ địa phương tại sân bay đi/đến. |
| **FlyDiskPak** / **tài disc** | **Flight Dispatch** / **Tài liệu** | Phân hệ Điều hành bay / Tài liệu thiết kế. |
| **Relieve OAP** | **Release OFP** (Operational Flight Plan) | Phát hành kế hoạch bay. |

---

## 2. Đánh giá tính chuẩn xác của các nội dung trong BRD v1.1

Nhìn chung, dự thảo **BRD v1.1** đã mô tả đúng tinh thần cốt lõi của giải pháp. Tuy nhiên, có một số điểm cần chuẩn hóa và bổ sung chi tiết để khớp với thảo luận của cuộc họp:

### 2.1. Logic tính toán và Tham số Buffer
* **Hiện trạng BRD:**
  * Mục 3.2 mô tả công thức: `W_cần = Suất_lịch_sử × (Pax + Crew) × Giờ_bay + Buffer`.
  * Ghi chú: "Buffer an toàn là các tham số cấu hình ở backend".
* **Ý kiến cuộc họp (Transcript 2):**
  * Sếp chỉ đạo: *"Mình sẽ bắt vơ (buffer) lên 5 người và em như thế đấy"*.
* **Kiến nghị chỉnh sửa:** Cụ thể hóa tham số cấu hình buffer. Ngoài việc cấu hình theo thời gian (giờ taxi, giờ dự phòng), hệ thống cần hỗ trợ cấu hình **buffer theo số lượng người tương đương** (ví dụ: mặc định buffer +5 người vào tổng số Pax + Crew trước khi nhân định mức) hoặc **tỷ lệ % buffer** (ví dụ: +5% lượng nước cần).

### 2.2. Dữ liệu đầu vào hành khách (Pax)
* **Hiện trạng BRD:**
  * Mục 3.3 phân chia 2 nguồn: Booking trên Amadeus (trước loadsheet) và Loadsheet (sau khi có loadsheet).
* **Ý kiến cuộc họp (Transcript 2):**
  * Làm rõ cách lấy số người dự kiến: Amadeus Booking (dành cho khách) + Hệ thống quản lý tổ bay (dành cho Crew có số lượng cố định theo loại tàu/lịch trình) để đưa ra con số gợi ý ban đầu.
  * Quy trình xử lý loadsheet: Nhận file loadsheet → Bóc tách số Pax trên các khoang → Tính toán lại → Gửi thông báo đến thiết bị của tiếp viên.
* **Kiến nghị chỉnh sửa:** Bổ sung việc tích hợp với hệ thống Crew (quản lý tổ bay) để tự động lấy số lượng thành viên tổ bay thay vì để người dùng nhập tay hoàn toàn hoặc cấu hình tĩnh.

---

## 3. Các nội dung trong biên bản họp ĐÃ NÓI tới nhưng BRD CHƯA LÀM RÕ (Cần cập nhật)

Dưới đây là các nội dung cực kỳ quan trọng đã được thống nhất/định hướng trong cuộc họp nội bộ nhưng vẫn đang bị bỏ ngỏ (nằm trong mục "Điểm cần chốt" hoặc hoàn toàn chưa đề cập) trong dự thảo BRD:

### 3.1. Phân quyền và Quy trình xác nhận trên App (BRD Mục 7.3)
* **Hiện trạng BRD (Mục 7.3 - Điểm cần chốt):** *"Phi công và tiếp viên đều có thể submit, hay chỉ một người? Ai là người submit chính? Nếu cả hai cùng submit..."*
* **Thực tế cuộc họp đã chốt (Transcript 2):**
  * Sếp chỉ đạo: *"Ru ở đây là tổ bay, xác minh được không quan trọng là cơ trưởng hay tiếp viên trưởng. Cứ tổ bay dưới xác minh. Ok chứ ạ?"*
* **Cập nhật BRD:** Chuyển nội dung này từ "Điểm cần chốt" thành **Quy tắc Nghiệp vụ (Business Rule)**: *"Cả Phi công (Cơ trưởng/Cơ phó) và Tiếp viên (Tiếp viên trưởng/Tiếp viên) thuộc tổ bay của chuyến bay đó đều có quyền thực hiện xác nhận (submit) dữ liệu đầu chuyến và cuối chuyến trên App MO Plus. Hệ thống ghi nhận theo lượt gửi đầu tiên thành công và lưu vết ID của nhân sự thực hiện."*

### 3.2. Quy tắc múi giờ hiển thị (Timezone)
* **Hiện trạng BRD:**
  * Chưa có dòng nào quy định về hiển thị thời gian (Timezone). Các ví dụ chỉ ghi ngày `15/06/2026`.
* **Thực tế cuộc họp đã chốt (Transcript 1):**
  * Sếp chỉ đạo: *"Tất cả các giờ trên hệ thống của TOS, mình sẽ quy định bất kỳ chỗ nào nó đều phải là giờ UTC hết. Tức là khi mà mình đọc là 16.00... khách hàng sẽ gửi ra giờ UTC. Muốn khi đổi sang giờ Việt Nam thì giờ cộng 7. Tất cả các giờ luôn, mình không có một cái mốc giờ nào của local cả. Đấy là cái tiên quyết."*
  * Đồng thời, trên giao diện màn hình chính nên thiết kế hiển thị song song giờ UTC và giờ Local Việt Nam ở vị trí dễ quan sát.
* **Cập nhật BRD:** Thêm yêu cầu phi chức năng về hiển thị thời gian: Toàn bộ dữ liệu giờ bay, giờ xác nhận trên Web Admin và App MO Plus phải hiển thị theo **giờ UTC**. Riêng trên giao diện Dashboard/Header có thể bổ sung đồng hồ đôi hiển thị song song giờ UTC và Local (GMT+7) để tổ bay tiện đối chiếu.

### 3.3. Tích hợp nguồn dữ liệu "Điện nước sạch" của tàu bay (BRD Mục 7.1 và 7.4)
* **Hiện trạng BRD:**
  * Mục 7.1 để trống điểm cần chốt: *"A-CAD gửi tự động hay phải pull? Tần suất bao nhiêu?"*
  * Mục 7.4 để trống: *"Khi A-CAD và tiếp viên xác nhận lệch nhau: báo cáo dùng nguồn nào làm chuẩn?"*
* **Thực tế cuộc họp đã định hướng (Transcript 2):**
  * Sếp chỉ đạo: *"Điện nước sạch ở đây, nó sẽ là của 350 và B787. Thì mình sẽ tích cái điện đấy, coi như đấy là một lần submit của tiếp viên. Kết hợp với tiếp viên, kết hợp với điện đấy để mình tính toán dữ liệu lịch sử. Nó vẫn có dữ liệu đầu chuyến, nó vẫn có dữ liệu cuối chuyến."*
* **Cập nhật BRD:**
  * **Về Tích hợp:** Xác định rõ đối với dòng tàu Boeing 787 (B787) và Airbus 350 (A350), hệ thống sẽ tự động tiếp nhận điện văn truyền tin từ máy bay ("Điện nước sạch" gửi qua ACARS/A-CAD).
  * **Về Logic đối chiếu:** Hệ thống lưu vết cả 2 nguồn: (1) Số liệu tự động từ Điện nước sạch và (2) Số liệu do tiếp viên nhập tay. Cả hai dữ liệu này đều có đầy đủ thông số đầu chuyến và cuối chuyến để so khớp trong Báo cáo đối chiếu (W-04). Trong engine tính toán suất lịch sử, hệ thống sẽ ưu tiên kết hợp cả hai nguồn (có quy tắc lọc nhiễu/lệch số liệu để đảm bảo độ chính xác).

### 3.4. Yêu cầu thiết kế giao diện (UI/UX) cho App MO và Web Admin
* **Hiện trạng BRD:**
  * Mục 4 mô tả giao diện dạng text/block đơn giản trên App. Giao diện Web mô tả chức năng báo cáo chung chung.
* **Thực tế cuộc họp yêu cầu thêm:**
  * **Trên App MO (Transcript 2):** Cần thiết kế một **thành phần đồ họa trực quan (thanh chỉ thị lượng nước - "nhìn giả nước")** hiển thị ở phần trên cùng của giao diện Module để tổ bay dễ dàng nhận biết trạng thái nước hiện tại trong tank (ví dụ: biểu thị tank nước có dung tích bao nhiêu, đang đầy bao nhiêu phần trăm trực quan như cột nước).
  * **Trên Web Admin (Transcript 1):** Tất cả các màn hình bảng biểu (bao gồm báo cáo W-03, W-04, W-05, W-06, W-07) phải áp dụng chuẩn chung của TOS:
    * Cho phép **tùy biến ẩn/hiện cột (Customize columns)** và cấu hình này phải được **lưu lại theo tài khoản người dùng (User-based settings)**. Khi đăng nhập lại sẽ hiển thị đúng cấu hình đó.
    * Menu điều hướng và bộ lọc (Filter) phải có tính năng **thu gọn (Collapse)** để tối đa hóa diện tích hiển thị của bảng dữ liệu.
    * Các trường dữ liệu/cột chưa tích hợp được thông tin thì không để trống vô nghĩa mà hiển thị ký tự gạch ngang `-`.

---

## 4. Tổng hợp các điểm kiến nghị cập nhật vào BRD v1.2

Để chuẩn bị ban hành phiên bản **BRD v1.2** hoàn thiện, đề xuất cập nhật các nội dung sau vào tài liệu:

```diff
# 3.2. Tính lượng nước cần nạp cho chuyến bay mới
- Phần buffer an toàn (giờ taxi, giờ dự phòng, mức tối thiểu) là các tham số cấu hình ở backend...
+ Hệ thống cho phép cấu hình tham số buffer theo hai dạng:
+ 1. Buffer theo thời gian/lượng nước tối thiểu (giờ taxi theo sân bay, giờ dự phòng theo chặng, mức tối thiểu an toàn theo loại tàu).
+ 2. Buffer theo số lượng người (ví dụ: cấu hình cộng thêm mặc định +5 người vào tổng số Pax + Crew trước khi nhân định mức tiêu thụ để tạo biên an toàn).

# 6. Tích hợp hệ thống liên quan
- A-CAD (ACARS): % nước đầu chuyến, % cuối chuyến | Nguồn chính; FWS-01, FWS-02
+ A-CAD (ACARS): Tự động nhận điện văn "Điện nước sạch" (chứa thông số % nước đầu và cuối chuyến) gửi về từ dòng tàu bay A350 và B787. Dữ liệu này được xử lý tương đương như một lượt submit tự động để đối chiếu với tiếp viên.
+ Amadeus PSS & Crew System: Lấy số lượng khách dự kiến (Booking) và số lượng tổ bay (Crew) cố định để phục vụ tính toán gợi ý trước chuyến bay.

# 7. Điểm cần chốt (Chuyển thành các Quyết định Nghiệp vụ / Business Decisions)
- [ ] 7.3. Phi công và tiếp viên đều có thể submit, hay chỉ một người? Ai là người submit chính?
+ [x] Quyết định: Cả Phi công và Tiếp viên thuộc tổ bay đều có quyền submit. Hệ thống ghi nhận lượt submit đầu tiên và lưu vết thông tin người gửi.
- [ ] 7.1. A-CAD gửi tự động hay phải pull? Tần suất bao nhiêu?
+ [x] Quyết định: A-CAD gửi tự động qua điện văn ACARS ("Điện nước sạch") đối với tàu B787 và A350 ngay khi có sự kiện đầu chặng và cuối chặng.
- [ ] 7.4. Khi A-CAD và tiếp viên xác nhận lệch nhau: báo cáo dùng nguồn nào làm chuẩn?
+ [x] Quyết định: Báo cáo đối chiếu (W-04) hiển thị song song cả hai nguồn để Admin kiểm soát. Engine tính toán suất lịch sử sẽ kết hợp cả hai nguồn theo thuật toán làm sạch dữ liệu.
```

BA Lead / Senior BA Việt Anh có thể sử dụng các kết luận trên để trực tiếp cập nhật vào file BRD Word và bàn giao bản vẽ Mockup cho đội thiết kế (Quân).
