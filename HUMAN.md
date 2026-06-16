# HUMAN.md — Ngữ cảnh Dự án (Dành cho Con người)

> **Phiên bản tiếng Việt** của [CLAUDE.md](CLAUDE.md). Dùng để tham khảo nội bộ — không được tải vào runtime của AI agent.

---

## 0. Nguyên tắc Làm việc Cốt lõi — Phân vai Con người và Agent (BẮT BUỘC)

Đây là **quy tắc quản trị có tính ràng buộc**, được ưu tiên cao hơn mọi hướng dẫn khác bên dưới nếu xảy ra mâu thuẫn.

1. **Việc suy diễn / diễn giải về hành vi quy trình và hệ thống là trách nhiệm của CON NGƯỜI.** Mọi mô tả đòi hỏi *phán đoán, giả định, hoặc quyết định thiết kế* về cách một quy trình hay hệ thống nên vận hành (ví dụ: "điều gì xảy ra khi một bước bị lỗi", "luồng phê duyệt nên rẽ nhánh ra sao", tự nghĩ ra hành vi giao diện, tự bổ sung logic còn thiếu) **phải do con người biên soạn**, không phải agent.
2. **Vai trò của agent là PHÂN RÃ + LẮP GHÉP TRUNG THỰC, không phải sáng tạo nội dung.** Cụ thể, agent:
   - tiếp nhận nội dung mà con người đã ghi nhận (tài liệu nguồn, biên bản họp, kết quả khảo sát, bảng yêu cầu),
   - **phân rã** nội dung đó vào các tài liệu/hạng mục liên quan (ví dụ: tách một yêu cầu đã ghi nhận thành use case, tính năng, trường dữ liệu, dòng truy vết), và
   - **xây dựng nội dung tuân thủ 100% theo nguồn dẫn chứng** — mọi phát biểu đều phải truy vết được về một dòng trong nguồn.
3. **KHÔNG suy diễn mang tính phỏng đoán.** Agent KHÔNG được lấp chỗ trống, đoán logic quy trình, hay "cải thiện" yêu cầu bằng hành vi tự giả định. Khi nguồn chưa đầy đủ, mơ hồ, hoặc mới chỉ là một câu hỏi, agent **giữ nguyên văn** và đánh dấu rõ trong một mục riêng (ví dụ: *"Câu hỏi / Nội dung cần làm rõ"*, *"(chưa có)"*) để con người xử lý.
4. **Luôn trích dẫn nguồn.** Mỗi hạng mục được phân rã đều phải dẫn chiếu xuất xứ (file / sheet / dòng / mục). Nếu không có nguồn chứng minh cho một phát biểu, agent không được viết phát biểu đó.

> **Tóm lại:** Con người là người quyết định và suy diễn; agent sắp xếp lại và tái hiện đúng những gì con người đã ghi nhận — không vượt ra ngoài phạm vi đó.

---

## 0.3 Ưu tiên Con người Thực hiện — Agent Gợi ý, Con người Làm (BẮT BUỘC)

**Phần mở rộng ràng buộc của §0.** Trước khi bắt đầu bất kỳ tác vụ nào, agent PHẢI đánh giá xem tác vụ đó có nhanh hơn và tiết kiệm hơn nếu con người tự làm bằng tay hay không.

**Quy tắc:** Nếu tác vụ đáp ứng BẤT KỲ tiêu chí nào dưới đây, agent KHÔNG được cố tự động hóa. Thay vào đó, agent PHẢI đưa ra hướng dẫn từng bước rõ ràng để con người thực hiện thủ công, rồi dừng lại.

| Tiêu chí | Ví dụ |
|---|---|
| **Công cụ GUI** | Định dạng Excel/Word, kéo thả, menu chuột phải, hộp thoại |
| **Nhập dữ liệu đơn giản** | Điền bảng với giá trị đã biết, copy-paste giữa các file |
| **Chi phí thử nghiệm cao** | Đã thất bại >2 lần tự động hóa cùng tác vụ trong một phiên |
| **Token tốn hơn công người** | Token ước tính để tự động hóa > ~5 phút làm tay của con người |
| **Môi trường không ổn định** | COM automation, API độc quyền, công cụ bị hạn chế trong sandbox |

