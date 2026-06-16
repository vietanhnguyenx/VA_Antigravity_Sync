---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.8.1 Event-Driven Architecture – Kafka"
source_pages: "64"
---

# III.8.1 Event-Driven Architecture – Kafka

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.8.1 Event-Driven Architecture – Kafka
- Trang: 64

## Nội dung trích nguyên văn (Verbatim Extract)

Kafka được triển khai như một nền tảng truyền tải dữ liệu theo mô hình hướng sự kiện nhằm tách biệt các thành phần xử lý, giảm phụ thuộc trực tiếp giữa các hệ thống và tăng khả năng xử lý bất đồng bộ. Thay vì các service gọi trực tiếp và đồng bộ tới nhau trong mọi kịch bản, hệ thống sử dụng Kafka để tiếp nhận, lưu trữ và phân phối các sự kiện phát sinh trong quá trình xử lý nghiệp vụ.

Trong các kịch bản tích hợp và xử lý dữ liệu, Kafka được sử dụng theo mô hình publish/subscribe, trong đó service phát sinh dữ liệu đóng vai trò producer và gửi event vào các topic tương ứng. Các service phía sau đóng vai trò consumer, chủ động đọc và xử lý dữ liệu theo nhu cầu. Cách tiếp cận này giúp tách biệt hoàn toàn giữa bên phát sinh và bên xử lý dữ liệu, cho phép hệ thống mở rộng linh hoạt, hấp thụ tải tốt hơn và đảm bảo dữ liệu không bị mất khi lưu lượng tăng cao hoặc khi một thành phần xử lý bị chậm.

**Hình 19. Giải pháp Event-Driven Architecture - Sử dụng Kafka**

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
