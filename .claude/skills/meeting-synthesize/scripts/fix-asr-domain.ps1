<#
.SYNOPSIS
  Post-processing transcript ASR: tự sửa lỗi thuật ngữ domain (cải thiện WER) theo từ điển.
.DESCRIPTION
  Đọc transcript (1+ file), áp từ điển sửa lỗi (mặc định assets/asr-domain-corrections.txt),
  thay thế theo CỤM, KHÔNG phân biệt hoa/thường. Xuất file đã sửa + BÁO CÁO số lần sửa từng cụm
  (minh bạch — không sửa âm thầm). KHÔNG cải thiện lỗi ASR ngoài từ điển; cụm nhập nhằng để agent
  gắn cờ [cần xác nhận].
.EXAMPLE
  .\fix-asr-domain.ps1 -In part1_00-64min.txt,part2_64min-end.txt -Out meeting_08062026_fixed.txt
.EXAMPLE
  .\fix-asr-domain.ps1 -In meeting.srt -Out meeting_fixed.srt -Dict my-corrections.txt
.NOTES
  Chạy TRƯỚC khi agent đọc transcript để tổng hợp (giảm lỗi domain agent phải tự map).
  Từ điển mở rộng được — thêm cặp 'sai ||| đúng' khi gặp lỗi mới.
#>
param(
  [Parameter(Mandatory=$true)][string[]]$In,
  [Parameter(Mandatory=$true)][string]$Out,
  [string]$Dict = ""
)
$ErrorActionPreference='Stop'
if($Dict -eq ''){ $Dict = Join-Path $PSScriptRoot '..\assets\asr-domain-corrections.txt' }
if(-not (Test-Path $Dict)){ throw "Không thấy từ điển: $Dict" }

# Nạp cặp sai|||đúng
$pairs = @()
foreach($line in (Get-Content -LiteralPath $Dict -Encoding UTF8)){
  $t = $line.Trim()
  if($t -eq '' -or $t.StartsWith('#')){ continue }
  if($t -match '\|\|\|'){ $p = $t -split '\s*\|\|\|\s*',2; $pairs += [pscustomobject]@{Wrong=$p[0].Trim(); Right=$p[1].Trim(); Count=0} }
}
# Ưu tiên cụm DÀI trước (tránh cụm ngắn nuốt cụm dài)
$pairs = $pairs | Sort-Object { $_.Wrong.Length } -Descending

# Gộp nội dung các file
$text = (($In | ForEach-Object { if(Test-Path $_){ Get-Content -LiteralPath $_ -Raw -Encoding UTF8 } else { Write-Output "BỎ QUA (không thấy): $_" | Out-Host; '' } }) -join "`n")

# Áp thay thế (case-insensitive, literal cụm)
foreach($p in $pairs){
  $rx = [regex]::new([regex]::Escape($p.Wrong), 'IgnoreCase')
  $m = $rx.Matches($text)
  if($m.Count -gt 0){ $p.Count = $m.Count; $text = $rx.Replace($text, $p.Right) }
}

$utf8 = New-Object System.Text.UTF8Encoding($true)   # BOM để PS/Word đọc đúng tiếng Việt
[System.IO.File]::WriteAllText($Out, $text, $utf8)

# Báo cáo
$applied = $pairs | Where-Object { $_.Count -gt 0 } | Sort-Object Count -Descending
$total = ($applied | Measure-Object Count -Sum).Sum
Write-Output "WROTE: $Out"
Write-Output ("Tổng số lỗi domain đã sửa: {0} (trên {1} cụm trong từ điển)" -f ([int]$total), $pairs.Count)
if($applied){ $applied | Select-Object @{n='Sai';e={$_.Wrong}}, @{n='Đúng';e={$_.Right}}, @{n='Số lần';e={$_.Count}} | Format-Table -AutoSize }
else { Write-Output "(không có cụm nào khớp)" }
