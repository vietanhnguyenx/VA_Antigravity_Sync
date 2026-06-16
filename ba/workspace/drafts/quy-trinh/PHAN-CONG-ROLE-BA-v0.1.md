---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Phân công Role & Skill BA"
---

# Phân công Role & Mức độ Sử dụng Skill — Team BA TOSS

> **Phạm vi:** Tài liệu này xác định phân công trách nhiệm theo **ba chiều**: (1) mức độ sử dụng skill theo role BA, (2) phân hệ nghiệp vụ phụ trách, và (3) ranh giới **BA Human vs BA Agents** — hoạt động nào con người quyết định, hoạt động nào agent thực thi.
>
> **Nguyên tắc cốt lõi:** Human quyết định *WHAT* (cái gì); Agent thực thi *HOW* (như thế nào). Xem CLAUDE.md §0 và §0.3.

---

## 0. Phân chia Phạm vi: BA Human vs BA Agents

> Đây là ranh giới **bất biến** — không phụ thuộc vào role hay cấp bậc. Quy tắc: nếu hoạt động đòi hỏi **phán đoán, ủy quyền, hoặc quan hệ tin tưởng** → Human. Nếu có thể thực hiện bằng cách **đọc nguồn + áp rule + sinh artifact** → Agent.

### 0.1 BA Human (Con người quyết định và thực hiện)

| Nhóm | Hoạt động | Lý do không thể delegate |
|---|---|---|
| **Quan hệ stakeholder** | Dẫn dắt phỏng vấn | Tin tưởng, đọc ngôn ngữ cơ thể, đàm phán |
| | Điều phối Workshop | Xử lý xung đột nhóm, phán đoán cảm xúc |
| | Nhận sign-off tài liệu | Ủy quyền pháp lý |
| **Phê duyệt & Quyết định** | Approve BRD / SRS / Wireframe | Thẩm quyền BA Lead |
| | Approve / Reject Change Request | Tác động phạm vi + timeline |
| | Chọn Document Workflow | Định hướng làm việc nhóm |
| | Ưu tiên MoSCoW với stakeholder | Đánh đổi nghiệp vụ |
| **Suy diễn nghiệp vụ** | Đánh giá "đủ" hay "thiếu" yêu cầu | Đòi hỏi kinh nghiệm ngành |
| | Xác nhận thuật ngữ domain | Domain expert |
| | Điền tên nhân sự vào ma trận | Biết context tổ chức |
| | Điền ngày vào roadmap | Biết lịch thực tế |
| **Quản lý nhóm** | Phân công phân hệ cho BA | Quyết định nhân sự nội bộ |
| | Đánh giá chất lượng và nâng cấp level | Thẩm quyền quản lý |

### 0.2 BA Agents (Agent thực thi và hỗ trợ)

| Nhóm | Hoạt động | Skill / Tool |
|---|---|---|
| **Sinh artifact** | Tạo bộ câu hỏi phỏng vấn | `/interview` |
| | Tạo RACI + Power-Interest Grid | `/stakeholder` |
| | Phác thảo As-Is / To-Be + diagram | `/asis-tobe` |
| | Soạn BRD từ yêu cầu đã thu thập | `/brd` |
| | Tạo User Story + Acceptance Criteria | `/userstory` |
| | Format biên bản họp từ ghi chú thô | `/meeting-notes` ✅ |
| | Dựng HTML Mockup / Prototype | `gen-mockup` |
| | Xuất Word QT02 | `export-word` |
| **Kiểm tra & Xác nhận** | Review tài liệu theo checklist | `ba-reviewer` agent |
| | Validate INVEST cho User Story | `requirement-validator` agent |
| | Quality Gate check Gate 1, 2, 5 | grep + frontmatter parser |
| | Phát hiện mâu thuẫn, placeholder còn sót | grep / cross-ref |
| **Biến đổi nội dung** | Phân rã tài liệu nguồn → BR list (có dẫn nguồn) | `business-analyst` agent |
| | Populate RTM từ SRS approved | Thủ công + template |
| | Tạo agent-optimized output từ SRS | Biến đổi format |
| | Compliance trace mapping | `compliance-trace` template |

