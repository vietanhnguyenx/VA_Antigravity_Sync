---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
survey_date: "2026-06-12"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Phỏng vấn Dispatcher buổi sáng 12/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi sáng 12/06/2026 (Phỏng vấn Dispatcher)

> Báo cáo tổng hợp buổi sáng ngày 12/06/2026 (Phần 1 + Phần 2). Phần 1 bàn về màn chi tiết chuyến bay (Flight Detail) và cấu trúc Flight Number trên Netline. Phần 2 đi sâu thiết kế màn hình **Giám sát chuyến bay (Flight Monitoring)** của điều phái — toàn bộ Phần 2 được thảo luận trực tiếp trên **bản mẫu giao diện** `dsp_monitoring_poc.html` (Flight Monitoring — DSP) do đội phân tích trình bày.

## I. Thông tin chung

- **Thời gian:** buổi sáng ngày 12/06/2026 (hai phần nối tiếp).
- **Đối tượng phỏng vấn:** điều phái viên (Dispatcher) của VNA — chị Lê, anh Dũng, anh Bình.
- **Phía khảo sát:** đội phân tích nghiệp vụ TOSS (anh Dương và nhóm).
- **Tài liệu trực quan:** bản mẫu giao diện `dsp_monitoring_poc.html` — màn Flight Monitoring (sidebar điều hướng, topbar thống kê, thanh bộ lọc, bảng giám sát nhiều cột, mã màu trạng thái) — được dùng làm cơ sở thảo luận thiết kế chi tiết.
- **Mục đích:** (1) thống nhất hình thức hiển thị Flight Detail và cấu trúc tab phụ; (2) làm rõ cấu trúc Flight Number trên Netline; (3) thiết kế chi tiết màn Giám sát: phân quyền theo phạm vi, quy ước giao diện chung, bộ mã màu cảnh báo, cơ chế "trôi" theo thời gian và logic cảnh báo của từng cột (Tàu bay, Dispatch Release, Flight Number, ETA/IN).
- *Lưu ý nội bộ: chất lượng ghi âm buổi sáng kém ở một số đoạn (Phần 1 và cuối Phần 2); một số thuật ngữ tiếng Anh nhận dạng sai đã được suy luận theo ngữ cảnh; nội dung chưa chắc chắn được đưa vào mục IV để đối chiếu lại.*

---

# PHẦN 1 — Màn chi tiết Flight Detail và cấu trúc Flight Number trên Netline

## II. Nội dung trao đổi (chủ đề 1–3)

### 1. Hình thức hiển thị Flight Detail: pop-up từ trên xuống vs tab mới

#### Yêu cầu
- Điều phái cần cơ chế hiển thị chi tiết chuyến bay (Flight Detail) truy cập nhanh, hạn chế cuộn, cho phép mở nhiều chuyến để tham chiếu. (P1 d.1–11)

#### Thảo luận – Đề xuất
- Phương án pop-up dạng "từ trên xuống dưới" gom thông tin theo nhóm thu/mở: hạn chế là độ dài các phần khác nhau nên phải kéo chuột, chậm hơn click. (P1 d.2–12, 24–27)
- Nhu cầu so sánh hai chuyến cùng lúc: điều phái xác nhận không phức tạp đến mức phải so sánh đồng thời; khi cần thì mở hai cửa sổ riêng. (P1 d.13–23)
- Phương án thay thế: từ màn Giám sát, click một chuyến → nhảy sang **một tab mới** chứa Flight Detail của chuyến đó; cho phép mở nhiều tab. (P1 d.91–105)
- Khi click vào một cảnh báo bên ngoài → mở Flight Detail và **active đúng tab phụ** chứa thông tin tương ứng (click cảnh báo OFP Release → tab OFP Release; click cảnh báo NOTAM/thời tiết → tab NOTAM/thời tiết). (P1 d.191–223)

#### Kết luận
- Click chuyến từ màn Giám sát → mở **một tab mới** Flight Detail (không dùng pop-up duy nhất); cho phép mở **nhiều tab** đồng thời.
- Click vào một cảnh báo → mở Flight Detail và **active đúng tab phụ** tương ứng với cảnh báo đó.

### 2. Cấu trúc các tab phụ và lịch sử (history) trong Flight Detail

#### Yêu cầu
- Flight Detail phải hiển thị **toàn bộ vết thông tin** từ đầu đến cuối chuyến, không chỉ trạng thái cuối — phục vụ truy vết. (P1 d.85–87)

