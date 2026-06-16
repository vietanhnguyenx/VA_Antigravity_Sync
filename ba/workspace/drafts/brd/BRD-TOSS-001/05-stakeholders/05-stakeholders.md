---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-10"
status: "Draft"
document_type: "BRD — §5 Stakeholders"
parent: "BRD-TOSS-001-v0.2.md §5"
source: "REF-02 §Cơ cấu phối hợp + CLAUDE.md §3"
---

# §5 — Stakeholders

> Chi tiết đầy đủ xem: `ba/workspace/drafts/quy-trinh/STAKEHOLDER-REGISTER-v0.2.md`

## Bảng tóm tắt

| Mã | Vai trò | Tổ chức | Loại | Kỳ vọng chính |
|---|---|---|---|---|
| SH-01 | Project Sponsor / Đại diện VNA ký hợp đồng | VNA — Ban TGĐ | P1 | Dự án đúng tiến độ, đúng phạm vi, SLA 99% |
| SH-02 | Ban Chỉ đạo VNA | VNA — Ban TGĐ | P2 | Dashboard KPI tóm tắt |
| SH-03 | Đầu mối CNTT & ATTT VNA | VNA — TT CNTT | P1 | Tích hợp chuẩn, bảo mật, quyền sở hữu data |
| SH-04 | Trực ban OCC | VNA — OCC | P1 | Giám sát real-time, cảnh báo màu tức thì |
| SH-05 | Điều phái (Dispatcher) | VNA — OCC/Dispatch | P1 | Dispatch Release số, đồng bộ tài liệu |
| SH-06 | Chuyên viên CLC (Cân bằng tải) | VNA — OCC/CLC | P1 | Nhập tải tự động, cảnh báo vượt giới hạn |
| SH-07 | Đại diện Sân bay (Station) | VNA — Các trạm | P3 | Báo cáo sự kiện, hoạt động khi offline |

> **Bổ sung từ họp 09/06/2026 (REF-08):** kỳ vọng của SH-06 được làm rõ qua cụm **Flight Load Control** — 3 nhóm chức năng: nhập Load & Weight, cung cấp tài liệu chuyến bay, lưu NOTOC (2 loại: hành khách + cargo)/Cargo Manifest *(REF-08 §3)*. Kỳ vọng của SH-07 (**Station Manager**) được làm rõ: menu riêng, chủ yếu checklist an ninh (security) + xem/tải tài liệu *(REF-08 §4)*. **Lưu ý drift:** bảng SH ở file này (theo `STAKEHOLDER-REGISTER-v0.2.md`) khác bộ mã SH trong BRD gốc v0.1/v0.2 §5 — cần BA Lead hợp nhất (xem Q-23 §10).
| SH-08 | Quản trị Danh mục | VNA — OCC/CNTT | P3 | MEL tự động cập nhật từ AMOS |
| SH-09 | Quản trị Hệ thống | VNA — CNTT | P3 | SSO/LDAP, RBAC, audit log |
| SH-10 | Giám đốc Dự án VTIT | VTIT | P1 | Điều phối triển khai, leo thang vấn đề |
| SH-11 | Kiến trúc sư Giải pháp VTIT | VTIT | P1 | Kiến trúc hệ thống, quyết định kỹ thuật |

## Power-Interest Grid (tóm tắt)

```
HIGH POWER │ P2: SH-02          │ P1: SH-01, SH-03, SH-04, SH-05, SH-06
           │ SH-10, SH-11       │     BA Lead (SH-19)
           ├────────────────────┤
LOW POWER  │ P4: (không có)     │ P3: SH-07, SH-08, SH-09
           └────────────────────┴──────────────────────────
                LOW INTEREST          HIGH INTEREST
```
