---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
document_type: "Excel Export Template Specification"
author: "BA Team"
version: "1.0"
date: "2026-06-24"
status: "For Developer Implementation"
---

# Excel Export Template Specification — Aircraft Catalog Management

## 1. Danh Sách Tàu Bay (List View Export)

**Trigger:** Người dùng click nút `[Export Excel]` trên danh sách tàu bay (mục 1)

**Tên file:** `TOSS_Aircraft_List_<ddmmyyyy>.xlsx` (ví dụ: `TOSS_Aircraft_List_24062026.xlsx`)

**Scope:** Xuất tất cả dòng theo bộ lọc hiện tại (nếu có filter → chỉ xuất kết quả filter, không xuất toàn bộ)

### Sheet 1: Aircraft List

| # | Column Name (VI) | Column Name (EN) | Data Type | Width | Format | Notes |
|---|---|---|---|---|---|---|
| 1 | STT | No. | Integer | 5 | Right align | Tăng dần từ 1 |
| 2 | Mã loại tàu bay | AC Subtype | Text | 12 | Left align, BOLD | Khóa chính (vd: A320NEO, B787) |
| 3 | Số tàu bay đăng ký | Registration Count | Integer | 15 | Center | Số lượng ACreg thuộc loại này |
| 4 | Tên loại tàu bay | Aircraft Type Name | Text | 25 | Left align | Tên đầy đủ (vd: Airbus A320-200 NEO) |
| 5 | ICAO Code | ICAO Code | Text | 8 | Center | 3-4 ký tự (vd: A20N) |
| 6 | IATA Code | IATA Code | Text | 6 | Center | 2-3 ký tự (vd: 32N) |
| 7 | Trạng thái | Status | Text | 10 | Center | Active / Inactive (với color: Green/Gray) |
| 8 | Ngày hiệu lực từ | Valid From | Date | 12 | Center, dd/mm/yyyy | Ngày bắt đầu |
| 9 | Ngày hiệu lực đến | Valid To | Date | 12 | Center, dd/mm/yyyy | Ngày kết thúc (NULL → "—") |
| 10 | Đơn vị sở hữu | Owner | Text | 20 | Left align | Tên công ty (NULL → "—") |
| 11 | Loại sở hữu | Ownership Status | Text | 15 | Left align | Owned / Wet Leased / Dry Leased |
| 12 | Danh mục 1 | Category 1 | Text | 15 | Left align | Phân loại cấp 1 (vd: A320NEO) |
| 13 | Danh mục 2 | Category 2 | Text | 15 | Left align | Phân loại cấp 2 |
| 14 | Danh mục 3 | Category 3 | Text | 15 | Left align | Phân loại cấp 3 |
| 15 | Danh mục 4 | Category 4 | Text | 15 | Left align | Phân loại cấp 4 |
| 16 | Danh mục 5 | Category 5 | Text | 8 | Center | Phân loại cấp 5 (vd: 320) |
| 17 | Dàn đội | Aircraft Fleet | Text | 10 | Center | A320 / A321 / A350 / B787 / ATR |
| 18 | MTOW (kg) | MTOW | Decimal | 12 | Right align, 0 decimals | Trọng lượng cất cánh tối đa |
| 19 | Năng lực (ghế) | Seating Capacity | Integer | 12 | Right align | Số ghế tối đa |
| 20 | Ngày xuất | Export Date | Date | 12 | Center, dd/mm/yyyy HH:MM | Timestamp xuất file |

### Header / Footer Format

