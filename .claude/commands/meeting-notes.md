---
description: Format ghi chú họp thô thành biên bản họp chuẩn TOSS (YAML frontmatter + cấu trúc đầy đủ + action items). Lưu tại ba/workspace/input/meeting-notes/.
argument-hint: <chu-de-hop — e.g., kickoff, review-srs-3.1, workshop-dispatcher>
allowed-tools: Read, Grep, Glob, Write, Edit, AskUserQuestion
version: "1.0"
---

# /meeting-notes — Format Biên bản Họp TOSS

**Chủ đề họp:** `$ARGUMENTS`

## Luồng thực hiện

### Bước 1 — Thu thập thông tin họp

Nếu chưa có ghi chú thô, hỏi người dùng (tối đa 4 câu):

1. **Ngày & giờ họp:** YYYY-MM-DD, HH:MM–HH:MM
2. **Địa điểm / Hình thức:** Phòng họp / Teams / Zoom
3. **Người tham dự:** Tên — Vai trò (mỗi người 1 dòng)
4. **Nội dung ghi chú thô:** paste toàn bộ ghi chú, bullet, voice note text...

Nếu người dùng đã cung cấp ghi chú thô trong cùng tin nhắn → bỏ qua bước hỏi, xử lý trực tiếp.

### Bước 2 — Đọc tài liệu tham chiếu

- [`ba/workspace/drafts/quy-trinh/MEETING-CADENCE-v0.1.md`](ba/workspace/drafts/quy-trinh/MEETING-CADENCE-v0.1.md) — template biên bản chuẩn + quy tắc
- [`CLAUDE.md §3`](CLAUDE.md) — personas & vai trò dự án
- [`.claude/glossary/ba-terms-vi-en.md`](.claude/glossary/ba-terms-vi-en.md) — thuật ngữ nhất quán

### Bước 3 — Phân loại và cấu trúc nội dung

Từ ghi chú thô, phân loại từng mục vào đúng section:

| Loại nội dung | Section |
|---|---|
| Thảo luận, tranh luận, ý kiến | Nội dung Thảo luận |
| Quyết định đã được đồng thuận | Quyết định (ghi rõ người quyết định) |
| Việc cần làm tiếp theo | Action Items (có deadline + người thực hiện) |
| Câu hỏi chưa có câu trả lời | Câu hỏi Chưa Giải quyết |
| Thông tin chung, ngữ cảnh | Mục tiêu Buổi Họp |

**Nguyên tắc (CLAUDE.md §0):**
- Ghi **trung thực** những gì được nói — không suy diễn, không thêm nội dung không có trong ghi chú thô
- Nếu ghi chú thô không rõ → giữ nguyên + gắn cờ: `[Không rõ — cần xác nhận]`
- Quyết định phải ghi rõ **ai quyết định**, không ghi chung chung "nhóm đồng ý"
- Action item phải có **deadline cụ thể** — nếu không rõ → ghi `[Chưa có deadline]`

### Bước 4 — Sinh biên bản theo template chuẩn

```markdown
---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
date: "<YYYY-MM-DD>"
time: "<HH:MM–HH:MM>"
location: "<Phòng họp / Teams / Zoom>"
meeting_type: "<Kickoff | Weekly Sync | Workshop | Review | Ad-hoc>"
facilitator: "<Tên người dẫn dắt>"
note_taker: "<Tên người ghi chú>"
attendees:
  - "<Tên> — <Vai trò>"
document_type: "Meeting Notes"
version: "1.0"
status: "Draft"
---

# Biên bản Họp: <Tiêu đề>

## Mục tiêu Buổi Họp
<1–2 câu mô tả mục tiêu, trích từ ghi chú hoặc context>

## Nội dung Thảo luận

### <Chủ đề 1>
- <Điểm thảo luận — trích trung thực>
- <Điểm thảo luận>
- **Quyết định:** <Quyết định đã đưa ra — người quyết định>

### <Chủ đề 2>
...

## Quyết định Chính
| # | Quyết định | Người quyết định | Ghi chú |
|---|---|---|---|
| DEC-NNN | <Nội dung> | <Tên> | |

## Action Items
| # | Nhiệm vụ | Người thực hiện | Deadline |
|---|---|---|---|
| 1 | <Cụ thể> | <Tên> | <YYYY-MM-DD hoặc [Chưa có]> |

## Câu hỏi Chưa Giải quyết
- [ ] <Câu hỏi — [Người cần trả lời: SH-xx]>

## Ghi chú Bổ sung
<Thông tin ngữ cảnh, rủi ro, hoặc điểm cần theo dõi>

## Buổi Họp Tiếp theo
- **Dự kiến:** <Ngày/Giờ nếu biết, hoặc "Chưa xác định">
- **Chủ đề:** <Nếu đã biết>
```

### Bước 5 — Tạo DEC-ID nếu có quyết định mới

Nếu biên bản chứa quyết định, đề xuất DEC-ID tiếp theo:
- Đọc `ba/workspace/drafts/quy-trinh/` để tìm DEC-ID cao nhất đã dùng
- Đề xuất `DEC-<NNN+1>`

### Bước 6 — Lưu file

- **Thư mục:** `ba/workspace/input/meeting-notes/`
- **Tên file:** `MM-<YYYYMMDD>-<chu-de>.md`
- Ví dụ: `MM-20260604-kickoff-pha-1.md`
- Frontmatter chuẩn đầy đủ

### Bước 7 — Báo cáo

Sau khi lưu, báo cáo:
1. Đường dẫn file đã lưu
2. Số lượng: thảo luận / quyết định / action items / câu hỏi chưa giải quyết
3. Danh sách action items kèm deadline (để người dùng theo dõi ngay)
4. Cờ: nếu có nội dung `[Không rõ — cần xác nhận]` → liệt kê để xử lý

## Quy tắc Bắt buộc

- **Đầu ra 100% tiếng Việt** — agent suy luận tiếng Anh, viết biên bản tiếng Việt
- **Không suy diễn** — chỉ format và cấu trúc lại, không thêm nội dung mới
- **Action item = cụ thể** — "Nghiên cứu ACARS" là quá chung; phải là "Xác nhận giao thức ACARS với SH-08 trước 2026-06-10"
- **Quyết định = có chủ thể** — không được viết "nhóm quyết định" mà phải ghi tên người có thẩm quyền
- Biên bản là **tài liệu nguồn chỉ-đọc** sau khi lưu — mọi chỉnh sửa phải có lý do ghi chú kèm theo
