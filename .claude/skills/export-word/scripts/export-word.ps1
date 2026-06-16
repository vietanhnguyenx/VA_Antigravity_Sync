<#
  export-word.ps1 — Xuất bộ file Markdown của dự án thành 1 file Word (.docx)
  TỰ MÔ TẢ (không link .md nội bộ) + TRÌNH BÀY theo biểu mẫu Viettel QT02.BM.04.
  Đã gói các bài học/sai sót (xem SKILL.md). Chạy bằng Windows PowerShell 5.1.

  VÍ DỤ:
    .\export-word.ps1 -SourceList "@.claude\skills\export-word\manifests\srs.txt" `
        -Title "SRS — Hệ thống MES Nhà máy S5 (TOSS)" `
        -Subtitle "Đặc tả Yêu cầu Phần mềm · trình bày theo QT02.BM.04" `
        -OutDir "ba/process/exports" -OutBase "SRS-TOSS-MES-S5" -Version "2.1" -TocDepth 3

  -SourceList: danh sách file .md THEO THỨ TỰ — hoặc "@<đường-dẫn-tệp>" (mỗi dòng 1 path),
               hoặc chuỗi nhiều path ngăn cách bởi dấu phẩy.
  Tên file ra: <OutBase>-v<Version>-<yyyy-MM-dd>.docx  (KHÔNG ghi đè; muốn ghi đè dùng -Force).
#>
param(
  [Parameter(Mandatory=$true)][string]$SourceList,
  [Parameter(Mandatory=$true)][string]$Title,
  [string]$Subtitle = "",
  [string]$OutDir = "ba/process/exports",
  [Parameter(Mandatory=$true)][string]$OutBase,
  [Parameter(Mandatory=$true)][string]$Version,
  [int]$TocDepth = 3,
  [string]$Template = ".claude\templates\word-reference.docx",
  [string]$Pandoc = "C:\Users\VTIT\AppData\Local\Pandoc\pandoc.exe",
  [switch]$Force
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$utf8 = New-Object System.Text.UTF8Encoding($false)

# ---------- Phân giải danh sách nguồn ----------
if ($SourceList.StartsWith('@')) { $files = Get-Content -LiteralPath $SourceList.Substring(1) -Encoding UTF8 | Where-Object { $_.Trim() -ne '' -and -not $_.Trim().StartsWith('#') } }
else { $files = $SourceList -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' } }
$missing = $files | Where-Object { -not (Test-Path -LiteralPath $_) }
if ($missing) { throw "Thiếu file nguồn:`n" + ($missing -join "`n") }
if (-not (Test-Path $Template)) { throw "Không thấy template: $Template (chạy build-reference-template.ps1 trước)." }
if (-not (Test-Path $Pandoc))   { throw "Không thấy pandoc: $Pandoc" }

# ---------- Tên file ra theo version (chống ghi đè) ----------
New-Item -ItemType Directory -Force $OutDir | Out-Null
$today = (Get-Date).ToString('yyyy-MM-dd')
$outDocx = Join-Path $OutDir ("{0}-v{1}-{2}.docx" -f $OutBase,$Version,$today)
if ((Test-Path $outDocx) -and -not $Force) { throw "ĐÃ TỒN TẠI: $outDocx`nNội dung đã chốt thì TĂNG version; chỉ dùng -Force khi đang nháp cùng version." }

# ---------- Hàm biến đổi (chỉ áp dụng KHI XUẤT; .md nguồn giữ nguyên link) ----------
function StripFrontmatter($p){ $c = Get-Content -LiteralPath $p -Raw -Encoding UTF8; [regex]::Replace($c,'^﻿?---\r?\n.*?\r?\n---\r?\n','',[System.Text.RegularExpressions.RegexOptions]::Singleline) }
# (a) bỏ đích link nội bộ, giữ nhãn; giữ http(s)/mailto
function CleanLinks($t){ $rx=[regex]'(?<!\!)\[([^\]]+)\]\(([^)]+)\)'; $rx.Replace($t,{ param($m); if($m.Groups[2].Value -match '^(https?://|mailto:)'){ $m.Value } else { $m.Groups[1].Value } }) }
# (b) bỏ path + đuôi .md/.html (giữ basename); KHÔNG đụng .xlsx/.docx (nguồn thật)
function StripMdTokens($t){ [regex]::Replace($t,'(?:\.{1,2}/)?(?:[\w.\-]+/)*([\w.\-]+?)\.(?:md|html)\b','$1') }
# (c) bỏ stem tên-file còn sót (slug dẫn đầu bằng số mục hoặc 'wf-') — KHÔNG đụng end-to-end / MO-2026-012
function StripSlugs($t){ [regex]::Replace($t,'(?<![A-Za-z0-9./-])(?:(?:wf-)?\d+(?:\.\d+)*-[a-z][a-z0-9-]*|wf-[a-z][a-z0-9-]*)(?![A-Za-z])','') }
function Transform($p){ StripSlugs (StripMdTokens (CleanLinks (StripFrontmatter $p))) }

# ---------- Ghép Markdown ----------
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("# $Title"); [void]$sb.AppendLine()
if ($Subtitle) { [void]$sb.AppendLine("*$Subtitle · v$Version · $today*"); [void]$sb.AppendLine() }
[void]$sb.AppendLine('---'); [void]$sb.AppendLine()
foreach($f in $files){ [void]$sb.AppendLine((Transform $f)); [void]$sb.AppendLine(); [void]$sb.AppendLine('---'); [void]$sb.AppendLine() }
$tmpMd = Join-Path $OutDir ("_combined_{0}.md" -f $OutBase)
[System.IO.File]::WriteAllText($tmpMd, $sb.ToString(), $utf8)

