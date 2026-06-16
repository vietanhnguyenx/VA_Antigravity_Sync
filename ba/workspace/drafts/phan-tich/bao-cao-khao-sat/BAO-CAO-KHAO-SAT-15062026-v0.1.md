---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-16"
survey_date: "2026-06-15"
status: "Draft"
document_type: "Báo cáo Khảo sát (Discovery) — Màn hình Flight Dispatch & Quy trình OFP Release 15/06/2026"
---

# Báo cáo Khảo sát TOSS — Buổi 15/06/2026

> **Chủ đề:** Màn hình giám sát điều phái (Flight Dispatch / Monitoring), quy trình phát hành OFP & cảnh báo màu theo ngưỡng thời gian, tích hợp A-CDM.
> **Nguồn:** transcript ghi âm `meeting-notes/15062026/TOSS-15-06-{1,2,3}_fixed.txt` (3 phần — P1/P2/P3). Đối chiếu thiết kế: tab "Màn hình Flight Dispatch" (`VNA-TOSS-Function-list-v1.0.extracted.md`, dòng 209–238) + mockup `dsp_monitoring_poc_v0.1.html`.

---

## I. Thông tin chung

| Mục | Nội dung |
|---|---|
| **Thời gian** | 15/06/2026 |
| **Mục đích** | Khảo sát thiết kế Màn hình Flight Dispatch (lưới giám sát chuyến bay), chốt quy trình phát hành OFP (Dispatch/Pilot release) + bộ cảnh báo màu theo ngưỡng thời gian; làm rõ tích hợp A-CDM cho các mốc thời gian/turnaround. |
| **Phía khách hàng** | Bộ phận Điều phái (Dispatch/PIC), kỹ thuật Lido, đầu mối A-CDM, phân quyền/vận hành. *(Tên cá nhân nhận diện chưa chắc chắn qua ghi âm — xem §IV.)* |
| **Phía khảo sát** | Đội phân tích TOSS (BA + Technical/Integration). |
| **Tài liệu trực quan** | Mockup `dsp_monitoring_poc_v0.1.html` (prototype lưới giám sát 22 cột) + tab "Màn hình Flight Dispatch" trong Function list. |
| **⚠ Cảnh báo chất lượng ASR** | Bản ghi âm chất lượng thấp; số dòng trích `(P# d.x)` là **gần đúng**, cần đối chiếu transcript khi chốt. Mọi cụm chưa rõ/viết tắt đã gắn `[cần xác nhận]` (§IV). Số liệu ngưỡng (210/75, 270/90) được **đối chiếu trùng khớp với Function list** nên độ tin cậy cao. |

---

## II. Nội dung trao đổi

### II.1 — Tích hợp A-CDM & mốc thời gian / quay đầu (P1)

**Yêu cầu**
- Màn giám sát cần các **mốc thời gian khai thác tại sân** và thông tin **quay đầu (turnaround)** để ước tính giờ khởi hành chuyến kế tiếp; theo dõi cả chuyến đến (inbound) và chuyến đi (outbound) (P1 d.~24–59).
- Lấy **vị trí đỗ (parking stand)** và các mốc on-ground (P1 d.~22–49).

**Thảo luận – Đề xuất**
- **A-CDM cung cấp ~16 mốc thời gian** (từ Landing, In-block → Startup Approved → Push back → Take-off), cập nhật **thời gian thực** khi ước tính tiếp cận/hạ cánh thay đổi (P1 d.~31–62).
- **Parking stand** lấy từ API **VIAGS**; ưu tiên A-CDM → nguồn dự phòng khi thiếu dữ liệu A-CDM (P1 d.~22–49). *(Tên nguồn dự phòng "VR" nghe chưa rõ — §IV.)*
- **Turnaround / ITT:** tính từ "in" chuyến trước đến "out" chuyến sau, có **min turn time**; ví dụ ITT tại HAN ≈ 45′ (P1 d.~24–57).
- **Độ phủ dữ liệu:** chỉ **HAN & TSN** có đầy đủ mốc A-CDM; sân bay nước ngoài dùng **Amadeus / Flight Status** (P1 d.~28–59).
- **Hiệu ứng dây chuyền:** chuyến trước trễ → các mốc chuyến sau dịch lùi cộng dồn (P1 d.~33–64).

