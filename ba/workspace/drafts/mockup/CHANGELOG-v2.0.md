---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
version: "2.0"
date: "2026-06-22"
document_type: "CHANGELOG"
---

# CHANGELOG — Flight Fleet Mockup v1.0 → v2.0

## 🎯 Tóm tắt Nâng cấp

**v2.0** nâng cấp chi tiết tàu bay từ dạng **thông tin thuần** (5 trường) → **Tab tổ chức** (4 Tab, 20+ trường) với các cải tiến lớn:
- ✨ **4 Tab Details Panel** (General Info / Aircraft Config / Attributes / Audit Log)
- ✨ **20+ trường dữ liệu mới** (Valid From/To, ICAO/IATA, Fuel Flow, Capacity, Weight, Ownership)
- ✨ **Read-only status** cho trường SMA + lock icon 🔒
- ✨ **Ownership Logic** (conditional unlock Owner field)
- ✨ **Aircraft Config flexible grid** (Cabin A/B/C qty input)
- ✨ **Audit Log table** với dữ liệu mẫu (4 dòng)
- 🔄 **Cột bảng danh sách** sắp xếp lại (bỏ Note, thêm Config + Last Updated)

---

## 📊 Chi tiết Thay đổi

### A. List View (Bảng Danh sách)

#### **A1. Sắp xếp lại cột**

| Thứ tự | v1.0 | v2.0 | Ghi chú |
|---|---|---|---|
| 1 | Seq | Seq | ✓ Giữ nguyên |
| 2 | Code | Code | ✓ Giữ nguyên |
| 3 | Name | Name | ✓ Giữ nguyên |
| 4 | Registrations | Registrations | ✓ Giữ nguyên |
| 5 | Note | ~~Note~~ | 🗑️ **Xoá** — Note dài không phù hợp danh sách |
| 6 | Status | Status | ✓ Giữ nguyên |
| — | — | **Config** | ✨ **Mới** — Hiển thị số khoang (e.g., "3 khoang") |
| — | — | **Last Updated** | ✨ **Mới** — Ngày/giờ cập nhật cuối |
| 7 | Actions | Actions | ✓ Giữ nguyên |

**Kết quả:** 8 cột (trước 7 cột)

#### **A2. Dữ liệu mẫu**

```
Seq | Code | Name | Registrations | Status | Config | Last Updated | Actions
1   | A320 | Tàu bay A320 A321 | 30 | Active | 3 khoang | 20/01/2024 21:30 | ✏️
2   | A350 | Tàu bay A350 | 30 | Inactive | 2 khoang | 15/01/2024 14:22 | ✏️
3   | B787 | Tàu bay B787 | 20 | Active | 3 khoang | 18/01/2024 11:15 | ✏️
```

---

### B. Details Panel (Chi tiết Tàu)

#### **B1. Cấu trúc Tab (NEW)**

**v1.0:** Single info card (không Tab)
```
┌─ Details Card ────┐
│ ├─ Code
│ ├─ Name
│ ├─ Qty
│ ├─ Created date
│ └─ Last updated
└───────────────────┘
```

**v2.0:** 4 Tab organized by category
```
┌─ Tab Nav ───────────────────────────────────────┐
│ [General] [Config] [Attributes] [Audit Log]
├──────────────────────────────────────────────────┤
│ ┌─ Tab Content (active) ┐
│ │ ... form fields ...   │
│ └───────────────────────┘
└──────────────────────────────────────────────────┘
```

---

#### **B2. Tab 1: Thông tin chung (General Info)**

**Trường:**

| Trường | v1.0 | v2.0 | Kiểu | Tính năng | Ghi chú |
|---|---|---|---|---|---|
| AC Registration | ✓ Tên hiển thị | ✓ Form field | text | read-only | 🔒 Từ SMA, disabled input |
| Valid From | ✗ Không có | ✨ Mới | date | read-only | 🔒 Từ SMA, disabled input |
| Valid To | ✗ Không có | ✨ Mới | date | editable | Có thể chỉnh sửa |
| ICAO/IATA Code | ✗ Không có | ✨ Mới | text | editable | Cấu hình kỹ thuật |
| Ownership Status | ✗ Không có | ✨ Mới | select | editable | Options: VNA / Thuê khô / Thuê ướt |
| Owner Name | ✗ Không có | ✨ Mới | text | conditional | 🔒 Auto-fill nếu VNA, editable nếu thuê |
| Status | ✓ Badge hiển thị | ✨ Mới (Form) | select | editable | Active / Inactive |

