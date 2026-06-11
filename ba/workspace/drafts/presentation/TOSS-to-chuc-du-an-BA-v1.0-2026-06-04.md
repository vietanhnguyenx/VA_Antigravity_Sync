---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "1.0"
date: "2026-06-04"
status: "Draft"
document_type: "Presentation — Tổ chức Dự án BA"
audience: "Stakeholder, PM, Team BA"
---

# Tổ chức Dự án BA — TOSS
### Nội dung Slide Trình bày

---

## Slide 1: Tiêu đề

### Trình bày

```
┌──────────────────────────────────────────────────┐
│                                                  │
│   HỆ THỐNG ĐIỀU HÀNH KHAI THÁC                  │
│   HÀNG KHÔNG — TOSS                             │
│                                                  │
│   Tổ chức & Quy trình BA                        │
│                                                  │
│   BA Lead  ·  2026-06-04                        │
│                                                  │
└──────────────────────────────────────────────────┘
```

### Thuyết minh

Buổi hôm nay tôi sẽ trình bày về cách chúng tôi tổ chức công việc phân tích nghiệp vụ cho dự án TOSS — bao gồm cấu trúc team, phân công trách nhiệm, bộ công cụ sử dụng, và roadmap công việc phía trước. Thời gian khoảng 15–20 phút, sau đó mở để hỏi đáp.

---

## Slide 2: Dự án TOSS là gì?

### Trình bày

**Phạm vi hệ thống — 5 phân nhóm lớn:**

| # | Phân nhóm | Chức năng chính |
|---|---|---|
| 1 | Khai thác Bay | Lập lịch, dispatch, giám sát OCC 24/7 |
| 2 | Quản lý Tổ bay | Roster, FTL, chứng chỉ phi hành đoàn |
| 3 | Bảo dưỡng Tàu bay | MEL, kế hoạch bảo dưỡng, airworthiness |
| 4 | Khai thác Mặt đất | Gate, turnaround, ground service |
| 5 | An toàn & Tuân thủ | SMS, CAAV/ICAO, audit trail |

**Giai đoạn hiện tại:** Discovery & Requirements Analysis

### Thuyết minh

TOSS là hệ thống nội bộ số hóa toàn bộ chu trình khai thác hàng không — từ lập kế hoạch bay trước chuyến đến kết thúc sau chuyến. Hệ thống phải đáp ứng quy định của Cục Hàng không Việt Nam (CAAV) và tiêu chuẩn quốc tế ICAO, IATA. Đây là bối cảnh khiến công việc BA đặc biệt quan trọng — chúng ta không chỉ thu thập yêu cầu mà còn phải đảm bảo mọi yêu cầu đều có thể truy vết về điều khoản pháp lý cụ thể.

---

## Slide 3: Cấu trúc Team BA

### Trình bày

```
                    ┌─────────────┐
                    │   BA LEAD   │  — Govern, Approve, Stakeholder
                    └──────┬──────┘
          ┌─────────────────┼─────────────────┐
          ▼                 ▼                 ▼
    ┌───────────┐    ┌───────────┐    ┌───────────┐
    │ SENIOR BA │    │  MID BA   │    │ JUNIOR BA │
    │  Chủ trì  │    │  Thực hiện│    │  Hỗ trợ  │
    │  phân hệ  │    │  có review│    │  + Intern │
    └───────────┘    └───────────┘    └───────────┘
```

**7 phân hệ phân công theo ma trận:**
3.1 Khai thác Bay · 3.2 Tổ bay · 3.3 Bảo dưỡng
3.4 Mặt đất · 3.5 An toàn · 3.6 Báo cáo · 3.7 Master Data

### Thuyết minh

Team BA được tổ chức theo mô hình kim tự tháp 4 cấp. BA Lead chịu trách nhiệm quản trị toàn bộ: phê duyệt tài liệu, quản lý quan hệ stakeholder, và quyết định những vấn đề cần phán đoán chuyên môn. Senior BA là người thực hiện chính, chủ trì 1–2 phân hệ. Mid BA thực hiện dưới sự hướng dẫn. Junior BA và Intern tham gia nghiên cứu domain knowledge và ghi chép. Phân công cụ thể theo phân hệ sẽ được điền vào ma trận sau khi xác định đầy đủ nhân sự.

---

## Slide 4: Nguyên tắc Phân vai Cốt lõi

### Trình bày

```
┌──────────────────────────────────────────────────┐
│  BA HUMAN                   BA AGENTS            │
│  ────────────               ──────────────       │
│  Quyết định WHAT            Thực thi HOW         │
│  Phán đoán, suy diễn        Phân rã, lắp ghép    │
│  Quan hệ stakeholder        Xử lý artifact        │
│  Approve tài liệu           Sinh + kiểm tra       │
│                                                  │
│  "Người quyết định          "Claude hỗ trợ       │
│   cái gì cần làm"            làm như thế nào"    │
└──────────────────────────────────────────────────┘
```

**Quy tắc:** Nếu cần phán đoán → Human. Nếu có thể đọc nguồn + áp rule → Agent.

### Thuyết minh