#### Thảo luận – Đề xuất
- Hình dung sơ bộ của điều phái về các tab phụ:
  - **Tab Cảnh báo (Warnings):** từ đầu đến cuối chuyến đã phát sinh cảnh báo gì, đã xử lý hay chưa, thời gian phát sinh và thời gian "kích" cảnh báo (raise time). (P1 d.43–51)
  - **Tab Flight Release (gồm Dispatch Release và Pilot Release):** bên ngoài chỉ cảnh báo trạng thái tổng quát và việc Pilot Release đã đến bản cuối do điều phái phát hành hay chưa; bên trong hiển thị toàn bộ phiên bản OFP đã phát hành kèm thông tin cơ bản (Block Fuel kế hoạch, Block Fuel trên OFP, lượng phi công confirm, có lấy thêm tải/dầu (extra) hay không và lý do). (P1 d.52–74)
  - **Tab Tàu bay (Aircraft):** hiện trạng tàu, MEL/CDL, lưu ý về tàu quay. (P1 d.75–79) *(cụm "FTP Mail CDL", "vơ phong tàu quay" cần đối chiếu lại — mục IV)*
  - **Tab Tổ bay (Crew):** luồng thay đổi tổ bay — gán ban đầu cho ai, đổi bởi ai/lúc nào, cuối cùng là ai — lưu đầy đủ "story", không chỉ trạng thái cuối. (P1 d.80–87)
- Nguyên tắc: mỗi tab phụ là một nhóm thông tin nghiệp vụ độc lập; click cảnh báo dẫn thẳng tới tab tương ứng. (P1 d.196–223)

#### Kết luận
- Flight Detail gồm nhiều tab phụ, tối thiểu: **Cảnh báo**, **Flight Release (Dispatch Release + Pilot Release)**, **Tàu bay (kèm MEL/CDL)**, **Tổ bay** — chi tiết hóa ở buổi sau.
- Mỗi tab hiển thị **đầy đủ lịch sử thay đổi** từ đầu đến cuối chuyến; tab cảnh báo hiển thị "raise time" và trạng thái xử lý.

### 3. Cấu trúc dữ liệu Flight Number trên Netline (3 cột) và lịch sử đổi giờ EPD

#### Yêu cầu
- Cần thống nhất cách tách dữ liệu Flight Number trên Netline khi tích hợp về TOSS, phục vụ hiển thị và phân quyền/lọc theo hãng. (P1 d.139–149)

#### Thảo luận – Đề xuất
- Trên Netline, Flight Number được tách **3 cột riêng biệt** (P1 d.150–163):
  - **Cột 1 — Carrier:** mã hãng (vd VN…) hoặc mã khác. (P1 d.152–153)
  - **Cột 2 — Fly Number:** chỉ phần số của số hiệu chuyến (vd 247). (P1 d.154–158)
  - **Cột 3 — FN Surface (suffix):** ký tự hậu tố `Z` hoặc `D`, cho biết chuyến có chuyển/delay sang ngày sau hay không. (P1 d.159–163)
- Khi tích hợp Netline, TOSS lấy dữ liệu đã tách 3 cột; phân biệt được 393 (cột 2) khác 393D (cột 2 + cột 3). (P1 d.168–173)
- **Leg history của Netline:** ghi nhận từng lần thay đổi giờ EPD của chuyến — thời điểm thay đổi, chuyển từ ngày nào sang ngày khác, mức delay bao nhiêu giờ; được khẳng định "đầy đủ", TOSS đối chiếu/đồng bộ từ Netline, không tự xây song song. (P1 d.174–183)

#### Kết luận
- TOSS lấy Flight Number **3 cột tách biệt từ Netline** (carrier, fly number, FN suffix D/Z) và hiển thị gộp trên màn Giám sát.
- Lịch sử thay đổi giờ EPD (leg history) lấy từ Netline.
- Ý nghĩa chính xác của ký tự `Z` so với `D` cần làm rõ (mục IV).

---

# PHẦN 2 — Thiết kế màn hình Giám sát chuyến bay (trên bản mẫu dsp_monitoring_poc.html)

### 4. Bản mẫu giao diện Giám sát và quy ước thể hiện cảnh báo trong ô bảng

#### Yêu cầu
- Màn Giám sát là một bảng tổng quan nhiều chuyến, cảnh báo các vấn đề cần lưu ý trước/trong/sau chuyến (NOTAM, thời tiết, đổi giờ, lệch tải, MEL/CDL, Dispatch Release…), cho phép xem chi tiết của từng lưu ý để biết action. (P2 d.1–13, 53–71)
- Toàn bộ cảnh báo theo bộ quy trình chuẩn của điều phái; bản quy trình chỉ để tham khảo, vận hành vẫn linh hoạt giữa TOSS và Lido. (P2 d.20–32)

#### Thảo luận – Đề xuất
- Đội phân tích trình bày một **bản mẫu giao diện** ("bản gian tạm") để thống nhất chi tiết: mỗi dòng là một chuyến, các cột thể hiện tàu, tuyến, giờ, trạng thái và các cảnh báo. (P2 d.288–296)
- **Cách thể hiện cảnh báo trong ô:** thống nhất **tô màu cả ô (cell-level)**, không "bo box", không chỉ đổi màu chữ — tô full nền ô. Điều phái quen nhìn nguyên ô được tô màu. (P2 d.482–498)
- Trên bản mẫu có hai kiểu thể hiện đang đặt cạnh nhau để chọn: cột "Missing Document" bó thành box, và các cột khác chỉ đổi màu chữ — điều phái không thích kiểu phức tạp, ưu tiên ký hiệu **đơn giản (tích / tam giác)**, càng đơn giản càng tốt; cột Missing Document giữ kiểu hiện có. (P2 d.508–534)
- Bản mẫu đang vẽ nhiều màu để minh họa; thực tế đa phần các dòng sẽ ở trạng thái phông nền bình thường (không màu), cảnh báo chỉ chiếm số ít. (P2 d.1175–1191)