### 0.3 Vùng Phối hợp (Agent hỗ trợ, Human quyết định)

| Hoạt động | Agent làm gì | Human làm gì |
|---|---|---|
| Gap analysis | Phát hiện khoảng cách dựa trên tài liệu | Quyết định khoảng cách nào ưu tiên xử lý |
| Review BRD/SRS | Tìm lỗi hình thức + mâu thuẫn | Phán xét chuyên môn + quyết định cuối |
| Phân tích tác động CR | Cross-ref tài liệu bị ảnh hưởng | Approve/Reject CR |
| Demo mockup | Tạo prototype clickable | Trình bày và đàm phán với stakeholder |
| Compliance trace | Map FR → điều khoản | SH-07 xác nhận áp dụng đúng |

---

## 1. Định nghĩa Mức độ Skill

| Ký hiệu | Mức độ | Mô tả |
|---|---|---|
| **C** | Chủ trì | Tự thực hiện độc lập; quyết định cuối; output là chuẩn tham chiếu cho nhóm |
| **Đ** | Độc lập | Tự thực hiện; output cần BA Lead review trước khi publish vào `sync/` |
| **H** | Có hỗ trợ | Thực hiện dưới hướng dẫn của Senior/Lead; output cần review trực tiếp |
| **Q** | Quan sát | Xem và học trong phiên làm việc; chưa tự thực hiện |
| **—** | Không áp dụng | Nằm ngoài phạm vi role này ở giai đoạn hiện tại |

> **Nguyên tắc leo thang:** Junior → Mid → Senior → Lead theo thời gian và sản phẩm được nghiệm thu. BA Lead xác nhận nâng cấp mức độ dựa trên chất lượng output đã nộp.

---

## 2. Ma trận Role × Skill

> **Bộ skill chung** áp dụng toàn team. Mỗi skill được thực hiện bằng Claude Code CLI — chỉ khác mức độ giám sát và quyền publish output.

### 2.1 Skill Phân tích & Yêu cầu

| Skill / Slash Command | BA Lead | Senior BA | Mid BA | Junior BA | Intern |
|---|---|---|---|---|---|
| `/interview` — Phỏng vấn stakeholder | **C** | **Đ** | **H** | Q | Q |
| `/stakeholder` — RACI + Power-Interest Grid | **C** | **Đ** | **H** | — | — |
| `/asis-tobe` — Phân tích As-Is / To-Be | **C** | **Đ** | **H** | Q | — |
| `/brd` — Business Requirements Document | **C** | **Đ** | **H** | — | — |
| `/userstory` — User Story + Acceptance Criteria | **C** | **Đ** | **Đ** | **H** | Q |
| `/gap-analysis` *(đề xuất bổ sung)* | **C** | **Đ** | **H** | — | — |
| `/meeting-notes` *(đề xuất bổ sung)* | **C** | **Đ** | **Đ** | **Đ** | **H** |
| `/trace` — Ma trận truy vết BR→FR→US→TC *(đề xuất)* | **C** | **Đ** | **H** | — | — |

### 2.2 Skill Thiết kế & Giao diện

| Skill | BA Lead | Senior BA | Mid BA | Junior BA | Intern |
|---|---|---|---|---|---|
| `gen-mockup` — HTML Mockup / Prototype | **C** | **Đ** | **Đ** | **H** | Q |
| Wireframe (viết tay `.md`) | **C** | **Đ** | **Đ** | **H** | Q |
| `/data-model` — ERD + từ điển thực thể *(đề xuất)* | **C** | **Đ** | **H** | — | — |

### 2.3 Skill Đầu ra & Kiểm soát Chất lượng

