---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Template Nhật ký Phiên BA"
---

# Template Nhật ký Phiên Làm việc BA — TOSS

> Mẫu chuẩn cho file nhật ký tự động sinh tại `logs/ba-sessions/YYYY-MM-DD-HHMM.md`.  
> Agent Claude Code ghi tự động sau mỗi phiên làm việc BA. BA team dùng để truy vết quyết định và thay đổi.

---

## Cấu trúc File Nhật ký

Tên file: `logs/ba-sessions/YYYY-MM-DD-HHMM.md`  
Ví dụ: `logs/ba-sessions/2026-06-04-1430.md`

---

## Template Nội dung

```markdown
---
project: "TOSS"
date: "YYYY-MM-DD"
time: "HH:MM"
session_type: "Analysis | Review | Interview | Workshop | Planning"
participants: "<Tên — Vai trò>"
duration_minutes: 0
---

# Nhật ký Phiên BA — YYYY-MM-DD HH:MM

## Mục tiêu Phiên
<Mô tả ngắn mục tiêu chính của phiên làm việc này>

## Phân hệ / Chủ đề Làm việc
- Phân hệ: <3.1 / 3.2 / ... / Chung>
- Loại công việc: <Phân tích / Viết SRS / Review / Mockup / ...>

## Tóm tắt Công việc Đã Làm

### Hoạt động chính
1. <Hoạt động 1 — kết quả>
2. <Hoạt động 2 — kết quả>
3. <Hoạt động 3 — kết quả>

### Tài liệu đã tạo / cập nhật
| File | Loại | Thay đổi | Trạng thái |
|---|---|---|---|
| `ba/workspace/drafts/.../...` | SRS / BRD / Wireframe | Tạo mới / Cập nhật | Draft v0.x |

## Quyết định Đã Đưa ra
| # | Quyết định | Lý do | Người quyết định |
|---|---|---|---|
| DEC-NNN | <Nội dung quyết định> | <Lý do> | <Tên> |

## Câu hỏi / Nội dung Cần Làm rõ
| # | Câu hỏi | Phân hệ | Người trả lời | Deadline |
|---|---|---|---|---|
| Q-NNN | <Câu hỏi> | <3.x> | <SH-xx hoặc tên> | <Ngày> |

## Action Items
| # | Nhiệm vụ | Người thực hiện | Deadline |
|---|---|---|---|
| 1 | <Nhiệm vụ cụ thể> | <Tên> | <Ngày> |

## Ghi chú Khác
<Quan sát, rủi ro, hoặc thông tin hữu ích khác>

## Phiên Làm việc Tiếp theo
- **Dự kiến:** <Ngày/Giờ>
- **Chủ đề:** <Chủ đề chính>
- **Cần chuẩn bị:** <Tài liệu hoặc thông tin cần có trước phiên>
```

---

## Hướng dẫn Sử dụng

### Khi nào tạo nhật ký?
- Sau mỗi phiên làm việc BA có sử dụng Claude Code CLI (tự động)
- Sau buổi họp, workshop, hoặc phỏng vấn stakeholder (thủ công nếu cần)
- Khi có quyết định quan trọng được đưa ra

### Ai duy trì?
- **Agent (Claude Code):** Tự sinh sau phiên làm việc — ghi hoạt động kỹ thuật
- **BA member:** Bổ sung phần quyết định, câu hỏi, và action items sau họp

### Truy vết từ nhật ký
Nhật ký là nguồn truy vết không chính thức. Khi quyết định từ nhật ký trở thành yêu cầu chính thức:
1. Tạo CR nếu ảnh hưởng tài liệu đã Approved
2. Cập nhật tài liệu trong `workspace/drafts/`
3. Không cần mirror nhật ký sang `sync/` (nhật ký là tài liệu tạm)

### Thời hạn Lưu trữ
- Giữ tất cả nhật ký trong vòng đời dự án
- Không xóa nhật ký ngay cả khi phiên không có kết quả quan trọng
- Nhật ký là bằng chứng quá trình làm việc, hỗ trợ audit trail

---

## Ví dụ Nhật ký Thực tế

```markdown
---
project: "TOSS"
date: "2026-06-04"
time: "14:30"
session_type: "Analysis"
participants: "BA Lead, Senior BA — Nguyễn Văn A"
duration_minutes: 90
---

# Nhật ký Phiên BA — 2026-06-04 14:30

## Mục tiêu Phiên
Phân tích tài liệu VNAOCC_TOSS_đề xuất KT v0.3, trích xuất yêu cầu phân hệ 3.1

## Phân hệ / Chủ đề Làm việc
- Phân hệ: 3.1 — Quản lý Khai thác Bay
- Loại công việc: Phân tích tài liệu nguồn

## Tóm tắt Công việc Đã Làm

### Hoạt động chính
1. Đọc chương 3 tài liệu đề xuất KT — Trích xuất 8 yêu cầu nghiệp vụ OCC
2. Ghi chú As-Is quy trình Dispatch hiện tại (thủ công) — 5 bước chính
3. Xác định 3 pain point: thiếu real-time data, xử lý delay thủ công, thiếu lịch sử

### Tài liệu đã tạo / cập nhật
| File | Loại | Thay đổi | Trạng thái |
|---|---|---|---|
| `ba/workspace/drafts/phan-tich/phan-tich-3.1-khai-thac-bay.md` | Phân tích | Tạo mới | Draft v0.1 |

## Quyết định Đã Đưa ra
| # | Quyết định | Lý do | Người quyết định |
|---|---|---|---|
| DEC-001 | Tích hợp ACARS là yêu cầu Must-have | OTP phụ thuộc real-time data | BA Lead |

## Câu hỏi / Nội dung Cần Làm rõ
| # | Câu hỏi | Phân hệ | Người trả lời | Deadline |
|---|---|---|---|---|
| Q-001 | ACARS protocol là ARINC 618 hay 619? | 3.1 | SH-08 | 2026-06-10 |

## Action Items
| # | Nhiệm vụ | Người thực hiện | Deadline |
|---|---|---|---|
| 1 | Lên lịch phỏng vấn Dispatcher (SH-02) | BA Lead | 2026-06-06 |
| 2 | Tiếp tục phân tích chương 4 đề xuất KT | Senior BA | 2026-06-07 |
```
