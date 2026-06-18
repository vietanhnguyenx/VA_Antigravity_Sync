---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "business-analyst"
version: "0.1"
date: "2026-06-17"
status: "Draft"
document_type: "Wireframe"
parent_brd: "BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.6.md"
parent_phanra: "PHAN-RA-BRD-PH2-quan-ly-tai-lieu-chuyen-bay-v0.4.md"
---

# Wireframe low-fidelity — Phân hệ 2: Quản lý tài liệu chuyến bay (v0.1)

> **Nguồn cha:**
> - BRD: `BRD-TOSS-PH2-tai-lieu-chuyen-bay-v0.6.md` (BR-201…BR-261, 6 khối A–F).
> - Phân rã FUNC: `PHAN-RA-BRD-PH2-quan-ly-tai-lieu-chuyen-bay-v0.4.md` (FUNC-201…FUNC-347).
>
> **Nguyên tắc (CLAUDE.md §0 + Workflow P4):**
> - Chỉ vẽ wireframe các màn hình có nguồn BR/FUNC rõ ràng; không tự bịa thêm màn hình hay tính năng.
> - Trường/khái niệm chưa rõ ghi `[cần xác nhận]`; điểm chưa có data model ghi `*(layout cần xác nhận sau khi có entity map)*`.
> - Bố cục bằng khung ký tự ASCII low-fidelity; chưa cần component PrimeNG/Angular cụ thể.
> - Tập trung vào: bố cục, thành phần, dữ liệu hiển thị, tương tác/trạng thái.
>
> **Phạm vi:** 6 màn hình chính bao trùm các khối A–F của BRD PH2 v0.6:
> 1. WF-PH2-01 — Danh sách chuyến bay và tài liệu (Khối A).
> 2. WF-PH2-02 — Soạn/nộp NOTOC (Khối B).
> 3. WF-PH2-03 — Quản lý MEL/CDL (Khối D).
> 4. WF-PH2-04 — Dispatch Release (Khối A — luồng release).
> 5. WF-PH2-05 — Dashboard tài liệu chuyến bay (Khối F — BR-257).
> 6. WF-PH2-06 — Service Order từ email LIDO (Khối F — BR-260).

---

## Quy ước chung

- Khung ASCII: `┌─┐│└┘` cho block, `╔═╗║╚╝` cho block nhấn mạnh.
- Trạng thái màu (áp BR-213 + quy ước PH1): **Trắng** = chưa đến ngưỡng / **Vàng** = lưu ý / **Đỏ** = quá hạn / **Xanh** = hoàn tất.
- Mặc định chữ hoa cho tìm kiếm/filter/nhập liệu (BR-253).
- Cấu hình ẩn/hiện cột áp BR-254 — không vẽ lại ở từng màn.
- Mọi nhãn ngày giờ áp UTC trừ khi ghi rõ giờ địa phương.

---

## WF-PH2-01 — Màn danh sách chuyến bay và tài liệu

**BR nguồn:** BR-201, BR-202, BR-203, BR-204, BR-205, BR-206, BR-213, BR-222 (Khối A).
**FUNC nguồn:** FUNC-201…FUNC-208, FUNC-252…FUNC-255, FUNC-296…FUNC-298.
**Mục tiêu:** Điều phái viên có một danh sách chuyến bay theo ngày, mỗi dòng tóm tắt trạng thái các tài liệu chuyến (OFP, NOTOC, DG, MEL, NFID) và trạng thái Dispatch Release/Pilot Release; cho phép drill-down sang Flight Detail (PH1).

