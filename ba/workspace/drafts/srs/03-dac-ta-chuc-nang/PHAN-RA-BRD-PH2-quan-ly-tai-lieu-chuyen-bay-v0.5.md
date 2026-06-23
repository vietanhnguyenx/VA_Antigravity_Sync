---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.5"
date: "2026-06-23"
status: "Draft"
document_type: "Functional Decomposition"
document_id: "FUNC-DEC-PH2"
brd_version: "0.7"
parent: "BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.7.md"
---

# Phân rã Yêu cầu nghiệp vụ → Yêu cầu chức năng — Phân hệ 2: Quản lý tài liệu chuyến bay (v0.5)

> **Nguồn cha:** `BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.7.md` (BR-201 … BR-261) — Khung tổng: `BRD-TOSS-001-khung-v0.11.md` (§7.2).
>
> **Ghi chú v0.4 (2026-06-17):** Cập nhật theo BRD PH2 v0.6 (VALIDATION Agent 3):
> - **Bổ sung Khối F (mới)** — phân rã 5 BR chuyển từ PH1/PH4 sang PH2 v0.5+v0.6: **BR-257** (dashboard tài liệu chuyến bay + luồng phê duyệt request/confirm/reject — từ PH1 BR-112), **BR-258** (quản lý phần mềm + tính năng máy bay — từ PH4 BR-470), **BR-259** (SkyOffice master → auto push MO/MO Plus/VNA Library — từ PH4 BR-471), **BR-260** (Service Order tự động từ email LIDO — từ PH4 BR-472, BR canonical thay cho BR-247 PH2 cũ), **BR-261** (quản lý công việc Phòng KTKTB — từ PH4 BR-473). Thêm 16 FUNC mới (FUNC-332…FUNC-347).
> - **Ghi chú thay đổi ngữ cảnh trên BR đã có:**
>   - **BR-247 cũ (PH2 v0.4 — Service Order tự động):** đã xóa khỏi BRD PH2 v0.5 do trùng BR-260 canonical. Trong tài liệu phân rã này không có FUNC nào của v0.3 trỏ BR-247 (v0.3 chỉ phân rã đến BR-231) nên không có FUNC bị ảnh hưởng. Khi BR Service Order được tiêu thụ tại FUNC, mã BR cha = **BR-260** (xem mục §1 Khối F).
>   - **BR-235 (chế độ test/sandbox NOTOC):** chưa có FUNC phân rã trong v0.3 (nằm ngoài dải BR-201…BR-231 của v0.3). Khi triển khai phân rã ở bản sau, FUNC sẽ ghi chú "(cơ chế đồng bộ PROD→TEST: xem PH5 BR-542)" theo chú thích mới của BRD v0.6.
>   - **BR-234 (mobile NOTOC) hạ Must → Should; BR-215 (lịch sử OFP sát giờ) hạ Must → Should.** Tài liệu phân rã này không có cột "Ưu tiên" ở mức FUNC; mức ưu tiên áp dụng theo BR cha tại BRD PH2 v0.6 và không thay đổi nội dung FUNC. FUNC-259/260/261 (BR-215) giữ nguyên mô tả.
> - **Đổi tham chiếu BRD cha** sang `BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.7.md`. Bump version 0.3 → 0.4; date 2026-06-17.
> - **Lưu ý dải BR cha:** v0.3 phân rã BR-201…BR-231 theo bộ mã BRD PH2 phiên bản đầu (trước khi đánh số lại trong BRD v0.4–v0.6). Bản v0.4 này **không remap lại** các FUNC-201…FUNC-331 đã có (theo nguyên tắc CLAUDE.md §0 — không suy diễn ngoài chỉ thị); chỉ **bổ sung Khối F mới** ánh xạ chính xác sang BR-257…BR-261 của BRD PH2 v0.6. Việc remap đầy đủ BR cũ ↔ BR mới do BA Lead chốt ở bản sau (gắn cờ ở §3).
>
> **Ghi chú v0.3 (2026-06-12):** Bổ sung phân rã cho 9 BR mới của BRD v0.3 — BR-223 … BR-231 (9 BR). Thêm FUNC-299 … FUNC-331 (31 FUNC). Chi tiết xem `BA-VERSION-LOG.md`.
>
> **Ghi chú v0.2 (2026-06-12):** Bổ sung phân rã cho 5 BR mới (BR-218 … BR-222). Thêm FUNC-276 … FUNC-298 (23 FUNC). Chi tiết xem `BA-VERSION-LOG.md`.
>
> **Nguyên tắc TỐI THƯỢNG (CLAUDE.md §0):** Tài liệu này chỉ **phân rã + lắp ráp trung thực** nội dung đã có trong nguồn (Đề xuất §II.2, các báo cáo Khảo sát, YCKT VTIT các sheet). **KHÔNG suy diễn**, không bịa chức năng. Mọi FUNC đều truy vết về BR cha + trích nguồn cụ thể. Nội dung nguồn chưa đủ chi tiết được ghi rõ "(chưa có nguồn — cần SME bổ sung)" hoặc gắn cờ `[cần xác nhận]` (kèm trỏ về OID khi áp dụng).
>
> **Phạm vi mức:** Yêu cầu chức năng (FUNC — Functional Requirement). Chưa bóc xuống Trường hợp sử dụng (Use Case), Câu chuyện người dùng (User Story) hay đặc tả trường dữ liệu.
>
> **Quy ước mã:** `FUNC-2xx-yy` — `2xx` là BR cha (theo §7.2), `yy` là số thứ tự FUNC con trong BR đó. Mã FUNC tổng cấp phân hệ 2 tăng tuần tự bắt đầu từ FUNC-201.

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
| FUNC-228 | Tự động tích hợp và gắn kết Load Sheet (LS) từ PSS/DCS vào từng chuyến bay tương ứng. Tập trường bóc tách từ LS phải bao gồm: (a) header LS — **EDNO (Edition Number)**, người **Checked by**, người **Approved by** (mẫu `LOADSHEET_VN1237 [header]`); (b) **Prepared By** + số điện thoại liên hệ (mẫu `LOADSHEET_VN1237 [PREPARED BY CONG/VU CHI CONG 00 84 0902225966]`); (c) **lý do LS revision** dạng free-text (vd `LS2 DUE TO PLUS 01PC CREW.` — mẫu `LOADSHEET_VN1237 [LS2 DUE TO]`); (d) **cờ NOTOC YES/NO** trên LS — liên kết với NOTOC số hóa (mẫu `LOADSHEET_VN1237 [NOTOC]`); (e) **breakdown tải theo Compartment** 1..5 + bulk khoang 0 (mẫu `LOADSHEET_VN1237 [LOAD IN COMPARTMENTS]`); (f) **breakdown tải theo loại tại từng điểm đến**: Cargo (C), Mail (M), Baggage (B), Other (O), Total (T) (mẫu `LOADSHEET_VN1237 [PQC line]`); (g) **dòng LMC theo định dạng điện LDM** — bóc tách thành tập trường con PAX (ADL/CHD/INF), JMP, CRW, PAD, PER cùng cargo theo compartment (mẫu `LOADSHEET_VN1237 [LMC line]`). | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại"; Rà soát nguồn 23/06 §II.2 |
| FUNC-229 | Tự động tích hợp và gắn kết Tổng khai báo (GD — General Declaration) từ PSS/DCS vào từng chuyến bay tương ứng. | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại" |
| FUNC-230 | Tự động tích hợp và gắn kết Manifest hành khách (PM — Passenger Manifest) từ PSS/DCS vào từng chuyến bay tương ứng. | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại" |
| FUNC-231 | Tự động tích hợp và gắn kết NOTOC (Notification to Captain — hàng hóa đặc biệt) từ PSS/DCS vào từng chuyến bay tương ứng. Danh mục hàng hóa đặc biệt bao gồm **danh sách hành khách mang Battery Lithium** (mẫu `PM_VN1237 [BATTERY LITHIUM LIST]`) — liên kết với cờ NOTOC YES/NO trên Load Sheet (xem FUNC-228). | BR-207 | Đề xuất §II.2 — "Hợp nhất dữ liệu thương mại"; Rà soát nguồn 23/06 §II.3 |
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

