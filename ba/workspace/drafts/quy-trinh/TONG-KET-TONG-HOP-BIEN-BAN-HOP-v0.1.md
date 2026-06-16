---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead (agent-assisted)"
version: "0.1"
date: "2026-06-09"
status: "Draft"
document_type: "Quy trình / Tổng kết — Tổng hợp biên bản họp từ ghi âm (ASR)"
---

# Tổng kết: Năng lực Tổng hợp Biên bản Họp (từ ghi âm ASR)

> Tài liệu tổng kết toàn bộ phần việc đã thực hiện để **tổng hợp biên bản họp từ transcript bản ghi âm tự động (ASR)** và **xuất bản giao người (Word)** — gồm sản phẩm, công cụ, quy trình end-to-end và nguyên tắc.

## 1. Bối cảnh & mục tiêu
- Đầu vào là **transcript ASR chất lượng thấp** (file `.txt`/`.srt`), nhiều từ sai/nhiễu (vd "tầm phim"→FMS, "pháo sát"→khảo sát).
- Mục tiêu: chuyển transcript thành **biên bản họp chuẩn TOSS** (trung thực, truy vết được), rồi **xuất Word** chuẩn Viettel QT02.BM.04 để giao người.
- Ràng buộc cốt lõi (CLAUDE.md §0): **tái tạo trung thực, không suy diễn**; chỗ không rõ → giữ + gắn cờ `[cần xác nhận]`.

## 2. Sản phẩm đã tạo

| # | Sản phẩm | Vị trí | Ghi chú |
|---|---|---|---|
| 1 | **Biên bản họp 08/06/2026** (Markdown) | `ba/workspace/input/meeting-notes/MM-20260608-khao-sat-tong-quan-TOSS.md` | Tổng hợp từ part1+part2 (~163 phút); 16 nhóm thảo luận, DEC-002→014, 16 action items |
| 2 | **Biên bản họp 08/06/2026** (Word) | `ba/sync/output/human/exports/MM-20260608-khao-sat-tong-quan-TOSS-v1.0-2026-06-09.docx` | Chuẩn QT02.BM.04, QC PASS 10/10 |
| 3 | **Skill `meeting-synthesize`** | `.claude/skills/meeting-synthesize/SKILL.md` | Quy trình tổng hợp biên bản từ transcript ASR (8 bước) |
| 4 | **Script sửa lỗi WER domain** | `.claude/skills/meeting-synthesize/scripts/fix-asr-domain.ps1` | Post-processing tự sửa lỗi domain + báo cáo số lỗi |
| 5 | **Từ điển sửa lỗi ASR** | `.claude/skills/meeting-synthesize/assets/asr-domain-corrections.txt` | 25 cặp `sai \|\|\| đúng` (mở rộng dần) |

## 3. Quy trình end-to-end

```
Transcript ASR (.txt/.srt)
   │  (Bước 0) fix-asr-domain.ps1  → file _fixed + báo cáo lỗi
   ▼
Đọc transcript đã sửa (đọc HẾT các trang)
   │  + tham chiếu domain-knowledge / glossary
   ▼
Map lỗi còn lại theo ngữ cảnh + gắn cờ [cần xác nhận]
   ▼
Phân loại: Mục tiêu · Thảo luận · Quyết định (ai) · Action (deadline+người) · Câu hỏi · Rủi ro
   ▼
Xuất biên bản chuẩn TOSS  →  ba/workspace/input/meeting-notes/MM-YYYYMMDD-<chu-de>.md
   │  (export-word skill)
   ▼
Xuất Word QT02.BM.04  →  ba/sync/output/human/exports/<...>-v<ver>-<ngày>.docx
   ▼
(Bước 8) Làm giàu từ điển WER: thêm lỗi ASR mới vào asr-domain-corrections.txt
```

## 4. Cơ chế cải thiện WER (Word Error Rate)
- **Post-processing tự động:** áp từ điển `sai ||| đúng` theo cụm, không phân biệt hoa/thường; **có báo cáo** số lần sửa (minh bạch, không sửa âm thầm).
- **Hiệu quả thực đo (họp 08/06):** tự sửa **89 lỗi domain** trên ~3.700 cue — vd `tầng/tầm phim→FMS` (16), `pháo/thảo/bảo sát→khảo sát` (16), `mục mần→movement` (10), `quân phê tờ→performance factor` (8), `loadseed→loadsheet` (7)…
- **Tự tốt dần:** sau **mỗi** biên bản, thêm lỗi ASR mới đủ chắc vào từ điển (bước 8 bắt buộc; ghi nhớ tại memory `feedback-enrich-asr-dictionary`).
- **An toàn:** chỉ sửa cụm **rõ ràng**; cụm nhập nhằng (`siêu`→SITA, `video`→Lido) KHÔNG đưa vào từ điển — để agent gắn cờ theo ngữ cảnh.

## 5. Phân biệt công cụ
| Công cụ | Đầu vào | Dùng khi |
|---|---|---|
| Command `/meeting-notes` | **Ghi chú thô do người ghi** | Đã có note tay/bullet |
| Skill `meeting-synthesize` | **Transcript ASR (.txt/.srt) dài** | Có file ghi âm chuyển chữ |
| Skill `export-word` | **File `.md` biên bản** | Xuất Word giao người |

## 6. Bài học kỹ thuật (đã xử lý)
- **Đọc `.txt` dày, KHÔNG xử lý `.srt`:** cùng nội dung nhưng `.srt` tốn ~3× token (4 dòng/cue), không tăng độ chính xác.
- **Script `.ps1` cần BOM UTF-8:** PowerShell 5.1 đọc UTF-8 no-BOM thành mojibake → vỡ cú pháp (đã thêm BOM cho `fix-asr-domain.ps1`, `export-word.ps1`, `build-reference-template.ps1`).
- **Export Word:** cần pandoc (đã cài 3.10 tại `C:\Users\ANNG\AppData\Local\Pandoc\`); dấu `---` ngăn mục bị pandoc hiểu nhầm YAML → đã thêm `--from=markdown-yaml_metadata_block`.

## 7. Việc còn lại / cần xác nhận
- Rà soát các mục `[cần xác nhận]` trong biên bản 08/06 (người quyết định từng DEC, địa điểm, vài thuật ngữ: CLC, FOM, ToToPACK, BackPACK/"pgepoid").
- Nếu có **part tiếp theo** của ghi âm → ghép tiếp vào biên bản.
- WSL đang **read-only** (không ảnh hưởng năng lực này; chỉ cần khi `pdf-to-md`).

---
*Giới hạn chung: chất lượng biên bản phụ thuộc chất lượng ASR. Post-processing giảm lỗi domain nhưng KHÔNG thay thế việc đối chiếu người dự họp (CLAUDE.md §0).*
