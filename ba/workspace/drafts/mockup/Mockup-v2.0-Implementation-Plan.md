---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "Claude Code"
version: "1.0"
date: "2026-06-22"
status: "Plan (Awaiting Confirmation)"
document_type: "Implementation Plan"
---

# KỀ HOẠCH TRIỂN KHAI MOCKUP v2.0 — Flight Fleet Details Panel with Tabs

## 📋 Mục tiêu

Nâng cấp `data-maintenance-mockup.html` → **v2.0** với các cải tiến:
- ✅ Chia chi tiết tàu bay thành **4 Tab** (General Info / Aircraft Config / Attributes / Audit Log)
- ✅ Bổ sung **trường dữ liệu mới** (Valid From/To, ICAO/IATA, Fuel Flow, Capacity, Weight, Ownership)
- ✅ Cấu hình khoang tàu **linh hoạt** (0–N cabin sections)
- ✅ Lịch sử thay đổi (Audit Log) với bảng dữ liệu mẫu
- ✅ Trạng thái "chỉ đọc" cho trường SMA + lock icon
- ✅ Business logic: Ownership Status → Owner field (conditional unlock)
- ✅ Sắp xếp lại cột bảng danh sách

---

## 🎯 Phạm vi Triển khai (Scope)

### A. Thay đổi List View (Bảng danh sách)

| Mục | Chi tiết | Độ ưu tiên |
|---|---|---|
| **Cột mới: Config** | Hiển thị số lượng khoang (e.g., "3 khoang") | 🟡 Trung |
| **Cột mới: Last Updated** | Ngày/giờ cập nhật cuối (e.g., "20/01/2024 21:30") | 🟡 Trung |
| **Bỏ cột Note** | Note dài không phù hợp danh sách | 🟡 Trung |
| **Thứ tự cột mới** | Seq \| Code \| Name \| Registrations \| Status \| Config \| Last Updated \| Actions | 🟢 Cao |

**Kết quả:**
```
Seq | Code | Name | Registrations | Status | Config | Last Updated | Actions
1   | A320 | Tàu A320 A321 | 30 | Active | 3 khoang | 20/01/2024 21:30 | ✏️ 🗑️
```

---

### B. Thay đổi Details Panel (Chi tiết tàu)

#### **B1. Tab Navigation (Tab Header)**

**Vị trí:** Dưới phần avatar + title (sau details-header)

**Cấu trúc:**
```html
<div class="tab-nav" role="tablist">
  <button role="tab" aria-selected="true" aria-controls="tab-general" class="tab-button active">
    📋 Thông tin chung
  </button>
  <button role="tab" aria-selected="false" aria-controls="tab-config" class="tab-button">
    ⚙️ Cấu hình tàu
  </button>
  <button role="tab" aria-selected="false" aria-controls="tab-attributes" class="tab-button">
    🏷️ Thuộc tính
  </button>
  <button role="tab" aria-selected="false" aria-controls="tab-audit" class="tab-button">
    📊 Lịch sử thay đổi
  </button>
</div>
```

**Styling:**
- Border-bottom indicator (active tab)
- Smooth transition on hover
- Icon + label

---

#### **B2. Tab 1: General Info (Thông tin chung)**

**Trường:**
| Trường | Kiểu | Tính năng | Ghi chú |
|---|---|---|---|
| AC Registration | text | read-only | Từ SMA, lock icon 🔒 |
| Valid From | date | read-only | Từ SMA, disabled input |
| Valid To | date | editable | Có thể chỉnh sửa |
| ICAO/IATA Code | text | editable | Cấu hình kỹ thuật |
| Ownership Status | select | editable | Options: Vietnam Airlines / Thuê khô / Thuê ướt |
| Owner Name | text | conditional | Disabled nếu = "Vietnam Airlines", editable ngược lại |
| Status | select | editable | Active / Inactive |

