---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.7.5 Kiểm soát truy cập thời gian thực"
source_pages: "62"
---

# III.7.5 Kiểm soát truy cập thời gian thực

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.7.5 Kiểm soát truy cập thời gian thực
- Trang: 62

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 17. Sơ đồ luồng xác thực và kiểm soát truy cập thời gian thực**

- ● Sau khi người dùng đăng nhập, hệ thống cấp JWT Access Token để truy cập các dịch vụ. Tuy nhiên, việc kiểm soát truy cập không phụ thuộc hoàn toàn vào thông tin tĩnh trong token. Tại API Gateway, mỗi request đều được kiểm tra lại theo thời gian thực, bao gồm trạng thái tài khoản (active/disabled), vai trò hiện hành và các chính sách truy cập.

- ● Khi có thay đổi về quyền hoặc trạng thái người dùng (ví dụ: khóa tài khoản, thay đổi role), các request tiếp theo sẽ bị kiểm soát ngay lập tức, kể cả khi token vẫn còn hiệu lực. Cơ chế này đảm bảo loại bỏ độ trễ bảo mật giữa thay đổi quyền và thực thi quyền trong hệ thống.

- ● Đồng thời, hệ thống hỗ trợ cấp quyền có thời hạn (time-bound access), cho phép tự động thu hồi quyền khi hết hiệu lực, đảm bảo kiểm soát chặt chẽ và hạn chế rủi ro trong vận hành.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
