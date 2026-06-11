---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "1.0"
date: "2026-06-04"
status: "Draft"
document_type: "Presentation — AI Agents trong Tổ chức Dự án"
audience: "PM, BA Team, Stakeholder kỹ thuật"
---

# Tổ chức Dự án Kết hợp AI Agents
### Phương pháp & Case Study TOSS

---

## Slide 1: Tiêu đề

### Trình bày

```
┌──────────────────────────────────────────────────────┐
│                                                      │
│   TỔ CHỨC DỰ ÁN KẾT HỢP AI AGENTS                  │
│                                                      │
│   Từ công cụ đến thành viên nhóm —                  │
│   mô hình phân vai Human + Agent                    │
│                                                      │
│   Case Study:  TOSS — Hệ thống Điều hành            │
│                Khai thác Hàng không                  │
│                                                      │
│   BA Lead  ·  2026-06-04                            │
│                                                      │
└──────────────────────────────────────────────────────┘
```

### Thuyết minh

Hôm nay tôi không trình bày về một dự án cụ thể — tôi trình bày về một **cách làm việc mới**: đưa AI Agents vào cấu trúc nhóm như những thành viên có vai trò rõ ràng, không phải chỉ là công cụ hỗ trợ tùy hứng. TOSS là dự án thực chúng tôi đang triển khai, dùng làm minh chứng cụ thể cho từng luận điểm.

---

## Slide 2: AI Agents là gì?

### Trình bày

```
  AI TOOL thông thường          AI AGENT
  ────────────────────          ─────────────────────────
  Người hỏi → AI trả lời        Người giao nhiệm vụ →
  1 vòng, thụ động              Agent tự lập kế hoạch
  Không có bộ nhớ ngữ cảnh     Dùng tools: đọc file,
  Không thực thi được           viết file, chạy lệnh
                                 Nhiều bước, có kiểm tra
                                 Báo cáo kết quả
```

**Ba đặc điểm định nghĩa AI Agent:**

| # | Đặc điểm | Ý nghĩa thực tế |
|---|---|---|
| 1 | **Autonomy** | Tự quyết định các bước trung gian |
| 2 | **Tool use** | Đọc/ghi file, search, gọi lệnh |
| 3 | **Context memory** | Nhớ toàn bộ ngữ cảnh dự án |

### Thuyết minh

Sự khác biệt cốt lõi: AI tool là **người trả lời câu hỏi**, AI Agent là **người thực hiện nhiệm vụ**. Khi tôi gõ vào ChatGPT "viết email cho tôi" — đó là AI tool. Khi tôi gõ vào Claude Code "đọc yêu cầu trong file SRS, tạo bộ câu hỏi phỏng vấn phù hợp với vai trò Dispatcher, lưu vào đúng thư mục với đúng format" — và agent tự làm hết — đó là AI Agent. Điểm mấu chốt: agent có **tools** — khả năng đọc file, viết file, tìm kiếm — và có **ngữ cảnh** — nó biết đang ở dự án nào, nguyên tắc là gì, tài liệu nguồn ở đâu.

---

## Slide 3: Tại sao Agents thay đổi cách tổ chức dự án?

### Trình bày

**Mô hình cũ — Nhân lực thuần:**
```
Senior BA soạn SRS → Junior BA review → Lead approve
     [3 ngày]             [2 ngày]         [1 ngày]
     Mỗi người làm thủ công từ đầu
```

**Mô hình mới — Human + Agent:**
```
Senior BA cung cấp ngữ cảnh
     ↓
Agent sinh draft SRS (cấu trúc, trích dẫn nguồn, ID tự động)
     ↓ [30 phút]
Senior BA review nội dung & phán đoán nghiệp vụ
     ↓
Agent check Quality Gate tự động (Gate 1, 2, 5)
     ↓
Lead approve nội dung — không mất thời gian check format
```

**Kết quả:** Senior BA dành thời gian cho *phán đoán*, không cho *định dạng*.

### Thuyết minh

