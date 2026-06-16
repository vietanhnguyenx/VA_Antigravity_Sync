#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
gdrive-to-md.py — Pull file Google Drive về Markdown (qua Service Account, đọc-only).

Xử lý CẢ HAI: file Office upload (xlsx/docx/pptx → tải thô → markitdown) và
Google native (Sheet/Doc/Slide → export → markitdown).
Key ở .secrets/ (gitignore). Chạy ở máy → 0 token. Frontmatter ghi version/modifiedTime/user.

Cài: python -m pip install --user gspread google-auth markitdown[all]
Dùng:
  python gdrive-to-md.py <id|url> <out.md> [--key .secrets/toss-sa.json]
  python gdrive-to-md.py <id|url> <out.md> --check     # chỉ báo đổi/chưa, không tải
"""
import sys, os, argparse, tempfile, subprocess
import requests
import gdrive_common as gc

EXPORT = {
    "application/vnd.google-apps.spreadsheet":
        ("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", ".xlsx"),
    "application/vnd.google-apps.document":
        ("application/vnd.openxmlformats-officedocument.wordprocessingml.document", ".docx"),
    "application/vnd.google-apps.presentation":
        ("application/vnd.openxmlformats-officedocument.presentationml.presentation", ".pptx"),
}
EXT = {
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": ".xlsx",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document": ".docx",
    "application/vnd.openxmlformats-officedocument.presentationml.presentation": ".pptx",
    "application/pdf": ".pdf",
}

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("file"); ap.add_argument("out")
    ap.add_argument("--key", default=gc.DEFAULT_KEY)
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    fid = gc.extract_id(a.file)

    if a.check:
        sys.exit(0 if not gc.check(fid, a.out, a.key) else 0)

    tok = gc.token(a.key)
    meta = gc.get_meta(fid, tok)
    user, _ = gc.last_revision(fid, tok)
    name, mime = meta["name"], meta["mimeType"]
    hdr = {"Authorization": f"Bearer {tok}"}

    if mime in EXPORT:
        exp_mime, ext = EXPORT[mime]
        dl = requests.get(f"https://www.googleapis.com/drive/v3/files/{fid}/export",
                          params={"mimeType": exp_mime}, headers=hdr, timeout=120)
    else:
        ext = EXT.get(mime, os.path.splitext(name)[1] or ".bin")
        dl = requests.get(f"https://www.googleapis.com/drive/v3/files/{fid}",
                          params={"alt": "media"}, headers=hdr, timeout=120)
    if dl.status_code != 200:
        sys.exit(f"Lỗi tải file: {dl.status_code} {dl.text[:200]}")

    tmp = os.path.join(tempfile.gettempdir(), f"gdrive_{fid}{ext}")
    with open(tmp, "wb") as f:
        f.write(dl.content)
    tmp_md = tmp + ".md"
    r = subprocess.run([sys.executable, "-m", "markitdown", "-o", tmp_md, "--", tmp],
                       capture_output=True, text=True)
    if r.returncode != 0 or not os.path.exists(tmp_md):
        sys.exit(f"markitdown lỗi: {r.stderr[:200]}")
    with open(tmp_md, encoding="utf-8") as f:
        body = f.read()

    os.makedirs(os.path.dirname(os.path.abspath(a.out)), exist_ok=True)
    with open(a.out, "w", encoding="utf-8") as f:
        f.write(gc.frontmatter(fid, name, meta, user, "Google Drive") + body)
    for p in (tmp, tmp_md):
        try: os.remove(p)
        except OSError: pass
    print(f"[OK] {a.out}  (nguồn: {name}, version {meta.get('version')})")

if __name__ == "__main__":
    main()
