# Convert SRS to DOCX using VTIT "trong" template (Unicode‑safe)
$pandoc = 'C:\Users\HYDRO\AppData\Local\Pandoc\pandoc.exe'
# Original markdown (contains Vietnamese characters)
$srcOriginal = 'd:\TOSS\ba\workspace\input\domain-knowledge\srs\Bản sao của VNA.FIMS_SRS_Phase 1.docx.md'
# Copy to a temporary ASCII‑only path
$tempSrc = "$env:TEMP\source_srs.md"
Copy-Item -Path $srcOriginal -Destination $tempSrc -Force
# Output DOCX path
$out = 'd:\TOSS\ba\workspace\input\Customer_docs\documents\VNA.FIMS_SRS_v1.0-2026-06-10_mau_trong.docx'
# Reference template (already renamed with concrete placeholders)
$ref = 'd:\TOSS\ba\workspace\input\Customer_docs\vtit_ba_documents\2_Template_BA\Template_VTIT\VTIT.VNA.FIMS_SRS_v1.0_mau trong.docx'
# Run Pandoc
& $pandoc $tempSrc -o $out --reference-doc $ref
# Clean up temporary file
Remove-Item $tempSrc -Force
