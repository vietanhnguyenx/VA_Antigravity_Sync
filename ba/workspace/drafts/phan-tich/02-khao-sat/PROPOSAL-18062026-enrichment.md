---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "business-analyst"
version: "0.1"
date: "2026-06-22"
survey_date: "2026-06-18"
status: "Draft"
document_type: "Đề xuất làm giàu sau khảo sát"
related_survey: "BAO-CAO-KHAO-SAT-18062026-v0.1.md"
target_artifacts:
  - "ba/workspace/drafts/wireframe/PH1/wf-monitoring-overview.md"
  - "ba/workspace/drafts/srs/03-dac-ta-chuc-nang/PHAN-RA-BRD-PH1-thong-tin-dieu-hanh-chuyen-bay-v0.6.md"
  - "ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md"
  - "ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md"
---

# Đề xuất làm giàu sau buổi khảo sát 18/06/2026 — CLC & Điều phái

## 1. Tổng quan

Buổi khảo sát 18/06/2026 (cả ngày, sáng + chiều) là **buổi đào sâu thiết kế chi tiết của màn Monitoring trong phân hệ Điều phái** (PH1 — Thông tin điều hành chuyến bay), kèm các tab cấu hình tham số trong phân hệ Quản lý chặng bay. Đối tượng làm việc gồm CLC (Centralized Load Control) và Dispatcher của hãng. Buổi 18/06 KHÔNG đi sâu vào các phân hệ khác (Tài liệu chuyến bay, Báo cáo, Danh mục, Quản trị).

Phạm vi cụ thể đã được làm rõ trong buổi:

- Bố cục, quy ước hiển thị, bộ lọc và tương tác chung của màn Monitoring (chủ đề 1).
- Cơ chế bật/tắt nút Dispatch Release (chủ đề 2) — kết nối với `[YCKT sheet-04 §305 Dispatch Release]`.
- Mô hình tham số cảnh báo hai mức thời gian (chủ đề 3) — bám vào `[YCKT sheet-04 TOSS-175 / TOSS-177]`.
- Bộ cảnh báo trên từng cột nhóm: Payload/ZFW (chủ đề 4), DAO (5), Fly Doc (6), Tổ bay & Crew CHG & matching PIC (7), MEL/CDL (8), ATC FPL (9), Thời tiết theo Minima (10), nhiên liệu Pilot Confirm / Pilot AXA / Block Fuel (11).
- Tích hợp & rủi ro Adapter Lido, ưu tiên Actual Fuel ACARS (chủ đề 12).
- Quyết định duy trì màn Flight Plan dạng danh sách song song với Monitoring (chủ đề 13).

**Mức khớp ước lượng so với các nguồn đã có:**

| Nguồn so chiếu | Mức khớp | Nhận xét |
|---|---|---|
| Sheet "Màn hình Flight Dispatch" của VNA — Function list (26 cột) | ~60% | Sheet liệt kê các cột, nhưng buổi 18/06 làm rõ **quy ước hiển thị + ngưỡng số + thứ tự cột + logic cảnh báo** mà sheet để trống. |
| Wireframe `wf-monitoring-overview.md` §8/§9 | ~70% | §8 đã đặc tả 26 cột; §9.2 đã giải một phần quy tắc màu/ngưỡng từ KS 11/06. Buổi 18/06 **bổ sung quy ước hiển thị tổng quát + 4 cờ §8 chưa giải + thứ tự cột mới**. |
| YCKT sheet-04 TOSS-173/175/177/179/180/228 | ~80% | Buổi 18/06 **chốt giá trị cụ thể** cho các tham số mà YCKT chỉ nêu khái niệm (vd. 75'/60' nội địa, 90'/75' quốc tế). |
| SRS PH1 v0.6 (FUNC-101…FUNC-294) | ~75% | Đa số yêu cầu mới có thể phân rã thành **FUNC mới đánh số tiếp từ FUNC-295** (xem §3). |

> **Định danh hệ thống bám memory:** OPS++ = Netline (hệ khai thác chính); **Lido Import file** = adapter Lido nhận điện tự động (đã đổi tên từ "ePot"); FOEM = Flight Ops Engineering, đơn vị cấp DOW.

---

## 2. Đề xuất làm giàu WIREFRAME

> **Phạm vi:** Đề xuất delta cho `ba/workspace/drafts/wireframe/PH1/wf-monitoring-overview.md`. KHÔNG sửa file trong tài liệu này; BA Lead duyệt rồi mới biên tập.

### 2.1 Delta thuộc §5 "Tương tác & trạng thái" (quy ước hiển thị chung)

| # | Nội dung đề xuất | Nguồn | Chỗ chèn |
|---|---|---|---|
| WF-1 | **Quy ước trạng thái bình thường = dấu gạch ngang (-) hoặc để trắng**, không hiển thị màu xanh "ổn" đậm; áp dụng đồng nhất trên toàn bộ cột cảnh báo. | `[KS 18062026 sáng 26:41–27:37]` | §5 Tương tác & trạng thái (bổ sung quy ước 1 dòng đầu) |
| WF-2 | **Ba màu cảnh báo: đỏ (nặng nhất) — vàng (chấp chới) — xanh (ổn)**; trong đó "xanh" chỉ áp dụng khi giá trị đã được so khớp và đạt yêu cầu, không dùng cho trạng thái mặc định. | `[KS 18062026 sáng 26:10–26:40]` | §5 (làm rõ thêm sau §5 hiện hữu) |
| WF-3 | **Hover làm sáng nhẹ dòng**; **click làm sáng đậm và mở chi tiết**. | `[KS 18062026 sáng 28:37–29:27]` | §5 (thêm mục "Tương tác trên dòng") |
| WF-4 | **Không phát âm thanh**; cảnh báo lớn có thể **blink (nháy dòng)** để gây chú ý. | `[KS 18062026 chiều 53:42–54:15]` | §5 (thêm mục "Hiệu ứng cảnh báo lớn") |
| WF-5 | **Bộ lọc mặc định màn Monitoring = "chỉ hiện chuyến bất thường"**; vẫn cho chọn các bộ lọc khác ("normal + bất thường", "tất cả"). | `[KS 18062026 sáng 00:46–01:13]` | §5 hoặc §4.2 Bộ lọc (chèn dòng mới "Bộ lọc mặc định") |
| WF-6 | **Ẩn/hiện cột, ẩn/hiện dòng, lưu cấu hình hiển thị theo người dùng** — mở rộng so với hiện trạng (TOSS-179 chỉ phủ ẩn/hiện trường). | `[KS 18062026 sáng 01:13–01:38]` · `[YCKT TOSS-179]` | §4.2 Bộ lọc / §5 Tương tác (cá nhân hóa) |

