---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Tổng hợp — Bộ Quy trình BA"
---

# Bộ Quy trình BA — TOSS: Tài liệu Tổng hợp

> Mô tả tổng quan toàn bộ **14 tài liệu quy trình BA** của dự án TOSS — mục đích, vị trí lưu trữ, thời điểm sử dụng, và người duy trì. Dùng làm điểm khởi đầu tra cứu cho toàn bộ BA team.

---

## Cách đọc tài liệu này

Mỗi entry gồm:
- **Tên file** — đường dẫn tương đối từ `ba/`
- **Mục đích** — tài liệu này giải quyết vấn đề gì
- **Dùng khi** — tình huống cụ thể cần tra cứu
- **Người duy trì** — ai có trách nhiệm cập nhật

---

## NHÓM 1 — Nền tảng (Foundation)

### 1.1 SOP Luồng Tài liệu
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/SOP-LUONG-TAI-LIEU-v0.1.md` |
| **Mục đích** | Quy trình chuẩn vòng đời tài liệu: Draft → Peer Review → BA Lead Approve → sync/ → Export Word |
| **Dùng khi** | Bắt đầu soạn tài liệu mới; không chắc bước tiếp theo là gì; cần biết ai review cái gì |
| **Người duy trì** | BA Lead |

---

### 1.2 Stakeholder Register
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/STAKEHOLDER-REGISTER-v0.1.md` |
| **Mục đích** | Danh sách đầy đủ stakeholder dự án: vai trò, mức ảnh hưởng, kỳ vọng, kênh liên lạc, RACI |
| **Dùng khi** | Lên lịch phỏng vấn; cần biết ai sign-off tài liệu nào; lập kế hoạch giao tiếp |
| **Người duy trì** | BA Lead *(cần điền tên nhân sự cụ thể)* |

---

### 1.3 BA Roadmap
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/BA-ROADMAP-v0.1.md` |
| **Mục đích** | Kế hoạch tổng thể 5 phase BA: Discovery → Phân tích → Tài liệu hóa → Review → Handoff |
| **Dùng khi** | Onboarding thành viên mới; báo cáo tiến độ với PM; lên kế hoạch sprint BA |
| **Người duy trì** | BA Lead |

---

## NHÓM 2 — Phối hợp Nhóm (Team Coordination)

### 2.1 Review & Approval Flow
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/REVIEW-APPROVAL-FLOW-v0.1.md` |
| **Mục đích** | Ai review loại tài liệu nào, thời hạn, format feedback, tiêu chí approve, cách xử lý bất đồng |
| **Dùng khi** | Chuẩn bị gửi tài liệu để review; cần biết format comment; bất đồng giữa reviewer và tác giả |
| **Người duy trì** | BA Lead |

---

### 2.2 Meeting Cadence
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/MEETING-CADENCE-v0.1.md` |
| **Mục đích** | Lịch và quy tắc các loại họp: Weekly Sync, Workshop, Review Session, BA–DEV Sync |
| **Dùng khi** | Lên lịch họp; chuẩn bị agenda; ghi biên bản họp (template đính kèm) |
| **Người duy trì** | BA Lead |

---

### 2.3 Definition of Done
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/DEFINITION-OF-DONE-v0.1.md` |
| **Mục đích** | Tiêu chí hoàn thành cụ thể cho từng loại artifact: BRD, SRS, Wireframe, Mockup, User Story, RTM |
| **Dùng khi** | Trước khi gửi peer review; tác giả tự kiểm tra; BA Lead review |
| **Người duy trì** | BA Lead |

---

### 2.4 Onboarding Guide
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/ONBOARDING-GUIDE-v0.1.md` |
| **Mục đích** | Hướng dẫn từng bước cho thành viên mới: đọc tài liệu nào, cài gì, làm quen với workspace, thực hành skill theo cấp bậc |
| **Dùng khi** | Thành viên mới gia nhập team BA; sau khi được phân công role cụ thể |
| **Người duy trì** | BA Lead (cập nhật khi có thay đổi tool/process) |

---

## NHÓM 3 — Chất lượng & Truy vết (Quality & Traceability)

### 3.1 Quality Gate
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/QUALITY-GATE-v0.1.md` |
| **Mục đích** | Checklist 5 cổng kiểm tra (Gate 1–5): cấu trúc, nội dung, truy vết, đặc thù từng loại, ngôn ngữ |
| **Dùng khi** | Trước khi promote tài liệu Draft → sync/; peer review; BA Lead review cuối |
| **Người duy trì** | BA Lead |

---

### 3.2 RTM Template
| | |
|---|---|
| **File** | `sync/models/RTM-template-v0.1.md` |
| **Mục đích** | Ma trận truy vết BR→FR→US→TC pre-fill cho 7 phân hệ TOSS; bảng tóm tắt độ phủ |
| **Dùng khi** | Sau khi BRD draft đầu tiên; cập nhật mỗi khi có BR/FR mới; trước khi handoff DEV |
| **Người duy trì** | Senior BA phụ trách từng phân hệ + BA Lead tổng hợp |

---

