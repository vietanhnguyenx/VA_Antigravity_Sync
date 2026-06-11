---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.2.3 Kiến trúc triển khai (Deployment architecture)"
source_pages: "32-37"
---

# III.2.3 Kiến trúc triển khai (Deployment architecture)

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.2.3 Kiến trúc triển khai (Deployment architecture)
- Trang: 32–37

## Nội dung trích nguyên văn (Verbatim Extract)

**Hình 4. Sơ đồ kiến trúc triển khai**

Kiến trúc triển khai hệ thống được thiết kế theo mô hình nhiều lớp, phân tách rõ ràng giữa vùng truy cập bên ngoài, vùng trung gian (DMZ) và vùng nội bộ, đồng thời áp dụng kiến trúc microservices theo định hướng cloud-native nhằm bảo đảm khả năng mở rộng linh hoạt, tính sẵn sàng cao, an toàn thông tin và khả năng vận hành ổn định trong môi trường khai thác liên tục.

Hệ thống được thiết kế theo nguyên tắc phân tách và cô lập tài nguyên (resource isolation) trên toàn bộ kiến trúc, áp dụng cho các thành phần như lớp ứng dụng, cơ sở dữ liệu, hệ thống logging và các dịch vụ nền tảng. Mỗi thành phần được triển khai độc lập trên các môi trường hoặc namespace riêng biệt và được cấu hình tài nguyên chuyên biệt thông qua các cơ chế resource request/limit và resource quota.

Kiến trúc này cho phép kiểm soát chặt chẽ mức tiêu thụ tài nguyên của từng thành phần, loại bỏ hiện tượng resource contention và đảm bảo không xảy ra tình trạng một thành phần chiếm dụng tài nguyên ảnh hưởng đến toàn hệ thống. Đồng thời, việc cô lập tài nguyên giúp hạn chế lan truyền sự cố, tăng khả năng chịu lỗi và duy trì hiệu năng ổn định trong các kịch bản tải cao hoặc tăng trưởng đột biến.

Trên cơ sở đó, hệ thống được tổ chức thành các lớp và thành phần chính như sau:

### ● Lớp truy cập bên ngoài (External Access Layer)
- Người dùng truy cập hệ thống thông qua các kênh Website và Mobile. Toàn bộ lưu lượng từ bên ngoài được kiểm soát tại lớp External Firewall, bảo đảm chỉ các kết nối hợp lệ mới được phép đi vào hệ thống.
- Phía sau lớp tường lửa ngoài, hệ thống triển khai NGINX (HA) tại vùng DMZ để thực hiện vai trò reverse proxy, tiếp nhận lưu lượng HTTP/HTTPS từ người dùng, hỗ trợ xử lý các kết nối WebSocket và tối ưu phân phối nội dung ở lớp truy cập.

### ● Lớp truy cập dịch vụ (Access Layer)
- Phía sau lớp Internal Firewall, hệ thống triển khai Access Layer gồm hai thành phần chính:
  - API Gateway (Apache APISIX – Cluster)
  - IAM/SSO (Keycloak)
- API Gateway đóng vai trò là điểm truy cập trung tâm đối với toàn bộ các dịch vụ ứng dụng, thực hiện các chức năng định tuyến (routing), kiểm soát truy cập (authentication/authorization), áp chính sách (policy enforcement) và quản lý vòng đời API. Bên cạnh đó, hệ thống triển khai các cơ chế kiểm soát tải tại lớp gateway như rate limiting, connection limiting và request throttling nhằm từ chối các yêu cầu vượt ngưỡng, bảo vệ hệ thống backend và đảm bảo khả năng hoạt động ổn định khi lưu lượng tăng cao.
- Toàn bộ lưu lượng truy cập được ghi log và giám sát tập trung, phục vụ truy vết, phân tích và vận hành hệ thống.
- Keycloak được triển khai như thành phần IAM/SSO độc lập trong cùng lớp truy cập dịch vụ, chịu trách nhiệm xác thực tập trung, quản lý người dùng, vai trò, quyền truy cập và cung cấp cơ chế Single Sign-On cho các phân hệ. API Gateway sử dụng kết quả xác thực và token do hệ thống IAM cấp để thực hiện kiểm tra truy cập đối với từng request, qua đó bảo đảm tách biệt rõ ràng giữa chức năng xác thực và chức năng điều phối dịch vụ.

### ● Lớp ứng dụng nghiệp vụ (Application Layer)
- Các chức năng nghiệp vụ của hệ thống được tổ chức dưới dạng microservices và triển khai trên nền tảng container orchestration. Kiến trúc ứng dụng được phân tách theo từng miền nghiệp vụ.
- Việc phân tách các chức năng theo từng nhóm dịch vụ độc lập giúp hệ thống bảo đảm các nguyên tắc kiến trúc microservices, bao gồm: triển khai độc lập, mở rộng độc lập, giảm phụ thuộc chéo giữa các thành phần và dễ dàng bảo trì, nâng cấp theo từng miền nghiệp vụ. Mỗi nhóm dịch vụ có thể được scale riêng theo đặc thù tải, góp phần tối ưu tài nguyên hạ tầng và nâng cao khả năng đáp ứng khi khối lượng xử lý tăng.

### ● Lớp tích hợp (Integration Layer)
- Bên cạnh các microservices nghiệp vụ, hệ thống triển khai lớp Integration để phục vụ trao đổi dữ liệu, xử lý tích hợp và kết nối với các hệ thống liên quan. Lớp này bao gồm các thành phần:
  - MinIO: lưu trữ đối tượng, tài liệu, file nghiệp vụ và dữ liệu tích hợp
  - Redis: cache, pub/sub, hỗ trợ tăng tốc truy xuất và xử lý realtime
  - Kafka: message broker phục vụ tích hợp bất đồng bộ, event-driven và đồng bộ dữ liệu theo luồng
