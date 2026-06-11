---
name: export-word
description: Xuất bộ tài liệu Markdown của dự án TOSS (SRS, Wireframe, BRD…) thành file Word .docx TỰ MÔ TẢ (không link .md nội bộ) và TRÌNH BÀY theo biểu mẫu chính thức Viettel QT02.BM.04 (Times New Roman, heading đen, bảng viền đen + header xám, logo + footer mã hiệu/số trang, mục lục tự động). Dùng khi người dùng muốn "xuất file Word", "đóng gói tài liệu giao khách hàng", "export docx", hoặc cần bản giao người (human-facing) từ các file .md nội bộ.
---

# Skill: Xuất Word chuẩn Viettel QT02.BM.04

> **Nguyên tắc cốt lõi:** Markdown là kênh **nội bộ giữa các agent**; file Word giao **người ↔ người** phải **tự mô tả đầy đủ** (không tham chiếu tệp `.md`) và **trình bày đúng biểu mẫu Viettel QT02.BM.04**. File `.md` nguồn **giữ nguyên link** (cho agent điều hướng); mọi biến đổi/định dạng chỉ áp **khi xuất**.

## 0.0. NỘI DUNG BẢN GIAO NGƯỜI — VĂN PHONG NGƯỜI (BẮT BUỘC)
Tài liệu giao người (báo cáo khảo sát, BRD, biên bản giao khách…) phải **đọc như do người viết**, không lộ dấu vết quy trình nội bộ/AI:
- **KHÔNG đối chiếu nội bộ:** bỏ mọi câu kiểu "đối chiếu glossary…", "khớp glossary/domain-knowledge", "→ glossary X", "xem `domain-knowledge/…`", trỏ memory `[[...]]`. Truy vết nội bộ chỉ để ở bản nháp/làm việc, KHÔNG đưa vào bản giao người.
- **KHÔNG ký hiệu kiểu AI:** không dùng mũi tên `→` thay câu, không emoji, không "✅/⚠", không gắn cờ `[cần xác nhận]` rải khắp — nếu cần lưu ý thì viết thành câu tự nhiên ("một số nội dung cần đối chiếu lại với người dự họp").
- **Văn phong người, cấu trúc theo loại tài liệu:** giọng BA tự tin, không lan man, không "mô tả theo hướng AI". Gạch đầu dòng/bảng ĐƯỢC dùng khi nội dung là liệt kê (vd báo cáo khảo sát nên **liệt kê trao đổi từng bên: "Bên VTIT trao đổi…", "Bên VNA trao đổi…", "Kết quả…"**). Điều cần tránh là **ký hiệu AI + đối chiếu nội bộ + cờ rải khắp**, KHÔNG phải tránh mọi gạch đầu dòng.
- Mã yêu cầu/hệ thống (TOSS-001, tên hệ thống) được nêu tự nhiên trong câu khi cần, không kèm chú thích trỏ nguồn nội bộ.

## 0. Quy tắc VERSION (BẮT BUỘC)
- Tên file ra **luôn kèm version + ngày**: `<Base>-v<Version>-<yyyy-MM-dd>.docx` (vd `SRS-TOSS-MES-S5-v2.1-2026-06-02.docx`).
- **KHÔNG ghi đè file cũ.** Khi **nội dung đã chốt** → **tăng version** (file mới); file cũ giữ làm lịch sử.
- Script `export-word.ps1` **từ chối ghi đè** nếu trùng tên (chỉ cho `-Force` khi đang nháp cùng version trong ngày).
- *(File hiện trong `ba/process/exports/` tên không có ngày là bản nháp cũ — bản chốt phải theo quy ước version trên.)*

## 1. Khi nào dùng
Khi cần tạo bản Word giao người từ ≥1 file `.md` (SRS, Wireframe, BRD, FRD…). Yêu cầu môi trường: **pandoc** (`C:\Users\VTIT\AppData\Local\Pandoc\pandoc.exe`) — nếu chưa có: `winget install --id JohnMacFarlane.Pandoc -e --scope user`.

## 2. Quy trình (5 bước — đã đóng gói vào script)
1. **Bỏ link nội bộ:** (a) đích link không phải `http(s)`/`mailto` → giữ nhãn; (b) bỏ path+đuôi `.md`/`.html` (giữ `.xlsx`/`.docx` nguồn thật); (c) bỏ **stem tên-file** còn sót (slug dẫn đầu bằng số mục hoặc `wf-`). Bỏ YAML frontmatter từng file.
2. **Áp template** `.claude/templates/word-reference.docx` qua `--reference-doc` (style QT02 + letterhead) + mục lục `--toc`.
3. **(Template đã dựng sẵn)** — nếu cần dựng lại: `build-reference-template.ps1` (font/theme/bảng + header logo + footer mã hiệu/số trang).
4. **Vá logo header** vào docx (pandoc bỏ ảnh của reference): chèn `media/logo.png` + `header1.xml.rels` + `Default png` bằng `ZipArchive` 'Update'.
5. **QC** (đọc `document.xml`/`styles.xml`/`theme1.xml`) — phải PASS hết (xem §4).

