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
  [switch]$NoToc,
  [switch]$Formal,
  [string]$Font = "Times New Roman",
  [int]$FontSize = 0,
  [int]$TitleSize = 0,
  [string]$TitleAlign = "",
  [string]$H1Font = "",
  [int]$H1Size = 0,
  [switch]$H1Bold,
  [string]$H1Align = "",
  [string]$H2Font = "",
  [int]$H2Size = 0,
  [switch]$H2Bold,
  [string]$H2Align = "",
  [string]$H3Font = "",
  [int]$H3Size = 0,
  [switch]$H3Bold,
  [string]$H3Align = "",
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
# Tiêu đề render qua title block của pandoc (style "Title" sẵn có) — KHÔNG dùng "# $Title" (Heading 1) nữa
if ($Subtitle) { [void]$sb.AppendLine("*$Subtitle · v$Version · $today*"); [void]$sb.AppendLine() }
[void]$sb.AppendLine('---'); [void]$sb.AppendLine()
foreach($f in $files){ [void]$sb.AppendLine((Transform $f)); [void]$sb.AppendLine(); [void]$sb.AppendLine('---'); [void]$sb.AppendLine() }
$tmpMd = Join-Path $OutDir ("_combined_{0}.md" -f $OutBase)
# Bỏ dòng tiêu đề H1 ĐẦU TIÊN trong nguồn (đã render qua title block của pandoc → tránh tiêu đề lặp; '##' không bị đụng)
$combined = ([regex]'(?m)^# [^\r\n]*\r?\n').Replace($sb.ToString(), '', 1)
[System.IO.File]::WriteAllText($tmpMd, $combined, $utf8)