### 2.2 Delta thuộc §8/§9 — 26 cột + cột bổ sung

| # | Nội dung đề xuất | Nguồn | Chỗ chèn |
|---|---|---|---|
| WF-7 | **Thứ tự cột Monitoring** (chốt): Pilot Confirm → ATC → **Crew CHG (sau ATC, trước Payload)** → Payload → MEL/CDL. Cần đối chiếu lại với 26 cột của sheet và đánh số thứ tự mới. | `[KS 18062026 chiều 01:00:16–01:00:41]` | §8.2 Bảng đặc tả 26 cột (bổ sung cột "Thứ tự khuyến nghị" hoặc thêm chú thích thứ tự dưới bảng) |
| WF-8 | **Cột "Pilot Confirm"** — trạng thái phi công đã xác nhận release; **chỉ khi xanh mới được phép phát hành tài liệu chuyến bay**. | `[KS 18062026 chiều 01:26:24–01:26:46]` | §8.2 + §9 (bổ sung dòng cột Pilot Confirm) |
| WF-9 | **Cột "Pilot AXA"** — chênh lệch dầu phi công lấy thêm + lý do phi công nhập; **hover xem nhanh**; **click xem chi tiết lịch sử**. Quy tắc cảnh báo cụ thể còn `[cần xác nhận]` (cờ DL-mới). | `[KS 18062026 chiều 02:18–02:51]` · `[KS 18062026 chiều 01:23:46–01:25:00]` | §8.2 + §9 |
| WF-10 | **Cột "Block Fuel"** — chỉ hiện số khi vượt ngưỡng; hover xem nhanh, click xem chi tiết lịch sử cập nhật. | `[KS 18062026 chiều 06:48–07:46]` | §8.2 + §9 |
| WF-11 | **Cột "Crew Download"** — kiểm tra trạng thái tải tài liệu **chỉ cho PIC** (không áp dụng cho thành viên tổ bay khác). Cần ghi rõ scope khác sheet-08 §2 ban đầu. | `[KS 18062026 chiều 20:21–20:53]` | §9.2 bảng "cột 25 Crew change" (làm rõ Crew Download tách khỏi Crew CHG, chỉ PIC) |
| WF-12 | **Cột "Crew CHG"** — cảnh báo đổi tổ bay; vị trí đặt sau ATC, trước Payload. | `[KS 18062026 chiều 01:00:16–01:01:13]` | §8.2 + §9 |
| WF-13 | **Trường hợp đặc biệt "OFP rỗng tổ bay"** (AVES lỗi không trả tổ bay sang OFP) → **cảnh báo đỏ tại cột tổ bay theo mốc thời gian**. | `[KS 18062026 chiều 01:01:13–01:01:30]` · `[KS 18062026 chiều 01:04:14–01:04:39]` | §8 (thêm subsection §8.x case đặc biệt) hoặc §9.2 cột Tổ bay |
| WF-14 | **Cột "Fly Doc"** — chuyến thường: NOTAM + Weather; **chuyến EDTO**: thêm Plotting + Icing chart. Nhận diện qua chuỗi `plotting`/`icing` trong tên file. Thiếu tài liệu → **chặn Dispatch Release**. | `[KS 18062026 chiều 10:49–13:18]` · `[KS 18062026 chiều 15:22–16:01]` · `[KS 18062026 chiều 17:28–18:12]` | §8.2 + §9.2 (cột Missing Document — bổ sung biến thể EDTO) |

### 2.3 Delta thuộc §9.2 — Quy tắc màu & ngưỡng

