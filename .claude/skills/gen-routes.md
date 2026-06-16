---
name: skill-gen-routes
description: Reference implementation templates cho route configuration generation (3 route patterns: 1-path, multi-path, token injection, RouteContext service). Đọc khi lệnh gen-routes cần code templates chi tiết.
---

# Skill: Gen Routes

Tạo `routes.ts` cho một feature với lazy loading, route-level providers và permission guard.

**Reference:** `src/app/features/external-integration/routes.ts`

---

## Pattern cơ bản — 1 path

Dùng khi feature chỉ có 1 route path duy nhất.

```typescript
// src/app/features/{feature}/routes.ts
import { Route } from '@angular/router';
import { permissionGuard } from '@core/guard/permission.guard';
import { PERMISSION_KEYS_ENUM } from '@core/constants/role';
import { {Feature}Service } from './service/{feature}.service';
import { {Feature}Facade } from './{feature}.facade';
import { {FEATURE}_PERMISSION_KEY } from './constants/{feature}-permissions';

export const {FEATURE}_ROUTES_ENUM = {
  ROOT: '{feature-kebab}',
};

export const {FEATURE}_ROUTES: Route[] = [
  {
    path: '',
    loadComponent: () =>
      import('./{feature}.component').then((m) => m.{Feature}Component),
    providers: [
      {Feature}Service,
      {Feature}Facade,
    ],
    canActivate: [permissionGuard],
    data: {
      permissions: [
        {FEATURE}_PERMISSION_KEY.{FEATURE}_VIEW_LIST,
        PERMISSION_KEYS_ENUM.SUPER_ADMIN,
      ],
    },
  },
];
```

---

## Pattern nâng cao — Nhiều sub-paths cùng component

Dùng khi cùng 1 component được load cho nhiều route paths (như `external-integration` với mof, population, tax, v.v.).

```typescript
// src/app/features/{feature}/routes.ts
import { Route } from '@angular/router';
import { permissionGuard } from '@core/guard/permission.guard';
import { PERMISSION_KEYS_ENUM } from '@core/constants/role';
import { {Feature}Service } from './service/{feature}.service';
import { {Feature}Facade } from './{feature}.facade';
import { {Feature}RouteContext } from './service/{feature}-route-context.service';
import { {FEATURE}_PERMISSION_KEY } from './constants/{feature}-permissions';
// import { {Feature}HistoryFacade } from './{feature}-history-change/{feature}-history-change.facade';
// import { HistoryFacade } from '@features/base/facades/history-facade';

export const {FEATURE}_ROUTES_ENUM = {
  ROOT: '{feature-kebab}',
};

// Shared config — spread vào từng route path
const baseRouteConfig: Omit<Route, 'path'> = {
  loadComponent: () =>
    import('./{feature}.component').then((m) => m.{Feature}Component),
  providers: [
    {Feature}RouteContext,   // inject route context để detect active sub-path
    {Feature}Service,
    {Feature}Facade,
    // {Feature}HistoryFacade,
    // { provide: HistoryFacade, useExisting: {Feature}HistoryFacade },
  ],
  canActivate: [permissionGuard],
  data: {
    permissions: [
      {FEATURE}_PERMISSION_KEY.{FEATURE}_VIEW_LIST,
      PERMISSION_KEYS_ENUM.SUPER_ADMIN,
    ],
  },
};

export const {FEATURE}_ROUTES: Route[] = [
  { path: '',          ...baseRouteConfig },
  { path: 'sub-path-a', ...baseRouteConfig },
  { path: 'sub-path-b', ...baseRouteConfig },
  // thêm paths tương ứng với các loại entity / context khác nhau
];
```

---

## Pattern token injection — Swap implementation theo route

Dùng khi nhiều routes dùng cùng component nhưng cần facade/service khác nhau.

