---
name: primeng-components
description: Catalog of PrimeNG 21 components (+ project ESB-FE wrapper components) for building mockups/prototypes that map 1:1 to the real DEV stack. Each entry: selector, purpose, key inputs, mockup-use note. Use when designing UI mockups so DEV implementation is faithful to PrimeNG + the project's Iam*/cmm-*/ubck-* wrappers. CANONICAL catalog for gen-mockup (replaces the Material catalog).
source: primeng.org/ (PrimeNG 21, Aura theme) + project rules .claude/rules/angular-guidelines.md (Iam*/cmm-*/ubck-* wrappers). Verified against angular-guidelines.md #18-#45, 2026-06-18.
version: "1.0"
date: "2026-06-18"
---

> Related: [`.claude/rules/angular-guidelines.md`](../rules/angular-guidelines.md) (DEV stack rule #18: PrimeNG 21 only). Knowledge file — no VI mirror required (per CLAUDE.md §9). Supersedes [`angular-material-components.md`](angular-material-components.md) for the gen-mockup skill.

# PrimeNG 21 — Component Catalog for Mockups (AGENTS scope)

**Purpose:** when authoring a mockup/prototype (`ba/workspace/drafts/wireframe`, `ba/workspace/drafts/mockup`), map every UI element to a **real PrimeNG component** (or the project's wrapper) below. This keeps the mockup *implementable as-is* by the `gen-*` skills and faithful to the actual DEV stack (Angular 21 + PrimeNG 21). Official docs: `https://primeng.org/<component>`.

> The DEV stack is **PrimeNG 21 only** ([angular-guidelines.md](../rules/angular-guidelines.md) #18 — "avoid other UI libraries"). Mockups MUST annotate `p-*` (or the project wrapper), **not** `mat-*`. Visual fidelity follows the PrimeNG **Aura** theme; primary seed = Viettel đỏ `#EE0033`.

---

## 1. Form Controls

| Component | Selector / import | Purpose & mockup use | Key inputs |
|---|---|---|---|
| **InputText** | `pInputText` (directive on `<input>`) | Ô nhập text 1 dòng | `[(ngModel)]`, `pSize`, `variant="outlined\|filled"` |
| **Textarea** | `pTextarea` (directive on `<textarea>`) | Nhập nhiều dòng | `[autoResize]`, `rows` |
| **InputNumber** | `<p-inputNumber>` | Nhập số (tiền tệ, %, group) — *xem rule #26* | `mode="decimal\|currency"`, `[min]/[max]`, `[useGrouping]` |
| **Select** | `<p-select>` (cũ: Dropdown) | Dropdown chọn 1 — *rule #38* | `[options]`, `optionLabel/optionValue`, `[filter]`, `[showClear]` |
| **MultiSelect** | `<p-multiSelect>` | Chọn nhiều từ dropdown | `[options]`, `display="chip"`, `[filter]` |
| **AutoComplete** | `<p-autoComplete>` | Input gợi ý khi gõ | `[suggestions]`, `(completeMethod)`, `[dropdown]` |
| **Checkbox** | `<p-checkbox>` | Boolean / chọn nhiều | `[binary]`, `[value]`, `[(ngModel)]` |
| **RadioButton** | `<p-radioButton>` | Chọn 1 trong nhiều | `name`, `[value]`, `[(ngModel)]` |
| **ToggleSwitch** | `<p-toggleswitch>` (cũ: InputSwitch) — *rule #38* | Công tắc on/off | `[(ngModel)]` (signal: `[ngModel]+ (ngModelChange)` — *rule #37*) |
| **Slider** | `<p-slider>` | Chọn giá trị trong dải | `[min]/[max]/[step]`, `[range]` |
| **DatePicker** | `<p-datepicker>` (cũ: Calendar) | Chọn ngày / dải ngày | `selectionMode="single\|range"`, `[showIcon]`, `dateFormat` |
| **Password** | `<p-password>` | Nhập mật khẩu + strength meter | `[feedback]`, `[toggleMask]` |
| **InputMask** | `<p-inputMask>` | Nhập theo mặt nạ (SĐT, mã) | `mask`, `placeholder` |
| **InputGroup** | `<p-inputgroup>` + `<p-inputgroup-addon>` | Gắn icon/nút trước-sau ô nhập | addon trái/phải |

> **Mockup note:** PrimeNG **không có** component số riêng ở vài chỗ — với field số đơn giản dùng `pInputText` + `Validators.pattern(/^\d+(\.\d+)?$/)` (rule #26), hoặc `<p-inputNumber>` khi cần format. Form trong dự án thường KHÔNG dựng field rời mà qua **`cmm-dynamic-form`** (xem §8).

## 2. Buttons

| Component | Selector | Purpose & mockup use | Key inputs |
|---|---|---|---|
| **Button** | `<p-button>` / `pButton` | Nút hành động | `label`, `icon`, `severity="primary\|secondary\|success\|danger\|warn\|info\|help\|contrast"`, `[outlined]`, `[text]`, `[rounded]`, `(onClick)` |
| **SplitButton** | `<p-splitButton>` | Nút chính + menu phụ | `[model]` (MenuItem[]) |
| **SpeedDial** | `<p-speedDial>` | Nút FAB bung nhiều hành động | `[model]`, `direction` |

> **Mockup note:** chốt quy ước severity nhất quán: primary = hành động chính (Lưu/Tìm), `secondary`/`[outlined]` = phụ (Hủy), `danger` = xóa. Khớp `IamProps.severity` (rule #43).

## 3. Data (điểm mạnh nhất của PrimeNG — hệ TOSS data-dày)

| Component | Selector | Purpose & mockup use | Key inputs |
|---|---|---|---|
| **Table** | `<p-table>` | Bảng dữ liệu mạnh: sort, filter, paginate, lazy, frozen, row-expand, selection | `[value]`, `[columns]`, `[paginator]`, `[rows]`, `[lazy]`, `[scrollable]`, `(onLazyLoad)` |
| **TreeTable** | `<p-treeTable>` | Bảng phân cấp (cây + cột) | `[value]` (TreeNode[]) |
| **Tree** | `<p-tree>` | Dữ liệu cây thuần | `[value]` (TreeNode[]), `selectionMode` |
| **Paginator** | `<p-paginator>` | Phân trang rời (khi không dùng trong Table) | `[rows]`, `[totalRecords]`, `(onPageChange)` |
| **DataView** | `<p-dataView>` | Danh sách dạng list/grid (card) | `[value]`, `layout="list\|grid"` |
| **PickList** | `<p-pickList>` | Chuyển mục giữa 2 danh sách | `[source]`, `[target]` |
| **OrderList** | `<p-orderList>` | Sắp xếp thứ tự danh sách | `[value]`, drag reorder |
| **Timeline** | `<p-timeline>` | Dòng thời gian sự kiện (lịch sử trạng thái) | `[value]`, `align` |

> **Mockup note (QUAN TRỌNG):** bảng danh sách trong dự án dùng **wrapper `IamTable`** (rule #19), KHÔNG dùng `<p-table>` trực tiếp. Khi dựng mockup bảng → annotate `data-pui="IamTable (p-table)"`. Cột trạng thái dùng `IamBadgeStatus`; cột ellipsis dùng directive `cmmParagraph`; ô tìm kiếm dùng directive `IamSearchInput` (rule #29-#31). Xem §8.

## 4. Panel & Layout

| Component | Selector | Purpose & mockup use | Key inputs |
|---|---|---|---|
| **Card** | `<p-card>` | Khối nội dung gom nhóm | `header`, `subheader`, slot `<ng-template pTemplate>` |
| **Panel** | `<p-panel>` | Khối có tiêu đề, thu gọn được | `header`, `[toggleable]` |
| **Fieldset** | `<p-fieldset>` | Nhóm field có legend | `legend`, `[toggleable]` |
| **Accordion** | `<p-accordion>` + `<p-accordion-panel>` | Khối xếp chồng mở/đóng | `[multiple]`, `value` |
| **Tabs** | `<p-tabs>` + `<p-tabpanel>` (cũ: TabView) | Chia nội dung theo tab | `value`; **dự án dùng `esb-tabs`** `(tabChange)` — *rule #44* |
| **Toolbar** | `<p-toolbar>` | Thanh công cụ (start/center/end) | slot `start`/`end`; **dự án thường dùng `ubck-header [props]`** — *rule #27* |
| **Divider** | `<p-divider>` | Đường phân cách | `layout`, `align` |
| **Splitter** | `<p-splitter>` | Chia panel kéo giãn được | `[panelSizes]` |
| **ScrollPanel** | `<p-scrollPanel>` | Vùng cuộn có scrollbar tùy chỉnh | `[style]` |
| **Stepper** | `<p-stepper>` + `<p-step>` | Quy trình nhiều bước (wizard) | `value`, `[linear]` |

## 5. Overlay & Popup

| Component | API / selector | Purpose & mockup use | Key inputs |
|---|---|---|---|
| **Dialog** | `<p-dialog>` | Hộp thoại modal | `[(visible)]`, `[modal]`, `header`, `[draggable]` |
| **Dynamic Dialog** | `DialogService.open()` / **`DialogRegistry`** | Dialog mở bằng code (form tạo/sửa) — *rule #23, #35, #41* | `open(Component, {data, header, templates})` |
| **ConfirmDialog** | `<p-confirmDialog>` + `ConfirmationService` | Xác nhận (yes/no) | `confirm({message, accept})` |
| **Drawer** | `<p-drawer>` (cũ: Sidebar) | Ngăn trượt từ cạnh | `[(visible)]`, `position` |
| **Popover** | `<p-popover>` (cũ: OverlayPanel) | Panel nổi gắn theo trigger | `show($event)` |
| **Tooltip** | `pTooltip` (directive) | Chú thích khi hover | `pTooltip`, `tooltipPosition` |

> **Mockup note:** popup form tạo/sửa trong dự án mở qua **`DialogRegistry` / `DialogService.openDialogWithRef`** (rule #45), header dùng **`IamDialogHeader`** (luôn truyền `data:{}` — rule #35). Xác nhận xóa → **`DialogDeleteComponent`** (rule #45), KHÔNG tự dựng confirm thủ công.

## 6. Menu & Navigation

| Component | Selector | Purpose & mockup use | Key inputs |
|---|---|---|---|
| **Menubar** | `<p-menubar>` | Thanh menu ngang (app bar) | `[model]` (MenuItem[]) |
| **Menu** | `<p-menu>` | Menu dọc / popup thao tác | `[model]`, `[popup]` |
| **TieredMenu** | `<p-tieredMenu>` | Menu nhiều cấp | `[model]` |
| **ContextMenu** | `<p-contextMenu>` | Menu chuột phải | `[model]`, `[target]` |
| **PanelMenu** | `<p-panelMenu>` | Menu accordion (sidebar điều hướng) | `[model]` |
| **Breadcrumb** | `<p-breadcrumb>` | Đường dẫn phân cấp | `[model]`, `[home]` |
| **Steps** | `<p-steps>` | Chỉ dẫn bước (read-only) | `[model]`, `[activeIndex]` |

> **Mockup note:** sidebar điều hướng app → `<p-panelMenu>` (đa cấp) hoặc `<p-menu>`; thao tác trên dòng bảng → `<p-menu [popup]>` mở từ nút `<p-button [text] icon="pi pi-ellipsis-v">`.

## 7. Messages, Media & Misc

| Component | Selector | Purpose & mockup use | Key inputs |
|---|---|---|---|
| **Toast** | `<p-toast>` + `MessageService` | Thông báo tạm thời (toast) | `add({severity, summary})` |
| **Message** | `<p-message>` | Thông báo inline (trong form) | `severity`, `text` |
| **Tag** | `<p-tag>` | Nhãn trạng thái | `value`, `severity`, `[rounded]` |
| **Chip** | `<p-chip>` | Thẻ (label + remove) | `label`, `[removable]`, `image` |
| **Badge** | `<p-badge>` / `pBadge` | Huy hiệu số/chấm | `value`, `severity` |
| **Avatar** | `<p-avatar>` | Ảnh/chữ đại diện | `label`/`image`, `shape` |
| **ProgressBar** | `<p-progressBar>` | Thanh tiến trình | `[value]`, `mode` |
| **ProgressSpinner** | `<p-progressSpinner>` (*rule #38*) | Vòng xoay tải | `strokeWidth` |
| **Skeleton** | `<p-skeleton>` | Khung chờ tải (placeholder) | `width`, `height`, `shape` |
| **Image** | `<p-image>` | Ảnh + preview/zoom | `[preview]` |
| **Carousel** | `<p-carousel>` | Băng chuyền nội dung | `[value]`, `[numVisible]` |

> **Mockup note:** nhãn trạng thái nghiệp vụ → ưu tiên **`IamBadgeStatus`** (rule #29) thay cho `<p-tag>` trần; `severity` lấy theo `IamProps` (rule #43: `success\|secondary\|danger\|warn`).

---

## UI need → PrimeNG component (tra nhanh cho người dựng mockup)

| Cần gì | Dùng component |
|---|---|
| Nhập text/số | `pInputText` / `<p-inputNumber>` |
| Chọn từ danh sách | `<p-select>` (1) · `<p-multiSelect>` (nhiều) · `<p-autoComplete>` (có search) |
| Bật/tắt 1 thiết lập | `<p-toggleswitch>` |
| Chọn nhiều mục | `<p-checkbox>` / `<p-multiSelect>` |
| Chọn 1 trong vài | `<p-radioButton>` |
| Chọn ngày | `<p-datepicker>` (range = `selectionMode="range"`) |
| **Bảng dữ liệu có sort/trang** | **`IamTable` (p-table)** + `IamBadgeStatus` + `IamSearchInput` |
| Form tạo/sửa | **`cmm-dynamic-form` `[config]`** trong dialog mở bằng `DialogRegistry` |
| Form nhiều bước | `<p-stepper>` |
| Nhóm nội dung gọn | `<p-card>` / `<p-panel>` / `esb-tabs` |
| Hành động trên dòng/bảng | `<p-button [text] icon>` + `<p-menu [popup]>` |
| Xác nhận xóa | **`DialogDeleteComponent`** (openDialogWithRef) |
| Form/chi tiết popup | `DialogService` / `DialogRegistry` + `IamDialogHeader` |
| Thông báo tạm thời | `<p-toast>` (MessageService) |
| Điều hướng app | `ubck-header [props]` + `<p-panelMenu>` |
| Bộ lọc danh sách | `ubck-filter (eventSearch)` |
| Trạng thái tải | `<p-progressBar>` / `<p-progressSpinner>` / `<p-skeleton>` |
| Nhãn trạng thái | `IamBadgeStatus` (hoặc `<p-tag>`) · số → `<p-badge>` |

---

## 8. Wrapper nội bộ ESB-FE (BẮT BUỘC ưu tiên — khớp code DEV)

Dự án bọc sẵn PrimeNG bằng các component nội bộ. Mockup PHẢI map về wrapper khi có, để bàn giao DEV khớp `gen-*`. Nguồn: [angular-guidelines.md](../rules/angular-guidelines.md).

| Vùng mockup | Wrapper dự án | Trên nền PrimeNG | Rule |
|---|---|---|---|
| Bảng danh sách | `IamTable` (import `@components/iam-table/iam-table.component`) | `p-table` | #19 |
| Nhãn trạng thái trong bảng | `IamBadgeStatus` `[props]="{value, list}"` | `p-tag` | #29, #43 |
| Ô tìm kiếm (template cột) | directive `IamSearchInput` `[search-input]` | `p-inputText` | #31 |
| Ô text dài (ellipsis) | directive `cmmParagraph` (CmmTypepographyModule) | — | #30 |
| Form tạo/sửa | `cmm-dynamic-form [config]` `#df` | tổ hợp p-* | #32, #42 |
| Tabs | `esb-tabs (tabChange)` | `p-tabs` | #44 |
| Header trang | `ubck-header [props]` | `p-toolbar` | #27 |
| Bộ lọc | `ubck-filter (eventSearch)` | tổ hợp p-* | #27 |
| Dialog (mở bằng code) | `DialogRegistry` / `DialogService.openDialogWithRef` | `DynamicDialog` | #23, #41, #45 |
| Header dialog | `IamDialogHeader` (luôn truyền `data:{}`) | — | #35 |
| Xác nhận xóa | `DialogDeleteComponent` (`@ubck-core/ui`) | `p-dialog` | #45 |

> **Quy ước mockup:** annotate `data-pui="IamTable (p-table)"` — wrapper trước, PrimeNG gốc trong ngoặc. Element không có trong catalog/ wrapper → ghi `(custom / cần bổ sung)` + flag (§0), KHÔNG bịa.

---

## Quy ước nhất quán cho mockup (visual fidelity — PrimeNG Aura)

- **Theme:** PrimeNG **Aura** preset; primary = Viettel đỏ `#EE0033` (đưa vào `--p-primary-*` design tokens). Light/dark ghi vào design-system.
- **Severity:** dùng đúng tập PrimeNG (`primary/secondary/success/info/warn/danger/help/contrast`) — khớp `IamProps.severity` (rule #43).
- **Icon:** **PrimeIcons** (`pi pi-*`) nhất quán; không trộn Material Symbols.
- **Spacing/grid:** PrimeFlex hoặc Tailwind (rule #33) — 1 hệ thống grid duy nhất.
- **Density:** chốt 1 mức cho bảng dày đặc (kích thước `pSize="small"`).

> **Nguyên tắc (§0):** mockup chỉ map element sang component **có thật** trong catalog/ wrapper này; thiết kế nguồn cần thứ PrimeNG không có sẵn → ghi `(cần bổ sung / custom)` + flag cho con người, không tự bịa.

---
*PrimeNG 21 (Aura). API chi tiết từng component: mở `https://primeng.org/<tên>`. Wrapper nội bộ: xem `.claude/rules/angular-guidelines.md` (#18-#45). Catalog này là CANONICAL cho skill gen-mockup — thay cho angular-material-components.md.*