| Skill | BA Lead | Senior BA | Mid BA | Junior BA | Intern |
|---|---|---|---|---|---|
| `export-word` — Xuất Word QT02.BM.04 | **C** | **Đ** | **Đ** | **H** | — |
| Quản lý NKLR (nhật ký thay đổi yêu cầu) | **C** | **Đ** | — | — | — |
| Review tài liệu (`ba-reviewer` agent) | **C** | **Đ** | **H** | — | — |
| Nghiên cứu miền (`domain-knowledge/`) | **C** | **Đ** | **Đ** | **Đ** | **H** |
| Ghi biên bản họp (`meeting-notes/`) | — | **Đ** | **Đ** | **Đ** | **H** |

---

## 3. Ma trận Phân hệ × Nhân sự

> **Hướng dẫn điền:** BA Lead phân công cụ thể tên nhân sự vào cột `BA Chủ trì` và `BA Hỗ trợ`. BA Lead là Reviewer mặc định cho tất cả phân hệ.

| Phân hệ | Mã | BA Chủ trì | BA Hỗ trợ | BA Review |
|---|---|---|---|---|
| Quản lý Khai thác Bay | 3.1 | *(chưa phân công)* | *(chưa phân công)* | BA Lead |
| Quản lý Tổ bay | 3.2 | *(chưa phân công)* | *(chưa phân công)* | BA Lead |
| Bảo dưỡng & Kỹ thuật Tàu bay | 3.3 | *(chưa phân công)* | *(chưa phân công)* | BA Lead |
| Khai thác Mặt đất | 3.4 | *(chưa phân công)* | *(chưa phân công)* | BA Lead |
| An toàn & Tuân thủ | 3.5 | *(chưa phân công)* | *(chưa phân công)* | BA Lead |
| Báo cáo & Thống kê | 3.6 | *(chưa phân công)* | *(chưa phân công)* | BA Lead |
| Master Data | 3.7 | *(chưa phân công)* | *(chưa phân công)* | BA Lead |

> **Lưu ý:** Một BA có thể Chủ trì nhiều phân hệ tùy năng lực. Khuyến nghị: Senior BA ≤ 2 phân hệ chủ trì; Mid BA ≤ 1 phân hệ chủ trì.

---

## 4. Ma trận Vùng Workspace × Role

> Xác định ai có quyền **ghi (W)**, **review (R)**, hoặc **chỉ đọc (RO)** vào từng vùng trong `ba/`.

| Vùng `ba/` | BA Lead | Senior BA | Mid BA | Junior BA | Intern |
|---|---|---|---|---|---|
| `workspace/input/meeting-notes/` | R | W | W | W | W |
| `workspace/input/domain-knowledge/` | R | W | W | W | W (RO) |
| `workspace/drafts/phan-tich/` | R | W | W | W (H) | RO |
| `workspace/drafts/brd/` | W | W | W (H) | RO | — |
| `workspace/drafts/srs/` | R | W | W (H) | RO | — |
| `workspace/drafts/wireframe/` | R | W | W | W (H) | RO |
| `workspace/drafts/mockup/` | R | W | W | W (H) | RO |
| `workspace/drafts/quy-trinh/` | W | R | RO | RO | — |
| `sync/requirements/brd/` | W (Approve) | R | RO | — | — |
| `sync/requirements/srs/` | W (Approve) | R | RO | — | — |
| `sync/requirements/quan-ly-yeu-cau/` | W | W | RO | — | — |
| `sync/models/` | W (Approve) | W | W (H) | RO | — |
| `sync/output/human/exports/` | W (Approve) | W | RO | — | — |
| `sync/output/agents/` | W (Approve) | W | RO | — | — |

---

## 5. Skill Đề xuất Bổ sung

> Các skill dưới đây **chưa được tạo** — đề xuất để BA Lead xem xét ưu tiên. Sau khi phê duyệt, chuyển sang `.claude/commands/` và cập nhật ma trận §2.