```typescript
// Định nghĩa token (trong file riêng hoặc trong service)
import { InjectionToken } from '@angular/core';
import { Abstract{Feature}Facade } from './facades/abstract-{feature}.facade';

export const {FEATURE}_FACADE_TOKEN =
  new InjectionToken<Abstract{Feature}Facade>('{Feature}Facade');

// Trong routes.ts:
export const {FEATURE}_ROUTES: Route[] = [
  {
    path: 'type-a',
    loadComponent: () => import('./{feature}.component').then((m) => m.{Feature}Component),
    providers: [
      TypeA{Feature}Service,
      TypeA{Feature}Facade,
      { provide: {FEATURE}_FACADE_TOKEN, useExisting: TypeA{Feature}Facade },
    ],
  },
  {
    path: 'type-b',
    loadComponent: () => import('./{feature}.component').then((m) => m.{Feature}Component),
    providers: [
      TypeB{Feature}Service,
      TypeB{Feature}Facade,
      { provide: {FEATURE}_FACADE_TOKEN, useExisting: TypeB{Feature}Facade },
    ],
  },
];

// Trong component:
readonly facade = inject({FEATURE}_FACADE_TOKEN);
```

---

## Đăng ký vào app routes

Sau khi tạo `{FEATURE}_ROUTES`, đăng ký vào file routing cha (thường là `app.routes.ts` hoặc router của module cha):

```typescript
// src/app/app.routes.ts (hoặc file routing cha)
{
  path: '{feature-kebab}',
  loadChildren: () =>
    import('./features/{feature}/routes').then((m) => m.{FEATURE}_ROUTES),
}

// Nếu nhiều sub-paths:
{
  path: '{feature-kebab}',
  children: [
    {
      path: '',
      loadChildren: () =>
        import('./features/{feature}/routes').then((m) => m.{FEATURE}_ROUTES),
    },
  ],
}
```

---

## Route Context Service (cần khi dùng nhiều sub-paths)

Khi component cần biết đang ở sub-path nào để load data khác nhau:

```typescript
// src/app/features/{feature}/service/{feature}-route-context.service.ts
import { computed, inject, Injectable, signal } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { filter, takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { DestroyRef } from '@angular/core';

// Map từ route key → API context path (hoặc config khác)
const {FEATURE}_ROUTE_CONFIG: Record<string, { apiContextPath: string }> = {
  'sub-path-a': { apiContextPath: '/service-a-be' },
  'sub-path-b': { apiContextPath: '/service-b-be' },
};

const DEFAULT_CONTEXT_PATH = '/{default-be}';

export type {Feature}RouteKey = keyof typeof {FEATURE}_ROUTE_CONFIG;

@Injectable()
export class {Feature}RouteContext {
  private readonly router    = inject(Router);
  private readonly destroyRef = inject(DestroyRef);

  readonly routeKey     = signal<string>('');
  readonly apiContextPath = computed<string>(() => {
    const key = this.routeKey() as {Feature}RouteKey;
    return {FEATURE}_ROUTE_CONFIG[key]?.apiContextPath ?? DEFAULT_CONTEXT_PATH;
  });

  constructor() {
    this.router.events
      .pipe(
        filter((e) => e instanceof NavigationEnd),
        takeUntilDestroyed(this.destroyRef),
      )
      .subscribe((e: any) => {
        this.routeKey.set(this.extractRouteKey(e.urlAfterRedirects as string));
      });

    // Set initial value
    this.routeKey.set(this.extractRouteKey(this.router.url));
  }

  private extractRouteKey(url: string): string {
    const segments = url.split('/').filter(Boolean);
    // Lấy segment cuối cùng làm route key
    return segments[segments.length - 1] ?? '';
  }
}
```

---

## Checklist sau khi gen

- [ ] Thay `{Feature}`, `{feature}`, `{FEATURE}`, `{feature-kebab}` bằng tên thực tế
- [ ] Chọn đúng pattern (1 path / nhiều paths / token injection)
- [ ] Nếu không cần `RouteContext` (chỉ 1 path) → xoá `{Feature}RouteContext` khỏi providers
- [ ] Kiểm tra permission key đúng với backend permission system
- [ ] Đăng ký routes vào app routing
- [ ] Nếu dùng token injection: tạo abstract facade interface trước
