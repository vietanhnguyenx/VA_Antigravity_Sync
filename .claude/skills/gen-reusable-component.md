---
name: skill-gen-reusable-component
description: Reference implementation templates cho reusable dumb component generation (3 variants: A simple, B builder function + defaults, C interactive + outputs). Đọc khi lệnh gen-ui-component cần code templates chi tiết.
---

# Skill: Gen Reusable Component (Dumb / Presentational)

Tạo component tái sử dụng theo pattern **Smart/Dumb Component**: nhận data qua `input()`, emit events qua `output()`, không inject service, không gọi API.

**References:**
- `src/app/components/summary-metric-card/` — Variant B (builder function)
- `src/app/components/summary-inline/` — Variant C (per-item helpers + outputs)
- `src/app/components/filter-list/` — Variant C (outputs)
- `src/app/features/external-integration/components/external-integration-summary/` — Variant A (simple)

---

## Khi nào dùng Dumb Component

| Dumb Component | Smart Component |
|---|---|
| Chỉ hiển thị data được truyền vào | Inject facade/service để lấy data |
| Không biết nguồn gốc data | Biết business logic |
| Tái sử dụng ở nhiều nơi | Thường gắn với 1 feature cụ thể |
| Test dễ — chỉ cần mock props | Test phức tạp hơn |

**Quy tắc:**
- Smart component (có facade) → gọi computed/signal → truyền xuống dumb component qua `[props]`
- Dumb component → nhận `props`, tính `computedProps`, render

**Đặt file:**
- Dùng toàn app → `src/app/components/{component}/`
- Chỉ dùng trong 1 feature → `src/app/features/{feature}/components/{component}/`

---

## Cấu trúc files

### Variant A — Đơn giản (feature-level)

Props type định nghĩa thẳng trong `.component.ts`:

```
{feature}/components/{component}/
├── {component}.component.ts
├── {component}.component.html
└── {component}.component.scss
```

### Variant B & C — Đầy đủ (shared toàn app)

Tách riêng types, defaults, helper functions:

```
src/app/components/{component}/
├── {component}.component.ts
├── {component}.component.html
├── {component}.component.scss
└── {component}.types.ts
```

---

## Variant A — Simple (Feature-level)

Dùng khi component chỉ dùng trong 1 feature, không cần nhiều customization.

**Pattern từ:** `external-integration-summary.component.ts`

### `{component}.component.ts`

```typescript
import { ChangeDetectionStrategy, Component, computed, input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslatePipe } from '@ngx-translate/core';

// Props type định nghĩa thẳng trong file này
export type {Component}Props = {
  items: {Item}[];
  title?: string;
  emptyLabel?: string;
};

@Component({
  selector:        'iam-{component}',
  standalone:      true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports:         [CommonModule, TranslatePipe],
  templateUrl:     './{component}.component.html',
  styleUrl:        './{component}.component.scss',
})
export class {Component}Component {
  // Dùng Partial<Props> với default {} khi tất cả fields đều optional
  readonly props = input.required<Partial<{Component}Props>>({});

  readonly computedProps = computed<{Component}Props>(() => {
    const p = this.props();
    return {
      items:      p.items      ?? [],
      title:      p.title      ?? '{COMPONENT}.TITLE',
      emptyLabel: p.emptyLabel ?? 'COMMON.EMPTY',
    };
  });
}
```

### `{component}.component.html`

```html
@let data = computedProps();

<div class="component-wrapper">
  @if (data.title) {
    <h3>{{ data.title | translate }}</h3>
  }

  @if (data.items.length === 0) {
    <p>{{ data.emptyLabel | translate }}</p>
  } @else {
    @for (item of data.items; track item.id) {
      <!-- render item -->
    }
  }
</div>
```

---

## Variant B — With Builder Function (Global Shared)

Dùng khi component cần merge nhiều CSS classes, có defaults phức tạp, hoặc cần tính toán nhiều derived values.

**Pattern từ:** `summary-metric-card.component.ts`

### `{component}.types.ts`

