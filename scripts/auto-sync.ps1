param (
    [int]$IntervalSeconds = 300,
    [string]$Branch = "main"
)

# Thư mục logs
$LogDir = "d:\TOSS\logs"
if (!(Test-Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
}
$LogFile = Join-Path $LogDir "sync.log"

function Write-Log ($Message, $Color = "White") {
    $Timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $LogMessage = "[$Timestamp] $Message"
    
    # Ghi ra console (nếu đang chạy interactive)
    Write-Host $LogMessage -ForegroundColor $Color
    
    # Ghi ra file log
    Add-Content -Path $LogFile -Value $LogMessage
}

Write-Log "=========================================================" "Cyan"
Write-Log "TOSS Auto-Sync Script v2.0" "Cyan"
Write-Log "Tu dong check, pull/rebase va push sau moi $IntervalSeconds giay" "Cyan"
Write-Log "=========================================================" "Cyan"

# Kiểm tra thư mục hiện tại có phải repo git không
if (!(Test-Path ".git")) {
    Write-Log "[!] Error: Current directory is not a Git repository." "Red"
    Write-Log "Please run 'git init' and connect to remote first." "Yellow"
    exit
}

# Chọn Remote đồng bộ (Ưu tiên remote 'personal' nếu có, không thì dùng 'origin')
$Remote = "origin"
$Remotes = git remote
if ($Remotes -contains "personal") {
    $Remote = "personal"
    Write-Log "Phat hien remote ca nhan 'personal'. Su dung 'personal' lam remote dong bo chinh." "Green"
} else {
    Write-Log "Canh bao: Khong tim thay remote 'personal'. Su dung remote mac dinh 'origin' ($Remote)." "Yellow"
}

# Lấy tên máy tính để đánh dấu commit nguồn
$ComputerName = $env:COMPUTERNAME

while ($true) {
    try {
        # 1. Fetch de kiem tra thay doi tu remote
        Write-Log "Dang dong bo tu remote '$Remote'..." "DarkGray"
        git fetch $Remote
        
        # 2. Kiem tra thay doi local chua commit (Chi thuc hien neu la remote personal)
        $Changes = git status --porcelain
        if ($Changes) {
            if ($Remote -eq "personal") {
                Write-Log "Phat hien co thay doi chua commit. Dang tu dong commit..." "Yellow"
                git add -A
                $CommitMsg = "Auto-sync: $ComputerName [$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')]"
                git commit -m $CommitMsg
                Write-Log "Da commit cac thay doi local thanh cong: $CommitMsg" "Green"
            } else {
                Write-Log "Phat hien thay doi local nhung bo qua commit tu dong o che do an toan (Remote = $Remote)." "Yellow"
            }
        }
        
        # 3. Keo thay doi tu remote ve bang rebase
        Write-Log "Dang keo (Pull - Rebase) cac thay doi moi tu remote '$Remote'..." "DarkGray"
        $PullResult = git pull $Remote $Branch --rebase 2>&1
        $LastExitCode = $LASTEXITCODE
        
        if ($LastExitCode -ne 0) {
            Write-Log "Loi xay ra khi keo code ve: $PullResult" "Red"
            if ($PullResult -match "conflict" -or $PullResult -match "Resolve all conflicts") {
                Write-Log "[!] CANH BAO: Xung dot xay ra khi dong bo tu dong. Dang khoi phuc (Abort rebase)..." "Red"
                git rebase --abort
                Write-Log "Da khoi phuc trang thai. Vui long mo Terminal va chay 'git pull $Remote $Branch --rebase' de xu ly xung dot thu cong." "Yellow"
            }
        } else {
            # 4. Day thay doi len remote (Chi push neu la remote personal)
            if ($Remote -eq "personal") {
                Write-Log "Dang day (Push) thay doi len remote '$Remote'..." "DarkGray"
                $PushResult = git push $Remote $Branch 2>&1
                $PushExitCode = $LASTEXITCODE
                if ($PushExitCode -eq 0) {
                    Write-Log "Dong bo hoa hoan tat thanh cong!" "Green"
                } else {
                    Write-Log "Khong the day code len remote. Loi: $PushResult" "Red"
                }
            } else {
                Write-Log "Bo qua push tu dong o che do an toan (Remote = $Remote)." "Yellow"
            }
        }

        # 5. Dong bo thu vien dev dependencies (neu co cap nhat package.json)
        if ($Changes -match "dev/package.json" -and (Test-Path "dev\package.json")) {
            Write-Log "Phat hien thay doi trong dev/package.json. Dang cap nhat thu vien..." "Cyan"
            Push-Location dev
            if (Get-Command pnpm -ErrorAction SilentlyContinue) {
                pnpm install
            } else {
                npm install
            }
            Pop-Location
            Write-Log "Cap nhat thu vien hoan tat." "Green"
        }
    } catch {
        Write-Log "Loi bat thuong trong qua trinh dong bo: $_" "Red"
    }
    
    Start-Sleep -Seconds $IntervalSeconds
}