> **Ghi chú v0.4:** BR-215 đã hạ Must → **Should** ở BRD PH2 v0.6 do OID KS-53 còn mở (audit trail chưa chốt). Nội dung FUNC không đổi; mức ưu tiên áp dụng theo BR cha tại BRD.

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-259 | Ghi nhận lịch sử các lần làm lại OFP sát giờ khởi hành (dưới 60 phút trước STD đối với chuyến nội địa). | BR-215 | Khảo sát 11/06 §II.3 |
| FUNC-260 | Cho phép gắn lý do "tổ bay yêu cầu" cho lần làm lại OFP sát giờ, phục vụ truy vết. | BR-215 | Khảo sát 11/06 §II.3 |
| FUNC-261 | Không tự động hóa quyết định làm lại OFP trong tình huống sát giờ; quyết định vẫn do điều phái viên thực hiện thủ công. | BR-215 | Khảo sát 11/06 §II.3 |

### 1.16 BR-216 — Quản lý tải trọng

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-262 | Cho phép người dùng nhập số lượng hành khách theo từng nhóm: Người lớn (Adult), Trẻ em (Child), Trẻ sơ sinh (Infant). Bổ sung: (a) hạng **Premium Economy (PE)** song song với Adult/Child/Infant + cờ **CHD (Child)** + ticket reference **TKNE** (mẫu `PM_VN1237 [PE LIST]`); (b) cờ **SOC (Seat Occupied by Cargo)** và **BLKD (Blocked seats)** ghi nhận trên PAX (mẫu `LOADSHEET_VN1237 [PASSENGER/CABIN BAG]`); (c) **Seat Map theo cabin J/W/Y** dạng sơ đồ ghế (mẫu `PM_VN1237 [J-CHART]`). | BR-216 | Đề xuất §II.2 — "Tính toán trọng lượng hành khách & hành lý"; Rà soát nguồn 23/06 §II.2, §II.3 |
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
| FUNC-270 | Hiển thị đồng thời chỉ số trọng lượng khô (DOW — Dry Operating Weight) từ kế hoạch bay (OFP). Đối với cân bằng tải, hiển thị thêm tập trường **BALANCE** chuẩn từ Load Sheet: **DOI** (Dry Operating Index), **LIZFW / LITOW / LILAW** (Load Index tại ZFW / TOW / LAW) và **MACZFW / MACTOW / MACLAW** (% chord trung bình khí động tương ứng) — mẫu `LOADSHEET_VN1237 [BALANCE AND SEATING CONDITIONS]`. | BR-217 | Đề xuất §II.2 — "Đối soát an toàn với OFP"; Rà soát nguồn 23/06 §II.2 |
| FUNC-271 | Hiển thị đồng thời chỉ số ZFW từ kế hoạch bay (OFP) để so sánh với ZFW thực tế tính toán được. Mở rộng: (a) **ZFW** ba giá trị Actual / MAX / ADJ (mẫu `LOADSHEET_VN1237 [ZERO FUEL WEIGHT ACTUAL]: 61788 MAX 71500 ADJ`); (b) **TOW (Take-off Weight)** ba giá trị Actual / MAX / ADJ (mẫu `LOADSHEET_VN1237 [TAKE OFF WEIGHT ACTUAL]: 70842 MAX 89000 ADJ`); (c) **LDW (Landing Weight)** ba giá trị Actual / MAX + cờ L + ADJ (mẫu `LOADSHEET_VN1237 [LANDING WEIGHT ACTUAL]: 65949 MAX 75500 L ADJ`). | BR-217 | Đề xuất §II.2 — "Đối soát an toàn với OFP"; Rà soát nguồn 23/06 §II.2 |
| FUNC-272 | Tự động so sánh ZFW trên OFP với ZFW ước tính thực tế và tính Delta. Phạm vi đối soát mở rộng để bao quát toàn bộ bộ trọng lượng: **ZFW, TOW, LDW** — đều so sánh Actual ↔ OFP và tính Delta tương ứng. Tham chiếu thêm trường **UNDERLOAD BEFORE LMC** và **LMC TOTAL** trên LS (mẫu `LOADSHEET_VN1237 [UNDERLOAD BEFORE LMC]`) để theo dõi tải còn thừa trước khi áp Last-Minute Change. | BR-217 | Đề xuất §II.2 — "Đối soát an toàn với OFP"; Rà soát nguồn 23/06 §II.2 |
| FUNC-273 | Hiển thị cảnh báo khi có sai lệch (Delta) giữa ZFW (và mở rộng TOW/LDW) trên OFP và giá trị ước tính thực tế. *(Ngưỡng Delta cụ thể: chưa có nguồn — cần SME bổ sung)* | BR-217 | Đề xuất §II.2 — "Đối soát an toàn với OFP"; Rà soát nguồn 23/06 §II.2 |
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

