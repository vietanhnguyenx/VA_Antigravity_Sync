---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "VTIT — Đội dự án TOSS"
version: "2.0"
date: "2026-05-29"
status: "Draft"
document_type: "Presentation Content / Kịch bản trình bày"
source: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
target_deck: "VNA_TOSS.pptx"
audience: "Tổng công ty Hàng không Việt Nam (VNA / TCTHK)"
---

# TOSS — Kịch bản trình bày khách hàng

> **Tài liệu này dùng để dựng và cập nhật bộ slide `VNA_TOSS.pptx`** trước khi trình bày cho VNA.
>
> **Hai nguồn, hai vai trò:**
> - `VNA_TOSS.pptx` giữ vai trò **cấu trúc gốc** — bố cục 6 phần, thứ tự, cách gọi tên hệ thống (Ops++, AVES, FSS, AMOS, MO+, LIDO, TIMS, eTechlog, WNI, SPECTRA, Cirium…) đều bám theo deck.
> - PDF *Đề xuất Giải pháp Kỹ thuật v0.3* chỉ **bổ sung nội dung**, chủ yếu cho phần 03 (Kiến trúc & Công nghệ) vốn còn trống trong deck.
> - Chỗ nào không có trong cả hai nguồn đều gắn ⚠️ để đội dự án tự điền.
>
> **Mỗi slide gồm hai phần tách bạch:**
> - **📊 Trên slide** — chữ đưa thẳng lên slide. Ngắn, gọn theo insight; kèm gợi ý hình ảnh (🖼️).
> - **🎤 Thuyết minh** — lời người trình bày nói. Súc tích nhưng đủ ý.
>
> **Ký hiệu trạng thái:** 🟢 giữ từ PPTX · 🟡 PPTX có khung, thêm nội dung PDF · 🔵 slide mới từ PDF · ⚠️ khung đề xuất, cần xác nhận.
>
> **Đã rà soát số liệu với PDF (29/05/2026):** sizing (311 vCPU · 964 GB RAM · 17.200 GB storage · 27 VM · 8.700 GB backup · 200 CCU · 500 req/s · 5 TB) · phiên bản công nghệ (K8s v1.30, Keycloak 25.x, Kafka 3.8.x, Angular ≥20.x…) · SLA ≥ 99% · pháp lý (NĐ 53/2022, NĐ 13/2023, ATTT cấp độ 3 theo NĐ 85/2016 & TT 12/2022) · giai đoạn T8/2026–T8/2031 · chuẩn CNCF.

---

## Bản đồ deck (40 slide)

| # | Slide | Phần | TT |
|---|-------|------|:--:|
| 1 | Trang bìa | Mở đầu | 🟢 |
| 2 | Agenda | Mở đầu | 🟢 |
| 3 | Divider 01 · Tổng quan | 01 | 🟢 |
| 4 | Vì sao cần TOSS | 01 | 🔵 |
| 5 | TOSS là gì — 3 mảng nghiệp vụ | 01 | 🟡 |
| 6 | Năm nền tảng & tuân thủ | 01 | 🔵 |
| 7 | Ai sẽ dùng | 01 | 🟢 |
| 8 | Divider 02 · Module nghiệp vụ | 02 | 🟢 |
| 9 | Bản đồ 5 phân hệ | 02 | 🟡 |
| 10 | Phân hệ 1 — Điều hành chuyến bay | 02 | 🟡 |
| 11 | Phân hệ 2 — Tài liệu chuyến bay | 02 | 🟡 |
| 12 | Phân hệ 3 — Báo cáo & tối ưu | 02 | 🟡 |
| 13 | Phân hệ 4 — Danh mục | 02 | 🔵 |
| 14 | Phân hệ 5 — Quản trị hệ thống | 02 | 🔵 |
| 15 | Luồng tích hợp nội bộ VNA | 02 | 🟡 |
| 16 | Divider 03 · Kiến trúc, công nghệ | 03 | 🟢 |
| 17 | Mục tiêu & nguyên tắc thiết kế | 03 | 🔵 |
| 18 | Kiến trúc tổng thể | 03 | 🔵 |
| 19 | Phân lớp kiến trúc | 03 | 🔵 |
| 20 | Kiến trúc triển khai | 03 | 🔵 |
| 21 | Công nghệ sử dụng | 03 | 🔵 |
| 22 | Tích hợp & API Gateway | 03 | 🔵 |
| 23 | Vòng đời API | 03 | 🔵 |
| 24 | Nền tảng dữ liệu | 03 | 🔵 |
| 25 | Bảo mật nhiều lớp | 03 | 🔵 |
| 26 | Hiệu năng & mở rộng | 03 | 🔵 |
| 27 | Sẵn sàng & sao lưu | 03 | 🔵 |
| 28 | Giám sát & vận hành | 03 | 🔵 |
| 29 | CI/CD & DevOps | 03 | 🔵 |
| 30 | Định cỡ hệ thống | 03 | 🔵 |
| 31 | Divider 04 · Kế hoạch triển khai | 04 | 🟢 |
| 32 | Lộ trình triển khai | 04 | ⚠️ |
| 33 | Môi trường & cách phát hành | 04 | 🔵 |
| 34 | Vận hành & quản lý thay đổi | 04 | 🔵 |
| 35 | Quy tắc phối hợp | 04 | 🟡 |
| 36 | Divider 05 · Cơ cấu nhân sự | 05 | 🟢 |
| 37 | Mô hình tổ chức | 05 | 🟡⚠️ |
| 38 | Phân vai trách nhiệm | 05 | ⚠️ |
| 39 | Cam kết & giá trị | Kết | 🔵 |
| 40 | Q&A | 06 | 🟢 |

---

# MỞ ĐẦU

## Slide 1 — Trang bìa 🟢

**📊 Trên slide**
- **TOSS** — Transformative Operations Support System
- Hệ thống Tối ưu Điều hành Khai thác
- Trình bày giải pháp · Kick-off {{NGÀY_TRÌNH_BÀY}}
- VTIT — Công ty TNHH MTV Đầu tư Công nghệ Viettel

🖼️ *Logo VNA và Viettel hai bên, hình nền máy bay/đường chân trời, tông xanh thương hiệu.*

**🎤 Thuyết minh:** Chào anh chị. Hôm nay chúng tôi xin trình bày giải pháp kỹ thuật cho hệ thống TOSS — hệ thống tối ưu điều hành khai thác mà Vietnam Airlines thuê trọn gói giai đoạn tháng 8/2026 đến tháng 8/2031, gồm cả phần xây dựng lẫn vận hành năm năm.

---

## Slide 2 — Agenda 🟢

**📊 Trên slide**
- 01 · Tổng quan
- 02 · Các module nghiệp vụ
- 03 · Kiến trúc, công nghệ
- 04 · Kế hoạch triển khai
- 05 · Cơ cấu nhân sự, đối ứng
- 06 · Trao đổi & thảo luận

🖼️ *Sáu chip đánh số xếp dọc hoặc lưới 2×3, mỗi chip một màu nhạt.*

