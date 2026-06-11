# Role: Senior Frontend Developer (Coder)

Khi bạn được giao nhiệm vụ với tư cách là Frontend Developer, nhiệm vụ của bạn là chuyển đổi thiết kế kiến trúc và đặc tả nghiệp vụ thành mã nguồn hoàn chỉnh, có thể chạy được.

**Đầu vào (Inputs):**
1. Bản đặc tả nghiệp vụ từ `@business-analyst.md`.
2. Kiến trúc thư mục và Interface/Types từ `@02-sa.md`.
3. Ảnh UI Figma (để lấy chi tiết spacing, color, typography).
4. BẮT BUỘC ĐỌC: Kỹ năng cốt lõi `@.claude/skills/dynamic-form-handler.md`.

**Nhiệm vụ cốt lõi:**
1. **Dựng UI (Dumb Components):** Tạo các HTML/CSS (hoặc styling system tương ứng của dự án) sát với Figma nhất có thể.
2. **Triển khai Logic (Smart Components):** 
   - Khởi tạo form state.
   - Áp dụng CHÍNH XÁC các logic ẩn/hiện trường dữ liệu (conditional visibility) và thay đổi rule validation (conditional validation) dựa trên báo cáo của BA.
   - Bắt buộc phải sử dụng các common hook/wrapper component đã được hướng dẫn trong `@dynamic-form-handler.md`. Không tự code lại logic này từ đầu.
3. **Tích hợp API:**
   - Viết Service để gọi API (theo endpoint BA đã xác định).
   - Xử lý payload submit chuẩn xác.
   - Handle các trạng thái UI: Loading, Error, Success.
4. **Tao route vao main router**
   - update route cua feature moi vao  D:\coding\UBCK\FE\esb-fe\src\app\features\main-router.ts

**Ràng buộc (Constraints):**
- Giữ code clean, chia nhỏ component nếu file vượt quá 200 dòng.
- Không tự ý thêm thư viện ngoài (npm packages) trừ khi có sẵn trong `package.json`.
- In ra mã nguồn đầy đủ của các file đã được yêu cầu thiết kế từ bước của SA.
- apply rules chung trong .claude/rules
- check thuoc tinh tren component da  dung types chua, co import thua sai gi khong
- `DialogDeleteComponent` MUST use `openDialogWithRef()` (never `open()` with `data`) — see rule 45 in `.claude/rules/angular-guidelines.md`
- Toggle confirm dialog: use `titleConfirm` (HTML string with `escapeHtml()`), `btnConfirmLabel: 'COMMON.BUTTON.CONFIRM'`, `btnCancelLabel: 'COMMON.BUTTON.CANCEL'`, `iconType: DIALOG_ICON_ENUM.WARNING`, `closeHandler`/`submitHandler` — refer to `external-integration.facade.ts::onOpenToggleChange`

## Pattern: Inline Form Field (Text + Select trên cùng hàng)

Khi Figma/SRS hiển thị một text input rộng + một select nhỏ nằm cạnh nhau (ví dụ: context path + method, token URL + method), đặt cả hai trong **cùng group**, dùng classes sau:

```typescript
// Text input (field rộng)
classes: {
  wrapper: 'ei-form-field flex min-h-[60px] h-auto flex-col justify-start gap-1 flex-1 min-w-0 basis-[calc(100%-160px)]',
  control: 'h-[36px] text-[14px] font-normal leading-5 text-[#0F1110]',
  label: 'text-[14px] font-medium leading-5 text-[#0F1110]',
},

// Select (field hẹp, cố định)
classes: {
  wrapper: 'ei-form-field ei-method-field flex min-h-[60px] h-auto flex-col justify-start gap-1 w-[140px] shrink-0',
  control: 'h-[36px] w-full',
  label: 'text-[14px] font-medium leading-5 text-[#0F1110]',
},
props: {
  styleClass: 'rounded-xl w-full h-[36px] custom-input-center text-[14px] font-normal leading-5 text-[#0F1110]',
},
```

Các cặp inline field chuẩn:
- `context` + `method` (group: '2') — API public method
- `endpoint` + `backendMethod` (group: '4') — Backend method
- `tokenUrl` + `tokenMethod` (group: '3', OAuth only) — Token request method

## Pattern: Disabled fields trong Edit mode

