---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-23"
status: "Draft"
document_type: "Thuyết minh nguồn 01-nguon (companion của INDEX)"
---

# Thuyết minh nội dung các nguồn — `01-nguon`

> Bản **diễn giải** đi kèm [`INDEX.md`](INDEX.md): INDEX là bảng tra nhanh 1 dòng/file; tài liệu này giải thích **nội dung cốt lõi, vai trò trong dự án, và liên kết** giữa các nguồn để BA/agent tham chiếu đúng nguồn khi phân tích, viết SRS/BRD, đối chiếu.
>
> Tất cả là **bản trích thô từ `Customer_docs/`** (CLAUDE.md §0 — trung thực, không suy diễn). Đọc chọn lọc theo nhóm dưới đây.

---

## 1. Nguồn LIVE — Google Sheet/Drive (kết nối trực tiếp)

Bốn nguồn này **đồng bộ trực tiếp** từ Google Drive/Sheets của VNA-VTIT, refresh được khi nguồn đổi (xem lệnh `gsheet-to-md.py`/`gdrive-to-md.py` trong INDEX). Đây là **nguồn yêu cầu/chức năng sống** — ưu tiên cao nhất khi đối chiếu vì luôn cập nhật.

- **`TOSS-Trien-khai-YCKT`** — bảng Yêu cầu Kỹ thuật (YCKT) chính thức của VTIT, 13 tab (YCKT V3 ~478 dòng, DSP, FOS, Tích hợp, Menu…). Đây là **xương sống yêu cầu** để rã BR/FUNC; bản phân tích từng sheet ở `../03-yckt/`. Khi BR/FUNC cần truy nguồn yêu cầu gốc → tra ở đây.
- **`VNA-TOSS-Function-list`** — danh sách chức năng (3 tab), trong đó tab **"Màn hình Flight Dispatch"** (~26 cột + logic màu) là nguồn chuẩn cho wireframe/mockup màn Flight Dispatch.
- **`TOSS-Thong-tin-tich-hop-OpsPlus`** — bảng tích hợp NETLINE/OPS++ do bạn An (VNA) lập: 24 luồng inbound + 4 outbound, cột **Phương thức ("Thông qua TOSS" vs "Trực tiếp")**, nguồn, tần suất, trạng thái. **Cốt lõi cho toàn bộ phân tích tích hợp** (KS 19/06 + 23/06); quy tắc phạm vi: chỉ luồng "Thông qua TOSS" thuộc TOSS.
- **`TOSS-Total-Operations-Steering-System-v0.1`** — bản gần giống YCKT + tab "giải thích thuật ngữ" (nguồn cho glossary). ⚠ tên "Total Operations Steering System" cần BA Lead xác nhận so với tên TOSS hiện hành.

## 2. Master tàu bay (→ PH4 Quản lý danh mục)

Hai master đội tàu từ hai hệ nguồn, dùng để xây **data model danh mục tàu bay** và đối chiếu trường dữ liệu cho PH4.

- **`Aircraft_Netline`** (39 cột) và **`Aircraft_FIMS`** (21 cột) — cùng mô tả đội tàu nhưng khác hệ nguồn (Netline vs FIMS), khác bộ cột. Khi thiết kế entity tàu bay cần **đối chiếu trường giữa hai nguồn** để xác định master nào là chuẩn cho từng thuộc tính (liên quan định danh OPS++/FOEM cấp DOW).

## 3. MEL / CDL (→ PH4 + Kỹ thuật khai thác bay)

Nhóm dữ liệu **Minimum Equipment List / Configuration Deviation List** cho B787 — nền tảng cho cảnh báo MEL/CDL 3 lớp (KS 17/06) và Master MEL 2 lớp.

- **`MEL-78A/B/C`** — dữ liệu MEL B787 (CSV, 38 cột) tách theo **3 biến thể cấu hình tàu**: 78A = 787-9 cấu hình A (có OFCR/OFAR), 78B = 787-9 cấu hình B (không OFCR/OFAR), 78C = 787-10. Cột chính: `deviation_code` (mã item theo ATA = phần `XX-XX-XX` trong [Mã item MEL/CDL]), `mel_dx_remark` (điều kiện EDTO/altitude/RVSM/CAT), penalty (`p_tow/p_lw/p_altitude`…). **Đây là dữ liệu deviation chi tiết để phân tích penalty + ảnh hưởng khai thác.**
- **`Extracted pages from MEL B787_R10`** — chỉ là List of Effective Pages (Preface) của MEL gốc; dùng tham chiếu **cấu trúc tài liệu MEL** (Section 2 = MEL, 3 = CDL — xem glossary "Mã item MEL/CDL"). Bản MEL đầy đủ 13.9MB không trích; dùng MEL-78A/B/C cho dữ liệu.

