#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""gdrive_common.py — Helper dùng chung cho gsheet-to-md / gdrive-to-md / gdrive-reconcile.

Cung cấp: auth token, metadata (version/modifiedTime), revision cuối (ai/khi nào),
đọc field frontmatter của bản .md đã pull, dựng frontmatter chuẩn.
"""
import os, re, sys
try:
    from google.oauth2.service_account import Credentials
    from google.auth.transport.requests import Request
    import requests
except ImportError:
    sys.exit("Thiếu thư viện: python -m pip install --user gspread google-auth")

DRIVE_SCOPES = ["https://www.googleapis.com/auth/drive.readonly"]
DEFAULT_KEY = ".secrets/toss-sa.json"

def token(key=DEFAULT_KEY):
    if not os.path.exists(key):
        sys.exit(f"Không thấy key: {key}")
    c = Credentials.from_service_account_file(key, scopes=DRIVE_SCOPES)
    c.refresh(Request())
    return c.token

def extract_id(s):
    if "/d/" in s:
        return s.split("/d/", 1)[1].split("/", 1)[0]
    return s.strip()

def get_meta(fid, tok):
    r = requests.get(f"https://www.googleapis.com/drive/v3/files/{fid}",
                     params={"fields": "id,name,mimeType,version,modifiedTime,size"},
                     headers={"Authorization": f"Bearer {tok}"}, timeout=30)
    if r.status_code != 200:
        sys.exit(f"Lỗi metadata ({r.status_code}) — Drive API bật chưa? Share cho SA chưa?: {r.text[:200]}")
    return r.json()

def last_revision(fid, tok):
    """Trả (user, modifiedTime) của revision mới nhất; ('','') nếu không lấy được."""
    r = requests.get(f"https://www.googleapis.com/drive/v3/files/{fid}/revisions",
                     params={"fields": "revisions(id,modifiedTime,lastModifyingUser/displayName)"},
                     headers={"Authorization": f"Bearer {tok}"}, timeout=30)
    if r.status_code == 200:
        revs = r.json().get("revisions", [])
        if revs:
            last = revs[-1]
            return last.get("lastModifyingUser", {}).get("displayName", ""), last.get("modifiedTime", "")
    return "", ""

def stored_field(path, field):
    """Đọc 1 field trong YAML frontmatter của file .md đã pull (None nếu không có)."""
    if not os.path.exists(path):
        return None
    seen = 0
    with open(path, encoding="utf-8") as f:
        for line in f:
            s = line.rstrip("\n")
            if s.strip() == "---":
                seen += 1
                if seen >= 2:
                    break
                continue
            if seen == 1:
                m = re.match(rf'{re.escape(field)}:\s*"?([^"]*?)"?\s*$', s)
                if m:
                    return m.group(1)
    return None

def frontmatter(fid, name, meta, user, kind):
    """Dựng YAML frontmatter chuẩn cho bản pull (kind = 'Google Sheet' | 'Google Drive')."""
    import datetime
    today = datetime.date.today().isoformat()
    return (
        "---\n"
        f'source_gdrive: "https://docs.google.com/spreadsheets/d/{fid}"\n'
        f'source_name: "{name}"\n'
        f'document_type: "{kind} → MD (read-only)"\n'
        f'source_version: "{meta.get("version","")}"\n'
        f'source_modified: "{meta.get("modifiedTime","")}"\n'
        f'last_modifying_user: "{user}"\n'
        f'pulled: "{today}"\n'
        'status: "Raw pull — chưa biên tập"\n'
        "---\n\n"
        f"> **Nguồn ({kind}, live):** {name} — https://drive.google.com/file/d/{fid}  \n"
        f"> Pull {today} (version {meta.get('version','?')}, sửa {meta.get('modifiedTime','?')} bởi {user or '?'}).\n\n"
    )

def check(fid, out_path, key=DEFAULT_KEY):
    """Chế độ --check: in trạng thái đổi/chưa, KHÔNG tải/ghi. Trả True nếu ĐÃ đổi."""
    tok = token(key)
    meta = get_meta(fid, tok)
    user, _ = last_revision(fid, tok)
    cur = str(meta.get("version", ""))
    stored = stored_field(out_path, "source_version")
    name = meta.get("name", fid)
    if stored is None:
        print(f"[MỚI] Chưa có bản local cho '{name}'. Live version {cur}, sửa {meta.get('modifiedTime')} bởi {user or '?'}.")
        return True
    if stored == cur:
        print(f"[CHƯA ĐỔI] '{name}' version {cur} (local = live). Bỏ qua.")
        return False
    print(f"[ĐÃ ĐỔI] '{name}': local version {stored} → live {cur}. Sửa {meta.get('modifiedTime')} bởi {user or '?'}. → nên pull/reconcile.")
    return True
