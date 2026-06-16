---
name: skill-gen-dynamic-form
description: Reference implementation templates cho dynamic form generation (field type templates: TEXT, SELECT, DATE, CUSTOM, lazy-load patterns, validators). Đọc khi lệnh gen-form hoặc gen-dynamic-form cần code templates chi tiết.
---

# Skill: Gen Dynamic Form Config

Tạo file `constants/create-{feature-name}-form.ts` theo chuẩn dự án ESB-FE, sử dụng `CmmDynamicFormComponent` từ `@ubck-core/ui`.

---

## Import chuẩn

```typescript
import { Signal } from '@angular/core';
import { DynamicFormItem, DynamicFieldTypes } from '@ubck-core/ui';
import { Validators } from '@angular/forms';
import { TranslateService } from '@ngx-translate/core';
import { validatorsCommon, validatorsCommonTextArea } from '@utils/validators-common.util';
import { processFormConfig } from '@utils/process-dynamic-form-config';
import { {Feature}Detail } from '../dto/{feature-name}-detail';
```

Thêm nếu cần:
```typescript
import { TemplateRef } from '@angular/core';                  // khi có CUSTOM field (thêm vào import Signal)
import { {FEATURE}_STATUS_LIST } from './{feature-name}-status'; // khi có SELECT status
import moment from 'moment';                                   // khi có DATE với row value
import { createSelectLazyProps, createMultiSelectLazyProps, LAZY_DROPDOWN_CLASSES } from '@utils/lazy-dropdown.utils'; // khi có SELECT_LAZY / MULTISELECT_LAZY
```

> `validatorsCommon()` = required + maxLength(20) + pattern. Dùng `validatorsCommon({ maxLength: 100 })` để override.
> `validatorsCommonTextArea()` dành cho TEXTAREA/mô tả dài.

---

## Function signature chuẩn

```typescript
export function create{Feature}Form(
  row: Signal<{Feature}Detail | undefined>,
  translateService: TranslateService,
): DynamicFormItem[] {
  return processFormConfig([
    // ... fields
  ]);
}
```

Nếu có lazy data hoặc custom templates, thêm param:
```typescript
export function create{Feature}Form(
  row: Signal<{Feature}Detail | undefined>,
  translateService: TranslateService,
  lazyData?: {
    items?: { label: string; value: string }[];
    total?: number;
    handleFilter?: (filter: string) => void;
    handleLoadMore?: () => void;
    handleSelect?: (items: any[]) => void;
  },
  customTemplate?: TemplateRef<unknown>,
): DynamicFormItem[]
```

> `row` là Signal — truy cập giá trị bằng `row()?.field ?? null`, không phải `row?.field`.

---

## Layout rules

| Trường hợp | wrapper class | group |
|------------|--------------|-------|
| 2 field cùng hàng | `'flex flex-col gap-1 w-1/2'` | cùng group |
| Full width (1 field) | `'flex flex-col gap-1 w-full'` | riêng group |
| TEXTAREA | `'flex flex-col gap-1 w-full'` | riêng group |
| FILE | `'flex flex-col gap-1 w-full'` | riêng group |
| CHECKBOX/SWITCH | `'flex items-center gap-2'` | chung group ok |
| Có margin bottom | thêm `mb-4` vào wrapper | field cuối section |

- `order` tăng dần trong group (bắt đầu từ 1)
- `group` là string số: `'1'`, `'2'`, `'3'`…
- `groupLabel` tùy chọn, chỉ cần ở field đầu tiên của group (key `'{FEATURE}.FORM_GROUP.xxx'`)

---

## Templates theo từng field type

### TEXT
```typescript
{
  type: DynamicFieldTypes.TEXT,
  key: 'code',
  label: 'FEATURE.FORM.CODE_LABEL',
  props: {
    placeholder: 'FEATURE.FORM.CODE_PLACEHOLDER',
    maxLength: 50,
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-1/2',
    control: 'w-full',
    label: 'font-medium',
  },
  group: '1',
  order: 1,
  isRequired: true,
  validators: validatorsCommon({ maxLength: 50 }),
  value: row()?.code ?? null,
  disabled: !!row(),
}
```
> Dùng `validatorsCommon()` — đã bao gồm required + maxLength + pattern (chống XSS).
> Override options: `validatorsCommon({ maxLength: 100, required: false })`.

