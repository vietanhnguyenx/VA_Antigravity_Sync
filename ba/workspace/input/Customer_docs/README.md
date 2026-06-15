---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Index — ba/workspace/input/Customer_docs"
status: "Active"
date: "2026-06-12"
---

# Customer_docs/ — Tài liệu nguồn do Khách hàng (VNA) cung cấp

## Mục đích
Lưu **tài liệu gốc chỉ-đọc** do Vietnam Airlines (VNA) cung cấp phục vụ khảo sát & phân tích TOSS: yêu cầu kỹ thuật, quy trình nghiệp vụ, dữ liệu mẫu (master tàu bay, điện ACARS, performance database), biên bản họp/phỏng vấn.

> **Chỉ-đọc (CLAUDE.md §0/§8):** KHÔNG chỉnh sửa nội dung tài liệu nguồn. Mọi phân tích/diễn giải đưa vào `../../drafts/phan-tich/`, dẫn nguồn rõ ràng.

## File tại thư mục gốc

| File | Mô tả | Phân tích liên quan trong TOSS |
|---|---|---|
| `TOSS - Triển khai-YCKT.xlsx` | **Yêu cầu kỹ thuật (YCKT)** của khách hàng — 12 sheet (YCKT V3 478 dòng, FOS, Tích hợp, Cảnh báo/Tham số, Logic tính toán, Aircraft, Menu, DSP…). Nguồn yêu cầu chi tiết nhất. | `drafts/phan-tich/yckt-trien-khai/` (đã phân rã 12 sheet) → BRD/FUNC |
| `[MAIN] FLIGHT DISPATCHER OPERATING PROCEDURE.docx` | **Quy trình tác nghiệp điều phái viend (FDOP)** §3.1–3.5 (end-to-end, vai trò ca trực, VIP, vùng trời không kiểm soát, nhận tàu bay). | `drafts/phan-tich/flight-dispatcher-procedure/` |
| `BCAO_10Jun2025_11Jun2025-v2.docx` | **Mẫu Báo cáo điều hành ngày khai thác (BCAO)** — cấu trúc 2 phần (thực hiện hôm trước + kế hoạch hôm nay). | Phân hệ 3 (báo cáo); glossary (APU/PACK, AOG…) |
| `Aircraft_FIMS.xlsx` | **Master tàu bay — nguồn FIMS** (cấu hình khoang/ghế, MTOW, payload, tank, ICAO/model…). | `drafts/phan-tich/aircraft-source/Aircraft_FIMS.extracted.md` → PH4 |
| `Aircraft_Netline.xlsx` | **Master tàu bay — nguồn Netline** (operator/owner, hiệu lực lịch sử, DOW, thiết bị ILS/autoland, AP_restriction…). | `drafts/phan-tich/aircraft-source/Aircraft_Netline.extracted.md` → PH4 |
| `Sizing-update260609 - 4T.xlsx` | **Định cỡ hạ tầng TOSS** (bản 09/06/2026) — 18TB data, 311 vCPU/964GB RAM/43.6TB, 27 VM, K8s + HAProxy, Cloud Firewall/Backup/Hybrid Connect, tái sử dụng giám sát MO Plus. *("4T" `[cần xác nhận]`)*. | `drafts/phan-tich/customer-docs-source/Sizing-update-260609-4T.extracted.md` → BR-516 (PH5) |

> **Đã gỡ (sai domain):** `Quy trình sửa chữa tàu.docx` — là quy trình sửa chữa **tàu thủy/đóng tàu** (lên đà/triền, khảo sát dưới nước, 12 phân xưởng), KHÔNG phải tàu bay → đã xóa khỏi repo 12/06/2026.

## Thư mục con

| Thư mục | Nội dung | README |
|---|---|---|
| `meeting-notes/` | Biên bản họp & ghi chú phỏng vấn stakeholder (08/06, 09/06, 11/06…). | [meeting-notes/README.md](meeting-notes/README.md) |
| `ACARS/` | Dữ liệu mẫu điện ACARS inbound (file nén theo ngày). | [ACARS/README.md](ACARS/README.md) |
| `PEP5.16/` | Bộ Airbus PEP (Performance Engineer's Program) v5.16 + Aircraft Performance Databases (APD) + Airport Database. | [PEP5.16/README.md](PEP5.16/README.md) |

## Ghi chú
- File nào chưa được phân rã/phân tích sẽ ghi "*(chưa phân tích)*" — cập nhật khi đã xử lý.
- Tài liệu sai domain (vd của dự án khác) **không lưu ở đây**; nếu phát hiện lọt nhầm → loại bỏ (vd BBKS/BBLV của UBCKNN đã được gỡ 12/06/2026).
