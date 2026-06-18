## Ke_hoach_tong_the
| KẾ HOẠCH KHẢO SÁT THEO NGHIỆP VỤ TỪNG MODULE - 1 THÁNG (GỐI ĐẦU SẢN XUẤT TỪ TUẦN 2) | Unnamed: 1 | Unnamed: 2 | Unnamed: 3 |
| --- | --- | --- | --- |
| Phạm vi tham chiếu: bộ yêu cầu kỹ thuật TOSS và mô hình khảo sát 2 team (BA + Technical/Integration); đầu mối Vietnam Airlines thể hiện theo vai trò/bộ phận đối ứng. | NaN | NaN | NaN |
| NaN | NaN | NaN | NaN |
| Mã module | Tên module | Nhóm | Phạm vi khảo sát chính |
| M1 | Kiến trúc tích hợp & dữ liệu dùng chung | Cross-module | API Gateway, data flow, source of truth, security baseline, logging/audit |
| M2 | Lập lịch bay / Scheduling | Nghiệp vụ lõi | Flight schedule, schedule change, seasonal schedule, pairing with operational flight |
| M3 | Tổ bay / Crew | Nghiệp vụ lõi | Crew roster, duty, crew assignment, AVES/Crew system data |
| M4 | Tàu bay & kỹ thuật | Nghiệp vụ lõi | Aircraft profile, maintenance, AOG, MEL/CDL, Performance Factor |
| M5 | Sân bay & ràng buộc khai thác | Nghiệp vụ lõi | Airport data, slot, stand/gate, ACDM, airport constraints |
| M6 | Chặng bay / route / nhiên liệu | Nghiệp vụ lõi | Sector logic, route, cost index, reserve, tankering, flight planning inputs |
| M7 | Điều hành chuyến bay / OCC | Ưu tiên cao | Flight detail, disruption, operational monitoring, dispatch decisions |
| M8 | Tài liệu chuyến bay | Ưu tiên cao | OFP, LS/GD/PM/NOTOC, confirm/reject, revision management |
| M9 | Tải trọng / hành khách / hàng hóa | Ưu tiên cao | Payload, ZFW, pax/baggage/cargo, sync from DCS/cargo sources |
| M10 | Báo cáo điều hành & KPI | Báo cáo | Daily ops, utilization, OTP/OSP, fuel, crew, aircraft, management reporting |
| NaN | NaN | NaN | NaN |
| Giả định then chốt | NaN | NaN | NaN |
| Giả định then chốt | Nội dung | NaN | NaN |
| A1 | 1 tuần làm việc = 5 ngày làm việc (Thứ 2 - Thứ 6) | NaN | NaN |
| A2 | Khảo sát kéo dài 4 tuần (20 ngày làm việc) | NaN | NaN |
| A3 | Sản xuất được phép bắt đầu từ Tuần 2 theo mô hình gối đầu / freeze theo batch | NaN | NaN |
| A4 | Đầu mối Vietnam Airlines thể hiện theo vai trò/bộ phận, chưa phải tên cá nhân | NaN | NaN |
| A5 | Mỗi workshop phải có đại diện nghiệp vụ + đại diện hệ thống nguồn + đại diện CNTT khi cần | NaN | NaN |
| A6 | Mục tiêu của tháng 1 là chốt baseline đủ để build liên tục, không cố đóng 100% toàn bộ chi tiết phase sau | NaN | NaN |
| NaN | NaN | NaN | NaN |
| Tổng quan theo tuần | NaN | NaN | NaN |
| Tuần | Số ngày khảo sát | Module chính | Mốc gối đầu sản xuất |
| Tuần 1 | 5 | M7, M8, M9, M1 | Freeze Batch 1 cuối tuần |
| Tuần 2 | 5 | M2, M3, M4, M5 | Bắt đầu build Batch 1, freeze Batch 2 cuối tuần |
| Tuần 3 | 5 | M6, M10, Cross-module | Build Batch 2, freeze Batch 3 cuối tuần |
| Tuần 4 | 5 | Consolidation, SIT/UAT basis, Ops | Build Batch 3, chốt baseline tháng 1 |