#### Kết luận
- Màn Giám sát trình bày dạng bảng, mỗi dòng một chuyến; **tô màu cả ô** để thể hiện cảnh báo (không bo box, không chỉ đổi màu chữ).
- Ưu tiên ký hiệu trạng thái đơn giản; cột Missing Document giữ cách thể hiện danh sách tài liệu thiếu.

### 5. Phân quyền view theo phạm vi (role / carrier) và lưu cấu hình theo profile

#### Yêu cầu
- Mỗi điều phái có **phạm vi chức nhiệm** khác nhau (vd điều phái khu vực châu Âu/Mỹ, Hàn, khu vực khác); màn Giám sát cần mặc định hiển thị đúng phạm vi từng người nhưng vẫn xem rộng hơn khi cần. (P2 d.72–96)

#### Thảo luận – Đề xuất
- **Chức năng giống nhau** giữa các user; chỉ **phạm vi dữ liệu (view)** khác nhau theo role. (P2 d.88–93, 109–111)
- Phân quyền hai lớp: **phân quyền chức năng** (ai dùng chức năng gì) và **phân quyền dữ liệu** (scope theo carrier/khu vực/đường bay). (P2 d.156–179)
- Cấp quản trị: super admin xem toàn bộ; có **sub-admin** phân chia view theo nhiệm vụ vì điều phái có thể **rotate vị trí trong ca**. User có thể được định nghĩa nhiều role và **chọn xem role của mình hoặc role của người khác** (switch view). (P2 d.133–154)
- **Filter mặc định gắn theo phạm vi** của role; user vẫn search/chọn phạm vi khác khi cần. (P2 d.181–197)
- Khi user mở tab Giám sát, hệ thống **load cấu hình đã lưu của user đó** (cột hiển thị, filter…); lưu vào **profile cá nhân (mức user)**, không theo máy — đăng nhập máy nào cũng giữ nguyên. Tối thiểu chỉ cần lưu **trạng thái gần nhất** (last-used), không cần lưu data. (P2 d.198–229)
- Thanh **bộ lọc thu/mở (expand/collapse)** để tối ưu diện tích; mặc định mở giữ cấu hình mặc định. (P2 d.240–268)

#### Kết luận
- Phân quyền **2 lớp**: chức năng + dữ liệu (theo carrier/khu vực/role).
- User có thể có **nhiều role** và **switch view**; super admin xem toàn bộ; có sub-admin phân chia theo nhiệm vụ.
- Filter + cấu hình hiển thị + "trạng thái gần nhất" lưu ở **profile cá nhân** (không theo máy).
- Bộ lọc có cơ chế **thu/mở**.

### 6. Quy ước giao diện chung (ngôn ngữ, giờ, format, theme)

#### Yêu cầu
- Chốt quy ước giao diện chung từ đầu để đội phát triển nắm, tránh sửa về sau. (P2 d.285–287)

#### Thảo luận – Đề xuất (chị Lê chốt)
- **Ngôn ngữ giao diện: 100% tiếng Anh**, không dùng tiếng Việt. (P2 d.270–272)
- **Mọi giờ là UTC** — kể cả khi user submit từ thiết bị theo giờ Việt Nam, history ghi nhận trong hệ thống đều là UTC. (Bản demo còn vướng phần giờ, cần sửa.) (P2 d.273–281)
- **Format giờ luôn 24h**, không dùng 12h (AM/PM). (P2 d.282–283)
- **Theme:** ưu tiên tối ưu **dark mode** giai đoạn đầu (điều phái làm ca đêm, nhìn nền trắng lóa/đau mắt); trên nền tối các màu cảnh báo nổi hơn; light mode tinh chỉnh sau. (P2 d.538–568)

#### Kết luận
- Giao diện **tiếng Anh** + **giờ UTC** + **format 24h** + **dark mode ưu tiên** — áp dụng toàn bộ TOSS.

### 7. Bộ mã màu cảnh báo (4 trạng thái) áp dụng thống nhất mọi cột

#### Yêu cầu
- Cần một **bộ mã màu thống nhất** dùng xuyên suốt mọi cột; tránh cùng một màu mang nghĩa khác nhau ở các cột khác nhau. (P2 d.452–469)

#### Thảo luận – Đề xuất
- Bộ mã màu **4 trạng thái** (đi từ nặng đến nhẹ) (P2 d.447–459, 1092–1149):
  - **Đỏ (Red):** phát sinh cảnh báo **cần action ngay**, chưa xử lý — bắt buộc xử lý để mất đỏ. (P2 d.456, 583–586, 1102–1111)
  - **Vàng (Yellow):** thông tin **cần lưu ý**, có thể chưa cần xử lý ngay. (P2 d.457–458, 1112–1116)
  - **Xanh lá (Green):** đã có cảnh báo (đỏ) và **đã được xử lý xong**. Quy tắc: **xanh chỉ xuất hiện sau khi đã từng có đỏ**; không có "xanh từ đầu". (P2 d.459, 1118–1125, 1482–1491)
  - **Không màu (phông nền bình thường):** trạng thái mặc định, không phát sinh cảnh báo; đa phần các dòng ở trạng thái này. (P2 d.454–455, 1093–1101)
