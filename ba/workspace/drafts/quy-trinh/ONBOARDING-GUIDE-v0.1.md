---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Onboarding Guide"
---

# Onboarding Guide — Thành viên mới BA Team TOSS

> Hướng dẫn từng bước để thành viên mới có thể bắt đầu đóng góp hiệu quả trong vòng 1–2 ngày đầu tiên.

---

## Ngày 1 — Hiểu Dự án & Môi trường

### Bước 1: Đọc tài liệu nền tảng (2–3 giờ)

Đọc theo thứ tự:

| # | Tài liệu | Vị trí | Mục tiêu |
|---|---|---|---|
| 1 | CLAUDE.md | `d:\TOSS\CLAUDE.md` | Hiểu toàn bộ cấu trúc dự án, quy tắc |
| 2 | HUMAN.md | `d:\TOSS\HUMAN.md` | Bản tiếng Việt của CLAUDE.md |
| 3 | BA Roadmap | `quy-trinh/BA-ROADMAP-v0.1.md` | Hiểu các phase và timeline |
| 4 | Phân công Role | `quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` | Biết vai trò và quyền hạn của mình |
| 5 | SOP Luồng | `quy-trinh/SOP-LUONG-TAI-LIEU-v0.1.md` | Quy trình làm tài liệu |

### Bước 2: Thiết lập Môi trường

1. **Cài Claude Code CLI** (nếu chưa có)
   - Xem hướng dẫn tại: [claude.ai/code](https://claude.ai/code)
   - Đăng nhập bằng tài khoản được cấp

2. **Mở thư mục dự án**
   ```
   claude d:\TOSS
   ```

3. **Kiểm tra các skill sẵn có**
   - Gõ `/interview` — test tạo câu hỏi phỏng vấn
   - Gõ `/userstory` — test tạo user story

4. **Xem cấu trúc workspace**
   - Duyệt `ba/workspace/` để nắm các thư mục chính
   - Xem các README.md trong từng thư mục

### Bước 3: Đọc tài liệu nguồn (ưu tiên)

Đọc ít nhất 1 trong các tài liệu nguồn:

| Tài liệu | Vị trí | Nội dung |
|---|---|---|
| VNA_TOSS.pptx | `workspace/input/` | Tổng quan dự án TOSS |
| VNAOCC_TOSS_đề xuất KT_v0.3.pdf | `workspace/input/` | Đề xuất giải pháp kỹ thuật |
| BBKS_PhanHe... | `workspace/input/` | Phân hệ quản lý danh mục |

---

## Ngày 2 — Bắt đầu Đóng góp

### Bước 4: Nhận phân công từ BA Lead

- BA Lead sẽ phân công phân hệ cụ thể (xem §3 của PHAN-CONG-ROLE-BA)
- Xác nhận: bạn là `Senior / Mid / Junior / Intern`
- Xem **mức độ skill** được phép thực hiện độc lập

### Bước 5: Thực hành với Skill cơ bản

Thực hành theo cấp bậc:

**Junior BA / Intern:**
```
1. Dùng /interview để tạo bộ câu hỏi phỏng vấn cho 1 persona
2. Ghi biên bản họp theo template (xem MEETING-CADENCE.md)
3. Nghiên cứu và ghi chú 1 tài liệu domain-knowledge
```

**Mid BA:**
```
1. Dùng /asis-tobe để phác thảo quy trình As-Is 1 phân hệ
2. Dùng /userstory để tạo 3 user story từ 1 yêu cầu
3. Soạn 1 section SRS dưới hướng dẫn Senior
```

**Senior BA:**
```
1. Thực hiện phỏng vấn stakeholder (với BA Lead quan sát lần đầu)
2. Soạn 1 chương SRS hoàn chỉnh
3. Dùng gen-mockup để tạo mockup 1 phân hệ nhỏ
```

### Bước 6: Quy tắc làm việc hàng ngày

- **Mọi file nháp** → lưu trong `ba/workspace/drafts/`
- **Không ghi trực tiếp** vào `ba/sync/` (chỉ BA Lead mới promote)
- **Cite nguồn** cho mọi phát biểu — ghi rõ file + section
- **Gắn cờ** nội dung chưa rõ: `*(cần làm rõ — [câu hỏi])*`
- **BA Weekly Sync** mỗi thứ Hai — không vắng mà không báo trước

---

## Checklist Onboarding

| # | Hạng mục | Hoàn thành |
|---|---|---|
| 1 | Đọc CLAUDE.md và HUMAN.md | ☐ |
| 2 | Đọc BA-ROADMAP | ☐ |
| 3 | Đọc PHAN-CONG-ROLE-BA — biết role của mình | ☐ |
| 4 | Đọc SOP-LUONG-TAI-LIEU | ☐ |
| 5 | Cài Claude Code CLI và test skill /interview | ☐ |
| 6 | Đọc ít nhất 1 tài liệu nguồn trong workspace/input/ | ☐ |
| 7 | Nhận phân công phân hệ từ BA Lead | ☐ |
| 8 | Tham dự BA Weekly Sync đầu tiên | ☐ |
| 9 | Hoàn thành bài tập thực hành theo cấp bậc (Bước 5) | ☐ |
| 10 | Biết cách tạo và đặt tên file theo convention | ☐ |

---

## Câu hỏi Thường gặp

**Q: Tôi có thể tự promote file vào sync/ không?**
> Không. Chỉ BA Lead mới promote. Khi bạn nghĩ tài liệu đã sẵn sàng, thông báo cho BA Lead để review.

**Q: Dùng skill nào trước khi phỏng vấn stakeholder?**
> Dùng `/interview` để tạo bộ câu hỏi, sau đó BA Lead review trước khi tiến hành.

**Q: File nháp của tôi nên đặt tên thế nào?**
> Xem CLAUDE.md §4 — convention: `<TYPE>-TOSS-<NNN>-<mo-ta>-v0.1.md` (kebab-case, không dấu).

**Q: Tôi gặp nội dung không rõ trong tài liệu nguồn, phải làm gì?**
> Ghi câu hỏi vào mục "Nội dung cần làm rõ" trong file phân tích, đưa ra BA Weekly Sync.
