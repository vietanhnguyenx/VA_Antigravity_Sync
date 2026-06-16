---
name: skill-gen-mock
description: Reference implementation templates cho mock service generation (mock data 10 items, MockService extends real service, delay simulation, provider swap). Đọc khi lệnh gen-mock cần code templates chi tiết.
---

# Skill: gen-mock

Tạo mock service cho một feature CRUD chuẩn (search + get + create + update + delete + export + toggleStatus).

**Input:** `{FeatureName}` — ví dụ: `Region`, `Currency`, `Product`

---

## Pattern tham chiếu

- Mock extends real service, override từng HTTP method bằng `of()` in-memory
- Mock data trong file riêng `{feature-name}.mock.ts`
- Wire vào `routes.ts` qua `{ provide: RealService, useClass: MockService }`
- `clone<T>()` helper tránh mutation side effect (JSON.parse/stringify)
- Filter by keyword (tìm trong code + name) + status, paginate với `(page-1)*pageSize`
- Thêm `pipe(delay(300))` vào mỗi `of()` để mô phỏng network latency thực tế
- KHÔNG import `PaginationConstants` — dùng inline defaults (`body.pageIndex ?? 1`, `body.pageSize ?? 10`)
- KHÔNG override method nào không tồn tại trên real service

---

## File 1: `{feature-name}.mock.ts`

```typescript
// TODO: use the mock data for development and testing, remove it before release
import { CommonStatusEnum } from '@core/base/status';

import { Search{FeatureName}Item } from '../dto/{feature-name}-search';

export const {FEATURE_NAME}_MOCK_ITEMS: Search{FeatureName}Item[] = [
  { id: '1', code: '{CODE_1}', name: '{NAME_1}', status: CommonStatusEnum.ACTIVE, updatedAt: '2025-01-15T08:30:00.000Z', updatedBy: 'admin' },
  { id: '2', code: '{CODE_2}', name: '{NAME_2}', status: CommonStatusEnum.ACTIVE, updatedAt: '2025-01-14T09:15:00.000Z', updatedBy: 'admin' },
  { id: '3', code: '{CODE_3}', name: '{NAME_3}', status: CommonStatusEnum.ACTIVE, updatedAt: '2025-01-13T10:00:00.000Z', updatedBy: 'nguyen.van.a' },
  { id: '4', code: '{CODE_4}', name: '{NAME_4}', status: CommonStatusEnum.ACTIVE, updatedAt: '2025-01-12T11:30:00.000Z', updatedBy: 'tran.thi.b' },
  { id: '5', code: '{CODE_5}', name: '{NAME_5}', status: CommonStatusEnum.ACTIVE, updatedAt: '2025-01-11T08:00:00.000Z', updatedBy: 'admin' },
  { id: '6', code: '{CODE_6}', name: '{NAME_6}', status: CommonStatusEnum.ACTIVE, updatedAt: '2025-01-10T14:20:00.000Z', updatedBy: 'le.van.c' },
  { id: '7', code: '{CODE_7}', name: '{NAME_7}', status: CommonStatusEnum.INACTIVE, updatedAt: '2025-01-09T09:45:00.000Z', updatedBy: 'admin' },
  { id: '8', code: '{CODE_8}', name: '{NAME_8}', status: CommonStatusEnum.ACTIVE, updatedAt: '2025-01-08T16:00:00.000Z', updatedBy: 'pham.van.d' },
  { id: '9', code: '{CODE_9}', name: '{NAME_9}', status: CommonStatusEnum.INACTIVE, updatedAt: '2025-01-07T13:10:00.000Z', updatedBy: 'admin' },
  { id: '10', code: '{CODE_10}', name: '{NAME_10}', status: CommonStatusEnum.INACTIVE, updatedAt: '2025-01-06T10:30:00.000Z', updatedBy: 'nguyen.van.a' },
];
```

> **Lưu ý:** Thay `{CODE_n}` / `{NAME_n}` bằng dữ liệu thực tế phù hợp domain của feature (ví dụ: tiền tệ → VND/USD/EUR, vùng → HN/HCM...).
> Nếu SearchItem không có field `status`, bỏ field đó và bỏ import `CommonStatusEnum`.

