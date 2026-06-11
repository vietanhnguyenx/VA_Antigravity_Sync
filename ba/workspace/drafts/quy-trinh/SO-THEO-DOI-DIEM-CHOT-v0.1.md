---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-12"
status: "Draft"
document_type: "Sổ theo dõi Điểm cần chốt & Câu hỏi mở (Open Items & Decisions Register)"
document_id: "OID-TOSS-001"
---

# Sổ theo dõi Điểm cần chốt & Câu hỏi mở — TOSS

> **Mục đích:** Gom toàn bộ điểm cần chốt / câu hỏi mở rải rác trong các tài liệu (BRD, phân rã FUNC, báo cáo khảo sát, workflow) vào **một nơi duy nhất**, rà soát và cập nhật **sau mỗi buổi meeting**.
>
> **Nguyên tắc §0:** Sổ này chỉ **ghi nhận trung thực** điểm chưa rõ + nguồn; KHÔNG tự suy diễn câu trả lời. Mỗi điểm được con người (BA Lead/SME) chốt, rồi ghi kết quả + ngày.
>
> **Quy ước trạng thái:** 🔴 Mở · 🟡 Đang xử lý / đã hỏi chờ trả lời · 🟢 Đã chốt.
>
> **Phân loại (Loại):** `QĐ` = Quyết định BA Lead · `SME` = Cần SME/khách hàng xác nhận · `KS` = Cần khảo sát bổ sung · `DL` = Tham số/mô hình dữ liệu chưa có nguồn · `HC` = Hành chính/hạ tầng.

---

## A. Quyết định của BA Lead (QĐ)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| DEC-01 | Thứ tự triển khai **PH3 Báo cáo trước hay PH2 Tài liệu trước** (đề xuất PH3 trước) | WF-TOSS-001 §4, §9 | Nội bộ BA Lead | 🔴 Mở | |
| DEC-02 | Gán **mốc thời gian** cho 3 giai đoạn (giữ ràng buộc thông kết nối 30/06/2026) | WF-TOSS-001 §4; KS 08/06 §7 | Nội bộ + project schedule | 🔴 Mở | |
| DEC-03 | Bổ sung **danh sách member** team BA (hoặc cấp `gh`/token để đọc collaborator repo private) | WF-TOSS-001 §8 | Nội bộ BA Lead | 🔴 Mở | |
| DEC-04 | **Gán tên người** vào ma trận Lai (chủ trì/hỗ trợ/chuyên gia) + chọn kịch bản đội hình | WF-TOSS-001 §5, §8 | Nội bộ BA Lead | 🔴 Mở | |
| DEC-05 | Duyệt **ánh xạ 7 phân hệ cũ → 5 phân hệ mới**, cập nhật `PHAN-CONG-ROLE-BA §3` | WF-TOSS-001 §2 | Nội bộ BA Lead | 🔴 Mở | |
| DEC-06 | Bổ sung **chỉ tiêu định lượng** cho mục tiêu (OBJ-001/002/008/009) + ma trận RACI | BRD §4, §6.1 | Nội bộ + stakeholder | 🔴 Mở | |

