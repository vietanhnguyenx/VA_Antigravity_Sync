<#
  build-reference-template.ps1 — Dựng MẪU Word (pandoc reference.docx) theo biểu mẫu Viettel QT02.BM.04.
  Chỉ cần chạy LẠI khi muốn đổi style/letterhead. Kết quả: .claude/templates/word-reference.docx

  Đặc tả (phân tích từ QT02.BM.04 thật):
    - Font: Times New Roman 12pt body; heading TNR ĐẬM ĐEN 14/13/12pt; code = Consolas (monospace).
    - Bảng: viền đen đơn 0.5pt; hàng tiêu đề nền Xám nhạt #D9D9D9 chữ đậm đen.
    - Theme latin (major+minor) = Times New Roman  (BẮT BUỘC — nếu để Aptos thì Heading3-9/Subtitle lệch font).
    - Header: logo Viettel + "Tài liệu thiết kế chi tiết · vx.x". Footer: "BM.04 · QT.TKKDL.QTDL" + Trang PAGE/NUMPAGES.
    - Đóng gói OPC bằng dấu '/' (KHÔNG dùng ZipFile::CreateFromDirectory — .NET ghi '\' làm hỏng gói).
#>
param(
  [string]$Pandoc   = "C:\Users\VTIT\AppData\Local\Pandoc\pandoc.exe",
  [string]$LogoPng  = ".claude\skills\export-word\assets\viettel-logo.png",
  [string]$OutTpl   = ".claude\templates\word-reference.docx"
)
$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$utf8=New-Object System.Text.UTF8Encoding($false)
$tmp=Join-Path $env:TEMP ("_wtpl_"+[guid]::NewGuid().ToString('N').Substring(0,8))
New-Item -ItemType Directory -Force $tmp | Out-Null
cmd /c "`"$Pandoc`" --print-default-data-file reference.docx > `"$tmp\ref.docx`""
[System.IO.Compression.ZipFile]::ExtractToDirectory("$tmp\ref.docx","$tmp\unz")
$u="$tmp\unz"

# ---- styles.xml ----
$sp="$u\word\styles.xml"; $s=Get-Content $sp -Raw -Encoding UTF8
$s=$s.Replace(
@'
      <w:rPr>
        <w:rFonts w:asciiTheme="minorHAnsi" w:eastAsiaTheme="minorEastAsia" w:hAnsiTheme="minorHAnsi" w:cstheme="minorBidi" />
        <w:sz w:val="24" />
        <w:szCs w:val="24" />
        <w:lang w:val="en-US" w:eastAsia="zh-CN" w:bidi="ar-SA" />
      </w:rPr>
'@,
@'
      <w:rPr>
        <w:rFonts w:ascii="Times New Roman" w:eastAsia="Times New Roman" w:hAnsi="Times New Roman" w:cs="Times New Roman" />
        <w:sz w:val="24" />
        <w:szCs w:val="24" />
        <w:lang w:val="vi-VN" w:eastAsia="vi-VN" w:bidi="ar-SA" />
      </w:rPr>
'@)
$s=[regex]::Replace($s,'w:asciiTheme="majorHAnsi"\s*w:eastAsiaTheme="majorEastAsia"\s*w:hAnsiTheme="majorHAnsi"\s*w:cstheme="majorBidi"','w:ascii="Times New Roman" w:eastAsia="Times New Roman" w:hAnsi="Times New Roman" w:cs="Times New Roman"')
$s=[regex]::Replace($s,'<w:color w:val="[0-9A-Fa-f]{6}"\s*w:themeColor="accent1"[^/]*/>','<w:color w:val="000000" />')
function SetSz($t,$id,$sz){ [regex]::Replace($t,'(<w:style\b[^>]*w:styleId="'+$id+'"[\s\S]*?)<w:sz w:val="\d+" />([\s\S]*?)<w:szCs w:val="\d+" />',('${1}<w:sz w:val="'+$sz+'" />${2}<w:szCs w:val="'+$sz+'" />'),1) }
$s=SetSz $s 'Heading1' 24; $s=SetSz $s 'Heading2' 24; $s=SetSz $s 'Heading3' 22
# docDefaults: body justify + line 1.5 (360) + before 6pt (120) — dung chuan QT02 Normal
$s=[regex]::Replace($s,'<w:pPrDefault>[\s\S]*?</w:pPrDefault>','<w:pPrDefault><w:pPr><w:spacing w:before="120" w:after="0" w:line="360" w:lineRule="auto" /><w:jc w:val="both" /></w:pPr></w:pPrDefault>')
if($s -notmatch '<w:pPrDefault>'){ $s=$s.Replace('</w:rPrDefault>','</w:rPrDefault><w:pPrDefault><w:pPr><w:spacing w:before="120" w:after="0" w:line="360" w:lineRule="auto" /><w:jc w:val="both" /></w:pPr></w:pPrDefault>') }
# Heading spacing QT02 (line don, can trai)
function SetHeadPPr($t,$id,$spx){ [regex]::Replace($t,'(<w:style\b[^>]*w:styleId="'+$id+'"[\s\S]*?<w:pPr>)([\s\S]*?)(</w:pPr>)',('${1}'+$spx+'${3}'),1) }
$s=SetHeadPPr $s 'Heading1' '<w:keepNext /><w:keepLines /><w:spacing w:before="360" w:after="240" w:line="240" w:lineRule="auto" /><w:jc w:val="left" /><w:outlineLvl w:val="0" />'
$s=SetHeadPPr $s 'Heading2' '<w:keepNext /><w:keepLines /><w:spacing w:before="240" w:after="120" w:line="240" w:lineRule="auto" /><w:jc w:val="left" /><w:outlineLvl w:val="1" />'
$s=SetHeadPPr $s 'Heading3' '<w:keepNext /><w:keepLines /><w:spacing w:before="180" w:after="60" w:line="240" w:lineRule="auto" /><w:jc w:val="left" /><w:outlineLvl w:val="2" />'
$newTable=@'
<w:style w:type="table" w:default="1" w:styleId="Table"><w:name w:val="Table" /><w:basedOn w:val="TableNormal" /><w:uiPriority w:val="0" /><w:tblPr><w:tblBorders><w:top w:val="single" w:sz="4" w:space="0" w:color="000000" /><w:left w:val="single" w:sz="4" w:space="0" w:color="000000" /><w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" /><w:right w:val="single" w:sz="4" w:space="0" w:color="000000" /><w:insideH w:val="single" w:sz="4" w:space="0" w:color="000000" /><w:insideV w:val="single" w:sz="4" w:space="0" w:color="000000" /></w:tblBorders><w:tblInd w:w="0" w:type="dxa" /><w:tblCellMar><w:top w:w="40" w:type="dxa" /><w:left w:w="108" w:type="dxa" /><w:bottom w:w="40" w:type="dxa" /><w:right w:w="108" w:type="dxa" /></w:tblCellMar></w:tblPr><w:tblStylePr w:type="firstRow"><w:rPr><w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:eastAsia="Times New Roman" w:cs="Times New Roman" /><w:b /><w:color w:val="000000" /></w:rPr><w:tcPr><w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" /><w:vAlign w:val="center" /></w:tcPr></w:tblStylePr></w:style>
'@
$s=[regex]::Replace($s,'<w:style w:type="table" w:default="1" w:styleId="Table">[\s\S]*?</w:style>',$newTable)
[System.IO.File]::WriteAllText($sp,$s,$utf8)

# ---- theme1.xml: latin -> Times New Roman ----
$thp="$u\word\theme\theme1.xml"; $th=Get-Content $thp -Raw -Encoding UTF8
$th=$th.Replace('typeface="Aptos Display"','typeface="Times New Roman"').Replace('typeface="Aptos"','typeface="Times New Roman"')
[System.IO.File]::WriteAllText($thp,$th,$utf8)

# ---- logo + header + footer ----
New-Item -ItemType Directory -Force "$u\word\media" | Out-Null
Copy-Item $LogoPng "$u\word\media\logo.png" -Force
$header=@'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:hdr xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"><w:p><w:pPr><w:tabs><w:tab w:val="right" w:pos="9360"/></w:tabs><w:rPr><w:sz w:val="18"/></w:rPr></w:pPr><w:r><w:drawing><wp:inline distT="0" distB="0" distL="0" distR="0"><wp:extent cx="1188720" cy="252600"/><wp:effectExtent l="0" t="0" r="0" b="0"/><wp:docPr id="1" name="Logo Viettel"/><wp:cNvGraphicFramePr><a:graphicFrameLocks noChangeAspect="1"/></wp:cNvGraphicFramePr><a:graphic><a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture"><pic:pic><pic:nvPicPr><pic:cNvPr id="1" name="logo.png"/><pic:cNvPicPr/></pic:nvPicPr><pic:blipFill><a:blip r:embed="rId1"/><a:stretch><a:fillRect/></a:stretch></pic:blipFill><pic:spPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="1188720" cy="252600"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom></pic:spPr></pic:pic></a:graphicData></a:graphic></wp:inline></w:drawing></w:r><w:r><w:tab/></w:r><w:r><w:rPr><w:b/><w:sz w:val="18"/></w:rPr><w:t>Tài liệu thiết kế chi tiết · vx.x</w:t></w:r></w:p></w:hdr>
'@
[System.IO.File]::WriteAllText("$u\word\header1.xml",$header,$utf8)
$rp='<w:rPr><w:sz w:val="16"/><w:color w:val="595959"/></w:rPr>'
$footer='<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+"`n"+'<w:ftr xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:p><w:pPr><w:pBdr><w:top w:val="single" w:sz="4" w:space="1" w:color="B5B4B4"/></w:pBdr><w:tabs><w:tab w:val="right" w:pos="9360"/></w:tabs>'+$rp+'</w:pPr><w:r>'+$rp+'<w:t>BM.04 · QT.TKKDL.QTDL</w:t></w:r><w:r><w:tab/></w:r><w:r>'+$rp+'<w:t xml:space="preserve">Trang </w:t></w:r><w:r>'+$rp+'<w:fldChar w:fldCharType="begin"/></w:r><w:r>'+$rp+'<w:instrText xml:space="preserve"> PAGE </w:instrText></w:r><w:r>'+$rp+'<w:fldChar w:fldCharType="end"/></w:r><w:r>'+$rp+'<w:t xml:space="preserve"> / </w:t></w:r><w:r>'+$rp+'<w:fldChar w:fldCharType="begin"/></w:r><w:r>'+$rp+'<w:instrText xml:space="preserve"> NUMPAGES </w:instrText></w:r><w:r>'+$rp+'<w:fldChar w:fldCharType="end"/></w:r></w:p></w:ftr>'
[System.IO.File]::WriteAllText("$u\word\footer1.xml",$footer,$utf8)
[System.IO.File]::WriteAllText("$u\word\_rels\header1.xml.rels",'<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/logo.png"/></Relationships>',$utf8)
$ctp="$u\[Content_Types].xml"; $ct=Get-Content -LiteralPath $ctp -Raw -Encoding UTF8
$ct=$ct.Replace('</Types>','<Default Extension="png" ContentType="image/png" /><Override PartName="/word/header1.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.header+xml" /><Override PartName="/word/footer1.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml" /></Types>')
[System.IO.File]::WriteAllText($ctp,$ct,$utf8)
$drp="$u\word\_rels\document.xml.rels"; $dr=Get-Content $drp -Raw -Encoding UTF8
$dr=$dr.Replace('</Relationships>','<Relationship Id="rId40" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/header" Target="header1.xml" /><Relationship Id="rId41" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer" Target="footer1.xml" /></Relationships>')
[System.IO.File]::WriteAllText($drp,$dr,$utf8)
$dp="$u\word\document.xml"; $d=Get-Content $dp -Raw -Encoding UTF8
$d=$d.Replace('<w:sectPr>','<w:sectPr><w:headerReference w:type="default" r:id="rId40" /><w:footerReference w:type="default" r:id="rId41" />')
# Kho NGANG (landscape) + le QT02
$d=$d.Replace('</w:sectPr>','<w:pgSz w:w="15840" w:h="12240" w:orient="landscape" /><w:pgMar w:top="1797" w:right="1440" w:bottom="1440" w:left="1440" w:header="720" w:footer="720" w:gutter="0" /></w:sectPr>')
[System.IO.File]::WriteAllText($dp,$d,$utf8)

# ---- Đóng gói OPC bằng dấu '/' ----
if(Test-Path $OutTpl){ [System.IO.File]::Delete($OutTpl) }
$zip=[System.IO.Compression.ZipFile]::Open($OutTpl,'Create'); $base=((Resolve-Path $u).Path.TrimEnd('\'))+'\'
Get-ChildItem $u -Recurse -File | ForEach-Object { $rel=$_.FullName.Substring($base.Length).Replace('\','/'); $e=$zip.CreateEntry($rel); $fs=$_.OpenRead(); $es=$e.Open(); $fs.CopyTo($es); $es.Close(); $fs.Close() }
$zip.Dispose()
[System.IO.Directory]::Delete($tmp,$true)
Write-Host ("Đã dựng template: " + $OutTpl + ("  ({0} KB)" -f [math]::Round((Get-Item $OutTpl).Length/1KB,1)))