- Tối đa khoảng 4–5 màu để giữ dễ đọc. (P2 d.471–474)
- Lý do giữ "xanh đã xử lý" thay vì cho về không màu: để điều phái biết mình đã xử lý, và phục vụ **thống kê khối lượng công việc** theo ngày/cao điểm (đếm số "xanh" để đánh giá cường độ, làm cơ sở chia ca/tăng giảm nhân lực). (P2 d.1163–1248)
- **Đổi màu tự động:** điều phái **không tự tick** để chuyển trạng thái; màu đổi tự động khi điều phái xử lý ở hệ thống nguồn (làm lại OFP trên Lido, bấm Dispatch Release…) rồi TOSS tích hợp tín hiệu để đổi màu. Màn Giám sát **chỉ giám sát + cảnh báo**, không thao tác trực tiếp trên bảng để thay đổi data; mọi hành động ở hệ thống chuyên dụng. (P2 d.607–629)

#### Kết luận
- Bộ mã màu thống nhất **4 trạng thái: Đỏ / Vàng / Xanh lá / Không màu**, áp dụng cho mọi cột.
- **Xanh = đã có đỏ rồi xử lý xong**; không có "xanh từ đầu". Không màu = bình thường.
- Đổi màu **tự động** theo trạng thái dữ liệu nguồn; điều phái **không tick thủ công**.
- Màn Giám sát chỉ "view + cảnh báo", không thao tác trực tiếp (ngoại lệ: cột Dispatch Release — xem §10).
- Giữ "xanh" để **thống kê khối lượng công việc** theo ngày/cao điểm.

### 8. Cơ chế "trôi" theo thời gian, time window và chuyến đường dài chưa đáp

#### Yêu cầu
- Lịch bay một ngày của VNA có thể ~500–700 chuyến; không thể hiển thị hết — cần một **time window** quanh thời điểm hiện tại. (P2 d.881–916)

#### Thảo luận – Đề xuất
- Bảng Giám sát **trôi theo giờ thực**: chuyến mới (ETD sắp tới) được đẩy vào, chuyến cũ trôi xuống/ra. (P2 d.630–631, 841–875)
- **Time window cấu hình được**, không hardcode, gồm: **lùi lại (look-back)** vd 15/30 phút/1 giờ và **tiến tới (look-ahead)** vd 30 phút/1 giờ. Do mốc upload OFP quốc tế là **240 phút (4 giờ)** trước STD, look-ahead cần đủ rộng. (P2 d.853–863, 1019–1090) *(Đối chiếu domain-knowledge: mốc 240 phút nhất quán với mốc upload OFP đã ghi nhận các buổi trước.)*
- **Admin cấu hình mặc định** theo từng vị trí/role; user vẫn **scroll** xem ngoài window và tự đặt lại cấu hình cá nhân (lưu profile — §5). (P2 d.1064–1090)
- Số dòng thường trực ~25 dòng để nhìn nhanh, không phải scroll; vẫn kéo được nếu cần. (P2 d.931–953)
- **Chuyến đường dài chưa đáp** (vd đi Mỹ ~13–16 tiếng): dù ETD đã trôi qua nhưng chưa kết thúc thì điều phái vẫn phải monitor đến khi vào gate; cơ chế giữ lại trong bảng (so với để trôi/scroll/filter phụ) chưa chốt cụ thể. Việc giám sát giai đoạn đang bay đến lúc vào gate được nhắc tới gắn với **Flight Watch** (màn/giai đoạn riêng). (P2 d.651–807)
- **Cảnh báo "vào gate chậm":** chuyến vào gate chậm so với **ETA kết điểm** phải được cảnh báo (anh Phúc nêu buổi 11/06: điều phái monitor đến chặng hạ cánh vào gate). (P2 d.664–669)
- Sắp xếp danh sách mặc định theo **ETD**. (P2 d.954–958)

#### Kết luận
- Giám sát dùng **time window cấu hình được** (look-back + look-ahead); admin set mặc định theo role, user override + lưu profile; bảng **trôi theo giờ thực**.
- **Chuyến đường dài chưa đáp** phải được monitor đến khi vào gate; cơ chế giữ lại chưa chốt (mục IV).
- TOSS cảnh báo "**vào gate chậm**" so với ETA kết điểm (gắn phạm vi Flight Watch).
- Sắp xếp mặc định theo **ETD**.

### 9. Cột Aircraft Registration (REG): logic màu, hover, lịch sử đổi tàu, hiển thị

