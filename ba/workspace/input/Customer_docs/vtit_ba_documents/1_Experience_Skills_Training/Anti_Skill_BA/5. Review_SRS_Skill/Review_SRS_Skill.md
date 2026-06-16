---
name: ba-srs-writer
description: viết, mở rộng, rà soát và gap-check tài liệu software requirement specification cho business analyst. dùng khi cần tạo srs, chuyển brd/urd/pyc/change request thành srs, viết đặc tả chức năng/màn hình/luồng nghiệp vụ/api/db, review srs cho ba lead, tìm case thiếu, kiểm tra tính testable, ambiguity, traceability, ui-business-api-db alignment, data governance và reusable scenarios.
---

# BA SRS Writer

Kỹ năng này giúp AI viết, mở rộng và rà soát tài liệu SRS cho Business Analyst theo hướng **rõ ràng, kiểm thử được, có cấu trúc, hạn chế sót case và phù hợp để Dev/QA/UAT sử dụng**.

## Mục tiêu cốt lõi

Luôn tạo hoặc review SRS theo các mục tiêu sau:

- đi từ tổng quan đến chi tiết: bối cảnh → phạm vi → tổng quan giải pháp → thiết kế chi tiết → luồng nghiệp vụ → xử lý kỹ thuật → quản trị dữ liệu → checklist/gap-check;
- viết yêu cầu sao cho QA kiểm thử được, Dev hiểu để build, UAT có cơ sở nghiệm thu;
- tránh câu mơ hồ, thay bằng hành vi quan sát được hoặc tiêu chí đo được;
- bao phủ luồng đúng, luồng thay thế, luồng lỗi, dữ liệu rỗng, phân quyền, nguồn dữ liệu, tích hợp và audit/log;
- tách kịch bản dùng chung khỏi logic riêng của từng chức năng để dễ tái sử dụng.

## Nguyên tắc bắt buộc

Luôn áp dụng các nguyên tắc sau:

1. Viết requirement theo hướng có thể verify/test.
2. Không dùng từ mơ hồ như “nhanh”, “dễ dùng”, “đầy đủ”, “hợp lệ” nếu chưa định nghĩa tiêu chí.
3. Sắp xếp nội dung theo đúng thứ tự trải nghiệm người dùng và xử lý hệ thống.
4. Ghi rõ nguồn dữ liệu: API, DB, service, cache, file hoặc hệ thống bên thứ ba.
5. Luôn mô tả validate, xử lý lỗi, trạng thái rỗng, trạng thái loading và phân quyền.
6. Phân biệt rõ: dữ kiện đã có, giả định, câu hỏi mở, khuyến nghị.
7. Với kịch bản dùng chung, viết một lần ở phần reusable scenarios và tham chiếu lại.
8. Dùng thuật ngữ nhất quán xuyên suốt tài liệu.
9. Ghi rõ actor, trigger, precondition, postcondition, input, output.
10. Khi thiếu thông tin nghiệp vụ quan trọng, không tự bịa. Đánh dấu vào **Câu hỏi mở / Giả định / Rủi ro**.

## Cách xử lý input

Có thể nhận các loại input sau:

- brief dự án;
- PYC/change request;
- BRD, URD, meeting notes;
- ảnh màn hình, mockup, mô tả Figma;
- API spec;
- ghi chú DB;
- function list;
- SRS cũ hoặc tài liệu hiện trạng;
- checklist hoặc review comments.

Khi input chưa đầy đủ:

1. Trích xuất tất cả dữ kiện explicit.
2. Chỉ suy luận các chi tiết cấu trúc có rủi ro thấp.
3. Đưa các điểm thiếu/rủi ro cao vào **Câu hỏi mở / Giả định**.
4. Vẫn tiếp tục tạo draft tốt nhất có thể, không dừng chỉ vì thiếu một vài thông tin.

## Các mode chuẩn

Chọn mode gần nhất với yêu cầu của người dùng.

### Mode A: Tạo SRS đầy đủ

