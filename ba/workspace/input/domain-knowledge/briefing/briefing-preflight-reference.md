---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Domain Knowledge — Tham khảo: Briefing trước chuyến bay (Preflight/Weather Briefing)"
date: "2026-06-09"
status: "Reference (overview) — nguồn FAA; bản trích đầy đủ đã có (xem 2 file .md cùng thư mục)"
source_pdf:
  - "_pdf/faa-ac-91-92-pilots-guide-preflight-briefing.pdf (FAA AC 91-92)"
  - "_pdf/faa-h-8083-28-ch3-aviation-weather-information.pdf (FAA-H-8083-28, Ch.3)"
---

# Briefing (trước chuyến bay) — Tài liệu tham khảo

> **Phạm vi:** tổng hợp **mức overview** từ nguồn FAA (tham khảo — theo nguyên tắc nguồn FAA/ICAO chỉ gợi ý/giải thích). PDF gốc trong `_pdf/`; **bản trích text đầy đủ** đã có tại `faa-ac-91-92-...md` và `faa-h-8083-28-ch3-...md` (cùng thư mục) — đối chiếu khi cần căn cứ. Định nghĩa dưới đây đã được xác minh khớp AC 91-92 §7.2.1–7.2.3.

## 1. Briefing là gì
**Briefing** = việc **cung cấp/giải trình thông tin tóm tắt có cấu trúc** phục vụ chuẩn bị và thực hiện chuyến bay (chủ yếu là **thông tin khí tượng + NOTAM + tình trạng khai thác**), giúp người nhận (phi công, tổ bay, điều phái) đưa ra quyết định lập kế hoạch, thay đổi hoặc huỷ chuyến.
- Nguồn: FAA AC 91-92 *"Pilot's Guide to a Preflight Briefing"*; FAA-H-8083-28 Ch.3 *Aviation Weather Information*; AIM mục 7-1-5.

## 2. Ba loại Briefing khí tượng (FAA)
| Loại | Khi dùng | Nội dung |
|---|---|---|
| **Standard Briefing** (đầy đủ) | Lần briefing đầu cho chuyến bay; cần thông tin đầy đủ | Đủ các yếu tố ở §3 |
| **Abbreviated Briefing** (rút gọn) | **Bổ sung/cập nhật** một briefing trước đó, hoặc chỉ cần **một số mục cụ thể** | Chỉ phần được yêu cầu/cập nhật |
| **Outlook Briefing** (dự báo sớm) | Khi khởi hành **≥ 6 giờ** kể từ lúc briefing | Chỉ phục vụ **lập kế hoạch** (planning), không dùng để quyết định cuối |

## 3. Các yếu tố của Standard Briefing (thứ tự FAA)
1. **Adverse conditions** — điều kiện bất lợi (thời tiết/NOTAM có thể ảnh hưởng quyết định bay)
2. **VFR flight not recommended** — khuyến cáo không bay VFR (nếu áp dụng)
3. **Synopsis** — bức tranh khí tượng tổng quát
4. **Current conditions** — điều kiện hiện tại (METAR…)
5. **En route forecast** — dự báo dọc đường
6. **Destination forecast** — dự báo sân bay đến (TAF)
7. **Winds (and temperatures) aloft** — gió/nhiệt độ trên cao
8. **NOTAMs** — thông báo hàng không
9. **ATC delays** — chậm trễ do kiểm soát không lưu
*(Có thể yêu cầu thêm: tin tức quân sự MOA/MTR, thông tin biên giới…)*

## 4. Các dạng briefing khác trong khai thác (đã có trong KB)
- **Briefing kế hoạch bay / dispatch release** — điều phái (Dispatcher) tóm tắt thời tiết, lộ trình, nhiên liệu, NOTAM, hạn chế cho tổ bay (FAA Aircraft Dispatcher PTS; xem `aircraft_dispatcher_pts_10`).
- **Passenger briefing** — phổ biến an toàn cho hành khách (14 CFR §91.519).
- **Operational control briefing** — briefing điều hành khai thác cho cơ trưởng (14 CFR §91.1013).

## 5. Liên hệ TOSS
Trong phạm vi TOSS, *briefing* chủ yếu là **briefing kế hoạch bay/dispatch** do **điều phái** thực hiện cho tổ bay — gắn với màn giám sát tài liệu chuyến bay (OFP/OAP), thời tiết, NOTAM.

---
*Nguồn: FAA AC 91-92, FAA-H-8083-28 Ch.3, AIM 7-1-5, 14 CFR Part 91 — tham khảo overview. Self-briefing hiện đại (qua công cụ điện tử) cũng được FAA công nhận tương đương standard briefing nếu đủ yếu tố.*
