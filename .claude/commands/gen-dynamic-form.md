---
name: gen-dynamic-form
description: Tạo conditional dynamic form với nhiều variants cho feature ESB-FE. Dùng khi form có nhiều điều kiện hiển thị field, nhiều loại form khác nhau tùy theo giá trị controller field.
argument-hint: "<FeatureName> <controllerField:TYPE> variants:<V1|V2|...> [V1:field1:TYPE,...] [V2:field1:TYPE,...]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo Conditional Dynamic Form (multi-variant) cho feature: **$ARGUMENTS**

_(Định dạng input: `<FeatureName> <controllerField:TYPE> variants:<V1|V2|...> [V1:field1:TYPE,field2:TYPE,...] [V2:field1:TYPE,...]`)_

_Ví dụ: `Payment paymentType:RADIO variants:BANK_TRANSFER|E_WALLET BANK_TRANSFER:bankName:SELECT,accountNumber:TEXT E_WALLET:walletProvider:SELECT,phoneNumber:TEXT`_

---

## Bước 0 — Parse input

Từ `$ARGUMENTS`, xác định:
- **FeatureName** (PascalCase): ví dụ `Payment`
- **feature-name** (kebab-case): ví dụ `payment`
- **FEATURE_NAME** (UPPER_SNAKE): ví dụ `PAYMENT`
- **controllerField**: tên field (camelCase) và type của nó — ví dụ `paymentType:RADIO`
- **variants**: danh sách enum values — ví dụ `BANK_TRANSFER`, `E_WALLET`
- **fields-per-variant**: map từ variant → danh sách field:TYPE — nếu không cung cấp, tạo skeleton với `code:TEXT, name:TEXT, status:SELECT`

**Các TYPE hợp lệ:**
`TEXT`, `PASSWORD`, `TEXTAREA`, `CHECKBOX`, `SWITCH`, `RADIO`, `SELECT`, `MULTISELECT`, `SELECT_LAZY`, `MULTISELECT_LAZY`, `DATE`, `FILE`, `CUSTOM`

> `DynamicFieldTypes.NUMBER` không tồn tại — dùng `TEXT` + `Validators.pattern(/^\d+$/)` cho numeric.

---

## Bước 1 — Đọc skills

Đọc **cả hai** file skill sau (không bỏ qua):
1. `.claude/skills/dynamic-form-handler.md` — pattern chính cho conditional form
2. `.claude/skills/gen-dynamic-form.md` — templates chuẩn cho từng field type

---

## Bước 2 — Sinh file 1: Form Keys Constant

Tạo file: `src/app/features/{feature-name}/constants/{feature-name}-form.const.ts`

Áp dụng quy tắc:
- Controller field: key ngắn, không suffix → `'controllerField'`
- Variant fields: `{camelCaseField}_{snake_case_variant}` → `bankName_bank_transfer`, `walletProvider_e_wallet`
- Dùng `as const` + export derived type

```typescript
// Ví dụ output (Payment feature):
export const PaymentFormKeys = {
  PAYMENT_TYPE: 'paymentType',

  BANK_NAME_BANK_TRANSFER:    'bankName_bank_transfer',
  ACCOUNT_NUMBER_BANK_TRANSFER: 'accountNumber_bank_transfer',

  WALLET_PROVIDER_E_WALLET: 'walletProvider_e_wallet',
  PHONE_NUMBER_E_WALLET:    'phoneNumber_e_wallet',
} as const;

export type PaymentFormKey = (typeof PaymentFormKeys)[keyof typeof PaymentFormKeys];
```

---

## Bước 3 — Sinh file 2: Form Config Factory

Tạo file: `src/app/features/{feature-name}/constants/create-{feature-name}-form.ts`

**Cấu trúc bắt buộc:**

