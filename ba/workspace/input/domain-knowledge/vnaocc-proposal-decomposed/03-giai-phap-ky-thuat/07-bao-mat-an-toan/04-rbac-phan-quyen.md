---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.7.4 Quản trị người dùng và phân quyền tập trung"
source_pages: "61"
---

# III.7.4 Quản trị người dùng và phân quyền tập trung

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.7.4 Quản trị người dùng và phân quyền tập trung
- Trang: 61

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 16. Giải pháp quản trị người dùng và phân quyền tập trung**

- ● Giải pháp tổ chức toàn bộ quá trình quản trị người dùng theo mô hình tập trung, bao gồm quản lý vòng đời tài khoản, gán vai trò và kiểm soát quyền truy cập trên toàn bộ các phân hệ.

- ● Các vai trò được ánh xạ tới quyền truy cập cụ thể thông qua cơ chế permission mapping, cho phép kiểm soát chi tiết theo từng API và chức năng. Cách tiếp cận này giúp hệ thống dễ dàng mở rộng khi bổ sung phân hệ mới mà không ảnh hưởng đến cấu trúc phân quyền hiện tại.

- ● Đối với các nhóm người dùng có mức độ nhạy cảm cao, hệ thống áp dụng cơ chế xác thực đa yếu tố (MFA) nhằm tăng cường bảo mật ngay từ bước đăng nhập.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