Vấn đề của mô hình cũ không phải là thiếu người giỏi — mà là người giỏi đang làm những việc không cần giỏi mới làm được: căn chỉnh tiêu đề, kiểm tra link, đánh số ID, viết frontmatter YAML. Agent làm tốt hơn con người ở những việc đó: nhanh hơn, nhất quán hơn, không mỏi. Mô hình mới giải phóng thời gian của Senior BA để tập trung vào điều thực sự quan trọng: đặt câu hỏi đúng với stakeholder, phán đoán khi yêu cầu mâu thuẫn, quyết định đánh đổi. Trong case study TOSS, trong vài ngày làm việc, chúng tôi đã có 14 tài liệu quy trình BA hoàn chỉnh — điều mà thông thường mất vài tuần với cả team làm thủ công.

---

## Slide 4: Nguyên tắc Phân vai — Ranh giới Bất biến

### Trình bày

```
        BA HUMAN                        BA AGENTS
        ─────────                       ──────────
   Quyết định WHAT                  Thực thi HOW
   ─────────────────                ────────────────────
   • Suy diễn nghiệp vụ            • Sinh artifact từ rule
   • Quan hệ stakeholder           • Kiểm tra nhất quán
   • Phê duyệt tài liệu            • Format + cấu trúc hóa
   • Ưu tiên yêu cầu               • Cross-reference
   • Xử lý conflict                • Transform + export
   • Ký tên chịu trách nhiệm       • Tổng hợp từ nguồn

           ↕ Vùng phối hợp ↕
   Human đặt câu hỏi ←→ Agent phát hiện vấn đề
```

**Quy tắc quyết định:** Có cần *phán đoán* không? → Human. Có thể *đọc nguồn + áp rule*? → Agent.

### Thuyết minh

Đây là nguyên tắc không thể thỏa hiệp. Nếu để agent suy diễn thay con người — bạn sẽ có tài liệu trông rất chuyên nghiệp nhưng chứa đầy giả định chưa được xác nhận. Ngược lại, nếu để con người làm tất cả những gì agent có thể làm — bạn lãng phí năng lực và thời gian. Ranh giới này cũng là cơ sở để **tin tưởng output của agent**: vì agent chỉ được làm những gì có rule rõ ràng, output của nó có thể kiểm chứng — mỗi câu đều truy vết về nguồn gốc cụ thể.

---

## Slide 5: Mô hình Tổ chức Team Kết hợp

### Trình bày

```
                    ┌─────────────┐
                    │   BA LEAD   │ — Govern, Approve, Decide
                    └──────┬──────┘
          ┌─────────────────┼──────────────────┐
          ▼                 ▼                  ▼
    ┌───────────┐    ┌───────────┐     ┌───────────────────┐
    │ SENIOR BA │    │  MID BA   │     │    AI AGENTS      │
    │           │    │           │     │  ───────────────  │
    │ Chủ trì   │◄──►│ Thực hiện │◄──►│  business-analyst │
    │ phán đoán │    │ có review │     │  ba-reviewer      │
    │ nghiệp vụ │    │           │     │  gen-mockup       │
    └───────────┘    └───────────┘     │  export-word      │
          ▲                 ▲          │  requirement-val. │
    ┌───────────┐    ┌───────────┐     └───────────────────┘
    │ JUNIOR BA │    │  INTERN   │
    │ Ghi chép  │    │  Research │
    └───────────┘    └───────────┘
```

**→ Agent là "thành viên" có skill rõ, không có quyền quyết định**

### Thuyết minh

Điểm mới của mô hình này: AI Agents không phải là hộp công cụ ai cũng dùng tùy thích — chúng được **đặt vào sơ đồ tổ chức** với vai trò cụ thể, skill được phân công, và giới hạn quyền hạn rõ ràng. Giống như Junior BA không được tự ý approve tài liệu, agent không được tự ý publish output ra ngoài mà không có Human review. Cách tiếp cận này tạo ra **accountability** — khi có sự cố, ta biết chính xác ở đâu trong luồng có vấn đề.

---

## Slide 6: Skill Matrix — Ai dùng Agent nào?

### Trình bày

**Phân cấp sử dụng Agent theo Role:**

