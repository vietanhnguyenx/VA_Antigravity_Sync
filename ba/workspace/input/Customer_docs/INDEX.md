---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Index — Customer_docs (tra nhanh)"
status: "Active"
date: "2026-06-16"
---

# Customer_docs — Index tra nhanh

> Tài liệu nguồn **chỉ-đọc** do VNA cung cấp. Mọi phân tích đưa vào `drafts/phan-tich/` (dẫn nguồn rõ). Xem [README.md](README.md) để biết mục đích từng thư mục.

---

## A. Yêu cầu kỹ thuật & kế hoạch

| File | Mô tả | Extracted (01-nguon) | Phân tích sâu |
|---|---|---|---|
| `TOSS - Triển khai-YCKT.xlsx` | YCKT chính thức — 12 sheet (478 dòng YCKT V3, DSP, FOS, Tích hợp, Menu…) | [TOSS-Trien-khai-YCKT.extracted.md](../../drafts/phan-tich/01-nguon/TOSS-Trien-khai-YCKT.extracted.md) — **LIVE** (refresh `gsheet-to-md.py`) | [03-yckt/](../../drafts/phan-tich/03-yckt/INDEX.md) |
| `TOSS - Total Operations Steering System_v0.1.xlsx` | YCKT v0.1 + tab "giải thích thuật ngữ" (nguồn glossary) | [TOSS-Total-Operations-Steering-System-v0.1.extracted.md](../../drafts/phan-tich/01-nguon/TOSS-Total-Operations-Steering-System-v0.1.extracted.md) | — |
| `Kế hoạch khảo sát TOSS.xlsx` | Kế hoạch 4 tuần/20 ngày: M1–M10, lịch ngày, Batch 1–3, đầu mối VNA | [Ke-hoach-khao-sat-TOSS.extracted.md](../../drafts/phan-tich/01-nguon/Ke-hoach-khao-sat-TOSS.extracted.md) | — |
| `Sizing-update260609 - 4T.xlsx` | Định cỡ hạ tầng (09/06): 18TB data, 311 vCPU, 27 VM, K8s | [Sizing-update-260609-4T.extracted.md](../../drafts/phan-tich/01-nguon/Sizing-update-260609-4T.extracted.md) | → BR-516 |

---

## B. Quy trình nghiệp vụ

| File | Mô tả | Extracted (01-nguon) | Phân tích sâu |
|---|---|---|---|
| `Procedure/[MAIN] FLIGHT DISPATCHER OPERATING PROCEDURE.docx` | SOP điều phái viên §3.1–3.5 (end-to-end, ca trực, VIP, vùng trời không KS, nhận tàu bay) | [main-flight-dispatcher-operating-procedure.md](../../drafts/phan-tich/01-nguon/main-flight-dispatcher-operating-procedure.md) | [04-quy-trinh/](../../drafts/phan-tich/04-quy-trinh/INDEX.md) |
| `meeting-notes/NOTOC_11262026/VNA-Kỹ thuật khai thác bay-Buổi 2.docx` | Khảo sát KTKTB: MEL authoring (FrameMaker+IXP/FODM), W&B tool | [VNA-KTKTB-Buoi2.extracted.md](../../drafts/phan-tich/01-nguon/VNA-KTKTB-Buoi2.extracted.md) | [BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md) |
| `meeting-notes/NOTOC_11262026/VNA-Kỹ thuật khai thác bay-Buổi 3.docx` | Khảo sát KTKTB: Lập phương án đường bay (LIDO), Thư viện khai thác (SkyOffice/MO) | [VNA-KTKTB-Buoi3.extracted.md](../../drafts/phan-tich/01-nguon/VNA-KTKTB-Buoi3.extracted.md) | [BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md) |

---

## C. Tàu bay & dữ liệu kỹ thuật

