# Trích xuất (xlsx): Sizing-update260609 - 4T.xlsx


## Sheet: Chi tiết máy chủ 18 TB (69 dòng)

| Tổng thể |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|
| Sizing đảm bảo cho: |  |  |  |  |  |  |  |
|  | Dữ liệu hệ thống 18 TB ( 5.5 TB DB và 12.5 TB file ) |  |  |  |  |  |  |
|  | Hiệu suất lưu trữ File 0.67% |  |  |  |  |  |  |
|  | Có tái sử dụng một phần hệ thống giám sát của MOPLUS |  |  |  |  |  |  |
|  | Phục vụ 200 CCU,  500request/giây, 10Kb/request |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
| TT | Tên dịch vụ | Số lượng | Đơn vị | Ghi chú |  |  |  |
|  |  |  |  |  |  |  |  |
| I | Serer Cloud |  |  |  |  |  |  |
| 1.1000000000000001 | vCPU | 311 | vCPU |  |  |  |  |
| 1.2 | RAM | 964 | GB |  |  |  |  |
| 1.3 | Storage data | 43600 | GB |  |  |  |  |
| 1.4 | Pubic IP | 3 | IP |  |  |  |  |
| 1.5 | Băng thông |  |  |  |  |  |  |
| 1.6 | Số VM | 27 | node |  |  |  |  |
| II | Cloud Firewall |  |  |  |  |  |  |
| 2.1 | VCF02-Basic | 2 | License |  |  |  |  |
| IV | Cloud Backup |  |  |  |  |  |  |
| 4.0999999999999996 | Dung lượng backup | 31500 | GB |  |  |  |  |
| V | Hybrid Connect |  |  |  |  |  |  |
|  | Phí đấu nối | 2 | Gói |  |  |  |  |
| 5.0999999999999996 | vHC port 200Mbps | 2 | Port |  |  |  |  |
| 5.2 | Băng thông VPNL2 200Mbps | 2 | Gói |  |  |  |  |
| Danh sách máy chủ |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
| STT | Máy chủ | Zone | vCPU | RAM | SSD | Backup | Ghi chú |
| 1 | Proxy Server 1 | DMZ | 4 | 8 | 100 |  | HAProxy xử lý SSL termination và load balancing. Node 1 để HA, tách DMZ giảm rủi ro bảo mật. |
| 2 | Proxy Server 2 | DMZ | 4 | 8 | 100 |  | HAProxy node dự phòng, active/standby hoặc active/active, đảm bảo không single point of failure. |
|  |  |  |  |  |  |  |  |
| 3 | Master Node 1 | APP | 8 | 16 | 200 | 200 | Kubernetes control-plane. 3 master đảm bảo quorum etcd, chịu lỗi 1 node. |
| 4 | Master Node 2 | APP | 8 | 16 | 200 |  | Kubernetes control-plane, tách khỏi worker để tăng độ ổn định. |
| 5 | Master Node 3 | APP | 8 | 16 | 200 |  | Kubernetes control-plane, đảm bảo HA cho API Server, Scheduler. |
| 6 | Web Worker Node 1 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 3300 | 3300 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 7 | Web Worker Node 2 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 3300 | 3300 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 8 | Web Worker Node 3 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 3300 | 3300 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 9 | Web Worker Node 4 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 3300 | 3300 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 10 | Web Worker Node 5 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 3300 | 3300 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 11 | Web Worker Node 6 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 3300 | 3300 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
|  |  |  |  |  |  |  |  |
| 12 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | Xử lý ETL/batch job. Tách khỏi web để tránh ảnh hưởng hiệu năng realtime. |
| 13 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker HA, xử lý song song workload dữ liệu lớn. |
| 14 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker, đảm bảo mở rộng ngang cho pipeline dữ liệu. |
| 15 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | Xử lý ETL/batch job. Tách khỏi web để tránh ảnh hưởng hiệu năng realtime. |
| 16 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker HA, xử lý song song workload dữ liệu lớn. |
| 17 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker, đảm bảo mở rộng ngang cho pipeline dữ liệu. |
|  |  |  |  |  |  |  |  |
| 18 | Cache MQ Server 1 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Đặt trong APP zone để gần service. |
| 19 | Cache MQ Server 2 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Đảm bảo HA và leader election. |
| 20 | Cache MQ Server 3 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Chịu lỗi 1 node. |
|  |  |  |  |  |  |  |  |
| 21 | Log, Monitor, CICD | APP | 12 | 24 | 800 |  | Phục vụ triển khai, giám sát |
|  |  |  |  |  |  |  |  |
| 22 | OLAP Database Server 1 | DB | 8 | 32 | 3000 | 3000 | ClickHouse node phân tích OLAP. SSD lớn cho columnar storage. |
| 23 | OLAP Database Server 2 | DB | 8 | 32 | 3000 | 3000 | ClickHouse replica/shard. Đảm bảo HA và query song song. |
| 24 | OLAP Database Server 3 | DB | 8 | 32 | 3000 | 3000 | ClickHouse node, scale-out cho workload BI/report. |
|  |  |  |  |  |  |  |  |
| 25 | OLTP Database Server 1 | DB | 9 | 36 | 2500 | 2500 | MariaDB primary/cluster node. SSD đảm bảo IOPS cho OLTP. |
| 26 | OLTP Database Server 2 | DB | 9 | 36 | 2500 |  | MariaDB replica/cluster node. HA và read scaling. |
| 27 | OLTP Database Server 3 | DB | 9 | 36 | 2500 |  | MariaDB node thứ 3, đảm bảo quorum và failover. |
|  |  |  |  |  |  |  |  |
| Tổng |  |  | 311 | 964 | 43600 | 31500 |  |

