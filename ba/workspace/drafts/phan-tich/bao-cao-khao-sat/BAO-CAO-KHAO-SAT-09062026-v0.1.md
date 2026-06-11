---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.9"
date: "2026-06-09"
survey_date: "2026-06-09"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — buổi 09/06/2026"
reference_docs: "BCAO_10Jun2025_11Jun2025-v2.docx (mẫu báo cáo điều hành ngày)"
---

# Báo cáo Khảo sát TOSS — Buổi 09/06/2026

## I. Thông tin chung

- **Thời gian:** ngày 09/06/2026.
- **Mục đích:** thiết kế cây menu và danh mục chức năng của hệ thống TOSS, đồng thời rà soát các yêu cầu kỹ thuật trong bảng triển khai.
- **Thành phần:**
  - Bên VNA (hãng bay): chị Bạch Lê, anh An, anh Nam, anh Dũng (phụ trách tổng quan).
  - Bên VTIT (đơn vị phát triển): anh Văn Hiệp và nhóm triển khai.

## II. Nội dung trao đổi

### 1. Cây menu và danh mục chức năng

- **VTIT trao đổi:**
  - Đề xuất tổ chức hệ thống thành năm nhóm chức năng nghiệp vụ (điều hành khai thác, điều phái, cân bằng tải, quản lý sân bay, danh mục tàu bay – sân bay – chặng bay) và ba nhóm quản trị (quản trị hệ thống, giám sát dữ liệu, bảo trì danh mục).
  - Đề xuất đưa danh mục, cấu hình tham số và cảnh báo vào nhóm quản trị.
- **VNA trao đổi:**
  - Danh mục là lớp dữ liệu cơ sở, đồng bộ tự động hàng ngày, chủ yếu phục vụ cảnh báo ở tầng nghiệp vụ.
  - Đề nghị tách phần bảo trì danh mục thành một menu riêng do khối lượng dữ liệu lớn.
- **Kết quả:** thống nhất tách bảo trì danh mục thành menu riêng, cùng cấp với quản trị hệ thống và giám sát dữ liệu.

### 2. Mô hình phân quyền

- **VTIT trao đổi:**
  - Đề xuất dùng chung một màn hình cho nhiều đối tượng; các cột thông tin và nút thao tác ẩn hoặc hiện theo quyền người dùng (ví dụ bảng năm mươi cột, mỗi người chỉ thấy nhóm cột tương ứng quyền của mình); tách riêng quyền chỉ xem và quyền thao tác.
- **VNA trao đổi:**
  - Phân quyền theo chức năng; riêng dữ liệu chuyến bay phân theo căn cứ bay.
- **Kết quả:** thống nhất phân quyền theo chức năng, một màn hình dùng chung, ẩn/hiện cột và nút theo quyền.

### 3. Nghiệp vụ cân bằng tải

- **VNA trao đổi:**
  - Phần cân bằng tải gồm ba nhóm chức năng: nhập số liệu tải và cân bằng, cung cấp tài liệu chuyến bay, và lưu thông báo cho cơ trưởng cùng bản kê hàng hóa; thông báo cho cơ trưởng chia hai loại cho hành khách và hàng hóa.
  - Ngoài tải tài liệu từng chuyến, cần tải hàng loạt nhiều tài liệu cho nhiều chuyến cùng lúc.
- **VTIT trao đổi:**
  - Đề xuất bố trí tải hàng loạt thành khu vực riêng, hệ thống tự gắn tài liệu vào đúng chuyến dựa trên quy ước đặt tên tệp; vẫn giữ chức năng tải thủ công.
  - Đề nghị làm rõ định dạng và quy ước đặt tên của tài liệu nguồn.
- **Kết quả:** thống nhất tải hàng loạt theo khu vực riêng, tự gắn theo tên tệp; tổ chức một buổi khảo sát chuyên đề về luồng tài liệu này.

### 4. Lưu trữ tài liệu

- **VTIT trao đổi:**
  - Đề xuất tài liệu lấy từ hệ thống ngoài chỉ kéo về khi người dùng tải xuống và lưu tối đa ba ngày sau khi chuyến bay hạ cánh, sau đó tự động xóa để tiết kiệm bộ nhớ.
