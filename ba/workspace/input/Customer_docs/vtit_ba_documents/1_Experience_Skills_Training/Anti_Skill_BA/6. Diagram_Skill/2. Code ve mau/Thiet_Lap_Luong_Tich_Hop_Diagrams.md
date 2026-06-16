# Tổng hợp các Diagram cho Hệ thống Trục tích hợp dữ liệu (TTHDL)
Dựa theo yêu cầu và các quy chuẩn vẽ Mermaid (Diagram_Skill.md), dưới đây là các sơ đồ được xây dựng cho hệ thống và đặc biệt là module **Thiết lập luồng tích hợp**.

## 1. Ma trận quan hệ chức năng - nghiệp vụ cho hệ thống Trục tích hợp dữ liệu

```mermaid
---
config:
  layout: elk
  theme: base
  themeVariables:
    primaryColor: '#eef2ff'
    primaryBorderColor: '#818cf8'
    lineColor: '#818cf8'
    background: '#ffffff'
    mainBkg: '#eef2ff'
    secondBkg: '#f0fdfa'
    tertiaryBkg: '#fff7ed'
---
flowchart TD

    A[Hệ thống tổng thể<br/>Chuyển đổi số UBCKNN]

    A --> B[15 phân hệ nghiệp vụ]
    A --> C[Phân hệ SSO<br/>Quản lý người dùng]
    A --> D[Danh mục điện tử dùng chung]
    A --> E[App Mobile]
    A --> F[TTHDL<br/>Trục Tích hợp Dữ liệu]

    F --> F1[Cổng tích hợp dữ liệu]
    F --> F2[Quản trị & Giám sát Trục]

    F1 --> G1[Luồng nhận về]
    F1 --> G2[Luồng gửi đi]

    H[Hệ thống bên ngoài] -.-> G1
    G1 -.-> B

    B -.-> G2
    G2 -.-> H

    F1 --> I1[Xác thực / phân quyền<br/>Keycloak, OAuth2/OIDC]
    F1 --> I2[Quản lý API<br/>WSO2 APIM]
    F1 --> I3[Rate Limit / Routing]
    F1 --> I4[Mã hóa dữ liệu]
    F1 --> I5[Log tiến trình tích hợp]

    F2 --> M1[Quản lý danh sách dịch vụ<br/>theo Application]
    F2 --> M2[Quản lý tài khoản xác thực<br/>theo Application]
    F2 --> M3[Thiết lập khóa mã hóa<br/>theo Application]
    F2 --> M4[Thiết lập luồng tích hợp<br/>theo Application]
    F2 --> M5[Cấu hình ngưỡng cảnh báo]
    F2 --> M6[Cấu hình mail nhận cảnh báo]
    F2 --> M7[Báo cáo]
    F2 --> M8[Nhật ký hệ thống]

    M1 --> M1A[Xem / Lọc danh sách API]
    M1 --> M1B[Thêm mới / Sửa / Vô hiệu hóa API]
    M1 --> M1C[Cấu hình Rate Limit]

    M2 --> M2A[Xem / Lọc tài khoản]
    M2 --> M2B[Thêm mới / Sửa / Vô hiệu hóa tài khoản]

    M3 --> M3A[Xem / Lọc khóa mã hóa]
    M3 --> M3B[Thêm mới / Sửa / Vô hiệu hóa khóa]
    M3 --> M3C[Sao chép khóa mã hóa]

    M4 --> M4A[Xem / Lọc luồng tích hợp]
    M4 --> M4B[Thêm mới / Sửa / Vô hiệu hóa luồng]

    M5 --> M5A[Ngưỡng thời gian phản hồi]
    M5 --> M5B[Ngưỡng tỉ lệ lỗi kết nối]
    M5 --> M5C[Ngưỡng lưu lượng]

    M6 --> M6A[Xem / Lọc email]
    M6 --> M6B[Thêm mới / Sửa / Xóa cấu hình email]

    M7 --> M7A[Dashboard tổng quan]
    M7 --> M7B[Báo cáo giám sát luồng dữ liệu]
    M7 --> M7C[Báo cáo cảnh báo qua Email]

    M8 --> M8A[Quản lý lịch sử thao tác]
    M8 --> M8B[Quản lý lịch sử tiến trình tích hợp]

    I5 -.-> M8B
    I5 -.-> M7B
    M5 -.-> M7C
    M5 -.-> M6
    M6 -.-> M7C
    M1 -.-> M4
    M2 -.-> M4
    M3 -.-> M4
    M4 -.-> F1

    classDef coreNode fill:#eef2ff,stroke:#818cf8,color:#1e1b4b,stroke-width:2px
    classDef subsysNode fill:#f0fdfa,stroke:#2dd4bf,color:#1e1b4b,stroke-width:2px
    classDef gatewayNode fill:#fff7ed,stroke:#fb923c,color:#1e1b4b,stroke-width:2px
    classDef featureNode fill:#fdf4ff,stroke:#e879f9,color:#1e1b4b,stroke-width:2px
    classDef detailNode fill:#f0f9ff,stroke:#38bdf8,color:#1e1b4b,stroke-width:1.5px

    class A coreNode
    class B,C,D,E,H subsysNode
    class F,F1,F2 gatewayNode
    class G1,G2,I1,I2,I3,I4,I5 featureNode
    class M1,M2,M3,M4,M5,M6,M7,M8 featureNode
    class M1A,M1B,M1C,M2A,M2B,M3A,M3B,M3C,M4A,M4B,M5A,M5B,M5C,M6A,M6B,M7A,M7B,M7C,M8A,M8B detailNode
```