## 4. ACARS

Ba nguồn về điện văn ACARS — phục vụ phân hệ giám sát thời gian thực (OOOI, fuel, fault) và tích hợp.

- **`B787-CMF_parts/`** (đã phân rã 13 section) — tài liệu kỹ thuật Boeing **CMF (Communications Management Function) Baseline AMI** cho B787: đặc tả từng màn hình CDU/MFD, nội dung downlink/uplink message (Flight Init, Weather/NOTAMs, Manual/Automatic Reports…). Tra theo section ở [`B787-CMF_parts/INDEX.md`](B787-CMF_parts/INDEX.md) khi cần hiểu **định dạng/cấu trúc điện ACARS B787** (⚠ BOEING PROPRIETARY / ECCN 7E994 — hạn chế chia sẻ).
- **`acars-rcv-analysis`** — phân tích kỹ thuật 31 ZIP tháng 03/2026 (757k điện), 14 loại message (DFD/A80/M16/DEP/ARR/ENG/CFD/FML/ATC…), traceability sang PH1/PH3/PH5 + 8 điểm cần SME xác nhận. **Nguồn để hiểu loại điện thực tế VNA nhận.**
- **`tong-hop-dien-acars`** — bảng tổng hợp các điện ACARS cần phân tích (xlsx), nền cho glossary nhóm điện (MVA/M11/M13/M14…).

## 5. Tài liệu chuyến (mẫu — GD / Loadsheet / Passenger Manifest / OFP)

Năm mẫu tài liệu chuyến bay thực tế (HAN→PQC VN1237, PQC→SGN VN1822, SGN→SFO HVN1999) — **chuẩn định dạng** để thiết kế màn/đặc tả trường dữ liệu, đối chiếu luồng tích hợp (DCS, loadsheet, OFP).

- **`GD_VN1237`** — General Declaration (form khai báo chung): tổ bay, số khách, declaration of health, chữ ký cơ trưởng. Liên quan PH1 + tích hợp DCS.
- **`LOADSHEET_VN1237`** — Load & Trim Sheet: trọng lượng (DOW/ZFW/TOW/LW), tải khoang, trim/CG, LMC. Chuẩn trường **cân bằng tải** (PH1/PH5; đối chiếu điện LDM).
- **`PM_VN1237` / `PM_VN1822`** — Passenger Manifest: sơ đồ ghế, VIP/CIP, special meal, wheelchair, frequent flyer, SkyTeam tier. Liên quan điều phái + NOTOC + weight; đối chiếu luồng Amadeus (PNL/ADL/Pax Detail).
- **`OFP-SGN-SFO-RECLEARANCE`** — OFP reclearance layout mới: route waypoint, FL profile, EDTO alternates, fuel breakdown. **Chuẩn cho phân hệ Flight Dispatch / Briefing** + thiết kế màn OFP.

## 6. Báo cáo khai thác

- **`BCAO_10Jun2025_11Jun2025`** — Báo cáo Công tác An toàn/Khai thác ngày (10–11/Jun): nguồn cho dashboard BCAO (PH3) + KPI OTP/OSP/LF.
- **`DIVERSION_REPORT-HVN678`** (+ bản comments) — báo cáo chệch hướng HVN678 KUL→SGN do thunderstorm: TAF/METAR/ATIS + quyết định tổ bay. **Bằng chứng nghiệp vụ** cho cảnh báo Diversion/thời tiết theo Minima (PH1).

## 7. Quy trình & khảo sát chuyên đề

- **`main-flight-dispatcher-operating-procedure`** — Quy trình Điều phái viên (FDOP) đầy đủ; bản phân rã theo mục ở `../flight-dispatcher-procedure/`. **Nguồn quy trình gốc** để rã luồng nghiệp vụ điều phái (As-Is) + đối chiếu FUNC.
- **`VNA-KTKTB-Buoi2` / `Buoi3`** — biên bản khảo sát Phòng Kỹ thuật khai thác bay: buổi 2 (MEL authoring Boeing FrameMaker+IXP / Airbus FODM, công cụ W&B), buổi 3 (lập phương án đường bay LIDO, thư viện khai thác SkyOffice). Nguồn cho phân hệ MEL/CDL + route.

