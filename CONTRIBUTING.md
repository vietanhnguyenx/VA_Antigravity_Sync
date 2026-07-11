# Quy ước cộng tác — TOSS monorepo

Áp dụng cho cả **BA · DEV · QC**. Mục tiêu: cộng tác trơn tru qua Git, ít xung đột, dễ truy vết.

## 1. Nhánh (branch)

- `main` — luôn ổn định. **Code DEV/QC** merge qua Pull Request (PR). **Tài liệu BA** (giai đoạn Discovery solo) commit trực tiếp `main`, gom commit theo chủ đề.
- Nhánh làm việc đặt tên theo vai trò: `ba/<chu-de>`, `dev/<tinh-nang>`, `qc/<bo-test>`.
  - Ví dụ: `ba/srs-khai-thac-bay`, `dev/api-lich-bay`, `qc/test-to-bay`.
- Nhánh ngắn, gộp sớm; cập nhật `main` thường xuyên.

## 2. Commit — Conventional Commits

`<type>(<scope>): <mô tả ngắn>`

- **type:** `feat` `fix` `docs` `test` `chore` `refactor`.
- **scope:** `ba` `dev` `qc` `claude` (hoặc tên module).
- Ví dụ: `docs(ba): bổ sung đặc tả phân hệ tổ bay`, `feat(dev): API lập lịch bay`, `test(qc): thêm ca kiểm thử OCC`.

## 3. Pull Request & review

- Mỗi PR gắn với một nhánh vai trò; mô tả thay đổi + liên kết tài liệu nguồn.
- Review chéo: BA duyệt tài liệu, DEV duyệt code, QC duyệt kiểm thử.
- (Tùy chọn) `CODEOWNERS` gán reviewer mặc định theo thư mục `/ba/`, `/dev/`, `/qc/`.

## 4. Phiên bản & mốc bàn giao

- Git history là "lịch sử"; **chỉ giữ bản mới nhất trong cây** — bump version = file mới + xóa file cũ; ghi vào [`BA-VERSION-LOG.md`](ba/workspace/drafts/quy-trinh/BA-VERSION-LOG.md) + cập nhật INDEX (CLAUDE.md §8).
- Gắn **git tag** cho mốc bàn giao (ví dụ `trinh-bay-v1.0`).
- Tên file bản giao khách vẫn kèm version + ngày; không ghi đè bản đã chốt.

## 5. Quy tắc quản trị (theo CLAUDE.md)

- **Mục 0:** con người quyết định/suy diễn; agent phân rã & tái hiện 100% theo nguồn, không bịa.
- **Mục 0.1:** set luồng làm tài liệu trước khi khởi động (xem `.claude/knowledge/ba-workflow-patterns.md`); kiểm tra luồng đang set trước mỗi tài liệu; đổi luồng phải ghi SYNC-LOG.
- **Đồng bộ dual-scope:** sửa file trong `.claude/{agents,commands,templates,glossary}/` hoặc `CLAUDE.md` → cập nhật mirror VI (`.claude/human/...` / `HUMAN.md`) + ghi `.claude/sync/SYNC-LOG.md`. **Miễn mirror:** DEV toolkit (`gen-*`, `rules/`, `workflows/`), skills `export-word`/`survey-report`/`crawl-pdf`… (VI-primary), và `ba/*`.

## 6. Lưu ý kỹ thuật Git

- Cấu hình máy: `git config core.quotepath false` (hiện đúng tên file tiếng Việt).
- File nguồn là chân lý; bản `.docx/.pptx` sinh lại được (mặc định không commit, xem `.gitignore`).
- Không commit `logs/`, `.claude/settings.local.json`, file build.
- Đường dẫn trong hook/script dùng `$CLAUDE_PROJECT_DIR` hoặc tương đối — **không** hardcode `c:\...` / `d:\...`.
- Key Service Account (Google Drive/Sheets) để ở `.secrets/` (gitignore) — **không bao giờ commit/bàn giao**.

---

*Cập nhật 2026-06-22. Nguồn chân lý về quy tắc: [CLAUDE.md](CLAUDE.md). Trình tự build: [BUILD-GUIDE.md](BUILD-GUIDE.md).*