### 1.23 BR-223 — Cảnh báo màu khi ATC FPL trong OFP sai lệch với điện ATC đã filed

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-299 | So sánh nội dung trường ATC FPL trong OFP của chuyến bay với nội dung điện ATC đã filed cho chính chuyến đó. *(Nguồn lấy điện ATC đã filed: chưa có nguồn — cần SME bổ sung; phạm vi giao diện cụ thể với hệ thống ATC cần làm rõ)* | BR-223 | YCKT V3 dòng 303; sheet-08 #4 |
| FUNC-300 | Hiển thị cảnh báo bằng màu sắc trên giao diện khi phát hiện sai lệch giữa ATC FPL trong OFP và điện ATC đã filed. *(Quy ước màu sắc cụ thể: chưa có nguồn — cần SME bổ sung)* | BR-223 | YCKT V3 dòng 303; sheet-08 #4 |
| FUNC-301 | Cho phép xem chi tiết các trường ATC FPL bị sai lệch (so sánh từng trường giữa OFP và điện ATC đã filed) phục vụ điều phái viên xử lý. | BR-223 | YCKT V3 dòng 303; sheet-08 #4 |

### 1.24 BR-224 — Cảnh báo khi phiên bản OFP mới khác bản cũ ở các trường then chốt

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-302 | So sánh tự động hai phiên bản OFP liên tiếp của cùng một chuyến bay trên các trường then chốt: số đăng ký tàu bay (AC Reg), giờ khởi hành dự kiến (ETD), sân bay đi (DEP), sân bay đến (ARR), số khách (PAX), DOW/Payload vượt giới hạn, tổ bay (Crew). | BR-224 | YCKT sheet-08 #4 |
| FUNC-303 | Sinh cảnh báo khi phát hiện thay đổi ở bất kỳ trường then chốt nào giữa phiên bản OFP mới và phiên bản OFP cũ liền kề, kèm chi tiết trường bị thay đổi và giá trị cũ/mới. | BR-224 | YCKT sheet-08 #4 |
| FUNC-304 | Áp dụng kiểm tra ngưỡng "ngoài giới hạn" đối với DOW/Payload khi so sánh hai phiên bản OFP (vd cảnh báo khi vượt ngưỡng cấu hình). *(Ngưỡng cụ thể: chưa có nguồn — cần SME bổ sung)* | BR-224 | YCKT sheet-08 #4 |

