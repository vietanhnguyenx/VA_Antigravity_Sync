---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "Claude Code"
version: "1.0"
date: "2026-06-22"
status: "Draft"
document_type: "UI/UX Review & Recommendations"
---

# ĐỀ XUẤT CẢI TIẾN GIAO DIỆN QUẢN LÝ TÀU BAY (Flight Fleet)

## Tóm tắt Thực trạng & Gợi ý

### Tình trạng hiện tại
**Mockup** (`data-maintenance-mockup.html`) hiển thị danh sách tàu bay trong layout **split panel**:
- **Bên trái:** Bảng dữ liệu (Seq, Fleet Code, Fleet Name, Số tàu, Note, Status, Actions)
- **Bên phải:** Chi tiết tơi (sticky) — hiển thị thông tin chung của tàu được chọn

**Yêu cầu từ cuộc họp** (MM-20190626-quy-hoach-toss.md):
- Chia thông tin chi tiết thành **3 Tab:**
  - **Tab 1: Thông tin chung (General Info)** — AC Registration, Valid From/To, ICAO/IATA, trạng thái, sở hữu
  - **Tab 2: Cấu hình tàu (Aircraft Config)** — Fuel Flow, APU Fuel, Fuel Capacity, Water Tank, Cargo Capacity, cấu hình khoang
  - **Tab 3: Thông tin bổ sung (AK/AC Attributes)** — 5 Group Attributes, Ownership Status, trọng lượng
- **Tab 4 (đề xuất): Lịch sử thay đổi (Audit Log)** — ghi nhận các thay đổi quan trọng

---

## ĐÁNH GIÁ CHI TIẾT

### ✅ Những gì làm tốt

| Yếu tố | Đánh giá | Ghi chú |
|---|---|---|
| **Layout Split Panel** | ✅ Tốt | Cho phép xem danh sách & chi tiết cùng lúc; không cần mở popup riêng |
| **Filter Bar** | ✅ Phù hợp | Hỗ trợ tìm kiếm theo Code, Name, Status — đủ cho danh sách |
| **Sidebar Navigation** | ✅ Rõ ràng | 14 danh mục dữ liệu maintenance được sắp xếp logic |
| **Table Columns** | ⚠️ Cơ bản | Hiển thị đủ thông tin nhận dạng, nhưng chưa có các trường SMA |
| **Action Buttons** | ✅ Chuẩn | Edit / Delete rõ ràng; Create / Export hỗ trợ tốt |

### ❌ Những gì cần cải tiến

| Vấn đề | Mức độ | Chi tiết |
|---|---|---|
| **Chi tiết tàu chưa được tổ chức thành Tab** | 🔴 Cao | Mockup hiện tại chỉ hiển thị 5 trường cơ bản; yêu cầu chia 3–4 Tab để tránh quá tải |
| **Thiếu trường dữ liệu từ SMA** | 🔴 Cao | Không hiển thị: Valid From/To, ICAO/IATA, Fuel Flow, Capacity, Ownership Status, trọng lượng |
| **Không có bản tổng hợp cấu hình khoang** | 🟠 Trung | Yêu cầu cho phép cấu hình linh hoạt (0–N khoang) — cần giao diện rõ ràng |
| **Thiếu Lịch sử thay đổi (Audit Log)** | 🟠 Trung | Yêu cầu ghi nhận & xem lịch sử: AC Fuel Limit, Ownership, Config, Basic Weight |
| **Chi tiết panel chưa có Tab UI** | 🟠 Trung | Details card chỉ dạng "thông tin thuần", không có Tab header/switcher |
| **Không có trạng thái "Chỉ đọc" cho trường SMA** | 🟡 Thấp | Yêu cầu disable editing cho các trường đồng bộ từ SMA |

---

## GỢI ý CHỈNH SỬA CỤ THỂ

### 1. Cấu trúc Tab chi tiết (Details Panel)

**Thay đổi:** Bổ sung **Tab header** trong chi tiết panel, chia làm 4 Tab:

```
┌─ Chi tiết tàu: A320-A321 ────────────────────────────┐
│ [General]  [Aircraft Config]  [Attributes]  [Audit Log]
├──────────────────────────────────────────────────────┤
│ General Info Tab:
│ ├─ AC Registration: (read-only) A320-A321
│ ├─ Valid From / Valid To:
│ ├─ ICAO/IATA Code:
│ ├─ Ownership Status: (dropdown) Vietnam Airlines / Thuê khô / Thuê ướt
│ ├─ Owner Name: (auto-fill or editable per Ownership)
│ └─ Status: Active / Inactive
│
│ Aircraft Config Tab:
│ ├─ Fuel Flow (kg/h):
│ ├─ APU Fuel Flow (kg/h):
│ ├─ Fuel Capacity (kg):
│ ├─ Water Tank (kg):
│ ├─ Cargo Capacity (kg):
│ ├─ Basic Weight (kg):
│ ├─ Max Ramp Weight (kg):
│ └─ Aircraft Config: [Flexible input: Cabin A/B/C/etc. — 0 if N/A]
│
│ Attributes Tab:
│ ├─ 5 Group Attributes: (5 dropdown)
│ └─ Additional configs (if any)
│
│ Audit Log Tab:
│ └─ [Table] Timestamp | User | Field | Old Value | New Value | Reason
│
└──────────────────────────────────────────────────────┘
```

