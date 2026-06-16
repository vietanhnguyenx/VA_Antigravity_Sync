---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.2.1 Mô hình kiến trúc tổng thể (High-level architecture)"
source_pages: "27-29"
---

# III.2.1 Mô hình kiến trúc tổng thể (High-level architecture)

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.2.1 Mô hình kiến trúc tổng thể (High-level architecture)
- Trang: 27–29

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 2. Sơ đồ Kiến trúc tổng thể**

Kiến trúc hệ thống được thiết kế theo mô hình phân lớp, đảm bảo tách biệt rõ ràng giữa các lớp truy cập, xử lý nghiệp vụ, dữ liệu và hạ tầng, qua đó đáp ứng yêu cầu về khả năng mở rộng, tính sẵn sàng và khả năng tích hợp với các hệ thống liên quan. Việc phân tách này cho phép kiểm soát luồng xử lý một cách thống nhất, đồng thời tạo điều kiện triển khai, mở rộng hệ thống theo từng lớp mà không ảnh hưởng đến tổng thể.

- ● Hệ thống được tổ chức với một cơ chế điều phối tập trung đối với toàn bộ các luồng truy cập và tích hợp, bao gồm cả người dùng và các hệ thống bên ngoài. Cách tiếp cận này đáp ứng yêu cầu về kiểm soát truy cập, quản lý kết nối và giảm thiểu phụ thuộc trực tiếp giữa các thành phần, đặc biệt trong bối cảnh hệ thống phải tích hợp với nhiều hệ thống khai thác, hệ thống dùng chung và các hệ thống đối tác. Các luồng tích hợp được thiết kế tách biệt với luồng xử lý nghiệp vụ lõi, đảm bảo việc mở rộng tích hợp không ảnh hưởng đến tính ổn định của hệ thống vận hành.

- ● Lớp ứng dụng được tổ chức theo các miền chức năng nghiệp vụ độc lập, phù hợp với yêu cầu về khả năng mở rộng và bảo trì hệ thống. Mỗi miền chức năng được thiết kế với phạm vi xử lý rõ ràng, cho phép triển khai, nâng cấp và mở rộng theo từng phần, đồng thời hạn chế tối đa ảnh hưởng chéo giữa các thành phần khi có thay đổi.

- ● Đối với lớp dữ liệu, kiến trúc đáp ứng yêu cầu phân tách giữa xử lý giao dịch và khai thác dữ liệu. Dữ liệu phục vụ vận hành được quản lý riêng biệt với dữ liệu phục vụ phân tích và báo cáo, đảm bảo hiệu năng xử lý cho các chức năng nghiệp vụ, đồng thời tạo nền tảng cho các hoạt động khai thác dữ liệu chuyên sâu theo yêu cầu của hệ thống.

- ● Trên cơ sở dữ liệu được tổ chức tập trung và có kiểm soát, kiến trúc cho phép triển khai lớp AI/ML như một thành phần mở rộng nhằm đáp ứng yêu cầu về phân tích nâng cao, dự báo và hỗ trợ ra quyết định. Các chức năng này được thiết kế hoạt động độc lập với luồng xử lý nghiệp vụ chính, đảm bảo không ảnh hưởng đến tính ổn định, đồng thời có thể mở rộng theo nhu cầu trong quá trình khai thác hệ thống.

- ● Lớp hạ tầng được thiết kế theo định hướng linh hoạt, hỗ trợ triển khai trên các môi trường khác nhau và đáp ứng các yêu cầu về tính sẵn sàng, khả năng mở rộng và an toàn thông tin. Kiến trúc hạ tầng đảm bảo hệ thống có thể vận hành ổn định trong điều kiện khai thác liên tục, đồng thời sẵn sàng cho việc mở rộng trong tương lai.

Tổng thể, kiến trúc hệ thống đáp ứng đầy đủ các yêu cầu của hồ sơ mời thầu về khả năng tích hợp, mở rộng, ổn định và hỗ trợ khai thác dữ liệu, đồng thời đảm bảo hệ thống có thể phát triển bền vững trong dài hạn.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