## Sheet: Chi tiết máy chủ 10TB (69 dòng)

| Tổng thể |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|
| Sizing đảm bảo cho: |  |  |  |  |  |  |  |
|  | Dữ liệu hệ thống 10 TB ( 3 TB DB và  7 TB file ) |  |  |  |  |  |  |
|  | Hiệu suất lưu trữ File 0.67% |  |  |  |  |  |  |
|  | Có tái sử dụng một phần hệ thống giám sát của MOPLUS |  |  |  |  |  |  |
|  | Phục vụ 200 CCU,  500request/giây, 10Kb/request |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
| TT | Tên dịch vụ | Số lượng | Đơn vị | Ghi chú |  |  |  |
|  |  |  |  |  |  |  |  |
| I | Serer Cloud |  |  |  |  |  |  |
| 1.1000000000000001 | vCPU | 311 | vCPU |  |  |  |  |
| 1.2 | RAM | 964 | GB |  |  |  |  |
| 1.3 | Storage data | 27100 | GB |  |  |  |  |
| 1.4 | Pubic IP | 3 | IP |  |  |  |  |
| 1.5 | Băng thông |  |  |  |  |  |  |
| 1.6 | Số VM | 27 | node |  |  |  |  |
| II | Cloud Firewall |  |  |  |  |  |  |
| 2.1 | VCF02-Basic | 2 | License |  |  |  |  |
| IV | Cloud Backup |  |  |  |  |  |  |
| 4.0999999999999996 | Dung lượng backup | 17200 | GB |  |  |  |  |
| V | Hybrid Connect |  |  |  |  |  |  |
|  | Phí đấu nối | 2 | Gói |  |  |  |  |
| 5.0999999999999996 | vHC port 200Mbps | 2 | Port |  |  |  |  |
| 5.2 | Băng thông VPNL2 200Mbps | 2 | Gói |  |  |  |  |
| Danh sách máy chủ |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
| STT | Máy chủ | Zone | vCPU | RAM | SSD | Backup | Ghi chú |
| 1 | Proxy Server 1 | DMZ | 4 | 8 | 100 |  | HAProxy xử lý SSL termination và load balancing. Node 1 để HA, tách DMZ giảm rủi ro bảo mật. |
| 2 | Proxy Server 2 | DMZ | 4 | 8 | 100 |  | HAProxy node dự phòng, active/standby hoặc active/active, đảm bảo không single point of failure. |
|  |  |  |  |  |  |  |  |
| 3 | Master Node 1 | APP | 8 | 16 | 200 | 200 | Kubernetes control-plane. 3 master đảm bảo quorum etcd, chịu lỗi 1 node. |
| 4 | Master Node 2 | APP | 8 | 16 | 200 |  | Kubernetes control-plane, tách khỏi worker để tăng độ ổn định. |
| 5 | Master Node 3 | APP | 8 | 16 | 200 |  | Kubernetes control-plane, đảm bảo HA cho API Server, Scheduler. |
| 6 | Web Worker Node 1 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 1800 | 1800 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 7 | Web Worker Node 2 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 1800 | 1800 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 8 | Web Worker Node 3 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 1800 | 1800 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 9 | Web Worker Node 4 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 1800 | 1800 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 10 | Web Worker Node 5 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 1800 | 1800 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 11 | Web Worker Node 6 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 1800 | 1800 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
|  |  |  |  |  |  |  |  |
| 12 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | Xử lý ETL/batch job. Tách khỏi web để tránh ảnh hưởng hiệu năng realtime. |
| 13 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker HA, xử lý song song workload dữ liệu lớn. |
| 14 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker, đảm bảo mở rộng ngang cho pipeline dữ liệu. |
| 15 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | Xử lý ETL/batch job. Tách khỏi web để tránh ảnh hưởng hiệu năng realtime. |
| 16 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker HA, xử lý song song workload dữ liệu lớn. |
| 17 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker, đảm bảo mở rộng ngang cho pipeline dữ liệu. |
|  |  |  |  |  |  |  |  |
| 18 | Cache MQ Server 1 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Đặt trong APP zone để gần service. |
| 19 | Cache MQ Server 2 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Đảm bảo HA và leader election. |
| 20 | Cache MQ Server 3 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Chịu lỗi 1 node. |
|  |  |  |  |  |  |  |  |
| 21 | Log, Monitor, CICD | APP | 12 | 24 | 800 |  | Phục vụ triển khai, giám sát |
|  |  |  |  |  |  |  |  |
| 22 | OLAP Database Server 1 | DB | 8 | 32 | 1600 | 1600 | ClickHouse node phân tích OLAP. SSD lớn cho columnar storage. |
| 23 | OLAP Database Server 2 | DB | 8 | 32 | 1600 | 1600 | ClickHouse replica/shard. Đảm bảo HA và query song song. |
| 24 | OLAP Database Server 3 | DB | 8 | 32 | 1600 | 1600 | ClickHouse node, scale-out cho workload BI/report. |
|  |  |  |  |  |  |  |  |
| 25 | OLTP Database Server 1 | DB | 9 | 36 | 1400 | 1400 | MariaDB primary/cluster node. SSD đảm bảo IOPS cho OLTP. |
| 26 | OLTP Database Server 2 | DB | 9 | 36 | 1400 |  | MariaDB replica/cluster node. HA và read scaling. |
| 27 | OLTP Database Server 3 | DB | 9 | 36 | 1400 |  | MariaDB node thứ 3, đảm bảo quorum và failover. |
|  |  |  |  |  |  |  |  |
| Tổng |  |  | 311 | 964 | 27100 | 17200 |  |

