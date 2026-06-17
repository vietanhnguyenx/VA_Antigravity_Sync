---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Quy trình Phân công Agent"
document_id: "PIPELINE-001"
---

# Pipeline Agent TOSS — Phân công & Bàn giao

> **Nguyên tắc vận hành:** Agent làm việc theo thứ tự; BA Lead review và xác nhận tại mỗi checkpoint trước khi chuyển sang agent tiếp theo. Agent không tự chuyển giao — BA Lead kích hoạt bước tiếp.

---

## GIAI ĐOẠN BA (Business Analysis)

### Agent 1 — `business-analyst`

| Mục | Nội dung |
|---|---|
| **Làm gì** | Thu thập, phân rã, lắp ráp trung thực từ tài liệu nguồn → artifact BA. Không suy diễn, không bổ sung ngoài nguồn (CLAUDE.md §0) |
| **Đầu vào** | Transcript phỏng vấn · tài liệu VNA · YCKT · ghi chú thô từ BA Lead |
| **Đầu ra** | `BRD-TOSS-PHn-*.md` · `BAO-CAO-KHAO-SAT-*.md` · `PHAN-RA-BRD-PHn-*.md` · cập nhật glossary |
| **Checkpoint review** | Nội dung bám nguồn không? Có điểm suy diễn không? BR/FUNC nào cần thêm/bỏ? |
| **Chuyển sang** | Agent 2 khi BA Lead xác nhận "nội dung đúng" |
| **Khi gọi** | `/brd`, `/userstory`, báo cáo khảo sát, cập nhật PHAN-RA-BRD |

---

### Agent 2 — `ba-reviewer`

| Mục | Nội dung |
|---|---|
| **Làm gì** | Đọc artifact từ Agent 1 → tìm lỗ hổng logic, thuật ngữ trôi dạt, thiếu tiêu chí chấp nhận, giả định ẩn, thiếu tiếng nói stakeholder |
| **Đầu vào** | BRD / SRS / PHAN-RA-BRD từ Agent 1 |
| **Đầu ra** | Danh sách comment inline + bảng tóm tắt mức độ nghiêm trọng (Critical / Major / Minor) |
| **Checkpoint review** | Comment nào cần sửa? Comment nào chủ ý bỏ qua? → Phản hồi Agent 1 nếu cần vòng sửa |
| **Chuyển sang** | Agent 3 khi không còn Critical/Major — hoặc BA Lead chấp nhận |
| **Khi gọi** | Sau khi Agent 1 hoàn thành một artifact; trước khi promote vào `sync/` |

---

### Agent 3 — `requirement-validator`

| Mục | Nội dung |
|---|---|
| **Làm gì** | Kiểm tra chất lượng yêu cầu: SMART (mục tiêu) · INVEST (user story) · MoSCoW (ưu tiên). Phát hiện xung đột, trùng lặp, khoảng trống phủ |
| **Đầu vào** | Danh sách BR / FUNC / User Story đã có từ Agent 1+2 |
| **Đầu ra** | Báo cáo audit — điểm SMART/INVEST/MoSCoW + xung đột/trùng/thiếu phủ |
| **Checkpoint review** | Yêu cầu nào cần viết lại? Xung đột nào cần BA Lead phán quyết? |
| **Chuyển sang** | Agent 4 khi danh sách sửa được BA Lead đồng ý |
| **Khi gọi** | Trước khi promote BRD/SRS vào `sync/requirements/` |

---

### Agent 4 — `process-modeler`

| Mục | Nội dung |
|---|---|
| **Làm gì** | Vẽ luồng quy trình As-Is và To-Be dạng Mermaid (BPMN-style, sequence, state diagram) có chú thích tiếng Việt. Tạo thành cặp so sánh + gap analysis |
| **Đầu vào** | SOP/quy trình As-Is từ nguồn · yêu cầu To-Be từ BRD/PHAN-RA |
| **Đầu ra** | `*.mermaid` / `.md` chứa diagram · bảng gap As-Is → To-Be → lưu `sync/models/` |
| **Checkpoint review** | Luồng có đúng thực tế vận hành? Bước nào thiếu/thừa? |
| **Chuyển sang** | Agent 5 (PC) khi diagram được xác nhận |
| **Khi gọi** | Song song với Agent 1 khi có đủ SOP nguồn; hoặc sau Agent 3 khi cần Gap formal |

---

### Agent 5 — `project-coordinator` (PC)

| Mục | Nội dung |
|---|---|
| **Làm gì** | Tổng hợp điểm còn mở (OID), action item quá hạn, cờ `[cần xác nhận]`, mốc lộ trình chưa xong → báo cáo nhắc việc có ưu tiên. Đối soát tiến độ thực tế vs Kế hoạch khảo sát (Batch 1/2/3). Đọc `tien_do/` làm baseline delta |
| **Đầu vào** | `SO-THEO-DOI-DIEM-CHOT` · `BA-ROADMAP` · `tien_do/` · Kế hoạch khảo sát gốc |
| **Đầu ra** | Báo cáo nhắc việc (🔴🟠🟡⚪) · bảng đối soát module/batch vs thực tế |
| **Checkpoint review** | Mục nào sai/dư? Ưu tiên nào cần điều chỉnh? |
| **Chuyển sang** | Lên kế hoạch buổi làm việc tiếp theo |
| **Khi gọi** | Định kỳ (đầu tuần / sau buổi khảo sát) · `/pc` |

---

### CHECKPOINT BÀN GIAO BA → DEV

> **Điều kiện mở:** BRD + PHAN-RA-BRD đã promote vào `sync/requirements/`; `sync/output/agents/` có bản dense machine-readable; QUALITY-GATE-v0.1.md PASS.