| Skill | Mô tả | Ưu tiên | Trạng thái |
|---|---|---|---|
| `/meeting-notes` | Format biên bản họp từ ghi chú thô → cấu trúc chuẩn + YAML frontmatter | Cao | ✅ **Đã tạo** |
| `/gap-analysis` | Phân tích khoảng cách: hệ thống/quy trình hiện tại vs yêu cầu mới | Cao | ⬜ Chờ tạo |
| `/trace` | Sinh ma trận truy vết BR→FR→FUNC→US→TC từ SRS đã có | Trung bình | ⬜ Chờ tạo |
| `/data-model` | Phác thảo ERD + từ điển thực thể từ mô tả nghiệp vụ trong SRS | Trung bình | ⬜ Chờ tạo |
| `/test-scenario` | Từ User Story + AC → test scenario (phối hợp với team QC) | Thấp | ⬜ Chờ tạo |

---

## 6. Quy trình Phối hợp Theo Phân hệ

```
[Intern/Junior]         [Mid BA]              [Senior BA]          [BA Lead]
      │                     │                      │                    │
  Ghi biên bản ──────► Phân tích As-Is/To-Be ──► Soạn SRS nháp ──► Review & Approve
  Domain research        Wireframe nháp            Wireframe final      NKLR
                         Mockup (gen-mockup)        BRD nháp            Export Word
                                                    Userstory           Publish sync/
```

**Điểm chuyển giao chính:**
- `workspace/drafts/` → `sync/requirements/` : cần BA Lead **Approve** (đổi status → `Approved`)
- `sync/requirements/` → `sync/output/human/exports/` : cần BA Lead **ký duyệt** trước khi giao khách hàng
- Mọi thay đổi sau Approve : phải tạo entry NKLR trước khi chỉnh sửa

---

## 7. Nội dung Cần Làm Rõ

| # | Câu hỏi | Người quyết định | Trạng thái |
|---|---|---|---|
| 1 | Phân công cụ thể nhân sự vào Ma trận §3 | BA Lead | *(chưa có)* |
| 2 | Skill `/meeting-notes`, `/gap-analysis` có ưu tiên tạo ngay không? | BA Lead | `/meeting-notes` ✅ đã tạo; `/gap-analysis` chờ BA Lead |
| 3 | Quy trình phê duyệt khi thiếu BA Lead (người thay thế)? | BA Lead | *(chưa có)* |
| 4 | Intern có được dùng Claude Code CLI tự do hay cần giám sát? | BA Lead | *(chưa có)* |

---

---

## 8. Ghi chú Tạo Bản Excel

> **Tác vụ này nhanh hơn nếu BA Lead tự thực hiện thủ công (~10 phút) thay vì để agent tự động hóa.**

**Hướng dẫn tạo file Excel từ tài liệu này:**

1. Mở Excel → tạo Workbook mới → đặt tên 5 sheet: `Huong dan`, `Skill Matrix`, `Phan he`, `Workspace`, `Skill moi`
2. **Sheet "Skill Matrix"**: Copy bảng §2.1, §2.2, §2.3 → paste vào Excel → tô màu theo bảng §1 (C=xanh lá đậm, D=xanh lá nhạt, H=vàng, Q=cam, —=xám)
3. **Sheet "Phan he"**: Copy bảng §3 → điền tên nhân sự vào cột `BA Chủ trì` và `BA Hỗ trợ`
4. **Sheet "Workspace"**: Copy bảng §4 → tô màu (W=xanh nhạt, R=xanh dương nhạt, RO=vàng nhạt, —=xám)
5. **Sheet "Skill moi"**: Copy bảng §5 → thêm cột `Quyết định` để BA Lead điền sau khi xem xét
6. Lưu tên: `PHAN-CONG-ROLE-BA-v0.1.xlsx` cùng thư mục với file `.md` này

---

*Phiên bản 0.2 — Draft — 2026-06-04. Thêm §0 phân chia BA Human vs BA Agents; cập nhật §5 trạng thái skill; /meeting-notes đã tạo.*
*Phiên bản 0.1 — Draft — 2026-06-04. Cần BA Lead điền §3 và phê duyệt trước khi chuyển sang `sync/requirements/quan-ly-yeu-cau/`.*
