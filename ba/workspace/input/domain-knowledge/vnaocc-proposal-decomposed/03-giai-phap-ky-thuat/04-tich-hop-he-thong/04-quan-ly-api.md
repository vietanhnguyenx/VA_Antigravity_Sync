---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.4.4 Quản lý API lifecycle"
source_pages: "44-50"
---

# III.4.4 Quản lý API lifecycle

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.4.4 Quản lý API lifecycle
- Trang: 44–50

## Nội dung trích nguyên văn (Verbatim Extract)

- ● Hệ thống áp dụng URL Path Versioning làm phương thức quản lý phiên bản chính cho các public API, nhằm đảm bảo khả năng tương thích ngược, kiểm soát thay đổi và quản lý vòng đời API một cách minh bạch và nhất quán.
  - /api/v1/...: Phiên bản GA (General Availability), được vận hành chính thức, bảo đảm SLA và được hỗ trợ đầy đủ theo chính sách API Lifecycle.
  - /api/v2/...: Phiên bản mới (Next/Beta), phục vụ mở rộng hoặc thay đổi hành vi API; được triển khai song song với phiên bản GA trong giai đoạn chuyển tiếp.
  - /api/...: Alias trỏ tới phiên bản GA mới nhất, chỉ sử dụng cho mục đích nội bộ hoặc thử nghiệm; không sử dụng cho các tích hợp dài hạn do không đảm bảo tính ổn định phiên bản.

- ● Trong đó, URL Path Versioning chỉ phản ánh MAJOR version của API. Các thay đổi MINOR (bổ sung chức năng, mở rộng API) và PATCH (sửa lỗi, tối ưu) được quản lý ở mức API contract (OpenAPI specification) theo chuẩn Semantic Versioning, đảm bảo tương thích ngược và không gây gián đoạn các hệ thống tích hợp hiện hữu.

- ● Các thay đổi gây phá vỡ tương thích (breaking changes) được triển khai dưới dạng phiên bản MAJOR mới (ví dụ: /v2), đồng thời duy trì song song phiên bản cũ trong một khoảng thời gian chuyển tiếp để đảm bảo các hệ thống tích hợp có đủ thời gian cập nhật.

- ● Việc nâng cấp, deprecate và sunset API được thực hiện theo API Lifecycle Policy thống nhất, có thông báo trước kèm theo thời gian chuyển đổi rõ ràng, và được kiểm soát tập trung tại API Gateway nhằm đảm bảo tính nhất quán và khả năng quản trị toàn hệ thống.

### Quy tắc nâng version (Semantic Versioning):

**Hình 8. Sơ đồ quy tắc nâng version**

- Hệ thống áp dụng Semantic Versioning (MAJOR.MINOR.PATCH) cho API contract:
  - MAJOR: Thay đổi không tương thích ngược (breaking change), yêu cầu phát hành version mới (ví dụ: v1 → v2).
  - MINOR: Bổ sung tính năng mới, tương thích ngược với client hiện hữu.
  - PATCH: Sửa lỗi hoặc tối ưu kỹ thuật, không thay đổi API contract.
- Nguyên tắc chung:
  - Breaking change chỉ được phép khi phát hành MAJOR version mới.
  - Phiên bản GA không thực hiện breaking change trong suốt vòng đời hỗ trợ.

### Chi tiết Breaking Changes (MAJOR):

- Các thay đổi đối với API làm mất khả năng tương thích ngược (backward compatibility), khiến các hệ thống tích hợp hiện tại không thể tiếp tục sử dụng API như trước mà không cần điều chỉnh.
- Các thay đổi này thường tác động trực tiếp tới API contract (cấu trúc request/response, endpoint, kiểu dữ liệu hoặc hành vi xử lý), dẫn đến việc client không thể parse dữ liệu, gọi API hoặc xử lý kết quả một cách chính xác như phiên bản cũ.
- Do ảnh hưởng trực tiếp tới các hệ thống tích hợp, Breaking Changes luôn được kiểm soát chặt chẽ và chỉ được thực hiện thông qua việc phát hành phiên bản MAJOR mới, thay vì thay đổi trực tiếp trên phiên bản đang hoạt động.

| Loại thay đổi | Trước | Sau | Tác động |
|---|---|---|---|
| Xóa field | {flightCode: "VN123"} | {} | Client không còn nhận diện chuyến bay |
| Đổi tên field | {departureTime: "10:00"} | {scheduledDeparture: "10:00"} | Client không parse được dữ liệu thời gian |
| Đổi kiểu dữ liệu | {delayMinutes: "15"} | {delayMinutes: 15} | Vi phạm contract dữ liệu, gây lỗi xử lý phía client |
| Thay đổi required field | gate?: string | gate: string | Request cũ không hợp lệ, bị từ chối |
| Xóa endpoint | GET /flights/{id} | (removed) | Client không còn truy vấn được thông tin chuyến bay |
| Đổi HTTP method | POST /flight-plans | PUT /flight-plans | Request không hợp lệ (405 Method Not Allowed) |
| Thay đổi cấu trúc response | {data: [...]} | {flights: [...]} | Client không đọc được dữ liệu |
| Thêm parameter bắt buộc | GET /flights | GET /flights?airportCode=HAN | Request cũ không còn hợp lệ |

