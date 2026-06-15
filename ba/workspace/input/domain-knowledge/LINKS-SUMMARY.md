---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Index — Tổng hợp tài liệu tham chiếu (link + trạng thái tải)"
version: "1.0"
date: "2026-06-15"
status: "Active"
---

# Tổng hợp tài liệu tham chiếu — TOSS Domain Knowledge

> **Mục đích:** Một cửa tra cứu toàn bộ nguồn tài liệu bên ngoài đang được thu thập cho dự án TOSS.  
> **Cách dùng:** Tìm phân hệ cần → xem bộ tài liệu liên quan → mở file chi tiết.  
> **Trạng thái:** ✅ = PDF đã tải về local · 🔗 = chỉ có link, chưa tải · 📄 = đã phân rã thành `.md` (không lưu PDF)

---

## 1. Bảng tổng quan các bộ tài liệu

| Bộ tài liệu | Nguồn | # Link | # PDF local | Trạng thái | File chi tiết |
|---|---|---|---|---|---|
| **FAA/ICAO Dispatcher Core** | FAA 14 CFR + ICAO Annexes | 7 | 7 ✅ | Hoàn tất | [faa-icao-dispatcher-core/README.md](faa-icao-dispatcher-core/README.md) |
| **Aircraft Dispatcher PTS** | FAA PTS (gov pub) | 1 | 0 (PDF ở root) | 📄 Đã phân rã | [aircraft_dispatcher_pts_10.md](aircraft_dispatcher_pts_10/aircraft_dispatcher_pts_10.md) |
| **Briefing / Pre-flight** | FAA AC + Handbooks | 2 | 2 ✅ | Hoàn tất | [briefing/](briefing/) |
| **ICAO Annex 18 / Hàng nguy hiểm** | FOCA + ICAO Annex 18 | 5 | 0 | 📄 Đã phân rã | [dangerous-goods-notoc/](dangerous-goods-notoc/) |
| **IATA Definitions** | iata.org/contentassets | 18 | 18 ✅ | Hoàn tất | [iata-definitions/iata-definitions-links.md](iata-definitions/iata-definitions-links.md) |
| **EUFALDA — Điều phái viên EU** | eufalda.org | 9 | 0 | 🔗 Link only | [_links/eufalda-pdf-links.md](_links/eufalda-pdf-links.md) |
| **FFAC — ICAO/EASA (tuyển chọn TOSS)** | ffac.ch | ~150 | 0 | 🔗 Link only | [_links/ffac-pdf-links-toss-relevant.md](_links/ffac-pdf-links-toss-relevant.md) |
| **FFAC — Định nghĩa chuẩn (rộng hơn)** | ffac.ch | ~200 | 0 | 🔗 Link only | [_links/ffac-pdf-links-toss-definitions.md](_links/ffac-pdf-links-toss-definitions.md) |
| **ICAO APAC eDocs** | icao.int/APAC | 49 | 0 | 🔗 Link only ⚠️ CF | [_links/icao-apac/icao-apac-links.md](_links/icao-apac/icao-apac-links.md) |
| **VATM AIM — Việt Nam** | aim.vatm.vn | 56 | 1 ✅ | 🔗 Tải dở | [_links/vatm-aim/vatm-aim-pdf-links.md](_links/vatm-aim/vatm-aim-pdf-links.md) |

> ⚠️ CF = ICAO website bảo vệ bởi Cloudflare — không tự động tải được; xem [icao-apac/download-helper.html](icao-apac/download-helper.html) để tải thủ công qua trình duyệt.

---

## 2. Phân loại theo phân hệ TOSS

### Phân hệ 1 — Thông tin điều hành chuyến bay (Flight Operations Control / OCC Monitoring)

