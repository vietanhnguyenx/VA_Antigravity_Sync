# Phân tích — Master Index

> Thư mục phân tích nghiệp vụ TOSS. Tổ chức theo 4 tầng đối chiếu:
> **01-nguon** → **02-khao-sat** → **03-yckt** → **04-quy-trinh**

---

## Cấu trúc tầng

| Tầng | Thư mục | Nội dung | Dùng để |
|---|---|---|---|
| 01 | [01-nguon/](01-nguon/INDEX.md) | Tài liệu gốc từ khách hàng (extracted MD) | Tra cứu câu chữ gốc, đối chiếu nguồn |
| 02 | [02-khao-sat/](02-khao-sat/INDEX.md) | Báo cáo khảo sát từ phỏng vấn | Yêu cầu nổi lên từ thực tế vận hành |
| 03 | [03-yckt/](03-yckt/INDEX.md) | Phân tích YCKT triển khai (từ Google Sheet) | Yêu cầu kỹ thuật chính thức |
| 04 | [04-quy-trinh/](04-quy-trinh/INDEX.md) | Quy trình nghiệp vụ + As-Is OCC | Hiểu luồng As-Is, đối chiếu SOP |

---

## Ma trận đối chiếu nhanh — Dispatcher / OCC

| Chủ đề | 01-nguon | 02-khao-sat | 03-yckt | 04-quy-trinh |
|---|---|---|---|---|
| OFP / Release | TOSS-v0.1 §4 · Function-list §DSP | 11/06 sáng | sheet-04 · sheet-05 | SOP §3.1 |
| NOTAM / Thời tiết | TOSS-v0.1 §4 | 11/06 sáng | sheet-05 | SOP §3.1 |
| Giám sát chuyến bay | TOSS-v0.1 §5 | 11/06 chiều · 12/06 sáng | sheet-05 | SOP §3.2 |
| MEL / CDL | TOSS-v0.1 §4 | 11/06 sáng | sheet-04 | — |
| NOTOC / Cargo | TOSS-v0.1 §6 · VNA-KTKTB-Buoi2 | (Webex NOTOC) | sheet-06 | — |
| Cost Index / Nhiên liệu | TOSS-v0.1 §4 | 11/06 sáng | sheet-05 | — |
| Tích hợp hệ thống | Aircraft_FIMS · Aircraft_Netline | 08/06 | sheet-06 | — |
| Phân quyền / Menu | Function-list | 09/06 | sheet-07 | — |
| Lập phương án đường bay | TOSS-v0.1 §4 · VNA-KTKTB-Buoi3 | — | sheet-05 | — |
| MEL authoring (kỹ thuật) | VNA-KTKTB-Buoi2 | — | — | — |
| W&B (cân bằng trọng tải) | VNA-KTKTB-Buoi2 | — | — | — |

---

## File khác

- [TIMELINE-INPUT-DOCS.md](TIMELINE-INPUT-DOCS.md) — Danh sách tài liệu đầu vào theo ngày + loại
- [README.md](README.md) — Mô tả thư mục phan-tich

---

_Cập nhật: 2026-06-16_
