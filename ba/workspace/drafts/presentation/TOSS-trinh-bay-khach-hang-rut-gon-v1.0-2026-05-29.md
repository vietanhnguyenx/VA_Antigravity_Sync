---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "VTIT — Đội dự án TOSS"
version: "1.0"
date: "2026-05-29"
status: "Draft"
document_type: "Presentation Content / Bản rút gọn trình bày"
source: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
target_deck: "VNA_TOSS.pptx"
audience: "Tổng công ty Hàng không Việt Nam (VNA / TCTHK)"
related: "TOSS-noi-dung-trinh-bay-khach-hang-v1.0-2026-05-29.md (kịch bản chi tiết 40 slide)"
---

# TOSS — Bản trình bày rút gọn (16 slide)

> **Đây là bản gọn để trình bày trực tiếp cho khách hàng.** Bản chi tiết 40 slide (kèm thuyết minh dài) nằm ở file `TOSS-noi-dung-trinh-bay-khach-hang` — dùng làm tài liệu tham chiếu khi khách hỏi sâu.
>
> **Tinh thần rút gọn:** mỗi slide một thông điệp, ít chữ, nhiều hình. 15 slide kỹ thuật gộp còn 2. Các phân hệ gộp lại theo nhóm. Số liệu giữ nguyên (đã đối chiếu PDF).
>
> Mỗi slide gồm **📊 Trên slide** (chữ lên slide — ngắn, kèm gợi ý hình 🖼️) và **🎤 Thuyết minh** (lời nói — gọn).
>
> Ký hiệu nguồn: 🟢 từ PPTX · 🔵 bổ sung từ PDF · ⚠️ khung cần đội dự án điền.

---

## Mạch trình bày

| # | Slide | Phần |
|---|-------|------|
| 1 | Trang bìa | Mở đầu |
| 2 | Nội dung trình bày | Mở đầu |
| 3 | Vì sao cần TOSS | 01 Tổng quan |
| 4 | TOSS là gì — 3 việc chính | 01 |
| 5 | Ai dùng & nền tảng | 01 |
| 6 | Năm phân hệ nghiệp vụ | 02 Nghiệp vụ |
| 7 | Điều hành chuyến bay | 02 |
| 8 | Tài liệu & báo cáo | 02 |
| 9 | Danh mục & quản trị | 02 |
| 10 | Kiến trúc tổng thể | 03 Kỹ thuật |
| 11 | Công nghệ, bảo mật, vận hành | 03 |
| 12 | Định cỡ & tuân thủ | 03 |
| 13 | Kế hoạch triển khai | 04 |
| 14 | Cơ cấu nhân sự & phối hợp | 05 |
| 15 | Cam kết & giá trị | Kết |
| 16 | Q&A | 06 |

---

## Slide 1 — Trang bìa 🟢

**📊 Trên slide**
- **TOSS** — Hệ thống Tối ưu Điều hành Khai thác
- Transformative Operations Support System
- Trình bày giải pháp · {{NGÀY}}
- VTIT — Viettel

🖼️ *Logo VNA + Viettel, nền máy bay, tông xanh.*

**🎤 Thuyết minh:** Chào anh chị. Hôm nay chúng tôi trình bày giải pháp cho hệ thống TOSS — hệ thống VNA thuê trọn gói giai đoạn 2026–2031, gồm cả xây dựng và vận hành.

---

## Slide 2 — Nội dung trình bày 🟢

**📊 Trên slide**
- Tổng quan
- Các module nghiệp vụ
- Kiến trúc & công nghệ
- Kế hoạch triển khai & nhân sự
- Trao đổi

🖼️ *Năm chip đánh số, một dòng mỗi chip.*

**🎤 Thuyết minh:** Buổi làm việc đi qua năm phần. Trọng tâm là nghiệp vụ và kỹ thuật. Anh chị cứ ngắt giữa chừng nếu có câu hỏi.

