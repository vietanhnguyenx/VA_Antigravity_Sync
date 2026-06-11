<#
.SYNOPSIS
  Split các .md trong knowledge base theo NỘI DUNG (mục/chương/heading) + index, giảm token đọc/truy xuất.
.DESCRIPTION
  Tự nhận loại theo tên + nội dung:
   - ICAO Annex (tên icao-annex hoặc có >=3 'CHAPTER N.') -> cắt theo CHAPTER/APPENDIX.
   - Markdown (>=6 heading '## ') -> cắt theo heading cấp 2.
   - Còn lại -> 'num': cắt theo mục cấp 1 đánh số (CFR §/Subpart dùng resplit-cfr.ps1 riêng, file faa-14cfr bị loại tại đây).
  Mỗi tài liệu -> `<ten>_parts/sec-NN-*.md` + index `<ten>.md` (thay monolith) + `_parts/_full.md` (dự phòng).
  Bỏ qua: *-links*, README, glossary, preflight-reference, INDEX, faa-14cfr, file < -MinKB.
.EXAMPLE
  .\split-kb-by-content.ps1 -MinKB 45
.NOTES
  Chỉ TÁCH text trung thực (không sửa nội dung). Đã có BOM cho PS 5.1.
#>
param(
  [string]$Root = "ba/workspace/input/domain-knowledge",
  [int]$MinKB = 45
)
$ErrorActionPreference='Stop'
$utf8 = New-Object System.Text.UTF8Encoding($true)

function Slugify($s){
  $x = ($s -replace '[^\w\- ]','' -replace '\s+','-').ToLower().Trim('-')
  if($x.Length -gt 40){ $x = $x.Substring(0,40).Trim('-') }
  if([string]::IsNullOrWhiteSpace($x)){ $x = 'section' }
  return $x
}
function Short($t){ ($t.Trim() -replace '\.\s.*$','' -replace '\s{2,}.*$','').Trim() }

function Get-Cuts([string[]]$lines, [string]$type){
  $cuts = New-Object System.Collections.Generic.List[object]
  if($type -eq 'annex'){
    for($i=0;$i -lt $lines.Count;$i++){
      $ln=$lines[$i]; if($ln -match '\.{4,}'){ continue }
      if($ln -cmatch '^\s*CHAPTER\s+(\d+)\.\s*(.*)$'){ $cuts.Add(@{Line=$i;Title=("Chapter $($matches[1]) — " + (Short $matches[2]))}) }
      elseif($ln -cmatch '^\s*APPENDIX\s+(\d+)\b(.*)$'){ $cuts.Add(@{Line=$i;Title=("Appendix $($matches[1]) " + (Short $matches[2]))}) }
    }
  } elseif($type -eq 'md'){
    $l3 = ($lines | Where-Object { $_ -match '^###\s' }).Count
    $hpat = if($l3 -ge 6){'^###\s+(.+)$'} else {'^##\s+(.+)$'}
    for($i=0;$i -lt $lines.Count;$i++){
      if($lines[$i] -match $hpat){
        $t=$matches[1].Trim()
        if($t -notmatch '^(Table of Contents|Mục lục|Foreword)$'){ $cuts.Add(@{Line=$i;Title=$t}) }
      }
    }
  } else {  # num
    $curTop=$null
    for($i=0;$i -lt $lines.Count;$i++){
      $ln=$lines[$i]; if($ln -match '\.{4,}'){ continue }
      if($ln -match '^\s*(\d{1,2})\s+([A-Z][A-Z].{3,})$' -or $ln -match '^\s*(\d{1,2})\s{2,}([A-Z].{3,})$'){
        $top=$matches[1]
        if($top -ne $curTop){ $curTop=$top; $cuts.Add(@{Line=$i;Title=("$top " + (Short $matches[2]))}) }
      }
    }
  }
  return ,$cuts
}

$files = Get-ChildItem $Root -Recurse -Filter *.md | Where-Object {
  $_.Name -notmatch 'links|README|glossary|preflight-reference|faa-14cfr' -and $_.Name -ne 'INDEX.md' -and
  $_.Length/1KB -ge $MinKB -and $_.FullName -notmatch '_parts'
}
$summary = New-Object System.Collections.Generic.List[object]
foreach($f in $files){
  $lines = Get-Content -LiteralPath $f.FullName -Encoding UTF8
  $content = $lines -join "`n"
  $type = if($f.Name -match 'icao-annex' -or ([regex]::Matches($content,'(?m)^\s*CHAPTER\s+\d+\.')).Count -ge 3){'annex'}
          elseif((($lines | Where-Object { $_ -match '^#{2,3}\s' }).Count) -ge 8){'md'}
          else {'num'}
  $cuts = Get-Cuts $lines $type
  if($cuts.Count -lt 3){ $summary.Add([pscustomobject]@{File=$f.Name;Type=$type;Sections=$cuts.Count;Note='BỎ QUA (ít mốc)'}); continue }
  $base = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
  $partDir = Join-Path $f.DirectoryName "${base}_parts"
  New-Item -ItemType Directory -Force $partDir | Out-Null
  Copy-Item $f.FullName (Join-Path $partDir "_full.md") -Force
  $docTitle = ($lines | Where-Object { $_ -match '^#\s' } | Select-Object -First 1) -replace '^#\s*',''
  if(-not $docTitle){ $docTitle = $base }
  $idx = New-Object System.Text.StringBuilder
  [void]$idx.AppendLine("---"); [void]$idx.AppendLine("document_type: `"Knowledge Index — $docTitle (chia theo nội dung)`""); [void]$idx.AppendLine("date: `"2026-06-09`""); [void]$idx.AppendLine("---"); [void]$idx.AppendLine("")
  [void]$idx.AppendLine("# $docTitle — MỤC LỤC (chia theo nội dung, $type)"); [void]$idx.AppendLine("")
  [void]$idx.AppendLine("> Chia thành **$($cuts.Count) mục** để đọc/truy xuất tiết kiệm token. Bản đầy đủ: ``${base}_parts/_full.md``."); [void]$idx.AppendLine("")
  [void]$idx.AppendLine("| # | Mục | File |"); [void]$idx.AppendLine("|---|---|---|")
  for($c=0;$c -lt $cuts.Count;$c++){
    $start=$cuts[$c].Line; $end = if($c -lt $cuts.Count-1){$cuts[$c+1].Line-1}else{$lines.Count-1}
    $slug = Slugify $cuts[$c].Title; $pn='{0:D2}' -f ($c+1); $partName="sec-$pn-$slug.md"
    $body = ($lines[$start..$end] -join "`n")
    $ph = "> **Nguồn:** $docTitle · Mục: $($cuts[$c].Title) · (phần $($c+1)/$($cuts.Count))`n> Trích từ ``_full.md``. Đối chiếu PDF gốc khi cần.`n`n---`n`n"
    [System.IO.File]::WriteAllText((Join-Path $partDir $partName), ($ph+$body), $utf8)
    [void]$idx.AppendLine(("| {0} | {1} | ``{2}/{3}`` |" -f ($c+1), $cuts[$c].Title, "${base}_parts", $partName))
  }
  [System.IO.File]::WriteAllText($f.FullName, $idx.ToString(), $utf8)
  $summary.Add([pscustomobject]@{File=$f.Name;Type=$type;Sections=$cuts.Count;Note="-> ${base}_parts/"})
}
$summary | Format-Table -AutoSize