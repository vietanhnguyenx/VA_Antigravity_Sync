---
name: skill-gen-constants
description: Reference implementation templates cho constants generation (permissions, status enum, column definitions, search config). Đọc khi lệnh gen-constants cần code templates chi tiết.
---

# Skill: Gen Constants

Tạo 4 loại constant files trong folder `constants/` của một feature.

**Reference:** `src/app/features/external-integration/constants/`

---

## 1. Permissions — `{feature}-permissions.ts`

Định nghĩa permission keys và helper function.

```typescript
// src/app/features/{feature}/constants/{feature}-permissions.ts
import { PERMISSION_KEYS_ENUM } from '@core/constants/role';

export const {FEATURE}_PERMISSION_KEY = {
  {FEATURE}_VIEW_LIST:         '{FEATURE}_VIEW_LIST',
  {FEATURE}_VIEW_CREATE:       '{FEATURE}_VIEW_CREATE',
  {FEATURE}_VIEW_DETAIL:       '{FEATURE}_VIEW_DETAIL',
  {FEATURE}_VIEW_UPDATE:       '{FEATURE}_VIEW_UPDATE',
  {FEATURE}_VIEW_DELETE:       '{FEATURE}_VIEW_DELETE',
  {FEATURE}_VIEW_EXPORT:       '{FEATURE}_VIEW_EXPORT',
  {FEATURE}_VIEW_TOGGLE_STATUS: '{FEATURE}_VIEW_TOGGLE_STATUS',
  {FEATURE}_VIEW_LOG_DATA_CHANGE: '{FEATURE}_VIEW_LOG_DATA_CHANGE',
  {FEATURE}_VIEW_VERSION:      '{FEATURE}_VIEW_VERSION',
} as const;

export type {Feature}PermissionKey =
  (typeof {FEATURE}_PERMISSION_KEY)[keyof typeof {FEATURE}_PERMISSION_KEY];

// Helper: tự động thêm SUPER_ADMIN vào mảng permission
export const with{Feature}Per = (code: {Feature}PermissionKey): string[] => [
  code,
  PERMISSION_KEYS_ENUM.SUPER_ADMIN,
];
```

**Dùng trong facade:**
```typescript
const canCreate = this.permissionStore.canAccess(with{Feature}Per({FEATURE}_PERMISSION_KEY.{FEATURE}_VIEW_CREATE));
```

**Dùng trong route guard:**
```typescript
data: {
  permissions: [{FEATURE}_PERMISSION_KEY.{FEATURE}_VIEW_LIST, PERMISSION_KEYS_ENUM.SUPER_ADMIN],
}
```

---

## 2. Status List — `{feature}-status.ts`

Danh sách trạng thái cho dropdown filter và badge.

```typescript
// src/app/features/{feature}/constants/{feature}-status.ts
import { IamProps } from '@core/pipe/status-mapping';

export const {FEATURE}_STATUS_LIST: IamProps[] = [
  { label: 'COMMON.STATUS.ACTIVE',   value: 'ACTIVE',   severity: 'success' },
  { label: 'COMMON.STATUS.INACTIVE', value: 'INACTIVE', severity: 'secondary' },
];

// Ví dụ cho feature dùng enum backend khác:
// { label: 'COMMON.STATUS.ACTIVE',   value: 'PUBLISHED', severity: 'success' },
// { label: 'COMMON.STATUS.INACTIVE', value: 'BLOCKED',   severity: 'secondary' },
// { label: 'COMMON.STATUS.ERROR',    value: 'DEPRECATED', severity: 'danger' },
```

**severity options:** `'success'` | `'secondary'` | `'warning'` | `'danger'` | `'info'`

---

## 3. List Columns — `list-columns.ts`

Cấu hình cột cho table. Nhận TemplateRef cho các cột có custom rendering.

```typescript
// src/app/features/{feature}/constants/list-columns.ts
import { TemplateRef } from '@angular/core';
import { ColumnDefinition } from '@ubck-core/ui';

export const {FEATURE}_LIST_COLUMNS = (
  statusTemplate:   TemplateRef<unknown>,
  editTemplate:     TemplateRef<unknown>,
  ellipsisTemplate: TemplateRef<unknown>,
  // thêm template params nếu cần custom render khác
): ColumnDefinition[][] => [
  [
    {
      header:    '{FEATURE}.LIST.CODE',  // i18n key
      field:     'code',
      index:     1,
      minWidth:  '140px',
      maxWidth:  '180px',
      ellipsisRows: 2,
    },
    {
      header:    '{FEATURE}.LIST.NAME',
      field:     'name',
      index:     2,
      minWidth:  '200px',
      maxWidth:  '300px',
      tdClassName: '[overflow-wrap:anywhere]',
      ellipsisRows: 2,
      customTemplate: ellipsisTemplate,
    },
    {
      header:         'COMMON.STATUS',
      field:          'active',          // hoặc 'status'
      customTemplate: statusTemplate,
      index:          3,
      minWidth:       '140px',
      width:          '140px',
      maxWidth:       '160px',
    },
    {
      header:    'COMMON.TABLE.UPDATED_AT',
      field:     'updatedAt',
      index:     4,
      minWidth:  '160px',
      width:     '160px',
      maxWidth:  '180px',
    },
    {
      header:    'COMMON.TABLE.UPDATED_BY',
      field:     'updatedBy',
      index:     5,
      minWidth:  '160px',
      maxWidth:  '220px',
      ellipsisRows: 2,
      customTemplate: ellipsisTemplate,
    },
    {
      header:         'COMMON.TABLE.ACTION',
      field:          '',
      customTemplate: editTemplate,
      index:          6,
      minWidth:       '120px',
      width:          '120px',
      maxWidth:       '150px',
      tdClassName:    'text-center',
      thClassName:    'text-center',
    },
  ],
];
```

