# SITA / Type B — Điện văn chuyển động tàu bay (Aircraft Movement Messaging)

> Bộ tài liệu công khai hợp lệ về định dạng điện văn MVT / MVA / DIV (và Type B nói chung), phục vụ làm rõ các điện văn SITA nhắc trong khảo sát tích hợp TOSS ↔ NetLine/OPS++ (báo cáo 19/06/2026: MVT, MVA, điện divert, LDM). Nguồn do chính nhà phát hành công bố miễn phí — KHÔNG dùng bản AHM trả phí phát tán trái phép.

| # | Tài liệu (Tiếng Việt — Nguyên gốc) | Nhà phát hành | Nguồn | Bản trích |
|---|---|---|---|---|
| 1 | Các loại điện chuyển động tàu bay MVT/MVA/DIV — phần tử dữ liệu & ví dụ — *MVT / MVA / DIV Aircraft Movement Messages: Data Elements and Message Examples* | OAG | [oag.com](https://www.oag.com/hubfs/Inbound-Services/OAG-MVT-MVA-DIV-Message-Types-and-Examples.pdf) | `_pdf/oag-mvt-mva-div-aircraft-movement-messages.pdf` · `oag-mvt-mva-div-aircraft-movement-messages.extracted.md` |
| 2 | Sách trắng Type B Messaging v2.1 (14/06/2024) — *Type B Messaging Whitepaper v2.1* | IATA (whitepaper công khai) | [iata.org](https://www.iata.org/contentassets/badbfd2d36a74f12b021c9dd899ecbad/type_b_messaging_whitepaper_v2dot1_14_june_2024.pdf) | `_pdf/iata-type-b-messaging-whitepaper-v2.1.pdf` · `iata-type-b-messaging-whitepaper-v2.1.extracted.md` |

**Bản chất nội dung (đối chiếu khảo sát 19/06):**
- **MVT** (Movement) và **MVA** (Movement Advice): điện chuyển động chuẩn — gồm điện Departure (định danh `AD`, off-block/airborne time), Arrival (`AA`, touchdown/on-block), Delay, với phần tử Bắt buộc/Có điều kiện/Tùy chọn (M/C/O), giờ theo UTC.
- **DIV** (Diversion): điện thông báo chuyển hướng/hạ cánh ngoài kế hoạch — đúng "điện divert" trong báo cáo 19/06.
- Cả hai tài liệu dẫn chiếu chuẩn **IATA AHM** (mã trễ chuyến theo AHM 730). Số chương AHM cụ thể (780-series) thuộc bản AHM trả phí, không có trong bộ công khai này.
- **LDM** (Load Distribution Message) KHÔNG nằm trong hai tài liệu này (thuộc nhóm điện tải, AHM 583) — còn là khoảng trống nếu cần.