Dùng khi người dùng yêu cầu viết mới SRS cho hệ thống/module/chức năng.

### Mode B: Mở rộng SRS nháp

Dùng khi người dùng đã có heading, flow, wireframe, notes hoặc một phần nội dung.

### Mode C: Review và gap-check SRS

Dùng khi người dùng đưa SRS hiện có và cần tìm thiếu case, điểm mơ hồ, lỗi logic, thiếu API/DB, thiếu validate hoặc thiếu traceability.

### Mode D: Viết đặc tả một chức năng/module/màn hình

Dùng khi yêu cầu chỉ tập trung vào một chức năng, một màn hình hoặc một change request.

### Mode E: Review/gap-check chuyên sâu cho BA Lead

Dùng khi người dùng là BA Lead, reviewer, PM/PO hoặc yêu cầu “review kỹ”, “soát thiếu case”, “gap-check”, “đọc như BA lead”, “đánh giá SRS”, “tìm rủi ro dev/qa/uạt”, “đưa comment review”.

Mục tiêu của Mode E là tạo review có thể dùng trực tiếp trong buổi review nội bộ, gồm: điểm đạt, điểm thiếu, mức độ nghiêm trọng, tác động, vị trí trong tài liệu, câu hỏi cần hỏi lại stakeholder, và đề xuất câu viết lại.

## Khung SRS bắt buộc

Dùng cấu trúc sau trừ khi người dùng cung cấp template riêng của công ty.

### 1. Tổng quan tài liệu

- Mục đích tài liệu
- Phạm vi
- Stakeholder
- Thuật ngữ/định nghĩa
- Tài liệu tham chiếu
- Giả định/phụ thuộc

### 2. Tổng quan giải pháp

#### 2.1 Tổng quan chức năng

- Mục đích chức năng/hệ thống
- Module liên quan/hệ thống tích hợp
- Tương tác actor ở mức cao

#### 2.2 Phạm vi chi tiết

- In scope
- Out of scope
- Module bị ảnh hưởng
- Kịch bản dùng chung/tái sử dụng

### 3. Thiết kế chi tiết

Với mỗi chức năng hoặc sub-function, viết các phần sau.

#### 3.1 Thông tin chung chức năng

Nên dùng bảng gồm:

- Mã chức năng
- Tên chức năng
- Mục đích
- Người dùng/role mục tiêu
- Đường dẫn truy cập
- Trigger
- Tiền điều kiện
- Hậu điều kiện
- Quy tắc nghiệp vụ liên quan
- API/DB/service liên quan

#### 3.2 Màn hình

Mô tả:

- mục đích màn hình;
- bố cục chính;
- thành phần chính;
- trạng thái mặc định;
- trạng thái có dữ liệu;
- trạng thái rỗng;
- trạng thái lỗi;
- hiển thị/ẩn/disable theo quyền nếu có.

#### 3.3 Mô tả chi tiết thành phần trên màn hình

Với mỗi field/control, tối thiểu phải có:

- STT;
- Tên thành phần;
- Kiểu dữ liệu;
- Input/Output;
- Bắt buộc/Không bắt buộc;
- Giá trị mặc định;
- Điều kiện editable/read-only;
- Rule validate;
- Định dạng/độ dài/giá trị cho phép;
- Placeholder/label/tooltip;
- Nguồn dữ liệu;
- Logic hiển thị;
- Ghi chú.

Luôn kiểm tra các case:

- dữ liệu null/rỗng;
- dữ liệu quá dài;
- sai định dạng;
- dữ liệu trùng;
- record inactive/deleted;
- disable/hide theo quyền.

#### 3.4 Luồng nghiệp vụ

Phải có:

- trigger;
- actor;
- main flow;
- alternate flow;
- exception flow;
- kết quả hoàn tất.

Viết flow theo mẫu:

- Khởi tạo
- Thực hiện
- Validate hệ thống
- Xử lý lỗi/ngoại lệ
- Kết quả thành công
- Kết quả thất bại
- Audit/logging nếu có

#### 3.5 Xử lý kỹ thuật

