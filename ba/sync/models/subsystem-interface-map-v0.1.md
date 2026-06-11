---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Mô hình — Bản đồ Giao diện Phân hệ"
---

# Bản đồ Giao diện Phân hệ — TOSS

> Mô tả các điểm giao tiếp (interface) giữa 7 phân hệ TOSS: dữ liệu chia sẻ, sự kiện trigger, và luồng thông tin. Là cơ sở để xác định integration point cho DEV và API contracts cho QC.

---

## 1. Tổng quan Phân hệ

```
                    ┌──────────────────────────────────────┐
                    │            MASTER DATA (3.7)         │
                    │  (Tàu bay, Sân bay, Phi công, v.v.)  │
                    └────────────────┬─────────────────────┘
                                     │ Cung cấp dữ liệu nền
          ┌──────────────────────────┼──────────────────────────┐
          ▼                          ▼                          ▼
┌─────────────────┐       ┌──────────────────┐       ┌─────────────────┐
│  KHAI THÁC BAY  │◄─────►│   QUẢN LÝ TỔ BAY │       │  BẢO DƯỠNG &   │
│     (3.1)       │       │      (3.2)        │◄─────►│  KỸ THUẬT (3.3)│
│  OCC/Dispatch   │       │  Crew Scheduling  │       │  Maintenance   │
└────────┬────────┘       └─────────┬─────────┘       └────────┬────────┘
         │                          │                           │
         │                          └──────────────────────────┘
         ▼                                                       │
┌─────────────────┐                                    ┌────────▼────────┐
│   KHAI THÁC     │◄────────────────────────────────── │   AN TOÀN &     │
│   MẶT ĐẤT (3.4)│                                    │  TUÂN THỦ (3.5) │
│ Ground Handling │                                    │  Safety/SMS     │
└────────┬────────┘                                    └────────┬────────┘
         │                                                       │
         └──────────────────────┬────────────────────────────────┘
                                ▼
                    ┌──────────────────────┐
                    │   BÁO CÁO & THỐNG KÊ │
                    │        (3.6)          │
                    │  Dashboard / Reports  │
                    └──────────────────────┘
```

---

## 2. Chi tiết Giao diện Giữa Phân hệ

### 2.1 Khai thác Bay (3.1) ↔ Quản lý Tổ bay (3.2)

| Luồng | Dữ liệu / Sự kiện | Chiều | Tần suất | Ghi chú |
|---|---|---|---|---|
| Chuyến bay cần tổ bay | Flight schedule + Aircraft type | 3.1 → 3.2 | Theo lịch | Kích hoạt phân công crew |
| Xác nhận tổ bay đủ điều kiện | Crew assignment + qualification status | 3.2 → 3.1 | Theo yêu cầu | Kiểm tra FTL trước cấp phép |
| Thay đổi giờ bay | Updated departure/arrival time | 3.1 → 3.2 | Real-time | Tổ bay cần được thông báo ngay |
| Báo cáo sự kiện tổ bay | Fatigue report, incident | 3.2 → 3.1 | Event-driven | Ảnh hưởng đến phân công |

### 2.2 Khai thác Bay (3.1) ↔ Khai thác Mặt đất (3.4)

| Luồng | Dữ liệu / Sự kiện | Chiều | Tần suất | Ghi chú |
|---|---|---|---|---|
| Kế hoạch chuyến bay | ETD, ETA, Aircraft reg, Stand | 3.1 → 3.4 | Theo lịch | Phân công nguồn lực mặt đất |
| Cập nhật trạng thái chuyến bay | Delay, divert, cancel | 3.1 → 3.4 | Real-time | Điều chỉnh kế hoạch mặt đất |
| Hoàn thành Turnaround | Off-block actual time | 3.4 → 3.1 | Real-time | Xác nhận chuyến bay đã khởi hành |
| Yêu cầu dịch vụ đặc biệt | Special handling request | 3.1 → 3.4 | Per flight | VIP, cargo đặc biệt |

### 2.3 Khai thác Bay (3.1) ↔ Bảo dưỡng (3.3)