- **VNA trao đổi:**
  - Tài liệu do chính TOSS sinh ra thì lưu trong hệ thống; tài liệu từ hệ thống ngoài lưu tạm theo nguyên tắc trên.
- **Kết quả:** thống nhất tài liệu sinh từ TOSS thì lưu, tài liệu từ hệ thống ngoài lưu tối đa ba ngày rồi xóa.

### 5. Quản lý tàu bay

- **VNA trao đổi:**
  - Mỗi tàu cần quản lý theo lịch sử khai thác vì có thể vào ra đội bay nhiều lần hoặc thay đổi cấu hình khoang.
  - Hình thức sở hữu gồm tàu sở hữu, tàu thuê khô và tàu thuê ướt; trong thuê ướt có thêm biến thể thuê ướt kết hợp (Damp Lease) trong đó bên cho thuê cung cấp toàn bộ trừ nhiên liệu, VNA tự cấp nhiên liệu cho tàu đó.
  - Các thuộc tính cần quản lý: trọng tải, cấu hình khoang, dung tích thùng nhiên liệu và thùng nước, khoang hàng, mã đăng ký và mã nhận dạng quốc tế (IATA Designator, ICAO Designator); đội tàu được phân nhóm tùy mục đích báo cáo.
- **VTIT trao đổi:**
  - Ghi nhận; đề xuất cơ chế định nghĩa nhóm đội tàu để mỗi tàu chỉ gán một lần.
  - Lưu ý đơn vị nhiên liệu trong điện văn từ tàu bay có thể đổi theo giai đoạn, cần hệ số quy đổi về cùng đơn vị chuẩn theo thời gian hiệu lực.
- **Kết quả:** thống nhất quản lý tàu bay theo hình thức sở hữu và thuê, kèm lịch sử và phân nhóm đội tàu.

### 6. Quản lý sân bay và cảnh báo dịch vụ

- **VNA trao đổi:**
  - Cần danh mục dịch vụ sân bay để ghi nhận năng lực phục vụ (ví dụ sân bay không hỗ trợ tàu hỏng động cơ phụ trợ).
  - Hiện các thông tin này đang quản lý thủ công, khó trích xuất và tổng hợp.
- **VTIT trao đổi:**
  - Ghi nhận để xây danh mục và cơ chế cảnh báo, hỗ trợ điều hành đổi tàu khi cần.
- **Kết quả:** thống nhất xây danh mục dịch vụ sân bay phục vụ cảnh báo.

### 7. Báo cáo điều hành ngày khai thác (BCAO)

Trực ban trưởng lập báo cáo điều hành ngày bằng tệp Word, phát hành hằng ngày và phải được phê duyệt. BCAO là **một văn bản duy nhất** chia làm hai phần: phần đầu là tình hình khai thác ngày hôm trước (số liệu thực hiện), phần sau là kế hoạch khai thác ngày hôm nay. Tệp mẫu khảo sát: `BCAO_10Jun2025_11Jun2025-v2.docx`.