```
╔══════════════════════════════════════════════════════════════════════════════╗
║  TOSS · PH2 · DANH SÁCH CHUYẾN BAY VÀ TÀI LIỆU                  [Lọc] [↻]    ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Ngày: [17/06/2026 ▼]  Hãng: [VN ▼ 0V BL]  Loại tàu: [ALL ▼]                  ║
║ Trạng thái Dispatch: [☑ Chưa  ☑ Đã Release  ☑ Pilot Confirm  ☑ Quá hạn]      ║
║ Tìm kiếm: [VN___________________ 🔍]   (mặc định chữ HOA — BR-253)           ║
╚══════════════════════════════════════════════════════════════════════════════╝
┌────┬──────┬────────┬───────┬──────────┬──────┬──────┬─────┬─────┬─────┬────┐
│STT │Flt#  │ Reg    │ STD   │  Route   │Disp. │ OFP  │NOTOC│ DG  │ MEL │NFID│
├────┼──────┼────────┼───────┼──────────┼──────┼──────┼─────┼─────┼─────┼────┤
│ 1  │VN211 │VN-A395 │05:30  │ HAN-SGN  │ ⬜   │ R2 🟡│ ✓   │  —  │  ✓  │ ⬜ │
│ 2  │VN242 │VN-A350 │06:10  │ SGN-HAN  │ 🟢   │ R3 🟢│ ✓   │ ⚠ 2 │  ✓  │ ✓  │
│ 3  │VN31  │VN-A861 │07:00  │ HAN-NRT  │ 🔴   │ R1 🔴│ ⬜  │  —  │  ✓  │ ⬜ │
│ 4  │0V8821│VN-B227 │07:45  │ HAN-DAD  │ 🟡   │ R1 🟡│ ✓   │  —  │  ⚠  │ ⬜ │
│ ...│ ...  │ ...    │ ...   │ ...      │ ...  │ ...  │ ... │ ... │ ... │... │
└────┴──────┴────────┴───────┴──────────┴──────┴──────┴─────┴─────┴─────┴────┘
   Chú thích: ⬜ chưa có · ✓ đã có · ⚠ có cảnh báo · 🟢/🟡/🔴 trạng thái ngưỡng
   Click một dòng → mở Flight Detail (PH1) · Click ô tài liệu → drill-down WF
```

**Tương tác chính:**
1. Bộ lọc: ngày khai thác / hãng / loại tàu / trạng thái dispatch (BR-201, BR-213).
2. Mỗi ô tài liệu hiển thị badge số phiên bản (R1, R2…) + màu trạng thái ngưỡng theo BR-212/213 (trắng/vàng/đỏ).
3. Hover badge OFP → tooltip lịch sử phiên bản; click → mở WF-PH2-04 Dispatch Release của chuyến.
4. Cột "Disp." gộp trạng thái Dispatch Release + PIC Confirm (BR-213, BR-214); icon 🔴 nhấp nháy khi quá hạn release.
5. Hỗ trợ chọn nhiều dòng → action bar (Export, Gửi cảnh báo, Sync lại từ Lido).

*(Cấu trúc bảng phiên bản OFP và danh mục loại tài liệu chính thức — layout cần xác nhận sau khi có entity map.)*

---

## WF-PH2-02 — Màn soạn/nộp NOTOC

**BR nguồn:** BR-229, BR-230, BR-231, BR-232, BR-233, BR-234 (Khối B).
**FUNC nguồn:** *(Khối B chưa được phân rã FUNC trong PHAN-RA v0.4 — chờ bản sau.)*
**Mục tiêu:** Nhân viên kho hàng/giám sát chất xếp nhập tay dữ liệu NOTOC từ tờ khai giấy của khách hàng + thông tin chất xếp thực tế; hỗ trợ tình huống 2 NOTOC trên cùng một chuyến tại Sài Gòn; cho phép tạo revision kể cả khi phi công đã confirm.