##### API

Với mỗi API liên quan, mô tả:

- Endpoint
- Method
- Mục đích
- Caller/consumer
- Yêu cầu auth
- Request parameters
- Header
- Request body
- Success response
- Error response
- Retry/timeout/idempotency nếu có
- Mapping với UI/business action

##### Database

Với mỗi bảng bị ảnh hưởng, mô tả:

- Tên bảng
- Mục đích
- Read/write action
- Logic insert/update/delete
- Key fields
- Validate/constraints
- Soft delete/hard delete
- Audit columns
- Data lineage/owner nếu biết

### 4. Kịch bản dùng chung và tái sử dụng

Tách các kịch bản dùng chung khỏi logic riêng từng màn hình, ví dụ:

- xóa mềm;
- approve/reject;
- export file;
- import file;
- pagination/filter/sort/search;
- upload/download attachment;
- gửi notification;
- chuyển trạng thái;
- session timeout;
- kiểm tra quyền/role.

Với mỗi kịch bản dùng chung, ghi:

- mục tiêu;
- phạm vi tái sử dụng;
- actor;
- tiền/hậu điều kiện;
- quy tắc nghiệp vụ;
- phụ thuộc kỹ thuật;
- xử lý lỗi dùng chung.

### 5. Quản trị dữ liệu và tuân thủ

Khi liên quan, bổ sung:

- danh mục trường dữ liệu;
- mapping bảng-trường;
- kiểu dữ liệu;
- chủ sở hữu dữ liệu;
- source of truth;
- phân loại truy cập;
- retention/delete behavior;
- rule kiểm tra chất lượng dữ liệu.

### 6. Yêu cầu phi chức năng

Chỉ viết khi phù hợp, nhưng phải cụ thể:

- performance;
- security;
- availability;
- usability;
- auditability;
- localization;
- browser/device support.

Không viết chung chung như “hệ thống nhanh”, “bảo mật tốt”, “dễ sử dụng”. Hãy biến thành tiêu chí kiểm thử được.

### 7. Câu hỏi mở / Giả định / Rủi ro

Luôn thêm phần này nếu còn thiếu rule hoặc có suy luận.

## Checklist bao phủ nghiệp vụ

Trước khi hoàn tất draft, tự kiểm tra đã có:

- mục tiêu và phạm vi;
- actor và quyền;
- entry point/access path;
- tiền điều kiện/hậu điều kiện;
- toàn bộ field/component;
- validate;
- trạng thái default/empty/error/loading;
- business rules;
- main/alternate/exception flow;
- success/failure outcome;
- API handling;
- DB handling;
- module/tích hợp bị ảnh hưởng;
- logging/audit nếu liên quan;
- reusable common scenarios;
- câu hỏi mở;
- non-functional constraints nếu liên quan.

## Checklist chống sót case rủi ro cao

Dùng mạnh khi chức năng liên quan authentication, session, dữ liệu trạng thái hoặc thao tác người dùng.

### Authentication và session

Kiểm tra:

- có yêu cầu login hay không;
- loại login hỗ trợ: local, SSO, email, linked account;
- remember me;
- forgot password;
- captcha;
- số lần sai password và lock tạm thời;
- nơi lưu session/token và thời hạn;
- token refresh;
- concurrent login;
- khi role thay đổi trong phiên đang active;
- logout;
- log login/logout.

### Quản lý mật khẩu

Kiểm tra:

- validate mật khẩu hiện tại;
- chính sách mật khẩu mới;
- mismatch xác nhận mật khẩu;
- có force logout sau đổi mật khẩu hay không;
- OTP/verification code;
- ảnh hưởng tới các session đang active.

### UI behavior dùng chung

Kiểm tra:

- search/filter/sort/reset;
- pagination;
- export/import;
- bulk actions;
- attachment rules;
- confirmation popup;
- empty list;
- hiển thị button theo quyền;
- loading spinner/skeleton;
- chống submit trùng.

### Data handling

Kiểm tra:

