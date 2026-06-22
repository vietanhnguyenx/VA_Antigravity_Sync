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

| File | Mô tả | Extracted (01-nguon) | Phân tích sâu | Trạng thái |
|---|---|---|---|---|
| `TOSS - Triển khai-YCKT.xlsx` | YCKT chính thức — 12 sheet (478 dòng YCKT V3, DSP, FOS, Tích hợp, Menu…) | [TOSS-Trien-khai-YCKT.extracted.md](../../drafts/phan-tich/01-nguon/TOSS-Trien-khai-YCKT.extracted.md) | [03-yckt/](../../drafts/phan-tich/03-yckt/INDEX.md) | 🔄 LIVE — refresh `gsheet-to-md.py` khi nguồn thay đổi |
| `TOSS - Total Operations Steering System_v0.1.xlsx` | YCKT v0.1 + tab "giải thích thuật ngữ" (nguồn glossary) | [TOSS-Total-Operations-Steering-System-v0.1.extracted.md](../../drafts/phan-tich/01-nguon/TOSS-Total-Operations-Steering-System-v0.1.extracted.md) | — | ✅ Đã extract — chưa phân tích riêng (dùng làm đối chiếu glossary) |
| `Kế hoạch khảo sát TOSS.xlsx` | Kế hoạch 4 tuần/20 ngày: M1–M10, lịch ngày, Batch 1–3, đầu mối VNA | [Ke-hoach-khao-sat-TOSS.extracted.md](../../drafts/phan-tich/01-nguon/Ke-hoach-khao-sat-TOSS.extracted.md) | — | ✅ Đã extract — PC dùng làm BASELINE tiến độ |
| `Sizing-update260609 - 4T.xlsx` | Định cỡ hạ tầng (09/06): 18TB data, 311 vCPU, 27 VM, K8s | [Sizing-update-260609-4T.extracted.md](../../drafts/phan-tich/01-nguon/Sizing-update-260609-4T.extracted.md) | → BR-516 | ✅ Đã extract — chưa phân tích sâu |
| `VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` | **Primary source** — Đề xuất giải pháp kỹ thuật TOSS v0.3 (VNA OCC): tổng quan giải pháp, 5 phân hệ nghiệp vụ, kiến trúc & công nghệ (13 chương), sizing | (PDF gốc — đã phân rã MD trong `domain-knowledge/vnaocc-proposal-decomposed/`) | [domain-knowledge/vnaocc-proposal-decomposed/](../domain-knowledge/vnaocc-proposal-decomposed/) | ✅ Đã phân rã — primary source cho BR/FUNC |

---

## B. Quy trình nghiệp vụ

| File | Mô tả | Extracted (01-nguon) | Phân tích sâu | Trạng thái |
|---|---|---|---|---|
| `Procedure/[MAIN] FLIGHT DISPATCHER OPERATING PROCEDURE.docx` | SOP điều phái viên §3.1–3.5 (end-to-end, ca trực, VIP, vùng trời không KS, nhận tàu bay) | [main-flight-dispatcher-operating-procedure.md](../../drafts/phan-tich/01-nguon/main-flight-dispatcher-operating-procedure.md) | [04-quy-trinh/](../../drafts/phan-tich/04-quy-trinh/INDEX.md) | ✅ Đã extract + phân rã As-Is Dispatch SOP |
| `meeting-notes/NOTOC_11262026/VNA-Kỹ thuật khai thác bay-Buổi 2.docx` | Khảo sát KTKTB: MEL authoring (FrameMaker+IXP/FODM), W&B tool | [VNA-KTKTB-Buoi2.extracted.md](../../drafts/phan-tich/01-nguon/VNA-KTKTB-Buoi2.extracted.md) | [BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md) | ✅ Đã extract + có báo cáo khảo sát |
| `meeting-notes/NOTOC_11262026/VNA-Kỹ thuật khai thác bay-Buổi 3.docx` | Khảo sát KTKTB: Lập phương án đường bay (LIDO), Thư viện khai thác (SkyOffice/MO) | [VNA-KTKTB-Buoi3.extracted.md](../../drafts/phan-tich/01-nguon/VNA-KTKTB-Buoi3.extracted.md) | [BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md) | ✅ Đã extract + có báo cáo khảo sát |

---

## C. Tàu bay & dữ liệu kỹ thuật

| File | Mô tả | Extracted (01-nguon) | Trạng thái |
|---|---|---|---|
| `Aircraft/Aircraft_FIMS.xlsx` | Master tàu bay nguồn FIMS — 21 cột (cấu hình khoang/ghế, MTOW, payload, tank, ICAO/model) | [Aircraft_FIMS.extracted.md](../../drafts/phan-tich/01-nguon/Aircraft_FIMS.extracted.md) | ✅ Đã extract — dùng cho PH4 data model |
| `Aircraft/Aircraft_Netline.xlsx` | Master tàu bay nguồn Netline — 39 cột (operator/owner, DOW, ILS/autoland, AP_restriction) | [Aircraft_Netline.extracted.md](../../drafts/phan-tich/01-nguon/Aircraft_Netline.extracted.md) | ✅ Đã extract — dùng cho PH4 data model |
| `Aircraft/ACARS/2. Tổng hợp các điện ACARS…xlsx` | Danh mục điện ACARS cần phân tích | [tong-hop-dien-acars.extracted.md](../../drafts/phan-tich/01-nguon/tong-hop-dien-acars.extracted.md) | ✅ Đã extract — chưa phân tích từng loại điện |
| `Aircraft/ACARS/in-2603xx.zip` (35 file) | Dữ liệu mẫu điện ACARS inbound (bulk — không extract) | — | ❌ Bulk data — không extract; dùng làm mẫu test khi cần |
| `Aircraft/ACARS/B787_GBST_CMF_…pdf` | Tài liệu kỹ thuật ACARS B787 | — | ⏳ Chưa phân tích — cần đọc khi xử lý tích hợp ACARS |
| `PEP5.16/` | Airbus PEP v5.16 + APD (A318–A321, A350) + Airport DB | — | ❌ Phần mềm — không extract; tham khảo khi phân tích W&B/route |