```
╔══════════════════════════════════════════════════════════════════════════════╗
║  TOSS · PH2 · SOẠN / NỘP NOTOC                              [Lưu nháp] [✕]   ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Chuyến: [VN242 ▼]   Reg: VN-A350   STD: 06:10   Route: SGN-HAN               ║
║ Loại NOTOC: ( ) Thường   ( ) COMAT   (●) DG      Revision: R2 (đã có R1)     ║
║ Form NOTOC #2 (option SGN): [+ Thêm form quốc tế]   *(BR-233)               ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ BẢNG NHẬP HÀNG DG                                                            ║
║ ┌───┬────────┬────────────────────────┬─────┬─────┬─────────┬─────────────┐ ║
║ │STT│ UN No. │ Proper Shipping Name   │Class│PG   │Net Qty  │ Vị trí chất │ ║
║ ├───┼────────┼────────────────────────┼─────┼─────┼─────────┼─────────────┤ ║
║ │ 1 │ UN1845 │ CARBON DIOXIDE SOLID   │ 9   │  —  │ 25 KG   │ FWD CARGO 1 │ ║
║ │ 2 │ UN3480 │ LITHIUM ION BATTERIES  │ 9   │ II  │ 12 KG   │ AFT CARGO 4 │ ║
║ │ 3 │ ____   │ ___________________    │ ___ │ ___ │ _____   │ ___________ │ ║
║ │   │        │                        │     │     │         │ [+ thêm]    │ ║
║ └───┴────────┴────────────────────────┴─────┴─────┴─────────┴─────────────┘ ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ LỊCH SỬ REVISION                                                             ║
║   R1 · 17/06 04:12 · NV.kho.A · status: Confirmed by PIC  🟢                ║
║   R2 · 17/06 05:40 · NV.kho.A · status: Draft  *(đang soạn)*                ║
║   ↳ Lý do revision: [Bổ sung 1 kiện UN3480_______________________________]   ║
╠══════════════════════════════════════════════════════════════════════════════╣
║   [Lưu nháp]    [Submit gửi PIC]    [In NOTOC]    [Hủy revision]            ║
╚══════════════════════════════════════════════════════════════════════════════╝
   * Nguồn dữ liệu: tờ khai giấy của khách hàng + chất xếp thực tế (BR-229)
   * Không lấy từ Go Support; sân bay NTM (HAN) tự nhận từ điện FM (Cita)
   * Mobile equivalence: BR-234 *(Should — Phase ≥ 2)*
```

**Tương tác chính:**
1. Toggle "Loại NOTOC" gồm Thường / COMAT / DG; với DG hiện bảng nhập UN + class + packing group + net qty + vị trí.
2. Nút "+ Thêm form quốc tế" chỉ bật khi sân bay đi = SGN (BR-233 — option, không bắt buộc mọi sân bay).
3. Khi tạo R2 sau khi phi công đã confirm R1, hệ thống cảnh báo + bắt nhập "Lý do revision"; submit sẽ reset Confirm của phi công (BR-230, BR-231).
4. Hiển thị badge màu theo phản hồi phi công: 🟢 Confirm OK · 🟠 Reject 1 phần · 🔴 Reject toàn phần (BR-232).
5. Action "In NOTOC" sinh file PDF 1 hoặc 2 trang tùy form quốc tế (BR-233).
6. Sandbox mode BR-235 *(layout cần xác nhận sau khi có entity map sandbox — PH5 BR-542)*.

---

## WF-PH2-03 — Màn quản lý MEL/CDL

**BR nguồn:** BR-242, BR-243, BR-244 (Khối D — tiêu thụ MEL master từ PH4 BR-425/426).
**FUNC nguồn:** *(BR-242/243/244 chưa được phân rã FUNC trong PHAN-RA v0.4 — chờ bản sau; chỉ tiêu thụ MEL trong luồng tài liệu chuyến bay.)*
**Mục tiêu:** Người dùng KTKTB tra cứu và soạn thảo MEL/CDL theo tàu bay, hỗ trợ revision, compare giữa các phiên bản và áp hotfix (SB) khi nhà sản xuất phát hành.

