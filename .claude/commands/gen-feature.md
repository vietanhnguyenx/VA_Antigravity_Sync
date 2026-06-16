---
name: gen-feature
description: Scaffold toàn bộ feature CRUD mới (~15–17 files: DTO, constants, service, facade, components, routes, mock) theo đúng architecture ESB-FE. Dùng khi bắt đầu một feature hoàn toàn mới từ đầu.
argument-hint: "<FeatureName> [field1:type, field2:type, ...]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE. Nhiệm vụ: scaffold toàn bộ một feature mới theo kiến trúc chuẩn của dự án.

**Input:** $ARGUMENTS
_(Định dạng: `<FeatureName> [field1:type, field2:type, ...]` — ví dụ: `Region code:string,name:string,active:string`)_

---

## Bước 0 — Parse input

Từ `$ARGUMENTS`, xác định:
- **FeatureName** (PascalCase): tên class, ví dụ `Region`
- **featureName** (camelCase): ví dụ `region`
- **feature-name** (kebab-case): ví dụ `region`
- **FEATURE_NAME** (UPPER_SNAKE_CASE): ví dụ `REGION`
- **Fields**: danh sách field của entity (dùng để tạo DTO và form)

Nếu không có fields, dùng bộ mặc định: `id:string, code:string, name:string, active:string, updatedAt:string, updatedBy:string`

---

## Bước 1 — Đọc tất cả skill files

Đọc lần lượt các file sau (KHÔNG bỏ qua bước nào):
1. `.claude/skills/gen-dto.md`
2. `.claude/skills/gen-constants.md`
3. `.claude/skills/gen-api-service.md`
4. `.claude/skills/gen-facade.md`
5. `.claude/skills/gen-component.md`
6. `.claude/skills/gen-routes.md`

---

## Bước 2 — Tạo files theo thứ tự dependency

Tạo files theo đúng thứ tự sau (vì các file sau import các file trước):

### 2.1 — DTOs (`src/app/features/{feature-name}/dto/`)
Theo skill `gen-dto.md`, tạo:
- `{feature-name}-item.ts` — Item interface + Delete interface
- `{feature-name}-detail.ts` — Detail interface (đầy đủ fields)
- `{feature-name}-search.ts` — SearchRequest, SearchResponse, IBaseApiResponse, SummaryResponse
- `{feature-name}-status-change.ts` — StatusChange interface

### 2.2 — Constants (`src/app/features/{feature-name}/constants/`)
Theo skill `gen-constants.md`, tạo:
- `{feature-name}-permissions.ts` — PERMISSION_KEY + withFeaturePer()
- `{feature-name}-status.ts` — STATUS_LIST
- `list-columns.ts` — FEATURE_LIST_COLUMNS (với status, edit, ellipsis templates)
- `search-config.ts` — SEARCH_FORM_CONFIG + ADV_SEARCH_FORM_CONFIG

### 2.3 — Service (`src/app/features/{feature-name}/service/`)
Theo skill `gen-api-service.md`, tạo:
- `{feature-name}-api.const.ts` — createFeatureApi() factory
- `{feature-name}.service.ts` — CRUD + export + toggleStatus methods

### 2.4 — Facade (`src/app/features/{feature-name}/`)
Theo skill `gen-facade.md`, tạo:
- `{feature-name}.facade.ts` — signals, computed, CRUD handlers

### 2.5 — Components (`src/app/features/{feature-name}/`)
Theo skill `gen-component.md`, tạo:
- `{feature-name}.component.ts` + `.html` + `.scss`
- `components/{feature-name}-item/{feature-name}-item.component.ts` + `.html` + `.scss`

### 2.6 — Routes (`src/app/features/{feature-name}/`)
Theo skill `gen-routes.md`, tạo:
- `routes.ts` — lazy load, route-level providers, permissionGuard

### 2.7 — Mock Service (`src/app/features/{feature-name}/service/`)
Theo skill `gen-mock.md`, tạo:
- `{feature-name}.mock.ts` — mock data 10 items thực tế phù hợp domain
- `{feature-name}.service.mock.ts` — extends service, override tất cả HTTP methods
Cập nhật `routes.ts` để wire `{ provide: {FeatureName}Service, useClass: {FeatureName}MockService }`.

---

## Bước 3 — Verify trước khi bàn giao

Sau khi tạo xong tất cả files, **bắt buộc** chạy lint và type-check:

```bash
# 1. Lint (Biome) — fix tất cả lỗi trước khi report
pnpm lint src/app/features/{feature-name}/

# 2. TypeScript errors — chỉ lọc lỗi trong feature vừa tạo
pnpm exec tsc --noEmit --skipLibCheck 2>&1 | grep "features/{feature-name}" | head -30
```

- Nếu có lỗi lint → chạy `pnpm lint-fix src/app/features/{feature-name}/` để auto-fix, sau đó fix thủ công phần còn lại
- Nếu có lỗi TypeScript → fix trước khi báo cáo kết quả
- Chỉ báo cáo "hoàn thành" khi cả lint và tsc **pass không có lỗi**

---

## Bước 4 — Báo cáo kết quả

Sau khi tạo xong, liệt kê tất cả files theo dạng:

```
✅ Files đã tạo cho feature {FeatureName}:

dto/
  ├── {feature-name}-item.ts
  ├── {feature-name}-detail.ts
  ├── {feature-name}-search.ts
  └── {feature-name}-status-change.ts

constants/
  ├── {feature-name}-permissions.ts
  ├── {feature-name}-status.ts
  ├── list-columns.ts
  └── search-config.ts

service/
  ├── {feature-name}-api.const.ts
  └── {feature-name}.service.ts

{feature-name}.facade.ts
{feature-name}.component.ts / .html / .scss

components/
  └── {feature-name}-item/
      └── {feature-name}-item.component.ts / .html / .scss

routes.ts

📋 Bước tiếp theo:
1. Đăng ký routes vào app routing
2. Thêm i18n keys vào translation files
3. Kiểm tra API endpoint đúng với backend
```