---

### PASSWORD
```typescript
{
  type: DynamicFieldTypes.PASSWORD,
  key: 'securityKey',
  label: 'FEATURE.FORM.PASSWORD_LABEL',
  props: {
    placeholder: 'FEATURE.FORM.PASSWORD_PLACEHOLDER',
    toggleMask: true,
    feedback: false,
    fluid: true,
    styleClass: 'w-full relative',
    inputStyleClass: 'h-[36px] text-[14px] w-full pr-10',
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-1/2',
    control: 'w-full',
    label: 'font-medium',
  },
  group: '1',
  order: 2,
  isRequired: true,
  validators: validatorsCommon({ maxLength: 100 }),
  value: row()?.securityKey ?? null,
  disabled: !!row(),
}
```

---

### TEXTAREA
```typescript
{
  type: DynamicFieldTypes.TEXTAREA,
  key: 'description',
  label: 'FEATURE.FORM.DESCRIPTION_LABEL',
  props: {
    placeholder: 'FEATURE.FORM.DESCRIPTION_PLACEHOLDER',
    maxLength: 1000,
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-full',
    control: 'w-full h-[100px] rounded-xl py-2 px-3',
    label: 'font-medium',
  },
  group: '3',
  order: 1,
  validators: validatorsCommonTextArea({ maxLength: 1000, required: false }),
  value: row()?.description ?? null,
}
```

---

### SELECT (tĩnh)
```typescript
{
  type: DynamicFieldTypes.SELECT,
  key: 'status',
  label: 'FEATURE.FORM.STATUS_LABEL',
  placeholder: 'FEATURE.FORM.STATUS_PLACEHOLDER',
  props: {
    options: FEATURE_STATUS_LIST(translateService).map((i) => ({
      label: i.label,
      value: i.value,
    })),
    styleClass: 'w-full rounded-xl',
    scrollHeight: '250px',
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-1/2',
    control: 'h-[40px]',
    label: 'font-medium',
  },
  group: '2',
  order: 1,
  isRequired: true,
  validators: [Validators.required],
  value: row()?.status ?? 'ACTIVE',
}
```

---

### MULTISELECT (tĩnh)
```typescript
{
  type: DynamicFieldTypes.MULTISELECT,
  key: 'categories',
  label: 'FEATURE.FORM.CATEGORIES_LABEL',
  placeholder: 'FEATURE.FORM.CATEGORIES_PLACEHOLDER',
  props: {
    options: CATEGORIES_LIST.map((i) => ({ label: i.label, value: i.value })),
    styleClass: 'w-full rounded-xl',
    filter: true,
    showClear: true,
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-full',
    control: 'w-full',
    label: 'font-medium',
  },
  group: '2',
  order: 2,
  value: row()?.categories ?? [],
}
```

---

### SELECT_LAZY (dropdown load từ API, phân trang)

Dùng `createSelectLazyProps()` từ `@utils/lazy-dropdown.utils` — tự động fill các props cố định (`filter`, `appendOnly`, `hasApplyLazyLoad`, `width: '100%'`, `handleLazyItemClick`, `itemPerPage`, `styleClass`, `searchPlaceholderLabel`, `emptyMessage`, `isLoading`).

```typescript
{
  type: DynamicFieldTypes.SELECT_LAZY,
  key: 'currencyId',
  label: 'FEATURE.FORM.CURRENCY_LABEL',
  group: '3',
  order: 1,
  value: row()?.currencyId ?? null,
  props: createSelectLazyProps({
    items: lazyData?.items || [],
    totalItems: lazyData?.total || 0,
    placeholder: 'FEATURE.FORM.CURRENCY_PLACEHOLDER',
    handleLazyFilter: lazyData?.handleFilter,
    handleLazyLoadMore: lazyData?.handleLoadMore,
    // showClear: true,      // override nếu cần (default: undefined → processFormConfig tự xử lý theo isRequired)
    // styleClass: '...',    // override nếu cần (default: 'rounded-xl h-[36px]')
  }),
  classes: LAZY_DROPDOWN_CLASSES.HALF,  // hoặc .FULL / .FLEX
}
```

