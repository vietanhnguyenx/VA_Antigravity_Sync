---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.10.4 Alerting (Cảnh báo chủ động)"
source_pages: "76"
---

# III.10.4 Alerting (Cảnh báo chủ động)

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.10.4 Alerting (Cảnh báo chủ động)
- Trang: 76

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống thiết lập cơ chế cảnh báo dựa trên các ngưỡng cấu hình, cho phép phát hiện sớm các bất thường và giảm thiểu thời gian xử lý sự cố.

Alert được xây dựng dựa trên metrics và log, bao gồm:
- ● Tài nguyên: CPU, RAM, disk, network vượt ngưỡng
- ● Hiệu năng: latency tăng cao, throughput giảm
- ● Lỗi hệ thống: error rate, exception, HTTP 5xx
- ● Trạng thái dịch vụ: service down, pod restart bất thường, health check fail
- ● Tiến trình job: job fail, execution time vượt baseline, retry bất thường

Cảnh báo được xử lý thông qua AlertManager, cho phép gom nhóm, định tuyến và gửi thông báo theo nhiều kênh (email, Telegram, Discord, hệ thống quản lý sự cố).

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
