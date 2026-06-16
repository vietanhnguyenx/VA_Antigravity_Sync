---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-10"
status: "Draft"
document_type: "BRD — §8 Giả định & Phụ thuộc"
parent: "BRD-TOSS-001-v0.2.md §8"
---

# §8 — Giả định & Phụ thuộc

## 8.1 Giả định (Assumptions)

| Mã | Giả định | Xác nhận bởi |
|---|---|---|
| ASM-01 | Các hệ thống vệ tinh (Lido, AMOS, PSS/DCS, MO+, LDAP/AD) **hiện có và sẵn sàng cung cấp API/Webhook** cho TOSS | SH-07, SH-11 |
| ASM-02 | VNA sẽ **cung cấp tài khoản truy cập** vào các hệ thống vệ tinh để TOSS tích hợp | SH-10, SH-07 |
| ASM-03 | VNA đã có **danh sách vai trò (Role) và ma trận phân quyền** ban đầu để khởi tạo RBAC | SH-07 |
| ASM-04 | VNA sẵn sàng **tham gia phỏng vấn stakeholder** trong giai đoạn Discovery | SH-10 |
| ASM-05 | Hạ tầng cloud (theo bảng Sizing) sẽ được **Viettel cung cấp** theo Đề xuất kỹ thuật | REF-05 |
| ASM-06 | Vận hành liên tục **24/7/365** | REF-03/00 |
| ASM-07 | File tài liệu từ hệ thống nguồn (GDPM…) có **quy ước đặt tên ổn định** đủ để auto-gắn vào chuyến bay (BR-TOSS-032) — xác minh tại buổi khảo sát luồng GDPM | REF-08 §3 + Action Item 1 |

## 8.2 Phụ thuộc bên ngoài

| Mã | Phụ thuộc | Bên cung cấp |
|---|---|---|
| DEP-01 | OFP, NOTAM, WX, Briefing Package | Lido |
| DEP-02 | MEL/CDL, defects, lịch bảo dưỡng | AMOS |
| DEP-03 | LS, GD, PM, NOTOC, Cargo/Mail Manifest | PSS/DCS |
| DEP-04 | Trạng thái tài liệu chuyến bay | MO Plus |
| DEP-05 | Định danh người dùng VNA | LDAP/AD Tổng công ty |
| DEP-06 | Vị trí và hành trình bay thực tế | Flight Radar24 |
| DEP-07 | Hạ tầng cloud + đường truyền | Viettel (theo REF-05) |
| DEP-08 | Điện văn ACARS (dữ liệu nhiên liệu, đơn vị đo theo từng tàu/giai đoạn) | Nguồn ACARS *(cần khảo sát — REF-08 Action Item 2)* |
