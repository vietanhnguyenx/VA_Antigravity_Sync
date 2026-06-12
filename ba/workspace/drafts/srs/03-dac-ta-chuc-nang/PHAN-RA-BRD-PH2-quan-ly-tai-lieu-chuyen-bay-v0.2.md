---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-12"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH2"
---

# Phân rã Yêu cầu nghiệp vụ → Yêu cầu chức năng — Phân hệ 2: Quản lý tài liệu chuyến bay (v0.2)

> **Nguồn cha:** `BRD-TOSS-001-khung-v0.2.md` §7.2 (BR-201 … BR-222).
>
> **Ghi chú v0.2 (2026-06-12):** Bổ sung phân rã cho 5 BR mới của BRD v0.2 — BR-218 (Unrelease), BR-219 (Backup khi Lido lỗi — OFP 3 định dạng), BR-220 (Upload Weather Multi-Flight), BR-221 (Sửa thông số OFP trước khi đẩy MO Plus), BR-222 (Cảnh báo "thiếu tài liệu" / "tổ bay chưa tải tài liệu mới"). Thêm FUNC-276 … FUNC-296 (21 FUNC mới). Cập nhật bảng truy vết §2 và danh mục cờ §3. Không thay đổi FUNC-201 … FUNC-275 đã có ở v0.1. BR-213, BR-214 (đã mở rộng mô tả ở BRD v0.2 liên quan version/Unrelease/reset Confirm Release) — phần mở rộng được phân rã dưới các BR mới (BR-218) để tránh trùng lặp FUNC; các FUNC cũ FUNC-252 … FUNC-258 giữ nguyên.
>
> **Nguyên tắc TỐI THƯỢNG (CLAUDE.md §0):** Tài liệu này chỉ **phân rã + lắp ráp trung thực** nội dung đã có trong nguồn (Đề xuất §II.2, Khảo sát 11/06 §II.1–II.3, Khảo sát 09/06 §II.3–II.4). **KHÔNG suy diễn**, không bịa chức năng. Mọi FUNC đều truy vết về BR cha + trích nguồn cụ thể. Nội dung nguồn chưa đủ chi tiết được ghi rõ "(chưa có nguồn — cần SME bổ sung)" hoặc gắn cờ `[cần xác nhận]`.
>
> **Phạm vi mức:** Yêu cầu chức năng (FUNC — Functional Requirement). Chưa bóc xuống Trường hợp sử dụng (Use Case), Câu chuyện người dùng (User Story) hay đặc tả trường dữ liệu — các nội dung này thuộc các tài liệu SRS/FRD kế tiếp.
>
> **Quy ước mã:** `FUNC-2xx-yy` — `2xx` là BR cha (theo §7.2), `yy` là số thứ tự FUNC con trong BR đó. Mã FUNC tổng (cấp phân hệ 2) tăng tuần tự bắt đầu từ FUNC-201.

## Mục lục

