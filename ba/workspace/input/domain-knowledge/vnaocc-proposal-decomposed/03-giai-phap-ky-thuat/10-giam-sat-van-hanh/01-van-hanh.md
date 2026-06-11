---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.10.1 Vận hành khai thác hệ thống"
source_pages: "69-75"
---

# III.10.1 Vận hành khai thác hệ thống

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.10.1 Vận hành khai thác hệ thống
- Trang: 69–75

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống được vận hành theo mô hình 24/7/365 với đầu mối tiếp nhận và xử lý yêu cầu tập trung, đảm bảo khả năng phản hồi và hỗ trợ liên tục. Cơ chế giám sát và cảnh báo tự động cho phép phát hiện sớm bất thường về tài nguyên, hiệu năng và trạng thái dịch vụ, giúp duy trì hệ thống hoạt động ổn định và đạt hiệu suất cao.

Các sự cố được quản lý theo quy trình chuẩn, bao gồm tiếp nhận, phân tích, xử lý và theo dõi trạng thái. Hệ thống hỗ trợ truy vết, retry và xử lý bất đồng bộ nhằm hạn chế lan truyền lỗi, đảm bảo tính liên tục của dịch vụ và an toàn dữ liệu trong quá trình vận hành.

### ● Các hoạt động vận hành:

| TT | Nội dung công việc |
|---|---|
| 1 | Quản lý VHKT (O&M) |
| 1.1 | Giám sát và cảnh báo (EM) |
| 1.1.01. | Giám sát cảnh báo down của phần mềm/ứng dụng |
| 1.1.02. | Giám sát cảnh báo liên quan log phần mềm/ứng dụng |
| 1.1.03. | Giám sát cảnh báo tồn Queue của phần mềm/ứng dụng |
| 1.1.04. | Giám sát cảnh báo đầy ổ cứng do phần mềm/ứng dụng |
| 1.1.05. | Giám sát cảnh báo cao tải CPU do phần mềm/ứng dụng |
| 1.1.06. | Giám sát cảnh báo cao tải RAM do phần mềm/ứng dụng |
| 1.1.07. | Giám sát cảnh báo cao tải IO do phần mềm/ứng dụng |
| 1.1.08. | Giám sát cảnh báo hạ tầng máy chủ (Server) ứng dụng |
| 1.1.09. | Giám sát cảnh báo hạ tầng Cơ sở dữ liệu (Database) ứng dụng |
| 1.1.10. | Giám sát cảnh báo hạ tầng lưu trữ (Storage) ứng dụng trên |
| 1.1.11. | Thống kê cảnh báo |
| 1.2. | Xử lý sự cố (IM) |
| 1.2.01. | Restart trên tool theo cảnh báo down của phần mềm/ứng dụng |
| 1.2.02. | Xử lý sự cố theo hướng dẫn đã có |
| 1.3. | Quản lý vấn đề (PrM) |
| 1.3.01. | Đánh giá xu thế sự cố/lỗi |
| 1.3.02. | Đánh giá xu thế vấn đề |
| 1.3.03. | Theo dõi bản tin của đối tác thứ 3 |
| 1.3.04. | Theo dõi bản tin của đối tác |
| 1.3.05. | Tìm kiếm các dấu hiệu vấn đề |
| 1.3.06. | Xác định các nguyên nhân chung |
| 1.3.07. | Xác định các hiện tượng chung |
| 1.3.08. | Kiểm tra các lỗi tiềm ẩn trên các dòng sản phẩm |
| 1.3.09. | Kết nối vấn đề và sự cố/lỗi |
| 1.3.10. | Xác định các mẫu có tính lặp/chu kỳ |
| 1.3.11. | Xác định vấn đề hoặc vấn đề tiềm ẩn |
| 1.3.12. | Đưa ra yêu cầu cho việc giám sát chủ động |
| 1.3.13. | Phân tích kết quả giám sát chủ động |
| 1.3.14. | Phân tích tài liệu RCA/Giải pháp tạm thời/Giải pháp triệt để |
| 1.3.15. | Xin phê duyệt RCA/Giải pháp tạm thời/Giải pháp triệt để |
| 1.3.16. | Yêu cầu thông tin bổ xung hoặc hỗ trợ thêm |
| 1.3.17. | Thông báo kết quả RCA/Giải pháp tạm thời/Giải pháp triệt để |
| 1.3.18. | Tạo ticket vấn đề PT |
| 1.3.19. | Kiểm tra nội dung của PT |
| 1.3.20. | Kiểm tra kết quả phân tích |
| 1.3.21. | Ghi nhận kết luận RCA |
| 1.3.22. | Ghi nhận có giải pháp tạm thời |
| 1.3.23. | Kiểm tra kết quả phê duyệt giải pháp tạm thời |
| 1.3.24. | Lập kế hoạch test giải pháp tạm thời |
| 1.3.25. | Cập nhật giải pháp tìm được |
| 1.3.26. | Xác nhận giải pháp của vấn đề |
| 1.3.27. | Thông báo trạng thái giải pháp của vấn đề đến SDM |
| 1.3.28. | Quyết định lựa chọn giải pháp |
| 1.3.29. | Mở hoặc cập nhật KEDB |
| 1.4. | Quản lý thay đổi (CM) |
| 1.4.01. | Tạo CR trên phần mềm OnePM, điền đầy đủ thông tin yêu cầu |
| 1.4.02. | Phân loại CR và ghi lại các thay đổi chuẩn đang gửi qua luồng CR thường phục vụ thống kê |
| 1.4.03. | Kiểm tra nội dung CR đảm bảo đầy đủ các trường thông tin yêu cầu |
| 1.4.04. | Kiểm tra và xác nhận mức độ ưu tiên của CR, sắp xếp thời gian thực hiện CR cho hợp lý |
| 1.4.05. | Phân tích yêu cầu thay đổi nhận được với các thành viên CAB: <br>+ Điều chỉnh lịch thực hiện thay đổi khi có chồng chéo. <br>+ Yêu cầu các thành viên CAB đánh giá thêm CR (nếu cần) <br>+ Yêu cầu các cuộc họp hội đồng tư vấn CAB đột xuất (nếu cần) để đánh giá các CR cần thực hiện gấp (không thể các cuộc họp CAB định kỳ). <br>+ Đảm bảo sự đồng thuận và thống nhất của tất cả các thành viên trong hội đồng CAB khi từ chối thực hiện 1 thay đổi (nguyên nhân từ chối) |
| 1.4.06. | - Thông báo lịch thực hiện thay đổi tới các thành phần liên quan |
| 1.4.07. | Xác nhận khả năng sẵn sàng thực hiện của đội ngũ thực thi |
| 14.08. | Sau khi thực hiện CR: <br>- Phân tích các báo cáo thực thi và kiểm tra việc thực hiện CR <br>- Khi CR thực hiện không thành công hoặc thực hiện một phần, phân tích xem có cần thiết phải tìm nguyên nhân gốc không? <br>- Tạo WO để cập nhật các thay đổi vào mạng lưới. <br>- Đóng CR |
| 1.4.09. | Phân tích và đảm bảo các bên liên quan đồng ý đưa 1 đầu việc vào danh sách thay đổi chuẩn |
| 1.4.10. | Phân tích và điều chỉnh lịch thực hiện thay đổi khi có chồng chéo |
| 1.4.11. | Đánh giá, xác thực và từ chối CR thường, CR khẩn |
| 1.4.12. | Phân tích và khuyến nghị đưa các đầu việc từ BO gửi sang vào danh sách tác động chuẩn |
| 1.4.13. | Chịu trách nhiệm đồng ý/từ chối yêu cầu gia hạn thời gian thay đổi, triệu tập ECAB, đánh giá khối lượng phạm vi công việc cần thực hiện CR |
| 1.4.14. | Cho phép thực hiện CR căn cứ trên hiện trạng mạng lưới và dịch vụ |
| 1.4.15. | Giám sát cảnh bảo, ảnh hưởng dịch vụ trong quá trình thực hiện thay đổi |
| 1.4.16. | Đảm bảo không còn cảnh báo nào liên quan đến thay đổi sau khi thực hiện xong CR |
| 1.4.17. | Triệu tập thêm các thành viên tư vấn để đánh giá thay đổi khẩn (nếu cần); quyết định cho phép hoặc từ chối thay đổi khẩn khi ECAB không thể tham gia; giải quyết chồng chéo lịch thực hiện CR khẩn |
| 1.4.18. | Phân tích và đưa ra khuyến nghị thêm các đầu việc mà BO gửi sang vào danh sách CR chuẩn |
| 1.4.19. | Đánh giá và đảm bảo CR chuẩn có đầy đủ nội dung, đúng mức độ rủi ro |
| 1.4.20. | Điều chỉnh lịch thực hiện thay đổi chuẩn khi có chồng chéo và thông báo cho các bên liên quan |
| 1.4.21. | Đảm bảo sự sẵn sàng thực hiện CR của đội ngũ thực thi |
| 1.4.22. | Phân tích, kiểm tra các CR chuẩn được thực hiện bởi đội ngũ thực thi |
| 1.4.23. | Đóng CR trên phần mềm đính kèm các thông tin liên quan |
| 1.4.24. | Thực hiện CR sau khi được sự đồng ý, chứng thực của Hội đồng tư vấn |
| 1.4.25. | Trong quá trình thực hiện thường xuyên trao đổi với các bên liên quan đảm bảo CR thực hiện thành công |
| 1.4.26. | Sau khi thực hiện CR chuẩn: <br>- Đưa CR về trạng thái "Đã hoàn thành" và chuẩn bị các báo cáo kết quả thực hiện. <br>- Tạo WO để cập nhật các thay đổi vào mạng lưới. |
| 1.4.27. | Phân tích và đưa ra khuyến nghị thêm các đầu việc mà BO gửi sang vào danh sách CR chuẩn. |
| 1.5. | Quản lý Bảo dưỡng (PvM) |
| 1.5.1. | Bảo dưỡng định kỳ phần cứng và phần mềm theo quy định |
| 1.6. | Khai thác hiện trường (FO) |
| 2 | Quản lý dịch vụ |
| 2.1. | Quản lý yêu cầu dịch vụ - Hỗ trợ kỹ thuật |
| 2.1.1. | Sử dụng hệ thống GNOC để nhập và cập nhật các yêu cầu kỹ thuật (SR) |
| 2.1.2. | Quản lý yêu cầu (SR): <br>- Tiếp nhận và xác nhận yêu cầu trên hệ thống <br>- Đánh giá yêu cầu (mức độ quan trọng, ưu tiên và nỗ lực thực hiện) <br>- Thông báo cho người yêu cầu được tiếp nhận hoặc từ chối qua SMS (cập nhật trạng thái trên phần mềm) <br>- Phối hợp lập kế hoạch thực hiện <br>- Thông báo hoàn thành yêu cầu (SMS) |