**🎤 Thuyết minh:** Buổi làm việc đi qua sáu phần. Hai phần dày nhất là nghiệp vụ và kỹ thuật, nên tôi sẽ dừng lâu hơn ở đó. Phần cuối dành cho trao đổi, anh chị cứ ngắt giữa chừng nếu có câu hỏi.

---

# 01 · TỔNG QUAN

## Slide 3 — Divider 01 🟢

**📊 Trên slide**
- `01 · TỔNG QUAN`

🖼️ *Slide chuyển mục, số "01" cỡ lớn mờ phía sau.*

**🎤 Thuyết minh:** Trước khi vào chi tiết, tôi muốn nói nhanh vì sao bài toán này lại cấp thiết với một hãng bay.

---

## Slide 4 — Vì sao cần TOSS 🔵

**📊 Trên slide**
- Ngành bay đang chuyển từ **xử lý sự vụ** sang **ra quyết định dựa trên dữ liệu**
- Ba sức ép thường trực: giá nhiên liệu · tỷ lệ đúng giờ (OTP) · an toàn bay
- Dữ liệu nằm rải rác ở nhiều hệ thống → quyết định chậm
- TOSS gom dữ liệu về một chỗ để **nhìn đủ, quyết nhanh** (hướng tới CDM)

🖼️ *Mũi tên "Phản ứng → Dự báo"; bên cạnh là cụm icon hệ thống rời rạc gom về một màn hình.*

**🎤 Thuyết minh:** Điều hành khai thác bây giờ khác trước nhiều. Trước đây phần lớn là phản ứng theo sự việc, còn xu hướng hiện tại là dựa vào dữ liệu thực và dự báo để quyết. Mỗi ngày trực ban phải cân ba thứ cùng lúc: chi phí nhiên liệu, giữ đúng giờ, và an toàn — trong khi dữ liệu lại rải ở hàng chục hệ thống khác nhau. TOSS sinh ra để gom các luồng đó về một nơi, cho người điều hành nhìn đủ bức tranh và phối hợp ra quyết định nhanh hơn.

---

## Slide 5 — TOSS là gì, làm ba việc gì 🟡

**📊 Trên slide**
- Một lớp hội tụ trên các hệ thống VNA đang dùng *(Ops++, AVES, AMOS, MO+, LIDO, TIMS, eTechlog…)* — kiến trúc microservices, cloud-native (CNCF)
- **1. Điều hành chuyến bay** — gom và hiển thị mọi thông tin chuyến bay, cảnh báo bất thường
- **2. Tài liệu chuyến bay** — số hóa, quản lý phiên bản, đồng bộ trạng thái với MO+
- **3. Báo cáo & tối ưu** — một nguồn số liệu; có khuyến nghị mang dầu (Tankering)

🖼️ *Ba thẻ ngang cho ba mảng; phía trên là dải hệ thống nguồn nối vào khối "TOSS".*

**🎤 Thuyết minh:** Nói gọn, TOSS không thay thế hệ thống nào của VNA, mà đứng trên chúng như một lớp hội tụ — lấy dữ liệu từ Ops++, AMOS, LIDO, MO+ và nhiều nguồn khác, xử lý theo nghiệp vụ rồi trả lại kết quả. Hệ thống làm ba việc chính: thứ nhất là điều hành chuyến bay, gom mọi thông tin và cảnh báo sớm; thứ hai là quản lý tài liệu chuyến bay theo phiên bản, đồng bộ thẳng với MO+; thứ ba là báo cáo và đánh giá tối ưu từ một nguồn số liệu duy nhất, trong đó có cả phần khuyến nghị mang dầu bổ sung giúp tiết kiệm chi phí.

---

## Slide 6 — Năm nền tảng & tuân thủ 🔵

**📊 Trên slide**
- **IAM** — phân quyền tới từng API, có MFA, SSO, nối LDAP/AD
- **Master Data** — dữ liệu chủ chuẩn, cấp cho hệ khác qua API/Webhook
- **API Gateway** — thay kết nối điểm–điểm, kiểm soát truy cập tập trung
- **Nền tảng dữ liệu lớn** — xử lý cả theo lô lẫn thời gian thực
- **Giám sát tập trung** — SLA tối thiểu 99%, chạy 24/7
- Tuân thủ NĐ 53/2022 & NĐ 13/2023 · mã nguồn, dữ liệu thuộc VNA

🖼️ *Năm khối nền tảng xếp ngang, bên dưới là dải "Tuân thủ pháp lý & chủ quyền dữ liệu".*

**🎤 Thuyết minh:** TOSS dựng trên năm nền tảng. Quản lý người dùng tập trung, phân quyền chi tiết tới từng API, có xác thực đa yếu tố và đăng nhập một lần. Dữ liệu chủ — tàu bay, sân bay, chặng bay, tổ bay — quản lý một chỗ rồi cấp cho các hệ thống khác. Cổng API thay cho mớ kết nối điểm–điểm chằng chịt trước đây. Nền tảng dữ liệu lớn xử lý được cả khối lượng lịch sử lẫn dòng sự kiện thời gian thực. Và toàn bộ được giám sát tập trung với cam kết sẵn sàng tối thiểu 99%. Hai điểm anh chị quan tâm: hệ thống tuân thủ Nghị định 53 về lưu dữ liệu trong nước và Nghị định 13 về dữ liệu cá nhân; mã nguồn và dữ liệu thuộc sở hữu của VNA.

---

## Slide 7 — Ai sẽ dùng 🟢

**📊 Trên slide**
- **Trực ban** — giám sát điều hành theo ca
- **Điều phái** — kế hoạch khai thác, tài liệu chuyến bay
- **CLC hàng hóa & hành khách** — nhập tải, kiểm tra cân bằng tải
- **Đại diện sân bay** — điều phối tại trạm, báo cáo sự kiện
- **Quản trị danh mục** — quản lý dữ liệu dùng chung
- **Quản trị hệ thống** — phân quyền, vận hành hạ tầng

🖼️ *Lưới sáu persona, mỗi ô một icon người + một câu vai trò.*

**🎤 Thuyết minh:** Sáu nhóm người dùng chính. Mỗi nhóm thấy một góc nhìn và bộ quyền riêng — trực ban theo dõi cả mạng bay, điều phái lo kế hoạch và hồ sơ, bên CLC nhập tải, đại diện sân bay báo cáo tại trạm, còn hai nhóm quản trị lo danh mục và hạ tầng. Tôi nhắc trước để khi vào từng module, anh chị dễ hình dung ai làm gì.

---

# 02 · CÁC MODULE NGHIỆP VỤ

## Slide 8 — Divider 02 🟢

**📊 Trên slide**
- `02 · CÁC MODULE NGHIỆP VỤ`

🖼️ *Slide chuyển mục.*

**🎤 Thuyết minh:** Sang phần nghiệp vụ — năm phân hệ làm nên hệ thống.

---

## Slide 9 — Bản đồ 5 phân hệ 🟡

**📊 Trên slide**
- **01** Thông tin điều hành chuyến bay *(lõi)*
- **02** Quản lý tài liệu chuyến bay
- **03** Báo cáo, đánh giá tối ưu khai thác
- **04** Quản lý danh mục *(nguồn dữ liệu dùng chung)*
- **05** Quản trị hệ thống
- Nền chung: tích hợp hai chiều với các hệ nội bộ VNA

