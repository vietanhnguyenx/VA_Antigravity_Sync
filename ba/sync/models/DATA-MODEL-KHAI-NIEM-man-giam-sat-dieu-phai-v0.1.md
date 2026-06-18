---
project: "TOSS — Hệ thống Điều hành Khai thác Hãng Hàng không"
author: "BA Lead"
version: "0.1"
date: "2026-06-12"
status: "Draft"
document_type: "Conceptual Data Model — Cụm màn hình giám sát điều phái"
document_id: "DM-TOSS-DSP-MON"
---

# Mô hình dữ liệu khái niệm — Cụm màn hình giám sát điều phái

> **Phạm vi:** các thực thể dữ liệu phục vụ cụm màn hình giám sát của điều phái viên — BR-112 (dashboard tài liệu), BR-113 (2 màn giám sát), BR-114 (kiểm tra đầu ca), BR-125 (Monitoring overview). Đây là **mô hình KHÁI NIỆM** (conceptual) phục vụ co-evolution với wireframe (Workflow P4) — chỉ thực thể + trường khóa + quan hệ, CHƯA chuẩn hóa vật lý/kiểu dữ liệu.
>
> **Nguồn:** cột "Dữ liệu liên quan" của FUNC (PHAN-RA-BRD-PH1-…-v0.4) + FOS sheet-09 + Đề xuất §II.1. Trường/khái niệm chưa rõ gắn `[cần xác nhận]`.

## 1. Sơ đồ thực thể (ERD khái niệm)

```mermaid
erDiagram
    CHUYEN_BAY ||--o{ TAI_LIEU_CHUYEN : "có"
    CHUYEN_BAY ||--o{ PHAN_CONG_TO_BAY : "gồm"
    CHUYEN_BAY ||--|| TAI_TRONG : "có 1"
    CHUYEN_BAY ||--o{ CANH_BAO : "phát sinh"
    CHUYEN_BAY ||--o{ MOC_KHAI_THAC : "ghi nhận"
    TAU_BAY ||--o{ CHUYEN_BAY : "khai thác"
    TAU_BAY ||--o{ MEL_CDL : "có lỗi"
    SAN_BAY ||--o{ CHUYEN_BAY : "đi (DEP)"
    SAN_BAY ||--o{ CHUYEN_BAY : "đến (ARR)"
    SAN_BAY ||--o{ THOI_TIET : "có bản tin"
    SAN_BAY ||--o{ NOTAM : "có"
    TO_BAY ||--o{ PHAN_CONG_TO_BAY : "được phân"
    TO_BAY ||--o{ CHUNG_CHI_SAN_BAY : "có chứng chỉ"
    SAN_BAY ||--o{ CHUNG_CHI_SAN_BAY : "yêu cầu"
    NGUOI_DUNG ||--o{ CA_TRUC : "trực"
    CA_TRUC ||--o{ CHUYEN_BAY : "giám sát (phạm vi)"

    CHUYEN_BAY {
        string flight_no PK
        string carrier "VN/0V/BL"
        int leg_no
        string dep_iata FK
        string arr_iata FK
        string ac_reg FK
        datetime std
        datetime sta
        datetime etd
        datetime eta "ELDT/EIBT"
        datetime atd "ACARS OUT/OFF"
        datetime ata "ACARS ON/IN"
        string leg_state "POC đề xuất: GRD/BRD/OUT/ENR/IN/ARR [chờ SME]"
        string leg_type "thường/ferry/VIP/charter…"
        bool irregular
        bool diverted
        string delay_code
        int delay_mins
    }
    TAU_BAY {
        string ac_reg PK
        string ac_type
        string ac_subtype
        string config_cwy "C/W/Y"
        int mtow
        int dow
        string status "khai thác/BQ/MNT…"
    }
    TO_BAY {
        string crew_id PK
        string ho_ten
        string chuc_danh "PIC/FO/PUR…"
    }
    PHAN_CONG_TO_BAY {
        string flight_no FK
        string crew_id FK
        string vai_tro
        bool doi_to "đổi tổ bay"
    }
    TAI_LIEU_CHUYEN {
        string flight_no FK
        string doc_type "OFP/LS/GD/PM/NOTOC/Cargo/Mail"
        int rev_count
        string ofp_number "Lido"
        string ofp_version "TOSS R1,R2…"
        datetime upload_time
        datetime confirm_time
        string trang_thai "Unconfirmed/Confirmed/Rejected"
        datetime flight_release_time
        string released_by
    }
    TAI_TRONG {
        string flight_no FK
        int booking_c
        int booking_w
        int booking_y
        int ls_pax_total
        int transfer_pax "[cần xác nhận nguồn]"
        int payload
        int zfw
    }
    SAN_BAY {
        string iata PK
        string icao
        string rffs_cat "[cần xác nhận trường lưu]"
        string minima
        string parking_stand
        string curfew
    }
    THOI_TIET {
        string iata FK
        string loai "METAR/SPECI"
        string tam_nhin
        string tran_may
        string hien_tuong "TSRA…"
        datetime gio_quan_trac
    }
    NOTAM {
        string notam_id PK
        string iata FK
        string nhom "sân bay/vùng trời/đường bay"
        bool rffs "NOTAM cứu hỏa"
    }
    MEL_CDL {
        string ac_reg FK
        string ma_loi
        string loai "MEL/CDL"
        bool anh_huong_khai_thac
    }
    CANH_BAO {
        string alert_id PK
        string flight_no FK
        string loai "OSP/NOTAM/WX/tài liệu/đổi tổ…"
        string muc_do
        datetime raise_time
        datetime clear_time
        string acars_trigger "OFF/ON/IN"
    }
    MOC_KHAI_THAC {
        string flight_no FK
        string nguon "ACARS OOOI / A-CDM"
        datetime out_time
        datetime off_time
        datetime on_time
        datetime in_time
        datetime sobt_eobt_tobt_aobt "A-CDM"
        datetime tsat_ctot_ttot_atot "A-CDM"
    }
    CHUNG_CHI_SAN_BAY {
        string crew_id FK
        string iata FK
        string dieu_kien "chứng chỉ/kinh nghiệm [cần xác nhận]"
    }
    NGUOI_DUNG {
        string user_id PK
        string vai_tro "Dispatcher/Trực ban trưởng/Cán bộ tài liệu"
    }
    CA_TRUC {
        string ca_id PK
        string user_id FK
        string pham_vi "căn cứ/Carrier/sân bay"
    }
```

