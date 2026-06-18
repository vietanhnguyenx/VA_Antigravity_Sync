# auto-pull-origin.ps1 - Tu dong KEO cap nhat moi tu repo cua anh Gioan
# Remote: origin = https://github.com/nguyengioan00-cmyk/VITI-TOSS (branch main)
#
# Chien luoc: MERGE UU TIEN LOCAL (git merge -X ours):
#   - File MOI chi co o repo Gioan  -> tu dong THEM vao dung vi tri.
#   - File DA CO o local (da lam / da khac) -> GIU NGUYEN ban local, KHONG ghi de.
#   - Khong bao gio xoa thay doi cuc bo. Neu merge bi ket xung dot -> abort + ghi log.
#
# Duoc goi dinh ky boi Windows Scheduled Task "TOSS-AutoPull-Gioan" (moi 1 gio).

$env:GIT_TERMINAL_PROMPT = "0"
$ErrorActionPreference = "Stop"

$ScriptDir  = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectDir = (Resolve-Path (Join-Path $ScriptDir "..")).Path
$LogDir     = Join-Path $ProjectDir "logs"
if (-not (Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }
$LogFile = Join-Path $LogDir "auto-pull.log"

function Write-PullLog {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logLine = "[$timestamp] [$Level] $Message"
    Write-Output $logLine
    $logLine | Out-File -FilePath $LogFile -Append -Encoding utf8
}

function Get-GitPath {
    if (Get-Command git -ErrorAction SilentlyContinue) { return "git" }
    $localGit = "$env:LOCALAPPDATA\Programs\Git\cmd\git.exe"
    if (Test-Path $localGit) { return $localGit }
    $programFilesGit = "${env:ProgramFiles}\Git\cmd\git.exe"
    if (Test-Path $programFilesGit) { return $programFilesGit }
    throw "Khong tim thay Git. Vui long cai dat Git va dam bao no nam trong PATH."
}

function Test-MergeInProgress {
    param([string]$Dir)
    return (Test-Path (Join-Path $Dir ".git\rebase-merge")) -or
           (Test-Path (Join-Path $Dir ".git\rebase-apply")) -or
           (Test-Path (Join-Path $Dir ".git\MERGE_HEAD"))
}

try {
    $git = Get-GitPath
    Set-Location $ProjectDir

    # 1. Khong dong vao giua mot tien trinh rebase/merge dang do
    if (Test-MergeInProgress $ProjectDir) {
        Write-PullLog "Dang co rebase/merge dang do. Bo qua chu ky nay." "INFO"
        return
    }

    # 2. Phai dang o branch main
    $branch = (& $git rev-parse --abbrev-ref HEAD).Trim()
    if ($branch -ne "main") {
        Write-PullLog "Dang o branch '$branch' (khong phai main). Bo qua de tranh merge nham branch." "WARNING"
        return
    }

    # 3. Fetch cap nhat moi nhat tu origin (repo cua Gioan)
    $fetchOut = & $git fetch origin main --quiet 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-PullLog "Loi khi fetch origin: $fetchOut" "ERROR"
        return
    }

    $local  = (& $git rev-parse main).Trim()
    $remote = (& $git rev-parse origin/main).Trim()
    if ($local -eq $remote) {
        Write-PullLog "Local da bang origin/main. Khong co gi de cap nhat." "INFO"
        return
    }

    # 4. Neu origin/main da nam tron trong lich su local -> khong co gi moi de merge
    & $git merge-base --is-ancestor origin/main main
    if ($LASTEXITCODE -eq 0) {
        Write-PullLog "Khong co commit moi tu Gioan (origin/main da duoc merge truoc do)." "INFO"
        return
    }

    # 5. Commit moi thay doi cuc bo dang do de cay lam viec sach truoc khi merge
    $dirty = & $git status --porcelain
    if ($dirty) {
        Write-PullLog "Phat hien thay doi cuc bo chua commit. Dang commit lai truoc khi merge..." "INFO"
        & $git add -A
        & $git commit -m "Auto-pull: luu thay doi cuc bo truoc khi merge tu Gioan" | Out-Null
        if ($LASTEXITCODE -ne 0) {
            Write-PullLog "Khong the commit thay doi cuc bo. Bo qua chu ky de an toan." "ERROR"
            return
        }
    }

    # 6. Merge origin/main, UU TIEN LOCAL khi trung file (-X ours).
    #    --allow-unrelated-histories: can cho lan merge dau (hai lich su chua lien quan);
    #    cac lan sau git tu bo qua co nay khi da lien quan.
    Write-PullLog "Dang merge origin/main (uu tien local, them file moi tu Gioan)..." "INFO"
    $mergeMsg = "Auto-pull: merge tu Gioan (origin/main) - them file moi, giu nguyen local"
    $mergeOut = & $git merge origin/main --allow-unrelated-histories -X ours --no-edit -m $mergeMsg 2>&1
    $mergeExit = $LASTEXITCODE

    if ($mergeExit -ne 0 -or (Test-MergeInProgress $ProjectDir)) {
        Write-PullLog "Merge bi ket (co the do xung dot rename/delete -X ours khong tu giai duoc)." "ERROR"
        Write-PullLog "Chi tiet: $mergeOut" "ERROR"
        Write-PullLog "Dang abort merge de giu cay lam viec an toan (git merge --abort)..." "WARNING"
        & $git merge --abort 2>&1 | Out-Null
        Write-PullLog "Da abort. Can xu ly thu cong: git merge origin/main -X ours" "WARNING"
        return
    }

    # 7. Bao cao so file moi duoc them
    $added = (& $git diff --name-only --diff-filter=A HEAD~1 HEAD 2>$null | Measure-Object -Line).Lines
    Write-PullLog "MERGE THANH CONG - da them $added file moi tu repo cua Gioan, giu nguyen ban local." "INFO"
}
catch {
    Write-PullLog "Loi nghiem trong trong chu ky pull: $_" "ERROR"
}