---

# 01 · TỔNG QUAN

## Slide 3 — Vì sao cần TOSS 🔵

**📊 Trên slide**
- Điều hành bay đang chuyển từ **xử lý sự vụ** sang **quyết định dựa trên dữ liệu**
- Ba sức ép: nhiên liệu · đúng giờ · an toàn
- Dữ liệu rải khắp nhiều hệ thống → quyết định chậm
- **TOSS gom dữ liệu về một chỗ — nhìn đủ, quyết nhanh**

🖼️ *Mũi tên "Phản ứng → Dự báo"; nhiều hệ thống rời rạc gom về một màn hình.*

**🎤 Thuyết minh:** Mỗi ngày trực ban phải cân ba thứ cùng lúc — chi phí nhiên liệu, giữ đúng giờ, và an toàn — trong khi dữ liệu lại nằm rải ở hàng chục hệ thống. TOSS sinh ra để gom các luồng đó về một nơi, giúp người điều hành nhìn đủ bức tranh và quyết nhanh hơn.

---

## Slide 4 — TOSS là gì, làm ba việc chính 🟢

**📊 Trên slide**
- Một lớp hội tụ trên các hệ thống VNA đang dùng *(Ops++, AVES, AMOS, MO+, LIDO…)*
- **1.** Điều hành chuyến bay — gom thông tin, cảnh báo sớm
- **2.** Tài liệu chuyến bay — số hóa, đồng bộ MO+
- **3.** Báo cáo & tối ưu — một nguồn số liệu, có khuyến nghị mang dầu

🖼️ *Dải hệ thống nguồn nối vào khối TOSS; bên dưới ba thẻ cho ba việc.*

**🎤 Thuyết minh:** TOSS không thay thế hệ thống nào của VNA, mà đứng trên chúng như một lớp hội tụ. Nó làm ba việc: điều hành chuyến bay với cảnh báo sớm, quản lý tài liệu đồng bộ thẳng với MO+, và báo cáo tối ưu từ một nguồn số liệu duy nhất — trong đó có cả khuyến nghị mang dầu giúp tiết kiệm chi phí.

---

## Slide 5 — Ai dùng & nền tảng 🔵

**📊 Trên slide**
- Người dùng: trực ban · điều phái · CLC hàng hóa-hành khách · đại diện sân bay · quản trị
- Dựng trên: quản lý người dùng tập trung · dữ liệu chủ · cổng API · nền tảng dữ liệu lớn · giám sát 24/7
- Tuân thủ NĐ 53/2022 & NĐ 13/2023 · dữ liệu thuộc VNA · SLA ≥ 99%

🖼️ *Trên: hàng icon 6 persona. Dưới: dải 5 nền tảng + chip tuân thủ.*

**🎤 Thuyết minh:** Sáu nhóm người dùng chính, mỗi nhóm một góc nhìn và bộ quyền riêng. Hệ thống dựng trên năm nền tảng — quản lý người dùng, dữ liệu chủ, cổng API, nền tảng dữ liệu lớn và giám sát tập trung. Hai điểm anh chị quan tâm: tuân thủ Nghị định 53 và 13, và mã nguồn lẫn dữ liệu đều thuộc VNA.

---

# 02 · NGHIỆP VỤ

## Slide 6 — Năm phân hệ nghiệp vụ 🟢

**📊 Trên slide**
- **01** Điều hành chuyến bay *(lõi)*
- **02** Tài liệu chuyến bay
- **03** Báo cáo & tối ưu
- **04** Quản lý danh mục
- **05** Quản trị hệ thống

🖼️ *Sơ đồ năm khối, 01 ở giữa, 04 làm nền. Dùng Hình 1 trong PDF.*

**🎤 Thuyết minh:** Năm phân hệ. Số 01 là lõi nơi dữ liệu hội tụ, số 04 là nguồn dữ liệu chuẩn cho cả hệ thống. Tôi đi nhanh qua từng cái.

