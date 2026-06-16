---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.4.2 Giải pháp cung cấp và tích hợp dữ liệu"
source_pages: "43"
---

# III.4.2 Giải pháp cung cấp và tích hợp dữ liệu

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.4.2 Giải pháp cung cấp và tích hợp dữ liệu
- Trang: 43

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 6. Luồng cung cấp và đồng bộ dữ liệu**

Hệ thống triển khai lớp Data Service Layer nhằm cung cấp dữ liệu nghiệp vụ cho các hệ thống bên ngoài thông qua các giao diện lập trình chuẩn. Mặc dù các luồng truy cập đều được định tuyến qua API Gateway, hệ thống tách biệt rõ ràng giữa các service xử lý nghiệp vụ và các service cung cấp dữ liệu, đảm bảo nguyên tắc separation of concerns trong kiến trúc tổng thể.

Các Data Service được thiết kế tối ưu cho mục tiêu truy xuất và chia sẻ dữ liệu, với logic xử lý tối giản, dữ liệu được chuẩn hóa và kiểm soát truy cập chặt chẽ. Cách tiếp cận này giúp giảm phụ thuộc giữa các hệ thống, hạn chế ảnh hưởng lẫn nhau và tăng khả năng mở rộng trong các kịch bản tích hợp liên hệ thống.

Giải pháp hỗ trợ cả mô hình truy cập đồng bộ thông qua API và bất đồng bộ thông qua cơ chế event-driven, cho phép đáp ứng linh hoạt các nhu cầu tích hợp khác nhau. Toàn bộ luồng truy cập được giám sát, ghi log và kiểm soát, đảm bảo khả năng truy vết và vận hành ổn định trong môi trường phân tán.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
