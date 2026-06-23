# INDEX — Quy trình & quản trị BA (ba/workspace/drafts/quy-trinh)

> Đọc index này trước rồi mở đúng file cần (rule: đọc chọn lọc, không nạp cả thư mục).
>
> **Phân loại:** 🟢 Vận hành thường xuyên · 🔵 Tham chiếu khi cần · 📋 Tra cứu / điền liệu

---

## Vận hành hàng ngày 🟢

| File | Dòng | Mô tả |
|---|---|---|
| `SO-THEO-DOI-DIEM-CHOT-v0.1.md` | 203 | Sổ theo dõi điểm cần chốt & câu hỏi mở (OID) — cập nhật sau mỗi buổi họp |
| `GOI-QUYET-DINH-2026-06-23.md` | 60 | Gói quyết định ưu tiên trình BA Lead (từ đối chiếu KS↔BRD) — chọn các DEC gating tích hợp + 🔴 rủi ro, kèm câu hỏi soạn sẵn gửi VNA (DEC-16) |
| `CAU-HOI-VNA-TICH-HOP-2026-06-23.md` | 50 | Gói 21 câu hỏi tích hợp gửi VNA/NetOps (LHS) — gom KS-88…106 + D-11/12 theo nhóm (hạ tầng SFTP, định dạng luồng, cơ chế đồng bộ, trách nhiệm, phạm vi); mỗi câu kèm mã OID truy vết |
| `TON-DONG-2026-06-23.md` | ~170 | Báo cáo tồn đọng & nhắc việc (PC tổng hợp 23/06): A1 22 DEC + 12 QĐ + L-1…L-8 · A2 19/21 câu VNA còn mở · A4 3 đầu việc agent chờ mở khóa · A5 7/7 deliverable `passes:false` · Top 5 P0/gating + rủi ro treo lâu |
| `SOP-BAO-CAO-KHAO-SAT-v0.1.md` | 77 | SOP lập báo cáo khảo sát Discovery — trỏ từ skill `survey-report` |
| `SOP-GHI-CHEP-DU-AN-v0.1.md` | 171 | SOP ghi chép: Markdown phân lớp, Cornell ghi meeting, Mermaid luồng nghiệp vụ |
| `SOP-THAM-CHIEU-DOMAIN-KNOWLEDGE-v0.1.md` | 54 | Vòng lặp tra KB đúng điểm, không đọc nền; cập nhật dần khi có mẹo mới |

## Phân công & phạm vi 🟢

| File | Dòng | Mô tả |
|---|---|---|
| `PHAN-CONG-ROLE-BA-v0.1.md` | 226 | Ma trận role × skill × phân hệ × quyền workspace — CLAUDE.md §0.4 trỏ tới |
| `PHAN-TACH-PHAM-VI-WORKFLOW-v0.5.md` | ~224 | Phân tách phạm vi & workflow theo role (bản hiện hành) |
| `PIPELINE-AGENT-v0.1.md` | — | 12 agent theo thứ tự bàn giao: BA (1–5) + DEV (6–12); checkpoint review; quy tắc kích hoạt |

## Tiến độ dự án 📋

| File | Nội dung |
|---|---|
| [tien_do/INDEX.md](tien_do/INDEX.md) | Danh sách bản đánh giá tiến độ theo version |
| [tien_do/DANH-GIA-TIEN-DO-v0.1-2026-06-17.md](tien_do/DANH-GIA-TIEN-DO-v0.1-2026-06-17.md) | v0.1 — đánh giá lần đầu 17/06: Phase 1 70% · Phase 2 55% · Phase 3 25% |

## Theo dõi & stakeholder 📋

| File | Dòng | Mô tả |
|---|---|---|
| `STAKEHOLDER-REGISTER-v0.2.md` | 131 | Danh sách stakeholder: vai trò, kỳ vọng, RACI, kênh liên lạc |
| `BA-ROADMAP-v0.1.md` | 139 | Lộ trình BA 5 phase — baseline tiến độ |

## Template & log 📋

| File | Dòng | Mô tả |
|---|---|---|
| `BA-SESSION-LOG-TEMPLATE-v0.1.md` | 155 | Template nhật ký phiên BA (tự sinh bởi agent sau mỗi phiên) |
| `BA-VERSION-LOG.md` | — | Nhật ký version tập trung — mọi lịch sử thay đổi tài liệu ghi ở đây, không nhúng vào file nội dung |

## Quản trị & cổng chất lượng 🔵

> Tra cứu khi cần — không dùng hàng ngày; giá trị governance còn nguyên.

| File | Dòng | Dùng khi |
|---|---|---|
| `SOP-LUONG-TAI-LIEU-v0.1.md` | 135 | Không chắc bước tiếp theo trong vòng đời tài liệu |
| `CHANGE-CONTROL-SOP-v0.1.md` | 138 | Có Change Request từ stakeholder sau khi tài liệu đã Approved |
| `QUALITY-GATE-v0.1.md` | 104 | Trước khi promote Draft → `ba/sync/` |
| `DEFINITION-OF-DONE-v0.1.md` | 124 | Tự kiểm trước khi gửi peer review |
| `REVIEW-APPROVAL-FLOW-v0.1.md` | 92 | Cần biết ai approve loại tài liệu nào |
| `MEETING-CADENCE-v0.1.md` | 131 | Lập kế hoạch lịch họp định kỳ |
| `ONBOARDING-GUIDE-v0.1.md` | 133 | Khi có thành viên mới gia nhập team BA |

---

## Thứ tự đọc cho thành viên mới

```
1. CLAUDE.md + HUMAN.md              → Nắm toàn bộ framework & quy tắc dự án
2. BA-ROADMAP-v0.1.md                → Biết đang ở phase nào, làm gì tiếp
3. PHAN-CONG-ROLE-BA-v0.1.md         → Biết vai trò và quyền hạn của mình
4. ONBOARDING-GUIDE-v0.1.md          → Hướng dẫn từng bước thiết lập môi trường
5. SOP-LUONG-TAI-LIEU-v0.1.md        → Quy trình vòng đời tài liệu hàng ngày
6. DEFINITION-OF-DONE-v0.1.md        → Tiêu chí hoàn thành từng loại artifact
7. STAKEHOLDER-REGISTER-v0.2.md      → Biết ai là ai, liên lạc thế nào
8. toss-glossary-v0.1.md             → Tra thuật ngữ khi gặp khái niệm lạ
```

---

_Cập nhật: 2026-06-17 · Xóa 4 file lỗi thời (PHAN-TACH-PHAM-VI-WORKFLOW-v0.1, STAKEHOLDER-REGISTER-v0.1, TONG-KET-TONG-HOP-BIEN-BAN-HOP-v0.1, QUY-TRINH-BA-TONG-HOP-v0.1); thêm thư mục tien_do/_
