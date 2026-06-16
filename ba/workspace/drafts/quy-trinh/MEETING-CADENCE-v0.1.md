---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-04"
status: "Draft"
document_type: "Quy trình — Meeting Cadence"
---

# Meeting Cadence — TOSS BA Team

---

## 1. Các Loại Họp Định kỳ

| Loại họp | Tần suất | Thời lượng | Người tổ chức | Người tham dự |
|---|---|---|---|---|
| **BA Weekly Sync** | Hàng tuần (thứ Hai) | 45 phút | BA Lead | BA team |
| **Stakeholder Workshop** | Theo phân hệ (1–2 lần/phase) | 2 giờ | BA Lead | BA team + stakeholder liên quan |
| **Review Session** | Khi có tài liệu cần review | 1–2 giờ | Tác giả | Reviewer + BA Lead |
| **BA–DEV Sync** | Hàng tuần (sau Weekly Sync) | 30 phút | BA Lead | BA Lead + Tech Lead |
| **Monthly Report** | Cuối tháng | 30 phút | BA Lead | PM + Sponsor |
| **Ad-hoc / Khẩn** | Khi cần | ≤ 30 phút | Người yêu cầu | Liên quan trực tiếp |

---

## 2. Agenda Chuẩn — BA Weekly Sync

```
1. Cập nhật tiến độ từng thành viên (5 phút/người — max 20 phút)
   - Tuần qua làm gì? (Done)
   - Tuần này làm gì? (Plan)
   - Vướng mắc gì? (Blocker)

2. Review tài liệu cần ý kiến nhóm (10 phút)
   - Câu hỏi từ workspace/drafts
   - Điểm mơ hồ cần thống nhất

3. Quyết định + Action items (10 phút)
   - Phân công nhiệm vụ mới
   - Deadline cụ thể

4. Thông báo từ BA Lead (5 phút)
   - Cập nhật từ PM/stakeholder
   - Thay đổi quy trình
```

---

## 3. Agenda Chuẩn — Stakeholder Workshop

```
1. Giới thiệu (5 phút)
   - Mục tiêu buổi họp
   - Phạm vi phân hệ được thảo luận

2. Trình bày As-Is (20 phút)
   - Walkthrough quy trình hiện tại
   - Xác nhận hiểu đúng

3. Thảo luận Pain points (20 phút)
   - Stakeholder chia sẻ vấn đề
   - BA ghi chép, không phán xét

4. Đề xuất To-Be (20 phút)
   - BA trình bày sơ bộ hướng To-Be
   - Thu thập phản hồi

5. Xác nhận yêu cầu ưu tiên (15 phút)
   - MoSCoW: Must/Should/Could/Won't
   - Stakeholder xếp hạng

6. Tóm tắt & Next steps (10 phút)
```

---

## 4. Template Biên bản Họp

Lưu tại: `ba/workspace/input/meeting-notes/MM-YYYYMMDD-<chu-de>.md`

```markdown
---
project: "TOSS"
date: "YYYY-MM-DD"
time: "HH:MM–HH:MM"
location: "(Phòng họp / Teams / Zoom)"
facilitator: "<Tên>"
note_taker: "<Tên>"
attendees:
  - "<Tên> — <Vai trò>"
document_type: "Meeting Notes"
---

# Biên bản Họp: <Tiêu đề>

## Mục tiêu Buổi Họp
<Mô tả ngắn>

## Nội dung Thảo luận
### <Chủ đề 1>
- <Điểm chính>
- <Điểm chính>
- **Quyết định:** <Quyết định đã đưa ra>

### <Chủ đề 2>
...

## Action Items
| # | Nhiệm vụ | Người thực hiện | Deadline |
|---|---|---|---|
| 1 | | | |
| 2 | | | |

## Câu hỏi Chưa Giải quyết
- [ ] <Câu hỏi cần làm rõ trong buổi sau>

## Buổi Họp Tiếp theo
- **Ngày:** <Ngày>
- **Chủ đề:** <Chủ đề>
```

---

## 5. Quy tắc Chung

- Biên bản họp phải gửi trong vòng **24 giờ** sau buổi họp
- Người ghi biên bản là Junior BA / Mid BA luân phiên
- Action items phải có **deadline cụ thể** và **tên người thực hiện**
- Nếu không đạt đủ người tham dự theo quy định → hoãn, không họp thiếu
- Mọi quyết định quan trọng phải ghi vào biên bản và NKLR (nếu liên quan yêu cầu)
