---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.10.2 Monitoring system"
source_pages: "75"
---

# III.10.2 Monitoring system

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.10.2 Monitoring system
- Trang: 75

## Nội dung trích nguyên văn (Verbatim Extract)

Hệ thống triển khai cơ chế giám sát dựa trên Prometheus/Mimir kết hợp Grafana, tập trung vào việc thu thập và phân tích các chỉ số metrics của hạ tầng, nền tảng và ứng dụng.

- ● Prometheus/Mimir thực hiện thu thập metrics theo cơ chế pull thông qua các exporter như Node Exporter, kube-state-metrics và các custom exporter cho ứng dụng và job.

- ● Các nhóm chỉ số giám sát chính bao gồm:
  - Tài nguyên hạ tầng: CPU (per core, load average), memory (RAM, swap), disk (IOPS, latency, dung lượng), network (traffic, packet loss, error rate)
  - Nền tảng Kubernetes: trạng thái pod/container, số lượng replica, restart count, resource allocation
  - Ứng dụng: RPS, latency (P95/P99), error rate, số lượng user đồng thời (CCU/session)

- ● Dữ liệu metrics được lưu trữ mở rộng thông qua Mimir nhằm đáp ứng nhu cầu lưu trữ dài hạn và scale theo chiều ngang. Grafana được sử dụng để xây dựng dashboard phục vụ theo dõi real-time và phân tích xu hướng hệ thống.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
