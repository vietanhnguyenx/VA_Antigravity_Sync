<#
.SYNOPSIS
  Kiểm tra/tra cứu thuật ngữ chuyên ngành trong domain-knowledge + glossary của TOSS.
.DESCRIPTION
  Hai chế độ:
  1) TRA CỨU thuật ngữ:  -Term "AOG","NOTOC"  → mỗi từ: có trong GLOSSARY chưa? + số lần XUẤT HIỆN trong domain-knowledge (file:line).
  2) AUDIT tài liệu:      -AuditFile spec.md   → trích các viết tắt [A-Z]{2,6} trong file, báo từ nào CHƯA có trong glossary (gap độ phủ).
  Mục tiêu: bám domain-knowledge; không có thì báo "không tìm thấy" (không bịa định nghĩa).
.EXAMPLE
  .\find-term.ps1 -Term "AOG","loadsheet","briefing"
.EXAMPLE
  .\find-term.ps1 -AuditFile ba/workspace/drafts/srs/03-dac-ta-chuc-nang/quan-ly-tau-bay.md
.NOTES
  Glossary chính: ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md
  Thuật ngữ BA song ngữ: .claude/glossary/ba-terms-vi-en.md
#>
param(
  [string[]]$Term = @(),
  [string]$AuditFile = "",
  [string]$KnowledgeDir = "ba/workspace/input/domain-knowledge",
  [string]$Glossary = "ba/workspace/input/domain-knowledge/toss-glossary-v0.1.md",
  [string]$BaTerms = ".claude/glossary/ba-terms-vi-en.md"
)
$ErrorActionPreference='Stop'

# Gom nguồn glossary
$glossFiles = @($Glossary,$BaTerms) | Where-Object { Test-Path $_ }
$glossText  = ($glossFiles | ForEach-Object { Get-Content -LiteralPath $_ -Raw -Encoding UTF8 }) -join "`n"
# File nội dung domain-knowledge (.md), BỎ các file danh mục link (chỉ là list, không phải định nghĩa)
$allMd  = Get-ChildItem $KnowledgeDir -Recurse -Filter *.md -ErrorAction SilentlyContinue
# Bỏ: danh mục link, bản _full (đã có sec-*.md), và INDEX (chỉ là mục lục)
$kFiles = $allMd | Where-Object { $_.Name -notmatch 'pdf-links|definitions-links|-links' -and $_.Name -ne '_full.md' -and $_.Name -ne 'INDEX.md' }
# File danh mục LINK (tra cứu lớp 2 khi knowledge base không có)
$linkFiles = $allMd | Where-Object { $_.Name -match 'pdf-links|definitions-links|-links' }

function Check-One([string]$t, [bool]$CaseSensitive=$false){
  $esc = [regex]::Escape($t)
  # Định nghĩa trong glossary = xuất hiện DẠNG ĐẬM **term** (bảng glossary dùng **TERM**)
  $inGloss = [regex]::IsMatch($glossText, "\*\*\s*$esc\b", 'IgnoreCase')
  # Xuất hiện (mention) trong domain-knowledge — KHỚP ĐÚNG TỪ (word-boundary) để bớt nhiễu chuỗi con
  $hits = @()
  $opt = @{}; if($CaseSensitive){ $opt['CaseSensitive']=$true }
  foreach($f in $kFiles){
    $m = Select-String -LiteralPath $f.FullName -Pattern "\b$esc\b" @opt -ErrorAction SilentlyContinue
    foreach($x in $m){ $hits += [pscustomobject]@{ File=$f.FullName; Line=$x.LineNumber; Text=$x.Line.Trim() } }
  }
  # LỚP 2: tra trong danh mục LINK tài liệu (tên/tiêu đề tài liệu liên quan)
  $linkHits = @()
  foreach($f in $linkFiles){
    $m = Select-String -LiteralPath $f.FullName -Pattern "\b$esc\b" @opt -ErrorAction SilentlyContinue
    foreach($x in $m){ $linkHits += [pscustomobject]@{ File=$f.FullName; Line=$x.LineNumber; Text=$x.Line.Trim() } }
  }
  [pscustomobject]@{ Term=$t; InGlossary=$inGloss; MentionCount=$hits.Count; Hits=$hits; LinkCount=$linkHits.Count; LinkHits=$linkHits }
}

if($AuditFile -ne ''){
  if(-not (Test-Path $AuditFile)){ throw "Không thấy file audit: $AuditFile" }
  $body = Get-Content -LiteralPath $AuditFile -Raw -Encoding UTF8
  $acr = [regex]::Matches($body,'\b[A-Z]{2,6}\b') | ForEach-Object { $_.Value } | Sort-Object -Unique
  Write-Output "=== AUDIT độ phủ thuật ngữ: $AuditFile ==="
  Write-Output ("Viết tắt phát hiện: {0}" -f $acr.Count)
  $rows = foreach($a in $acr){ $r = Check-One $a $true; [pscustomobject]@{ 'Viết tắt'=$a; 'Trong glossary'=$(if($r.InGlossary){'CÓ'}else{'— THIẾU'}); 'Mentions'=$r.MentionCount; 'Link'=$r.LinkCount } }
  $rows | Format-Table -AutoSize
  $miss = ($rows | Where-Object { $_.'Trong glossary' -ne 'CÓ' }).'Viết tắt'
  Write-Output ("`nTHIẾU trong glossary ({0}): {1}" -f $miss.Count, ($miss -join ', '))
  return
}

if($Term.Count -eq 0){ throw "Cần -Term <từ>[,<từ>...] hoặc -AuditFile <file.md>" }
foreach($t in $Term){
  $r = Check-One $t
  Write-Output "===== $t ====="
  Write-Output ("Glossary : {0}" -f $(if($r.InGlossary){'CÓ định nghĩa'}else{'CHƯA có (chưa định nghĩa)'}))
  Write-Output ("Mentions : {0} lần trong domain-knowledge" -f $r.MentionCount)
  if($r.MentionCount -gt 0){
    $r.Hits | Select-Object -First 5 | ForEach-Object {
      Write-Output ("  - {0}:{1}  {2}" -f ($_.File -replace '.*domain-knowledge[\\/]',''), $_.Line, ($_.Text.Substring(0,[Math]::Min(90,$_.Text.Length))))
    }
    if($r.MentionCount -gt 5){ Write-Output ("  ... (+{0} kết quả nữa)" -f ($r.MentionCount-5)) }
  } else {
    Write-Output "  => KHÔNG TÌM THẤY trong knowledge base."
    # LỚP 2: tra trong danh mục link tài liệu
    Write-Output ("Trong danh mục LINK: {0} tài liệu liên quan" -f $r.LinkCount)
    if($r.LinkCount -gt 0){
      $r.LinkHits | Select-Object -First 5 | ForEach-Object {
        Write-Output ("  ~ {0}:{1}  {2}" -f ($_.File -replace '.*domain-knowledge[\\/]',''), $_.Line, ($_.Text.Substring(0,[Math]::Min(110,$_.Text.Length))))
      }
      if($r.LinkCount -gt 5){ Write-Output ("  ... (+{0} link nữa)" -f ($r.LinkCount-5)) }
    } else {
      Write-Output "  => Cũng KHÔNG có trong danh mục link."
    }
  }
  Write-Output ""
}