**Kết luận**
- A-CDM triển khai **theo giai đoạn** (tích hợp thêm, test trước); ưu tiên phủ **HAN/TSN**; sân bay ngoài dùng nguồn thay thế (P1 d.~05–30). *(Phạm vi sân bay đợt đầu — §IV.)*

### II.2 — Phát hành OFP & cảnh báo màu theo ngưỡng (P2 — trọng tâm)

**Yêu cầu**
- Lưới giám sát hiển thị **trạng thái OFP** từng chuyến + **cảnh báo màu** theo ngưỡng thời gian; phân biệt rõ phần **Dispatch release** và **Pilot release** (P2 d.~1–4).

**Thảo luận – Đề xuất**
- **4 trạng thái OFP** (P2 d.~1–3): (1) chưa có OFP (gạch ngang); (2) có OFP nhưng **chưa Dispatch release**; (3) **Dispatch đã release, Pilot chưa**; (4) **cả Dispatch & Pilot đã release** (bản chốt).
- **Ngưỡng cảnh báo theo thời gian trước ETD** (P2 d.~26 → P3 d.~28):
  - **Quốc nội:** 210′ (mốc bắt đầu lưu ý) · sớm nhất release **75′** · muộn nhất release **60′** trước ETD.
  - **Quốc tế:** 270′ (bắt đầu lưu ý) · sớm nhất release **90′** · muộn nhất release **75′** trước ETD.
- **Mã màu:** **Trắng** = chưa tới ngưỡng (trước 210/270); **Vàng** = đang tới gần ngưỡng; **Đỏ** = quá ngưỡng muộn hoặc **chưa release khi sắp cất cánh** (P2 d.~26).
- **Un-release & tăng version:** sau khi release (xanh) không sửa được; muốn sửa phải **Un-Release** → tạo **version cao hơn** (v2→v3) → quay về trạng thái "có OFP chưa release" → sửa & upload lại; màu tính theo mốc thời gian mới (P2 d.~57–66).
- **PIC confirm:** thêm **cột riêng** theo dõi Phi công xác nhận đã nhận OFP; **không quy định cứng** thời điểm confirm (linh hoạt từ vài giờ trước đến trong khoảng bay) (P2 d.~67).

**Kết luận**
- Thống nhất bộ **ngưỡng + màu** và **rule release** (sớm 75/90, muộn 60/75); **un-release** là cách duy nhất sửa OFP đã release, luôn sinh version mới (P2 d.~26–66).

### II.3 — Phân quyền, tự động hóa & vận hành (P3)

**Yêu cầu**
- Phân quyền phát hành; quản lý ca trực & bàn giao; tự động hóa upload OFP; email cảnh báo; quản lý nhiều version OFP (P3 d.~8–66).

**Thảo luận – Đề xuất**
- **Phân quyền release:** chỉ admin enable quyền "Release" cho từng user; mặc định "Allow"; cần **ghi nhận ai đã release** (audit) (P3 d.~8–10).
- **AOS (bot tự động):** hiện 1 bot dùng 1 tên user → khi chia 2 ca dùng chung 1 tên không phân biệt được → đề xuất **đặt tên theo vai trò** (vd "Dispatch_Auto") hoặc nhiều bot (P3 d.~11–13). *(Nghĩa "AOS" — §IV.)*
- **Bàn giao ca:** ca vào **đăng nhập tài khoản riêng** để hệ thống tự ghi tên; **vấn đề attribution**: ca trước up OFP v1, ca sau lấy v1 sửa up v2 → hệ thống ghi tên ca sau (chưa chính xác người làm gốc) (P3 d.~41–43).
- **Khóa & tuần tự release:** khi un-release cần **khóa tạm cả Dispatch & Pilot**; chỉ release từ **version hiện tại** (không release version cũ) (P3 d.~45).
- **Email cảnh báo:** gửi mail khi OFP đổi hoặc chưa release trước ngưỡng; **highlight** thay đổi quan trọng; hiện làm sample, đưa production **tháng 7** (P3 d.~51–61).
- **Quản lý version OFP:** hiển thị **lịch sử version** + cột **delete** từng OFP; cần **chọn nhiều + xóa hàng loạt** để xử lý 200+ chuyến (P3 d.~56–66).
- **Adapter/MO:** TOSS gửi OFP/data sang MO qua **Adapter** (chỉ forward, không sửa) (P3 d.~17–20). *(Một số cụm "OMP"/"M.O." — §IV.)*