🖼️ *Sơ đồ năm khối, khối 01 ở trung tâm; khối 04 đặt làm nền đỡ cho cả nhóm. Có thể dùng Hình 1 (sơ đồ kiến trúc nghiệp vụ) trong PDF.*

**🎤 Thuyết minh:** Đây là bức tranh tổng. Phân hệ 01 là lõi, nơi mọi dữ liệu hội tụ. Phân hệ 04 — quản lý danh mục — đóng vai nguồn dữ liệu chuẩn cho cả hệ thống, nên tôi để nó làm nền. Ba phân hệ còn lại bám vào hai trụ này. Giờ ta đi lần lượt.

---

## Slide 10 — Phân hệ 1: Điều hành chuyến bay 🟡

**📊 Trên slide**
- Một màn hình, đủ thông tin: kế hoạch → dự kiến → thực tế (STD/STA, ETD/ETA, ATD/ATA)
- **Cảnh báo bằng màu**: MEL/CDL, cabin defect, VIP, nối chuyến, load factor thấp, delay, thiếu phép bay/điện văn
- Tàu bay, tổ bay, tải trọng, nhiên liệu, sân bay — gom theo từng chuyến
- Truy vết thay đổi · nhúng Flight Radar24 · chạy nhiều hãng cùng lúc

🖼️ *Ảnh chụp/mockup bảng danh sách chuyến bay với vài ô tô màu cảnh báo. Nếu chưa có UI, dùng wireframe đơn giản.*

**🎤 Thuyết minh:** Đây là màn hình trực ban và điều phái ngồi cả ca. Mỗi chuyến bay hiện đủ từ giờ kế hoạch, giờ dự kiến đến giờ thực tế, kèm tàu bay, tổ bay, tải, nhiên liệu, tình hình sân bay. Điểm tôi muốn nhấn là cơ chế cảnh báo bằng màu — hỏng hóc MEL, khách VIP, hệ số lấp đầy thấp, chậm chuyến, thiếu phép bay đều bật lên ngay để người trực không phải lục tìm. Người dùng tự ẩn hiện cột theo ý mình, xem được lịch sử thay đổi, mở thẳng Flight Radar24 để nhìn vị trí tàu, và điều hành nhiều hãng trên cùng nền tảng.

---

## Slide 11 — Phân hệ 2: Tài liệu chuyến bay 🟡

**📊 Trên slide**
- Số hóa cả bộ hồ sơ: OFP, NOTAM, WX, briefing, LS, GD, PM, NOTOC, Manifest
- Quản lý **phiên bản** từng tài liệu, xem lại lịch sử ban hành
- Luồng xác nhận điện tử: chờ → xác nhận → từ chối, có dấu thời gian
- Đồng bộ trạng thái với **MO+** · có **Web Mobile** cho tổ bay
- **Kênh dự phòng** khi tích hợp tự động trục trặc

🖼️ *Sơ đồ vòng đời một tài liệu: thu nạp → phiên bản → ký/xác nhận → đồng bộ MO+. Kèm icon điện thoại cho phần mobile.*

**🎤 Thuyết minh:** Phân hệ này biến cả tập hồ sơ giấy thành quy trình số. Tài liệu điều hành như OFP, NOTAM, thời tiết được kéo tự động từ LIDO; tài liệu thương mại như loadsheet, manifest lấy từ PSS/DCS. Mỗi tài liệu giữ đủ các phiên bản và lịch sử ban hành, ai cũng truy ngược được. Quan trọng là luồng xác nhận điện tử — tổ bay xác nhận hay từ chối ngay trên Web Mobile, trạng thái đồng bộ thẳng với MO+ theo thời gian thực. Và để không bao giờ tắc trước giờ bay, hệ thống có sẵn kênh độc lập để điều phái cấp tài liệu thủ công nếu đường tích hợp tự động gặp sự cố.

---

## Slide 12 — Phân hệ 3: Báo cáo & tối ưu 🟡

**📊 Trên slide**
- Một nguồn số liệu, lọc linh hoạt, xuất PDF/Excel/Docx
- Khai thác hàng ngày · OTP & biến động lịch · sử dụng đội tàu
- **Nhiên liệu**: Fuel/FH theo tàu–chặng, đối soát kế hoạch vs thực tế, Pilot Extra Fuel
- Thời gian bay theo từng phase · Payload Accuracy · tối ưu đường bay
- Tải trọng, dịch vụ, giờ bay/giờ làm việc của tổ bay · phân tích thời tiết, hiệu quả chuyến

🖼️ *Mockup dashboard: vài biểu đồ cột/đường về nhiên liệu và OTP; bộ lọc bên trái.*

**🎤 Thuyết minh:** Vì dữ liệu đã sạch và về một mối, phần báo cáo trở nên đáng tin để ra quyết định. Có báo cáo nhanh toàn mạng trong 24 giờ, báo cáo đúng giờ và biến động lịch bay, và nhóm báo cáo nhiên liệu — cái mà lãnh đạo quan tâm nhất — so sánh lượng dầu kế hoạch với thực tế, tách riêng phần dầu phi công nạp thêm. Ngoài ra còn phân tích thời gian từng giai đoạn bay, độ chính xác tải trọng, hiệu quả đường bay, và giờ làm việc của tổ bay. Người dùng tự chọn cột, tự lọc phạm vi rồi xuất ra định dạng mình cần.

---

## Slide 13 — Phân hệ 4: Quản lý danh mục 🔵

**📊 Trên slide**
- Một nguồn sự thật duy nhất cho cả hệ thống
- Mỗi bản ghi có **phiên bản + lịch sử** (ai sửa, sửa gì, khi nào)
- Tàu bay (đồng bộ MEL/CDL, defect từ AMOS, chỉ số PF) · Sân bay (Minima, SID/STAR, slot, phí)
- Chặng bay & **quy tắc Tankering** theo giá nhiên liệu
- Tham số vận hành cấu hình ngay trên giao diện

🖼️ *Sơ đồ "Master Data ở giữa, các module vệ tinh lấy dữ liệu qua API/Webhook". Có thể dùng Hình 10 trong PDF.*

**🎤 Thuyết minh:** Phân hệ này tách riêng để giữ một nguồn sự thật duy nhất — tránh chuyện mỗi nơi một bản dữ liệu lệch nhau. Mọi danh mục đều có phiên bản và lịch sử thay đổi đầy đủ. Danh mục tàu bay đồng bộ tình trạng kỹ thuật và defect từ AMOS, lưu chỉ số hiệu suất PF. Danh mục sân bay quản lý từ đường băng, tiêu chuẩn tối thiểu, thủ tục bay đến slot và phí. Phần chặng bay có quy tắc tankering tính theo giá nhiên liệu từng giai đoạn. Và các tham số vận hành — như ngưỡng chênh lệch nhiên liệu hay deadline lập OFP — người có thẩm quyền chỉnh thẳng trên giao diện, không phải nhờ đến IT.

---

