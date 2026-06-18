---
name: gen-mockup
description: Dựng MOCKUP (blueprint tĩnh) hoặc PROTOTYPE (bản tương tác clickable) giao diện HTML TỰ CHỨA (offline), TUÂN THỦ PrimeNG 21 + wrapper nội bộ ESB-FE (mỗi element map 1:1 sang component trong catalog primeng-components.md) + chú thích component để DEV implement trung thực. Dùng khi người dùng muốn "tạo mockup", "dựng mockup", "prototype", "demo màn hình", "bản tương tác", "gen mockup".
---

# Skill: Gen Mockup (giao diện tuân thủ PrimeNG 21)

Sinh **mockup HTML tự chứa** (mở bằng trình duyệt, không cần internet/build) để validate giao diện sớm với khách/BA — **trình bày theo PrimeNG Aura** và **chú thích component PrimeNG / wrapper nội bộ** cho mỗi vùng, để DEV implement đúng thư viện (DEV stack = Angular 21 + PrimeNG 21, rule #18).

> **Phân biệt với code:** mockup/prototype = bản mẫu *trực quan để duyệt* (đặt ở `ba/process/mockup/`). KHÁC với code thật (skill `gen-*` sinh Angular vào `dev/`). Không phải code chạy được, là *bản thiết kế có chú thích*.

## Hai mức độ (fidelity) — chọn theo nhu cầu

| Mức | Là gì | Khi nào | File |
|---|---|---|---|
| **Mockup** (tĩnh) | Blueprint: bố cục + thành phần + chú thích component. Tương tác tối thiểu (đổi màn, mở popup). | Duyệt bố cục/đủ trường, làm nhanh nhiều màn. | `<màn>-mockup.html` |
| **Prototype** (tương tác) | Clickable: **mô phỏng luồng nghiệp vụ** — chuyển trạng thái, điều kiện ẩn/hiện, validation, list↔chi tiết, mô phỏng hệ ngoài (vd Voffice duyệt). | Demo end-to-end cho khách, kiểm chứng UX luồng trước khi code. | `<màn>-prototype.html` |

> Prototype = mockup **+ hành vi luồng**. Cùng tuân thủ §0 + map Material; chỉ khác: prototype hiện **thêm tương tác mô phỏng**.

### Quy tắc riêng cho PROTOTYPE
- **Chỉ mô phỏng luồng CÓ TRONG NGUỒN** (mục "Luồng nghiệp vụ" của SRS + ký hiệu trạng thái trong wireframe). Không tự nghĩ ra bước/nhánh mới (§0).
- **State machine = đúng tập trạng thái nguồn** (vd Lệnh: Chờ duyệt→Đang duyệt→Đã duyệt/Từ chối; Phiếu nhập: Chờ kiểm định→Đã nhập kho/Đã hủy).
- **Hệ thống ngoài** (Voffice duyệt, đọc QR…) → **mô phỏng** bằng nút "(giả lập)" có nhãn rõ + ghi chú "demo — thực tế do <hệ> xử lý". Không giả vờ là thật.
- **Điều kiện ẩn/hiện & validation** lấy đúng từ rule nguồn (vd Loại nhập=Thành phẩm → disable NCC `[UI:I.1]`).
- JS thuần, tự chứa; mỗi bước luồng vẫn gắn `data-src`. Banner ghi rõ "PROTOTYPE — tương tác mô phỏng, dữ liệu mẫu".

## Tuân thủ (BẮT BUỘC — CLAUDE.md §0)

- **Chỉ vẽ element có trong nguồn** (SRS `ba/process/srs/`, wireframe `ba/process/wireframe/`, `[MT]/[PR]/[UI]/[BB]`). Trường/nhãn/trạng thái/nút **lấy từ nguồn**, có dẫn chiếu.
- **Bố cục/màu là đề xuất cần con người (BA/UI) duyệt** — ghi rõ trong header.
- **Số liệu là dữ liệu mẫu** — đánh dấu rõ.
- Element không có component PrimeNG / wrapper tương ứng → ghi `(custom / cần bổ sung)` + flag, **không bịa**.

## Đầu vào

1. Đặc tả màn: `ba/process/srs/<phân hệ>` (mục Màn hình + Mô tả thành phần + Luồng).
2. Wireframe: `ba/process/wireframe/<wf>` (bố cục low-fidelity đã duyệt).
3. **Catalog component (CANONICAL):** [`.claude/knowledge/primeng-components.md`](../../knowledge/primeng-components.md) — chọn đúng component cho mỗi element (bảng "UI need → PrimeNG component" + §8 wrapper nội bộ). Wrapper ESB-FE (IamTable, cmm-dynamic-form…) **ưu tiên trước** PrimeNG gốc.
4. Design system: `ba/process/srs/08-design-system.md` (palette, typography, density). Nếu chưa có giá trị → dùng token mặc định của template (PrimeNG Aura, primary Viettel đỏ `#EE0033`), đánh dấu `TBD`.

## Quy trình

1. **Đọc nguồn** → liệt kê các màn cần dựng + các element mỗi màn (kèm dẫn nguồn).
2. **Map mỗi element → component PrimeNG / wrapper** (tra catalog; wrapper ESB-FE ưu tiên). Lập "component map" (element → `IamTable (p-table)` / `p-*` + nguồn).
3. **Copy template** `assets/primeng-base.html` làm khung (đã có Aura tokens + PrimeIcons + sẵn các pattern: ubck-header, p-panelMenu, p-card, ubck-filter, IamTable, p-button, DialogRegistry, IamBadgeStatus…).
4. **Dựng từng màn** trong khung: dùng các pattern PrimeNG có sẵn; **mỗi vùng gắn `data-pui="<wrapper (p-component)>"`** (chú thích map) + `data-src="[nguồn]"`.
5. **Áp design-system:** primary seed = màu thương hiệu (Viettel đỏ `#EE0033` mặc định) đưa vào `--p-primary-*` (PrimeNG Aura tokens); density + typography theo design-system; icon dùng PrimeIcons (`pi pi-*`).
6. **Chèn header comment** (theo mẫu mockup hiện có): nêu §0, nguồn, "số liệu mẫu", "bố cục cần duyệt".
7. **Legend cuối trang:** bảng liệt kê mọi `data-pui` đã dùng → tên component PrimeNG / wrapper + link docs/rule, để DEV tra nhanh.

## Đầu ra

- File: `ba/process/mockup/<phân-hệ-hoặc-màn>-mockup.html` (kebab-case, không dấu).
- **Tự chứa:** CSS inline; icon dùng PrimeIcons `pi pi-*` (CDN + ghi chú offline: nếu mạng nội bộ chặn, nhúng font hoặc dùng SVG inline) — phù hợp ràng buộc mạng local `[BB14 mục 6]`.
- **Tiếng Việt** cho mọi nhãn (ngôn ngữ end-user).
- **Responsive** tối thiểu: desktop + 1 breakpoint (theo CDK Layout note trong catalog).

## Quy ước chú thích (điểm cốt lõi)

```html
<!-- mỗi vùng UI: data-pui = wrapper (p-component gốc), data-src = nguồn -->
<div data-pui="IamSearchInput (pInputText)" data-src="[MT II.2] SRS 3.2">
  <label>Số lệnh sản xuất</label><input ... />
</div>
<!-- bảng danh sách: ưu tiên wrapper nội bộ -->
<table data-pui="IamTable (p-table)" data-src="[PR] SRS 3.x">…</table>
```

→ Quy ước `data-pui`: **wrapper nội bộ trước, PrimeNG gốc trong ngoặc** (vd `IamTable (p-table)`); element thuần PrimeNG thì ghi thẳng `p-*` (vd `p-datepicker`).
→ Mockup vừa để khách duyệt *trực quan*, vừa là *blueprint* chỉ rõ DEV phải dùng component nào (khớp `gen-*`).

## QC trước khi bàn giao

- [ ] Mở được bằng trình duyệt, không lỗi console, không cần internet (hoặc đã ghi chú font).
- [ ] Mọi element có `data-mat` map về catalog (không có component "lạ" ngoài catalog; nếu có → `(custom)` + flag).
- [ ] Mọi trường/nhãn có `data-src` dẫn nguồn; số liệu đánh dấu mẫu.
- [ ] Header comment đủ: §0 + nguồn + "bố cục cần duyệt".
- [ ] Legend liệt kê đủ component đã dùng.

## Liên kết
- Catalog: [`angular-material-components.md`](../../knowledge/angular-material-components.md)
- Wireframe nguồn: `ba/process/wireframe/`
- Sau khi duyệt → DEV dùng `gen-feature`/`gen-component` sinh code Angular tương ứng vào `dev/`.
