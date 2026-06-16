---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-16"
status: "Draft"
document_type: "Timeline Cung cấp Tài liệu Đầu vào"
---

# Timeline Cung cấp Tài liệu Đầu vào — Dự án TOSS

> **Mục đích:** Theo dõi toàn bộ tài liệu đầu vào (Customer_docs, meeting transcripts, domain knowledge) theo hai chiều: **(A) thời gian nhận** và **(B) loại tài liệu** — để dễ đối chiếu nguồn khi phân tích.
>
> **Quy ước:** 🟢 Đã xử lý/phân rã · 🟡 Đã nhận, chưa phân rã đầy đủ · 🔴 Chưa xử lý · ⚡ LIVE (kết nối trực tiếp, cần refresh)

---

## A. TIMELINE THEO THỜI GIAN

### Trước 08/06/2026 — Khởi động dự án

| Ngày nhận | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| ~04/2026 | `in-260301.zip` … `in-260331.zip` (31 file) | Dữ liệu ACARS tháng 3/2026 | `Customer_docs/ACARS/` | 🟡 Chưa phân rã toàn bộ |
| ~04/2026 | `B787_GBST_CMF_Bsl_AMI_Descr_D613Z019-06_Rev_New.pdf` | Đặc tả kỹ thuật B787 (ACARS) | `Customer_docs/ACARS/` | 🔴 Chưa xử lý |

### 08/06/2026 — Buổi khảo sát 1: Tổng quan hệ thống

| Ngày | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| 08/06 | Transcript phỏng vấn Part 1 + Part 2 | Ghi âm/ASR | `Customer_docs/meeting-notes/08062026/` | 🟢 Báo cáo v0.4 |
| 08/06 | Biên bản họp (MM-20260608) | Biên bản | `Customer_docs/meeting-notes/08062026/` | 🟢 Đã viết |
| ~08/06 | `[MAIN] FLIGHT DISPATCHER OPERATING PROCEDURE.docx` | Quy trình Dispatcher (FDOP) | `Customer_docs/` | 🟢 Phân rã §3.1–3.5 (10 MD) |
| ~08/06 | `Aircraft_FIMS.xlsx` | Master tàu bay (FIMS — 21 cột) | `Customer_docs/` | 🟢 Extracted |
| ~08/06 | `Aircraft_Netline.xlsx` | Master tàu bay (Netline — 39 cột) | `Customer_docs/` | 🟢 Extracted |
| ~08/06 | `TOSS - Triển khai-YCKT.xlsx` (Google Sheet) | YCKT v3 (12 sheet) | `Customer_docs/` ⚡ | 🟢 Extracted, LIVE |

### 09/06/2026 — Buổi khảo sát 2: Cây menu & YCKT triển khai

| Ngày | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| 09/06 | Transcript phỏng vấn Part 1 + Part 2 | Ghi âm/ASR | `Customer_docs/meeting-notes/09062026/` | 🟢 Báo cáo v0.4 |
| 09/06 | `VNA-TOSS-Function-list-v1.0.xlsx` (Google Drive) | Function list (231 dòng) | `customer-docs-source/` ⚡ | 🟢 Extracted, LIVE |

### 10/06/2026 — Tài liệu bổ sung (giữa các buổi)

| Ngày | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| 10/06 | `BCAO_10Jun2025_11Jun2025-v2.docx` | Báo cáo ngày khai thác mẫu | `Customer_docs/Form/` | 🟢 Extracted |
| 10/06 | Glossary xác nhận khách hàng (TSV) | Từ điển VNA | `domain-knowledge/` | 🟢 Tích hợp Glossary |

### 11/06/2026 — Buổi khảo sát 3 (Sáng + Chiều): Dispatcher chuyên sâu

| Ngày | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| 11/06 sáng | Transcript Part 1 + Part 2 | Ghi âm/ASR | `Customer_docs/meeting-notes/11062026/` | 🟢 Báo cáo v0.3 |
| 11/06 chiều | Transcript BuoiChieu_1 | Ghi âm/ASR | `Customer_docs/meeting-notes/11062026/` | 🟢 Báo cáo v0.3 |
| 11/06 | `DIVERSION REPORT-HVN678-KULSGN-11JUN2026.docx` | Báo cáo lệch hướng mẫu | `Customer_docs/Form/` | 🟡 Chưa phân rã |
| 11/06 | `Sizing-update260609-4T.xlsx` | Định cỡ hạ tầng (311 vCPU, 18TB) | `Customer_docs/` | 🟢 Extracted |

### 12/06/2026 — Buổi khảo sát 4: Flight Detail & màn hình Giám sát

