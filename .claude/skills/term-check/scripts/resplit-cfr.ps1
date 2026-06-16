<#
.SYNOPSIS
  Re-extract các file CFR 14 (PDF) bằng pdftotext KHÔNG -layout (đọc tuyến tính, sạch hơn 2 cột)
  rồi chia lại theo Subpart (bỏ vùng TOC, lấy thân từ lần "Subpart A" thứ 2). Dọn sec cũ qua WSL rm.
.DESCRIPTION
  Chỉ dành cho CFR (faa-14cfr-*) vì layout 2 cột — bản -layout bị lẫn TOC. Annex/DG single-column dùng
  split-kb-by-content.ps1. Đọc PDF qua /mnt/host (chạy được cả khi đĩa WSL read-only).
.EXAMPLE
  .\resplit-cfr.ps1
#>
param(
  [string]$CfrDir = "ba/workspace/input/domain-knowledge/faa-icao-dispatcher-core"
)
$ErrorActionPreference='Stop'
$utf8 = New-Object System.Text.UTF8Encoding($true)
function Slugify($s){ $x=($s -replace '[^\w\- ]','' -replace '\s+','-').ToLower().Trim('-'); if($x.Length-gt40){$x=$x.Substring(0,40).Trim('-')}; if([string]::IsNullOrWhiteSpace($x)){$x='section'}; $x }
function To-Mnt($win){ $f=(Resolve-Path -LiteralPath $win).Path; '/mnt/host/d/' + ($f.Substring(3) -replace '\\','/') }

$pdfs = Get-ChildItem (Join-Path $CfrDir "_pdf") -Filter "faa-14cfr-*.pdf"
foreach($pf in $pdfs){
  $base = $pf.BaseName
  Write-Output "=== $base ==="
  $txt = wsl -- sh -c "pdftotext -enc UTF-8 '$(To-Mnt $pf.FullName)' - 2>/dev/null"
  $lines = $txt -split "`n"

  # mốc Subpart (bỏ dòng TOC nhiều chấm)
  $cand = New-Object System.Collections.Generic.List[object]
  for($i=0;$i -lt $lines.Count;$i++){
    if($lines[$i] -match '\.{4,}'){continue}
    if($lines[$i] -match '^\s*Subpart\s+([A-Z]{1,2})\s*—\s*(.+)$'){
      $cand.Add(@{Line=$i;Letter=$matches[1];Title=("Subpart $($matches[1]) — " + ($matches[2].Trim() -replace '\s{2,}.*$',''))}) }
  }
  if($cand.Count -lt 3){ Write-Output "  BỎ QUA (ít Subpart)"; continue }
  # thân = lần xuất hiện 'A' thứ 2 (nếu có), nếu không thì mốc đầu
  $aIdx = @(); for($k=0;$k -lt $cand.Count;$k++){ if($cand[$k].Letter -eq 'A'){ $aIdx += $k } }
  $startK = if($aIdx.Count -ge 2){ $aIdx[1] } else { 0 }
  # cuts từ startK, đổi-chữ-cái (bỏ lặp running-header)
  $cuts = New-Object System.Collections.Generic.List[object]
  $cur=$null
  for($k=$startK;$k -lt $cand.Count;$k++){
    if($k -gt $startK -and $cand[$k].Letter -eq 'A'){ break }   # 'A' lặp lại = sang Part khác (vd 121→125), dừng
    if($cand[$k].Letter -ne $cur){ $cur=$cand[$k].Letter; $cuts.Add($cand[$k]) }
  }
  Write-Output ("  Subparts thân: {0} (bắt đầu dòng {1})" -f $cuts.Count, $cuts[0].Line)

  $partDir = Join-Path $CfrDir "${base}_parts"
  New-Item -ItemType Directory -Force $partDir | Out-Null
  # dọn sec cũ + _full cũ qua WSL
  wsl -- sh -c "rm -f $(To-Mnt $partDir)/sec-*.md $(To-Mnt $partDir)/_full.md" 2>$null
  # _full mới = bản no-layout
  [System.IO.File]::WriteAllText((Join-Path $partDir "_full.md"), ($txt -join "`n"), $utf8)

  $docTitle = (($lines | Where-Object { $_ -match '^\s*PART\s+\d+' } | Select-Object -First 1)); if(-not $docTitle){ $docTitle=$base }
  $idx = New-Object System.Text.StringBuilder
  [void]$idx.AppendLine("---"); [void]$idx.AppendLine("document_type: `"Knowledge Index — $base (CFR, chia theo Subpart)`""); [void]$idx.AppendLine("date: `"2026-06-09`""); [void]$idx.AppendLine("---"); [void]$idx.AppendLine("")
  [void]$idx.AppendLine("# $base — MỤC LỤC (theo Subpart)"); [void]$idx.AppendLine("")
  [void]$idx.AppendLine("> Re-extract **no-layout** (sạch hơn 2 cột) + chia theo Subpart. Bản đầy đủ: ``${base}_parts/_full.md``."); [void]$idx.AppendLine("")
  [void]$idx.AppendLine("| # | Subpart | File |"); [void]$idx.AppendLine("|---|---|---|")
  for($c=0;$c -lt $cuts.Count;$c++){
    $start=$cuts[$c].Line; $end= if($c -lt $cuts.Count-1){$cuts[$c+1].Line-1}else{$lines.Count-1}
    $pn='{0:D2}' -f ($c+1); $slug=Slugify $cuts[$c].Title
    $partName="sec-$pn-$slug.md"
    $body=($lines[$start..$end] -join "`n")
    $ph="> **Nguồn:** $base · $($cuts[$c].Title) · (phần $($c+1)/$($cuts.Count))`n> Trích no-layout từ ``_full.md`` (pdftotext). Đối chiếu PDF gốc khi cần.`n`n---`n`n"
    [System.IO.File]::WriteAllText((Join-Path $partDir $partName), ($ph+$body), $utf8)
    [void]$idx.AppendLine(("| {0} | {1} | ``{2}/{3}`` |" -f ($c+1),$cuts[$c].Title,"${base}_parts",$partName))
  }
  [System.IO.File]::WriteAllText((Join-Path $CfrDir "$base.md"), $idx.ToString(), $utf8)
  Write-Output "  -> đã chia $($cuts.Count) Subpart"
}
Write-Output "XONG. Nhớ chạy lại generator INDEX.md."