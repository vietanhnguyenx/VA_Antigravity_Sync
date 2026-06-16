---
name: skill-gen-component
description: Reference implementation templates cho Angular component generation (main component, item dialog, optional summary variants). Đọc khi lệnh gen-component cần code templates chi tiết.
---

# Skill: Gen Component

Tạo main component và các sub-components cho một feature.

**Reference:** `src/app/features/external-integration/`

---

## Cấu trúc components

```
{feature}/
├── {feature}.component.ts      # Main component (list + filter + table)
├── {feature}.component.html
├── {feature}.component.scss
└── components/
    ├── {feature}-item/             # Dialog form (create/edit)
    │   ├── {feature}-item.component.ts
    │   ├── {feature}-item.component.html
    │   └── {feature}-item.component.scss
    └── {feature}-summary/          # Summary cards (nếu cần)
        ├── {feature}-summary.component.ts
        ├── {feature}-summary.component.html
        └── {feature}-summary.component.scss
```

---

## 1. Main Component — `{feature}.component.ts`

> Có 2 variant tùy theo cờ `hasTable`. Chọn đúng variant khi sinh code.

---

### Variant A — `hasTable:true` (có tích hợp `iam-table`)

```typescript
// src/app/features/{feature}/{feature}.component.ts
import {
  ChangeDetectionStrategy,
  Component,
  DestroyRef,
  inject,
  OnInit,
  TemplateRef,
  ViewChild,
} from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TranslatePipe } from '@ngx-translate/core';
import { Button } from 'primeng/button';

import { CmmTypepographyModule, UBCKPaginatorState } from '@ubck-core/ui';
import { IamTable } from '@components/iam-table/iam-table.component';
import { IamBadgeStatus } from '@components/badge-status/badge-status.component';
import { IamSearchInput } from '@components/templates/search-input';
import { UbckFilterComponent } from '@features/base/components/filter.component';
import { UbckHeaderComponent } from '@features/base/components/header.component';

import { {Feature}Facade } from './{feature}.facade';
import { SearchEvent } from '@core/base/search-event';
// import { {Feature}SummaryComponent } from './components/{feature}-summary/{feature}-summary.component'; // nếu hasSummary:true

@Component({
  selector:        'iam-{feature}',
  standalone:      true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    TranslatePipe,
    Button,
    CmmTypepographyModule,
    IamBadgeStatus,
    IamSearchInput,
    IamTable,
    UbckHeaderComponent,
    UbckFilterComponent,
    // {Feature}SummaryComponent, // nếu hasSummary:true
  ],
  templateUrl: './{feature}.component.html',
  styleUrl:    './{feature}.component.scss',
})
export class {Feature}Component implements OnInit {
  readonly facade    = inject({Feature}Facade);
  readonly destroyRef = inject(DestroyRef);

  // Template refs cho custom column rendering — thêm/bớt theo số cột cần custom
  @ViewChild('searchInputTemplate', { static: true }) searchInputTemplate!: TemplateRef<unknown>;
  @ViewChild('statusTemplate',      { static: true }) statusTemplate!:      TemplateRef<unknown>;
  @ViewChild('editTemplate',        { static: true }) editTemplate!:        TemplateRef<unknown>;
  @ViewChild('ellipsisTemplate',    { static: true }) ellipsisTemplate!:    TemplateRef<unknown>;
  // @ViewChild('toggleTemplate',   { static: true }) toggleTemplate!:      TemplateRef<unknown>; // nếu có toggle

  constructor() {
    this.destroyRef.onDestroy(() => this.facade.destroy());
  }

  ngOnInit(): void {
    this.facade.init();
    this.facade.setupFilterConfig(this.searchInputTemplate);
    this.facade.setupListColumns(this.statusTemplate, this.editTemplate, this.ellipsisTemplate);
  }

  onSearch(event: SearchEvent): void {
    this.facade.handleSearchEvent(event);
  }

  onPageChange(event: UBCKPaginatorState): void {
    this.facade.handlePageChangeEvent(event);
  }

  onExport(): void {
    this.facade.handleExport();
  }
}
```

### HTML — `hasTable:true`

