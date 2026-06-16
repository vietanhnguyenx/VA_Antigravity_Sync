---
name: gen-dto
description: Tạo DTO/interface files (Item, Detail, Search request/response, StatusChange) cho feature ESB-FE. Dùng khi tạo mới model hoặc định nghĩa kiểu dữ liệu cho feature.
argument-hint: "<FeatureName> [field1:type, field2:type, ...]"
allowed-tools: ["Read", "Write", "Edit", "Bash"]
---

Bạn là senior Angular developer cho dự án ESB-FE.

**Nhiệm vụ:** Tạo DTO/interface files cho feature: **$ARGUMENTS**

_(Định dạng input: `<FeatureName> [field1:type, field2:type, ...]` — ví dụ: `Region id:string,code:string,name:string,active:string,parentId:string`)_

---

## Thực hiện

1. Đọc skill file tại `.claude/skills/gen-dto.md`
2. Parse input để xác định:
   - FeatureName (PascalCase), feature-name (kebab-case)
   - Danh sách fields và types (nếu không có, dùng: `id:string, code:string, name:string, active:string, updatedAt:string, updatedBy:string`)
3. Áp dụng skill để tạo các files trong `src/app/features/{feature-name}/dto/`:
   - `{feature-name}-item.ts` — Item interface (list row) + Delete interface
   - `{feature-name}-detail.ts` — Detail interface (form fields, đầy đủ hơn Item)
   - `{feature-name}-search.ts` — SearchRequest, SearchResponse, IBaseApiResponse
   - `{feature-name}-status-change.ts` — StatusChange interface
4. Tất cả fields đều optional (trừ id trong Detail)
5. SearchResponse phải extends `BasePaginationResponse<SearchItem[]>` từ `@core/base/response`
6. Tạo files thực tế

Sau khi tạo, liệt kê files đã tạo.

---

## Verify trước khi bàn giao

```bash
pnpm lint src/app/features/{feature-name}/dto/
```

Nếu có lỗi → fix trước khi báo cáo kết quả.