## B. Thuật ngữ & hệ thống cần SME xác nhận (SME)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| SME-01 | **VMA** — viết tắt chính xác cho "ngưỡng thời tiết tối thiểu sân bay" | BRD §9.3; KS 11/06 §II.7 | Dispatcher (phần 2) | 🔴 Mở | |
| SME-02 | **Lotang** — định nghĩa "chuyến Lotang" + tiêu chí đánh giá tác động | BRD §9.3; KS 11/06 §II.5 | Dispatcher (phần 2) | 🔴 Mở | |
| SME-03 | **VNCM/VNCS** — tên cơ quan cung cấp NOTAM nội địa | BRD §9.3; KS 11/06 §II.6 | Dispatcher / SME NOTAM | 🔴 Mở | |
| SME-04 | **"Vy Vy"** — tên nguồn METAR nội địa | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-05 | **UA PASMOS** — hệ thống thời tiết được nhắc đến | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-06 | **Sunweather** — tên đầy đủ + vai trò (được đánh giá "rủi ro") | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-07 | **"Phi Công 11"** — tên hệ thống tham khảo, không official | BRD §9.3; KS 11/06 §II.7 | Dispatcher / SME khí tượng | 🔴 Mở | |
| SME-08 | **Mốc upload OFP** 90/130/180/200 phút + phân loại chuyến tương ứng | BRD §9.3; KS 11/06 §II.1 | Dispatcher (phần 2) | 🔴 Mở | |
| SME-09 | **Tên hệ thống nguồn** nhận biết yếu nhân/chuyên cơ trong BCAO | BRD §9.3; KS 09/06 §II.7 | SME trực ban trưởng | 🔴 Mở | |
| SME-10 | **Damp Lease** — tên tiếng Việt chính thức + có cần báo cáo riêng phần nhiên liệu VNA tự cấp | BRD §9.3; KS 09/06 §II.5, §IV | SME khai thác/tài chính | 🔴 Mở | |
| SME-11 | Phân loại **NOTAM 3 nhóm** chi tiết + quy tắc đánh giá ảnh hưởng tới chuyến | FUNC-179 (PH1) | Workshop NOTAM | 🔴 Mở | |
| SME-12 | **CLC** — tên đầy đủ (Centralized Load Control?) + phạm vi nghiệp vụ | KS 11/06 P2 §II.1 | SME tải/cân bằng | 🔴 Mở | |
| SME-13 | **NAIL** — viết tắt + định nghĩa + phân biệt với CDL/MEL | KS 11/06 P2 §II.3 | SME kỹ thuật/bảo dưỡng | 🔴 Mở | |
| SME-14 | **AMOS** — xác nhận hệ thống + cơ chế tích hợp (API/event/poll) | KS 11/06 P2 §II.3 | SME kỹ thuật + workshop tích hợp | 🔴 Mở | |
| SME-15 | **MOI** — đơn vị/hệ thống quản lý Standard Taxi Time | KS 11/06 P2 §II.7 | Dispatcher / quản trị nội bộ | 🔴 Mở | |
| SME-16 | **IFV** (anh Kiếm) — tên đầy đủ phần mềm quản lý bảng dầu AHM | KS 11/06 P2 §II.2 | Dispatcher / anh Kiếm | 🔴 Mở | |
| SME-17 | **TIC (Lido)** — viết tắt + vai trò trong nghiệp vụ tổ bay | KS 11/06 P2 §II.5 | Workshop Lido | 🔴 Mở | |
| SME-18 | **Sân bay đặc biệt** — danh mục đầy đủ + điều kiện chứng chỉ cơ trưởng theo sân bay | KS 11/06 P2 §II.5 | SME tổ bay | 🔴 Mở | |