### 1.25 BR-225 — Số hóa và lưu trữ EOFP (End-of-Flight Operational Flight Plan)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-305 | Số hóa và lưu trữ trạng thái thực tế sau chuyến của OFP (EOFP) gồm các mốc thời gian: off-block (EOFP OFF BLOCK), takeoff (EOFP TAKE OFF), landing (EOFP LANDING), in-block (EOFP IN BLOCK). | BR-225 | YCKT FOS (sheet-09) — mục EOFP |
| FUNC-306 | Số hóa và lưu trữ các giá trị trọng lượng EOFP CORR sau chuyến: CORR DOW, CORR PLD (Payload), CORR ZFW, CORR TOW (Take-Off Weight), CORR LDW (Landing Weight), CORR TOF (Take-Off Fuel). | BR-225 | YCKT FOS (sheet-09) — mục EOFP |
| FUNC-307 | Số hóa và lưu trữ các giá trị nhiên liệu EOFP CORR sau chuyến: CORR TRIP FUEL, CORR CONT FUEL (Contingency), CORR DEST ALTN FUEL, CORR FINAL RES FUEL, CORR MIN SECTOR FUEL, CORR TAKEOFF FUEL, CORR TAXI FUEL. | BR-225 | YCKT FOS (sheet-09) — mục EOFP |
| FUNC-308 | Gắn kết bản ghi EOFP với phiên bản OFP cuối cùng (đã Dispatch Release) của cùng chuyến bay để phục vụ đối soát plan vs actual. | BR-225 | YCKT FOS (sheet-09) — mục EOFP |

### 1.26 BR-226 — Số hóa và lưu trữ trường ATC FPL trong OFP

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-309 | Số hóa và lưu trữ các trường nhận dạng ATC FPL: type of flight (ATC FPL TYPE OF FLIGHT), wake turbulence category (ATC FPL WAKE TURB CAT), equipment (ATC FPL EQUIPMENT), surveillance (ATC FPL Surveillance). | BR-226 | YCKT FOS (sheet-09) — mục ATC FPL |
| FUNC-310 | Số hóa và lưu trữ các trường tốc độ và mực bay của ATC FPL: speed unit (ATC FPL SPEED UNIT), speed (ATC FPL SPEED), flight level (ATC FPL FL). | BR-226 | YCKT FOS (sheet-09) — mục ATC FPL |
| FUNC-311 | Số hóa và lưu trữ các trường đường bay của ATC FPL: route (ATC FPL ROUTE), SID (ATC FPL SID), SID end waypoint (ATC FPL SID END WPT). | BR-226 | YCKT FOS (sheet-09) — mục ATC FPL |
| FUNC-312 | Số hóa và lưu trữ trường STS (ATC FPL STS) và danh mục FIRS đi qua (ATC FPL FIRS) của ATC FPL. | BR-226 | YCKT FOS (sheet-09) — mục ATC FPL |
| FUNC-313 | Số hóa và lưu trữ trường ATC FPL RULE (quy tắc bay) và liên kết với trường OFP ATC FPL / FILED ATC FPL phục vụ đối soát BR-223. | BR-226 | YCKT FOS (sheet-09) — mục ATC FPL |

### 1.27 BR-227 — Số hóa và lưu trữ RCL (Re-Clearance)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-314 | Số hóa và lưu trữ các trường định danh RCL: điểm quyết định (RCL DECISION POINT), đường bay (RCL ROUTE), sân bay đến cuối (RCL FINAL DEST), sân bay đến enroute (RCL ENROUTE DEST), chênh lệch nhiên liệu (RCL FUEL DIFF). *(Phạm vi nghiệp vụ RCL: `[cần xác nhận]` theo BR-227 ở BRD)* | BR-227 | YCKT FOS (sheet-09) — mục RCL |
| FUNC-315 | Số hóa và lưu trữ các giá trị nhiên liệu/thời gian RCL: trip fuel/time (RCL TRIP FUEL / TIME), contingency percent/airport/fuel/time (RCL CONT PERCENT / ARPT / FUEL / TIME), alternate fuel/time (RCL ALTN FUEL / TIME), final reserve fuel/time (RCL FINAL RES FUEL / TIME). | BR-227 | YCKT FOS (sheet-09) — mục RCL |
| FUNC-316 | Số hóa và lưu trữ các giá trị nhiên liệu/thời gian RCL bổ sung: minimum sector fuel/time (RCL MIN SECTOR FUEL / TIME), takeoff fuel/time (RCL TAKE OFF FUEL / TIME), taxi fuel/time (RCL TAXI FUEL / TIME), block fuel/time (RCL BLOCK FUEL / TIME). | BR-227 | YCKT FOS (sheet-09) — mục RCL |
| FUNC-317 | Số hóa và lưu trữ các giá trị RCL theo tuyến quyết định: DP-to-Final-Dest trip fuel/time/min contingency fuel/time/min contingency/PFOB (RCL DP TO FNL DEST TRIP FUEL / TIME / MINCONT FUEL / MINCONT TIME / MINCONT / PFOB). | BR-227 | YCKT FOS (sheet-09) — mục RCL |
| FUNC-318 | Số hóa và lưu trữ các giá trị RCL theo tuyến enroute: DP-to-Enroute-Dest trip fuel/time/contingency percent/contingency fuel/time/PFOB (RCL DP TO ENR DEST TRIP FUEL / TIME / CONT PERCENT / CONT FUEL / CONT TIME / PFOB). | BR-227 | YCKT FOS (sheet-09) — mục RCL |
| FUNC-319 | Đánh dấu trường IS RECLEAR OFP cho từng OFP phục vụ phân biệt OFP có Re-Clearance và OFP thường. | BR-227 | YCKT FOS (sheet-09) — mục OFP (IS RECLEAR OFP) |