# ---------- Pandoc (áp template QT02 + mục lục) ----------
& $Pandoc $tmpMd "--from=markdown-yaml_metadata_block" --reference-doc="$Template" -o $outDocx --toc "--toc-depth=$TocDepth" 2>$null
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $outDocx)) { throw "Pandoc lỗi (exit $LASTEXITCODE)." }
[System.IO.File]::Delete($tmpMd)

# ---------- Vá logo header (pandoc bỏ ảnh của reference) ----------
$lz=[System.IO.Compression.ZipFile]::OpenRead($Template); $le=$lz.GetEntry('word/media/logo.png')
$logo=$null; if($le){ $ms=New-Object System.IO.MemoryStream; $le.Open().CopyTo($ms); $logo=$ms.ToArray() }; $lz.Dispose()
$zip=[System.IO.Compression.ZipFile]::Open($outDocx,'Update')
$cte=$zip.GetEntry('[Content_Types].xml'); $sr=New-Object System.IO.StreamReader($cte.Open()); $ct=$sr.ReadToEnd(); $sr.Close()
if($ct -notmatch 'Extension="png"'){ $ct=$ct.Replace('</Types>','<Default Extension="png" ContentType="image/png" /></Types>'); $cte.Delete(); $ne=$zip.CreateEntry('[Content_Types].xml'); $sw=New-Object System.IO.StreamWriter($ne.Open(),$utf8); $sw.Write($ct); $sw.Close() }
if(-not $zip.GetEntry('word/_rels/header1.xml.rels')){ $he=$zip.CreateEntry('word/_rels/header1.xml.rels'); $sw2=New-Object System.IO.StreamWriter($he.Open(),$utf8); $sw2.Write('<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/logo.png"/></Relationships>'); $sw2.Close() }
if($logo -and -not $zip.GetEntry('word/media/logo.png')){ $me=$zip.CreateEntry('word/media/logo.png'); $st=$me.Open(); $st.Write($logo,0,$logo.Length); $st.Close() }
$zip.Dispose()

# ---------- QC ----------
function Get-Part($zip,$p){ $e=$zip.GetEntry($p); if(-not $e){return ''}; $sr=New-Object System.IO.StreamReader($e.Open()); $t=$sr.ReadToEnd(); $sr.Close(); $t }
$z=[System.IO.Compression.ZipFile]::OpenRead($outDocx); $names=$z.Entries.FullName
$xml=Get-Part $z 'word/document.xml'; $styles=Get-Part $z 'word/styles.xml'; $theme=Get-Part $z 'word/theme/theme1.xml'
$txt=[System.Net.WebUtility]::HtmlDecode(([regex]::Replace(([regex]::Replace($xml,'</w:p>',"`n")),'<[^>]+>','')))
$badFonts = ([regex]::Matches($styles,'w:ascii="([^"]+)"') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique) | Where-Object { $_ -ne 'Times New Roman' -and $_ -ne 'Consolas' }
$qc=[ordered]@{
  'OPC forward-slash (no backslash)' = (-not ($names -match '\\'))
  'logo + header + footer present'   = (($names -contains 'word/media/logo.png') -and ($names -contains 'word/header1.xml') -and ($names -contains 'word/footer1.xml'))
  'PNG content-type'                 = ((Get-Part $z '[Content_Types].xml') -match 'Extension="png"')
  'TOC field'                        = (([regex]'TOC \\o').Matches($xml).Count -ge 1)
  'no .md leak'                      = (([regex]'\.md\b').Matches($txt).Count -eq 0)
  'no markdown link ]('             = (([regex]'\]\(').Matches($txt).Count -eq 0)
  'no filename slug'                 = (([regex]'phan-he|wireframe-overview|tien-do-ncc|thiet-bi-iot').Matches($txt).Count -eq 0)
  'no YAML key leak'                 = (([regex]'document_type:|source_template:|^project:\s*"').Matches($txt).Count -eq 0)
  'FONT = Times New Roman only (+Consolas code)' = (($theme -match 'minorFont[\s\S]*?Times New Roman') -and (([regex]'Aptos|Calibri|Cambria').Matches($styles+$theme).Count -eq 0) -and (-not $badFonts))
  'XML well-formed'                  = $true
}
foreach($p in 'word/document.xml','word/header1.xml','word/footer1.xml','[Content_Types].xml'){ try{ [xml](Get-Part $z $p) | Out-Null }catch{ $qc['XML well-formed']=$false } }
$z.Dispose()
Write-Host ""
Write-Host ("XUẤT: " + $outDocx + ("  ({0} KB)" -f [math]::Round((Get-Item $outDocx).Length/1KB,1)))
Write-Host "----- QC -----"
$fail=0
foreach($k in $qc.Keys){ $ok=$qc[$k]; if(-not $ok){$fail++}; Write-Host ("  [{0}] {1}" -f $(if($ok){'PASS'}else{'FAIL'}),$k) }
if($badFonts){ Write-Host ("  ! Font lạ: " + ($badFonts -join ', ')) }
Write-Host ("----- KẾT QUẢ: " + $(if($fail -eq 0){'✅ PASS toàn bộ'}else{"❌ $fail mục FAIL — sửa & xuất lại"}) + " -----")
if($fail -gt 0){ exit 1 }
