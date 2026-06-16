---
name: skill-iam-table-integration
description: Reference implementation cho IamTable integration pattern (ViewChild setup, custom column templates, HTML structure, facade signals/computed/setup methods). Đọc khi gen-component hoặc gen-facade cần tích hợp bảng dữ liệu.
---

# Skill: IAM Table Integration

Pattern tích hợp `iam-table` (common table component) vào một feature — bao gồm cả phần **Component** và **Facade**.

**Component tham chiếu:** `src/app/components/iam-table/iam-table.component.ts`
**Feature tham chiếu:** `src/app/features/region/`

---

## Phần A — Component

### A1. Imports cần thêm

```typescript
import { OnInit, TemplateRef, ViewChild } from '@angular/core';
import { IamTable } from '@components/iam-table/iam-table.component';
import { UBCKPaginatorState } from '@ubck-core/ui';
```

Thêm `IamTable` vào `imports[]` của `@Component`.
Thêm `OnInit` vào `implements` (không dùng `AfterViewInit`).

### A2. ViewChild Template Refs

Khai báo `@ViewChild` với `{ static: true }` — cho phép truy cập trong `ngOnInit`:

```typescript
@ViewChild('searchInputTemplate', { static: true }) searchInputTemplate!: TemplateRef<unknown>;
@ViewChild('statusTemplate',      { static: true }) statusTemplate!:      TemplateRef<unknown>;
@ViewChild('editTemplate',        { static: true }) editTemplate!:        TemplateRef<unknown>;
@ViewChild('ellipsisTemplate',    { static: true }) ellipsisTemplate!:    TemplateRef<unknown>;
// Thêm nếu có toggle column:
// @ViewChild('toggleTemplate',   { static: true }) toggleTemplate!:      TemplateRef<unknown>;
```

### A3. Lifecycle — `ngOnInit`

```typescript
ngOnInit(): void {
  this.facade.init();
  this.facade.setupFilterConfig(this.searchInputTemplate);
  this.facade.setupListColumns(this.statusTemplate, this.editTemplate, this.ellipsisTemplate);
  // Nếu có toggle: this.facade.setupListColumns(this.statusTemplate, this.editTemplate, this.ellipsisTemplate, this.toggleTemplate);
}
```

> **Quan trọng:** Dùng `{ static: true }` trên `@ViewChild` để Angular resolve template ref trước `ngOnInit`. Setup gọi trong `ngOnInit`, không phải `ngAfterViewInit`.

### A4. Event Handler

```typescript
onPageChange(event: UBCKPaginatorState): void {
  this.facade.handlePageChangeEvent(event);
}
```

### A5. HTML — Table + Templates

```html
<!-- Data table -->
<iam-table
  [props]="facade.listProps()"
  (onPageChangeEvt)="onPageChange($event)"
/>

<!-- ── Custom column templates ─────────────────────────────────────── -->

<!-- Status badge -->
<ng-template #statusTemplate let-row>
  <iam-badge-status [status]="row.active" [statusList]="facade.statusList()" />
</ng-template>

<!-- Ellipsis text -->
<ng-template #ellipsisTemplate let-value="value">
  <cmm-paragraph [text]="value" [rows]="1" />
</ng-template>

<!-- Action buttons (edit / delete) -->
<ng-template #editTemplate let-row>
  <div class="flex gap-2 justify-center">
    <p-button
      icon="pi pi-pencil"
      [text]="true"
      size="small"
      (onClick)="facade.handleOpenDialogEdit(row)"
    />
    <p-button
      icon="pi pi-trash"
      [text]="true"
      size="small"
      severity="danger"
      (onClick)="facade.handleOpenDialogDelete(row)"
    />
  </div>
</ng-template>

<!-- Toggle status (nếu cần) -->
<!-- <ng-template #toggleTemplate let-row>
  <p-toggleswitch
    [ngModel]="row.active === 'ACTIVE'"
    (onChange)="facade.onOpenToggleChange(row)"
  />
</ng-template> -->

<!-- Custom search input trong filter bar -->
<ng-template #searchInputTemplate>
  <input
    pInputText
    type="text"
    placeholder="{{ '{FEATURE}.SEARCH.PLACEHOLDER' | translate }}"
    class="h-[40px] w-full rounded-xl"
  />
</ng-template>
```

---

## Phần B — Facade

### B1. Imports cần thêm

```typescript
import { ColumnDefinition, IAMTableProps, UBCKPaginatorState, DynamicFormItem } from '@ubck-core/ui';
import { Signal, TemplateRef, computed, signal } from '@angular/core';
import { IAMTableProps } from '@components/iam-table/iam-table.types';
import { PaginationConstants } from '@core/base/pagination';
import { SearchEvent } from '@core/base/search-event';
import { DEFAULT_SEARCH_RESULT } from '@core/constants/default-search-result';
import { {FEATURE}_LIST_COLUMNS } from './constants/list-columns';
import { SEARCH_FORM_CONFIG, ADV_SEARCH_FORM_CONFIG } from './constants/search-config';
import { Search{Feature}Response } from './dto/{feature}-search';
```

### B2. State Signals — Table-specific

```typescript
// ── [TABLE] State ─────────────────────────────────────────────────
readonly pagination = signal<Partial<UBCKPaginatorState>>({
  currentPage:   PaginationConstants.DEFAULT_PAGE,
  recordPerPage: PaginationConstants.DEFAULT_PAGE_SIZE,
});
readonly columns = signal<ColumnDefinition[][]>([]);
readonly list    = signal<Search{Feature}Response>(DEFAULT_SEARCH_RESULT);
// ─────────────────────────────────────────────────────────────────
```

