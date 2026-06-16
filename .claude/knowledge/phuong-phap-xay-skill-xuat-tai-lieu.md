# Phương pháp xây dựng Skill Xuất Tài liệu (Markdown → Word chuẩn doanh nghiệp)

> **Mục đích tài liệu:** Tổng hợp **phương pháp** (cách nghĩ + cách làm) để xây một skill xuất tài liệu giao người từ các file Markdown nội bộ, lấy từ chính skill `export-word` của dự án.
> **Nguồn trích:** `.claude/skills/export-word/SKILL.md`, `scripts/export-word.ps1`, `scripts/build-reference-template.ps1`, `manifests/srs.txt`, và `CLAUDE.md` §8. Mọi khẳng định dưới đây đều truy vết về các file này — không suy diễn thêm.
> **Phạm vi:** Đây là tài liệu tham chiếu kỹ thuật (reusable), không phải deliverable nghiệp vụ. Có thể tái dùng cho mọi biểu mẫu doanh nghiệp khác (đổi mẫu, đổi font, đổi letterhead).

---

## 1. Triết lý cốt lõi (quyết định mọi thiết kế còn lại)

| Nguyên tắc | Diễn giải | Nguồn |
|---|---|---|
| **Hai kênh tách biệt** | Markdown là kênh **nội bộ giữa các agent**; Word là bản giao **người ↔ người**. Hai kênh có yêu cầu khác nhau nên xử lý khác nhau. | SKILL.md (đầu file) |
| **Word phải TỰ MÔ TẢ** | Bản Word không được tham chiếu tệp `.md` nội bộ (link chết với người đọc). Mọi cross-reference phải thành chữ thường ("xem mục 4.6"). | SKILL.md §0, CLAUDE.md §8.1 |
| **Nguồn .md giữ nguyên** | File `.md` gốc **không bị sửa** — vẫn giữ link cho agent điều hướng. Mọi biến đổi/định dạng chỉ áp **tại thời điểm xuất**. | export-word.ps1 (comment dòng 46) |
| **Trình bày đúng biểu mẫu thật** | Style được phân tích từ biểu mẫu chính thức (ở đây: Viettel `QT02.BM.04`), không tự chế. | SKILL.md §7, build-reference-template.ps1 (đặc tả) |

> Đây là điểm mấu chốt: skill **không "render Markdown ra Word" một cách ngây thơ**, mà là một **pipeline biến đổi có chủ đích** để bản giao người vừa sạch (tự mô tả) vừa đúng chuẩn trình bày.

---

## 2. Bài toán mà skill phải giải

Một skill xuất tài liệu "giao người" phải xử lý đồng thời **4 nhóm yêu cầu**:

1. **Tự mô tả (self-contained):** loại bỏ mọi link/tham chiếu nội bộ mà người đọc không mở được.
2. **Trình bày chuẩn biểu mẫu:** font đồng bộ, heading đúng cấp, bảng đúng viền/nền, letterhead (logo + footer mã hiệu + số trang), mục lục tự động.
3. **Quản lý phiên bản (versioning):** tên file luôn kèm version + ngày; **không ghi đè** bản đã chốt.
4. **Kiểm soát chất lượng (QC) tự động:** sau khi xuất phải tự kiểm và **PASS hết** trước khi giao.

> Bốn nhóm này chính là 4 "trục" mà mọi quyết định kỹ thuật trong skill phục vụ.

---

## 3. Kiến trúc skill (cấu trúc + vai trò từng thành phần)

```
.claude/skills/export-word/
├── SKILL.md                          # Hợp đồng vận hành: khi nào dùng, cách chạy, QC, bài học
├── scripts/
│   ├── export-word.ps1               # Pipeline xuất: transform → pandoc → vá logo → QC
│   └── build-reference-template.ps1  # Dựng MẪU Word (reference.docx) theo biểu mẫu
├── assets/
│   └── viettel-logo.png              # Logo letterhead (trích từ image1.png của biểu mẫu)
└── manifests/
    ├── srs.txt                       # Danh sách file .md theo THỨ TỰ ghép (1 path/dòng, # = chú thích)
    └── wireframe.txt
```

Phụ thuộc bên ngoài skill:
- `.claude/templates/word-reference.docx` — **mẫu tham chiếu** (sản phẩm của `build-reference-template.ps1`), dùng qua `pandoc --reference-doc`.
- `pandoc` — bộ chuyển đổi Markdown→docx (`winget install --id JohnMacFarlane.Pandoc -e --scope user`).