**Kết luận**
- Thống nhất hướng: admin cấp quyền release + audit; AOS đặt tên theo vai trò; bàn giao ca login riêng; khóa release khi un-release; email cảnh báo (production T7); version history + batch delete (P3).

---

## III. Các nội dung đã thống nhất

| # | Nội dung | Chủ đề |
|---|---|---|
| 1 | A-CDM cung cấp ~16 mốc thời gian, cập nhật real-time; tích hợp theo giai đoạn, ưu tiên HAN/TSN | II.1 |
| 2 | Parking stand lấy từ API VIAGS (ưu tiên A-CDM, có nguồn dự phòng) | II.1 |
| 3 | Sân bay ngoài HAN/TSN dùng Amadeus/Flight Status cho mốc thời gian | II.1 |
| 4 | 4 trạng thái OFP + phân biệt Dispatch release / Pilot release | II.2 |
| 5 | Ngưỡng cảnh báo: **quốc nội 210/75/60′**, **quốc tế 270/90/75′** trước ETD | II.2 |
| 6 | Mã màu Trắng/Vàng/Đỏ theo ngưỡng; đỏ khi trễ hoặc chưa release sắp cất cánh | II.2 |
| 7 | Un-Release là cách duy nhất sửa OFP đã release → luôn sinh version mới + khóa release | II.2 |
| 8 | Cột PIC confirm riêng; không bắt buộc thời điểm confirm | II.2 |
| 9 | Quyền release do admin cấp per user (mặc định Allow) + audit người release | II.3 |
| 10 | AOS bot đặt tên theo vai trò để phân biệt ca; bàn giao ca login tài khoản riêng | II.3 |
| 11 | Email cảnh báo (highlight thay đổi) — sample nay, production tháng 7 | II.3 |
| 12 | Version history + cột delete + batch delete cho 200+ chuyến | II.3 |

---

## IV. Vấn đề cần làm rõ

- **Phạm vi sân bay** tích hợp A-CDM đợt đầu (ngoài HAN/TSN gồm những đâu)? (P1)
- **Nguồn dự phòng parking stand** khi thiếu A-CDM — cụm nghe như "VR" chưa rõ. `[cần xác nhận]` (P1 d.~22–49)
- Nghĩa chính xác các viết tắt nghe trong ghi âm: **OAP, OSP, OMP** (P2/P3), **AOS** (P3) — chưa chắc chắn. `[cần xác nhận]`
- **Attribution khi bàn giao ca** (ca sau up version mới mang tên ai) — cơ chế ghi nhận đúng người thực hiện từng version. (P3 d.~41–43)
- **Quy tắc PIC confirm:** có ngưỡng nhắc/cảnh báo nếu Pilot chưa confirm sát giờ không? (P2 d.~67)
- **Gap mockup vs Function list** (xem §VI): suffix D/Z (ARR Divert), lưu cấu hình cột, tích hợp AMOS (MEL/CDL), taxi time vs FON, time-window ZFW 60/90′, phân quyền theo carrier — chưa thể hiện trong mockup v0.1.
- Các đoạn ghi âm nhiễu trong P1 (chi tiết mốc A-CDM) và P3 (cấu hình) cần đối chiếu lại transcript khi chốt số liệu.

---

## V. Thuật ngữ

> Phần lớn thuật ngữ buổi này (A-CDM, OFP, ITT, Turn Time, Dispatch/Pilot Release, Un-Release, Startup Approved, In/Out block, EFF, Trip/Final Reserve/Contingency Fuel, Tankering, ZFW…) **đã có trong glossary** sau đợt merge bộ "giải thích thuật ngữ" của khách hàng — `toss-glossary-v0.1.md` **v0.11** mục "★ CỐT LÕI".

**Đề xuất bổ sung thêm (từ ngữ cảnh buổi 15/06 — chờ BA Lead confirm):**

| Thuật ngữ | Mô tả từ ngữ cảnh | Nguồn |
|---|---|---|
| **PIC Confirm** | Cột/trạng thái Phi công xác nhận đã nhận OFP (sau Dispatch release); không quy định cứng thời điểm | (P2 d.~67) |
| **AOS** | Bot/tài khoản tự động hóa upload OFP — cần đặt tên theo vai trò để phân biệt ca | (P3 d.~11–13) `[cần xác nhận nghĩa]` |
| **Ngưỡng release OFP** | Bộ tham số: quốc nội 210/75/60′, quốc tế 270/90/75′ trước ETD (lưu ý/sớm nhất/muộn nhất release) | (P2 d.~26) |