#### Yêu cầu
- Cột **Aircraft Registration (REG — số đăng ký tàu bay)** phải cảnh báo khi tàu thực tế trên Netline bị **đổi** so với phiên bản OFP đã phát hành, và cho xem **lịch sử đổi tàu**. (P2 d.337–343, 1448–1454)

#### Thảo luận – Đề xuất
- **Logic màu cột REG** (P2 d.1444–1508, 1641–1659):
  - **Đỏ:** tàu Netline **khác** tàu trên OFP **đã được Dispatch Release** → phải làm lại OFP cho tàu mới. (P2 d.1447–1473)
  - **Vàng:** đã có OFP mới khớp tàu Netline nhưng **chưa Dispatch Release** → cần bước Release. (P2 d.1503–1521)
  - **Xanh:** đã có OFP mới khớp tàu **và đã Dispatch Release**. (P2 d.1480–1481, 1533–1535)
  - **Không màu:** chưa có OFP, hoặc OFP chưa release (chuyến giai đoạn sớm). (P2 d.1469–1478)
- Hai điều kiện để xanh: (1) tàu Netline = tàu trên OFP, (2) đã Dispatch Release. Thỏa 1 điều kiện → vàng; không thỏa nào → đỏ ("2 chốt kiểm soát"). (P2 d.1652–1659)
- Cột REG và cột Dispatch Release **liên kết với nhau**: bấm Release ở cột Dispatch Release sẽ **clear luôn vàng** ở cột REG (nếu chỉ thiếu điều kiện đã-release). (P2 d.1660–1681)
- **Trường hợp Unrelease:** Unrelease quay về OFP phiên bản trước (sinh revision mới mang dữ liệu cũ); nếu phiên bản đó có tàu khác tàu Netline hiện tại → cột REG **đỏ trở lại**, phải release lại bản OFP mới. (P2 d.1536–1559)
- **Hover (rê chuột vào ô REG):** hiển thị **REG cũ → REG mới** (mũi tên) và **giờ đổi trên Netline** dạng `HH:MM` (giờ UTC). (P2 d.1688–1776)
- **Click vào REG → mở Flight Detail (tab Aircraft):** hiển thị **lịch sử đổi tàu** đầy đủ (đổi 3 lần thì xem đủ 3 lần). (P2 d.1777–1794)
- **Hiển thị REG:** với nhóm **VNA/VNB** lược bỏ tiền tố "VN" để tiết kiệm (VNA893 → A893; VNB… → B…); nhóm khác như **XU** giữ nguyên đầy đủ vì không thống nhất được một mẫu cắt. (P2 d.1715–1943)

#### Kết luận
- Cột REG cảnh báo theo logic **tàu Netline × tàu trên OFP đã Release**: Đỏ = lệch tàu + đã release; Vàng = khớp tàu nhưng chưa release; Xanh = khớp tàu + đã release; Không màu = chưa có OFP/chưa release.
- Hover = REG cũ → REG mới + giờ đổi (Netline, UTC); click → tab Aircraft có lịch sử đổi tàu.
- Hiển thị REG: nhóm VNA/VNB lược "VN" (→ A…/B…); nhóm XU và khác giữ nguyên.

### 10. Cột Dispatch Release: cột riêng và action bấm trực tiếp ("2 chốt kiểm soát")

#### Yêu cầu
- Cần **cột riêng "Dispatch Release"** trên màn Giám sát để nhìn nhanh chuyến đã/chưa release và **bấm Dispatch Release trực tiếp** ngay trên màn (action shortcut). (P2 d.1269–1278, 1529–1535)

#### Thảo luận – Đề xuất
- Bổ sung một cột Dispatch Release; bấm Release ngay tại cột → trạng thái chuyển sang xanh (kết thúc việc của điều phái). (P2 d.1530–1535)
- Cột Dispatch Release liên kết cột REG: bấm Release ở đây **clear đồng bộ** vàng các cột liên quan; Dispatch Release là "chốt cuối" để các cột cùng về xanh. (P2 d.1660–1681)
- Không tạo thêm màn hình thứ hai để xem chi tiết OFP của toàn bộ chuyến; nếu cần chi tiết OFP của một chuyến thì vào **menu báo cáo riêng**; màn Giám sát giữ vai trò overview, chỉ liệt kê trường cần thiết + cảnh báo. (P2 d.1279–1316)

#### Kết luận
- Thêm **cột Dispatch Release** trên màn Giám sát: 2 trạng thái (chưa/đã release) và cho **bấm Dispatch Release ngay tại cột**.
- Bấm Release ở đây **clear đồng bộ** vàng các cột liên quan (REG…).
- Không tạo màn thứ hai cho chi tiết OFP toàn bộ; chi tiết một chuyến vào Flight Detail / menu báo cáo riêng.
- *(Đây là ngoại lệ duy nhất của nguyên tắc "Giám sát chỉ view + cảnh báo, không action" ở §7.)*

### 11. Cột Flight Number: cảnh báo theo suffix D/Z và lịch sử

#### Yêu cầu
- Cột **Flight Number** cảnh báo khi chuyến có **suffix D/Z** (chuyển sang ngày hôm sau / tình huống đặc biệt). (P2 d.1944–1979)

