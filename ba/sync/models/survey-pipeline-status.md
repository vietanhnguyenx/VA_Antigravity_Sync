# Bảng theo dõi Pipeline Khảo sát → Đặc tả (Survey-to-Spec Status)

> **Mở file này để kiểm tra trạng thái & công việc đã thực hiện.**
> Cập nhật tự động bởi workflow `survey-to-spec` (phase Status) + bổ sung thủ công.
>
> **Ký hiệu stage:** ✅ xong · 🔄 đang làm · ⏳ chờ duyệt · ⛔ chặn · — chưa làm / không áp dụng
>
> Liên kết: sổ điểm chốt [OID-TOSS-001](../../workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md) · [deliverable-status.json](deliverable-status.json)

---

## 1. Tiến độ theo buổi khảo sát

| Buổi KS | Báo cáo KS | Đối chiếu nguồn | Proposal | Áp dụng (SRS/WF/OID/Gloss) | Commit | Quyết định chờ | Cập nhật |
|---|---|---|---|---|---|---|---|
| 08/06 | ✅ v0.2 | — | — | — | ✅ | — | 2026-06-16 |
| 09/06 | ✅ v0.3 | — | — | — | ✅ | — | 2026-06-16 |
| 11/06 sáng | ✅ v0.1 | — | — | — | ✅ | — | 2026-06-16 |
| 11/06 chiều | ✅ v0.1 | — | — | — | ✅ | — | 2026-06-16 |
| 11/06 KTKTB | ✅ v0.1 | — | — | — | ✅ | — | 2026-06-16 |
| 12/06 sáng | ✅ v0.1 | — | — | — | ✅ | — | 2026-06-16 |
| 15/06 | ✅ v0.1 | — | — | — | ✅ | — | 2026-06-16 |
| **17/06** | ✅ v0.3 | ✅ (Function list + YCKT) | n/a (làm trực tiếp) | ✅ SRS FUNC-277…294 · OID +10 · Glossary v0.20 · WF v0.4 · Mockup v0.6 | ✅ (6 commit) | 0 | 2026-06-18 |
| **18/06** | ✅ v0.1 | ✅ (YCKT + WF/SRS) | ✅ `PROPOSAL-18062026-enrichment.md` | 🟡 phần không-vướng-QĐ: ✅ OID +15 · ✅ Glossary v0.21 · ✅ SRS PH1 v0.7 (FUNC-295…319, gắn cờ); còn 12 QĐ chờ | (chờ) | **12** (§6) + 2 🔴 | 2026-06-22 |
| **19/06** | ✅ v0.1 | ✅ (Ops++ extracted + drawio + YCKT + đối chiếu BRD `DOI-CHIEU-KS-BRD-1719-2026-06-23.md`) | — (đối chiếu thay proposal) | ✅ Glossary v0.22 (MVT/MVA/DIV/LDM) · ✅ kết nối Google Sheet "Thông tin tích hợp" live (24 luồng) · ✅ OID v0.17 (+10 DEC, +2 SME, +6 KS) · 🟡 báo cáo cập nhật SFTP/FMM | ✅ | **10** (DEC-15…DEC-24) + 1 🔴 (DEC-16 mâu thuẫn nguồn MEL/CDL) | 2026-06-23 |

> **Lần đối chiếu KS↔BRD (17–19/06) hoàn tất 23/06/2026** — xem `ba/workspace/drafts/phan-tich/02-khao-sat/DOI-CHIEU-KS-BRD-1719-2026-06-23.md` (43 chủ đề: 12 COVERED / 20 PARTIAL / 11 GAP; đề xuất 33 BR mới: 10 cho PH1, 1 cho PH2, 12 cho PH4, 10 cho PH5; 10 điểm BA Lead cần quyết D-1…D-10 đã đẩy thành DEC-15…DEC-24 trong OID v0.17).

---

## 2. Quyết định / rủi ro đang chờ (tổng hợp)

**Buổi 18/06 — 12 câu hỏi quyết định** (xem `PROPOSAL-18062026-enrichment.md` §6):
- 🔴 **DEC-07 / Q3** — Adapter Lido giới hạn 20 ký tự tên crew (16 tên + 4 group code) → ảnh hưởng matching PIC. Chờ lãnh đạo dự án.
- 🔴 **DEC-09 / Q1** — Vị trí tab "Ngưỡng Payload"/"Ngưỡng DAO": Quản lý chặng bay (PH4) hay PH5?
- **Q7** — Crew Download chỉ PIC (KS 18/06) vs cả tổ bay (sheet-08 §2) — mâu thuẫn nguồn.
- Q2, Q4, Q5, Q6, Q8, Q9, Q10, Q11, Q12 — còn lại trong §6.

