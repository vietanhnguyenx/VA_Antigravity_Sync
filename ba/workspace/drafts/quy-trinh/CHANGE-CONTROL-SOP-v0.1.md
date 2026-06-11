---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Change Control SOP"
---

# SOP Kiểm soát Thay đổi Yêu cầu — TOSS

> Quy trình quản lý mọi thay đổi đối với yêu cầu đã được phê duyệt. **Không được sửa tài liệu Approved mà không có Change Request (CR) tương ứng.**

---

## 1. Khi nào cần Change Request (CR)?

CR bắt buộc khi:
- Thêm, sửa, hoặc xóa bất kỳ BR/FR/NFR nào đã có trong tài liệu `Approved`
- Thay đổi phạm vi (scope) đã được stakeholder sign-off
- Phát hiện mâu thuẫn giữa các yêu cầu đã duyệt
- Stakeholder yêu cầu thay đổi sau khi tài liệu đã promote vào `sync/`

CR **không** bắt buộc khi:
- Sửa lỗi chính tả, format trong tài liệu `Draft`
- Thêm ghi chú/annotation không thay đổi nội dung yêu cầu
- Cập nhật tài liệu `workspace/drafts/` chưa được Approve

---

## 2. Luồng Xử lý CR

```
Người yêu cầu          BA Lead              Stakeholder            BA team
      │                    │                     │                    │
  Tạo CR form             │                     │                    │
  (mẫu §3)               │                     │                    │
      │──── Nộp CR ───────►│                     │                    │
      │                Phân tích                │                    │
      │                tác động                 │                    │
      │                    │──── Thẩm định ─────►│                    │
      │                    │◄────────────────────                    │
      │                 Quyết định               │                    │
      │◄─── Phản hồi ──────│                     │                    │
      │                    │──── Phân công ─────────────────────────►│
      │                    │                     │              Cập nhật
      │                    │                     │              tài liệu
      │                    │◄─────────────────────────────────────────
      │                 Review &                 │                    │
      │                 Approve                  │                    │
      │                    │──── Thông báo ──────►│                    │
```

---

## 3. Mẫu Change Request (CR)

**Lưu tại:** `ba/sync/requirements/quan-ly-yeu-cau/NKLR-TOSS-<pham-vi>-v<X.Y>.md`

```markdown
### CR-<NNN> — <Tiêu đề ngắn gọn>

| Trường | Giá trị |
|---|---|
| **CR-ID** | CR-NNN |
| **Ngày yêu cầu** | YYYY-MM-DD |
| **Người yêu cầu** | <Tên — Vai trò — SH-xx> |
| **Loại thay đổi** | Thêm mới / Chỉnh sửa / Xóa / Làm rõ |
| **Mức độ ưu tiên** | Khẩn cấp / Cao / Trung bình / Thấp |
| **Trạng thái** | Đề xuất → Đang xem xét → Chấp thuận / Từ chối |

**Mô tả thay đổi:**
<Mô tả chi tiết thay đổi cần thực hiện>

**Lý do / Bối cảnh:**
<Tại sao cần thay đổi? Vấn đề gì phát sinh?>

**Tài liệu bị ảnh hưởng:**
| Tài liệu | Mục bị ảnh hưởng | Loại thay đổi |
|---|---|---|
| BRD-TOSS-001 | §3.1.2 | Chỉnh sửa |
| SRS-TOSS-001 | §FR-012 | Chỉnh sửa + thêm |

**Phân tích Tác động:**
- DEV: <Ảnh hưởng đến triển khai>
- QC: <Ảnh hưởng đến test case>
- Timeline: <Ảnh hưởng đến tiến độ>
- Risk: <Rủi ro nếu chấp thuận / từ chối>

**Quyết định của BA Lead:**
- [ ] Chấp thuận — Thực hiện theo phân công bên dưới
- [ ] Từ chối — Lý do: ___
- [ ] Hoãn — Lý do + thời hạn xem xét lại: ___

**Phân công thực hiện (nếu Chấp thuận):**
| Tài liệu | Người thực hiện | Deadline |
|---|---|---|
| | | |

**Ngày đóng CR:** ___
```

---

## 4. Thời hạn Xử lý

| Mức ưu tiên | Phân tích tác động | Quyết định | Thực hiện |
|---|---|---|---|
| Khẩn cấp | Trong ngày | Trong ngày | 1–2 ngày |
| Cao | 1 ngày | 2 ngày | 3–5 ngày |
| Trung bình | 2 ngày | 3 ngày | 1–2 tuần |
| Thấp | 3 ngày | 5 ngày | Sprint tiếp theo |

---

## 5. Quy tắc Đánh số CR

- Format: `CR-<NNN>` (số thứ tự tăng dần toàn dự án)
- Ví dụ: `CR-001`, `CR-002`, ...
- Không tái sử dụng số đã dùng dù CR bị từ chối

---

## 6. Sau khi CR được Chấp thuận

1. Cập nhật tài liệu bị ảnh hưởng trong `workspace/drafts/` (version tăng minor)
2. BA Lead re-review và approve lại
3. Promote phiên bản mới vào `sync/requirements/` (giữ phiên bản cũ làm lịch sử)
4. Cập nhật RTM
5. Đóng CR trong NKLR

---

## 7. Liên kết

- NKLR: [`ba/sync/requirements/quan-ly-yeu-cau/`](../../sync/requirements/quan-ly-yeu-cau/)
- RTM: [`ba/sync/models/RTM-template-v0.1.md`](../../sync/models/RTM-template-v0.1.md)
- SOP Luồng: [SOP-LUONG-TAI-LIEU-v0.1.md](SOP-LUONG-TAI-LIEU-v0.1.md)
