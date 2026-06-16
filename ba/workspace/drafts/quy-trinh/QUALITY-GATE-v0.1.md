---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Quality Gate"
---

# Quality Gate — Kiểm tra Chất lượng Tài liệu BA TOSS

> Checklist bắt buộc trước khi promote tài liệu từ `workspace/drafts/` → `sync/requirements/`. Tài liệu chỉ được promote khi **tất cả mục bắt buộc** được tích.

---

## Gate 1 — Kiểm tra Cấu trúc (Mọi loại tài liệu)

| # | Tiêu chí | Bắt buộc |
|---|---|---|
| 1.1 | YAML frontmatter đầy đủ 6 trường (project, author, version, date, status, document_type) | ✅ |
| 1.2 | `status` đang là `Approved` (không phải Draft hay In Review) | ✅ |
| 1.3 | Tên file đúng convention: `<TYPE>-TOSS-<NNN>-<mo-ta>-v<X.Y>.md` | ✅ |
| 1.4 | Không còn placeholder chưa xử lý: `*(chưa có)*`, `*(chưa rõ)*`, `TODO`, `FIXME` | ✅ |
| 1.5 | Không có link nội bộ bị broken (thư mục/file đích tồn tại) | ✅ |
| 1.6 | File đã qua ít nhất 1 vòng peer review (có comment REVIEWED) | ✅ |

---

## Gate 2 — Kiểm tra Nội dung Yêu cầu

| # | Tiêu chí | Bắt buộc |
|---|---|---|
| 2.1 | Mọi phát biểu dẫn nguồn từ tài liệu nguồn hoặc biên bản họp | ✅ |
| 2.2 | Không có suy diễn, phỏng đoán chưa được stakeholder xác nhận | ✅ |
| 2.3 | Nội dung chưa xác nhận được flag rõ: `[Câu hỏi — chờ xác nhận SH-xx]` | ✅ |
| 2.4 | Mọi ID tài liệu (BR-NNN, FR-NNN...) là duy nhất trong toàn dự án | ✅ |
| 2.5 | Thuật ngữ nhất quán với glossary (không tự sáng tạo từ mới) | ✅ |

---

## Gate 3 — Kiểm tra Truy vết (Traceability)

| # | Tiêu chí | Bắt buộc |
|---|---|---|
| 3.1 | FR → BR: mọi FR có ít nhất 1 BR cha | ✅ |
| 3.2 | US → FR: mọi US có ít nhất 1 FR tương ứng | ✅ |
| 3.3 | RTM đã được cập nhật với tài liệu này | ✅ |
| 3.4 | Không có yêu cầu "mồ côi" (không truy vết về đâu) | ✅ |

---

## Gate 4 — Kiểm tra Đặc thù theo Loại

### BRD

| # | Tiêu chí | Bắt buộc |
|---|---|---|
| 4.1 | Có stakeholder sign-off (ghi nhận trong biên bản họp) | ✅ |
| 4.2 | Phạm vi (scope) được định nghĩa rõ — in-scope và out-of-scope | ✅ |
| 4.3 | Assumption & Constraint đã liệt kê | ✅ |

### SRS

| # | Tiêu chí | Bắt buộc |
|---|---|---|
| 4.4 | Đặc tả chức năng có diagram luồng (Mermaid) | ✅ |
| 4.5 | Luật nghiệp vụ và validation rule được liệt kê | ✅ |
| 4.6 | Stakeholder phân hệ đã xác nhận nội dung | ✅ |
| 4.7 | NFR (chương 05) đã có ít nhất: hiệu năng, bảo mật, uptime | ✅ |

### Wireframe

| # | Tiêu chí | Bắt buộc |
|---|---|---|
| 4.8 | Tất cả màn hình trong SRS phân hệ đã được wireframe | ✅ |
| 4.9 | Trạng thái màn hình (loading, empty, error) đã mô tả | ✅ |

### Mockup HTML

| # | Tiêu chí | Bắt buộc |
|---|---|---|
| 4.10 | File mở offline không cần server | ✅ |
| 4.11 | Có README mô tả phạm vi demo | ✅ |
| 4.12 | Dữ liệu mẫu được đánh dấu rõ trên UI | ✅ |

---

## Gate 5 — Kiểm tra Ngôn ngữ & Định dạng

| # | Tiêu chí | Bắt buộc |
|---|---|---|
| 5.1 | Toàn bộ nội dung giao người dùng là tiếng Việt | ✅ |
| 5.2 | Thuật ngữ kỹ thuật lần đầu xuất hiện có giải thích tiếng Việt + viết tắt | ✅ |
| 5.3 | Không trộn ngôn ngữ trong cùng một câu (trừ thuật ngữ trong ngoặc) | ✅ |
| 5.4 | Bảng dữ liệu có header rõ ràng, căn chỉnh đúng | ✅ |

---

## Hướng dẫn Sử dụng Checklist

1. Tác giả tự kiểm tra **Gate 1, 2, 5** trước khi gửi peer review
2. Peer reviewer kiểm tra **Gate 3, 4** trong quá trình review
3. BA Lead kiểm tra **toàn bộ** trước khi Approve và promote
4. Mọi mục chưa pass → ghi comment rõ lý do, không bỏ qua