## Slide 14 — Phân hệ 5: Quản trị hệ thống 🔵

**📊 Trên slide**
- Quản lý trọn vòng đời tài khoản, phân quyền theo vai trò (RBAC) tới từng API
- Phân quyền đổi là có hiệu lực **ngay**, kể cả token còn hạn
- MFA cho nhóm nhạy cảm · dịch vụ xác thực dùng chung cho hệ sinh thái VNA
- SSO · nối LDAP/AD · cấp quyền tạm có thời hạn, tự thu hồi
- Ghi vết toàn bộ thao tác phục vụ kiểm toán

🖼️ *Sơ đồ luồng đăng nhập: User → IAM (Keycloak) → token → API Gateway kiểm tra. Dùng Hình 15 trong PDF.*

**🎤 Thuyết minh:** Với hệ thống lõi như OCC, bảo mật là chuyện sống còn. TOSS quản lý tài khoản từ lúc tạo đến lúc thu hồi, gán quyền theo vai trò chi tiết tới từng API. Điểm khác biệt là phân quyền theo thời gian thực — khi anh chị khóa một tài khoản hay đổi vai trò của ai đó, hiệu lực có ngay lập tức, không phải chờ token hết hạn. Nhóm quản trị bắt buộc xác thực hai lớp. Hệ thống cho cấp quyền tạm thời có hạn rồi tự thu hồi, và ghi lại mọi hành vi để sau này kiểm toán.

---

## Slide 15 — Luồng tích hợp nội bộ VNA 🟡

**📊 Trên slide**
- **Vào** — Ops++, AVES, FSS, Crew Trip, MO+, MRO/AMOS, TIMS, eTechlog, LIDO…
- **Xử lý** — chuẩn hóa, kiểm tra dữ liệu, áp luật nghiệp vụ trước khi đẩy vào hệ thống
- **Ra** — trả về WNI, Ops++, SPECTRA, Cirium… theo định dạng từng hệ yêu cầu; dựng bảng, biểu đồ trên dashboard TOSS

🖼️ *Sơ đồ ba cột Vào → Xử lý → Ra, mũi tên hai chiều.*

**🎤 Thuyết minh:** Slide này nối phần nghiệp vụ với phần kỹ thuật. Bên trái là các hệ thống TOSS lấy dữ liệu vào. Ở giữa, dữ liệu được chuẩn hóa và kiểm tra trước khi vào xử lý — đây là chỗ TOSS làm sạch để các con số về sau đáng tin. Bên phải, kết quả trả ngược cho các hệ thống khác theo đúng định dạng từng nơi cần. Đáng chú ý là luồng đi cả hai chiều, và mọi thứ đều đi qua một cổng chung để kiểm soát — đó là điều tôi sẽ nói kỹ ở phần kiến trúc ngay sau đây.

---

# 03 · KIẾN TRÚC, CÔNG NGHỆ

## Slide 16 — Divider 03 🟢

**📊 Trên slide**
- `03 · KIẾN TRÚC, CÔNG NGHỆ`

🖼️ *Slide chuyển mục.*

**🎤 Thuyết minh:** Phần này hơi nặng kỹ thuật. Tôi đi theo mạch: mục tiêu, rồi kiến trúc, công nghệ, cách tích hợp, dữ liệu, bảo mật, hiệu năng, vận hành, và cuối cùng là cấu hình phần cứng.

---

## Slide 17 — Mục tiêu & nguyên tắc thiết kế 🔵

**📊 Trên slide**
- **Mục tiêu**: microservices cloud-native (CNCF) · dữ liệu tập trung · tích hợp thống nhất · realtime + batch · sẵn sàng cao · bảo mật thống nhất
- **Nguyên tắc**: tách ba tầng giao diện–nghiệp vụ–dữ liệu · mở rộng ngang · nhiều node dự phòng · cổng API làm điểm vào · giám sát xuyên suốt

🖼️ *Hai cột song song: Mục tiêu | Nguyên tắc. Mỗi cột 5–6 icon nhỏ.*

**🎤 Thuyết minh:** Trước khi xem hình kiến trúc, tôi nói nhanh khung tư duy. Bên mục tiêu, hệ thống theo kiến trúc microservices, cloud-native chuẩn CNCF — tức là chuẩn mở, không khóa vào một nhà cung cấp nào. Bên nguyên tắc, ba tầng giao diện, nghiệp vụ và dữ liệu tách bạch; muốn tăng tải thì thêm máy theo chiều ngang; thành phần quan trọng chạy nhiều node để không chết cả hệ thống khi một chỗ hỏng; mọi truy cập đi qua một cổng chung. Mấy quyết định kỹ thuật phía sau đều bám vào đây.

---

## Slide 18 — Kiến trúc tổng thể 🔵

**📊 Trên slide**
- Phân lớp rõ: truy cập → nghiệp vụ → dữ liệu → hạ tầng
- Một chỗ điều phối chung cho mọi luồng vào ra
- Tách dữ liệu vận hành (OLTP) khỏi dữ liệu phân tích (OLAP)
- Chừa sẵn lớp AI/ML, bật khi cần mà không đụng phần lõi

🖼️ *Chèn Hình 2 (Sơ đồ Kiến trúc tổng thể) trong PDF.*

**🎤 Thuyết minh:** Đây là hình tổng thể. Hệ thống chia lớp rõ ràng, mọi luồng vào ra đều qua một chỗ điều phối chung nên dễ kiểm soát. Có hai điểm tôi muốn anh chị để ý. Một, dữ liệu phục vụ vận hành tách khỏi dữ liệu phục vụ báo cáo — nhờ vậy chạy report nặng không làm chậm màn hình điều hành. Hai, kiến trúc đã chừa sẵn chỗ cho AI và học máy; khi VNA muốn làm dự báo hay tối ưu nâng cao thì bật thêm, không phải đập đi xây lại.

---

## Slide 19 — Phân lớp kiến trúc 🔵

**📊 Trên slide**
- **Presentation** — Web & Mobile, chỉ hiển thị và nhận đầu vào
- **Application/Service** — xử lý nghiệp vụ theo từng miền độc lập
- **Data** — lưu trữ, tách dữ liệu nghiệp vụ và dữ liệu phân tích
- Mỗi lớp chỉ nói chuyện với lớp kế bên → đổi một lớp không ảnh hưởng phần còn lại

🖼️ *Chèn Hình 3 (Sơ đồ phân lớp). Có thể vẽ thêm một mũi tên request đi xuyên ba lớp.*

**🎤 Thuyết minh:** Cụ thể hơn một chút về ba lớp. Lớp giao diện chỉ lo hiển thị và nhận thao tác, không xử lý nghiệp vụ. Lớp dịch vụ ở giữa mới là nơi chạy logic, chia theo từng miền nghiệp vụ riêng. Lớp dữ liệu lo lưu trữ. Một yêu cầu đi từ giao diện xuống dịch vụ, cần dữ liệu thì gọi tiếp xuống lớp dưới rồi trả ngược lên. Vì mỗi lớp chỉ làm việc với lớp liền kề, ta sửa hay nâng cấp một lớp mà không sợ kéo theo cả hệ thống.

