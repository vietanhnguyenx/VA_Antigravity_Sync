---
name: gen-facade
description: Tạo facade service với Angular signal state management cho feature ESB-FE. Dùng khi tạo mới hoặc cập nhật state management và business logic layer của feature.
argument-hint: "<FeatureName> [hasTable:true|false]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo facade file cho feature: **$ARGUMENTS**

_(Định dạng input: `<FeatureName> [hasTable:true|false]` — ví dụ: `Region` hoặc `Region hasTable:false`)_
_(Mặc định: `hasTable:true`)_

---

## Thực hiện

1. Đọc skill file tại `.claude/skills/gen-facade.md`
2. Parse input để xác định:
   - FeatureName, feature-name
   - hasTable: có sinh table props/signals/methods không (default: true)
3. Nếu `hasTable:true`: đọc thêm `.claude/skills/iam-table-integration.md` phần B để lấy pattern facade table
4. Kiểm tra xem các files sau đã tồn tại chưa (facade cần import chúng):
   - `src/app/features/{feature-name}/service/{feature-name}.service.ts`
   - `src/app/features/{feature-name}/dto/{feature-name}-search.ts`
   - `src/app/features/{feature-name}/constants/{feature-name}-permissions.ts`
   - `src/app/features/{feature-name}/constants/{feature-name}-status.ts`
   - Nếu `hasTable:true`: `src/app/features/{feature-name}/constants/list-columns.ts`
   - Nếu `hasTable:true`: `src/app/features/{feature-name}/constants/search-config.ts`
5. Áp dụng skill để tạo:
   - `src/app/features/{feature-name}/{feature-name}.facade.ts`
6. Điều chỉnh code theo cờ `hasTable`:

   **Khi `hasTable:true`** — thêm đầy đủ table integration từ `iam-table-integration.md` phần B:
   - Signals: `pagination`, `columns`, `list`
   - Filter config signals: `filterConfig`, `advFilterConfig`
   - Computed: `listProps`
   - Methods: `setupFilterConfig`, `setupListColumns`, `handlePageChangeEvent`, `handleSearchEvent`, `search`
   - Trong `reset()`: reset `columns`, `list`, `pagination`
   - Trong `init()`: gọi `search()`

   **Khi `hasTable:false`** — facade tối giản:
   - Không có `columns`, `list` signals
   - Không có `filterConfig`, `advFilterConfig`
   - Không có `listProps` computed
   - Không có `setupFilterConfig`, `setupListColumns`, `handlePageChangeEvent`, `handleSearchEvent`, `search`
   - Chỉ giữ: `pagination` signal (nếu cần), `headerConfig`, `createForm`, CRUD dialog methods

7. Điều chỉnh imports cho đúng với files thực tế đã tồn tại
8. Tạo file thực tế (không chỉ in template)

Sau khi tạo, liệt kê file đã tạo, ghi chú `hasTable` đã áp dụng, và các imports cần kiểm tra.

---

## Verify trước khi bàn giao

```bash
pnpm lint src/app/features/{feature-name}/{feature-name}.facade.ts
```

Nếu có lỗi → chạy `pnpm lint-fix` để auto-fix, sau đó fix thủ công phần còn lại. Chỉ báo cáo "Done" khi lint **pass**.