## 8. Kế hoạch & hạ tầng

- **`Ke-hoach-khao-sat-TOSS`** — kế hoạch khảo sát 4 tuần/20 ngày (module M1–M10, lịch ngày, mốc freeze Batch 1–3, giả định A1–A6). PC dùng làm **baseline tiến độ**.
- **`Sizing-update-260609-4T`** — sizing hạ tầng → căn cứ **BR-516** (yêu cầu hạ tầng).

---

## Bản đồ nhanh: nguồn → phân hệ / mục đích

| Cần gì | Tra nguồn nào |
|---|---|
| Yêu cầu/chức năng gốc | YCKT (LIVE) · Function-list · vnaocc-proposal (domain-knowledge) |
| Tích hợp OPS++ (luồng/điện) | Thong-tin-tich-hop (LIVE) · acars-rcv-analysis · B787-CMF_parts |
| Danh mục tàu bay (PH4) | Aircraft_Netline · Aircraft_FIMS |
| MEL/CDL + penalty | MEL-78A/B/C · Extracted pages MEL · KTKTB Buoi2 · glossary "Mã item MEL/CDL" |
| Màn/đặc tả tài liệu chuyến | GD · LOADSHEET · PM · OFP-reclearance |
| Báo cáo/KPI (PH3) | BCAO · DIVERSION |
| Quy trình điều phái (As-Is) | main-flight-dispatcher · KTKTB Buoi3 |
| Tiến độ / hạ tầng | Ke-hoach-khao-sat · Sizing-update |

> **Quy ước tham chiếu:** trích nguồn theo `<tên-file> [mục/dòng]` (vd `MEL-78A.extracted.md [deviation_code 21-31]`). Nguồn LIVE refresh trước khi trích nếu nghi đã đổi. Tài liệu lớn → trích theo section trong `<tên>_parts/`.

---

## Quy tắc cho agent — tra cứu & bổ sung nguồn (BẮT BUỘC)

> Mục tiêu: agent phiên sau **chỉ cần đọc INDEX + thuyết minh này** là biết **nguồn nào cho việc gì**, không phải mở từng file dò.

### A. Tra cứu nhanh (lookup) — thứ tự
1. Mở [`INDEX.md`](INDEX.md) → xác định **nhóm (1–8)** chứa nguồn cần.
2. Đọc **thuyết minh nhóm** ở trên (+ bảng *"cần gì → tra nguồn nào"*) để chọn **đúng nguồn**.
3. Mở file/section cần — **đọc chọn lọc** (Grep/offset-limit), KHÔNG nạp cả file. Tài liệu lớn → mở section trong `<tên>_parts/INDEX.md`.
4. Thuật ngữ/viết tắt → `/term-check` (glossary + domain-knowledge) trước khi đọc nguồn thô.

### B. Bổ sung nguồn mới (cùng task với extract — không để sau)
Khi thêm/extract một file vào `01-nguon/` (theo CLAUDE.md §8), BẮT BUỘC làm đủ:
1. **Extract** → `<tên>.extracted.md`. File **> ~800 dòng** → `split-md-by-section.py` → `<tên>_parts/`.
2. **INDEX:** thêm 1 dòng vào **đúng nhóm** (cột `File | Dòng | Nguồn/nội dung`). Chưa có nhóm phù hợp → tạo nhóm `## N. <tên nhóm>` mới (cập nhật cả ở đây).
3. **Thuyết minh (file này):** thêm 1 đoạn cho nguồn — nêu **nội dung cốt lõi + vai trò dự án + phân hệ liên quan (PHx) + liên kết chéo** (tới nguồn/glossary khác). Cập nhật bảng *"nguồn → phân hệ"* nếu mở chủ đề mới.
4. **Đồng bộ:** mỗi file trong `01-nguon/` phải **có mặt ở CẢ INDEX và thuyết minh** (INDEX = tra nhanh; thuyết minh = vai trò + liên kết). `project-coordinator` rà định kỳ: tập file thực tế = tập liệt kê ở INDEX = tập diễn giải ở đây.

### C. Áp cùng khuôn cho thư mục nguồn khác
Khuôn **INDEX (nhóm) + THUYET-MINH (vai trò) + đọc chọn lọc** này áp được cho mọi thư mục nguồn lớn khác (`02-khao-sat/`, `03-yckt/`, `domain-knowledge/`…). Khi một thư mục đạt ≥ ~8 file hỗn hợp → cân nhắc thêm bản thuyết minh tương tự.