**Layout:**
```
┌─ Tab 1: Thông tin chung ────────────────────┐
│ ┌─ AC Registration ┐          ┌─ Valid From ┐
│ │ A320-A321 🔒     │          │ 01/01/2024  │
│ └──────────────────┘          └─────────────┘
│ ┌─ Valid To ┐                 ┌─ ICAO Code ┐
│ │ 31/12/2024│                 │ A320       │
│ └───────────┘                 └────────────┘
│ ┌─ Ownership Status ┐ ┌─ Owner Name ┐
│ │ Vietnam Airlines ▼│ │ (auto-fill) │
│ └────────────────────┘ └─────────────┘
│ ┌─ Status ┐
│ │ Active ▼│
│ └─────────┘
└─────────────────────────────────────────────┘
```

---

#### **B3. Tab 2: Aircraft Config (Cấu hình tàu)**

**Trường:**
| Trường | Kiểu | Đơn vị | Ghi chú |
|---|---|---|---|
| Fuel Flow | number | kg/h | Định mức tiêu thụ nhiên liệu |
| APU Fuel Flow | number | kg/h | Động cơ phụ |
| Fuel Capacity | number | kg | Sức chứa max |
| Water Tank | number | kg | Bồn nước max |
| Cargo Capacity | number | kg | Tải trọng khoang |
| Basic Weight | number | kg | Trọng lượng cơ bản |
| Max Ramp Weight | number | kg | Trọng lượng sân đỗ max |
| Aircraft Config | grid | qty | Flexible: Cabin A/B/C (0 if N/A) |

**Layout:**
```
┌─ Tab 2: Cấu hình tàu ────────────────────────┐
│ ┌─ Fuel Flow ┐              ┌─ APU Fuel Flow ┐
│ │ 1500 kg/h  │              │ 200 kg/h       │
│ └────────────┘              └────────────────┘
│ ┌─ Fuel Capacity ┐          ┌─ Water Tank ┐
│ │ 27200 kg       │          │ 1500 kg     │
│ └────────────────┘          └─────────────┘
│ ┌─ Cargo Capacity ┐         ┌─ Basic Weight ┐
│ │ 6000 kg        │          │ 41413 kg      │
│ └─────────────────┘          └───────────────┘
│ ┌─ Max Ramp Weight ┐
│ │ 75500 kg        │
│ └──────────────────┘
│ ┌─ Aircraft Config ──────────────────────────┐
│ │  Cabin A: [ 8  ]  Cabin B: [ 24 ]         │
│ │  Cabin C: [ 0  ]                          │
│ └────────────────────────────────────────────┘
└──────────────────────────────────────────────┘
```

---

#### **B4. Tab 3: Attributes (Thuộc tính)**

**Trường:**
| Trường | Kiểu | Ghi chú |
|---|---|---|
| Group Attribute 1 | select | Dropdown (Category A, B, C...) |
| Group Attribute 2 | select | Dropdown |
| Group Attribute 3 | select | Dropdown |
| Group Attribute 4 | select | Dropdown |
| Group Attribute 5 | select | Dropdown |

**Layout:**
```
┌─ Tab 3: Thuộc tính ─────────────────────────┐
│ ┌─ Group Attribute 1 ┐
│ │ Category A        ▼│
│ └─────────────────────┘
│ ┌─ Group Attribute 2 ┐
│ │ Category B        ▼│
│ └─────────────────────┘
│ ┌─ Group Attribute 3 ┐
│ │ Category A        ▼│
│ └─────────────────────┘
│ ┌─ Group Attribute 4 ┐
│ │ (Chưa chọn)       ▼│
│ └─────────────────────┘
│ ┌─ Group Attribute 5 ┐
│ │ (Chưa chọn)       ▼│
│ └─────────────────────┘
└─────────────────────────────────────────────┘
```

---

#### **B5. Tab 4: Audit Log (Lịch sử thay đổi)**

