---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Definition of Done"
---

# Definition of Done — Tài liệu BA TOSS

> Tiêu chí "hoàn thành" cho từng loại artifact. Tài liệu chỉ được coi là **Done** khi đáp ứng **100%** các tiêu chí bắt buộc (✅) của loại đó.

---

## 1. BRD — Business Requirements Document

### Bắt buộc ✅
- [ ] YAML frontmatter đầy đủ (project, author, version, date, status, document_type)
- [ ] Tất cả BR có ID duy nhất (BR-NNN), mô tả rõ ràng, không mơ hồ
- [ ] Mỗi BR dẫn nguồn từ tài liệu nguồn hoặc biên bản họp cụ thể
- [ ] Không còn nội dung `*(chưa có)*` chưa được flag
- [ ] Đã qua peer review (ít nhất 1 Senior BA) và mọi comment Lỗi đã RESOLVED
- [ ] BA Lead đã Approve (status: `Approved`)
- [ ] Stakeholder đã sign-off (có ghi nhận trong biên bản)

### Khuyến nghị 🔵
- [ ] Có mục lục (Table of Contents)
- [ ] Bảng tóm tắt BR theo phân hệ
- [ ] Phần Risk & Assumption đã được xem xét

---

## 2. SRS — Software Requirements Specification

### Bắt buộc ✅
- [ ] YAML frontmatter đầy đủ
- [ ] Đầy đủ 7 chương (00-index đến 07-erd) theo cấu trúc `workspace/drafts/srs/`
- [ ] Mỗi FR có ID (FR-NNN), dẫn về BR tương ứng (truy vết ngược)
- [ ] Đặc tả chức năng (03-dac-ta-chuc-nang/) đầy đủ cho 7 phân hệ
- [ ] Luồng nghiệp vụ có diagram (Mermaid flowchart hoặc sequence)
- [ ] Yêu cầu phi chức năng (NFR) đã có — hiệu năng, bảo mật, khả dụng
- [ ] Đã qua peer review và BA Lead Approve
- [ ] Stakeholder phân hệ tương ứng đã xác nhận

### Khuyến nghị 🔵
- [ ] Bảng trạng thái dùng chung (§04) đồng bộ với tất cả phân hệ
- [ ] ERD đã phác thảo các entity chính
- [ ] Bảng thay đổi phiên bản (revision history)

---

## 3. Wireframe

### Bắt buộc ✅
- [ ] Mỗi màn hình có tên định danh duy nhất
- [ ] Đầy đủ các màn hình theo SRS phân hệ tương ứng (không bỏ sót)
- [ ] Mô tả rõ: trường dữ liệu, nút thao tác, luồng điều hướng
- [ ] Trạng thái màn hình được chỉ rõ (loading, empty, error, populated)
- [ ] Không có element chưa có nguồn từ SRS (phải gắn cờ nếu thêm)
- [ ] Đã qua peer review và BA Lead Approve

### Khuyến nghị 🔵
- [ ] Có sơ đồ điều hướng tổng thể (navigation map)
- [ ] Mô tả validation rule tại form fields
- [ ] Note cho DEV về component Angular Material tương ứng

---

## 4. HTML Mockup / Prototype

### Bắt buộc ✅
- [ ] File HTML tự chứa — mở được offline (không cần server/internet)
- [ ] Mọi element trên màn hình map được về Angular Material component
- [ ] Nhãn, trường dữ liệu lấy từ Wireframe/SRS — không tự nghĩ ra
- [ ] Dữ liệu hiển thị là dữ liệu mẫu, có ghi chú rõ ràng trên UI
- [ ] Luồng điều hướng chính hoạt động (prototype) hoặc layout đúng (mockup)
- [ ] BA Lead review và cho phép demo với stakeholder

### Khuyến nghị 🔵
- [ ] Có README.md mô tả phạm vi demo và luồng UX
- [ ] Annotate component data-mat và data-src cho DEV
- [ ] Ghi chú các điểm cần UI designer quyết định

---

## 5. User Story

### Bắt buộc ✅
- [ ] ID duy nhất (US-NNN), dẫn về FR tương ứng
- [ ] Đúng format: "Là [vai trò], tôi muốn [hành động], để [mục đích]"
- [ ] Ít nhất 3 Acceptance Criteria dạng Given-When-Then
- [ ] INVEST check pass (Independent, Negotiable, Valuable, Estimable, Small, Testable)
- [ ] Không có AC mơ hồ ("hệ thống nhanh", "giao diện đẹp") — phải đo được
- [ ] BA Lead đã review

### Khuyến nghị 🔵
- [ ] Ước lượng story point (nếu có Scrum)
- [ ] Liên kết đến Wireframe màn hình tương ứng
- [ ] Ghi chú edge case và negative scenario

---

## 6. RTM — Requirements Traceability Matrix

### Bắt buộc ✅
- [ ] Mọi BR có ít nhất 1 FR tương ứng
- [ ] Mọi FR có ít nhất 1 FUNC/US tương ứng
- [ ] Không có FR "mồ côi" (không dẫn về BR nào)
- [ ] Không có BR nào không được phủ bởi FR
- [ ] Cập nhật đồng bộ mỗi khi SRS thay đổi
- [ ] BA Lead kiểm tra và xác nhận

---

## 7. Quy tắc Version khi "Done"

| Trạng thái | Version | Vị trí |
|---|---|---|
| Draft đang làm | v0.x | `workspace/drafts/` |
| Peer reviewed lần 1 | v0.x (tăng minor) | `workspace/drafts/` |
| BA Lead Approved | v1.0 | `sync/requirements/` |
| Cập nhật sau Approved | v1.x | `sync/requirements/` (file mới, giữ cũ) |
| Major revision | v2.0 | `sync/requirements/` (kèm CR) |
