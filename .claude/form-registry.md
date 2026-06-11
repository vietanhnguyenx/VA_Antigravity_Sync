# TOSS Form Registry — Danh Sách Biểu Mẫu Dự Án

> **AGENTS: Bắt buộc đọc file này trước khi tạo bất kỳ biểu mẫu nào.**
> Nếu biểu mẫu yêu cầu đã có trong registry và `human_verified = true`, phải tuân thủ 100% style/cấu trúc của mẫu đó.
> Sau khi tạo biểu mẫu mới, cập nhật registry này ngay trong cùng task.

---

## Quy trình tra cứu (cho Agents)

1. Đọc registry này để xác định biểu mẫu cần tạo đã có chưa.
2. Nếu có (`human_verified = true`): đọc `memory_ref` để lấy toàn bộ quy ước, tuân thủ 100%.
3. Nếu có (`human_verified = false`): dùng làm tham chiếu nhưng đánh dấu cần xác nhận lại.
4. Nếu chưa có: tạo mới theo yêu cầu, sau đó **bổ sung entry vào registry này** với `human_verified = false`.
5. Human xác nhận xong → cập nhật `human_verified = true` và ghi `verified_date`.

---

## Danh sách biểu mẫu

### BBKS — Biên Bản Khảo Sát Nghiệp Vụ

| Trường | Giá trị |
|---|---|
| **Mã biểu mẫu** | BBKS |
| **Tên đầy đủ** | Biên Bản Khảo Sát Nghiệp Vụ |
| **Mục đích** | Ghi nhận kết quả buổi khảo sát nghiệp vụ với đơn vị được khảo sát; liệt kê quy trình nghiệp vụ, yêu cầu người dùng, và phụ lục dữ liệu |
| **File mẫu gốc** | `ba/input/BBKS_PhanHeQuanLyDanhMucDungChung.docx` |
| **Memory ref** | `memory/project_bbks-template-style.md` |
| **Compliance rule** | `memory/feedback_bbks-compliance.md` |
| **human_verified** | ✅ `true` |
| **verified_date** | 2026-05-28 |
| **Ghi chú** | Lề trái 3cm, body 14pt, chữ ký đầy đủ (tên + chức danh + 7 dòng trống), có PHỤ LỤC, KHÔNG có mã số văn bản |

**Cấu trúc bắt buộc (9 phần theo thứ tự):**
1. Trang bìa: Logo → Tên tổ chức → Tiêu đề BBKS (16pt) → Bảng thông tin KS → Ngày italic → Bảng chữ ký
2. PHẦN I: TỔNG QUAN (Mục đích + Phạm vi)
3. PHẦN II: NỘI DUNG KHẢO SÁT (mỗi quy trình: Đầu vào/ra → Sơ đồ → Bước N)
4. PHẦN III: DANH SÁCH YÊU CẦU CỦA NGƯỜI SỬ DỤNG
5. PHẦN IV: Ý KIẾN BỔ SUNG CỦA ĐƠN VỊ
6. PHỤ LỤC: CÁC THÔNG TIN CÓ LIÊN QUAN (5 mục I–V)

---

### BBLV — Biên Bản Làm Việc

| Trường | Giá trị |
|---|---|
| **Mã biểu mẫu** | BBLV |
| **Tên đầy đủ** | Biên Bản Làm Việc |
| **Mục đích** | Ghi nhận kết quả buổi làm việc / demo, các nội dung đã thống nhất, và công việc cần thực hiện tiếp theo |
| **File mẫu gốc** | `ba/input/BBLV_DEMO QLNDTT & DMDTDC.docx` |
| **Memory ref** | `memory/project_bblv-template-style.md` |
| **Compliance rule** | `memory/feedback_bblv-compliance.md` |
| **human_verified** | ✅ `true` |
| **verified_date** | 2026-05-28 |
| **Ghi chú** | Lề đều 4 phía 2.54cm, body 13pt, chữ ký chỉ có nhãn bên (không tên/chức danh), có mã số `Số: [N]/BB - VTS`, KHÔNG có Mục 3 (nhảy 2→4) |

**Cấu trúc bắt buộc (theo thứ tự):**
1. Bảng letterhead (2 hàng × 2 cột, không viền): Viettel | Cộng hòa / Số văn bản | Ngày italic
2. Tiêu đề: `BIÊN BẢN LÀM VIỆC` (16pt) + tên chủ đề (14pt)
3. Câu mở đầu (thời gian **bold**, địa điểm, các bên) + `"Nội dung cụ thể như sau:"`
4. Mục 1: Thành phần tham gia (dash thủ công `- Ông/Bà:`)
5. Mục 2: Nội dung họp → 2.1 / 2.2 (bullet 4 cấp: ●○▪▪)
6. Mục 4: Bảng công việc tiếp theo (4 cột, header xám D9D9D9)
7. Bảng chữ ký (2 cột, không viền, chỉ nhãn bên)

---

## Biểu mẫu đang chờ / kế hoạch

*Chưa có biểu mẫu nào trong danh sách chờ.*

---

## Lịch sử cập nhật

| Ngày | Hành động | Biểu mẫu | Người thực hiện |
|---|---|---|---|
| 2026-05-28 | Tạo registry, thêm BBKS | BBKS | Claude (từ phân tích mẫu gốc) |
| 2026-05-28 | Thêm BBLV | BBLV | Claude (từ phân tích mẫu gốc) |
