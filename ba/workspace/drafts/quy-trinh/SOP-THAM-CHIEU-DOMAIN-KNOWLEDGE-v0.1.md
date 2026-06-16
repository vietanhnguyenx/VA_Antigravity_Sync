---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA (agent-assisted)"
version: "0.1"
date: "2026-06-16"
status: "Draft — tài liệu sống, cải tiến dần trong quá trình phân tích"
document_type: "SOP"
---

# SOP — Tham chiếu domain-knowledge trong khi phân tích nghiệp vụ

> **Mục tiêu:** vừa phân tích vừa tra cứu `domain-knowledge/` **đúng điểm — đúng nguồn — đủ trích dẫn**, không phá mạch làm việc và không tốn token thừa.
> **Tài liệu sống:** cập nhật mỗi khi phát hiện cách tra tốt hơn / thuật ngữ mới / khoảng trống KB.

---

## 1. Nguyên tắc (bám CLAUDE.md §0)
- **Tra theo "điểm", không "đọc nền":** đang phân tích, gặp điểm cần làm rõ → tra đúng 1 điểm → trích nguồn → viết tiếp. KHÔNG nạp sẵn cả KB.
- **KB chỉ LÀM RÕ, không THAY nguồn:** transcript/YCKT/tài liệu khách hàng là gốc; domain-knowledge chỉ giải thích nội dung đã có. Không suy diễn.
- **Thiếu trong KB → gắn cờ, không bịa:** ghi `[cần xác nhận]` + vào sổ OID; đề xuất bổ sung glossary.

## 2. Vòng lặp thao tác (mỗi lần "chạm" KB)
1. **Phân loại điểm cần tra** (định tuyến):
   - Từ vựng / viết tắt → `toss-glossary-v0.1.md` (skill `term-check`).
   - Quy định / quy trình / chuẩn → thư mục chuyên đề (`faa-icao-dispatcher-core/`, `briefing/`, `atfm-acdm/`, `datalink-pbcs/`, `iata-definitions/`…).
2. **Vào bằng INDEX:** `domain-knowledge/INDEX.md` → INDEX thư mục con → đúng `sec-*.md`. Không quét cả thư mục.
3. **Đọc chọn lọc:** `Grep -n "<từ khóa>"` lấy đúng vài dòng + số dòng; chỉ đọc thêm ngữ cảnh quanh đó nếu cần. KHÔNG đọc cả `_full.md`.
4. **Trích dẫn tại chỗ:** gắn `(nguồn: <file>:<dòng>)` vào artifact đang soạn.
5. **Đối chiếu scope:** ưu tiên gắn điểm phân tích về một mã tích hợp/yêu cầu trong **YCKT** (sheet-06 tích hợp / YCKT V3) để biết có trong phạm vi TOSS không.

## 3. Quy tắc ưu tiên khi mâu thuẫn
1. **Khách hàng/YCKT** > glossary > KB tổng quát (FAA/ICAO chỉ tham khảo/giải thích).
2. Bản **Việt Nam/bản địa** > bản khu vực (vd `SP08-A-CDM-Viet-Nam` > APAC A-CDM).

## 4. Công cụ
| Việc | Công cụ |
|---|---|
| Tra thuật ngữ + nguồn `file:line` | skill `term-check` · `find-term.ps1` · `toss-glossary-v0.1.md` |
| Tra xuyên KB, ghim đúng dòng | `Grep -n` (glob theo thư mục) |
| Mở đúng mục tài liệu lớn | `*_parts/sec-*.md` + `INDEX.md` mỗi thư mục |
| PDF chưa phân rã (atfm-acdm, datalink-pbcs) tra nhiều lần | phân rã sang MD trước (markitdown/pdftotext) → tra chọn lọc |

## 5. Ví dụ
> Đang phân rã YCKT về "Performance Factor từ ACARS". Gặp **PBCS** chưa rõ:
> (1) viết tắt → `term-check PBCS`; thiếu → (2) INDEX tổng → `datalink-pbcs/INDEX.md` → file PBCS → (3) `Grep -n "authorization"` lấy định nghĩa → (4) viết kèm `(nguồn: datalink-pbcs/PBCS-…pdf)` → (5) đề xuất thêm **PBCS** vào glossary (trình confirm trước khi ghi).

## 6. Cải tiến dần (ghi lại khi phát sinh)
- [ ] Thuật ngữ mới phát hiện → bổ sung `toss-glossary-v0.1.md` (trình đề xuất trước khi ghi).
- [ ] Tài liệu KB tra nhiều lần nhưng còn ở dạng PDF → ưu tiên phân rã sang MD.
- [ ] Khoảng trống KB (không có nguồn làm rõ) → ghi vào OID để khảo sát.
- [ ] Mẹo tra/Grep pattern hiệu quả → cập nhật §4.

---
*Liên quan: rule bộ nhớ "định tuyến tra domain-knowledge", "đọc/ghi file tiết kiệm token"; INDEX `domain-knowledge/INDEX.md`.*
