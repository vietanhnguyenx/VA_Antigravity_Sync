---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "1.0"
date: "2026-06-10"
status: "Approved"
document_type: "Hướng dẫn — Bàn giao thư mục dự án"
---

# Hướng dẫn Bàn giao — Sử dụng thư mục TOSS trên máy mới

> Dành cho người **nhận** gói zip dự án TOSS. Làm theo thứ tự dưới đây để bắt đầu làm việc ngay sau khi giải nén.

---

## 1. Giải nén

1. Giải nén toàn bộ vào ổ đĩa, khuyến nghị đúng đường dẫn **`d:\TOSS`** (các script/skill dùng đường dẫn tương đối nên vị trí khác vẫn chạy được, nhưng `d:\TOSS` là chuẩn của team).
2. Kiểm tra sau giải nén phải thấy đủ: `CLAUDE.md`, `HUMAN.md`, `ba/`, `.claude/`, `dev/`, `qc/`, `shared/`, `logs/`.

## 2. Gói này CÓ và KHÔNG CÓ gì

**Có (đủ để làm việc ngay):**
- Toàn bộ tài liệu nguồn (`ba/workspace/input/` — đề xuất kỹ thuật, biên bản khảo sát, domain-knowledge ICAO/FAA/IATA…).
- Toàn bộ sản phẩm BA (`ba/workspace/drafts/` — BRD v0.2, phân tích YCKT, wireframe, quy trình; `ba/sync/` — tài liệu đã thống nhất).
- Toàn bộ cấu hình agent (`.claude/` — agents, skills, templates, glossary, rules, sync protocol).

**Không có (chủ đích loại ra):**
- `logs/ba-sessions/*` — log phiên làm việc **cá nhân** của người bàn giao (không cần cho người mới; máy bạn sẽ tự sinh log riêng).
- `.claude/settings.local.json` — cấu hình runtime gắn với máy cũ (Claude Code sẽ tự tạo lại trên máy bạn).
- **Bộ nhớ (memory) của agent** — nằm trong hồ sơ người dùng của từng máy, KHÔNG đi theo thư mục. Vì vậy agent trên máy bạn chưa biết bạn là ai — xem mục 3.

## 3. Phiên làm việc đầu tiên — thiết lập danh tính & vai trò (BẮT BUỘC)

1. Cài **Claude Code** (nếu chưa có) và đăng nhập bằng tài khoản được cấp.
2. Mở dự án: chạy `claude` tại thư mục `d:\TOSS` (hoặc mở thư mục trong VS Code có extension Claude Code).
3. Theo quy tắc **§0.4 của CLAUDE.md/HUMAN.md** (tự nạp vào mọi phiên), agent sẽ **hỏi bạn** ở phiên đầu:
   - Họ tên / cách xưng hô;
   - Vai trò BA: **BA Lead / Senior BA / Mid BA / Junior BA / Intern**;
   - Phân hệ được phân công (nếu có).
4. Trả lời đúng vai trò **được BA Lead phân công** (đối chiếu `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` §3). Agent sẽ lưu vào bộ nhớ máy bạn và phân quyền theo vai trò — khi chưa khai báo, agent chỉ cho phép tác vụ đọc/phân tích, không cho approve hay ghi vào `ba/sync/`.
5. Nếu agent không tự hỏi, hãy chủ động nói: *"Thiết lập danh tính theo §0.4: tôi là [tên], vai trò [role], phụ trách phân hệ [X]."*

## 4. Sau khi thiết lập — bắt đầu từ đâu

Đọc theo thứ tự trong **`ba/workspace/drafts/quy-trinh/ONBOARDING-GUIDE-v0.1.md`** (lộ trình 2 ngày cho thành viên mới). Tóm tắt:

| # | Việc | Tài liệu |
|---|---|---|
| 1 | Hiểu cấu trúc & quy tắc dự án | `HUMAN.md` (bản tiếng Việt của `CLAUDE.md`) |
| 2 | Biết dự án đang ở đâu | `ba/workspace/drafts/quy-trinh/BA-ROADMAP-v0.1.md` |
| 3 | Biết vai trò & quyền hạn của mình | `ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` |
| 4 | Đọc tài liệu nguồn chính | `ba/workspace/input/VNA_TOSS.pptx` + `VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` |

**3 nguyên tắc phải nhớ:**
1. `ba/workspace/input/` là **chỉ-đọc** — không bao giờ ghi/sửa.
2. Mọi nội dung agent viết phải **bám sát nguồn, có trích dẫn** — không suy diễn nghiệp vụ (§0).
3. Nháp cá nhân ở `ba/workspace/drafts/`; chỉ tài liệu đã review mới chuyển sang `ba/sync/`.

---

*Thắc mắc về bàn giao: liên hệ BA Lead (người gửi gói zip này).*