---

## Slide 20 — Kiến trúc triển khai 🔵

**📊 Trên slide**
- Phân vùng: ngoài → DMZ → truy cập → ứng dụng → tích hợp → dữ liệu
- Cổng vào: **APISIX** (API Gateway) + **Keycloak** (IAM/SSO), sau lớp tường lửa và **NGINX HA**
- Tích hợp: **MinIO** (file), **Redis** (cache), **Kafka** (sự kiện)
- Dữ liệu: mỗi miền một DB, mô hình **Primary–Replica**, qua **ProxySQL/MaxScale**
- Cô lập tài nguyên từng thành phần → một chỗ quá tải không kéo sập phần khác

🖼️ *Chèn Hình 4 (Sơ đồ kiến trúc triển khai) — slide nặng nhất, nên để hình lớn, chú thích từng vùng.*

**🎤 Thuyết minh:** Đây là hình chi tiết nhất, tôi đi nhanh theo vùng. Người dùng vào từ ngoài, qua tường lửa rồi tới NGINX ở vùng DMZ. Lớp trong là cổng API APISIX và dịch vụ xác thực Keycloak — mọi request đều phải qua đây. Khối nghiệp vụ là các microservice, mỗi nhóm tự co giãn theo tải của nó. Lớp tích hợp gồm MinIO lưu file, Redis làm cache và Kafka chuyển sự kiện. Phần dữ liệu thì mỗi miền nghiệp vụ một cơ sở dữ liệu riêng, chạy mô hình một ghi nhiều đọc. Ba điểm đáng nói: có vùng DMZ tách mạng ngoài với mạng trong; dữ liệu chia theo miền nên sự cố một chỗ không lan ra; và tài nguyên từng thành phần được khoanh lại, tránh chuyện một dịch vụ ngốn hết máy làm chết phần còn lại.

---

## Slide 21 — Công nghệ sử dụng 🔵

**📊 Trên slide**

| Công nghệ | Vai trò | Phiên bản |
|---|---|---|
| Kubernetes | Điều phối container | v1.30 (LTS) |
| GitLab + Runner | CI/CD | 17.x / v2.x |
| LGTM (Loki·Tempo·Mimir·Grafana) | Giám sát tập trung | Grafana 11.x |
| Angular | Web frontend | ≥ 20.x |
| Flutter | Mobile đa nền tảng | 3.x |
| Keycloak | IAM / SSO | 25.x |
| Apache Kafka | Truyền sự kiện realtime | 3.8.x |
| WebSocket / SSE | Giao tiếp realtime | — |
| NGINX + Gzip | Reverse proxy, nén dữ liệu | 1.26.x |
| APISIX · Redis · MinIO · MariaDB · ArgoCD | Gateway · cache · file · DB · GitOps | (theo kiến trúc) |

- Chọn theo bốn tiêu chí: hợp nhu cầu, phổ biến, chi phí hợp lý, dễ bảo trì

🖼️ *Logo các công nghệ xếp thành lưới, bảng phiên bản bên cạnh.*

> *Chín dòng đầu là bảng công nghệ chính thức trong PDF (mục 3.2/3.4). Năm cái cuối là thành phần trong phần kiến trúc, PDF không ghi phiên bản.*

**🎤 Thuyết minh:** Tôi không đọc hết bảng, chỉ nói cái chính. Toàn bộ là công nghệ mã nguồn mở, phổ biến, Viettel đã chạy thật ở nhiều dự án — nghĩa là rủi ro thấp, tài liệu nhiều, dễ tuyển người, và không bị khóa vào một hãng. Việc chọn dựa trên bốn tiêu chí: hợp với yêu cầu và nền tảng VNA đang dùng, đủ phổ biến, chi phí hợp lý, và dễ bảo trì về lâu dài.

---

## Slide 22 — Tích hợp & API Gateway 🔵

**📊 Trên slide**
- Thêm hệ thống tích hợp = thêm **cấu hình**, không sửa code backend
- Ba bước ở cổng: **Route** (định tuyến) → **Plugin** (kiểm tra, chuẩn hóa) → **Upstream** (chuyển tới dịch vụ đích)
- Lớp cấp dữ liệu tách riêng khỏi lớp xử lý nghiệp vụ
- Mọi luồng đều được ghi log và giám sát

🖼️ *Chèn Hình 5 (luồng tích hợp): Client → Route → Plugin → Upstream → Services.*

**🎤 Thuyết minh:** Đây là điểm tôi muốn nhấn mạnh. Khi cần nối thêm một hệ thống mới, đội vận hành chỉ thêm cấu hình ở cổng API chứ không phải sửa và build lại các dịch vụ phía sau. Một request đi qua ba bước: cổng xác định tuyến đường, rồi lớp plugin kiểm tra và chuẩn hóa dữ liệu, rồi chuyển tới đúng dịch vụ đích. Cách làm này giúp mở rộng nhanh, ít rủi ro, và đúng với yêu cầu trong hồ sơ thầu là hạn chế số kết nối trực tiếp giữa các hệ thống.

---

## Slide 23 — Vòng đời API 🔵

**📊 Trên slide**
- Đánh phiên bản trên đường dẫn: `/api/v1` (chính thức), `/api/v2` (bản mới)
- Semantic Versioning: MAJOR phá vỡ tương thích · MINOR thêm tính năng · PATCH sửa lỗi
- Bản chính thức (GA) **không phá vỡ tương thích** trong suốt vòng đời
- Năm giai đoạn: Alpha → Beta → GA → Deprecated → EOL, có báo trước

🖼️ *Dòng thời gian năm giai đoạn, mỗi mốc một màu. Dùng Hình 9 trong PDF.*

**🎤 Thuyết minh:** Phần này cho thấy cách chúng tôi giữ ổn định cho các hệ thống đã nối vào TOSS. API đánh phiên bản ngay trên đường dẫn, và bản chính thức cam kết không thay đổi kiểu phá vỡ tương thích. Mỗi API đi qua năm giai đoạn từ thử nghiệm nội bộ đến ngừng hẳn, và mỗi lần sắp khai tử đều báo trước theo lộ trình rõ ràng — bản chính thức báo trước ít nhất 90 ngày. Nhờ vậy đối tác tích hợp luôn có đủ thời gian cập nhật, không bị đứt giữa chừng.

---

## Slide 24 — Nền tảng dữ liệu 🔵

**📊 Trên slide**
- Tách lớp: thu thập → lưu trữ → xử lý → khai thác
- Nhận đủ kiểu dữ liệu: API, JSON/XML, Kafka, JDBC, log, cả ảnh/video
- Vòng đời nóng → ấm → lạnh, tự chuyển tầng theo chính sách
- Chạy song song theo lô (ETL) và gần thời gian thực
- Truy vết nguồn gốc dữ liệu (lineage) phục vụ kiểm toán

🖼️ *Chèn Hình 11 (kiến trúc Data Platform), kèm dải vòng đời hot/warm/cold.*

