---
name: gen-mock
description: Tạo mock service (10 items với realistic data, delay simulation) cho feature ESB-FE đã có real service. Dùng khi cần test UI mà không cần backend, hoặc khi cần demo feature offline.
argument-hint: "<FeatureName>"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE. Nhiệm vụ: tạo mock service cho một feature đã có sẵn.

**Input:** $ARGUMENTS
_(Định dạng: `<FeatureName>` — ví dụ: `Region`, `Currency`)_

---

## Bước 0 — Parse input

Từ `$ARGUMENTS`, xác định:
- **FeatureName** (PascalCase): tên class, ví dụ `Region`
- **featureName** (camelCase): ví dụ `region`
- **feature-name** (kebab-case): ví dụ `region`
- **FEATURE_NAME** (UPPER_SNAKE_CASE): ví dụ `REGION`

---

## Bước 1 — Đọc skill và kiểm tra prerequisites

1. Đọc `.claude/skills/gen-mock.md`
2. Kiểm tra các DTO files đã tồn tại:
   - `src/app/features/{feature-name}/dto/{feature-name}-search.ts`
   - `src/app/features/{feature-name}/dto/{feature-name}-item.ts`
   - `src/app/features/{feature-name}/dto/{feature-name}-detail.ts`
   - `src/app/features/{feature-name}/service/{feature-name}.service.ts`
   - `src/app/features/{feature-name}/routes.ts`

   Nếu thiếu bất kỳ file nào → dừng lại và thông báo cho user.

3. Đọc DTO files để hiểu đúng:
   - Tên interfaces: `Search{FeatureName}Item`, `Search{FeatureName}Request`, `{FeatureName}Item`, `Delete{FeatureName}`, `{FeatureName}Detail`
   - Các fields có trong `Search{FeatureName}Item` (đặc biệt: có `status` không? keyword search trên fields nào?)
   - Tên methods trong service (search, get, create, update, delete, export, toggle)

---

## Bước 2 — Tạo mock files

Theo skill `gen-mock.md`, tạo:

### 2.1 — `src/app/features/{feature-name}/service/{feature-name}.mock.ts`
- 10 items mock với dữ liệu thực tế phù hợp domain của feature
- Dùng `CommonStatusEnum.ACTIVE` / `INACTIVE` cho field status (nếu có)

### 2.2 — `src/app/features/{feature-name}/service/{feature-name}.service.mock.ts`
- Extends `{FeatureName}Service`
- Override tất cả HTTP methods (dựa vào methods thực tế trong service)
- Dùng `cloneItems()` + `okResponse()` helpers

---

## Bước 3 — Cập nhật `routes.ts`

Thêm vào `routes.ts`:
```typescript
import { {FeatureName}MockService } from './service/{feature-name}.service.mock';

providers: [
  // TODO: use the mock data for development and testing, remove it before release
  { provide: {FeatureName}Service, useClass: {FeatureName}MockService },
  {FeatureName}Facade,
],
```

---

## Bước 4 — Verify

```bash
pnpm lint src/app/features/{feature-name}/
pnpm exec tsc --noEmit --skipLibCheck 2>&1 | grep "features/{feature-name}"
```

- Nếu có lỗi lint → chạy `pnpm lint-fix` rồi fix thủ công phần còn lại
- Nếu có lỗi TypeScript → fix trước khi báo cáo

---

## Bước 5 — Báo cáo kết quả

```
✅ Mock service đã tạo cho feature {FeatureName}:

service/
  ├── {feature-name}.mock.ts       — 10 mock items
  └── {feature-name}.service.mock.ts — extends {FeatureName}Service

routes.ts — đã wire { provide: {FeatureName}Service, useClass: {FeatureName}MockService }

📋 Lưu ý: Xóa mock trước khi release (tìm TODO: remove before release)
```