| Skill / Agent | BA Lead | Senior | Mid | Junior | Intern |
|---|---|---|---|---|---|
| `/interview` — câu hỏi phỏng vấn | Chủ trì | Độc lập | Hỗ trợ | Quan sát | Quan sát |
| `/brd` — Business Req. Doc | Chủ trì | Độc lập | Hỗ trợ | — | — |
| `/userstory` — User Story + AC | Chủ trì | Độc lập | Độc lập | Hỗ trợ | Quan sát |
| `/meeting-notes` — biên bản họp | Chủ trì | Độc lập | Độc lập | Độc lập | Hỗ trợ |
| `gen-mockup` — HTML prototype | Chủ trì | Độc lập | Độc lập | Hỗ trợ | Quan sát |
| `ba-reviewer` — review tài liệu | Chủ trì | Độc lập | Hỗ trợ | — | — |

**Mức độ:** Chủ trì (tự quyết) · Độc lập (cần review) · Hỗ trợ (cần hướng dẫn) · Quan sát

### Thuyết minh

Không phải ai cũng được dùng mọi agent theo mọi cách. Chúng tôi xây dựng Skill Matrix — tương tự ma trận kỹ năng trong quản lý nhân sự, nhưng áp dụng cho cả công cụ AI. Lý do: agent mạnh nên phải dùng đúng chỗ. Senior BA có thể độc lập dùng `/brd` vì họ biết khi nào output cần điều chỉnh. Junior BA quan sát trước — học cách kiểm tra output, không copy mù quáng. Điều này cũng là cơ sở để **onboard** thành viên mới: ngày 1 đọc Onboarding Guide, ngày 2 biết mình được dùng skill nào ở mức nào.

---

## Slide 7: Luồng Phối hợp Human–Agent

### Trình bày

```
  HUMAN INPUT            AGENT EXECUTION           HUMAN VALIDATION
  ────────────           ────────────────           ─────────────────
  Quyết định scope  →   Đọc tài liệu nguồn    →   Review nội dung
  Cung cấp ngữ cảnh     Áp rule + template         Phán đoán nghiệp vụ
  Phê duyệt nguồn        Sinh draft có dẫn nguồn    Phát hiện sai sót
                         Tự check Gate 1/2/5   →   Approve hoặc yêu cầu sửa
                         ↓
                    [Output đã kiểm tra]
                         ↓
                    Human publish vào sync/
                    (promote khi đã Approved)
```

**Vòng lặp:** Input → Draft → Check → Review → Approve (hoặc Revise)

### Thuyết minh

Đây là vòng lặp cơ bản của mọi artifact trong dự án. Điểm quan trọng: agent không chỉ sinh ra và giao — nó còn **tự kiểm tra** (Quality Gate tự động) trước khi đưa cho Human review. Điều này có nghĩa là Human reviewer không phải đọc để tìm lỗi format hay placeholder còn sót — agent đã làm việc đó. Human chỉ cần tập trung vào **nội dung nghiệp vụ có đúng không**. Một điểm quan trọng khác: agent không được publish trực tiếp vào khu vực "sync" — luôn cần Human approve và thực hiện bước promote cuối cùng.

---

## Slide 8: Cấu trúc Không gian Làm việc

### Trình bày

```
  WORKSPACE (cá nhân, thử nghiệm)    SYNC (nhóm, đã duyệt)
  ─────────────────────────────       ─────────────────────
  input/                              requirements/
    ├── meeting-notes/      ←→          ├── brd/  (đã Approve)
    ├── domain-knowledge/               ├── srs/  (đã Approve)
    └── [tài liệu nguồn]               └── quan-ly-yeu-cau/
  drafts/                             models/
    ├── phan-tich/                       ├── RTM
    ├── brd/  srs/  wireframe/           ├── compliance-trace
    ├── mockup/                          └── interface-map
    └── quy-trinh/                    output/
                                        ├── human/ (Word QT02)
  AGENT: đọc workspace/               └── agents/ (DEV/QC)
          → ghi workspace/
  HUMAN: promote → sync/
```

### Thuyết minh

