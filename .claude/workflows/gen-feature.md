# Workflow: Generate New Feature
Hệ thống Multi-Agent: Hãy chạy tuần tự các bước sau. Giữa mỗi bước, hãy dừng lại chờ lệnh "Tiếp tục" từ tôi.

**Step 1: Phân tích Tài liệu (Kích hoạt `@.claude/agents/business-analyst.md`)**
- Đọc file SRS và UI. Tạo file `docs/specs/[tên-feature].md`. 
- *[DỪNG LẠI] Chờ tôi chốt nội dung Markdown.*
- Nếu ko có srs thì đọc hinhf ảnh thay vào đó

**Step 2: Thiết kế Kiến trúc (Kích hoạt `@.claude/agents/02-sa.md`)**
- Đọc file `docs/specs/{feature-name}[tên-feature].md` và `@sample-module`. Tạo File Tree.
- *[DỪNG LẠI] Chờ tôi review File Tree.*

**Step 3: Lập trình Component (Kích hoạt `@.claude/agents/03-coder.md`)**
- Gen code UI & Logic, bắt buộc apply skill `@.claude/skills/dynamic-form-handler.md`.

**Step 4: Mock Data (Kích hoạt `@.claude/agents/04-mock-data.md`)**
- Gen dữ liệu giả và gắn vào UI để sẵn sàng chạy thử.

**Step 5: Đa ngôn ngữ (Kích hoạt `@.claude/agents/05-i18n.md`)**
- Replace hardcode text, gen key và update vào `public/translate/vi/` và `en/`.

**Step 6: Runtime & Visual Check (Kích hoạt `@.claude/agents/06-runtime-verifier.md`)**
- Hướng dẫn tôi chạy app.
- *[DỪNG LẠI] Chờ tôi gửi ảnh chụp màn hình trình duyệt và console log.*
- Tiến hành fix lỗi service và chỉnh CSS cho giống Figma.

**Step 7: Viết Test (Kích hoạt `@.claude/agents/07-qa.md`)** // Bạn có thể đổi tên file qa thành 07-qa.md cho đồng bộ
- Sau khi UI/Logic đã chạy hoàn hảo ở Step 6, tiến hành viết Unit Test/Component Test.