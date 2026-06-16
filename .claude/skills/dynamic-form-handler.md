---
name: skill-dynamic-form-handler
description: Reference implementation cho conditional multi-variant form handler (5 layers: form keys const, config factory, visibleWhen logic, facade reset, consolidation utils). Đọc khi gen-dynamic-form cần pattern xử lý form phức tạp.
---

# Skill: Dynamic Form Handler — Conditional / Multi-Variant Form

Dùng khi form cần **ẩn/hiện field theo điều kiện** và **thay đổi validation rules theo variant** — tức là form có một "controller field" (ví dụ: loại tài khoản, loại giao dịch) điều khiển toàn bộ cấu trúc các field còn lại.

> Nếu form chỉ cần ẩn/hiện đơn giản (không có nhiều variant field sets), dùng skill `gen-dynamic-form.md` là đủ.

---

## Khi nào dùng pattern này?

- Form có ≥2 bộ field phụ thuộc vào một field "controller" (radio, select)
- Cùng một label nhưng key khác nhau theo variant (vd: `username_variant_a`, `username_variant_b`)
- Validator phải thay đổi theo variant đang active
- Edit mode cần disable một số field nhất định

---

## Core Architecture (5 layers)

```
1. Keys Constant          → type-safe keys, namespaced by variant
2. Config Factory         → DynamicFormItem[] với visibleWhen
3. visibleWhen mechanism  → f.getRawValue() để kiểm tra controller
4. Form Reset (Facade)    → valueChanges → reset → updateValidators
5. Data Consolidation     → map backend ↔ form keys theo variant
```

---

## Layer 1: Form Keys Constant

```typescript
// constants/my-form.const.ts
export const MyFormKeys = {
  // Controller field — không suffix
  TYPE: 'type',

  // Variant A fields — suffix: _variant_a
  FIELD_X_VARIANT_A: 'fieldX_variant_a',
  FIELD_Y_VARIANT_A: 'fieldY_variant_a',
  STATUS_VARIANT_A:  'status_variant_a',

  // Variant B fields — suffix: _variant_b
  FIELD_X_VARIANT_B: 'fieldX_variant_b',
  FIELD_Z_VARIANT_B: 'fieldZ_variant_b',
  STATUS_VARIANT_B:  'status_variant_b',
} as const;

export type MyFormKey = (typeof MyFormKeys)[keyof typeof MyFormKeys];
```

**Quy tắc đặt key:**
- Controller field: tên ngắn, không suffix → `'type'`, `'paymentType'`
- Variant fields: `{camelCaseField}_{snake_variant}` → `phone_ext_org`, `username_ldap`
- Sub-group/representative fields: thêm prefix nhóm → `repPhone_ext_org`

---

## Layer 2: Form Config Factory

