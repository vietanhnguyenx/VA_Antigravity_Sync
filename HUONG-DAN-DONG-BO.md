# Hướng dẫn Đồng bộ hóa Dữ liệu (Auto-Sync) trên Nhiều Thiết bị

Tài liệu này hướng dẫn cách thiết lập hệ thống tự động đồng bộ hóa Git trên bất kỳ máy tính Windows mới nào của anh, giúp tự động tải xuống các thay đổi mới và đẩy lên các thay đổi của anh sau mỗi 5 phút.

---

## Tổng quan mô hình đồng bộ

Hệ thống sử dụng mô hình **Dual-Remote** (2 đầu xa):
1. **`personal`** (GitHub cá nhân của anh): Dùng để tự động đồng bộ mọi thay đổi trong workspace cá nhân (bao gồm cả thư mục nháp `ba/workspace/drafts/`) giữa các thiết bị của anh.
2. **`origin`** (GitHub chung của dự án - `VITI-TOSS`): Chỉ sử dụng khi anh muốn kéo code/tài liệu mới nhất từ đội ngũ dự án hoặc đẩy các tài liệu chính thức đã được duyệt lên.

---

## Quy trình Thiết lập trên Thiết bị Mới

Thực hiện các bước sau trên máy tính Windows mới của anh:

### Bước 1: Cài đặt Git và Đăng nhập GitHub
1. Tải và cài đặt Git cho Windows từ [git-scm.com](https://git-scm.com).
2. Mở PowerShell và cấu hình thông tin cá nhân:
   ```powershell
   git config --global user.name "Tên Của Anh"
   git config --global user.email "email_github_cua_anh@example.com"
   ```
3. Đảm bảo Git Credential Manager đã được bật để tự động lưu mật khẩu/token GitHub:
   ```powershell
   git config --global credential.helper manager
   ```

### Bước 2: Clone dự án và Cấu hình Remote
1. Clone dự án từ GitHub cá nhân của anh về máy mới (giả sử anh lưu tại ổ đĩa `D:\TOSS`):
   ```powershell
   git clone <URL_REPO_GITHUB_CA_NHAN> D:\TOSS
   ```
2. Truy cập vào thư mục vừa clone:
   ```powershell
   cd D:\TOSS
   ```
3. Thêm remote `personal` (chính là repo cá nhân của anh) và `origin` (repo chung của dự án):
   ```powershell
   # Thiết lập remote personal để đồng bộ tự động
   git remote set-url personal <URL_REPO_GITHUB_CA_NHAN> 2>$null || git remote add personal <URL_REPO_GITHUB_CA_NHAN>
   
   # Thiết lập remote origin trỏ về kho chung dự án
   git remote add origin https://github.com/nguyengioan00-cmyk/VITI-TOSS
   ```

### Bước 3: Xác thực GitHub lần đầu (Quan trọng)
Để tránh script chạy ngầm bị treo do hộp thoại đăng nhập của GitHub:
1. Mở PowerShell trong thư mục `D:\TOSS`.
2. Chạy thử một lệnh fetch để kích hoạt cửa sổ đăng nhập của GitHub:
   ```powershell
   git fetch personal
   ```
3. Đăng nhập qua trình duyệt web (OAuth) hoặc nhập Personal Access Token (PAT) nếu được yêu cầu. Đảm bảo lệnh chạy thành công mà không hỏi lại thông tin đăng nhập.

### Bước 4: Đăng ký chạy tự động khi Windows khởi động
Hệ thống sử dụng một file VBS nhỏ để gọi script PowerShell chạy ngầm mà không hiển thị cửa sổ đen (cmd/powershell) gây phiền toái.

1. Nhấn tổ hợp phím `Windows + R`, gõ `shell:startup` và nhấn **Enter**. Thư mục **Startup** của Windows sẽ mở ra.
2. Copy file [TOSS-AutoSync.vbs](file:///c:/Users/HYDRO/AppData/Roaming/Microsoft/Windows/Start%20Menu/Programs/Startup/TOSS-AutoSync.vbs) vào thư mục này.
3. Nhấp chuột phải vào file `TOSS-AutoSync.vbs` vừa copy, chọn **Edit** và kiểm tra đường dẫn:
   - Đảm bảo đường dẫn trỏ chính xác đến file script trên máy này: `D:\TOSS\scripts\auto-sync.ps1`.
   - Nội dung file VBS chuẩn:
     ```vbs
     Set WshShell = CreateObject("WScript.Shell")
     WshShell.Run "powershell.exe -NoProfile -ExecutionPolicy Bypass -File d:\TOSS\scripts\auto-sync.ps1", 0, False
     ```

---

## Hướng dẫn Vận hành & Xử lý sự cố

### 1. Cách kiểm tra script đang chạy ngầm
- Mở **Task Manager** -> Chọn tab **Details** -> Tìm tiến trình `powershell.exe`.
- Hoặc chạy lệnh sau trong PowerShell để xem tiến trình sync đang chạy:
  ```powershell
  Get-Process powershell | Where-Object {$_.CommandLine -like "*auto-sync.ps1*"}
  ```

### 2. Cách kiểm tra Nhật ký Đồng bộ (Logs)
Mọi hoạt động của script tự động đồng bộ sẽ được ghi vào file log đặt tại `d:\TOSS\logs\sync.log`. Anh có thể mở file này để theo dõi tiến độ hoặc kiểm tra lỗi nếu xảy ra sự cố.

### 3. Xử lý xung đột code (Conflicts)
Nếu cùng một file bị sửa đổi ở hai máy khác nhau trước khi đồng bộ:
- Script sẽ tự động phát hiện xung đột và thực hiện lệnh `git rebase --abort` để không làm hỏng lịch sử git cục bộ.
- Script sẽ ghi cảnh báo đỏ vào file `logs/sync.log` và tạm dừng đồng bộ file đó.
- **Cách xử lý**: Anh chỉ cần mở PowerShell tại thư mục `D:\TOSS` và chạy lệnh sau để kéo code thủ công và giải quyết xung đột:
  ```powershell
  git pull personal main --rebase
  ```
  Sau khi giải quyết xung đột bằng VS Code hoặc editor của anh, chạy:
  ```powershell
  git add .
  git rebase --continue
  ```
  Hệ thống chạy ngầm sẽ tự động tiếp tục hoạt động bình thường sau khi xung đột được giải quyết.