| # | Nội dung đề xuất | Nguồn | Chỗ chèn |
|---|---|---|---|
| WF-15 | **Mô hình hai mức cảnh báo theo thời gian** — mức vàng tại mốc **75' (nội địa) / 90' (quốc tế)**; mức đỏ tại mốc **60' (nội địa) / 75' (quốc tế)** trước ETD. Áp dụng chung cho OFP, Payload, DAO, Fly Doc, Tổ bay. **Trước mốc vàng**: giữ trạng thái bình thường (gạch ngang), không hiển thị cảnh báo. | `[KS 18062026 sáng 30:02–30:52]` · `[KS 18062026 chiều 56:30–57:32]` · `[KS 18062026 sáng 31:23–31:48]` · `[YCKT TOSS-175 / TOSS-177]` | §9.2 (bổ sung subsection "Mô hình tham số 75'/60' và 90'/75'") |
| WF-16 | **Cơ chế khôi phục về xanh** sau mốc đỏ: (a) khi có OFP mới hoặc dữ liệu cập nhật làm giá trị về dưới ngưỡng; (b) khi CLC tiếp tục gửi điện cập nhật làm dữ liệu khớp lại (chưa có thao tác lưu vết của điều phái). | `[KS 18062026 sáng 37:31–38:10]` | §9.2 (subsection chuyển trạng thái) — cờ KS-mới về "lưu vết cảnh báo" |
| WF-17 | **Cảnh báo Payload** — ngưỡng theo **chặng × loại tàu × ngưỡng âm/dương × thời điểm hiệu lực**; hiển thị số lệch tại ô, click xem chi tiết (số OFP, số CLC, thời điểm cập nhật). Áp cho cả màn tài liệu DSP (briefing). | `[KS 18062026 sáng 11:22–12:21]` · `[KS 18062026 sáng 19:01–19:52]` · `[KS 18062026 sáng 22:47–23:14]` · `[YCKT sheet-04 §251]` · `[YCKT TOSS-173]` | §9.2 cột EPLD/EST DOW (mở rộng đặc tả ma trận ngưỡng) |
| WF-18 | **Cảnh báo DAO** — quy tắc "lệch là cảnh báo"; vẫn cho khai báo ngưỡng linh hoạt với **mặc định = 0**. Nguồn DAO chuẩn từ **FOEM**; fallback file DOW cố định qua Adapter khi FOEM chưa sẵn sàng. | `[KS 18062026 sáng 51:30–52:11]` · `[KS 18062026 sáng 52:11–52:35]` · `[KS 18062026 sáng 46:11–47:21]` · `[YCKT sheet-06 §42]` | §9.2 cột EST DOW / DAO (subsection riêng) |
| WF-19 | **Cảnh báo MEL/CDL** — 3 lớp: (1) AMOS → list MEL theo tàu/chuyến; (2) lọc theo shortlist FOE trên Lido; (3) so sánh shortlist với MEL trong OFP. Bắt cả 3 trường hợp **thiếu, thừa, sai mã** (khớp 2 chiều cả số lượng và mã). Tab "MEL/CDL theo tàu" đặt trong phân hệ Quản lý tàu bay. | `[KS 18062026 chiều 34:01–35:30]` · `[KS 18062026 chiều 47:54–50:38]` · `[YCKT sheet-04 TOSS-128…TOSS-135]` | §9.2 cột MEL/CDL (subsection 3 lớp đối chiếu) |
| WF-20 | **Cảnh báo ATC FPL** — bóc tách thành **5 thành phần** (chi tiết cấu trúc còn `[cần xác nhận]`); cảnh báo phát sinh **ngay khi có lệch** (không chờ mốc thời gian). Quy tắc cập nhật một phần: **thêm điểm route → cảnh báo**; **chỉ đổi fly level → không cảnh báo**. | `[KS 18062026 chiều 30:48–32:41]` · `[KS 18062026 chiều 24:50–25:18]` · `[KS 18062026 chiều 01:17:37–01:18:01]` · `[YCKT sheet-04 §303]` | §9.2 cột ATC (subsection 5 thành phần) |
| WF-21 | **Cảnh báo thời tiết theo Minima** — **vàng** khi METAR chạm margin Minima (+ nháy dòng); **đỏ** khi vi phạm; áp dụng cho cả chuyến đang bay (estimate arrival chạm Minima). **Điều phái có quyền sửa Minima** trên giao diện điều phái; FOE chỉ ban hành ban đầu. | `[KS 18062026 chiều 01:19:00–01:21:01]` · `[KS 18062026 chiều 01:22:43–01:23:32]` · `[YCKT sheet-04 §474]` | §9.2 cột Weather (subsection theo Minima) |
| WF-22 | **Cơ chế chặn Dispatch Release** — chỉ "sáng nút" khi: (a) đến giờ; (b) đủ tài liệu; (c) mọi trường so khớp xanh. **Tập con cảnh báo chặn release** gồm: tàu khớp, ETD ≤ 30' (nếu ATD > 30' phải chạy lại OFP), tổ bay đúng OFP, **Pilot Confirm xanh**. | `[KS 18062026 sáng 02:06–02:28]` · `[KS 18062026 chiều 01:14:34–01:15:31]` · `[KS 18062026 chiều 01:26:24–01:26:46]` · `[YCKT sheet-04 §305]` | §9 (subsection mới "Cơ chế Dispatch Release") |

### 2.4 Section mới đề xuất

| # | Nội dung đề xuất | Nguồn | Chỗ chèn |
|---|---|---|---|
| WF-23 | **§10 mới (đề xuất)** — "Màn Flight Plan dạng danh sách song song" — phục vụ tra cứu/thống kê OFP; dùng chung dữ liệu với Monitoring nhưng khác mục đích (Monitoring = cảnh báo, Flight Plan = xem + thống kê). Bố cục cột chưa chốt — cần buổi tiếp theo. | `[KS 18062026 chiều 21:20–23:46]` | Thêm §10 mới ở cuối `wf-monitoring-overview.md` (hoặc tạo file `wf-flight-plan-list.md` mới) |
| WF-24 | **§11 mới (đề xuất)** — "Sơ đồ tích hợp Adapter cho màn Monitoring" — gồm 4 nguồn AMOS / Lido (qua Lido Import file) / FOEM / AVES + luồng CLC; ưu tiên Actual Fuel ACARS > QAR; phương án dự phòng upload thủ công NOTAM/Weather. | `[KS 18062026 sáng 06:22–08:31]` · `[KS 18062026 sáng 23:51–24:35]` · `[KS 18062026 chiều 01:27:43–01:30:23]` · `[YCKT sheet-04 §310 TOSS-228]` · `[YCKT sheet-06 §14/§40/§42]` | Thêm §11 mới (sơ đồ + bảng adapter) |