```html
<!-- Header -->
<ubck-header [props]="facade.headerConfig()" />

<!-- Filter bar -->
<ubck-filter
  [searchConfig]="facade.filterConfig()"
  [advSearchConfig]="facade.advFilterConfig()"
  (eventSearch)="onSearch($event)"
/>

<!-- Summary cards (nếu hasSummary:true) -->
<!-- <iam-{feature}-summary [props]="facade.summaryProps()" /> -->

<!-- Data table -->
<iam-table
  [props]="facade.listProps()"
  (onPageChangeEvt)="onPageChange($event)"
/>

<!-- ── Custom column templates ─────────────────────────────────────── -->

<!-- Status badge — IamBadgeStatus nhận [props] với value + list -->
<ng-template #statusTemplate let-row>
  <iam-badge-status [props]="{ value: row.active, list: facade.statusList() }" />
</ng-template>

<!-- Ellipsis text — dùng directive cmmParagraph (từ CmmTypepographyModule), context: let-data let-col="col" -->
<ng-template #ellipsisTemplate let-data let-col="col">
  <p cmmParagraph [ellipsis]="true" [ellipsisRows]="col?.ellipsisRows || 2">
    {{ data || '_' }}
  </p>
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

<!-- Toggle status (bỏ comment nếu cần) -->
<!-- <ng-template #toggleTemplate let-row>
  <p-toggleswitch
    [ngModel]="row.active === 'ACTIVE'"
    (onChange)="facade.onOpenToggleChange(row)"
  />
</ng-template> -->

<!-- Custom search input — dùng IamSearchInput directive ([search-input]), context: let-control="control" -->
<ng-template #searchInputTemplate let-control="control">
  <span
    search-input
    [props]="{ placeholder: '{FEATURE}.SEARCH.PLACEHOLDER' | translate }"
    styleClass="h-[40px]"
    [formControl]="control"
  ></span>
</ng-template>
```

---

### Variant B — `hasTable:false` (không có table)

```typescript
// src/app/features/{feature}/{feature}.component.ts
import { ChangeDetectionStrategy, Component, DestroyRef, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslatePipe } from '@ngx-translate/core';

import { UbckHeaderComponent } from '@features/base/components/header.component';

import { {Feature}Facade } from './{feature}.facade';

@Component({
  selector:        'iam-{feature}',
  standalone:      true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [
    CommonModule,
    TranslatePipe,
    UbckHeaderComponent,
  ],
  templateUrl: './{feature}.component.html',
  styleUrl:    './{feature}.component.scss',
})
export class {Feature}Component implements OnInit {
  readonly facade     = inject({Feature}Facade);
  readonly destroyRef = inject(DestroyRef);

  constructor() {
    this.destroyRef.onDestroy(() => this.facade.destroy());
  }

  ngOnInit(): void {
    this.facade.init();
  }
}
```

### HTML — `hasTable:false`

```html
<!-- Header -->
<ubck-header [props]="facade.headerConfig()" />

<!-- Nội dung tuỳ feature (form, detail view, v.v.) -->
```

---

## 2. Popup / Dialog Component — 2 patterns

> Chọn đúng pattern dựa trên ai cung cấp cancel/save button.

---

### Pattern A — Self-contained popup (popup tự có cancel/save button)

Dùng khi: popup đơn giản, tự xử lý validate & submit bên trong.
- Không dùng `IamDialogFooter` trong `templates`
- Không `extends DialogRegistry`
- Phải dùng `viewChild<CmmDynamicFormComponent>('df')` để validate form
- Khi mở dialog: **bắt buộc** truyền `data: {}` để `IamDialogHeader` không crash khi truy cập `dialogConfig.data.subTitle`

```typescript
// {feature}-popup.component.ts
import { ChangeDetectionStrategy, Component, inject, OnInit, signal, viewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { TranslatePipe, TranslateService } from '@ngx-translate/core';
import { DynamicDialogRef } from 'primeng/dynamicdialog';
import { CmmDynamicFormComponent, CmmDynamicFormModule, DynamicFormItem, ToastService } from '@ubck-core/ui';
import { take } from 'rxjs';
import { Button } from 'primeng/button';
import { {Feature}Service } from '../../service/{feature}.service';
import { create{Feature}Form } from '../../constants/create-{feature}-form';

@Component({
  selector: 'esb-{feature}-popup',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, TranslatePipe, CmmDynamicFormModule, Button],
  templateUrl: './{feature}-popup.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class {Feature}PopupComponent implements OnInit {
  private readonly service = inject({Feature}Service);
  private readonly dialogRef = inject(DynamicDialogRef);
  private readonly toastService = inject(ToastService);
  private readonly translateService = inject(TranslateService);

  readonly df = viewChild<CmmDynamicFormComponent>('df');
  readonly formConfig = signal<DynamicFormItem[]>([]);
  readonly isSubmitting = signal(false);

  ngOnInit(): void {
    this.formConfig.set(create{Feature}Form({}, this.translateService));
  }

  cancel(): void {
    this.dialogRef.close();
  }

  save(): void {
    const form = this.df()?.form();
    form?.markAllAsTouched();
    if (!form || form.invalid) { return; }

    const value = form.getRawValue() as { fieldA: string; fieldB: string };
    this.isSubmitting.set(true);
    this.service.create{Feature}(value).pipe(take(1)).subscribe({
      next: () => {
        this.toastService.show({ severity: 'success', summary: this.translateService.instant('{FEATURE}.CREATE.SUCCESS'), life: 3000 });
        this.dialogRef.close(true);
      },
      error: () => this.isSubmitting.set(false),
    });
  }
}
```

