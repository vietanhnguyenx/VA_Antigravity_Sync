---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.7.1 Cấu trúc bảo mật"
source_pages: "55-56"
---

# III.7.1 Cấu trúc bảo mật

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.7.1 Cấu trúc bảo mật
- Trang: 55–56

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống TOSS được thiết kế theo mô hình bảo mật nhiều lớp (Defense-in-Depth Architecture), đảm bảo an toàn từ tầng mạng, tầng ứng dụng cho tới tầng dữ liệu.

Cấu trúc bảo mật và giám sát của hệ thống tuân thủ đầy đủ quy định pháp lý của an toàn thông tin cấp độ 3 theo Nghị định 85/2016/NĐ-CP và Thông tư 12/2022/TT-BTTTT.

**Hình 12. Sơ đồ giải pháp bảo mật**

Phương án bảo mật và giám sát không chỉ nhằm ngăn chặn các cuộc tấn công bên ngoài, mà còn kiểm soát, phát hiện và cảnh báo hành vi bất thường từ bên trong, đảm bảo tính toàn vẹn (Integrity), tính sẵn sàng (Availability) và tính bảo mật (Confidentiality) của hệ thống thông tin ngân hàng.

### Định nghĩa các lớp bảo mật:

| Nhóm chức năng | Mục tiêu và mô tả |
|---|---|
| Bảo vệ vật lý | Bảo vệ cơ sở hạ tầng phần cứng, thiết bị, máy chủ – chống truy cập trái phép, chống thiên tai, chống cháy nổ. |
| Bảo vệ mạng | Bảo vệ luồng dữ liệu, kết nối mạng – sử dụng tường lửa, IDS/IPS, phân vùng mạng, kết nối an toàn. |
| Bảo vệ hệ điều hành | Bảo vệ máy chủ, hệ điều hành, các thành phần nền tảng kỹ thuật – cập nhật bảo mật, kiểm soát truy cập, quản lý quyền. |
| Bảo vệ ứng dụng | Bảo vệ phần mềm, dịch vụ ứng dụng – kiểm thử xâm nhập, mã hóa, xác thực, kiểm soát phiên bản. |
| Bảo vệ dữ liệu thông tin | Bao gồm dữ liệu lưu trữ, dữ liệu truyền tải – mã hóa, sao lưu, kiểm soát truy cập dữ liệu, bảo vệ dữ liệu. |

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- Tài liệu nhắc đến "hệ thống thông tin ngân hàng" trong khi đối tượng là hệ thống TOSS của Vietnam Airlines — cần xác nhận đây là lỗi soạn thảo trong tài liệu nguồn hay có ý nghĩa khác.
