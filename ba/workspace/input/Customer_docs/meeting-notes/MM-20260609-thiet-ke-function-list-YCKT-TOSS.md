---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
date: "2026-06-09"
time: "00:00–~01:53 (ghi âm part1+part2, ~110 phút)"
location: "[cần xác nhận]"
meeting_type: "Workshop — Thiết kế Function List / Menu + rà soát YCKT"
facilitator: "[cần xác nhận]"
note_taker: "Agent (tổng hợp từ transcript ASR 09062026, đã fix-WER domain)"
attendees:
  - "Bạch Lê ('chị Lê') — hãng bay [cần xác nhận]"
  - "An / Nam — [cần xác nhận]"
  - "Mr Dũng — (Tổng quan DSP) [cần xác nhận]"
  - "Văn Hiệp ('Hiệp'), nhóm triển khai ('em') — công ty phần mềm [cần xác nhận]"
document_type: "Meeting Notes"
version: "1.0"
status: "Draft"
source: "ba/workspace/input/meeting-notes/09062026/TOSS_meeting_09062026_part1+part2.txt (ASR chất lượng thấp)"
related: "ba/workspace/drafts/phan-tich/yckt-trien-khai/ (YCKT đã tách MD) · MM-20260608 (họp trước)"
---

# Biên bản Họp: Thiết kế Function List / Menu TOSS + rà soát YCKT (09/06)

> **Cảnh báo chất lượng nguồn:** lập từ ASR chất lượng thấp (đã chạy fix-WER domain). Chỗ không chắc gắn cờ `[cần xác nhận]`. Nội dung bám transcript (CLAUDE.md §0). Bối cảnh: rà soát/thiết kế theo `TOSS - Triển khai-YCKT.xlsx` (xem phân tích YCKT).

## Mục tiêu
Thống nhất **cây menu / function list** của TOSS và làm rõ cách tổ chức: 5 cụm nghiệp vụ + cụm quản trị/danh mục; mô hình phân quyền; nghiệp vụ Load Control; quản lý Tàu bay; lưu trữ tài liệu.

## 1. Cấu trúc Function List / Menu
- **5 cụm nghiệp vụ chính:** Flight Operation · Flight Dispatch · **Flight Load Control** · Station Manager · (+ cụm tàu bay/sân bay/chặng bay).
- **3 cụm quản trị (tách riêng, level 0):** **System Admin** · **Data Monitoring** · **Data Maintenance (DBM/danh mục)**. Phương án: gộp hết vào System Admin (→ 6 mục) hoặc tách hẳn (→ 8 mục). **Chốt:** tách Data Maintenance thành menu riêng (nhiều thứ liên quan dữ liệu/danh mục).
- **Danh mục (master data) vs nghiệp vụ:** danh mục = dữ liệu cơ sở (cố định hoặc quản lý) phục vụ nghiệp vụ phía trên. Đồng bộ tự động hàng ngày; có người xem nhưng giá trị chính là **phục vụ cảnh báo** (vd cảnh báo MEL) cho tầng nghiệp vụ.

## 2. Mô hình phân quyền
- **Phân quyền theo CHỨC NĂNG** (không theo dữ liệu); riêng **dữ liệu chuyến bay phân theo "main bay" (flight base)**.
- Dùng **chung một màn hình** cho nhiều đối tượng; **cột & nút ẩn/hiện theo quyền** (vd 50 cột: ~10 trạng thái ai cũng thấy, 10 NOTOC, 10 Fly Release, 10 Load & Weight). Quyền `view` vs `upload`/`review` tách riêng.
- Customized cột theo user (lưu 1 lần).

