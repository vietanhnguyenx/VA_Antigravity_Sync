---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.6.2 Quản lý vòng đời dữ liệu"
source_pages: "52"
---

# III.6.2 Quản lý vòng đời dữ liệu

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.6.2 Quản lý vòng đời dữ liệu
- Trang: 52

## Nội dung trích nguyên văn (Verbatim Extract)

Triển khai cơ chế quản lý vòng đời dữ liệu dựa trên chính sách cấu hình theo từng loại dữ liệu. Mỗi dataset sẽ được định nghĩa rõ ràng về thời gian lưu trữ, phương thức lưu trữ và điều kiện chuyển tầng hoặc loại bỏ.

- ● Cụ thể, dữ liệu mới phát sinh sẽ được lưu tại tầng dữ liệu nóng (hot storage) để phục vụ truy vấn và xử lý, sau một khoảng thời gian sẽ được chuyển sang các tầng lưu trữ chi phí thấp hơn (warm/cold storage). Các cơ chế tự động (scheduler hoặc policy engine) được áp dụng để thực hiện việc chuyển tầng và xóa dữ liệu theo chu kỳ, đảm bảo tối ưu tài nguyên và tuân thủ yêu cầu bảo mật.

- ● Đối với dữ liệu nhạy cảm, chúng tôi áp dụng các chính sách kiểm soát chặt chẽ hơn về lưu trữ và truy cập, đảm bảo dữ liệu được quản lý đúng theo quy định.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
