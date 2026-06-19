---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "Antigravity (AI Business Analyst)"
version: "1.0"
date: "2026-06-19"
status: "Draft"
document_type: "Meeting Minutes"
---

# BIÊN BẢN HỌP — QUY HOẠCH THÔNG TIN QUẢN LÝ TÀU BAY (TOSS)

**Ngày họp:** 26/06/2019 (Dựa theo tên file nguồn `quy hoạch toss 190626.ogg`)  
**Tài liệu nguồn:** `ASR/output/quy hoạch toss 190626.txt`  
**Đối tượng phân tích:** Quy hoạch danh mục tàu bay & cấu hình thông số kỹ thuật trên hệ thống TOSS.

---

## 1. Đồng bộ dữ liệu từ hệ thống SMA (Smart/SMA)
Hệ thống TOSS sẽ đồng bộ tự động danh sách và một số trường thông tin cơ bản của tàu bay từ hệ thống SMA.
* **Các trường thông tin đồng bộ chính:**
  * `AC Registration` (Số đăng ký tàu bay): Đóng vai trò làm khóa chính (Key) để định danh tàu bay.
  * `Valid From` & `Valid To` (Thời gian hiệu lực khai thác): Xác định khoảng thời gian tàu bay được phép khai thác (do đi mua, đi thuê...).
  * *[Thông tin bổ sung]*: Một số thông tin đồng bộ cơ bản khác từ SMA để phục vụ định danh tàu bay.
* **Quy tắc hiển thị:**
  * Khi phát hiện tàu bay mới trên SMA, hệ thống TOSS tự động cập nhật/đồng bộ thông tin về.
  * Trên giao diện chỉnh sửa chi tiết của TOSS, các trường thông tin đồng bộ từ SMA sẽ hiển thị ở dạng **Chỉ đọc (Read-only)**. Người dùng không được phép chỉnh sửa trực tiếp các trường này trên TOSS để đảm bảo tính nhất quán dữ liệu.

---

## 2. Nhóm thuộc tính bổ sung cấu hình trực tiếp trên TOSS
Các thông tin cấu hình phục vụ báo cáo đặc thù và các tính năng nghiệp vụ của TOSS (không có trên hệ thống SMA) sẽ được cấu hình trực tiếp.

### 2.1. 5 Thuộc tính nhóm (Group/App Attributes)
* **Giao diện:** Cung cấp **5 danh sách lựa chọn (Dropdown list)** trên màn hình chi tiết.
* **Nghiệp vụ:** Cho phép liên kết `AC Registration` với các phân loại nhóm (ví dụ: Category 1, Category 2, Category 3...).
* **Mục đích:** Khi người dùng xuất báo cáo, họ có thể lọc danh sách tàu bay theo các Category này để phục vụ các yêu cầu báo cáo đặc thù.

### 2.2. Tham số tiêu thụ nhiên liệu và tải trọng
Cho phép người dùng chỉnh sửa các tham số kỹ thuật sau trên màn hình chi tiết:
* **Mã ICAO/IATA:** Cho phép cấu hình sửa đổi mã ICAO/IATA code của tàu bay.
* **Fuel Flow (Định mức tiêu thụ nhiên liệu):** Kiểu số, đơn vị tính `kg/giờ`.
* **APU Fuel Flow (Định mức tiêu thụ nhiên liệu động cơ phụ):** Kiểu số, đơn vị tính `kg/giờ`.
* **Fuel Capacity (Sức chứa nhiên liệu tối đa):** Đơn vị tính `kg`.
* **Water Tank (Dung tích bồn nước tối đa):** Đơn vị tính `kg`.
* **Cargo Capacity (Tải trọng khoang hàng):** Sức chứa tối đa của khoang hàng hóa/hành lý, đơn vị tính `kg`.

### 2.3. Cấu hình Giới hạn & Hệ số nhiên liệu (AC Fuel Limit & AC Fuel Multiplier)
* **Quy tắc:** Khai báo theo **cặp thông tin** đi kèm nhau.
* **Thời gian hiệu lực:** Khai báo có hiệu lực nối tiếp nhau theo thời gian thực tế (ví dụ: từ sáng hôm nay đến chiều ngày mai, từ chiều ngày mai đến sáng ngày kia...).
* **Mục đích:** Làm cơ sở dữ liệu tính toán giá và xuất báo cáo chi phí liên quan đến nhiên liệu của tàu bay.

### 2.4. Cấu hình Khoang tàu (Config của tàu)
* **Nghiệp vụ:** Khai báo cấu trúc các khoang của tàu bay (Ví dụ: Tàu có 2 khoang hoặc 3 khoang: Khoang A / Khoang B / Khoang C).
* **Giao diện:** Thiết kế ô nhập cấu hình linh hoạt. Cho phép cấu hình tối đa số ô (khoang), khoang nào không tồn tại trên tàu đó thì nhập giá trị bằng `0`.

