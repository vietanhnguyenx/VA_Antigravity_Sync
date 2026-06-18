---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
source: "ba/workspace/input/Customer_docs/Aircraft/ACARS/in-260301.zip … in-260331.zip"
author: "agent (khảo sát kỹ thuật)"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Source Analysis"
---

# Phân tích dữ liệu ACARS — Điện thu tháng 03/2026

> **Phạm vi:** 31 file ZIP `in-260301.zip` → `in-260331.zip` tại
> `ba/workspace/input/Customer_docs/Aircraft/ACARS/`
>
> **Mục đích:** Khảo sát định dạng, khối lượng, và các loại thông tin có trong
> kho ACARS để hỗ trợ đặc tả tích hợp (PH5 BR-528c/530c) và yêu cầu giám sát
> chuyến bay (PH1) + báo cáo tối ưu (PH3).

---

## 1. Tổng quan khối lượng

| Chỉ số | Giá trị |
|---|---|
| **Khoảng thời gian** | 01/03/2026 → 31/03/2026 (31 ngày) |
| **Tổng số file ZIP** | 31 (1 file/ngày) |
| **Tổng số điện (messages)** | 757.474 |
| **Trung bình/ngày** | ~24.435 điện |
| **Ngày cao nhất** | 04/03 — 35.148 điện |
| **Ngày thấp nhất** | 03/03 — 16.330 điện |
| **Dung lượng mỗi ZIP** | 8–17 MB (nén) |
| **Kích thước file điện** | 101 b – 3.500+ b |

Cấu trúc trong ZIP: `data01/backup/in-260301/*.RCV`
Tên file: `in-DDMMYYYY-HHMMSS-SEQNO.RCV` (dấu thời gian UTC)

---

## 2. Định dạng điện — ARINC 618

Mỗi file `.RCV` là một điện ACARS gửi xuống (downlink) từ tàu bay đến VNA Hà Nội.
Cấu trúc 6 dòng đầu chuẩn:

```
QU HANOCVN                         ← Dòng 1: địa chỉ đích (Hanoi OCC VNA)
.BKKXCXA 010741                    ← Dòng 2: trạm mặt đất + giờ nhận (UTC)
A80                                ← Dòng 3: nhãn điện (message label)
FI VN7405/AN VN-A514               ← Dòng 4: số hiệu chuyến / đăng ký tàu
DT BKK VDH 010741 M37A             ← Dòng 5: xuất phát / điểm đến / giờ / loại
-  <nội dung điện>                 ← Dòng 6+: dữ liệu
```

**Lưu ý kỹ thuật:** Nhãn điện (dòng 3) được đóng khung bằng ký tự điều khiển
STX (0x02) theo ARINC 618 — cần strip khi xử lý so sánh chuỗi.

**Địa chỉ trạm mặt đất (dòng 2):**
- `.QXSXMXS` = Singapore SITA (chiếm đa số)
- `.BKKXCXA` = Bangkok SITA
- `.BJSXCXA` = Beijing SITA
- `.DDLXCXA` = Seoul/Düsseldorf SITA

---

## 3. Các loại điện (message labels) — phân tích mẫu ngày 01/03/2026

Tổng ngày 01/03: **25.246 điện**

| Label | Số lượng | % | Loại điện | Nội dung chính |
|---|---|---|---|---|
| **DFD** | 5.366 | 21,3% | Digital Flight Data | Dữ liệu hiệu suất bay per waypoint (QAR downlink) |
| **A80** | 4.705 | 18,6% | Position Report (low-alt) | Báo vị trí vùng sân bay: lat/lon/alt/Mach/FOB |
| **MED** | 3.483 | 13,8% | Short encoded msg | Điện ngắn có mã hóa (101 b) |
| **SMA** | 3.052 | 12,1% | SATCOM Message | Điện mã hóa qua SATCOM — không parse được dạng thô |
| **REJ** | 2.158 | 8,6% | Rejected frame | Khung bị từ chối / lỗi truyền — không có nội dung |
| **CFD** | 1.453 | 5,8% | CAS Fault Data | Mã lỗi hệ thống avionics (maintenance codes) |
| **M16** | 941 | 3,7% | Position Report | Báo vị trí en-route: lat/lon/alt/wind/speed/Mach/fuel |
| **PAR** | 908 | 3,6% | ADS Position | Báo ADS-B/ADS-C ngắn |
| **M49** | 644 | 2,6% | Data msg | Dữ liệu mã hóa (position/state) |
| **ATC** | 508 | 2,0% | ATC Datalink | Điện CPDLC (Controller-Pilot Datalink Communication) |
| **TT6 + TT5** | 613 | 2,4% | Health/Sensor | Dữ liệu sức khỏe tàu bay mã hóa (QAR/HUMS) |
| **RAI** | 302 | 1,2% | Route/approach | Thông tin tiếp cận / route |
| **FML** | 196 | 0,8% | Fuel Management Log | Nhật ký quản lý nhiên liệu: sân bay, lượng fuel, giờ |
| **AFD** | 150 | 0,6% | Another Flight Data | — |
| **DEP** | 129 | 0,5% | Departure (OOOI) | Sự kiện cất cánh: DEP airport / DEP time / FOB |
| **ARR** | 118 | 0,5% | Arrival (OOOI) | Sự kiện hạ cánh và vào block: ARR airport / ARR time / FOB |
| **FM3** | 99 | 0,4% | Fuel metric | — |
| **ENG** | 77 | 0,3% | Engine monitoring | Thông số động cơ real-time: N1/N2/EGT/fuel flow/vibration |
| **M12** | 53 | 0,2% | Position/data | — |
| Khác | ~290 | ~1% | Nhiều loại khác | — |