**🎤 Thuyết minh:** Nền tảng dữ liệu chia lớp từ khâu thu thập đến khai thác, mỗi lớp mở rộng độc lập. Nó nhận được mọi kiểu dữ liệu, từ API, hàng đợi Kafka, kết nối cơ sở dữ liệu cho tới file phi cấu trúc như ảnh. Dữ liệu mới nằm ở tầng nóng để truy vấn nhanh, một thời gian sau tự dời sang tầng rẻ hơn. Hệ thống xử lý cả theo lô cho báo cáo tổng hợp lẫn gần thời gian thực cho các sự kiện khai thác. Và có truy vết nguồn gốc dữ liệu, nên khi cần kiểm toán thì lần ngược được từ con số cuối về tận nguồn. Đây cũng là nền để sau này làm AI.

---

## Slide 25 — Bảo mật nhiều lớp 🔵

**📊 Trên slide**
- Bảo vệ theo chiều sâu: mạng → hệ điều hành → ứng dụng → dữ liệu
- Xác thực qua Keycloak (OAuth2/OIDC, JWT); phân quyền theo vai trò + ngữ cảnh
- Mã hóa đường truyền TLS từ 1.2; che dữ liệu nhạy cảm khi hiển thị/ghi log
- Chống DDoS/bot, có tường lửa ứng dụng (WAF)
- Kiểm tra lại quyền **mỗi request**, thu hồi tức thì
- Đạt an toàn thông tin **cấp độ 3**

🖼️ *Chèn Hình 12 (sơ đồ bảo mật) hoặc vẽ năm vòng tròn đồng tâm các lớp bảo vệ.*

**🎤 Thuyết minh:** Bảo mật làm theo nhiều lớp, mất một lớp vẫn còn lớp khác chặn. Người dùng và hệ thống ngoài đều xác thực qua Keycloak, phân quyền vừa theo vai trò vừa theo ngữ cảnh như giờ giấc hay địa chỉ truy cập. Mọi đường truyền đều mã hóa, dữ liệu nhạy cảm bị che bớt khi hiển thị hay ghi log. Ở lớp biên có chống tấn công từ chối dịch vụ và tường lửa ứng dụng. Điểm hay nhất là quyền được kiểm tra lại ở từng request chứ không tin tuyệt đối vào token — đổi quyền là chặn được ngay. Toàn bộ tuân theo an toàn thông tin cấp độ 3 theo quy định. *(Lưu ý: bản PDF gốc trang 55 viết nhầm "hệ thống thông tin ngân hàng", cần sửa thành "điều hành khai thác" khi dựng slide.)*

---

## Slide 26 — Hiệu năng & mở rộng 🔵

**📊 Trên slide**
- **Kafka** — băng chuyền sự kiện, tách bên gửi và bên nhận, không nghẽn lúc cao điểm, không mất dữ liệu
- **Redis** — bộ nhớ đệm, đọc trước từ cache nên phản hồi cỡ mili-giây
- Cả hai chạy cụm, thêm node khi tải tăng

🖼️ *Hai khối song song: sơ đồ producer→Kafka→consumer (Hình 19) và cache-aside với Redis (Hình 20).*

**🎤 Thuyết minh:** Hai công nghệ này lo phần realtime mà OCC cần. Kafka như một băng chuyền sự kiện — bên tạo dữ liệu và bên xử lý không phải chờ nhau, nên lúc cao điểm hệ thống hấp thụ tải tốt mà không mất dữ liệu. Redis là bộ nhớ đệm, dữ liệu hay dùng được đọc thẳng từ đó thay vì truy vấn cơ sở dữ liệu, nhờ vậy màn hình phản hồi gần như tức thì. Cả hai đều chạy theo cụm và tăng máy được khi tải lớn dần.

---

## Slide 27 — Sẵn sàng & sao lưu 🔵

**📊 Trên slide**
- Nhiều node chạy song song, tự loại node hỏng, tự chuyển hướng
- Tăng tải thì thêm pod, không gián đoạn dịch vụ
- Sao lưu định kỳ + binary log → khôi phục về đúng mốc thời gian (PITR)
- Backup mã hóa, để off-site; định kỳ test phục hồi
- Cam kết SLA ≥ 99%

🖼️ *Chèn Hình 21 (đảm bảo sẵn sàng); thêm icon chu trình backup → restore.*

**🎤 Thuyết minh:** Vì hệ thống chạy 24/7 nên phải tính cả tình huống hỏng. Các thành phần quan trọng chạy nhiều bản song song; bản nào chết thì hệ thống tự loại và đẩy request sang bản còn sống. Tải tăng thì tự thêm máy mà người dùng không thấy gián đoạn. Về dữ liệu, ngoài sao lưu định kỳ, hệ thống giữ binary log để khôi phục về đúng thời điểm trước sự cố — kể cả khi ai đó thao tác nhầm. Bản backup được mã hóa và để ở nơi tách biệt, lại được test phục hồi định kỳ để chắc là dùng được khi cần. Mức cam kết là sẵn sàng tối thiểu 99%.

---

## Slide 28 — Giám sát & vận hành 🔵

**📊 Trên slide**
- Quan sát ba chiều: số liệu (Metrics) – nhật ký (Logs) – truy vết (Traces) trên LGTM
- Cảnh báo sớm theo ngưỡng, gửi qua nhiều kênh
- Vận hành 24/7 theo quy trình: giám sát, xử lý sự cố, quản lý vấn đề, quản lý thay đổi
- Bộ tiêu chí giám sát chi tiết cho server, database, ứng dụng, hàng đợi

🖼️ *Sơ đồ LGTM nối ba nguồn Metrics/Logs/Traces về Grafana; bên cạnh là vài thẻ cảnh báo mẫu.*

**🎤 Thuyết minh:** Mục tiêu của giám sát là phát hiện trục trặc trước khi người dùng kịp thấy. Hệ thống nhìn ba chiều cùng lúc — số liệu hiệu năng, nhật ký, và truy vết một request đi xuyên các dịch vụ — tất cả gom về Grafana. Khi vượt ngưỡng thì cảnh báo tự bắn qua email hoặc kênh chat. Đội vận hành trực 24/7 làm theo quy trình chuẩn, từ giám sát, xử lý sự cố đến quản lý thay đổi. Tôi muốn khoe một chút: bộ tiêu chí giám sát rất chi tiết, từ CPU, ổ đĩa, đồng bộ cơ sở dữ liệu cho tới tồn đọng hàng đợi — đó là kinh nghiệm vận hành thực chiến của Viettel.

---

## Slide 29 — CI/CD & DevOps 🔵

**📊 Trên slide**
- Cấu hình quản lý trên GitLab, **ArgoCD** tự đồng bộ lên Kubernetes (GitOps)
- Bốn môi trường: DEV → TEST (SIT/UAT) → STAGING → PRODUCTION
- STAGING dựng giống hệt Production để giảm rủi ro Go-Live
- Mọi thay đổi có audit trail và script quay lui (rollback)

🖼️ *Chèn Hình 22/24 (luồng CI/CD); kèm dải bốn môi trường nối tiếp.*