---

## File 2: `{feature-name}.service.mock.ts`

```typescript
// TODO: use the mock data for development and testing, remove it before release
import { Injectable } from '@angular/core';
import { delay, of, type Observable } from 'rxjs';

import { Search{FeatureName}Request, Search{FeatureName}Response } from '../dto/{feature-name}-search';
import { {FEATURE_NAME}_MOCK_ITEMS } from './{feature-name}.mock';
import { {FeatureName}Service } from './{feature-name}.service';

const MOCK_DELAY = 300;

@Injectable()
export class {FeatureName}MockService extends {FeatureName}Service {
  private items: (typeof {FEATURE_NAME}_MOCK_ITEMS)[number][] = this.clone({FEATURE_NAME}_MOCK_ITEMS);

  override search{FeatureName}(body: Search{FeatureName}Request): Observable<Search{FeatureName}Response> {
    const keyword = (body.keyword ?? '').trim().toLowerCase();
    const status = body.status ?? null;

    const filtered = this.items.filter((item) => {
      const matchKeyword =
        !keyword ||
        item.code?.toLowerCase().includes(keyword) ||
        item.name?.toLowerCase().includes(keyword);
      const matchStatus = !status || item.status === status;
      return matchKeyword && matchStatus;
    });

    const page = body.pageIndex ?? 1;
    const pageSize = body.pageSize ?? 10;
    const start = (page - 1) * pageSize;

    return of({
      totalItems: filtered.length,
      items: this.clone(filtered.slice(start, start + pageSize)),
    }).pipe(delay(MOCK_DELAY));
  }

  override create{FeatureName}(data: { name: string }): Observable<void> {
    this.items = [
      { id: String(Date.now()), ...data, updatedAt: new Date().toISOString(), updatedBy: 'mock-user', status: 'ACTIVE' },
      ...this.clone(this.items),
    ];
    return of(undefined).pipe(delay(MOCK_DELAY));
  }

  override delete{FeatureName}(id: string): Observable<void> {
    this.items = this.items.filter((item) => item.id !== id);
    return of(undefined).pipe(delay(MOCK_DELAY));
  }

  override toggle{FeatureName}Status(id: string, body: { status: 'ACTIVE' | 'INACTIVE' }): Observable<void> {
    this.items = this.items.map((item) =>
      item.id === id ? { ...item, status: body.status, updatedAt: new Date().toISOString() } : item,
    );
    return of(undefined).pipe(delay(MOCK_DELAY));
  }

  private clone<T>(items: T[]): T[] {
    return JSON.parse(JSON.stringify(items)) as T[];
  }
}
```

> **Lưu ý:** Điều chỉnh signature của từng override cho khớp với real service. Xoá override nào không có trong real service.

---

## File 3: Cập nhật `routes.ts`

Thêm import và cập nhật `providers`:

```typescript
// TODO: use the mock data for development and testing, remove it before release
import { {FeatureName}MockService } from './service/{feature-name}.service.mock';

// Trong providers array:
providers: [
  { provide: {FeatureName}Service, useClass: {FeatureName}MockService },
],
```

---

## Lưu ý quan trọng

- Nếu service không có method `toggleStatus`, bỏ override đó
- Nếu service không có method `export`, bỏ override đó
- Nếu `SearchRequest` không có `status` field, bỏ filter matchStatus
- Nếu `SearchItem` không có `code` / `name`, điều chỉnh keyword filter cho đúng fields
- Luôn dùng `(typeof {FEATURE_NAME}_MOCK_ITEMS)[number][]` cho kiểu `items` (không dùng `any`)
- Luôn thêm `pipe(delay(MOCK_DELAY))` vào mỗi `of()` để giả lập async

---

## Verify sau khi tạo

```bash
pnpm lint src/app/features/{feature-name}/
pnpm exec tsc --noEmit --skipLibCheck 2>&1 | grep "features/{feature-name}"
```

Kỳ vọng: 0 errors (warnings từ pre-existing files là chấp nhận được).