**Bảng:**
| Ngày giờ | Người dùng | Trường | Giá trị cũ | Giá trị mới | Ghi chú |
|---|---|---|---|---|---|
| 2026-06-15 10:30 | Data Officer | AC Fuel Limit | 1500 | 1600 | Điều chỉnh theo MTOW |
| 2026-06-10 14:15 | Admin | Ownership Status | Vietnam Airlines | Thuê khô | Hợp đồng 6 tháng |
| 2026-06-05 09:00 | Data Officer | Aircraft Config | "8,24,0" | "8,26,0" | Tháo bớt ghế hạng B |
| 2026-05-28 16:45 | Admin | Status | Active | Inactive | Bảo dưỡng định kỳ |

**Layout:**
```
┌─ Tab 4: Lịch sử thay đổi ────────────────────────────────────────────┐
│ ┌────────────────┬──────────────┬──────────┬────────┬────────┬────────┐
│ │ Ngày giờ       │ Người dùng   │ Trường   │ Cũ     │ Mới    │ Ghi chú│
│ ├────────────────┼──────────────┼──────────┼────────┼────────┼────────┤
│ │ 2026-06-15     │ Data Officer │ AC Fuel  │ 1500   │ 1600   │ Điều   │
│ │ 10:30          │              │ Limit    │        │        │ chỉnh  │
│ ├────────────────┼──────────────┼──────────┼────────┼────────┼────────┤
│ │ 2026-06-10     │ Admin        │ Ownership│ VNA    │ Thuê   │ Hợp    │
│ │ 14:15          │              │ Status   │        │ khô    │ đồng   │
│ └────────────────┴──────────────┴──────────┴────────┴────────┴────────┘
└──────────────────────────────────────────────────────────────────────┘
```

---

## 🏗️ Kiến trúc HTML/CSS Mới

### Cấu trúc file:
```
data-maintenance-mockup.html (v2.0)
├── Sidebar (giữ nguyên)
├── Main Content
│   ├── Filter Bar (giữ nguyên)
│   └── Admin Panel Split
│       ├── List Section (bảng danh sách — thay đổi cột)
│       └── Details Section
│           ├── Details Header (avatar + name + status)
│           ├── Tab Navigation (4 tab)
│           └── Tab Content Area
│               ├── Tab 1: General Info
│               ├── Tab 2: Aircraft Config
│               ├── Tab 3: Attributes
│               └── Tab 4: Audit Log
```

### CSS Mới (chính):

**1. Tab Navigation**
```css
.tab-nav {
  display: flex;
  gap: 4px;
  border-bottom: 1px solid #e2e8f0;
  margin: 16px 0;
}

.tab-button {
  padding: 12px 16px;
  background: transparent;
  border: none;
  border-bottom: 3px solid transparent;
  cursor: pointer;
  font-size: 13px;
  font-weight: 500;
  color: #64748b;
  transition: all 0.2s;
}

.tab-button.active {
  color: #007b83;
  border-bottom-color: #007b83;
}

.tab-button:hover {
  color: #1e293b;
}
```

**2. Tab Content**
```css
.tab-content {
  display: none;
}

.tab-content.active {
  display: block;
  animation: fadeIn 0.2s ease-in;
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
```

**3. Read-only Input (Trường SMA)**
```css
input:disabled {
  background: #f1f5f9;
  color: #64748b;
  cursor: not-allowed;
  border: 1px solid #cbd5e1;
}

input:disabled::after {
  content: " 🔒";
}

.readonly-wrapper {
  position: relative;
}

.readonly-icon {
  position: absolute;
  right: 8px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 12px;
}
```

**4. Aircraft Config Grid**
```css
.config-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 12px;
}

.config-grid input {
  width: 100%;
}
```

