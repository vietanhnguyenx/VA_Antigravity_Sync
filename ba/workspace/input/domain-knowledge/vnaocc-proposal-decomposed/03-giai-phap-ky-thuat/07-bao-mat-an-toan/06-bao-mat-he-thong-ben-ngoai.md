---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.7.6 Xác thực và phân quyền các hệ thống bên ngoài"
source_pages: "63"
---

# III.7.6 Xác thực và phân quyền các hệ thống bên ngoài

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.7.6 Xác thực và phân quyền các hệ thống bên ngoài
- Trang: 63

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 18. Giải pháp phân quyền cho các hệ thống bên ngoài**

- ● Giải pháp triển khai mô hình kiểm soát truy cập tập trung, trong đó API Gateway là điểm vào duy nhất, còn dịch vụ IAM chịu trách nhiệm xác thực và cấp phát định danh.

- ● Các hệ thống bên ngoài có thể tích hợp linh hoạt thông qua nhiều cơ chế như OAuth2/OpenID Connect (JWT), Client Credentials, API Key, tuy nhiên toàn bộ đều được thực thi thống nhất tại API Gateway. Mọi request đều được kiểm tra xác thực, đối chiếu quyền và áp dụng chính sách trước khi truy cập hệ thống, đảm bảo không tồn tại đường truy cập trực tiếp vào backend.

- ● Quyền truy cập được cấu hình riêng theo từng hệ thống tích hợp, cho phép kiểm soát chi tiết theo phạm vi API và chức năng. Đồng thời, hệ thống hỗ trợ federation với LDAP/Active Directory và cơ chế SSO, đảm bảo đồng bộ định danh và trải nghiệm truy cập liên thông.

- ● Toàn bộ hoạt động truy cập được giám sát và ghi nhận tập trung, kết hợp cơ chế cấp quyền có thời hạn và tự động thu hồi, đảm bảo kiểm soát chặt chẽ và linh hoạt trong các kịch bản tích hợp.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