```
╔══════════════════════════════════════════════════════════════════════════════╗
║  TOSS · PH2 · QUẢN LÝ MEL / CDL                          [+ Tạo MEL] [↻]     ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Reg: [VN-A350 ▼]   ATA chương: [ALL ▼]   Trạng thái: [Open ▼]                ║
║ Tìm kiếm: [_____________________________ 🔍]                                ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ ┌────────┬──────┬─────────────────────┬────┬──────────┬──────────┬────┬────┐ ║
║ │Item    │ATA   │Description          │Cat │ Start    │ Due      │Ext │Stt │ ║
║ ├────────┼──────┼─────────────────────┼────┼──────────┼──────────┼────┼────┤ ║
║ │21-26-01│ 21   │APU GEN INOPERATIVE  │ C  │14/06 09:00│24/06 09:00│ 0 │ 🟢 │║
║ │28-43-01│ 28   │L FUEL XFR VAL FAULT │ B  │15/06 14:20│18/06 14:20│ 1 │ 🟡 │║
║ │34-22-01│ 34   │NAV ADIRU 3          │ A  │17/06 03:00│17/06 15:00│ 0 │ 🔴 │║
║ │ ...    │ ...  │ ...                 │ .. │ ...      │ ...      │ .. │ .. │║
║ └────────┴──────┴─────────────────────┴────┴──────────┴──────────┴────┴────┘ ║
║                                                                              ║
║ ┌───────────── PANEL CHI TIẾT — 34-22-01 NAV ADIRU 3 ──────────────┐         ║
║ │ Category: A · Due: 17/06 15:00 UTC (còn 02:30)                    │        ║
║ │ Điều kiện bay: 1 of 3 must be operative · Single dispatch only    │        ║
║ │ Placard: REQUIRED — vị trí MIP P5                                 │        ║
║ │ Gia hạn còn lại: 0/1                                              │        ║
║ │ Tài liệu nguồn: MEL master v 21.3 *(PH4 owner — BR-425/426)*     │        ║
║ │                                                                   │        ║
║ │ [Compare versions]  [Áp hotfix SB-A350-2026-04]  [Xuất XML/OPS]   │        ║
║ └───────────────────────────────────────────────────────────────────┘         ║
╚══════════════════════════════════════════════════════════════════════════════╝
   * Vòng đời: Airbus → Working → Pending → Airline (BR-243)
   * A350 ký thủ công bằng FODM (BR-242)
```

**Tương tác chính:**
1. Bộ lọc theo Reg / ATA chapter / trạng thái (Open/Closed/Deferred).
2. Click hàng → mở panel chi tiết bên phải (điều kiện bay, placard, số lần gia hạn còn lại).
3. Action "Compare versions" → mở dialog so sánh 2 phiên bản tài liệu MEL (BR-243).
4. Action "Áp hotfix SB" → chọn Service Bulletin của nhà sản xuất, áp theo loại tàu/số hiệu tàu (BR-244).
5. Export ra XML/OPS theo định dạng Boeing/Airbus (BR-243).

*(Quan hệ MEL item ↔ Aircraft ↔ MEL master ↔ Service Bulletin — layout cần xác nhận sau khi có entity map PH4 + PH2.)*

---

## WF-PH2-04 — Màn Dispatch Release

**BR nguồn:** BR-205, BR-206, BR-207, BR-208, BR-209, BR-210, BR-211, BR-212, BR-213, BR-214, BR-216, BR-217 (Khối A — luồng release/unrelease/checklist).
**FUNC nguồn:** FUNC-252…FUNC-255 (Dispatch Release), FUNC-256…FUNC-258 (đồng bộ MO Plus), FUNC-276…FUNC-282 (Unrelease).
**Mục tiêu:** Điều phái viên ra quyết định Dispatch Release/Unrelease cho từng phiên bản OFP, kèm checklist điều kiện và signature block; gán cảnh báo màu theo ngưỡng BR-212/213.