### 1.28 BR-228 — Số hóa và lưu trữ EDTO Critical Point trong OFP

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-320 | Số hóa và lưu trữ định danh điểm tới hạn EDTO trong OFP: điểm tới hạn (OFP EDTO CRITICAL POINT), vĩ độ (LAT), kinh độ (LON), điểm Single-Engine Alternate Point — SAP (OFP EDTO CRITICAL POINT SAP). | BR-228 | YCKT FOS (sheet-09) — mục EDTO CRITICAL POINT |
| FUNC-321 | Số hóa và lưu trữ các giá trị thời gian/khoảng cách tại điểm tới hạn EDTO: thời gian dự kiến (ELTME, TIME), khoảng cách (DIST), độ lệch ISA (ISA), MORA, thành phần gió (WC — Wind Component). | BR-228 | YCKT FOS (sheet-09) — mục EDTO CRITICAL POINT |
| FUNC-322 | Số hóa và lưu trữ các giá trị mực bay và nhiên liệu/điều kiện tại điểm tới hạn EDTO: mực bay (FL), nhiên liệu trên tàu dự kiến (FOB — Fuel On Board), điều kiện (COND). | BR-228 | YCKT FOS (sheet-09) — mục EDTO CRITICAL POINT |
| FUNC-323 | Số hóa và lưu trữ các trường EDTO tổng quát của OFP: EDTO, EDTO MINS phục vụ đối soát với điểm tới hạn EDTO. | BR-228 | YCKT FOS (sheet-09) — mục OFP (EDTO, EDTO MINS) |

### 1.29 BR-229 — Số hóa và lưu trữ ACARS CDA (Clearance Delivery)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-324 | Số hóa và lưu trữ các trường thời gian/đường lăn/squawk của điện ACARS CDA: thời gian clearance (CLR TIME), runway clearance (CLR RUNWAY), mã squawk (CLR SQUAWK). | BR-229 | YCKT FOS (sheet-09) — mục ACARS CDA |
| FUNC-325 | Số hóa và lưu trữ các trường giới hạn mực bay và SID của ACARS CDA: giới hạn mực bay (CLR FL RESTRICT), SID (CLR SID), thông tin bổ sung SID (CLR SID ADD INFO). | BR-229 | YCKT FOS (sheet-09) — mục ACARS CDA |
| FUNC-326 | Số hóa và lưu trữ các trường thời điểm khởi động và cổng của ACARS CDA: Target Startup Approval Time (CLR TSAT), Approved Departure Time (CLR ADT), cổng (ACARS GATE). | BR-229 | YCKT FOS (sheet-09) — mục ACARS CDA |

### 1.30 BR-230 — Chức năng "Attach file lên MO Plus" như một thao tác riêng

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-327 | Cung cấp thao tác "Attach file lên MO Plus" cho điều phái viên trên TOSS như một thao tác riêng — độc lập với luồng adapter Lido tự động — cho phép đính kèm tài liệu trực tiếp lên MO Plus của chuyến bay đang chọn. *(Phạm vi giao diện cụ thể TOSS ↔ MO Plus cho thao tác Attach: cần làm rõ với đội MO Plus)* | BR-230 | YCKT sheet-05 #10 |
| FUNC-328 | Ghi nhận lịch sử thao tác Attach file lên MO Plus: người thực hiện, thời điểm, tên tài liệu, chuyến bay đích, trạng thái kết quả (thành công/lỗi). | BR-230 | YCKT sheet-05 #10 |

### 1.31 BR-231 — Giám sát và cảnh báo luồng tự động Lido 4D

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-329 | Giám sát trạng thái hoạt động của adapter Lido 4D (kết nối, phiên đồng bộ, nhịp tim) và sinh cảnh báo khi adapter lỗi. *(Danh mục cảnh báo cụ thể: `[cần xác nhận]` theo BR-231 ở BRD)* | BR-231 | YCKT sheet-08 #24 |
| FUNC-330 | Giám sát quá trình parse (bóc tách) tài liệu từ Lido (OFP, NOTAM, WX, Briefing Package) và sinh cảnh báo khi xảy ra lỗi parse (sai định dạng, thiếu trường bắt buộc, không nhận diện được). | BR-231 | YCKT sheet-08 #24 |
| FUNC-331 | Giám sát quá trình đẩy OFP từ TOSS sang MO Plus và sinh cảnh báo khi xảy ra lỗi đẩy (timeout, lỗi API, phản hồi không thành công). *(Phạm vi giao diện cụ thể TOSS ↔ MO Plus cho cảnh báo lỗi đẩy: cần làm rõ với đội MO Plus)* | BR-231 | YCKT sheet-08 #24 |

---

## Khối F — Tài liệu khai thác KTKTB và luồng phê duyệt tài liệu chuyến (mới ở v0.4)

> **Phạm vi Khối F:** phân rã các BR mới của BRD PH2 v0.6 — BR-257 (tiếp nhận từ PH1 BR-112) và BR-258…BR-261 (tiếp nhận từ PH4 Nhóm K). Tất cả trỏ BR cha theo bộ mã của BRD PH2 v0.6.

