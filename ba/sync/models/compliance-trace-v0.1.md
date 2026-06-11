---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Mô hình — Truy vết Tuân thủ Quy định"
---

# Ma trận Truy vết Tuân thủ — TOSS

> Map yêu cầu hệ thống TOSS với các điều khoản quy định của CAAV và tiêu chuẩn ICAO/IATA tương ứng.  
> **Mục đích:** Chứng minh TOSS đáp ứng đầy đủ các nghĩa vụ pháp lý, hỗ trợ kiểm toán và certification.

---

## 1. Tài liệu Quy định Tham chiếu

| Mã | Tên | Cơ quan ban hành | Phiên bản áp dụng |
|---|---|---|---|
| CAAV-TT03 | Thông tư 03/2016/TT-BGTVT — Quy định về khai thác hàng không dân dụng | CAAV / Bộ GTVT | 2016 (cập nhật) |
| ICAO-A6 | ICAO Annex 6 — Operation of Aircraft Part I | ICAO | Edition 11 |
| ICAO-A2 | ICAO Annex 2 — Rules of the Air | ICAO | Edition 10 |
| IATA-OCC | IATA OCC Manual | IATA | Phiên bản hiện hành |
| IATA-IGHC | IATA Ground Handling Conference Standards | IATA | Phiên bản hiện hành |

---

## 2. Ma trận Truy vết — Module Khai thác Bay (3.1)

| Yêu cầu TOSS | BR-ID | FR-ID | Quy định tham chiếu | Điều khoản | Ghi chú |
|---|---|---|---|---|---|
| Dispatch Release phải có chữ ký Dispatcher và Cơ trưởng | *(chưa có)* | *(chưa có)* | CAAV-TT03 | Điều 15.3 | Bắt buộc trước khởi hành |
| Lưu trữ Flight Plan tối thiểu 3 tháng | *(chưa có)* | *(chưa có)* | ICAO-A6 | §4.3.1 | Có thể điện tử |
| Cập nhật NOTAM trước mỗi chuyến | *(chưa có)* | *(chưa có)* | ICAO-A6 | §4.2.5 | Dispatcher chịu trách nhiệm |
| OCC phải có khả năng giám sát chuyến bay 24/7 | *(chưa có)* | *(chưa có)* | IATA-OCC | §3.1 | Yêu cầu uptime cao |

---

## 3. Ma trận Truy vết — Module Quản lý Tổ bay (3.2)

| Yêu cầu TOSS | BR-ID | FR-ID | Quy định tham chiếu | Điều khoản | Ghi chú |
|---|---|---|---|---|---|
| Giới hạn FDP (Flight Duty Period) theo từng loại lịch | *(chưa có)* | *(chưa có)* | CAAV-TT03 | Phụ lục FTL | Cứng — không được vượt |
| Thời gian nghỉ tối thiểu giữa các FDP | *(chưa có)* | *(chưa có)* | CAAV-TT03 | Phụ lục FTL | Hệ thống cảnh báo tự động |
| Theo dõi hiệu lực bằng cấp phi hành đoàn | *(chưa có)* | *(chưa có)* | CAAV-TT03 | Điều 12.1 | Cảnh báo 30/60/90 ngày |
| Hồ sơ huấn luyện phi hành đoàn phải lưu trữ 5 năm | *(chưa có)* | *(chưa có)* | ICAO-A6 | §12.4 | Có thể điện tử |

---

## 4. Ma trận Truy vết — Module Bảo dưỡng (3.3)

| Yêu cầu TOSS | BR-ID | FR-ID | Quy định tham chiếu | Điều khoản | Ghi chú |
|---|---|---|---|---|---|
| Theo dõi trạng thái MEL với điều kiện khai thác kèm theo | *(chưa có)* | *(chưa có)* | CAAV-TT03 | Điều 20.5 | MEL phải được CAAV phê duyệt |
| Bản ghi bảo dưỡng phải được lưu tối thiểu 2 năm | *(chưa có)* | *(chưa có)* | ICAO-A6 | §8.7.2 | |
| Airworthiness check trước mỗi chuyến | *(chưa có)* | *(chưa có)* | CAAV-TT03 | Điều 19.1 | Daily Check log trong TOSS |

---

## 5. Ma trận Truy vết — Module An toàn (3.5)

| Yêu cầu TOSS | BR-ID | FR-ID | Quy định tham chiếu | Điều khoản | Ghi chú |
|---|---|---|---|---|---|
| Báo cáo sự cố an toàn bắt buộc trong 72 giờ | *(chưa có)* | *(chưa có)* | CAAV-TT03 | Điều 25.2 | Báo cáo đến CAAV |
| SMS phải có nhật ký kiểm toán không thể chỉnh sửa | *(chưa có)* | *(chưa có)* | ICAO-A6 | §3.1.1 | Immutable audit log |
| Báo cáo an toàn tự nguyện được bảo mật danh tính | *(chưa có)* | *(chưa có)* | CAAV-TT03 | Điều 26 | Anonymization bắt buộc |

---

## 6. Hướng dẫn Điền và Cập nhật

1. **BA Chủ trì phân hệ** điền cột BR-ID và FR-ID khi soạn SRS
2. **Safety/Compliance Officer (SH-07)** xác nhận cột Quy định và Điều khoản
3. **BA Lead** review toàn bộ trước khi promote sang `Approved`
4. Cập nhật mỗi khi:
   - Có BR/FR mới được thêm
   - CAAV/ICAO ban hành quy định mới
   - Có kết quả audit phát sinh yêu cầu mới

---

## 7. Trạng thái Phủ Compliance

| Module | Số yêu cầu quy định | Đã map BR | Đã map FR | % Phủ |
|---|---|---|---|---|
| 3.1 Khai thác Bay | 4 | 0 | 0 | 0% |
| 3.2 Tổ bay | 4 | 0 | 0 | 0% |
| 3.3 Bảo dưỡng | 3 | 0 | 0 | 0% |
| 3.5 An toàn | 3 | 0 | 0 | 0% |
| **Tổng** | **14** | **0** | **0** | **0%** |

> Cột này cập nhật sau khi BRD và SRS hoàn thành. Mục tiêu: 100% yêu cầu quy định đã map.