**Đối chiếu KS↔BRD 23/06 — 10 câu hỏi quyết định** (xem `DOI-CHIEU-KS-BRD-1719-2026-06-23.md` §4 D-1…D-10 ↔ OID DEC-15…DEC-24):
- 🔴 **DEC-16 / D-2** — Mâu thuẫn nguồn cấp MEL/CDL cho OPS++: KS 17/06 chốt TOSS là hub forward AMOS → OPS++; bảng tích hợp 23/06 lại ghi MEL Item và Ground Event là kết nối trực tiếp AMOS ↔ NetOps++, không qua TOSS. Cần BA Lead chốt với VNA (rủi ro thiết kế phân hệ).
- **DEC-15 / D-1** — Phạm vi BR cho 11 GAP nghiêm trọng trong 24 luồng OPS++: BR atomic (BR-557…566) hay giữ BR data contract chung BR-528a/530.
- **DEC-17 / D-3** — Phạm vi "TOSS xử lý dữ liệu nội bộ sau khi nhận từ OPS++" — VNA nói không thuộc scope NetLine nhưng vẫn phải làm.
- **DEC-18 / D-4** — Hạ BR-127 từ Could → Must (ATC FPL 5 thành phần).
- **DEC-19 / D-5** — Khung 2 mức (75/60, 90/75) vs khung OFP 3 mức (210/75/60, 270/90/75) tại BR-163.
- **DEC-20 / D-6** — Năm cutover NetLine cũ → OPS++ (~03/2027 ước tính).
- **DEC-21 / D-7** — 5 nhóm cố định AOG/MNT Code (AOC/Định kỳ/Line check/Bảo quản/Standby) trong source code.
- **DEC-22 / D-8** — Quy ước đặt tên file Plotting/Icing chart (trùng KS-80).
- **DEC-23 / D-9** — Tách BR-528a thành BR atomic ASM/ACH/SSIM riêng (vs giữ gộp).
- **DEC-24 / D-10** — BR cấu trúc thư mục SFTP Temp/Pickup/Archive là BR functional hay NFR/thiết kế tích hợp.

---

## 3. Số liệu tích lũy

| Hạng mục | Hiện hành (đã chốt) | Đề xuất thêm (chờ duyệt) |
|---|---|---|
| FUNC PH1 | **219** (FUNC tới -319, v0.7) | — (đã áp dụng FUNC-295…319) |
| OID-TOSS-001 | **179 điểm** v0.17 (168 mở / 7 đang xử lý / 4 chốt) | — (đã áp dụng +18: 10 DEC + 2 SME + 6 KS từ KS 19/06 + đối chiếu) |
| Glossary | **v0.22** (MVT/MVA/DIV/LDM) | — |
| BR đề xuất từ đối chiếu | — | **33 BR** (PH1: BR-193…207; PH2: BR-262; PH4: BR-460…465; PH5: BR-556…566) — chờ DEC-15 |
| Wireframe wf-monitoring | v0.4 (§8 26 cột + §9 đối chiếu) | delta 18/06 (cảnh báo/ngưỡng) |
| Mockup prototype | v0.6 (Flight Dispatch 26 cột) | — |

---

## 4. Việc tiếp theo (next actions)
1. BA Lead **duyệt 12 quyết định** §6 của proposal 18/06 + **10 quyết định** D-1…D-10 (DEC-15…DEC-24) của đối chiếu KS↔BRD 23/06 — tổng 22 quyết định chờ.
2. **Ưu tiên giải 🔴 DEC-16** (mâu thuẫn nguồn cấp MEL/CDL: 17/06 vs bảng tích hợp 23/06) với VNA trước khi đặc tả chi tiết PH4/PH5.
3. Áp dụng phần không vướng quyết định từ đối chiếu: nếu DEC-15 chốt theo hướng atomic → thêm BR-193…207 / BR-262 / BR-460…465 / BR-556…566 vào BRD tương ứng.
4. Làm rõ 🔴 DEC-07 (Adapter 20 ký tự) + 🔴 DEC-09 (vị trí tab Ngưỡng Payload/DAO) với lãnh đạo dự án.
5. Yêu cầu VNA: bảng Excel hoàn chỉnh 24 luồng trước thứ ba 24/06 (KS-87) + định dạng LHS từng luồng + mốc thời gian gửi/đồng bộ (KS-88, KS-90).

---

*Cập nhật bởi: workflow survey-to-spec (phase Status) + BA. Lần cập nhật gần nhất: 2026-06-23.*