## Sheet: Chi tiết máy chủ 5TB (69 dòng)

| Tổng thể |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|
| Sizing đảm bảo cho: |  |  |  |  |  |  |  |
|  | Dữ liệu hệ thống 5TB ( 1.5 TB DB và  3.5 TB file ) |  |  |  |  |  |  |
|  | Hiệu suất lưu trữ File 0.67% |  |  |  |  |  |  |
|  | Có tái sử dụng một phần hệ thống giám sát của MOPLUS |  |  |  |  |  |  |
|  | Phục vụ 200 CCU,  500request/giây, 10Kb/request |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
| TT | Tên dịch vụ | Số lượng | Đơn vị | Ghi chú |  |  |  |
|  |  |  |  |  |  |  |  |
| I | Serer Cloud |  |  |  |  |  |  |
| 1.1000000000000001 | vCPU | 263 | vCPU |  |  |  |  |
| 1.2 | RAM | 772 | GB |  |  |  |  |
| 1.3 | Storage data | 16000 | GB |  |  |  |  |
| 1.4 | Pubic IP | 3 | IP |  |  |  |  |
| 1.5 | Băng thông |  |  |  |  |  |  |
| 1.6 | Số VM | 27 | node |  |  |  |  |
| II | Cloud Firewall |  |  |  |  |  |  |
| 2.1 | VCF02-Basic | 2 | License |  |  |  |  |
| IV | Cloud Backup |  |  |  |  |  |  |
| 4.0999999999999996 | Dung lượng backup | 8700 | GB |  |  |  |  |
| V | Hybrid Connect |  |  |  |  |  |  |
|  | Phí đấu nối | 2 | Gói |  |  |  |  |
| 5.0999999999999996 | vHC port 200Mbps | 2 | Port |  |  |  |  |
| 5.2 | Băng thông VPNL2 200Mbps | 2 | Gói |  |  |  |  |
| Danh sách máy chủ |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
| STT | Máy chủ | Zone | vCPU | RAM | SSD | Backup | Ghi chú |
| 1 | Proxy Server 1 | DMZ | 4 | 8 | 100 |  | HAProxy xử lý SSL termination và load balancing. Node 1 để HA, tách DMZ giảm rủi ro bảo mật. |
| 2 | Proxy Server 2 | DMZ | 4 | 8 | 100 |  | HAProxy node dự phòng, active/standby hoặc active/active, đảm bảo không single point of failure. |
|  |  |  |  |  |  |  |  |
| 3 | Master Node 1 | APP | 8 | 16 | 200 | 200 | Kubernetes control-plane. 3 master đảm bảo quorum etcd, chịu lỗi 1 node. |
| 4 | Master Node 2 | APP | 8 | 16 | 200 |  | Kubernetes control-plane, tách khỏi worker để tăng độ ổn định. |
| 5 | Master Node 3 | APP | 8 | 16 | 200 |  | Kubernetes control-plane, đảm bảo HA cho API Server, Scheduler. |
| 6 | Web Worker Node 1 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 900 | 900 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 7 | Web Worker Node 2 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 900 | 900 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 8 | Web Worker Node 3 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 900 | 900 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 9 | Web Worker Node 4 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 900 | 900 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 10 | Web Worker Node 5 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 900 | 900 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
| 11 | Web Worker Node 6 | APP | 14 | 36 | 300 |  | Chạy workload web/app |
|  |  |  |  |  | 900 | 900 | Lưu file phân tán. Đảm bảo chịu lỗi 2 node |
|  |  |  |  |  |  |  |  |
| 12 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | Xử lý ETL/batch job. Tách khỏi web để tránh ảnh hưởng hiệu năng realtime. |
| 13 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker HA, xử lý song song workload dữ liệu lớn. |
| 14 | ETL Worker Node 1 | APP | 16 | 64 | 400 |  | ETL worker, đảm bảo mở rộng ngang cho pipeline dữ liệu. |
| 15 | ETL Worker Node 1 | APP |  |  |  |  | Xử lý ETL/batch job. Tách khỏi web để tránh ảnh hưởng hiệu năng realtime. |
| 16 | ETL Worker Node 1 | APP |  |  |  |  | ETL worker HA, xử lý song song workload dữ liệu lớn. |
| 17 | ETL Worker Node 1 | APP |  |  |  |  | ETL worker, đảm bảo mở rộng ngang cho pipeline dữ liệu. |
|  |  |  |  |  |  |  |  |
| 18 | Cache MQ Server 1 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Đặt trong APP zone để gần service. |
| 19 | Cache MQ Server 2 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Đảm bảo HA và leader election. |
| 20 | Cache MQ Server 3 | APP | 12 | 24 | 500 |  | Redis Sentinel + Kafka broker. Chịu lỗi 1 node. |
|  |  |  |  |  |  |  |  |
| 21 | Log, Monitor, CICD | APP | 12 | 24 | 800 |  | Phục vụ triển khai, giám sát |
|  |  |  |  |  |  |  |  |
| 22 | OLAP Database Server 1 | DB | 8 | 32 | 800 | 800 | ClickHouse node phân tích OLAP. SSD lớn cho columnar storage. |
| 23 | OLAP Database Server 2 | DB | 8 | 32 | 800 | 800 | ClickHouse replica/shard. Đảm bảo HA và query song song. |
| 24 | OLAP Database Server 3 | DB | 8 | 32 | 800 | 800 | ClickHouse node, scale-out cho workload BI/report. |
|  |  |  |  |  |  |  |  |
| 25 | OLTP Database Server 1 | DB | 9 | 36 | 700 | 700 | MariaDB primary/cluster node. SSD đảm bảo IOPS cho OLTP. |
| 26 | OLTP Database Server 2 | DB | 9 | 36 | 700 |  | MariaDB replica/cluster node. HA và read scaling. |
| 27 | OLTP Database Server 3 | DB | 9 | 36 | 700 |  | MariaDB node thứ 3, đảm bảo quorum và failover. |
|  |  |  |  |  |  |  |  |
| Tổng |  |  | 263 | 772 | 16000 | 8700 |  |

