# dev/ — Frontend (Angular 21 / kiến trúc ESB-FE)

Nơi chứa **mã nguồn frontend**. Các agent `gen-*` (xem [`.claude/commands/`](../.claude/commands/), [`.claude/skills/`](../.claude/skills/)) sinh code **vào `dev/src/app/`** theo kiến trúc dưới đây. Quy tắc code: [`.claude/rules/angular-guidelines.md`](../.claude/rules/angular-guidelines.md).

## Cấu trúc

```
dev/
└── src/app/
    ├── core/        # Service lõi, guard, interceptor, model dùng toàn app (permissionGuard…)
    ├── shared/      # Component/dumb-component, pipe, directive tái sử dụng (output của gen-ui-component)
    └── features/    # MỖI feature 1 thư mục — output của gen-feature
        └── <feature-name>/
            ├── dto/           # *-item.ts, *-detail.ts, *-search.ts, *-status-change.ts
            ├── constants/     # *-permissions.ts, *-status.ts, list-columns.ts, search-config.ts
            ├── service/       # *-api.const.ts, *.service.ts, *.mock.ts, *.service.mock.ts
            ├── components/<feature>-item/   # item dialog (.ts/.html/.scss)
            ├── <feature>.facade.ts          # signal state + CRUD handlers
            ├── <feature>.component.ts/.html/.scss
            └── routes.ts                    # lazy load + permissionGuard + providers
```

## Thứ tự sinh code (dependency order — theo `gen-feature`)

`dto/` → `constants/` → `service/` → `facade` → `components` → `routes` → `mock`

Mỗi tầng import tầng trước. Chi tiết template: các skill `gen-dto`, `gen-constants`, `gen-api-service`, `gen-facade`, `gen-component`, `gen-routes`, `gen-mock`.

## Nguyên tắc (rút từ rules)
- Standalone components · Angular **signals** · OnPush · `@if`/`@for` · functional guards.
- **Facade-per-component** (không chia sẻ facade giữa các component).
- Component ≤ ~200 dòng; feature-based folders.

## ⚠️ Cần con người khởi tạo trước (bước `ng new`)

Khung này mới là **cây nguồn**. Để chạy/lint/test thực tế, cần khởi tạo project Angular (quyết định của con người — chưa thực hiện ở đây):

- `package.json` + dependencies (Angular 21, …) — vd `ng new` hoặc `pnpm create`
- `angular.json`, `tsconfig*.json`
- Lint: **Biome** (`pnpm lint` / `pnpm lint-fix` — như `gen-feature` Bước 3 tham chiếu)
- i18n setup (cho agent `05-i18n`)

> Sau khi khởi tạo, `dev/src/app/` skeleton này hợp nhất vào project; các agent `gen-*` sinh feature vào `src/app/features/`.

## Liên kết
- Đặc tả nghiệp vụ (đầu vào): [`ba/output/agents/`](../ba/output/agents/) + [`ba/process/`](../ba/process/)
- Pipeline agent: BA → `02-sa` → `03-coder` → `04-mock-data` → `05-i18n` → `06-runtime-verifier` → `07-qa` → `code-reviewer`
- Workflow: [`.claude/workflows/gen-feature.md`](../.claude/workflows/gen-feature.md)
