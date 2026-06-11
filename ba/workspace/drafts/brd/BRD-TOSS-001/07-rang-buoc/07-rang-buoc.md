---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "BRD — §7 Ràng buộc"
parent: "BRD-TOSS-001-v0.1.md §7"
---

# §7 — Ràng buộc (Constraints)

## 7.1 Ràng buộc Pháp lý

| Mã | Ràng buộc | Nguồn |
|---|---|---|
| CON-LEG-01 | Tuân thủ **NĐ 53/2022/NĐ-CP** — dữ liệu khai thác phải lưu trữ trên lãnh thổ Việt Nam | REF-02 §Pháp lý |
| CON-LEG-02 | Tuân thủ **NĐ 13/2023/NĐ-CP** — bảo vệ dữ liệu cá nhân (hành khách, nhân sự, tổ bay) | REF-02 §Pháp lý |
| CON-LEG-03 | Tuân thủ quy định an toàn bay **CAAV** và tiêu chuẩn **ICAO Annex 6, IATA OCC** | CLAUDE.md §2 |
| CON-LEG-04 | **Quyền sở hữu toàn diện** kiến trúc, mã nguồn, dữ liệu khai thác thuộc về VNA | REF-02 §Pháp lý |

## 7.2 Ràng buộc Kỹ thuật

| Mã | Ràng buộc | Nguồn |
|---|---|---|
| CON-TEC-01 | Kiến trúc **Microservices, Cloud-native CNCF**, tách biệt tầng giao diện–nghiệp vụ–dữ liệu | REF-04 |
| CON-TEC-02 | **SLA tối thiểu 99%** độ sẵn sàng cao (High Availability) | REF-02 §Giám sát vận hành |
| CON-TEC-03 | Sizing: **200 CCU**, **500 request/giây**, **10 KB/request** | REF-05 |
| CON-TEC-04 | Dung lượng dữ liệu: **5 TB** (1.5 TB DB + 3.5 TB file) | REF-05 |
| CON-TEC-05 | Tích hợp qua **API Gateway + Webhook + Message Queue** — không dùng kết nối point-to-point | REF-04 |
| CON-TEC-06 | Hỗ trợ song song **Batch + Streaming** (Kafka/Spark Streaming) | REF-02 §Nền tảng lưu trữ |
| CON-TEC-07 | Đa định dạng dữ liệu: SQL, JSON/XML, phi cấu trúc (PDF, ảnh) | REF-02 |
| CON-TEC-08 | Web Mobile tương thích **iOS, Android, iPadOS** | REF-03/02 §Web Mobile |
| CON-TEC-09 | **An toàn Thông tin cấp độ 3** theo NĐ 85/2016 & TT 12/2022 | REF-02 §Bảo mật |

## 7.3 Ràng buộc Thời gian & Phạm vi

| Mã | Ràng buộc | Nguồn |
|---|---|---|
| CON-TIM-01 | Mốc triển khai: **T8/2026 → T8/2031** *(cần đối chiếu trong tài liệu nguồn gốc — Q-17)* | *(chưa xác nhận)* |
| CON-TIM-02 | Hiện đang ở **giai đoạn Discovery & Requirements Analysis** | CLAUDE.md §1 |
| CON-TIM-03 | Workflow tài liệu: **P4 — Co-evolution Hybrid** | CLAUDE.md §1 |
