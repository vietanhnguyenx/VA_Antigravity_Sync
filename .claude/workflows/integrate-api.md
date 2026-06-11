# Workflow: Integrate API

Hệ thống Multi-Agent: Hãy chạy tuần tự các bước sau. 
Giữa mỗi bước, hãy dừng lại chờ lệnh "Tiếp tục" từ tôi.

**Step 1: Phân tích Tài liệu (Kích hoạt `@.claude/agents/business-analyst.md`)**
- Đọc theo thứ tự ưu tiên: (1) file SRS, (2) ảnh Figma/UI, 
  (3) code hiện tại (DTO + form config + service) nếu không có 2 nguồn trên.
- Tạo file `docs/specs/[tên-feature]-specs.md`.
- *[DỪNG LẠI] Chờ tôi chốt nội dung Markdown.*

**Step 2: Thiết kế Kiến trúc (Kích hoạt `@.claude/agents/02-sa.md`)**
- Nếu feature CHƯA tồn tại: Đọc spec + `@sample-module`, tạo File Tree mới.
- Nếu feature ĐÃ có sẵn UI: Bỏ qua bước này, chuyển thẳng Step 3.
- *[DỪNG LẠI] Chờ tôi review File Tree (chỉ khi tạo mới).*

**Step 3: Lập trình / Refactor (Kích hoạt `@.claude/agents/03-coder.md`)**
- Đọc spec từ Step 1 và code hiện tại.
- Kiểm tra và cập nhật lần lượt:
  1. `buildSaveRequest`: form values → API request payload (khớp DTO)
  2. `mapItem`: API response fields → list item display fields
  3. `buildSearchRequest`: filter form values → search payload
  4. DTO interfaces: khớp với response thực tế của API
  5. i18n keys còn thiếu trong translation files
- Chạy `pnpm lint src/app/features/{feature-name}/` và fix lỗi trước khi bàn giao.

**Step 4: Runtime & Visual Check (Kích hoạt `@.claude/agents/06-runtime-verifier.md`)**
- Hướng dẫn tôi chạy app.
- *[DỪNG LẠI] Chờ tôi gửi ảnh chụp màn hình trình duyệt và console log.*
- Checklist verify:
  - [ ] List hiển thị đúng columns, data binding đúng fields
  - [ ] Search/filter gửi đúng payload
  - [ ] Form create/edit: fields đủ, validation đúng
  - [ ] Save tạo đúng payload
  - [ ] Các thao tác phụ (test, delete, view services) hoạt động
- Tiến hành fix lỗi service và chỉnh CSS cho giống Figma.
