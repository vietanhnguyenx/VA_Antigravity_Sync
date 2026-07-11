---
source_gdrive: "https://docs.google.com/spreadsheets/d/1pL3sWL2b2rWLWkbajPzPAd0d32AiKNeY0Fikly6OwHA"
source_name: "Thông tin tích hợp"
document_type: "Google Sheet → MD (read-only)"
source_version: "77"
source_modified: "2026-06-23T04:08:26.161Z"
last_modifying_user: ""
pulled: "2026-06-23"
status: "Raw pull — chưa biên tập"
---

> **Nguồn (Google Sheet, live):** Thông tin tích hợp — https://drive.google.com/file/d/1pL3sWL2b2rWLWkbajPzPAd0d32AiKNeY0Fikly6OwHA  
> Pull 2026-06-23 (version 77, sửa 2026-06-23T04:08:26.161Z bởi ?).


## Ops++

| Tích hợp dữ liệu NETLINE/OPS++ |  |  |  |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Inbound OPS++ |  |  |  |  |  |  |  |  |  |  | Outbound OPS++ |
| STT | Dữ liệu | Miêu tả | Thời điểm gửi | Phương thức | Nguồn | Ghi chú | Tần suất | Hình thức đồng bộ | Triển khai | Mẫu điện |  |
| 1 | MVT | Điện MVT | Khi có cập nhật | Thông qua TOSS | SITA |  |  | SFTP, Email | TOSS | Đã có |  |
| 2 | MVA | Điện MVA | Khi có cập nhật | Thông qua TOSS | SITA |  |  | SFTP | TOSS | Đã có |  |
| 3 | DIV | Điện Divert | Khi có cập nhật | Thông qua TOSS | SITA |  |  | SFTP, Email | TOSS | Đã có |  |
| 4 | LDM | Điện Load Message (trong loadsheet) | Khi có cập nhật | Thông qua TOSS | SITA |  |  | SFTP, Email | TOSS | Missing |  |
| 5 | FMM | Điện FMM (Fuel Monitoring Message) | Làm rõ | Thông qua TOSS | TOSS | Hiện không có sẵn, nếu muốn sử dụng cần tự động generate | Có phát sinh thì gửi | Tự gen | TOSS | Đã có |  |
| 6 | SSIM | Lịch mùa SSIM | Làm rõ | Thông qua TOSS | Sabre | Forward, không xử lý | Có là gửi | SFTP | TOSS | Missing | OPs++ xuất ra SFTP và quét, gửi về SFTP cho Sabre |
| 7 | PTM | Thông tin khách nối chuyến | Khi có cập nhật | Thông qua TOSS | AMADEUS |  | Gửi về OPs++ Các chuyến 48h tiếp theo, 5p/lần. Có cập nhật thì gửi lại, không có thì không gửi |  | TOSS | Đã có |  |
| 9 | PNL | Danh sách khách Booking | Làm rõ | Thông qua TOSS | AMADEUS |  | Gửi 1 lần duy nhất của 30 ngày trước chuyến bay. |  | TOSS | Đã có |  |
| 8 | ADL | Cập nhật danh sách khách Booking (gửi sau PNL) | Làm rõ | Thông qua TOSS | AMADEUS |  | Gửi tiếp thep mỗi ngày 1 lần |  | TOSS | Đã có |  |
| 11 | Pax Detail | Thông tin khách | Làm rõ | Thông qua TOSS | AMADEUS | Khách thực thế sau cất cánh |  |  | TOSS | Đã có |  |
| 10 | Fuel Report | Điện Fuel report lại sau khi chuyến bay kết thúc | Làm rõ | Thông qua TOSS | TOSS | Hiện không có sẵn, nếu muốn sử dụng cần tự động generate |  |  |  | Đã có |  |
| 12 | Crew Assignment | Thông tin tổ bay | Làm rõ | Thông qua TOSS | AVES | Quét lịch tháng sau vào 02:00 ngày 26 hàng tháng (Đếm trong tháng số lượng chuyến bay có tổ bay <1000 thì sinh cảnh báo về mail), có cơ chế retry vào 23:59 ngày 26.  Quét cập nhật (như amadeus) |  |  | TOSS | Đã có |  |
| 23 | Crew connection | Tổ bay nối chuyến | Làm rõ | Thông qua TOSS | AVES | Pending |  |  | TOSS | Missing |  |
| 13 | Gate info | Thông tin Gate | Làm rõ | Thông qua TOSS | VMS | Gọi API như flight status của VIAGS để lấy gate |  | Service | TOSS | Missing |  |
| 14 | DFLT | Thông tin chuyến bay hàng ngày | - | Trực tiếp | LIDO |  |  |  | Kết nối trực tiếp LIDO - NetOps++ | - |  |
| 15 | Flight data | Thông tin chuyến bay (ACDM) | Làm rõ | Thông qua TOSS | ACDM | Pending |  |  | TOSS | Missing |  |
| 16 | Final MVT | MVT IN | - | Trực tiếp | LIDO |  |  |  | Kết nối trực tiếp LIDO - NetOps++ | - |  |
| 17 | Metar | Metar | - | Trực tiếp | LIDO |  |  |  | Kết nối trực tiếp LIDO - NetOps++ | - |  |
| 18 | NOTAM | NOTAM | - | Trực tiếp - Thông qua TOSS | LIDO | Pending |  |  | Kết nối trực tiếp LIDO - NetOps++ | - |  |
| 19 | OFP | OFP | - | Trực tiếp | LIDO |  |  |  | Kết nối trực tiếp LIDO - NetOps++ | - |  |
| 20 | Ground Event | Lịch Maintenance | - | Trực tiếp | AMOS |  |  |  | Kết nối trực tiếp AMOS - NetOps++ | - |  |
| 21 | MEL Item | MEL/CDL | - | Trực tiếp | AMOS |  |  |  | Kết nối trực tiếp AMOS - NetOps++ | - |  |
| 22 | Cargo | Cargo | Làm rõ | Thông qua TOSS | Cargo Spot | Quét view trên hệ thống cargo Spot | Quét liên tục rules như amadeus | Quét database | TOSS | Missing |  |
| 24 | ATC | ATC FPL | - | Trực tiếp | LIDO | Missing |  |  | Kết nối trực tiếp LIDO - NetOps++ | - |  |
| Outbound |  |  |  |  |  |  |  |  |  |  |  |
| STT | Dữ liệu | Miêu tả | Thời điểm gửi | Phương thức | Đích | Ghi chú |  |  | Triển khai |  |  |
| 1 | Leg Detail AMOS | Lịch bay chuyển AMOS | - | Trực tiếp | AMOS |  |  | Event base, gửi vào SFTP | Kết nối trực tiếp AMOS - NetOps++ | - |  |
| 2 | Leg Detail LIDO | Lịch bay chuyển Lido | - | Trực tiếp | LIDO | Missing |  |  | Kết nối trực tiếp LIDO - NetOps++ | - |  |
| 3 | ASM | Điện ASM | Khi có cập nhật | Thông qua TOSS | SITA | Missing |  |  | TOSS | Đã có |  |
| 4 | ACH | Điện ACH | Khi có cập nhật | Thông qua TOSS | SITA | Missing |  |  | TOSS | Missing |  |