---

## Slide 7 — Điều hành chuyến bay 🟢

**📊 Trên slide**
- Một màn hình, đủ thông tin: kế hoạch → dự kiến → thực tế
- **Cảnh báo bằng màu**: hỏng hóc, VIP, chậm chuyến, thiếu phép bay…
- Tàu bay · tổ bay · tải trọng · nhiên liệu · sân bay theo từng chuyến
- Nhúng Flight Radar24, chạy nhiều hãng cùng lúc

🖼️ *Mockup bảng danh sách chuyến bay có vài ô tô màu cảnh báo.*

**🎤 Thuyết minh:** Đây là màn hình trực ban ngồi cả ca. Mỗi chuyến hiện đủ thông tin từ giờ kế hoạch đến giờ thực tế. Điểm hay là cảnh báo bằng màu — hỏng hóc, khách VIP, chậm chuyến, thiếu phép bay đều bật lên ngay để không phải lục tìm.

---

## Slide 8 — Tài liệu & báo cáo 🟢

**📊 Trên slide**
- **Tài liệu**: số hóa cả bộ hồ sơ, quản lý phiên bản, xác nhận điện tử, có Web Mobile cho tổ bay, có kênh dự phòng
- **Báo cáo**: một nguồn số liệu, lọc linh hoạt, xuất PDF/Excel
- Mạnh nhất: phân tích nhiên liệu, đúng giờ, hiệu quả chuyến bay

🖼️ *Trái: vòng đời tài liệu (thu nạp → phiên bản → ký → MO+). Phải: dashboard báo cáo.*

**🎤 Thuyết minh:** Gộp hai phân hệ liên quan. Phần tài liệu biến cả tập hồ sơ giấy thành quy trình số, tổ bay xác nhận ngay trên điện thoại, và luôn có kênh dự phòng để không tắc trước giờ bay. Phần báo cáo, vì số liệu đã sạch và về một mối nên rất đáng tin — mạnh nhất là phân tích nhiên liệu và đúng giờ, đúng cái lãnh đạo cần.

---

## Slide 9 — Danh mục & quản trị 🔵

**📊 Trên slide**
- **Danh mục**: một nguồn sự thật duy nhất, có phiên bản & lịch sử; đồng bộ MEL/CDL từ AMOS; quy tắc Tankering
- **Quản trị**: phân quyền tới từng API, đổi quyền có hiệu lực ngay, MFA, SSO, ghi vết kiểm toán

🖼️ *Trái: Master Data ở giữa cấp cho các module. Phải: luồng đăng nhập qua Keycloak.*

**🎤 Thuyết minh:** Phân hệ danh mục giữ một nguồn sự thật duy nhất, tránh mỗi nơi một bản dữ liệu lệch nhau. Phân hệ quản trị lo bảo mật — phân quyền chi tiết tới từng API, và điểm khác biệt là đổi quyền là chặn được ngay, không phải chờ token hết hạn.

---

# 03 · KỸ THUẬT

## Slide 10 — Kiến trúc tổng thể 🔵

**📊 Trên slide**
- Microservices, cloud-native theo chuẩn mở **CNCF**
- Tách lớp: giao diện · nghiệp vụ · dữ liệu
- Tách dữ liệu vận hành khỏi dữ liệu báo cáo → report nặng không làm chậm điều hành
- Chừa sẵn lớp AI/ML, bật khi cần

🖼️ *Chèn Hình 2 (kiến trúc tổng thể), để hình lớn.*

**🎤 Thuyết minh:** Hệ thống theo kiến trúc microservices, cloud-native chuẩn mở — không khóa vào nhà cung cấp nào. Chia lớp rõ ràng, và có hai điểm đáng chú ý: dữ liệu vận hành tách khỏi dữ liệu báo cáo nên chạy report không làm chậm màn hình điều hành; và đã chừa sẵn chỗ cho AI, khi VNA muốn làm dự báo thì bật thêm chứ không xây lại.