## 2. Thực thể lõi & vai trò trong cụm màn giám sát

| Thực thể | Vai trò | Màn dùng |
|---|---|---|
| **CHUYEN_BAY** (Flight/Leg) | Trung tâm — mỗi dòng giám sát = 1 chuyến/leg | BR-113, 114, 125 |
| **TAU_BAY** (Aircraft) | Hiển thị REG/type, tàu quay | BR-114, 125 |
| **PHAN_CONG_TO_BAY / TO_BAY** | Tổ bay, đổi tổ, chứng chỉ | BR-114 (chứng chỉ), 125 (đổi tổ) |
| **TAI_LIEU_CHUYEN** (Document) | Trạng thái tài liệu, OFP version, release | BR-112, 113 (cán bộ tài liệu) |
| **TAI_TRONG** (Load/PAX) | Tải, ZFW, khách nối chuyến | BR-113 (trực ban), 114 (tải) |
| **SAN_BAY** + **THOI_TIET** + **NOTAM** | RFFS, thời tiết, NOTAM cho kiểm tra đầu ca | BR-114 |
| **MEL_CDL** | Lỗi kỹ thuật ảnh hưởng khai thác | BR-114 |
| **CANH_BAO** (Alert) | Cảnh báo màu/nhấp nháy, raise/clear theo mốc ACARS | BR-114, 125 |
| **MOC_KHAI_THAC** (ACARS OOOI / A-CDM) | Mốc thời gian thực tế, ETA, trạng thái bay | BR-125 |
| **NGUOI_DUNG / CA_TRUC** | Phân quyền theo vai trò + phạm vi giám sát | tất cả |

## 3. Điểm `[cần xác nhận]` ảnh hưởng data model (đồng bộ OID)
- Enum **LEG STATE** — **POC dsp_monitoring đề xuất GRD/BRD/OUT/ENR/IN/ARR** (ứng viên), chờ SME khách hàng xác nhận.
- Nguồn **Transfer PAX / khách nối chuyến** (FOS không có cột trực tiếp).
- Trường lưu **cấp RFFS** sân bay (RFFS cảnh báo qua NOTAM — có cần lưu cấp?).
- Cấu trúc **CHUNG_CHI_SAN_BAY** (chứng chỉ tổ bay theo sân bay đặc biệt — SME-18).
- **VMA** (ngưỡng thời tiết) — lưu ở SAN_BAY hay danh mục riêng.
- **TAI_LIEU_CHUYEN.ofp_rev_color** — POC dùng 3 màu (🟢 đã release / 🟡 bản trước đã release / 🔴 chưa rev nào release) + format "x/y/z Rn" `[cần xác nhận ý nghĩa x/y/z]` — trạng thái suy ra từ Dispatch Release.
- Nguồn **Crew↓** (tổ bay đã/chưa download tài liệu) = **Pilot App / MO Plus** `[cần xác nhận trường nguồn]`.

## 4. Ghi chú
- Đây là mô hình **co-evolution P4** — tinh chỉnh song song khi vẽ wireframe; khác biệt phát hiện trong wireframe/POC phản hồi ngược về model.
- **Cập nhật co-evolution (từ POC dsp_monitoring, 2026-06-12):** bổ sung enum ứng viên `leg_state`; ghi chú `ofp_rev_color`; nguồn Crew↓ = Pilot App; (gợi ý thực thể mở rộng sau: PILOT_EXTRA, TO_LD/RTOW, MCT cho nối chuyến).
- Các mốc A-CDM/ACARS gom trong `MOC_KHAI_THAC` (xem glossary v0.8: A-CDM Milestone Times, ACARS OOOI).
- Chưa mô hình hóa các thực thể ngoài cụm giám sát (master data đầy đủ, báo cáo) — sẽ làm khi mở rộng phạm vi.
