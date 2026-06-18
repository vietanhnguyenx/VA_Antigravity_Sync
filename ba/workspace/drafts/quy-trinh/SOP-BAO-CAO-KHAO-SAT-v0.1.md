---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
status: "Draft"
document_type: "SOP — Quy trình lập Báo cáo Khảo sát (Survey/Discovery Report)"
document_id: "SOP-BCKS-001"
---

# SOP — Quy trình lập Báo cáo Khảo sát (Discovery)

> Quy trình chuẩn để biến **transcript phỏng vấn/khảo sát (ASR)** thành **Báo cáo Khảo sát** chất lượng, nhất quán. Tổng hợp từ thực tế các buổi 08/06, 09/06, 11/06. Áp dụng cho mọi buổi khảo sát tiếp theo.
>
> **Khác `meeting-synthesize` skill:** skill xử lý kỹ thuật ASR; SOP này quy định **đầu ra nghiệp vụ = Báo cáo Khảo sát** (cấu trúc Yêu cầu / Thảo luận–Đề xuất / Kết luận) + các bước hậu xử lý (OID, glossary).

## 1. Nguyên tắc nền (CLAUDE.md §0 + memory)
- **Transcript là nguồn gốc tuyệt đối** — chỉ tái tạo trung thực điều được nói; **KHÔNG suy diễn**. ([[feedback-source-transcript-first]])
- **domain-knowledge chỉ để làm rõ + sửa lỗi ASR**, không thêm nội dung ngoài transcript. ([[feedback-answer-from-domain-knowledge]])
- Mọi đoạn nghe không rõ → **giữ nguyên + gắn cờ `[cần xác nhận]`**.
- Đầu ra 100% tiếng Việt; thuật ngữ kỹ thuật giữ tiếng Anh trong ngoặc lần đầu (CLAUDE.md §7).
- **Khách hàng trước, glossary sau**; viết tắt nội bộ chưa rõ → gắn cờ. ([[feedback-terminology-customer-first]])

## 2. Đầu vào
- Transcript trong `ba/workspace/input/Customer_docs/meeting-notes/<DDMMYYYY>/` (ưu tiên bản `_fixed` nếu có; nếu chỉ có `.srt`/`.txt` thô → đọc thẳng bản `.txt` dày).
- Một buổi có thể có **nhiều part** (Part1, Part2…) → đọc HẾT, sau đó **gộp thành 1 báo cáo "buổi sáng/chiều"** (như 11/06).
- **Bản ghi chép Cornell** của buổi (`GHI-CHEP-<DDMMYYYY>-<buoi>.md` nếu có) — đầu vào bổ trợ giúp phân loại chủ đề và bắt sớm các điểm mở; xem `SOP-GHI-CHEP-DU-AN-v0.1.md` §4. Transcript vẫn là nguồn gốc tuyệt đối, bản ghi Cornell không thay thế transcript.

## 3. Các bước thực hiện

| # | Bước | Mô tả |
|---|---|---|
| 1 | **Đọc toàn bộ transcript theo trang** | File lớn (vài nghìn dòng) → đọc hết các trang, không kết luận từ 1 trang. |
| 2 | **Sửa lỗi ASR bằng domain-knowledge** | Đối chiếu `toss-glossary-v0.1.md` + thư mục `domain-knowledge/`; map cụm sai → thuật ngữ đúng; cụm nhập nhằng để cờ. |
| 3 | **Phân loại nội dung theo CHỦ ĐỀ** | Mỗi chủ đề nghiệp vụ = 1 mục §II, gồm 3 phần: **Yêu cầu** / **Thảo luận – Đề xuất** / **Kết luận**. |
| 4 | **Soạn báo cáo** theo cấu trúc §4 | Frontmatter đầy đủ + cảnh báo chất lượng ASR ở §I. |
| 5 | **Kiểm tra domain** | Nếu transcript/ tài liệu thuộc dự án khác (sai domain) → DỪNG, gắn cờ, báo BA Lead (bài học BBKS/BBLV-UBCKNN, "Quy trình sửa chữa tàu"). |
| 6 | **Lưu file** theo §5. |
| 7 | **Hậu xử lý** (BẮT BUỘC) theo §6: cập nhật OID + đề xuất glossary. |

