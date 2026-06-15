---
project: "TOSS — Hệ thống Điều hành Khai thác Hàng không"
document_type: "README — _links/ (link catalog, chưa xử lý)"
date: "2026-06-15"
---

# `_links/` — Danh mục link tài liệu ngoài (chưa tải / chưa phân rã)

> **Agents:** Folder này **KHÔNG chứa văn bản đọc được**. Chỉ có danh sách URL và PDF chưa phân rã.  
> Để tra cứu nội dung → quay lại [../INDEX.md](../INDEX.md) mục **A. Nội dung KB**.

---

## Nội dung

| File / Folder | Bộ tài liệu | # Link | Ghi chú |
|---|---|---|---|
| [icao-apac/](icao-apac/) | ICAO APAC eDocs | 49 | Chưa tải — Cloudflare. Mở `icao-apac/download-helper.html` bằng trình duyệt |
| [vatm-aim/](vatm-aim/) | VATM AIM — AIC/AIP SUP | 56 | 1 PDF đã tải (`_pdf/`), còn lại chưa tải |
| [ffac-pdf-links-toss-relevant.md](ffac-pdf-links-toss-relevant.md) | FFAC — ICAO/EASA (tuyển chọn TOSS) | ~150 | Chưa tải |
| [ffac-pdf-links-toss-definitions.md](ffac-pdf-links-toss-definitions.md) | FFAC — Định nghĩa chuẩn (rộng hơn) | ~200 | Chưa tải |
| [ffac-pdf-links.md](ffac-pdf-links.md) | FFAC — Toàn bộ kho | ~595 | Nguồn gốc, dùng để lọc thêm |
| [eufalda-pdf-links.md](eufalda-pdf-links.md) | EUFALDA — Điều phái EU | 9 | Chưa tải |

---

## Cách tải PDF

**ICAO APAC (Cloudflare):** Mở `icao-apac/download-helper.html` trong Chrome/Firefox → dùng DownThemAll → lưu vào `icao-apac/_pdf/`

**VATM AIM / FFAC / EUFALDA:** Chạy script:
```powershell
.\.claude\skills\crawl-pdf\scripts\download-pdfs.ps1 `
  -ListFile "ba\workspace\input\domain-knowledge\_links\vatm-aim\vatm-aim-pdf-links.md" `
  -OutDir "ba\workspace\input\domain-knowledge\_links\vatm-aim\_pdf"
```

Sau khi tải xong PDF → chạy `pdf-to-md.ps1` để phân rã thành nội dung KB và chuyển lên thư mục cha.

---

*Xem trạng thái tải đầy đủ: [../LINKS-SUMMARY.md](../LINKS-SUMMARY.md)*