**Nguyên tắc phân vai 2 script (quan trọng để tái dùng):**
- `build-reference-template.ps1` chạy **một lần / khi đổi style** → tạo ra `word-reference.docx`. Đây là nơi "đóng băng" toàn bộ quy ước trình bày.
- `export-word.ps1` chạy **mỗi lần xuất** → chỉ lo nội dung + áp mẫu + QC. Tách như vậy để đổi style không phải đụng pipeline, và ngược lại.

---

## 4. Pipeline xuất — 5 bước (đóng gói trong `export-word.ps1`)

> Nguồn: SKILL.md §2 và thân `export-word.ps1`.

### Bước 1 — Biến đổi từng file .md để "tự mô tả"
Áp 4 hàm transform theo thứ tự `StripFrontmatter → CleanLinks → StripMdTokens → StripSlugs`:

| Hàm | Việc làm | Lý do |
|---|---|---|
| `StripFrontmatter` | Bỏ khối YAML `---…---` đầu mỗi file | Tránh lọt khóa `document_type:`, `project:`… vào bản giao |
| `CleanLinks` | `[nhãn](đích)` → giữ **nhãn**, bỏ đích **nếu đích không phải `http(s)`/`mailto`** | Link nội bộ chết với người đọc; link web thật thì giữ |
| `StripMdTokens` | Bỏ `path/…/ten-file.md` (và `.html`) → còn lại basename; **không đụng `.xlsx`/`.docx`** | Xoá vết đường dẫn file nội bộ; giữ tên tài liệu nguồn thật |
| `StripSlugs` | Bỏ **stem tên-file còn sót** (slug dẫn đầu bằng **số mục** `3.1-…` hoặc tiền tố `wf-`) | Nhãn link trong TOC/bảng cấu trúc chính là tên file; phải gỡ |

> **Mẹo chống "bắt nhầm" của `StripSlugs`:** chỉ gỡ slug **dẫn đầu bằng số mục hoặc `wf-`**, nhờ vậy **không** đụng tới các từ tiếng Anh có gạch nối hợp lệ (`end-to-end`, `low-fidelity`) hay mã định danh (`MO-2026-012`, `BATCH-2026-…`). Đây là bài học #2 (xem §6).

### Bước 2 — Ghép & áp mẫu qua pandoc
- Ghép các file đã transform thành 1 Markdown tạm, chèn tiêu đề + dòng phụ đề `*Subtitle · v<Version> · <ngày>*`, ngăn cách bằng `---`.
- Gọi: `pandoc <tmp.md> --reference-doc="word-reference.docx" -o <out.docx> --toc --toc-depth=<N>`.
- `--reference-doc` mang toàn bộ style + letterhead; `--toc` sinh mục lục tự động.

### Bước 3 — (Mẫu đã dựng sẵn)
Không làm gì nếu `word-reference.docx` đã có. Chỉ chạy lại `build-reference-template.ps1` khi đổi style/letterhead (xem §5).

### Bước 4 — Vá logo header vào docx
**Pandoc loại bỏ ảnh trong header của reference** khi xuất. Phải hậu xử lý: mở docx ở chế độ `ZipArchive 'Update'` rồi chèn lại:
- `word/media/logo.png` (đọc từ template),
- `word/_rels/header1.xml.rels` (quan hệ rId1 → media/logo.png),
- `<Default Extension="png" …>` vào `[Content_Types].xml`.

### Bước 5 — QC tự động (phải PASS hết)
Đọc lại `document.xml` / `styles.xml` / `theme1.xml` trong docx vừa xuất và kiểm toàn bộ checklist §7. Nếu có mục FAIL → `exit 1`, phải sửa và xuất lại.

**Versioning (xuyên suốt):** tên file ra **luôn** là `<OutBase>-v<Version>-<yyyy-MM-dd>.docx`; script **từ chối ghi đè** nếu trùng tên, trừ `-Force` (chỉ dùng khi đang nháp cùng version trong ngày). Nội dung đã chốt → **tăng version** (file mới, giữ file cũ làm lịch sử). Nguồn: SKILL.md §0, export-word.ps1 (dòng 40–44).

---

## 5. Cách dựng MẪU tham chiếu (`build-reference-template.ps1`) — kỹ thuật OOXML

