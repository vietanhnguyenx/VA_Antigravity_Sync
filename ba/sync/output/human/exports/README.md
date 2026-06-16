---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Scaffold — ba/sync/output/human/exports"
status: "Active"
date: "2026-06-04"
---

# exports/ — Đầu ra Word/PDF Có Phiên bản (Giao Khách hàng)

## Mục đích

Lưu trữ các file Word (.docx) và PDF được xuất ra từ tài liệu Markdown để giao cho khách hàng / stakeholder. Mỗi file **tự mô tả đầy đủ** (không chứa link nội bộ) và **tuân thủ chuẩn Viettel QT02.BM.04**.

## Quy tắc đặt tên (BẮT BUỘC)

`<Base>-v<Version>-<YYYY-MM-DD>.docx`

Ví dụ:
- `SRS-TOSS-001-he-thong-dieu-hanh-v1.0-2026-06-04.docx`
- `BRD-TOSS-001-tong-the-v1.0-2026-06-04.docx`
- `WIREFRAME-TOSS-flight-ops-v1.0-2026-06-04.docx`

## Quy tắc versioning (BẮT BUỘC)

- **Không ghi đè** file đã xuất — mỗi lần cập nhật tạo file mới với version tăng.
- File cũ giữ lại làm lịch sử.
- Dùng skill `export-word` để xuất — script tự từ chối ghi đè trừ khi `-Force`.

## Tiêu chuẩn trình bày (QT02.BM.04)

| Yếu tố | Chuẩn |
|---|---|
| Font | Times New Roman 12pt (thân bài), Bold 14/13/12pt (H1/H2/H3) |
| Màu heading | Đen `#000000` |
| Bảng | Viền đen `#000000` 0.5pt; header xám `#D9D9D9` chữ đậm |
| Header trang | Logo Viettel + tên tài liệu + version |
| Footer trang | `BM.04 · QT.TKKDL.QTDL` + số trang |
| Mục lục | Tự động (`--toc`) |

## Quy trình xuất

```
1. Hoàn chỉnh .md tại sync/requirements/srs/ hoặc brd/
2. Chạy: scripts/export-word.ps1 -Manifest <manifest.json>
3. QC: kiểm tra không có link nội bộ, font nhất quán, logo hiện
4. Lưu tại thư mục này với tên đúng pattern
```

> Xem hướng dẫn chi tiết tại [`.claude/skills/export-word/SKILL.md`](../../../../../.claude/skills/export-word/SKILL.md).

## Liên kết

- Nguồn Markdown ← [`../../requirements/`](../../requirements/)
- Skill xuất Word → [`.claude/skills/export-word/`](../../../../../.claude/skills/export-word/)
- Template Word → [`.claude/templates/word-reference.docx`](../../../../../.claude/templates/word-reference.docx)
