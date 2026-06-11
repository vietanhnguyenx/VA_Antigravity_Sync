# Angular Development Rules
description: This file describes the Angular development guidelines for the project.
globs: **/*.ts, **/*.html, **/*.scss

Framework Version: Angular 21
Architecture Rules:
1. Use standalone components
2. Use Angular signals for state management
3. Prefer functional route guards
4. Avoid NgModules unless required
5. Use OnPush change detection
6. Use @if and @for control flow syntax
7. Follow feature-based folder structure
8. Avoid large components (max 200 lines)
9. Use consistent naming conventions
10. Facade service for group of related logic, each component should have its own facade service, avoid sharing facade services across components
11. Store state in services to save state across routes
12. Refer feature src/app/features/external-integration to create new features
13. Features should place in src/app/features, avoid placing features in src/app/core or src/app/shared
14. Create Unit tests for components, services, and other classes using Jasmine and Karma
15. Create E2E tests using Cypress
16. Use Angular CLI for code generation and project management
17. Service only inject services into components/route providers, avoid injecting services into other services
18. Use Angular primeng 21 for UI components, avoid using other UI libraries
19. Import table component as `IamTable` (not `IamTableComponent`) from `@components/iam-table/iam-table.component`
20. Use `TranslatePipe` (not `TranslateModule`) from `@ngx-translate/core`
21. Always add `{ static: true }` to `@ViewChild` TemplateRef declarations; call setup methods in `ngOnInit` (not `ngAfterViewInit`)
22. Use `DestroyRef + destroyRef.onDestroy()` pattern for cleanup — do not implement `OnDestroy` / `ngOnDestroy`
23. Import `DialogRegistry` from `@core/base/dialog-registry`; dialog item components use `CmmDynamicFormModule` (not `CommonModule`)
24. Form config factory functions must accept `Signal<Detail | undefined>` (not plain object/null); wrap return value in `processFormConfig()` from `@utils/process-dynamic-form-config`
25. Use `validatorsCommon()` / `validatorsCommonTextArea()` from `@utils/validators-common.util` instead of manually composing `Validators.required + scriptPatternValidator()`
26. `DynamicFieldTypes.NUMBER` does not exist in this project — use `TEXT` + `Validators.pattern(/^\d+(\.\d+)?$/)` for numeric fields
27. `ubck-header` component uses `[props]` input binding; `ubck-filter` emits `(eventSearch)` output (not `(onSearch)`)
28. After generating any feature files, run `pnpm lint src/app/features/{feature-name}/` and fix all errors before handover
29. `IamBadgeStatus` uses a single `[props]` input: `[props]="{ value: row.active, list: facade.statusList() }"` — no `[status]` or `[statusList]` inputs exist
30. Ellipsis column template uses directive `cmmParagraph` on `<p>` (from `CmmTypepographyModule`) — `cmm-paragraph` tag does not exist; template context is `let-data let-col="col"`
31. Search input template uses `IamSearchInput` directive (`[search-input]`) with `let-control="control"` context — do not use plain `<input pInputText>`; main component must import `FormsModule`, `ReactiveFormsModule`, `Button`, `CmmTypepographyModule`, `IamBadgeStatus`, `IamSearchInput` from their respective paths
32. `cmm-dynamic-form` uses `[config]` input (not `[formItems]`); always add template ref `#df`: `<cmm-dynamic-form [config]="dynamicForm()" #df></cmm-dynamic-form>`
33. Use tailwindcss for styling; avoid using inline styles or other CSS frameworks
34. Use props pattern for component inputs; avoid using multiple individual inputs for related data, and computedProps pattern for computed inputs
35. Dialog popup with own cancel/save buttons: do NOT pass `footer: IamDialogFooter` in `templates`; always pass `data: {}` when using `templates: { header: IamDialogHeader }` to prevent `IamDialogHeader` crash on `dialogConfig.data.subTitle`
36. Form submission in popup: use `viewChild<CmmDynamicFormComponent>('df')` + `this.df()?.form()?.markAllAsTouched()` + `this.df()?.form()?.getRawValue()` in an `(onClick)` handler — do NOT use `(formSubmit)` output or `type="submit"` button outside the form
37. Angular signals + ngModel two-way binding: use `[ngModel]="signal()" (ngModelChange)="signal.set($event)"` — `[(ngModel)]="signal"` does NOT work with signals
38. PrimeNG standalone imports: use `Select` from `primeng/select` for `p-select`; `ProgressSpinnerModule` from `primeng/progressspinner` for `p-progressSpinner`; `ToggleSwitchModule` from `primeng/toggleswitch` for `p-toggleswitch`
39. Biome `useBlockStatements`: ALL `if/else/for/while` bodies must use `{ }` — never `if (x) return;`, always `if (x) { return; }`
40. `resolveSelectValue()` returns `string | number | null`; when assigning to a `string | null` field, always cast: `as string | null`
41. Never inject `DestroyRef` unless you actually call `destroyRef.onDestroy()`; never inject `DynamicDialogConfig` unless you access `this.dialogConfig.data` directly — use `DialogRegistry` base class instead
42. `cmm-dynamic-form` ONLY accepts `[config]` input (type `DynamicFormItem[]`); there is no `[formConfig]`, `[formItems]`, or `(formSubmit)` output; always add `#df` template ref and use `viewChild<CmmDynamicFormComponent>('df')` for imperative form access
43. `IamProps` (from `@core/pipe/status-mapping`) requires `{ value, label, severity }` — `severity` is a required field; there is NO `styleClass` field. Use `severity: 'success' | 'secondary' | 'danger' | 'warn'` matching PrimeNG severity values
44. `esb-tabs` component: use `(tabChange)="handler($event)"` output — NOT `(activeChange)`. The `activeValue` model emits `(activeValueChange)` but `tabChange` is the canonical tab-switch event
45. `DialogDeleteComponent` (from `@ubck-core/ui`) MUST be opened via `this.dialogService.openDialogWithRef(DialogDeleteComponent, { titleConfirm, btnConfirmLabel, btnCancelLabel, iconType, closeHandler, submitHandler })` — NEVER via `open(DialogDeleteComponent, { data: { message, confirmLabel, ... } })`. The component does NOT read from `data`; it reads props directly from the dialog config. For simple toggles without reason: omit `formGrDelete`/`reasonLabel`/`placeholderReason`. Use `COMMON.BUTTON.CONFIRM` / `COMMON.BUTTON.CANCEL` for button labels (not `COMMON.CONFIRM` / `COMMON.CANCEL`). Use `escapeHtml()` from `@core/utils/escape-HTML` on user-provided names in `titleConfirm`. Refer to `external-integration.facade.ts` for the canonical pattern.