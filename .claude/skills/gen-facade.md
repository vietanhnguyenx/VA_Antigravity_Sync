---
name: skill-gen-facade
description: Reference implementation templates cho facade service generation (Angular signals, computed props, CRUD handlers, dialog management, table integration). Đọc khi lệnh gen-facade cần code templates chi tiết.
---

# Skill: Gen Facade

Tạo `{feature}.facade.ts` — trung tâm điều phối state và business logic của một feature.

**Reference:** `src/app/features/external-integration/external-integration.facade.ts`

---

## Template

```typescript
// src/app/features/{feature}/{feature}.facade.ts
import { computed, inject, Injectable, Signal, signal, TemplateRef } from '@angular/core';
import { PermissionStore } from '@ubck-core/common';
import {
  ColumnDefinition,
  CommonDialogService,
  DIALOG_ICON_ENUM,
  DialogDeleteComponent,
  DynamicFormItem,
  ToastService,
  UBCKPaginatorState,
  getFormGroupFromDialogInstance,
} from '@ubck-core/ui';
import { TranslateService } from '@ngx-translate/core';
import { FormControl, FormGroup } from '@angular/forms';
import { catchError, Observable, take, tap } from 'rxjs';
import { DynamicDialogRef } from 'primeng/dynamicdialog';

import { IAMTableProps } from '@components/iam-table/iam-table.types';
import { PaginationConstants } from '@core/base/pagination';
import { SearchEvent } from '@core/base/search-event';
import { CommonStatusEnum } from '@core/base/status';
import { DEFAULT_SEARCH_RESULT } from '@core/constants/default-search-result';
import { PERMISSION_KEYS_ENUM } from '@core/constants/role';
import { HeaderModel } from '@features/base/models/header-model';
import { IamProps } from '@core/pipe/status-mapping';
import { calculatePageSizeWithCurrentPage } from '@utils/calculate-page-size';
import { exportFilexExcel } from '@utils/export-filex-excel';
import { validatorsCommonTextArea } from '@utils/validators-common.util';
import { escapeHtml } from '@core/utils/escape-HTML';
import { IamDialogHeader } from '@components/templates/dialog-header';
import { IamDialogFooter } from '@components/templates/dialog-footer';

import { {Feature}Service, {FEATURE}_REQUEST_ID } from './service/{feature}.service';
import { {Feature}ItemComponent } from './components/{feature}-item/{feature}-item.component';
import { {FEATURE}_PERMISSION_KEY, with{Feature}Per } from './constants/{feature}-permissions';
import { {FEATURE}_STATUS_LIST } from './constants/{feature}-status';
import { {FEATURE}_LIST_COLUMNS } from './constants/list-columns';
import { SEARCH_FORM_CONFIG, ADV_SEARCH_FORM_CONFIG } from './constants/search-config';
import { create{Feature}Form } from './constants/create-{feature}-form';
import { Search{Feature}Request, Search{Feature}Response, IBaseApiResponse } from './dto/{feature}-search';
import { {Feature}Detail } from './dto/{feature}-detail';
import { {Feature}Item, Delete{Feature} } from './dto/{feature}-item';
import { StatusChange } from './dto/{feature}-status-change';

const DEFAULT_{FEATURE}_SUMMARY = {
  // định nghĩa giá trị mặc định cho summary
};

@Injectable()
export class {Feature}Facade {
  // ── Injections ────────────────────────────────────────────────────────────
  private readonly {feature}Service       = inject({Feature}Service);
  private readonly commonDialogService    = inject(CommonDialogService);
  private readonly translateService       = inject(TranslateService);
  private readonly toastService           = inject(ToastService);
  private readonly permissionStore        = inject(PermissionStore);

  // ── State Signals ─────────────────────────────────────────────────────────
  // [TABLE ONLY — bỏ khi hasTable:false] ────────────────────────────────────
  readonly pagination  = signal<Partial<UBCKPaginatorState>>({
    currentPage:   PaginationConstants.DEFAULT_PAGE,
    recordPerPage: PaginationConstants.DEFAULT_PAGE_SIZE,
  });
  readonly columns = signal<ColumnDefinition[][]>([]);
  readonly list    = signal<Search{Feature}Response>(DEFAULT_SEARCH_RESULT);
  // [/TABLE ONLY] ────────────────────────────────────────────────────────────
  readonly searchRequest = signal<Search{Feature}Request>({});
  readonly statusList    = signal<IamProps[]>({FEATURE}_STATUS_LIST);
  readonly summary       = signal(DEFAULT_{FEATURE}_SUMMARY);
  readonly itemSelected  = signal<{Feature}Detail | undefined>(undefined);

  // ── Filter config (set sau khi ViewChild sẵn sàng) ───────────────────────
  // [TABLE ONLY — bỏ khi hasTable:false] ────────────────────────────────────
  filterConfig!:    Signal<DynamicFormItem[]>;
  advFilterConfig!: Signal<DynamicFormItem[]>;
  // [/TABLE ONLY] ────────────────────────────────────────────────────────────

  // ── Computed ──────────────────────────────────────────────────────────────
  // [TABLE ONLY — bỏ khi hasTable:false] ────────────────────────────────────
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
  // [/TABLE ONLY] ────────────────────────────────────────────────────────────

  readonly headerConfig = computed<HeaderModel>(() => {
    this.permissionStore.permissions();
    // const canCreate = this.permissionStore.canAccess(with{Feature}Per({FEATURE}_PERMISSION_KEY.{FEATURE}_VIEW_CREATE));
    return {
      title:         '{FEATURE}.TITLE',
      subtitle:      '',
      actionHeaders: [
        // {
        //   label:     'COMMON.BUTTON.CREATE',
        //   onClick:   () => this.handleOpenDialogCreate(),
        //   disabled:  !canCreate,
        //   variant:   'filled',
        // },
      ],
    };
  });

  readonly createForm = computed<DynamicFormItem[]>(() =>
    create{Feature}Form(this.itemSelected, this.translateService),
  );

  // ── Lifecycle ─────────────────────────────────────────────────────────────
  init(): void {
    this.search();
    // this.loadSummary();
  }

  destroy(): void {
    this.reset();
  }

  reset(): void {
    this.searchRequest.set({});
    // [TABLE ONLY — bỏ khi hasTable:false] ──────────────────────────────────
    this.pagination.set({
      currentPage:   PaginationConstants.DEFAULT_PAGE,
      recordPerPage: PaginationConstants.DEFAULT_PAGE_SIZE,
    });
    this.columns.set([]);
    this.list.set(DEFAULT_SEARCH_RESULT);
    // [/TABLE ONLY] ──────────────────────────────────────────────────────────
    this.itemSelected.set(undefined);
    this.summary.set(DEFAULT_{FEATURE}_SUMMARY);
  }

  // ── Setup (gọi từ ngAfterViewInit của component, sau khi ViewChild sẵn sàng)
  // [TABLE ONLY — bỏ khi hasTable:false] ────────────────────────────────────
  setupFilterConfig(searchTemplate: TemplateRef<unknown>): void {
    this.filterConfig    = computed(() => SEARCH_FORM_CONFIG(searchTemplate));
    this.advFilterConfig = computed(() => ADV_SEARCH_FORM_CONFIG(this.translateService));
  }

  setupListColumns(
    statusTemplate:   TemplateRef<unknown>,
    editTemplate:     TemplateRef<unknown>,
    ellipsisTemplate: TemplateRef<unknown>,
    // toggleTemplate?: TemplateRef<unknown>, // thêm nếu có toggle column
  ): void {
    this.columns.set({FEATURE}_LIST_COLUMNS(statusTemplate, editTemplate, ellipsisTemplate));
  }
  // [/TABLE ONLY] ────────────────────────────────────────────────────────────

  // ── Search & Pagination ───────────────────────────────────────────────────
  // [TABLE ONLY — bỏ khi hasTable:false] ────────────────────────────────────
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

    // Reset list trước khi search để tránh stale data
    this.list.update((prev) => ({ ...prev, elementList: [] }));

    this.{feature}Service
      .search{Feature}(body, pagination)
      .pipe(take(1))
      .subscribe({
        next: (res) => this.list.set(res),
      });
  }
  // [/TABLE ONLY] ────────────────────────────────────────────────────────────

  // ── Export ────────────────────────────────────────────────────────────────
  handleExport(): void {
    this.{feature}Service
      .export{Feature}(this.searchRequest())
      .pipe(take(1))
      .subscribe({
        next: (res) => exportFilexExcel(res.blob, res.fileName || '{FEATURE}.xlsx'),
      });
  }

  // ── Create / Edit Dialog ──────────────────────────────────────────────────
  handleOpenDialogCreate(): void {
    this.handleOpenDialogCreateOrEdit();
  }

  handleOpenDialogEdit(row: {Feature}Detail): void {
    this.itemSelected.set(row);
    this.handleOpenDialogCreateOrEdit(row);
  }

  private handleOpenDialogCreateOrEdit(row?: {Feature}Detail): void {
    this.itemSelected.set(row);

    const dialog = this.commonDialogService.open({Feature}ItemComponent, {
      width:  '800px',
      modal:  true,
      appendTo: 'body',
      contentStyle: { padding: '0' },
      header: row ? '{FEATURE}.EDIT.TITLE' : '{FEATURE}.CREATE.TITLE',
      templates: { header: IamDialogHeader, footer: IamDialogFooter },
      data: {
        dynamicForm:   this.createForm,
        confirmLabel:  'COMMON.BUTTON.SAVE',
        onConfirm:     () => this.handleCreateOrEdit(dialog, row),
      },
    });
  }

  handleCreateOrEdit(dialog: DynamicDialogRef, row?: {Feature}Detail): void {
    const form = getFormGroupFromDialogInstance(this.commonDialogService, dialog);
    form.markAllAsTouched();
    if (form.invalid) return;

    const data = form.getRawValue() as {Feature}Item;
    if (row) {
      this.handleEdit({ ...data, id: row.id } as {Feature}Detail, dialog);
    } else {
      this.handleCreate(data, dialog);
    }
  }

  private handleCreate(data: {Feature}Item, dialog: DynamicDialogRef): void {
    this.{feature}Service
      .create{Feature}(data)
      .pipe(take(1))
      .subscribe({
        next: () => {
          this.toastService.show({ severity: 'success', summary: this.translateService.instant('COMMON.CREATE_SUCCESS'), life: 3000 });
          dialog.close();
          this.resetPageAndSearch();
        },
      });
  }

  private handleEdit(data: {Feature}Detail, dialog: DynamicDialogRef): void {
    this.{feature}Service
      .update{Feature}(data.id, data)
      .pipe(take(1))
      .subscribe({
        next: () => {
          this.toastService.show({ severity: 'success', summary: this.translateService.instant('COMMON.UPDATE_SUCCESS'), life: 3000 });
          dialog.close();
          this.resetPageAndSearch();
        },
      });
  }

  // ── Delete Dialog ─────────────────────────────────────────────────────────
  handleOpenDialogDelete(row: {Feature}Detail): void {
    const dialog = this.commonDialogService.openDialogWithRef(DialogDeleteComponent, {
      appendTo:     'body',
      titleConfirm: this.translateService.instant('{FEATURE}.DELETE_CONFIRM', {
        name: escapeHtml(row?.name),
        code: escapeHtml(row?.code),
      }),
      btnConfirmLabel:  'COMMON.BUTTON.CONFIRM',
      btnCancelLabel:   'COMMON.BUTTON.CANCEL',
      iconType:         DIALOG_ICON_ENUM.WARNING,
      closeHandler:     () => dialog.close(),
      submitHandler:    (dialogRef: DynamicDialogRef, data: any) => {
        if (!data.value.reason?.trim()) { return; }
        this.handleDelete({ id: row.id, reason: data.value.reason } as Delete{Feature}, dialogRef);
      },
      reasonLabel:       'COMMON.REASON',
      placeholderReason: 'COMMON.DIALOG.REASON_PLACEHOLDER',
      maxLength:         255,
      formGrDelete: new FormGroup({ reason: new FormControl('', validatorsCommonTextArea()) }),
    });
  }

  private handleDelete(body: Delete{Feature}, dialogRef: DynamicDialogRef): void {
    this.{feature}Service
      .delete{Feature}(body)
      .pipe(take(1))
      .subscribe({
        next: () => {
          this.toastService.show({ severity: 'success', summary: this.translateService.instant('COMMON.DELETE_SUCCESS'), life: 3000 });

          const newPage = calculatePageSizeWithCurrentPage(
            this.list()?.totalElements || 0,
            this.pagination().recordPerPage || PaginationConstants.DEFAULT_PAGE_SIZE,
            this.pagination().currentPage  || PaginationConstants.DEFAULT_PAGE,
          );
          this.pagination.update((s) => ({ ...s, currentPage: newPage }));
          this.search();
          dialogRef.close();
        },
      });
  }

  // ── Toggle Status ─────────────────────────────────────────────────────────
  onOpenToggleChange(row: {Feature}Detail): void {
    const action = row.active === CommonStatusEnum.ACTIVE
      ? this.translateService.instant('COMMON.TOGGLE_CONFIRM.DISABLE')
      : this.translateService.instant('COMMON.TOGGLE_CONFIRM.ENABLE');

    const dialog = this.commonDialogService.openDialogWithRef(DialogDeleteComponent, {
      appendTo:     'body',
      titleConfirm: this.translateService.instant('{FEATURE}.TOGGLE_CONFIRM.TITLE', {
        action,
        name: escapeHtml(row.name),
        code: escapeHtml(row.code),
      }),
      btnConfirmLabel:  'COMMON.BUTTON.CONFIRM',
      btnCancelLabel:   'COMMON.BUTTON.CANCEL',
      iconType:         DIALOG_ICON_ENUM.WARNING,
      closeHandler:     () => dialog.close(),
      submitHandler:    (dialogRef: DynamicDialogRef, data: any) => {
        if (!data.getRawValue()?.reason?.trim()) { return; }
        this.toggleStatus(row, data.getRawValue(), dialogRef);
      },
      reasonLabel:       'COMMON.REASON',
      placeholderReason: 'COMMON.DIALOG.REASON_PLACEHOLDER',
      maxLength:         255,
      formGrDelete: new FormGroup({ reason: new FormControl('', validatorsCommonTextArea()) }),
    });
  }

  private toggleStatus(row: {Feature}Detail, data: StatusChange, dialog: DynamicDialogRef): void {
    const nextActive = row.active === CommonStatusEnum.ACTIVE ? CommonStatusEnum.INACTIVE : CommonStatusEnum.ACTIVE;

    this.{feature}Service
      .toggle{Feature}Status(row.id, { active: nextActive, reason: data.reason })
      .pipe(take(1))
      .subscribe({
        next: () => {
          this.toastService.show({ severity: 'success', summary: this.translateService.instant('COMMON.TOGGLE_SUCCESS'), life: 3000 });
          this.resetPageAndSearch();
          dialog.close();
        },
      });
  }

  // ── Helpers ───────────────────────────────────────────────────────────────
  private resetPageAndSearch(): void {
    this.pagination.set({
      currentPage:   PaginationConstants.DEFAULT_PAGE,
      recordPerPage: this.pagination().recordPerPage,
    });
    this.search();
  }
}
```