1. [Bảng phân rã BR → FUNC](#1-bảng-phân-rã-br--func)
2. [Bảng truy vết BR ↔ FUNC (tóm tắt)](#2-bảng-truy-vết-br--func-tóm-tắt)
3. [Danh sách "(chưa có nguồn)" / cờ `[cần xác nhận]`](#3-danh-sách-chưa-có-nguồn--cờ-cần-xác-nhận)

---

## 1. Bảng phân rã BR → FUNC

### 1.1 BR-201 — Tự động đồng bộ OFP, NOTAM, WX, Briefing Package từ Lido

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-201 | Thu nạp tự động Kế hoạch bay (OFP — Operational Flight Plan) từ hệ thống Lido và gắn với từng chuyến bay tương ứng. | BR-201 | Đề xuất §II.2 — "Tích hợp và Thu nạp tự động" |
| FUNC-202 | Thu nạp tự động Thông báo hàng không (NOTAM) từ Lido hoặc nguồn dữ liệu hàng không liên quan, gắn với từng chuyến bay. | BR-201 | Đề xuất §II.2 — "Tích hợp và Thu nạp tự động" |
| FUNC-203 | Thu nạp tự động dữ liệu thời tiết (WX) từ Lido hoặc nguồn dữ liệu hàng không liên quan, gắn với từng chuyến bay. | BR-201 | Đề xuất §II.2 — "Tích hợp và Thu nạp tự động" |
| FUNC-204 | Thu nạp tự động gói tài liệu chuyến bay (Briefing Package) từ Lido hoặc nguồn dữ liệu hàng không liên quan, gắn với từng chuyến bay. | BR-201 | Đề xuất §II.2 — "Tích hợp và Thu nạp tự động" |

### 1.2 BR-202 — Quản lý đa phiên bản (Versioning) OFP

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-205 | Hiển thị trạng thái OFP của từng chuyến bay. | BR-202 | Đề xuất §II.2 — "Quản lý đa phiên bản (Versioning) chuyên sâu" |
| FUNC-206 | Hiển thị danh sách toàn bộ các phiên bản OFP đã từng được phát hành cho một chuyến bay. | BR-202 | Đề xuất §II.2 — "Quản lý đa phiên bản (Versioning) chuyên sâu" |
| FUNC-207 | Cho phép người dùng xem hoặc tải xuống bất kỳ phiên bản OFP nào đã được phát hành. | BR-202 | Đề xuất §II.2 — "Quản lý đa phiên bản (Versioning) chuyên sâu" |
| FUNC-208 | Hiển thị lịch sử ban hành mỗi phiên bản OFP gồm: người tạo, thời gian khởi tạo, các thông số kỹ thuật đi kèm. | BR-202 | Đề xuất §II.2 — "Quản lý đa phiên bản (Versioning) chuyên sâu" |

### 1.3 BR-203 — Hiển thị nhanh thông tin điều phái chi tiết từ OFP

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-209 | Trên giao diện quản lý OFP, hiển thị nhanh thông tin người thực hiện lập kế hoạch (Flight Planner). | BR-203 | Đề xuất §II.2 — "Hiển thị thông tin điều phái chi tiết" |
| FUNC-210 | Hiển thị nhanh thông tin Payload từ OFP. | BR-203 | Đề xuất §II.2 — "Hiển thị thông tin điều phái chi tiết" |
| FUNC-211 | Hiển thị nhanh thông tin Fuel Order từ OFP. | BR-203 | Đề xuất §II.2 — "Hiển thị thông tin điều phái chi tiết" |
| FUNC-212 | Hiển thị nhanh thông tin Cơ trưởng (PIC — Pilot-in-Command) từ OFP. | BR-203 | Đề xuất §II.2 — "Hiển thị thông tin điều phái chi tiết" |
| FUNC-213 | Hiển thị nhanh các thông số Flight Release liên quan từ OFP. | BR-203 | Đề xuất §II.2 — "Hiển thị thông tin điều phái chi tiết" |

### 1.4 BR-204 — Briefing Sheet kỹ thuật số tương tác

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-214 | Tổng hợp và hiển thị Briefing Sheet kỹ thuật số tương tác cho từng chuyến bay. | BR-204 | Đề xuất §II.2 — "Briefing Sheet kỹ thuật số tương tác" |
| FUNC-215 | Cho phép người dùng nhập ghi chú / chú thích trực tiếp trên Briefing Sheet đối với hạng mục NOTAM. | BR-204 | Đề xuất §II.2 — "Briefing Sheet kỹ thuật số tương tác" |
| FUNC-216 | Cho phép người dùng nhập ghi chú / chú thích trực tiếp trên Briefing Sheet đối với hạng mục WX. | BR-204 | Đề xuất §II.2 — "Briefing Sheet kỹ thuật số tương tác" |
| FUNC-217 | Cho phép người dùng nhập ghi chú / chú thích trực tiếp trên Briefing Sheet đối với tình trạng MEL/CDL của tàu bay. | BR-204 | Đề xuất §II.2 — "Briefing Sheet kỹ thuật số tương tác" |
| FUNC-218 | Cho phép người dùng nhập ghi chú / chú thích trực tiếp trên Briefing Sheet đối với các thông báo khai thác đặc thù (Special Ops). | BR-204 | Đề xuất §II.2 — "Briefing Sheet kỹ thuật số tương tác" |
| FUNC-219 | Tự động cập nhật nội dung Briefing Sheet khi có thay đổi thông tin từ hệ thống nguồn. | BR-204 | Đề xuất §II.2 — "Briefing Sheet kỹ thuật số tương tác" |

### 1.5 BR-205 — Kiểm soát Revision và lưu vết NOTAM, WX

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-220 | Bóc tách thông tin và ghi nhận số hiệu chỉnh (Revision) của file NOTAM. | BR-205 | Đề xuất §II.2 — "Kiểm soát Revision và Lưu vết" |
| FUNC-221 | Bóc tách thông tin và ghi nhận số hiệu chỉnh (Revision) của file thời tiết (WX). | BR-205 | Đề xuất §II.2 — "Kiểm soát Revision và Lưu vết" |
| FUNC-222 | Mặc định hiển thị phiên bản cuối cùng của NOTAM và WX. | BR-205 | Đề xuất §II.2 — "Kiểm soát Revision và Lưu vết" |
| FUNC-223 | Cho phép xem lại nội dung và thời gian upload của tất cả các phiên bản NOTAM, WX trước đó để phục vụ đối soát. | BR-205 | Đề xuất §II.2 — "Kiểm soát Revision và Lưu vết" |

### 1.6 BR-206 — Đa định dạng file, upload thủ công, giao diện độc lập khi mất kết nối

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-224 | Hỗ trợ upload tài liệu theo các định dạng: PDF, DOCX, ảnh, TXT. | BR-206 | Đề xuất §II.2 — "Tính linh hoạt và Khả năng dự phòng" |
| FUNC-225 | Cho phép upload thủ công tài liệu cho một chuyến bay đơn lẻ. | BR-206 | Đề xuất §II.2 — "Tính linh hoạt và Khả năng dự phòng" |
| FUNC-226 | Cho phép upload thủ công tài liệu cho nhiều chuyến bay cùng lúc. | BR-206 | Đề xuất §II.2 — "Tính linh hoạt và Khả năng dự phòng" |
| FUNC-227 | Cung cấp giao diện độc lập (phương thức dự phòng) để nhân viên điều phái cấp tài liệu cho tổ bay khi chức năng tích hợp tự động gặp sự cố kết nối. | BR-206 | Đề xuất §II.2 — "Tính linh hoạt và Khả năng dự phòng" |

### 1.7 BR-207 — Hợp nhất và bóc tách LS, GD, PM, NOTOC, Cargo/Mail Manifest từ PSS/DCS

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-228 | Tự động tích hợp và gắn kết Load Sheet (LS) từ PSS/DCS vào từng chuyến bay tương ứng. | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại" |
| FUNC-229 | Tự động tích hợp và gắn kết Tổng khai báo (GD — General Declaration) từ PSS/DCS vào từng chuyến bay tương ứng. | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại" |
| FUNC-230 | Tự động tích hợp và gắn kết Manifest hành khách (PM — Passenger Manifest) từ PSS/DCS vào từng chuyến bay tương ứng. | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại" |
| FUNC-231 | Tự động tích hợp và gắn kết NOTOC (Notification to Captain — hàng hóa đặc biệt) từ PSS/DCS vào từng chuyến bay tương ứng. | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại" |
| FUNC-232 | Tự động tích hợp và gắn kết Cargo/Mail Manifest từ PSS/DCS vào từng chuyến bay tương ứng. | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại" |
| FUNC-233 | Tự động bóc tách và lưu trữ các trường dữ liệu quan trọng từ các file tài liệu thương mại được thu nạp, phục vụ tìm kiếm và báo cáo nhanh. | BR-207 | Đề xuất §II.2 — "Bóc tách dữ liệu thông minh" |

### 1.8 BR-208 — Luồng xác thực tài liệu (Confirmation Workflow)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-234 | Theo dõi trạng thái tài liệu theo thời gian thực với ba trạng thái: Chưa xác nhận (Unconfirmed), Đã xác nhận (Confirmed), Bị từ chối (Rejected). | BR-208 | Đề xuất §II.2 — "Kiểm soát luồng xác thực (Confirmation Workflow)" |
| FUNC-235 | Quản lý trạng thái xác thực tài liệu theo từng đối tượng (chủ thể) liên quan đến tài liệu đó. | BR-208 | Đề xuất §II.2 — "Kiểm soát luồng xác thực (Confirmation Workflow)" |
| FUNC-236 | Cho phép phân quyền xác nhận một phần hoặc toàn bộ tài liệu tùy theo tính chất nghiệp vụ. | BR-208 | Đề xuất §II.2 — "Kiểm soát luồng xác thực (Confirmation Workflow)" |

### 1.9 BR-209 — Truy vết Request — Confirm/Reject

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-237 | Hiển thị chi tiết nội dung yêu cầu (Request) kèm theo lý do và thời gian yêu cầu. | BR-209 | Đề xuất §II.2 — "Truy vết yêu cầu và Phản hồi" |
| FUNC-238 | Hiển thị lịch sử comment kèm thời gian Confirm / Reject tương ứng với từng phiên bản tài liệu. | BR-209 | Đề xuất §II.2 — "Truy vết yêu cầu và Phản hồi" |
| FUNC-239 | Cho phép người dùng tải xuống (download) trang xác nhận tài liệu. | BR-209 | Đề xuất §II.2 — "Truy vết yêu cầu và Phản hồi" |

### 1.10 BR-210 — Web Mobile cho phi công và tổ bay (iOS/Android/iPadOS)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-240 | Cung cấp phiên bản Web Mobile tương thích với hệ điều hành iOS. | BR-210 | Đề xuất §II.2 — "Hỗ trợ di động toàn diện (Web Mobile)" |
| FUNC-241 | Cung cấp phiên bản Web Mobile tương thích với hệ điều hành Android. | BR-210 | Đề xuất §II.2 — "Hỗ trợ di động toàn diện (Web Mobile)" |
| FUNC-242 | Cung cấp phiên bản Web Mobile tương thích với hệ điều hành iPadOS. | BR-210 | Đề xuất §II.2 — "Hỗ trợ di động toàn diện (Web Mobile)" |
| FUNC-243 | Trên Web Mobile, cho phép phi công và tổ bay quản lý thông tin chuyến bay tại hiện trường. | BR-210 | Đề xuất §II.2 — "Hỗ trợ di động toàn diện (Web Mobile)" |
| FUNC-244 | Trên Web Mobile, cho phép phi công và tổ bay xem tài liệu chuyến bay tại hiện trường. | BR-210 | Đề xuất §II.2 — "Hỗ trợ di động toàn diện (Web Mobile)" |
| FUNC-245 | Trên Web Mobile, cho phép phi công và tổ bay thực hiện xác nhận điện tử (Electronic Confirmation) tại hiện trường. | BR-210 | Đề xuất §II.2 — "Hỗ trợ di động toàn diện (Web Mobile)" |

### 1.11 BR-211 — Tải tài liệu hàng loạt theo khu vực riêng, tự gắn theo tên tệp

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-246 | Cung cấp khu vực riêng trên giao diện cho thao tác tải tài liệu hàng loạt. | BR-211 | Khảo sát 09/06 §II.3 |
| FUNC-247 | Tự động gắn tài liệu được tải hàng loạt vào đúng chuyến bay dựa trên quy ước đặt tên tệp. *(Quy ước đặt tên cụ thể: chưa có nguồn — cần SME bổ sung)* | BR-211 | Khảo sát 09/06 §II.3 |
| FUNC-248 | Duy trì chức năng tải thủ công từng tài liệu song song với tải hàng loạt. | BR-211 | Khảo sát 09/06 §II.3 |

### 1.12 BR-212 — Nguyên tắc lưu trữ tài liệu (sinh trong TOSS vs từ hệ thống ngoài)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-249 | Lưu trữ trong TOSS các tài liệu do chính TOSS sinh ra. | BR-212 | Khảo sát 09/06 §II.4 |
| FUNC-250 | Đối với tài liệu từ hệ thống ngoài: chỉ kéo về (cache) khi người dùng tải xuống. | BR-212 | Khảo sát 09/06 §II.4 |
| FUNC-251 | Đối với tài liệu từ hệ thống ngoài đã kéo về: lưu tối đa 3 ngày sau khi chuyến bay hạ cánh, sau đó tự động xóa. | BR-212 | Khảo sát 09/06 §II.4 |

### 1.13 BR-213 — Chức năng Dispatch Release trên TOSS

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-252 | Cung cấp thao tác chủ động "Dispatch Release" cho điều phái viên (Dispatcher) trên TOSS. | BR-213 | Khảo sát 11/06 §II.1 |
| FUNC-253 | Khi điều phái thực hiện Dispatch Release, gắn trạng thái "đã Dispatch Release" cho phiên bản OFP tương ứng. | BR-213 | Khảo sát 11/06 §II.1 |
| FUNC-254 | Không chặn việc Lido tiếp tục tự sinh OFP và tự đẩy lên MO Plus như hiện hành; trạng thái "đã Dispatch Release" chỉ đóng vai trò tín hiệu nhận biết bản OFP chính thức. | BR-213 | Khảo sát 11/06 §II.1 |
| FUNC-255 | Cho phép phân biệt rõ ràng (hiển thị dấu hiệu) giữa các phiên bản OFP đã được Dispatch Release và các phiên bản OFP do hệ thống tự sinh do thay đổi tải/dầu. | BR-213 | Khảo sát 11/06 §II.1 |

### 1.14 BR-214 — Đồng bộ trạng thái Dispatch Release sang MO Plus

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-256 | Đồng bộ (phát hành) trạng thái "đã Dispatch Release" từ TOSS sang MO Plus để MO Plus tiêu thụ trạng thái này. *(Phạm vi giao diện cụ thể giữa TOSS — MO Plus cần làm rõ)* | BR-214 | Khảo sát 11/06 §II.2 |
| FUNC-257 | Khi chưa có Dispatch Release trên TOSS, MO Plus sử dụng tín hiệu trạng thái để chặn thao tác Captain's Release của phi công. *(Việc thực thi chặn diễn ra trên MO Plus; phạm vi sửa MO Plus nằm ngoài TOSS, cần làm rõ trong buổi làm việc tiếp theo)* | BR-214 | Khảo sát 11/06 §II.2 |
| FUNC-258 | MO Plus hiển thị thông báo "Dispatch chưa Release" cho phi công khi chưa có Dispatch Release tương ứng. *(Việc hiển thị diễn ra trên MO Plus; phạm vi sửa MO Plus nằm ngoài TOSS, cần làm rõ)* | BR-214 | Khảo sát 11/06 §II.2 |

### 1.15 BR-215 — Ghi nhận lịch sử làm lại OFP sát giờ

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-259 | Ghi nhận lịch sử các lần làm lại OFP sát giờ khởi hành (dưới 60 phút trước STD đối với chuyến nội địa). | BR-215 | Khảo sát 11/06 §II.3 |
| FUNC-260 | Cho phép gắn lý do "tổ bay yêu cầu" cho lần làm lại OFP sát giờ, phục vụ truy vết. | BR-215 | Khảo sát 11/06 §II.3 |
| FUNC-261 | Không tự động hóa quyết định làm lại OFP trong tình huống sát giờ; quyết định vẫn do điều phái viên thực hiện thủ công. | BR-215 | Khảo sát 11/06 §II.3 |

### 1.16 BR-216 — Quản lý tải trọng

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-262 | Cho phép người dùng nhập số lượng hành khách theo từng nhóm: Người lớn (Adult), Trẻ em (Child), Trẻ sơ sinh (Infant). | BR-216 | Đề xuất §II.2 — "Tính toán trọng lượng hành khách & hành lý" |
| FUNC-263 | Cho phép người dùng nhập số lượng hành lý. | BR-216 | Đề xuất §II.2 — "Tính toán trọng lượng hành khách & hành lý" |
| FUNC-264 | Tự động tính toán trọng lượng hành khách và hành lý dựa trên cấu hình tham số chuẩn. | BR-216 | Đề xuất §II.2 — "Tính toán trọng lượng hành khách & hành lý" |
| FUNC-265 | Cho phép nhập trọng lượng hàng hóa và mail ước tính, đưa vào bảng tính tải trọng chuyến bay. | BR-216 | Đề xuất §II.2 — "Quản lý hàng hóa và bưu kiện" |
| FUNC-266 | Cho phép nhập thông tin các loại ULD hành khách (AKE) và ULD hàng hóa (AKE, PMC). | BR-216 | Đề xuất §II.2 — "Quản lý thiết bị chất xếp (ULD)" |
| FUNC-267 | Tự động quy đổi và tính toán trọng lượng ước tính tương ứng của các thiết bị ULD đã nhập. | BR-216 | Đề xuất §II.2 — "Quản lý thiết bị chất xếp (ULD)" |
| FUNC-268 | Tự động tổng hợp toàn bộ các thành phần (Khách + Hành lý + Hàng + Mail + ULD) để tính Payload ước tính. | BR-216 | Đề xuất §II.2 — "Tính toán Payload và ZFW ước tính" |
| FUNC-269 | Tự động tổng hợp các thành phần để tính trọng lượng không nhiên liệu ước tính (ZFW — Zero Fuel Weight). | BR-216 | Đề xuất §II.2 — "Tính toán Payload và ZFW ước tính" |

### 1.17 BR-217 — Đối soát an toàn ZFW

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-270 | Hiển thị đồng thời chỉ số trọng lượng khô (DOW — Dry Operating Weight) từ kế hoạch bay (OFP). | BR-217 | Đề xuất §II.2 — "Đối soát an toàn với OFP" |
| FUNC-271 | Hiển thị đồng thời chỉ số ZFW từ kế hoạch bay (OFP) để so sánh với ZFW thực tế tính toán được. | BR-217 | Đề xuất §II.2 — "Đối soát an toàn với OFP" |
| FUNC-272 | Tự động so sánh ZFW trên OFP với ZFW ước tính thực tế và tính Delta. | BR-217 | Đề xuất §II.2 — "Đối soát an toàn với OFP" |
| FUNC-273 | Hiển thị cảnh báo khi có sai lệch (Delta) giữa ZFW trên OFP và ZFW ước tính thực tế. *(Ngưỡng Delta cụ thể: chưa có nguồn — cần SME bổ sung)* | BR-217 | Đề xuất §II.2 — "Đối soát an toàn với OFP" |
| FUNC-274 | Hỗ trợ đồng bộ tự động dữ liệu tải trọng song song với việc cho phép nhập thủ công khi cần thiết. | BR-217 | Đề xuất §II.2 — "Cơ chế cập nhật và Lưu trữ lịch sử" |
| FUNC-275 | Ghi nhận lịch sử cập nhật chi tiết mọi thay đổi trong bảng tính tải trọng (người thay đổi, thời điểm thay đổi). | BR-217 | Đề xuất §II.2 — "Cơ chế cập nhật và Lưu trữ lịch sử" |

### 1.18 BR-218 — Chức năng Unrelease (đối xứng với Dispatch Release) và quay lui phiên bản OFP

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-276 | Cung cấp thao tác chủ động "Unrelease" trên TOSS — cặp đối xứng với "Dispatch Release" — cho điều phái viên (Dispatcher) thực hiện trên phiên bản OFP hiện đang ở trạng thái "đã Dispatch Release". | BR-218 | Khảo sát 11/06 chiều §II.4; §II.8 |
| FUNC-277 | Khi điều phái viên bấm Unrelease, TOSS hiển thị danh sách lịch sử các phiên bản OFP của cùng chuyến bay (đã nhận từ Lido qua adapter hoặc từ luồng MO Plus) để điều phái chọn phiên bản cũ muốn quay về. | BR-218 | Khảo sát 11/06 chiều §II.4 |
| FUNC-278 | Sau khi điều phái chọn phiên bản cũ, TOSS sinh một revision/version mới với nội dung của phiên bản cũ và đẩy sang MO Plus dưới dạng phiên bản mới hơn (do MO Plus áp dụng quy ước "luôn lấy bản mới nhất theo tên file" — latest by filename). | BR-218 | Khảo sát 11/06 chiều §II.4 |
| FUNC-279 | Việc đẩy revision mới từ TOSS sang MO Plus kích hoạt MO Plus reset trạng thái Confirm Release của phi công về 0; phi công phải Confirm lại trên phiên bản mới. *(Việc reset diễn ra trên MO Plus; phạm vi sửa MO Plus nằm ngoài TOSS, cần làm rõ với chủ sở hữu MO Plus)* | BR-218 | Khảo sát 11/06 chiều §II.4 |
| FUNC-280 | Trong toàn bộ luồng Unrelease, điều phái viên và phi công đều không phải đăng nhập Lido để thao tác lại; toàn bộ xử lý diễn ra trên TOSS và đồng bộ sang MO Plus. | BR-218 | Khảo sát 11/06 chiều §II.4 |
| FUNC-281 | Áp dụng quy ước gán số phiên bản cho phiên bản sinh ra sau thao tác Unrelease (vd "2.1" sub-version hoặc auto-tăng "v4" với nội dung của v2). *(Quy ước cụ thể: `[cần xác nhận]` — Khảo sát 11/06 chiều §II.4 nêu hai lựa chọn, chưa chốt)* | BR-218 | Khảo sát 11/06 chiều §II.4 |
| FUNC-282 | Trên module Flight Dispatch của TOSS, ghi nhận Unrelease là một trong ba chức năng cốt lõi của module (cùng với "đẩy OFP lên" và "Dispatch Release"). | BR-218 | Khảo sát 11/06 chiều §II.8 |

### 1.19 BR-219 — Backup khi adapter Lido lỗi; đẩy OFP đủ 3 định dạng (PDF / TXT / HTML) sang MO Plus

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-283 | Cung cấp chức năng dự phòng (backup) cho phép điều phái viên download file raw OFP của một chuyến tương tự đang có trên TOSS để dùng làm template khi adapter Lido lỗi. | BR-219 | Khảo sát 11/06 chiều §II.4; §II.13 |
| FUNC-284 | Cho phép điều phái viên upload thủ công lên TOSS các file OFP raw đã được điều chỉnh (sửa các thông số chính như giờ, dầu mỡ, ADC `[cần xác nhận viết tắt]`, Flight Level) làm phiên bản OFP của chuyến đang khai thác. | BR-219 | Khảo sát 11/06 chiều §II.4; §II.13 |
| FUNC-285 | TOSS phải đẩy đủ ba định dạng OFP (PDF, TXT, HTML) sang MO Plus theo đúng quy tắc bốc tách: TXT dùng để bốc tách NOTAM/giờ; HTML dùng để bốc tách group/section; PDF dùng để hiển thị + lưu trữ. | BR-219 | Khảo sát 11/06 chiều §II.13 |
| FUNC-286 | Trong tình huống dùng backup, vẫn duy trì luồng version OFP của TOSS — phiên bản upload thủ công được gán version theo thứ tự nhận (như các phiên bản nhận từ adapter Lido) để bảo đảm luồng Release/Unrelease (BR-213, BR-218) hoạt động bình thường. | BR-219 | Khảo sát 11/06 chiều §II.4 |

### 1.20 BR-220 — Upload tài liệu thời tiết áp nhiều chuyến (Weather Multi-Flight)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-287 | Cung cấp chức năng upload tài liệu thời tiết áp nhiều chuyến (Weather Multi-Flight): người dùng chọn khoảng thời gian hiệu lực (từ giờ X tới giờ Y, thường khoảng 3 tiếng) và upload file thời tiết khu vực/đường bay. | BR-220 | Khảo sát 11/06 chiều §II.9 |
| FUNC-288 | TOSS tự động gắn file Weather Multi-Flight vào toàn bộ các chuyến bay có ETD (Estimated Time of Departure) nằm trong khoảng thời gian hiệu lực đã chọn. | BR-220 | Khảo sát 11/06 chiều §II.9 |
| FUNC-289 | Duy trì song song luồng upload file thời tiết riêng cho từng chuyến (luồng riêng — thay cơ chế attach hiện hành ở FME `[cần xác nhận viết tắt]`) bên cạnh luồng Weather Multi-Flight (luồng chung). | BR-220 | Khảo sát 11/06 chiều §II.9 |
| FUNC-290 | Khi hai khoảng hiệu lực của hai file Weather Multi-Flight khác nhau chồng nhau trong cùng một chuyến bay, chuyến đó nhận cả hai file (không tự động loại bỏ file cũ). | BR-220 | Khảo sát 11/06 chiều §II.9 |
| FUNC-291 | Khi tài liệu thời tiết riêng bị ẩn trên ứng dụng MO Plus do cơ chế "latest by filename", vẫn hiển thị file đó trên TOSS để điều phái viên quyết định có hiển thị lại hay tiếp tục ẩn. *(Cơ chế hiển thị trên MO Plus — latest by filename vs giữ song song — cần phối hợp với đội MO Plus; nằm ngoài phạm vi TOSS)* | BR-220 | Khảo sát 11/06 chiều §II.9 |

### 1.21 BR-221 — Hỗ trợ sửa các trường thông số trên OFP trước khi đẩy lên MO Plus

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-292 | Cho phép điều phái viên sửa các trường thông số trên OFP trước khi TOSS đẩy lên MO Plus, bảo đảm các đầu ra TXT và email tuân thủ đúng quy tắc bốc tách của MO Plus. | BR-221 | Khảo sát 11/06 chiều §II.11 |
| FUNC-293 | Cho phép sửa các trường ưu tiên trên OFP: Flight Level theo từng giai đoạn Climb / Cruise / Descend (giá trị tham chiếu lấy từ hệ thống ICON `[cần xác nhận tên hệ thống]`), dầu mỡ, giờ, Brady `[cần xác nhận viết tắt]` và ADC `[cần xác nhận viết tắt]`. | BR-221 | Khảo sát 11/06 chiều §II.11 |
| FUNC-294 | Không cho phép sửa các trường cố định trên OFP: số hiệu tàu, đường bay. | BR-221 | Khảo sát 11/06 chiều §II.11 |
| FUNC-295 | Triển khai chức năng sửa OFP theo một trong hai phương án: PA1 — TOSS cung cấp form sửa trên giao diện TOSS và tự sửa nhất quán cả TXT lẫn email gốc trước khi đẩy lên MO Plus; PA2 — TOSS chỉ ra các trường cần sửa và giá trị cần sửa, điều phái viên download file gốc, sửa thủ công rồi upload lại lên TOSS. *(Lựa chọn PA cụ thể: `[cần xác nhận lựa chọn PA]` — Khảo sát 11/06 chiều §II.11 nêu hai phương án, chốt sau theo phân tích kỹ thuật)* | BR-221 | Khảo sát 11/06 chiều §II.11 |

### 1.22 BR-222 — Cảnh báo "Chuyến bay thiếu tài liệu" và "Tổ bay chưa tải tài liệu mới nhất"

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-296 | Sinh cảnh báo "Chuyến bay thiếu tài liệu" khi đến mốc thời gian đáng lẽ phải có tài liệu (OFP, NOTAM, thời tiết) mà tài liệu chưa lên hệ thống TOSS hoặc khi luồng tự động (Lido → MO Plus) bị lỗi không đẩy được. *(Mốc thời gian cụ thể trước STD/ETD: chưa có nguồn — cần SME bổ sung)* | BR-222 | Khảo sát 11/06 chiều §II.1 |
| FUNC-297 | Lấy dữ liệu trạng thái download tài liệu của tổ bay từ MO Plus (history tổ bay đã vào xem/download tài liệu hay chưa) làm nguồn đối chiếu cho cảnh báo BR-222. *(Phạm vi giao diện cụ thể TOSS — MO Plus cần làm rõ với đội MO Plus)* | BR-222 | Khảo sát 11/06 chiều §II.1 |
| FUNC-298 | Sinh cảnh báo "Tổ bay chưa tải tài liệu mới nhất" và phát cảnh báo ngược về điều phái viên khi tổ bay chưa download phiên bản tài liệu mới nhất trong khoảng thời gian quy định trước chuyến bay. *(Khoảng thời gian quy định cụ thể: chưa có nguồn — cần SME bổ sung)* | BR-222 | Khảo sát 11/06 chiều §II.1 |

---

## 2. Bảng truy vết BR ↔ FUNC (tóm tắt)

| BR cha | Số FUNC con | Dải mã FUNC |
|---|---:|---|
| BR-201 | 4 | FUNC-201 … FUNC-204 |
| BR-202 | 4 | FUNC-205 … FUNC-208 |
| BR-203 | 5 | FUNC-209 … FUNC-213 |
| BR-204 | 6 | FUNC-214 … FUNC-219 |
| BR-205 | 4 | FUNC-220 … FUNC-223 |
| BR-206 | 4 | FUNC-224 … FUNC-227 |
| BR-207 | 6 | FUNC-228 … FUNC-233 |
| BR-208 | 3 | FUNC-234 … FUNC-236 |
| BR-209 | 3 | FUNC-237 … FUNC-239 |
| BR-210 | 6 | FUNC-240 … FUNC-245 |
| BR-211 | 3 | FUNC-246 … FUNC-248 |
| BR-212 | 3 | FUNC-249 … FUNC-251 |
| BR-213 | 4 | FUNC-252 … FUNC-255 |
| BR-214 | 3 | FUNC-256 … FUNC-258 |
| BR-215 | 3 | FUNC-259 … FUNC-261 |
| BR-216 | 8 | FUNC-262 … FUNC-269 |
| BR-217 | 6 | FUNC-270 … FUNC-275 |
| BR-218 | 7 | FUNC-276 … FUNC-282 |
| BR-219 | 4 | FUNC-283 … FUNC-286 |
| BR-220 | 5 | FUNC-287 … FUNC-291 |
| BR-221 | 4 | FUNC-292 … FUNC-295 |
| BR-222 | 3 | FUNC-296 … FUNC-298 |
| **Tổng** | **98** | **FUNC-201 … FUNC-298** |

---

## 3. Danh sách "(chưa có nguồn)" / cờ `[cần xác nhận]`

Các điểm sau cần BA Lead/SME bổ sung nguồn hoặc xác nhận thêm trước khi đi xuống mức Use Case / User Story / đặc tả trường dữ liệu:

| Mã FUNC | Vấn đề cần làm rõ | Loại |
|---|---|---|
| FUNC-247 | Quy ước đặt tên tệp cụ thể để tự gắn tài liệu vào đúng chuyến bay khi tải hàng loạt — Khảo sát 09/06 §II.3 chỉ ghi "VTIT đề nghị làm rõ định dạng và quy ước đặt tên của tài liệu nguồn"; chưa có quy ước chốt. | (chưa có nguồn) |
| FUNC-256 | Phạm vi giao diện cụ thể giữa TOSS và MO Plus (giao diện trạng thái, thời điểm đồng bộ, cơ chế thông báo) — Khảo sát 11/06 §II.2 ghi "cần được làm rõ trong buổi làm việc tiếp theo". | `[cần xác nhận]` |
| FUNC-257 | Cơ chế chặn Captain's Release trên MO Plus — thuộc phạm vi sửa MO Plus, nằm ngoài TOSS; chưa có nguồn chốt thiết kế. | `[cần xác nhận]` |
| FUNC-258 | Thông báo "Dispatch chưa Release" hiển thị trên MO Plus — thuộc phạm vi sửa MO Plus, nằm ngoài TOSS; chưa có nguồn chốt thiết kế. | `[cần xác nhận]` |
| FUNC-273 | Ngưỡng Delta cụ thể giữa ZFW trên OFP và ZFW ước tính thực tế để kích hoạt cảnh báo — Đề xuất §II.2 chỉ ghi "Mọi sai lệch (Delta)… sẽ được hiển thị cảnh báo" mà không nêu ngưỡng số. | (chưa có nguồn) |
| FUNC-279 | Cơ chế MO Plus reset trạng thái Confirm Release của phi công về 0 khi nhận revision mới do Unrelease — thuộc phạm vi sửa MO Plus, nằm ngoài TOSS; cần phối hợp với chủ sở hữu MO Plus. | `[cần xác nhận]` |
| FUNC-281 | Quy ước gán số phiên bản cho phiên bản sinh ra sau thao tác Unrelease (vd "2.1" sub-version hay auto-tăng "v4") — Khảo sát 11/06 chiều §II.4 nêu hai lựa chọn, chưa chốt. | `[cần xác nhận]` |
| FUNC-284 | Viết tắt ADC trong các trường thông số chính của OFP backup — Khảo sát 11/06 chiều §II.13 nhắc tới nhưng chưa xác nhận tên đầy đủ. | `[cần xác nhận]` |
| FUNC-289 | Viết tắt FME (Flight Management Editor?) — cơ chế attach file thời tiết riêng hiện hành — Khảo sát 11/06 chiều §II.9 nêu nhưng chưa xác nhận tên đầy đủ. | `[cần xác nhận]` |
| FUNC-291 | Cơ chế hiển thị trên MO Plus khi có hai file thời tiết cùng áp cho một chuyến (latest by filename vs giữ song song) — thuộc phạm vi sửa MO Plus, nằm ngoài TOSS; cần phối hợp với đội MO Plus. | `[cần xác nhận]` |
| FUNC-293 | Tên đầy đủ của hệ thống ICON (nguồn tham chiếu giá trị Flight Level theo Climb/Cruise/Descend) và viết tắt Brady, ADC — Khảo sát 11/06 chiều §II.11 chưa xác nhận. | `[cần xác nhận]` |
| FUNC-295 | Lựa chọn phương án triển khai chức năng sửa OFP (PA1 — TOSS sửa giúp qua form vs PA2 — TOSS chỉ ra trường cần sửa, điều phái sửa tay rồi upload lại) — Khảo sát 11/06 chiều §II.11 nêu hai phương án, chốt sau theo phân tích kỹ thuật. | `[cần xác nhận]` |
| FUNC-296 | Mốc thời gian cụ thể (số phút/giờ trước STD/ETD) để kích hoạt cảnh báo "Chuyến bay thiếu tài liệu" — Khảo sát 11/06 chiều §II.1 chưa nêu mốc cụ thể. | (chưa có nguồn) |
| FUNC-297 | Phạm vi giao diện cụ thể TOSS — MO Plus để TOSS lấy trạng thái download tài liệu của tổ bay (API, frequency, format) — cần phối hợp với đội MO Plus. | `[cần xác nhận]` |
| FUNC-298 | Khoảng thời gian quy định trước chuyến bay để xác định "tổ bay chưa tải tài liệu mới nhất" — Khảo sát 11/06 chiều §II.1 chưa nêu cụ thể. | (chưa có nguồn) |

**Ghi chú phạm vi chung (theo CLAUDE.md §0 và Khảo sát 11/06 §II.2 Kết luận):** Phạm vi tích hợp Dispatch Release ↔ Captain's Release giữa TOSS và MO Plus (BR-214, FUNC-256/257/258, và mở rộng tới các FUNC mới FUNC-279/291/297 ở v0.2) vẫn thuộc nhóm "phạm vi cần làm rõ thêm" của BRD §5.3. Mọi mô tả thiết kế chi tiết giao diện (API, payload, kênh đồng bộ, retry, fallback, cơ chế reset Confirm Release, cơ chế "latest by filename" hay "giữ song song" cho tài liệu thời tiết, đầu mối lấy history download tài liệu tổ bay) sẽ chỉ được phát triển sau khi có buổi làm việc thống nhất với chủ sở hữu MO Plus — tài liệu này không suy diễn các nội dung đó.

---

*Hết tài liệu FUNC-DEC-PH2 v0.2 (2026-06-12).*