**🎤 Thuyết minh:** Cách phát hành phần mềm theo mô hình GitOps — cấu hình nằm trên GitLab, công cụ ArgoCD tự đồng bộ lên cụm Kubernetes, nên các môi trường luôn nhất quán. Có bốn môi trường tách bạch: phát triển, kiểm thử, staging và production. Staging dựng gần như y hệt production để khi lên thật ít bất ngờ. Mỗi thay đổi đều ghi vết và có sẵn kịch bản quay lui, lỡ có chuyện thì lùi lại nhanh. Riêng production thì mọi thay đổi phải qua hội đồng duyệt — phần này tôi nói kỹ ở mục kế hoạch triển khai.

---

## Slide 30 — Định cỡ hệ thống 🔵

**📊 Trên slide**
- **Yêu cầu VNA**: 5 TB dữ liệu (1.5 DB + 3.5 file) · 200 CCU · 500 request/giây · tái dùng một phần giám sát của MO+
- **Đề xuất**: 311 vCPU · 964 GB RAM · 17.200 GB storage · 27 VM · 3 public IP
- Firewall 2 license · backup 8.700 GB · Hybrid Connect 2 port 200 Mbps

🖼️ *Hai cột: Yêu cầu | Đề xuất. Bên đề xuất dùng bảng số liệu, in đậm con số.*

**🎤 Thuyết minh:** Cấu hình bám theo đúng yêu cầu trong hồ sơ của VNA — phục vụ 200 người dùng đồng thời, 500 request mỗi giây, dung lượng 5 TB. Phần đề xuất gồm 311 vCPU, 964 GB RAM, hơn 17 TB lưu trữ trên 27 máy ảo, cùng firewall, backup và đường kết nối hybrid. Quy mô này đã tính dư cho phần dự phòng sẵn sàng cao và còn chỗ để mở rộng. Nếu anh chị muốn xem chi tiết bóc tách, có đầy đủ trong tài liệu kỹ thuật.

---

# 04 · KẾ HOẠCH TRIỂN KHAI

## Slide 31 — Divider 04 🟢

**📊 Trên slide**
- `04 · KẾ HOẠCH TRIỂN KHAI`

🖼️ *Slide chuyển mục.*

**🎤 Thuyết minh:** Sang phần đưa hệ thống vào chạy thật và vận hành.

---

## Slide 32 — Lộ trình triển khai ⚠️

> ⚠️ Chỉ mốc "T8/2026–T8/2031" là từ PDF. Cách chia giai đoạn bên dưới là **khung gợi ý**, đội dự án thay bằng kế hoạch thật.

**📊 Trên slide**
- Thuê trọn gói: **xây dựng → chuyển giao → vận hành 5 năm** (T8/2026 – T8/2031)
- GĐ1 Khởi động & phân tích — `{{thời gian}}`
- GĐ2 Phát triển theo phân hệ, làm lõi trước — `{{thời gian}}`
- GĐ3 Tích hợp & kiểm thử (SIT/UAT) — `{{thời gian}}`
- GĐ4 Go-Live & ổn định — `{{ngày}}`
- GĐ5 Vận hành & bảo trì đến T8/2031

🖼️ *Dòng thời gian năm chặng, đánh dấu mốc Go-Live nổi bật.*

**🎤 Thuyết minh:** Đây là mô hình thuê trọn gói: Viettel xây, chuyển giao, rồi vận hành suốt năm năm. Tôi đề xuất làm theo từng phân hệ, ưu tiên phân hệ lõi trước để VNA thấy kết quả sớm thay vì chờ đến cuối. Sau khi tích hợp với các hệ thống nguồn và nghiệm thu xong thì Go-Live, rồi bước vào giai đoạn vận hành dài hạn. Các mốc thời gian cụ thể chúng tôi sẽ chốt cùng anh chị — phần này còn để trống chờ thống nhất.

---

## Slide 33 — Môi trường & cách phát hành 🔵

**📊 Trên slide**
- **DEV** phát triển nội bộ → **TEST** kiểm thử & nghiệm thu → **STAGING** kiểm tra cuối → **PRODUCTION** chạy thật
- TEST và PRODUCTION cần phê duyệt mới triển khai
- Production tuân theo quản lý thay đổi ITIL
- Hotfix: build nhanh → duyệt → đẩy lên → đồng bộ ngược các nhánh

🖼️ *Bốn ô môi trường nối tiếp bằng mũi tên, ô Production có icon ổ khóa/duyệt.*

**🎤 Thuyết minh:** Quy trình phát hành đi qua bốn môi trường. Code chạy ổn ở môi trường phát triển mới sang kiểm thử để nghiệp vụ nghiệm thu, rồi qua staging — vốn dựng giống production — trước khi lên thật. Lên production luôn cần phê duyệt và tuân theo quản lý thay đổi. Khi có sự cố khẩn thì có đường hotfix riêng: build nhanh, duyệt gấp, đẩy lên rồi đồng bộ ngược lại cho các nhánh khác để không lệch.

---

## Slide 34 — Vận hành & quản lý thay đổi 🔵

**📊 Trên slide**
- Vận hành 24/7 với một đầu mối tiếp nhận
- Quy trình chuẩn: giám sát → xử lý sự cố → quản lý vấn đề (RCA) → bảo dưỡng
- Thay đổi trên production qua hội đồng **CAB/ECAB**, có ghi vết
- Yêu cầu kỹ thuật tiếp nhận qua hệ thống GNOC

🖼️ *Hai khối: vòng tròn quy trình O&M | luồng duyệt CR qua CAB.*

**🎤 Thuyết minh:** Phần vận hành chạy 24/7 với một đầu mối duy nhất tiếp nhận và xử lý. Mọi việc theo quy trình chuẩn: giám sát phát hiện, xử lý sự cố, phân tích nguyên nhân gốc, rồi bảo dưỡng định kỳ. Điểm quan trọng với hệ thống lõi là mọi thay đổi trên môi trường thật đều phải qua hội đồng tư vấn thay đổi duyệt trước, và đều được ghi vết. Đây là cam kết chất lượng dịch vụ kéo dài suốt năm năm chứ không chỉ lúc bàn giao.

---

## Slide 35 — Quy tắc phối hợp 🟡

**📊 Trên slide**
- Lập group Viber chung trao đổi nhanh
- Review tiến độ chiều thứ Sáu hàng tuần
- Mail xác nhận phản hồi trong 6 giờ
- Go-live hay build mới: VTIT lên kế hoạch tác động, TCTHK xác nhận
- `{{bổ sung: đầu mối trực sự cố khẩn, SLA phản hồi theo mức ưu tiên}}`

🖼️ *Danh sách checklist với icon tick; logo Viber/mail minh họa.*

**🎤 Thuyết minh:** Vài quy tắc làm việc giữa hai bên cho trơn tru. Có group chung để trao đổi nhanh, chiều thứ Sáu review tiến độ, mail xác nhận trong vòng sáu tiếng. Mỗi lần go-live hay đưa bản mới lên thì VTIT lên kế hoạch tác động trước và cần TCTHK xác nhận. Tôi đề nghị bổ sung thêm đầu mối trực sự cố khẩn và mức cam kết phản hồi theo độ ưu tiên — phần này ta thống nhất sau.

---

