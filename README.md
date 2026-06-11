# TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không (Airline Operations Management System)

Monorepo cộng tác **100% qua Git** cho ba vai trò **BA · DEV · QC**, vận hành cùng **Claude Code agents**. Tài liệu, mã nguồn, kiểm thử đồng bộ tại một nơi; AI agent đọc/sửa trực tiếp trong repo.

---

## 1. Cấu trúc thư mục

```
TOSS/
├── CLAUDE.md  HUMAN.md          # Ngữ cảnh cho AI agent (EN) + mirror (VI) — BẮT BUỘC ở gốc
├── README.md  CONTRIBUTING.md   # Onboarding (file này) + quy ước cộng tác
├── BUILD-GUIDE.md               # Hướng dẫn build dự án A→Z
├── .gitignore  .gitattributes  .aiignore   # Vệ sinh Git + lọc context AI
├── ba/                          # BUSINESS ANALYSIS  (input → process → output)
│   ├── input/                   #   Nguồn chỉ-đọc: BBKS, BBLV, đề xuất kỹ thuật, VNA_TOSS
│   ├── process/                 #   Đang làm: presentation/ (+ srs/ wireframe/ brd/… khi mở rộng)
│   └── output/
│       ├── human/               #   Bản giao người: PPTX, Word QT02 (100% theo biểu mẫu)
│       └── agents/              #   Bản tối ưu cho agent DEV/QC: dense, machine-readable, ít token
├── dev/                         # DEVELOPMENT — mã nguồn
├── qc/                          # QUALITY CONTROL — test-plan / test-case / test-report
├── shared/                      # Liên vai trò: API contract, mô hình dữ liệu, glossary
└── .claude/                     # Khung agent: agents, commands, skills, templates, knowledge, sync
```

> `CLAUDE.md`, `HUMAN.md`, `.claude/` **bắt buộc ở gốc** (Claude Code tự nạp). Tài liệu BA theo mô hình 3 tầng **input → process → output**; `output` tách 2 nhánh **human** (giao người) và **agents** (giao agent downstream).

---

## 2. Nguyên tắc quản trị (đọc kỹ trước khi làm)

Chi tiết trong [CLAUDE.md](CLAUDE.md) / [HUMAN.md](HUMAN.md):

| Mục | Tên | Tính chất | Nội dung cốt lõi |
|---|---|---|---|
| **§0** | Phân vai Người–Agent | BẮT BUỘC | Con người *quyết định/suy diễn*; agent *phân rã + tái hiện 100% theo nguồn*, không bịa. |
| **§0.1** | Luồng quy trình tài liệu | BẮT BUỘC | Phải **set luồng trước khi làm tài liệu**; kiểm tra trước mỗi file; đổi luồng ghi SYNC-LOG. |
| **§0.2** | Triết lý phát triển | TÙY CHỌN | Mặc định **none**; agent **hỏi khi khởi động**; chỉ áp khi human yêu cầu. |

**Trạng thái hiện tại (§1 của CLAUDE.md):**
- **Luồng đang áp dụng:** `(chưa thiết lập)` → cần chọn từ [`ba-workflow-patterns.md`](.claude/knowledge/ba-workflow-patterns.md) trước khi làm tài liệu mới (mặc định khuyến nghị **P4**).
- **Triết lý đang áp dụng:** `(none — chưa được yêu cầu)`

---

## 3. Kho tri thức (`.claude/knowledge/`)

| File | Nội dung |
|---|---|
| [`ba-workflow-patterns.md`](.claude/knowledge/ba-workflow-patterns.md) | 6 luồng làm tài liệu BA (P1–P6) + bảng so sánh + hướng dẫn chọn |
| [`dev-philosophies.md`](.claude/knowledge/dev-philosophies.md) | Catalog triết lý phát triển TÙY CHỌN (DP1 = Mô-đun hóa & Tích hợp / "Khắc nhập–Khắc xuất") |
| [`ai-agent-token-optimization.md`](.claude/knowledge/ai-agent-token-optimization.md) | Tối ưu token cho agent VS Code: caching, RAG, session hygiene, CONTEXT_RULES |
| `babok-v3-summary`, `agile-scrum-vn`, `bpmn-2.0-cheatsheet`, `company-process-standards` | Tham chiếu phương pháp BA |

---

## 4. Quy ước & công cụ

- **Git cộng tác:** nhánh theo vai trò (`ba/…`, `dev/…`, `qc/…`) → PR review chéo; Conventional Commits; git tag cho mốc bàn giao. Xem [CONTRIBUTING.md](CONTRIBUTING.md).
- **Lọc context AI:** [`.aiignore`](.aiignore) (đổi tên thành `.cursorignore`/`.continueignore` tùy extension) — loại `logs/`, binary, `_qa3/`, `ba/output/human/`.
- **Đồng bộ dual-scope:** sửa file `.claude/{agents,commands,templates,glossary,knowledge}/` hoặc `CLAUDE.md` → cập nhật mirror + ghi [`.claude/sync/SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).
- **Xuất Word (skill export-word)** — chạy từ thư mục gốc, file `.docx` → `ba/output/human/`.

---

## 5. Bắt đầu theo vai trò

| Vai trò | Đọc gì | Làm ở đâu | Nhánh |
|---|---|---|---|
| **BA** | CLAUDE.md §0/§0.1 → **chọn luồng trước** | `ba/process/` | `ba/<chu-de>` |
| **DEV** | `ba/output/agents/` + đặc tả phân hệ liên quan | `dev/` | `dev/<tinh-nang>` |
| **QC** | `ba/output/agents/` + acceptance criteria | `qc/` | `qc/<bo-test>` |

> Mỗi tính năng = một cửa sổ chat riêng; dùng `@mention` chỉ file liên quan (tối ưu token).

> 📘 **Hướng dẫn build dự án từ A→Z (trình tự đầy đủ):** [BUILD-GUIDE.md](BUILD-GUIDE.md) — playbook từ khởi tạo → quy tắc → input → process → output → DEV → QC → bàn giao.

---

## 6. Việc còn lại

- **Git chưa cài trên máy** → repo đã *sẵn sàng git* nhưng chưa `git init`/commit. Sau khi cài Git, chạy từ `d:\TOSS`:
  ```powershell
  git init -b main; git config core.quotepath false; git config core.autocrlf input
  git add -A; git commit -m "chore: khởi tạo monorepo TOSS (BA/DEV/QC)"
  ```
- **Chọn luồng tài liệu (§0.1)** trước khi bắt đầu tài liệu BA mới — hiện *chưa thiết lập*.
- `ba/output/agents/` mới có [README scaffold](ba/output/agents/README.md) — nội dung thực tế sinh khi tài liệu đạt Review.
- `_qa3/` (slide PNG trung gian) giữ ở gốc — xác nhận giữ/dọn khi cần.

---

*Cập nhật 2026-06-03. Nguồn chân lý về quy tắc & cấu trúc: [CLAUDE.md](CLAUDE.md) (v1.4). Lịch sử thay đổi: [`.claude/sync/SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).*
