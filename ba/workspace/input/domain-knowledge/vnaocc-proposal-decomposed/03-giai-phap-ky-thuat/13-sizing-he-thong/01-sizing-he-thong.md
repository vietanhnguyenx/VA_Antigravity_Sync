---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "sonpx@viettel.com.vn"
version: "0.2"
date: "2026-06-04"
status: "Draft"
document_type: "Source Decomposition"
source_document: "VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf"
source_section: "III.13 Định cỡ hệ thống (Sizing)"
source_pages: "80-81"
---

# III.13 Định cỡ hệ thống (Sizing)

## Nguồn (Source)
- Tài liệu: `ba/workspace/input/VNAOCC_TOSS_Đề xuất giải pháp kỹ thuật_v0.3.pdf`
- Mục: III.13 Định cỡ hệ thống (Sizing)
- Trang: 80–81

## Nội dung trích nguyên văn (Verbatim Extract)

Theo hồ sơ yêu cầu của VNA, Sizing cần đảm bảo cho:
- ● Dữ liệu hệ thống 5TB (1.5 TB DB và 3.5 TB file)
- ● Hiệu suất lưu trữ File 0.67%
- ● Có tái sử dụng một phần hệ thống giám sát của MOPLUS
- ● Phục vụ 200 CCU, 500 request/giây, 10Kb/request

Chi tiết sizing đáp ứng theo kiến trúc mà Viettel đề xuất, đáp ứng các yêu cầu đảm bảo trên và yêu cầu trong hồ sơ của VNA.

| TT | Tên dịch vụ | Số lượng | Đơn vị | Ghi chú |
|---|---|---|---|---|
| **I** | **Server Cloud** | | | |
| 1.1 | vCPU | 311 | vCPU | |
| 1.2 | RAM | 964 | GB | |
| 1.3 | Storage data | 17200 | GB | |
| 1.4 | Pubic IP | 3 | IP | |
| 1.5 | Băng thông | | | |
| 1.6 | Số VM | 27 | node | |
| **II** | **Cloud Firewall** | | | |
| 2.1 | VCF02-Basic | 2 | License | |
| **III** | **Cloud Backup** | | | |
| 3.1 | Dung lượng backup | 8700 | GB | |
| **IV** | **Hybrid Connect** | | | |
| 4.1 | Phí đấu nối | 2 | Gói | |
| 4.2 | vHC port 200Mbps | 2 | Port | |
| 4.3 | Băng thông VPNL2 200Mbps | 2 | Gói | |

Giải pháp kỹ thuật theo tài liệu đề xuất này đảm bảo đáp ứng tất cả các yêu cầu về kỹ thuật trong Hồ sơ yêu cầu Hệ thống Tối ưu Điều hành khai thác của Tổng Công ty Hàng không Việt Nam.

## Câu hỏi / Nội dung cần làm rõ (Open Questions)
- Mục 1.5 "Băng thông" trong bảng sizing không có giá trị số trong tài liệu nguồn — giữ nguyên (trống).