## Plan_20_Ngay
| STT | Tuần | Ngày | Chủ đề khảo sát | Mã module | Mục tiêu khảo sát | Phần việc BA | Phần việc Technical/Integration | Đầu mối đối ứng Vietnam Airlines | Đầu ra cuối ngày / cuối cụm | Mốc gối đầu sản xuất | Batch bàn giao | Mức ưu tiên |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Tuần 1 | Ngày 1 | Khởi động dự án & chốt phạm vi | Cross-module | Kickoff, chốt module ưu tiên, thống nhất nguyên tắc khảo sát và cơ chế gối đầu sản xuất | Rà yêu cầu tổng thể, lập danh sách stakeholder, chốt phạm vi nghiệp vụ từng module, tạo issue log | Rà As-Is integration high-level, lập inventory hệ thống nguồn/đích, xác định dependency kỹ thuật | PM/Lead OCC, Trung tâm CNTT, đại diện các đơn vị nghiệp vụ | Kế hoạch khảo sát tháng 1, danh sách đầu mối VNA, danh sách tài liệu cần cung cấp | Chưa | Batch 0 | Critical |
| 2 | Tuần 1 | Ngày 2 | M7 - Điều hành chuyến bay / OCC | M7 | Làm rõ quy trình nghiệp vụ OCC, flight detail, monitoring, disruption, các điểm quyết định điều hành | Workshop flow OCC, actor, use case, business rule, cảnh báo, thông tin cần hiển thị | Làm rõ nguồn dữ liệu inbound/outbound, tần suất, độ trễ, event trigger, interface chính | OCC / Dispatch Control | Danh sách trường dữ liệu OCC, workflow nghiệp vụ, backlog câu hỏi mở | Chưa | Batch 1 | Critical |
| 3 | Tuần 1 | Ngày 3 | M8 - Tài liệu chuyến bay | M8 | Khảo sát OFP, LS/GD/PM/NOTOC, revision, confirm/reject, notification và mobile usage | Làm rõ vòng đời tài liệu, confirm logic, revision rule, nghiệp vụ publish/withdraw | Làm rõ interface tài liệu, file/API format, versioning, metadata, audit/logging | Flight Dispatch / OCC Document Owner | Field mapping tài liệu, quy tắc revision/confirm, sample file/payload | Chưa | Batch 1 | Critical |
| 4 | Tuần 1 | Ngày 4 | M9 - Tải trọng / hành khách / hàng hóa | M9 | Khảo sát quy trình payload, ZFW, pax/baggage/cargo, lịch sử cập nhật tải trọng | Làm rõ nghiệp vụ nhập tay vs đồng bộ, cách tính payload/ZFW, rule điều chỉnh, cảnh báo chênh lệch | Làm rõ data source từ DCS/Cargo/PSS, message timing, reconciliation, duplicate handling | Load Control / DCS / Cargo / PSS | Baseline field mapping payload, rule tính toán nghiệp vụ, danh sách nguồn dữ liệu | Chưa | Batch 1 | Critical |
| 5 | Tuần 1 | Ngày 5 | M1 - Kiến trúc tích hợp & dữ liệu dùng chung | M1 | Chốt chuẩn tích hợp và baseline kỹ thuật cho Batch 1 | Xác định source of truth, đối soát object nghiệp vụ dùng chung, định nghĩa chuẩn mã hóa/chung danh mục | Chốt channel giao tiếp, queue/API/file, logging, error handling, security baseline, audit trail | Trung tâm CNTT / Đội tích hợp / Security | Freeze Batch 1 để sản xuất: OCC + Flight Docs + Load/Payload + khung integration | Cuối tuần 1 | Batch 1 | Critical |
| 6 | Tuần 2 | Ngày 1 | M2 - Lập lịch bay / Scheduling | M2 | Bắt đầu khảo sát lịch bay trong khi sản xuất Batch 1 khởi động | Làm rõ schedule master, seasonal schedule, change schedule, use case khai thác lịch | Phân tích interface SSIM/ASM/SSM, cycle xử lý, data dependency với OCC/Flight | Đơn vị quản lý NetLine / Flight Scheduling | Business rules schedule + interface note; Dev có thể dựng connector Batch 1 | Có | Batch 1 đang code | High |
| 7 | Tuần 2 | Ngày 2 | M3 - Tổ bay / Crew | M3 | Khảo sát crew roster, duty, assignment, duty/break/rest và dữ liệu hiển thị cho flight | Làm rõ actor, workflow thay tổ bay, nghiệp vụ hiển thị crew trên chuyến bay và báo cáo | Làm rõ interface AVES/crew, đồng bộ roster, lịch sử thay đổi, định danh crew | Đơn vị quản lý AVES / Crew Control | Business mapping crew + data contract sơ bộ | Có | Batch 1 đang code | High |
| 8 | Tuần 2 | Ngày 3 | M4 - Tàu bay & kỹ thuật | M4 | Khảo sát aircraft master, maintenance, AOG, MEL/CDL, defect, performance factor | Làm rõ use case khai thác tàu bay, ảnh hưởng kỹ thuật tới điều hành, rule hiển thị/cảnh báo | Làm rõ interface AMOS/eTechlog/TIMS, cấu trúc dữ liệu MEL/CDL/defect/PF | Engineering Control / AMOS owner / Kỹ thuật | Danh sách object kỹ thuật & điều kiện ảnh hưởng khai thác | Có | Batch 1 đang code | High |
| 9 | Tuần 2 | Ngày 4 | M5 - Sân bay & ràng buộc khai thác | M5 | Khảo sát dữ liệu sân bay, stand/gate, slot, ACDM, ràng buộc hạn chế sân bay | Làm rõ nghiệp vụ slot/stand, airport restrictions, milestone sân bay, impact tới chuyến bay | Làm rõ nguồn dữ liệu airport/ACDM, event timing, conflict handling | OCC + Ground Ops + Airport Services | Danh sách dữ liệu sân bay/ràng buộc và integration note | Có | Batch 1 đang code | Medium |
| 10 | Tuần 2 | Ngày 5 | Playback & Freeze Batch 2 | Cross-module | Chốt kết quả tuần 2 và freeze nhóm module scheduling/crew/aircraft/airport | Playback với user, chốt open issues còn lại, xác nhận phạm vi deferred nếu có | Đóng gói interface design pack, sample payload, rule xử lý lỗi cho Batch 2 | Các đầu mối module M2-M5 | Freeze Batch 2 để sản xuất từ tuần 3 | Cuối tuần 2 | Batch 2 | Critical |
| 11 | Tuần 3 | Ngày 1 | M6 - Chặng bay / route / nhiên liệu | M6 | Khảo sát route, reserve, alternate, tankering, fuel planning và cost index | Làm rõ nghiệp vụ chặng bay, nhóm sector, reserve, tankering recommendation, business filter/report | Làm rõ nguồn data từ flight planning/LIDO/dispatch/fuel source, update cycle, calculation dependency | Flight Dispatch / Flight Planning / Fuel Efficiency | Field mapping route/fuel/tankering và công thức nghiệp vụ cơ bản | Có | Batch 2 có thể mở code từ tuần 3 | High |
| 12 | Tuần 3 | Ngày 2 | M10 - Báo cáo điều hành ngày | M10 | Khảo sát daily operations status report, dữ liệu tổng hợp hằng ngày và workflow phê duyệt báo cáo | Làm rõ chỉ số, tab báo cáo, đối tượng nhập liệu, xác nhận và luồng gửi báo cáo | Làm rõ nguồn dữ liệu tổng hợp, batch ETL, lịch phát hành báo cáo, data quality rule | OCC Reporting / BI / Điều hành khai thác | Danh mục báo cáo Daily Ops và logic nguồn dữ liệu | Có | Batch 2 đang code | Medium |
| 13 | Tuần 3 | Ngày 3 | M10 - Báo cáo tàu bay, nhiên liệu, KPI | M10 | Khảo sát utilization, OTP/OSP, FH/FC, fuel flow, remaining fuel, fuel saving KPI | Làm rõ công thức KPI, chiều drill-down, filter, dimension báo cáo, use case điều hành | Làm rõ nguồn dữ liệu/khoá join, lịch đồng bộ, tính khả thi ETL và history retention | BI / Fuel Efficiency / OCC Reporting / Kỹ thuật | Bảng mapping report - metric - source - owner | Có | Batch 2 đang code | Medium |
| 14 | Tuần 3 | Ngày 4 | Cross-module - Mapping dữ liệu & lỗi | Cross-module | Đào sâu field mapping, chuẩn mã, duplicate rule, retry, DLQ, reconciliation | Rà soát tính đúng nghĩa nghiệp vụ của các field và quy tắc đối soát liên module | Thiết kế chi tiết validation, retry, idempotency, logging, monitoring, replay | Trung tâm CNTT / Đội tích hợp + owner dữ liệu từng module | Technical design baseline cho data mapping và error handling | Có | Batch 2 đang code | Critical |
| 15 | Tuần 3 | Ngày 5 | Playback & Freeze Batch 3 | Cross-module | Chốt kết quả tuần 3 và freeze nhóm route/fuel/report/error handling | Playback với business owner, xác nhận giả định và deferred scope | Đóng gói build pack cho Batch 3, chuẩn bị SIT data set | Các đầu mối module M6, M10, CNTT | Freeze Batch 3; chuẩn bị SIT cho Batch 1-2 | Cuối tuần 3 | Batch 3 | Critical |
| 16 | Tuần 4 | Ngày 1 | Hợp nhất rule nghiệp vụ toàn hệ thống | Cross-module | Chuẩn hóa rule liên module và điều kiện chặn/cho phép xử lý dữ liệu | Rà soát rule nghiệp vụ end-to-end, exception flow, business ownership | Chuẩn hóa interface contract version 1, mapping matrix master | Các owner module + Trung tâm CNTT | Baseline rule book & mapping matrix V1 | Có | Build tiếp tục song song | High |
| 17 | Tuần 4 | Ngày 2 | Chuẩn bị test basis & SIT/UAT | Cross-module | Chốt test scenario nghiệp vụ và expected results theo module | Định nghĩa user scenario, negative case, dữ liệu test UAT, tiêu chí nghiệm thu khảo sát | Định nghĩa SIT test data, integration test flow, log/monitor checkpoints | BA key user + QA/Test counterpart + CNTT | SIT/UAT basis cho các module đã freeze | Có | Build & test chuẩn bị song song | High |
| 18 | Tuần 4 | Ngày 3 | Bổ sung vận hành / monitoring / support | Cross-module | Khảo sát dashboard giám sát, vận hành, cảnh báo, support model 24/7 và SLA | Làm rõ nhu cầu nghiệp vụ về monitor, report vận hành, escalation, support matrix | Làm rõ logging, monitoring, alerting, capacity, runbook, handover cho Ops | CNTT vận hành / Security / Helpdesk / OCC | Ops support requirement pack | Có | Build & test chuẩn bị song song | Medium |
| 19 | Tuần 4 | Ngày 4 | Playback cuối với Vietnam Airlines | Cross-module | Xác nhận phạm vi khảo sát tháng 1 theo module và quyết định các hạng mục phase 2 | Trình bày kết quả theo module, xác nhận các điểm còn mở và hành động tiếp theo | Trình bày baseline kỹ thuật, production batches, open issue và dependency | Ban điều hành dự án VNA + các đầu mối module | Biên bản playback tháng 1 và issue log chốt kỳ | Có | Build vẫn chạy | Critical |
| 20 | Tuần 4 | Ngày 5 | Chốt baseline & chuyển trạng thái sang sản xuất liên tục | Cross-module | Chốt deliverable khảo sát 1 tháng và chuyển sang mô hình build tiếp diễn | Khóa baseline khảo sát, chốt backlog phase tiếp theo, bàn giao BA package cho dev/test | Khóa baseline kỹ thuật, handover build pack, interface catalog, decision log | PM/Lead VNA + Trung tâm CNTT + owner module | Baseline khảo sát tháng 1 + kế hoạch build tháng 2 | Có | Tất cả batch đang/đã vào build | Critical |

