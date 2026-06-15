# Convert SRS to DOCX using VTIT "viet" template (Unicode‑safe)
$pandoc = 'C:\Users\HYDRO\AppData\Local\Pandoc\pandoc.exe'
$srcOriginal = 'd:\TOSS\ba\workspace\input\domain-knowledge\srs\Bản sao của VNA.FIMS_SRS_Phase 1.docx.md'
$tempSrc = "$env:TEMP\source_srs.md"
Copy-Item -Path $srcOriginal -Destination $tempSrc -Force
$out = 'd:\TOSS\ba\workspace\input\Customer_docs\documents\VNA.FIMS_SRS_v1.0-2026-06-10_viet_mau.docx'
$ref = 'd:\TOSS\ba\workspace\input\Customer_docs\vtit_ba_documents\2_Template_BA\Template_VTIT\VTIT.VNA.FIMS_SRS_v1.0_viet mau.docx'
& $pandoc $tempSrc -o $out --reference-doc $ref
Remove-Item $tempSrc -Force