```typescript
import { FormGroup, Validators } from '@angular/forms';
import { DynamicFormItem, DynamicFieldTypes } from '@ubck-core/ui';
import { validatorsCommon, validatorsCommonTextArea } from '@utils/validators-common.util';
import { processFormConfig } from '@utils/process-dynamic-form-config';
import { {Feature}FormKeys, {Feature}FormKey } from './{feature-name}-form.const';

export enum {Feature}VariantEnum {
  VARIANT_A = 'VARIANT_A',
  // ... mỗi variant 1 entry
}

export interface {Feature}FormDropdownOptions {
  // khai báo lazy props + static lists cần inject
}

export function create{Feature}Form(
  mode: 'create' | 'edit',
  options: {Feature}FormDropdownOptions,
  initialVariant: {Feature}VariantEnum = {Feature}VariantEnum.VARIANT_A,
  initialData: Partial<Record<{Feature}FormKey, unknown>> | null = null,
): DynamicFormItem[] {
  // Section 1: Controller field (RADIO hoặc SELECT)
  const controllerConfig: DynamicFormItem[] = [ /* ... */ ];

  // Section 2: Variant A fields
  const variantAConfig: DynamicFormItem[] = [ /* ... */ ];

  // Section 3: Variant B fields
  const variantBConfig: DynamicFormItem[] = [ /* ... */ ];

  const completedConfig = [
    ...controllerConfig,
    ...variantAConfig,
    ...variantBConfig,
  ];

  if (mode === 'edit') {
    const disabledOnEdit: {Feature}FormKey[] = [ /* keys disabled khi edit */ ];
    completedConfig.forEach((item) => {
      if (disabledOnEdit.includes(item.key as {Feature}FormKey)) item.disabled = true;
    });
  }

  return processFormConfig(completedConfig);
}
```

**Quy tắc layout tự động** (áp dụng khi không chỉ định rõ):
- `TEXT`, `SELECT`, `SELECT_LAZY`, `DATE`, `RADIO` → `w-1/2`, ghép 2 field cùng group
- `TEXTAREA`, `FILE`, `MULTISELECT`, `MULTISELECT_LAZY` → `w-full`, riêng group
- `CHECKBOX`, `SWITCH` → `flex items-center gap-2`
- `groupLabel` chỉ đặt ở field đầu tiên của mỗi section

**visibleWhen tự động cho mỗi field:**
```typescript
visibleWhen: (_: unknown, f: FormGroup) =>
  f.getRawValue()[{Feature}FormKeys.CONTROLLER_FIELD] === {Feature}VariantEnum.VARIANT_X,
```

---

## Bước 4 — Sinh file 3: Form Mapper Utility

Tạo file: `src/app/features/{feature-name}/utils/{feature-name}-form-mapper.utils.ts`

Tạo 2 entry points:
1. `consolidate{Feature}FormValue(type, data)` — backend → form keys (dùng khi load edit)
2. `prepare{Feature}SubmitData(type, formValue)` — form → API payload (dùng khi submit)

Mỗi variant có hàm riêng (`consolidateVariantA`, `prepareSubmitDataVariantA`...).

---

## Bước 5 — Checklist sau khi tạo xong

Liệt kê:

1. **Files đã tạo** (đường dẫn đầy đủ)

2. **TODOs cần xử lý thêm:**
   - Inject lazy-load props từ facade cho `SELECT_LAZY` / `MULTISELECT_LAZY` fields
   - Khai báo options cho `SELECT` / `MULTISELECT` fields tĩnh
   - Bổ sung `disabledOnEdit` list đúng theo business logic

3. **Wiring vào Facade** — đoạn code cần thêm:
   ```typescript
   // Trong facade, sau khi form mount:
   registerForm(formRef: CmmDynamicFormComponent): void {
     this._dynamicFormRef = formRef;
     const form = formRef.facade.form();
     const controllerControl = form?.get({Feature}FormKeys.CONTROLLER_FIELD);
     controllerControl?.valueChanges.pipe(distinctUntilChanged()).subscribe((val) => {
       form?.reset({ [{Feature}FormKeys.CONTROLLER_FIELD]: val });
       formRef.facade.updateValidatorsBasedOnVisibility?.();
     });
   }
   ```

4. **Import cần thêm vào component:**
   ```typescript
   import { CmmDynamicFormComponent, CmmDynamicFormModule } from '@ubck-core/ui';
   import { viewChild } from '@angular/core';

   df = viewChild<CmmDynamicFormComponent>(CmmDynamicFormComponent);
   ```

5. **Template:**
   ```html
   <cmm-dynamic-form #df [config]="formConfig()"></cmm-dynamic-form>
   ```

---

## Bước 6 — Lint

```bash
pnpm lint src/app/features/{feature-name}/
```

Nếu có lỗi → chạy `pnpm lint-fix`, sau đó fix thủ công phần còn lại. Chỉ báo cáo "Done" khi lint **pass**.
