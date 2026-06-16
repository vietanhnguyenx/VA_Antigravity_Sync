---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-10"
status: "Draft"
document_type: "BRD — §10 Câu hỏi mở"
parent: "BRD-TOSS-001-v0.2.md §10"
---

# §10 — Câu hỏi Mở / Nội dung Cần Làm Rõ

> Danh sách câu hỏi cần thu thập **trước khi chuyển sang SRS**. Tổ chức phỏng vấn stakeholder để chốt. Dùng `/interview <role>` để soạn bộ câu hỏi chi tiết.

## Phân nhóm theo Stakeholder

### SH-04 — Trực ban OCC
- [ ] Q-01: Pain point cụ thể khi giám sát chuyến bay? Mất bao lâu phát hiện và xử lý gián đoạn?
- [ ] Q-02: Hệ thống/công cụ hiện tại? Hạn chế chính?
- [ ] Q-03: Danh sách trường thông tin mặc định trên bảng điều khiển OCC?

### SH-05 — Điều phái (Dispatcher)
- [ ] Q-04: Quy trình Dispatch Release hiện tại — phần mềm gì, giấy hay điện tử?
- [ ] Q-05: Quy trình Tankering — ai quyết định, dựa trên dữ liệu nào, mất bao lâu?
- [ ] Q-06: Ngưỡng sai lệch Payload/ZFW để kích cảnh báo?
- [ ] Q-08: OTP hiện tại của VNA là bao nhiêu %? Mục tiêu?

### SH-03 — Phi hành đoàn
- [ ] Q-07: Quy trình Request/Confirm/Reject trên MO Plus hiện tại? Điểm cần cải thiện?
- [ ] Q-09: Yêu cầu UX Web Mobile — thiết bị mục tiêu, điều kiện kết nối tại hiện trường?

### SH-06 — Lãnh đạo
- [ ] Q-10: KPI cụ thể muốn theo dõi? Giá trị mục tiêu OTP, tiết kiệm Tankering, độ chính xác Payload?
- [ ] Q-11: Báo cáo hàng ngày gửi ai, deadline mấy giờ?

### SH-09 — System Admin
- [ ] Q-12: Danh sách vai trò (Role) ban đầu và ma trận quyền sơ bộ?
- [ ] Q-13: Cơ chế kết nối LDAP/AD hiện tại?

### SH-10 / SH-11 — PM & Architect VTIT
- [ ] Q-14: Mốc thời gian T8/2026 → T8/2031 được xác nhận trong tài liệu nguồn nào?
- [ ] Q-15: Ưu tiên triển khai theo phân hệ hay theo wave (MVP → mở rộng)?
- [ ] Q-16: Carrier cụ thể nào dự kiến dùng chung nền tảng TOSS?
- [ ] Q-17: Phạm vi OOS-05, OOS-06, OOS-07 (Crew Rostering, Safety, Ground Handling) — phase nào?
- [ ] Q-18: Các hệ thống vệ tinh đã có API chuẩn chưa hay cần phát triển adapter?

### Phát sinh từ họp 09/06/2026 (REF-08 — MM-20260609)
- [ ] Q-19: Bulk upload phân biệt tài liệu theo **tên file hay content**? — chốt sau **buổi khảo sát luồng GDPM** *(Action Item 1)*.
- [ ] Q-20: **Đơn vị nhiên liệu trong điện văn ACARS** theo từng giai đoạn, từng tàu — khảo sát nguồn để lập bảng hệ số quy đổi *(Action Item 2)*.
- [ ] Q-21: **Nguồn dữ liệu danh mục dịch vụ sân bay** (hiện thủ công, không trích xuất được) — ai cung cấp, định dạng nào? *(Action Item 3)*.
- [ ] Q-22: **Định nghĩa Category/nhóm đội tàu** cho từng loại báo cáo (fuel flow / taxi time / định mức nhiên liệu) *(Action Item 4)*.
- [ ] Q-23: **Định danh người dự họp 09/06 & người quyết định** các DEC-09-01…06 — cần xác nhận trước khi nâng trạng thái BR-TOSS-031…040; đồng thời **hợp nhất bộ mã SH** giữa BRD gốc và STAKEHOLDER-REGISTER.
- [ ] Q-24: **Ưu tiên MoSCoW** cho BR-TOSS-031…040 — chờ BA Lead/PO xếp loại.

## Trạng thái
| Mã | Câu hỏi | Trạng thái | Ngày chốt |
|---|---|---|---|
| Q-01 đến Q-18 | Xem trên | ⬜ Chờ phỏng vấn | — |
| Q-19 đến Q-24 | Từ họp 09/06/2026 (REF-08) | ⬜ Chờ khảo sát/xác nhận | — |
