# INDEX — Bản trích nguồn khách hàng (raw extract)

> Bản trích **thô, trung thực** (CLAUDE.md §0) từ tài liệu trong `input/Customer_docs/`. Là tài liệu tra cứu: **Grep/đọc đúng mục cần, không nạp cả file** (rule đọc chọn lọc). Có thể lệch danh sách lồng/bảng header rỗng (`NaN`/`Unnamed` với xlsx) — dọn tay khi cần bản chính thức.
>
> **Tổ chức theo nhóm nguồn** (file vẫn phẳng trong thư mục — chỉ nhóm ở INDEX để tra nhanh). Tài liệu lớn được phân rã sang `<tên>_parts/` (xem cột Dòng).
>
> 📖 **Thuyết minh nội dung + vai trò + liên kết từng nguồn:** [THUYET-MINH-NGUON.md](THUYET-MINH-NGUON.md) — đọc khi cần hiểu nguồn nào dùng cho việc gì + bản đồ nguồn → phân hệ.

## 1. Nguồn LIVE — Google Sheet/Drive (refresh được)

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `TOSS-Trien-khai-YCKT.extracted.md` | 937 | **LIVE** YCKT-VTIT (Google Sheet native, 13 tab) — refresh `gsheet-to-md.py` id `1DGIy…`; phân tích từng sheet ở `../yckt-trien-khai/` (bản tĩnh đã lệch) |
| `VNA-TOSS-Function-list-v1.0.extracted.md` | 231 | **LIVE** Danh sách chức năng TOSS (Drive xlsx, 3 tab: Tổng Quan/Function list/Màn hình Flight Dispatch) — refresh `gdrive-to-md.py` id `15icZM…` |
| `TOSS-Thong-tin-tich-hop-OpsPlus.extracted.md` | 51 | **LIVE** Thông tin tích hợp NETLINE/OPS++ (Google Sheet native, tab "Ops++") — 24 luồng inbound/outbound (MVT/MVA/DIV/LDM/FMM/SSIM/PTM/ADL/PNL…) kèm cột nguồn, phương thức (SFTP/Email), tần suất, trạng thái triển khai. Bảng bạn An (VNA) tổng hợp ở buổi 19/06 — refresh `gsheet-to-md.py` id `1pL3sW…` |
| `TOSS-Total-Operations-Steering-System-v0.1.extracted.md` | 877 | "TOSS - Total Operations Steering System v0.1" (xlsx) — giống YCKT (YCKT V3/MENU/FOS…) + tab **"giải thích thuật ngữ"** (nguồn glossary). ⚠ tên "Total Operations Steering System" — cần BA Lead xác nhận vs tên TOSS hiện hành |

## 2. Master tàu bay (→ PH4 Quản lý danh mục)

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `Aircraft_Netline.extracted.md` | 697 | Master tàu bay nguồn Netline (39 cột) → PH4 |
| `Aircraft_FIMS.extracted.md` | 146 | Master tàu bay nguồn FIMS (21 cột) → PH4 |

## 3. MEL / CDL (→ PH4 + Kỹ thuật khai thác bay)

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `MEL-78A.extracted.md` | 225 | Dữ liệu MEL B787 dạng CSV — biến thể **perf_type = 87975** (787-9 cấu hình A, có OFCR/OFAR installed). 38 cột: `icao_airl_code` (HVN), `deviation_code` (ATA 21/22/23/…/80), `mel_dx_remark` (điều kiện vận hành: EDTO/altitude/RVSM/CAT…), `mel_ofp_remark` (mô tả hệ thống), `p_tow/p_lw/p_enrte_wt` (giảm trọng), `p_altitude`, `p_etops_circles`, `auto_land_down`, `ils_down`… Dùng cho phân tích MEL/CDL. |
| `MEL-78B.extracted.md` | 224 | Cùng schema MEL như 78A — biến thể **perf_type = 87967** (787-9 cấu hình B, **WITHOUT** OFCR/OFAR installed). |
| `MEL-78C.extracted.md` | 219 | Cùng schema MEL — biến thể **perf_type = 87X75** (787-10, WITHOUT OFCR/OFAR installed). Tách 3 file theo cấu hình tàu giúp tra deviation đúng variant. |
| `Extracted pages from MEL B787_R10(30SEP25).extracted.md` | 14 | Trang đầu MEL B787 R10 ngày 30/09/2025 (PDF, Preface) — **List of Effective Pages** liệt kê section P/0/1 (Front Matter, Preface, General, EICAS Messages) + ngày sửa từng trang. *(Bản MEL B787 đầy đủ 13.9MB KHÔNG extract — dùng MEL-78A/B/C cho dữ liệu deviation.)* |

## 4. ACARS

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| [`B787-CMF_parts/`](B787-CMF_parts/INDEX.md) | 15k (14 part) | **787 Communications Management Function (CMF) Baseline AMI Version F — Description Document** (Boeing D613Z019-06, BOEING PROPRIETARY, ECCN 7E994) — tài liệu kỹ thuật ACARS B787. **Đã phân rã 13 section** (Introduction · Global Settings · Menus · Flight Initialization · Weather/NOTAMs · Messaging · Request-Response · Manual/Automatic Reports · Reminders · Loop Back · Miscellaneous · Supporting Components) + front matter → tra ở `B787-CMF_parts/INDEX.md`. *(GBST trong tên file gốc = mã build CMF AMI.)* |
| `acars-rcv-analysis.extracted.md` | 272 | **Phân tích kỹ thuật ACARS** — 31 ZIP tháng 03/2026 (757.474 điện); 14 loại message (DFD/A80/M16/DEP/ARR/ENG/CFD/FML/ATC…); traceability PH1/PH3/PH5; 8 điểm cần xác nhận SME |
| `tong-hop-dien-acars.extracted.md` | 202 | Tổng hợp điện ACARS cần phân tích (xlsx) |