```typescript
// constants/create-my-form.ts
import { FormGroup, Validators } from '@angular/forms';
import { DynamicFormItem, DynamicFieldTypes } from '@ubck-core/ui';
import { validatorsCommon } from '@utils/validators-common.util';
import { processFormConfig } from '@utils/process-dynamic-form-config';
import { MyFormKeys, MyFormKey } from './my-form.const';

export enum MyVariantEnum {
  VARIANT_A = 'VARIANT_A',
  VARIANT_B = 'VARIANT_B',
}

export interface MyFormDropdownOptions {
  statusList: { label: string; value: string }[];
  categoryProps: any; // lazy-load props từ facade
}

export function createMyForm(
  mode: 'create' | 'edit',
  options: MyFormDropdownOptions,
  initialVariant: MyVariantEnum = MyVariantEnum.VARIANT_A,
  initialData: Partial<Record<MyFormKey, unknown>> | null = null,
): DynamicFormItem[] {
  const { statusList, categoryProps } = options;

  // --- Section 1: Controller Field ---
  const controllerConfig: DynamicFormItem[] = [
    {
      key: MyFormKeys.TYPE,
      type: DynamicFieldTypes.RADIO,
      label: 'MY_FEATURE.FORM.TYPE_LABEL',
      order: 1,
      group: '1',
      groupLabel: 'MY_FEATURE.FORM_GROUP.ACCOUNT_INFO',
      props: {
        options: [
          { label: 'MY_FEATURE.VARIANT.A', value: MyVariantEnum.VARIANT_A },
          { label: 'MY_FEATURE.VARIANT.B', value: MyVariantEnum.VARIANT_B },
        ],
        styleClass: 'flex gap-6',
      },
      classes: {
        wrapper: 'flex flex-col gap-1 w-full border-b border-gray-200 pb-4',
        label: 'font-semibold text-lg text-gray-900',
        control: '',
        group: 'text-lg font-semibold text-gray-900 pt-4 pb-2',
      },
      value: initialData?.[MyFormKeys.TYPE] ?? initialVariant,
      isRequired: true,
      validators: [Validators.required],
    },
  ];

  // --- Section 2: Variant A fields ---
  const variantAConfig: DynamicFormItem[] = [
    {
      key: MyFormKeys.FIELD_X_VARIANT_A,
      type: DynamicFieldTypes.TEXT,
      label: 'MY_FEATURE.FORM.FIELD_X_LABEL',
      group: '2',
      groupLabel: 'MY_FEATURE.FORM_GROUP.DETAILS',
      order: 1,
      isRequired: true,
      validators: validatorsCommon({ maxLength: 255 }),
      value: initialData?.[MyFormKeys.FIELD_X_VARIANT_A] ?? null,
      props: { maxLength: 255, placeholder: 'MY_FEATURE.FORM.FIELD_X_PLACEHOLDER' },
      classes: {
        wrapper: 'flex flex-col gap-1 w-1/2',
        label: 'font-medium',
        control: 'w-full',
        group: 'text-lg font-semibold text-gray-900 pt-4 pb-2',
      },
      visibleWhen: (_: unknown, f: FormGroup) =>
        f.getRawValue()[MyFormKeys.TYPE] === MyVariantEnum.VARIANT_A,
    },
  ];

  // --- Section 3: Variant B fields ---
  const variantBConfig: DynamicFormItem[] = [
    {
      key: MyFormKeys.FIELD_X_VARIANT_B,
      type: DynamicFieldTypes.TEXT,
      label: 'MY_FEATURE.FORM.FIELD_X_LABEL',
      group: '2',
      order: 1,
      isRequired: true,
      validators: validatorsCommon({ maxLength: 255 }),
      value: initialData?.[MyFormKeys.FIELD_X_VARIANT_B] ?? null,
      props: { maxLength: 255, placeholder: 'MY_FEATURE.FORM.FIELD_X_PLACEHOLDER' },
      classes: {
        wrapper: 'flex flex-col gap-1 w-1/2',
        label: 'font-medium',
        control: 'w-full',
      },
      visibleWhen: (_: unknown, f: FormGroup) =>
        f.getRawValue()[MyFormKeys.TYPE] === MyVariantEnum.VARIANT_B,
    },
  ];

  const completedConfig = [
    ...controllerConfig,
    ...variantAConfig,
    ...variantBConfig,
  ];

  // Apply edit-mode disable
  if (mode === 'edit') {
    const disabledOnEdit: MyFormKey[] = [MyFormKeys.TYPE, MyFormKeys.FIELD_X_VARIANT_A];
    completedConfig.forEach((item) => {
      if (disabledOnEdit.includes(item.key as MyFormKey)) {
        item.disabled = true;
      }
    });
  }

  return processFormConfig(completedConfig);
}
```

---

## Layer 3: visibleWhen — Cú pháp chuẩn

```typescript
// Arrow form — dùng cho logic đơn giản (1 variant)
visibleWhen: (_: unknown, f: FormGroup) =>
  f.getRawValue()[MyFormKeys.TYPE] === MyVariantEnum.VARIANT_A,

// Block form — dùng khi cần đặt biến trung gian
visibleWhen: (_: unknown, f: FormGroup) => {
  const currentType = f.getRawValue()[MyFormKeys.TYPE];
  return currentType === MyVariantEnum.VARIANT_A;
},

// Hiện khi nhiều variants cùng dùng chung field
visibleWhen: (_: unknown, f: FormGroup) => {
  const t = f.getRawValue()[MyFormKeys.TYPE];
  return t === MyVariantEnum.VARIANT_A || t === MyVariantEnum.VARIANT_B;
},

// Chỉ hiện khi edit mode (field bổ sung khi xem chi tiết)
visibleWhen: () => mode === 'edit',
```

**QUAN TRỌNG:** Luôn dùng `f.getRawValue()` — KHÔNG dùng `f.value`.
`f.value` bỏ qua disabled fields, khiến điều kiện kiểm tra controller field bị sai khi field đó đang disabled.

---

## Layer 4: Facade — Form Reset & Validator Update

