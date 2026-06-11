---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.7.3 Xác thực và phân quyền (IAM)"
source_pages: "60"
---

# III.7.3 Xác thực và phân quyền (IAM)

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.7.3 Xác thực và phân quyền (IAM)
- Trang: 60

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 15. Sơ đồ luồng xác thực và phân quyền**

- ● Hệ thống sử dụng Keycloak làm dịch vụ IAM tập trung, triển khai theo chuẩn OAuth2/OpenID Connect. Người dùng được xác thực tại IAM và được cấp token (JWT) để truy cập hệ thống.

- ● Việc phân quyền được thực hiện theo mô hình kết hợp giữa RBAC và các chính sách truy cập động (ABAC), cho phép kiểm soát truy cập theo cả vai trò và ngữ cảnh như thời gian, IP hoặc trạng thái phiên. Các thông tin này được nhúng trong token và được kiểm tra nhất quán tại API Gateway.

- ● Hệ thống hỗ trợ Single Sign-On (SSO), cho phép người dùng sử dụng một tài khoản duy nhất để truy cập nhiều hệ thống mà không cần đăng nhập lại, đồng thời đảm bảo quản lý tập trung trạng thái xác thực.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