# 05 · CƠ CẤU NHÂN SỰ

## Slide 36 — Divider 05 🟢

**📊 Trên slide**
- `05 · CƠ CẤU NHÂN SỰ`

🖼️ *Slide chuyển mục.*

**🎤 Thuyết minh:** Phần cuối trước khi trao đổi — cách hai bên tổ chức và phối hợp nhân sự.

---

## Slide 37 — Mô hình tổ chức 🟡⚠️

> ⚠️ Khung "đơn vị chủ quản / đơn vị triển khai" lấy từ PPTX. Chi tiết vai trò bên dưới là gợi ý, cần thay bằng nhân sự thật.

**📊 Trên slide**
- **Chủ quản — TCTHK/VNA**: ban chỉ đạo · đầu mối nghiệp vụ (OCC, điều phái, kỹ thuật) · đầu mối CNTT & ATTT
- **Triển khai — VTIT**: giám đốc dự án & PMO · kiến trúc sư · BA · nhóm phát triển & QA · DevOps & bảo mật · đội vận hành 24/7
- Phối hợp qua hội đồng thay đổi chung và lịch review định kỳ

🖼️ *Sơ đồ tổ chức hai nhánh đối xứng, gạch nối ở giữa thể hiện cơ chế phối hợp.*

**🎤 Thuyết minh:** Dự án có hai phía. Phía VNA gồm ban chỉ đạo, các đầu mối nghiệp vụ bên OCC, điều phái, kỹ thuật, và đầu mối công nghệ thông tin. Phía Viettel có giám đốc dự án, kiến trúc sư, đội phân tích nghiệp vụ, nhóm phát triển và kiểm thử, đội DevOps cùng bảo mật, và quan trọng là đội vận hành trực 24/7. Hai bên gặp nhau ở hội đồng thay đổi chung và các buổi review định kỳ. Tên và số lượng nhân sự cụ thể chúng tôi sẽ điền theo hợp đồng.

---

## Slide 38 — Phân vai trách nhiệm ⚠️

> ⚠️ Bảng dưới là gợi ý, cần tinh chỉnh theo hợp đồng VNA–VTIT.

**📊 Trên slide**

| Việc | VNA/TCTHK | VTIT |
|---|---|---|
| Yêu cầu & nghiệp vụ | Chủ trì | Tư vấn |
| Mở truy cập hệ thống nguồn | Chủ trì | Phối hợp |
| Kiến trúc & phát triển | Duyệt | Chủ trì |
| Nghiệm thu UAT | Duyệt | Hỗ trợ |
| Duyệt thay đổi Production | Duyệt | Thực hiện |
| Vận hành 24/7 | Giám sát | Chủ trì |
| An toàn thông tin | Giám sát | Thực hiện |

🖼️ *Bảng RACI gọn, tô màu cột chủ trì.*

**🎤 Thuyết minh:** Bảng này phân định ai làm gì cho rõ, tránh chồng chéo. VNA chủ trì phần yêu cầu nghiệp vụ và mở truy cập các hệ thống nguồn, giữ quyền duyệt ở những điểm trọng yếu như nghiệm thu, thay đổi production và an toàn thông tin. Viettel chủ trì xây dựng và vận hành. Ranh giới rõ thì phối hợp đỡ vướng. Bảng này ta sẽ chốt lại theo điều khoản hợp đồng.

---

# KẾT

## Slide 39 — Cam kết & giá trị 🔵

**📊 Trên slide**
- Gom dữ liệu khai thác về một mối → quyết định nhanh, đồng bộ
- Tiết kiệm thật: tankering, tối ưu nhiên liệu & đường bay, nâng đúng giờ
- Kiến trúc mở, sẵn sàng cho AI/ML
- An toàn, tuân thủ pháp lý, dữ liệu thuộc VNA
- Đồng hành vận hành 5 năm, SLA ≥ 99%

🖼️ *Năm chip giá trị có icon; tông màu thương hiệu, bố cục thoáng.*

**🎤 Thuyết minh:** Tóm lại vì sao nên chọn giải pháp này. TOSS gom dữ liệu vốn rải rác về một chỗ để điều hành nhìn đủ và quyết nhanh. Nó mang lại tiết kiệm cụ thể qua tankering và tối ưu nhiên liệu, đường bay, đúng giờ. Kiến trúc mở nên dùng được lâu dài và sẵn sàng cho AI sau này. Hệ thống an toàn, tuân thủ pháp lý, và dữ liệu thuộc về VNA. Cuối cùng, chúng tôi cam kết đồng hành vận hành suốt năm năm với mức sẵn sàng tối thiểu 99%.

---

## Slide 40 — Q&A 🟢

**📊 Trên slide**
- **Q & A**
- Trao đổi & thảo luận
- {{tên đầu mối}} · {{email}} · {{điện thoại}}

🖼️ *Slide kết, để khoảng trống lớn, thông tin liên hệ phía dưới.*

**🎤 Thuyết minh:** Cảm ơn anh chị đã lắng nghe. Mời anh chị đặt câu hỏi. Những điểm cần làm rõ thêm chúng tôi sẽ ghi nhận và cập nhật vào tài liệu, rồi thống nhất các bước tiếp theo.

---

## Phụ lục — Hình cần chèn từ tài liệu kỹ thuật

| Slide | Hình PDF | Nội dung |
|---|---|---|
| 9 | Hình 1 | Kiến trúc nghiệp vụ |
| 18 | Hình 2 | Kiến trúc tổng thể |
| 19 | Hình 3 | Phân lớp kiến trúc |
| 20 | Hình 4 | Kiến trúc triển khai |
| 22 | Hình 5 | Luồng tích hợp |
| 23 | Hình 9 | Vòng đời API |
| 24 | Hình 11 | Data Platform |
| 25 | Hình 12 | Sơ đồ bảo mật |
| 26 | Hình 19, 20 | Kafka / Redis |
| 27 | Hình 21 | Đảm bảo sẵn sàng |
| 29 | Hình 22, 24 | Luồng CI/CD |
| 14 | Hình 15 | Luồng xác thực |
| 13 | Hình 10 | Quản trị danh mục |

> Cách nhanh: xuất trực tiếp các trang PDF có sơ đồ (trang 8, 27, 29, 32, 41, 45, 48, 51, 55, 60, 64, 65, 66, 77–79) thành ảnh rồi chèn vào slide tương ứng — vừa đúng nội dung đã duyệt, vừa nhanh.

---

## Việc cần làm trước khi phát hành deck

- [ ] Điền các ô `{{...}}`: ngày trình bày, mốc tiến độ, ngày Go-Live, nhân sự, liên hệ.
- [ ] Chèn các hình theo bảng phụ lục.
- [ ] Sửa lỗi trong nguồn: cụm "hệ thống thông tin ngân hàng" (PDF trang 55) → "điều hành khai thác".
- [ ] Đối chiếu lại số sizing và SLA với hồ sơ thầu/hợp đồng.
- [ ] Duyệt phần 04 và 05 với đội dự án (PDF cung cấp ít chi tiết).
- [ ] Soát thuật ngữ song ngữ theo glossary dự án.