## 2. Luồng nghiệp vụ đầy đủ cho module "Thiết lập luồng tích hợp"

```mermaid
---
config:
  layout: elk
  theme: base
  themeVariables:
    primaryColor: '#eef2ff'
    primaryBorderColor: '#818cf8'
    lineColor: '#818cf8'
    background: '#ffffff'
---
flowchart TB
    
    %% == Khởi tạo và kiểm tra quyền ==
    A([Bắt đầu]) --> B[Quản trị viên truy cập module<br/>Thiết lập luồng tích hợp]
    B --> C[Kiểm tra phiên đăng nhập và quyền từ SSO/Keycloak]
    C --> D{"Kiểm tra quyền truy cập module<br/>(Có quyền truy cập?)"}
    D -- Không --> E[Hiển thị thông báo<br/>không có quyền truy cập]
    D -- Có --> F[Hiển thị danh sách luồng tích hợp<br/>theo Application]
    E --> Z([Kết thúc])
    
    %% == Danh sách và thao tác ==
    F --> G[Người dùng lọc / tìm kiếm danh sách]
    G --> H{"Người dùng chọn thao tác<br/>(Xem / Thêm / Sửa / Vô hiệu hóa / Thoát)"}

    %% == Xem chi tiết ==
    H -- Xem chi tiết --> I[Xem chi tiết luồng tích hợp]
    I --> I1[Hiển thị thông tin luồng tích hợp<br/>Application, API dịch vụ, Khóa mã hóa,<br/>Tài khoản xác thực, Trạng thái]
    I1 --> O1([Trở về danh sách])
    O1 --> F

    %% == Thêm mới ==
    H -- Thêm mới --> J[Nhập thông tin luồng tích hợp mới]
    J --> J1[Chọn Application, API dịch vụ, Tài khoản,<br/>Khóa mã hóa và cấu hình luồng, trạng thái]
    J1 --> J2{"Kiểm tra dữ liệu hợp lệ?"}
    J2 -- Không --> J3[Thông báo lỗi<br/>yêu cầu nhập lại]
    J2 -- Có --> J4{"Kiểm tra trùng lặp<br/>hoặc xung đột luồng?"}
    J4 -- Có --> J3
    J4 -- Không --> J5[Lưu luồng tích hợp mới]
    J5 --> S1

    %% == Sửa ==
    H -- Sửa --> K[Chọn luồng tích hợp cần sửa]
    K --> K1{"Luồng có đang chạy<br/>hoặc bị ràng buộc?"}
    K1 -- Có --> K2[Thông báo không thể sửa<br/>do đang có ràng buộc / đang chạy]
    K2 --> F
    K1 -- Không --> K3[Cập nhật thông tin cấu hình luồng]
    K3 --> K4{"Kiểm tra dữ liệu hợp lệ?"}
    K4 -- Không --> K5[Thông báo lỗi<br/>yêu cầu nhập lại]
    K5 --> K3
    K4 -- Có --> K6[Lưu thông tin cập nhật]
    K6 --> S1

    %% == Vô hiệu hóa ==
    H -- Vô hiệu hóa --> L[Chọn luồng tích hợp cần vô hiệu hóa]
    L --> L1{"Luồng có đang xử lý giao dịch<br/>(đang chạy) không?"}
    L1 -- Có --> L2[Thông báo: không thể vô hiệu hóa<br/>khi giao dịch đang chạy]
    L2 --> F
    L1 -- Không --> L3[Xác nhận vô hiệu hóa]
    L3 --> L4[Cập nhật trạng thái = Vô hiệu hóa]
    L4 --> S1

    %% == Xử lý lưu và kết thúc ==
    S1["Thực hiện xử lý sau khi lưu thành công<br/>(Ghi lịch sử thao tác, làm mới danh sách, trở lại màn hình chính)"]
    S1 --> N[Đồng bộ cấu hình luồng xuống Cổng tích hợp]
    N --> O[Ghi lịch sử thao tác]
    O --> P[Làm mới danh sách]
    P --> F
    H -- Thoát --> Z

    %% == Kiểu định dạng ==
    classDef step fill:#eef2ff,stroke:#818cf8,stroke-width:2px;
    classDef decision fill:#fefce8,stroke:#facc15,stroke-width:2px;
    classDef action fill:#f0fdfa,stroke:#2dd4bf,stroke-width:2px;
    classDef endNode fill:#fff1f2,stroke:#fb7185,stroke-width:2px;

    class A,E,Z endNode
    class B,C,F,G,H,I,I1,J,J1,J3,J5,K,K2,K3,K5,K6,L,L2,L3,L4,S1,N,O,O1,P action
    class D,J2,J4,K1,K4,L1 decision
```

