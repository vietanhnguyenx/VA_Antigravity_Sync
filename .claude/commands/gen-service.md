---
name: gen-service
description: Tạo HTTP API service layer (api const + service class) với factory pattern cho feature ESB-FE. Dùng khi tạo mới service layer hoặc cần thêm CRUD/export/toggle API endpoint.
argument-hint: "<FeatureName> [basePath:/service-be/api/v1/resource]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo API service layer (api const + service class) cho feature: **$ARGUMENTS**

_(Định dạng input: `<FeatureName> [basePath:/service-be/api/v1/resource]` — ví dụ: `Region /region-be/api/v1/regions`)_

---

## Thực hiện

1. Đọc skill file tại `.claude/skills/gen-api-service.md`
2. Parse input để xác định:
   - FeatureName (PascalCase), feature-name (kebab-case), FEATURE_NAME (UPPER_SNAKE_CASE)
   - basePath nếu có, nếu không hỏi hoặc dùng placeholder `/{service-be}/api/v1/{resource}`
3. Áp dụng skill để tạo 2 files:
   - `src/app/features/{feature-name}/service/{feature-name}-api.const.ts`
   - `src/app/features/{feature-name}/service/{feature-name}.service.ts`
4. Thay toàn bộ placeholder `{Feature}`, `{feature}`, `{FEATURE}` bằng tên thực tế
5. Tạo files thực tế (không chỉ in template)

Sau khi tạo, liệt kê files đã tạo và nhắc kiểm tra basePath + method list.

---

## Verify trước khi bàn giao

```bash
pnpm lint src/app/features/{feature-name}/service/
```

Nếu có lỗi → chạy `pnpm lint-fix` để auto-fix, sau đó fix thủ công phần còn lại. Chỉ báo cáo "Done" khi lint **pass**.