| File | Mô tả | Extracted (01-nguon) |
|---|---|---|
| `Aircraft/Aircraft_FIMS.xlsx` | Master tàu bay nguồn FIMS — 21 cột (cấu hình khoang/ghế, MTOW, payload, tank, ICAO/model) | [Aircraft_FIMS.extracted.md](../../drafts/phan-tich/01-nguon/Aircraft_FIMS.extracted.md) |
| `Aircraft/Aircraft_Netline.xlsx` | Master tàu bay nguồn Netline — 39 cột (operator/owner, DOW, ILS/autoland, AP_restriction) | [Aircraft_Netline.extracted.md](../../drafts/phan-tich/01-nguon/Aircraft_Netline.extracted.md) |
| `Aircraft/ACARS/2. Tổng hợp các điện ACARS…xlsx` | Danh mục điện ACARS cần phân tích | [tong-hop-dien-acars.extracted.md](../../drafts/phan-tich/01-nguon/tong-hop-dien-acars.extracted.md) |
| `Aircraft/ACARS/in-2603xx.zip` (35 file) | Dữ liệu mẫu điện ACARS inbound (bulk — không extract) | — |
| `Aircraft/ACARS/B787_GBST_CMF_…pdf` | Tài liệu kỹ thuật ACARS B787 | — (chưa phân tích) |
| `PEP5.16/` | Airbus PEP v5.16 + APD (A318–A321, A350) + Airport DB | — (phần mềm, không extract) |

---

## D. Biên bản họp / Transcript phỏng vấn

| Thư mục | Nội dung | Báo cáo khảo sát (02-khao-sat) |
|---|---|---|
| `meeting-notes/08062026/` | part1+2 transcript + MM-20260608 (tổng quan TOSS) | [BAO-CAO-KHAO-SAT-08062026-v0.2.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.2.md) |
| `meeting-notes/09062026/` | part1+2 transcript (cây menu, phân quyền, YCKT) | [BAO-CAO-KHAO-SAT-09062026-v0.3.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.3.md) |
| `meeting-notes/MM-20260609-thiet-ke-function-list-YCKT-TOSS.md` | Biên bản 09/06 — thiết kế function list | (gộp trong báo cáo 09/06) |
| `meeting-notes/11062026/` | BuoiSang part1+2 + BuoiChieu (Dispatcher) | [11/06 sáng](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md) · [11/06 chiều](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md) |
| `meeting-notes/NOTOC_11262026/` | Buổi 2+3 KTKTB (DOCX) + Webex NOTOC transcript | [BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md) |
| `meeting-notes/12062026/` | Part1+2 fixed (Flight Detail, màn hình Giám sát) | [BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md) |
| `meeting-notes/15062026/` | TOSS-15-06-1/2/3 fixed (Flight Dispatch, OFP Release) | [BAO-CAO-KHAO-SAT-15062026-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-15062026-v0.1.md) |

---

## E. Biểu mẫu vận hành

| File | Mô tả | Extracted (01-nguon) |
|---|---|---|
| `Form/BCAO_10Jun2025_11Jun2025-v2.docx` | Mẫu Báo cáo điều hành ngày khai thác (BCAO) — 2 phần (thực hiện hôm trước + kế hoạch hôm nay) | [BCAO_10Jun2025_11Jun2025-v2.extracted.md](../../drafts/phan-tich/01-nguon/BCAO_10Jun2025_11Jun2025-v2.extracted.md) |
| `Form/DIVERSION REPORT-HVN678-KULSGN-11JUN2026.docx` | Báo cáo chệch hướng HVN678 KUL→SGN 11/06/2026 (thunderstorm; TAF/METAR/crew decision) | [DIVERSION_REPORT-HVN678-KULSGN-11JUN2026.extracted.md](../../drafts/phan-tich/01-nguon/DIVERSION_REPORT-HVN678-KULSGN-11JUN2026.extracted.md) |
| `Form/DIVERSION REPORT-HVN678-KULSGN-11JUN2026 - comments.docx` | Bản có bình luận của báo cáo chệch hướng HVN678 | [DIVERSION_REPORT-HVN678-KULSGN-11JUN2026_-_comments.extracted.md](../../drafts/phan-tich/01-nguon/DIVERSION_REPORT-HVN678-KULSGN-11JUN2026_-_comments.extracted.md) |

---

## F. Thư mục chờ / Chưa xử lý

| Thư mục/File | Trạng thái |
|---|---|
| `A-CDM/` | Thư mục rỗng — chờ VNA cung cấp tài liệu A-CDM |

---

_Cập nhật: 2026-06-16 · Xem [TIMELINE-INPUT-DOCS.md](../../drafts/phan-tich/TIMELINE-INPUT-DOCS.md) để biết lịch nhận tài liệu theo ngày_
