---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.5 Giải pháp quản trị danh mục hệ thống"
source_pages: "50-51"
---

# III.5 Giải pháp quản trị danh mục hệ thống

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.5 Giải pháp quản trị danh mục hệ thống
- Trang: 50–51

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 10. Luồng hoạt động module quản trị danh mục**

Hệ thống triển khai module quản trị danh mục như một dịch vụ độc lập, tách biệt với các service nghiệp vụ, cho phép quản lý tập trung toàn bộ danh mục dùng chung. Dữ liệu danh mục được lưu trữ trong một service và schema riêng, với cấu trúc metadata chuẩn, hỗ trợ phân loại theo lĩnh vực, nghiệp vụ và hệ thống sử dụng. Mỗi bản ghi được quản lý theo cơ chế versioning và audit trail, ghi nhận đầy đủ lịch sử thay đổi (người thực hiện, thời điểm, nội dung), đảm bảo khả năng kiểm soát và truy vết.

- ● Về cung cấp dữ liệu, module expose các API chuẩn để các hệ thống truy vấn danh mục theo phân quyền, đồng thời hỗ trợ cơ chế webhook hoặc event-driven để thông báo khi dữ liệu thay đổi. Các hệ thống tích hợp không truy cập trực tiếp vào database mà thông qua lớp dịch vụ này, giúp chuẩn hóa dữ liệu đầu ra và giảm coupling.

- ● Về quản trị, hệ thống cung cấp giao diện và quy trình quản lý danh mục theo vòng đời, bao gồm tạo mới, cập nhật, phê duyệt và phát hành. Dữ liệu chỉ được công bố sau khi hoàn tất kiểm tra hợp lệ, đảm bảo các hệ thống downstream luôn sử dụng dữ liệu đã được kiểm soát.

- ● Về bảo mật, truy cập dữ liệu danh mục được kiểm soát theo cơ chế phân quyền theo hệ thống và theo loại danh mục, kết hợp xác thực và kiểm soát truy cập qua API Gateway. Toàn bộ hoạt động truy cập, thay đổi và đồng bộ dữ liệu được ghi log và giám sát tập trung, phục vụ kiểm toán và phát hiện bất thường.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