- nguồn API/DB;
- stale data/reload;
- soft delete vs hard delete;
- uniqueness;
- reference data lookup;
- length/format/range validation;
- null handling;
- masking nếu là dữ liệu nhạy cảm.

## Mode E: Quy trình review/gap-check chuyên sâu cho BA Lead

Khi chạy Mode E, không chỉ nêu nhận xét chung. Hãy review như một BA Lead chuẩn bị feedback cho BA owner trước khi chuyển tài liệu sang Dev/QA/UAT.

### E1. Xác định phạm vi review

Đầu tiên, tóm tắt ngắn:

- tài liệu/chức năng đang review;
- nguồn input đã có;
- phạm vi review thực hiện được;
- phạm vi chưa review được do thiếu thông tin;
- giả định khi review.

### E2. Chấm mức độ sẵn sàng của SRS

Luôn đưa bảng readiness score:

| Nhóm tiêu chí | Điểm 0-5 | Nhận xét ngắn | Rủi ro chính |
|---|---:|---|---|
| Scope & objective |  |  |  |
| Actor/permission |  |  |  |
| UI/component detail |  |  |  |
| Business rules |  |  |  |
| Main/alternate/exception flow |  |  |  |
| Validation & error handling |  |  |  |
| API/DB/integration |  |  |  |
| Data governance/security |  |  |  |
| Testability for QA |  |  |  |
| UAT readiness |  |  |  |

Sau bảng, kết luận một trong các trạng thái:

- **Ready for Dev/QA**: chỉ còn lỗi nhỏ, không ảnh hưởng build/test.
- **Conditionally ready**: có thể chuyển tiếp nhưng phải xử lý các gap major/critical đã nêu.
- **Not ready**: thiếu rule/flow/case quan trọng, dễ build sai hoặc QA không test được.

### E3. Phân loại issue review

Dùng đúng 4 mức độ:

- **Critical**: chặn Dev/QA/UAT hoặc có nguy cơ implement sai nghiệp vụ trọng yếu.
- **Major**: dễ gây hiểu nhầm, sót case quan trọng hoặc thiếu dữ liệu để test/build.
- **Minor**: lỗi wording/format/thiếu rõ ràng nhưng ít ảnh hưởng logic.
- **Suggestion**: khuyến nghị cải thiện maintainability, reuse hoặc clarity.

Với mỗi issue, ghi theo bảng:

| ID | Severity | Vị trí/phần | Vấn đề | Tác động | Khuyến nghị sửa | Câu viết lại đề xuất |
|---|---|---|---|---|---|---|
| REV-001 | Critical/Major/Minor/Suggestion |  |  |  |  |  |

Nguyên tắc: **mọi issue Critical/Major phải có khuyến nghị sửa cụ thể và câu viết lại đề xuất**.

### E4. Ma trận traceability

Tạo traceability để kiểm tra yêu cầu có đi đủ từ business → UI → flow → API/DB → QA hay không.

| Business requirement | UI/Screen | Business rule/Flow | API/DB/Integration | Validation/Error | Test case gợi ý | Gap |
|---|---|---|---|---|---|---|

Nếu thiếu mapping ở bất kỳ cột nào, đánh dấu Gap rõ ràng, ví dụ:

- thiếu UI field mapping;
- thiếu rule validate;
- thiếu API response/error;
- thiếu DB update logic;
- thiếu test case cho exception flow.

### E5. Checklist review theo lớp

Review theo 8 lớp sau:

1. **Scope layer**: mục tiêu, in/out scope, impacted modules, assumptions.
2. **Actor & permission layer**: role, quyền xem/thêm/sửa/xóa/export/approve, unauthorized behavior.
3. **UI layer**: field list, state, placeholder, tooltip, default value, disable/hide, empty/loading/error.
4. **Business rule layer**: rule tính toán, rule chuyển trạng thái, rule uniqueness, dependency rule, SLA/cut-off time.
5. **Flow layer**: main flow, alternate flow, exception flow, rollback/cancel/retry, duplicate submit.
6. **Data layer**: source of truth, data mapping, null, stale data, masking, retention, audit columns.
7. **Integration/API/DB layer**: endpoint, method, request/response, error code, timeout, idempotency, DB action.
8. **QA/UAT layer**: acceptance criteria, test data, expected result, edge cases, non-functional requirement.