---

## Slide 11 — Công nghệ, bảo mật, vận hành 🔵

**📊 Trên slide**
- **Công nghệ mở, phổ biến**: Kubernetes, Kafka, Keycloak, Redis, Angular, Flutter…
- **Bảo mật nhiều lớp**: mã hóa, phân quyền theo vai trò, chống tấn công, đạt **ATTT cấp độ 3**
- **Vận hành 24/7**: giám sát ba chiều (số liệu–nhật ký–truy vết), cảnh báo sớm, **SLA ≥ 99%**
- Sao lưu mã hóa, khôi phục về đúng mốc thời gian

🖼️ *Ba cột icon: Công nghệ | Bảo mật | Vận hành.*

**🎤 Thuyết minh:** Gộp ba mảng kỹ thuật còn lại. Toàn bộ công nghệ là mã nguồn mở, phổ biến, Viettel đã chạy thật nhiều dự án nên rủi ro thấp. Bảo mật làm nhiều lớp, đạt an toàn thông tin cấp độ 3. Vận hành trực 24/7 với giám sát chủ động, phát hiện trục trặc trước khi người dùng thấy, cam kết sẵn sàng tối thiểu 99%, và có sao lưu để khôi phục về đúng thời điểm trước sự cố.

---

## Slide 12 — Định cỡ & tuân thủ 🔵

**📊 Trên slide**
- Đáp ứng đúng yêu cầu VNA: **200 người dùng đồng thời · 500 request/giây · 5 TB dữ liệu**
- Đề xuất: 311 vCPU · 964 GB RAM · 17.200 GB lưu trữ · 27 máy ảo
- Có dư cho dự phòng và mở rộng

🖼️ *Bảng số liệu gọn, in đậm con số; góc dưới chip "NĐ 53 · NĐ 13 · ATTT cấp 3".*

**🎤 Thuyết minh:** Cấu hình bám đúng yêu cầu hồ sơ VNA — 200 người dùng đồng thời, 500 request mỗi giây, 5 TB dữ liệu — và đã tính dư cho dự phòng cùng mở rộng về sau. Chi tiết bóc tách có đầy đủ trong tài liệu kỹ thuật nếu anh chị cần xem.

---

# 04 · TRIỂN KHAI & NHÂN SỰ

## Slide 13 — Kế hoạch triển khai (Gantt 6 tháng) 🔵 ⚠️

> ⚠️ Theo phản hồi reviewer: triển khai **gọn 6 tháng, tối đa đến T11/2026**, trình bày **dạng Gantt** (Sếp dễ xem). Mốc cụ thể là đề xuất, cần chốt với đội dự án.

**📊 Trên slide** — biểu đồ Gantt, cột tháng T6→T11/2026, 4 giai đoạn:
- **Khảo sát & phân tích** (T6): khảo sát nghiệp vụ; yêu cầu tích hợp & giao diện
- **Phát triển & tích hợp** (T6–T9): hạ tầng; phát triển phân hệ lõi; master data; tích hợp & kiểm thử giao diện
- **Đào tạo & nghiệm thu** (T9–T10): đào tạo key users; UAT; đào tạo người dùng cuối
- **Go-live & ổn định** (T11): chuyển giao vận hành; ổn định hệ thống
- Màu thanh theo bên phụ trách: **VTIT** (xanh) · **VNA** (lục) · **VTIT & VNA** (cam)

🖼️ *Bảng Gantt kiểu MS Project: cột trái tên công việc, cột phải các tháng + thanh tiến độ tô màu. Có chú thích (legend).*