### 2.5. Trạng thái sở hữu (Ownership Status)
* **Quy tắc luồng nghiệp vụ:**
  * Nếu chọn trạng thái sở hữu đặc thù (Ví dụ: tàu đi thuê/thuê khô/thuê ướt...), hệ thống mở khóa trường **Owner** phía dưới cho phép người dùng tự nhập ký tự tự do.
  * Nếu chọn các trạng thái mặc định khác, giá trị của Owner sẽ tự động hiển thị mặc định là **"Vietnam Airlines"**.

### 2.6. Chỉ số trọng lượng
* **Basic Weight (Trọng lượng cơ bản):** Đơn vị tính `kg`.
* **Max Ramp Weight (Trọng lượng sân đỗ tối đa):** Đơn vị tính `kg`.

---

## 3. Thiết kế Giao diện & Trải nghiệm Người dùng (UI/UX)

### 3.1. Giao diện Danh sách (List View)
* Hiển thị danh sách tàu bay và các thông số cơ bản.
* Nếu giao diện bảng (Table grid) quá đơn điệu, có thể cấu hình hiển thị thêm thông tin cấu hình khoang (`Config`) lên danh sách chính.

### 3.2. Giao diện Chi tiết (Detail View)
Để tránh quá tải thông tin trên một màn hình duy nhất, thông tin chi tiết tàu bay được chia thành các tab hoặc nhóm thông tin:
* **Layout đề xuất:** Chia làm 2 nhóm thông tin lớn hoặc thiết kế Layout chia đôi (Layout 2 cột).
* **Cơ cấu các Tab chi tiết:**
  * **Tab 1: Thông tin chung (General Info):** Các trường định danh từ SMA và thông số cơ bản.
  * **Tab 2: Thông tin cấu hình tàu (Aircraft Config):** Cấu hình các khoang, trọng lượng, nhiên liệu.
  * **Tab 3: Thông tin bổ sung (AK/AC Attributes):** Các tham số cấu hình nâng cao khác.
* *Lưu ý kỹ thuật:* Có thể thiết kế dạng Pop-up chi tiết hoặc màn hình chia đôi (Split view) tùy thuộc vào framework chung của hệ thống.

### 3.3. Lịch sử Thay đổi (Change History/Audit Log)
Hệ thống bắt buộc phải ghi nhận lịch sử thay đổi của các trường cấu hình quan trọng:
* Lịch sử đồng bộ/thay đổi của số đăng ký tàu (`AC Registration`).
* Lịch sử thay đổi định mức nhiên liệu (`AC Fuel Limit` & `AC Fuel Multiplier`) kèm thời điểm thay đổi.
* Lịch sử thay đổi cấu hình khoang (`Config`) do tháo bớt ghế hoặc lắp thêm ghế thực tế.
* Lịch sử thay đổi trạng thái sở hữu (`Ownership Status`) và trọng lượng cơ bản (`Basic Weight`).
* **Tính năng phụ trợ:** Cung cấp bộ lọc (Filter) trên màn hình xem lịch sử thay đổi.

---

## 4. Tầm nhìn mở rộng hệ thống (Scalability)
* Thiết kế giao diện quản lý tàu bay cần chừa không gian hiển thị (ví dụ: Tab bên phải hoặc bổ sung tab ngang) để phục vụ các cấu hình chi tiết khác trong tương lai như:
  * Chi tiết động cơ (Hãng sản xuất, số lượng cánh quạt, thông số kỹ thuật động cơ).
  * Các tác vụ bảo dưỡng, chiếu lệ và thủ tục hành trình nâng cao khác.
* **Giai đoạn 1 (Hiện tại):** Tập trung xây dựng **Tab nhập liệu chi tiết** và **Tab xem lịch sử thay đổi** của tàu bay.

---

## 5. Các điểm cần làm rõ / Thuật ngữ phát âm không rõ trong ASR
Dưới đây là các phần từ file ghi âm phát âm chưa rõ hoặc ghi nhận thô từ công cụ ASR cần được kiểm chứng lại với Nghiệp vụ/Stakeholder:

| Từ gốc trong file ASR | Dự đoán nghiệp vụ | Trạng thái cần làm rõ |
| :--- | :--- | :--- |
| **HDMI** *(Dòng 6: "không có trên HDMI")* | **SMA / SMIS** (Hệ thống nguồn dữ liệu) | *Đã xác nhận:* Người nói nói nhầm thành HDMI, thực tế là dữ liệu không đồng bộ từ SMA về nên phải nhập trên TOSS. |
| **Airwrap / E-wrap** *(Dòng 9, 15)* | **AeroWeb** hoặc **Web App** (Cổng thông tin hàng không) | *Cần làm rõ:* Tên chính xác của phân hệ đích hoặc ứng dụng liên kết (AeroWeb / Web App). |
| **miễn AK / điện AK** *(Dòng 43)* | **Mã AC** (Aircraft Code) hoặc **Định mức AC** | *Cần làm rõ:* Thuật ngữ chính xác của tham số liên quan đến nhiên liệu (định mức AC Fuel Limit). |
| **đáp chín** *(Dòng 119)* | **Tab chính** | *Đã xác nhận:* Yêu cầu lập trình giao diện Tab chính cho người dùng nhập liệu trước. |
