---
name: gen-routes
description: Tạo lazy-loaded route configuration cho feature ESB-FE. Dùng khi tạo mới hoặc cập nhật routing, permission guard, route-level providers cho feature.
argument-hint: "<FeatureName> [paths:path1,path2,...]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo routes.ts cho feature: **$ARGUMENTS**

_(Định dạng input: `<FeatureName> [paths:path1,path2,...]` — ví dụ: `Region` hoặc `ExternalIntegration paths:mof,population,tax`)_

---

## Thực hiện

1. Đọc skill file tại `.claude/skills/gen-routes.md`
2. Parse input để xác định:
   - FeatureName, feature-name, FEATURE_NAME
   - paths: danh sách sub-paths (nếu có → dùng pattern nhiều paths + RouteContext; nếu không → 1 path đơn giản)
3. Áp dụng skill:

   **Nếu không có paths (1 route đơn giản):**
   - `baseRouteConfig` với loadComponent + providers + canActivate
   - Export `{FEATURE}_ROUTES: Route[]` với 1 path `''`

   **Nếu có paths (nhiều sub-paths):**
   - Tạo thêm `{feature-name}-route-context.service.ts`
   - `baseRouteConfig` + spread cho từng sub-path
   - Providers bao gồm `{Feature}RouteContext`

4. Providers phải bao gồm: `{Feature}Service`, `{Feature}Facade`
5. `canActivate: [permissionGuard]` với `{FEATURE}_PERMISSION_KEY.{FEATURE}_VIEW_LIST`
6. Tạo file(s) thực tế tại `src/app/features/{feature-name}/routes.ts`

Sau khi tạo, in ra snippet cần thêm vào app routing để đăng ký feature.

---

## Verify trước khi bàn giao

```bash
pnpm lint src/app/features/{feature-name}/routes.ts
```

Nếu có lỗi → fix trước khi báo cáo kết quả.