**5. Audit Log Table**
```css
.audit-log-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 12px;
  max-height: 300px;
  overflow-y: auto;
}

.audit-log-table th {
  background: #f1f5f9;
  padding: 8px 12px;
  text-align: left;
  font-weight: 600;
  color: #64748b;
  border-bottom: 1px solid #e2e8f0;
}

.audit-log-table td {
  padding: 8px 12px;
  border-bottom: 1px solid #e2e8f0;
}

.audit-log-table tbody tr:hover {
  background: #f8fafc;
}
```

---

## 📊 JavaScript Functionality

### Tab Switching Logic
```javascript
// Tab switching
document.querySelectorAll('[role="tab"]').forEach(tab => {
  tab.addEventListener('click', () => {
    // Hide all tabs
    document.querySelectorAll('[role="tabpanel"]').forEach(panel => {
      panel.classList.remove('active');
    });
    
    // Show selected tab
    const tabId = tab.getAttribute('aria-controls');
    const panel = document.getElementById(tabId);
    if (panel) panel.classList.add('active');
    
    // Update active button
    document.querySelectorAll('[role="tab"]').forEach(t => {
      t.classList.remove('active');
      t.setAttribute('aria-selected', 'false');
    });
    tab.classList.add('active');
    tab.setAttribute('aria-selected', 'true');
  });
});
```

### Ownership Status Logic
```javascript
// Conditional unlock Owner field
const ownershipSelect = document.querySelector('[name="ownership-status"]');
const ownerInput = document.querySelector('[name="owner-name"]');

ownershipSelect.addEventListener('change', (e) => {
  if (e.target.value === 'Vietnam Airlines') {
    ownerInput.disabled = true;
    ownerInput.value = 'Vietnam Airlines';
  } else {
    ownerInput.disabled = false;
    ownerInput.value = '';
  }
});
```

### Table Row Click (Select Aircraft)
```javascript
// Row selection
document.querySelectorAll('.user-table tbody tr').forEach(row => {
  row.addEventListener('click', () => {
    document.querySelectorAll('.user-table tbody tr').forEach(r => {
      r.classList.remove('active-row');
    });
    row.classList.add('active-row');
    
    // Update details panel
    const code = row.querySelector('td:nth-child(2)').textContent;
    const name = row.querySelector('td:nth-child(3)').textContent;
    updateDetailsPanel(code, name);
  });
});
```

---

## 📋 Danh sách Triển khai (Implementation Checklist)

### Phase 1: HTML Structure (Tuần 1)
- [ ] Cập nhật bảng danh sách: bỏ `Note`, thêm `Config` + `Last Updated`
- [ ] Thêm Tab Navigation HTML (4 tab buttons)
- [ ] Tạo Tab Content containers (4 tab panels)
- [ ] Bổ sung form fields cho Tab 1–3
- [ ] Tạo Audit Log table HTML (Tab 4)

### Phase 2: CSS Styling (Tuần 1)
- [ ] CSS cho Tab Navigation (active state, hover, border-bottom)
- [ ] CSS cho Tab Content (fade-in animation)
- [ ] CSS cho read-only inputs (disabled state + lock icon)
- [ ] CSS cho Aircraft Config grid
- [ ] CSS cho Audit Log table (scrollable, hover)

### Phase 3: JavaScript Interactivity (Tuần 1)
- [ ] Tab switching logic
- [ ] Ownership Status → Owner Name conditional unlock
- [ ] Table row click → Update details panel
- [ ] Form state persistence (optional)

### Phase 4: Testing & QA (Tuần 2)
- [ ] Browser compatibility (Chrome, Firefox, Safari, Edge)
- [ ] Responsive design (1024px+)
- [ ] Accessibility (ARIA roles, keyboard navigation)
- [ ] Form validation & error handling

### Phase 5: Documentation (Tuần 2)
- [ ] Update comments in HTML (data-tab, data-field notes)
- [ ] Create component reference guide (optional)
- [ ] Prepare for developer handover

---

## 🔄 So sánh: v1.0 → v2.0