| Luồng | Dữ liệu / Sự kiện | Chiều | Tần suất | Ghi chú |
|---|---|---|---|---|
| Trạng thái khả năng bay tàu bay | Airworthy / AOG / MEL restrictions | 3.3 → 3.1 | Real-time | Blocking nếu AOG |
| Defect được phát hiện trong chuyến | Tech log entry | 3.1 → 3.3 | Post-flight | Từ phi công báo cáo |
| Yêu cầu bảo dưỡng gấp | Urgent maintenance request | 3.1 → 3.3 | Event-driven | |
| Cập nhật trạng thái MEL | MEL item status + dispatch conditions | 3.3 → 3.1 | Per change | Dispatcher cần biết |

### 2.4 Quản lý Tổ bay (3.2) ↔ Bảo dưỡng (3.3)

| Luồng | Dữ liệu / Sự kiện | Chiều | Tần suất | Ghi chú |
|---|---|---|---|---|
| Lịch bảo dưỡng kéo dài | Maintenance window affecting crew planning | 3.3 → 3.2 | Theo lịch | Ảnh hưởng đến phân công tổ bay |

### 2.5 Tất cả Phân hệ → An toàn (3.5)

| Nguồn | Dữ liệu / Sự kiện | Ghi chú |
|---|---|---|
| 3.1 Khai thác Bay | Delay report, diversion, incident | Phân tích nguyên nhân |
| 3.2 Tổ bay | Fatigue report, FTL breach | Báo cáo bắt buộc CAAV |
| 3.3 Bảo dưỡng | Technical defect, AOG event | Safety investigation |
| 3.4 Mặt đất | Ground incident, damage report | |

### 2.6 Tất cả Phân hệ → Báo cáo (3.6)

| Dữ liệu tổng hợp | Nguồn | KPI Dashboard |
|---|---|---|
| On-time Performance (OTP) | 3.1 | Tỷ lệ đúng giờ theo tuyến, ngày |
| Crew utilization | 3.2 | Giờ bay thực tế vs kế hoạch |
| Aircraft utilization | 3.1 + 3.3 | Block hours, AOG time |
| Turnaround performance | 3.4 | TAT actual vs standard |
| Safety incidents | 3.5 | Số sự cố theo category |

### 2.7 Master Data (3.7) → Tất cả Phân hệ

| Dữ liệu | Sử dụng bởi |
|---|---|
| Danh mục tàu bay (Aircraft register) | 3.1, 3.3, 3.4 |
| Danh mục sân bay (Airport) | 3.1, 3.4 |
| Danh mục phi hành đoàn (Crew) | 3.2 |
| Loại tàu bay + TAT chuẩn | 3.1, 3.4 |
| Delay codes | 3.1 |
| Ground service types | 3.4 |

---

## 3. Hệ thống Bên ngoài Tích hợp

| Hệ thống | Loại tích hợp | Phân hệ TOSS | Giao thức | Ghi chú |
|---|---|---|---|---|
| ACARS | Real-time data feed | 3.1 | ACARS protocol | Nhận vị trí và trạng thái chuyến bay |
| Flight Planning System | API pull | 3.1 | REST/SOAP | Nhận Flight Plan đã approved |
| CAMO System | Bidirectional | 3.3 | TBD | *(chưa có — cần làm rõ)* |
| Voffice (trình ký) | Workflow integration | 3.1 | REST | *(chưa có — cần làm rõ)* |
| CAAV Reporting Portal | API push | 3.5 | TBD | Báo cáo sự cố bắt buộc |

---

## 4. Điểm Cần Làm Rõ

| # | Câu hỏi | Liên quan | Người trả lời |
|---|---|---|---|
| IQ-01 | Giao thức tích hợp ACARS cụ thể? (ARINC 618, 619?) | 3.1 | SH-08 (Tech Lead) |
| IQ-02 | CAMO System là hệ thống nào? API có sẵn không? | 3.3 | SH-05 + SH-08 |
| IQ-03 | Voffice tích hợp theo luồng nào (push/pull/webhook)? | 3.1 | SH-08 |
| IQ-04 | Báo cáo CAAV: file format và endpoint? | 3.5 | SH-07 |
| IQ-05 | Real-time data từ ACARS có delay tối đa bao nhiêu? | 3.1 | SH-08 |
