# INDEX — Báo cáo khảo sát (Discovery)

> Đọc index này trước rồi mở đúng file cần (rule: đọc chọn lọc, không nạp cả thư mục).

| File | Dòng | Buổi khảo sát |
|---|---|---|
| `BAO-CAO-KHAO-SAT-08062026-v0.2.md` | 300 | 08/06/2026 — Tổng quan hệ thống, lộ trình khảo sát, tích hợp dữ liệu (v0.4, regenerate từ transcript) |
| `BAO-CAO-KHAO-SAT-09062026-v0.3.md` | 262 | 09/06/2026 — Cây menu, phân quyền, bảng triển khai YCKT (v0.4, regenerate từ transcript) |
| `BAO-CAO-KHAO-SAT-11062026-buoi-sang-v0.1.md` | 388 | 11/06/2026 sáng — phỏng vấn Dispatcher: OFP/Release, NOTAM, thời tiết, MEL/CDL, Cost Index (v0.3, regenerate từ transcript) |
| `BAO-CAO-KHAO-SAT-11062026-buoi-chieu-v0.1.md` | 374 | 11/06/2026 chiều — phỏng vấn Dispatcher: tiếp nối các chủ đề kỹ thuật chuyên sâu (v0.3, regenerate từ transcript) |
| `BAO-CAO-KHAO-SAT-11062026-ktktb-v0.1.md` | ~280 | 11/06/2026 — Phòng Kỹ thuật khai thác bay (KTKTB) VNA: Buổi 2 (MEL Boeing+Airbus, W&B) + Buổi 3 (Lập phương án đường bay LIDO, Thư viện khai thác SkyOffice/MO, Obstacle/EOSID) + Demo Webex NOTOC (vấn đề 2 NOTOC/chuyến bay Sài Gòn) |
| `BAO-CAO-KHAO-SAT-12062026-buoi-sang-v0.1.md` | 312 | 12/06/2026 sáng — phỏng vấn Dispatcher: Flight Detail, màn hình Giám sát, mockup (v0.3, regenerate từ transcript) |
| `BAO-CAO-KHAO-SAT-15062026-v0.1.md` | 173 | 15/06/2026 — Màn hình Flight Dispatch & quy trình OFP Release (v0.2, A-CDM / cảnh báo màu / phân quyền) |
| `BAO-CAO-KHAO-SAT-17062026-v0.3.md` | 334 | 17/06/2026 — Quản lý Tàu bay, MEL/CDL & Tích hợp AMOS (v0.3, phủ trọn buổi: Master MEL / MEL Active / cảnh báo điều phái / Lido Import file / khảo sát DB AMOS + Aircraft list đồng bộ OPS++ / AOG-MNT Schedule / AOG-MNT Code / Performance Factor) |
| `BAO-CAO-KHAO-SAT-18062026-v0.1.md` | 180 | 18/06/2026 — CLC & Điều phái (v0.1): màn Monitoring/bộ lọc, nút Dispatch Release đa điều kiện, mô hình cảnh báo 2 mức, tải trọng ZFW/DAO (FOEM), Fly Doc/EDTO, MEL 3 lớp, ATC FPL, minima sân bay, matching PIC, tích hợp Adapter Lido |
| `BAO-CAO-KHAO-SAT-19062026-v0.1.md` | 173 | 19/06/2026 — Tích hợp TOSS ↔ NetLine/OPS++ (v0.1): danh mục 24 luồng inbound/outbound, phương thức SFTP + cấu trúc thư mục Temp/Pickup/Archive, VPN, ISB + data duplicate, mốc 24/06 (cấu hình VPN) & 01/07 (hoàn thành SFTP), lộ trình go-live OPS++ + cutover ~03/2027. |
| `BAO-CAO-KHAO-SAT-23062026-v0.1.md` | 236 | 23/06/2026 — Tích hợp TOSS ↔ NetLine/OPS++ (tiếp 19/06, v0.1): 12 chủ đề — vai trò ISB là adapter NetLine, NetOps KHÔNG yêu cầu TOSS lưu trữ (TOSS lưu phục vụ nghiệp vụ TOSS), phân định "Thông qua TOSS" vs "Trực tiếp", chi tiết MVT/MVA/DIV/LDM (kênh kép SITA+email chung), FMM tự sinh, SSIM/PTM/PNL/ADL/Pax/Crew/Cargo/Gate/NOTAM, mô hình kênh "có/không hiệu lực", chiến lược DB nội bộ giống NetLine Classic + Clone DB. §III 16 thống nhất · §IV 15 cần làm rõ (gồm cụm ASR nhiễu nặng) · §V 14 thuật ngữ. |

## Phân tích đối chiếu

| File | Nội dung |
|---|---|
| `DOI-CHIEU-KS-BRD-1719-2026-06-23-v0.2.md` | Đối chiếu (gap analysis) 3 báo cáo khảo sát 17/06+18/06+19/06 với BRD v0.12 (PH1 v0.7, PH2 v0.6, PH4 v0.5, PH5 v0.5). **v0.2 (23/06): đối chiếu lại tích hợp OPS++ theo sheet "Thông tin tích hợp" v77 + phạm vi BA Lead chốt — CHỈ luồng "Thông qua TOSS" (19 luồng) tính GAP; 9 luồng "Trực tiếp" tách §2bis.B (NGOÀI scope).** §2bis.A liệt kê 19 luồng trong scope (17 in + 2 out): 0 COVERED / 12 PARTIAL / 4 GAP; 8 luồng còn Missing triển khai. §2bis.C nêu 10 yêu cầu mới từ sheet v77 chưa có BR. §3.B đề xuất 14 BR (BR-557…570, trong đó BR-567/568/569/570 mới cho Crew Assignment / Gate VIAGS / Cargo / SSIM). §4 thêm D-11 (ngưỡng <1000) và D-12 (API VIAGS). Tổng 43 chủ đề + 28 luồng tích hợp. |

## Đầu ra workflow (đề xuất — chờ duyệt)

| File | Nội dung |
|---|---|
| `PROPOSAL-18062026-enrichment.md` | Đề xuất làm giàu sau buổi 18/06 (output workflow `survey-to-spec`): 25 FUNC + 15 OID + 18 glossary + 12 câu quyết định BA Lead. **Chỉ đề xuất, chưa áp dụng (§0).** |

> Theo dõi tiến độ tổng thể: [`../../../sync/models/survey-pipeline-status.md`](../../../sync/models/survey-pipeline-status.md).
