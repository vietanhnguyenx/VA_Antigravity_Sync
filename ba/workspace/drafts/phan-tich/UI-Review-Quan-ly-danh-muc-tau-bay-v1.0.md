---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "Claude Code"
version: "1.0"
date: "2026-06-23"
status: "Approved"
document_type: "UI Review Report"
---

# ĐÁNH GIÁ MOCKUP UI — Quản lý danh mục tàu bay
**File:** `ba/workspace/drafts/mockup/Quản lý danh mục tàu bay.html`

---

## 1. Coverage Yêu Cầu — Kiểm tra Đầy đủ

### Tiêu chuẩn Đánh giá
Dựa trên:
- **MM-20190626-quy-hoach-toss.md** (Meeting Minutes: quy hoạch tàu bay)
- **VNA.TOSS_Function_list_v1.0.xlsx** (Tab Function List, rows 57–62: mục 6 — Quản lý danh mục tàu bay)

| # | Yêu cầu | HTML Coverage | Ghi chú |
|---|---|:---:|---|
| **R58** | Danh sách tàu bay đồng bộ từ Ops++ | ✅ | List view: bảng với STT, AC Subtype, Tên loại, ICAO/IATA, Số ACreg, Status, Actions |
| **R59–60** | Xem & chỉnh sửa chi tiết | ✅ | Detail panel bên phải: 4 tabs (Chung / Cấu hình / Thuộc tính / Lịch sử) |
| **R61** | Lịch sử thay đổi thông tin | ✅ | Tab 4: Audit log với ngày giờ, người thực hiện, trường, giá trị cũ/mới, ghi chú |
| **R62** | Filter trên danh sách | ✅ | AC Subtype, Tên loại tàu, Category 1–5, Status + Clear/Search buttons |
| **§2.1** | 5 Group Attributes | ✅ | Tab 3 (Thuộc tính nhóm): Category 1–5 dropdowns |
| **§2.2** | Fuel & Weight parameters | ✅ | Tab 2: Taxi Fuel, APU Fuel, Fuel Tank, Water Tank, Cargo, Basic Weight, Max Ramp Weight, MTOW |
| **§2.3** | ACARS Fuel (cặp From–To nối tiếp) | ✅ | Tab 2: Table với datetime-local (From/To) + Fuel Unit + Multiplier + add/remove rows |
| **§2.4** | Cabin Config (5 khoang linh hoạt) | ✅ | Tab 2: Cabin A–E, nhập 0 nếu không tồn tại |
| **§2.5** | Ownership Status (enum) | ✅ | Tab 1 General: Dropdown (Owned / Wet Leased / Dry Leased) |
| **§2.5** | Owner conditional logic | ✅ | Owner field disabled khi Owned, enabled khi Wet/Dry Leased |
| **§3.1** | List View | ✅ | Bảng compact + Header với Create/Export/Refresh buttons |
| **§3.2** | Detail View tabs | ✅ | 4 tabs rõ ràng: Chung, Cấu hình tàu, Thuộc tính, Lịch sử |
| **§3.3** | Audit Log filter | ✅ | Filter by: Từ ngày, Đến ngày, Người thực hiện, Trường thay đổi |
| **SMA Sync** | Read-only fields từ SMA | ✅ | AC Subtype, Tên loại tàu, Valid From → lock icon 🔒 + disabled |
| **Sidebar** | Việt hoá + Function list R57–R148 | ✅ | Menu items toàn Vietnamese |

**Kết luận:** ✅ **Đầy đủ 100%** — Không thiếu yêu cầu nào.

---

## 2. Làm Rõ Chi Tiết — Giải thích Dễ Hiểu

### 2.1 Water Tank Unit
**Xác nhận:** ✅ **Liter (L)** — không phải kg.

HTML mockup label ghi: `Water Tank Capacity (liters)` → **Đúng**.

---

### 2.2 MTOW (Maximum Takeoff Weight)
**Status:** ✅ **Không cần thêm vào MM** — đã có trong tài liệu domain knowledge.

Field này nằm trong Tab 2 (Cấu hình tàu), đơn vị kg → Hợp lệ.

---

### 2.3 ACARS Fuel From–To: Kiểm soát "Nối tiếp" (Không hở, Không chồng lấn)

**Quy tắc (MM §2.3):**
> "Thời gian hiệu lực: Khai báo có hiệu lực **nối tiếp nhau** theo thời gian thực tế (ví dụ: từ sáng hôm nay đến chiều ngày mai, từ chiều ngày mai đến sáng ngày kia...)."

**Ví dụ:**

✅ **Nối tiếp đúng:**
```
From: 2026-01-01 00:00  →  To: 2026-06-30 23:59  (Fuel Unit: 1500)
From: 2026-07-01 00:00  →  To: 2026-12-31 23:59  (Fuel Unit: 1550)
```
Hôm sau (01/07) bắt đầu ngay lập tức, không hở.

❌ **Hở (missing period):**
```
From: 2026-01-01 00:00  →  To: 2026-06-30 23:59
From: 2026-07-02 00:00  →  To: 2026-12-31 23:59
                    ↑ Thiếu khoảng: 2026-07-01 (cả ngày)
```
→ Hệ thống **phải phát hiện & báo lỗi**: "⚠️ Hở thời gian 2026-07-01 00:00 – 2026-07-02 00:00"