## 3. Flight Load Control (3 nhóm chức năng)
1. **Nhập Load & Weight** (load and balance).
2. **Cung cấp tài liệu** chuyến bay.
3. **Lưu NOTOC** (NOTOC chia **2 loại: hành khách + cargo**), **Cargo Manifest (CM)**, cargo NOTOC.
- **Upload nhiều tài liệu cho nhiều chuyến (bulk):** tách **tab riêng**; tự gắn file vào chuyến qua **quy ước tên file** (VN<flight> <ngày> <version> <loại>); loại tài liệu: **Loadsheet, CD/GDPM, PM, NOTOC**. Tranh luận: phân biệt qua **tên file** (nhẹ tải) vs **content** (nặng xử lý) → **chốt khảo sát luồng GDPM** ở buổi riêng. Vẫn giữ cả chức năng **manual** (upload từng chuyến).
- **CD/GDPM = General Declaration (GENDEC)** — danh sách tổ bay (phi công, tiếp viên, + nhân viên mặt đất lên tàu). *(làm rõ định nghĩa CD trước đây — khớp glossary GD.)*

## 4. Station Manager & Lưu trữ tài liệu (retention)
- Đối tượng nặng, tách menu riêng; chủ yếu **checklist (security)** + xem/tải tài liệu.
- **Tài liệu sinh từ TOSS** (GDPM, NOTOC…) → **TOSS lưu**.
- **Tài liệu từ MO/Lido** (OFP/OSP, FP, NOTAM, thời tiết — thứ TOSS không có) → chỉ **kéo về khi user download**, lưu **tối đa 3 ngày sau khi hạ cánh** rồi **job tự xóa** (server lưu file chung, retention theo từng cục dữ liệu). → khớp meeting 08/06 §14.

## 5. Quản lý Tàu bay
- **Vòng đời/lịch sử tàu:** registration; tàu **in/out nhiều lần** (thuê), **reconfig** (đổi cấu hình khoang) — phải quản lý **lịch sử** (loại tàu từng khai thác, vd 777/787), hiệu lực theo giai đoạn (ngày hiệu lực/hết hiệu lực).
- **Hình thức sở hữu:** **Sở hữu / Thuê khô (Dry Lease) / Thuê ướt (Wet Lease)** — *thuê khô = thuê xác tàu, đội ngũ của mình; thuê ướt = thuê nguyên + phi công/tiếp viên/dịch vụ của bên cho thuê, mình chỉ đưa khách lên; F2/fleet có "mix" (vd chỉ cover dịch vụ nhiên liệu)* → **khớp glossary Dry/Wet Lease** [[project-toss-airline-is-lessee]].
- **Thuộc tính tàu:** trọng tải, config khoang (30DC/30DL Deluxe/30DY), **fuel tank capacity** (2 tank), water tank, compartment/bụng (hành lý), MEL/CDL; ICAO/IATA designator; **nhóm/Category đội tàu** (320+321 = 1 category; widebody/narrowbody; sub-group "leo tổ"; A350/787/777/ATR) — mỗi báo cáo dùng cách **chia nhóm khác nhau** (fuel flow / taxi time / định mức nhiên liệu).
- **Đơn vị nhiên liệu từ ACARS:** điện ACARS có thể ghi tấn/đơn vị khác → cần **hệ số quy đổi về kg** có **hiệu lực theo giai đoạn** (lịch sử) vì cùng 1 tàu có thể đổi đơn vị khi cập nhật hệ thống.

## 6. Sân bay & Cảnh báo dịch vụ
- **Danh mục dịch vụ sân bay:** khai báo sân bay **không hỗ trợ tàu hỏng APU** (không có xe khởi động/GPU) → khi tàu **hỏng APU** đến sân đó phải **cảnh báo + đổi tàu**. → glossary **APU/AOG**.
- Cần **danh mục master** mã dịch vụ/sự cố; hiện quản lý **thủ công** (chưa có phần mềm, không trích xuất/tổng hợp được).

## 7. Báo cáo & Thống kê
- Phân biệt: **trang đầu (cấp xem nhanh)** quan tâm ngày/khách/thời tiết hiện tại; **người đánh giá** cần **thống kê dài hạn (1–2 năm)** theo số lớn.
- **Data Monitoring = báo cáo độ phủ & độ chính xác dữ liệu** (vd tỷ lệ chuyến có điện ACARS theo đội tàu: A321 ~50%, 787 ~70–80%, A380 ~90%) — KHÔNG phải monitoring vận hành server; chốt **tách màn riêng** (không nhét vào báo cáo nghiệp vụ).
- **OTP/OSP** tính tự động (lưu ý quy ước: cất cánh ≤14 phút sau giờ dự kiến = đúng giờ; trễ 1 phút = delay) → khớp scope OSP mới bổ sung (CLAUDE.md §2).