Đây là nguyên tắc quan trọng nhất chi phối toàn bộ cách chúng tôi làm việc. Chúng tôi sử dụng Claude Code — công cụ AI của Anthropic — như một công cụ hỗ trợ mạnh mẽ, nhưng tất cả quyết định nghiệp vụ, phê duyệt, và quan hệ với stakeholder đều là trách nhiệm của con người. Agent không được suy diễn, không được "cải thiện" yêu cầu theo ý mình — chỉ phân rã và tổ chức lại những gì con người đã ghi nhận. Điều này đảm bảo mọi output đều truy vết được về nguồn gốc rõ ràng.

---

## Slide 5: Cấu trúc Workspace

### Trình bày

```
ba/
├── workspace/          ← CÁ NHÂN (mỗi BA trên máy riêng)
│   ├── input/          — Tài liệu nguồn CHỈ ĐỌC
│   │   ├── meeting-notes/     (biên bản họp)
│   │   ├── domain-knowledge/  (ICAO, CAAV, FTL...)
│   │   └── [4 tài liệu nguồn VNA/TOSS]
│   └── drafts/         — Nháp đang làm
│       ├── phan-tich/  brd/  srs/  wireframe/
│       ├── mockup/  quy-trinh/  presentation/
│
└── sync/               ← NHÓM (tài liệu thống nhất)
    ├── requirements/   — BRD, SRS đã duyệt + NKLR
    ├── models/         — RTM, sơ đồ giao diện, compliance
    └── output/human/   — Word QT02, PPTX giao stakeholder
```

### Thuyết minh

Workspace được chia thành 2 vùng rõ ràng. Vùng "workspace" là không gian cá nhân — mỗi thành viên làm trên máy riêng, thoải mái thử nghiệm và nháp. Vùng "sync" là nơi chứa tài liệu đã được review và thống nhất — đây là nguồn sự thật chung của cả team. Nguyên tắc: chỉ BA Lead mới có quyền "promote" tài liệu từ workspace vào sync, sau khi đã qua Quality Gate và phê duyệt. Cấu trúc này lấy cảm hứng từ mô hình Git branching — mỗi người có "branch" riêng, chỉ merge vào "main" (sync) khi đã đạt chất lượng.

---

## Slide 6: Bộ Công cụ — Skills & Commands

### Trình bày

**6 Slash Commands BA (gõ vào Claude Code CLI):**

| Command | Tác dụng | Ai dùng |
|---|---|---|
| `/interview` | Tạo bộ câu hỏi phỏng vấn 15–20 câu | Senior+ |
| `/stakeholder` | Tạo RACI + Power-Interest Grid | Senior+ |
| `/asis-tobe` | Phân tích As-Is/To-Be + diagram Mermaid | Mid+ |
| `/brd` | Soạn Business Requirements Document | Senior+ |
| `/userstory` | Tạo User Story + AC Given-When-Then | Mid+ |
| `/meeting-notes` | Format biên bản họp từ ghi chú thô | Tất cả |

**2 Skills đầu ra:**
`export-word` — Xuất Word QT02.BM.04  ·  `gen-mockup` — HTML Prototype

### Thuyết minh

Thay vì mỗi người soạn tài liệu từ đầu, chúng tôi có bộ slash command chuẩn hóa — gõ lệnh, cung cấp input, agent sinh ra artifact đúng format và dẫn nguồn đầy đủ. Ví dụ: gõ `/interview Dispatcher` thì Claude sẽ tự tạo bộ 15–20 câu hỏi phỏng vấn phù hợp với vai trò Dispatcher trong bối cảnh hàng không, có mục tiêu từng câu và cấu trúc 6 section. Điều này tiết kiệm khoảng 60–70% thời gian chuẩn bị so với soạn thủ công. Lưu ý: skill chỉ hỗ trợ chuẩn bị — việc thực sự ngồi phỏng vấn vẫn là con người.

---

## Slide 7: Luồng Tài liệu (SOP)

### Trình bày

```
  [Tác giả]     [Peer]       [BA Lead]    [Stakeholder]
      │             │              │              │
    Draft           │              │              │
  (workspace/)      │              │              │
      │──Gửi review─►│              │              │
      │   2 ngày   comment          │              │
      │◄────────────              │              │
    Revise          │              │              │
      │──────────────────Review──►│              │
      │              2 ngày     Approve/Reject    │
      │◄─────────────────────────               │
    Finalize        │              │              │
      │─────────────────Promote──►│              │
      │                       sync/          Export Word
      │                                       ──────────►│
```

### Thuyết minh

Mọi tài liệu BA đều đi qua luồng này — không có ngoại lệ. Thời hạn peer review là 2 ngày làm việc, BA Lead review tiếp theo 2 ngày. Tác giả phải giải quyết tất cả comment có nhãn "Lỗi" trước khi tài liệu được approve. Sau khi approve, BA Lead mới promote vào thư mục sync — thời điểm đó tài liệu trở thành nguồn sự thật chung. Nếu sau đó cần thay đổi, phải tạo Change Request — không được sửa trực tiếp vào tài liệu đã approved.

---

## Slide 8: Bộ 14 Tài liệu Quy trình