### Chi tiết Non-Breaking Changes (MAJOR/PATCH):

- Các thay đổi đối với API không làm mất khả năng tương thích ngược, cho phép các hệ thống tích hợp hiện tại tiếp tục hoạt động mà không cần điều chỉnh.
- Các thay đổi này không ảnh hưởng tới API contract hiện hữu, mà chỉ mở rộng hoặc cải thiện hành vi API, ví dụ như bổ sung field optional, thêm endpoint mới hoặc tối ưu hiệu năng. Client hiện tại có thể bỏ qua các thay đổi này mà không bị ảnh hưởng đến luồng xử lý.
- Do không gây gián đoạn, Non-Breaking Changes được triển khai trực tiếp trên các phiên bản hiện tại thông qua MINOR hoặc PATCH version, giúp hệ thống có thể cải tiến liên tục mà vẫn đảm bảo tính ổn định.

| Loại thay đổi | Ví dụ | Version | Lý do không breaking |
|---|---|---|---|
| Thêm field optional | aircraftType?: string | v1.1 | Client hiện tại có thể bỏ qua field mới |
| Thêm endpoint mới | GET /flights/{id}/history | v1.1 | Không ảnh hưởng các endpoint hiện có |
| Thêm giá trị enum | status: SCHEDULED \| DELAYED \| CANCELLED | v1.1 | Client có thể xử lý fallback với giá trị mới |
| Sửa lỗi nghiệp vụ | Trả đúng mã lỗi 400 thay vì 500 khi request sai | v1.0.1 | Điều chỉnh hành vi về đúng chuẩn, không thay đổi contract |
| Tối ưu hiệu năng | Tối ưu truy vấn danh sách chuyến bay | v1.0.1 | Không thay đổi cấu trúc request/response |
| Bổ sung field response | {flightCode, departureTime} trong v1.1 → thêm arrivalTime | | Không ảnh hưởng client cũ |
| Mở rộng filter | GET /flights → thêm filter status=DELAYED | v1.1 | Không bắt buộc, client cũ vẫn hoạt động |

### Version Lifecycle:

**Hình 9. Sơ đồ vòng đời version API**

- Giải thích: Mỗi API version trải qua 5 giai đoạn: Alpha (nội bộ) → Beta (đối tác) → GA (công khai, ổn định) → Deprecated (ngừng hỗ trợ feature) → EOL (xóa hoàn toàn).

- Chi tiết:

| Giai đoạn | Thời gian | Đối tượng | Mục đích | Quy định |
|---|---|---|---|---|
| Alpha | 1–3 tháng | Nội bộ | Thử nghiệm, phát triển ban đầu | Cho phép thay đổi và breaking bất kỳ lúc nào |
| Beta | 3–6 tháng | Đối tác, người dùng thử | Thu thập phản hồi, hoàn thiện API | Breaking changes có thể xảy ra, có thông báo trước (≥ 30 ngày) |
| GA (General Availability) | Vận hành chính thức | Công khai | Sử dụng ổn định trong production | Không cho phép breaking changes; chỉ bổ sung backward-compatible features |
| Deprecated | ≥ 12 tháng | Người dùng hiện hữu | Thời gian chuyển đổi sang version mới | Không phát triển feature mới; chỉ hỗ trợ fix lỗi và bảo mật |
| EOL (End of Life) | Không áp dụng | - | Ngừng cung cấp API | API bị vô hiệu hóa, trả về HTTP 410 (Gone) |

### Quy trình chuyển đổi trạng thái API (Stage Transition):

Quy trình chuyển đổi trạng thái API được thực hiện theo các điều kiện kiểm soát rõ ràng, kèm theo cơ chế thông báo và hành động tương ứng, nhằm đảm bảo các hệ thống tích hợp (bao gồm hệ thống nội bộ và hệ thống bên ngoài) có đủ thời gian chuyển đổi và không bị gián đoạn dịch vụ.

| Chuyển giai đoạn | Điều kiện | Thông báo | Hành động thực hiện |
|---|---|---|---|
| Alpha → Beta | Hoàn thiện chức năng chính, đạt ≥ 80% test coverage | Thông báo nội bộ | Mở quyền truy cập cho các hệ thống tích hợp (nội bộ và bên ngoài) trong phạm vi kiểm soát; cung cấp tài liệu kỹ thuật cơ bản |
| Beta → GA | Không còn lỗi nghiêm trọng (P1), tài liệu đầy đủ, SDK sẵn sàng | Thông báo tới các hệ thống tích hợp và công bố chính thức | Công bố API chính thức, cam kết SLA, mở truy cập production |
| GA → Deprecated | Có phiên bản GA mới thay thế và đã vận hành tối thiểu 30 ngày | Thông báo tới các hệ thống tích hợp trước ≥ 90 ngày | Gắn Deprecation header, cung cấp hướng dẫn migration và lộ trình chuyển đổi |
| Deprecated → EOL | Sau tối thiểu 12 tháng kể từ khi Deprecated | Thông báo tới các hệ thống tích hợp trước ≥ 30 ngày | Ngừng cung cấp API, trả về HTTP 410 (Gone), thu hồi quyền truy cập |

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
