---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.10.5 Observability (Metrics – Logs – Traces Integration)"
source_pages: "76"
---

# III.10.5 Observability (Metrics – Logs – Traces Integration)

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.10.5 Observability (Metrics – Logs – Traces Integration)
- Trang: 76

## Nội dung trích nguyên văn (Verbatim Extract)

Trên nền tảng các lớp monitoring, logging và alerting, hệ thống triển khai observability toàn diện dựa trên LGTM stack, cho phép liên kết và phân tích dữ liệu theo nhiều chiều.

- ● Metrics: Prometheus / Mimir
- ● Logs: Loki
- ● Traces: Tempo
- ● Các dữ liệu này được tích hợp và hiển thị trên Grafana, cho phép:
- ● Liên kết log với trace thông qua traceID
- ● Phân tích root cause dựa trên correlation giữa metrics – logs – traces
- ● Theo dõi luồng request xuyên suốt giữa các service trong hệ thống phân tán

Đối với các tiến trình batch và đồng bộ dữ liệu, hệ thống tích hợp custom metrics (Prometheus) và ProxySQL/MaxScale để theo dõi replication lag, query execution và trạng thái xử lý dữ liệu.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
