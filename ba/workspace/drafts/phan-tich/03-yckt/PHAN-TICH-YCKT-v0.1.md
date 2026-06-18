---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA (agent-assisted)"
version: "0.1"
date: "2026-06-09"
status: "Draft"
document_type: "Phân tích Yêu cầu Kỹ thuật (YCKT) — dựa trên decomposition + domain-knowledge"
source: "TOSS - Triển khai-YCKT.xlsx (12 sheet, đã tách MD) · domain-knowledge/"
---

# Phân tích Yêu cầu Kỹ thuật TOSS (YCKT)

> Phân tích dựa trên bộ MD tách từ `TOSS - Triển khai-YCKT.xlsx` (xem [INDEX](INDEX.md)) và đối chiếu kiến thức trong `domain-knowledge/`. Mọi trích dẫn truy vết được về sheet nguồn; thuật ngữ đối chiếu glossary/KB.

## 1. Tổng quan nguồn (12 sheet)

| Sheet | Vai trò | Quy mô |
|---|---|---|
| **TASK** | Việc triển khai + trạng thái (VNA/VTIT/CĐS) | 27 dòng |
| **Lịch KS** | Kế hoạch khảo sát (thành phần, thời gian, hình thức) | 6 |
| **Nhân sự** | Đầu mối phối hợp các CQĐV (CĐS-CN, ATCL, KT, DVHK, VIAGS…) | 8 |
| **YCKT V3** | **338 yêu cầu kỹ thuật TOSS-001…** (xương sống) | 478 |
| **DSP** | Tổng quan DSP | 11 |
| **Tich hop** | **~40 hệ thống/nguồn tích hợp** (in/out) | 42 |
| **MENU** | Cây menu/chức năng | 12 |
| **Cảnh báo & Tham số** | Danh mục cảnh báo + tham số cấu hình | 27 |
| **FOS** | Chi tiết Flight Ops (báo cáo, logic) | 178 |
| **Aircraft** | Quản lý tàu bay | 12 |
| **Yêu cầu chung** | Yêu cầu chung bổ sung | 14 |
| **Logic tính toán** | Logic tính toán nghiệp vụ | 5 |

## 2. Cấu trúc 338 yêu cầu (YCKT V3)

### A. Yêu cầu phi chức năng (NFR) — TOSS-001 → ~TOSS-057
- **Kiến trúc & công nghệ:** Microservices / Cloud Native (CNCF); phân tách tầng (giao diện/nghiệp vụ/dữ liệu) & module độc lập; scale không downtime; restart không gián đoạn (node dự phòng).
- **Bảo mật/ATTT:** tuân thủ ANTT TCTHK; **NĐ 53/2022 (dữ liệu lưu tại VN)**, **NĐ 13/2023 (bảo vệ dữ liệu cá nhân)**; không chia sẻ dữ liệu khi chưa cho phép.
- **Độ tin cậy:** giám sát toàn bộ thành phần; HA active-active/active-standby (chuyển đổi < 1h); rate-limit/điều tiết lưu lượng; phân tách tài nguyên app/DB/log.
- **Phân quyền tập trung:** **phân quyền theo Carrier / sân bay / tàu bay** (⚠ điểm domain quan trọng — gắn [[project-toss-airline-is-lessee]]: hãng đa carrier + đội tàu sở hữu/thuê).
- **Danh mục hệ thống:** cung cấp danh mục cho hệ thống khác qua API/webhook; phân quyền truy cập danh mục.
- **Vận hành/giám sát:** dịch vụ 24/7/365, **60 tháng** kể từ go-live; giám sát tập trung, cảnh báo bất thường.
- **Hạ tầng/sizing:** triển khai trên **Cloud của VNA**; môi trường Prod/Dev-Test/Standby-Backup; **≥4000 user, đồng thời 200**.
- **Bàn giao:** mã nguồn + tài liệu thuộc sở hữu VNA; bàn giao source sau khi hết thuê (60 tháng).