`LAZY_DROPDOWN_CLASSES`:
- `HALF` — `w-1/2` (mặc định cho field cặp đôi)
- `FULL` — `w-full` (field toàn chiều rộng)
- `FLEX` — `flex-1 min-w-0` (trong flex container co giãn)

---

### MULTISELECT_LAZY (chọn nhiều từ API)

Dùng `createMultiSelectLazyProps()` — extends `createSelectLazyProps()` với `showCheckAll: false` và các handler multiselect.

```typescript
{
  type: DynamicFieldTypes.MULTISELECT_LAZY,
  key: 'relatedIds',
  label: 'FEATURE.FORM.RELATED_LABEL',
  group: '3',
  order: 2,
  value: row()?.relatedIds ?? [],
  props: createMultiSelectLazyProps({
    items: lazyData?.items || [],
    totalItems: lazyData?.total || 0,
    placeholder: 'FEATURE.FORM.RELATED_PLACEHOLDER',
    handleCheckboxItemClick: lazyData?.handleSelect,
    handleCheckboxFilter: lazyData?.handleFilter,
    handleLazyLoadMore: lazyData?.handleLoadMore,
  }),
  classes: LAZY_DROPDOWN_CLASSES.FULL,
}
```

---

### DATE (single)
```typescript
{
  type: DynamicFieldTypes.DATE,
  key: 'startDate',
  label: 'FEATURE.FORM.START_DATE_LABEL',
  placeholder: 'FEATURE.FORM.START_DATE_PLACEHOLDER',
  props: {
    styleClass: 'w-full rounded-xl',
    dateFormat: 'dd-mm-yy',
    readonlyInput: true,
    showIcon: true,
    showClear: true,
    minDate: new Date(),
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-1/2 mb-4',
    control: 'h-[40px]',
    label: 'font-medium',
  },
  group: '2',
  order: 1,
  isRequired: true,
  validators: [Validators.required],
  value: row()?.startDate ? moment(row()!.startDate).toDate() : null,
}
```

---

### DATE RANGE
```typescript
{
  type: DynamicFieldTypes.DATE,
  key: 'dateRange',
  label: 'FEATURE.FORM.DATE_RANGE_LABEL',
  placeholder: 'FEATURE.FORM.DATE_RANGE_PLACEHOLDER',
  props: {
    styleClass: 'w-full rounded-xl',
    selectionMode: 'range',
    dateFormat: 'dd-mm-yy',
    readonlyInput: true,
    showIcon: true,
    showClear: true,
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-1/2 mb-4',
    control: 'h-[40px]',
    label: 'font-medium',
  },
  group: '2',
  order: 2,
  isRequired: true,
  validators: [Validators.required],
  value: row()?.startDate ? [moment(row()!.startDate).toDate(), moment(row()!.endDate).toDate()] : null,
}
```

---

### CHECKBOX
```typescript
{
  type: DynamicFieldTypes.CHECKBOX,
  key: 'isAgreement',
  label: 'FEATURE.FORM.AGREEMENT_LABEL',
  props: {},
  classes: {
    wrapper: 'flex items-center gap-2',
    label: 'font-medium',
  },
  group: '4',
  order: 1,
  isRequired: true,
  validators: [Validators.requiredTrue],
  value: row()?.isAgreement ?? false,
}
```

---

### SWITCH (toggle)
```typescript
{
  type: DynamicFieldTypes.SWITCH,
  key: 'active',
  label: 'FEATURE.FORM.ACTIVE_LABEL',
  props: {},
  classes: {
    wrapper: 'flex items-center gap-2',
    label: 'font-medium',
  },
  group: '4',
  order: 2,
  value: row()?.active ?? true,
  visibleWhen: () => !!row(), // chỉ hiện khi edit — bỏ nếu luôn hiển thị
}
```

---