## 3. Cách chạy
```powershell
# SRS
.\.claude\skills\export-word\scripts\export-word.ps1 `
  -SourceList "@.claude\skills\export-word\manifests\srs.txt" `
  -Title "SRS — Hệ thống MES Nhà máy S5 (TOSS)" `
  -Subtitle "Đặc tả Yêu cầu Phần mềm · trình bày theo QT02.BM.04" `
  -OutBase "SRS-TOSS-MES-S5" -Version "2.1" -TocDepth 3

# Wireframe
.\.claude\skills\export-word\scripts\export-word.ps1 `
  -SourceList "@.claude\skills\export-word\manifests\wireframe.txt" `
  -Title "WIREFRAME — Hệ thống MES Nhà máy S5 (TOSS)" `
  -Subtitle "Wireframe theo phân hệ · trình bày theo QT02.BM.04" `
  -OutBase "WIREFRAME-TOSS-MES-S5" -Version "1.0" -TocDepth 2
```
`-SourceList` nhận `@<tệp manifest>` (mỗi dòng 1 path, `#` = chú thích) hoặc chuỗi path ngăn cách dấu phẩy. Cập nhật manifest khi thêm/bớt/đổi thứ tự file.

## 4. Checklist QC (script tự kiểm, phải PASS hết)
- `.md` = 0 · `](` (link markdown) = 0 · **slug tên-file = 0** · không lọt khóa YAML · không mojibake.
- Gói OPC: entry dùng `/` (**không `\`**) · có `media/logo.png` + `header1.xml` + `footer1.xml` + field TOC.
- **FONT đồng bộ:** mọi `w:ascii`/theme = **Times New Roman** (`Aptos`/`Calibri`/`Cambria` = 0); chỉ `Consolas` và chỉ ở code/verbatim.
- XML well-formed · đủ các mục/section mong đợi.

## 5. BÀI HỌC — các sai sót đã gặp (đừng lặp lại)
| # | Sai sót | Nguyên nhân | Cách đúng |
|---|---|---|---|
| 1 | Word còn link `.md` chết | md là kênh agent, không strip khi xuất | Strip link nội bộ; verify `.md`=0 |
| 2 | Lọt **stem tên-file** ("3.1-phan-he-quan-ly-kho") | nhãn link chính là tên file (TOC/bảng cấu trúc) | `StripSlugs` chỉ gỡ slug dẫn đầu **số mục/`wf-`** (giữ `end-to-end`, `low-fidelity`, `MO-2026-012`) |
| 3 | Gói docx hỏng, `GetEntry` lỗi | `ZipFile::CreateFromDirectory` (.NET Framework) ghi entry bằng `\` | Đóng gói thủ công `CreateEntry(rel.Replace('\\','/'))` |
| 4 | Logo header mất trong file ra | **pandoc bỏ ảnh** khi copy header từ reference | Hậu xử lý: chèn lại `media/logo.png` + `header1.xml.rels` + `png` content-type |
| 5 | **Font không đồng bộ** (Heading3-9/Subtitle/TOC ra Aptos) | theme pandoc = `Aptos`; style tham chiếu theme rơi về Aptos dù docDefaults là TNR | **Sửa `theme1.xml` latin major+minor = Times New Roman** (giữ Consolas cho code) |
| 6 | QC sót | chỉ kiểm rò rỉ, **quên kiểm font** | QC kiểm CẢ font (§4) |
| 7 | Ghi đè file đã chốt | tên file không có version/ngày | Tên `...-v<ver>-<ngày>.docx`, không ghi đè |

## 6. Tài sản skill
- `scripts/export-word.ps1` — xuất + transform + pandoc + vá + QC (tên file theo version).
- `scripts/build-reference-template.ps1` — dựng lại mẫu `.claude/templates/word-reference.docx`.
- `assets/viettel-logo.png` — logo Viettel (lấy từ QT02 `image1.png`).
- `manifests/srs.txt`, `manifests/wireframe.txt` — danh sách file theo thứ tự.

> Chuẩn trình bày (phân tích từ QT02.BM.04): Times New Roman 12pt; heading TNR đậm ĐEN 14/13/12pt; bảng viền đen 0.5pt + header nền Xám nhạt `#D9D9D9`; header logo + "Tài liệu thiết kế chi tiết · vx.x"; footer "BM.04 · QT.TKKDL.QTDL" + Trang PAGE/NUMPAGES; mục lục tự động; locale `vi-VN`.
