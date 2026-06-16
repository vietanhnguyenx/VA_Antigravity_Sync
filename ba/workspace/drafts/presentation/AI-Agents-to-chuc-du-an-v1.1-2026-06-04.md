---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "1.1"
date: "2026-06-04"
status: "Draft"
document_type: "Presentation — AI Agents trong Tổ chức Dự án"
audience: "PM, BA Team, Stakeholder kỹ thuật"
---

# Tổ chức Dự án Kết hợp AI Agents
### Ví dụ thực tế: Dự án TOSS

---

## Slide 1: Tiêu đề

### Trình bày

```
┌──────────────────────────────────────────────────────┐
│                                                      │
│   ĐƯA AI AGENTS VÀO NHÓM DỰ ÁN                     │
│                                                      │
│   Từ công cụ tùy hứng đến thành viên                │
│   có vai trò rõ ràng                                │
│                                                      │
│   Ví dụ thực tế: TOSS                               │
│   Hệ thống Điều hành Khai thác Hàng không           │
│                                                      │
│   BA Lead  ·  2026-06-04                            │
│                                                      │
└──────────────────────────────────────────────────────┘
```

### Thuyết minh

Hôm nay tôi không nói về TOSS — tôi nói về một cách tổ chức làm việc, và TOSS là dự án thực tế tôi dùng để minh hoạ. Vấn đề tôi muốn đặt ra là thế này: hầu hết các nhóm đang dùng AI như một cái máy tra Google thông minh hơn — hỏi, nhận câu trả lời, đóng cửa sổ. Tôi nghĩ có một cách dùng khác, và hiệu quả hơn nhiều.

---

## Slide 2: AI Agent khác gì AI Tool?

### Trình bày

```
  CHATBOT / AI TOOL              AI AGENT
  ─────────────────              ──────────────────────
  Anh hỏi → nó trả lời          Anh giao việc →
  Xong một lượt, quên ngay       nó tự lên kế hoạch
  Không làm được gì              Đọc file, ghi file,
  ngoài trả lời chữ              chạy lệnh, kiểm tra
                                 Nhiều bước, có nhớ
                                 Báo cáo kết quả
```

**Ba thứ tạo ra sự khác biệt:**

| | Đặc điểm | Nói nôm na là |
|---|---|---|
| 1 | Tự chủ | Tự nghĩ ra bước tiếp theo, không chờ hỏi từng bước |
| 2 | Dùng được công cụ | Đọc/ghi file thật, không chỉ nói lý thuyết |
| 3 | Nhớ ngữ cảnh | Biết mình đang ở dự án nào, quy tắc là gì |

### Thuyết minh

Tôi hay dùng ví dụ này: nếu anh nhờ ChatGPT "viết email xin phép nghỉ" thì đó là AI tool — nó trả lời, xong. Còn nếu anh nói với Claude Code "đọc tài liệu yêu cầu trong thư mục này, tìm những điểm còn mơ hồ, soạn bộ câu hỏi cần hỏi khách hàng, lưu lại theo đúng định dạng của dự án" — và nó tự làm từ đầu đến cuối mà không cần anh hướng dẫn từng bước — thì đó mới là AI Agent. Cái tạo ra sự khác biệt là nó *làm được việc thật*, không chỉ nói chuyện. Và nó nhớ — mỗi lần anh mở dự án lên, nó đã biết anh đang làm gì, quy tắc là gì, tài liệu nằm ở đâu.

---

## Slide 3: Người giỏi đang làm việc của người kém hơn

### Trình bày

**Cách làm thông thường:**
```
Senior BA soạn SRS   →   Junior BA xem lại   →   Lead phê duyệt
      [3 ngày]                [2 ngày]               [1 ngày]
      Mỗi người bắt đầu từ con số không
```

**Khi thêm Agent vào:**
```
Senior BA nói: "Đây là yêu cầu, nguyên tắc thế này, viết theo cấu trúc này"
      ↓
Agent soạn bản nháp — đúng cấu trúc, đánh số ID, dẫn nguồn tự động
      ↓  [30 phút thay vì 3 ngày]
Senior BA đọc và phán xét: cái này đúng nghiệp vụ chưa?
      ↓
Agent tự kiểm tra lỗi định dạng trước khi giao
      ↓
Lead chỉ cần xét nội dung — không mất thêm thời gian đọc lỗi format
```

**Điểm mấu chốt:** Senior BA dùng thời gian để *suy nghĩ*, không để *gõ phím*.

### Thuyết minh