### 1.32 BR-257 — Dashboard tài liệu chuyến bay + luồng phê duyệt request/confirm/reject

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-332 | Cung cấp dashboard tài liệu chuyến bay hiển thị danh sách tài liệu của từng chuyến (OFP, NOTAM, WX, Briefing Package, Load Sheet, NOTOC, GD, PM, Cargo/Mail Manifest…) kèm trạng thái phê duyệt hiện hành theo từng tài liệu. | BR-257 | KS 08/06 §II.5; KS 11/06 sáng §II.4 |
| FUNC-333 | Cho phép tổ bay/phi công gửi yêu cầu bất thường (Request) liên quan đến tài liệu chuyến bay (yêu cầu sửa, yêu cầu bổ sung, yêu cầu phát hành lại) kèm nội dung yêu cầu, lý do và thời gian gửi. | BR-257 | KS 08/06 §II.5; KS 11/06 sáng §II.4 |
| FUNC-334 | Cung cấp luồng xử lý Confirm/Reject cho điều phái viên đối với từng Request từ tổ bay, kèm trường nhập lý do khi Reject; sau khi Confirm/Reject, hệ thống cập nhật trạng thái phê duyệt tương ứng trên dashboard. | BR-257 | KS 08/06 §II.5; KS 11/06 sáng §II.4 |
| FUNC-335 | Ghi nhận và hiển thị lịch sử phê duyệt tài liệu (chuỗi Request → Confirm/Reject) theo từng tài liệu và từng chuyến bay, gồm: người thực hiện, thời điểm, hành động, lý do (khi có), tài liệu/phiên bản đích. | BR-257 | KS 08/06 §II.5; KS 11/06 sáng §II.4 |

### 1.33 BR-258 — Quản lý phần mềm và tính năng máy bay

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-336 | Cho phép tạo và lưu bản ghi phần mềm theo từng tàu bay, ghi nhận các lần chỉnh sửa phần mềm/tính năng theo thời gian (lịch sử thay đổi). | BR-258 | KS 11/06 KTKTB Buổi 3 §5 |
| FUNC-337 | Cho phép người dùng comment trên bản ghi phần mềm/tính năng của tàu bay và đánh dấu (flag) tàu bay đang cần cập nhật. | BR-258 | KS 11/06 KTKTB Buổi 3 §5 |

### 1.34 BR-259 — Đăng tải tài liệu khai thác tại SkyOffice và auto push MO/MO Plus/VNA Library

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-338 | Cho phép người dùng đăng tải tài liệu khai thác tại SkyOffice (SkyOffice là master cho thư viện tài liệu khai thác). | BR-259 | KS 11/06 KTKTB Buổi 3 §4 |
| FUNC-339 | Sau khi tài liệu được đăng tải thành công tại SkyOffice, hệ thống tự động đẩy bản đã đăng tải sang các hệ thống đích (MO, MO Plus, VNA Library). | BR-259 | KS 11/06 KTKTB Buổi 3 §4 |
| FUNC-340 | Sinh cảnh báo cho người dùng khi quá trình đẩy tự động sang MO, MO Plus hoặc VNA Library bị thất bại; ghi nhận lịch sử kết quả đẩy (thành công/thất bại + lý do nếu có) theo từng hệ thống đích. | BR-259 | KS 11/06 KTKTB Buổi 3 §4 |

### 1.35 BR-260 — Service Order tự động từ email LIDO (BR canonical, thay BR-247 cũ)

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-341 | Cấu hình một địa chỉ email cố định nhận email Service Order do nhà cung cấp LIDO gửi đến; hệ thống tự động đọc các email gửi đến địa chỉ này. | BR-260 | KS 11/06 KTKTB Buổi 3 §4 |
| FUNC-342 | Tự động bóc tách nội dung email LIDO và tạo bản ghi Service Order trên hệ thống, gắn với từng tàu bay tương ứng. | BR-260 | KS 11/06 KTKTB Buổi 3 §4 |
| FUNC-343 | Cho phép người dùng đánh dấu thủ công trạng thái Service Order là "đã hoàn thành" sau khi order được thực hiện xong; ghi nhận người đánh dấu và thời điểm. | BR-260 | KS 11/06 KTKTB Buổi 3 §4 |

### 1.36 BR-261 — Quản lý công việc Phòng KTKTB

