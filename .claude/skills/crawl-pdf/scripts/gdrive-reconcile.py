#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
gdrive-reconcile.py — Đối soát một nguồn Google (Sheet/Drive) các lần TIẾP THEO.

Quy trình:
  1) Đọc version live (Drive API) vs version đã lưu trong frontmatter bản .md local.
  2) CHƯA ĐỔI → in trạng thái, dừng (không tải).
  3) ĐÃ ĐỔI → tự chọn engine (native Sheet → gsheet-to-md.py; Office trên Drive → gdrive-to-md.py),
     pull đè .md, rồi `git diff` (working vs đã commit) để in DELTA chính xác + ai/khi nào sửa.

Git là nhật ký thay đổi: diff cho cấp dòng/mục (thứ Google API không expose ở cấp ô).

Dùng:
  python gdrive-reconcile.py <id|url> <out.md> [--key .secrets/toss-sa.json] [--pull-only]
"""
import sys, os, argparse, subprocess
import gdrive_common as gc

HERE = os.path.dirname(os.path.abspath(__file__))
NATIVE = {
    "application/vnd.google-apps.spreadsheet": "gsheet-to-md.py",
    "application/vnd.google-apps.document": "gdrive-to-md.py",      # native doc → dùng gdrive (export)
    "application/vnd.google-apps.presentation": "gdrive-to-md.py",
}

def git(args, cwd):
    return subprocess.run(["git"] + args, cwd=cwd, capture_output=True, text=True, encoding="utf-8")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("file"); ap.add_argument("out")
    ap.add_argument("--key", default=gc.DEFAULT_KEY)
    ap.add_argument("--pull-only", action="store_true", help="bỏ qua git diff")
    a = ap.parse_args()
    fid = gc.extract_id(a.file)

    tok = gc.token(a.key)
    meta = gc.get_meta(fid, tok)
    user, mtime = gc.last_revision(fid, tok)
    cur = str(meta.get("version", ""))
    stored = gc.stored_field(a.out, "source_version")
    name, mime = meta.get("name", fid), meta["mimeType"]

    if stored is not None and stored == cur:
        print(f"[CHƯA ĐỔI] '{name}' version {cur} (local = live). Không cần đối soát.")
        return

    if stored is None:
        print(f"[MỚI] Chưa có bản local — pull lần đầu '{name}' (version {cur}).")
    else:
        print(f"[ĐÃ ĐỔI] '{name}': local version {stored} → live {cur}. Sửa {meta.get('modifiedTime')} bởi {user or '?'}. Đang pull…")

    engine = NATIVE.get(mime, "gdrive-to-md.py")  # mặc định: file Office trên Drive
    r = subprocess.run([sys.executable, os.path.join(HERE, engine), fid, a.out, "--key", a.key],
                       capture_output=True, text=True, encoding="utf-8")
    sys.stdout.write(r.stdout)
    if r.returncode != 0:
        sys.exit(f"Pull lỗi:\n{r.stderr[:300]}")

    if a.pull_only:
        return

    # git diff: working tree (vừa pull) vs bản đã commit
    repo = HERE
    while repo != os.path.dirname(repo) and not os.path.isdir(os.path.join(repo, ".git")):
        repo = os.path.dirname(repo)
    tracked = git(["ls-files", "--error-unmatch", a.out], repo).returncode == 0
    if not tracked:
        print(f"\n[GHI CHÚ] '{a.out}' chưa được commit → không có bản nền để diff. Commit bản này rồi lần sau reconcile sẽ ra delta.")
        return
    stat = git(["diff", "--stat", "--", a.out], repo).stdout.strip()
    diff = git(["diff", "--", a.out], repo).stdout
    if not diff.strip():
        print("\n[KHÔNG CÓ DELTA NỘI DUNG] (version đổi nhưng nội dung .md không khác — vd định dạng).")
        return
    print(f"\n=== DELTA (git diff vs bản committed) ===\n{stat}")
    print(f"--- (sửa bởi {user or '?'} lúc {mtime or meta.get('modifiedTime')}) ---\n")
    print(diff[:12000])
    if len(diff) > 12000:
        print(f"\n… (diff dài {len(diff)} ký tự — xem đầy đủ bằng: git -C \"{repo}\" diff -- \"{a.out}\")")

if __name__ == "__main__":
    main()
