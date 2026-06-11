---
name: gen-form
description: Tạo simple form config (search form + create/edit form) cho feature ESB-FE. Dùng khi form đơn giản, không cần dynamic variants hay điều kiện hiển thị phức tạp.
argument-hint: "<FeatureName> [field1:TYPE, field2:TYPE, ...]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo file form config cho feature: **$ARGUMENTS**

_(Định dạng input: `<FeatureName> [field1:TYPE,field2:TYPE,...]`_
_Ví dụ: `Currency code:TEXT,name:TEXT,nameEn:TEXT,country:SELECT,status:SELECT`)_

---

## Bước 0 — Parse input

Từ `$ARGUMENTS`, xác định:
- **FeatureName** (PascalCase): ví dụ `Currency`
- **feature-name** (kebab-case): ví dụ `currency`
- **FEATURE_NAME** (UPPER_SNAKE): ví dụ `CURRENCY`
- **Fields**: danh sách `key:TYPE` — nếu không có, dùng: `code:TEXT,name:TEXT,status:SELECT`

**Các TYPE hợp lệ:**
`TEXT`, `PASSWORD`, `TEXTAREA`, `CHECKBOX`, `SWITCH`, `RADIO`, `SELECT`, `MULTISELECT`, `SELECT_LAZY`, `MULTISELECT_LAZY`, `DATE`, `FILE`, `CUSTOM`

> `DATE_RANGE` không phải type riêng — dùng `DATE` với `props: { selectionMode: 'range' }`.

---

## Bước 1 — Đọc skill

Đọc file `.claude/skills/gen-dynamic-form.md` để lấy templates và quy tắc chuẩn.

---

## Bước 2 — Quy tắc layout tự động

Áp dụng các quy tắc sau khi không có chỉ định rõ:

1. **TEXT, PASSWORD, SELECT, MULTISELECT, RADIO, DATE, DATE_RANGE** → `w-1/2`, nhóm 2 field cùng `group`
2. **TEXTAREA, FILE, MULTISELECT, MULTISELECT_LAZY** → `w-full`, mỗi field 1 `group` riêng
3. **CHECKBOX, SWITCH** → `flex items-center gap-2`, có thể ghép cùng group
4. **SELECT_LAZY** → `w-1/2`, tương tự SELECT
5. **CUSTOM** → `w-1/2`, riêng group
6. Đánh `group` lần lượt: `'1'`, `'2'`, `'3'`… — mỗi khi gặp field full-width hoặc sau mỗi cặp w-1/2, tăng group
7. `order` tăng từ 1 trong mỗi group

---

## Bước 3 — Quy tắc validators tự động

- Mọi **TEXT** field → dùng `validatorsCommon()` (đã bao gồm required + maxLength + pattern XSS)
- Field tên `code` → `validatorsCommon({ maxLength: 50 })`
- Field tên `name`, `nameVi`, `nameEn` → `validatorsCommon({ maxLength: 255 })`
- Field tên `description`, `note` → `validatorsCommonTextArea({ required: false })`
- Field tên `email` → thêm `Validators.email`
- Field tên `status` → thêm `Validators.required`, value mặc định `'ACTIVE'`
- **SELECT/MULTISELECT_LAZY/SELECT_LAZY** không có field rõ ràng → để `options: []` hoặc `items: []` với comment `// TODO: inject data`

---

## Bước 4 — Sinh file

Tạo file tại: `src/app/features/{feature-name}/constants/create-{feature-name}-form.ts`

Áp dụng đúng template từ skill cho từng TYPE. Đặt key, label, placeholder theo convention:
- label: `'{FEATURE_NAME}.FORM.{KEY}_LABEL'`
- placeholder: `'{FEATURE_NAME}.FORM.{KEY}_PLACEHOLDER'`

**Ví dụ output hoàn chỉnh** (cho `/gen-form Currency code:TEXT,name:TEXT,status:SELECT`):

```typescript
import { Signal } from '@angular/core';
import { DynamicFormItem, DynamicFieldTypes } from '@ubck-core/ui';
import { Validators } from '@angular/forms';
import { TranslateService } from '@ngx-translate/core';
import { validatorsCommon } from '@utils/validators-common.util';
import { processFormConfig } from '@utils/process-dynamic-form-config';
import { CurrencyDetail } from '../dto/currency-detail';
import { CURRENCY_STATUS_LIST } from './currency-status';

export function createCurrencyForm(
  row: Signal<CurrencyDetail | undefined>,
  translateService: TranslateService,
): DynamicFormItem[] {
  return processFormConfig([
    {
      type: DynamicFieldTypes.TEXT,
      key: 'code',
      label: 'CURRENCY.FORM.CODE_LABEL',
      props: { placeholder: 'CURRENCY.FORM.CODE_PLACEHOLDER', maxLength: 50 },
      classes: { wrapper: 'flex flex-col gap-1 w-1/2', control: 'w-full', label: 'font-medium' },
      group: '1',
      order: 1,
      isRequired: true,
      validators: validatorsCommon({ maxLength: 50 }),
      value: row()?.code ?? null,
      disabled: !!row(),
    },
    {
      type: DynamicFieldTypes.TEXT,
      key: 'name',
      label: 'CURRENCY.FORM.NAME_LABEL',
      props: { placeholder: 'CURRENCY.FORM.NAME_PLACEHOLDER', maxLength: 255 },
      classes: { wrapper: 'flex flex-col gap-1 w-1/2', control: 'w-full', label: 'font-medium' },
      group: '1',
      order: 2,
      validators: validatorsCommon({ maxLength: 255 }),
      value: row()?.name ?? null,
    },
    {
      type: DynamicFieldTypes.SELECT,
      key: 'status',
      label: 'CURRENCY.FORM.STATUS_LABEL',
      placeholder: 'CURRENCY.FORM.STATUS_PLACEHOLDER',
      props: {
        options: CURRENCY_STATUS_LIST.map((i) => ({
          label: translateService.instant(i.label),
          value: i.value,
        })),
        styleClass: 'w-full rounded-xl',
        showClear: true,
      },
      classes: { wrapper: 'flex flex-col gap-1 w-1/2', control: 'h-[40px]', label: 'font-medium' },
      group: '2',
      order: 1,
      isRequired: true,
      validators: [Validators.required],
      value: row()?.status ?? 'ACTIVE',
    },
  ]);
}
```

---

## Bước 5 — Sau khi tạo file

Liệt kê:
1. File đã tạo với đường dẫn đầy đủ
2. Các `TODO` cần xử lý thêm (ví dụ: inject lazy data, options cho SELECT)
3. Import cần thêm vào component sử dụng:
   ```typescript
   import { createCurrencyForm } from './constants/create-currency-form';
   import { CmmDynamicFormModule } from '@ubck-core/ui';
   ```
4. Cách dùng trong template:
   ```html
   <cmm-dynamic-form #df [config]="formConfig"></cmm-dynamic-form>
   ```

---

## Verify trước khi bàn giao

```bash
pnpm lint src/app/features/{feature-name}/constants/create-{feature-name}-form.ts
```

Nếu có lỗi → chạy `pnpm lint-fix` để auto-fix, sau đó fix thủ công phần còn lại. Chỉ báo cáo "Done" khi lint **pass**.