| Tài liệu | Bộ | Trạng thái |
|---|---|---|
| ICAO Annex 6 Part 1 — Vận chuyển thương mại | FAA/ICAO Core | ✅ PDF + 📄 MD |
| ICAO Annex 2 — Quy tắc bay | FAA/ICAO Core | ✅ PDF + 📄 MD |
| FAA 14 CFR Part 121 — Khai thác trong nước & quốc tế | FAA/ICAO Core | ✅ PDF + 📄 MD |
| FAA 14 CFR Part 91 — Quy tắc bay tổng quát | FAA/ICAO Core | ✅ PDF + 📄 MD |
| FAA 14 CFR Part 65 — Chứng chỉ điều phái | FAA/ICAO Core | ✅ PDF + 📄 MD |
| Aircraft Dispatcher PTS — Tiêu chuẩn thực hành kỹ năng | PTS | 📄 MD |
| Hướng dẫn Pre-flight Briefing (FAA AC 91-92) | Briefing | ✅ PDF + 📄 MD |
| Thông tin thời tiết hàng không (FAA H-8083-28 Ch.3) | Briefing | ✅ PDF + 📄 MD |
| APAC A-CDM Implementation Plan (2nd Ed) | ICAO APAC | 🔗 CF |
| APAC ATFM Collaborative Framework v4 (2022) | ICAO APAC | 🔗 CF |
| APAC ATFM Concept of Operations v1 (2015) | ICAO APAC | 🔗 CF |
| APAC ATM Performance Management Framework | ICAO APAC | 🔗 CF |
| APAC OPADD — AIS Dynamic Data Edition 4.1 | ICAO APAC | 🔗 CF |
| APAC ATS Route Catalogue v25.2 | ICAO APAC | 🔗 CF |
| APAC Guidance — PANS-ATM Doc4444 Amendment 1 | ICAO APAC | 🔗 CF |
| APAC Regional ATM Contingency Plan v3 | ICAO APAC | 🔗 CF |
| FUA NOTAM Templates | ICAO APAC | 🔗 CF |
| AIC Việt Nam 07-25, 01-26, 02-26, 05-26 (CAAV) | VATM AIM | ✅ 1 / 🔗 3 |
| AIP SUP / eSUP Việt Nam (2025-2026, ~39 ấn bản) | VATM AIM | 🔗 |
| EU-OPS — Quy định khai thác máy bay EU | EUFALDA | 🔗 |
| FAA 14 CFR Part 117 — Giới hạn thời gian bay/nhiệm vụ & nghỉ | FAA/ICAO Core | ✅ PDF + 📄 MD |
| ICAO Annex 15 — Dịch vụ thông tin hàng không (AIS) | FAA/ICAO Core | ✅ PDF + 📄 MD |

---

### Phân hệ 2 — Tài liệu chuyến bay (Dispatch Release, OFP, Load Sheet)

| Tài liệu | Bộ | Trạng thái |
|---|---|---|
| FAA 14 CFR Part 121 Subpart U — Dispatch Release | FAA/ICAO Core | ✅ PDF + 📄 MD |
| ICAO Annex 6 Part 1 Ch.4 — OFP, Weight & Balance | FAA/ICAO Core | ✅ PDF + 📄 MD |
| IFALDA FOO CBTA — Năng lực điều phái | EUFALDA | 🔗 |
| EASA NPA RMT.0392 — Quy định nhân viên điều phái | EUFALDA | 🔗 |

---

### Phân hệ 3 — Quản lý nhiên liệu (Fuel Management / ACARS Fuel)

| Tài liệu | Bộ | Trạng thái |
|---|---|---|
| ICAO Annex 6 Part 1 Ch.4 — Fuel Planning & Policy | FAA/ICAO Core | ✅ PDF + 📄 MD |
| FAA 14 CFR Part 121 Subpart F — Fuel Requirements | FAA/ICAO Core | ✅ PDF + 📄 MD |
| ACARS OOOI raw data (31 ngày tháng 3/2026) | Customer_docs/ACARS | 📦 Zip local |

---

### Phân hệ 4 — Hành khách & Ground Handling