**Agent làm gì thay thế:**
1. Thông báo rõ: *"Tác vụ này nhanh hơn nếu bạn tự thực hiện."*
2. Đưa ra các bước đánh số cụ thể (menu nào, trường nào, phím tắt nào).
3. Đề xuất tiếp tục tác vụ tiếp theo sau khi con người hoàn thành.

**Câu nói cụ thể agent dùng cho các tình huống BA thường gặp:**

| Tình huống | Agent nói |
|---|---|
| Được yêu cầu điền tên nhân sự vào ma trận | *"Tác vụ này nhanh hơn nếu bạn tự thực hiện. Mở PHAN-CONG-ROLE-BA-v0.1.md, tìm bảng §3, điền tên vào cột 'BA Chủ trì' và 'BA Hỗ trợ'. Tôi chờ bạn xong để tiếp tục."* |
| Được yêu cầu phán đoán phạm vi nghiệp vụ | *"Đây là quyết định nghiệp vụ — BA Lead cần xem xét. Tôi có thể chuẩn bị bảng phân tích tác động để hỗ trợ ra quyết định."* |
| Được yêu cầu approve tài liệu | *"Approve tài liệu là thẩm quyền của BA Lead. Tôi có thể chạy Quality Gate check trước để bạn biết tài liệu đã đủ điều kiện chưa."* |
| Được yêu cầu chọn Document Workflow | *"Chọn Document Workflow là quyết định của BA Lead (CLAUDE.md §0.1). Tôi có thể trình bày so sánh P1–P6 để bạn lựa chọn."* |
| Tự động hóa thất bại >2 lần | *"Tác vụ này nhanh hơn nếu bạn tự thực hiện. Mở Excel → [các bước cụ thể]. Tôi chuẩn bị nội dung cần điền và chờ bạn."* |
| Được yêu cầu dẫn dắt phỏng vấn | *"Phỏng vấn cần quan hệ tin tưởng trực tiếp — bạn tiến hành, tôi hỗ trợ bằng /interview để tạo bộ câu hỏi trước."* |

> **Lý do:** Agent tiêu tốn 10+ lần thử và hàng nghìn token cho một tác vụ con người có thể làm trong 2 phút là lãng phí — không phải hỗ trợ. Nhận ra giới hạn này là một phần trách nhiệm của agent.

---

## 0.1 Thiết lập Luồng Quy trình Tài liệu (BẮT BUỘC)

Đây là **phần mở rộng ràng buộc của Mục 0.** Mỗi dự án vận hành theo MỘT luồng làm tài liệu được chọn rõ ràng — các luồng P1–P6 trong [`ba-workflow-patterns.md`](.claude/knowledge/ba-workflow-patterns.md).

1. **Set trước khi khởi động.** Trước khi tạo BẤT KỲ tài liệu nào, luồng phải được chọn và ghi vào trường **"Luồng đang áp dụng"** ở Mục 1. Nếu trường này còn ghi *"(chưa thiết lập)"*, **không bắt đầu làm tài liệu** — hỏi con người chọn trước (khuyến nghị mặc định: P4 — Song song đồng tiến hóa).
2. **Kiểm tra trước mỗi tài liệu.** Trước khi tạo hoặc sửa lớn bất kỳ tài liệu nào, agent PHẢI đọc lại luồng đang set (trường ở Mục 1) và tuân theo trình tự + ghi chú quản trị của luồng đó.
3. **Có thể đổi giữa chừng.** Luồng CÓ THỂ được đổi bất kỳ lúc nào **nếu con người quyết định**. Khi đổi: (a) cập nhật trường ở Mục 1, (b) ghi thay đổi `cũ → mới + lý do + ngày` vào [`SYNC-LOG.md`](.claude/sync/SYNC-LOG.md), (c) ghi chú tác động lên các artefact đã tạo.
4. **Là quyết định của con người.** Việc chọn/đổi luồng là quyết định của con người (theo Mục 0); agent đề xuất và ghi nhận, không tự quyết.

---

## 0.2 Triết lý Phát triển Phần mềm (TÙY CHỌN)

