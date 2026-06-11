---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.11.1 Pipeline CI/CD"
source_pages: "76-77"
---

# III.11.1 Pipeline CI/CD

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.11.1 Pipeline CI/CD
- Trang: 76–77

## Nội dung trích nguyên văn (Verbatim Extract)

Container & Config: Các thành phần kubernetes configuration, deployment manifests được quản lý tập trung trên GitLab và đồng bộ tự động qua GitOps. Quy trình triển khai được điều phối bởi ArgoCD, thực hiện auto-sync đến cụm Kubernetes, trong đó External Secrets Operator (ESO) lấy secrets động từ HashiCorp Vault thông qua API. Việc sử dụng GitOps giúp đảm bảo cấu hình luôn nhất quán giữa các môi trường, hỗ trợ khôi phục nhanh (auto re-sync) khi failover và bảo vệ an toàn thông tin nhạy cảm (secrets, key, certificate).

**Hình 22. Sơ đồ luồng tích hợp CI/CD**

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