## 3. Luồng nghiệp vụ đơn giản cho module "Thiết lập luồng tích hợp"

```mermaid
---
config:
  layout: elk
  theme: base
  themeVariables:
    primaryColor: '#eef2ff'
    primaryBorderColor: '#818cf8'
    lineColor: '#818cf8'
    background: '#ffffff'
---
flowchart TB

    A([Bắt đầu]) --> B[Đăng nhập hệ thống qua SSO/Keycloak]
    B --> C{"Có quyền truy cập module<br/>Thiết lập luồng tích hợp?"}
    C -- Không --> Z([Kết thúc<br/>Thông báo 'Không có quyền'])
    C -- Có --> D[Hiển thị danh sách luồng tích hợp]

    D --> E{"Người dùng chọn thao tác?"}

    %% Nhánh Xem chi tiết
    E -- Xem chi tiết --> F[Xem thông tin chi tiết luồng] --> D

    %% Nhánh Thêm mới / Sửa / Vô hiệu hóa
    E -- Thêm mới / Sửa / Vô hiệu hóa --> G["Nhập thông tin / cấu hình luồng"]
    G --> H{"Dữ liệu hợp lệ?"}
    H -- Không --> I[Hiển thị thông báo lỗi<br/>Yêu cầu nhập lại] --> G
    H -- Có --> J[Lưu dữ liệu / cập nhật trạng thái luồng]
    J --> K["Đồng bộ cổng, Ghi lịch sử thao tác & làm mới danh sách"] --> D

    %% Thoát
    E -- Thoát --> Z

    %% Style
    classDef step fill:#eef2ff,stroke:#818cf8,stroke-width:2px;
    classDef decision fill:#fefce8,stroke:#facc15,stroke-width:2px;
    classDef action fill:#f0fdfa,stroke:#2dd4bf,stroke-width:2px;
    classDef endNode fill:#fff1f2,stroke:#fb7185,stroke-width:2px;

    class A,Z endNode
    class B,D,E,F,G,H,I,J,K action
    class C,H decision
```