### B3. Filter Config Signals

```typescript
// ── [TABLE] Filter config (set sau khi ViewChild sẵn sàng) ────────
filterConfig!:    Signal<DynamicFormItem[]>;
advFilterConfig!: Signal<DynamicFormItem[]>;
// ─────────────────────────────────────────────────────────────────
```

### B4. Computed — `listProps`

```typescript
// ── [TABLE] Computed ──────────────────────────────────────────────
readonly listProps = computed<IAMTableProps>(() => ({
  ...this.pagination(),
  dataSources:        this.list()?.elementList || [],
  columns:            this.columns(),
  isShowCheckBox:     false,
  isShowOrder:        true,
  stickyStartColumn:  true,
  colOrderName:       '{FEATURE}.LIST.NO',
  scrollHeight:       'calc(100vh - 540px)',
  scrollable:         true,
  totalCount:         this.list()?.totalElements || 0,
  rowsPerPageOptions: [
    { label: 'PAGINATOR.PAGE', value: 10 },
    { label: 'PAGINATOR.PAGE', value: 25 },
    { label: 'PAGINATOR.PAGE', value: 50 },
  ],
  requestId: {FEATURE}_REQUEST_ID.SEARCH_{FEATURE},
}));
// ─────────────────────────────────────────────────────────────────
```

### B5. Setup Methods

```typescript
// ── [TABLE] Setup (gọi từ ngAfterViewInit của component) ──────────
setupFilterConfig(searchTemplate: TemplateRef<unknown>): void {
  this.filterConfig    = computed(() => SEARCH_FORM_CONFIG(searchTemplate));
  this.advFilterConfig = computed(() => ADV_SEARCH_FORM_CONFIG(this.translateService));
}

setupListColumns(
  statusTemplate:   TemplateRef<unknown>,
  editTemplate:     TemplateRef<unknown>,
  ellipsisTemplate: TemplateRef<unknown>,
  // toggleTemplate?: TemplateRef<unknown>,  // thêm nếu có toggle column
): void {
  this.columns.set({FEATURE}_LIST_COLUMNS(statusTemplate, editTemplate, ellipsisTemplate));
}
// ─────────────────────────────────────────────────────────────────
```

### B6. Search & Pagination Methods

```typescript
// ── [TABLE] Search & Pagination ───────────────────────────────────
handlePageChangeEvent(event: UBCKPaginatorState): void {
  this.pagination.update((prev) => ({
    ...prev,
    ...event,
    pageSize: event.recordPerPage,
    page:     event.currentPage,
  }));
  this.search();
}

handleSearchEvent(event: SearchEvent): void {
  if (event?.actionType === 'reset') {
    this.searchRequest.set({});
    this.pagination.set({
      currentPage:   PaginationConstants.DEFAULT_PAGE,
      recordPerPage: this.pagination().recordPerPage,
    });
    this.search({});
    return;
  }

  const data = event?.form?.value;
  const body: Search{Feature}Request = {
    keyword: data['search']?.trim() || null,
    // thêm các filter fields khác theo form config
  };

  this.searchRequest.set(body);
  this.pagination.set({
    currentPage:   PaginationConstants.DEFAULT_PAGE,
    recordPerPage: this.pagination().recordPerPage,
  });
  this.search(body);
}

search(body: Search{Feature}Request = this.searchRequest()): void {
  const pagination = {
    page:     this.pagination().currentPage   || PaginationConstants.DEFAULT_PAGE,
    pageSize: this.pagination().recordPerPage || PaginationConstants.DEFAULT_PAGE_SIZE,
  };

  this.list.update((prev) => ({ ...prev, elementList: [] }));

  this.{feature}Service
    .search{Feature}(body, pagination)
    .pipe(take(1))
    .subscribe({
      next: (res) => this.list.set(res),
    });
}
// ─────────────────────────────────────────────────────────────────
```

### B7. Reset — thêm vào `reset()` của facade

```typescript
// Thêm vào method reset() hiện có:
this.columns.set([]);
this.list.set(DEFAULT_SEARCH_RESULT);
this.pagination.set({
  currentPage:   PaginationConstants.DEFAULT_PAGE,
  recordPerPage: PaginationConstants.DEFAULT_PAGE_SIZE,
});
```

---

## Checklist khi áp dụng

- [ ] Thay tất cả `{Feature}`, `{feature}`, `{FEATURE}` bằng tên thực tế
- [ ] Thêm `IamTableComponent` vào `imports[]` của `@Component`
- [ ] Thêm `AfterViewInit` vào `implements` của component class
- [ ] Kiểm tra `list-columns.ts` đã tồn tại và export đúng function name
- [ ] Kiểm tra `search-config.ts` đã tồn tại và export `SEARCH_FORM_CONFIG`, `ADV_SEARCH_FORM_CONFIG`
- [ ] Điều chỉnh `scrollHeight` trong `listProps` theo layout thực tế
- [ ] Thêm/bớt `@ViewChild` và tham số `setupListColumns` theo số cột custom
- [ ] Nếu có toggle: uncomment `#toggleTemplate` trong HTML và thêm param tương ứng vào `setupListColumns`
