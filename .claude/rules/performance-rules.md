# Performance Rules
description: This file describes the performance rules for the project.
globs: **/*.ts, **/*.html

- Always use trackBy with loops
- Avoid unnecessary subscriptions
- Prefer signals over RxJS for local state
- Lazy load feature routes
- Avoid large templates
- Use OnPush change detection
- Avoid unnecessary change detection cycles
- Use pure pipes for expensive computations
- Avoid memory leaks by unsubscribing from observables
- Use Angular DevTools to identify performance bottlenecks
- Use `DestroyRef.onDestroy()` for cleanup instead of `ngOnDestroy` lifecycle hook to avoid implementing extra interfaces
