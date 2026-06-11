---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.8.2 In-Memory Data Grid (IMDG)"
source_pages: "65-66"
---

# III.8.2 In-Memory Data Grid (IMDG)

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.8.2 In-Memory Data Grid (IMDG)
- Trang: 65–66

## Nội dung trích nguyên văn (Verbatim Extract)

Redis được triển khai như một lớp In-Memory Data Grid nhằm tối ưu hiệu năng truy xuất dữ liệu và giảm tải cho các thành phần backend, đặc biệt là cơ sở dữ liệu. Thay vì mọi request đều truy vấn trực tiếp xuống database, hệ thống sử dụng Redis để lưu trữ các dữ liệu truy cập thường xuyên, trạng thái tạm thời và các thông tin phục vụ xử lý nhanh.

- ● Trong các kịch bản truy xuất dữ liệu, Redis được sử dụng theo cơ chế cache-aside, trong đó ứng dụng ưu tiên đọc dữ liệu từ Redis. Khi dữ liệu chưa tồn tại hoặc hết hạn, hệ thống mới truy vấn xuống database và đồng thời cập nhật lại Redis để phục vụ các lần truy cập tiếp theo. Cách tiếp cận này giúp giảm đáng kể số lượng truy vấn database và cải thiện thời gian phản hồi xuống mức millisecond.

**Hình 20. Giải pháp tối ưu hiệu năng sử dụng In-memory cache**

- ● Redis được triển khai theo mô hình cluster/sentinel, cho phép phân mảnh dữ liệu và mở rộng theo chiều ngang khi tải tăng. Nhờ đặc tính xử lý in-memory và khả năng scale linh hoạt, Redis giúp hệ thống duy trì hiệu năng ổn định ngay cả trong các kịch bản tải lớn.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
