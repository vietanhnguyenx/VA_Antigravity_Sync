---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Phân tích — As-Is Quy trình OCC & Điều phái"
source: "[Nguồn: VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf §1–§2 + VNA_TOSS.pptx]"
---

# Phân tích As-Is — Quy trình Điều hành Khai thác (OCC)

> **Mục đích:** Mô tả quy trình hiện tại của OCC và bộ phận Điều phái VNA trước khi có TOSS. Đây là cơ sở để xác định điểm đau (pain point) và thiết kế To-Be.
>
> ⚠️ **Lưu ý:** Nội dung dưới đây được trích xuất từ tài liệu nguồn (đề xuất giải pháp kỹ thuật v0.3). Các điểm đánh dấu `[Cần xác nhận — SH-xx]` là giả định cần được stakeholder xác nhận qua phỏng vấn.

---

## 1. Bối cảnh Hiện tại

### 1.1 Hệ thống VNA đang sử dụng (As-Is)

*[Nguồn: VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf §2 — Tích hợp hệ thống]*

| Hệ thống | Mục đích | Vai trò sử dụng |
|---|---|---|
| **Ops++** | Hệ thống khai thác chính — lịch bay, tổ bay | OCC, Dispatcher |
| **AVES** | Dữ liệu chuyến bay, trạng thái | OCC |
| **FSS** | Fuel/flight status | Dispatcher |
| **LIDO** | OFP, kế hoạch bay | Dispatcher |
| **Crew Trip** | Lịch bay tổ bay | OCC |
| **MO+** | Tài liệu chuyến bay — OFP, NOTAM, WX | Dispatcher, Tổ bay |
| **MRO/AMOS** | Bảo dưỡng, MEL/CDL | OCC (xem trạng thái tàu bay) |
| **TIMS** | `[Cần làm rõ chức năng — SH-03]` | `[Cần làm rõ]` |
| **eTechlog** | Nhật ký kỹ thuật điện tử | Tổ bay, Kỹ thuật |
| **SPECTRA / Cirium** | Dữ liệu ngành, so sánh | Phân tích, Báo cáo |
| **WNI** | Weather data | Dispatcher |

**Vấn đề cốt lõi:** Dữ liệu rải rác trên 10+ hệ thống, không có nguồn thống nhất → OCC phải nhìn nhiều màn hình, tổng hợp thủ công.

### 1.2 Môi trường Vật lý OCC

`[Cần xác nhận qua phỏng vấn SH-04 — Trực ban OCC]`

- Phòng OCC hoạt động 24/7 chia theo ca (ước tính 3–4 ca/ngày)
- Mỗi ca có Trực ban OCC + Dispatcher trực
- Màn hình giám sát chuyến bay (Flight Radar24 hoặc tương tự)
- Điện thoại nội bộ + ACARS để liên lạc với tổ bay

---

## 2. Quy trình As-Is — Lập kế hoạch và Điều phái Chuyến bay

*[Nguồn: suy diễn từ mô tả hệ thống + tài liệu v0.3 §3.1 — Dispatcher cần xác nhận]*

```
TRƯỚC CHUYẾN BAY (D-1 hoặc sáng ngày bay)
─────────────────────────────────────────────────────────
  Dispatcher
      │
      ├─► Lấy OFP từ LIDO (thủ công)
      ├─► Lấy NOTAM từ nguồn bên ngoài (web) [Cần xác nhận]
      ├─► Lấy Weather từ WNI [Cần xác nhận]
      ├─► Kiểm tra trạng thái tàu bay trong Ops++ / AMOS
      │     (MEL có item nào ảnh hưởng không?)
      ├─► Kiểm tra tổ bay trong Crew Trip
      │     (đủ giờ nghỉ? bằng cấp còn hiệu lực?)
      ├─► Soạn Dispatch Release (thủ công / form giấy?)
      │   [Cần xác nhận — SH-05: hiện dùng phần mềm gì?]
      └─► Tổ bay ký xác nhận (giấy hoặc điện tử?)
               [Cần xác nhận — SH-05]
```

```
TRONG CHUYẾN BAY (Realtime)
─────────────────────────────────────────────────────────
  OCC Trực ban
      │
      ├─► Theo dõi vị trí tàu bay qua màn hình (Flight Radar?)
      ├─► Nhận cảnh báo delay từ... [Cần xác nhận — SH-04]
      ├─► Liên lạc ACARS với tổ bay (nếu có vấn đề)
      ├─► Phối hợp sân bay đến (station) qua điện thoại
      └─► Ghi nhận delay code thủ công? [Cần xác nhận]
```

```
SAU CHUYẾN BAY (Kết thúc)
─────────────────────────────────────────────────────────
  Dispatcher / OCC
      │
      ├─► Nhận báo cáo Block Time từ hệ thống
      ├─► Ghi nhận sự kiện (nếu có)
      └─► Báo cáo OTP cuối ngày — tổng hợp từ nhiều nguồn
              [Cần xác nhận — SH-04: mất bao lâu?]
```