### B. Tích hợp dữ liệu & Quản lý danh mục — TOSS-058 → ~TOSS-121
→ Xem §3 (bản đồ tích hợp). Gồm: quản lý vòng đời API (versioning), cung cấp/đồng bộ DWH/Lakehouse, ≥10 giao tiếp dữ liệu phát sinh không tính phí, **cơ chế tích hợp chủ động ngay khi phát sinh dữ liệu** (không chỉ theo tần suất).

### C. Yêu cầu chức năng — Quản lý Tàu bay (TOSS-122 →)
- **Thông tin tàu bay:** số đăng ký, loại theo **mã ICAO/IATA**, tải trọng, chủ sở hữu, **hình thức thuê/mua**, giới hạn **Flight Cycle (FC)** → khớp [[project-toss-airline-is-lessee]].
- **MEL/CDL:** Master MEL (Data Maintenance/MEL Policy); đồng bộ từ **AMOS**; lọc nhóm MEL ảnh hưởng cockpit/cabin/thợ máy; highlight MEL mới; ghi nhận ảnh hưởng khai thác. → đối chiếu KB `dangerous-goods-notoc/`, glossary **MEL**, meeting 08/06 §15.
- **Performance Factor (PF):** upload dữ liệu đội tàu → tính PF; PF từ **ACARS message**; tàu thiếu dữ liệu dùng PF kỳ trước; cảnh báo tàu thiếu PF; báo cáo PF Trend/Coverage. → đối chiếu meeting 08/06 §15 (BackPACK, Lido + FMC), glossary cần thêm **PF**.
- **Tình trạng tàu bay:** APU, Packs (AC APU INOP lấy từ web). → glossary **APU**.
- **AOG:** lịch AOG đột xuất + thời gian khắc phục. → glossary **AOG**.

### D. Các nhóm chức năng khác (sheet FOS / MENU / Cảnh báo & Tham số)
Quản lý Sân bay (ICAO/IATA, SITA/AFTN/AMHS, sân bay dự bị), Lịch bay, OFP/ATC FPL (cảnh báo sai lệch), khách nối chuyển (Crew Feasibility/connections), tải trọng (**ZFW/Payload Diff, MTOW Exceed** — đối chiếu glossary **Loadsheet/CPM**), Ground Service Gantt, báo cáo nhiên liệu (Fuel Flow/Burn/RTK), FORM D/E.

## 3. Bản đồ Tích hợp (~40 hệ thống) ↔ Phân hệ TOSS ↔ domain-knowledge