#### Thảo luận – Đề xuất
- Logic màu cột Flight Number (P2 d.1948–2073, 2132–2168):
  - **Không màu:** số hiệu bình thường, không suffix. (P2 d.1956–1957)
  - **Vàng:** có suffix `D` hoặc `Z` — chuyến đặc biệt (chuyển sang ngày sau), **luôn giữ vàng** để điều phái lưu ý, **không chuyển xanh**. (P2 d.1972–2072)
  - **Đỏ:** trường hợp chuyến đang ở suffix `D` rồi **mất `D`** (giật về ngày gốc do khắc phục sớm) → đỏ vì có thể đã báo khách/soạn tài liệu gốc, phải làm lại. (P2 d.2132–2168)
- **Hover:** lịch sử của D/Z — thời điểm Netline thêm D/Z; nếu mất D thì thời điểm mất — phục vụ truy vết/báo cáo cấp trên. (P2 d.2001–2045)
- Chuyển sang ngày hôm sau **không qua D/Z** (chỉ đổi ETD) → cột Flight Number **không màu**, cảnh báo nằm ở **cột ETD**; xem lịch sử đổi giờ tại ô ETD. (P2 d.1964–1969, 2334–2342)
- Đỏ ở Flight Number được **clear khi chuyến đã IN/ARR** (xem §12). (P2 d.2169–2186)

#### Kết luận
- Cột Flight Number: Không màu = không suffix; **Vàng = có D/Z** (giữ vàng, không sang xanh); **Đỏ = trước có D/Z nay mất** (giật về ngày gốc).
- Hover = lịch sử D/Z + thời điểm thay đổi trên Netline.
- Chuyển ngày sau không qua D/Z → cảnh báo ở **cột ETD**, không phải Flight Number.
- Đỏ ở Flight Number được clear khi chuyến **IN/ARR**.

### 12. Cột ETA / IN / ARR: tín hiệu hoàn tất chuyến và nguồn dữ liệu

#### Yêu cầu
- Cột **ETA / IN / ARR** biểu thị **hoàn tất chuyến**; là tín hiệu để clear/chuyển trạng thái cuối cho các cảnh báo khác. (P2 d.732–747, 2169–2233)

#### Thảo luận – Đề xuất
- Tín hiệu chuyển **xanh (hoàn tất)**: chuyến nhận **điện IN** rồi chuyển **ARR**; trạng thái IN → xanh. (P2 d.733–747, 2207–2224)
- Nguồn dữ liệu giờ hạ cánh/vào gate (P2 d.808–836):
  - **Sân bay nội địa:** tích hợp **A-CDM (Airport Collaborative Decision Making)** — giờ hạ cánh/vào gate thực tế, cập nhật gần real-time. (P2 d.821–827)
  - **Sân bay quốc tế:** A-CDM **trễ hơn**, phải chấp nhận độ trễ. (P2 d.828–836)
  - Điện ARR/IN qua **ACARS** cũng được nhận; Netline tích hợp điện và cập nhật trạng thái ARR. (P2 d.808–820, 738–746)
- Khi cột ETA/IN xanh → các cảnh báo đỏ liên quan trong chuyến được clear/chuyển trạng thái cuối; cảnh báo "vào gate chậm" (§8) giữ riêng. (P2 d.2177–2233)
- Với các cảnh báo điều phái "vẫn bay" dù đỏ/vàng (vd thời tiết): khi chuyến đã cất cánh, tùy cột, có thể giữ nguyên đỏ để biết "có đỏ nhưng không action" hoặc clear về xanh khi đã đáp — chi tiết theo từng cột chưa chốt đồng nhất. (P2 d.2192–2239)

#### Kết luận
- Cột ETA/IN/ARR chuyển **xanh** khi nhận **điện IN** (→ ARR); nguồn: **A-CDM** (nội địa real-time / quốc tế trễ) và **điện ACARS ARR/IN** (qua Netline).
- Khi xanh → cảnh báo đỏ liên quan của chuyến được clear/chuyển trạng thái cuối.
- Quy tắc clear/giữ đỏ sau khi cất cánh theo từng cột chưa chốt đồng nhất (mục IV).

### 13. Format hiển thị "lịch sử đổi" chung (history timeline)

#### Yêu cầu
- Nhiều đối tượng cần hiển thị **lịch sử thay đổi** (đổi tàu, đổi tổ bay, đổi giờ ETD, suffix D/Z…); cần một **format chung**. (P2 d.1829–1834)

#### Thảo luận – Đề xuất
- Hai phương án theo các mốc thời gian: **kéo ngang (horizontal)** hoặc **kéo dọc (vertical)** — **ưu tiên kéo dọc** vì dễ nhìn các mốc. (P2 d.1834–1838)
- Cấu trúc (vd đổi tàu): **tàu đầu tiên** (giá trị khi chuyến sinh ra) → mũi tên (kèm giờ đổi trên Netline, dạng `HH:MM`) → **tàu thứ hai** → … (P2 d.1845–1865)
- Bảng lịch sử của một chuyến: mỗi lần update là một dòng, sắp theo thứ tự update; nhìn các dòng để biết trường nào thay đổi (vd thay đổi tàu bay), từng người/từng thời điểm thay đổi. (P2 d.2405–2449)
- Áp dụng chung cho: lịch sử đổi Registration (§9), đổi tổ bay (Phần 1 §2), đổi giờ ETD, lịch sử D/Z (§11). (P2 d.1832–1834)

