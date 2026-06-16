---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.3.3 Giải thích lý do lựa chọn"
source_pages: "39"
---

# III.3.3 Giải thích lý do lựa chọn

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.3.3 Giải thích lý do lựa chọn
- Trang: 39

## Nội dung trích nguyên văn (Verbatim Extract)

| Công nghệ | Lý do lựa chọn |
|---|---|
| Kubernetes (K8s) | Công nghệ phổ biến, được sử dụng rộng rãi trên thế giới cũng như tại Viettel. Công nghệ phù hợp với quy mô và nhân sự của dự án. K8s hỗ trợ tự động điều chỉnh quy mô, tự phục hồi khi có lỗi và cập nhật không gây gián đoạn hệ thống (rolling update). |
| CI/CD | Hệ thống được phát triển theo phương pháp Tích hợp liên tục (CI) và Chuyển giao liên tục (CD) tự động. Quy trình này giúp tiết kiệm nhân lực so với làm thủ công, phát hiện lỗi sớm và đảm bảo tiến độ triển khai. |
| LTMG | LTMG (Loki, Tempo, Mimir, Grafana) đảm nhiệm việc thu thập dữ liệu và đưa ra cảnh báo, và trực quan hóa các thông số này thành biểu đồ và dashboard tùy biến để giám sát toàn diện hệ thống |
| Flutter | Framework phát triển ứng dụng di động đa nền tảng, cho phép sử dụng một codebase cho Android và iOS, đảm bảo khả năng tương thích với các hệ điều hành iOS, iPadOS và Android |
| Angular | - Tuân thủ các chuẩn web hiện đại (HTML5, CSS3, ECMAScript), đảm bảo tương thích trên các trình duyệt phổ biến như Microsoft Edge, Google Chrome và Firefox. <br>- Hỗ trợ thiết kế responsive, giúp giao diện hiển thị tốt trên nhiều kích thước màn hình và thiết bị khác nhau (desktop, tablet, mobile). <br>- Cơ chế rendering nhất quán giúp đảm bảo giao diện ổn định trên các môi trường trình duyệt khác nhau. <br>- Được Google duy trì và cập nhật thường xuyên, giúp nhanh chóng tương thích với các phiên bản trình duyệt mới. |
| Keycloak | Giải pháp cho Single Sign-On (SSO) phổ biến, dễ tiếp cận. Hỗ trợ các giao thức bảo mật chuẩn như OIDC và OAuth2 |
| Apache Kafka | Hệ thống message queue rất phổ biến, cho phép truyền tải lượng lớn dữ liệu theo thời gian thực mà không bị mất mát, được áp dụng rộng rãi và có tính đúng đắn cao. |
| WebSocket hoặc SSE | Giao tiếp thời gian thực giữa client và server với độ trễ thấp, được sử dụng cho các chức năng đặc thù như thông báo file phiên bản mới |
| Nginx Gzip Compression | Phương pháp nén dữ liệu tại máy chủ giúp giảm từ 50-80% dung lượng truyền tải, từ đó tiết kiệm băng thông và tăng tốc độ tải tài liệu cho người dùng |

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
