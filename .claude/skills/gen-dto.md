---
name: skill-gen-dto
description: Reference implementation templates cho DTO generation (5 DTO types: Item, Detail, Search Request/Response, StatusChange, History). Đọc khi lệnh gen-dto cần code templates chi tiết.
---

# Skill: Gen DTOs

Tạo các interface/type files trong folder `dto/` của một feature.

**Reference:** `src/app/features/external-integration/dto/`

---

## Cấu trúc folder `dto/`

```
dto/
├── {feature}-item.ts          # Item (list row) + Delete request
├── {feature}-detail.ts        # Detail (full fields cho create/edit form)
├── {feature}-search.ts        # Search request/response + IBaseApiResponse
├── {feature}-status-change.ts # Toggle status payload
└── {feature}-history-change.ts  # (nếu có history log)
```

---

## 1. `{feature}-item.ts`

Item dùng cho list row và dropdown. Delete request dùng khi xoá.

```typescript
// src/app/features/{feature}/dto/{feature}-item.ts

export interface {Feature}Item {
  id?: string;
  code?: string;
  name?: string;
  active?: string;
  // ... các field hiển thị trong table
}

export interface Delete{Feature} {
  id?: string;
  reason?: string;
}
```

---

## 2. `{feature}-detail.ts`

Detail dùng cho create/edit form. Thường có đầy đủ fields hơn Item.

```typescript
// src/app/features/{feature}/dto/{feature}-detail.ts

export interface {Feature}Detail {
  id: string;
  code: string;
  name: string;
  active: string;
  // ... các field cần cho form
  description?: string;
  note?: string;
}
```

---

## 3. `{feature}-search.ts`

Search request/response. `IBaseApiResponse<T>` là kiểu response chung từ backend.

```typescript
// src/app/features/{feature}/dto/{feature}-search.ts
import { BasePaginationResponse } from '@core/base/response';

export interface IBaseApiResponse<T = unknown> {
  correlationId:     string;
  errorCode:         string;
  httpStatus:        string;
  responseTimestamp: string;
  resultCode:        number;
  resultMsg:         string;
  data?: T;
}

export interface Search{Feature}Request {
  keyword?:  string | null;
  status?:   string | null;
  // ... các filter field tương ứng với form advanced search
}

export interface Search{Feature}Item {
  id?:        string;
  code?:      string;
  name?:      string;
  active?:    string;
  status?:    string | null;
  updatedAt?: string;
  updatedBy?: string;
  // ... các field hiển thị trong table (tất cả optional để handle partial response)
}

// Response luôn extends BasePaginationResponse
export interface Search{Feature}Response extends BasePaginationResponse<Search{Feature}Item[]> {}

// Summary (nếu có summary cards)
export interface {Feature}SummaryResponse {
  total:    number;
  active:   number;
  inactive: number;
  // ...
}
```

---

## 4. `{feature}-status-change.ts`

Payload khi toggle trạng thái.

```typescript
// src/app/features/{feature}/dto/{feature}-status-change.ts

export interface StatusChange {
  id?:     string | null;
  reason?: string | null;
}
```

---

## 5. `{feature}-history-change.ts` (nếu có log lịch sử)

```typescript
// src/app/features/{feature}/dto/{feature}-history-change.ts
import { BasePaginationResponse } from '@core/base/response';

export interface LogData{Feature}Item {
  logId:           string;
  entityCode:      string;
  entityName:      string;
  updatedEntityAt: string;
  updatedByName:   string;
  actionCustom:    string;
  dataChange:      string;
}

export interface SearchLogData{Feature}Request {
  className:  string | null;
  code?:      string | null;
  name?:      string | null;
  fromDate?:  string | null;
  toDate?:    string | null;
}

export interface SearchLogData{Feature}Response extends BasePaginationResponse<LogData{Feature}Item[]> {}
```

---

## Quy tắc đặt tên và best practices

| Loại | Naming Convention | Ví dụ |
|---|---|---|
| Request | `Search{Feature}Request` | `SearchRegionRequest` |
| Response (paginated) | `Search{Feature}Response` | `SearchRegionResponse` |
| Item (list row) | `Search{Feature}Item` hoặc `{Feature}Item` | `SearchRegionItem` |
| Detail (form) | `{Feature}Detail` | `RegionDetail` |
| Delete payload | `Delete{Feature}` | `DeleteRegion` |
| Summary | `{Feature}SummaryResponse` | `RegionSummaryResponse` |

**Nguyên tắc:**
- Response paginated luôn `extends BasePaginationResponse<Item[]>` từ `@core/base/response`
- Tất cả fields trong Item/Detail đều **optional** (`?`) trừ `id` — backend có thể trả partial data
- `IBaseApiResponse<T>` chứa `resultCode`, `resultMsg`, `data?` — dùng cho các response không phải paginated (create, update, delete)
- Không đặt validation logic trong DTO — validation ở form config hoặc backend

## Checklist sau khi gen

- [ ] Thay `{Feature}`, `{feature}` bằng tên feature thực tế
- [ ] Thêm/bớt fields theo API documentation
- [ ] Xoá file không cần (vd: không có history log → xoá `{feature}-history-change.ts`)
- [ ] Verify `BasePaginationResponse` import path: `@core/base/response`
