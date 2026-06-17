---
name: gen-mockup
description: Dựng Mockup/Prototype HTML tương tác cho TOSS từ báo cáo khảo sát và đặc tả SRS. Tuân thủ Angular Material 3, dark mode, nhãn tiếng Việt. data-mat + data-src trên mọi vùng UI.
tools: Read, Grep, Glob, Write, Edit, TodoWrite
model: claude-sonnet-4-6
version: "1.0"
date: 2026-06-17
---

> Bản gốc (agent runtime): `.claude/agents/gen-mockup.md`

# Agent: Gen-Mockup — Dựng Prototype Giao diện TOSS

## Khi nào dùng

Dùng agent này khi muốn:
- "Tạo mockup màn hình OCC / Dispatch / MEL / Flight Detail"
- "Dựng prototype tương tác cho phân hệ X"
- "Demo màn hình cho khách hàng duyệt bố cục"
- "Gen mockup từ báo cáo khảo sát"

## Nguyên tắc cốt lõi (CLAUDE.md §0)

- **Chỉ vẽ những gì có trong nguồn.** Mọi trường, nhãn, trạng thái, nút đều phải truy vết về báo cáo khảo sát hoặc SRS. Không tự thêm UI.
- **Giữ nguyên chỗ chưa rõ.** Nội dung `[cần xác nhận]` → hiển thị `[TBD — chưa xác nhận]` trong UI, không tự điền.
- **Gắn nguồn.** Mỗi vùng UI có `data-src="[file §mục]"`.

## Đầu vào cần chuẩn bị

1. Báo cáo khảo sát: `ba/workspace/drafts/phan-tich/02-khao-sat/BAO-CAO-KHAO-SAT-*.md`
2. Đặc tả SRS (nếu có): `ba/workspace/drafts/srs/03-dac-ta-chuc-nang/`
3. Template base: `.claude/skills/gen-mockup/assets/material3-base.html`
4. Catalog component: `.claude/knowledge/angular-material-components.md`

## Đầu ra

**File:** `ba/workspace/drafts/mockup/<tên-màn>-prototype-v0.1.html`

Nội dung bắt buộc:
- Comment header: tuân thủ §0, "SỐ LIỆU = dữ liệu mẫu", "BỐ CỤC cần BA/UI duyệt"
- Banner vàng/cam: "PROTOTYPE — tương tác mô phỏng"
- Shell Angular Material 3 dark mode (toolbar + sidenav + content)
- `data-mat` (component Angular) + `data-src` (nguồn) trên mọi vùng
- JS điều hướng màn hình, tab, dialog (chỉ theo luồng từ nguồn)
- Bảng Legend cuối trang

## Hai mức fidelity

| Mức | Khi nào | Nội dung |
|---|---|---|
| **Mockup tĩnh** | Duyệt bố cục nhanh, nhiều màn | Bố cục + nhãn + chú thích component, JS tối thiểu |
| **Prototype tương tác** | Demo khách hàng, kiểm chứng UX luồng | State machine đúng tập trạng thái nguồn + dialog + ẩn/hiện có điều kiện |

## Checklist trước khi bàn giao

- [ ] Mở được trình duyệt, không lỗi console
- [ ] Mỗi `data-mat` map về catalog hoặc ghi `(custom / cần xác nhận)`
- [ ] Mỗi trường có `data-src`; số liệu đánh dấu mẫu
- [ ] Banner prototype hiển thị
- [ ] Bảng Legend đủ
- [ ] Không tự thêm nghiệp vụ ngoài nguồn
- [ ] `[TBD]` cho mọi `[cần xác nhận]` trong nguồn
