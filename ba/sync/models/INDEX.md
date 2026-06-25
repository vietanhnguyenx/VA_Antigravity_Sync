# INDEX — Mô hình & ma trận truy vết (`ba/sync/models`)

> Đọc index này trước rồi mở đúng file cần (rule: đọc chọn lọc, không nạp cả thư mục).
>
> **Tổ chức theo thư mục con theo loại mô hình.** Tracker máy-đọc (JSON) + bảng tiến độ giữ ở **gốc** (được CLAUDE.md/agents tham chiếu theo path — không di chuyển).

## 1. Mô hình dữ liệu — `mo-hinh-du-lieu/`

| File | Dòng | Nội dung |
|---|---|---|
| [`mo-hinh-du-lieu/DATA-MODEL-KHAI-NIEM-man-giam-sat-dieu-phai-v0.2.md`](mo-hinh-du-lieu/DATA-MODEL-KHAI-NIEM-man-giam-sat-dieu-phai-v0.2.md) | 432 | Mô hình dữ liệu khái niệm (ERD) v0.2 — làm giàu từ Netline/FIMS/MEL-78/OFP/Loadsheet/PM; 19 thực thể (+4 mới: CAU_HINH_TAU, MASTER_MEL, OFP_PHIEN_BAN, DANH_SACH_KHACH); 6 quan hệ mới; 7 điểm cần xác nhận |

## 2. Tích hợp hệ thống — `tich-hop/`

| File | Dòng | Nội dung |
|---|---|---|
| [`tich-hop/MO-HINH-TICH-HOP-TOSS-HE-THONG-NGOAI-v0.1.md`](tich-hop/MO-HINH-TICH-HOP-TOSS-HE-THONG-NGOAI-v0.1.md) | 296 | **Mô hình tích hợp TOSS ↔ hệ thống ngoài v0.1** — sơ đồ ngữ cảnh (11 hệ thống ngoài, 19 luồng in + 2 out), bảng danh mục 19 luồng atomic + 9 luồng trực tiếp ngữ cảnh, 4 sequence diagram (OFP/Lido, MVT/MVA/SITA, PTM/Amadeus, ASM/ACH outbound), 14 điểm cần xác nhận. Nguồn: sheet v77 · BR-556…BR-581. |
| [`tich-hop/MO-HINH-TICH-HOP-TOSS-HE-THONG-NGOAI-v0.1.drawio`](tich-hop/MO-HINH-TICH-HOP-TOSS-HE-THONG-NGOAI-v0.1.drawio) | — | Bản **draw.io (XML)** của sơ đồ ngữ cảnh tích hợp — chỉnh sửa được trên diagrams.net (song song bản Mermaid trong file `.md` cùng tên). |

## 3. Quy trình To-Be — `quy-trinh-tobe/`

| File | Dòng | Nội dung |
|---|---|---|
| [`quy-trinh-tobe/TOBE-PH1-OCC-DISPATCH-v0.1.md`](quy-trinh-tobe/TOBE-PH1-OCC-DISPATCH-v0.1.md) | ~200 | **To-Be PH1** — luồng Dispatcher/OCC, vòng đời cảnh báo, Dispatch Release, so sánh As-Is→To-Be |
| [`quy-trinh-tobe/TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md`](quy-trinh-tobe/TOBE-PH2-tai-lieu-chuyen-bay-v0.1.md) | ~380 | **To-Be PH2** — Dispatch Release↔Captain's Release (sequence), Unrelease OFP, 6 giai đoạn Dispatch, Bulk Upload+Weather, Document Lifecycle (state), Load Balance 4 bước, NOTOC số hóa, Backup Lido |
| [`quy-trinh-tobe/TOBE-PH3-bao-cao-toi-uu-v0.1.md`](quy-trinh-tobe/TOBE-PH3-bao-cao-toi-uu-v0.1.md) | ~280 | **To-Be PH3** — BCAO lập & phát hành (swim lane 4 vai), Theo dõi OTP/OSP, Báo cáo nhiên liệu; 16 FUNC chờ mô hình hóa |
| [`quy-trinh-tobe/TOBE-PH4-quan-ly-danh-muc-v0.1.md`](quy-trinh-tobe/TOBE-PH4-quan-ly-danh-muc-v0.1.md) | ~410 | **To-Be PH4** — Aircraft Master (đồng bộ Netline/FIMS + thủ công), Airport Master (STT duyệt), Route/Tankering, BP-005 nhận tàu mới, Performance Factor, vòng đời versioning |
| [`quy-trinh-tobe/TOBE-PH5-quan-tri-he-thong-v0.1.md`](quy-trinh-tobe/TOBE-PH5-quan-tri-he-thong-v0.1.md) | ~270 | **To-Be PH5** — vòng đời IAM/RBAC (3 sơ đồ: flowchart+state+sequence SSO), thu nạp movement thay FMS, bản đồ tích hợp ~40 hệ thống (8 nhóm), Unrelease↔MO Plus; 9 nhóm chờ workshop |

## 4. Truy vết & Gap — `truy-vet/`

| File | Dòng | Nội dung |
|---|---|---|
| [`truy-vet/GAP-ANALYSIS-PH1-PH2-v0.1.md`](truy-vet/GAP-ANALYSIS-PH1-PH2-v0.1.md) | ~320 | Gap Analysis PH1 (32 gap) + PH2 (31 gap) — bảng gap, tổng hợp theo loại, nhóm ưu tiên |
| [`truy-vet/compliance-trace-v0.1.md`](truy-vet/compliance-trace-v0.1.md) | 93 | Ma trận truy vết tuân thủ (ICAO/IATA/CAAV → BR) |

## 5. Tracker máy-đọc & tiến độ — gốc (JSON/MD)

> Giữ ở **gốc** `models/` vì được CLAUDE.md §0.5/§8 + agents tham chiếu theo path.

| File | Nội dung |
|---|---|
| `deliverable-status.json` | Tracker pass/fail deliverable (project-coordinator duy trì; JSON theo §8 — model ít mis-edit hơn Markdown). |
| `RTM-template-v0.1.json` | RTM (Ma trận Truy vết Yêu cầu) dạng máy-đọc — **nguồn chính** (bản `.md` view đã bỏ, dùng trực tiếp JSON). |
| `survey-pipeline-status.md` | **Bảng theo dõi pipeline Khảo sát → Đặc tả** theo từng buổi (báo cáo/đối chiếu/proposal/áp dụng/commit + quyết định chờ + số liệu tích lũy). Workflow `survey-to-spec` tự cập nhật. |

---

_Tái cấu trúc 2026-06-25: chia thư mục con (mo-hinh-du-lieu / tich-hop / quy-trinh-tobe / truy-vet), tracker giữ gốc; xóa `subsystem-interface-map-v0.1.md` (chồng Mô hình tích hợp + TOBE-PH5) và `RTM-template-v0.1.md` (trùng bản `.json`)._
