---
name: gen-component
description: Tạo Angular component files (main component, item dialog, optional summary) cho feature ESB-FE. Dùng khi user yêu cầu tạo component, UI layer, hoặc dialog cho feature.
argument-hint: "<FeatureName> [hasSummary:true|false] [hasTable:true|false]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo component files cho feature: **$ARGUMENTS**

_(Định dạng input: `<FeatureName> [hasSummary:true|false] [hasTable:true|false]` — ví dụ: `Region` hoặc `Region hasSummary:true hasTable:true`)_
_(Mặc định: `hasSummary:false`, `hasTable:true`)_

---

## Thực hiện

1. Đọc skill file tại `.claude/skills/gen-component.md`
2. Parse input để xác định:
   - FeatureName, feature-name
   - hasSummary: có tạo summary component không (default: false)
   - hasTable: có tích hợp `iam-table` không (default: true)
3. Nếu `hasTable:true`: đọc thêm `.claude/skills/iam-table-integration.md` để lấy pattern table cho component
4. Kiểm tra facade đã tồn tại chưa tại `src/app/features/{feature-name}/{feature-name}.facade.ts`
5. Áp dụng skill để tạo:

   **Main component:**
   - `src/app/features/{feature-name}/{feature-name}.component.ts`
   - `src/app/features/{feature-name}/{feature-name}.component.html`
   - `src/app/features/{feature-name}/{feature-name}.component.scss`

   **Item dialog component:**
   - `src/app/features/{feature-name}/components/{feature-name}-item/{feature-name}-item.component.ts`
   - `src/app/features/{feature-name}/components/{feature-name}-item/{feature-name}-item.component.html`
   - `src/app/features/{feature-name}/components/{feature-name}-item/{feature-name}-item.component.scss`

   **Summary component (nếu hasSummary:true):**
   - `src/app/features/{feature-name}/components/{feature-name}-summary/{feature-name}-summary.component.ts`
   - `src/app/features/{feature-name}/components/{feature-name}-summary/{feature-name}-summary.component.html`
   - `src/app/features/{feature-name}/components/{feature-name}-summary/{feature-name}-summary.component.scss`

6. Điều chỉnh code theo cờ `hasTable`:

   **Khi `hasTable:true`** — áp dụng phần A từ `iam-table-integration.md`:
   - Thêm `IamTable` vào `imports[]` (import từ `@components/iam-table/iam-table.component`)
   - Thêm `OnInit` vào `implements` (KHÔNG dùng `AfterViewInit`)
   - Khai báo các `@ViewChild` với `{ static: true }` (searchInputTemplate, statusTemplate, editTemplate, ellipsisTemplate)
   - Gọi `setupFilterConfig` + `setupListColumns` trong `ngOnInit` (sau `facade.init()`)
   - Thêm handler `onPageChange(event: UBCKPaginatorState)`
   - HTML: thêm `<iam-table [props]="facade.listProps()" (onPageChangeEvt)="onPageChange($event)" />`
   - HTML: thêm các `<ng-template>` cho custom columns (status, ellipsis, edit, searchInput)

   **Khi `hasTable:false`** — component tối giản:
   - Không import `IamTableComponent`
   - Không có `@ViewChild` template refs
   - Không implement `AfterViewInit`, không có `ngAfterViewInit`
   - Không có `<iam-table>` trong HTML
   - Không có `<ng-template>` custom columns

7. Đảm bảo: `ChangeDetectionStrategy.OnPush`, standalone, `inject()` thay constructor injection
8. Tạo files thực tế

Sau khi tạo, liệt kê files đã tạo kèm ghi chú `hasTable` đã áp dụng.

---

## Verify trước khi bàn giao

```bash
pnpm lint src/app/features/{feature-name}/
```

Nếu có lỗi → chạy `pnpm lint-fix` để auto-fix, sau đó fix thủ công phần còn lại. Chỉ báo cáo "Done" khi lint **pass**.