## C. Vấn đề nghiệp vụ cần làm rõ qua khảo sát (KS)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| KS-01 | **Cơ chế duy trì dữ liệu gần nhất** (ảnh chụp định kỳ vs theo sự kiện) | KS 08/06 §IV, §II.3 | Khảo sát số liệu/kỹ thuật | 🔴 Mở | |
| KS-02 | **Logic chi tiết từng báo cáo** — chỉ mô tả kỹ khi có số liệu thật | KS 08/06 §IV | GĐ2 (đối chiếu số liệu) | 🔴 Mở | |
| KS-03 | **Kiểm chứng nguồn dữ liệu hành khách** (thời gian thực hay bản sao) trước khi dùng ra quyết định nối chuyến | KS 08/06 §II.6, §IV | Khảo sát PSS/DCS | 🔴 Mở | |
| KS-04 | **Phương án khi hệ thống lập kế hoạch bay (Lido) không cho tích hợp trực tiếp** | KS 08/06 §IV | Workshop tích hợp | 🔴 Mở | |
| KS-05 | **Phân biệt tài liệu khi tải hàng loạt** theo tên tệp hay nội dung + quy ước đặt tên | KS 09/06 §II.3, §IV | Workshop luồng tài liệu | 🔴 Mở | |
| KS-06 | **Nguồn danh mục dịch vụ sân bay** (đang quản lý thủ công) | KS 09/06 §II.6, §IV | SME mặt đất | 🔴 Mở | |
| KS-07 | **Danh mục nguyên nhân bất thường BCAO** — nghiệp vụ + danh mục tham chiếu trước khi số hóa | KS 09/06 §II.7, §IV | SME trực ban trưởng | 🔴 Mở | |
| KS-08 | **Giao diện trạng thái TOSS↔MO Plus** (Dispatch Release → chặn Captain's Release): timing, payload, cơ chế thông báo, fail-safe | KS 11/06 §II.2; FUNC-256/257/258 (PH2) | Workshop + đối tác MO Plus | 🔴 Mở | |
| KS-09 | **Phương án parse METAR/SPECI** (tự xây vs thư viện/dịch vụ) — chính xác + bản quyền | KS 11/06 §IV | Workshop kỹ thuật/khí tượng | 🔴 Mở | |
| KS-10 | **Đơn vị nhiên liệu trong điện văn** theo giai đoạn/từng tàu — hệ số quy đổi | KS 09/06 §II.5, §IV | Workshop điện văn ACARS | 🔴 Mở | |
| KS-11 | Đối chiếu lại **phần thời tiết quốc tế / SIGMET** (đoạn ghi âm 11/06 nhiễu nặng) | KS 11/06 §V; FUNC-187 (PH1) | Dispatcher (phần 2) | 🔴 Mở | Phần 2 KHÔNG cover — vẫn cần phỏng vấn bổ sung riêng |
| KS-12 | **Mô hình master NAIL → sub-NAIL** — định nghĩa + thời hạn + quy tắc kích hoạt | KS 11/06 P2 §II.3 | Workshop NAIL/CDL | 🔴 Mở | |
| KS-13 | **Ranh giới Lido↔TOSS với NAIL** (Lido đã tính NAIL vào dầu chưa) → tránh cảnh báo thừa | KS 11/06 P2 §II.3 | Workshop tích hợp Lido | 🔴 Mở | |
| KS-14 | **Bảng ngưỡng cảnh báo lệch tải** chi tiết (loại tàu × dải giờ bay × ngưỡng trên/dưới) | KS 11/06 P2 §II.1 | Dispatcher cung cấp bảng tra | 🔴 Mở | |
| KS-15 | **Tích hợp SkyCheck** (phép bay) — tiến độ phân tích nghiệp vụ + tận dụng kết quả | KS 11/06 P2 §II.4 | Liên hệ qua anh Hùng | 🔴 Mở | |
| KS-16 | **Lido push Standard Taxi Time** — có API/master cho phép push tự động không | KS 11/06 P2 §II.7 | Workshop kỹ thuật Lido | 🔴 Mở | |
| KS-17 | **3 CI (Climb/Cruise/Descend)** — điều kiện để Lido trả đủ 3 CI thay vì 1 | KS 11/06 P2 §II.8 | Đối tác Lido | 🔴 Mở | |
| KS-18 | **Ngưỡng cảnh báo PAX time / lịch PAX** — số phút cụ thể trước STD | KS 11/06 P2 §II.6 | Dispatcher (đoạn nhiễu — phỏng vấn bổ sung) | 🔴 Mở | |
| KS-19 | **Hệ thống "long"** phân tích QAR/QAI — tên đầy đủ + quan hệ với QAI | KS 11/06 P2 §II.7 | SME dữ liệu vận hành | 🔴 Mở | |

## D. Tham số/ngưỡng & mô hình dữ liệu chưa có nguồn (DL)

> Chi tiết từng ô nằm trong 5 file phân rã FUNC; bảng này gom theo nhóm để theo dõi.

| ID | Nhóm điểm cần chốt | Nguồn (file FUNC) | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| DL-01 | **Ngưỡng cảnh báo**: load factor thấp / chậm chuyến / FTL / Delta ZFW / biên an toàn VMA / rate-limit API | PH1 (FUNC-108,125,188), PH2 (FUNC-273), PH5 | SME từng phân hệ | 🔴 Mở | |
| DL-02 | **Mô hình dữ liệu chi tiết**: bộ trường danh mục sân bay, Master MEL, công thức Tankering, tham số vận hành | PH4 §3.2 | GĐ1 (data model) + SME | 🔴 Mở | |
| DL-03 | **Data contract** API/Webhook + danh sách hệ thống vệ tinh nhận dữ liệu danh mục | PH4 (FUNC-404), PH5 (FUNC-511) | Workshop tích hợp | 🔴 Mở | |
| DL-04 | **Ô YCKT V3 còn trống** (TOSS-003/004/021–024/058–061…) + sheet Nhân sự CQĐV thiếu đầu mối | PH5 §3.2; PHAN-TICH-YCKT | Rà soát YCKT với khách hàng | 🔴 Mở | |
| DL-05 | **Phương thức tích hợp** từng hệ thống (Netline/Flight Ops++, Amadeus PSS real-time?, Lido mPilot) | PH5 (FUNC-511-01/10/12/40) | Workshop tích hợp | 🔴 Mở | |

## E. Hành chính & hạ tầng (HC)

| ID | Điểm cần chốt | Nguồn | Buổi làm rõ | Trạng thái | Kết quả & ngày |
|---|---|---|---|---|---|
| HC-01 | **Danh sách người dự + vai trò + thẩm quyền quyết định** từng bên (cập nhật STAKEHOLDER-REGISTER) | KS 08/06 §IV; KS 09/06 §IV | Mỗi buổi meeting | 🟡 Đang thu thập | |
| HC-02 | **Tiến độ cấp hạ tầng đám mây** + chốt số máy chủ & địa chỉ mạng (ràng buộc 30/06/2026) | KS 08/06 §II.7, §IV | Phối hợp CĐS-CN | 🟡 Đang xử lý | |
| HC-03 | **Lịch buổi khảo sát chuyên đề luồng tài liệu + điện văn ACARS** (gỡ chặn PH2) | KS 09/06 §II.3, §V; WF-TOSS-001 §9 | BA Lead lên lịch | 🔴 Mở | |

---

## F. Quy trình rà soát sau mỗi buổi meeting (BẮT BUỘC)

> Thực hiện ngay sau khi tổng hợp biên bản/báo cáo khảo sát của mỗi buổi.

1. **Đối chiếu §IV của báo cáo khảo sát mới** với sổ này — điểm nào đã được trả lời thì:
   - Đổi trạng thái sang 🟢 **Đã chốt**, ghi **kết quả + ngày** vào cột cuối + dẫn nguồn (buổi nào, mục nào).
   - Nếu là quyết định BA Lead → có thể thêm mã `DEC-` chính thức và cập nhật tài liệu liên quan (BRD/FUNC/workflow).
2. **Bổ sung điểm mở mới** phát sinh trong buổi (gắn ID kế tiếp theo nhóm A–E, dẫn nguồn).
3. **Cập nhật ngược tài liệu nguồn**: khi một cờ `[cần xác nhận]` được chốt → sửa BRD §9.3 / file FUNC / glossary tương ứng và xóa cờ.
4. **Làm giàu glossary**: thuật ngữ vừa xác nhận → cập nhật `toss-glossary-v0.1.md` (theo quy tắc 1 file chung).
5. **Bump version** sổ này (v0.1 → v0.2…) + ghi dòng changelog ai/ngày/điểm nào chốt.
6. **Báo cáo nhanh cho BA Lead**: số điểm 🟢 chốt / 🔴 còn mở sau buổi.

> **Tần suất rà soát:** sau **mỗi** buổi khảo sát/workshop; ngoài ra rà tổng thể tại BA Weekly Sync.

---

## G. Bảng tổng hợp trạng thái (cập nhật mỗi lần rà)

| Nhóm | Tổng | 🔴 Mở | 🟡 Đang xử lý | 🟢 Đã chốt |
|---|---|---|---|---|
| A. Quyết định BA Lead (QĐ) | 6 | 6 | 0 | 0 |
| B. Thuật ngữ/hệ thống (SME) | 18 | 18 | 0 | 0 |
| C. Nghiệp vụ-khảo sát (KS) | 19 | 19 | 0 | 0 |
| D. Tham số/dữ liệu (DL) | 5 | 5 | 0 | 0 |
| E. Hành chính/hạ tầng (HC) | 3 | 1 | 2 | 0 |
| **Tổng** | **51** | **49** | **2** | **0** |

> Cập nhật sau buổi 11/06 Phần 2 (rà ngày 2026-06-12): +7 SME (SME-12…18), +8 KS (KS-12…19). Phần 2 KHÔNG làm rõ điểm mở nào của Phần 1 (SME-01…08, KS-09, KS-11 vẫn Mở — cần phỏng vấn bổ sung riêng).

---

## H. Liên kết tài liệu nguồn

- BRD §9 (rủi ro/giả định/cờ): `ba/workspace/drafts/brd/BRD-TOSS-001-khung-v0.1.md`
- Phân rã FUNC (ô "chưa có nguồn"): `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH{1..5}-*.md`
- Báo cáo khảo sát §IV: `…/BAO-CAO-KHAO-SAT-08062026-v0.1.md`, `…-09062026-v0.1.md`, `…-11062026-buoi-sang-v0.1.md` (11/06 gộp Phần 1+2; tham chiếu "KS 11/06 P2 §II.x" tương ứng chủ đề §II.8–15 của báo cáo gộp)
- Phương án workflow §9: `ba/workspace/drafts/quy-trinh/PHAN-TACH-PHAM-VI-WORKFLOW-v0.1.md`
- Stakeholder: `ba/workspace/drafts/quy-trinh/STAKEHOLDER-REGISTER-v0.2.md`
- Glossary: `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md`

---

*OID-TOSS-001 v0.2 — 2026-06-12. Rà sau buổi 11/06 Phần 2: thêm 15 điểm mở (SME-12…18 thuật ngữ/hệ thống: CLC, NAIL, AMOS, MOI, IFV, TIC, sân bay đặc biệt; KS-12…19 nghiệp vụ: NAIL master/sub, ranh giới Lido↔TOSS, ngưỡng lệch tải, SkyCheck, Standard Taxi Time push, 3 CI, PAX time, hệ thống QAR/QAI). Tổng 51 điểm (49 Mở / 2 Đang xử lý). Phần 2 không cover điểm mở Phần 1.*
*OID-TOSS-001 v0.1 — 2026-06-11. Khởi tạo sổ theo dõi gom 36 điểm cần chốt từ BRD, 5 file phân rã FUNC, 3 báo cáo khảo sát và phương án workflow. Rà soát + cập nhật sau mỗi buổi meeting (quy trình §F).*
