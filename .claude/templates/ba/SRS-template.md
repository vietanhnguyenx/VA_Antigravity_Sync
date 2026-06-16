---
project: "{{TÊN_DỰ_ÁN}}"
author: "{{TÊN_NGƯỜI_LẬP}}"
version: "{{x.y}}"
date: "{{YYYY-MM-DD}}"
status: "{{Draft | Review | Approved}}"
document_type: "SRS — Đặc tả Yêu cầu Hệ thống"
source_template: "QT02.BM.04_Thiet ke chi tiet.docx"
---

<!-- ============================================================
     TRANG BÌA
     ============================================================ -->

# TẬP ĐOÀN CÔNG NGHIỆP - VIỄN THÔNG QUÂN ĐỘI VIETTEL
# {{ĐƠN_VỊ}}

---

## ĐẶC TẢ YÊU CẦU HỆ THỐNG (SRS)

**Mã hiệu dự án:** {{MÃ_DỰ_ÁN}}
**Mã hiệu tài liệu:** {{MÃ_TÀI_LIỆU}}

*{{Địa điểm, Thời gian}}*

---

## BẢNG GHI NHẬN THAY ĐỔI TÀI LIỆU

*A – Tạo mới, M – Sửa đổi, D – Xóa bỏ*

| Ngày thay đổi | Vị trí thay đổi | A* M, D | Nguồn gốc | Phiên bản cũ | Mô tả thay đổi | Phiên bản mới | Trang ký |
|---|---|---|---|---|---|---|---|
| {{NGÀY}} | | A | | | Tạo mới tài liệu | v1.0 | |

---

## KÝ DUYỆT

| | Người lập | Người xem xét | Người xem xét | Người phê duyệt |
|---|---|---|---|---|
| **Họ tên** | | | | |
| **Ngày** | | | | |
| **Chức danh** | | | | |

---

## MỤC LỤC

*(Tự động cập nhật trong Microsoft Word: References → Update Table → Update entire table)*

---

## 1. GIỚI THIỆU

[Phần giới thiệu cần cung cấp một cách tổng quan về tài liệu, bao gồm mục đích của tài liệu, các khái niệm, thuật ngữ và các tài liệu tham khảo liên quan.]

### 1.1 Mục đích

[Phần này định nghĩa vai trò và mục đích của tài liệu Đặc tả Yêu cầu Hệ thống, đồng thời giới thiệu bố cục tài liệu. Cần chỉ rõ ai sẽ đọc tài liệu này và sẽ sử dụng nó như thế nào.]

Tài liệu này cung cấp bức tranh toàn cảnh về các yêu cầu của hệ thống {{TÊN_HỆ_THỐNG}} thông qua:

- Mô tả yêu cầu chức năng (Functional Requirements) theo từng phân hệ và chức năng.
- Mô tả yêu cầu phi chức năng (Non-Functional Requirements) bao gồm hiệu năng, bảo mật, và quản trị dữ liệu.
- Ghi nhận và truyền đạt lại những quyết định quan trọng về yêu cầu hệ thống.

### 1.2 Phạm vi

[Mô tả tóm tắt tài liệu SRS phục vụ cho việc gì? Những tác động hoặc ảnh hưởng của tài liệu này là gì?]

### 1.3 Khái niệm, thuật ngữ

[Phần này sẽ cung cấp các định nghĩa của tất cả các khái niệm, thuật ngữ được sử dụng trong tài liệu Đặc tả Yêu cầu Hệ thống.]

| Từ viết tắt / Thuật ngữ | Ý nghĩa | Ghi chú |
|---|---|---|
| {{TỪ}} | {{Ý_NGHĨA}} | |

### 1.4 Tài liệu tham khảo

[Phần này liệt kê danh sách đầy đủ tất cả các tài liệu tham khảo bên ngoài. Mỗi tài liệu được xác định bằng tên tài liệu, nguồn và ngày phát hành.]

| Tên tài liệu | Ngày phát hành | Nguồn | Ghi chú |
|---|---|---|---|
| {{TÊN}} | {{NGÀY}} | {{NGUỒN}} | |

### 1.5 Mô tả tài liệu

[Phần này giới thiệu bố cục của tài liệu Đặc tả Yêu cầu Hệ thống, mô tả từng phần còn lại không thuộc 04 mục trên.]

---

## 2. TỔNG QUAN HỆ THỐNG

### 2.1 Tổng quan chức năng

[Mô tả tổng quan các nhóm chức năng chính của hệ thống. Có thể sử dụng sơ đồ Use Case tổng quan hoặc danh sách phân cấp chức năng (feature tree).]

### 2.2 Mô hình giao tiếp với hệ thống/Module chức năng khác

[Mô tả cách hệ thống giao tiếp với các hệ thống bên ngoài hoặc các module nội bộ khác. Sử dụng sơ đồ kiến trúc hoặc sơ đồ tích hợp nếu có.]

N/A

### 2.3 Mô tả tác nhân

[Liệt kê và mô tả tất cả các tác nhân (người dùng, hệ thống ngoài) có tương tác với hệ thống.]