---

## Checklist sau khi gen

- [ ] Thay tất cả placeholders: `{Feature}`, `{feature}`, `{FEATURE}`, `{featureCamel}`
- [ ] **hasTable:true** → giữ tất cả sections `[TABLE ONLY]`; **hasTable:false** → xoá chúng
- [ ] Xoá methods không cần (vd: không có toggle thì xoá `onOpenToggleChange`)
- [ ] Điều chỉnh `Search{Feature}Request` body fields theo form config thực tế
- [ ] Cập nhật `scrollHeight` trong `listProps` theo chiều cao thực tế của layout (chỉ khi `hasTable:true`)
- [ ] Nếu có summary cards: thêm `loadSummary()` và `summaryProps = computed(...)`
- [ ] Nếu cần permission check trong `headerConfig`: uncomment và thêm `canAccess` calls
- [ ] Nếu có toggle column: thêm tham số `toggleTemplate` vào `setupListColumns`
- [ ] Tất cả `if (x) return;` phải có braces: `if (x) { return; }` — Biome `useBlockStatements` bắt buộc
- [ ] `resolveSelectValue()` trả `string | number | null` — khi gán vào field `string | null` phải cast: `as string | null`
- [ ] Không inject `DestroyRef` nếu không thực sự dùng `destroyRef.onDestroy()`