**🎤 Thuyết minh:** Kế hoạch gọn trong sáu tháng, từ tháng 6 đến tháng 11 năm 2026, để dạng Gantt cho dễ theo dõi. Bốn giai đoạn nối tiếp: khảo sát, phát triển và tích hợp, đào tạo và nghiệm thu, rồi go-live và ổn định trong tháng 11. Màu thanh cho biết bên chịu trách nhiệm. Sau go-live là giai đoạn vận hành 5 năm. Các mốc cụ thể sẽ chốt lại cùng đội dự án.

---

## Slide 14 — Cơ cấu nhân sự & phối hợp 🟢 ⚠️

> ⚠️ Khung từ PPTX; chi tiết nhân sự cần điền theo hợp đồng.

**📊 Trên slide**
- **VNA/TCTHK** — chủ quản: nghiệp vụ, nghiệm thu, duyệt thay đổi, an toàn thông tin
- **VTIT** — triển khai: kiến trúc, phát triển, vận hành 24/7, bảo mật
- Phối hợp: hội đồng thay đổi chung · review thứ Sáu hàng tuần · phản hồi trong 6 giờ

🖼️ *Sơ đồ hai nhánh chủ quản ↔ triển khai, gạch nối phối hợp ở giữa.*

**🎤 Thuyết minh:** Hai phía rõ ràng: VNA chủ trì nghiệp vụ và giữ quyền duyệt ở các điểm trọng yếu, Viettel chủ trì xây dựng và vận hành với đội trực 24/7. Hai bên gặp nhau ở hội đồng thay đổi chung và review định kỳ hàng tuần. Ranh giới rõ thì phối hợp đỡ vướng.

---

# KẾT

## Slide 15 — Cam kết & giá trị 🔵

**📊 Trên slide**
- Gom dữ liệu về một mối → quyết định nhanh, đồng bộ
- Tiết kiệm thật: nhiên liệu, đường bay, đúng giờ
- Kiến trúc mở, sẵn sàng cho AI
- An toàn, tuân thủ, dữ liệu thuộc VNA
- Đồng hành vận hành 5 năm, SLA ≥ 99%

🖼️ *Năm chip giá trị có icon, bố cục thoáng.*

**🎤 Thuyết minh:** Tóm lại: TOSS gom dữ liệu vốn rải rác về một chỗ để điều hành nhìn đủ và quyết nhanh, mang lại tiết kiệm cụ thể, kiến trúc mở dùng được lâu dài, an toàn và tuân thủ, dữ liệu thuộc VNA. Và chúng tôi cam kết đồng hành vận hành suốt năm năm.

---

## Slide 16 — Q&A 🟢

**📊 Trên slide**
- **Q & A** — Trao đổi & thảo luận
- {{tên đầu mối}} · {{email}} · {{điện thoại}}

🖼️ *Slide kết thoáng, liên hệ phía dưới.*

**🎤 Thuyết minh:** Cảm ơn anh chị. Mời đặt câu hỏi. Những điểm cần làm rõ chúng tôi sẽ ghi nhận và thống nhất bước tiếp theo.

---

## Ghi chú khi dựng deck rút gọn

- **Bản .pptx đã dựng sẵn:** `TOSS-trinh-bay-khach-hang-rut-gon-v1.0-2026-05-29.pptx` (21 slide, kế thừa theme + font Inter của VNA_TOSS.pptx). Script tái tạo: `build-deck.py`. Sơ đồ trong `assets/`.
- Đã nhúng **sơ đồ thật từ PDF**: Hình 2 (Kiến trúc tổng thể) và Hình 4 (Kiến trúc triển khai). Có sẵn thêm Hình 1 (nghiệp vụ) và Hình 12 (bảo mật) trong `assets/` nếu muốn dùng.
- Khi khách hỏi sâu kỹ thuật → mở bản chi tiết 40 slide để trả lời.
- Điền các ô `{{...}}` trước khi trình bày.
- Sửa lỗi nguồn PDF trang 55: "hệ thống thông tin ngân hàng" → "điều hành khai thác".
