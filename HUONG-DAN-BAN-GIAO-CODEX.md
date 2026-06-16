---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "1.0"
date: "2026-06-10"
status: "Approved"
document_type: "Hướng dẫn — Bàn giao thư mục dự án (dùng với OpenAI Codex)"
---

# Hướng dẫn Bàn giao — Sử dụng thư mục TOSS với OpenAI Codex

> Dành cho người **nhận** gói zip dự án TOSS và làm việc bằng **OpenAI Codex** (Codex CLI / Codex trong IDE) thay vì Claude Code. Nếu bạn dùng Claude Code, đọc `HUONG-DAN-BAN-GIAO.md` thay cho file này.

---

## 1. Giải nén

1. Giải nén toàn bộ vào ổ đĩa, khuyến nghị đúng đường dẫn **`d:\TOSS`**.
2. Kiểm tra sau giải nén phải thấy đủ: `AGENTS.md`, `CLAUDE.md`, `HUMAN.md`, `ba/`, `.claude/`, `dev/`, `qc/`, `shared/`, `logs/`.

## 2. Gói này CÓ và KHÔNG CÓ gì

**Có (đủ để làm việc ngay):**
- Toàn bộ tài liệu nguồn (`ba/workspace/input/`), sản phẩm BA (`ba/workspace/drafts/`, `ba/sync/`).
- **`AGENTS.md`** — file lệnh mà Codex **tự nạp** mỗi phiên: nó trỏ agent về `CLAUDE.md` (bộ quy tắc gốc) và hướng dẫn Codex thay thế các tính năng riêng của Claude Code (memory, hook, skill).
- `.claude/` — giữ nguyên làm **kho quy trình**: Codex không chạy được skill/hook trong đó, nhưng đọc và làm theo thủ công được (mọi thủ tục đều là markdown).

**Không có (chủ đích loại ra):**
- `logs/ba-sessions/*` — log phiên cá nhân của người bàn giao.
- `.claude/settings.local.json` — config máy cũ (chỉ Claude Code dùng).
- `identity.local.md` — file danh tính cục bộ (nếu có) **không bao giờ** đi theo gói; máy bạn sẽ tạo file riêng (mục 3).

## 3. Phiên làm việc đầu tiên — thiết lập danh tính & vai trò (BẮT BUỘC)

Codex **không có bộ nhớ lâu dài** như Claude Code, nên dự án dùng file `identity.local.md` ở gốc thư mục để thay thế:

1. Cài **Codex CLI** và đăng nhập bằng tài khoản được cấp (`npm install -g @openai/codex` hoặc bản IDE).
2. Mở dự án: chạy `codex` tại thư mục `d:\TOSS`. Codex sẽ tự nạp `AGENTS.md`.
3. Theo §2 của `AGENTS.md`, vì chưa có `identity.local.md`, agent sẽ **hỏi bạn**:
   - Họ tên / cách xưng hô;
   - Vai trò BA: **BA Lead / Senior BA / Mid BA / Junior BA / Intern**;
   - Phân hệ được phân công (nếu có).
4. Trả lời đúng vai trò được BA Lead phân công (đối chiếu `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` §3). Agent sẽ tạo `identity.local.md` lưu lại — các phiên sau không hỏi nữa. Khi chưa khai báo, agent chỉ làm tác vụ đọc/phân tích, không approve hay ghi vào `ba/sync/`.
5. Nếu agent không tự hỏi, chủ động nói: *"Thiết lập danh tính theo AGENTS.md §2: tôi là [tên], vai trò [role], phụ trách phân hệ [X]."*
6. **Không commit / không gửi `identity.local.md` cho ai** (đã có trong `.gitignore`).

## 4. Khác biệt khi dùng Codex thay vì Claude Code

| Tính năng Claude Code | Trên Codex làm thế nào |
|---|---|
| Bộ nhớ agent (memory) | File `identity.local.md` + agent tự đọc lại mỗi phiên |
| Slash skill (`/brd`, `/interview`, xuất Word…) | Bảo agent đọc và làm theo `.claude/commands/<tên>.md` hoặc `.claude/skills/<tên>/SKILL.md` (vd: xuất Word → chạy `scripts/export-word.ps1` theo SKILL.md) |
| Hook nhắc đồng bộ mirror (`[SYNC]`) | Agent phải tự tuân thủ CLAUDE.md §9: sửa file tracked → cập nhật mirror + ghi `SYNC-LOG.md` trong cùng tác vụ |
| Sub-agent (business-analyst, code-reviewer…) | Bảo agent đọc `.claude/agents/<tên>.md` và đóng vai theo đúng mô tả |

## 5. Sau khi thiết lập — bắt đầu từ đâu

Giống lộ trình thành viên mới: đọc `ba/workspace/drafts/quy-trinh/ONBOARDING-GUIDE-v0.1.md` (bỏ qua bước cài Claude Code, thay bằng Codex). Tóm tắt:

| # | Việc | Tài liệu |
|---|---|---|
| 1 | Hiểu cấu trúc & quy tắc dự án | `HUMAN.md` (bản tiếng Việt của `CLAUDE.md`) |
| 2 | Biết dự án đang ở đâu | `ba/workspace/drafts/quy-trinh/BA-ROADMAP-v0.1.md` |
| 3 | Biết vai trò & quyền hạn của mình | `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` |
| 4 | Đọc tài liệu nguồn chính | `ba/workspace/input/VNA_TOSS.pptx` + `VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` |

**3 nguyên tắc phải nhớ:**
1. `ba/workspace/input/` là **chỉ-đọc** — không bao giờ ghi/sửa.
2. Mọi nội dung agent viết phải **bám sát nguồn, có trích dẫn** — không suy diễn nghiệp vụ (CLAUDE.md §0).
3. Nháp cá nhân ở `ba/workspace/drafts/`; chỉ tài liệu đã review mới chuyển sang `ba/sync/`.

---

*Thắc mắc về bàn giao: liên hệ BA Lead (người gửi gói zip này).*