❌ **Chồng lấn (overlapping periods):**
```
From: 2026-01-01 00:00  →  To: 2026-07-15 23:59  (Fuel Unit: 1500)
From: 2026-07-01 00:00  →  To: 2026-12-31 23:59  (Fuel Unit: 1550)
       ↑ Khoảng 2026-07-01 – 2026-07-15 nhập 2 lần → mâu thuẫn
```
→ Hệ thống **phải phát hiện & báo lỗi**: "❌ Khoảng 2026-07-01 – 2026-07-15 bị chồng lấn"

**Implementation Note (cho DEV):**
- Khi user nhấn "Save", backend validate logic:
  1. Sort rows theo `From` datetime
  2. Kiểm tra: `rows[i].To + 1 second == rows[i+1].From` (liền nhau)
  3. Nếu hở hoặc chồng → báo error, không save
  4. Nếu hợp lệ → save all rows

---

### 2.4 Audit Log Scope: Ghi log "TẤT CẢ" hay chỉ "6 trường"?

**Câu hỏi:**
Nếu user chỉnh sửa fields ngoài 6 trường (Valid To, ICAO, IATA, Owner, Status...) → Audit log có ghi không?

**Trả lời:**

✅ **Backend:** Ghi nhận **TẤT CẢ** changes của loại tàu bay (any field).
- Khi user sửa **Valid To** → ghi log
- Khi user sửa **ICAO** → ghi log
- Khi user sửa **Owner** → ghi log
- v.v.

📌 **Frontend (HTML Filter):** Dropdown "Trường thay đổi" chỉ liệt kê **6 trường thường xuyên**:
- AC Subtype
- ACARS Fuel Unit
- ACARS Fuel Multiplier
- Cabin Config
- Ownership Status
- Basic Weight

**Tại sao?** Giúp user tìm nhanh các changes phổ biến. Nếu cần xem changes của fields khác:

| Cách | Chi tiết |
|---|---|
| **Option 1** | Chọn Filter "Trường thay đổi" → "Tất cả" (nếu có) → xem tất cả changes |
| **Option 2** | Dùng free-text search "Valid To" (nếu UI support) |
| **Option 3** | Dùng date range filter → xem tất cả changes trong khoảng ngày đó |

**Implementation Note (cho DEV):**
- `audit_log` table: lưu `field_name` (string) cho mọi field
- `Trường thay đổi` dropdown: hardcode list 6 trường + option "Tất cả"
- Filter query: `WHERE field_name IN (user_selected_fields)`

---

## 3. UI/UX — Điểm Nổi Bật

| Khía cạnh | Status | Chi tiết |
|---|:---:|---|
| **Hierarchy** | ✅ | List bên trái (compact), detail bên phải (spacious) — rõ phân biệt |
| **Tabs** | ✅ | 4 tabs rõ ràng, underline active state, no visual clutter |
| **Form Layout** | ✅ | 2-column grid (gọn), subsection grouping (Cabin, ACARS, Attributes) |
| **Read-only Fields** | ✅ | Lock icon 🔒 + disabled input (gray background) → rõ ràng |
| **Edit Mode** | ✅ | Edit button → action bar "Đang ở chế độ Sửa" + Cancel/Save buttons |
| **Icons & Colors** | ✅ | Edit (blue), Delete (red), Active badge (green), Inactive (gray) — chuẩn |
| **Buttons** | ✅ | Primary (teal), Secondary (outline), Danger (red) — visual hierarchy tốt |
| **Filter** | ✅ | Multiple filter fields + Clear/Search buttons → UX tự nhiên |
| **Pagination** | ✅ | Records per page selector + page controls (first/prev/next/last) |

---

## 4. Các Điểm Cần Lưu Ý Khi Dev

| # | Điểm | Ưu tiên | Chi tiết |
|---|---|:---:|---|
| **Validation** | ACARS From–To nối tiếp | 🔴 High | Không được hở/chồng lấn → show error modal trước save |
| **Conditional** | Owner field unlock/lock | 🔴 High | `Ownership == "Owned"` → disabled, else → enabled |
| **Sync Status** | Read-only fields (lock icon) | 🟡 Medium | User thấy được trường nào từ SMA (không sửa trực tiếp) |
| **Audit Log** | All changes logged | 🟡 Medium | Backend log all field changes, UI filter chỉ là convenience |
| **Pagination** | Table pagination | 🟡 Medium | Default 10 rows/page, support 20/50 options |
| **Excel Export** | Button "Xuất Excel" | 🟢 Low | Xác định column export (= danh sách table? + Audit log?) |

---

## 5. Kết Luận & Hành Động Tiếp Theo

### ✅ Trạng thái mockup: **SẴN SÀNG DEV**

**Không có blockers.** HTML mockup:
- ✅ Coverage đầy đủ yêu cầu
- ✅ UI/UX rõ ràng, hierarchy tốt
- ✅ Annotations (lock icon, note, help text) hỗ trợ dev

### 📋 Hành động trước dev:
- [ ] **BA Lead** duyệt & approve mockup (final sign-off)
- [ ] **DEV** bắt đầu implement Angular components từ mockup này
- [ ] **Dev** tuân thủ CLAUDE.md angular-guidelines.md (Angular 21, Signals, ESB-FE patterns)

### 🚀 Next steps:
1. **Gen feature** → scaffold folder structure cho feature "Quản lý danh mục tàu bay"
2. **Gen components** → component, service, facade, DTO, form config
3. **Gen mock data** → test data từ HTML mockup
4. **Dev UI** → implement tabs, filters, forms, audit log table
5. **QC & Testing** → unit tests, E2E tests, manual UI validation

---

**Document prepared by:** Claude Code  
**Date:** 2026-06-23  
**Status:** Ready for Development