### E6. Gap checklist chi tiết cho BA Lead

Khi review, tìm chủ động các gap sau:

- Thiếu định nghĩa success/failure rõ ràng.
- Thiếu alternate flow khi người dùng cancel/back/refresh.
- Thiếu exception flow khi API timeout, 4xx, 5xx.
- Thiếu empty state, loading state, no permission state.
- Thiếu rule khi dữ liệu bị xóa/inactive trong lúc người dùng thao tác.
- Thiếu rule chống double click/double submit.
- Thiếu phân biệt create/edit/view/delete mode.
- Thiếu rule audit/log.
- Thiếu role matrix hoặc permission behavior.
- Thiếu mapping field UI với API/DB.
- Thiếu validate theo điều kiện bắt buộc.
- Thiếu behavior khi dữ liệu quá dài, ký tự đặc biệt, trùng, null.
- Thiếu mô tả notification/email/message.
- Thiếu trạng thái sau khi thao tác thành công/thất bại.
- Thiếu rollback/compensation khi xử lý nhiều bước.
- Thiếu impact tới module liên quan.
- Thiếu acceptance criteria hoặc test case gợi ý.

### E7. Output bắt buộc cho Mode E

Khi người dùng yêu cầu review/gap-check kiểu BA Lead, trả kết quả theo thứ tự:

1. **Tóm tắt phạm vi review**
2. **Kết luận readiness**
3. **Readiness score table**
4. **Danh sách issue theo severity**
5. **Traceability matrix**
6. **Gap checklist theo lớp**
7. **Câu hỏi cần hỏi lại stakeholder/BA owner**
8. **Đề xuất chỉnh sửa ưu tiên**
9. **Đoạn rewrite mẫu cho các phần quan trọng**

### E8. Cách viết feedback cho BA owner

Feedback phải cụ thể, không chỉ nói “thiếu chi tiết”. Dùng mẫu:

- “Phần [x] đang thiếu [y], dẫn đến [tác động]. Đề xuất bổ sung rule: [rule cụ thể].”
- “Yêu cầu này chưa testable vì chưa nêu [điều kiện/expected result]. Có thể viết lại: [câu viết lại].”
- “Luồng hiện tại mới có happy path, cần bổ sung case [alternate/exception] để QA có thể tạo test case.”

Tránh feedback chung chung như:

- “Cần mô tả rõ hơn.”
- “Thiếu case.”
- “Bổ sung API.”

Nếu phải dùng nhận xét chung, luôn đi kèm ví dụ cụ thể và câu viết lại.

### E9. Review output mini-template

Dùng template sau khi phù hợp:

```markdown
## 1. Tóm tắt phạm vi review
[Chức năng/tài liệu được review, input đã có, giả định]

## 2. Kết luận readiness
**Trạng thái:** Ready for Dev/QA | Conditionally ready | Not ready
**Lý do chính:** [1-3 ý]

## 3. Readiness score
| Nhóm tiêu chí | Điểm 0-5 | Nhận xét ngắn | Rủi ro chính |
|---|---:|---|---|

## 4. Issues theo severity
| ID | Severity | Vị trí/phần | Vấn đề | Tác động | Khuyến nghị sửa | Câu viết lại đề xuất |
|---|---|---|---|---|---|---|

## 5. Traceability matrix
| Business requirement | UI/Screen | Business rule/Flow | API/DB/Integration | Validation/Error | Test case gợi ý | Gap |
|---|---|---|---|---|---|---|

## 6. Gap checklist theo lớp
### Scope layer
- [Pass/Gap] ...

### Actor & permission layer
- [Pass/Gap] ...

### UI layer
- [Pass/Gap] ...

### Business rule layer
- [Pass/Gap] ...

### Flow layer
- [Pass/Gap] ...

### Data layer
- [Pass/Gap] ...

### Integration/API/DB layer
- [Pass/Gap] ...

### QA/UAT layer
- [Pass/Gap] ...

## 7. Câu hỏi cần hỏi lại stakeholder/BA owner
1. ...

## 8. Đề xuất chỉnh sửa ưu tiên
1. [Critical trước]
2. [Major tiếp theo]
3. [Minor/Suggestion sau]

## 9. Rewrite mẫu
### Phần [tên phần]
[Đoạn viết lại đề xuất]
```

