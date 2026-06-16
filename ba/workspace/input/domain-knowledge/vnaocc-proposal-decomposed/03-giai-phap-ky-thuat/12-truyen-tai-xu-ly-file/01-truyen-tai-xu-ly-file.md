---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.12 Giải pháp truyền tải và xử lý file"
source_pages: "79-80"
---

# III.12 Giải pháp truyền tải và xử lý file

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.12 Giải pháp truyền tải và xử lý file
- Trang: 79–80

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 25. Sơ đồ truyền tải file dữ liệu**

Giải pháp được thiết kế theo nguyên tắc tách biệt hoàn toàn giữa luồng điều khiển và luồng dữ liệu, nhằm loại bỏ điểm nghẽn tại lớp ứng dụng và tối ưu hiệu năng truyền tải trong các kịch bản xử lý file dung lượng lớn.

- ● Khi có yêu cầu upload file, Hệ thống sử dụng API Gateway kết hợp với Media Services để thực hiện xác thực, kiểm soát truy cập và khởi tạo phiên upload. Media Services chịu trách nhiệm tạo uploadId, thiết lập phiên multipart upload và sinh presigned URL cho từng phần dữ liệu. Toàn bộ thông tin này được trả về cho client, cho phép client chủ động thực hiện quá trình truyền dữ liệu.

- ● Sau khi khởi tạo phiên upload, luồng dữ liệu được tách khỏi hệ thống backend và truyền trực tiếp từ client tới object storage (MinIO) thông qua các presigned URL. File được chia thành nhiều phần (chunk) và được upload song song theo cơ chế multipart upload. Mỗi phần dữ liệu được truyền độc lập, có thể thực hiện đồng thời trên nhiều kết nối, giúp tận dụng tối đa băng thông mạng và giảm đáng kể thời gian truyền tải.

- ● Cơ chế multipart cho phép hệ thống xử lý hiệu quả các kịch bản lỗi trong quá trình truyền. Khi một phần dữ liệu gặp sự cố, client chỉ cần truyền lại phần đó thay vì toàn bộ file. Điều này giúp tăng độ tin cậy và giảm chi phí truyền lại dữ liệu trong môi trường mạng không ổn định.

- ● Sau khi toàn bộ các phần dữ liệu được upload thành công, client gửi yêu cầu hoàn tất upload tới hệ thống thông qua API Gateway. Media Services tiếp nhận yêu cầu, thực hiện thao tác complete multipart upload với MinIO để hợp nhất các phần dữ liệu thành file hoàn chỉnh, đồng thời cập nhật trạng thái upload và metadata tương ứng trong hệ thống.

Với cách tiếp cận này, hệ thống đạt được ba mục tiêu quan trọng: giảm tải hoàn toàn cho lớp ứng dụng do dữ liệu không đi qua backend, tăng tốc độ truyền nhờ cơ chế chia nhỏ và truyền song song, và đảm bảo độ tin cậy thông qua khả năng retry theo từng phần dữ liệu. Giải pháp đặc biệt phù hợp với các hệ thống cloud-native và môi trường có lưu lượng truyền tải lớn, yêu cầu cao về hiệu năng và khả năng mở rộng.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