Khác với §0.1 (luồng tài liệu là **bắt buộc**), việc áp dụng một triết lý phát triển là **TÙY CHỌN** — **chỉ áp dụng khi con người chủ động yêu cầu**. Danh mục: [`.claude/knowledge/dev-philosophies.md`](.claude/knowledge/dev-philosophies.md) (DP1, DP2, …).

1. **Mặc định = không áp dụng.** Không áp triết lý nào trừ khi con người chọn.
2. **Hỏi khi khởi động.** Khi dự án bắt đầu (hoặc ở tác vụ thiết kế/kiến trúc đầu tiên), agent PHẢI hỏi con người có muốn áp dụng triết lý nào trong danh mục không. Ghi câu trả lời vào trường **"Triết lý đang áp dụng"** ở Mục 1.
3. **Chỉ áp khi được yêu cầu.** Agent KHÔNG được áp triết lý nào (trục phân rã, ràng buộc, tiêu chí) trừ khi trường này ghi rõ tên. Nếu còn ghi *"(none — chưa được yêu cầu)"*, không áp đặt triết lý nào.
4. **Ghi nhận + có thể đổi.** Khi chọn/đổi: cập nhật trường ở Mục 1 + ghi `cũ → mới + lý do + ngày` vào [`SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).
5. **Là quyết định của con người** (theo Mục 0); agent đề xuất và ghi nhận, không tự quyết.

---

## 0.4 Thiết lập Danh tính & Vai trò ở Phiên Đầu tiên (BẮT BUỘC)

Thư mục dự án này có tính **di động** — có thể được nén (zip) chuyển sang máy khác hoặc bàn giao cho thành viên mới. Bộ nhớ của agent KHÔNG đi theo thư mục (nó nằm trong hồ sơ người dùng của từng máy), nên trên máy mới agent hoàn toàn không biết ai đang làm việc.

1. **Kiểm tra danh tính trước khi làm việc.** Khi bắt đầu phiên làm việc, nếu agent KHÔNG có bộ nhớ nào xác lập danh tính và vai trò của người dùng hiện tại trên dự án, agent PHẢI hỏi — trước khi thực hiện bất kỳ hành động gắn với thẩm quyền nào (approve, quyết định phạm vi, chọn workflow, sửa `ba/sync/*`):
   - **Họ tên / cách xưng hô**;
   - **Vai trò BA** (BA Lead / Senior BA / Mid BA / Junior BA / Intern — theo [`PHAN-CONG-ROLE-BA-v0.1.md`](ba/workspace/drafts/quy-trinh/PHAN-CONG-ROLE-BA-v0.1.md));
   - **Phân hệ được phân công** (nếu có).
2. **Đối chiếu, không tự cấp quyền.** Agent ghi nhận lời khai của người dùng và đối chiếu với ma trận phân công vai trò (§3 của PHAN-CONG-ROLE-BA). Nếu vai trò khai báo mâu thuẫn với ma trận, hoặc ma trận còn trống, agent gắn cờ và đề nghị người dùng xác nhận lại với BA Lead — agent không bao giờ tự cấp thẩm quyền.
3. **Lưu vào bộ nhớ.** Sau khi xác nhận, lưu danh tính + vai trò vào bộ nhớ lâu dài của agent để các phiên sau không phải hỏi lại. Nếu sau này người dùng đổi vai trò, cập nhật bộ nhớ và ghi chú vào [`SYNC-LOG.md`](.claude/sync/SYNC-LOG.md).
4. **Phân quyền theo vai trò.** Khi chưa xác lập danh tính, coi người dùng là **chưa được phân công**: các tác vụ đọc/phân tích vẫn làm bình thường; còn approve, công bố vào `ba/sync/`, chọn workflow (§0.1) và ký duyệt tài liệu đều cần vai trò đã xác nhận có thẩm quyền tương ứng.

---

## 1. Tổng quan Dự án

| Trường | Giá trị |
|---|---|
| **Tên dự án** | Hệ thống Điều hành Khai thác Hãng Hàng không |
| **Tên tiếng Anh** | Airline Operations Management System |
| **Mã dự án** | TOSS |
| **Loại sản phẩm** | Hệ thống nội bộ doanh nghiệp |
| **Giai đoạn hiện tại** | Khám phá & Phân tích Yêu cầu |
| **Ngôn ngữ đầu ra** | Tiếng Việt (toàn bộ tài liệu hướng đến người dùng) |
| **Tài liệu nguồn chính** | `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf` (yêu cầu kỹ thuật) · `ba/workspace/input/VNA_TOSS.pptx` (bối cảnh & mục tiêu dự án) |
| **Luồng đang áp dụng** | **P4 — Song song đồng tiến hóa** — phân tích chức năng + mô hình dữ liệu song song với wireframe/mockup; xem [`ba-workflow-patterns.md`](.claude/knowledge/ba-workflow-patterns.md) §P4 |
| **Triết lý đang áp dụng** | *(none — chưa được yêu cầu; TÙY CHỌN, xem §0.2 & [`dev-philosophies.md`](.claude/knowledge/dev-philosophies.md))* |

---

## 2. Phạm vi Nghiệp vụ & Mục tiêu

**Phạm vi nghiệp vụ:**
- **Quản lý Khai thác Bay** — lập lịch bay, cấp phép khởi hành, điều hành tại Trung tâm Kiểm soát Khai thác (OCC — Operational Control Center).
- **Quản lý Tổ bay** — lập lịch phi hành đoàn, theo dõi bằng cấp/chứng chỉ, kiểm soát giờ bay/nghỉ (FTL — Flight Time Limitations), quản lý tổ bay dự phòng.
- **Bảo dưỡng & Kỹ thuật Tàu bay** — lập kế hoạch bảo dưỡng, theo dõi khả năng bay, quản lý khiếm khuyết kỹ thuật.
- **Khai thác Mặt đất** — điều phối quay vòng tàu bay, phân công cổng sân bay, yêu cầu phục vụ mặt đất.
- **Quản lý An toàn & Tuân thủ** — báo cáo an toàn, nhật ký kiểm toán, tuân thủ quy định của Cục Hàng không Việt Nam (CAAV) và tiêu chuẩn quốc tế (ICAO, IATA).

**Mục tiêu nghiệp vụ:**
- Số hóa và tích hợp toàn bộ chu trình khai thác: lập kế hoạch trước chuyến bay → cấp phép khởi hành → theo dõi trong chuyến bay → kết thúc chuyến bay.
- Đảm bảo tuân thủ quy định của CAAV và tiêu chuẩn hàng không quốc tế (ICAO Annex 6, tiêu chuẩn OCC của IATA).
- Tối ưu hóa hiệu suất khai thác, tỷ lệ đúng giờ (OTP), **hiệu quả thực hiện lịch khai thác (OSP — Operational Schedule Performance)** và hiệu quả sử dụng tổ bay.
- Cung cấp khả năng quan sát toàn diện theo thời gian thực trên tất cả chức năng kiểm soát khai thác.
- **Đảm bảo OSP (Operational Schedule Performance)** — hệ thống phải đo lường và hỗ trợ duy trì mức độ khai thác bám sát lịch đã hoạch định (bổ trợ cho OTP).

---

## 3. Đối tượng Người dùng

| Vai trò | Chức năng chính | Mối quan tâm trọng yếu |
|---|---|---|
| **Kiểm soát viên Khai thác / Điều phối viên** | Lập kế hoạch bay, cấp phép khởi hành, theo dõi OCC | Trạng thái bay thời gian thực, xử lý gián đoạn, tuân thủ quy định |
| **Nhân viên Lập lịch Tổ bay** | Lập lịch phi hành đoàn, quản lý dự phòng, theo dõi giờ bay | Quy định về mệt mỏi (FTL), hiệu lực chứng chỉ tổ bay, thay đổi phút chót |
| **Quản lý Khai thác Mặt đất** | Điều phối quay vòng, quản lý cổng, yêu cầu phục vụ mặt đất | Đúng giờ khởi hành, phân bổ nguồn lực, tiêu chuẩn phục vụ tàu bay |
| **Nhân viên Lập kế hoạch Bảo dưỡng** | Lập lịch bảo dưỡng, quản lý khả năng bay | Tuân thủ MEL, tối ưu cửa sổ bảo dưỡng, theo dõi khiếm khuyết |
| **Quản lý / Lãnh đạo** | Giám sát, KPI, kiểm toán quy định | Dashboard đúng giờ, chỉ số chi phí, chỉ số an toàn |

---

## 4. Cấu trúc Thư mục

```
TOSS/
├── CLAUDE.md                       # Ngữ cảnh cho AI agent (tiếng Anh) — BẮT BUỘC ở gốc
├── HUMAN.md                        # File này — tham khảo nội bộ (tiếng Việt) — ở gốc
├── README.md  CONTRIBUTING.md      # Onboarding + quy ước cộng tác qua Git
├── .gitignore  .gitattributes      # Vệ sinh Git
├── ba/                             # PHÂN TÍCH NGHIỆP VỤ
│   ├── workspace/                  # Vùng làm việc cá nhân (mỗi member trên máy riêng)
│   │   ├── input/                  # Tài liệu nguồn chỉ-đọc
│   │   │   ├── meeting-notes/      # Biên bản họp, ghi chú phỏng vấn stakeholder
│   │   │   ├── domain-knowledge/   # Kiến thức miền hàng không: ICAO, CAAV, FTL, OCC…
│   │   │   └── [file nguồn]        # BBKS, BBLV, đề xuất kỹ thuật, VNA_TOSS…
│   │   └── drafts/                 # Nháp đang xây dựng (cá nhân, chưa thống nhất)
│   │       ├── phan-tich/          # Phân tích nghiệp vụ: As-Is/To-Be, gap analysis, đối chiếu
│   │       ├── brd/                # BRD drafts
│   │       ├── srs/                # SRS drafts
│   │       │   └── 03-dac-ta-chuc-nang/  # Đặc tả chức năng per phân hệ
│   │       ├── wireframe/          # Wireframe per phân hệ (mirror cấu trúc SRS)
│   │       ├── mockup/             # HTML mockup / prototype tương tác
│   │       ├── quy-trinh/          # Quy trình BA: phân công role, skill matrix, SOP
│   │       └── presentation/       # Presentation source (md + build script)
│   └── sync/                       # Tài liệu BA thống nhất giữa các member (nguồn sự thật chung)
│       ├── requirements/           # Yêu cầu đã xem xét & thống nhất
│       │   ├── brd/                # BRD đã review
│       │   ├── srs/                # SRS đã review
│       │   └── quan-ly-yeu-cau/    # NKLR — nhật ký kiểm soát thay đổi yêu cầu
│       ├── models/                 # Mô hình nghiệp vụ: BPMN, use case diagram, data model…
│       └── output/
│           ├── human/
│           │   ├── exports/        # Đầu ra Word/PDF có phiên bản (giao khách hàng/stakeholder)
│           │   └── presentation/   # PPTX + assets
│           └── agents/             # Đầu ra tối ưu cho agent DEV/QC
├── dev/                            # PHÁT TRIỂN — mã nguồn
├── qc/                             # KIỂM THỬ
├── shared/                         # Dùng chung
├── logs/
│   └── ba-sessions/                # Nhật ký phiên làm việc BA — tự sinh YYYY-MM-DD-HHMM.md
└── .claude/
    ├── agents/                     # Định nghĩa agent (tiếng Anh)
    ├── commands/                   # Slash commands (/brd, /userstory, ...)
    ├── templates/ba/               # Template BA chuẩn
    ├── glossary/                   # Từ điển thuật ngữ Anh-Việt
    ├── knowledge/                  # Tài liệu kiến thức miền
    ├── skills/export-word/         # Skill xuất Word theo chuẩn Viettel QT02
    ├── sync/                       # Giao thức đồng bộ & nhật ký
    └── human/                      # Bản sao tiếng Việt của .claude/
```

**Quy ước đặt tên:**
- Tên file: `kebab-case`, không dấu, không khoảng trắng.
- Mã tài liệu: `BRD-TOSS-001`, `SRS-TOSS-002`, `UC-001`, `US-001`…
- File có phiên bản + ngày: `BRD-TOSS-quan-ly-bay-v1.0-2026-05-28.md`.
- Biên bản họp: `MM-YYYYMMDD-<chu-de>.md`.

---

## 5. Quy tắc Ngôn ngữ

1. **Suy luận nội bộ của AI = tiếng Anh.** Lập luận, gọi công cụ, phối hợp agent — tiếng Anh.
2. **Đầu ra hướng đến người dùng = 100% tiếng Việt.** Báo cáo, tài liệu, câu hỏi làm rõ — tiếng Việt.
3. **Thuật ngữ kỹ thuật:** ghi tiếng Anh trong ngoặc lần đầu xuất hiện — `Tiêu chí chấp nhận (Acceptance Criteria)`. Dùng bản tiếng Việt cho các lần sau.
4. **KHÔNG trộn ngôn ngữ** trong cùng một đoạn/câu/gạch đầu dòng (ngoại trừ thuật ngữ trong ngoặc).
5. **Không tự đặt bản dịch** cho thuật ngữ đã có trong từ điển. Nếu thiếu, đề xuất bản dịch tạm và gắn cờ để bổ sung.
6. **Danh từ riêng giữ nguyên:** ICAO, IATA, CAAV, MEL, FTL, OCC, ACARS, NOTAM, Jira, SAP, Oracle, v.v.
7. **Thuật ngữ hàng không** (lần đầu xuất hiện trong tài liệu): ghi tên tiếng Việt + viết tắt tiếng Anh trong ngoặc — ví dụ: `Trung tâm Kiểm soát Khai thác (OCC — Operational Control Center)`.

---

## 6. Quy ước Đầu ra

**Định dạng tài liệu:**
- Mặc định: Markdown (`.md`).
- Sơ đồ: ưu tiên Mermaid trong Markdown; PlantUML / Draw.io khi cần BPMN chi tiết.
- Bảng dữ liệu lớn: CSV kèm file Markdown chính.

**Vị trí lưu trữ — workspace (cá nhân):**
- Tài liệu nguồn chỉ-đọc: `ba/workspace/input/` — biên bản họp → `meeting-notes/`, kiến thức miền hàng không → `domain-knowledge/`, file thô để ở gốc.
- Phân tích đang làm: `ba/workspace/drafts/phan-tich/`.
- Tài liệu quy trình BA (phân công role, skill matrix, SOP): `ba/workspace/drafts/quy-trinh/`.
- BRD nháp: `ba/workspace/drafts/brd/`.
- SRS nháp (file theo chương + phân hệ): `ba/workspace/drafts/srs/` và `srs/03-dac-ta-chuc-nang/`.
- Wireframe nháp: `ba/workspace/drafts/wireframe/` (đặt tên mirror phân hệ SRS).
- HTML mockup/prototype: `ba/workspace/drafts/mockup/`.
- Presentation source: `ba/workspace/drafts/presentation/`.

**Vị trí lưu trữ — sync (nhóm):**
- BRD đã review: `ba/sync/requirements/brd/`.
- SRS đã review: `ba/sync/requirements/srs/`.
- Nhật ký kiểm soát yêu cầu (NKLR): `ba/sync/requirements/quan-ly-yeu-cau/`.
- Mô hình nghiệp vụ: `ba/sync/models/`.
- Word/PDF xuất ra có phiên bản: `ba/sync/output/human/exports/`.
- Presentation giao người: `ba/sync/output/human/presentation/`.
- Đầu ra cho agent: `ba/sync/output/agents/`.
- KHÔNG ghi vào `ba/workspace/input/` (chỉ-đọc).
- KHÔNG lưu vào `.claude/human/` (dành cho bản sao file nguồn).
- Tạo thư mục con khi có ≥ 3 tài liệu cùng module.

**YAML frontmatter bắt buộc:**
```yaml
---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "<tên>"
version: "x.y"
date: "YYYY-MM-DD"
status: "Draft | Review | Approved"
document_type: "<BRD | SRS | FRD | URD | User Story | ...>"
---
```

**Chuẩn xuất Word giao người (BẮT BUỘC):** Markdown chỉ là kênh nội bộ giữa các agent; bản Word/PDF giao cho con người phải **tự mô tả đầy đủ và trình bày đẹp, dễ nhìn**. **Toàn bộ quy trình đã đóng gói thành skill `export-word`** — `.claude/skills/export-word/` (chạy `scripts/export-word.ps1` kèm manifest; `build-reference-template.ps1` dựng lại mẫu). Ưu tiên dùng skill.

> **QUY TẮC VERSION (BẮT BUỘC):** Tên file ra **luôn** kèm version + ngày: `<Base>-v<Version>-<YYYY-MM-DD>.docx`. **Không ghi đè file đã chốt** — nội dung chốt thì **tăng version** (file mới; giữ file cũ làm lịch sử). Script từ chối ghi đè trừ khi `-Force` (chỉ cho bản nháp cùng version trong ngày).

Khi xuất (pandoc):
1. **Không chứa liên kết tệp nội bộ.** Gỡ: (a) đích link không phải `http(s)`/`mailto` (giữ nhãn); (b) token đường dẫn/đuôi `.md`/`.html`; (c) **stem tên file còn sót** khi nhãn link chính là tên file (vd `3.1-phan-he-quan-ly-kho`, `wf-tram-mobile-tablet`) — regex chỉ gỡ slug **dẫn đầu bằng số mục hoặc `wf-`** nên KHÔNG đụng thuật ngữ Anh có gạch nối (`end-to-end`, `low-fidelity`) hay mã (`MO-2026-012`). Giữ tài liệu nguồn thật `.xlsx`/`.docx`. Tham chiếu chéo thành chữ mô tả mục ("xem 4.6").
2. **Áp dụng mẫu Word** `.claude/templates/word-reference.docx` qua `--reference-doc`. **Chuẩn trình bày bám theo biểu mẫu chính thức của Viettel `QT02.BM.04_Thiet ke chi tiet.docx`** (đã phân tích từ template thật):
   - **Font đồng bộ:** thân bài **Times New Roman 12pt** (đúng chuẩn QT02); tiêu đề Times New Roman **đậm**, cỡ ~14/13/12pt (H1/H2/H3).
   - **Tiêu đề màu ĐEN `#000000`** (QT02 dùng heading đen, đánh số phân cấp — **không tô màu** heading).
   - **Bảng:** viền **đen** `#000000` đơn 0.5pt (toàn bộ); **hàng tiêu đề tô nền Xám nhạt `#D9D9D9`, chữ đậm đen** (đúng kiểu header của QT02); có đệm ô cho dễ đọc.
   - **Mục lục tự động** (`--toc`); locale `vi-VN`; ưu tiên dễ đọc.
   - **Letterhead (QT02):** **header trang = logo Viettel (`word/media/logo.png`) + "Tài liệu thiết kế chi tiết · vx.x"**; **footer = "BM.04 · QT.TKKDL.QTDL" + "Trang PAGE / NUMPAGES"** (có đường kẻ trên).
3. **Dựng lại mẫu:** giải nén `word-reference.docx` và sửa `word/styles.xml` (font/heading/bảng như trên); **đặt `word/theme/theme1.xml` font `<a:latin>` major+minor = Times New Roman** (QUAN TRỌNG — theme mặc định của pandoc là `Aptos`; các style tham chiếu theme (Heading3–9, Subtitle, caption, TOC) sẽ rơi về Aptos → lệch font nếu không sửa theme). Giữ `VerbatimChar` là monospace (`Consolas`) cho code/ASCII. Thêm `word/header1.xml` (logo `wp:inline` + tiêu đề), `word/footer1.xml` (field PAGE/NUMPAGES), `word/_rels/header1.xml.rels`, `word/media/logo.png`, override trong `[Content_Types].xml`, và `<w:headerReference>`/`<w:footerReference>` trong `sectPr` của `document.xml`. **Nén lại với tên entry dùng dấu `/`** (KHÔNG dùng `ZipFile::CreateFromDirectory` — trên .NET Framework nó ghi `\` làm hỏng chuẩn OPC; phải duyệt từng file và `CreateEntry(rel.Replace('\\','/'))`).
4. **Hậu xử lý mỗi file docx xuất ra** (pandoc bỏ ảnh logo của header): chèn lại `word/media/logo.png` + `word/_rels/header1.xml.rels` + `Default png` vào `[Content_Types].xml` bằng `ZipArchive` chế độ 'Update'. File `.md` nguồn **giữ nguyên link** (cho agent); style/letterhead chỉ áp **khi xuất**.
5. **QC file đã xuất** (đọc `word/document.xml`/`styles.xml`/`theme1.xml`): tiêu chí PASS — `.md`=0, `](`=0, slug-stem=0, không lọt khóa YAML, không mojibake; entry dùng `/`; có `word/media/logo.png` + `header1.xml` + `footer1.xml` + field TOC; đủ các mục; XML well-formed; **FONT đồng bộ — mọi `w:ascii`/theme đều Times New Roman (theme latin = TNR, `Aptos`/`Calibri` = 0); chỉ cho phép `Consolas` và chỉ ở code/verbatim**. Lỗi thì sửa và xuất lại.

---

## 7. Cơ chế Đồng bộ

Dự án sử dụng **hệ thống tài liệu hai phạm vi**. Mọi file trong `.claude/{agents,commands,templates,glossary}/` và `CLAUDE.md` gốc đều có bản sao tiếng Việt tương ứng.

Khi chỉnh sửa file được theo dõi, hook tự động (`sync-check.ps1`) sẽ nhắc nhở cập nhật file sao. Xem chi tiết tại [SYNC-PROTOCOL.md](.claude/sync/SYNC-PROTOCOL.md).

**Ngoại lệ (không cần bản sao):** `logs/*` — nhật ký phiên tự sinh, không cần đồng bộ. `ba/workspace/*` — vùng làm việc cá nhân. `ba/sync/requirements/*` và `ba/sync/output/*` — tài liệu team, một ngôn ngữ.

---

*HUMAN.md phiên bản 2.3 — 2026-06-16. File gốc: [CLAUDE.md](CLAUDE.md).*
*v2.3: bổ sung subagent **project-coordinator (PC)** — Điều phối & nhắc nhở công việc dự án còn tồn đọng (tổng hợp OID/lộ trình/TASK/action item/cờ cần xác nhận thành báo cáo nhắc việc có ưu tiên; chỉ tổng hợp nguồn đã ghi, không tự quyết — §0/§0.3). Định nghĩa: `.claude/agents/project-coordinator.md` (+ bản VI `.claude/human/agents/`). Đăng ký ở CLAUDE.md §5.*
*v2.2: thêm §0.4 Thiết lập Danh tính & Vai trò ở Phiên Đầu tiên — quy tắc bàn giao thư mục di động: trên máy mới (agent chưa có bộ nhớ về người dùng) phải hỏi họ tên/vai trò/phân hệ, đối chiếu PHAN-CONG-ROLE-BA, lưu bộ nhớ, và khóa các hành động gắn thẩm quyền cho tới khi xác nhận.*
*v2.1: §2 — bổ sung mục tiêu/phạm vi **OSP (Operational Schedule Performance)** (bổ trợ OTP); hệ thống phải đo lường & hỗ trợ duy trì khai thác bám sát lịch hoạch định.*
*v1.3: tái cấu trúc ba/ thành input/process/output(human+agents); cập nhật Mục 4/6/7.*
*v1.2: đồng bộ khung chung từ VTX — thêm Mục 0.1 Thiết lập Luồng + trường "Luồng đang áp dụng" (chưa thiết lập) + knowledge ba-workflow-patterns (P1–P6); tái cấu trúc monorepo Git theo vai trò (Sources_docs→ba/sources, deliverables→ba/deliverables, thêm dev/qc/shared/README/CONTRIBUTING/.gitignore/.gitattributes); đường dẫn hook/skill portable. (git init/commit chờ cài git.)*
*v1.1: tiếp nhận khung dùng chung từ VTX — bổ sung Mục 0 (phân vai Người–Agent), chuẩn xuất Word + skill `export-word`, `word-reference.docx`, làm mới template SRS. Phần gắn dự án (miền hàng không TOSS) giữ nguyên.*