#### Kết luận
- TOSS dùng **một format hiển thị "lịch sử đổi" chung** cho mọi đối tượng cần truy vết — ưu tiên timeline **kéo dọc**, các mốc nối nhau bằng mũi tên kèm giờ thay đổi (UTC).
- Áp dụng trước cho: lịch sử đổi tàu, đổi tổ bay, đổi giờ ETD, lịch sử D/Z.

---

## III. Các nội dung đã thống nhất (toàn buổi sáng)

| # | Nội dung thống nhất | Chủ đề |
|---|---|---|
| 1 | Click chuyến trên màn Giám sát → mở **tab mới Flight Detail** (không pop-up); mở nhiều tab cùng lúc | 1 |
| 2 | Click cảnh báo → mở Flight Detail và **active đúng tab phụ** tương ứng | 1 |
| 3 | Flight Detail nhiều tab phụ (Cảnh báo / Flight Release / Tàu bay + MEL-CDL / Tổ bay); mỗi tab hiển thị **đầy đủ lịch sử** | 2 |
| 4 | TOSS lấy Flight Number **3 cột tách biệt từ Netline** (carrier, fly number, FN suffix D/Z); leg history từ Netline | 3 |
| 5 | Cảnh báo thể hiện bằng **tô màu cả ô** (không bo box, không chỉ đổi màu chữ); ký hiệu trạng thái đơn giản | 4 |
| 6 | Phân quyền **2 lớp**: chức năng + dữ liệu (carrier/khu vực/role); user nhiều role, switch view; super admin xem toàn bộ | 5 |
| 7 | Filter + cấu hình + "trạng thái gần nhất" lưu ở **profile cá nhân** (không theo máy); bộ lọc thu/mở | 5 |
| 8 | Quy ước UI chung: **tiếng Anh + giờ UTC + format 24h + dark mode ưu tiên** | 6 |
| 9 | Bộ mã màu **4 trạng thái**: Đỏ (action ngay) / Vàng (lưu ý) / Xanh (đã xử lý) / Không màu (bình thường) | 7 |
| 10 | **Xanh = đã có đỏ rồi xử lý xong**; không có "xanh từ đầu" | 7 |
| 11 | Đổi màu **tự động** theo trạng thái dữ liệu nguồn; điều phái **không tick thủ công** | 7 |
| 12 | Màn Giám sát chỉ "view + cảnh báo", không thao tác trực tiếp — **ngoại lệ: cột Dispatch Release** | 7, 10 |
| 13 | Giữ "xanh" để **thống kê khối lượng công việc** theo ngày/cao điểm | 7 |
| 14 | **Time window cấu hình được** (look-back + look-ahead); admin set mặc định, user override + lưu profile; bảng **trôi theo giờ thực** | 8 |
| 15 | Chuyến **đường dài chưa đáp** vẫn giữ monitor đến khi IN/ARR; cảnh báo "**vào gate chậm**" so với ETA kết điểm | 8 |
| 16 | Sắp xếp danh sách mặc định theo **ETD** | 8 |
| 17 | Cột **REG** cảnh báo theo **tàu Netline × tàu OFP đã Release** (Đỏ/Vàng/Xanh/Không màu) | 9 |
| 18 | Hover REG = REG cũ → REG mới + giờ đổi (UTC); click REG → tab Aircraft có lịch sử đổi tàu | 9 |
| 19 | Hiển thị REG: nhóm VNA/VNB lược "VN" (→ A…/B…); nhóm XU và khác giữ nguyên | 9 |
| 20 | Thêm **cột Dispatch Release** với action bấm shortcut; **clear đồng bộ** vàng các cột liên quan ("2 chốt kiểm soát") | 10 |
| 21 | Cột **Flight Number**: Không màu / Vàng (có D-Z, giữ vàng) / Đỏ (trước có D-Z nay mất) | 11 |
| 22 | Chuyển ngày sau **không qua D/Z** → cảnh báo ở cột **ETD**, không phải Flight Number | 11 |
| 23 | Cột **ETA/IN/ARR** chuyển xanh khi nhận **điện IN (→ ARR)**; nguồn **A-CDM** + **điện ACARS** (qua Netline) | 12 |
| 24 | Áp dụng **một format hiển thị "lịch sử đổi" chung** (ưu tiên timeline kéo dọc, mũi tên + giờ UTC) | 13 |

## IV. Vấn đề cần làm rõ (toàn buổi sáng)

