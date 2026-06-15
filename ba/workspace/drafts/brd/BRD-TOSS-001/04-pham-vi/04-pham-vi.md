---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-10"
status: "Draft"
document_type: "BRD — §4 Phạm vi"
parent: "BRD-TOSS-001-v0.2.md §4"
source: "REF-02 + REF-04 §III.1.2"
---

# §4 — Phạm vi Dự án

## 4.1 Trong phạm vi (In-Scope)

| # | Phân hệ / Năng lực | Nguồn |
|---|---|---|
| IS-01 | **Phân hệ Thông tin điều hành chuyến bay** — bảng điều khiển OCC, cảnh báo bất thường, theo dõi tổ bay FTL, quản lý đa Carrier | REF-03/01 |
| IS-02 | **Phân hệ Quản lý tài liệu chuyến bay** — OFP, NOTAM, WX, LS, GD, PM, NOTOC, Manifest; quản lý phiên bản; xác thực điện tử; Web Mobile | REF-03/02 |
| IS-03 | **Phân hệ Báo cáo & Tối ưu khai thác** — OTP, nhiên liệu, Tankering, thời gian bay, tải trọng, tổ bay | REF-03/03 |
| IS-04 | **Phân hệ Quản lý danh mục** — tàu bay, sân bay, chặng bay, tổ bay; single source of truth; đồng bộ qua API/Webhook | REF-03/04 |
| IS-05 | **Phân hệ Quản trị hệ thống** — vòng đời người dùng, RBAC, MFA/2FA, SSO/LDAP, audit log | REF-03/05 |
| IS-06 | **Tích hợp** với: Lido, AMOS, PSS/DCS, MO+, LDAP/AD, Flight Radar24 | REF-02 |
| IS-07 | **Hạ tầng & vận hành 24/7** — microservices, cloud-native CNCF, Kubernetes, CI/CD, monitoring | REF-04 |

## 4.1.1 Cấu trúc Function List / Menu (bổ sung theo họp 09/06/2026)

Kết quả workshop thiết kế Function List *(REF-08 §1)*:
- **5 cụm nghiệp vụ chính:** Flight Operation · Flight Dispatch · **Flight Load Control** · Station Manager · cụm tàu bay/sân bay/chặng bay.
- **3 cụm quản trị tách riêng (level 0):** **System Admin** · **Data Monitoring** · **Data Maintenance** (DBM/danh mục). Đã **chốt tách Data Maintenance thành menu riêng** *(DEC-09-01)*.
- **Danh mục (master data) vs nghiệp vụ:** danh mục là dữ liệu cơ sở phục vụ nghiệp vụ phía trên; đồng bộ tự động hàng ngày; giá trị chính là **phục vụ cảnh báo** (vd cảnh báo MEL) cho tầng nghiệp vụ.

> *Ánh xạ cụm menu ↔ 5 phân hệ (IS-01…IS-05) sẽ chi tiết hóa trong SRS. Người quyết định DEC-09-01 chờ xác nhận.*

## 4.2 Ngoài phạm vi (Out-of-Scope)

| # | Hạng mục | Lý do | Cần xác nhận |
|---|---|---|---|
| OOS-01 | Hệ thống **Ops++** — TOSS tích hợp, KHÔNG thay thế | Ops++ tiếp tục là hệ thống khai thác chính | SH-10 |
| OOS-02 | Hệ thống **AMOS** (MRO) — TOSS đọc dữ liệu MEL/CDL, KHÔNG quản lý bảo dưỡng | AMOS tiếp tục do phòng Kỹ thuật vận hành | SH-11 |
| OOS-03 | Hệ thống **LIDO** (flight planning) — TOSS nhận OFP, KHÔNG thay thế LIDO | LIDO là hệ thống lập kế hoạch bay chuyên biệt | SH-11 |
| OOS-04 | Hệ thống **PSS/DCS** (đặt chỗ, check-in) — TOSS nhận manifest, KHÔNG xử lý thương mại | PSS/DCS thuộc Commercial division | SH-10 |
| OOS-05 | **Crew Rostering nâng cao** (phân công lịch bay dài hạn) | *(chưa có — cần làm rõ qua phỏng vấn SH-10)* | SH-10 |
| OOS-06 | **Safety Reporting** (báo cáo sự cố an toàn) | *(chưa có — cần làm rõ qua phỏng vấn SH-10)* | SH-10 |
| OOS-07 | **Ground Handling chi tiết** (turnaround coordination, gate assignment) | *(chưa có — cần làm rõ qua phỏng vấn SH-10)* | SH-10 |

## 4.3 Ranh giới hệ thống (System Boundary)

```
┌─────────────────────────────────────────────────────────────────┐
│                          TOSS                                   │
│  ┌──────────────┐  ┌──────────────┐  ┌────────────────────┐    │
│  │ Điều hành    │  │ Tài liệu     │  │ Báo cáo & Tối ưu  │    │
│  │ chuyến bay   │  │ chuyến bay   │  │ khai thác          │    │
│  └──────────────┘  └──────────────┘  └────────────────────┘    │
│  ┌──────────────┐  ┌─────────────────────────────────────────┐  │
│  │ Quản lý      │  │ Quản trị hệ thống (IAM/RBAC/SSO)       │  │
│  │ danh mục     │  └─────────────────────────────────────────┘  │
│  └──────────────┘                                               │
└────────────────────────────┬────────────────────────────────────┘
                 API Gateway / Message Queue / Webhook
     ┌──────────┬──────────┬──────────┬──────────┬──────────┐
   Lido       AMOS      PSS/DCS    MO+       LDAP/AD  Flight
  (OFP)    (MEL/CDL) (Manifest) (TL số)  (Identity) Radar24
```

*[Nguồn: REF-02 §Tổng quan + REF-04 §III.1.2]*