| Ngày | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| 12/06 sáng | Transcript Part 1_fixed + Part 2_fixed | Ghi âm/ASR (đã đính chính) | `Customer_docs/meeting-notes/12062026/` | 🟢 Báo cáo v0.3 |
| 12/06 | `PEP5.16/` (~564 file) | Phần mềm tính hiệu suất bay Airbus | `Customer_docs/PEP5.16/` | 🔴 Chưa xử lý |
| 12/06 | `Airport Databases/AptMgr.mdb` | Cơ sở dữ liệu sân bay (Access) | `Customer_docs/PEP5.16/` | 🔴 Chưa xử lý |
| 12/06 | Aircraft Performance Databases A318–A321, A350 | Dữ liệu hiệu suất tàu bay (XML) | `Customer_docs/PEP5.16/APD/` | 🔴 Chưa xử lý |

### 15/06/2026 — Buổi khảo sát 5: Màn hình Flight Dispatch

| Ngày | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| 15/06 | Transcript Part 1, 2, 3 (+ _fixed + .srt) | Ghi âm/ASR (đã đính chính) | `Customer_docs/meeting-notes/15062026/` | 🟢 Báo cáo v0.2 |
| 15/06 | `2. Tổng hợp các điện ACARS cần phân tích.xlsx` | Chỉ mục ACARS phân tích | `Customer_docs/` | 🟢 Extracted |

### 16/06/2026 — Tài liệu bổ sung mới nhất

| Ngày | Tài liệu | Loại | Vị trí | Trạng thái |
|---|---|---|---|---|
| 16/06 | `TOSS - Total Operations Steering System_v0.1.xlsx` | YCKT biến thể v0.1 (có tab giải thích) | `Customer_docs/` | 🟢 Extracted — tên cần xác nhận `[cần xác nhận]` |
| 16/06 | `Kế hoạch khảo sát TOSS.xlsx` | Lịch 4 tuần / 20 ngày / 10 module | `Customer_docs/` | 🟢 Extracted |

### Chưa xác định ngày — `[cần xác nhận]`

| Tài liệu | Loại | Vị trí | Ghi chú |
|---|---|---|---|
| Transcript NOTOC (Buổi 2 + 3) | Workshop kỹ thuật khai thác | `Customer_docs/meeting-notes/NOTOC_11262026/` | Ngày ghi `11/26/2026` — **sai định dạng**, cần BA Lead xác nhận ngày thực |
| Mockup `dsp_monitoring_poc_v0.1.html` | Prototype màn hình Giám sát | `ba/workspace/drafts/mockup/` | Ngày tạo chưa ghi nhận |

---

## B. PHÂN LOẠI THEO LOẠI TÀI LIỆU

### B1. Yêu cầu kỹ thuật (YCKT)

| Tài liệu | Sheet/Nội dung | Ngày | Trạng thái |
|---|---|---|---|
| `TOSS - Triển khai-YCKT.xlsx` ⚡ | 12 sheet: YCKT V3, FOS, Tích hợp, Cảnh báo, Logic tính toán, Aircraft, Menu, DSP… | ~08/06 | 🟢 Extracted → `TOSS-Trien-khai-YCKT.extracted.md` |
| `VNA-TOSS-Function-list-v1.0.xlsx` ⚡ | Function list 22 cột, 231 dòng | 09/06 | 🟢 Extracted → `VNA-TOSS-Function-list-v1.0.extracted.md` |
| `TOSS - Total Operations Steering System_v0.1.xlsx` | Giống YCKT + tab thuật ngữ | 16/06 | 🟢 Extracted → `TOSS-Total-Operations-Steering-System-v0.1.extracted.md` |

### B2. Quy trình nghiệp vụ (SOP / Procedure)

| Tài liệu | Nội dung | Ngày | Trạng thái |
|---|---|---|---|
| `[MAIN] FLIGHT DISPATCHER OPERATING PROCEDURE.docx` | §3.1 End-to-end · §3.2 Vai trò theo ca · §3.3 VIP · §3.4 Vùng trời không kiểm soát · §3.5 Bàn giao tàu bay | ~08/06 | 🟢 Phân rã 10 MD (EN+VI) |

### B3. Biên bản họp & Transcript phỏng vấn

| Buổi | Ngày | Thời lượng | File transcript | Trạng thái |
|---|---|---|---|---|
| **1** — Tổng quan | 08/06 | ~64 phút | Part1 (0–64′) + Part2 (64′–hết) | 🟢 Báo cáo `v0.2` |
| **2** — Cây menu, YCKT | 09/06 | ~90 phút | Part1 + Part2 | 🟢 Báo cáo `v0.3` |
| **3a** — Dispatcher I | 11/06 sáng | ~75 phút | Part1 + Part2 (_fixed) | 🟢 Báo cáo `v0.1` |
| **3b** — Dispatcher II | 11/06 chiều | ~60 phút | BuoiChieu_1 | 🟢 Báo cáo `v0.1` |
| **4** — Flight Detail | 12/06 sáng | ~65 phút | Part1_fixed + Part2_fixed | 🟢 Báo cáo `v0.1` |
| **5** — Flight Dispatch | 15/06 | ~180 phút | Part1 + Part2 + Part3 (_fixed + .srt) | 🟢 Báo cáo `v0.1` |
| **NOTOC** — Kỹ thuật khai thác | `[cần xác nhận]` | — | Buổi 2 + Buổi 3 | 🔴 Chưa xử lý |

