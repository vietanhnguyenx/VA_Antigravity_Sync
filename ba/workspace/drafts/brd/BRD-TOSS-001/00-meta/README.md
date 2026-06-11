---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-10"
status: "Draft"
document_type: "BRD — Meta"
---

# BRD-TOSS-001 — Hướng dẫn sử dụng thư mục

## Cấu trúc

```
BRD-TOSS-001/
├── 00-meta/                        ← Thông tin tài liệu, hướng dẫn
├── 01-gioi-thieu/                  ← §1: Mục đích, phạm vi, tham chiếu, thuật ngữ
├── 02-boi-canh/                    ← §2: Bối cảnh, vấn đề, cơ hội
├── 03-muc-tieu-nghiep-vu/          ← §3: Business Goals (BG-001…BG-009)
├── 04-pham-vi/                     ← §4: In-scope, Out-of-scope, System Boundary
├── 05-stakeholders/                ← §5: Bảng stakeholder, Power-Interest
├── 06-yeu-cau-nghiep-vu/           ← §6: Business Requirements (BR-001…BR-040)
│   ├── 01-dieu-hanh-chuyen-bay/    ←   BR-001…005
│   ├── 02-quan-ly-tai-lieu/        ←   BR-006…011 + BR-031…034 (họp 09/06)
│   ├── 03-bao-cao-toi-uu/          ←   BR-012…017 + BR-035 (họp 09/06)
│   ├── 04-quan-ly-danh-muc/        ←   BR-018…020 + BR-036…039 (họp 09/06)
│   ├── 05-quan-tri-he-thong/       ←   BR-021…025 + BR-040 (họp 09/06)
│   └── 06-tich-hop/                ←   BR-026…030
├── 07-rang-buoc/                   ← §7: Constraints (pháp lý, kỹ thuật, thời gian)
├── 08-gia-dinh-phu-thuoc/          ← §8: Assumptions & Dependencies
├── 09-tieu-chi-thanh-cong/         ← §9: KSI (Key Success Indicators)
├── 10-cau-hoi-mo/                  ← §10: Open questions theo stakeholder
└── 11-phu-luc/                     ← §11: RTM sơ bộ BR → Phân hệ → Nguồn
```

## Tài liệu gốc
- **BRD tổng hợp:** `../BRD-TOSS-001-v0.2.md` (source of truth — cập nhật ở đây trước; v0.1 giữ làm lịch sử)
- **Nguồn PDF:** `ba/workspace/input/vnaocc-proposal-decomposed/`
- **Nguồn họp 09/06/2026 (REF-08):** `ba/workspace/input/Customer_docs/meeting-notes/MM-20260609-thiet-ke-function-list-YCKT-TOSS.md` — bổ sung BR-031…040 ở v0.2

## Quy ước
- Mỗi file phân rã tham chiếu về mục tương ứng trong BRD gốc
- Khi cập nhật nội dung → cập nhật cả BRD gốc + file phân rã
- Version tracking: theo BRD gốc (v0.1 → v0.2…)