- **VNA trao đổi (cấu trúc BCAO hiện hành):**
  - Phần thực hiện ngày hôm trước gồm:
    - Số liệu khai thác: số chuyến theo từng hãng trong nhóm (VN, 0V, BL), số khách quốc nội và quốc tế, hàng hóa, chuyến ferry.
    - Chỉ số đúng giờ (OTP) và hiệu quả thực hiện lịch khai thác (OSP) đi/đến, so sánh với mục tiêu.
    - Hệ số sử dụng ghế (LF) theo từng đường trục (bảng số chuyến đi/đến, LF đi/đến, LF trung bình).
    - Số tàu đang khai thác và tàu dự bị theo từng đội tàu, kèm chú thích tình trạng (bảo quản, bảo dưỡng, kiểm tra định kỳ).
    - Chuyến chuyên cơ (VIP A) và chuyến chở yếu nhân (VIP Khác) kèm chức danh; chuyến lưu ý đặc biệt (ví dụ chở hàng tươi sống); danh sách chuyến ferry.
    - Bất thường trong ngày, phân theo loại (kỹ thuật, GTB, thời tiết, nguyên nhân khác) cùng đánh giá sơ bộ nguyên nhân chậm chuyến theo tỷ lệ phần trăm.
  - Phần kế hoạch ngày hôm nay gồm cùng các mục số liệu, LF, tàu bay, VIP, ferry nêu trên nhưng theo kế hoạch ngày hôm đó, và có thêm:
    - Bảng kiểm soát APU/PACK: phân loại tàu theo tình trạng động cơ phụ trợ và điều hòa (APU hỏng phát điện, APU hỏng cấp khí, APU có mùi, APU hỏng hoàn toàn) cùng thiết bị mặt đất cần hỗ trợ (GPU, ASU, ACU).
    - Danh mục sân bay không có xe hỗ trợ tàu hỏng APU (xe khởi động khí, xe làm mát, xe điện), kèm ghi chú thời điểm phát sinh.
    - Danh sách tàu nằm đất và lỗi kỹ thuật ảnh hưởng khai thác (AOG/defect).
    - Lưu ý thời tiết theo bản tin dự báo (TAF) cho từng sân bay trong nước và quốc tế; NOTAM trong nước và quốc tế.
    - Phụ lục kỹ thuật do bộ phận trực kỹ thuật cung cấp (bảng AOG kèm thời gian dự kiến đưa vào khai thác; bảng lệnh công việc đang thực hiện).
  - Thông tin bất thường đến từ nhiều nguồn: khối kỹ thuật, đơn vị dịch vụ và chính trực ban trưởng; mỗi nguồn nhập phần thông tin của mình; nhập dần trong ngày, cuối ngày phát hành.
  - Thông tin yếu nhân tích hợp từ hệ thống nguồn (tên hệ thống cần xác nhận); nếu nguồn không phân biệt được thì người dùng tích chọn từ danh sách.
  - Nội dung bất thường phục vụ cả báo cáo ngày và thống kê dài hạn (ví dụ đánh giá số tàu hỏng trong cao điểm Tết).
  - Lãnh đạo chủ yếu quan tâm trang đầu và phần bất thường; báo cáo phải được phê duyệt trước khi phát hành.
- **VTIT trao đổi:**
  - Đề xuất số hóa toàn bộ BCAO trên hệ thống, dùng chung một màn hình phân quyền theo tab nguồn: tab tổng quan của trực ban trưởng, tab kỹ thuật do khối kỹ thuật nhập, tab dịch vụ do đơn vị dịch vụ nhập.
  - Tổng hợp tự động tối đa từ lịch bay (số chuyến, khách, OTP/OSP, số tàu khai thác và dự bị), chỉ để từng đầu mối nhập phần chuyên môn của mình.
  - Bất thường: người nhập chọn tàu bay → hệ thống liệt kê các chuyến của tàu đó → tích chọn chuyến bị ảnh hưởng, kèm ghi chú chi tiết; hạn chế nhập tự do, ưu tiên chọn từ danh mục nguyên nhân do người dùng tự định nghĩa và bổ sung; hỗ trợ lọc theo khoảng thời gian và sân bay đi/đến.
  - Yếu nhân và chuyên cơ: nhận biết tự động khi nguồn có dữ liệu, phần còn lại tích chọn thủ công.
  - Trình bày trực quan bằng biểu đồ, thay thế tệp Word thủ công.
- **Kết quả:** thống nhất số hóa BCAO theo đúng cấu trúc hiện hành, tổng hợp tự động tối đa, phân quyền theo tab nguồn, có phê duyệt và trình bày trực quan; bất thường nhập đa chiều theo danh mục nguyên nhân, phục vụ cả báo cáo ngày và thống kê dài hạn; yếu nhân và chuyên cơ ưu tiên tự động kèm nhập tay.

### 8. Giám sát dữ liệu và quản lý mục tiêu

- **VNA trao đổi:**
  - Phân biệt nhu cầu xem nhanh hiện trạng và nhu cầu thống kê đánh giá dài hạn.
  - Phần giám sát dữ liệu thực chất là báo cáo về độ phủ và độ chính xác của dữ liệu (ví dụ tỷ lệ chuyến bay có điện văn theo từng đội tàu), nên muốn tách thành màn hình riêng.
  - Cần quản lý mục tiêu các chỉ số (ví dụ mục tiêu 80%); các chỉ số đúng giờ và hiệu quả thực hiện lịch khai thác có tất cả bốn mục tiêu, chia cho hai nhóm chỉ số.