| STT | Mã tác nhân | Tên tác nhân | Mô tả vai trò | Chức năng được phép truy cập |
|---|---|---|---|---|
| 1 | {{MÃ}} | {{TÊN}} | {{MÔ_TẢ}} | {{CHỨC_NĂNG}} |

---

## 3. ĐẶC TẢ YÊU CẦU CHỨC NĂNG

[Phần này mô tả chi tiết các yêu cầu chức năng của hệ thống, được tổ chức theo phân hệ (Subsystem). Mỗi phân hệ chứa nhiều chức năng; mỗi chức năng được mô tả đầy đủ theo 04 mục con chuẩn: Thông tin chung → Màn hình → Mô tả chi tiết các thành phần → Luồng nghiệp vụ.]

### 3.1 PHÂN HỆ {{TÊN_PHÂN_HỆ_1}}

#### 3.1.1 {{Tên chức năng}}

##### Thông tin chung chức năng

[Mô tả ngắn gọn: đối tượng sử dụng chức năng này là ai, mục đích và phạm vi xử lý của chức năng.]

##### Màn hình

[Chèn ảnh chụp màn hình hoặc wireframe của giao diện chức năng này.]

*(Placeholder — Màn hình chức năng {{Tên chức năng}})*

##### Mô tả chi tiết các thành phần

[Mô tả chi tiết từng thành phần UI trên màn hình (Textbox, Combobox, Button, Label, Grid, Popup, Datapicker, Checkbox...). Với mỗi thành phần, ghi rõ: kiểu dữ liệu, chiều Input/Output, giá trị khởi tạo và mapping với CSDL nếu có.]

| STT | Tên | Kiểu dữ liệu [Độ dài dữ liệu] | Input/Output | Giá trị khởi tạo | Mô tả (Mapping với CSDL nếu có) |
|---|---|---|---|---|---|
| 1 | {{tênThànhPhần}} | {{Textbox / Combobox / Button / Label / Grid / Popup / Checkbox...}} | {{INPUT / OUTPUT}} | {{Giá trị mặc định hoặc NULL}} | {{Mô tả chức năng. Mapping: tên_bảng.TÊN_CỘT}} |
| 2 | | | | | |

##### Luồng nghiệp vụ

[Mô tả chi tiết các bước xử lý của chức năng theo thứ tự thực hiện. Với mỗi bước, mô tả: sự kiện kích hoạt (người dùng làm gì), xử lý hệ thống, kết quả đầu ra. Sử dụng cấu trúc "Nếu...thì...Ngược lại..." cho các điều kiện rẽ nhánh.]

**{{Tên luồng / hành động chính}} (Khi người dùng {{hành động}}):**

1. {{Bước 1 — Chuẩn bị dữ liệu / Điều kiện khởi tạo}}
   - Nếu {{điều kiện A}} thì {{xử lý A}}.
   - Ngược lại thì {{xử lý B}}.
2. {{Bước 2}}
3. {{Bước 3 — Lưu dữ liệu}}
   - Lưu thông tin vào bảng {{TÊN_BẢNG}} với các trường: {{TÊN_BẢNG.FIELD = giá_trị}}.

---

#### 3.1.2 {{Tên chức năng tiếp theo}}

##### Thông tin chung chức năng

*(Cập nhật)*

##### Màn hình

*(Placeholder — Màn hình chức năng {{Tên chức năng}})*

##### Mô tả chi tiết các thành phần

| STT | Tên | Kiểu dữ liệu [Độ dài dữ liệu] | Input/Output | Giá trị khởi tạo | Mô tả (Mapping với CSDL nếu có) |
|---|---|---|---|---|---|
| 1 | *(Cập nhật)* | | | | |

##### Luồng nghiệp vụ

*(Cập nhật)*

---

### 3.2 PHÂN HỆ {{TÊN_PHÂN_HỆ_2}}

#### 3.2.1 {{Tên chức năng}}

##### Thông tin chung chức năng

*(Cập nhật)*

##### Màn hình

*(Placeholder)*

##### Mô tả chi tiết các thành phần

| STT | Tên | Kiểu dữ liệu [Độ dài dữ liệu] | Input/Output | Giá trị khởi tạo | Mô tả (Mapping với CSDL nếu có) |
|---|---|---|---|---|---|
| 1 | *(Cập nhật)* | | | | |

##### Luồng nghiệp vụ

*(Cập nhật)*

---

*[Thêm các phân hệ 3.3, 3.4... tương tự theo danh sách phân hệ trong PTYC/BRD.]*

---

## 4. YÊU CẦU DÙNG CHUNG VÀ TÁI SỬ DỤNG

[Liệt kê các thành phần UI, business logic, API hoặc service có thể được sử dụng lại trên nhiều chức năng. Ví dụ: popup chọn đơn vị, datepicker, datapicker nhân viên, hàm tính toán dùng chung, API tra cứu danh mục...]

N/A

---

## 5. YÊU CẦU PHI CHỨC NĂNG VÀ QUẢN TRỊ DỮ LIỆU