---

## 4. Chi tiết từng loại điện quan trọng

### 4.1 DEP — Departure (OOOI: Off)

```
FI VN0000/AN VN-A609/DA VDSA/DS VVTS/OT 1452/FB   10/BF
DT QXS SGN1 011431 M25A
-  [body trống — thông tin nằm trong FI]
```

**Trường FI:** `FI <số hiệu>/<đăng ký>/DA <sân bay đi>/DS <sân bay đến>/OT <giờ lăn bánh>/FB <fuel block>/BF`
- `DA` = Departure Airport (ICAO)
- `DS` = Destination Airport
- `OT` = Off Time (bánh rời mặt đất)
- `FB` = Fuel at Block (xuất phát)
- `BF` = Beginning of Flight marker

**TOSS relevance:** OOOI event → cập nhật trạng thái chuyến bay (PH1)

---

### 4.2 ARR — Arrival (OOOI: In)

```
FI VN0608/AN VN-A324/DA VTBS/DS VVTS/IN 1613/FB    5/LA  /LR
DT QXS SGN1 011613 M65A
-  [body trống]
```

**Trường FI:** `/IN <giờ vào block> / FB <fuel còn> / LA <landing time> / LR <landing runway>`
- `IN` = In Time (vào block)
- `LA` = ?Landing Actual
- `LR` = ?Landing Runway

**TOSS relevance:** OOOI → đóng chuyến bay, cập nhật OTP/OSP (PH1, PH3)

---

### 4.3 A80 — Position Report (sân bay / độ cao thấp)

```
FI VN7405/AN VN-A514
DT BKK VDH 010741 M37A
-  3N01 POSRPT 7405/   VVDH/VVTS VN-A514
/POS N17307E106358/ALT 002/MCH 023/FOB 0140
```

**Nội dung:**
- `/POS N17307E106358` = Vị trí: 17°30.7'N / 106°35.8'E
- `/ALT 002` = Độ cao ~200 ft (vùng sân bay)
- `/MCH 023` = Mach 0.23 (tốc độ thấp, đang cất cánh/hạ cánh)
- `/FOB 0140` = Fuel On Board 140 (đơn vị chưa xác nhận — kg hoặc x100 lb)

**TOSS relevance:** Bổ sung M16 để theo dõi quỹ đạo đầy đủ cả hai pha bay (PH1)

---

### 4.4 M16 — Position Report (en-route)

```
FI VN417/AN VN-A874
DT BJS WUX 010343 M54A
-  POS02    HVN417/01010343RKSIVVNB
N29283E119086,34100,034332,-119,-091,107,422,0605,+36,298,0.855,-41,19.5
```

**Trường CSV:** `lat, alt(ft), time(HHMMSS), wind_dir, wind_spd, TAS(kt), GS(kt), fuel_flow, OAT(°C), IAS, Mach, fuel_remaining, fuel_burn`

| Trường | Giá trị mẫu | Ý nghĩa |
|---|---|---|
| Lat/Lon | N29283 E119086 | 29°28.3'N / 119°08.6'E |
| Altitude | 34.100 ft | Độ cao bay |
| Giờ (UTC) | 034332 | 03:43:32 |
| Wind | -119 / -091 | Gió theo trục? |
| TAS | 107 kt? | Tốc độ thực (hoặc 107×4=428 kt) |
| GS | 422 kt | Ground speed |
| Fuel flow | 0605 | Lưu lượng nhiên liệu |
| OAT | +36°C? | Nhiệt độ ngoại khí |
| Mach | 0.855 | Số Mach |
| Fuel remaining | -41 (?) | Nhiên liệu còn lại |
| Fuel burn | 19.5 | Tiêu hao nhiên liệu |

**TOSS relevance:** Theo dõi chuyến bay real-time; fuel monitoring; tính PF (PH1, PH3)