| Hệ thống nguồn (mã YCKT) | Phân hệ TOSS (CLAUDE.md §2) | Đối chiếu domain-knowledge |
|---|---|---|
| Netline / **Flight Ops++** (066), Flight Scheduling **SSIM/ASM/SSM** (067), Flight Planning (075), **Lido** mPilot/Adapter (076/077), **MO Plus** (070), **Amadeus PSS** (074) | **Flight Operations / Dispatch** | meeting 08/06 (Ops++, Lido, MO, Amadeus); glossary cần thêm SSIM/ASM |
| **AVES** (068 phi công/tiếp viên + roster), Crew Trip (069) | **Crew Management** | glossary Roster/FTL/Duty Time |
| **MRO/AMOS** (071 MEL/CDL, techlog), TIMS (072), **eTechlog** (073) | **Maintenance & Technical** | KB `faa-icao-dispatcher-core` (Airworthiness), glossary MEL/CAMO/MRO |
| **VMS/VIAGS** (078), FM/Lotus/**PTS** (079), **ACDM** (080 milestones), **DCS** (084) | **Ground Handling** | glossary Turnaround/Gate/GTC/Loadsheet |
| LOMS + **Cassiopee** safety (101), EGS (088), ETS (092) | **Safety & Compliance** | KB ICAO Annex 13/19, glossary SMS |
| RPS (081), **ANCM** (082 phí điều hành bay/qua/hạ cất cánh), Cargo Spot (083) | Thương mại/Chi phí | — |
| **FlightRadar24** (085 vị trí), **Flight Watch** (086 thời tiết/đường bay) | Giám sát/Khí tượng | KB `briefing/`, ICAO Annex 3 |
| **DWH/Lakehouse** (065), WNI/Cirium/SPECTRA (089-091), LMS (094) | Dữ liệu ra | — |
| Điện văn: **ACARS** (095), **SITA TEXT** (096), **UCM** (097), SSIM/ASM (098/099), **AMHS/AFTN** (100) | Tích hợp điện văn | glossary ACARS; meeting (MVT/SITA); cần thêm UCM/AMHS |
| NOTAM/WX email (102), website thời tiết (103), bảng kê nhiên liệu (104), **FIMS migrate** (105), **AD** auth (106) | Nguồn khác | glossary NOTAM; KB briefing |

> **API chờ sẵn:** Overflight Permit API (phép bay qua), Slot & Takeoff/Landing Permit API (slot + phép cất/hạ) → khớp glossary **Slot**, KB Annex 2/11/SERA.

## 4. Đối chiếu thuật ngữ then chốt (đã có trong domain-knowledge)
MEL/CDL · Performance Factor · APU · AOG · NOTOC · Loadsheet/CPM · ACARS · NOTAM · OFP/OSP/OTP · Dispatch Release · Slot · MTOW/ZFW/Payload · Flight Cycle · Dry/Wet Lease.
**Thiếu glossary, cần bổ sung:** SSIM, ASM, SSM, UCM, AMHS/AFTN, AVES, ACDM, DWH/Lakehouse, CDS/CĐS, CQĐV, FIMS, RTK.

## 5. Điểm cần làm rõ khi khảo sát (gaps/questions)
- [ ] **Tích hợp chủ động (event-based)** vs theo tần suất — cơ chế cho từng nguồn (đối chiếu meeting 08/06 §5 snapshot/event chưa chốt).
- [ ] **Phân quyền theo Carrier/sân bay/tàu bay** — mô hình dữ liệu phân quyền (khác MO hiện tại chỉ phân quyền chức năng — meeting 08/06 §12).
- [ ] **Nguồn API Amadeus** real-time hay replicate (meeting 08/06 §16 — chưa verify).
- [ ] **Lido không cho tích hợp (boost)** — ảnh hưởng PF/MEL (meeting 08/06).
- [ ] Các ô **TOSS-003/004/021-024/058-061…** trống nội dung trong sheet (cần đối chiếu bản gốc/hỏi VNA).
- [ ] Danh sách **40 hệ thống**: phương thức (API/SFTP/điện văn/email) + đầu mối từng CQĐV (sheet Nhân sự còn thiếu tên/contact nhiều dòng).

## 6. Liên hệ kế hoạch khảo sát (sheet Lịch KS / Nhân sự / TASK)
- **Lịch KS:** Tổng quan (Lê, An/Nam — trực tiếp), Tổng quan DSP (Mr Dũng), Quản lý tàu bay (Lê).
- **TASK mốc:** lập danh mục dữ liệu tích hợp; YC CĐS cung cấp dữ liệu DWH + **hạ tầng UAT**; khảo sát web Boeing/Airbus lấy báo cáo import; **thông UAT/TEST LHS trước 30/06/2026**.
- **Nhân sự:** đầu mối CĐS-CN (Nguyễn Quỳnh Ngân — CV); các khối ATCL/KT/DVHK/VIAGS **chưa đủ contact** → cần bổ sung.

---
*Phân tích v0.1 — nền cho báo cáo khảo sát. Bước tiếp: (a) đối chiếu transcript họp 09/06 (`meeting-notes/09062026/`) để bổ sung quyết định/làm rõ; (b) hoàn thiện bản đồ tích hợp theo phương thức; (c) bổ sung glossary các thuật ngữ còn thiếu (§4).*