[Liệt kê các yêu cầu/tính năng/giải pháp đáp ứng tiêu chuẩn phi chức năng và quản trị dữ liệu của hệ thống.]

### 5.1 Yêu cầu phi chức năng

[Mô tả các yêu cầu phi chức năng (Non-Functional Requirements) của hệ thống, bao gồm: hiệu năng, độ sẵn sàng, khả năng mở rộng, bảo trì, khả năng dùng được (usability)...]

| STT | Nhóm yêu cầu | Mô tả yêu cầu | Tiêu chí đo lường | Ghi chú |
|---|---|---|---|---|
| 1 | Hiệu năng (Performance) | *(Cập nhật)* | | |
| 2 | Độ sẵn sàng (Availability) | *(Cập nhật)* | | |
| 3 | Khả năng mở rộng (Scalability) | *(Cập nhật)* | | |
| 4 | Bảo trì (Maintainability) | *(Cập nhật)* | | |
| 5 | Khả năng dùng được (Usability) | *(Cập nhật)* | | |

### 5.2 Bảo mật dữ liệu

[Mô tả phân quyền truy cập dữ liệu theo vai trò (RBAC), các cơ chế bảo mật, và yêu cầu giám sát/ghi log chia sẻ dữ liệu.]

**Phân quyền truy cập theo vai trò:**

| Vai trò | Phân hệ / Chức năng | Quyền truy cập | Ghi chú |
|---|---|---|---|
| {{Vai trò}} | {{Phân hệ}} | {{Xem / Tạo / Sửa / Xóa / Duyệt}} | |

**Giám sát chia sẻ dữ liệu:**

[Mô tả các luồng chia sẻ dữ liệu cần ghi log và các giao dịch cần đặt cảnh báo giám sát.]

### 5.3 Chất lượng dữ liệu

[Liệt kê các luật kiểm tra chất lượng dữ liệu (Data Quality Rules) áp dụng cho hệ thống.]

| STT | Luật check | Đối tượng check | Loại tiêu chuẩn đánh giá | Mô tả chi tiết luật đánh giá | Đầu vào cần cung cấp |
|---|---|---|---|---|---|
| 1 | Các field khác null | Field đầy đủ | *(Cập nhật)* | | |
| 2 | Bộ key duy nhất | Row duy nhất | *(Cập nhật)* | | |
| 3 | Loại dữ liệu hợp lệ | Field hợp lệ | *(Cập nhật)* | | |
| 4 | Định dạng dữ liệu cố định | Field hợp lệ | *(Cập nhật)* | | |

### 5.4 Quản lý siêu dữ liệu (Metadata)

#### 5.4.1 Thông tin đối tượng dữ liệu

| STT | Tên đối tượng | Mô tả | Loại đối tượng | Thông tin liên quan | Kiểu dữ liệu | Thời gian tạo | Thời gian chỉnh sửa cuối | Cấp độ bảo mật | Dữ liệu trọng yếu | Đơn vị chủ dữ liệu | Đầu mối quản lý dữ liệu | Đơn vị chủ sở hữu hệ thống | Đầu mối quản trị kỹ thuật |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 01 | *(Cập nhật)* | | | | | | | | | | | | |

#### 5.4.2 Thông tin hệ thống

| STT | Tên ứng dụng | Mô tả | Phiên bản | Đơn vị chủ sở hữu hệ thống | Đầu mối quản trị kỹ thuật |
|---|---|---|---|---|---|
| 01 | *(Cập nhật)* | | | | |

#### 5.4.3 Thông tin luồng dữ liệu

| STT | Tên luồng dữ liệu | Mô tả | Lệnh tổng hợp | Đầu mối quản lý | Hệ thống/nghiệp vụ sử dụng luồng |
|---|---|---|---|---|---|
| 01 | *(Cập nhật)* | | | | |

#### 5.4.4 Thông tin thuật ngữ nghiệp vụ

| STT | Tên thuật ngữ | Tên viết tắt / tên gợi nhớ | Định nghĩa | Quy tắc nghiệp vụ/công thức tính | Đơn vị định nghĩa thuật ngữ | Các thuật ngữ liên quan | Trường dữ liệu liên kết | Thời điểm tạo | Lịch sử chỉnh sửa |
|---|---|---|---|---|---|---|---|---|---|
| 01 | *(Cập nhật)* | | | | | | | | |

### 5.5 Lưu trữ và vận hành

[Mô tả chính sách lưu trữ dữ liệu theo từng loại dữ liệu và yêu cầu backup định kỳ.]

| STT | Nhóm dữ liệu | Tên bảng / Đối tượng | Mô tả | TG lưu trữ tốc độ cao | TG lưu trữ tốc độ trung bình | TG lưu trữ backup offline | Tần suất backup |
|---|---|---|---|---|---|---|---|
| 01 | *(Cập nhật)* | | | | | | |

---

## 6. PHỤ LỤC

[Liệt kê các tài liệu đính kèm: wireframe chi tiết, kết quả khảo sát người dùng, bảng Requirements Traceability Matrix (RTM), v.v.]

*(Cập nhật khi có phụ lục)*