- **Header:** Dòng 1 chứa tiêu đề: `TOSS — DANH SÁCH TÀU BAY` (bold 14pt, centered)
- **Header Row:** Dòng 2 (after tiêu đề) = row header với background color **xám nhạt (#D9D9D9)**, text đen bold, center align
- **Filter Info:** Dòng bên dưới header (sau data): `Exported on: 24/06/2026 10:30:45 UTC | Filter: AC Subtype contains "A320", Status = Active | Total Records: 45`
- **Footer:** Page number "Trang 1 / 1"

### Data Format Rules

- **NULL values:** Hiển thị `—` (dấu gạch ngang)
- **Date fields:** Format `dd/mm/yyyy` (vd: 24/06/2026)
- **Numbers:** Thousand separator (vd: 73,500 kg) — khóa tính toán Excel bình thường
- **Color coding (optional but recommended):**
  - Status = "Active" → background color xanh nhạt (#C6EFCE)
  - Status = "Inactive" → background color xám (#F2F2F2)
- **Freeze panes:** Dòng header (row 2) freeze để user scroll data mà vẫn thấy tiêu đề

---

## 2. Lịch Sử Thay Đổi (Audit Log Export)

**Trigger:** Người dùng click nút `[Download Excel]` trên Tab 4 — Lịch sử thay đổi (mục 2.4)

**Tên file (CH-10):** `TOSS_Aircraft_History_<AC_Subtype>_<ddmmyyyy>.xlsx`
- Ví dụ: `TOSS_Aircraft_History_A320NEO_24062026.xlsx`
- Ví dụ: `TOSS_Aircraft_History_B787_15062026.xlsx`

**Scope:** Xuất audit log theo bộ lọc Tab 4 (Date From/To, Changed By, Changed Field)

### Sheet 1: Audit Log

| # | Column Name (VI) | Column Name (EN) | Data Type | Width | Format | Notes |
|---|---|---|---|---|---|---|
| 1 | STT | No. | Integer | 5 | Right align | Tăng dần từ 1 |
| 2 | Ngày giờ thay đổi | Date/Time | DateTime | 18 | Center, dd/mm/yyyy HH:MM:SS | Format UTC (vd: 23/06/2026 10:30:45) |
| 3 | Người thực hiện | Changed By | Text | 15 | Left align | Username / Full name (vd: data_officer) |
| 4 | Tab | Tab | Text | 20 | Center | Nhóm thay đổi: General Information / Aircraft Configuration / Group Attributes |
| 5 | Trường thay đổi | Field | Text | 20 | Left align | Tên field (vd: ICAO Code, Cabin Config, Valid To) |
| 6 | Giá trị cũ | Old Value | Text | 30 | Left align | Giá trị trước (NULL → `—`) |
| 7 | Giá trị mới | New Value | Text | 30 | Left align | Giá trị sau (NULL → `—`) |
| 8 | Ghi chú | Notes | Text | 30 | Left align | Ghi chú người dùng (NULL → trống) |
| 9 | IP Address | IP Address | Text | 15 | Center | (CH-07: compliance trail, not visible in UI but exported) |
| 10 | User-Agent | User-Agent | Text | 50 | Left align, wrap text | Browser/OS signature (CH-07) |
| 11 | Thiết bị | Device | Text | 12 | Center | Desktop / Mobile / Tablet |

### Header / Footer Format

- **Header:** Dòng 1: `TOSS — LỊCH SỬ THAY ĐỔI: [AC_SUBTYPE]` (bold 14pt, centered)
  - Ví dụ: `TOSS — LỊCH SỬ THAY ĐỔI: A320NEO`
- **Header Row:** Dòng 2 = row header với background xám (#D9D9D9), text đen bold, center
- **Filter Info:** Dòng bên dưới data:
  ```
  Exported on: 24/06/2026 14:25:30 UTC | Filter: Date From: 01/01/2026, Date To: 24/06/2026, Changed By: All, Changed Field: All | Total Changes: 127
  ```
- **Footer:** Page number & aircraft subtype

### Data Format Rules

- **Date/Time:** Format `dd/mm/yyyy HH:MM:SS` (UTC)
- **NULL values:** `—` (dấu gạch ngang)
- **Text fields:** Left align (Word wrap enabled for long values)
- **Color coding (optional):**
  - Tab = "General Information" → background màu xanh nhạt (#E8F4F8)
  - Tab = "Aircraft Configuration" → background màu vàng nhạt (#FFF9E6)
  - Tab = "Group Attributes" → background màu tím nhạt (#F3E5F5)
- **Freeze panes:** Dòng header (row 2) freeze

### Additional Sheet: Summary (Optional)

**Sheet 2: Summary Statistics** — tóm tắt thống kê thay đổi:

| Metric | Value | Notes |
|---|---|---|
| Aircraft Subtype | A320NEO | |
| Total Changes | 127 | per-field granularity |
| Date Range | 01/01/2026 — 24/06/2026 | theo bộ lọc |
| Most Changed Field | Valid To | số lần thay đổi |
| Changed By (Top 5) | data_officer (45), supervisor_01 (32), ... | danh sách user top 5 |
| Export Date | 24/06/2026 14:25:30 UTC | |

---

## 3. Common Excel Configuration

### Workbook Settings

- **Sheet protection:** OFF (cho user chỉnh sửa/copy nếu cần)
- **File format:** `.xlsx` (Office Open XML) — tương thích Excel 2016+
- **Encoding:** UTF-8 (hỗ trợ tiếng Việt)
- **Default locale:** Vietnamese (vi-VN) — date/number format theo quy chuẩn VN

### Font & Style

- **Font:** Times New Roman 11pt (thân), 12pt (header)
- **Header row:** Times New Roman **bold** 12pt, background #D9D9D9, border black 0.5pt all sides
- **Data rows:** Times New Roman 11pt, left/center align per column type, border light gray
- **Alternating row color (optional):** Mỗi dòng lẻ background trắng (#FFFFFF), dòng chẵn #F9F9F9 (để dễ đọc)

### Borders & Grid

- **Header row:** Black border 0.5pt all sides
- **Data rows:** Light gray (#CCCCCC) border 0.25pt on bottom, no left/right
- **Column separator:** Light gray 0.25pt vertical line

### Column Width Auto-fit

- Tính toán width = max(header length, max data length) + 2 spaces
- Nếu data quá dài (>30 chars) → text wrap enabled

### Print Settings

- **Orientation:** Landscape (wider data)
- **Margin:** 0.5 inch all sides
- **Fit to:** Fit to page width (tự động scale để fit 1 trang ngang)
- **Header/Footer:** In tên file + date + page number

---

## 4. API Response & Export Workflow

### API for List Export

**Endpoint:** `GET /api/aircraft-types/export?filter=...&format=excel`

**Request:**
```json
{
  "filter": {
    "ac_subtype": "",
    "registration_count": "",
    "category_1": "All",
    "category_2": "All",
    "category_3": "All",
    "category_4": "All",
    "category_5": "All",
    "status": "All"
  },
  "format": "excel",
  "page": 1,
  "pageSize": 1000  // tối đa export
}
```

**Response:**
- Content-Type: `application/vnd.openxmlformats-officedocument.spreadsheetml.sheet`
- Header: `Content-Disposition: attachment; filename="TOSS_Aircraft_List_24062026.xlsx"`
- Body: Binary XLSX file

### API for Audit Log Export

**Endpoint:** `GET /api/aircraft-types/{id}/audit-log/export?format=excel`

**Request:**
```json
{
  "aircraft_type_id": "A320NEO",
  "filter": {
    "date_from": "01/01/2026",
    "date_to": "24/06/2026",
    "changed_by": "All",
    "changed_field": "All"
  },
  "format": "excel"
}
```

**Response:**
- Content-Type: `application/vnd.openxmlformats-officedocument.spreadsheetml.sheet`
- Header: `Content-Disposition: attachment; filename="TOSS_Aircraft_History_A320NEO_24062026.xlsx"`
- Body: Binary XLSX file

---

## 5. Implementation Notes for Developer

### Libraries (Recommended)

- **Node.js / TypeScript:** `exceljs` (npm install exceljs)
  - Support: Cell formatting, colors, borders, freeze panes, multiple sheets
  - Example: [Link to ExcelJS docs](https://github.com/exceljs/exceljs)

- **C# (.NET):** `ClosedXML` (NuGet: ClosedXML)
  - Support: Full Office Open XML spec, cell styling, formulas, data validation

- **Python:** `openpyxl` (pip install openpyxl)

### Validation Before Export

- ✅ Verify filter parameters (date range validation, user permission check)
- ✅ Limit export to max 10,000 rows (performance + file size)
- ✅ Null/empty value handling: Convert to `—` before writing to Excel
- ✅ DateTime: Always export in UTC (append "UTC" in header)
- ✅ Filename encoding: Use URL encoding if non-ASCII

### Performance Optimization

- **Streaming write:** For large datasets (>5000 rows), use workbook streaming (write row-by-row without loading all to memory)
- **Cache:** Pre-compute summary statistics if exporting audit log frequently
- **Compression:** XLSX is ZIP-compressed by default; no additional compression needed

### Accessibility (A11Y)

- Color should not be the only indicator (use text labels + color)
- Provide alt-text for embedded charts (if any)
- Freeze panes: Allow keyboard navigation (Ctrl+Home to frozen cell)

---

## 6. QC Checklist for Export

Before submitting to user:

- [ ] Filename matches CH-10 convention exactly
- [ ] All 20 columns present in List export (or 11 columns in Audit log)
- [ ] Header row styled (bold, background color, border)
- [ ] No "undefined" / "null" strings — use `—` instead
- [ ] Date format consistent (dd/mm/yyyy)
- [ ] Numbers formatted with thousand separator
- [ ] Freeze panes active on header row
- [ ] No blank columns between data
- [ ] Footer shows filter info + total count
- [ ] File opens without errors in Excel 2016+
- [ ] UTF-8 Vietnamese characters display correctly
- [ ] Print preview shows data fit on 1-2 pages (landscape)

---

*Template Version 1.0 — 2026-06-24. Phục vụ developer implement Excel export cho mục 1 (Danh sách tàu bay) và mục 2.4 (Lịch sử thay đổi). Tham chiếu SRS-TOSS-PH4-II-1-quan-ly-tau-bay-REFORMAT-v0.8, US-001 và US-013.*