### RADIO
```typescript
{
  type: DynamicFieldTypes.RADIO,
  key: 'gender',
  label: 'FEATURE.FORM.GENDER_LABEL',
  props: {
    options: [
      { label: 'FEATURE.GENDER.MALE', value: 'MALE' },
      { label: 'FEATURE.GENDER.FEMALE', value: 'FEMALE' },
    ],
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-1/2',
    label: 'font-medium',
  },
  group: '2',
  order: 3,
  isRequired: true,
  validators: [Validators.required],
  value: row()?.gender ?? null,
}
```

---

### FILE
```typescript
{
  type: DynamicFieldTypes.FILE,
  key: 'attachment',
  label: 'FEATURE.FORM.FILE_LABEL',
  props: {
    accept: '.pdf,.doc,.docx',
    maxFileSize: 5 * 1024 * 1024, // 5MB
    multiple: false,
  },
  classes: {
    wrapper: 'flex flex-col gap-1 w-full',
    label: 'font-medium',
  },
  group: '4',
  order: 1,
  value: null,
}
```

---

### CUSTOM (template tùy chỉnh)
```typescript
{
  type: DynamicFieldTypes.CUSTOM,
  key: 'amount',
  label: 'FEATURE.FORM.AMOUNT_LABEL',
  placeholder: 'FEATURE.FORM.AMOUNT_PLACEHOLDER',
  props: {},
  classes: {
    wrapper: 'flex flex-col gap-1 w-1/2 mb-4',
    control: 'h-[40px]',
    label: 'font-medium',
  },
  group: '3',
  order: 1,
  formControlTemplate: customTemplate, // TemplateRef truyền vào hàm
  value: row()?.amount ?? null,
}
```

---

## Conditional logic

### Ẩn/hiện theo giá trị field khác
```typescript
visibleWhen: (formValue, form) => {
  return formValue.type === 'SPECIFIC_TYPE';
},
```

### Chỉ hiện khi edit (có row)
```typescript
visibleWhen: () => !!row(),
```

### Disable khi edit
```typescript
disabled: !!row(),
```

### Disable khi date đã qua
```typescript
disabled: row() ? moment(row()!.startDate).isBefore(moment(), 'day') : false,
```

---

## Validators reference

```typescript
// Shorthand utils (ưu tiên dùng)
validatorsCommon()                    // required + maxLength(20) + pattern code
validatorsCommon({ maxLength: 100 })  // override options
validatorsCommonTextArea()            // required + maxLength(255) + pattern string

// Angular built-in (dùng khi cần đặc thù)
Validators.required            // bắt buộc
Validators.requiredTrue        // checkbox phải check
Validators.email               // định dạng email
Validators.minLength(8)        // độ dài tối thiểu
Validators.maxLength(255)      // độ dài tối đa
Validators.pattern(/^[a-zA-Z0-9]*$/) // regex
```

> **Không dùng** `DynamicFieldTypes.NUMBER` — type này không tồn tại trong `@ubck-core/ui` của dự án. Dùng `DynamicFieldTypes.TEXT` với validator số nếu cần.

---

## Sử dụng trong component

```html
<!-- Template -->
<cmm-dynamic-form #df [config]="formConfig"></cmm-dynamic-form>
```

```typescript
// Component TS
import { CmmDynamicFormComponent, CmmDynamicFormModule } from '@ubck-core/ui';
import { viewChild } from '@angular/core';

df = viewChild<CmmDynamicFormComponent>(CmmDynamicFormComponent);

submit() {
  const form = this.df()?.facade.form();
  if (!form) return;
  form.markAllAsTouched();
  if (form.invalid) return;
  const data = form.getRawValue(); // includes disabled fields
}
```

---

## Reference files

Xem ví dụ thực tế tại:
- `src/app/features/currency/constants/create-currency-form.ts` — TEXT + SELECT cơ bản
- `src/app/features/working-schedule/constants/working-schedule-create-form.ts` — DATE, conditional, TEXTAREA
- `src/app/features/administrative-procedure/constants/administrative-procedure-create-form.ts` — SELECT_LAZY, MULTISELECT_LAZY, CUSTOM
- `src/app/features/fund-company/constants/create-fund-company-form.ts` — groupLabel, nhiều section