**Tổng: ~534 phút (~9 giờ) transcript đã xử lý** + NOTOC chưa xử lý.

### B4. Master Data tàu bay

| Tài liệu | Nguồn | Cột chính | Ngày | Trạng thái |
|---|---|---|---|---|
| `Aircraft_FIMS.xlsx` | FIMS | 21 cột (khoang, ghế, MTOW, fuel tank, ICAO code) | ~08/06 | 🟢 Extracted |
| `Aircraft_Netline.xlsx` | Netline | 39 cột (operator, hiệu lực, DOW, ILS, AP restriction) | ~08/06 | 🟢 Extracted |

### B5. Dữ liệu ACARS

| Tài liệu | Nội dung | Khoảng thời gian dữ liệu | Trạng thái |
|---|---|---|---|
| `in-260301.zip` … `in-260331.zip` (31 file) | Điện văn ACARS IN thực tế | Tháng 3/2026 | 🟡 Chưa phân rã — cần buổi riêng |
| `2. Tổng hợp các điện ACARS cần phân tích.xlsx` | Danh sách 78 loại điện cần phân tích | — | 🟢 Extracted |
| `B787_GBST_CMF_Bsl_AMI_Descr_D613Z019-06_Rev_New.pdf` | Đặc tả kỹ thuật B787 phục vụ ACARS | — | 🔴 Chưa xử lý |

### B6. Biểu mẫu mẫu (Form)

| Tài liệu | Nội dung | Ngày mẫu | Trạng thái |
|---|---|---|---|
| `BCAO_10Jun2025_11Jun2025-v2.docx` | Báo cáo ngày khai thác (2 phần) | 10–11/06/2025 | 🟢 Extracted |
| `DIVERSION REPORT-HVN678-KULSGN-11JUN2026.docx` | Mẫu báo cáo lệch hướng | 11/06/2026 | 🟡 Chưa phân rã |
| `DIVERSION REPORT-HVN678-KULSGN-11JUN2026 - comments.docx` | Phiên bản có ghi chú | 11/06/2026 | 🟡 Chưa phân rã |

### B7. Hạ tầng & Kiến trúc

| Tài liệu | Nội dung | Ngày | Trạng thái |
|---|---|---|---|
| `Sizing-update260609-4T.xlsx` | 311 vCPU, 18TB, 27 VM, K8s/HAProxy | 11/06/2026 | 🟢 Extracted |
| `PEP5.16/` (~564 file) | Phần mềm tính hiệu suất bay Airbus | 12/06/2026 | 🔴 Chưa xử lý — chờ buổi khảo sát M9 |
| `Airport Databases/AptMgr.mdb` | Cơ sở dữ liệu sân bay (Access) | 12/06/2026 | 🔴 Chờ buổi M5 |

### B8. Kế hoạch dự án

| Tài liệu | Nội dung | Ngày | Trạng thái |
|---|---|---|---|
| `Kế hoạch khảo sát TOSS.xlsx` | 4 tuần / 20 ngày / 10 module / đầu mối VNA | 16/06/2026 | 🟢 Extracted |

### B9. Domain Knowledge (Kiến thức miền — tự thu thập)

| Nhóm | Tài liệu | Số lượng | Trạng thái |
|---|---|---|---|
| Quy định điều phái | FAA 14 CFR + ICAO Annex → `faa-icao-dispatcher-core/` | 7 MD | 🟢 |
| Tiêu chuẩn thực hành | PTS Dispatcher (23 kỹ năng) → `aircraft_dispatcher_pts_10/` | 24 MD | 🟢 |
| Briefing & Thời tiết | FAA AC 91-92 + Handbook Ch3 → `briefing/` | 2 MD | 🟢 |
| Hàng nguy hiểm | ICAO Annex 18 + FOCA CL → `dangerous-goods-notoc/` | 5 MD | 🟢 |
| Định nghĩa IATA | 18 tài liệu PDF → `iata-definitions/` | 18 MD | 🟢 |
| Đề xuất kỹ thuật VNA | VNAOCC v0.3 phân rã → `vnaocc-proposal-decomposed/` | 4 thư mục | 🟢 |
| A-CDM & ATFM | 11 PDF (Changi, Incheon, HK, VN) → `atfm-acdm/` | 11 MD | 🟢 |
| Datalink & PBCS | 5 PDF → `datalink-pbcs/` | 5 MD | 🟢 |
| **Link chưa tải** | ICAO APAC (49), VATM AIM (56), FAA/EASA (~950) | ~1,000 URL | 🔴 Cloudflare/hạn chế |