> Đây là phần "khó" nhất — thao tác trực tiếp lên các part XML bên trong gói `.docx` (OOXML/OPC). Nguồn: build-reference-template.ps1.

Quy trình:
1. Lấy mẫu gốc của pandoc: `pandoc --print-default-data-file reference.docx`, rồi **giải nén** (unzip) ra thư mục tạm.
2. **`word/styles.xml`** — đặt quy ước trình bày:
   - `docDefaults` → font **Times New Roman**, cỡ chữ thân 12pt (`w:sz=24` = half-points), locale `vi-VN`; căn đều (`jc=both`), giãn dòng 1.5.
   - Heading 1/2/3 → TNR **đậm ĐEN** (`w:color=000000`, bỏ màu theme accent), cỡ ~14/13/12pt, căn trái, có `keepNext/keepLines`.
   - Style **Table** mặc định → viền đen đơn 0.5pt (`w:sz=4`) tất cả cạnh; **hàng tiêu đề** (`firstRow`) nền **Xám nhạt `D9D9D9`** + chữ đậm đen.
3. **`word/theme/theme1.xml`** — **(CRITICAL)** đổi `<a:latin>` **major + minor** sang **Times New Roman**. Lý do: pandoc đặt theme = `Aptos`; các style tham chiếu theme (Heading3–9, Subtitle, caption, TOC) sẽ **rơi về Aptos** dù `docDefaults` đã là TNR → font không đồng bộ. Đây là bài học #5.
4. **Letterhead** — tạo `word/header1.xml` (logo `wp:inline` + tiêu đề "Tài liệu thiết kế chi tiết · vx.x"), `word/footer1.xml` (text "BM.04 · QT.TKKDL.QTDL" + field `PAGE`/`NUMPAGES`), kèm `word/_rels/header1.xml.rels`, copy `assets/viettel-logo.png` → `word/media/logo.png`. Khai báo override trong `[Content_Types].xml`, thêm `<w:headerReference>`/`<w:footerReference>` vào `sectPr` của `document.xml` (script này còn đặt khổ **ngang/landscape** + lề theo biểu mẫu).
5. **Đóng gói lại OOXML — bằng dấu `/`:** **KHÔNG dùng** `ZipFile::CreateFromDirectory` (trên .NET Framework nó ghi entry bằng `\` → hỏng gói OPC). Phải duyệt file thủ công và `CreateEntry(rel.Replace('\\','/'))`. Đây là bài học #3.

> **Giữ `Consolas` cho code/verbatim:** chỉ font code mới được khác TNR; mọi nơi khác phải TNR.

---

## 6. Tập "BÀI HỌC" — 7 sai sót đã gặp & cách phòng

> Nguồn: SKILL.md §5. Đây là **tài sản giá trị nhất** khi tái dựng skill — mỗi dòng là một lỗi đã trả giá.

| # | Sai sót | Nguyên nhân gốc | Cách đúng |
|---|---|---|---|
| 1 | Word còn link `.md` chết | md là kênh agent, quên strip khi xuất | Strip link nội bộ; QC `.md`=0 |
| 2 | Lọt **stem tên-file** ("3.1-phan-he-quan-ly-kho") | nhãn link chính là tên file (TOC/bảng cấu trúc) | `StripSlugs` chỉ gỡ slug dẫn đầu **số mục/`wf-`** (giữ `end-to-end`, `MO-2026-012`) |
| 3 | Gói docx hỏng, `GetEntry` lỗi | `ZipFile::CreateFromDirectory` ghi entry bằng `\` | Đóng gói thủ công `CreateEntry(rel.Replace('\\','/'))` |
| 4 | Logo header **mất** trong file ra | **pandoc bỏ ảnh** khi copy header từ reference | Hậu xử lý: chèn lại `media/logo.png` + `header1.xml.rels` + content-type `png` |
| 5 | **Font không đồng bộ** (Heading3-9/Subtitle/TOC ra Aptos) | theme pandoc = `Aptos`; style tham chiếu theme rơi về Aptos dù docDefaults là TNR | **Sửa `theme1.xml` latin major+minor = TNR** (giữ Consolas cho code) |
| 6 | QC sót lỗi font | chỉ kiểm rò rỉ link, **quên kiểm font** | QC phải kiểm **CẢ font** |
| 7 | Ghi đè file đã chốt | tên file không có version/ngày | Tên `…-v<ver>-<ngày>.docx`, không ghi đè |

---

## 7. Checklist QC (script tự kiểm — chuẩn PASS)

> Nguồn: SKILL.md §4 và khối QC trong export-word.ps1.

- **Sạch nội dung:** `.md` = 0 · `](` (link markdown) = 0 · **slug tên-file = 0** · không lọt khóa YAML · không mojibake (lỗi mã hoá tiếng Việt).
- **Gói OPC:** mọi entry dùng `/` (**không `\`**) · có `word/media/logo.png` + `word/header1.xml` + `word/footer1.xml` · có field TOC (`TOC \o`).
- **Font đồng bộ:** mọi `w:ascii` trong `styles.xml` và theme = **Times New Roman**; số lần xuất hiện `Aptos`/`Calibri`/`Cambria` = **0**; chỉ `Consolas` được phép, và chỉ ở code/verbatim.
- **Cấu trúc:** XML well-formed (parse được `document.xml`, `header1.xml`, `footer1.xml`, `[Content_Types].xml`) · đủ các mục/section mong đợi.

---

## 8. Quy trình TÁI DỰNG skill này cho biểu mẫu / dự án khác

> Tổng hợp từ các nguyên tắc trên — đây là "công thức" áp dụng lại, không phải logic mới.

1. **Lấy biểu mẫu thật** của tổ chức (vd `QT02.BM.04`). Phân tích: font thân/heading, màu heading, viền + nền header bảng, nội dung letterhead (logo, mã hiệu, footer), khổ giấy/lề.
2. **Trích logo** từ biểu mẫu (ảnh `word/media/imageN.png`) → bỏ vào `assets/`.
3. **Sửa `build-reference-template.ps1`** cho khớp đặc tả vừa phân tích: `styles.xml` (font/heading/bảng), `theme1.xml` (latin = font chuẩn — **bắt buộc**), `header1.xml`/`footer1.xml` (letterhead), khổ giấy/lề trong `sectPr`. Chạy script → ra `word-reference.docx` mới.
4. **Giữ nguyên `export-word.ps1`** (pipeline transform + pandoc + vá logo + QC ít phụ thuộc biểu mẫu) — chỉ chỉnh các tham số mặc định (`-OutDir`, `-Template`, đường dẫn `pandoc`) và, nếu cần, danh sách slug "đặc thù dự án" trong QC.
5. **Viết manifest** liệt kê các file `.md` theo đúng thứ tự ghép.
6. **Cập nhật `SKILL.md`**: phần "khi nào dùng", lệnh chạy mẫu, checklist QC, và **bổ sung bài học mới** nếu phát sinh.
7. **Chạy thử & QC**: xuất → đọc lại `document.xml`/`styles.xml`/`theme1.xml` → sửa đến khi PASS hết.

---

## 9. Phụ lục — lệnh chạy & môi trường

**Yêu cầu môi trường:** Windows PowerShell 5.1, `pandoc` (mặc định `C:\Users\VTIT\AppData\Local\Pandoc\pandoc.exe`).

**Xuất SRS (ví dụ):**
```powershell
.\.claude\skills\export-word\scripts\export-word.ps1 `
  -SourceList "@<duong-dan>\manifests\srs.txt" `
  -Title "SRS — <Tên hệ thống>" `
  -Subtitle "Đặc tả Yêu cầu Phần mềm · trình bày theo QT02.BM.04" `
  -OutBase "SRS-<MA-DU-AN>-..." -Version "x.y" -TocDepth 3
```

**Dựng lại mẫu (khi đổi style/letterhead):**
```powershell
.\.claude\skills\export-word\scripts\build-reference-template.ps1
```

- `-SourceList` nhận `@<tệp manifest>` (mỗi dòng 1 path, `#` = chú thích) **hoặc** chuỗi path ngăn cách dấu phẩy.
- Tên file ra: `<OutBase>-v<Version>-<yyyy-MM-dd>.docx` — **không ghi đè** (trừ `-Force` khi nháp cùng version/ngày).

---

*Tài liệu tổng hợp phương pháp — phân rã từ skill `export-word` hiện có. Mọi nội dung truy vết về: SKILL.md, export-word.ps1, build-reference-template.ps1, manifests/srs.txt, CLAUDE.md §8. Không bổ sung suy diễn ngoài nguồn.*
