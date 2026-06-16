---
source: "TOSS - Triển khai-YCKT.xlsx · sheet 12"
document_type: "YCKT decomposition — per sheet"
date: "2026-06-09"
---

# Sheet 12: Logic tính toán

> Nguồn: TOSS - Triển khai-YCKT.xlsx · sheet 12 · 5 dòng. Quay lại [INDEX](INDEX.md).

1. STT | Thông số | Logic
2. Actual Remaining Fuel | Ưu tiên lần lượt như sau:
- ACARS ON FUEL
- QAR ON FUEL
3. Standard OFP Remaining Fuel | Cont Fuel + Dest Alt Fuel + Final Reserve
4. Actual Trip Fuel | Ưu tiên lần lượt như sau:
- ACARS OFF FUEL - ACARS ON FUEL 
- QAR OFF FUEL - QAR ON FUEL
5. Techlog uplift FOB | Tích hợp từ AMOS (remaining after uplift)
Ý nghĩa: nhiên liệu có trên tàu bay sau khi uplift