---

## C. TỔNG KẾT & ĐIỂM CHÚ Ý

### Thống kê

| Hạng mục | Số lượng |
|---|---|
| Buổi khảo sát đã có transcript | 6 buổi (~534 phút) |
| Tài liệu YCKT/Function list | 3 file (2 LIVE) |
| Tài liệu quy trình (SOP) | 1 FDOP đã phân rã + NOTOC chưa xử lý |
| Master data tàu bay | 2 file (FIMS + Netline) |
| Dữ liệu ACARS thực | 31 file nén (tháng 3/2026) |
| Domain knowledge đã xử lý | 8 nhóm (~62 MD, ~14,000 dòng) |
| Biểu mẫu mẫu | 3 file (1 đã extract, 2 chưa phân rã) |

### Các tài liệu chưa xử lý — cần lên lịch

| Tài liệu | Liên quan module | Ưu tiên |
|---|---|---|
| ACARS `in-260301.zip`…`in-260331.zip` | M9 / ACARS integration | 🔴 Cao (PH3) |
| Transcript NOTOC (ngày `[cần xác nhận]`) | M4 Kỹ thuật / Ground Ops | 🟡 Trung bình |
| PEP5.16 + Airport Databases | M9 Performance / M5 Sân bay | 🟡 Trung bình |
| Diversion Report mẫu | M7 OCC disruption | 🟡 Trung bình |
| B787 ACARS spec PDF | M9 ACARS decoding | 🟡 Thấp |

### Điểm cần xác nhận `[cần xác nhận]`

1. Ngày buổi NOTOC — ghi là `11/26/2026` (sai định dạng MM/DD hay ngày lỗi?)
2. Tên "Total Operations Steering System" (v0.1.xlsx) vs tên dự án hiện hành — cần đối chiếu với bên kỹ thuật VNA
3. Mockup `dsp_monitoring_poc_v0.1.html` — ngày tạo và phiên bản gốc

---

## D. QUY TẮC BẢO TRÌ

### D1. Khi có file mới trong `ba/workspace/input/`
Agent phát hiện file mới trong `ba/workspace/input/Customer_docs/` hoặc `meeting-notes/` (không tính ACARS zip và PEP5.16 bulk):
1. Xác định loại tài liệu và ngày cung cấp (từ tên file hoặc context)
2. Thêm entry vào bảng tương ứng trong **mục A** (theo thời gian) VÀ **mục B** (theo loại)
3. Ghi trạng thái `🔴 Chưa xử lý` (mặc định khi mới nhận)
4. Chạy `check-input-timeline.ps1 -Mode Scan` để xác nhận không còn file nào bị bỏ sót
5. Bump version + date trong frontmatter; ghi changelog cuối file

### D2. Khi phát hiện entry trong TIMELINE không có file tương ứng
Agent chạy `check-input-timeline.ps1 -Mode Check` định kỳ hoặc khi nghi ngờ:
1. Nếu tìm thấy entry `[THIẾU]` → **thông báo BA Lead**, nêu rõ: tên file, mục trong TIMELINE, lý do có thể (đã xóa, đổi tên, chưa tải về)
2. **KHÔNG tự xóa** — chờ BA Lead xác nhận
3. Nếu BA Lead xác nhận xóa → xóa entry khỏi TIMELINE (mục A + mục B) + bump version

### D3. Khi cập nhật trạng thái xử lý
Khi một tài liệu được phân rã/xử lý xong:
- Đổi `🔴 Chưa xử lý` → `🟢 Đã xử lý` (hoặc `🟡 Một phần`)
- Ghi rõ bản trích/artifact tương ứng trong cột Trạng thái

### D4. Bỏ qua (không cần track trong TIMELINE)
- `Customer_docs/ACARS/*.zip` — 31 file bulk, chỉ ghi dòng tổng hợp
- `Customer_docs/PEP5.16/**` — 564 file, chỉ ghi dòng tổng hợp
- `domain-knowledge/**` — KB tự thu thập, theo dõi qua `domain-knowledge/INDEX.md`
- File tạm `_combined_*.md` của export-word

### D5. Tần suất kiểm tra
- **Sau mỗi buổi khảo sát:** Chạy `check-input-timeline.ps1 -Mode Both` trước khi viết báo cáo
- **Trước commit git:** Chạy `-Mode Check` để không commit TIMELINE lỗi thời

---

*v0.1 · 2026-06-16 · Nguồn: git log + khảo sát thư mục input*
*v0.2 (2026-06-16): Bổ sung §D Quy tắc bảo trì + script check-input-timeline.ps1.*
