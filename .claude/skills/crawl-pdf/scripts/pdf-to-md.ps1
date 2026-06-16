<#
.SYNOPSIS
  Phân rã (decompose) các PDF trong một thư mục thành .md (text trích bằng pdftotext qua WSL).
.DESCRIPTION
  Với mỗi *.pdf trong PdfDir: WSL đọc PDF qua /mnt/host/<ổ>/... và `pdftotext -layout ... -` (XUẤT STDOUT);
  PowerShell ghi .md phía Windows (kèm YAML frontmatter + link nguồn nếu có MapFile).
  ƯU ĐIỂM: KHÔNG cần copy file vào WSL, KHÔNG ghi vào fs WSL → CHẠY ĐƯỢC KỂ CẢ KHI ĐĨA WSL READ-ONLY.
  KHÔNG diễn giải nội dung — chỉ trích trung thực (CLAUDE.md §0). Bản .md là raw extract.
.PARAMETER MapFile
  (tuỳ chọn) mỗi dòng 'ten-file|source_url|tieu_de' để ghi frontmatter chuẩn. Thiếu thì dùng mặc định.
.EXAMPLE
  .\pdf-to-md.ps1 -PdfDir .\briefing\_pdf -OutDir .\briefing -MapFile map.txt
.NOTES
  Yêu cầu: WSL chạy + poppler-utils (alpine/docker-desktop: `apk add poppler-utils`).
  WSL truy cập ổ Windows qua /mnt/host/<ổ>/... (kể cả distro docker-desktop). Nếu /mnt/host không có,
  thử /mnt/<ổ>/ (WSL Ubuntu thường). Script tự dò.
#>
param(
  [Parameter(Mandatory=$true)][string]$PdfDir,
  [Parameter(Mandatory=$true)][string]$OutDir,
  [string]$MapFile = '',
  [string]$ExtractedDate = ''
)
$ErrorActionPreference='Stop'
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

# Kiểm tra pdftotext
$has = (wsl -- sh -c "command -v pdftotext >/dev/null 2>&1 && echo yes || echo no").Trim()
if($has -ne 'yes'){ Write-Output "LỖI: WSL chưa có pdftotext. Cài: apk add poppler-utils (alpine) | apt install -y poppler-utils (ubuntu)."; exit 3 }
# Dò prefix mount ổ Windows
$mntPrefix = $null
foreach($pfx in @('/mnt/host/','/mnt/')){
  $ok = (wsl -- sh -c "test -d ${pfx}c -o -d ${pfx}d && echo yes || echo no").Trim()
  if($ok -eq 'yes'){ $mntPrefix = $pfx; break }
}
if(-not $mntPrefix){ Write-Output "LỖI: WSL không mount được ổ Windows (/mnt/host hay /mnt). Cần bật tự mount hoặc dùng distro khác."; exit 2 }

function ConvertTo-WslPath([string]$winPath){
  $full = (Resolve-Path -LiteralPath $winPath).Path     # X:\a\b
  $drive = $full.Substring(0,1).ToLower()
  $rest  = $full.Substring(3) -replace '\\','/'
  return "$mntPrefix$drive/$rest"
}

# Nạp map (ten|url|tieu_de)
$map=@{}
if($MapFile -ne '' -and (Test-Path $MapFile)){
  foreach($l in (Get-Content $MapFile -Encoding UTF8)){ if($l -match '\|'){ $p=$l -split '\|',3; $map[$p[0].Trim()]= @($p[1].Trim(), ($(if($p.Count -ge 3){$p[2].Trim()}else{$p[0].Trim()}))) } }
}
if($ExtractedDate -eq ''){ $ExtractedDate = (Get-Date -Format 'yyyy-MM-dd') }

$pdfs = Get-ChildItem $PdfDir -Filter *.pdf
Write-Output "Phân rã $($pdfs.Count) PDF (mount=$mntPrefix)..."
foreach($f in $pdfs){
  $name = $f.BaseName
  $wslPdf = ConvertTo-WslPath $f.FullName
  $txt = wsl -- pdftotext -layout -enc UTF-8 "$wslPdf" - 2>$null
  $body = ($txt -join "`n")
  if([string]::IsNullOrWhiteSpace($body)){ Write-Output "  [BỎ QUA] $name (không trích được text)"; continue }
  $src = if($map.ContainsKey($name)){ $map[$name][0] } else { '' }
  $title = if($map.ContainsKey($name)){ $map[$name][1] } else { $name }
  $fm = @"
---
source_url: "$src"
document_type: "Domain Knowledge — trích xuất PDF (pdftotext -layout)"
extracted: "$ExtractedDate"
status: "Raw extract — chưa biên tập"
---

# $title

> **Nguồn (PDF):** $src
> **Lưu ý:** Trích tự động bằng ``pdftotext -layout`` (qua WSL /mnt) — trung thực nội dung, có thể lệch định dạng bảng/cột. Đối chiếu PDF gốc khi cần.

---

"@
  Set-Content -Path (Join-Path $OutDir "$name.md") -Value ($fm + $body) -Encoding UTF8
  Write-Output "  [OK] $name.md"
}
Write-Output "Xong -> $OutDir"