## Dau_moi_VNA
| Mã module | Tên module | Đầu mối đối ứng Vietnam Airlines (vai trò/bộ phận) | Vai trò chính trong khảo sát |
| --- | --- | --- | --- |
| M1 | Kiến trúc tích hợp & dữ liệu dùng chung | Trung tâm CNTT / Đội tích hợp | Chủ trì tích hợp, chuẩn giao tiếp, API, queue, network, security |
| M1 | Kiến trúc tích hợp & dữ liệu dùng chung | Đại diện An toàn thông tin / Security | Firewall, VPN, chứng thư số, whitelist, cơ chế audit |
| M2 | Lập lịch bay / Scheduling | Đơn vị quản lý NetLine / Flight Scheduling | Lịch bay mùa, SSIM/ASM/SSM, thay đổi lịch |
| M3 | Tổ bay / Crew | Đơn vị quản lý AVES / Crew Control | Roster, duty, crew assignment, thông tin phi công - tiếp viên |
| M4 | Tàu bay & kỹ thuật | Khối Kỹ thuật / Engineering Control / AMOS owner | Thông tin tàu bay, maintenance, MEL/CDL, AOG, eTechlog |
| M5 | Sân bay & ràng buộc khai thác | OCC + Ground Operations + Airport Services | Slot, stand/gate, ACDM, hạn chế sân bay, milestone airport |
| M6 | Chặng bay / route / nhiên liệu | Flight Dispatch / Flight Planning / Fuel Efficiency | Route, OFP, reserve, alternate, tankering, cost index |
| M7 | Điều hành chuyến bay / OCC | OCC / Dispatch Control | Luồng điều hành chuyến bay, xử lý gián đoạn, flight monitoring |
| M8 | Tài liệu chuyến bay | Flight Dispatch / OCC Document Owner | OFP, flight package, revision, confirm/reject workflow |
| M9 | Tải trọng / hành khách / hàng hóa | Load Control / DCS / Cargo / PSS | Pax, baggage, cargo, ULD, payload, ZFW |
| M10 | Báo cáo điều hành & KPI | OCC Reporting / BI / Khai thác bay / Nhiên liệu | Công thức KPI, báo cáo vận hành, fuel saving, utilization |