### Trình bày

**Nhóm 1 — Nền tảng:**
SOP Luồng Tài liệu · Stakeholder Register · BA Roadmap

**Nhóm 2 — Phối hợp Nhóm:**
Review & Approval Flow · Meeting Cadence · Definition of Done · Onboarding Guide

**Nhóm 3 — Chất lượng:**
Quality Gate · RTM Template · Change Control SOP

**Nhóm 4 — Đặc thù TOSS:**
Từ điển Thuật ngữ HK · Compliance Trace (CAAV/ICAO)
Bản đồ Giao diện Phân hệ · BA Session Log Template

**→ Tổng hợp:** `QUY-TRINH-BA-TONG-HOP` — mục lục và hướng dẫn tra cứu

### Thuyết minh

Chúng tôi đã xây dựng bộ 14 tài liệu quy trình để đảm bảo team BA hoạt động nhất quán từ đầu đến cuối dự án. Nhóm 1 là nền tảng — ai mới vào cũng đọc trước. Nhóm 2 hỗ trợ phối hợp ngày-ngày: họp thế nào, review ai, hoàn thành có nghĩa là gì. Nhóm 3 kiểm soát chất lượng: trước khi tài liệu nào được approve, phải pass 5 Quality Gate. Nhóm 4 là kiến thức đặc thù hàng không — đặc biệt quan trọng khi team có thành viên chưa quen với domain này. Mọi tài liệu đều ở dạng Draft v0.1, cần BA Lead review và approve trong thời gian tới.

---

## Slide 9: BA Roadmap — 5 Phase

### Trình bày

```
Phase 1          Phase 2          Phase 3          Phase 4      Phase 5
DISCOVERY   →   PHÂN TÍCH   →  TÀI LIỆU HÓA  →   REVIEW   →  HANDOFF
─────────────   ──────────    ──────────────     ─────────    ───────
Phỏng vấn SH    As-Is/To-Be    BRD hoàn chỉnh    SH sign-off  DEV nhận
Đọc tài liệu    Gap analysis   SRS × 7 phân hệ   Chỉnh sửa    Word export
As-Is draft     BR list draft  Wireframe × 7     RTM hoàn     Agent output
Domain KW       SH workshop    Mockup demo        chỉnh        Q&A sprint 1
─────────────   ──────────    ──────────────     ─────────    ───────
[2–3 tuần]     [3–4 tuần]    [4–6 tuần]        [2–3 tuần]  [1–2 tuần]
```

**Hiện tại:** Đang thiết lập nền tảng — sẵn sàng bắt đầu Phase 1

### Thuyết minh

Roadmap 5 phase tổng cộng ước tính 12–18 tuần, tùy theo mức độ sẵn sàng của stakeholder và độ phức tạp từng phân hệ. Chúng tôi đang ở điểm cuối giai đoạn chuẩn bị — workspace đã sẵn sàng, bộ công cụ đã thiết lập, quy trình đã có. Việc còn lại là xác nhận lịch phỏng vấn stakeholder và bắt đầu Phase 1. Tài liệu nguồn đã có sẵn 4 file — BBKS, BBLV, đề xuất kỹ thuật VNA/OCC v0.3, và bộ slide VNA_TOSS. Đây là nguyên liệu đầu tiên để team BA bắt đầu phân tích ngay.

---

## Slide 10: Trạng thái Hiện tại & Bước Tiếp theo

### Trình bày

**✅ Đã hoàn thành:**
- Cấu trúc workspace và quy trình đầy đủ
- 14 tài liệu quy trình BA
- 6 slash commands + 2 skills sẵn sàng
- Phân chia rõ BA Human vs BA Agents

**⏳ Cần BA Lead quyết định ngay:**

| Ưu tiên | Hành động | Ai thực hiện |
|---|---|---|
| 🔴 Cao | Chọn Document Workflow (P1–P6) | BA Lead |
| 🔴 Cao | Điền nhân sự vào ma trận phân hệ | BA Lead |
| 🟡 Trung | Lên lịch phỏng vấn stakeholder đầu tiên | BA Lead + PM |
| 🟡 Trung | Review + Approve 14 tài liệu quy trình | BA Lead |

**→ Sau khi quyết định: bắt đầu Phase 1 — Discovery**

### Thuyết minh

Chúng tôi đã xây dựng xong toàn bộ nền tảng hạ tầng cho công việc BA — đây là điều hiếm khi được đầu tư bài bản ở giai đoạn đầu. Hai quyết định blocking quan trọng nhất cần BA Lead xử lý là: (1) chọn Document Workflow — quyết định này ảnh hưởng đến cách toàn bộ team phối hợp từ nay đến hết dự án, và (2) phân công nhân sự vào phân hệ — để Phase 1 có thể song song theo phân hệ thay vì tuần tự. Tôi đề nghị chúng ta dành 30 phút sau buổi hôm nay để chốt hai điểm này.

---

*v1.0 — 2026-06-04 — Dùng cho trình bày nội bộ với PM, Stakeholder, Team BA.*
*Thời lượng dự kiến: 15–20 phút + 10 phút Q&A.*
