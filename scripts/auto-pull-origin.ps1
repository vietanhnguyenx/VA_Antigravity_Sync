# auto-pull-origin.ps1 - Tu dong KEO (pull) cap nhat moi tu repo cua anh Gioan
# Remote: origin = https://github.com/nguyengioan00-cmyk/VITI-TOSS (branch main)
# Chien luoc: FAST-FORWARD ONLY - chi pull khi local chua bi lech.
#   Neu local da co commit rieng (divergence) -> BO QUA + ghi log, KHONG bao gio
#   ghi de / lam mat thay doi cuc bo. Xu ly hop nhat thu cong khi can.
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

try {
    $git = Get-GitPath
    Set-Location $ProjectDir

    # 1. Khong dong vao giua mot tien trinh rebase/merge thu cong
    if ((Test-Path (Join-Path $ProjectDir ".git\rebase-merge")) -or
        (Test-Path (Join-Path $ProjectDir ".git\rebase-apply")) -or
        (Test-Path (Join-Path $ProjectDir ".git\MERGE_HEAD"))) {
        Write-PullLog "Dang co rebase/merge thu cong. Bo qua chu ky nay." "INFO"
        return
    }

    # 2. Phai dang o branch main
    $branch = (& $git rev-parse --abbrev-ref HEAD).Trim()
    if ($branch -ne "main") {
        Write-PullLog "Dang o branch '$branch' (khong phai main). Bo qua de tranh pull nham branch." "WARNING"
        return
    }

    # 3. Fetch cap nhat moi nhat tu origin (repo cua Gioan)
    $fetchOut = & $git fetch origin main --quiet 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-PullLog "Loi khi fetch origin: $fetchOut" "ERROR"
        return
    }

    # 4. So sanh local main voi origin/main
    $local  = (& $git rev-parse main).Trim()
    $remote = (& $git rev-parse origin/main).Trim()
    if ($local -eq $remote) {
        Write-PullLog "Da cap nhat moi nhat (local == origin/main). Khong co gi de pull." "INFO"
        return
    }

    # merge-base de xac dinh quan he giua local va origin/main
    $baseRaw = & $git merge-base main origin/main 2>$null
    $base = if ($baseRaw) { $baseRaw.Trim() } else { "" }

    if ([string]::IsNullOrEmpty($base)) {
        # Khong co to tien chung -> hai lich su KHONG LIEN QUAN (unrelated histories).
        # Fast-forward la bat kha thi. Theo chien luoc no-clobber: BO QUA + ghi log.
        Write-PullLog "LICH SU KHONG LIEN QUAN (unrelated histories) giua local va origin/main." "WARNING"
        Write-PullLog "Fast-forward bat kha thi. Theo che do an toan no-clobber: BO QUA, khong ghi de." "WARNING"
        Write-PullLog "De lay ban cua Gioan can dung che do mirror (reset --hard) hoac clone moi - quyet dinh boi nguoi dung." "WARNING"
        return
    }

    if ($base -eq $remote) {
        # origin la to tien cua local -> local DANG VUOT TRUOC origin. Khong can pull.
        Write-PullLog "Local dang vuot truoc origin/main (co commit rieng chua len origin). Khong pull." "INFO"
        return
    }

    if ($base -ne $local) {
        # Khong phai to tien cua nhau -> DA LECH (divergence). Fast-forward khong duoc.
        Write-PullLog "DA LECH (divergence) giua local va origin/main - co commit rieng ca hai phia." "WARNING"
        Write-PullLog "Theo chien luoc fast-forward-only: BO QUA, khong ghi de. Xu ly thu cong:" "WARNING"
        Write-PullLog "  git fetch origin ; git rebase origin/main   (hoac merge), giai quyet xung dot roi tiep tuc." "WARNING"
        return
    }

    # base == local va remote khac local -> local LA to tien cua origin -> fast-forward duoc.
    $ahead = (& $git rev-list --count "$local..$remote").Trim()
    Write-PullLog "Co $ahead commit moi tu Gioan. Dang fast-forward..." "INFO"
    $mergeOut = & $git merge --ff-only origin/main 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-PullLog "Fast-forward that bai (co the do thay doi chua commit trong working tree): $mergeOut" "ERROR"
        Write-PullLog "Hay commit/stash thay doi cuc bo roi chay lai, hoac xu ly thu cong." "ERROR"
        return
    }
    Write-PullLog "PULL THANH CONG - da cap nhat $ahead commit moi tu repo cua Gioan." "INFO"
}
catch {
    Write-PullLog "Loi nghiem trong trong chu ky pull: $_" "ERROR"
}
