# TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không (Airline Operations Management System)

Monorepo cộng tác **qua Git** cho ba vai trò **BA · DEV · QC**, vận hành cùng **Claude Code agents**. Tài liệu, mã nguồn, kiểm thử đồng bộ tại một nơi; AI agent đọc/sửa trực tiếp trong repo. Giai đoạn hiện tại: **Discovery & Phân tích yêu cầu** (BA).

---

## 1. Cấu trúc thư mục

```
TOSS/
├── CLAUDE.md  HUMAN.md          # Ngữ cảnh cho AI agent (EN) + mirror (VI) — BẮT BUỘC ở gốc
├── README.md  CONTRIBUTING.md   # Onboarding (file này) + quy ước cộng tác
├── .gitignore .gitattributes .aiignore   # Vệ sinh Git + lọc context AI
├── ba/                          # BUSINESS ANALYSIS
│   ├── workspace/               #   Vùng làm việc cá nhân
│   │   ├── input/               #     Nguồn chỉ-đọc
│   │   │   ├── Customer_docs/   #       Tài liệu VNA cung cấp (DOCX/XLSX/PDF) + meeting-notes/ (transcript)
│   │   │   └── domain-knowledge/#       ICAO/IATA/CAAV/FTL + toss-glossary-v0.1.md
│   │   └── drafts/              #     Nháp đang xây
│   │       ├── phan-tich/       #       01-nguon (extract) · 02-khao-sat (báo cáo KS) · 03-yckt · 04-quy-trinh
│   │       ├── brd/ srs/ wireframe/ mockup/ presentation/
│   │       └── quy-trinh/       #       OID, BA-VERSION-LOG, SOP, phân công role
│   └── sync/                    #   Tài liệu thống nhất giữa member (shared source of truth)
│       ├── requirements/        #     BRD/SRS đã review + NKLR (quản lý thay đổi yêu cầu)
│       ├── models/              #     ERD, deliverable-status.json, RTM, survey-pipeline-status.md
│       └── output/{human,agents}/  # Bản giao người (Word QT02/PPTX) + bản tối ưu agent
├── dev/                         # DEVELOPMENT — mã nguồn (Angular 21 / ESB-FE)
├── qc/                          # QUALITY CONTROL — test-plan / test-case / test-report
├── shared/                      # Liên vai trò: API contract, mô hình dữ liệu, glossary
├── logs/ba-sessions/            # Log phiên BA tự sinh
└── .claude/                     # Khung agent: agents, commands, skills, workflows, knowledge, sync, templates
```

> `CLAUDE.md`, `HUMAN.md`, `.claude/` **bắt buộc ở gốc** (Claude Code tự nạp). Tài liệu BA theo mô hình **workspace** (cá nhân, đang làm) → **sync** (thống nhất, chia sẻ). Nguồn chân lý về cấu trúc/quy tắc: [CLAUDE.md §4](CLAUDE.md).

---

## 2. Nguyên tắc quản trị (đọc kỹ trước khi làm)

Chi tiết trong [CLAUDE.md](CLAUDE.md) / [HUMAN.md](HUMAN.md):

| Mục | Tên | Tính chất | Nội dung cốt lõi |
|---|---|---|---|
| **§0** | Phân vai Người–Agent | BẮT BUỘC | Con người *quyết định/suy diễn*; agent *phân rã + tái hiện 100% theo nguồn*, không bịa. |
| **§0.1** | Luồng quy trình tài liệu | BẮT BUỘC | Set luồng trước khi làm tài liệu; kiểm tra trước mỗi file. |
| **§0.3** | Human-First | BẮT BUỘC | Việc GUI/data-entry/nhiều lần thất bại → agent hướng dẫn người làm, không tự cố. |
| **§0.4** | Định danh người dùng | BẮT BUỘC | Phiên mới chưa rõ vai trò → hỏi tên/role/phân hệ trước việc cần quyền. |
| **§0.5** | Định hướng & Done-discipline | BẮT BUỘC | Lấy bearings đầu phiên; **không tuyên bố hoàn thành sớm** (Approved chỉ sau evaluator + Quality Gate). |

**Trạng thái hiện tại (CLAUDE.md §1):**
- **Luồng tài liệu:** **P4 — Co-evolution Hybrid** (phân tích chức năng + mô hình dữ liệu song song wireframe/mockup).
- **Triết lý phát triển:** *(none — chưa được yêu cầu; tùy chọn)*.