| Tài liệu | Bộ | Trạng thái |
|---|---|---|
| ICAO Annex 18 — Vận chuyển hàng nguy hiểm | Dangerous Goods | 📄 MD |
| FOCA CL Dangerous Goods (Complex, 2018/2022) | Dangerous Goods | 📄 MD |
| Best Practices SSR Codes — Dịch vụ hành khách | IATA | ✅ PDF |
| IATA IID Guidance Material 2025 | IATA | ✅ PDF |
| Business Requirements Common Use Positions | IATA | ✅ PDF |
| One ID Glossary v5 — Nhận dạng hành khách | IATA | ✅ PDF |
| Baggage Tag Issuer Requirements | IATA | ✅ PDF |
| RFID OEM Requirements — Thẻ hành lý RFID | IATA | ✅ PDF |
| Consumer Protection Principles | IATA | ✅ PDF |
| APAC Regional Guidance on AOPC | ICAO APAC | 🔗 CF |
| Generic Aerodrome Inspection Handbook v2 | ICAO APAC | 🔗 CF |
| Aerodrome SMS Evaluation Tool | ICAO APAC | 🔗 CF |
| IATA Aircraft Handling Manual (Flying Skills section) | IATA | ✅ PDF |
| PNRGov Principles — Khai báo hành khách quốc tế | IATA | ✅ PDF |
| IATA CFMI Engine MTC Key Principles 2019 | IATA | ✅ PDF |

---

### Phân hệ 5 — Tích hợp ACARS / Data Link / AFTN-AMHS

| Tài liệu | Bộ | Trạng thái |
|---|---|---|
| APAC CNS Airground Data Link | ICAO APAC | 🔗 CF |
| APAC Data Link Implementation Strategy | ICAO APAC | 🔗 CF |
| APAC Guidance ADS-B/CPDLC/AIDC Ground Systems v2 | ICAO APAC | 🔗 CF |
| Guidance Data Link Performance Improvement (Aircraft Ops) | ICAO APAC | 🔗 CF |
| AIDC IGD Edition 2.0 (June 2025) | ICAO APAC | 🔗 CF |
| AFTN-AMHS Routing Directory 30th Edition | ICAO APAC | 🔗 CF |
| SOP Update AMC AFTN/AMHS Routing Table APAC | ICAO APAC | 🔗 CF |
| APAC CRV Operations Manual v1.4 | ICAO APAC | 🔗 CF |
| Recommendations AIDC Implementation | ICAO APAC | 🔗 CF |
| PAN ICD AIDC v1.0 | ICAO APAC | 🔗 CF |
| Guidance End-to-End Safety Data Link Systems 2024 | ICAO APAC | 🔗 CF |
| APAC PBCS Transition | ICAO APAC | 🔗 CF |
| PBCS Operational Authorization Guidance | ICAO APAC | 🔗 CF |
| ACARS Boeing B787 CMF Baseline AMI Description | Customer_docs/ACARS | 📦 PDF local |
| VNA ACARS message types cần phân tích | Customer_docs/ACARS | 📦 XLSX local |

---

### A-CDM — Airport Collaborative Decision Making

| Tài liệu | Bộ | Trạng thái |
|---|---|---|
| APAC A-CDM Implementation Plan (2nd Ed) | ICAO APAC | 🔗 CF |
| HKIA A-CDM Operations Guidelines | ICAO APAC | 🔗 CF |
| Incheon A-CDM Operation Manual Rev3 2020 | ICAO APAC | 🔗 CF |
| SOP for Chennai A-CDM | ICAO APAC | 🔗 CF |
| FAQ A-CDM | ICAO APAC | 🔗 CF |
| ICAO APAC A-CDM Monitoring and Reporting Scheme | ICAO APAC | 🔗 CF |
| APAC A-CDM Guidance Material | ICAO APAC | 🔗 CF |
| APAC Use Cases SWIM-MET-ATFM (First Ed) | ICAO APAC | 🔗 CF |

---

### MET — Thời tiết hàng không (cho Briefing & Dispatch)