**Phần 1:**
- Ý nghĩa chính xác của ký tự **`Z`** trong FN Surface (so với `D`) và điều kiện sinh `Z`. (P1 d.159–163)
- Diễn đạt cảnh báo tổng quát của tab Flight Release ("bên ngoài"); cụm **"FTP Mail CDL"** (khả năng là MEL/CDL) và **"vơ phong tàu quay"** trong tab Tàu bay cần đối chiếu lại (đoạn ghi âm nhiễu). (P1 d.57–78)

**Phần 2:**
- **Tên/mã hóa khu vực điều phái** (châu Âu, Mỹ, Hàn, khu vực khác) dùng cho phân quyền dữ liệu. (P2 d.72–96)
- **Cơ chế giữ lại chuyến đường dài chưa đáp** ngoài time window (để trôi/giữ trong bảng/filter phụ/scroll) — chưa chốt phương án. (P2 d.651–810)
- **Ngưỡng "vào gate chậm"** (phút trễ so với ETA kết điểm). (P2 d.664–669)
- **Quy tắc clear/giữ đỏ sau khi chuyến cất cánh** cho các cảnh báo "vẫn bay" (vd thời tiết) — chưa chốt đồng nhất theo từng cột. (P2 d.2192–2239)
- **Quy ước version OFP khi Unrelease** (vd `2.1` hay auto-tăng) — đã ghi nhận buổi 11/06, buổi này nhắc lại nhưng chưa chốt. (P2 d.1536–1559)
- **Hành vi của hệ thống Ops++** (trước chép là "off cộng cộng") khi chuyến `D` quay về ngày gốc — Lido xin lại OFP cũ hay sinh mới; cần làm rõ. (P2 d.2388–2404)
- **Bộ trạng thái vòng đời chuyến** hiển thị trên bản mẫu (GRD/BRD/OUT/ENR/IN/ARR) — cần SME điều phái xác nhận danh sách, định nghĩa và quy tắc chuyển (bản mẫu đề xuất, chưa nêu trong nội dung phỏng vấn).

> Các điểm trên được tổng hợp vào sổ theo dõi điểm chốt OID-TOSS-001.

## V. Thuật ngữ đề xuất bổ sung domain-knowledge

> **CHỈ đề xuất** — chờ BA Lead confirm trước khi ghi vào glossary.

| # | Thuật ngữ | Mô tả từ ngữ cảnh trong buổi | Nguồn |
|---|---|---|---|
| 1 | **FN Surface (suffix D/Z)** | Cột thứ 3 của Flight Number trên Netline — ký tự hậu tố cho biết chuyến chuyển/delay sang ngày sau (`D`) hay tình huống đặc biệt (`Z`); là khóa cảnh báo cột Flight Number. | P1 d.159–163; P2 d.1944–1979 |
| 2 | **Leg History (Netline)** | Lịch sử các lần thay đổi giờ EPD/delay của chuyến (thời điểm, từ ngày nào sang ngày khác, mức delay) — lưu sẵn trong Netline. | P1 d.174–183 |
| 3 | **Flight Detail (tab/trang)** | Trang chi tiết một chuyến, mở ở tab mới khi click chuyến; gồm nhiều tab phụ (Cảnh báo / Flight Release / Tàu bay / Tổ bay). | P1 d.91–106 |
| 4 | **Time Window (Giám sát)** | Khoảng thời gian quanh giờ hiện tại để lọc chuyến hiển thị (look-back + look-ahead); cấu hình bởi admin và user. | P2 d.853–1090 |
| 5 | **Color Scheme cảnh báo (4 trạng thái)** | Đỏ (action ngay) / Vàng (lưu ý) / Xanh (đã xử lý) / Không màu (bình thường); xanh chỉ sau khi đã đỏ. | P2 d.447–459, 1092–1149 |
| 6 | **History Timeline (lịch sử đổi)** | Format chung cho mọi lịch sử thay đổi: timeline kéo dọc, mỗi mốc nối bằng mũi tên + giờ UTC. | P2 d.1829–1865 |
| 7 | **Dispatch Release (cột + action)** | Cột trên màn Giám sát cho phép bấm phát hành Dispatch Release trực tiếp; clear đồng bộ các cột liên quan. | P2 d.1269–1278, 1529–1535 |
| 8 | **A-CDM (giờ hạ cánh/vào gate)** | Nguồn giờ hạ cánh/vào gate thực tế: nội địa cập nhật gần real-time, quốc tế trễ hơn. | P2 d.808–836 |
| 9 | **Monitoring User Profile** | Cấu hình cá nhân của user (filter, cột, "trạng thái gần nhất") lưu theo user, không theo máy. | P2 d.198–229 |
| 10 | **Carrier (cột & phân quyền)** | Mã hãng — vừa là cột 1 của Flight Number, vừa là chiều phân quyền dữ liệu màn Giám sát. | P1 d.152–158; P2 d.156–179 |

---

*Báo cáo buổi sáng 12/06/2026 (Phần 1 + Phần 2), lập 2026-06-12. Phần 2 thảo luận trực tiếp trên bản mẫu giao diện dsp_monitoring_poc.html. Các điểm gắn ở mục IV cần đối chiếu/phỏng vấn bổ sung; điểm cần chốt theo dõi tại OID-TOSS-001.*