## Goi_dau_san_xuat
| Batch | Phạm vi module | Freeze khảo sát | Bắt đầu sản xuất | Kết quả bàn giao cho Dev/Test |
| --- | --- | --- | --- | --- |
| Batch 1 | M7 OCC + M8 Tài liệu chuyến bay + M9 Tải trọng/Pax + khung M1 tích hợp | Cuối Tuần 1 | Từ Tuần 2 | Interface skeleton, field mapping V1, validation/error baseline, sample payload |
| Batch 2 | M2 Scheduling + M3 Crew + M4 Aircraft/Maintenance + M5 Airport/Constraints | Cuối Tuần 2 | Từ Tuần 3 | Business rule pack, integration contract, sample file/message, open issues controlled |
| Batch 3 | M6 Route/Fuel + M10 Reports + cross-module reconciliation/error handling | Cuối Tuần 3 | Từ Tuần 4 | Metric-source mapping, reconciliation rules, SIT/UAT basis, reporting baseline |
| NaN | NaN | NaN | NaN | NaN |
| Giả định then chốt | Nội dung | NaN | NaN | NaN |
| A1 | 1 tuần làm việc = 5 ngày làm việc (Thứ 2 - Thứ 6) | NaN | NaN | NaN |
| A2 | Khảo sát kéo dài 4 tuần (20 ngày làm việc) | NaN | NaN | NaN |
| A3 | Sản xuất được phép bắt đầu từ Tuần 2 theo mô hình gối đầu / freeze theo batch | NaN | NaN | NaN |
| A4 | Đầu mối Vietnam Airlines thể hiện theo vai trò/bộ phận, chưa phải tên cá nhân | NaN | NaN | NaN |
| A5 | Mỗi workshop phải có đại diện nghiệp vụ + đại diện hệ thống nguồn + đại diện CNTT khi cần | NaN | NaN | NaN |
| A6 | Mục tiêu của tháng 1 là chốt baseline đủ để build liên tục, không cố đóng 100% toàn bộ chi tiết phase sau | NaN | NaN | NaN |

## Function list
|
|  |