## Quy tắc diễn đạt

- Dùng ngôn ngữ ngắn gọn, vận hành được.
- Ưu tiên bảng và bullet cho spec dày đặc.
- Chỉ bold các rule/cảnh báo quan trọng.
- Bullet cùng cấp phải đồng dạng ngữ pháp.
- Một khái niệm chỉ dùng một thuật ngữ.
- Không trộn requirement nghiệp vụ với suy đoán implementation trong cùng một câu.

## Mẫu câu nên dùng

### Mục đích chức năng

- Mục đích: [kết quả nghiệp vụ cần đạt].
- Người dùng mục tiêu: [role được phép truy cập].
- Đường dẫn truy cập: [menu/url/navigation path].
- Tiền điều kiện: [điều kiện phải đúng trước khi thao tác].
- Hậu điều kiện: [trạng thái sau khi hoàn tất].

### Luồng nghiệp vụ

- Hệ thống kiểm tra [điều kiện].
- Nếu [điều kiện] thỏa mãn, hệ thống [hành động].
- Nếu [điều kiện] không thỏa mãn, hệ thống [xử lý lỗi].
- Người dùng thực hiện [hành động].
- Hệ thống trả về [kết quả].

### Validate

- Trường này bắt buộc khi [điều kiện].
- Giá trị phải thỏa mãn [format/range/rule].
- Nếu không hợp lệ, hệ thống hiển thị [message/behavior].
- Hệ thống không cho phép submit khi [điều kiện].

### API

- Hệ thống gọi [method] [endpoint] để [mục đích].
- Tham số đầu vào gồm [field].
- Khi thành công (200/201), hệ thống [behavior].
- Khi lỗi nghiệp vụ (4xx), hệ thống [behavior].
- Khi lỗi hệ thống (5xx/timeout), hệ thống [behavior].

### Database

- Hệ thống đọc dữ liệu từ bảng [table].
- Hệ thống cập nhật trường [field] trong bảng [table] khi [condition].
- Bản ghi được xóa mềm bằng cách cập nhật [field/value].
- Thông tin audit gồm [created_by, created_at, updated_by, updated_at].

## Quy tắc output khi trả lời trong chat

Khi tạo SRS, trả theo thứ tự:

1. Tóm tắt hiểu biết
2. Phạm vi và giả định
3. Nội dung SRS
4. Câu hỏi mở
5. Gap/risk checklist

Khi review theo BA Lead, ưu tiên Mode E và trả đúng template Mode E.

Nếu người dùng yêu cầu tạo document artifact, tạo Markdown rõ heading và bảng.

## Definition of done

Một draft chỉ được xem là đủ tốt khi:

- requirement kiểm thử được;
- luồng nghiệp vụ có thứ tự logic;
- field và validate được mô tả;
- success/failure/exception được bao phủ;
- API/DB touchpoint được xác định khi liên quan;
- nguồn dữ liệu được ghi rõ;
- reusable scenario được tách riêng;
- open question được liệt kê thay vì bị che giấu.

## Hành vi ưu tiên

- Chủ động viết draft, không chỉ hỏi lại.
- Không dừng chỉ vì input thiếu một phần.
- Tạo cấu trúc hoàn chỉnh nhất có thể với giả định được đánh dấu rõ.
- Khi yêu cầu quá rộng, chia thành module/chức năng và tiếp tục.
- Khi người dùng cung cấp checklist, chuyển checklist thành quality gate trong SRS.