| Mã FUNC | Mô tả chức năng | BR cha | Nguồn |
|---|---|---|---|
| FUNC-344 | Cho phép tạo công việc (task) và giao việc cho nhân viên Phòng KTKTB, kèm các thuộc tính cơ bản của công việc (người giao, người nhận, nội dung, thời hạn). | BR-261 | KS 11/06 KTKTB Buổi 3 §5 |
| FUNC-345 | Cho phép nhân viên Phòng KTKTB báo cáo tiến độ công việc đã được giao (cập nhật trạng thái, ghi nhận tiến độ, ghi chú). | BR-261 | KS 11/06 KTKTB Buổi 3 §5 |
| FUNC-346 | Cho phép xuất báo cáo tuần tổng hợp công việc của Phòng KTKTB (danh sách công việc, trạng thái, người thực hiện, tiến độ trong tuần). | BR-261 | KS 11/06 KTKTB Buổi 3 §5 |
| FUNC-347 | Cung cấp biểu đồ trực quan trên báo cáo công việc của Phòng KTKTB (ví dụ biểu đồ tiến độ, biểu đồ phân bổ công việc theo nhân viên/trạng thái). | BR-261 | KS 11/06 KTKTB Buổi 3 §5 |

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
| BR-223 | 3 | FUNC-299 … FUNC-301 |
| BR-224 | 3 | FUNC-302 … FUNC-304 |
| BR-225 | 4 | FUNC-305 … FUNC-308 |
| BR-226 | 5 | FUNC-309 … FUNC-313 |
| BR-227 | 6 | FUNC-314 … FUNC-319 |
| BR-228 | 4 | FUNC-320 … FUNC-323 |
| BR-229 | 3 | FUNC-324 … FUNC-326 |
| BR-230 | 2 | FUNC-327 … FUNC-328 |
| BR-231 | 3 | FUNC-329 … FUNC-331 |
| **BR-257** | **4** | **FUNC-332 … FUNC-335** |
| **BR-258** | **2** | **FUNC-336 … FUNC-337** |
| **BR-259** | **3** | **FUNC-338 … FUNC-340** |
| **BR-260** | **3** | **FUNC-341 … FUNC-343** |
| **BR-261** | **4** | **FUNC-344 … FUNC-347** |
| **Tổng** | **147** | **FUNC-201 … FUNC-347** |

> **Ghi chú remap BR:** dải BR-201…BR-231 trong v0.3 sử dụng bộ mã BRD PH2 phiên bản đầu (trước khi đánh số lại trong BRD v0.4–v0.6). Trong BRD PH2 v0.6 hiện hành, các BR-201…BR-231 đã có ngữ nghĩa mới (Lido luồng → bot, ngưỡng release, Phase 3, W&B, NOTOC SGN, MEL Boeing+Airbus, weather multi-flight, etc.). Việc **remap đầy đủ BR cũ ↔ BR mới** cho dải FUNC-201…FUNC-331 do BA Lead chốt ở bản sau (đưa vào §3 cờ).

---

## 3. Danh sách "(chưa có nguồn)" / cờ `[cần xác nhận]`

Các điểm sau cần BA Lead/SME bổ sung nguồn hoặc xác nhận thêm trước khi đi xuống mức Use Case / User Story / đặc tả trường dữ liệu:

