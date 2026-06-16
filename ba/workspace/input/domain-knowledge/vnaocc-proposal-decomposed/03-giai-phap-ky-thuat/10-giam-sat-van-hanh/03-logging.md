---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.10.3 Logging tập trung"
source_pages: "75"
---

# III.10.3 Logging tập trung

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.10.3 Logging tập trung
- Trang: 75

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống triển khai cơ chế logging tập trung dựa trên Loki, cho phép thu thập và quản lý log hiệu quả trong môi trường container mà không yêu cầu indexing toàn bộ nội dung log.

Log được thu thập thông qua Promtail từ các thành phần hệ thống, ứng dụng, sau đó được gắn label (service, namespace, pod, traceID) để phục vụ truy vấn theo ngữ cảnh.

Các loại log bao gồm:
- ● Log hệ thống: syslog, auth log, error log
- ● Log ứng dụng: request/response, exception, timeout, error code
- ● Log truy cập: IP, endpoint, user-agent, status code, latency
- ● Log bảo mật: login fail, truy cập bất thường, dấu hiệu tấn công
- ● Correlation log: traceID, requestID

Giải pháp logging giúp phục vụ debug, audit và phân tích hành vi hệ thống một cách hiệu quả.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