```typescript
// my-feature.facade.ts
import { distinctUntilChanged } from 'rxjs';
import { CmmDynamicFormComponent } from '@ubck-core/ui';
import { DestroyRef, inject } from '@angular/core';

@Injectable()
export class MyFeatureFacade {
  private readonly destroyRef = inject(DestroyRef);
  private _dynamicFormRef?: CmmDynamicFormComponent;

  registerForm(formRef: CmmDynamicFormComponent): void {
    this._dynamicFormRef = formRef;
    this.wireControllerFieldChanges();
  }

  private wireControllerFieldChanges(): void {
    const form = this._dynamicFormRef?.facade.form();
    if (!form) return;

    const controllerControl = form.get(MyFormKeys.TYPE);
    const sub = controllerControl?.valueChanges
      .pipe(distinctUntilChanged())
      .subscribe((newVariant) => {
        // Reset toàn bộ form, CHỈ giữ lại controller value
        form.reset({ [MyFormKeys.TYPE]: newVariant });
        // Strip validators khỏi field đang ẩn — bắt buộc sau mỗi reset
        this._dynamicFormRef?.facade.updateValidatorsBasedOnVisibility?.();
      });

    this.destroyRef.onDestroy(() => sub?.unsubscribe());
  }

  handleSave(): void {
    const form = this._dynamicFormRef?.facade.form();
    if (!form) return;
    form.markAllAsTouched();
    if (form.invalid) return;

    const rawValue = form.getRawValue();
    const type = rawValue[MyFormKeys.TYPE] as MyVariantEnum;
    const payload = prepareSubmitData(type, rawValue);
    // call service...
  }
}
```

**Trong component:**
```typescript
// my-feature.component.ts
df = viewChild<CmmDynamicFormComponent>(CmmDynamicFormComponent);

ngOnInit(): void {
  const formRef = this.df();
  if (formRef) this.facade.registerForm(formRef);
}
```

```html
<!-- my-feature.component.html -->
<cmm-dynamic-form #df [config]="formConfig()"></cmm-dynamic-form>
```

---

## Layer 5: Data Consolidation (Backend ↔ Form Keys)

```typescript
// utils/my-form-mapper.utils.ts

// Backend → Form (dùng khi load edit data)
export function consolidateFormValue(
  type: MyVariantEnum,
  data: MyDetail,
): Partial<Record<MyFormKey, unknown>> {
  switch (type) {
    case MyVariantEnum.VARIANT_A: return consolidateVariantA(data);
    case MyVariantEnum.VARIANT_B: return consolidateVariantB(data);
    default: return {};
  }
}

function consolidateVariantA(data: MyDetail): Partial<Record<MyFormKey, unknown>> {
  return {
    [MyFormKeys.TYPE]: data.type,
    [MyFormKeys.FIELD_X_VARIANT_A]: data.fieldX,
    [MyFormKeys.FIELD_Y_VARIANT_A]: data.fieldY,
    [MyFormKeys.STATUS_VARIANT_A]: data.status,
  };
}

function consolidateVariantB(data: MyDetail): Partial<Record<MyFormKey, unknown>> {
  return {
    [MyFormKeys.TYPE]: data.type,
    [MyFormKeys.FIELD_X_VARIANT_B]: data.fieldX,
    [MyFormKeys.FIELD_Z_VARIANT_B]: data.fieldZ,
    [MyFormKeys.STATUS_VARIANT_B]: data.status,
  };
}

// Form → API payload (dùng khi submit)
export function prepareSubmitData(
  type: MyVariantEnum,
  formValue: Record<string, unknown>,
): unknown {
  switch (type) {
    case MyVariantEnum.VARIANT_A: return prepareSubmitDataVariantA(formValue);
    case MyVariantEnum.VARIANT_B: return prepareSubmitDataVariantB(formValue);
  }
}

function prepareSubmitDataVariantA(v: Record<string, unknown>) {
  return {
    type: v[MyFormKeys.TYPE],
    fieldX: v[MyFormKeys.FIELD_X_VARIANT_A],
    fieldY: v[MyFormKeys.FIELD_Y_VARIANT_A],
    status: v[MyFormKeys.STATUS_VARIANT_A],
  };
}

function prepareSubmitDataVariantB(v: Record<string, unknown>) {
  return {
    type: v[MyFormKeys.TYPE],
    fieldX: v[MyFormKeys.FIELD_X_VARIANT_B],
    fieldZ: v[MyFormKeys.FIELD_Z_VARIANT_B],
    status: v[MyFormKeys.STATUS_VARIANT_B],
  };
}
```

---

## Lazy-Load Field với `appendOnly`

Dùng `createSelectLazyProps()` / `createMultiSelectLazyProps()` và `LAZY_DROPDOWN_CLASSES` từ `@utils/lazy-dropdown.utils` — tự động fill các props cố định.