---

## 3. Đề xuất làm giàu SRS

> **Phạm vi:** Đề xuất FUNC mới cho `PHAN-RA-BRD-PH1-thong-tin-dieu-hanh-chuyen-bay-v0.6.md`. Số hiệu tiếp nối từ FUNC-294 hiện tại — đề xuất từ **FUNC-295**.

### 3.1 FUNC mới có thể phân rã NGAY (nguồn đủ rõ)

| FUNC đề xuất | Mô tả | BR cha (đề xuất) | Nguồn |
|---|---|---|---|
| FUNC-295 | Áp dụng **bộ lọc mặc định "chỉ hiện chuyến bất thường"** khi mở màn Monitoring; cung cấp các bộ lọc thay thế ("normal + bất thường", "tất cả"). | BR-102 (Cá nhân hóa) hoặc BR mới về bộ lọc | `[KS 18062026 sáng 00:46–01:13]` |
| FUNC-296 | Cho phép **ẩn/hiện cột, ẩn/hiện dòng, lưu cấu hình hiển thị theo từng user** trên màn Monitoring (mở rộng FUNC-104/105 hiện chỉ phủ ẩn/hiện trường). | BR-102 | `[KS 18062026 sáng 01:13–01:38]` · `[YCKT TOSS-179]` |
| FUNC-297 | Hiển thị trạng thái cảnh báo theo **quy ước 3 màu (đỏ/vàng/xanh)** + bình thường = gạch ngang/blank; áp dụng đồng nhất trên toàn bộ cột cảnh báo. | BR-103 | `[KS 18062026 sáng 26:10–27:37]` |
| FUNC-298 | Tương tác **hover sáng nhẹ / click sáng đậm + mở chi tiết** trên mỗi dòng Monitoring; không phát âm thanh; cho phép **blink** khi cảnh báo lớn. | BR-103 | `[KS 18062026 sáng 28:37–29:27]` · `[KS 18062026 chiều 53:42–54:15]` |
| FUNC-299 | **Mô hình tham số cảnh báo hai mức thời gian** — mức vàng tại 75' (NĐ) / 90' (QT); mức đỏ tại 60' (NĐ) / 75' (QT) trước ETD. Áp dụng chung cho OFP, Payload, DAO, Fly Doc, Tổ bay. | BR mới (Mô hình tham số cảnh báo) hoặc bổ sung BR-118/119 | `[KS 18062026 sáng 30:02–30:52]` · `[KS 18062026 chiều 56:30–57:32]` · `[YCKT TOSS-175 / TOSS-177]` |
| FUNC-300 | **Tab "Ngưỡng Payload"** trong phân hệ Quản lý chặng bay: khai báo ngưỡng theo chặng × loại tàu × ngưỡng âm/dương × thời điểm hiệu lực. | BR PH4/PH-chặng bay (cần đối chiếu) | `[KS 18062026 sáng 19:01–19:52]` · `[KS 18062026 sáng 45:02–45:35]` · `[YCKT TOSS-173]` |
| FUNC-301 | **Tab "Ngưỡng DAO"** trong phân hệ Quản lý chặng bay: khai báo ngưỡng dung sai DAO, mặc định = 0; áp dụng "lệch là cảnh báo". | BR PH4/PH-chặng bay | `[KS 18062026 sáng 52:35–53:15]` |
| FUNC-302 | Lấy **nguồn DAO chuẩn từ FOEM**; nếu FOEM chưa sẵn sàng thì fallback dùng **file DOW cố định** qua Adapter. | BR-120 hoặc BR mới về FOEM | `[KS 18062026 sáng 46:11–47:21]` · `[YCKT sheet-06 §42]` |
| FUNC-303 | Phân loại **tài liệu chuyến bay**: chuyến thường yêu cầu NOTAM + Weather; chuyến EDTO bổ sung Plotting chart + Icing chart. Nhận diện qua chuỗi `plotting`/`icing` trong tên file. | BR-112 / BR-222 | `[KS 18062026 chiều 10:49–13:18]` · `[KS 18062026 chiều 15:22–16:01]` |
| FUNC-304 | **Thiếu tài liệu chặn Dispatch Release** — cảnh báo Fly Doc xác định cụ thể tài liệu nào đang thiếu. | BR-112 / BR-222 | `[KS 18062026 chiều 16:57–18:12]` |
| FUNC-305 | **Cột "Crew Download"** — kiểm tra trạng thái tải tài liệu **chỉ cho PIC**. | BR-112 (mở rộng) | `[KS 18062026 chiều 20:21–20:53]` |
| FUNC-306 | **Cột "Crew CHG"** — cảnh báo đổi tổ bay; vị trí sau ATC, trước Payload. | BR-112 | `[KS 18062026 chiều 01:00:16–01:01:13]` |
| FUNC-307 | Trường hợp **OFP rỗng tổ bay** (AVES lỗi) → cảnh báo đỏ tại cột tổ bay theo mốc thời gian. | BR-112 | `[KS 18062026 chiều 01:01:13–01:04:39]` |
| FUNC-308 | **Cảnh báo MEL/CDL 3 lớp** — AMOS → shortlist FOE trên Lido → MEL trong OFP. Bắt thiếu/thừa/sai mã (khớp 2 chiều). | BR-118 hoặc BR mới về MEL | `[KS 18062026 chiều 34:01–50:38]` · `[YCKT sheet-04 TOSS-128…TOSS-135]` |
| FUNC-309 | **Tab "MEL/CDL theo tàu"** trong phân hệ Quản lý tàu bay (truy cập riêng, không theo chuyến). | BR PH-Quản lý tàu bay | `[KS 18062026 chiều 50:38–51:21]` |
| FUNC-310 | **Cảnh báo ATC FPL phát sinh ngay khi có lệch** (không phụ thuộc mốc thời gian); làm nổi đoạn lệch tương ứng. | BR-118 hoặc BR mới ATC | `[KS 18062026 chiều 24:50–28:01]` · `[YCKT sheet-04 §303]` |
| FUNC-311 | Quy tắc xử lý cập nhật một phần ATC: **thêm điểm route → cảnh báo**; **chỉ đổi fly level → không cảnh báo**. | BR-118 | `[KS 18062026 chiều 01:17:37–01:18:01]` |
| FUNC-312 | **Cảnh báo thời tiết theo Minima**: vàng khi METAR chạm margin (+ nháy dòng), đỏ khi vi phạm; áp dụng cả cho chuyến đang bay (estimate arrival). | BR-118 | `[KS 18062026 chiều 01:19:00–01:21:01]` · `[YCKT sheet-04 §474]` |
| FUNC-313 | **Quyền sửa Minima sân bay** giao cho điều phái trên giao diện điều phái; FOE ban hành ban đầu nhưng không sửa trên giao diện này. | BR mới (phân quyền Minima) | `[KS 18062026 chiều 01:22:43–01:23:32]` |
| FUNC-314 | **Cột "Pilot Confirm"** — chỉ khi xanh mới được phép phát hành tài liệu chuyến bay. | BR-112 hoặc BR mới Pilot Confirm | `[KS 18062026 chiều 01:26:24–01:26:46]` |
| FUNC-315 | **Cơ chế bật/tắt nút Dispatch Release** — kiểm tra đa điều kiện: đến giờ + đủ tài liệu + so khớp xanh; tập con cảnh báo chặn: tàu khớp + ETD ≤ 30' (nếu ATD > 30' chạy lại OFP) + tổ bay đúng OFP + Pilot Confirm xanh. | BR-119 hoặc BR mới Dispatch Release | `[KS 18062026 sáng 02:06–02:28]` · `[KS 18062026 chiều 01:14:34–01:15:31]` · `[YCKT sheet-04 §305]` |
| FUNC-316 | **Cơ chế khôi phục về xanh** sau cảnh báo đỏ — khi OFP mới làm giá trị về dưới ngưỡng HOẶC khi CLC gửi điện cập nhật làm dữ liệu khớp lại. | BR-103 | `[KS 18062026 sáng 37:31–38:10]` |
| FUNC-317 | **Màn Flight Plan dạng danh sách** song song với Monitoring — dùng chung dữ liệu nhưng khác mục đích (tra cứu + thống kê OFP). | BR mới (Màn Flight Plan list) | `[KS 18062026 chiều 21:20–23:46]` |
| FUNC-318 | **Ưu tiên Actual Fuel ACARS > QAR**; cho phép **upload tài liệu thủ công** khi luồng Lido/AMOS lỗi. | BR-118 hoặc BR mới | `[KS 18062026 chiều 01:27:43–01:30:23]` · `[YCKT sheet-04 §310 TOSS-228]` |
| FUNC-319 | **Thuật toán matching PIC** giữa OFP và AVES bằng so chuỗi theo tỷ lệ phần trăm; Adapter ghép group code sau tên crew theo cấu trúc 16 ký tự tên + 4 ký tự group code (tổng 20 ký tự). | BR-112 | `[KS 18062026 chiều 01:07:55–01:09:38]` |