```
╔══════════════════════════════════════════════════════════════════════════════╗
║  TOSS · PH2 · DISPATCH RELEASE — VN242 / 17-06-2026                          ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ ┌──── THÔNG TIN CHUYẾN ──────────┐ ┌──── CHECKLIST ĐIỀU KIỆN ─────────────┐ ║
║ │ Flight: VN242                   │ │ [✓] OFP R3   (Lido · 17/06 04:45)  │ ║
║ │ Reg:    VN-A350                 │ │ [✓] NOTOC    (R2 · PIC confirm OK) │ ║
║ │ Route:  SGN-HAN                 │ │ [✓] MEL/CDL  (no open A item)      │ ║
║ │ STD:    06:10 UTC               │ │ [✓] Weather  (multi-flight valid)  │ ║
║ │ ETD:    06:25 UTC               │ │ [✓] NOTAM    (revision R5)         │ ║
║ │ PIC:    NGUYEN VAN A            │ │ [✓] Fuel     (block 14,200 KG)     │ ║
║ │                                 │ │ [✓] ZFW đối soát Lido vs CLC        │ ║
║ │ ⏱ Ngưỡng release: 75 phút sớm  │ │ [ ] PIC Confirm  *(BR-214)*        │ ║
║ │   nhất / 60 phút muộn nhất     │ │                                     │ ║
║ │   *(BR-212 — nội địa)*          │ │ Cảnh báo còn mở: 1 (ATC FPL lệch)  │ ║
║ └─────────────────────────────────┘ └─────────────────────────────────────┘ ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ TRẠNG THÁI HIỆN HÀNH:  🟡 Đã có OFP — chưa Dispatch Release                  ║
║ Lịch sử phiên bản OFP:                                                       ║
║   R1 · 17/06 03:10 · auto Lido     · Released? No                            ║
║   R2 · 17/06 04:00 · auto Lido     · Released? No                            ║
║   R3 · 17/06 04:45 · auto Lido     · ◀ phiên bản hiện tại                   ║
║   [Chọn phiên bản cũ để Unrelease về — BR-208 FUNC-277]                      ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ SIGNATURE BLOCK                                                              ║
║   Dispatcher: NGUYEN_DUC_B   License: DSP-2024-118   Time: __:__ UTC         ║
║   Digital sign: [ Ký số ]    (lưu audit BR-207)                              ║
╠══════════════════════════════════════════════════════════════════════════════╣
║   [ ▶ DISPATCH RELEASE ]   [ ◀ UNRELEASE ]   [Sửa OFP — BR-217]   [Hủy]     ║
╚══════════════════════════════════════════════════════════════════════════════╝
   * Sau Release: trạng thái sync sang MO Plus (BR-206); reset Pilot Confirm nếu Unrelease (BR-209)
   * Quyền release theo người dùng — admin kích hoạt (BR-207)
```

**Tương tác chính:**
1. Checklist hiển thị 7 mục bắt buộc (OFP / NOTOC / MEL / Weather / NOTAM / Fuel / ZFW); chỉ enable nút Dispatch Release khi đủ 7 mục ✓.
2. Hiển thị ngưỡng thời gian release theo BR-212 (nội địa 75/60 phút, quốc tế 90/75 phút).
3. Lịch sử phiên bản OFP cho phép chọn phiên bản cũ để Unrelease về (BR-208 — FUNC-277, 278); sinh revision/version mới rồi đẩy MO Plus.
4. Nút "Sửa OFP" mở dialog chỉnh trường ưu tiên (Flight Level / dầu / Brady / ADC) — BR-217; trường cố định (số hiệu tàu, đường bay) bị disable.
5. Khi nhấn Unrelease, hệ thống khóa tạm cả Dispatch Release và Pilot Release (BR-211).
6. Digital sign ghi nhận audit trail (BR-207).

*(Mapping checklist ↔ entity Document/Status — layout cần xác nhận sau khi có entity map.)*

---

## WF-PH2-05 — Dashboard tài liệu chuyến bay (Khối F)

