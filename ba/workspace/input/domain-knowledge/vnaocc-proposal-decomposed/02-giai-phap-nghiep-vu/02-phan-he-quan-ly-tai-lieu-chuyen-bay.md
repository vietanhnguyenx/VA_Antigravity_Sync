---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "II.2 Phân hệ Quản lý tài liệu chuyến bay"
source_pages: "12-15"
---

# II.2 Phân hệ Quản lý tài liệu chuyến bay

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: II.2 Phân hệ Quản lý tài liệu chuyến bay
- Trang: 12–15

## Nội dung trích nguyên văn (Verbatim Extract)

Phân hệ này không chỉ là một kho lưu trữ đơn thuần mà là một hệ thống quản trị quy trình (Workflow) thông minh, giúp số hóa toàn bộ bộ hồ sơ chuyến bay và thiết lập cơ chế xác thực điện tử an toàn.

### ● Quản lý tài liệu OFP, NOTAM, WX, Briefing package

Hệ thống thiết lập quy trình tự động hóa việc thu nạp, bóc tách và hiển thị các tài liệu điều hành bay cốt lõi, đảm bảo phi công và điều phái viên luôn tiếp cận với thông tin mới nhất:

- **Tích hợp và Thu nạp tự động:** Hệ thống tự động đồng bộ Kế hoạch bay (OFP), thông báo hàng không (NOTAM), dữ liệu thời tiết (WX) và gói tài liệu chuyến bay (Briefing Package) từ hệ thống Lido hoặc các nguồn dữ liệu hàng không liên quan gắn với từng chuyến bay.
- **Quản lý đa phiên bản (Versioning) chuyên sâu:** Hệ thống hiển thị trạng thái OFP và cho phép người dùng xem hoặc tải xuống toàn bộ các phiên bản (version) OFP khác nhau đã từng được phát hành. Mỗi phiên bản đều đi kèm lịch sử ban hành chi tiết bao gồm thông tin người tạo, thời gian khởi tạo và các thông số kỹ thuật đi kèm.
- **Hiển thị thông tin điều phái chi tiết:** Trên giao diện quản lý, người dùng có thể xem nhanh các thông tin quan trọng từ OFP như: người thực hiện lập kế hoạch, Payload, Fuel Order, Cơ trưởng (PIC) và các thông số Flight Release liên quan.
- **Briefing Sheet kỹ thuật số tương tác:** Hệ thống tổng hợp và cho phép người dùng trực tiếp nhập ghi chú, chú thích trên Briefing Sheet đối với các hạng mục NOTAM, WX, tình trạng MEL/CDL của tàu bay hoặc các thông báo khai thác đặc thù (Special Ops). Dữ liệu này có cơ chế tự động cập nhật khi có bất kỳ sự thay đổi thông tin nào từ hệ thống nguồn.
- **Kiểm soát Revision và Lưu vết:** Hệ thống thực hiện bóc tách thông tin và kiểm soát số hiệu chỉnh (Revision) của file NOTAM và thời tiết. Mặc định hệ thống hiển thị phiên bản cuối cùng nhưng vẫn duy trì khả năng xem lại nội dung, thời gian upload của tất cả các phiên bản trước đó để phục vụ đối soát.
- **Tính linh hoạt và Khả năng dự phòng:** Hệ thống hỗ trợ đa dạng định dạng file (PDF, DOCX, ảnh, TXT) và cho phép upload thủ công tài liệu cho từng chuyến hoặc nhiều chuyến bay cùng lúc. Đặc biệt, hệ thống cung cấp giao diện và phương thức độc lập để nhân viên điều phái cung cấp tài liệu cho tổ bay trong trường hợp các chức năng tự động gặp sự cố kết nối.

### ● Quản lý tài liệu thương mại và phục vụ (LS, GD, PM, NOTOC, Manifest)

Hệ thống quản lý chặt chẽ luồng phê duyệt các loại tài liệu liên quan đến trọng tải, hành khách và hàng hóa nguy hiểm:

- **Hợp nhất dữ liệu thương mại:** Tự động tích hợp và gắn kết các tài liệu như Load Sheet (LS), Tổng khai báo (GD), Manifest hành khách (PM), NOTOC (hàng hóa đặc biệt), Cargo/Mail Manifest từ các hệ thống PSS/DCS vào từng chuyến bay tương ứng.
- **Bóc tách dữ liệu thông minh:** Hệ thống có chức năng tự động bóc tách và lưu trữ các trường dữ liệu quan trọng từ các file tài liệu được thu nạp, giúp phục vụ công tác tìm kiếm và báo cáo nhanh.
- **Kiểm soát luồng xác thực (Confirmation Workflow):** Theo dõi trạng thái tài liệu theo thời gian thực: Chưa xác nhận (Unconfirmed), Đã xác nhận (Confirmed) hoặc Bị từ chối (Rejected) bởi từng đối tượng. Hệ thống cho phép phân quyền xác nhận một phần hoặc toàn bộ tài liệu tùy theo tính chất nghiệp vụ.
- **Truy vết yêu cầu và Phản hồi:** Hiển thị chi tiết nội dung yêu cầu (Request) kèm theo lý do, thời gian yêu cầu. Người dùng có thể xem lại lịch sử comment, thời gian Confirm/Reject tương ứng với từng phiên bản tài liệu và download trang xác nhận khi cần thiết.
- **Cung cấp tài liệu độc lập:** Tương tự tài liệu điều hành, hệ thống duy trì giao diện độc lập để nhân viên điều phái cung cấp hồ sơ khai thác cho chuyến bay khi các kênh tích hợp tự động không thể truy cập.
- **Hỗ trợ di động toàn diện (Web Mobile):** Hệ thống cung cấp phiên bản Web Mobile tương thích với các hệ điều hành iOS, Android và iPadOS, cho phép phi công và tổ bay quản lý thông tin, xem tài liệu và thực hiện xác nhận điện tử ngay tại hiện trường.

### ● Quản lý tải trọng

Cung cấp các công cụ đối soát dữ liệu trọng tải giữa kế hoạch (OFP) và thực tế khai thác để đảm bảo an toàn bay:

- **Tính toán trọng lượng hành khách & hành lý:** Cho phép người dùng nhập số lượng hành khách theo từng nhóm (Người lớn, Trẻ em, Trẻ sơ sinh) và số lượng hành lý để hệ thống tự động tính toán trọng lượng tương ứng dựa trên cấu hình tham số chuẩn.
- **Quản lý hàng hóa và bưu kiện:** Hỗ trợ nhập trọng lượng hàng hóa và mail ước tính để đưa vào bảng tính tải trọng chuyến bay.
- **Quản lý thiết bị chất xếp (ULD):** Hệ thống cho phép nhập thông tin các loại ULD hành khách (AKE) và hàng hóa (AKE, PMC), sau đó tự động quy đổi và tính toán trọng lượng ước tính tương ứng của các thiết bị này.
- **Tính toán Payload và ZFW ước tính:** Hệ thống tự động tổng hợp tất cả các thành phần (Khách + Hành lý + Hàng + Mail + ULD) để tính toán và hiển thị Payload ước tính cùng trọng lượng không nhiên liệu ước tính (ZFW).
- **Đối soát an toàn với OFP:** Hệ thống hiển thị đồng thời chỉ số trọng lượng khô (DOW) và ZFW từ kế hoạch bay (OFP) để so sánh với các chỉ số thực tế tính toán được. Mọi sai lệch (Delta) giữa ZFW trên OFP và ZFW ước tính thực tế sẽ được hiển thị cảnh báo để người điều hành đưa ra quyết định kịp thời.
- **Cơ chế cập nhật và Lưu trữ lịch sử:** Hệ thống hỗ trợ cơ chế đồng bộ tự động dữ liệu tải trọng song song với việc cho phép nhập thủ công khi cần thiết. Mọi thay đổi trong bảng tính tải trọng đều được ghi nhận vào lịch sử cập nhật chi tiết (ai thay đổi, thời điểm nào) để phục vụ công tác tra cứu và hậu kiểm.

Giải pháp Quản lý tài liệu chuyến bay của TOSS đảm bảo rằng mọi thông tin từ kế hoạch đến thực tế đều được minh bạch hóa, giúp Vietnam Airlines kiểm soát rủi ro và tối ưu hóa năng lực chuyên chở của từng chuyến bay.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
