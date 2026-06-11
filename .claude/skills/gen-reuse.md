---
name: skill-gen-reuse
description: Reference implementation cho 4 reuse patterns trong ESB-FE (RouteContext, Token Injection, useExisting, Input Props). Đọc khi cần chia sẻ facade/service giữa nhiều component hoặc route.
---

# Skill: Tái Sử Dụng — Nhiều Component / Route

Hướng dẫn 3 pattern tái sử dụng facade/service/component trong codebase ESB-FE.

**Reference:** `src/app/features/external-integration/`

---

## Pattern A — Cùng Component, Nhiều Route Paths (Route Context)

**Khi nào dùng:** Cùng 1 UI (list, filter, table) nhưng data khác nhau tùy theo route segment (vd: `/external-integration/mof`, `/external-integration/tax`).

### Cách hoạt động

```
Route: /feature/sub-path-a  →  Component  →  RouteContext(routeKey='sub-path-a')
Route: /feature/sub-path-b  →  Component  →  RouteContext(routeKey='sub-path-b')
                                                   ↓
                                           Service dùng routeKey để compute API path
```

### Bước 1: Route Context Service

```typescript
// service/{feature}-route-context.service.ts
@Injectable()
export class {Feature}RouteContext {
  readonly routeKey       = signal<string>('');
  readonly apiContextPath = computed(() => {
    return ROUTE_CONFIG[this.routeKey()]?.apiContextPath ?? DEFAULT_PATH;
  });

  constructor() {
    const router = inject(Router);
    router.events
      .pipe(filter((e) => e instanceof NavigationEnd), takeUntilDestroyed())
      .subscribe((e: any) => {
        this.routeKey.set(this.extractKey(e.urlAfterRedirects));
      });
    this.routeKey.set(this.extractKey(router.url));
  }

  private extractKey(url: string): string {
    return url.split('/').filter(Boolean).pop() ?? '';
  }
}
```

### Bước 2: Service inject RouteContext

```typescript
// service/{feature}.service.ts
@Injectable()
export class {Feature}Service {
  private readonly routeContext = inject({Feature}RouteContext);
  // apiCfg tự recompute khi route thay đổi
  private readonly apiCfg = computed(() => create{Feature}Api(this.routeContext.apiContextPath()));

  search(body: SearchRequest): Observable<SearchResponse> {
    // this.apiCfg() gọi đúng endpoint cho route hiện tại
    return this.http.post(null, body, this.apiCfg().search);
  }
}
```

### Bước 3: Routes — nhiều paths, cùng providers

```typescript
// routes.ts
const baseRouteConfig: Omit<Route, 'path'> = {
  loadComponent: () => import('./feature.component').then(m => m.FeatureComponent),
  providers: [
    {Feature}RouteContext,  // 1 instance per route activation
    {Feature}Service,
    {Feature}Facade,
  ],
  canActivate: [permissionGuard],
  data: { permissions: [...] },
};

export const FEATURE_ROUTES: Route[] = [
  { path: '',           ...baseRouteConfig },
  { path: 'sub-path-a', ...baseRouteConfig },
  { path: 'sub-path-b', ...baseRouteConfig },
];
```

**Lưu ý:** Providers được inject ở route level → mỗi lần navigate đến route mới, services được khởi tạo lại. RouteContext tự detect URL và update `routeKey` signal.

---

## Pattern B — Token Injection (Swap Implementation)

**Khi nào dùng:** Nhiều routes cần cùng component interface nhưng logic khác nhau (vd: alert threshold cho response time vs error rate).

### Bước 1: Định nghĩa Abstract Interface hoặc Token

```typescript
// facades/abstract-{feature}.facade.ts
export abstract class Abstract{Feature}Facade {
  abstract readonly list:       Signal<SearchResponse>;
  abstract readonly listProps:  Signal<IAMTableProps>;
  abstract init():  void;
  abstract search(): void;
  abstract handleExport(): void;
}

// hoặc dùng InjectionToken cho interface đơn giản:
export const {FEATURE}_FACADE_TOKEN =
  new InjectionToken<Abstract{Feature}Facade>('{Feature}Facade');
```

### Bước 2: Concrete Implementations

```typescript
// facades/type-a-{feature}.facade.ts
@Injectable()
export class TypeA{Feature}Facade extends Abstract{Feature}Facade {
  // implement với TypeA service
}

// facades/type-b-{feature}.facade.ts
@Injectable()
export class TypeB{Feature}Facade extends Abstract{Feature}Facade {
  // implement với TypeB service
}
```

### Bước 3: Routes bind token → concrete

