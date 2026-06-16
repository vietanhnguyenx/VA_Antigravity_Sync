#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
gsheet-to-md.py — Pull một Google Sheet về Markdown (mỗi worksheet/tab = 1 section).

Dùng Service Account (đọc-only): key JSON đặt ở .secrets/ (đã gitignore).
Chạy ở máy → KHÔNG tốn token mô hình. Bản .md là trích trung thực (CLAUDE.md §0).

Cài: python -m pip install --user gspread google-auth
Dùng:
  python gsheet-to-md.py <sheet_id|url> <out.md> [--key .secrets/toss-sa.json] [--title "Tên"]

Cấp quyền: Share sheet cho client_email của service account (Viewer).
"""
import sys, os, json, argparse, datetime

try:
    import gspread
    from google.oauth2.service_account import Credentials
except ImportError:
    sys.exit("Thiếu thư viện: python -m pip install --user gspread google-auth")

SCOPES = ["https://www.googleapis.com/auth/spreadsheets.readonly"]

def extract_id(s: str) -> str:
    if "docs.google.com" in s and "/d/" in s:
        return s.split("/d/", 1)[1].split("/", 1)[0]
    return s.strip()

def esc(v: str) -> str:
    return str(v).replace("\r\n", " ").replace("\n", " ").replace("|", "\\|").strip()

def ws_to_md(ws) -> str:
    rows = ws.get_all_values()
    # bỏ các hàng rỗng hoàn toàn ở cuối
    while rows and all(c.strip() == "" for c in rows[-1]):
        rows.pop()
    if not rows:
        return f"## {ws.title}\n\n*(sheet rỗng)*\n"
    ncol = max(len(r) for r in rows)
    def pad(r): return r + [""] * (ncol - len(r))
    head = pad(rows[0])
    out = [f"## {ws.title}", ""]
    out.append("| " + " | ".join(esc(c) for c in head) + " |")
    out.append("|" + "---|" * ncol)
    for r in rows[1:]:
        out.append("| " + " | ".join(esc(c) for c in pad(r)) + " |")
    out.append("")
    return "\n".join(out)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("sheet"); ap.add_argument("out")
    ap.add_argument("--key", default=".secrets/toss-sa.json")
    ap.add_argument("--title", default="")
    a = ap.parse_args()

    if not os.path.exists(a.key):
        sys.exit(f"Không thấy key: {a.key}")
    creds = Credentials.from_service_account_file(a.key, scopes=SCOPES)
    gc = gspread.authorize(creds)
    sid = extract_id(a.sheet)
    try:
        sh = gc.open_by_key(sid)
    except gspread.exceptions.APIError as e:
        sys.exit(f"Lỗi mở sheet (đã Share cho service account chưa?): {e}")

    title = a.title or sh.title
    today = datetime.date.today().isoformat()
    parts = [
        "---",
        f'source_gsheet: "https://docs.google.com/spreadsheets/d/{sid}"',
        f'document_type: "Google Sheet → MD (gspread, read-only)"',
        f'pulled: "{today}"',
        'status: "Raw pull — chưa biên tập"',
        "---",
        "",
        f"# {title}",
        "",
        f"> **Nguồn (Google Sheet, live):** https://docs.google.com/spreadsheets/d/{sid}  ",
        f"> Pull tự động {today} bằng `gsheet-to-md.py` — trích trung thực; con người mở link gốc để xem/sửa.",
        "",
    ]
    for ws in sh.worksheets():
        parts.append(ws_to_md(ws))
    os.makedirs(os.path.dirname(os.path.abspath(a.out)), exist_ok=True)
    with open(a.out, "w", encoding="utf-8") as f:
        f.write("\n".join(parts))
    print(f"[OK] {a.out}  ({len(sh.worksheets())} tab)")

if __name__ == "__main__":
    main()