## 4. Cấu trúc Báo cáo (chuẩn)
- **Frontmatter YAML:** project, author "BA Lead", version "0.1", date (ngày lập), survey_date (ngày khảo sát), status "Draft", document_type "Báo cáo Khảo sát (Discovery) — <đối tượng> <buổi> <ngày>".
- **I. Thông tin chung:** thời gian, mục đích, đối tượng phỏng vấn, phía khảo sát, phạm vi báo cáo + **cảnh báo chất lượng ASR**.
- **II. Nội dung trao đổi:** chia theo **chủ đề**; mỗi chủ đề: **Yêu cầu** (hiện trạng + nhu cầu) / **Thảo luận – Đề xuất** / **Kết luận**.
- **III. Các nội dung đã thống nhất:** bảng đánh số.
- **IV. Vấn đề cần làm rõ:** các điểm mở / `[cần xác nhận]`.
- **V. Thuật ngữ đề xuất bổ sung domain-knowledge:** bảng (Thuật ngữ | Mô tả từ ngữ cảnh | Nguồn dòng). **CHỈ đề xuất — chưa ghi glossary** (chờ confirm, [[feedback-glossary-confirm-before-write]]).
- (Gộp nhiều part: nêu rõ "chủ đề 1–n thuộc Part1, n+1… thuộc Part2".)

## 5. Lưu trữ & đặt tên
- Thư mục: `ba/workspace/drafts/phan-tich/bao-cao-khao-sat/`.
- Tên: `BAO-CAO-KHAO-SAT-<DDMMYYYY>-<buoi>-v0.1.md` (vd `…-12062026-buoi-sang-v0.1.md`).
- Nếu một buổi nhiều part → **1 file gộp** (xóa các file part lẻ sau khi gộp, cập nhật tham chiếu — như 11/06).

## 6. Hậu xử lý sau mỗi báo cáo (BẮT BUỘC)
1. **Cập nhật sổ OID** `SO-THEO-DOI-DIEM-CHOT` ([[feedback-track-open-items-after-meetings]]):
   - Đối chiếu §IV báo cáo mới với OID → điểm đã trả lời đổi 🟢 + ghi kết quả/ngày; thêm điểm mở mới (gắn ID kế tiếp theo nhóm QĐ/SME/KS/DL/HC); ghi rõ điểm mở của buổi trước có được làm rõ không.
   - Bump version OID + changelog.
2. **Đề xuất bổ sung glossary** ([[feedback-enrich-asr-dictionary]]): trình bảng §V → chờ BA Lead confirm → mới ghi `toss-glossary-v0.1.md` (1 file chung).
3. **Báo cáo nhanh BA Lead:** thống kê (số chủ đề / thống nhất / điểm cần làm rõ / thuật ngữ đề xuất) + điểm mở buổi trước được/không được làm rõ.

## 7. Checklist phát hành
- [ ] Đọc hết các part; gộp 1 báo cáo buổi.
- [ ] Mỗi chủ đề đủ Yêu cầu / Thảo luận–Đề xuất / Kết luận.
- [ ] Mọi đoạn nhiễu/viết tắt chưa rõ đã gắn `[cần xác nhận]`.
- [ ] §III, §IV, §V đầy đủ.
- [ ] Đã kiểm tra domain (không lẫn dự án khác).
- [ ] Đã cập nhật OID + trình thuật ngữ glossary.

## 8. Liên kết
- Skill kỹ thuật ASR: `.claude/skills/meeting-synthesize/`.
- Sổ điểm chốt: `SO-THEO-DOI-DIEM-CHOT-v0.1.md`.
- Glossary: `ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md`.
- Báo cáo mẫu: `bao-cao-khao-sat/BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md`.

---

*SOP-BCKS-001 v0.1 — 2026-06-12. Tổng hợp quy trình lập báo cáo khảo sát từ thực tế 08/06–11/06.*