## Sheet: Băng thông (11 dòng)

| Thông số |  |  |  | Value |  | Đơn vị | Note |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|
| User upload tài liệu bay |  |  |  | 100 |  | bộ/h | 10% chuyến bay trên tổng 500 chuyến/ngày tại khung giờ cao điểm. Mỗi chuyến bay cần cập nhật 2 bộ tài liệu. Tính toán chính do nhu cầu dữ liệu là lớn nhất |  |  |  |
| User dùng khác trên FIMS |  |  |  | 0.2 |  |  | 20% nhu cầu dữ liệu so với upload tài liệu |  |  |  |
| Tích hợp đến các hệ thống khác |  |  |  | 1.5 |  |  | MOPLUS lấy tài liệu bay 100% upload, các hệ thống khác 50% dữ liệu so với upload tài liệu bay |  |  |  |
| Kích thước tài liệu bay |  |  |  | 30 |  | MB |  |  |  |  |
| Tổng dung lượng data trong 1h |  |  |  | 8100 |  | MB |  |  |  |  |
| Tổng dung lượng data trong 1 phút |  |  |  | 135 |  | MB |  |  |  |  |
| Thời gian truyền dữ liệu |  |  |  | 7 |  | s |  |  |  |  |
| Dự phòng |  |  |  | 0.2 |  |  |  |  |  |  |
| Băng thông(MB/s) |  |  |  | 23.142857142857142 |  | MB/s |  |  |  |  |
| Băng thông(Mbps) |  |  |  | 185.14285714285714 |  | Mbps |  |  |  |  |