- **VTIT trao đổi:**
  - Đề xuất tách màn giám sát dữ liệu riêng; các chỉ số được tính tự động khi đủ nguồn dữ liệu, gồm dữ liệu sẵn có trên hệ thống và dữ liệu nhập thêm.
- **Kết quả:** thống nhất tách màn giám sát dữ liệu riêng; tính tự động chỉ số và quản lý mục tiêu kèm theo.

### 9. Tham khảo chuẩn quốc tế

- **VTIT trao đổi:**
  - Hỏi hãng có tham khảo các tiêu chuẩn, quy trình quốc tế trong quá trình xây dựng hay không.
- **VNA trao đổi:**
  - Có tham khảo ở mức tổng quan cho một hãng hàng không; quy trình chi tiết tuân thủ theo chuẩn chung.
- **Kết quả:** sử dụng các chuẩn quốc tế để tham khảo và giải thích, không thay thế yêu cầu thực tế của hãng.

## III. Các nội dung đã thống nhất

| # | Nội dung thống nhất |
|---|---|
| 1 | Tách bảo trì danh mục thành menu riêng |
| 2 | Phân quyền theo chức năng; dùng chung một màn hình, ẩn/hiện cột và nút theo quyền |
| 3 | Tải tài liệu hàng loạt theo khu vực riêng, tự gắn theo tên tệp; vẫn giữ tải thủ công |
| 4 | Tài liệu từ hệ thống ngoài lưu tối đa ba ngày rồi xóa |
| 5 | Giám sát dữ liệu là báo cáo độ phủ và độ chính xác, tách màn riêng |
| 6 | Quản lý tàu bay theo hình thức sở hữu và thuê, kèm lịch sử và phân nhóm đội tàu |
| 7 | Số hóa BCAO theo đúng cấu trúc hiện hành (một văn bản, hai phần): màn hình dùng chung phân quyền theo tab nguồn (trực ban trưởng/kỹ thuật/dịch vụ), tổng hợp tự động tối đa, phê duyệt, trình bày trực quan; bất thường nhập đa chiều theo danh mục nguyên nhân, phục vụ báo cáo ngày và thống kê dài hạn; yếu nhân/chuyên cơ ưu tiên tự động kèm nhập tay |
| 8 | Quản lý mục tiêu các chỉ số đúng giờ và hiệu quả lịch khai thác (bốn mục tiêu) |

## IV. Vấn đề cần làm rõ

- Phân biệt tài liệu khi tải hàng loạt theo tên tệp hay theo nội dung.
- Đơn vị nhiên liệu trong điện văn theo từng giai đoạn và từng tàu.
- Nguồn của danh mục dịch vụ sân bay hiện đang quản lý thủ công.
- Danh mục nguyên nhân bất thường trong BCAO: cần làm rõ nghiệp vụ và danh mục tham chiếu trước khi số hóa; bao gồm tên hệ thống nguồn nhận biết yếu nhân và mức độ phân biệt tự động.
- Quản lý tàu bay — Damp Lease: cần xác nhận TOSS có cần theo dõi và báo cáo riêng phần nhiên liệu VNA tự cấp cho tàu thuê ướt kết hợp (Damp Lease) hay không, và nếu có thì thể hiện ở màn hình/báo cáo nào trong phân hệ quản lý tàu bay.
- Danh sách người dự, vai trò và thẩm quyền quyết định.

## V. Kết luận và kế hoạch tiếp theo

Buổi khảo sát đã chốt được khung danh mục chức năng, mô hình phân quyền, nghiệp vụ cân bằng tải và định hướng quản lý tàu bay, sân bay cùng phương án lưu trữ tài liệu. Bước tiếp theo là tổ chức buổi khảo sát chuyên đề về luồng tài liệu và điện văn từ tàu bay, định nghĩa cách phân nhóm đội tàu phục vụ báo cáo, và lập danh mục dịch vụ sân bay.

---

*Báo cáo lập trên cơ sở ghi nhận tại buổi làm việc; một số nội dung kỹ thuật cần đối chiếu lại với người dự họp trước khi sử dụng làm căn cứ chính thức.*