```typescript
// Types, defaults, và pure helper functions — tách riêng để dễ test

export type {Component}Props = {
  // Required
  title: string;

  // Optional với defaults
  value?:          string | number;
  unit?:           string;
  styleClass?:     string;        // Custom CSS classes cho article
  contentClass?:   string;        // Custom CSS classes cho content wrapper
  titleColor?:     string;        // Inline color override
  valueColor?:     string;
};

// Design tokens — single source of truth cho default styling
export const {COMPONENT}_DEFAULTS = {
  articleClass:  'rounded-[16px] border px-4 py-4 shadow-sm',
  contentClass:  'flex flex-col gap-2',
  titleClass:    'text-[14px] font-medium text-gray-500',
  valueClass:    'text-[32px] font-semibold',
  titleColor:    '#5E5E5E',
  valueColor:    '#0F1110',
} as const;
```

### `{component}.component.ts`

```typescript
import { ChangeDetectionStrategy, Component, computed, input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslatePipe } from '@ngx-translate/core';
import { {Component}Props, {COMPONENT}_DEFAULTS } from './{component}.types';

// Helper thuần — đặt ngoài class để dễ test độc lập
function mergeClasses(defaultClass: string, customClass?: string): string {
  return [defaultClass, customClass].filter(Boolean).join(' ');
}

function buildComputedProps(props: {Component}Props) {
  const D = {COMPONENT}_DEFAULTS;

  return {
    ...D,
    ...props,
    // Merge CSS classes: default + custom override
    articleClass: mergeClasses(D.articleClass, props.styleClass),
    contentClass: mergeClasses(D.contentClass, props.contentClass),
    // Derived values
    hasValue: props.value !== undefined && props.value !== null,
  };
}

@Component({
  selector:        'iam-{component}',
  standalone:      true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports:         [CommonModule, TranslatePipe],
  template: `
    @let data = computedProps();

    <article
      [class]="data.articleClass"
      [style.color]="data.titleColor"
    >
      <p [class]="data.titleClass">{{ data.title | translate }}</p>

      @if (data.hasValue) {
        <strong [class]="data.valueClass" [style.color]="data.valueColor">
          {{ data.value }}
          @if (data.unit) {
            <span>{{ data.unit | translate }}</span>
          }
        </strong>
      }
    </article>
  `,
  styleUrl: './{component}.component.scss',
})
export class {Component}Component {
  readonly props = input.required<{Component}Props>();

  // Tất cả tính toán trong 1 computed — template chỉ bind data
  readonly computedProps = computed(() => buildComputedProps(this.props()));
}
```

---

## Variant C — With Outputs & Per-Item Helpers (Interactive)

Dùng khi component render danh sách items và cần emit events (click, select, search).

**Pattern từ:** `summary-inline.component.ts`, `filter-list.component.ts`

### `{component}.types.ts`

```typescript
// Item type — 1 phần tử trong danh sách
export type {Component}Item = {
  id:          string | number;
  label:       string;
  value:       string | number;
  color?:      'success' | 'warning' | 'error' | 'neutral';
  disabled?:   boolean;
  // Per-item class overrides
  itemClass?:  string;
  labelClass?: string;
  valueClass?: string;
};

// Props type cho toàn component
export type {Component}Props = {
  items:          {Component}Item[];
  // Common class overrides (áp dụng cho tất cả items nếu item không override)
  itemClass?:     string;
  labelClass?:    string;
  valueClass?:    string;
  // Layout options
  layout?:        'horizontal' | 'vertical';
  gap?:           number;       // gap in px
};

// Defaults
export const {COMPONENT}_DEFAULTS = {
  wrapperClass: 'flex flex-wrap items-center gap-4',
  itemClass:    'flex items-center gap-2',
  labelClass:   'text-sm text-gray-500',
  valueClass:   'text-sm font-semibold',
  layout:       'horizontal' as const,
  gap:          16,
};
```

### `{component}.component.ts`