---

### 4.5 ENG — Engine Monitoring

```
FI VN0385/AN VN-A864  [DT QXJ NGO8 = Nagoya station]
-  RPT09;PG1;REAL;SW030M2G
2  235;235;235;235;0;0       ← engine params row 2
3  653;653;653;653;0;0       ← engine params row 3
4  0.50;0.37;0.41;0.41;0;0  ← (likely fuel flow per engine)
5  0;0;0;0                  ← vibrations?
7  0.00;0.00;0.00;0.00
8  282;281;283;281            ← EGT (°C) per engine
9  280;282;283;283
17 NORMAL;NORMAL;NORMAL;NORMAL  ← engine status
18 ;01;MAR;26;08:13:17          ← date/time
```

**TOSS relevance:** Giám sát sức khỏe động cơ; dữ liệu dầu; đầu vào cho báo cáo kỹ thuật (PH3)

---

### 4.6 CFD — CAS Fault Data (Maintenance)

```
FI VN0000/AN VN-A397
-  SMD
        CSAS/IGGS   7/13
 TROUBLE SHOOTING DATA
DATE   UTC
MAR01  1050
1451 1501 2019 2102 221A
2313 2407 6001 A708 A568
...
```

**Nội dung:** Mã lỗi avionics dạng hex (Crew Alerting System / IGGS — Integrated Guidance system).
`7/13` = 7 trong tổng 13 cảnh báo?

**TOSS relevance:** Đầu vào cho bộ phận kỹ thuật — theo dõi defect tàu bay; cần tích hợp với AMOS (PH5)

---

### 4.7 FML — Fuel Management Log

```
FI VN0220/AN VN-A869
-  PRG/TS140751,010326/DTVVNB,11L,260,152757,120/FNHVN2202895
```

**Decode sơ bộ:**
- `PRG/TS140751` = Program / Timestamp 14:07:51
- `010326` = 01/03/2026
- `DTVVNB` = Date Time Noi Bai
- `11L, 260, 152757, 120` = fuel record fields
- `FNHVN2202895` = Flight number HVN 2202895 (internal Hệ thống quản lý chuyến bay)

**TOSS relevance:** Dữ liệu nhiên liệu thực tế; đối chiếu với kế hoạch (PH3 báo cáo tối ưu)

---

### 4.8 ATC — ATC Datalink (CPDLC)

```
FI VN773/AN VN-A896
DT BKK MYY 011614 J31A
-  CC1VN-A89660010390491003D0
```

`CC1` = loại tin CPDLC; `VN-A896` = đăng ký; tiếp theo là mã nội dung clearance (hex).

**TOSS relevance:** Lưu trữ lịch sử CPDLC cho flight ops audit trail (PH1)

---

### 4.9 DFD — Digital Flight Data (2 biến thể)

**Biến thể 1 — dữ liệu hiệu suất chi tiết (phiên trước đã phân tích):**
```
FI VN1559/AN VN-A868
-  <391>IEG
9 010326054726POVN-A868 VVNBVVCRHVN1559
[ma trận dữ liệu tốc độ/độ cao/nhiên liệu per waypoint]
```

**Biến thể 2 — dữ liệu QAR tổng hợp (mẫu mới):**
```
FI VN0571/AN VN-A323  [A321]
-  A321,019822,2,2,TB000000/20/Q401,.../Q507,.../Q601,.../Q700,...
```
Format Q-series: Q4/Q5/Q6/Q7/Q8 = nhóm dữ liệu từ QAR (Quick Access Recorder):
engine performance / landing data / turbulence / fuel efficiency.

**TOSS relevance:** Tính PF (Performance Factor) cho báo cáo PH3; đối chiếu với kế hoạch LIDO

---

## 5. Đội tàu bay xuất hiện trong dữ liệu

Ngày 01/03/2026: **~80 đăng ký tàu bay riêng biệt** (từ ~343 mục FI kể cả route suffix).
**681 số hiệu chuyến bay** trong ngày, bao gồm cả VN và K6 (Jestar Pacific).

| Nhóm | Đăng ký | Loại tàu (ước tính) | Tuyến |
|---|---|---|---|
| A32x | VN-A323…A339 | Airbus A320 family | Nội địa, ngắn |
| A35x | VN-A353…A363 | Airbus A350 | Long-haul |
| A39x | VN-A390…A399 | Airbus A380 | Ultra long-haul |
| A5xx | VN-A501…A515 | ATR72 (?) | Regional |
| A6xx | VN-A601…A625 | ATR72 hoặc A220 | Regional/domestic |
| A86x–A89x | VN-A861…A899 | Boeing 787 (Dreamliner) | Medium/long-haul |
| XU- | XU-350 | Cambodian reg. (wet lease?) | — |