### 3.3 Change Control SOP
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/CHANGE-CONTROL-SOP-v0.1.md` |
| **Mục đích** | Quy trình xử lý Change Request (CR): khi nào cần, mẫu CR, thời hạn, luồng phê duyệt, cập nhật sau approve |
| **Dùng khi** | Stakeholder yêu cầu thay đổi sau khi tài liệu đã Approved; phát hiện mâu thuẫn yêu cầu |
| **Người duy trì** | BA Lead |

---

## NHÓM 4 — Đặc thù TOSS / Hàng không

### 4.1 Từ điển Thuật ngữ TOSS
| | |
|---|---|
| **File** | `workspace/input/domain-knowledge/toss-glossary-v0.1.md` |
| **Mục đích** | Định nghĩa ~30 thuật ngữ hàng không đặc thù: ACARS, OCC, FTL, MEL, Dispatch, Turnaround, v.v. |
| **Dùng khi** | Gặp thuật ngữ lạ trong tài liệu nguồn; kiểm tra cách dùng nhất quán trong SRS/BRD |
| **Người duy trì** | Senior BA (bổ sung liên tục trong quá trình phân tích) |

---

### 4.2 Ma trận Truy vết Tuân thủ
| | |
|---|---|
| **File** | `sync/models/compliance-trace-v0.1.md` |
| **Mục đích** | Map yêu cầu TOSS ↔ điều khoản CAAV-TT03 / ICAO Annex 6 / IATA OCC; theo dõi độ phủ compliance |
| **Dùng khi** | Cần chứng minh TOSS tuân thủ quy định; trước kiểm toán; khi có quy định mới |
| **Người duy trì** | BA Lead + Safety/Compliance Officer (SH-07) |

---

### 4.3 Bản đồ Giao diện Phân hệ
| | |
|---|---|
| **File** | `sync/models/subsystem-interface-map-v0.1.md` |
| **Mục đích** | Mô tả luồng dữ liệu, sự kiện trigger, và điểm tích hợp giữa 7 phân hệ TOSS và hệ thống ngoài (ACARS, CAMO, Voffice) |
| **Dùng khi** | Soạn SRS yêu cầu tích hợp; DEV cần hiểu API contracts; QC thiết kế integration test |
| **Người duy trì** | Senior BA + Tech Lead (SH-08) |

---

### 4.4 Template Nhật ký Phiên BA
| | |
|---|---|
| **File** | `workspace/drafts/quy-trinh/BA-SESSION-LOG-TEMPLATE-v0.1.md` |
| **Mục đích** | Cấu trúc chuẩn cho file nhật ký tại `logs/ba-sessions/`; ghi hoạt động, quyết định, câu hỏi, action items |
| **Dùng khi** | Agent tự sinh sau mỗi phiên; BA member bổ sung sau họp; tra cứu lịch sử quyết định |
| **Người duy trì** | Tự động (agent) + BA member bổ sung thủ công |

---

## Tài liệu Nền tảng Bổ sung (không trong bộ quy-trinh/)

| Tài liệu | Vị trí | Mục đích |
|---|---|---|
| Phân công Role & Skill | `workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md` | Ma trận role × skill × phân hệ × quyền workspace |
| CLAUDE.md | `d:\TOSS\CLAUDE.md` | Toàn bộ quy tắc, cấu trúc, convention dự án — đọc trước tiên |
| HUMAN.md | `d:\TOSS\HUMAN.md` | Bản tiếng Việt của CLAUDE.md |

---

## Thứ tự Đọc cho Thành viên mới

```
1. CLAUDE.md + HUMAN.md          → Nắm toàn bộ framework dự án
2. BA-ROADMAP                    → Biết đang ở phase nào, làm gì tiếp
3. PHAN-CONG-ROLE-BA             → Biết vai trò và quyền hạn của mình
4. ONBOARDING-GUIDE              → Hướng dẫn từng bước thiết lập
5. SOP-LUONG-TAI-LIEU            → Quy trình làm việc hàng ngày
6. DEFINITION-OF-DONE            → Tiêu chí hoàn thành
7. STAKEHOLDER-REGISTER          → Biết ai là ai, liên lạc thế nào
8. toss-glossary                 → Từ điển thuật ngữ khi gặp khái niệm lạ
```

---

## Trạng thái Tài liệu (Tổng quan)

| # | Tài liệu | Trạng thái | Cần hành động |
|---|---|---|---|
| 1 | SOP-LUONG-TAI-LIEU | Draft v0.1 | BA Lead review & approve |
| 2 | STAKEHOLDER-REGISTER | Draft v0.1 | **Điền tên nhân sự cụ thể** |
| 3 | BA-ROADMAP | Draft v0.1 | Điền ngày cụ thể sau khi có project schedule |
| 4 | REVIEW-APPROVAL-FLOW | Draft v0.1 | BA Lead review & approve |
| 5 | MEETING-CADENCE | Draft v0.1 | Xác nhận lịch họp weekly sync |
| 6 | DEFINITION-OF-DONE | Draft v0.1 | BA Lead review & approve |
| 7 | ONBOARDING-GUIDE | Draft v0.1 | Cập nhật khi tool/process thay đổi |
| 8 | QUALITY-GATE | Draft v0.1 | BA Lead review & approve |
| 9 | RTM-template | Draft v0.1 | Điền BR/FR khi BRD hoàn thành |
| 10 | CHANGE-CONTROL-SOP | Draft v0.1 | BA Lead review & approve |
| 11 | toss-glossary | Draft v0.1 | Bổ sung liên tục khi phân tích |
| 12 | compliance-trace | Draft v0.1 | Điền BR/FR + xác nhận với SH-07 |
| 13 | subsystem-interface-map | Draft v0.1 | Làm rõ IQ-01 → IQ-05 với SH-08 |
| 14 | BA-SESSION-LOG-TEMPLATE | Draft v0.1 | Sử dụng ngay từ phiên đầu tiên |

---

*Tài liệu tổng hợp này cần cập nhật khi thêm/xóa/đổi tên bất kỳ tài liệu quy trình nào.*