**ColumnDefinition fields thường dùng:**

| Field | Mô tả |
|---|---|
| `header` | i18n key của header |
| `field` | property name trong data object |
| `index` | thứ tự cột |
| `minWidth` | chiều rộng tối thiểu |
| `maxWidth` | chiều rộng tối đa |
| `width` | chiều rộng cố định (dùng cho cột action/status) |
| `customTemplate` | TemplateRef cho custom rendering |
| `ellipsisRows` | số dòng trước khi ellipsis |
| `tdClassName` | CSS class cho td |
| `thClassName` | CSS class cho th |

---

## 4. Search Config — `search-config.ts`

Cấu hình form tìm kiếm đơn và tìm kiếm nâng cao.

```typescript
// src/app/features/{feature}/constants/search-config.ts
import { DynamicFieldTypes, DynamicFormItem } from '@ubck-core/ui';
import { TemplateRef } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { {FEATURE}_STATUS_LIST } from './{feature}-status';

// ── Simple Search (1 ô text + custom template) ────────────────────────────
export const SEARCH_FORM_CONFIG = (searchTemplate: TemplateRef<unknown>): DynamicFormItem[] => [
  {
    type:  DynamicFieldTypes.CUSTOM,
    label: '{FEATURE}.SEARCH.KEYWORD',
    props: { maxLength: 255 },
    classes: {
      wrapper: 'flex flex-col gap-1 flex-1 min-w-[100px] w-full',
      control: 'h-[40px]',
      label:   'hidden',
    },
    group:              '1',
    isRequired:         false,
    key:                'search',
    formControlTemplate: searchTemplate,
  },
];

// ── Advanced Search (selects, dates, v.v.) ────────────────────────────────
export const ADV_SEARCH_FORM_CONFIG = (translateService: TranslateService): DynamicFormItem[] => {
  const statusOptions = {FEATURE}_STATUS_LIST.map((e) => ({
    ...e,
    label: translateService.instant(e.label),
  }));

  return [
    // Dropdown chọn status
    {
      type:        DynamicFieldTypes.SELECT,
      label:       'COMMON.STATUS',
      placeholder: 'COMMON.STATUS.PLA',
      props: {
        styleClass: 'rounded-xl w-full h-[40px] custom-input-center',
        showClear:  true,
        options:    statusOptions,
      },
      classes: {
        wrapper: 'flex flex-col gap-1 w-full basis-1/3 min-w-[312px]',
        control: 'h-[40px] w-full',
        label:   'font-medium text-[14px]',
      },
      group: '1',
      key:   'status',
    },

    // Dropdown chọn loại khác (thêm nếu cần)
    // {
    //   type:        DynamicFieldTypes.SELECT,
    //   label:       '{FEATURE}.SEARCH.TYPE',
    //   placeholder: '--Chọn--',
    //   props: {
    //     styleClass: 'rounded-xl w-full h-[40px] custom-input-center',
    //     showClear:  true,
    //     options:    TYPE_OPTIONS,
    //   },
    //   classes: {
    //     wrapper: 'flex flex-col gap-1 w-full basis-1/3 min-w-[312px]',
    //     control: 'h-[40px] w-full',
    //     label:   'font-medium text-[14px]',
    //   },
    //   group: '1',
    //   key:   'type',
    // },

    // Date range picker (nếu cần)
    // {
    //   type:    DynamicFieldTypes.DATE,
    //   label:   'COMMON.TABLE.UPDATED_AT',
    //   props: { selectionMode: 'range', showClear: true },
    //   classes: { wrapper: 'flex flex-col gap-1 w-full basis-1/3 min-w-[312px]' },
    //   group:   '1',
    //   key:     'updateAt',
    // },
  ];
};
```

---

## 5. Summary Cards — `{feature}-summary-cards.ts` (tuỳ chọn)

Dùng khi feature có summary statistics cards.

```typescript
// src/app/features/{feature}/constants/{feature}-summary-cards.ts
import { {Feature}SummaryResponse } from '../dto/{feature}-search';

export interface SummaryCard {
  label:      string;
  value:      number;
  colorClass?: string;
}

export const build{Feature}SummaryCards = (
  summary: {Feature}SummaryResponse,
): SummaryCard[] => [
  { label: '{FEATURE}.SUMMARY.TOTAL',    value: summary.total },
  { label: '{FEATURE}.SUMMARY.ACTIVE',   value: summary.active,   colorClass: 'text-green-600' },
  { label: '{FEATURE}.SUMMARY.INACTIVE', value: summary.inactive, colorClass: 'text-gray-500' },
];
```

---

## Checklist sau khi gen

- [ ] Thay `{Feature}`, `{feature}`, `{FEATURE}` bằng tên thực tế
- [ ] Xoá permission keys không dùng
- [ ] Điều chỉnh status values cho đúng với enum của backend (vd: `PUBLISHED`/`BLOCKED` thay vì `ACTIVE`/`INACTIVE`)
- [ ] Cập nhật column fields cho đúng với DTO fields
- [ ] Thêm/bớt filter fields trong `ADV_SEARCH_FORM_CONFIG` theo yêu cầu
- [ ] Status list dùng `severity` (KHÔNG dùng `styleClass`) — `IamProps` type yêu cầu `severity: 'success' | 'secondary' | 'danger' | 'warn'`