---

## 3. Điểm Đau (Pain Points) — Từ Tài liệu Nguồn

*[Nguồn: VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf §1 — Bối cảnh thách thức]*

| # | Điểm đau | Mức độ | `[Cần xác nhận]` |
|---|---|---|---|
| P01 | **Dữ liệu phân tán** — OCC phải nhìn 5–7 hệ thống cùng lúc để có đủ thông tin 1 chuyến bay | Cao | SH-04: số màn hình thực tế? |
| P02 | **Thiếu cảnh báo tự động** — phát hiện vấn đề (delay, MEL) phụ thuộc vào nhân viên nhìn màn hình | Cao | SH-04: có bao nhiêu chuyến bị bỏ sót? |
| P03 | **Tài liệu chuyến bay thủ công** — OFP/Dispatch Release soạn và truyền tay chưa số hóa đồng bộ | Cao | SH-05: quy trình thực tế? |
| P04 | **Báo cáo OTP chậm** — phải tổng hợp thủ công từ nhiều nguồn, không có dashboard realtime | Trung bình | SH-04: hiện mất bao lâu? |
| P05 | **Quyết định Tankering** — phân tích nhiên liệu và khuyến nghị mang dầu làm thủ công | Trung bình | SH-05: ai quyết định và dựa trên gì? |
| P06 | **Theo dõi FTL tổ bay** — phải tra thủ công hoặc phụ thuộc Crew Trip | Trung bình | SH-05: đã xảy ra vi phạm FTL chưa? |
| P07 | **Không có lịch sử quyết định** — khi có vấn đề khó truy vết ai quyết định gì, lúc nào | Thấp | SH-04: audit trail hiện ra sao? |

---

## 4. Luồng Tích hợp Hiện tại (As-Is Integration)

```
Hệ thống nguồn:          OCC/Dispatcher thủ công:      Đầu ra:
─────────────            ─────────────────────────      ────────
Ops++    ─────┐
AVES     ─────┤           Trực ban OCC nhìn             Báo cáo
FSS      ─────┼──────►    nhiều màn hình,      ──────►  OTP cuối ngày
Crew Trip─────┤           tổng hợp tay                  (chậm, nhiều sai sót)
LIDO     ─────┤
AMOS     ─────┤           Dispatcher soạn tay
WNI      ─────┘           Dispatch Release    ──────►   Tổ bay (giấy/email)
```

**Vấn đề:** Không có nguồn thống nhất → tốn thời gian tổng hợp → chậm ra quyết định → ảnh hưởng OTP.

---

## 5. Thước đo Hiện tại

`[Tất cả cần xác nhận qua phỏng vấn SH-01/SH-04]`

| Chỉ số | Hiện tại (ước tính) | Mục tiêu với TOSS |
|---|---|---|
| OTP (On-time Performance) | `[Cần số thực từ VNA]` | Cải thiện đáng kể |
| Thời gian soạn Dispatch Release | `[Cần số thực]` | Giảm ≥ 50% |
| Thời gian tổng hợp báo cáo OTP cuối ngày | `[Cần số thực]` | Realtime → 0 phút |
| Số hệ thống OCC phải mở cùng lúc | Ước tính 5–7 hệ thống | 1 hệ thống (TOSS) |
| Thời gian phát hiện delay từ khi xảy ra | `[Cần số thực]` | < 1 phút (realtime) |

---

## 6. Câu hỏi Cần Làm rõ qua Phỏng vấn

| # | Câu hỏi | Đối tượng | Ưu tiên |
|---|---|---|---|
| Q01 | Quy trình Dispatch Release hiện tại — dùng phần mềm gì, giấy hay điện tử? | SH-05 | Cao |
| Q02 | Mỗi ca OCC thường có bao nhiêu người? Phân công thế nào? | SH-04 | Cao |
| Q03 | Khi có delay/sự cố, ai phát hiện đầu tiên và thông báo thế nào? | SH-04 | Cao |
| Q04 | Tổ bay hiện nhận tài liệu chuyến bay qua kênh nào? (giấy, email, app?) | SH-05 | Cao |
| Q05 | Tankering: ai quyết định, dựa trên dữ liệu nào, mất bao lâu? | SH-05 | Trung bình |
| Q06 | OTP hiện tại của VNA là bao nhiêu %? Mục tiêu? | SH-01/SH-04 | Cao |
| Q07 | Có incident nào gần đây do thiếu thông tin tập trung gây ra không? | SH-04 | Trung bình |
| Q08 | Hệ thống TIMS trong danh sách tích hợp là gì, dùng để làm gì? | SH-03 | Trung bình |

*[Nguồn tham chiếu: VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf §1 — Bối cảnh và thách thức]*