### ● Các tiêu chí giám sát:

| STT | Tiêu chí | Mô tả |
|---|---|---|
| **I** | **Server** | |
| 1 | Tình trạng hoạt động server | Tình trạng server (down/up). Network interface down/up hành xử như server down/up |
| 2 | Dung lượng HDD sử dụng | Ngưỡng sử dụng dung lượng HDD |
| 3 | Hiệu suất đọc, ghi HDD | Ngưỡng hiệu suất đọc, ghi HDD |
| 4 | Dung lượng RAM sử dụng | Ngưỡng sử dụng RAM |
| 5 | Dung lượng CPU sử dụng | Ngưỡng sử dụng CPU |
| 6 | Dung lượng swap sử dụng | Ngưỡng sử dụng swap |
| 7 | Số lượng inode sử dụng | Ngưỡng sử dụng inode |
| 8 | User max process | Ngưỡng user max process |
| 9 | User max open file | Ngưỡng user open file |
| **II** | **Database Oracle** | |
| 1 | Tình trạng kết nối | Kết nối tới DB cần giám sát |
| 2 | Instance database down | |
| 3 | Đồng bộ Oracle GG | Thời gian chậm đồng bộ GG giữa DB nguồn và DB đích |
| 4 | Dung lượng tablespace | Ngưỡng dung lượng tablespace sử dụng |
| 5 | Tình trạng hoạt động của instance | Trạng thái instance (down/up) |
| 6 | Số Session đang active trên DB | Ngưỡng số Session đang active trên DB |
| 7 | Số lượng session inactive cho user trên DB | Ngưỡng số Session đang inactive trên DB |
| 8 | Tổng số lượng session trên DB | Ngưỡng tổng session (gồm active và inactive) trên DB |
| 9 | Số lượng file redolog inactive | Số lượng file redolog inactive |
| 10 | Dung lượng thư mục chứa archivelog | Ngưỡng sử dụng dung lượng vùng chứa archivelog |
| 11 | Index table status | Trạng thái index của table (unusable) |
| 12 | Log backup | Trạng thái backup |
| 13 | Đồng bộ dataguard | Quá trình đồng bộ DG giữa DB active và DB Standby |
| 14 | Max open cursor | Max open cursor của user session |
| 15 | Check last Partition | Kiểm tra tình trạng last partition của bảng |
| 16 | Alert log | Code lỗi trong alertlog |
| 17 | Số lượng block session | Ngưỡng session bị block vượt quy định |
| 18 | Trạng thái ASM Diskgroup | Check ASM Diskgroup mount/dismount |
| 19 | Dung lượng ASM diskgroup | Ngưỡng tỉ lệ sử dụng các ASM diskgroup |
| **III** | **Database Mysql/MariaDB** | |
| 1 | Kết nối CSDL MySQL | Tình trạng kết nối tới CSDL |
| 2 | Thời gian đồng bộ LagTime | Thời gian đồng bộ LagTime giữa Master và Slave |
| 3 | Tình trạng Replicate | Tình trạng hoạt động Replicate (Running, Stopped, Error) |
| 4 | Số session Sleep | Tổng số session đang Sleep |
| 5 | Số session Query | Tổng số session đang Query |
| 6 | Số Session | Tổng số session đang kết nối trên CSDL |
| 7 | Backup daily | Tình trạng backup CSDL |
| 8 | Dung lượng vùng DataDir | Dung lượng vùng chứa các datafile |
| 9 | Dung lượng vùng log | Dung lượng vùng chứa bin log |
| 10 | Lỗi trong Log Error | Các mã lỗi trong Log Error |
| 11 | Lỗi trong Slow Query Log | Các câu lệnh chạy lâu trong Slow Query Log |
| 12 | Lock Session | Session đang lock bảng |
| 13 | Tình trạng Partition | Tình trạng đánh Partition của bảng |