- Lớp tích hợp cho phép hệ thống hỗ trợ đồng thời các mô hình giao tiếp đồng bộ (synchronous) và bất đồng bộ (asynchronous), phù hợp với đặc thù TOSS phải kết nối nhiều nguồn dữ liệu, nhiều hệ thống khai thác và nhiều luồng xử lý khác nhau. Cách tổ chức này giúp tách biệt logic tích hợp khỏi logic nghiệp vụ lõi, nâng cao tính linh hoạt khi bổ sung hoặc thay đổi các kết nối trong tương lai.

### ● Lớp AI/ML và dịch vụ nâng cao
- Kiến trúc có dự phòng không gian mở rộng cho lớp AI/ML, bao gồm các công cụ và framework phục vụ xây dựng các năng lực phân tích nâng cao, mô hình học máy, điều phối tác vụ AI và khai thác mô hình ngôn ngữ lớn. Lớp này được kết nối với cả Application Layer, Integration Layer và Data Platform, qua đó cho phép từng bước bổ sung các chức năng như phân tích dữ liệu nâng cao, hỗ trợ ra quyết định, tối ưu điều hành và các bài toán thông minh trong tương lai.
- Việc bố trí lớp AI/ML như một lớp mở rộng độc lập giúp bảo toàn kiến trúc lõi của hệ thống, đồng thời tạo nền tảng cho lộ trình phát triển dài hạn mà không làm ảnh hưởng đến các dịch vụ nghiệp vụ hiện hữu.

### ● Lớp truy cập cơ sở dữ liệu (Database Access Layer)
- Giữa lớp ứng dụng và lớp cơ sở dữ liệu, hệ thống sử dụng Database Proxy theo mô hình ProxySQL Cluster / MaxScale, đảm nhiệm các chức năng:
  - Quản lý kết nối cơ sở dữ liệu tập trung
  - Phân luồng truy cập read/write
  - Hỗ trợ cân bằng tải truy vấn đọc
  - Hỗ trợ failover khi node cơ sở dữ liệu gặp sự cố
  - Tách lớp ứng dụng khỏi topology vật lý của cụm cơ sở dữ liệu
- Việc sử dụng lớp Database Proxy giúp tăng tính linh hoạt trong vận hành, tối ưu hiệu năng truy cập dữ liệu và nâng cao tính sẵn sàng của toàn bộ hệ thống dữ liệu phía sau.

### ● Lớp cơ sở dữ liệu (Database)
- Hệ thống áp dụng nguyên tắc database per service/domain, theo đó dữ liệu được phân tách theo từng nhóm chức năng
- Mỗi cụm cơ sở dữ liệu được tổ chức theo mô hình Primary – Replicas, trong đó:
  - Primary (RW) đảm nhiệm xử lý ghi
  - Replicas (RO) phục vụ đọc, mở rộng truy cập và dự phòng
- Dữ liệu được đồng bộ thông qua Binary Log Replication, hỗ trợ mở rộng đọc và tăng cường tính sẵn sàng cho từng miền dữ liệu. Cách tiếp cận này phù hợp với đặc thù microservices, giúp mỗi nhóm dịch vụ sở hữu và quản lý dữ liệu riêng biệt, giảm phụ thuộc chéo và hạn chế ảnh hưởng dây chuyền khi có thay đổi hoặc sự cố xảy ra tại một domain cụ thể.

### ● Lớp dữ liệu phân tích (Data Platform)
- Bên cạnh các cơ sở dữ liệu giao dịch, hệ thống triển khai Data Platform nhằm phục vụ lưu trữ, tổng hợp, khai thác và phân tích dữ liệu, bao gồm các thành phần chính:
  - Raw Data Storage
  - Data Mart
  - Model Registry
- Data Platform tiếp nhận dữ liệu từ các cơ sở dữ liệu nghiệp vụ và các nguồn dữ liệu khác thông qua cơ chế ETL, hình thành nền tảng dữ liệu tập trung phục vụ báo cáo, phân tích, tích hợp downstream và các bài toán AI/ML. Kiến trúc này giúp tách biệt rõ giữa tải giao dịch (OLTP) và tải phân tích (OLAP), bảo đảm hệ thống nghiệp vụ vận hành ổn định trong khi vẫn đáp ứng được nhu cầu khai thác dữ liệu chuyên sâu.

### ● Lớp giám sát, log và vận hành
- Để bảo đảm khả năng quan sát hệ thống và vận hành tập trung, kiến trúc triển khai đầy đủ các thành phần Monitoring/Logging, bao gồm:
  - Prometheus, Grafana, LGTM cho giám sát metrics, hạ tầng, dịch vụ
  - Logging Stack để thu thập, lưu trữ và phân tích log tập trung
- Các thành phần này hỗ trợ theo dõi trạng thái hoạt động của toàn bộ hệ thống, phát hiện sớm bất thường, cảnh báo sự cố, phục vụ truy vết, audit và hỗ trợ xử lý sự cố trong quá trình vận hành. Việc tổ chức riêng lớp giám sát và logging giúp đáp ứng các yêu cầu về vận hành, quản lý log tập trung và giám sát tổng thể hệ thống.

### ● Lớp CI/CD và quản trị triển khai
- Kiến trúc cũng bao gồm lớp CI/CD với các công cụ như GitLab, ArgoCD, cùng các thành phần hỗ trợ kiểm soát chất lượng mã nguồn và triển khai. Lớp này cho phép tự động hóa các bước build, kiểm thử, phát hành và triển khai ứng dụng, bảo đảm tính nhất quán giữa các môi trường, giảm thiểu sai sót thủ công và rút ngắn thời gian đưa thay đổi.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- (chưa có)
