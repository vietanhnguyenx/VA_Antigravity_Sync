---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Review & Approval"
---

# Quy trình Review & Approval Tài liệu BA — TOSS

---

## 1. Nguyên tắc

- Mỗi tài liệu **bắt buộc ít nhất 1 lượt peer review** trước khi lên BA Lead
- BA Lead là người **duy nhất có quyền Approve** và promote vào `sync/`
- Feedback phải **cụ thể và có thể hành động** — không comment chung chung
- Tác giả có **quyền phản biện** nhưng BA Lead quyết định cuối

---

## 2. Người Review theo Loại Tài liệu

| Loại tài liệu | Peer Reviewer | BA Lead Review | Stakeholder Review |
|---|---|---|---|
| BRD | Senior BA (không phải tác giả) | Bắt buộc | Bắt buộc (sign-off) |
| SRS — chương chung (01, 02, 04, 05) | Senior BA | Bắt buộc | Không bắt buộc |
| SRS — đặc tả phân hệ (03-x) | BA cùng nhóm + BA phân hệ khác | Bắt buộc | Stakeholder phân hệ đó |
| Wireframe | Mid/Senior BA + 1 BA khác | Bắt buộc | Stakeholder phân hệ đó |
| Mockup | Senior BA + 1 BA khác | Bắt buộc | Stakeholder (demo) |
| User Story | BA peer | BA Lead | Stakeholder (sprint review) |
| NKLR entry | BA peer | BA Lead | Không |
| Quy trình nội bộ (quy-trinh/) | Senior BA | BA Lead | Không |

---

## 3. Thời hạn

| Loại reviewer | Thời hạn (ngày làm việc) | Hành động nếu quá hạn |
|---|---|---|
| Peer review | 2 ngày | Tác giả nhắc trực tiếp |
| BA Lead review | 2 ngày | Tác giả leo thang lên PM |
| Stakeholder review | 5 ngày | BA Lead nhắc + ghi rủi ro |
| Chỉnh sửa sau review | 1–3 ngày | Tác giả tự ước lượng + thông báo |

---

## 4. Format Feedback

Mỗi comment trong file phải theo cấu trúc:

```
[REVIEW-<TÊN>-<NGÀY>] <Vị trí> — <Nội dung comment> — <Loại: Lỗi/Gợi ý/Câu hỏi>
```

Ví dụ:
```
[REVIEW-ANHA-20260605] §3.1.2 dòng 45 — Luồng phê duyệt thiếu trường hợp timeout 
— Lỗi (bắt buộc sửa)

[REVIEW-ANHA-20260605] §3.1.4 — Gợi ý tách bảng trạng thái ra file riêng để dễ 
tái sử dụng — Gợi ý (tùy chọn)
```

Tác giả xử lý comment bằng cách thêm:
```
[RESOLVED-20260606] Đã thêm trường hợp timeout 30 phút → tự động reject
```

---

## 5. Tiêu chí Approve

BA Lead approve khi tài liệu đáp ứng **tất cả** tiêu chí:

- [ ] Mọi comment `Lỗi` đã được giải quyết (RESOLVED)
- [ ] Không còn nội dung `*(chưa có)*` hoặc `*(chưa rõ)*` chưa được flag
- [ ] Quality Gate đã pass (xem [QUALITY-GATE.md](QUALITY-GATE.md))
- [ ] Phiên bản và ngày trong frontmatter đã cập nhật
- [ ] Stakeholder sign-off (nếu yêu cầu) đã nhận

---

## 6. Escalation & Xử lý Bất đồng

| Tình huống | Xử lý |
|---|---|
| Peer và tác giả không thống nhất | BA Lead phân xử trong 1 ngày |
| BA Lead vắng | Senior BA quyết định tạm thời, ghi `[TEMP-APPROVED]` |
| Stakeholder reject sau Approve | Tạo CR mới, không rollback — xem [CHANGE-CONTROL-SOP.md](CHANGE-CONTROL-SOP.md) |
| Review kéo dài > 5 ngày | PM được thông báo, có thể rút ngắn scope review |
