---
name: skill-gen-api-service
description: Reference implementation templates cho API service generation (factory pattern HTTP service với CRUD, export, toggle status). Đọc khi lệnh gen-service cần code templates chi tiết.
---

# Skill: Gen API Service

Tạo 2 files cho một feature mới:
1. `service/{feature}-api.const.ts` — định nghĩa endpoint URLs
2. `service/{feature}.service.ts` — HTTP service methods

**Reference:** `src/app/features/external-integration/service/`

---

## Bước 1: Tạo `{feature}-api.const.ts`

Dùng factory function để hỗ trợ dynamic context path (nhiều route dùng chung service):

```typescript
// src/app/features/{feature}/service/{feature}-api.const.ts
export const DEFAULT_CONTEXT_PATH = '/{service-be}';
export const PARAMS = 'page={page}&pageSize={pageSize}';

export const create{Feature}Api = (contextPath: string) => {
  const basePath = `${contextPath}/api/v1/{resource}`;

  return {
    {featureCamel}: {
      search{Feature}:        `${basePath}?${PARAMS}`,
      get{Feature}ById:       `${basePath}/{id}`,
      getAll{Feature}:        `${basePath}/all`,
      create{Feature}:        `${basePath}`,
      update{Feature}:        `${basePath}/{id}`,
      delete{Feature}:        `${basePath}/delete`,
      export{Feature}:        `${basePath}/export`,
      toggle{Feature}Status:  `${basePath}/{id}/toggle-status`,
      histories{Feature}:     `${basePath}/{id}/histories?${PARAMS}`,
    },
  };
};

// Default export (dùng khi không cần dynamic context)
export const api{Feature} = create{Feature}Api(DEFAULT_CONTEXT_PATH);
```

**Lưu ý:**
- Path params dùng `{id}`, `{page}`, `{pageSize}` — AppHttpApiService sẽ replace
- Nếu feature chỉ có 1 route path cố định, bỏ factory, dùng `const` trực tiếp
- Nếu feature cần dynamic path (nhiều route sub-path), dùng `ExternalIntegrationRouteContext` pattern

---

## Bước 2: Tạo `{feature}.service.ts`