**Lợi ích:**
- Tổ chức logic: Định danh → Cấu hình kỹ thuật → Phân loại → Lịch sử
- Tránh quá tải 1 màn hình
- Tương ứng với yêu cầu cuộc họp

---

### 2. Bổ sung cột "Config" trong bảng danh sách (List View)

**Thay đổi:** Thêm cột hiển thị cấu hình khoang hoặc một indicator:

```
| Seq | Code | Name | Registrations | Config | Status | Actions |
|-----|------|------|----------------|--------|--------|---------|
| 1   | A320 | Tàu A320 | 30 | 3 khoang | Active | ⋯ |
| 2   | A350 | Tàu A350 | 30 | 2 khoang | Active | ⋯ |
```

**Hoặc:** Hiển thị tooltip khi hover trên Status badge.

---

### 3. Tối ưu Filter Bar

**Thay đổi:** Bổ sung filter optional:
- **Status** (hiện có) ✅
- **Ownership Status** — mới (Vietnam Airlines / Thuê khô / Thuê ướt)
- **Valid From/To Range** — mới (date picker)
- **Group Attribute** — mới (1 trong 5 dropdown)

**Hiển thị:** Mở rộng / thu gọn filter bằng "Advanced Filter" toggle.

---

### 4. Trạng thái "Chỉ đọc" cho trường SMA

**Thay đổi:** Khi chỉnh sửa tàu, các trường từ SMA (AC Registration, Valid From/To) hiển thị:
- Background nhạt (e.g., `#f1f5f9`)
- Icon lock nhỏ 🔒 hoặc tooltip "Đồng bộ từ SMA — không thể chỉnh sửa"
- Disabled `<input disabled>`

---

### 5. Luồng chỉnh sửa Ownership Status (Business Logic)

**Thay đổi:** Bổ sung điều kiện dynamic:
```
IF Ownership Status = "Vietnam Airlines"
  THEN Owner field = "Vietnam Airlines" (read-only)
ELSE IF Ownership Status in ["Thuê khô", "Thuê ướt", ...]
  THEN Owner field = (editable, free text)
```

**Giao diện:** Checkbox hoặc toggle bên cạnh Ownership dropdown.

---

### 6. Lịch sử thay đổi (Audit Log Tab)

**Cấu trúc bảng:**

| Ngày giờ | Người dùng | Trường | Giá trị cũ | Giá trị mới | Ghi chú |
|---|---|---|---|---|---|
| 2026-06-15 10:30 | Data Officer | AC Fuel Limit | 1500 | 1600 | Điều chỉnh theo MTOW |
| 2026-06-10 14:15 | Admin | Ownership Status | Vietnam Airlines | Thuê khô | Hợp đồng thuê 6 tháng |

**Tính năng:** 
- Filter theo `Trường`, `Ngày`, `Người dùng`
- Export CSV

---

### 7. Sắp xếp lại Table Columns (List View)

**Hiện tại:**
```
Seq | Code | Name | Registrations | Note | Status | Actions
```

**Đề xuất:**
```
Seq | Code | Name | Registrations | Status | Config | Last Updated | Actions
```

**Lý do:**
- `Note` có thể mô tả dài → không phù hợp bảng danh sách
- `Config` và `Last Updated` là thông tin quan trọng hơn
- Sắp xếp theo độ cần thiết: định danh → trạng thái → cấu hình → thời gian

---

## MOCKUP ĐỀ XUẤT

### Wireframe Chi tiết Panel (Tab View)

