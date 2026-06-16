---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — SOP Luồng Tài liệu BA"
---

# SOP Luồng Tài liệu BA — TOSS

> Quy trình chuẩn cho vòng đời một tài liệu BA: từ nháp cá nhân đến tài liệu thống nhất nhóm và đầu ra giao khách hàng.

---

## 1. Tổng quan Luồng

```
[Tác giả]                [Peer]           [BA Lead]         [Stakeholder]
    │                       │                  │                   │
  Draft                     │                  │                   │
  (workspace/drafts/)        │                  │                   │
    │──── Peer Review ──────►│                  │                   │
    │     (comment)          │                  │                   │
    │◄────────────────────────                  │                   │
  Revise                     │                  │                   │
    │──── BA Lead Review ───────────────────────►│                   │
    │     (approve/reject)                       │                   │
    │◄────────────────────────────────────────────                   │
  Finalize                                       │                   │
    │──── Promote → sync/ ──────────────────────►│                   │
    │                                            │                   │
    │                                    Export Word ───────────────►│
```

---

## 2. Các Trạng thái Tài liệu

| Trạng thái | Ý nghĩa | Vị trí |
|---|---|---|
| `Draft` | Đang soạn thảo, chưa review | `workspace/drafts/` |
| `In Review` | Đang trong quá trình review | `workspace/drafts/` |
| `Approved` | Đã được BA Lead duyệt | `sync/requirements/` |
| `Published` | Đã xuất Word giao khách hàng | `sync/output/human/exports/` |
| `Superseded` | Đã có phiên bản mới thay thế | Giữ nguyên, đánh dấu lịch sử |

---

## 3. Quy trình Chi tiết

### Bước 1 — Soạn thảo (Draft)

**Người thực hiện:** BA Chủ trì phân hệ (Senior/Mid BA)

1. Tạo file trong `ba/workspace/drafts/<loại>/`
2. Đặt tên: `<TYPE>-TOSS-<NNN>-<mo-ta>-v0.<n>.md`
3. Điền YAML frontmatter đầy đủ (status: `Draft`)
4. Mọi phát biểu phải dẫn nguồn từ `workspace/input/`
5. Ghi rõ mọi điểm chưa rõ vào mục *"Nội dung cần làm rõ"*

### Bước 2 — Peer Review

**Người thực hiện:** BA cùng nhóm (không phải tác giả)
**Thời hạn:** 2 ngày làm việc

1. Đọc toàn bộ tài liệu
2. Comment trực tiếp vào file (dùng prefix `[REVIEW-<tên>]`)
3. Kiểm tra theo **Quality Gate** ([QUALITY-GATE.md](QUALITY-GATE.md))
4. Kết luận: `Approved` / `Needs Revision` / `Rejected`

### Bước 3 — Chỉnh sửa

**Người thực hiện:** Tác giả

1. Xử lý từng comment, ghi `[RESOLVED]` khi đã sửa
2. Tăng minor version: `v0.1 → v0.2`
3. Cập nhật `date` trong frontmatter
4. Nếu thay đổi lớn → vòng Peer Review mới

### Bước 4 — BA Lead Review & Approve

**Người thực hiện:** BA Lead
**Thời hạn:** 2 ngày làm việc

1. Review lần cuối theo Quality Gate
2. Quyết định:
   - **Approve:** đổi `status: Approved`, bump version lên `v1.0`
   - **Reject:** ghi rõ lý do, trả về Bước 3

### Bước 5 — Promote vào sync/

**Người thực hiện:** BA Lead

1. Copy file đã Approved vào `ba/sync/requirements/<loại>/`
2. Tạo entry trong NKLR nếu là phiên bản cập nhật
3. Thông báo cho team qua kênh chính thức

### Bước 6 — Xuất Word (khi cần giao khách hàng)

**Người thực hiện:** Senior BA (thực hiện), BA Lead (duyệt)

1. Cập nhật manifest tại `.claude/skills/export-word/manifests/`
2. Chạy skill `export-word`
3. QC file xuất (xem checklist trong skill)
4. Lưu vào `ba/sync/output/human/exports/` với tên có version + ngày
5. BA Lead ký duyệt trước khi gửi khách hàng

---

## 4. Thời hạn & Cam kết

| Bước | Thời hạn | Người chịu trách nhiệm |
|---|---|---|
| Peer Review | 2 ngày làm việc | Peer được phân công |
| BA Lead Review | 2 ngày làm việc | BA Lead |
| Chỉnh sửa sau review | 1–3 ngày (tùy khối lượng) | Tác giả |
| Xuất Word | 1 ngày | Senior BA |

---

## 5. Ngoại lệ & Leo thang

- Nếu review quá 3 ngày không có phản hồi → tác giả nhắc nhở trực tiếp
- Nếu BA Lead vắng > 3 ngày → Senior BA được quyền approve tạm thời, ghi chú rõ
- Tài liệu khẩn (deadline < 2 ngày) → BA Lead review ngay trong ngày

---

## 6. Liên kết

- Quality Gate: [QUALITY-GATE.md](QUALITY-GATE.md)
- Change Control: [CHANGE-CONTROL-SOP.md](CHANGE-CONTROL-SOP.md)
- Role & Permission: [PHAN-CONG-ROLE-BA-v0.1.md](PHAN-CONG-ROLE-BA-v0.1.md)
- NKLR: [`ba/sync/requirements/quan-ly-yeu-cau/`](../../sync/requirements/quan-ly-yeu-cau/)