| Tài liệu | Bộ | Trạng thái |
|---|---|---|
| Thông tin thời tiết hàng không (FAA H-8083-28 Ch.3) | Briefing | ✅ PDF + 📄 MD |
| APAC Guidance Tailored MET to Support ATM (4th Ed, 2023) | ICAO APAC | 🔗 CF |
| APAC SIGMET Guide 12th Ed (Nov 2025) | ICAO APAC | 🔗 CF |
| APAC ROBEX Handbook 19th Ed (Feb 2026) | ICAO APAC | 🔗 CF |
| Guidelines OPMET Data Exchange IWXXM (2023) | ICAO APAC | 🔗 CF |
| Guidance SNOWTAM Issuance Ed 1.1 (2020) | ICAO APAC | 🔗 CF |

---

## 3. Tài liệu nguồn từ khách hàng (Customer_docs)

| File | Loại | Nội dung | Vị trí |
|---|---|---|---|
| `FLIGHT DISPATCHER OPERATING PROCEDURE.docx` | DOCX | Quy trình điều phái hiện tại của VNA | `Customer_docs/` |
| `TOSS - Triển khai-YCKT.xlsx` | XLSX | Ma trận YCKT đầy đủ (~965 KB) | `Customer_docs/` |
| `BCAO_10Jun2025_11Jun2025-v2.docx` | DOCX | Biên bản họp BCAO tháng 6/2025 | `Customer_docs/` |
| `Sizing-update260609 - 4T.xlsx` | XLSX | Cập nhật sizing hệ thống | `Customer_docs/` |
| `Aircraft_FIMS.xlsx` | XLSX | Dữ liệu tàu bay FIMS | `Customer_docs/` |
| `Aircraft_Netline.xlsx` | XLSX | Dữ liệu tàu bay Netline | `Customer_docs/` |
| `DanhSachChucNang.xlsx` | XLSX | Danh sách chức năng | `input/` |
| `2. Tổng hợp các điện ACARS cần phân tích.xlsx` | XLSX | Danh sách loại điện ACARS VNA cần xử lý | `Customer_docs/ACARS/` |
| `B787_GBST_CMF_...pdf` | PDF | Boeing B787 ACARS CMF Baseline AMI | `Customer_docs/ACARS/` |
| `in-260301.zip … in-260331.zip` (31 file) | ZIP | Điện ACARS inbound tháng 3/2026 (raw) | `Customer_docs/ACARS/` |
| `PEP5.16/` | — | Dữ liệu hệ thống PEP 5.16 | `Customer_docs/PEP5.16/` |

---

## 4. Việc cần làm — Tải PDF còn thiếu

| Ưu tiên | Bộ | Số lượng | Cách tải | Mức độ quan trọng |
|---|---|---|---|---|
| P1 | ICAO APAC — Nhóm A-CDM (7 file) | 7 | Thủ công qua [download-helper.html](_links/icao-apac/download-helper.html) | Cao — A-CDM là nguồn monitoring overview |
| P1 | ICAO APAC — Nhóm CNS/Data Link (13 file) | 13 | Thủ công qua _links/icao-apac/download-helper.html | Cao — ACARS/AFTN tích hợp Phân hệ 5 |
| P2 | ICAO APAC — Nhóm MET (5 file) | 5 | Thủ công | Trung bình — Briefing + dispatch |
| P2 | ICAO APAC — Nhóm ATFM (7 file) | 7 | Thủ công | Trung bình — OSP/OTP monitoring |
| P3 | VATM AIM — AIC + eSUP còn lại | ~55 | Script `download-pdfs.ps1` hoặc thủ công | Thấp — tham chiếu quy định CAAV cục bộ |
| P3 | EUFALDA (9 file) | 9 | Script `download-pdfs.ps1` | Thấp — tham chiếu dispatcher EU |
| P4 | ICAO APAC — ATM/NOTAM, AGA (27 file còn lại) | 27 | Thủ công | Thấp — tham chiếu chung |

---

*Nguồn tổng hợp từ: INDEX.md · icao-apac-links.md · vatm-aim-pdf-links.md · iata-definitions-links.md · eufalda-pdf-links.md · ffac-pdf-links-toss-relevant.md — ngày 2026-06-15*
