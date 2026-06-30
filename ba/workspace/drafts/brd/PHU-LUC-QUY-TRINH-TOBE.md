---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-30"
status: "Draft"
document_type: "Phụ lục — Sơ đồ Quy trình To-Be"
---

# Phụ lục — Sơ đồ Quy trình To-Be (To-Be Process Diagrams)

> Các sơ đồ trong phụ lục này được vẽ tay trực tiếp trên draw.io bởi BA Lead, phản ánh luồng nghiệp vụ To-Be theo từng phân hệ của TOSS. Nguồn gốc: `ba/sync/models/quy-trinh-tobe/`.

---

## PH1 — Thông tin điều hành chuyến bay

### PH1.1 Luồng chính Điều phái viên

Sơ đồ mô tả luồng làm việc trong một ca trực từ góc nhìn Điều phái viên (Dispatcher): đăng nhập → kiểm tra đầu ca → giám sát chuyến bay → xử lý cảnh báo → Dispatch Release → bàn giao ca.

![Hình PH1-1: Luồng chính Điều phái viên — ca trực OCC (To-Be)](ba/sync/models/quy-trinh-tobe/TOBE-PH1-OCC-DISPATCH-DIEUPHAIVIEN.png)

---

### PH1.2 Luồng Kiểm tra Đầu ca

Sơ đồ mô tả quy trình kiểm tra đầu ca (Start-of-Shift Check): TOSS tổng hợp tự động 9 nhóm dữ liệu, sinh cảnh báo màu, điều phái viên xử lý tại hệ thống chuyên dụng tương ứng.

![Hình PH1-2: Luồng Kiểm tra Đầu ca — 9 nhóm dữ liệu (To-Be)](ba/sync/models/quy-trinh-tobe/TOBE-PH1-OCC-DISPATCH-KIEMTRADAUCA.png)

---

### PH1.3 Vòng đời Cảnh báo

Sơ đồ mô tả vòng đời trạng thái cảnh báo theo bộ 4 mã màu thống nhất: Bình thường (không màu) → Cần lưu ý (Vàng) → Cần xử lý ngay (Đỏ) → Đã xử lý (Xanh — chỉ xuất hiện sau khi từng Đỏ). Chuyển trạng thái diễn ra tự động theo dữ liệu nguồn.

![Hình PH1-3: Vòng đời Cảnh báo — bộ 4 mã màu (To-Be)](ba/sync/models/quy-trinh-tobe/TOBE-PH1-OCC-DISPATCH-VONGDOICANHBAO.png)

---

### PH1.4 Luồng Dispatch Release

Sơ đồ sequence mô tả luồng tương tác giữa Điều phái viên, TOSS, Lido và MO Plus trong quy trình Dispatch Release → Captain's Release.

![Hình PH1-4: Sequence — Dispatch Release → Captain's Release (To-Be)](ba/sync/models/quy-trinh-tobe/TOBE-PH1-OCC-DISPATCH-SEQUENCE-LUONG.png)

---

## PH2 — Quản lý tài liệu chuyến bay

*(Sơ đồ To-Be sẽ bổ sung sau khi xuất từ TOBE-PH2-tai-lieu-chuyen-bay-v0.1.drawio)*

---

## PH3 — Quản lý báo cáo, đánh giá tối ưu khai thác

*(Sơ đồ To-Be sẽ bổ sung sau khi xuất từ TOBE-PH3-bao-cao-toi-uu-v0.1.drawio)*

---

## PH4 — Quản lý danh mục (Master Data)

*(Sơ đồ To-Be sẽ bổ sung sau khi xuất từ TOBE-PH4-quan-ly-danh-muc-v0.1.drawio)*

---

## PH5 — Quản trị hệ thống

*(Sơ đồ To-Be sẽ bổ sung sau khi xuất từ TOBE-PH5-quan-tri-he-thong-v0.1.drawio)*