Tôi từng thấy Senior BA mất nửa buổi sáng để căn chỉnh tiêu đề, đánh số mục, điền đúng ngày tháng vào mọi tài liệu. Đó là việc không cần kinh nghiệm mới làm được. Agent làm việc đó nhanh hơn, ít lỗi hơn, và không bao giờ quên. Trong khi đó, thứ thực sự cần người có kinh nghiệm — đặt câu hỏi đúng chỗ khi phỏng vấn khách hàng, nhận ra khi nào hai yêu cầu đang mâu thuẫn nhau, quyết định cái nào ưu tiên hơn — thì agent không làm được. Mô hình này đơn giản là: đưa đúng việc về đúng chỗ.

---

## Slide 4: Ai làm gì — ranh giới không được lẫn lộn

### Trình bày

```
        CON NGƯỜI                       AI AGENT
        ─────────                       ─────────────────
   Quyết định LÀM GÌ               Thực hiện LÀM THẾ NÀO
   ─────────────────────            ────────────────────────
   • Suy diễn ý nghĩa               • Soạn tài liệu theo mẫu
   • Làm việc với khách hàng        • Kiểm tra tính nhất quán
   • Phê duyệt tài liệu             • Định dạng, đánh số, dẫn nguồn
   • Sắp xếp thứ tự ưu tiên         • Đối chiếu chéo giữa tài liệu
   • Xử lý khi có mâu thuẫn         • Xuất sang định dạng khác
   • Chịu trách nhiệm kết quả       • Tổng hợp từ nhiều nguồn

              ↕ Cùng làm ↕
   Con người đặt câu hỏi ←→ Agent phát hiện điểm bất thường
```

**Câu hỏi để xác định:** Việc này cần *phán đoán* không? → Con người làm. Có thể *đọc quy tắc rồi làm*? → Agent làm.

### Thuyết minh

Đây là điều tôi thấy quan trọng nhất, và cũng là điều dễ làm sai nhất. Nếu để agent tự suy diễn thay con người, bạn sẽ có tài liệu trông rất bài bản nhưng đầy những giả định chưa ai xác nhận — và thường thì không ai biết cho đến khi có vấn đề. Ngược lại, nếu cứ để con người làm tất cả những thứ agent có thể làm được thì chỉ là lãng phí. Ranh giới này còn có một tác dụng phụ tốt: khi ai đó hỏi "cái này do ai làm ra và dựa trên cơ sở nào" thì có câu trả lời rõ ràng — không phải "uhm, agent nó tự làm".

---

## Slide 5: AI Agent trong sơ đồ tổ chức

### Trình bày

```
                    ┌─────────────────┐
                    │    BA LEAD      │
                    │ Quyết định,     │
                    │ phê duyệt,      │
                    │ quan hệ KH      │
                    └────────┬────────┘
          ┌──────────────────┼──────────────────┐
          ▼                  ▼                  ▼
    ┌───────────┐     ┌───────────┐    ┌──────────────────┐
    │ SENIOR BA │     │  MID BA   │    │   AI AGENTS      │
    │           │     │           │    │ ────────────────  │
    │ Chủ trì   │◄───►│ Thực hiện │◄──►│ phân tích yêu cầu│
    │ từng phần │     │ có hướng  │    │ xem xét tài liệu │
    │ nghiệp vụ │     │ dẫn       │    │ dựng giao diện   │
    └───────────┘     └───────────┘    │ xuất tài liệu    │
          ▲                  ▲         └──────────────────┘
    ┌───────────┐     ┌───────────┐
    │ JUNIOR BA │     │  INTERN   │
    │ Ghi chép  │     │ Nghiên cứu│
    └───────────┘     └───────────┘
```

**Điểm khác biệt:** Agent có vai trò cụ thể, có giới hạn quyền hạn — không phải công cụ ai muốn dùng cách nào cũng được.

### Thuyết minh

Cái khác ở đây là: thay vì mỗi người tự mày mò dùng AI theo cách riêng của mình, chúng tôi đưa agent vào sơ đồ tổ chức như một thành viên thực sự — có danh sách việc được làm, có giới hạn, và phải báo cáo cho con người trước khi kết quả đi ra ngoài. Tương tự như Junior BA không được tự ý phê duyệt tài liệu, agent cũng không được tự ý đưa kết quả ra môi trường chính thức. Khi tổ chức theo cách này, nếu có sự cố thì biết ngay cần xem lại ở đâu trong quy trình — thay vì loay hoay đổ lỗi qua lại.

---

## Slide 6: Phân công — Ai được dùng Agent nào?

### Trình bày

**Bảng phân quyền sử dụng Agent:**