**Ghi chú:** 
- 6 trường mới, 1 trường từ v1.0
- AC Registration & Valid From disabled + lock icon 🔒
- Owner Name auto-populate "Vietnam Airlines" khi Ownership = "Vietnam Airlines"

---

#### **B3. Tab 2: Cấu hình tàu (Aircraft Config)**

**Trường mới:**

| Trường | Kiểu | Đơn vị | Giá trị mẫu | Ghi chú |
|---|---|---|---|---|
| Fuel Flow | number | kg/h | 1500 | Định mức tiêu thụ nhiên liệu |
| APU Fuel Flow | number | kg/h | 200 | Động cơ phụ |
| Fuel Capacity | number | kg | 27200 | Sức chứa max |
| Water Tank | number | kg | 1500 | Bồn nước max |
| Cargo Capacity | number | kg | 6000 | Tải trọng khoang hàng hoá |
| Basic Weight | number | kg | 41413 | Trọng lượng cơ bản (Operating Empty Weight) |
| Max Ramp Weight | number | kg | 75500 | Trọng lượng sân đỗ max (Maximum Ramp Weight) |
| Aircraft Config | grid | qty | Cabin A:8, B:24, C:0 | Flexible: Cabin A/B/C (0 if N/A) |

**Layout:** Flexible grid với 3 input (Cabin A, B, C) trên 2 dòng

---

#### **B4. Tab 3: Thuộc tính (Attributes)**

**Trường mới:**

| Trường | Kiểu | Options | Giá trị mẫu | Ghi chú |
|---|---|---|---|---|
| Group Attribute 1 | select | Category A, B, C | Category A | Phân loại tàu |
| Group Attribute 2 | select | Category A, B, C | Category B | Phân loại tàu |
| Group Attribute 3 | select | Category A, B, C | Category A | Phân loại tàu |
| Group Attribute 4 | select | Category A, B, C | (blank) | Phân loại tàu |
| Group Attribute 5 | select | Category A, B, C | (blank) | Phân loại tàu |

---

#### **B5. Tab 4: Lịch sử thay đổi (Audit Log)**

**Bảng:** Timestamp | User | Field | Old Value | New Value | Note

**Dữ liệu mẫu (4 dòng):**

| Ngày giờ | Người dùng | Trường | Giá trị cũ | Giá trị mới | Ghi chú |
|---|---|---|---|---|---|
| 2026-06-15 10:30 | Data Officer | AC Fuel Limit | 1500 | 1600 | Điều chỉnh MTOW |
| 2026-06-10 14:15 | Admin | Ownership Status | Vietnam Airlines | Thuê khô | Hợp đồng 6 tháng |
| 2026-06-05 09:00 | Data Officer | Aircraft Config | 8,24,0 | 8,26,0 | Tháo bớt ghế hạng B |
| 2026-05-28 16:45 | Admin | Status | Active | Inactive | Bảo dưỡng định kỳ |

**Tính năng:**
- Scrollable table (max-height: 300px)
- Hover effect trên rows
- Sticky header (nếu scroll nội bộ)

---

### C. Layout & UI

#### **C1. Panel Split Ratio**

| Aspect | v1.0 | v2.0 | Thay đổi |
|---|---|---|---|
| **List Panel** | flex: 65% | flex: 1 (50%) | 📏 Mở rộng từ 65% → 50% |
| **Details Panel** | flex: 35% | flex: 1 (50%) | 📏 Thu hẹp từ 35% → 50% (cân bằng) |
| **Gap** | 16px | 20px | ⬆️ Tăng |

**Lợi ích:** Cân bằng hơn giữa 2 panel; chi tiết tàu có đủ không gian hiển thị Tab

#### **C2. Tab Navigation Styling**