```html
<!-- {feature}-popup.component.html -->
<div class="flex flex-col gap-4 p-6">
  <cmm-dynamic-form #df [config]="formConfig()" />

  <div class="flex items-center justify-end gap-3 border-t border-[#EAECF0] pt-4">
    <p-button [label]="'COMMON.CANCEL' | translate" [outlined]="true" (onClick)="cancel()" />
    <p-button [label]="'{FEATURE}.FORM.SAVE' | translate" [loading]="isSubmitting()" (onClick)="save()" />
  </div>
</div>
```

Khi mở popup (trong facade/component):
```typescript
this.dialogService.open({Feature}PopupComponent, {
  header: '{FEATURE}.POPUP.TITLE',
  data: {},  // BẮT BUỘC — IamDialogHeader crash nếu thiếu
  templates: { header: IamDialogHeader },  // KHÔNG có footer
  width: '560px', modal: true, appendTo: 'body',
  contentStyle: { padding: '0' }, draggable: false,
  closeOnEscape: true, focusOnShow: false, position: 'center',
});
```

---

### Pattern B — Footer-driven popup (IamDialogFooter cung cấp button)

Dùng khi: button confirm/cancel do `IamDialogFooter` render (facade kiểm soát confirm logic).
- Component `extends DialogRegistry`
- Không có cancel/save button trong popup template
- Caller truyền `data: { cancelLabel, confirmLabel, onConfirm, onClose }` vào dialog

```typescript
// {feature}-item.component.ts
import { ChangeDetectionStrategy, Component, viewChild } from '@angular/core';
import { DialogRegistry } from '@core/base/dialog-registry';
import { CmmDynamicFormComponent, CmmDynamicFormModule } from '@ubck-core/ui';

@Component({
  selector: 'iam-{feature}-item',
  standalone: true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [CmmDynamicFormModule],
  templateUrl: './{feature}-item.component.html',
})
export class {Feature}ItemComponent extends DialogRegistry {
  readonly dynamicForm = this.dialogData.dynamicForm;
  readonly df = viewChild<CmmDynamicFormComponent>(CmmDynamicFormComponent);
}
```

```html
<!-- {feature}-item.component.html -->
<div class="p-6">
  <cmm-dynamic-form [config]="dynamicForm()" #df></cmm-dynamic-form>
</div>
```

Khi mở (trong facade):
```typescript
const dialog = this.dialogService.open({Feature}ItemComponent, {
  header: '{FEATURE}.CREATE.TITLE',
  data: {
    dynamicForm: this.createForm,
    cancelLabel: 'COMMON.CANCEL',
    confirmLabel: 'COMMON.BUTTON.SAVE',
    onClose: (ref: DynamicDialogRef) => ref.close(),
    onConfirm: () => this.handleSave(dialog),
  },
  templates: { header: IamDialogHeader, footer: IamDialogFooter },
  width: '800px', modal: true, appendTo: 'body',
  contentStyle: { padding: '0' },
});
```

---

## 3. Summary Component — `{feature}-summary.component.ts`

Hiển thị summary statistics cards (nếu feature có). Dùng `input.required()` và `computed`.

```typescript
// src/app/features/{feature}/components/{feature}-summary/{feature}-summary.component.ts
import { ChangeDetectionStrategy, Component, computed, input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslateModule } from '@ngx-translate/core';

export interface {Feature}SummaryCard {
  label:       string;
  value:       number;
  colorClass?: string;
}

export interface {Feature}SummaryProps {
  cards: {Feature}SummaryCard[];
}

@Component({
  selector:        'iam-{feature}-summary',
  standalone:      true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports:         [CommonModule, TranslateModule],
  templateUrl:     './{feature}-summary.component.html',
  styleUrl:        './{feature}-summary.component.scss',
})
export class {Feature}SummaryComponent {
  readonly props = input.required<Partial<{Feature}SummaryProps>>();

  readonly computedProps = computed<{Feature}SummaryProps>(() => ({
    cards: this.props().cards ?? [],
  }));
}
```