| Công cụ / Agent | Lead | Senior | Mid | Junior | Thực tập |
|---|---|---|---|---|---|
| Tạo câu hỏi phỏng vấn | Chủ trì | Tự làm | Có kèm | Quan sát | Quan sát |
| Soạn tài liệu yêu cầu | Chủ trì | Tự làm | Có kèm | — | — |
| Soạn user story | Chủ trì | Tự làm | Tự làm | Có kèm | Quan sát |
| Ghi biên bản họp | Chủ trì | Tự làm | Tự làm | Tự làm | Có kèm |
| Dựng giao diện mẫu | Chủ trì | Tự làm | Tự làm | Có kèm | Quan sát |
| Xem xét tài liệu | Chủ trì | Tự làm | Có kèm | — | — |

**Tự làm** = thực hiện và tự chịu trách nhiệm kết quả  ·  **Có kèm** = cần người hướng dẫn

### Thuyết minh

Lý do phải có bảng này là vì agent mạnh, dùng sai sẽ ra kết quả tệ mà trông lại rất thuyết phục — nguy hiểm hơn là sai lộ liễu. Senior BA biết khi nào cần đặt câu hỏi lại với agent, biết dấu hiệu nào cho thấy kết quả cần xem xét thêm. Junior thì chưa có kinh nghiệm đó, nên cần người đi cùng. Bảng này cũng có tác dụng thực tế khi nhận người mới: thay vì giải thích từ đầu, chỉ cần chỉ vào bảng và nói "anh/chị đang ở mức này, được làm những thứ này theo cách này".

---

## Slide 7: Luồng làm việc trong thực tế

### Trình bày

```
  CON NGƯỜI                  AGENT                   CON NGƯỜI
  ──────────────             ──────────────           ──────────────
  Quyết định phạm vi   →    Đọc tài liệu gốc   →    Xem nội dung
  Cung cấp ngữ cảnh          Áp quy tắc và mẫu        Phán xét nghiệp vụ
  Xác nhận nguồn             Soạn bản nháp             Phát hiện sai sót
                             Tự kiểm tra lỗi     →    Phê duyệt hoặc yêu cầu làm lại
                                    ↓
                           [Bản thảo đã qua kiểm tra]
                                    ↓
                           Con người đưa vào kho chính thức
```

**Vòng lặp:** Giao việc → Bản nháp → Kiểm tra → Xem xét → Phê duyệt (hoặc làm lại)

### Thuyết minh

Có một điểm tôi muốn nhấn mạnh ở đây: agent không chỉ soạn rồi giao — nó còn tự kiểm tra trước. Cụ thể là những lỗi mang tính hình thức: còn sót chỗ nào chưa điền không, đánh số ID có đúng không, tên file có đúng quy ước không. Đây là những thứ người review thường mất 30% thời gian chỉ để tìm, trong khi đó không phải điểm quan trọng. Sau khi agent đã tự lọc xong, người review chỉ cần hỏi một câu: nội dung này có đúng nghiệp vụ không. Đơn giản hơn nhiều. Và điều quan trọng: agent không được tự đưa kết quả vào kho chính thức — con người phải là người bấm nút cuối cùng.

---

## Slide 8: Hai khu vực, hai nguyên tắc

### Trình bày

```
  KHU VỰC CÁ NHÂN (thử nghiệm tự do)   KHU VỰC NHÓM (đã được duyệt)
  ─────────────────────────────────      ─────────────────────────────
  Tài liệu gốc / biên bản họp           Yêu cầu đã phê duyệt
  Kiến thức nghiệp vụ                   Tài liệu mô hình hệ thống
  Bản nháp SRS, wireframe, mockup       Kết quả xuất cho khách hàng
  Quy trình nội bộ nhóm BA             Kết quả xuất cho team DEV/QC

  Agent: đọc và ghi thoải mái           Agent: chỉ đọc
  Con người: thử, sửa, bỏ              Con người: chỉ có Lead được đưa vào
```

**Nguyên tắc:** Không ai — kể cả agent — được đưa thứ gì vào khu vực nhóm mà không qua phê duyệt.

### Thuyết minh

Cấu trúc này thực ra có cùng tinh thần với mô hình nhánh trong Git — mỗi người có nhánh riêng để làm thoải mái, chỉ merge vào nhánh chính khi đã ổn. Khu vực cá nhân là nơi agent có thể đọc ghi tự do, con người có thể thử và bỏ không cần lo lắng. Còn khu vực nhóm là nơi chính thức — cái gì vào đây thì mọi người trong nhóm xem là đúng, là nguồn tham chiếu. Ngoài ra, phần dành cho team DEV và QC đáng chú ý: đây không phải tài liệu giao cho người đọc mà là tài liệu giao cho agent phía sau đọc — nên cần viết theo cách khác, súc tích hơn, ít ngôn từ hoa mỹ hơn.

---

## Slide 9: Kết quả từ TOSS

### Trình bày

