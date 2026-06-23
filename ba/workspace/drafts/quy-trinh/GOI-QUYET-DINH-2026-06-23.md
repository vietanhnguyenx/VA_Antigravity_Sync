---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-23"
status: "Draft"
document_type: "Gói quyết định ưu tiên — BA Lead xử lý"
---

# Gói quyết định ưu tiên (23/06/2026)

> Bản trình BA Lead để **ra quyết định**, sắp theo mức chặn việc + deadline. Danh sách đầy đủ ở sổ [OID-TOSS-001](SO-THEO-DOI-DIEM-CHOT-v0.1.md) (25 DEC đang mở). File này chỉ chọn các điểm **gating** + **🔴 rủi ro**, kèm câu hỏi soạn sẵn để gửi VNA.

## Bối cảnh thời gian
- Hôm nay **23/06**. Mốc tích hợp: **24/06** cấu hình VPN · **01/07** hoàn tất máy chủ SFTP.
- VNA tuyên bố kết nối NetLine/OPS++ là **ưu tiên số 1**. Vì vậy các quyết định liên quan tích hợp cần chốt sớm.

---

## A. Quyết GẤP — chặn việc tích hợp (nên chốt trước/đầu tuần)

| # | Quyết định | Vì sao gấp | Lựa chọn |
|---|---|---|---|
| **DEC-16 ✅ ĐÃ CHỐT (23/06)** | ~~Nguồn cấp MEL/CDL cho OPS++ — nghi mâu thuẫn 17/06 (TOSS hub) vs bảng 23/06 (trực tiếp AMOS)~~ | **Đã giải quyết bằng làm rõ phạm vi.** | **KHÔNG mâu thuẫn:** bảng mô tả đấu nối vào OPS++; phạm vi TOSS = dòng "Thông qua TOSS". MEL/Ground Event là "Trực tiếp" AMOS→NetOps++ → ngoài scope TOSS. Việc TOSS cảnh báo MEL/CDL (17/06) là giám sát NỘI BỘ, tách biệt. → Không cần hỏi VNA (§C bỏ). |
| **DEC-15** | **Hình thức 33 khoảng trống** từ đối chiếu (BR-193…207 PH1, BR-262 PH2, BR-460…465 PH4, BR-556…566 PH5): đưa vào **BRD (BR atomic)** hay **SRS/tài liệu tích hợp riêng**? | Quyết hình thức trước khi agent đặc tả → định hình toàn bộ việc lấp GAP (P2). | (a) BR atomic trong BRD · (b) Đẩy sang SRS/tài liệu tích hợp · (c) BRD cho yêu cầu, SRS cho chi tiết kỹ thuật |
| **DEC-23** | Tách BR-528a (data-contract gộp) thành **BR atomic cho từng luồng/điện** (ASM/ACH/SSIM/MVT/MVA/DIV/LDM…)? | Tiền đề để đặc tả 24 luồng rõ ràng + truy vết. | (a) Tách atomic · (b) Giữ gộp + bảng phụ lục |
| **DEC-24** | Cấu trúc thư mục **SFTP Temp/Pickup/Archive + VPN + ISB** đưa vào BRD dạng **functional** hay **NFR**, hay chỉ ở tài liệu thiết kế tích hợp? | Liên quan trực tiếp việc dựng SFTP trước 01/07. | (a) Functional BR · (b) NFR · (c) Chỉ tài liệu thiết kế |

---

## B. 🔴 Rủi ro tồn từ trước (chốt sớm để gỡ chặn PH liên quan)

| # | Quyết định | Nguồn |
|---|---|---|
| **DEC-07 🔴** | Adapter giới hạn 20 ký tự (ảnh hưởng định danh) | KS 18/06 (PROPOSAL-18062026 §6) |
| **DEC-09 🔴** | Vị trí tab màn hình | KS 18/06 (PROPOSAL-18062026 §6) |

---

## C. Câu hỏi gửi VNA cho DEC-16 — ~~CẦN HỎI~~ → **KHÔNG CẦN NỮA** (DEC-16 đã chốt 23/06 bằng làm rõ phạm vi: MEL/Ground Event là "Trực tiếp", ngoài scope TOSS; cảnh báo MEL/CDL của TOSS là giám sát nội bộ tách biệt). Giữ lại nội dung dưới chỉ để tham khảo.

> **Về luồng dữ liệu MEL/CDL và Ground Event sang OPS++:**
> Bảng "Thông tin tích hợp" (cập nhật 23/06) ghi mục **MEL Item** và **Ground Event** là *"kết nối trực tiếp AMOS – NetOps++"*. Tuy nhiên khảo sát ngày 17/06 thống nhất TOSS đóng vai trò tổng hợp và phát cảnh báo MEL/CDL ba lớp (AMOS → shortlist FOE trên Lido → MEL trong OFP) rồi chuyển sang OPS++.
> Đề nghị VNA làm rõ:
> 1. Dữ liệu MEL/CDL và Ground Event cấp cho OPS++ đi **trực tiếp AMOS → NetOps++**, hay **qua TOSS**?
> 2. Nếu đi trực tiếp, TOSS có còn nhiệm vụ **tổng hợp và cảnh báo MEL/CDL** cho màn hình giám sát nội bộ của TOSS không (độc lập với luồng cấp cho OPS++)?
> 3. Trường hợp cả hai cùng tồn tại (trực tiếp cho OPS++ + qua TOSS cho giám sát nội bộ), xác nhận để tránh trùng/lệch dữ liệu.

---

## D. Quyết khi có thời gian (không chặn tích hợp)

DEC-17 (ranh giới xử lý nội bộ TOSS sau OPS++) · DEC-18 (BR-127 ATC FPL Could→Must) · DEC-19 (khung cảnh báo 2 mức vs 3 mức OFP) · DEC-20 (năm cutover ~03/2027) · DEC-21 (5 nhóm AOG/MNT Code hard-code) · DEC-22 (tên file Plotting/Icing — **trùng KS-80**, cần hợp nhất) · DEC-01…DEC-14 cũ (xem OID).

---

## Việc mở khóa sau khi chốt
- **DEC-16 + DEC-15** → khởi động **P2** (đề xuất BR atomic cho 11 GAP luồng tích hợp + enrich 20 PARTIAL).
- **DEC-23 + DEC-24** → định hình cách đặc tả luồng + hạ tầng SFTP.