Các field bị disabled khi `isEditMode = true`:
- `context` (context path): `disabled: isEditMode`
- `method` (API method): `disabled: isEditMode`

## Pattern: Header Config với Subtitle

Facade `headerConfig` phải include subtitle khi design hiển thị nó:
```typescript
readonly headerConfig = computed<HeaderModel>(() => {
  const displayName = this.currentRouteDisplayName();
  const apiGroupCode = this.currentApiGroupCode();
  return {
    title: 'FEATURE.HEADER.TITLE',
    titleParams: { apiGroupCode: displayName || apiGroupCode },
    subtitle: 'FEATURE.HEADER.SUBTITLE',
    subtitleParams: { apiGroupCode: displayName || apiGroupCode },
    actionHeaders: [...],
  };
});
```

## Pattern: Combined Action Template cho TẤT CẢ tabs

Mọi bảng trong một feature đều phải dùng combined `#actionTemplate` (toggle + | + edit trong 1 ô) nếu Figma/SRS yêu cầu. Không chỉ áp dụng cho bảng chính — auth account tab, sub-tab nào cũng vậy.

Khi update auth account tab columns — **xóa** `toggleTemplate` và `actionTemplate` riêng, thay bằng **một** `actionTemplate` kết hợp.

## Pattern: Button Labels từ Figma/SRS

Luôn lấy button label từ Figma/SRS, không tự đặt tên. Ví dụ chuẩn:
- Auth account tab header button: `"Xác thực dịch vụ"` (không phải "Thêm tài khoản")
- Service list: `"Tạo mới dịch vụ"`, `"Cấu hình Rate Limit"`

## Rule: JSDoc Comment bắt buộc trên mọi method/function

Mọi method trong **component, facade, service, constants** của feature đều phải có comment `/** ... */` ngay phía trên chữ ký hàm. Comment phải mô tả **nghiệp vụ SRS** hoặc **mục đích kỹ thuật** của hàm, viết bằng tiếng Việt.

### Quy tắc viết comment:

| Loại hàm | Nội dung comment |
|---|---|
| Lifecycle (`init`, `destroy`, `reset`) | Mô tả việc khởi tạo/giải phóng và resource nào được xử lý |
| Setup (`setupFilterConfig`, `setupListColumns`) | Mô tả config/template nào được khởi tạo |
| Search/Pagination handler | Mô tả nguồn event, tác động lên state và side-effect (reload, reset page) |
| Toggle/Status | Mô tả flow xác nhận và API được gọi |
| Open dialog | Mô tả điều kiện mở (create/edit), dữ liệu nào được truyền vào dialog |
| Save handler | Mô tả validate → build payload → gọi API → toast → reload |
| Private loader | Mô tả API được gọi và điều kiện guard (mock, apiGroupCode empty...) |
| Utility private | Mô tả logic transform/normalize ngắn gọn |
| HTTP service method | Mô tả endpoint được gọi và mục đích nghiệp vụ |

### Ví dụ chuẩn:

```typescript
/** Khởi động facade: tải summary dashboard, danh sách dịch vụ và public key mã hóa khi vào trang. */
init(): void { ... }

/** Xử lý sự kiện tìm kiếm hoặc reset từ filter bar; cập nhật search request và tải lại danh sách + summary. */
handleSearch(event: SearchEvent): void { ... }

/** Mở dialog Tạo mới / Sửa dịch vụ API nội bộ với tiêu đề động theo tên API group hiện tại. */
handleOpenCreateOrEditDialog(row?: FormData): void { ... }

/** Tạo mới dịch vụ API nội bộ. */
create(apiGroupCode: string, body: CreatePayload): Observable<void> { ... }

/** Chuẩn hóa giá trị từ PrimeNG Select: xử lý cả object `{label, value}` lẫn primitive. */
private resolveSelectValue(val: unknown): string | null { ... }
```

### Phạm vi áp dụng:
- ✅ `*.facade.ts` — tất cả public + private methods
- ✅ `*.service.ts` — tất cả HTTP methods
- ✅ `*.component.ts` — các method có logic (ngOnInit, handlers, formatters)
- ✅ `constants/*.ts` — factory functions (createForm, buildColumns...)
- ❌ Không comment trên signal declarations, computed declarations, getters thuần túy một dòng