| Khía cạnh | v1.0 (Hiện tại) | v2.0 (Đề xuất) | Thay đổi |
|---|---|---|---|
| **Details Panel** | Dạng thông tin thuần (5 trường) | 4 Tab tổ chức | ⬆️ |
| **Trường dữ liệu** | Cơ bản (Code, Name, Qty, Reg, Date) | 20+ trường chi tiết | ⬆️ |
| **Aircraft Config** | Không có | Flexible grid (Cabin A/B/C) | ✨ Mới |
| **Audit Log** | Không có | Bảng lịch sử + filter | ✨ Mới |
| **Read-only Status** | Không phân biệt | Disabled + lock icon | ✨ Mới |
| **Ownership Logic** | Không có | Conditional unlock | ✨ Mới |
| **List Columns** | 7 cột (với Note) | 8 cột (thay Note bằng Config + Last Updated) | ↔️ |
| **Layout** | 65/35 split | 50/50 split | ✨ Cải tiến |

---

## ⚠️ Rủi ro & Lưu ý

| Rủi ro | Mức độ | Giải pháp |
|---|---|---|
| **Dữ liệu mẫu không sát thực tế** | 🟡 Trung | Sử dụng dữ liệu từ Excel / YCKT |
| **Tab content quá dài → Scroll nội bộ** | 🟡 Trung | Giới hạn height, cho phép scroll nội bộ |
| **JavaScript event binding phức tạp** | 🟡 Trung | Sử dụng event delegation, tránh memory leaks |
| **Mobile responsiveness chưa xét** | 🟡 Trung | Giữ nguyên desktop-first (CLAUDE.md không yêu cầu mobile) |
| **Accessibility chưa đầy đủ** | 🟡 Trung | Thêm ARIA roles, test với screen reader |

---

## 📦 Đầu ra (Deliverables)

### File mới:
1. **data-maintenance-mockup-v2.0.html** — Mockup cập nhật với Tab UI
2. **CHANGELOG-v2.0.md** — Ghi chú thay đổi chi tiết
3. **Flight-Fleet-UI-Components.md** — Component reference guide (optional)

### File bổ sung:
- Cập nhật báo cáo Flight-Fleet-UI-Review → thêm "Implementation Notes"

---

## 🎯 Điều kiện Hoàn thành (Done Criteria)

- ✅ Tất cả 4 Tab hoạt động bình thường (click tab → hiển thị nội dung)
- ✅ Read-only fields hiển thị chính xác (disabled state + lock icon)
- ✅ Ownership Status logic hoạt động (change ownership → unlock/lock Owner field)
- ✅ Table column order đúng: Seq \| Code \| Name \| Registrations \| Status \| Config \| Last Updated \| Actions
- ✅ Responsive trên desktop 1024px+
- ✅ Không có console errors / warnings
- ✅ ARIA roles & semantic HTML hoàn chỉnh
- ✅ Tested trên Chrome, Firefox, Safari

---

## ✅ Xác nhận Kế hoạch

**Câu hỏi cần BA Lead xác nhận:**

1. ✓ Phạm vi 4 Tab (General / Config / Attributes / Audit Log) — **Đồng ý?**
2. ✓ Bỏ cột "Note" và thay bằng "Config" + "Last Updated" — **Đồng ý?**
3. ✓ Sắp xếp cột mới (Seq | Code | Name | Registrations | Status | Config | Last Updated | Actions) — **Đồng ý?**
4. ✓ Layout 50/50 split (List panel = Details panel) — **Đồng ý?**
5. ✓ Aircraft Config: Flexible grid (Cabin A/B/C input qty) — **Đồng ý?**
6. ✓ Read-only fields: Disabled + lock icon 🔒 — **Đồng ý?**
7. ✓ Audit Log: Bảng với 6 cột (Timestamp | User | Field | Old | New | Note) — **Đồng ý?**

---

*Kế hoạch này chờ xác nhận từ BA Lead trước khi bắt đầu triển khai.*