# ---------- Pandoc (áp template QT02 + mục lục) ----------
$pandocArgs = @($tmpMd, "--from=markdown-yaml_metadata_block", "--reference-doc=$Template", "-o", $outDocx, "--metadata", "title=$Title")
if (-not $NoToc) { $pandocArgs += @("--toc", "--toc-depth=$TocDepth") }
& $Pandoc @pandocArgs 2>$null
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
# ---------- Căn chỉnh font (override template QT02 khi -Font/-FontSize/-HxFont/-HxSize) ----------
function Set-HeadingStyle([string]$xml,[string]$styleId,[string]$hfont,[int]$hsize,[bool]$bold,[string]$align){   # vá riêng 1 style (cỡ/font/bold/căn lề), không đụng style khác
  $rx=[regex]("(?s)<w:style [^>]*w:styleId=`"$styleId`".*?</w:style>")
  return $rx.Replace($xml,{ param($m)
    $blk=$m.Value
    if($hsize -gt 0){ $hp=$hsize*2
      $blk=[regex]::Replace($blk,'<w:sz w:val="\d+"',('<w:sz w:val="'+$hp+'"'))
      $blk=[regex]::Replace($blk,'<w:szCs w:val="\d+"',('<w:szCs w:val="'+$hp+'"')) }
    if($hfont -ne ''){ $blk=[regex]::Replace($blk,'(w:(?:ascii|eastAsia|hAnsi|cs)=")[^"]*"',('${1}'+$hfont+'"')) }
    if($bold -and ($blk -notmatch '<w:b\s*/>')){   # thêm bold ĐÚNG thứ tự schema CT_RPr (sau rFonts; nếu không có rFonts thì ngay sau <w:rPr>)
      if($blk -match '<w:rFonts[^>]*/>'){ $blk=[regex]::Replace($blk,'(<w:rFonts[^>]*/>)','${1}<w:b/><w:bCs/>',1) }
      else { $blk=[regex]::Replace($blk,'(<w:rPr>)','${1}<w:b/><w:bCs/>',1) }
    }
    if($align -ne ''){                                                                                              # đặt căn lề trong pPr
      if($blk -match '<w:jc [^>]*/>'){ $blk=[regex]::Replace($blk,'<w:jc w:val="[^"]*"',('<w:jc w:val="'+$align+'"')) }
      else { $blk=[regex]::Replace($blk,'(<w:pPr>)',('${1}<w:jc w:val="'+$align+'"/>'),1) }
    }
    $blk
  },1)
}
if(($Font -ne 'Times New Roman') -or ($FontSize -gt 0) -or ($TitleSize -gt 0) -or ($TitleAlign -ne '') -or ($H1Size -gt 0) -or ($H2Size -gt 0) -or ($H3Size -gt 0) -or ($H1Font -ne '') -or ($H2Font -ne '') -or ($H3Font -ne '') -or $H1Bold -or $H2Bold -or $H3Bold -or ($H1Align -ne '') -or ($H2Align -ne '') -or ($H3Align -ne '')){
  foreach($part in 'word/styles.xml','word/theme/theme1.xml'){
    $pe=$zip.GetEntry($part); if(-not $pe){ continue }
    $psr=New-Object System.IO.StreamReader($pe.Open()); $pc=$psr.ReadToEnd(); $psr.Close()
    if($Font -ne 'Times New Roman'){ $pc=$pc.Replace('Times New Roman',$Font) }   # đổi font family toàn cục (giữ Consolas cho code)
    if($part -eq 'word/styles.xml'){
      if($FontSize -gt 0){                                                         # cỡ body trong docDefaults (half-point)
        $hp=$FontSize*2
        $pc=[regex]::Replace($pc,'(<w:rPrDefault>[\s\S]*?<w:sz w:val=")\d+("[\s\S]*?</w:rPrDefault>)',('${1}'+$hp+'${2}'))
        $pc=[regex]::Replace($pc,'(<w:rPrDefault>[\s\S]*?<w:szCs w:val=")\d+("[\s\S]*?</w:rPrDefault>)',('${1}'+$hp+'${2}'))
      }
      if(($TitleSize -gt 0) -or ($TitleAlign -ne '')){ $pc=Set-HeadingStyle $pc 'Title' '' $TitleSize $false $TitleAlign }   # style Title (tiêu đề tài liệu qua title block pandoc)
      if(($H1Size -gt 0) -or ($H1Font -ne '') -or $H1Bold -or ($H1Align -ne '')){ $pc=Set-HeadingStyle $pc 'Heading1' $H1Font $H1Size ([bool]$H1Bold) $H1Align }   # Heading 1 (nội dung cấp 1 thật)
      if(($H2Size -gt 0) -or ($H2Font -ne '') -or $H2Bold -or ($H2Align -ne '')){ $pc=Set-HeadingStyle $pc 'Heading2' $H2Font $H2Size ([bool]$H2Bold) $H2Align }   # Word Heading2 (= mục lớn I, II)
      if(($H3Size -gt 0) -or ($H3Font -ne '') -or $H3Bold -or ($H3Align -ne '')){ $pc=Set-HeadingStyle $pc 'Heading3' $H3Font $H3Size ([bool]$H3Bold) $H3Align }   # Word Heading3 (= mục con I.1, I.2)
    }
    $pe.Delete(); $ne2=$zip.CreateEntry($part); $psw=New-Object System.IO.StreamWriter($ne2.Open(),$utf8); $psw.Write($pc); $psw.Close()
  }
}
$zip.Dispose()

# ---------- QC ----------
function Get-Part($zip,$p){ $e=$zip.GetEntry($p); if(-not $e){return ''}; $sr=New-Object System.IO.StreamReader($e.Open()); $t=$sr.ReadToEnd(); $sr.Close(); $t }
$z=[System.IO.Compression.ZipFile]::OpenRead($outDocx); $names=$z.Entries.FullName
$xml=Get-Part $z 'word/document.xml'; $styles=Get-Part $z 'word/styles.xml'; $theme=Get-Part $z 'word/theme/theme1.xml'
$txt=[System.Net.WebUtility]::HtmlDecode(([regex]::Replace(([regex]::Replace($xml,'</w:p>',"`n")),'<[^>]+>','')))
$allowedFonts = @($Font,$H1Font,$H2Font,'Consolas') | Where-Object { $_ -ne '' }
$badFonts = ([regex]::Matches($styles,'w:ascii="([^"]+)"') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique) | Where-Object { $allowedFonts -notcontains $_ }
$qc=[ordered]@{
  'OPC forward-slash (no backslash)' = (-not ($names -match '\\'))
  'logo + header + footer present'   = (($names -contains 'word/media/logo.png') -and ($names -contains 'word/header1.xml') -and ($names -contains 'word/footer1.xml'))
  'PNG content-type'                 = ((Get-Part $z '[Content_Types].xml') -match 'Extension="png"')
  'TOC field'                        = ($(if($NoToc){-not (([regex]'TOC \\o').Matches($xml).Count -ge 1)}else{(([regex]'TOC \\o').Matches($xml).Count -ge 1)}))
  'title style present'              = (([regex]'<w:pStyle w:val="Title"').Matches($xml).Count -ge 1)
  'no .md leak'                      = (([regex]'\.md\b').Matches($txt).Count -eq 0)
  'no markdown link ]('             = (([regex]'\]\(').Matches($txt).Count -eq 0)
  'no filename slug'                 = (([regex]'phan-he|wireframe-overview|tien-do-ncc|thiet-bi-iot').Matches($txt).Count -eq 0)
  'no YAML key leak'                 = (([regex]'document_type:|source_template:|^project:\s*"').Matches($txt).Count -eq 0)
  'FONT = Times New Roman only (+Consolas code)' = (($theme -match 'minorFont[\s\S]*?Times New Roman') -and (([regex]'Aptos|Calibri|Cambria').Matches($styles+$theme).Count -eq 0) -and (-not $badFonts))
  'XML well-formed'                  = $true
}
if($Formal){ foreach($k in @($qc.Keys)){ if($k -match 'arrow in prose|non-technical EN|residual backtick'){ $qc.Remove($k) } } }   # tài liệu yêu cầu: chỉ nới QC mũi tên/tiếng Anh/backtick (mã BR, ví dụ "VNA893 → A893" là nội dung hợp lệ); VẪN giữ QC gỡ OID/nội bộ/ASR
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