---

## GIAI ĐOẠN DEV (Frontend — Angular 21)

### Agent 6 — `02-sa` (Solution Architect)

| Mục | Nội dung |
|---|---|
| **Làm gì** | Thiết kế cây thư mục feature, shared interfaces/types từ PHAN-RA-BRD. Không viết code UI — chỉ định nghĩa kiến trúc và contract |
| **Đầu vào** | PHAN-RA-BRD đã approve |
| **Đầu ra** | File tree skeleton · `*.interface.ts` · `*.type.ts` |
| **Checkpoint review** | Cấu trúc có khớp feature-folder Angular 21? |

---

### Agent 7 — `03-coder` (Senior FE Developer)

| Mục | Nội dung |
|---|---|
| **Làm gì** | Build UI component (dumb) + logic component (smart) + facade service. Áp dynamic-form-handler. Chạy `pnpm lint` trước bàn giao |
| **Đầu vào** | File tree từ SA · PHAN-RA-BRD · Angular guidelines |
| **Đầu ra** | Các file `.ts` `.html` `.scss` đã lint sạch |
| **Checkpoint review** | UI render đúng? Logic đúng nghiệp vụ? |

---

### Agent 8 — `04-mock-data`

| Mục | Nội dung |
|---|---|
| **Làm gì** | Sinh mock data/service thực tế cho UI test offline — không cần backend |
| **Đầu vào** | Interface từ SA · use case từ PHAN-RA |
| **Đầu ra** | `*.mock.ts` · `*.mock-service.ts` |
| **Checkpoint review** | Data đủ case (normal / edge / empty)? |

---

### Agent 9 — `05-i18n`

| Mục | Nội dung |
|---|---|
| **Làm gì** | Extract tất cả label/text thành i18n key. Quản lý `vi.json` / `en.json` |
| **Đầu vào** | Template HTML từ Coder |
| **Đầu ra** | File ngôn ngữ cập nhật · template dùng `TranslatePipe` |
| **Checkpoint review** | Có label nào còn hardcode? |

---

### Agent 10 — `06-runtime-verifier`

| Mục | Nội dung |
|---|---|
| **Làm gì** | Chạy app thực tế, verify behavior khớp với spec trong PHAN-RA-BRD. Quan sát golden path + edge case. Báo regression nếu có |
| **Đầu vào** | Feature đã code · PHAN-RA-BRD làm spec |
| **Đầu ra** | Báo cáo verify — Pass / Fail với screenshot/log |
| **Checkpoint review** | Fail nào sửa ngay? Fail nào là known limitation? |

---

### Agent 11 — `07-qa` (QA Automation)

| Mục | Nội dung |
|---|---|
| **Làm gì** | Viết unit/component test (`.spec.ts`) Jasmine/Karma — bao phủ validation, dynamic rules, edge case |
| **Đầu vào** | Component đã code · spec từ PHAN-RA |
| **Đầu ra** | File `.spec.ts` · báo cáo coverage |
| **Checkpoint review** | Coverage đạt ngưỡng? Case nào còn thiếu? |

---

### Agent 12 — `code-reviewer`

| Mục | Nội dung |
|---|---|
| **Làm gì** | Review code Angular theo checklist 44 mục / 8 nhóm. Phát hiện lỗi correctness, thiếu reuse, inefficiency |
| **Đầu vào** | Diff/PR của feature |
| **Đầu ra** | Danh sách finding có severity · có thể apply fix trực tiếp |
| **Checkpoint review** | Finding nào chấp nhận sửa? Finding nào defer? |

---

## Sơ đồ tổng quan

```
[BA Lead cung cấp nguồn]
        ↓
  business-analyst  ──→ [BA Lead review] ──→
        ↓
    ba-reviewer     ──→ [BA Lead review] ──→ (vòng sửa nếu còn Critical)
        ↓
requirement-validator──→ [BA Lead review] ──→
        ↓
  process-modeler   ──→ [BA Lead review] ──→
        ↓
project-coordinator ──→ [BA Lead review] ──→ lên kế hoạch tiếp
        ↓
══ CHECKPOINT: promote vào sync/ + QUALITY GATE PASS ══
        ↓
   02-sa (SA)       ──→ [BA Lead review] ──→
        ↓
  03-coder (FE)     ──→ [BA Lead review] ──→
        ↓
  04-mock-data      ──→ [BA Lead review] ──→
        ↓
    05-i18n         ──→ [BA Lead review] ──→
        ↓
06-runtime-verifier ──→ [BA Lead review] ──→
        ↓
     07-qa          ──→ [BA Lead review] ──→
        ↓
  code-reviewer     ──→ [BA Lead review] ──→ merge / deploy
```

---

## Quy tắc vận hành

1. **BA Lead kích hoạt — agent không tự chuyển giao.** Mỗi bước phải có lệnh rõ ràng từ BA Lead.
2. **Vòng sửa:** Agent 2 có thể gửi comment → Agent 1 sửa → Agent 2 re-review; tối đa 2 vòng trước khi báo BA Lead quyết định thủ công.
3. **Parallel được phép giữa:** Agent 4 (process-modeler) và Agent 1+2+3 (vẽ As-Is từ nguồn có sẵn trong khi phân tích đang chạy).
4. **Checkpoint bàn giao BA → DEV là cứng:** Không bỏ qua — đây là điều kiện tiên quyết để DEV không build sai spec.
5. **PC (Agent 5) chạy độc lập**, không thuộc chuỗi bàn giao; gọi bất cứ lúc nào để nhắc việc.

