---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-10"
status: "Draft"
document_type: "BRD — §11 RTM sơ bộ"
parent: "BRD-TOSS-001-v0.2.md §11"
---

# §11 — Ma trận Truy vết sơ bộ (BR → Phân hệ → Nguồn)

> Bản đầy đủ sẽ được mở rộng khi có SRS: BR → FR → FUNC → US → TC

| BR | Tên ngắn | Phân hệ | File nguồn phân rã | BG liên quan |
|---|---|---|---|---|
| BR-TOSS-001 | Hợp nhất thông tin chuyến bay | 1. Điều hành chuyến bay | `02-giai-phap-nghiep-vu/01-phan-he-thong-tin-dieu-hanh-chuyen-bay.md` | BG-001, BG-002 |
| BR-TOSS-002 | Cảnh báo bất thường | 1. Điều hành chuyến bay | `02-giai-phap-nghiep-vu/01-...md` | BG-002 |
| BR-TOSS-003 | Truy vết lịch sử & Divert | 1. Điều hành chuyến bay | `02-giai-phap-nghiep-vu/01-...md` | BG-002 |
| BR-TOSS-004 | Đa Carrier | 1. Điều hành chuyến bay | `02-giai-phap-nghiep-vu/01-...md` | BG-001 |
| BR-TOSS-005 | Giám sát FTL tổ bay | 1. Điều hành chuyến bay | `02-giai-phap-nghiep-vu/01-...md` | BG-006 |
| BR-TOSS-006 | Số hóa tài liệu chuyến bay | 2. Quản lý tài liệu | `02-giai-phap-nghiep-vu/02-...md` | BG-003 |
| BR-TOSS-007 | Revision Control | 2. Quản lý tài liệu | `02-giai-phap-nghiep-vu/02-...md` | BG-003 |
| BR-TOSS-008 | Request/Confirm/Reject | 2. Quản lý tài liệu | `02-giai-phap-nghiep-vu/02-...md` | BG-003 |
| BR-TOSS-009 | Liên tục khi mất kết nối | 2. Quản lý tài liệu | `02-giai-phap-nghiep-vu/02-...md` | BG-003 |
| BR-TOSS-010 | Web Mobile tổ bay | 2. Quản lý tài liệu | `02-giai-phap-nghiep-vu/02-...md` | BG-003 |
| BR-TOSS-011 | Đối soát Payload/ZFW | 2. Quản lý tài liệu | `02-giai-phap-nghiep-vu/02-...md` | BG-006 |
| BR-TOSS-012 | Báo cáo khai thác hàng ngày | 3. Báo cáo & Tối ưu | `02-giai-phap-nghiep-vu/03-...md` | BG-002 |
| BR-TOSS-013 | OTP/OSP & biến động lịch | 3. Báo cáo & Tối ưu | `02-giai-phap-nghiep-vu/03-...md` | BG-005 |
| BR-TOSS-014 | Nhiên liệu & Tankering | 3. Báo cáo & Tối ưu | `02-giai-phap-nghiep-vu/03-...md` | BG-004 |
| BR-TOSS-015 | Phân tích thời gian bay | 3. Báo cáo & Tối ưu | `02-giai-phap-nghiep-vu/03-...md` | BG-005 |
| BR-TOSS-016 | Tải trọng & nguồn lực tổ bay | 3. Báo cáo & Tối ưu | `02-giai-phap-nghiep-vu/03-...md` | BG-006 |
| BR-TOSS-017 | Xuất báo cáo đa định dạng | 3. Báo cáo & Tối ưu | `02-giai-phap-nghiep-vu/03-...md` | BG-002 |
| BR-TOSS-018 | Single Source of Truth danh mục | 4. Quản lý danh mục | `02-giai-phap-nghiep-vu/04-...md` | BG-001 |
| BR-TOSS-019 | Đồng bộ danh mục qua API | 4. Quản lý danh mục | `02-giai-phap-nghiep-vu/04-...md` | BG-001, BG-008 |
| BR-TOSS-020 | Tham số vận hành linh hoạt | 4. Quản lý danh mục | `02-giai-phap-nghiep-vu/04-...md` | BG-001 |
| BR-TOSS-021 | Vòng đời người dùng | 5. Quản trị hệ thống | `02-giai-phap-nghiep-vu/05-...md` | BG-007 |
| BR-TOSS-022 | RBAC tới từng API | 5. Quản trị hệ thống | `02-giai-phap-nghiep-vu/05-...md` | BG-007 |
| BR-TOSS-023 | MFA/2FA | 5. Quản trị hệ thống | `02-giai-phap-nghiep-vu/05-...md` | BG-007 |
| BR-TOSS-024 | SSO/LDAP | 5. Quản trị hệ thống | `02-giai-phap-nghiep-vu/05-...md` | BG-007 |
| BR-TOSS-025 | Audit log | 5. Quản trị hệ thống | `02-giai-phap-nghiep-vu/05-...md` | BG-007 |
| BR-TOSS-026 | Tích hợp MO+ | 6. Tích hợp | `01-tong-quan-giai-phap/01-...md` | BG-003 |
| BR-TOSS-027 | Tích hợp Lido | 6. Tích hợp | `01-tong-quan-giai-phap/01-...md` | BG-003 |
| BR-TOSS-028 | Tích hợp AMOS | 6. Tích hợp | `02-giai-phap-nghiep-vu/04-...md` | BG-001 |
| BR-TOSS-029 | Tích hợp PSS/DCS | 6. Tích hợp | `02-giai-phap-nghiep-vu/02-...md` | BG-001 |
| BR-TOSS-030 | Liên kết Flight Radar24 | 6. Tích hợp | `02-giai-phap-nghiep-vu/01-...md` | BG-002 |
| BR-TOSS-031 | Flight Load Control (3 nhóm chức năng) | 2. Quản lý tài liệu | `Customer_docs/meeting-notes/MM-20260609-...md` §3 | BG-002 |
| BR-TOSS-032 | Bulk upload tài liệu nhiều chuyến | 2. Quản lý tài liệu | `MM-20260609` §3 + DEC-09-03 | BG-003 |
| BR-TOSS-033 | Retention tài liệu theo nguồn gốc | 2. Quản lý tài liệu | `MM-20260609` §4 + DEC-09-04 | BG-003 |
| BR-TOSS-034 | Nghiệp vụ Station Manager | 2. Quản lý tài liệu | `MM-20260609` §4 | BG-003 |
| BR-TOSS-035 | Data Monitoring (độ phủ/độ chính xác dữ liệu) | 3. Báo cáo & Tối ưu | `MM-20260609` §7 + DEC-09-05 | BG-002 |
| BR-TOSS-036 | Vòng đời & lịch sử tàu bay; sở hữu/thuê khô/ướt | 4. Quản lý danh mục | `MM-20260609` §5 + DEC-09-06 | BG-001, BG-002 |
| BR-TOSS-037 | Thuộc tính tàu & Category đội tàu | 4. Quản lý danh mục | `MM-20260609` §5 + DEC-09-06 | BG-001, BG-002 |
| BR-TOSS-038 | Hệ số quy đổi nhiên liệu ACARS | 4. Quản lý danh mục | `MM-20260609` §5 | BG-002 |
| BR-TOSS-039 | Danh mục dịch vụ sân bay & cảnh báo APU | 4. Quản lý danh mục | `MM-20260609` §6 | BG-002 |
| BR-TOSS-040 | Phân quyền theo chức năng, ẩn/hiện cột theo quyền | 5. Quản trị hệ thống | `MM-20260609` §2 + DEC-09-02 | BG-006 |

## Coverage

| Phân hệ | Số BR | % Must Have |
|---|---|---|
| 1. Điều hành chuyến bay | 5 | 80% (4/5) |
| 2. Quản lý tài liệu | 10 | 60% (6/10) — 4 BR mới chưa xếp |
| 3. Báo cáo & Tối ưu | 7 | 57% (4/7) — 1 BR mới chưa xếp |
| 4. Quản lý danh mục | 7 | 43% (3/7) — 4 BR mới chưa xếp |
| 5. Quản trị hệ thống | 6 | 83% (5/6) — 1 BR mới chưa xếp |
| 6. Tích hợp | 5 | 80% (4/5) |
| **Tổng** | **40** | **65% (26/40)** — BR-031…040 chờ xếp MoSCoW (Q-24) |

> *BR-TOSS-031…040 bổ sung từ MM-20260609 (v0.2, 2026-06-10) — trạng thái Draft, chờ xác nhận người quyết định (Q-23) và xếp ưu tiên (Q-24).*