| Mã FUNC | Vấn đề cần làm rõ | Loại |
|---|---|---|
| FUNC-201…FUNC-331 (toàn dải) | **Remap BR cha cũ ↔ BR mới của BRD PH2 v0.6.** Các FUNC này được phân rã trên bộ mã BR PH2 phiên bản đầu (v0.1–v0.3); BRD PH2 v0.6 đã đánh số lại toàn bộ BR. Cần BA Lead chốt bảng remap để đồng bộ trace BR↔FUNC trước khi đẩy xuống UC/US. | `[cần xác nhận]` |
| FUNC-247 | Quy ước đặt tên tệp cụ thể để tự gắn tài liệu vào đúng chuyến bay khi tải hàng loạt — Khảo sát 09/06 §II.3 chỉ ghi "VTIT đề nghị làm rõ định dạng và quy ước đặt tên của tài liệu nguồn". | (chưa có nguồn) |
| FUNC-256 | Phạm vi giao diện cụ thể giữa TOSS và MO Plus — Khảo sát 11/06 §II.2. | `[cần xác nhận]` |
| FUNC-257 | Cơ chế chặn Captain's Release trên MO Plus — thuộc phạm vi sửa MO Plus, nằm ngoài TOSS. | `[cần xác nhận]` |
| FUNC-258 | Thông báo "Dispatch chưa Release" hiển thị trên MO Plus — thuộc phạm vi sửa MO Plus, nằm ngoài TOSS. | `[cần xác nhận]` |
| FUNC-273 | Ngưỡng Delta cụ thể giữa ZFW trên OFP và ZFW ước tính thực tế để kích hoạt cảnh báo. | (chưa có nguồn) |
| FUNC-279 | Cơ chế MO Plus reset trạng thái Confirm Release của phi công về 0 khi nhận revision mới do Unrelease. | `[cần xác nhận]` |
| FUNC-281 | Quy ước gán số phiên bản cho phiên bản sinh ra sau thao tác Unrelease (vd "2.1" sub-version hay auto-tăng "v4"). | `[cần xác nhận]` |
| FUNC-284 | Viết tắt ADC trong các trường thông số chính của OFP backup. | `[cần xác nhận]` |
| FUNC-289 | Viết tắt FME (Flight Management Editor?) — cơ chế attach file thời tiết riêng hiện hành. | `[cần xác nhận]` |
| FUNC-291 | Cơ chế hiển thị trên MO Plus khi có hai file thời tiết cùng áp cho một chuyến (latest by filename vs giữ song song). | `[cần xác nhận]` |
| FUNC-293 | Tên đầy đủ của hệ thống ICON và viết tắt Brady, ADC. | `[cần xác nhận]` |
| FUNC-295 | Lựa chọn phương án triển khai chức năng sửa OFP (PA1 vs PA2). | `[cần xác nhận]` |
| FUNC-296 | Mốc thời gian cụ thể (số phút/giờ trước STD/ETD) để kích hoạt cảnh báo "Chuyến bay thiếu tài liệu". | (chưa có nguồn) |
| FUNC-297 | Phạm vi giao diện cụ thể TOSS — MO Plus để TOSS lấy trạng thái download tài liệu của tổ bay. | `[cần xác nhận]` |
| FUNC-298 | Khoảng thời gian quy định trước chuyến bay để xác định "tổ bay chưa tải tài liệu mới nhất". | (chưa có nguồn) |
| FUNC-299 | Nguồn lấy điện ATC đã filed để đối chiếu với ATC FPL trong OFP và phạm vi giao diện cụ thể với hệ thống ATC. | `[cần xác nhận]` |
| FUNC-300 | Quy ước màu sắc cụ thể cho cảnh báo lệch ATC FPL. | (chưa có nguồn) |
| FUNC-304 | Ngưỡng "ngoài giới hạn" cụ thể đối với DOW/Payload khi so sánh hai phiên bản OFP. | (chưa có nguồn) |
| FUNC-314 | Phạm vi nghiệp vụ RCL (Re-Clearance). | `[cần xác nhận]` |
| FUNC-327 | Phạm vi giao diện cụ thể TOSS ↔ MO Plus cho thao tác Attach file. | `[cần xác nhận]` |
| FUNC-329 | Danh mục cảnh báo cụ thể của luồng tự động Lido 4D. | `[cần xác nhận]` |
| FUNC-331 | Phạm vi giao diện cụ thể TOSS ↔ MO Plus cho cảnh báo lỗi đẩy OFP. | `[cần xác nhận]` |
| **FUNC-332…FUNC-335** | **BR-257 — Khối F mới.** Quy ước chi tiết các loại "yêu cầu bất thường" của tổ bay (danh mục loại request), SLA xử lý Confirm/Reject, mức phân quyền theo vai trò — BRD v0.6 mô tả mức cao, chi tiết chờ SME bổ sung. | `[cần xác nhận]` |
| **FUNC-336…FUNC-337** | **BR-258 — Khối F mới.** Danh mục thuộc tính cụ thể của bản ghi phần mềm tàu bay (version phần mềm, ngày cập nhật, tài liệu kèm theo) và quy tắc đánh dấu "cần cập nhật" (ngưỡng thời gian, điều kiện) — BRD v0.6 mới mức cao. | `[cần xác nhận]` |
| **FUNC-340** | **BR-259 — Khối F mới.** Phạm vi giao diện cụ thể giữa SkyOffice ↔ MO / MO Plus / VNA Library cho luồng auto push (API, payload, retry, lưu kết quả). | `[cần xác nhận]` |
| **FUNC-341…FUNC-343** | **BR-260 — Khối F mới.** Format email LIDO (chủ thể, mẫu nội dung, attachment) và bộ trường Service Order trên hệ thống (mã, loại, mức độ ưu tiên). Cờ canonical thay thế BR-247 PH2 cũ. | `[cần xác nhận]` |
| **FUNC-344…FUNC-347** | **BR-261 — Khối F mới.** Mô hình dữ liệu công việc Phòng KTKTB (trạng thái, vai trò, định kỳ), bộ trường báo cáo tuần và chuẩn biểu đồ — BRD v0.6 mới mức cao (Could). | `[cần xác nhận]` |

**Ghi chú phạm vi chung (theo CLAUDE.md §0 và BRD PH2 v0.6):**

- **Phạm vi tích hợp TOSS ↔ MO Plus** (Dispatch Release ↔ Captain's Release, reset Confirm Release sau Unrelease, hiển thị "latest by filename" cho weather, lịch sử download tài liệu tổ bay, cảnh báo lỗi đẩy OFP, thao tác Attach file): vẫn thuộc nhóm "phạm vi cần làm rõ thêm" với chủ sở hữu MO Plus — trỏ về **OID KS-08** (xem `SO-THEO-DOI-DIEM-CHOT-v0.1.md`).
- **BR-235 (chế độ test/sandbox NOTOC):** chưa được phân rã trong tài liệu này. Khi triển khai phân rã ở bản sau, FUNC cần ghi chú "cơ chế đồng bộ dữ liệu PROD→TEST: xem PH5 BR-542" và "sandbox UI riêng cho NOTOC trên PH2" theo chú thích BRD v0.6.
- **BR-242/243/244 (công cụ MEL Boeing+Airbus, revision/compare, áp SB hotfix):** chưa được phân rã trong tài liệu này. Khi phân rã, FUNC cần ghi chú "(xem PH4 BR-425/426 — MEL master data owner; PH2 tiêu thụ trong luồng tài liệu chuyến bay.)" theo chú thích BRD v0.6.
- **BR-219/220 (bot AOS / tài khoản ca riêng):** chưa được phân rã trong tài liệu này. Khi phân rã, FUNC cần ghi chú "(quy tắc đặt tên tài khoản bot / cơ chế IAM tài khoản ca: xem PH5 BR-513.)" theo chú thích BRD v0.6.

---

*Hết tài liệu FUNC-DEC-PH2 v0.4 (2026-06-17). Lịch sử version: xem `BA-VERSION-LOG.md`.*
