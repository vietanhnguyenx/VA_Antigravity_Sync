---
name: gen-ui-component
description: Tạo reusable dumb/presentational component (standalone, OnPush, props pattern) cho ESB-FE. Dùng khi tạo shared component không gắn với feature cụ thể, hoặc feature-level sub-component chỉ nhận data qua input.
argument-hint: "<ComponentName> [variant:A|B|C] [scope:feature:<feature-name>|global]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo một reusable dumb/presentational component: **$ARGUMENTS**

_(Định dạng input: `<ComponentName> [variant:A|B|C] [scope:feature:<feature-name>|global]`_
_Ví dụ: `StatusBadge variant:A scope:feature:region` hoặc `MetricCard variant:B scope:global`)_

---

## Thực hiện

1. Đọc skill file tại `.claude/skills/gen-reusable-component.md`

2. Parse input để xác định:
   - **ComponentName** (PascalCase): ví dụ `StatusBadge`
   - **component-name** (kebab-case): ví dụ `status-badge`
   - **variant**: A (đơn giản), B (builder function), C (outputs + per-item helpers). Default: A
   - **scope**: `global` → đặt tại `src/app/components/{component-name}/`; `feature:<name>` → đặt tại `src/app/features/<name>/components/{component-name}/`

3. Chọn variant phù hợp:
   - **Variant A** — Component trong feature, props đơn giản, không cần types file riêng
   - **Variant B** — Shared toàn app, cần `DEFAULTS` + external `buildComputedProps()` + types file riêng
   - **Variant C** — Render danh sách, cần `output<T>()` events + `trackByItem()` + per-item class helpers

4. Tạo files theo variant + scope:

   **Variant A (feature-level):**
   - `{component-name}.component.ts` (Props type inline, `input.required<Partial<Props>>({})`)
   - `{component-name}.component.html`
   - `{component-name}.component.scss`

   **Variant B (global):**
   - `{component-name}.types.ts` (Props type + DEFAULTS + type aliases)
   - `{component-name}.component.ts` (external `buildComputedProps()`, `mergeClasses()`)
   - `{component-name}.component.html`
   - `{component-name}.component.scss`

   **Variant C (interactive):**
   - `{component-name}.types.ts` (Item type + Props type + DEFAULTS)
   - `{component-name}.component.ts` (`output<T>()`, `trackByItem()`, per-item class methods)
   - `{component-name}.component.html`
   - `{component-name}.component.scss`

5. Đảm bảo:
   - `ChangeDetectionStrategy.OnPush`
   - Không inject Service/Facade/Router
   - `@for` phải có `track`
   - Không hard-code màu sắc hay i18n key trong template
   - `@let data = computedProps();` ở đầu template

6. Tạo files thực tế

Sau khi tạo, liệt kê files đã tạo và chỉ ra cách smart component truyền data xuống component này.

---

## Verify trước khi bàn giao

```bash
pnpm lint {target-path}/
```

Trong đó `{target-path}` là thư mục chứa component vừa tạo (`src/app/components/{component-name}/` hoặc `src/app/features/{feature-name}/components/{component-name}/`).

Nếu có lỗi → chạy `pnpm lint-fix` để auto-fix, sau đó fix thủ công phần còn lại. Chỉ báo cáo "Done" khi lint **pass**.