Tuyến xuất hiện: VVTS / VVNB / VVDN / VTBS (BKK) / RJBB (Osaka) / RKSI (Seoul) /
YSSY (Sydney) / YMML (Melbourne) / LFPG (Paris) / EDDF (Frankfurt) / KSFO (San Francisco)

---

## 6. Liên hệ với yêu cầu TOSS (traceability)

| Loại điện | Liên quan BRD | Ghi chú tích hợp |
|---|---|---|
| DEP / ARR | PH1 BR-1xx (OOOI), PH3 BR-330 (OTP/OSP) | Dữ liệu thực tế đầu vào cho OTP; tự động trigger đóng/mở chuyến |
| A80 / M16 / M49 / PAR | PH1 BR-1xx (giám sát real-time) | Chuỗi vị trí liên tục — refresh ~10 phút/điện |
| DFD (biến thể IEG) | PH3 BR-3xx (PF báo cáo), PH5 BR-528c | Dữ liệu PF thực tế per waypoint — tính PF phải qua parser ARINC 618 |
| DFD (biến thể Q-series) | PH3 (QAR analytics) | Cần thêm hệ thống decode Q-param |
| ENG | PH3 (engine health), PH5 AMOS integration | Đầu vào cho AMOS — cần mapping fault code |
| CFD | PH3 (tech ops), PH5 AMOS integration | Fault codes cần bảng tra (CSAS/IGGS fault library) |
| FML | PH3 BR-3xx (fuel report) | Đối chiếu kế hoạch LIDO vs thực tế |
| ATC | PH1 BR-1xx (ATC clearances tracking) | Lưu CPDLC audit trail; cần ARINC 623 decoder |
| SMA / MED | PH5 (raw storage) | Lưu raw — không parse; SMA = SATCOM encrypted |
| REJ | PH5 (error log) | Log lỗi truyền; báo cáo tỷ lệ lỗi |

---

## 7. Khuyến nghị cho đặc tả PH5 (tích hợp ACARS)

1. **Volume:** ~25.000 điện/ngày (peak 35.000). Hệ thống tiếp nhận phải xử lý burst rate
   và queue không mất điện.
2. **Format:** ARINC 618 framing (STX/ETX control chars). Cần parser strip control chars
   trước khi phân loại label.
3. **Ưu tiên parse:** DEP/ARR (OOOI) → trigger ngay vào flight state; M16/A80 (POS) →
   real-time map; DFD-IEG (PF) → batch vào báo cáo ca; ENG/CFD (maintenance) → forward
   sang AMOS.
4. **SMA / MED:** Lưu raw không parse — đây là điện SATCOM/encrypted không phải ACARS text.
5. **REJ (8,6%):** Dự phòng retry logic; không forward vào business layer.
6. **Routing đề xuất:**
   - DEP/ARR → PH1 Flight State Engine
   - M16/A80/M49/PAR → PH1 Position Tracker
   - DFD (IEG) → PH3 PF Calculator
   - ENG/CFD/FML → PH5 → AMOS interface
   - ATC → PH1 Clearance Log
   - SMA/MED/REJ/TT5/TT6 → Raw Archive (cold storage)

---

## 8. Điểm cần xác nhận với SME VNA (gắn cờ)

| # | Nội dung cần xác nhận | Loại điện liên quan |
|---|---|---|
| ACARS-01 | Đơn vị `/FOB` trong A80 là kg hay lb hay 100kg? | A80 |
| ACARS-02 | Q-series DFD (Q4/Q5/Q6/Q7/Q8) decode spec — tài liệu nào? | DFD Q-series |
| ACARS-03 | Fault code library cho CFD (CSAS/IGGS) — ai cung cấp (Airbus/Boeing)? | CFD |
| ACARS-04 | SMA = SATCOM message — nội dung là gì? Có cần lưu và giải mã không? | SMA |
| ACARS-05 | DEP/ARR message body trống — dữ liệu chỉ trong FI field là chuẩn hay có version khác? | DEP/ARR |
| ACARS-06 | K6 flights (Jestar Pacific) xuất hiện trong data — phạm vi TOSS có xử lý không? | Tất cả |
| ACARS-07 | XU-350 (Cambodia reg.) — tàu thuê, TOSS có theo dõi không? | Tất cả |
| ACARS-08 | Tỷ lệ REJ cao (~8,6%) có bình thường không? Có retry protocol không? | REJ |

---

*Phân tích bởi agent BA từ mẫu ngày 01/03/2026 (25.246 điện). Cần SME VNA xác nhận §8
trước khi đưa vào đặc tả PH5. Tham chiếu tiêu chuẩn: ARINC 618 (ACARS protocol) +
ARINC 623 (CPDLC format).*