**BR nguồn:** BR-257 (Khối F — chuyển từ PH1 BR-112).
**FUNC nguồn:** FUNC-332, FUNC-333, FUNC-334, FUNC-335.
**Mục tiêu:** Điều phái viên có một dashboard tóm tắt trạng thái phê duyệt tài liệu chuyến bay theo ngày; xử lý các yêu cầu bất thường (Request) từ tổ bay/phi công thông qua luồng Confirm/Reject; xem lịch sử phê duyệt.

```
╔══════════════════════════════════════════════════════════════════════════════╗
║  TOSS · PH2 · DASHBOARD TÀI LIỆU CHUYẾN BAY              Ngày 17/06/2026     ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      ║
║ │  CHỜ PHÊ     │  │ ĐÃ PHÊ DUYỆT │  │ YÊU CẦU BẤT  │  │   TỪ CHỐI    │      ║
║ │   DUYỆT      │  │  HÔM NAY     │  │  THƯỜNG (mở) │  │   HÔM NAY    │      ║
║ │     12       │  │     86       │  │      7       │  │      3       │      ║
║ │  🟡 cần xử   │  │  🟢 đúng SLA │  │  🔴 ưu tiên  │  │  ⚪ đã ghi    │      ║
║ └──────────────┘  └──────────────┘  └──────────────┘  └──────────────┘      ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ DANH SÁCH YÊU CẦU BẤT THƯỜNG (Request)                                       ║
║ Filter: [Loại request ▼] [Trạng thái: Pending ▼] [Người gửi ▼]               ║
║ ┌────┬──────┬──────────────┬──────────┬───────┬────────────┬───────────┐    ║
║ │STT │ Flt# │ Loại request │ Thời gian│ Người │ Tài liệu   │  Status   │    ║
║ ├────┼──────┼──────────────┼──────────┼───────┼────────────┼───────────┤    ║
║ │ 1  │VN242 │Sửa OFP       │05:22 UTC │PIC.A  │OFP R3      │ Pending 🟡│    ║
║ │ 2  │VN31  │Bổ sung NOTAM │05:40 UTC │PIC.B  │NOTAM R4    │ Pending 🟡│    ║
║ │ 3  │0V8821│Phát hành lại │05:55 UTC │TổBay  │NOTOC R1    │ Pending 🔴│    ║
║ │ 4  │VN211 │Bổ sung Weather│06:00 UTC│PIC.C  │WX file     │ Confirmed │    ║
║ │ 5  │VN770 │Sửa Load Sheet│06:10 UTC │PIC.D  │LS final    │ Rejected  │    ║
║ │ ...│      │              │          │       │            │           │    ║
║ └────┴──────┴──────────────┴──────────┴───────┴────────────┴───────────┘    ║
║   Click 1 dòng → mở Modal Confirm/Reject                                     ║
╠══════════════════════════════════════════════════════════════════════════════╣
║       ┌──────────── MODAL CONFIRM / REJECT ───────────────┐                  ║
║       │ Request: Sửa OFP — VN242 R3                       │                  ║
║       │ Nội dung: "Đề nghị tăng Flight Level lên FL360"   │                  ║
║       │ Người gửi: PIC.NGUYEN_VAN_A · 05:22 UTC          │                  ║
║       │                                                   │                  ║
║       │ Quyết định:  ( ) Confirm   ( ) Reject             │                  ║
║       │ Lý do (bắt buộc khi Reject):                      │                  ║
║       │ [______________________________________________]   │                  ║
║       │                                                   │                  ║
║       │ Chữ ký: [Dispatcher_NDB · digital sign]           │                  ║
║       │                                                   │                  ║
║       │            [Xác nhận]      [Hủy]                  │                  ║
║       └───────────────────────────────────────────────────┘                  ║
╚══════════════════════════════════════════════════════════════════════════════╝
   * Lịch sử phê duyệt theo từng tài liệu (FUNC-335) — xem tab "Lịch sử"
```

