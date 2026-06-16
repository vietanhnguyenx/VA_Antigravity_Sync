# INDEX — Bản trích nguồn khách hàng (raw extract)

> Bản trích **thô, trung thực** (CLAUDE.md §0) từ tài liệu trong `input/Customer_docs/`. Là tài liệu tra cứu: **Grep/đọc đúng mục cần, không nạp cả file** (rule đọc chọn lọc). Có thể lệch danh sách lồng/bảng header rỗng (`NaN`/`Unnamed` với xlsx) — dọn tay khi cần bản chính thức.

| File | Dòng | Nguồn / nội dung |
|---|---|---|
| `main-flight-dispatcher-operating-procedure.md` | 2433 | Quy trình Flight Dispatcher (docx, đầy đủ) — bản phân rã ở `../flight-dispatcher-procedure/` |
| `TOSS-Trien-khai-YCKT.extracted.md` | 937 | **LIVE** YCKT-VTIT (Google Sheet native, 13 tab) — refresh `gsheet-to-md.py` id `1DGIy…`; phân tích từng sheet ở `../yckt-trien-khai/` (bản tĩnh đã lệch) |
| `VNA-TOSS-Function-list-v1.0.extracted.md` | 231 | **LIVE** Danh sách chức năng TOSS (Drive xlsx, 3 tab: Tổng Quan/Function list/Màn hình Flight Dispatch) — refresh `gdrive-to-md.py` id `15icZM…` |
| `TOSS-Total-Operations-Steering-System-v0.1.extracted.md` | 877 | "TOSS - Total Operations Steering System v0.1" (xlsx) — giống YCKT (YCKT V3/MENU/FOS…) + tab **"giải thích thuật ngữ"** (nguồn glossary). ⚠ tên "Total Operations Steering System" — cần BA Lead xác nhận vs tên TOSS hiện hành |
| `Aircraft_Netline.extracted.md` | 697 | Master tàu bay nguồn Netline (39 cột) → PH4 |
| `BCAO_10Jun2025_11Jun2025-v2.extracted.md` | 434 | Báo cáo ngày khai thác 10–11/Jun (docx) |
| `Sizing-update-260609-4T.extracted.md` | 299 | Sizing hạ tầng (xlsx) → BR-516 |
| `Ke-hoach-khao-sat-TOSS.extracted.md` | 90 | **Kế hoạch khảo sát 4 tuần/20 ngày** (xlsx): module M1–M10, lịch theo ngày, mốc freeze Batch 1–3, đầu mối VNA, giả định A1–A6 |
| `tong-hop-dien-acars.extracted.md` | 202 | Tổng hợp điện ACARS cần phân tích (xlsx) |
| `Aircraft_FIMS.extracted.md` | 146 | Master tàu bay nguồn FIMS (21 cột) → PH4 |
| `VNA-KTKTB-Buoi2.extracted.md` | — | Khảo sát buổi 2 — Phòng Kỹ thuật khai thác bay: MEL authoring (Boeing FrameMaker+IXP, Airbus FODM), W&B tool |
| `VNA-KTKTB-Buoi3.extracted.md` | — | Khảo sát buổi 3 — Phòng Kỹ thuật khai thác bay: Lập phương án đường bay (LIDO), Thư viện khai thác (SkyOffice) |
| `toss-glossary-v0.4-confirm-khach-hang-2026-06-10.tsv` | — | Glossary v0.4 gửi khách hàng xác nhận (TSV) |