## 5. Tài liệu chuyến (mẫu — General Declaration / Loadsheet / Passenger Manifest / OFP)

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `GD_VN1237_R01_19JUN26.extracted.md` | 39 | **General Declaration** mẫu (form VIAGS Nội Bài) cho chuyến VN1237 HAN→PQC ngày 19/06/2026 — Operator/Flight No/Date, Flight Routing (Place/Names of Crew/Number of Passengers — 8 dòng tổ bay CAPT/FO/PUR/CA), Declaration of Health, ô ký Pilot-in-Command. Liên quan PH1 + tích hợp DCS. |
| `LOADSHEET_VN1237_R02_19JUN26.extracted.md` | 53 | **Load & Trim Sheet** mẫu VN1237 HAN→PQC 19/06/2026 (txt, KG): A/C reg VN-A329, version J16W18Y150, crew 2/6, Load Compartments 1–5, Pax/Cabin Bag (113/19/0 TTL 132), DOW/ZFW/TOW/LW/Trip Fuel/Taxi Fuel, DOI 39.0/MACTOW 21.6/STAB TRIM 1.9 UP, Pantry C, LMC. Liên quan PH1/PH5. |
| `PM_VN1237_R01_19JUN26.extracted.md` | 225 | **PM = Passenger Manifest** — danh sách khách VN1237/19JUN26 HAN→PQC, A321 (txt): J-Chart sơ đồ ghế C, VIP/CIP/PE, Special Meal (AVML), Wheelchair (WCHR), Extra Seat, Deportee, Medical, Battery Lithium; phần "PASSENGER MANIFEST" từng pax (tên/ghế/hạng). → điều phái + dispatch (NOTOC, weight). |
| `PM_VN1822_R01_19JUN26.extracted.md` | 159 | **PM = Passenger Manifest** VN1822/19JUN26 PQC→SGN, A321 reg VN-A614 (txt) — Seat Plan All Names theo cabin J/W/Y, breakdown PAX 0/7/83, Vacant/Blocked Seats, Meal Summary, Unaccompanied Minors, Frequent Flyer (VN GLD/PLA/SLV/TTN), SkyTeam Elite/Elite Plus. |
| `OFP-SGN-SFO-RECLEARANCE.extracted.md` | 1039 | **OFP (Operational Flight Plan) reclearance** mẫu HVN1999 SGN→SFO A359 (OFP 10/1/1, 01MAY26) — Flight Brief: IFR/EDTO/RCL, cost index/altitude profile, route waypoint (BIXEX/MEVIN/POROT…), FL levels, takeoff/enroute/destination/EDTO alternates (VVTS/VVDN/RPLL/RCTP/ROAH/RJBB/RJTT/RJCC/KSJC/KSEA), wx/wind, fuel breakdown. Layout mới — chuẩn cho phân hệ Flight Dispatch / Briefing. |

## 6. Báo cáo khai thác

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `BCAO_10Jun2025_11Jun2025-v2.extracted.md` | 434 | Báo cáo ngày khai thác 10–11/Jun (docx) |
| `DIVERSION_REPORT-HVN678-KULSGN-11JUN2026.extracted.md` | 57 | Báo cáo chệch hướng HVN678 KUL→SGN 11/06/2026 (thunderstorm) — TAF/METAR/ATIS/quyết định tổ bay |
| `DIVERSION_REPORT-HVN678-KULSGN-11JUN2026_-_comments.extracted.md` | 57 | Bản có bình luận của báo cáo chệch hướng HVN678 (cùng sự kiện) |

## 7. Quy trình & khảo sát chuyên đề

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `main-flight-dispatcher-operating-procedure.md` | 2433 | Quy trình Flight Dispatcher (docx, đầy đủ) — bản phân rã ở `../flight-dispatcher-procedure/` |
| `VNA-KTKTB-Buoi2.extracted.md` | 63 | Khảo sát buổi 2 — Phòng Kỹ thuật khai thác bay: MEL authoring (Boeing FrameMaker+IXP, Airbus FODM), W&B tool |
| `VNA-KTKTB-Buoi3.extracted.md` | 92 | Khảo sát buổi 3 — Phòng Kỹ thuật khai thác bay: Lập phương án đường bay (LIDO), Thư viện khai thác (SkyOffice) |

## 8. Kế hoạch & hạ tầng

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `Ke-hoach-khao-sat-TOSS.extracted.md` | 90 | **Kế hoạch khảo sát 4 tuần/20 ngày** (xlsx): module M1–M10, lịch theo ngày, mốc freeze Batch 1–3, đầu mối VNA, giả định A1–A6 |
| `Sizing-update-260609-4T.extracted.md` | 299 | Sizing hạ tầng (xlsx) → BR-516 |