### Tiêu chí giám sát ứng dụng

| STT | Tiêu chí | Mô tả |
|---|---|---|
| **I** | **Giám sát Process, Tomcat** | |
| 1 | Up/down process | Process down |
| 2 | Mã lỗi theo log ứng dụng | Log ứng dụng phát sinh các mã lỗi được cấu hình trước |
| 3 | RAM sử dụng của process | Dung lượng RAM sử dụng của process |
| 4 | CPU sử dụng của process | Dung lượng CPU sử dụng của process |
| 5 | Tổng số kết nối tới port của ứng dụng tăng bất thường | Số kết nối đến port ứng dụng cao vượt ngưỡng |
| 6 | Tổng số kết nối tới port của ứng dụng giảm bất thường | Số kết nối đến port ứng dụng thấp vượt ngưỡng |
| 7 | Giám sát link web ứng dụng | Giám sát link web down |
| 8 | Thời gian update log ứng dụng | Không sinh mới log ứng dụng |
| 9 | Dung lượng log file của process tăng bất thường | Dung lượng file log của ứng dụng tăng bất thường |
| 10 | Dung lượng file log vượt ngưỡng cho phép | Dung lượng file log to vượt ngưỡng cho phép |
| **II** | **Giám sát File** | |
| 11 | Số lượng file tồn | Tồn file theo số lượng trong thư mục |
| 12 | Thời gian tồn file trong thư mục | Tồn file theo thời gian trong thư mục |
| 13 | Lâu ko có file mới trong thư mục | Thời gian không có file mới trong thư mục |
| 14 | Số lượng file tăng đột biến | Số lượng file tăng đột biến trong thư mục |
| **III** | **Giám sát Queue, TPS** | |
| 15 | [Cur] Tồn queue table theo thời gian | Tồn bản ghi trong queue table theo thời gian |
| 16 | [Cur] Tồn queue table theo số lượng | Tồn bản ghi trong queue table theo số lượng |
| 17 | [Cur] Table không được cập nhật | Thời gian queue table không phát sinh bản ghi mới |
| 18 | [Cur] Số lượng bản ghi tăng đột biến | Số lượng ban ghi tăng đột biến |
| 19 | [Cur] Trùng bản ghi trong table | Bản ghi trong queue table bị trùng |
| 20 | [His] Table không được cập nhật | không có dữ liệu mới đẩy vào queue his |
| 21 | [His] Trùng bản ghi trong table | bản ghi trong queue his bị trùng dữ liệu |
| 22 | TPS ứng dụng | TPS của ứng dụng vượt ngưỡng (trên/dưới) |
| 23 | Giám sát packet loss | Kết nối giữa các module ứng dụng |

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- Một số ô trong các bảng nguồn có format không nhất quán (ví dụ ô "Instance database down" không có cột Mô tả) — giữ nguyên theo nguồn.
