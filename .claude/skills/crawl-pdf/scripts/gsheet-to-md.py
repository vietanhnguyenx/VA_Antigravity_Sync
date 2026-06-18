#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
gsheet-to-md.py — Pull một Google Sheet NATIVE về Markdown (mỗi tab = 1 section).

Service Account đọc-only, key ở .secrets/ (gitignore). Chạy ở máy → 0 token.
Bản .md là trích trung thực (CLAUDE.md §0). Frontmatter ghi version/modifiedTime/user
để các lần sau đối soát (xem --check + gdrive-reconcile.py).

Cài: python -m pip install --user gspread google-auth
Dùng:
  python gsheet-to-md.py <id|url> <out.md> [--key .secrets/toss-sa.json] [--title "Tên"]
  python gsheet-to-md.py <id|url> <out.md> --check     # chỉ báo đổi/chưa, không tải
"""
import sys, os, argparse
import gdrive_common as gc

try:
    import gspread
    from google.oauth2.service_account import Credentials
except ImportError:
    sys.exit("Thiếu thư viện: python -m pip install --user gspread google-auth")

SHEET_SCOPES = ["https://www.googleapis.com/auth/spreadsheets.readonly"]

def esc(v):
    return str(v).replace("\r\n", " ").replace("\n", " ").replace("|", "\\|").strip()

def ws_to_md(ws):
    rows = ws.get_all_values()
    while rows and all(c.strip() == "" for c in rows[-1]):
        rows.pop()
    if not rows:
        return f"## {ws.title}\n\n*(sheet rỗng)*\n"
    ncol = max(len(r) for r in rows)
    pad = lambda r: r + [""] * (ncol - len(r))
    out = [f"## {ws.title}", "", "| " + " | ".join(esc(c) for c in pad(rows[0])) + " |", "|" + "---|" * ncol]
    for r in rows[1:]:
        out.append("| " + " | ".join(esc(c) for c in pad(r)) + " |")
    out.append("")
    return "\n".join(out)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("sheet"); ap.add_argument("out")
    ap.add_argument("--key", default=gc.DEFAULT_KEY)
    ap.add_argument("--title", default="")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    fid = gc.extract_id(a.sheet)

    if a.check:
        sys.exit(0 if not gc.check(fid, a.out, a.key) else 0)

    tok = gc.token(a.key)
    meta = gc.get_meta(fid, tok)
    user, _ = gc.last_revision(fid, tok)

    creds = Credentials.from_service_account_file(a.key, scopes=SHEET_SCOPES)
    gs = gspread.authorize(creds)
    try:
        sh = gs.open_by_key(fid)
    except gspread.exceptions.APIError as e:
        sys.exit(f"Lỗi mở sheet (file Office? đã Share cho SA chưa?): {e}")

    name = a.title or meta.get("name", sh.title)
    parts = [gc.frontmatter(fid, name, meta, user, "Google Sheet")]
    parts += [ws_to_md(ws) for ws in sh.worksheets()]
    os.makedirs(os.path.dirname(os.path.abspath(a.out)), exist_ok=True)
    with open(a.out, "w", encoding="utf-8") as f:
        f.write("\n".join(parts))
    print(f"[OK] {a.out}  ({len(sh.worksheets())} tab, version {meta.get('version')})")

if __name__ == "__main__":
    main()