```html
<!-- Details Card with Tab Header -->
<section class="m3-card details-card">
  
  <!-- Header: Avatar + Name + Status -->
  <div class="details-header">
    <div class="details-avatar-wrap">✈️</div>
    <div class="details-title-info">
      <h3>A320-A321</h3>
      <p class="details-subtitle">Tàu bay A320 A321</p>
      <span class="status-badge active">Active</span>
    </div>
  </div>
  
  <!-- Tab Navigation -->
  <div class="tab-nav" role="tablist">
    <button role="tab" aria-selected="true" aria-controls="tab-general">
      Thông tin chung
    </button>
    <button role="tab" aria-selected="false" aria-controls="tab-config">
      Cấu hình tàu
    </button>
    <button role="tab" aria-selected="false" aria-controls="tab-attributes">
      Thuộc tính
    </button>
    <button role="tab" aria-selected="false" aria-controls="tab-audit">
      Lịch sử thay đổi
    </button>
  </div>
  
  <!-- Tab Content: General -->
  <div id="tab-general" role="tabpanel" class="tab-content active">
    <div class="details-grid">
      <div class="detail-row">
        <label>AC Registration</label>
        <input type="text" value="A320-A321" disabled />
      </div>
      <div class="detail-row">
        <label>Valid From</label>
        <input type="date" disabled />
      </div>
      <div class="detail-row">
        <label>Valid To</label>
        <input type="date" />
      </div>
      <div class="detail-row">
        <label>ICAO/IATA Code</label>
        <input type="text" />
      </div>
      <div class="detail-row">
        <label>Ownership Status</label>
        <select>
          <option>Vietnam Airlines</option>
          <option>Thuê khô</option>
          <option>Thuê ướt</option>
        </select>
      </div>
      <div class="detail-row">
        <label>Owner Name</label>
        <input type="text" />
      </div>
    </div>
  </div>
  
  <!-- Tab Content: Aircraft Config -->
  <div id="tab-config" role="tabpanel" class="tab-content">
    <div class="details-grid">
      <div class="detail-row">
        <label>Fuel Flow (kg/h)</label>
        <input type="number" />
      </div>
      <div class="detail-row">
        <label>APU Fuel Flow (kg/h)</label>
        <input type="number" />
      </div>
      <!-- ... other fields ... -->
      <div class="detail-row">
        <label>Aircraft Config (Cabin Sections)</label>
        <div class="config-grid">
          <input type="number" placeholder="Cabin A (qty)" />
          <input type="number" placeholder="Cabin B (qty)" />
          <input type="number" placeholder="Cabin C (qty)" />
        </div>
      </div>
    </div>
  </div>
  
  <!-- Tab Content: Attributes -->
  <div id="tab-attributes" role="tabpanel" class="tab-content">
    <div class="details-grid">
      <div class="detail-row">
        <label>Group Attribute 1</label>
        <select><option>Category A</option><option>Category B</option></select>
      </div>
      <!-- ... 4 more dropdowns ... -->
    </div>
  </div>
  
  <!-- Tab Content: Audit Log -->
  <div id="tab-audit" role="tabpanel" class="tab-content">
    <table class="audit-log-table">
      <thead>
        <tr>
          <th>Ngày giờ</th>
          <th>Người dùng</th>
          <th>Trường</th>
          <th>Giá trị cũ</th>
          <th>Giá trị mới</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>2026-06-15 10:30</td>
          <td>Data Officer</td>
          <td>AC Fuel Limit</td>
          <td>1500</td>
          <td>1600</td>
        </tr>
      </tbody>
    </table>
  </div>
  
</section>
```

---

## BẢNG KIỂM DANH SÁCH (Checklist)

### Giao diện (UI)

- [ ] **Tab Header:** Bổ sung 4 tab (General, Config, Attributes, Audit Log)
- [ ] **Trường dữ liệu (General Tab):** AC Registration, Valid From/To, ICAO/IATA, Ownership, Owner, Status
- [ ] **Trường dữ liệu (Config Tab):** Fuel Flow, APU Fuel, Fuel Capacity, Water Tank, Cargo Capacity, Basic Weight, Max Ramp Weight, Config khoang
- [ ] **Trường dữ liệu (Attributes Tab):** 5 Group Attributes dropdowns
- [ ] **Trường dữ liệu (Audit Tab):** Bảng lịch sử (Timestamp, User, Field, Old Value, New Value)
- [ ] **Status Read-only:** Trường từ SMA (AC Registration, Valid From) hiển thị disabled + lock icon
- [ ] **Ownership Logic:** Nếu Ownership ≠ "Vietnam Airlines" → Owner field mở khóa (editable)
- [ ] **Table Columns:** Sắp xếp lại (Code → Name → Registrations → Status → Config → Last Updated → Actions)

### Chức năng (Business Logic)

- [ ] **Sync từ SMA:** AC Registration, Valid From/To auto-populate từ external system
- [ ] **Lịch sử thay đổi:** Ghi nhận thay đổi AC Fuel Limit, Ownership Status, Config, Basic Weight
- [ ] **Filter nâng cao:** Thêm ownership, date range, group attribute filters
- [ ] **Export:** Danh sách + Chi tiết tàu (Word/Excel format)

---

## TIẾP THEO (Next Steps)

1. **Confirm:** Trình bày gợi ý cho BA Lead / Stakeholder — xác nhận phạm vi 4 Tab
2. **Refine:** Bổ sung chi tiết các trường số (units, validation rules) từ VNA.TOSS_Function_list_v1.0.xlsx
3. **Mockup:** Cập nhật `data-maintenance-mockup.html` → version v2.0 với Tab UI
4. **SRS:** Decompose yêu cầu chi tiết thành SRS section → Use cases → Acceptance criteria

---

*Báo cáo này dựa trên:*
- *MM-20190626-quy-hoach-toss.md (cuộc họp 26/06/2019)*
- *data-maintenance-mockup.html (mockup hiện tại)*
- *CLAUDE.md §0 (nguyên tắc phân hệ: decompose từ source, không đoán)*