## 8. Tham khảo FAA / ICAO / IATA
- Hỏi: có tham khảo FAA/ICAO/IATA? → **Có** — học tập quốc tế; quy trình mức "2 level" cho một hãng để tham khảo; quy trình chi tiết tuân thủ chuẩn quốc tế. → **khớp nguyên tắc** [[feedback-faa-icao-reference-advisory]] (FAA/ICAO là tham khảo overview).
- Cuối họp: team xác nhận **đang xây "hệ thống thuật ngữ" (glossary) TOSS** gồm các thuật ngữ như thuê khô/ướt → trùng hướng glossary đang làm.

## Quyết định Chính
| # | Quyết định | Người QĐ | Ghi chú |
|---|---|---|---|
| DEC-09-01 | **Tách Data Maintenance** thành menu riêng (ngoài System Admin) | [xác nhận] | Cùng cụm System Admin / Data Monitoring level 0 |
| DEC-09-02 | **Phân quyền theo chức năng**; dữ liệu chuyến theo main bay; **1 màn hình, ẩn/hiện cột-nút theo quyền** | [xác nhận] | |
| DEC-09-03 | **Bulk upload tách tab riêng**; auto-gắn file theo **tên file**; vẫn giữ manual | [xác nhận] | Khảo sát luồng GDPM buổi riêng |
| DEC-09-04 | Tài liệu MO/Lido **lưu tối đa 3 ngày sau hạ cánh rồi xóa**; tài liệu sinh từ TOSS thì lưu | [xác nhận] | Job retention |
| DEC-09-05 | **Data Monitoring = báo cáo độ phủ/độ chính xác dữ liệu**, tách màn riêng | [xác nhận] | |
| DEC-09-06 | Quản lý tàu bay theo **hình thức sở hữu/thuê khô/thuê ướt** + lịch sử + Category nhóm | [xác nhận] | |

## Action Items
| # | Nhiệm vụ | Người | Deadline |
|---|---|---|---|
| 1 | Tổ chức **buổi khảo sát luồng GDPM** (định dạng/đặt tên file nguồn xuất ra) | 'Chị' + 'em' | [Chưa có] |
| 2 | Khảo sát **luồng ACARS** + hệ số quy đổi đơn vị nhiên liệu | 'em' | [Chưa có] |
| 3 | Lập **danh mục master dịch vụ sân bay** (mã sự cố/dịch vụ, vd hỗ trợ APU) | 'Chị' | [Chưa có] |
| 4 | Định nghĩa **Category/nhóm đội tàu** cho báo cáo (Eklat-Tai master) | 'em'+'Chị' | [Chưa có] |
| 5 | Hoàn thiện **glossary thuật ngữ TOSS** (thuê khô/ướt, NOTOC, GDPM…) | nhóm | đang làm |

## Câu hỏi Chưa Giải quyết
- [ ] Phân biệt bulk upload theo **tên file vs content** — chốt sau khảo sát GDPM.
- [ ] **Đơn vị nhiên liệu ACARS** từng giai đoạn từng tàu — cần khảo sát nguồn.
- [ ] Nguồn danh mục dịch vụ sân bay (hiện thủ công, không trích xuất được).
- [ ] Định danh **người dự họp & vai trò**; địa điểm; người quyết định từng DEC.

## Buổi Họp Tiếp theo
- **Dự kiến:** buổi khảo sát chuyên đề **GDPM** + **ACARS/nhiên liệu**; tiếp tục Quản lý Tàu bay / Sân bay.

---
*Tổng hợp 09/06 (skill meeting-synthesize). Liên kết phân tích: `ba/workspace/drafts/phan-tich/yckt-trien-khai/PHAN-TICH-YCKT-v0.1.md`. Đối chiếu người dự trước khi dùng làm căn cứ (CLAUDE.md §0).*