```typescript
import { createSelectLazyProps, createMultiSelectLazyProps, LAZY_DROPDOWN_CLASSES } from '@utils/lazy-dropdown.utils';

// SELECT_LAZY — chọn một
{
  key: MyFormKeys.CATEGORY_VARIANT_A,
  type: DynamicFieldTypes.SELECT_LAZY,
  label: 'MY_FEATURE.FORM.CATEGORY_LABEL',
  isRequired: true,
  validators: [Validators.required],
  group: '3',
  order: 1,
  props: createSelectLazyProps({
    items: categoryProps.items,
    totalItems: categoryProps.totalItems,
    placeholder: 'MY_FEATURE.FORM.CATEGORY_PLACEHOLDER',
    handleLazyFilter: categoryProps.handleLazyFilter,
    handleLazyLoadMore: categoryProps.handleLazyLoadMore,
    // showClear: false,   // override nếu cần
  }),
  classes: LAZY_DROPDOWN_CLASSES.HALF,  // hoặc .FULL / .FLEX
  visibleWhen: (_: unknown, f: FormGroup) =>
    f.getRawValue()[MyFormKeys.TYPE] === MyVariantEnum.VARIANT_A,
}

// MULTISELECT_LAZY — chọn nhiều
{
  key: MyFormKeys.TAGS_VARIANT_A,
  type: DynamicFieldTypes.MULTISELECT_LAZY,
  label: 'MY_FEATURE.FORM.TAGS_LABEL',
  group: '3',
  order: 2,
  props: createMultiSelectLazyProps({
    items: tagsProps.items,
    totalItems: tagsProps.totalItems,
    placeholder: 'MY_FEATURE.FORM.TAGS_PLACEHOLDER',
    handleCheckboxItemClick: tagsProps.handleSelect,
    handleCheckboxFilter: tagsProps.handleFilter,
    handleLazyLoadMore: tagsProps.handleLoadMore,
  }),
  classes: LAZY_DROPDOWN_CLASSES.FULL,
  visibleWhen: (_: unknown, f: FormGroup) =>
    f.getRawValue()[MyFormKeys.TYPE] === MyVariantEnum.VARIANT_A,
}
```

`LAZY_DROPDOWN_CLASSES`: `HALF` (w-1/2) · `FULL` (w-full) · `FLEX` (flex-1 min-w-0 trong flex container)

---

## File Structure chuẩn

```
src/app/features/{feature-name}/
├── constants/
│   ├── {feature-name}-form.const.ts          # Keys + type
│   └── create-{feature-name}-form.ts         # Config factory
├── utils/
│   └── {feature-name}-form-mapper.utils.ts   # consolidateFormValue + prepareSubmitData
├── dto/
│   └── {feature-name}-variant.enum.ts        # Enum variants
└── {feature-name}.facade.ts                  # wireControllerFieldChanges + handleSave
```

---

## Do's and Don'ts

### ✅ DO

- **Dùng `f.getRawValue()` trong `visibleWhen`** — `f.value` bỏ qua disabled fields gây điều kiện sai
- **Suffix key theo variant** — `phone_ext_org`, `username_ldap`; KHÔNG dùng tên chung cho nhiều variant
- **Reset form giữ lại controller value** — `form.reset({ [MyFormKeys.TYPE]: newVariant })`
- **Gọi `updateValidatorsBasedOnVisibility()` sau mỗi reset** — strip validators khỏi field đang ẩn
- **Dùng `appendOnly: true` cho lazy multiselect** — ngăn mất selection khi load thêm trang
- **Dùng `validatorsCommon()` / `validatorsCommonTextArea()`** thay vì compose thủ công
- **Wrap toàn bộ config bằng `processFormConfig()`** — tự động xử lý `showClear` theo `isRequired`
- **Tách riêng từng variant thành một block** trong config factory (`// --- Section N: Variant X ---`)
- **Dùng `as const` cho Keys object** — đảm bảo type inference và autocomplete

### ❌ DON'T

- **KHÔNG dùng `f.value` trong `visibleWhen`** — sẽ miss disabled fields
- **KHÔNG chia sẻ cùng form key giữa các variant** — `FormGroup` chỉ có 1 control per key, sẽ conflict
- **KHÔNG dùng component state (signal, class property) trong `visibleWhen`** — chỉ đọc từ `f.getRawValue()`
- **KHÔNG dùng `DynamicFieldTypes.NUMBER`** — không tồn tại trong `@ubck-core/ui`; dùng `TEXT` + `Validators.pattern(/^\d+$/)`
- **KHÔNG để validator trên field ẩn** mà không gọi `updateValidatorsBasedOnVisibility()`
- **KHÔNG hardcode lazy items** trực tiếp trong config — inject qua param của factory function
- **KHÔNG dùng `*ngIf`** để ẩn field thay vì `visibleWhen` — `*ngIf` không strip validators khỏi FormGroup

---

## Validators Reference (esb-fe)

```typescript
// Ưu tiên — đã bao gồm required + maxLength + XSS protection
validatorsCommon()                            // required + maxLength(20) + XSS
validatorsCommon({ maxLength: 255 })
validatorsCommon({ required: false })
validatorsCommonTextArea()                    // required + maxLength(255)
validatorsCommonTextArea({ maxLength: 1000, required: false })

// Angular built-in — dùng khi cần đặc thù
Validators.required
Validators.email
Validators.pattern(/^\d{10}$/)               // phone 10 digits
Validators.pattern(/^\d+(\.\d+)?$/)         // numeric (thay DynamicFieldTypes.NUMBER)
Validators.minLength(8)
```