---

## D. Biên bản họp / Transcript phỏng vấn

| Thư mục | Nội dung | Báo cáo khảo sát (02-khao-sat) | Trạng thái |
|---|---|---|---|
| `meeting-notes/08062026/` | part1+2 transcript + MM-20260608 (tổng quan TOSS) | [BAO-CAO-KHAO-SAT-08062026-v0.2.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-08062026-v0.2.md) | ✅ Có báo cáo v0.2 — chưa xuất Word v mới |
| `meeting-notes/09062026/` | part1+2 transcript (cây menu, phân quyền, YCKT) | [BAO-CAO-KHAO-SAT-09062026-v0.3.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-09062026-v0.3.md) | ✅ Có báo cáo v0.3 — chưa xuất Word v mới |
| `meeting-notes/MM-20260609-thiet-ke-function-list-YCKT-TOSS.md` | Biên bản 09/06 — thiết kế function list | (gộp trong báo cáo 09/06) | ✅ Đã gộp vào báo cáo 09/06 |
| `meeting-notes/11062026/` | BuoiSang part1+2 + BuoiChieu (Dispatcher) | [11/06 sáng](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md) · [11/06 chiều](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md) | ✅ Có 2 báo cáo v0.1 — chưa xuất Word |
| `meeting-notes/NOTOC_11262026/` | Buổi 2+3 KTKTB (DOCX) + Webex NOTOC transcript | [BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md) | ✅ Có báo cáo v0.1 — chưa xuất Word; ⚠ tên thư mục nghi nhầm (nên là NOTOC_11062026) |
| `meeting-notes/12062026/` | Part1+2 fixed (Flight Detail, màn hình Giám sát) | [BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md) | ✅ Có báo cáo v0.1 — chưa xuất Word |
| `meeting-notes/15062026/` | TOSS-15-06-1/2/3 fixed (Flight Dispatch, OFP Release) | [BAO-CAO-KHAO-SAT-15062026-v0.1.md](../../drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-15062026-v0.1.md) | ✅ Có báo cáo v0.1 — chưa xuất Word |

---

## E. Biểu mẫu vận hành

| File | Mô tả | Extracted (01-nguon) | Trạng thái |
|---|---|---|---|
| `Form/BCAO_10Jun2025_11Jun2025-v2.docx` | Mẫu Báo cáo điều hành ngày khai thác (BCAO) — 2 phần (thực hiện hôm trước + kế hoạch hôm nay) | [BCAO_10Jun2025_11Jun2025-v2.extracted.md](../../drafts/phan-tich/01-nguon/BCAO_10Jun2025_11Jun2025-v2.extracted.md) | ✅ Đã extract — chưa phân tích cấu trúc biểu mẫu |
| `Form/DIVERSION REPORT-HVN678-KULSGN-11JUN2026.docx` | Báo cáo chệch hướng HVN678 KUL→SGN 11/06/2026 (thunderstorm; TAF/METAR/crew decision) | [DIVERSION_REPORT-HVN678-KULSGN-11JUN2026.extracted.md](../../drafts/phan-tich/01-nguon/DIVERSION_REPORT-HVN678-KULSGN-11JUN2026.extracted.md) | ✅ Đã extract — chưa phân tích nghiệp vụ Diversion |
| `Form/DIVERSION REPORT-HVN678-KULSGN-11JUN2026 - comments.docx` | Bản có bình luận của báo cáo chệch hướng HVN678 | [DIVERSION_REPORT-HVN678-KULSGN-11JUN2026_-_comments.extracted.md](../../drafts/phan-tich/01-nguon/DIVERSION_REPORT-HVN678-KULSGN-11JUN2026_-_comments.extracted.md) | ✅ Đã extract — dùng để đối chiếu bình luận reviewer |

---

## F. Thư mục chờ / Chưa xử lý

| Thư mục/File | Trạng thái |
|---|---|
| `A-CDM/` | Thư mục rỗng — chờ VNA cung cấp tài liệu A-CDM |

---

## G. Sơ đồ kiến trúc / Minh họa khách hàng

| File | Mô tả | Phân tích sâu | Trạng thái |
|---|---|---|---|
| `Ops++/Sơ đồ tích hợp Ops++.png` | Sơ đồ kiến trúc tích hợp Inbound/Outbound của OPS++ (ISB làm gateway) — bản ảnh do khách hàng cung cấp | [Ops++-integration-architecture.drawio](../../drafts/phan-tich/04-quy-trinh/Ops++-integration-architecture.drawio) — đã chuyển sang drawio editable | ✅ Đã chuyển sang drawio; ⚠ Một số nhãn mũi tên khó đọc gắn `[?]` — cần đối chiếu bản gốc/SME |

---

_Cập nhật: 2026-06-16 · Xem [TIMELINE-INPUT-DOCS.md](../../drafts/phan-tich/TIMELINE-INPUT-DOCS.md) để biết lịch nhận tài liệu theo ngày_
