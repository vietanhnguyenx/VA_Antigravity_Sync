---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "1.0"
date: "2026-06-10"
status: "Approved"
document_type: "Hướng dẫn — Bàn giao thư mục dự án (role QC)"
---

# Hướng dẫn Bàn giao — Thư mục TOSS cho thành viên QC (dùng Claude Code)

> Dành cho người **nhận** gói zip dự án TOSS với vai trò **QC (kiểm thử)**, làm việc bằng Claude Code. Gói này là bản rút gọn theo nhu cầu QC — xem mục 2 để biết khác gì gói đầy đủ.

---

## 1. Giải nén

1. Giải nén toàn bộ vào ổ đĩa, khuyến nghị đúng đường dẫn **`d:\TOSS`**.
2. Kiểm tra sau giải nén phải thấy đủ: `CLAUDE.md`, `HUMAN.md`, `qc/`, `ba/`, `.claude/`, `shared/`, `dev/`, `logs/`.

## 2. Gói này CÓ và KHÔNG CÓ gì

**Có (đủ cho công việc QC):**
- **`qc/`** — workspace của bạn: `test-plan/`, `test-case/`, `test-report/` (hiện trống, bạn là người tạo nội dung đầu tiên).
- **Cơ sở kiểm thử (test basis):**
  - `ba/sync/requirements/` — BRD/SRS đã review + nhật ký thay đổi yêu cầu (NKLR);
  - `ba/sync/models/` — mô hình nghiệp vụ, **RTM (ma trận truy vết yêu cầu)**, compliance-trace, subsystem-interface-map;
  - `ba/workspace/drafts/brd/` — BRD-TOSS-001 v0.2 (40 yêu cầu BR-001→040, nhiều phần chưa qua review — kiểm tra trạng thái frontmatter trước khi dùng làm căn cứ);
  - `ba/workspace/drafts/phan-tich/` — phân tích YCKT 12 sheet, báo cáo khảo sát.
- **Tài liệu nguồn khách hàng** (chỉ-đọc): `ba/workspace/input/Customer_docs/` + đề xuất kỹ thuật VNAOCC (bản gốc PDF + bản phân rã `vnaocc-proposal-decomposed/`).
- `.claude/` — cấu hình agent đầy đủ, gồm agent **07-qa** (viết unit/component test), **code-reviewer** (checklist FE 44 mục), templates, glossary thuật ngữ VI-EN.
- `shared/` — hợp đồng API, data model dùng chung (sẽ đầy dần khi DEV vào).

**Không có (chủ đích loại ra):**
- `ba/workspace/input/domain-knowledge/{faa-icao-dispatcher-core, iata-definitions, briefing, dangerous-goods-notoc, aircraft_dispatcher_pts_10}` (~36 MB) — kho PDF tham khảo FAA/ICAO/IATA chỉ phục vụ BA tra cứu domain; theo quy ước dự án các nguồn này là **tham khảo**, không phải căn cứ kiểm thử. Cần thì xin gói đầy đủ từ BA Lead.
- `logs/ba-sessions/*` — log phiên cá nhân của người bàn giao.
- `.claude/settings.local.json`, `identity.local.md` — config/danh tính gắn với máy cũ.
- Bộ nhớ (memory) agent — không đi theo thư mục; xem mục 3.

## 3. Phiên làm việc đầu tiên — thiết lập danh tính & vai trò (BẮT BUỘC)

1. Cài **Claude Code** và đăng nhập bằng tài khoản được cấp.
2. Mở dự án: chạy `claude` tại `d:\TOSS` (hoặc VS Code + extension Claude Code).
3. Theo quy tắc **§0.4 của CLAUDE.md/HUMAN.md**, agent sẽ hỏi danh tính ở phiên đầu. Khai báo:
   - Họ tên / cách xưng hô;
   - Vai trò: **QC** (ghi rõ QC Lead / Tester) — vai trò QC chưa có trong ma trận phân công BA (`PHAN-CONG-ROLE-BA-v0.1.md` hiện chỉ định nghĩa role BA), agent sẽ gắn cờ điều này: cứ xác nhận bạn được BA Lead phân công làm QC;
   - Phân hệ phụ trách kiểm thử (nếu đã được phân công).
4. Nếu agent không tự hỏi, chủ động nói: *"Thiết lập danh tính theo §0.4: tôi là [tên], vai trò QC, phụ trách kiểm thử phân hệ [X]."*

## 4. Quy tắc làm việc cho QC

1. **Workspace của bạn là `qc/`** — test plan vào `qc/test-plan/`, test case vào `qc/test-case/`, báo cáo vào `qc/test-report/`. Không sửa tài liệu trong `ba/` (đó là vùng của BA; phát hiện lỗi yêu cầu thì báo BA qua kênh thay đổi, xem `CHANGE-CONTROL-SOP-v0.1.md`).
2. **Truy vết bắt buộc:** mỗi test case phải gắn ID truy vết theo chuỗi **BR → FR → FUNC → US/UC → TC** (quy ước ID: `TC-...`, xem CLAUDE.md §8). Cập nhật RTM trong `ba/sync/models/` mỗi khi thêm/sửa TC.
3. **Căn cứ kiểm thử theo thứ tự ưu tiên:** tài liệu đã review trong `ba/sync/requirements/` → bản nháp trong `ba/workspace/drafts/` (kiểm tra trạng thái `Draft/Review/Approved` trong frontmatter, nháp chỉ dùng tham khảo và phải gắn cờ).
4. **`ba/workspace/input/` là chỉ-đọc** — không bao giờ ghi/sửa.
5. Frontmatter YAML + tiếng Việt 100% cho tài liệu giao người, theo CLAUDE.md §7–8.
6. Kiểm thử tự động phía FE: dùng agent **07-qa** (Jasmine/Karma, Cypress) và tuân `.claude/rules/angular-guidelines.md`.

## 5. Đọc gì trong ngày đầu

| # | Việc | Tài liệu |
|---|---|---|
| 1 | Hiểu cấu trúc & quy tắc dự án | `HUMAN.md` |
| 2 | Hiểu quy trình tài liệu & cổng chất lượng | `ba/workspace/drafts/quy-trinh/QUALITY-GATE-v0.1.md`, `DEFINITION-OF-DONE-v0.1.md`, `REVIEW-APPROVAL-FLOW-v0.1.md` |
| 3 | Nắm phạm vi nghiệp vụ | `ba/workspace/drafts/brd/BRD-TOSS-001-v0.2.md` |
| 4 | Nắm yêu cầu kỹ thuật gốc | `ba/workspace/input/domain-knowledge/vnaocc-proposal-decomposed/` (bản phân rã dễ đọc) |

---

*Thắc mắc về bàn giao: liên hệ BA Lead (người gửi gói zip này).*