---

## 3. Hai pipeline & các agent (`.claude/agents/` — 17 agent)

**BA Pipeline** (Discovery → Analysis → Decomposition → Design → QC) bàn giao sang **DEV Pipeline** qua SRS đã duyệt + entity map + mockup. Chi tiết: [CLAUDE.md §5](CLAUDE.md).

```
[Discovery]      [Analysis]         [Decomposition — song song]      [Design]     [QC]
ba-interviewer ─► business-analyst ─► srs-writer / data-modeler / ─► gen-mockup ─► ui-reviewer
                       │              process-modeler                            ba-reviewer
                       ▼                                                         requirement-validator
                 project-coordinator (OID/status/nhắc việc — cross-cutting)
```

- **DEV Pipeline (Angular 21/ESB-FE):** 02-sa → 03-coder → 04-mock-data → 05-i18n → 06-runtime-verifier → 07-qa → code-reviewer. Quy tắc: [`.claude/rules/angular-guidelines.md`](.claude/rules/angular-guidelines.md).
- **Utility:** Explore (tra cứu nhanh) · general-purpose · Plan.

---

## 4. Skills & Workflows tự động hóa

**Skills** (`.claude/skills/` — gọi `/<tên>`):

| Skill | Việc |
|---|---|
| [`survey-report`](.claude/skills/survey-report/) | Transcript phỏng vấn → Báo cáo Khảo sát (Yêu cầu/Thảo luận/Kết luận) + hậu xử lý OID/glossary |
| [`meeting-synthesize`](.claude/skills/meeting-synthesize/) | Sửa lỗi ASR + tổng hợp biên bản từ bản ghi âm |
| [`gen-mockup`](.claude/skills/gen-mockup/) | Dựng mockup/prototype HTML tự chứa (Angular Material 3, dark mode) |
| [`export-word`](.claude/skills/export-word/) | Xuất `.md` → Word **QT02.BM.04** (TNR, logo+footer, mục lục, QC tự kiểm) |
| [`crawl-pdf`](.claude/skills/crawl-pdf/) | Crawl/tải PDF + phân rã PDF/Office → MD (pymupdf4llm/markitdown); **phân rã bản trích lớn theo section** (`split-md-by-section.py`); pull/ghi Google Sheet/Drive live |
| [`term-check`](.claude/skills/term-check/) | Tra/kiểm thuật ngữ hàng không trong glossary + domain-knowledge |
| [`qa-tracking`](.claude/skills/qa-tracking/) | Q&A làm rõ với VNA: rút điểm mở OID → bảng yêu cầu làm rõ 9 cột (nhóm phân hệ + phân loại nghiệp vụ/ASR) → đẩy Google Sheet → đồng bộ phản hồi về OID |

**Workflows** (`.claude/workflows/` — điều phối đa agent):

| Workflow | Việc |
|---|---|
| [`survey-to-spec`](.claude/workflows/survey-to-spec.js) | Sau buổi KS: đối chiếu báo cáo ↔ YCKT + Function list + wireframe/SRS → sinh **đề xuất làm giàu** (FUNC/OID/glossary) + bảng quyết định BA Lead + cập nhật bảng status. **Chỉ đề xuất, không ghi đè file chốt (§0).** Chạy: `args:{meeting:"DDMMYYYY"}`. |
| `gen-feature`, `integrate-api` | Orchestration sinh feature / tích hợp API (DEV) |

> **Pattern đã kiểm chứng:** prototype lớn (≥3 màn) dùng **fan-out 5 agent song song + PowerShell assembly**; phát hiện 🔴 từ reviewer → tự spawn agent gốc hiệu chỉnh.

---

## 5. Sổ theo dõi & trạng thái (kiểm tra tiến độ ở đây)