### Summary Component HTML — `{feature}-summary.component.html`

```html
<div class="flex gap-4 flex-wrap mb-4">
  @for (card of computedProps().cards; track card.label) {
    <div class="summary-card flex-1 min-w-[160px] p-4 rounded-xl border">
      <p class="text-sm text-gray-500">{{ card.label | translate }}</p>
      <p class="text-2xl font-bold" [class]="card.colorClass">{{ card.value }}</p>
    </div>
  }
</div>
```

---

## Quy tắc chung

| Rule | Chi tiết |
|---|---|
| `ChangeDetectionStrategy.OnPush` | Bắt buộc cho tất cả components |
| `standalone: true` | Không dùng NgModule |
| `@ViewChild` | Dùng cho TemplateRef custom columns |
| `input.required()` | Cho input bắt buộc trong sub-components |
| `inject()` | Thay `constructor` injection |
| `@for ... track` | Bắt buộc khi dùng `@for` loop |
| `ngAfterViewInit` | Gọi `setupListColumns/setupFilterConfig` sau khi DOM render |

---

## Quy tắc chung

| Rule | Chi tiết |
|---|---|
| `ChangeDetectionStrategy.OnPush` | Bắt buộc cho tất cả components |
| `standalone: true` | Không dùng NgModule |
| `@ViewChild` | Dùng cho TemplateRef custom columns (chỉ khi `hasTable:true`) |
| `input.required()` | Cho input bắt buộc trong sub-components |
| `inject()` | Thay `constructor` injection |
| `@for ... track` | Bắt buộc khi dùng `@for` loop |
| `ngAfterViewInit` | Gọi `setupListColumns/setupFilterConfig` sau khi DOM render (chỉ khi `hasTable:true`) |

---

## Checklist sau khi gen

- [ ] Thay `{Feature}`, `{feature}`, `{featureCamel}` bằng tên thực tế
- [ ] Cập nhật `imports[]` — chỉ import những component thực sự dùng
- [ ] **hasTable:true** → dùng Variant A: có `IamTableComponent`, `@ViewChild` refs, `ngAfterViewInit`, `<iam-table>` trong HTML
- [ ] **hasTable:false** → dùng Variant B: component tối giản, không có bất kỳ code table nào
- [ ] Thêm/bớt `@ViewChild` templates theo số lượng cột custom (chỉ khi `hasTable:true`)
- [ ] Nếu không có summary → bỏ comment `{Feature}SummaryComponent` khỏi imports và HTML
- [ ] Nếu có toggle → uncomment `@ViewChild('toggleTemplate')` và `<ng-template #toggleTemplate>`
- [ ] Kiểm tra selector prefix (`iam-` vs `esb-` vs custom) cho đúng convention dự án
- [ ] Popup Pattern A (self-contained): dùng `viewChild<CmmDynamicFormComponent>('df')` + `(onClick)="save()"` — KHÔNG dùng `(formSubmit)` hay `type="submit"` ngoài form
- [ ] Popup Pattern A: khi mở dialog luôn truyền `data: {}` để `IamDialogHeader` không crash
- [ ] Popup Pattern A: chỉ dùng `templates: { header: IamDialogHeader }` (KHÔNG thêm `footer: IamDialogFooter`)
- [ ] `cmm-dynamic-form` dùng `[config]` (KHÔNG phải `[formConfig]`, `[formItems]`, `[items]`) — luôn thêm `#df`
- [ ] Mọi import trong file `.ts` phải có mặt trong `imports[]` của `@Component` nếu dùng trong template
- [ ] Signal + ngModel: dùng `[ngModel]="signal()" (ngModelChange)="signal.set($event)"` — KHÔNG dùng `[(ngModel)]="signal"`
- [ ] PrimeNG standalone: `Select` từ `primeng/select`, `ProgressSpinnerModule` từ `primeng/progressspinner`, `ToggleSwitchModule` từ `primeng/toggleswitch`
- [ ] `esb-tabs`: dùng `(tabChange)="handler($event)"` — KHÔNG dùng `(activeChange)` hay `(activeValueChange)`. Pattern chuẩn: `<esb-tabs [props]="tabsProps()" [activeValue]="activeTab()" (tabChange)="setActiveTab($event)" />`