---

## VI. Đối soát: Trao đổi 15/06 ↔ Function list ↔ Mockup (tập trung mục meeting chạm)

| Chủ đề / Cột | Trao đổi 15/06 | Function list "Màn hình Flight Dispatch" | Mockup dsp_monitoring_poc_v0.1 | Trạng thái |
|---|---|---|---|---|
| **Trạng thái chuyến (GRD/BRD/OUT/ENR/IN/ARR)** | (không bàn sâu) | Có đủ 6 trạng thái + nhấp nháy khi chuyển | Có đủ 6 badge + nhấp nháy (BRD/OUT) | 🟢 khớp |
| **OFP DSP release (cột OFP)** | 4 trạng thái OFP; màu theo ngưỡng | Cột "OFP DSP": Xanh=OFP release khớp Netline / Vàng=Rev cũ / Đỏ=chưa release | Cột "OFP Rev" + icon check/warn/cross | 🟢 khớp (mockup gọn hơn) |
| **Pilot release** | Tách Dispatch vs Pilot release | Cột "Pilot Release": vàng 30′ trước EDT chưa release / xanh đã release | Có cột Pilot release (icon) | 🟢 khớp |
| **PIC confirm** | **Đề xuất thêm cột PIC confirm** | (chưa có cột confirm riêng) | (chưa có) | 🆕 **meeting bổ sung** — cần thêm cột |
| **Ngưỡng cảnh báo màu (phút)** | **210/75/60′ nội, 270/90/75′ quốc tế** | Có rule màu nhưng **không ghi ngưỡng phút cụ thể** | Legend màu (Đỏ/Vàng/Xanh/Xám), không có ngưỡng | 🆕 **meeting bổ sung ngưỡng cụ thể** |
| **A-CDM 16 mốc / turnaround** | 16 mốc, ITT 45′, parking VIAGS | (Function list không liệt kê 16 mốc; có ở FOS sheet) | Mockup không thể hiện turnaround/ACDM | 🆕 **meeting bổ sung** |
| **Un-release / version OFP** | Un-release → version mới + khóa release | (Function list không mô tả logic version) | Mockup không có flow un-release | 🆕 **meeting bổ sung logic** |
| **ARR Divert / suffix D,Z** | (không bàn) | "Suffix D,Z → vàng; mất D,Z → đỏ"; ARR vàng khi đổi | Không thể hiện suffix/divert | 🟠 lệch — mockup thiếu |
| **Lưu cấu hình cột & search** | (không bàn) | "Lưu cấu hình bảng biểu và search" | Không có drag-drop/save layout | 🟠 lệch — mockup thiếu |
| **MEL/CDL tích hợp AMOS** | (không bàn sâu) | Cảnh báo MEL/CDL từ AMOS Master | Chỉ icon mock, không tích hợp | 🟠 lệch — mockup mock |
| **Taxi time vs FON / time-window ZFW 60-90′** | (ngưỡng 60/90 nhắc trong P2) | Cảnh báo taxi vs FON; ZFW lệch >60′ nội/90′ quốc tế | Không thể hiện time-window | 🟠 lệch — mockup thiếu |
| **Phân quyền theo carrier** | Phân quyền release (admin) | "Phân quyền theo carrier" | Không thể hiện | 🟠 lệch — mockup thiếu |

**Nhận định:** Mockup v0.1 đã phủ tốt **bố cục 22 cột + trạng thái + rule màu tổng quát** (khớp Function list ~85%). Buổi 15/06 **bổ sung** các yếu tố chưa có trong Function list/mockup: **cột PIC confirm**, **ngưỡng phút cụ thể của cảnh báo màu**, **16 mốc A-CDM/turnaround**, **logic un-release/version**. Các **gap mockup** (suffix D/Z, save layout, AMOS, taxi-FON, time-window, carrier) cần đưa vào vòng cập nhật mockup/đặc tả tiếp theo.

---

*Báo cáo v0.1 — Draft. Bước tiếp: (a) cập nhật OID (ngưỡng cảnh báo, PIC confirm, A-CDM phạm vi, attribution ca trực); (b) bổ sung cột PIC confirm + ngưỡng phút vào đặc tả Màn hình Flight Dispatch (PH1) và mockup v0.2; (c) đối chiếu transcript cho các đoạn `[cần xác nhận]`.*
