#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
gdrive-to-md.py — Pull một file trên Google Drive về Markdown (qua Service Account).

Xử lý CẢ HAI loại:
  - File Office upload lên Drive (xlsx/docx/pptx)  → tải thô (alt=media) → markitdown
  - Google native (Sheet/Doc/Slide)               → export sang xlsx/docx/pptx → markitdown

Đọc-only. Key JSON ở .secrets/ (đã gitignore). Chạy ở máy → 0 token mô hình.
Bản .md là trích trung thực (CLAUDE.md §0).

Cài: python -m pip install --user gspread google-auth markitdown[all]
Dùng:
  python gdrive-to-md.py <file_id|url> <out.md> [--key .secrets/toss-sa.json]
Cấp quyền: Share file cho client_email của service account (Viewer).
"""
import sys, os, re, json, argparse, tempfile, subprocess, datetime

try:
    from google.oauth2.service_account import Credentials
    from google.auth.transport.requests import Request
    import requests
except ImportError:
    sys.exit("Thiếu thư viện: python -m pip install --user google-auth requests")

SCOPES = ["https://www.googleapis.com/auth/drive.readonly"]
# native Google → định dạng export + đuôi file
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

def extract_id(s):
    if "/d/" in s:
        return s.split("/d/", 1)[1].split("/", 1)[0]
    return s.strip()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("file"); ap.add_argument("out")
    ap.add_argument("--key", default=".secrets/toss-sa.json")
    a = ap.parse_args()
    if not os.path.exists(a.key):
        sys.exit(f"Không thấy key: {a.key}")

    creds = Credentials.from_service_account_file(a.key, scopes=SCOPES)
    creds.refresh(Request())
    hdr = {"Authorization": f"Bearer {creds.token}"}
    fid = extract_id(a.file)

    m = requests.get(f"https://www.googleapis.com/drive/v3/files/{fid}",
                     params={"fields": "id,name,mimeType,size"}, headers=hdr, timeout=30)
    if m.status_code != 200:
        sys.exit(f"Lỗi đọc metadata (Drive API bật chưa? Đã Share cho SA chưa?): {m.status_code} {m.text[:300]}")
    meta = m.json()
    name, mime = meta["name"], meta["mimeType"]

    if mime in EXPORT:                       # native Google → export
        exp_mime, ext = EXPORT[mime]
        dl = requests.get(f"https://www.googleapis.com/drive/v3/files/{fid}/export",
                          params={"mimeType": exp_mime}, headers=hdr, timeout=120)
    else:                                    # file Office/PDF upload → tải thô
        ext = EXT.get(mime, os.path.splitext(name)[1] or ".bin")
        dl = requests.get(f"https://www.googleapis.com/drive/v3/files/{fid}",
                          params={"alt": "media"}, headers=hdr, timeout=120)
    if dl.status_code != 200:
        sys.exit(f"Lỗi tải file: {dl.status_code} {dl.text[:300]}")

    tmp = os.path.join(tempfile.gettempdir(), f"gdrive_{fid}{ext}")
    with open(tmp, "wb") as f:
        f.write(dl.content)

    tmp_md = tmp + ".md"
    r = subprocess.run([sys.executable, "-m", "markitdown", "-o", tmp_md, "--", tmp],
                       capture_output=True, text=True)
    if r.returncode != 0 or not os.path.exists(tmp_md):
        sys.exit(f"markitdown lỗi: {r.stderr[:300]}")
    with open(tmp_md, encoding="utf-8") as f:
        body = f.read()

    today = datetime.date.today().isoformat()
    fm = (
        "---\n"
        f'source_gdrive: "https://docs.google.com/spreadsheets/d/{fid}"\n'
        f'source_name: "{name}"\n'
        f'document_type: "Google Drive → MD (Drive API + markitdown, read-only)"\n'
        f'pulled: "{today}"\n'
        'status: "Raw pull — chưa biên tập"\n'
        "---\n\n"
        f"> **Nguồn (Google Drive, live):** {name} — https://drive.google.com/file/d/{fid}  \n"
        f"> Pull {today} bằng `gdrive-to-md.py`. Bản người-đọc = mở trực tiếp file gốc trên Drive.\n\n"
    )
    os.makedirs(os.path.dirname(os.path.abspath(a.out)), exist_ok=True)
    with open(a.out, "w", encoding="utf-8") as f:
        f.write(fm + body)
    try:
        os.remove(tmp); os.remove(tmp_md)
    except OSError:
        pass
    print(f"[OK] {a.out}  (nguồn: {name}, {mime})")

if __name__ == "__main__":
    main()