## Sheet: Chi tiết máy chủ 4TB (60 dòng)

| Tổng thể |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|
| Sizing đảm bảo cho: |  |  |  |  |  |  |  |
|  | Dữ liệu hệ thống 4TB ( 1 TB DB và  3 TB file ) |  |  |  |  |  | 2TB |
|  | Hiệu suất lưu trữ File 0.67% |  |  |  |  |  | 600DB |
|  | Có tái sử dụng một phần hệ thống giám sát của MOPLUS |  |  |  |  |  | 1500 file |
|  | Phục vụ 200 CCU,  500request/giây, 10Kb/request |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
| TT | Tên dịch vụ | Số lượng | Đơn vị | Ghi chú |  |  |  |
|  |  |  |  |  |  |  |  |
| I | Serer Cloud |  |  |  |  |  |  |
| 1.1000000000000001 | vCPU | 263 | vCPU |  |  |  |  |
| 1.2 | RAM | 772 | GB |  |  |  |  |
| 1.3 | Storage data | 10750 | GB |  |  |  |  |
| 1.4 | Pubic IP | 3 | IP |  |  |  |  |
| 1.5 | Băng thông |  |  |  |  |  |  |
| 1.6 | Số VM | 21 | node |  |  |  |  |
| II | Cloud Firewall |  |  |  |  |  |  |
| 2.1 | VCF02-Basic | 2 | License |  |  |  |  |
| IV | Cloud Backup |  |  |  |  |  |  |
| 4.0999999999999996 | Dung lượng backup | 6900 | GB |  |  |  |  |
| V | Hybrid Connect |  |  |  |  |  |  |
|  | Phí đấu nối | 2 | Gói |  |  |  |  |
| 5.0999999999999996 | vHC port 200Mbps | 2 | Port |  |  |  |  |
| 5.2 | Băng thông VPNL2 200Mbps | 2 | Gói |  |  |  |  |
| Danh sách máy chủ |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
| STT | Máy chủ | Zone | vCPU | RAM | SSD | Backup | Ghi chú (phân chia phân vùng ổ cứng) |
| 1 | Proxy Server 1 | DMZ | 4 | 8 | 100 |  | /OS : 100GB |
| 2 | Proxy Server 2 | DMZ | 4 | 8 | 100 |  | /OS : 100GB |
|  |  |  |  |  |  |  |  |
| 3 | Master Node 1 | APP | 8 | 16 | 100 | 100 | Chi 2 phân vùng disk server: /OS:100GB /data_backup: 100GB phục vụ backup config K8s, etcd.. |
| 4 | Master Node 2 | APP | 8 | 16 | 100 |  | /OS : 100GB |
| 5 | Master Node 3 | APP | 8 | 16 | 100 |  | /OS : 100GB |
| 6 | Web Worker Node 1 | APP | 28 | 72 | 150 |  | Chia 3 phân vùng disk server: /OS : 150G /data: 1600 GB /data_bk: 1600 GB |
|  |  |  |  |  | 1600 | 1600 |  |
| 7 | Web Worker Node 2 | APP | 28 | 72 | 150 |  | Chia 3 phân vùng disk server: /OS : 150G /data: 1600 GB /data_bk: 1600 GB |
|  |  |  |  |  | 1600 | 1600 |  |
| 8 | Web Worker Node 3 | APP | 28 | 72 | 150 |  | Chia 3 phân vùng disk server: /OS : 150G /data: 1600 GB /data_bk: 1600 GB |
|  |  |  |  |  | 1600 | 1600 |  |
|  |  |  |  |  |  |  |  |
| 9 | ETL Worker Node 1 | APP | 16 | 64 | 300 |  | Phân vùng disk server: /OS : 300G |
| 10 | ETL Worker Node 1 | APP | 16 | 64 | 300 |  | Phân vùng disk server: /OS : 300G |
| 11 | ETL Worker Node 1 | APP | 16 | 64 | 300 |  | Phân vùng disk server: /OS : 300G |
|  |  |  |  |  |  |  |  |
| 12 | Cache MQ Server 1 | APP | 12 | 24 | 200 |  | Phân vùng disk server: /OS : 200G |
| 13 | Cache MQ Server 2 | APP | 12 | 24 | 200 |  | Phân vùng disk server: /OS : 200G |
| 14 | Cache MQ Server 3 | APP | 12 | 24 | 200 |  | Phân vùng disk server: /OS : 200G |
|  |  |  |  |  |  |  |  |
| 15 | Log, Monitor, CICD | APP | 12 | 24 | 500 |  | Phân vùng disk server: /OS : 80G /data: 420GB |
|  |  |  |  |  |  |  |  |
| 16 | OLAP Database Server 1 | DB | 8 | 32 | 500 | 500 | Chia 3 phân vùng disk server: /OS : 100GB /data: 400 GB /data_bk: 500 GB |
| 17 | OLAP Database Server 2 | DB | 8 | 32 | 500 | 500 | Chia 3 phân vùng disk server: /OS : 100GB /data: 400 GB /data_bk: 500 GB |
| 18 | OLAP Database Server 3 | DB | 8 | 32 | 500 | 500 | Chia 3 phân vùng disk server: /OS : 100GB /data: 400 GB /data_bk: 500 GB |
|  |  |  |  |  |  |  |  |
| 19 | OLTP Database Server 1 | DB | 9 | 36 | 500 | 500 | Chia 3 phân vùng disk server: /OS : 100GB /data: 400 GB /data_bk: 500 GB |
| 20 | OLTP Database Server 2 | DB | 9 | 36 | 500 |  | Chia 2 phân vùng disk server: /OS : 100GB /data: 400 GB |
| 21 | OLTP Database Server 3 | DB | 9 | 36 | 500 |  | Chia 2 phân vùng disk server: /OS : 100GB /data: 400 GB |
|  |  |  |  |  |  |  |  |
| Tổng |  |  | 263 | 772 | 10750 | 6900 |  |