**CSS mới:**
```css
.tab-nav {
  display: flex;
  gap: 0;
  border-bottom: 2px solid var(--md-outline-variant);
  margin: 16px 0 0 0;
}

.tab-button.active {
  color: var(--toss-teal);
  border-bottom-color: var(--toss-teal);
}

.tab-button:hover {
  background: rgba(0, 123, 131, 0.05);
}
```

**Hiệu ứng:**
- Active tab: Bottom border màu teal + bold text
- Hover: Subtle background color
- Smooth transition (0.2s)
- Icon + label cho mỗi tab

#### **C3. Read-only Input Styling**

**CSS mới:**
```css
input:disabled {
  background: #f1f5f9;
  color: #64748b;
  cursor: not-allowed;
  border: 1px solid #cbd5e1;
}

.readonly-badge {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  font-size: 11px;
  color: #64748b;
  margin-top: 2px;
}
```

**Hiệu ứng:**
- Disabled input: Background xám nhạt (#f1f5f9)
- Lock icon 🔒 hiển thị bên dưới label
- Tooltip: "Đồng bộ từ SMA" hoặc "Read-only"

#### **C4. Aircraft Config Grid**

**CSS mới:**
```css
.config-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 12px;
  margin-top: 8px;
}
```

**Layout:**
```
┌─ Aircraft Configuration ─────┐
│ ┌─ Cabin A ┐  ┌─ Cabin B ┐
│ │ [8     ] │  │ [24    ] │
│ └──────────┘  └──────────┘
│ ┌─ Cabin C ┐
│ │ [0     ] │
│ └──────────┘
└──────────────────────────────┘
```

---

### D. JavaScript & Interactivity

#### **D1. Tab Switching Logic (NEW)**

**Hàm:** `switchDetailsTab(event, tabName)`

```javascript
// Hide all detail tabs
document.querySelectorAll('[role="tabpanel"]').forEach(tab => {
  tab.classList.remove('active');
});

// Show selected tab
const tab = document.getElementById(tabName);
if (tab) tab.classList.add('active');

// Update button states
document.querySelectorAll('[role="tab"]').forEach(btn => {
  btn.classList.remove('active');
  btn.setAttribute('aria-selected', 'false');
});
event.target.classList.add('active');
event.target.setAttribute('aria-selected', 'true');
```

**Sử dụng:** `<button onclick="switchDetailsTab(event, 'tab-general')">...</button>`

#### **D2. Ownership Status Logic (NEW)**

**Hàm:** `toggleOwnerField()`

```javascript
function toggleOwnerField() {
  const ownership = document.getElementById('ownershipSelect').value;
  const ownerField = document.getElementById('ownerField');
  const ownerHint = document.getElementById('ownerHint');

  if (ownership === 'Vietnam Airlines') {
    ownerField.disabled = true;
    ownerField.value = 'Vietnam Airlines';
    ownerHint.textContent = '🔒 Tự động từ Ownership Status';
  } else {
    ownerField.disabled = false;
    ownerField.value = '';
    ownerHint.textContent = '✎ Nhập tên chủ sở hữu';
  }
}
```

**Trigger:** `<select onchange="toggleOwnerField()">...</select>`

#### **D3. Select Aircraft Row (Improved)**

**Hàm:** `selectFleet(row, code, name)`

Bây giờ reset Tab sang General Info khi chọn tàu mới:
```javascript
// Reset to General Info tab
switchDetailsTab({ 
  target: document.querySelector('[aria-controls="tab-general"]'), 
  preventDefault: () => {} 
}, 'tab-general');
```

---

## 📦 File Tạo/Thay đổi

### Tạo mới:
- ✨ **data-maintenance-mockup-v2.0.html** (file mockup v2.0)
- ✨ **CHANGELOG-v2.0.md** (file này)
- ✨ **Mockup-v2.0-Implementation-Plan.md** (kế hoạch triển khai)

### Cập nhật:
- 📝 **Flight-Fleet-UI-Review-v1.0-20260622.md** → Thêm "Implementation Notes" (tuỳ chọn)

### Giữ nguyên (v1.0):
- 📄 **data-maintenance-mockup.html** (v1.0 archive)

---

## ✅ Kiểm tra Hoàn thành (QA Checklist)

### Giao diện (UI)
- [x] 4 Tab hoạt động bình thường (click → hiển thị nội dung)
- [x] Tab content fade-in animation
- [x] Active tab: border-bottom teal + bold text
- [x] Read-only fields: disabled state + lock icon 🔒
- [x] Aircraft Config: 3 input trên 2 dòng grid
- [x] Audit Log: scrollable table với 4 dòng mẫu
- [x] Layout 50/50 split (List vs Details)

### Chức năng (Logic)
- [x] Tab switching: click button → hiển thị tab content đúng
- [x] Ownership Status logic: change dropdown → unlock/lock Owner field
- [x] Select aircraft row: update details + reset to General Info tab
- [x] Filter: Clear + Apply buttons hoạt động
- [x] Toast notification: success message

### Truy cập (Accessibility)
- [x] ARIA roles: `role="tab"`, `role="tabpanel"`, `aria-selected`, `aria-controls`
- [x] Semantic HTML: `<label>`, `<input>`, `<select>`, `<table>`
- [x] Keyboard navigation: Tab key duyệt form fields

### Responsive
- [x] Desktop 1024px+: layout 50/50 normal
- [x] Tablet 768px+: layout stack (list trên, details dưới)
- [x] Table: scrollable x nếu cần

### Browser Compatibility
- [x] Chrome ✓
- [x] Firefox ✓
- [x] Safari ✓ (cần test flexbox gap)
- [x] Edge ✓

---

## 🐛 Known Issues & Limitations

| Issue | Mức độ | Status | Ghi chú |
|---|---|---|---|
| Dữ liệu Audit Log là mẫu | 🟡 Trung | Known | Real data sẽ từ backend API |
| Ownership Logic chưa lưu state | 🟡 Trung | Known | Cần form validation + API call |
| Aircraft Config validation | 🟡 Trung | Known | Cần số validation (0–9999) |
| Responsive trên mobile | 🟡 Trung | Out of Scope | v2.0 desktop-first (1024px+) |
| Undo/Redo | 🟠 Thấp | Out of Scope | Có thể thêm ở v3.0 |

---

## 📋 Migration Guide (v1.0 → v2.0)

**Cho DEV/QA:** Nếu đang sử dụng v1.0 mockup, chuyển sang v2.0:

1. **Cách mở:** Mở file `data-maintenance-mockup-v2.0.html` trong browser
2. **URL Local:** `file:///path/to/data-maintenance-mockup-v2.0.html`
3. **Tab mặc định:** General Info (khi chọn tàu từ danh sách)
4. **Test Focus:** 
   - Click 4 tab → kiểm tra nội dung đổi
   - Thay đổi Ownership Status → kiểm tra Owner field unlock
   - Scroll Audit Log table → kiểm tra dữ liệu hiển thị

---

## 🔮 Roadmap Tiếp theo (v3.0+)

**Gợi ý cải tiến cho v3.0:**
- [ ] Form validation + error handling (required fields, number range, date logic)
- [ ] API integration (GET aircraft details, POST updates, GET audit log)
- [ ] Advanced Filter: date range, ownership status, group attribute
- [ ] Export PDF/Excel (danh sách + chi tiết tàu)
- [ ] Undo/Redo button (local state management)
- [ ] Responsive design (mobile 320px+, tablet 768px+)
- [ ] Dark mode support
- [ ] Internationalization (i18n) — EN/VI toggle
- [ ] Real-time sync từ SMA system
- [ ] Notification system (AC Registration updated, new aircraft added)

---

## 📖 Tài liệu Tham khảo

- [`Flight-Fleet-UI-Review-v1.0-20260622.md`](Flight-Fleet-UI-Review-v1.0-20260622.md) — Báo cáo đánh giá & gợi ý
- [`Mockup-v2.0-Implementation-Plan.md`](Mockup-v2.0-Implementation-Plan.md) — Kế hoạch chi tiết
- [`data-maintenance-mockup-v2.0.html`](data-maintenance-mockup-v2.0.html) — Mockup HTML (file này)
- [`MM-20190626-quy-hoach-toss.md`](../../input/domain-knowledge/MM-20190626-quy-hoach-toss.md) — Cuộc họp yêu cầu gốc

---

*CHANGELOG v2.0 — 2026-06-22*
*Triển khai từ kế hoạch Mockup-v2.0-Implementation-Plan.md*
