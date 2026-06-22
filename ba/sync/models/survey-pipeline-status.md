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

---

## 2. Quyết định / rủi ro đang chờ (tổng hợp)

**Buổi 18/06 — 12 câu hỏi quyết định** (xem `PROPOSAL-18062026-enrichment.md` §6):
- 🔴 **DEC-07 / Q3** — Adapter Lido giới hạn 20 ký tự tên crew (16 tên + 4 group code) → ảnh hưởng matching PIC. Chờ lãnh đạo dự án.
- 🔴 **DEC-09 / Q1** — Vị trí tab "Ngưỡng Payload"/"Ngưỡng DAO": Quản lý chặng bay (PH4) hay PH5?
- **Q7** — Crew Download chỉ PIC (KS 18/06) vs cả tổ bay (sheet-08 §2) — mâu thuẫn nguồn.
- Q2, Q4, Q5, Q6, Q8, Q9, Q10, Q11, Q12 — còn lại trong §6.

---

## 3. Số liệu tích lũy

| Hạng mục | Hiện hành (đã chốt) | Đề xuất thêm (chờ duyệt) |
|---|---|---|
| FUNC PH1 | **219** (FUNC tới -319, v0.7) | — (đã áp dụng FUNC-295…319) |
| OID-TOSS-001 | **157 điểm** (148 mở / 5 đang xử lý / 4 chốt) | — (đã áp dụng +15) |
| Glossary | **v0.21** | — (đã áp dụng +14; EDTO đã có sẵn) |
| Wireframe wf-monitoring | v0.4 (§8 26 cột + §9 đối chiếu) | delta 18/06 (cảnh báo/ngưỡng) |
| Mockup prototype | v0.6 (Flight Dispatch 26 cột) | — |

---

## 4. Việc tiếp theo (next actions)
1. BA Lead **duyệt 12 quyết định** §6 của proposal 18/06.
2. Áp dụng phần không vướng quyết định: **FUNC-295…319 → SRS PH1 v0.7**, **15 điểm → OID**, **18 thuật ngữ → glossary** (sau confirm).
3. Làm rõ 🔴 DEC-07 (Adapter 20 ký tự) với lãnh đạo dự án.
4. Buổi 19/06 (khi có transcript): chạy `survey-report` → `survey-to-spec args:{meeting:"19062026"}`.

---

*Cập nhật bởi: workflow survey-to-spec (phase Status) + BA. Lần cập nhật gần nhất: 2026-06-22.*