### 3.2 Cột/chức năng còn cờ — HOÃN chưa phân rã

| Hạng mục | Lý do hoãn | Cờ liên quan |
|---|---|---|
| **Quy tắc cảnh báo Pilot AXA cụ thể** | Buổi 18/06 chưa thống nhất ngoài việc cho điều phái biết phi công đã nhập lý do hay chưa. | Cờ KS mới (xem §4) |
| **Tập con cảnh báo chặn Dispatch Release đầy đủ** | Buổi 18/06 chỉ chốt 4 điều kiện chặn cốt lõi (tàu / ETD ≤ 30' / tổ bay / Pilot Confirm); danh mục đầy đủ cần tinh chỉnh sau khai thác thực tế. | Cờ KS mới |
| **Cấu trúc 5 thành phần ATC FPL** | Chưa đặc tả từng thành phần và quy tắc bóc tách. | Cờ SME mới |
| **Phương án nới giới hạn 20 ký tự Adapter Lido** | Đang chờ ý kiến lãnh đạo dự án. | Cờ RISK mới (DEC) — xem §4 |
| **Quy ước đặt tên Plotting/Icing chart** | Dự án sẽ thống nhất qua trao đổi sau. | Cờ KS mới |
| **Cảnh báo Notam chi tiết (sân bay/vùng trời/en-route)** | Tách buổi làm việc riêng. | Cờ KS mới |
| **Cột mặc định + bộ lọc của màn Flight Plan list** | Chưa làm rõ cụ thể. | Cờ KS mới |
| **Phân mức cảnh báo DAO theo độ lớn lệch** | Hiện chỉ "lệch là cảnh báo"; chưa loại trừ khả năng phân mức về sau. | Cờ KS mới |
| **Cơ chế lưu vết cảnh báo đã từng phát sinh** | Có cần lưu vết hay chỉ tự động chuyển xanh là đủ? | Cờ DEC mới |

---

## 4. Đề xuất OID (Open Items & Decisions)

> **Lưu ý đánh số:** OID-TOSS-001 hiện có **DEC-01…DEC-06**, **SME-01…SME-49**, **KS-01…KS-77**, KHÔNG có lớp `RISK-` riêng (rủi ro hiện ghi 🔴 trong cột Trạng thái). Đề xuất tiếp theo bắt đầu **DEC-07, SME-50, KS-78** trở đi. Các điểm có tính rủi ro dùng 🔴 đánh dấu.

### 4.1 Bảng đề xuất bổ sung vào OID-TOSS-001

| Mã đề xuất | Loại | Nội dung | Owner / Buổi làm rõ | Nguồn |
|---|---|---|---|---|
| KS-78 | KS | **Quy tắc cảnh báo cụ thể của cột Pilot AXA** — ngưỡng chênh lệch nào kích cảnh báo? Theo mốc thời gian không? Chỉ "đã nhập lý do hay chưa" hay có cảnh báo theo extra fuel. | Workshop điều phái (buổi tiếp theo) | `[KS 18062026 chiều 02:18–02:51]` |
| KS-79 | KS | **Liệt kê đầy đủ tập con cảnh báo chặn nút Dispatch Release** — buổi 18/06 chỉ chốt 4 nhóm (tàu, ETD ≤ 30', tổ bay đúng OFP, Pilot Confirm); cần phân loại tất cả cảnh báo theo "chặn / không chặn". | Workshop điều phái + tinh chỉnh sau khai thác | `[KS 18062026 chiều 01:14:34–01:15:31]` |
| SME-50 | SME | **Cấu trúc 5 thành phần trong file ATC FPL** dùng cho thuật toán matching và làm nổi cập nhật một phần — từng thành phần là gì, quy tắc bóc tách. | SME điều phái + SME ATC | `[KS 18062026 chiều 30:48–31:18]` |
| DEC-07 🔴 | DEC | **Phương án nới giới hạn 20 ký tự của Adapter Lido cho trường tên crew** — chấp nhận hiện trạng (16 tên + 4 group code) hay sửa cấu trúc FPX gửi ATC để nới? Chờ ý kiến lãnh đạo dự án. Có ảnh hưởng độ chính xác matching PIC. | Lãnh đạo dự án | `[KS 18062026 chiều 01:09:38–01:10:07]` |
| KS-80 | KS | **Quy ước đặt tên file Plotting chart và Icing chart** — chứa chuỗi `plotting`/`icing` ở vị trí nào trong tên file (đầu/giữa/cuối)? Phân biệt hoa thường? Quy ước thống nhất. | Workshop điều phái + đội phát triển | `[KS 18062026 chiều 18:12–18:53]` · `[KS 18062026 chiều 13:18–13:49]` |
| KS-81 | KS | **Phân loại NOTAM chi tiết** (sân bay / vùng trời / en-route / mức ảnh hưởng) — tách thành buổi làm việc riêng. | Workshop NOTAM riêng | `[KS 18062026 chiều 01:23:32–01:23:58]` |
| KS-82 | KS | **Đặc tả màn Flight Plan dạng danh sách** — các cột mặc định, cột tùy chọn, bộ lọc. | Buổi khảo sát tiếp theo | `[KS 18062026 chiều 21:20–23:46]` |
| KS-83 | KS | **Phân mức cảnh báo DAO theo độ lớn lệch** — chỉ một mức hay nhiều mức (ví dụ trên 1 tấn vàng, trên 3 tấn đỏ)? Hiện chốt "lệch là cảnh báo". | Workshop điều phái | `[KS 18062026 sáng 51:30–52:11]` |
| DEC-08 | DEC | **Cơ chế "lưu vết" cảnh báo đã từng phát sinh** — khi điều phái chưa có thao tác nhưng CLC gửi điện cập nhật làm dữ liệu khớp lại: cần lưu vết để theo dõi hay tự động chuyển xanh là đủ? | BA Lead + điều phái | `[KS 18062026 sáng 37:31–38:10]` |
| KS-84 | KS | **Quy tắc cảnh báo route ATC khi thêm điểm KÈM đổi fly level** — cảnh báo theo điểm, theo fly level, hay cả hai? | Workshop điều phái | `[KS 18062026 chiều 01:17:37–01:18:01]` |
| DEC-09 🔴 | DEC | **Vị trí tab "Ngưỡng Payload" và tab "Ngưỡng DAO"** trong phân hệ Quản lý chặng bay — đặc tả mới, sheet-04 §16 "Quản lý chặng bay" chưa định danh hai tab này. Cần BA Lead xác nhận đưa vào phân hệ Quản lý chặng bay (PH4) hay phân hệ khác. | BA Lead + workshop danh mục | `[KS 18062026 sáng 45:02–45:35]` · `[KS 18062026 sáng 52:35–53:15]` |
| DEC-10 | DEC | **Vị trí tab "MEL/CDL theo tàu"** trong phân hệ Quản lý tàu bay — cần xác nhận phân hệ chứa và mối quan hệ với màn Monitoring (chuyến). | BA Lead + workshop danh mục | `[KS 18062026 chiều 50:38–51:21]` |
| KS-85 | KS | **Mô hình hai mức 75'/60' và 90'/75' áp cho nhóm Tổ bay** — KS 18/06 nêu "áp dụng chung" nhưng chưa demo case Crew Download / Crew CHG; cần xác nhận có ngoại lệ không. | Workshop điều phái | `[KS 18062026 sáng 42:40–43:03]` |
| SME-51 | SME | **Tên đầy đủ + vai trò của FOEM (Flight Ops Engineering)** — phân biệt với FOE; cấu trúc bảng DOW cấp ra; tần suất cập nhật. | SME khai thác | `[KS 18062026 sáng 46:11–47:21]` · `[YCKT sheet-06 §42]` |
| KS-86 | KS | **Cơ chế kích hoạt OFP rỗng tổ bay** — tần suất AVES lỗi, có nhật ký log nào, có thông báo riêng cho ADM/IT không. | SME tích hợp AVES | `[KS 18062026 chiều 01:01:13–01:04:39]` |

> **Tóm tắt:** 15 điểm mới — **2 DEC** (1 🔴), **2 SME**, **8 KS**, **2 DEC bổ sung về vị trí UI** (1 🔴), **1 DEC về lưu vết**. Có **2 rủi ro 🔴** đáng theo dõi sát: DEC-07 (giới hạn 20 ký tự Adapter Lido) và DEC-09 (vị trí UI hai tab ngưỡng mới).

---

## 5. Đề xuất GLOSSARY

> **Quy ước:** Theo memory "Glossary: trình đề xuất trước khi ghi" — bảng dưới là **đề xuất**, chỉ ghi vào `toss-glossary-v0.1.md` sau khi BA Lead confirm. Đối chiếu với §V của báo cáo khảo sát 18/06 (đã có 14 thuật ngữ đề xuất tại đó); bảng dưới **kế thừa đầy đủ** + bổ sung mục mới (ý lệch là cảnh báo, cờ DAO mặc định 0...).

| # | Thuật ngữ | Mô tả đề xuất | Nguồn |
|---|---|---|---|
| 1 | **Crew Download** | Cột trên màn Monitoring kiểm tra trạng thái PIC đã tải tài liệu chuyến bay; **chỉ áp dụng cho PIC** (không cho thành viên tổ bay khác). | `[KS 18062026 chiều 20:21–20:53]` |
| 2 | **Crew CHG (Crew Change)** | Cảnh báo phát hiện thay đổi tổ bay giữa OFP cũ và OFP mới; vị trí cột sau ATC, trước Payload. | `[KS 18062026 chiều 01:00:16–01:01:13]` |
| 3 | **Pilot AXA** | Cột hiển thị extra fuel phi công lấy thêm so với kế hoạch + lý do; hover xem nhanh; click xem chi tiết. | `[KS 18062026 chiều 02:18–02:51]` |
| 4 | **Pilot Confirm** | Cột hiển thị trạng thái phi công đã xác nhận release; **chỉ khi xanh mới được phép phát hành tài liệu**. | `[KS 18062026 chiều 01:26:24–01:26:46]` |
| 5 | **Fly Doc** | Nhóm tài liệu chuyến bay = NOTAM + Weather (mọi chuyến) **+ Plotting chart + Icing chart (chuyến EDTO)**. | `[KS 18062026 chiều 10:18–13:18]` |
| 6 | **Ngưỡng Payload** | Tab khai báo ngưỡng dung sai Payload theo **chặng × loại tàu × ngưỡng âm/dương × thời điểm hiệu lực**; nằm trong phân hệ Quản lý chặng bay. | `[KS 18062026 sáng 45:02–45:35]` |
| 7 | **Ngưỡng DAO** | Tab khai báo ngưỡng DAO; mặc định = 0 (lệch là cảnh báo); nằm trong phân hệ Quản lý chặng bay. | `[KS 18062026 sáng 52:35–53:15]` |
| 8 | **Mô hình cảnh báo hai mức (75/60 — 90/75)** | Mức 1 (vàng) tại 75' trước ETD chuyến nội địa / 90' chuyến quốc tế; mức 2 (đỏ) tại 60' nội địa / 75' quốc tế. | `[KS 18062026 sáng 30:02–30:52]` · `[KS 18062026 chiều 56:30–57:32]` |
| 9 | **Shortlist MEL (FOE)** | Danh mục MEL FOE lọc từ Master MEL của AMOS, giữ lại các MEL ảnh hưởng khai thác (wind, fly level, fuel factor); upload Lido làm tham chiếu. | `[KS 18062026 chiều 34:25–35:30]` |
| 10 | **Matching PIC** | Thuật toán so khớp PIC giữa OFP và AVES dùng so chuỗi theo tỷ lệ phần trăm + ghép group code (16 tên + 4 group code = 20 ký tự, giới hạn API Lido). | `[KS 18062026 chiều 01:07:55–01:09:14]` |
| 11 | **OFP rỗng tổ bay** | Trường hợp đặc biệt khi AVES lỗi không trả tổ bay sang OFP → cảnh báo đỏ tại cột tổ bay theo mốc thời gian. | `[KS 18062026 chiều 01:01:13–01:04:39]` |
| 12 | **Minima sân bay** | Tham số tối thiểu (visibility, ceiling, RVR) cho cảnh báo thời tiết; FOE ban hành ban đầu; **điều phái được phép sửa trên giao diện điều phái**. | `[KS 18062026 chiều 01:22:43–01:23:32]` |
| 13 | **Filed ATC** | Bản ATC FPL đã nộp cho cơ quan kiểm soát không lưu qua điện ATC; đối tượng so khớp với ATC FPL trong OFP. | `[KS 18062026 chiều 23:47–24:48]` |
| 14 | **Lido Import file** | Adapter của Lido nhận điện tải trọng tự động từ CLC để bắn sang phân hệ Điều phái (**đã thay tên cũ "ePot"** đã sửa). | `[KS 18062026 sáng 23:51–24:35]` |
| 15 | **FOEM (Flight Ops Engineering)** | Đơn vị cấp bảng DOW (Dry Operating Weight) chuẩn; nguồn DAO chuẩn cho hệ thống TOSS. Phân biệt với FOE. | `[KS 18062026 sáng 46:11–47:21]` · `[YCKT sheet-06 §42]` |
| 16 | **DAO (Dry Operating Adjustment)** | Điều chỉnh khô trên DOW; ảnh hưởng trực tiếp đến tính toán nhiên liệu và tải khai thác; cảnh báo "lệch là cảnh báo". | `[KS 18062026 sáng 53:40–54:38]` |
| 17 | **EDTO (Extended Diversion Time Operations)** | Chuyến bay khai thác kéo dài thời gian chuyển hướng; yêu cầu **Plotting chart + Icing chart** bổ sung trong Fly Doc. | `[KS 18062026 chiều 15:22–16:01]` |
| 18 | **OFP rỗng (case AVES)** | Đồng nghĩa với "OFP rỗng tổ bay" — đề xuất dùng một thuật ngữ thống nhất. | `[KS 18062026 chiều 01:04:14–01:04:39]` |

---

## 6. BẢNG QUYẾT ĐỊNH BA LEAD

> Các điểm cần BA Lead chốt trước khi áp dụng vào artifact. Đánh số liên tục để dễ tham chiếu trong buổi review.

| # | Câu hỏi cần BA Lead chốt | Phương án A | Phương án B | Ghi chú & nguồn |
|---|---|---|---|---|
| Q1 | Vị trí tab **"Ngưỡng Payload"** và **"Ngưỡng DAO"** — đặt ở đâu? | Đưa vào **phân hệ Quản lý chặng bay (PH4)** theo lời CLC/điều phái | Đưa vào **phân hệ Quản trị hệ thống (PH5)** vì là tham số cấu hình | Mâu thuẫn vị trí: sheet-04 §16 "Quản lý chặng bay" chưa định danh; KS 18/06 nói rõ "Quản lý chặng bay". `[KS 18062026 sáng 45:02–45:35]` · `[KS 18062026 sáng 52:35–53:15]` |
| Q2 | Mức cảnh báo **DAO** | Giữ "lệch là cảnh báo" (một mức), mặc định = 0 | Cho phép phân mức (1 tấn vàng, 3 tấn đỏ) trong tương lai | KS 18/06 chốt phương án A trong ngắn hạn; vẫn để ngỏ phân mức. `[KS 18062026 sáng 51:30–52:11]` |
| Q3 | **Giới hạn 20 ký tự Adapter Lido** cho tên crew | Chấp nhận 16 tên + 4 group code | Sửa cấu trúc FPX gửi ATC để nới giới hạn (cần phê duyệt lãnh đạo) | 🔴 Rủi ro chính ảnh hưởng matching PIC. `[KS 18062026 chiều 01:07:25–01:09:38]` |
| Q4 | **Lưu vết** cảnh báo đã phát sinh | Lưu lịch sử mọi cảnh báo (audit trail) | Chỉ hiển thị trạng thái hiện tại, tự chuyển xanh khi dữ liệu khớp lại | Liên quan dispute giữa điều phái và CLC khi không có thao tác từ điều phái. `[KS 18062026 sáng 37:31–38:10]` |
| Q5 | **Quy tắc cảnh báo Pilot AXA** | Chỉ cảnh báo trạng thái "đã nhập lý do hay chưa" | Cảnh báo theo ngưỡng chênh lệch extra fuel (tương tự Block Fuel) | Buổi 18/06 chưa thống nhất. `[KS 18062026 chiều 02:18–02:51]` |
| Q6 | **Vị trí cột "Crew CHG"** trên màn Monitoring | Sau ATC, trước Payload (theo KS 18/06) | Vị trí khác (theo sheet 26 cột — chưa định danh) | KS 18/06 chốt phương án A; cần thẩm định lại với 26 cột sheet. `[KS 18062026 chiều 01:00:16–01:00:41]` |
| Q7 | **Cột "Crew Download"** scope | Chỉ kiểm PIC (theo KS 18/06) | Kiểm cả PIC + thành viên tổ bay khác (sheet-08 §2 ban đầu) | Mâu thuẫn giữa KS 18/06 và sheet-08 §2 — chốt phương án A. `[KS 18062026 chiều 20:21–20:53]` |
| Q8 | **Trật tự ưu tiên Actual Fuel** | ACARS → QAR (theo KS 18/06) | Theo cấu hình động cho phép user chọn | KS 18/06 chốt phương án A; cần đối chiếu sheet-04 §310 TOSS-228. `[KS 18062026 chiều 01:27:43–01:30:23]` |
| Q9 | **Nhận diện file Plotting/Icing** | Chuỗi `plotting`/`icing` trong tên file (theo KS 18/06) | Tag/metadata khai báo khi upload | KS 18/06 chốt phương án A, nhưng cần quy ước đặt tên chi tiết. `[KS 18062026 chiều 18:12–18:53]` |
| Q10 | **Áp dụng mô hình 75/60 — 90/75 cho nhóm Tổ bay** | Áp đồng nhất với OFP/Payload/DAO/Fly Doc | Có ngoại lệ riêng cho Crew Download / Crew CHG | KS 18/06 nói "áp dụng chung" nhưng chưa demo case. `[KS 18062026 sáng 42:40–43:03]` |
| Q11 | **Đánh số FUNC mới** từ buổi 18/06 | Tiếp nối FUNC-295…FUNC-319 trong file SRS PH1 v0.6 (bump v0.7) | Tách subset thành SRS riêng cho màn Monitoring | Khối FUNC 18/06 dày (~25 FUNC); ảnh hưởng cấu trúc file. |
| Q12 | **Áp dụng các delta wireframe** | Bump `wf-monitoring-overview.md` lên v0.x mới sau khi BA Lead duyệt | Tạo `wf-monitoring-v2.md` mới để giữ baseline cũ | Quyết định ảnh hưởng version control và mockup phụ thuộc. |

---

> **Đây là ĐỀ XUẤT — việc áp dụng vào wireframe/SRS/OID/glossary do BA Lead duyệt (§0).**