| File | Vai trò |
|---|---|
| [`survey-pipeline-status.md`](ba/sync/models/survey-pipeline-status.md) | **Bảng theo dõi pipeline khảo sát → đặc tả** (mỗi buổi: báo cáo/đối chiếu/proposal/áp dụng/commit + quyết định chờ). Workflow `survey-to-spec` tự cập nhật. |
| [`SO-THEO-DOI-DIEM-CHOT-v0.1.md`](ba/workspace/drafts/quy-trinh/SO-THEO-DOI-DIEM-CHOT-v0.1.md) | **OID-TOSS-001** — sổ cái điểm cần chốt/câu hỏi mở (QĐ/SME/KS/DL/HC); rà soát sau MỖI meeting |
| [`deliverable-status.json`](ba/sync/models/deliverable-status.json) | Tracker pass/fail deliverable (project-coordinator duy trì; JSON theo §8) |
| [`BA-VERSION-LOG.md`](ba/workspace/drafts/quy-trinh/BA-VERSION-LOG.md) | Nhật ký version tài liệu BA (file chỉ chứa nội dung hiện tại; lịch sử ghi tại đây — §8) |
| [`toss-glossary-v0.1.md`](ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md) | Từ điển thuật ngữ hàng không TOSS (bổ sung sau mỗi báo cáo, trình đề xuất trước khi ghi) |

---

## 6. Xử lý nguồn khách hàng & kết nối live

- **Customer_docs → tự rã MD:** agent extract DOCX/XLSX/PPTX/PDF mới trong `ba/workspace/input/Customer_docs/` → `phan-tich/01-nguon/*.extracted.md` + cập nhật INDEX + TIMELINE (CLAUDE.md §8).
- **Bản trích LỚN (>800 dòng):** phân rã theo section cấp 1 → `<tên>_parts/sec-NN-*.md` + INDEX nối nội dung (`crawl-pdf/scripts/split-md-by-section.py`); tra theo section, không nạp cả file (§0.5). `01-nguon/` tổ chức theo nhóm nguồn (INDEX) + bản thuyết minh vai trò (THUYET-MINH-NGUON).
- **Google Drive/Sheets live:** pull tài liệu đang ở Drive/Sheets về `.md` qua Service Account (YCKT-VTIT, Function list…) — `crawl-pdf/scripts/gsheet-to-md.py` / `gdrive-to-md.py`; **ghi ngược lên Sheet** qua `gsheet-write.py` (cần SA quyền Editor); re-pull khi nguồn đổi (`--check`/`reconcile`).
- **Function list "Màn hình Flight Dispatch"** là source-of-truth khách hàng đang base xây màn Flight Dispatch → đối chiếu & làm giàu wireframe/mockup thường xuyên.

---

## 7. Bắt đầu theo vai trò

| Vai trò | Đọc gì | Làm ở đâu | Nhánh |
|---|---|---|---|
| **BA** | CLAUDE.md §0/§0.1 → định hướng đầu phiên (§0.5) | `ba/workspace/drafts/` | `ba/<chu-de>` |
| **DEV** | SRS đã duyệt + entity map (`ba/sync/`) | `dev/` | `dev/<tinh-nang>` |
| **QC** | SRS + acceptance criteria | `qc/` | `qc/<bo-test>` |

- **Xuất Word giao khách:** skill `export-word` → `ba/sync/output/human/exports/` (tên file kèm version + ngày; không ghi đè bản đã chốt).
- **Mỗi tính năng = một cửa sổ chat riêng;** đọc/ghi file chọn lọc (Grep/offset) để tối ưu token.

---

## 8. Quy ước cộng tác

- **Git:** commit trực tiếp `main` (repo BA), nhóm commit theo chủ đề; thông điệp Conventional-style. Xem [CONTRIBUTING.md](CONTRIBUTING.md).
- **Versioning (§8):** file chỉ chứa nội dung hiện tại (không nhúng CHANGELOG); version bump = file mới + xóa file cũ (git giữ lịch sử) + ghi BA-VERSION-LOG + cập nhật INDEX.
- **Dual-scope sync:** sửa `.claude/{agents,commands,templates,glossary}/` hoặc `CLAUDE.md` → cập nhật mirror VI (`.claude/human/...` / `HUMAN.md`) + ghi [`SYNC-LOG.md`](.claude/sync/SYNC-LOG.md). (DEV toolkit `gen-*`/rules + skills `export-word`/`survey-report`… miễn mirror.)
- **Ngôn ngữ:** lập luận nội bộ tiếng Anh; đầu ra giao người **100% tiếng Việt** (thuật ngữ kỹ thuật giữ tiếng Anh trong ngoặc lần đầu).

---

*Cập nhật 2026-06-22. Nguồn chân lý về quy tắc & cấu trúc: [CLAUDE.md](CLAUDE.md) (v2.10). Lịch sử thay đổi: [`.claude/sync/SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).*
