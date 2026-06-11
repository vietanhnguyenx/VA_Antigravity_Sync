---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-10"
status: "Draft"
document_type: "BRD — §2 Bối cảnh"
parent: "BRD-TOSS-001-v0.2.md §2"
source: "REF-02 §Tổng quan giải pháp"
---

# §2 — Bối cảnh & Vấn đề Nghiệp vụ

## 2.1 Bối cảnh dự án

VNA đang vận hành khai thác với dữ liệu phân tán trên nhiều hệ thống riêng biệt (Ops++, AVES, FSS, Crew Trip, MO+, AMOS, LIDO, eTechlog…). Việc thiếu một nền tảng tích hợp dẫn đến:
- OCC phải tra cứu thủ công từ nhiều màn hình để có đủ thông tin một chuyến bay
- Thời gian phát hiện sự cố/delay bị kéo dài
- Báo cáo vận hành (OTP, nhiên liệu) được tổng hợp thủ công — chậm và dễ sai sót
- Quyết định vận hành phụ thuộc vào kinh nghiệm cá nhân, không có dữ liệu real-time hỗ trợ

*[Nguồn: REF-02 — Tổng quan giải pháp]*

## 2.2 Vấn đề Hiện tại (Pain Points)

| Mã | Vấn đề | Mức độ | Cần xác nhận |
|---|---|---|---|
| PP-01 | Dữ liệu vận hành phân tán trên 10+ hệ thống — không có nguồn thống nhất | Cao | SH-04, SH-05 |
| PP-02 | Thiếu cảnh báo tự động — phát hiện bất thường phụ thuộc con người | Cao | SH-04 |
| PP-03 | Tài liệu chuyến bay (OFP, LS, GD…) chưa số hóa đồng bộ | Cao | SH-05 |
| PP-04 | Báo cáo OTP và nhiên liệu tổng hợp thủ công — không real-time | Trung bình | SH-06 |
| PP-05 | Quyết định Tankering (mang dầu bổ sung) dựa trên kinh nghiệm, không có phân tích dữ liệu | Trung bình | SH-05 |
| PP-06 | Không có audit trail tập trung cho quyết định vận hành | Thấp | SH-07 |
| PP-07 | Danh mục dịch vụ/sự cố sân bay quản lý **thủ công**, chưa có phần mềm, không trích xuất/tổng hợp được *(REF-08 §6 — họp 09/06/2026)* | Trung bình | SH-07, SH-08 |

## 2.3 Cơ hội Cải thiện

TOSS được định hướng là **nền tảng tích hợp** thay thế mô hình "tra cứu thủ công từ nhiều hệ thống" bằng mô hình "một nguồn sự thật duy nhất":

```
AS-IS (Hiện tại):                TO-BE (Với TOSS):
─────────────────                ──────────────────
Ops++ → OCC (thủ công)           TOSS hub tập trung
AVES  → OCC (thủ công)    →      ├─ Real-time alerts
LIDO  → Dispatcher                ├─ Tài liệu số hóa
AMOS  → OCC (thủ công)           ├─ Dashboard OTP
...   → tổng hợp tay              └─ Phân tích Tankering
```

*[Nguồn: REF-02 §Tổng quan giải pháp — Cơ hội]*