## 4. Use Case Diagram của module chức năng "Thiết lập luồng tích hợp"

```mermaid
---
config:
  layout: elk
  theme: base
  themeVariables:
    primaryColor: '#eef2ff'
    primaryBorderColor: '#818cf8'
    lineColor: '#818cf8'
    background: '#ffffff'
---
flowchart LR
    Admin[Quản trị viên / Nhân viên vận hành]

    subgraph FLOW[Module Thiết lập luồng tích hợp]
        UC1[UC-FLOW-01<br/>Xem danh sách luồng tích hợp]
        UC2[UC-FLOW-02<br/>Lọc / tìm kiếm luồng tích hợp]
        UC3[UC-FLOW-03<br/>Xem chi tiết luồng]
        UC4[UC-FLOW-04<br/>Thêm mới luồng tích hợp]
        UC5[UC-FLOW-05<br/>Sửa luồng tích hợp]
        UC6[UC-FLOW-06<br/>Vô hiệu hóa luồng tích hợp]
        UC7[UC-FLOW-07<br/>Ghi lịch sử thao tác]
    end

    subgraph SYS[Hệ thống liên quan]
        SSO[SSO / Keycloak]
        DB[(CSDL TTHDL)]
        APIM[WSO2 APIM / Cổng tích hợp]
    end

    Admin --> UC1
    Admin --> UC2
    Admin --> UC3
    Admin --> UC4
    Admin --> UC5
    Admin --> UC6

    UC1 --> SSO
    UC4 --> DB
    UC5 --> DB
    UC6 --> DB
    UC3 --> DB

    UC4 --> APIM
    UC5 --> APIM
    UC6 --> APIM

    UC4 --> UC7
    UC5 --> UC7
    UC6 --> UC7

    UC7 --> DB

    classDef actor fill:#f8fafc,stroke:#475569,stroke-width:2px;
    classDef usecase fill:#eef2ff,stroke:#4f46e5,stroke-width:1.5px;
    classDef system fill:#ecfdf5,stroke:#059669,stroke-width:1.5px;
    classDef db fill:#fefce8,stroke:#ca8a04,stroke-width:1.5px;

    class Admin actor
    class UC1,UC2,UC3,UC4,UC5,UC6,UC7 usecase
    class SSO,APIM system
    class DB db
```

## 5. Sequence Diagram theo từng function của module "Thiết lập luồng tích hợp"

### 5.1. Thêm mới luồng tích hợp
```mermaid
sequenceDiagram
    autonumber
    actor Admin as Quản trị viên
    participant UI as Admin UI
    participant SSO as SSO/Keycloak
    participant API as Backend TTHDL
    participant DB as CSDL TTHDL
    participant APIM as WSO2 APIM / Cổng tích hợp
    participant LOG as Nhật ký hệ thống

    Admin->>UI: Truy cập module Thiết lập luồng tích hợp
    UI->>SSO: Kiểm tra phiên đăng nhập / quyền truy cập
    SSO-->>UI: Hợp lệ

    Admin->>UI: Chọn Thêm mới luồng tích hợp
    UI-->>Admin: Hiển thị form nhập thông tin

    Admin->>UI: Nhập thông tin luồng tích hợp
    UI->>API: Gửi yêu cầu thêm mới luồng

    API->>API: Validate dữ liệu cấu hình luồng
    API->>DB: Kiểm tra trùng lặp luồng / xung đột
    DB-->>API: Không trùng

    API->>DB: Lưu cấu hình luồng tích hợp mới
    DB-->>API: Lưu thành công
    
    API->>APIM: Gọi API đẩy cấu hình luồng xuống Cổng tích hợp
    APIM-->>API: Phản hồi đồng bộ thành công

    API->>LOG: Ghi lịch sử thao tác
    LOG-->>API: Thành công

    API-->>UI: Trả kết quả thành công
    UI-->>Admin: Thông báo thành công, làm mới danh sách
```