Cấu trúc workspace là **vật lý hóa** của nguyên tắc phân quyền. Workspace là nơi thử nghiệm — agent thoải mái đọc và ghi, con người thoải mái sửa và thử. Sync là nơi chính thức — chỉ có BA Lead được promote tài liệu vào đây. Phần output/agents đặc biệt thú vị: đây là nơi chứa tài liệu được tối ưu hóa để **agent downstream** (agent DEV, agent QC) đọc — dense, machine-readable, không có prose thừa. Điều này tạo ra chuỗi: BA Human → BA Agent → DEV Agent → QC Agent, mỗi handoff đều có format phù hợp cho người nhận.

---

## Slide 9: Case Study TOSS — Kết quả Áp dụng

### Trình bày

**Bối cảnh:** Hệ thống quản lý khai thác hàng không, 7 phân hệ, tuân thủ CAAV/ICAO

**Trong thời gian ngắn, team BA đã thiết lập:**

| Hạng mục | Số lượng | Cách làm |
|---|---|---|
| Tài liệu quy trình BA | 14 tài liệu | Agent sinh + Human review |
| Slash commands BA | 6 commands | Agent thực thi theo rule |
| Skills đầu ra | 2 skills | Agent xuất, Human duyệt |
| Từ điển thuật ngữ HK | ~30 thuật ngữ | Agent cấu trúc, domain expert xác nhận |
| Bản đồ giao diện phân hệ | 7 phân hệ × interface | Agent vẽ, BA Lead xác nhận logic |

**Thời gian so sánh:**
- Thủ công truyền thống: ước tính 3–4 tuần với cả team
- Với Human + Agent: vài ngày làm việc

### Thuyết minh

Đây là số liệu thực tế từ TOSS. Điều tôi muốn nhấn mạnh không phải là tốc độ — mà là **chất lượng nhất quán**. Tất cả 14 tài liệu có cùng frontmatter YAML, cùng cấu trúc, cùng quy ước đặt tên, cùng cách dẫn nguồn. Điều này hầu như không thể đạt được nếu để nhiều người làm độc lập theo kiểu truyền thống. Agent đảm bảo nhất quán; Human đảm bảo đúng về nghiệp vụ. Một hạn chế thực tế cần nói thẳng: những gì đòi hỏi phán đoán domain — như điền tên nhân sự, chọn ưu tiên chiến lược, quyết định scope — vẫn chờ con người. Agent không giải quyết được phần đó.

---

## Slide 10: Áp dụng cho Dự án của Bạn

### Trình bày

**5 bước để bắt đầu:**

```
1. XÁC ĐỊNH RANH GIỚI
   Liệt kê: hoạt động nào cần phán đoán (Human)
            hoạt động nào có thể rule hóa (Agent)

2. THIẾT LẬP GOVERNANCE
   CLAUDE.md: nguyên tắc, cấu trúc, rule bất biến
   Skill Matrix: ai được dùng agent nào, ở mức nào

3. XÂY DỰNG WORKSPACE
   workspace/ (cá nhân) ↔ sync/ (nhóm đã duyệt)
   Quy trình promote rõ ràng

4. TẠO SKILLS THEO NHU CẦU
   Bắt đầu với skills cốt lõi nhất
   Mỗi skill = rule rõ ràng, không suy diễn

5. VẬN HÀNH VÀ TINH CHỈNH
   Chạy thử → phát hiện ranh giới sai → điều chỉnh
   Agent giỏi hơn khi rule được viết tốt hơn
```

**Điều kiện cần:** Rule rõ · Governance nghiêm · Human luôn review cuối

### Thuyết minh

Mô hình này không chỉ áp dụng cho BA — bất kỳ nhóm nào làm việc với tài liệu phức tạp, nhiều người, nhiều phiên bản đều có thể áp dụng. Điều kiện tiên quyết: phải đầu tư thời gian viết rule rõ ràng ở đầu. Nếu rule mơ hồ, agent sẽ suy diễn và output không đáng tin. Nhưng khi rule tốt — agent trở thành thành viên nhóm đáng tin cậy nhất: không nghỉ phép, không mệt mỏi, không quên convention, luôn dẫn nguồn. Câu hỏi không còn là "có nên dùng AI không" — mà là "tổ chức AI vào nhóm như thế nào để kiểm soát được".

---

*v1.0 — 2026-06-04*
*Thời lượng: 18–20 phút + 10 phút Q&A*
*Đối tượng: PM, BA Team, Stakeholder kỹ thuật*