**Bối cảnh:** Hệ thống khai thác hàng không, 7 mảng nghiệp vụ lớn, phải tuân thủ quy định CAAV và ICAO

**Những gì nhóm BA hoàn thành trong thời gian ngắn:**

| | Hạng mục | Số lượng | Cách làm |
|---|---|---|---|
| 📄 | Tài liệu quy trình nội bộ | 14 tài liệu | Agent soạn, người xem xét |
| 🔧 | Công cụ slash command | 6 lệnh | Agent thực thi theo quy tắc |
| 📤 | Công cụ xuất tài liệu | 2 loại | Agent xuất, Lead duyệt |
| 📚 | Từ điển thuật ngữ hàng không | ~30 thuật ngữ | Agent cấu trúc, chuyên gia xác nhận |
| 🗺️ | Bản đồ kết nối giữa các mảng | 7 mảng × điểm kết nối | Agent vẽ, BA xác nhận |

**So sánh thô:** Ước tính thủ công: 3–4 tuần cả nhóm → Với agent: vài ngày làm việc

**Nói thật:** Những gì cần con người quyết định — điền tên người, chọn ưu tiên, chốt phạm vi — vẫn đang chờ.

### Thuyết minh

Số liệu tôi nêu trên là thực tế. Nhưng tôi không muốn chỉ nói về tốc độ, vì tốc độ không phải điểm thuyết phục nhất. Điều tôi thấy ấn tượng hơn là sự nhất quán — 14 tài liệu đó có cùng cách đánh số, cùng cấu trúc, cùng cách dẫn nguồn, cùng quy ước đặt tên. Làm thủ công với nhiều người thì điều đó gần như không thể có, dù có quy định rõ đến đâu. Tôi cũng muốn nói thẳng về hạn chế: những gì đòi hỏi người thật quyết định — điền tên ai phụ trách mảng nào, chọn cách tiếp cận nào, chốt scope — agent không giải quyết được. Đó là phần con người vẫn phải làm, và phải làm đúng trước khi agent có thể phát huy tác dụng.

---

## Slide 10: Nếu muốn thử — bắt đầu từ đâu?

### Trình bày

**5 bước theo thứ tự:**

```
Bước 1 — Vẽ ranh giới trước
  Liệt kê cụ thể: việc nào cần phán đoán của con người
                  việc nào có thể mô tả thành quy tắc
  → Đừng bắt đầu mà chưa làm bước này

Bước 2 — Viết quy tắc rõ cho agent
  File cấu hình: dự án là gì, nguyên tắc là gì, format là gì
  Bảng phân công: ai được dùng công cụ nào, ở mức nào
  → Agent chỉ tốt khi quy tắc rõ. Quy tắc mơ hồ → kết quả mơ hồ

Bước 3 — Phân vùng không gian làm việc
  Khu vực cá nhân (thoải mái thử) ↔ Khu vực nhóm (đã được duyệt)
  Quy trình chuyển giữa hai vùng phải rõ, ai có quyền gì

Bước 4 — Tạo công cụ theo nhu cầu thực
  Bắt đầu từ công cụ giải quyết được bài toán cụ thể nhất
  Mỗi công cụ = một tập quy tắc, không cho phép suy diễn

Bước 5 — Chạy, phát hiện, điều chỉnh
  Ranh giới ban đầu thường sẽ sai một phần — đó là bình thường
  Agent càng có quy tắc tốt thì kết quả càng đáng tin
```

**Ba thứ không thể thiếu:** Quy tắc rõ · Phân quyền nghiêm · Con người xem xét trước khi ra ngoài

### Thuyết minh

Câu hỏi tôi gặp nhiều nhất khi nói chuyện này là "bắt đầu từ đâu". Câu trả lời của tôi là: đừng bắt đầu bằng việc chọn công cụ hay chọn AI nào — bắt đầu bằng việc ngồi xuống và viết ra cụ thể những việc trong nhóm mà nếu mô tả rõ bằng chữ thì ai cũng làm được theo đúng cách. Những việc đó là ứng viên để giao cho agent. Còn những việc mà viết ra nhưng vẫn cần người có kinh nghiệm mới hiểu — đó là việc của con người. Khi đã vẽ được ranh giới đó, phần còn lại là kỹ thuật, và phần kỹ thuật thì có thể học. Câu hỏi không còn là "dùng AI không" — mà là "tổ chức nó vào nhóm thế nào để mình vẫn kiểm soát được".

---

*v1.1 — 2026-06-04 — Cập nhật: Việt hóa thuật ngữ, điều chỉnh văn phong*
*Thời lượng: 18–20 phút + 10 phút hỏi đáp*
*Đối tượng: PM, nhóm BA, người quan tâm đến áp dụng AI trong dự án*