### 5.2. Sửa luồng tích hợp
```mermaid
sequenceDiagram
    autonumber
    actor Admin as Quản trị viên
    participant UI as Admin UI
    participant API as Backend TTHDL
    participant DB as CSDL TTHDL
    participant APIM as WSO2 APIM / Cổng tích hợp
    participant LOG as Nhật ký hệ thống

    Admin->>UI: Chọn luồng tích hợp cần sửa
    UI->>API: Lấy thông tin chi tiết luồng
    API->>DB: Truy vấn thông tin luồng tích hợp
    DB-->>API: Trả thông tin
    API-->>UI: Hiển thị thông tin chi tiết luồng trên form

    Admin->>UI: Cập nhật thông tin cấu hình luồng
    UI->>API: Gửi yêu cầu cập nhật

    API->>APIM: Kiểm tra luồng có đang xử lý giao dịch không?
    APIM-->>API: Phản hồi trạng thái (Không chạy)

    alt Đang chạy / Bị ràng buộc
        API-->>UI: Từ chối cập nhật
        UI-->>Admin: Hiển thị lý do không thể sửa
    else Được phép sửa
        API->>API: Validate dữ liệu cập nhật
        API->>DB: Lưu thông tin cập nhật
        DB-->>API: Cập nhật thành công
        
        API->>APIM: Đồng bộ thông tin luồng cập nhật
        APIM-->>API: Đồng bộ thành công

        API->>LOG: Ghi lịch sử thao tác
        API-->>UI: Trả kết quả thành công
        UI-->>Admin: Thông báo thành công, làm mới danh sách
    end
```

### 5.3. Vô hiệu hóa luồng tích hợp
```mermaid
sequenceDiagram
    autonumber
    actor Admin as Quản trị viên
    participant UI as Admin UI
    participant API as Backend TTHDL
    participant DB as CSDL TTHDL
    participant APIM as WSO2 APIM / Cổng tích hợp
    participant LOG as Nhật ký hệ thống

    Admin->>UI: Chọn Vô hiệu hóa luồng tích hợp
    UI->>API: Gửi yêu cầu kiểm tra vô hiệu hóa
    
    API->>APIM: Kiểm tra luồng có đang xử lý giao dịch?
    APIM-->>API: Kết quả (Đang rảnh / Đang chạy)

    alt Đang có giao dịch chạy
        API-->>UI: Không cho phép vô hiệu hóa
        UI-->>Admin: Hiển thị thông báo không thể vô hiệu hóa lúc này
    else Cho phép vô hiệu hóa
        API-->>UI: Cho phép hiển thị xác nhận
        UI-->>Admin: Hiển thị popup xác nhận
        Admin->>UI: Xác nhận vô hiệu hóa
        
        UI->>API: Gửi yêu cầu vô hiệu hóa
        API->>DB: Cập nhật trạng thái luồng = Vô hiệu hóa
        DB-->>API: Thành công
        
        API->>APIM: Đồng bộ trạng thái vô hiệu hóa luồng
        APIM-->>API: Vô hiệu hóa trên Cổng thành công
        
        API->>LOG: Ghi lịch sử thao tác
        API-->>UI: Trả kết quả thành công
        UI-->>Admin: Thông báo thành công, làm mới danh sách
    end
```
