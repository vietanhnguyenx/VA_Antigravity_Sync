# auto-sync.ps1 — He thong tu dong dong bo hoa Git du an TOSS
# Chay ngam moi 5 phut de tai thay doi moi va day cac thay doi cuc bo len GitHub ca nhan.

$env:GIT_TERMINAL_PROMPT = "0"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectDir = Resolve-Path (Join-Path $ScriptDir "..")
$LogDir = Join-Path $ProjectDir "logs"

if (-not (Test-Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
}
$LogFile = Join-Path $LogDir "sync.log"

function Write-SyncLog {
    param(
        [string]$Message,
        [string]$Level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logLine = "[$timestamp] [$Level] $Message"
    Write-Output $logLine
    $logLine | Out-File -FilePath $LogFile -Append -Encoding utf8
}

function Get-GitPath {
    if (Get-Command git -ErrorAction SilentlyContinue) {
        return "git"
    }
    $localGit = "$env:LOCALAPPDATA\Programs\Git\cmd\git.exe"
    if (Test-Path $localGit) {
        return $localGit
    }
    $programFilesGit = "${env:ProgramFiles}\Git\cmd\git.exe"
    if (Test-Path $programFilesGit) {
        return $programFilesGit
    }
    throw "Khong tim thay Git. Vui lau cai dat Git va dam bao no nam trong he thong PATH."
}

Write-SyncLog "Khoi dong tien trinh dong bo tu dong chay ngam..." "INFO"

while ($true) {
    try {
        $git = Get-GitPath
        Set-Location $ProjectDir

        # 1. Kiem tra remote 'personal'
        $remotes = & $git remote
        if ($remotes -notcontains "personal") {
            Write-SyncLog "Chua cau hinh remote 'personal'. Vui long chay lenh: git remote add personal <URL_REPO_GITHUB_CA_NHAN>" "WARNING"
        }
        else {
            $personalUrl = & $git remote get-url personal
            if ($personalUrl -like "*URL_REPO_GITHUB_CA_NHAN*" -or [string]::IsNullOrWhiteSpace($personalUrl)) {
                Write-SyncLog "Remote 'personal' dang su dung URL gia dinh hoac trong. Vui long thiet lap lai bang lenh: git remote set-url personal <URL_REPO_GITHUB_CA_NHAN>" "WARNING"
            }
            else {
                # 2. Kiem tra neu dang rebase thu cong
                if ((Test-Path (Join-Path $ProjectDir ".git\rebase-merge")) -or (Test-Path (Join-Path $ProjectDir ".git\rebase-apply"))) {
                    Write-SyncLog "Dang co tien trinh rebase thu cong. Bo qua chu ky dong bo tu dong de tranh xung dot." "INFO"
                }
                else {
                    # 3. Add va Commit cac thay doi cuc bo
                    $status = & $git status --porcelain
                    if ($status) {
                        Write-SyncLog "Phat hien thay doi cuc bo. Dang tien hanh add va commit..." "INFO"
                        & $git add -A
                        $commitMsg = "Auto-sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
                        & $git commit -m $commitMsg | Out-Null
                    }

                    # 4. Pull tu remote personal (su dung rebase)
                    Write-SyncLog "Dang keo thay doi moi nhat tu remote personal (pull --rebase)..." "INFO"
                    $pullResult = & $git -c credential.helper= pull personal main --rebase 2>&1
                    $lastExitCode = $LASTEXITCODE

                    if ($lastExitCode -ne 0) {
                        # Phat hien xung dot (Conflict)
                        if (($pullResult -match "conflict") -or ($pullResult -match "Conflict") -or (Test-Path (Join-Path $ProjectDir ".git\rebase-merge")) -or (Test-Path (Join-Path $ProjectDir ".git\rebase-apply"))) {
                            Write-SyncLog "PHAT HIEN XUNG DOT CODE (Conflict)!" "ERROR"
                            Write-SyncLog "Dang thuc hien huy rebase tu dong (git rebase --abort)..." "WARNING"
                            & $git rebase --abort | Out-Null
                            Write-SyncLog "Da huy rebase tu dong. Vui long xu ly xung dot thu cong bang lenh: git pull personal main --rebase" "ERROR"
                        }
                        else {
                            Write-SyncLog "Loi khi thuc hien pull: $pullResult" "ERROR"
                        }
                    }
                    else {
                        # 5. Push len remote personal
                        Write-SyncLog "Dang day cac thay doi len remote personal..." "INFO"
                        $pushResult = & $git -c credential.helper= push personal main 2>&1
                        $pushExitCode = $LASTEXITCODE

                        if ($pushExitCode -ne 0) {
                            Write-SyncLog "Loi khi day len github: $pushResult" "ERROR"
                        }
                        else {
                            Write-SyncLog "Dong bo thanh cong!" "INFO"
                        }
                    }
                }
            }
        }
    }
    catch {
        Write-SyncLog "Loi nghiem trong trong chu ky dong bo: $_" "ERROR"
    }

    # Cho 5 phut (300 giay) truoc chu ky tiep theo
    Start-Sleep -Seconds 300
}
