---
name: gen-constants
description: Tạo constants files (permissions, status enum, column definitions, search config) cho feature ESB-FE. Dùng khi tạo mới hoặc cập nhật constants/permissions của feature.
argument-hint: "<FeatureName> [columns:field1,field2,...]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo constants files cho feature: **$ARGUMENTS**

_(Định dạng input: `<FeatureName> [columns:field1,field2,...]` — ví dụ: `Region columns:code,name,active,updatedAt,updatedBy`)_

---

## Thực hiện

1. Đọc skill file tại `.claude/skills/gen-constants.md`
2. Parse input để xác định:
   - FeatureName, feature-name, FEATURE_NAME
   - Danh sách columns cho table (nếu không có, dùng: code, name, active, updatedAt, updatedBy)
3. Áp dụng skill để tạo 4 files trong `src/app/features/{feature-name}/constants/`:

   **a) `{feature-name}-permissions.ts`**
   - `{FEATURE}_PERMISSION_KEY` với đủ actions: VIEW_LIST, VIEW_CREATE, VIEW_DETAIL, VIEW_UPDATE, VIEW_DELETE, VIEW_EXPORT, VIEW_TOGGLE_STATUS
   - `with{Feature}Per()` helper function

   **b) `{feature-name}-status.ts`**
   - `{FEATURE}_STATUS_LIST` với ACTIVE/INACTIVE (severity: success/secondary)

   **c) `list-columns.ts`**
   - `{FEATURE}_LIST_COLUMNS(statusTemplate, editTemplate, ellipsisTemplate)`
   - Columns dựa trên danh sách fields từ input

   **d) `search-config.ts`**
   - `SEARCH_FORM_CONFIG(searchTemplate)` — ô search text
   - `ADV_SEARCH_FORM_CONFIG(translateService)` — dropdown status

4. Tạo files thực tế

Sau khi tạo, liệt kê files đã tạo.

---

## Verify trước khi bàn giao

```bash
pnpm lint src/app/features/{feature-name}/constants/
```

Nếu có lỗi → chạy `pnpm lint-fix` để auto-fix, sau đó fix thủ công phần còn lại. Chỉ báo cáo "Done" khi lint **pass**.