```typescript
// routes.ts
export const FEATURE_ROUTES: Route[] = [
  {
    path: 'type-a',
    loadComponent: () => import('./feature.component').then(m => m.FeatureComponent),
    providers: [
      TypeA{Feature}Service,
      TypeA{Feature}Facade,
      { provide: Abstract{Feature}Facade, useExisting: TypeA{Feature}Facade },
      // hoặc: { provide: {FEATURE}_FACADE_TOKEN, useExisting: TypeA{Feature}Facade },
    ],
  },
  {
    path: 'type-b',
    loadComponent: () => import('./feature.component').then(m => m.FeatureComponent),
    providers: [
      TypeB{Feature}Service,
      TypeB{Feature}Facade,
      { provide: Abstract{Feature}Facade, useExisting: TypeB{Feature}Facade },
    ],
  },
];
```

### Bước 4: Component inject token/abstract class

```typescript
// {feature}.component.ts — không biết TypeA hay TypeB
readonly facade = inject(Abstract{Feature}Facade);
// hoặc: readonly facade = inject({FEATURE}_FACADE_TOKEN);
```

---

## Pattern C — Shared Facade qua `useExisting` Provider

**Khi nào dùng:** Một shared component (vd: Header, HistoryDialog) cần inject facade mà không biết feature cụ thể.

### Ví dụ thực tế: HistoryFacade

```typescript
// base/facades/history-facade.ts (shared abstract)
export abstract class HistoryFacade {
  abstract openDialogViewChangeHistory(): void;
}

// external-integration-history-change.facade.ts
@Injectable()
export class ExternalIntegrationHistoryFacade extends HistoryFacade {
  openDialogViewChangeHistory(): void { /* ... */ }
}

// routes.ts
providers: [
  ExternalIntegrationHistoryFacade,
  { provide: HistoryFacade, useExisting: ExternalIntegrationHistoryFacade },
]

// Header component — inject HistoryFacade chung
readonly historyFacade = inject(HistoryFacade);
onExportHistory(): void { this.historyFacade.openDialogViewChangeHistory(); }
```

### Khi nào dùng Pattern này vs Pattern B

| | Pattern B (Token) | Pattern C (useExisting) |
|---|---|---|
| **Mục đích** | Swap toàn bộ facade theo route | Expose 1 interface cụ thể từ facade con |
| **Ví dụ** | Alert threshold: ResponseTime vs ErrorRate facade | HistoryFacade: Header không cần biết feature cụ thể |
| **Số interface** | 1 interface = 1 implementation per route | 1 implementation có thể provide nhiều tokens |

---

## Pattern D — Tái Sử Dụng Sub-Component qua Input

**Khi nào dùng:** Sub-component (summary cards, filter) hoàn toàn độc lập, có thể dùng ở nhiều features.

```typescript
// Trong feature A:
@Component({ selector: 'iam-feature-a', ... })
export class FeatureAComponent {
  facadeA = inject(FeatureAFacade);
}
// template: <iam-summary [props]="facadeA.summaryProps()" />

// Trong feature B:
@Component({ selector: 'iam-feature-b', ... })
export class FeatureBComponent {
  facadeB = inject(FeatureBFacade);
}
// template: <iam-summary [props]="facadeB.summaryProps()" />

// Summary component: hoàn toàn stateless, nhận data qua input
@Component({ selector: 'iam-summary', ... })
export class SummaryComponent {
  readonly props = input.required<SummaryProps>();
}
```

**Nguyên tắc:** Sub-component không inject facade, không biết business logic. Data đi qua `input()`.

---

## Khi nào chọn pattern nào?

| Tình huống | Pattern |
|---|---|
| Cùng UI, data thay đổi theo URL segment | **A — Route Context** |
| Cùng UI, logic hoàn toàn khác nhau (service, rules) | **B — Token Injection** |
| Shared UI component cần 1 action từ feature facade | **C — useExisting Provider** |
| Sub-component hoàn toàn stateless (chỉ hiển thị) | **D — Input Props** |

---

## Checklist tái sử dụng

- [ ] Xác định loại reuse cần thiết trước khi code
- [ ] Pattern A: `RouteContext` phải là provider ở route level (không ở root)
- [ ] Pattern B: Abstract class/token phải export riêng để tránh circular dependency
- [ ] Pattern C: `useExisting` phải list concrete class trước token trong `providers[]`
- [ ] Pattern D: Sub-component không được inject service hay facade trực tiếp
- [ ] Không share facade instance giữa các feature khác nhau — mỗi feature có facade riêng