**Tương tác chính:**
1. 4 cards tóm tắt: Chờ phê duyệt / Đã phê duyệt hôm nay / Yêu cầu bất thường (mở) / Từ chối hôm nay (FUNC-332).
2. Danh sách Request hỗ trợ filter theo loại request, trạng thái, người gửi.
3. Click một Request → mở Modal Confirm/Reject; Reject bắt nhập "Lý do" (FUNC-334).
4. Tab "Lịch sử" hiển thị toàn bộ chuỗi Request → Confirm/Reject theo từng tài liệu (FUNC-335).
5. Chữ ký số gắn vào audit log (BR-207 áp tương tự).

*(Danh mục đầy đủ "loại yêu cầu bất thường" + SLA xử lý — layout cần xác nhận sau khi có entity map; PHAN-RA v0.4 cờ `[cần xác nhận]` tại FUNC-332…335.)*

---

## WF-PH2-06 — Màn Service Order từ email LIDO (Khối F)

**BR nguồn:** BR-260 (Khối F — BR canonical, chuyển từ PH4 BR-472).
**FUNC nguồn:** FUNC-341, FUNC-342, FUNC-343.
**Mục tiêu:** Hệ thống tự đọc email Service Order từ địa chỉ email cố định do LIDO gửi đến; tự bóc tách thành bản ghi Service Order theo tàu bay; người dùng KTKTB đánh dấu hoàn thành thủ công.

```
╔══════════════════════════════════════════════════════════════════════════════╗
║  TOSS · PH2 · SERVICE ORDER (NGUỒN: EMAIL LIDO)            [↻ Sync] [Cài đặt]║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Inbox email LIDO (read-only)                                                  ║
║ ┌─────────────────────────────────┬─────────────────────────────────────────┐║
║ │ HỘP THƯ                          │ XEM TRƯỚC EMAIL ĐÃ CHỌN                ║
║ │  Địa chỉ: lido.svc@vna.toss.vn  │ ────────────────────────────────────── ║
║ │                                  │ From: dispatch@lido.com                ║
║ │  📧 17/06 04:55  SVC-A350-008    │ Sent: 17/06/2026 04:55 UTC             ║
║ │  📧 17/06 03:20  SVC-A321-117    │ To:   lido.svc@vna.toss.vn             ║
║ │  📧 16/06 22:10  SVC-A350-007    │ Subj: Service Order VN-A350 — Nav DB   ║
║ │  📧 16/06 18:42  SVC-B787-042    │ ────────────────────────────────────── ║
║ │  📧 16/06 15:00  SVC-A321-116    │ Tail: VN-A350                          ║
║ │  ...                             │ Service type: Nav DB update            ║
║ │                                  │ Due: 18/06/2026 09:00 UTC              ║
║ │  [+ Cấu hình mailbox]           │ Note: AIRAC cycle 2606                 ║
║ └─────────────────────────────────┴─────────────────────────────────────────┘║
╠══════════════════════════════════════════════════════════════════════════════╣
║ AUTO-PARSED → DANH SÁCH SERVICE ORDER                                        ║
║ Filter: [Tail ▼] [Loại service ▼] [Trạng thái ▼]                            ║
║ ┌────┬──────────────┬──────────┬──────────────────┬──────────┬──────┬─────┐ ║
║ │STT │ Mã SO        │ Tail     │ Loại service     │ Due      │Asgn  │Stt  │ ║
║ ├────┼──────────────┼──────────┼──────────────────┼──────────┼──────┼─────┤ ║
║ │ 1  │SVC-A350-008  │VN-A350   │Nav DB update     │18/06 09:00│ —   │ ⬜  │ ║
║ │ 2  │SVC-A321-117  │VN-A697   │EFB sync          │17/06 12:00│KTKTB-1│🟡 │ ║
║ │ 3  │SVC-A350-007  │VN-A350   │FMS sw patch      │20/06 00:00│KTKTB-2│ ✓ │ ║
║ │ 4  │SVC-B787-042  │VN-A861   │ACARS account     │17/06 18:00│KTKTB-3│🔴 │ ║
║ │ ...│              │          │                  │          │      │     │ ║
║ └────┴──────────────┴──────────┴──────────────────┴──────────┴──────┴─────┘ ║
║                                                                              ║
║  Action: [✓ Đánh dấu Done]  [👤 Assign]  [⬇ Export Excel]   [Sửa]           ║
╚══════════════════════════════════════════════════════════════════════════════╝
   * Trạng thái hoàn thành đánh dấu thủ công (BR-260 FUNC-343)
   * Cấu hình mailbox + parser do admin thiết lập
```