```typescript
// src/app/features/{feature}/service/{feature}.service.ts
import { HttpContext } from '@angular/common/http';
import { computed, inject, Injectable } from '@angular/core';
import { Pagination, PaginationConstants } from '@core/base/pagination';
import { AppHttpApiService } from '@core/http-api.service';
import { environment } from '@environment';
import { map, Observable } from 'rxjs';
import { HttpApiService } from '@ubck-core/common';
import { UBCKPaginatorState } from '@ubck-core/ui';

import { Search{Feature}Request, Search{Feature}Response, IBaseApiResponse, Search{Feature}Item } from '../dto/{feature}-search';
import { {Feature}Detail } from '../dto/{feature}-detail';
import { {Feature}Item, Delete{Feature} } from '../dto/{feature}-item';
import { create{Feature}Api } from './{feature}-api.const';
import { getHeaderFilename } from '@utils/get-filename-from-header';
// import { {Feature}RouteContext } from './{feature}-route-context.service'; // chỉ cần nếu dynamic path

export const {FEATURE}_REQUEST_ID = {
  SEARCH_{FEATURE}:    'search{Feature}',
  GET_{FEATURE}_BY_ID: 'get{Feature}ById',
  CREATE_{FEATURE}:    'create{Feature}',
  UPDATE_{FEATURE}:    'update{Feature}',
  DELETE_{FEATURE}:    'delete{Feature}',
  EXPORT_{FEATURE}:    'export{Feature}',
  TOGGLE_STATUS:       'toggle{Feature}Status',
  LOG_DATA_{FEATURE}:  'logData{Feature}',
} as const;

export const ENTITY = {
  {FEATURE}_ENTITY: '{FEATURE_CLASS_NAME}', // tên class entity phía backend
};

@Injectable()
export class {Feature}Service {
  private readonly http = inject(AppHttpApiService);
  // Nếu dynamic path: private readonly routeContext = inject({Feature}RouteContext);
  // private readonly apiCfg = computed(() => create{Feature}Api(this.routeContext.apiContextPath()));

  // Nếu path cố định:
  private readonly apiCfg = create{Feature}Api('/fixed-context-path');

  search{Feature}(
    body: Search{Feature}Request,
    paginationParams: Pagination = {
      page: PaginationConstants.DEFAULT_PAGE,
      pageSize: PaginationConstants.DEFAULT_PAGE_SIZE,
    },
    options?: Record<string, unknown>,
  ): Observable<Search{Feature}Response> {
    return this.http.post(environment.apiUrl, body, this.apiCfg.{featureCamel}.search{Feature}, {
      ...paginationParams,
      context: new HttpContext()
        .set(HttpApiService.REQUEST_ID, {FEATURE}_REQUEST_ID.SEARCH_{FEATURE})
        .set(HttpApiService.HTTP_METADATA, { ignoreLoadingIndicator: true }),
      ...(options || {}),
    });
  }

  get{Feature}ById(
    id: string | number,
    options?: Record<string, unknown>,
  ): Observable<{Feature}Detail> {
    return this.http.get(null, this.apiCfg.{featureCamel}.get{Feature}ById, {
      context: new HttpContext().set(HttpApiService.REQUEST_ID, {FEATURE}_REQUEST_ID.GET_{FEATURE}_BY_ID),
      id: String(id),
      ...(options || {}),
    });
  }

  create{Feature}(
    data: {Feature}Item,
    options?: Record<string, unknown>,
  ): Observable<IBaseApiResponse<void>> {
    return this.http.post(null, data, this.apiCfg.{featureCamel}.create{Feature}, {
      context: new HttpContext().set(HttpApiService.REQUEST_ID, {FEATURE}_REQUEST_ID.CREATE_{FEATURE}),
      ...(options || {}),
    });
  }

  update{Feature}(
    id: string | number,
    data: unknown,
    options?: Record<string, unknown>,
  ): Observable<void> {
    return this.http.put(null, data, this.apiCfg.{featureCamel}.update{Feature}, {
      context: new HttpContext().set(HttpApiService.REQUEST_ID, {FEATURE}_REQUEST_ID.UPDATE_{FEATURE}),
      id,
      ...(options || {}),
    });
  }

  delete{Feature}(
    body: Delete{Feature},
    options?: Record<string, unknown>,
  ): Observable<IBaseApiResponse<void>> {
    return this.http.post(null, body, this.apiCfg.{featureCamel}.delete{Feature}, {
      context: new HttpContext().set(HttpApiService.REQUEST_ID, {FEATURE}_REQUEST_ID.DELETE_{FEATURE}),
      ...(options || {}),
    });
  }

  export{Feature}(
    body: Search{Feature}Request,
    options?: Record<string, unknown>,
  ): Observable<{ fileName: string | null; blob: any }> {
    return this.http
      .post(null, body, this.apiCfg.{featureCamel}.export{Feature}, {
        observe: 'response',
        responseType: 'blob',
        context: new HttpContext().set(HttpApiService.REQUEST_ID, {FEATURE}_REQUEST_ID.EXPORT_{FEATURE}),
        ...(options || {}),
      })
      .pipe(
        map((res: any) => ({
          fileName: getHeaderFilename(res.headers.get('Content-Disposition') || '', '{FEATURE}.xlsx'),
          blob: res.body,
        })),
      );
  }

  toggle{Feature}Status(
    id: string,
    body: { active: string | null; reason: string | null | undefined },
    options?: Record<string, unknown>,
  ): Observable<IBaseApiResponse<void>> {
    return this.http.put(null, body, this.apiCfg.{featureCamel}.toggle{Feature}Status, {
      context: new HttpContext().set(HttpApiService.REQUEST_ID, {FEATURE}_REQUEST_ID.TOGGLE_STATUS),
      id,
      ...(options || {}),
    });
  }
}
```

---

## Checklist sau khi gen

- [ ] Thay tất cả `{Feature}`, `{feature}`, `{FEATURE}`, `{featureCamel}` bằng tên thực tế
- [ ] Kiểm tra `basePath` trỏ đúng backend endpoint
- [ ] Xoá các method không dùng (vd: không có export thì xoá `export{Feature}`)
- [ ] Nếu cần dynamic route path: thêm `{Feature}RouteContext` inject và dùng `computed(() => create{Feature}Api(...))`
- [ ] Import `getHeaderFilename` từ `@utils/get-filename-from-header` nếu có export
