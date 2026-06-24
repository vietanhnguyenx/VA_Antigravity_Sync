---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
title: "Multilingual Translation Table — v3.html (VI ↔ EN)"
version: "1.0"
date: "2026-06-24"
status: "Pending Approval"
document_type: "Translation Reference"
---

# Multilingual Translation Table — Aircraft Catalog Management (v3.html)

> **Purpose:** Standard bilingual mapping for converting v3.html from Vietnamese → English
>
> **Source:** `.claude/glossary/ba-terms-vi-en.md` (TOSS standard terminology)
>
> **Process:** All translations verified against BA glossary. Missing terms (domain-specific UI labels) use provisional translations marked with `⚠️ NEW`.
>
> **Status:** PENDING USER APPROVAL before implementation

---

## TABLE OF CONTENTS

1. [Sidebar Navigation](#1-sidebar-navigation)
2. [Main Header Tabs](#2-main-header-tabs)
3. [Filter Bar](#3-filter-bar)
4. [Table & List View](#4-table--list-view)
5. [Details Panel Tabs](#5-details-panel-tabs)
6. [Tab 1: General Information](#6-tab-1-general-information)
7. [Tab 2: Aircraft Configuration](#7-tab-2-aircraft-configuration)
8. [Tab 3: Group Attributes](#8-tab-3-group-attributes)
9. [Tab 4: Audit Log](#9-tab-4-audit-log)
10. [Buttons & Actions](#10-buttons--actions)
11. [Help Text & Hints](#11-help-text--hints)
12. [Status Badges](#12-status-badges)
13. [Messages & Notifications](#13-messages--notifications)

---

## 1. SIDEBAR NAVIGATION

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| Quản lý Danh mục | Master Data Management | Branding | Logo subtitle |
| Đóng/Mở menu | Toggle Navigation | UI Control | Sidebar button |
| **Navigation Items:** |  |  |  |
| Tàu bay | Aircraft Fleet | Menu Item | Active (primary) |
| AOG/MNT Schedule | AOG/Maintenance Schedule | Menu Item | Secondary menu |
| AOG/MNT Code | AOG/Maintenance Codes | Menu Item | Secondary menu |
| MEL, CDL | MEL, CDL | Menu Item | Maintenance standards |
| Performance Factor | Performance Factor | Menu Item | Configuration module |
| Sân bay | Airports | Menu Item | Location database |
| Chặng bay | Flight Routes | Menu Item | Route management |
| Payload | Payload | Menu Item | Weight & balance |
| Tankering | Tankering | Menu Item | Fuel management |
| Giá nhiên liệu | Fuel Pricing | Menu Item | Cost tracking |
| ULD | ULD (Unit Load Devices) | Menu Item | Ground equipment |
| FIR | FIR (Flight Information Region) | Menu Item | Airspace data |
| Phi công | Pilots | Menu Item | Crew database |
| Tiếp viên | Flight Attendants | Menu Item | Crew database |
| Quốc gia | Countries | Menu Item | Reference data |
| Carrier | Carriers | Menu Item | Airline partners |
| Cơ quan đơn vị | Organizational Units | Menu Item | Structure |
| DOW | DOW (Dry Operating Weight) | Menu Item | Aircraft weight |
| **Footer Actions:** |  |  |  |
| Thông báo | Notifications | Menu Item | Alert center |
| Cài đặt | Settings | Menu Item | User preferences |
| Lịch sử hệ thống | System Audit Log | Menu Item | Activity history |
| Đăng xuất | Sign Out | Menu Item | User logout |
| Data Officer | Data Officer | User Profile | Role label |

---

## 2. MAIN HEADER TABS

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| 📋 Danh sách loại tàu bay | 📋 Aircraft Type Catalog | Tab 1 | Primary tab (active) |
| 📅 AOG/MNT Schedule | 📅 AOG/Maintenance Schedule | Tab 2 | Secondary tab |
| 🔧 AOG/MNT Code | 🔧 AOG/Maintenance Codes | Tab 3 | Secondary tab |
| ⚠️ MEL, CDL | ⚠️ MEL, CDL | Tab 4 | Maintenance standards |
| ⏱️ Performance Factor | ⏱️ Performance Factors | Tab 5 | Configuration tab |

---

## 3. FILTER BAR

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| **Filter Labels:** |  |  |  |
| AC Subtype | AC Subtype | Filter Field | Aircraft code |
| Tên loại tàu | Aircraft Type Name | Filter Field | Description |
| Category 1–5 | Category 1–5 | Filter Field | Classification |
| Trạng thái | Status | Filter Field | Active/Inactive |
| **Placeholders:** |  |  |  |
| VD: A320NEO | E.g., A320NEO | Placeholder | Example input |
| Tìm theo tên loại tàu bay | Search by aircraft type name | Placeholder | Instruction |
| **Filter Options:** |  |  |  |
| Tất cả | All | Dropdown Option | Select all |
| Active | Active | Dropdown Option | Status |
| Inactive | Inactive | Dropdown Option | Status |
| **Buttons:** |  |  |  |
| Xoá bộ lọc | Clear Filters | Button | Reset form |
| Tìm kiếm | Search | Button | Apply filters |

---

## 4. TABLE & LIST VIEW

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| **Header Text:** |  |  |  |
| Danh sách loại tàu bay | Aircraft Type List | Section Title | Main heading |
| Làm mới | Refresh | Button Title | Reload data |
| **Column Headers:** |  |  |  |
| STT | No. | Table Column | Row number |
| AC Subtype | AC Subtype | Table Column | Aircraft code |
| Tên loại tàu | Aircraft Type Name | Table Column | Model name |
| ICAO | ICAO Code | Table Column | Aviation code |
| IATA | IATA Code | Table Column | Aviation code |
| Số ACreg | Registration Count | Table Column | Fleet size |
| Trạng thái | Status | Table Column | Active/Inactive |
| Thao tác | Actions | Table Column | Edit/delete |
| **Pagination:** |  |  |  |
| Hiển thị | Show | Label | Record count |
| 10 dòng | 10 rows | Option | Page size |
| 20 dòng | 20 rows | Option | Page size |
| 50 dòng | 50 rows | Option | Page size |
| Tổng cộng: | Total: | Label | Record count |

---

## 5. DETAILS PANEL TABS

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| Chung | General Information | Tab 1 | Read-only overview |
| Cấu hình tàu | Aircraft Configuration | Tab 2 | Technical parameters |
| Thuộc tính nhóm | Group Attributes | Tab 3 | Classification |
| Lịch sử thay đổi | Change History | Tab 4 | Audit log (read-only) |

---

## 6. TAB 1: GENERAL INFORMATION

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| **Section Header:** |  |  |  |
| Thông tin chung (General Info) | General Information | Heading | Section title |
| **Field Labels:** |  |  |  |
| AC Subtype | AC Subtype | Field Label | Aircraft code |
| Tên loại tàu | Aircraft Type Name | Field Label | Model name |
| Valid From | Valid From | Field Label | Start date (from SMA) |
| Valid To | Valid To | Field Label | End date (editable) |
| ICAO Code | ICAO Code | Field Label | Aviation standard |
| IATA Code | IATA Code | Field Label | Aviation standard |
| Ownership Status | Ownership Status | Field Label | Lease status |
| Owned | Owned | Dropdown Option | Ownership type |
| Wet Leased | Wet Leased | Dropdown Option | Lease type |
| Dry Leased | Dry Leased | Dropdown Option | Lease type |
| Owner (tối đa 50 ký tự) | Owner (max 50 characters) | Field Label | ⚠️ NEW |
| Vietnam Airlines | Vietnam Airlines | Field Value | Default owner |
| Tự động điền "Vietnam Airlines" nếu chọn "Owned" ở trên | Auto-filled as "Vietnam Airlines" when "Owned" is selected | Field Hint | Conditional logic |
| Trạng thái | Status | Field Label | Active/Inactive |
| **Help Text:** |  |  |  |
| Các trường có biểu tượng lock được đồng bộ từ hệ thống nguồn (SMA/Ops++), chỉ đọc trên TOSS. | Fields marked with lock icon are synchronized from source system (SMA/Ops++) and read-only in TOSS. | Help Text | SMA sync info |

---

## 7. TAB 2: AIRCRAFT CONFIGURATION

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| **Main Header:** |  |  |  |
| Tham số kỹ thuật (Aircraft Config) | Technical Parameters | Heading | Section title |
| **Field Labels:** |  |  |  |
| Taxi Fuel Flow (kg/h) | Taxi Fuel Flow (kg/h) | Field Label | Fuel consumption |
| APU Fuel Flow (kg/h) | APU Fuel Flow (kg/h) | Field Label | Auxiliary power |
| Fuel Tank Capacity (kg) | Fuel Tank Capacity (kg) | Field Label | Max fuel volume |
| Water Tank Capacity (liters) | Water Tank Capacity (liters) | Field Label | ⚠️ NEW: Unit corrected from kg to liters |
| Cargo Capacity (kg) | Cargo Capacity (kg) | Field Label | Max payload |
| Basic Weight (kg) | Basic Operating Weight (kg) | Field Label | Aircraft empty weight |
| Max Ramp Weight (kg) | Max Ramp Weight (kg) | Field Label | Maximum takeoff weight |
| MTOW (kg) | MTOW (kg) | Field Label | Maximum takeoff weight |
| **Subsection: Cabin Configuration** |  |  |  |
| Cấu hình khoang tàu (Cabin Config) | Cabin Configuration | Subsection Title | ⚠️ NEW |
| Khai báo tối đa 5 khoang. Khoang không tồn tại trên loại tàu này → nhập 0. | Declare up to 5 cabins. Enter 0 for non-existent cabins on this aircraft type. | Subsection Note | ⚠️ NEW |
| Cabin A | Cabin A | Field Label | First cabin |
| Cabin B | Cabin B | Field Label | Second cabin |
| Cabin C | Cabin C | Field Label | Third cabin |
| Cabin D | Cabin D | Field Label | Fourth cabin |
| Cabin E | Cabin E | Field Label | Fifth cabin |
| **Subsection: ACARS Fuel** |  |  |  |
| ACARS Fuel Unit & Fuel Multiplier | ACARS Fuel Limit & Fuel Multiplier | Subsection Title | Per MM §2.3 |
| Thêm khoảng hiệu lực | Add Time Period | Button Text | ⚠️ NEW |
| **ACARS Table Columns:** |  |  |  |
| From | From | Column Header | Start datetime |
| To | To | Column Header | End datetime |
| Fuel Unit | Fuel Limit | Column Header | Fuel consumption limit |
| Fuel Multiplier | Fuel Multiplier | Column Header | Adjustment factor |
| Thao tác | Actions | Column Header | Edit/delete row |
| **Subsection Help Text:** |  |  |  |
| Khai báo theo cặp, các khoảng From – To phải nối tiếp theo thời gian thực tế (không chồng lấn, không hở). | Declare as pairs; time periods (From–To) must be consecutive in real time (no gaps, no overlaps). | Help Text | Validation rule |
| Nối tiếp đúng: 2026-01-01 → 2026-06-30, rồi 2026-07-01 → 2026-12-31 | Correct sequence: 2026-01-01 → 2026-06-30, then 2026-07-01 → 2026-12-31 | Example (Correct) | ⚠️ NEW |
| Hở: 2026-01-01 → 2026-06-30, rồi 2026-07-02 → 2026-12-31 (thiếu 2026-07-01) | Gap: 2026-01-01 → 2026-06-30, then 2026-07-02 → 2026-12-31 (missing 2026-07-01) | Example (Gap) | ⚠️ NEW |
| Chồng lấn: 2026-01-01 → 2026-07-15, rồi 2026-07-01 → 2026-12-31 | Overlap: 2026-01-01 → 2026-07-15, then 2026-07-01 → 2026-12-31 | Example (Overlap) | ⚠️ NEW |

---

## 8. TAB 3: GROUP ATTRIBUTES

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| **Section Header:** |  |  |  |
| Thuộc tính nhóm (Group Attributes) | Group Attributes | Heading | Section title |
| **Help Text:** |  |  |  |
| 5 thuộc tính gom nhóm (Group Attributes) phục vụ lọc danh sách & xuất báo cáo đặc thù (MM §2.1, Function list R59). | 5 group attributes for filtering list and exporting custom reports (MM §2.1, Function list R59). | Help Text | Purpose |
| **Field Labels:** |  |  |  |
| Aircraft Category 1 | Aircraft Category 1 | Field Label | Classification |
| Aircraft Category 2 | Aircraft Category 2 | Field Label | Classification |
| Aircraft Category 3 | Aircraft Category 3 | Field Label | Classification |
| Aircraft Category 4 | Aircraft Category 4 | Field Label | Classification |
| Aircraft Category 5 | Aircraft Category 5 | Field Label | Classification |

---

## 9. TAB 4: AUDIT LOG

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| **Section Header:** |  |  |  |
| Lịch sử thay đổi | Change History | Heading | Section title |
| Chỉ đọc | Read-Only | Button Status | Disabled state |
| **Help Text:** |  |  |  |
| Lịch sử thay đổi — ghi nhận TẤT CẢ changes của loại tàu bay. | Change History — records ALL changes to aircraft type. | Description | ⚠️ NEW |
| Filter dropdown liệt kê 6 trường thường xuyên thay đổi... | Filter dropdown lists 6 frequently changed fields... | Help Text | ⚠️ NEW |
| **Audit Filter Labels:** |  |  |  |
| Từ ngày | From Date | Filter Label | Start date |
| Đến ngày | To Date | Filter Label | End date |
| Người thực hiện | Changed By | Filter Label | User |
| Tất cả | All | Dropdown Option | All users |
| data_officer | data_officer | Dropdown Option | User ID |
| admin | admin | Dropdown Option | User ID |
| sys_sync | sys_sync | Dropdown Option | System account |
| Trường thay đổi | Changed Field | Filter Label | Which field |
| AC Subtype | AC Subtype | Filter Option | Field name |
| ACARS Fuel Unit | ACARS Fuel Limit | Filter Option | Field name |
| ACARS Fuel Multiplier | ACARS Fuel Multiplier | Filter Option | Field name |
| Cabin Config | Cabin Configuration | Filter Option | Field name |
| Ownership Status | Ownership Status | Filter Option | Field name |
| Basic Weight | Basic Operating Weight | Filter Option | Field name |
| **Audit Table Columns:** |  |  |  |
| Ngày giờ | Date/Time | Column Header | Timestamp |
| Người thực hiện | Changed By | Column Header | User |
| Tab | Tab | Column Header | Section |
| Trường | Field | Column Header | Field name |
| Giá trị cũ | Old Value | Column Header | Previous value |
| Giá trị mới | New Value | Column Header | Current value |
| Ghi chú | Notes | Column Header | Change reason |
| **Sample Audit Data (Field Pills):** |  |  |  |
| Chung | General | Tab Reference | Section name |
| IATA Code | IATA Code | Field Reference | Field name |
| ICAO Code | ICAO Code | Field Reference | Field name |
| Cấu hình tàu | Aircraft Config | Tab Reference | Section name |
| APU Fuel Flow | APU Fuel Flow | Field Reference | Field name |
| Taxi Fuel Flow | Taxi Fuel Flow | Field Reference | Field name |
| Ownership Status | Ownership Status | Field Reference | Field name |
| Cabin Config | Cabin Configuration | Tab Reference | Section name |

---

## 10. BUTTONS & ACTIONS

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| **Edit Buttons:** |  |  |  |
| Sửa | Edit | Button Text | Per-section action |
| **Action Buttons (Table):** |  |  |  |
| Thao tác | Actions | Column Header | Action column |
| **Form Buttons:** |  |  |  |
| Huỷ | Cancel | Button Text | Edit mode cancel |
| Lưu | Save | Button Text | Edit mode save |
| **Filter/List Buttons:** |  |  |  |
| Xoá bộ lọc | Clear Filters | Button Text | Reset filter form |
| Tìm kiếm | Search | Button Text | Apply filters |
| Xoá | Delete | Button Text | Row/item delete |
| **Toast/Message Buttons:** |  |  |  |
| Thành công | Success | Message | Generic success |

---

## 11. HELP TEXT & HINTS

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| Các trường có biểu tượng lock được đồng bộ từ hệ thống nguồn (SMA/Ops++), chỉ đọc trên TOSS. | Fields with lock icon are synced from source system (SMA/Ops++) and read-only in TOSS. | Inline Help | SMA sync explanation |
| Tự động điền "Vietnam Airlines" nếu chọn "Owned" ở trên | Auto-filled as "Vietnam Airlines" when "Owned" is selected | Field Hint | Conditional fill |
| Khai báo tối đa 5 khoang. Khoang không tồn tại trên loại tàu này → nhập 0. | Declare up to 5 cabins. Enter 0 for cabins that don't exist on this aircraft type. | Section Note | Cabin rules |
| Khai báo theo cặp, các khoảng From – To phải nối tiếp theo thời gian thực tế (không chồng lấn, không hở). | Declare as pairs; time periods (From–To) must be consecutive with no gaps or overlaps. | Validation Rule | ACARS period rules |

---

## 12. STATUS BADGES

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| Active | Active | Status Badge | Operational |
| Inactive | Inactive | Status Badge | Retired/paused |

---

## 13. MESSAGES & NOTIFICATIONS

| Vietnamese (VI) | English (EN) | Category | Notes |
|---|---|---|---|
| **Toast Notifications:** |  |  |  |
| Thành công | Success | Message | Generic toast |
| Đã xoá bộ lọc | Filters cleared | Message | Action feedback |
| Đã áp dụng bộ lọc | Filters applied | Message | Action feedback |
| Đã làm mới danh sách | List refreshed | Message | Action feedback |
| Đang sửa: | Editing: | Message Prefix | Edit mode indicator |
| Lưu thay đổi thành công | Changes saved successfully | Message | Save success |
| Đã huỷ chỉnh sửa | Edit cancelled | Message | Cancel feedback |
| Đã vào chế độ chỉnh sửa | Entered edit mode | Message | ⚠️ NEW |
| Đã xoá khoảng hiệu lực | Time period deleted | Message | Row delete feedback |
| **Placeholder Tab Messages:** |  |  |  |
| AOG/MNT Schedule — Đang phát triển | AOG/Maintenance Schedule — Under Development | Message | Placeholder tab |
| AOG/MNT Code — Đang phát triển | AOG/Maintenance Codes — Under Development | Message | Placeholder tab |
| MEL, CDL — Đang phát triển | MEL, CDL — Under Development | Message | Placeholder tab |
| Performance Factor — Đang phát triển | Performance Factors — Under Development | Message | Placeholder tab |
| Sân bay — Đang phát triển | Airports — Under Development | Message | Placeholder tab |
| Chặng bay — Đang phát triển | Flight Routes — Under Development | Message | Placeholder tab |
| Payload — Đang phát triển | Payload — Under Development | Message | Placeholder tab |
| Tankering — Đang phát triển | Tankering — Under Development | Message | Placeholder tab |
| Giá nhiên liệu — Đang phát triển | Fuel Pricing — Under Development | Message | Placeholder tab |
| ULD — Đang phát triển | ULD — Under Development | Message | Placeholder tab |
| FIR — Đang phát triển | FIR — Under Development | Message | Placeholder tab |
| Phi công — Đang phát triển | Pilots — Under Development | Message | Placeholder tab |
| Tiếp viên — Đang phát triển | Flight Attendants — Under Development | Message | Placeholder tab |
| Quốc gia — Đang phát triển | Countries — Under Development | Message | Placeholder tab |
| Carrier — Đang phát triển | Carriers — Under Development | Message | Placeholder tab |
| Cơ quan đơn vị — Đang phát triển | Organizational Units — Under Development | Message | Placeholder tab |
| DOW — Đang phát triển | DOW — Under Development | Message | Placeholder tab |

---

## NOTES ON TRANSLATION CHOICES

### ⚠️ NEW TERMS (Not in BA Glossary)

These domain-specific UI labels were translated using standard aviation/IT conventions:

1. **"Quản lý Danh mục"** → **"Master Data Management"** (standard SAP/enterprise term)
2. **"Tàu bay"** → **"Aircraft Fleet"** (standard aviation term, refers to fleet/aircraft list)
3. **"Sân bay"** → **"Airports"** (standard aviation)
4. **"Chặng bay"** → **"Flight Routes"** (standard aviation)
5. **"Phi công"** → **"Pilots"** (standard aviation)
6. **"Tiếp viên"** → **"Flight Attendants"** (standard aviation)
7. **"Quốc gia"** → **"Countries"** (standard)
8. **"Cơ quan đơn vị"** → **"Organizational Units"** (standard enterprise term)
9. **"Nền tảng"** → **"Platform"** (IT standard)
10. **"Đang phát triển"** → **"Under Development"** (standard UI pattern)

All others sourced from `.claude/glossary/ba-terms-vi-en.md`.

### GLOSSARY COMPLIANCE

✅ **Adherence:**
- ✅ AC (Acceptance Criteria) / Tiêu chí chấp nhận — kept per glossary
- ✅ BR (Business Requirement) / Yêu cầu nghiệp vụ — kept per glossary
- ✅ BPMN / Mô hình hóa quy trình nghiệp vụ — not translated (per glossary)
- ✅ Use Case / Trường hợp sử dụng — standard format (per glossary)
- ✅ MEL, CDL, IATA, ICAO — no translation (proper nouns, per glossary)

---

## APPROVAL REQUIRED

| Item | Owner | Status |
|---|---|---|
| **Translation table** | Product Owner | 🟡 **PENDING** |
| **UI Implementation** | Dev Lead | ⏳ Blocked on approval |
| **Testing** | QA Lead | ⏳ Blocked on implementation |

**Next Step:** User review + approval → Implementation via Edit tool (estimated 30 min)

---

*Table prepared by Claude Code | Date: 2026-06-24*
