---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.9.1 Giải pháp đảm bảo sẵn sàng và vận hành liên tục hệ thống"
source_pages: "66-67"
---

# III.9.1 Giải pháp đảm bảo sẵn sàng và vận hành liên tục hệ thống

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.9.1 Giải pháp đảm bảo sẵn sàng và vận hành liên tục hệ thống
- Trang: 66–67

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 21. Giải pháp đảm bảo tính sẵn sàng của hệ thống**

Hình trên thể hiện tổng thể cơ chế đảm bảo hiệu năng và tính sẵn sàng của hệ thống theo kiến trúc cloud-native, trong đó các thành phần được tổ chức theo hướng phân phối tải, mở rộng linh hoạt và vận hành liên tục.

- ● Về cơ chế đáp ứng biến động tải (Load Adaptation), lưu lượng được tiếp nhận tại lớp Load Balancer và phân phối tới các instance API Gateway khả dụng. API Gateway thực hiện định tuyến và kiểm soát lưu lượng trước khi chuyển request tới các dịch vụ phía sau. Tại lớp xử lý, các request được phân bổ tới các pod còn hoạt động, đồng thời tự động loại bỏ các pod không khả dụng khỏi luồng xử lý, giúp duy trì phân phối tải hiệu quả và tránh quá tải cục bộ.

- ● Về cơ chế mở rộng hệ thống không gián đoạn (Zero Downtime Scaling), hệ thống áp dụng cơ chế auto scaling tại Kubernetes cluster. Khi tải tăng, các pod mới được bổ sung vào cụm xử lý trong khi các pod hiện tại vẫn tiếp tục phục vụ request. Việc mở rộng diễn ra song song và không làm gián đoạn dịch vụ, đảm bảo khả năng đáp ứng liên tục.

- ● Về cơ chế đảm bảo tính sẵn sàng (High Availability), các thành phần được triển khai theo mô hình nhiều instance hoạt động đồng thời. Hệ thống liên tục theo dõi trạng thái các instance và tự động loại bỏ các node không còn khả dụng, đồng thời chuyển hướng request sang các node còn hoạt động. Cách tiếp cận này giúp hệ thống duy trì hoạt động ổn định ngay cả khi một phần thành phần gặp sự cố.

Tổng thể, các cơ chế phân phối tải, mở rộng động và đảm bảo tính sẵn sàng được triển khai đồng bộ tại các lớp của hệ thống, giúp hệ thống thích ứng linh hoạt với biến động tải và duy trì hiệu năng ổn định trong toàn bộ quá trình vận hành.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