**Tương tác chính:**
1. Cột trái: inbox đọc email gốc; click một email → cột phải hiện preview + dữ liệu auto-parsed (FUNC-341).
2. Cột dưới: bảng Service Order đã được tự tạo từ email, gắn theo tail (FUNC-342).
3. Action "Đánh dấu Done" cập nhật trạng thái thủ công + ghi nhận người đánh dấu + thời điểm (FUNC-343).
4. Action "Assign" gán Service Order cho nhân viên KTKTB cụ thể.
5. Export ra Excel/TSV để báo cáo định kỳ.

*(Format email LIDO, danh mục "Loại service" và bộ trường Service Order chính thức — layout cần xác nhận sau khi có entity map; PHAN-RA v0.4 cờ `[cần xác nhận]` tại FUNC-341…343.)*

---

## Tóm tắt truy vết WF ↔ BR/FUNC

| Wireframe | Mục tiêu | BR nguồn | FUNC nguồn |
|---|---|---|---|
| WF-PH2-01 | Danh sách chuyến bay và tài liệu | BR-201…BR-206, BR-213, BR-222 | FUNC-201…208, 252…255, 296…298 |
| WF-PH2-02 | Soạn/nộp NOTOC | BR-229…BR-234 | *(Khối B chưa phân rã FUNC — chờ bản sau)* |
| WF-PH2-03 | Quản lý MEL/CDL | BR-242, BR-243, BR-244 | *(Khối D chưa phân rã FUNC — chờ bản sau)* |
| WF-PH2-04 | Dispatch Release | BR-205…BR-217 | FUNC-252…258, 276…282 |
| WF-PH2-05 | Dashboard tài liệu chuyến bay | BR-257 | FUNC-332…335 |
| WF-PH2-06 | Service Order từ email LIDO | BR-260 | FUNC-341…343 |

## Các điểm `[cần xác nhận]` cross-cutting

| # | Vấn đề | Áp dụng cho WF | Ghi chú |
|---|---|---|---|
| 1 | Danh mục đầy đủ phiên bản OFP (cấu trúc R1/R2/2.1…) | WF-01, WF-04 | FUNC-281 — quy ước sau Unrelease |
| 2 | Bộ trường tối thiểu OFP cần parse (BR-202) | WF-01, WF-04 | Layout cần xác nhận sau entity map |
| 3 | Danh mục đầy đủ "Loại tài liệu" (DG/COMAT/Thường…) | WF-02 | BR-229 — cần SME bổ sung |
| 4 | Quan hệ MEL item ↔ MEL master (PH4) | WF-03 | BR-242/243/244 — chờ PH4 BR-425/426 chốt |
| 5 | Danh mục checklist Dispatch Release | WF-04 | 7 mục dựa BR-205…BR-217; chờ SME xác nhận đủ/thiếu |
| 6 | Danh mục "Loại yêu cầu bất thường" | WF-05 | FUNC-332…335 cờ `[cần xác nhận]` |
| 7 | Format email LIDO + danh mục "Loại service" | WF-06 | FUNC-341…343 cờ `[cần xác nhận]` |
| 8 | Sandbox NOTOC (BR-235) | WF-02 | Chờ PH5 BR-542 chốt cơ chế sync PROD→TEST |

---

*WF-PH2 v0.1 — 2026-06-17. Trùng quy ước với WF-PH1 v0.1 (low-fidelity ASCII, co-evolution P4). Lịch sử version: xem `BA-VERSION-LOG.md`.*
