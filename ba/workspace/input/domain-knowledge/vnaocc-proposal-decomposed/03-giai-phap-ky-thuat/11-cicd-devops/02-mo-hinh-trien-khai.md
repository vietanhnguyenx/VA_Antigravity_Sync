---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.11.2 Deployment strategy"
source_pages: "77-79"
---

# III.11.2 Deployment strategy

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.11.2 Deployment strategy
- Trang: 77–79

## Nội dung trích nguyên văn (Verbatim Extract)

| Git Branch | Môi trường triển khai | Mục đích sử dụng | Cơ chế CI/CD & kiểm soát |
|---|---|---|---|
| dev | DEV (Development) | Phát triển, tích hợp và thử nghiệm nội bộ | CI/CD tự động (build, test, package); deploy tự động qua GitOps |
| test | TEST (SIT / UAT) | Kiểm thử tích hợp, nghiệm thu nghiệp vụ | CI/CD có kiểm soát; yêu cầu phê duyệt trước khi triển khai |
| staging | STAGING | Kiểm tra cuối cùng trước Go-Live | CI/CD có phê duyệt; cấu hình tương đương Production |
| production | PRODUCTION (DC) | Vận hành chính thức | Kiểm soát thay đổi theo ITIL Change Management; phê duyệt bắt buộc |
| hotfix/* | PRODUCTION (DC) | Xử lý sự cố khẩn cấp | Build nhanh → Approval → GitOps Sync; đồng bộ ngược về các nhánh còn lại |

**Hình 23. Chiến lược triển khai CI/CD**

Tất cả thay đổi đều được ghi nhận qua Audit Trail và có rollback script lưu trữ trên Nexus Repository.

**Hình 24. Luồng triển khai và kiểm soát thay đổi hệ thống (CI/CD Pipeline)**

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