```typescript
import { ChangeDetectionStrategy, Component, computed, input, output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslatePipe } from '@ngx-translate/core';
import { {Component}Item, {Component}Props, {COMPONENT}_DEFAULTS } from './{component}.types';

function joinClasses(...classes: Array<string | undefined | null | false>): string {
  return classes.filter(Boolean).join(' ');
}

@Component({
  selector:        'iam-{component}',
  standalone:      true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports:         [CommonModule, TranslatePipe],
  templateUrl:     './{component}.component.html',
  styleUrl:        './{component}.component.scss',
})
export class {Component}Component {
  // ── Inputs ───────────────────────────────────────────────────────────────
  readonly props = input.required<{Component}Props>();

  // ── Outputs ──────────────────────────────────────────────────────────────
  readonly onItemClick  = output<{Component}Item>();
  readonly onItemSelect = output<{Component}Item[]>();

  // ── Computed ──────────────────────────────────────────────────────────────
  readonly computedProps = computed(() => {
    const p = this.props();
    const D = {COMPONENT}_DEFAULTS;

    return {
      items:        p.items,
      wrapperClass: D.wrapperClass,
      itemClass:    joinClasses(D.itemClass,   p.itemClass),
      labelClass:   joinClasses(D.labelClass,  p.labelClass),
      valueClass:   joinClasses(D.valueClass,  p.valueClass),
    };
  });

  // ── TrackBy (bắt buộc với @for) ──────────────────────────────────────────
  trackByItem(item: {Component}Item, index: number): string | number {
    return item.id ?? index;
  }

  // ── Per-item class helpers (đọc từ computedProps, merge với item override) ─
  buildItemClass(item: {Component}Item): string {
    return joinClasses(this.computedProps().itemClass, item.itemClass);
  }

  buildLabelClass(item: {Component}Item): string {
    return joinClasses(this.computedProps().labelClass, item.labelClass);
  }

  buildValueClass(item: {Component}Item): string {
    const data = this.computedProps();
    // Thêm color variant class nếu có
    return joinClasses(
      data.valueClass,
      item.color ? `value--${item.color}` : null,
      item.valueClass,
    );
  }

  // ── Event handlers ────────────────────────────────────────────────────────
  handleItemClick(item: {Component}Item): void {
    if (item.disabled) return;
    this.onItemClick.emit(item);
  }
}
```

### `{component}.component.html`

```html
@let data = computedProps();

<div [class]="data.wrapperClass">
  @for (item of data.items; track trackByItem(item, $index)) {
    <div
      [class]="buildItemClass(item)"
      [class.opacity-50]="item.disabled"
      [class.cursor-not-allowed]="item.disabled"
      (click)="handleItemClick(item)"
    >
      <span [class]="buildLabelClass(item)">{{ item.label | translate }}</span>
      <strong [class]="buildValueClass(item)">{{ item.value }}</strong>
    </div>
  }
</div>
```

---

## Cách Smart Component truyền data xuống

Smart component (có facade) tạo props object và truyền qua `[props]` binding:

```typescript
// Smart component (facade)
readonly {component}Props = computed<{Component}Props>(() => ({
  items: this.dataList().map((item) => ({
    id:    item.id,
    label: item.name,
    value: item.count,
    color: item.status === 'ACTIVE' ? 'success' : 'neutral',
  })),
}));
```

```html
<!-- Smart component template -->
<iam-{component}
  [props]="{component}Props()"
  ({onItemClick})="facade.handleItemSelect($event)"
/>
```

---

## Anti-Patterns — Không làm trong Dumb Component

| Sai | Đúng |
|---|---|
| `inject(FeatureService)` | Nhận data qua `input()` |
| `this.http.get(...)` | Không có API call |
| `inject(Router).navigate(...)` | Emit event qua `output()`, để parent xử lý |
| `inject(ChangeDetectorRef).detectChanges()` | OnPush + signals tự handle |
| Hard-code `'#0F5A43'` trong template | Đặt trong `DEFAULTS` hoặc nhận qua `props.color` |
| Hard-code `'COMMON.TITLE'` trong template | Nhận qua `props.title` |
| `@for (item of items)` không có `track` | `@for (item of items; track item.id)` |
| Lưu complex state với `signal<ComplexObj>()` | Chỉ lưu UI state đơn giản: `isOpen = signal(false)` |

---

## Checklist sau khi gen

- [ ] Component **không** có `inject()` nào ngoài Angular core utilities
- [ ] Tất cả data đến từ `input()`, tất cả events ra qua `output()`
- [ ] `computedProps` đã xử lý toàn bộ defaults — template chỉ bind `data.xxx`
- [ ] Mọi `@for` đều có `track`
- [ ] Không có string màu sắc hay i18n key hard-code trong template
- [ ] Chọn đúng Variant (A/B/C) theo độ phức tạp và phạm vi dùng
- [ ] Nếu là shared component: tạo `{component}.types.ts` riêng
- [ ] Selector prefix khớp convention dự án (`iam-`, `ecat-`, v.v.)
