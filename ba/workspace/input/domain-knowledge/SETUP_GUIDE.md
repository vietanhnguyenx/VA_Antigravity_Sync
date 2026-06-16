# Setup Guide — Vietnamese ASR Transcription Pipeline

Hướng dẫn cài đặt từ đầu trên máy mới (Windows).

---

## Yêu cầu phần cứng

- CPU 4 nhân trở lên (8 nhân tối ưu)
- RAM 8GB+ (Whisper medium cần ~2GB khi chạy)
- Dung lượng trống: ~5GB (Python + model + venv)
- Không cần GPU

---

## Bước 1 — Cài đặt Python 3.11

```powershell
winget install Python.Python.3.11
```

Sau khi cài, mở PowerShell mới và kiểm tra:

```powershell
python --version   # Python 3.11.x
```

---

## Bước 2 — Cài đặt ffmpeg

```powershell
winget install Gyan.FFmpeg
```

Sau khi cài, mở PowerShell mới và kiểm tra:

```powershell
ffmpeg -version   # ffmpeg version x.x.x
```

> Nếu `winget` không có, tải thủ công tại https://ffmpeg.org/download.html → giải nén → thêm vào PATH.

---

## Bước 3 — Cài đặt Claude Code

```powershell
# Yêu cầu Node.js 18+
winget install OpenJS.NodeJS.LTS

# Cài Claude Code CLI
npm install -g @anthropic-ai/claude-code
```

Kiểm tra:

```powershell
claude --version
```

> Hoặc dùng Claude Code VSCode Extension: cài từ Extension Marketplace, tìm "Claude Code".

---

## Bước 4 — Tạo thư mục project

```powershell
# Tạo cấu trúc thư mục
New-Item -ItemType Directory -Force "C:\ASR\source"     # để audio input
New-Item -ItemType Directory -Force "C:\ASR\output"     # để transcript output
New-Item -ItemType Directory -Force "C:\ASR\scripts"    # scripts Python
New-Item -ItemType Directory -Force "C:\ASR\.claude\commands"  # Claude skills
```

> Có thể đổi `C:\ASR` thành bất kỳ đường dẫn nào, nhớ cập nhật tương ứng trong scripts.

---

## Bước 5 — Tạo Python virtual environment

```powershell
cd C:\ASR
python -m venv venv
.\venv\Scripts\Activate.ps1
```

Nếu bị lỗi execution policy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## Bước 6 — Cài dependencies

```powershell
# Chỉ cần Phase 1 để chạy được ngay
pip install faster-whisper
```

Kiểm tra:

```powershell
python -c "from faster_whisper import WhisperModel; print('OK')"
```

> Model Whisper medium (~1.5GB) tự tải về `~/.cache/huggingface/` lần đầu chạy inference.

---

## Bước 7 — Tạo CLAUDE.md

Tạo file `C:\ASR\CLAUDE.md`:

```markdown
# CLAUDE.md

## Project scope
Inference only — Vietnamese ASR using Whisper medium. No fine-tuning.

## Environment
- Python venv: C:\ASR\venv\Scripts\python.exe
- Output dir: C:\ASR\output\
- Source dir: C:\ASR\source\

## Running inference
$env:PYTHONUTF8 = "1"
& C:\ASR\venv\Scripts\python.exe -X utf8 scripts\<script>.py
```

---

## Bước 8 — Tạo Claude Code Skills

### 8a. Skill `/transcribe`

Tạo file `C:\ASR\.claude\commands\transcribe.md`:

```markdown
Transcribe an audio file (m4a/wav/mp3) to Vietnamese text using Whisper medium.

## Usage
`/transcribe <audio_file_path>`

## Steps

**1. Check input**
- `$ARGUMENTS` là đường dẫn file audio
- Formats hỗ trợ: .m4a, .wav, .mp3, .flac, .ogg

**2. Convert to WAV nếu cần**
\`\`\`powershell
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH","User")
ffmpeg -i "$ARGUMENTS" -ar 16000 -ac 1 -c:a pcm_s16le output.wav -y
\`\`\`

**3. Kiểm tra duration**
\`\`\`powershell
ffprobe -v error -show_entries format=duration -of csv=p=0 output.wav
\`\`\`

**4. Chạy Whisper**
- Dùng venv tại: C:\ASR\venv\Scripts\python.exe
- Nếu ≤ 90 phút: chạy 1 pass (xem TRANSCRIBE_GUIDE.md §4a)
- Nếu > 90 phút: silence detection → split → 2 pass → merge (xem §4b–5)
- Monitor: Get-Content <output.txt> -Tail 3 mỗi vài phút

**5. Post-processing**
Chỉ fix lỗi chính tả phổ thông. KHÔNG sửa thuật ngữ domain.

**6. Output**
Lưu tại C:\ASR\output\ với tên gốc. Báo cáo đường dẫn TXT + SRT và số segments.
```

### 8b. Skill `/check-status`

Tạo file `C:\ASR\.claude\commands\check-status.md`:

```markdown
Kiểm tra tiến độ transcription đang chạy và trạng thái các file output.

## Usage
`/check-status`
`/check-status <basename>`

## Steps

**1. Quét file txt sửa trong 24h**
\`\`\`powershell
Get-ChildItem "C:\ASR\output\*.txt" |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddHours(-24) } |
    Select-Object Name, @{N="SizeKB";E={[math]::Round($_.Length/1KB)}}, LastWriteTime |
    Sort-Object LastWriteTime -Descending
\`\`\`

**2. Đọc 3 dòng cuối + đếm dòng**
\`\`\`powershell
Get-Content "C:\ASR\output\<file>.txt" -Tail 3 -Encoding UTF8
(Get-Content "C:\ASR\output\<file>.txt" | Measure-Object -Line).Lines
\`\`\`

**3. Nếu cả part1 và part2 đều xong → gợi ý /merge-transcript <basename>**

**4. Báo cáo: timestamp cuối, số dòng, % hoàn thành, bước tiếp theo**
```

### 8c. Skill `/merge-transcript`

Tạo file `C:\ASR\.claude\commands\merge-transcript.md`:

```markdown
Merge part1 + part2 transcript files thành file đầy đủ, áp dụng spelling fix.

## Usage
`/merge-transcript <basename>`

## Steps

**1. Xác định files**
- C:\ASR\output\<basename>_part1.txt
- C:\ASR\output\<basename>_part2.txt
- Output: C:\ASR\output\<basename>.txt và .srt

**2. Đọc OFFSET_SEC từ scripts\<basename>_part2.py**

**3. Chạy merge + spelling fix**
\`\`\`python
import re, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")

PART1 = r"C:\ASR\output\<basename>_part1.txt"
PART2 = r"C:\ASR\output\<basename>_part2.txt"
OUT   = r"C:\ASR\output\<basename>.txt"
OUT_SRT = r"C:\ASR\output\<basename>.srt"
CUT_SEC = <offset_sec>

SPELLING_FIXES = [("tài hiệu", "tài liệu")]

def ts_to_sec(ts):
    h,m,s = ts.split(":"); return int(h)*3600+int(m)*60+int(s)

def parse_start(line):
    import re; m=re.match(r'^\[(\d{2}:\d{2}:\d{2})',line)
    return ts_to_sec(m.group(1)) if m else None

def load_filtered(path, min_sec=None, max_sec=None):
    lines=[]
    for line in open(path,encoding="utf-8"):
        line=line.rstrip()
        if not line: continue
        sec=parse_start(line)
        if sec is None: continue
        if min_sec and sec<min_sec: continue
        if max_sec and sec>=max_sec: continue
        for o,n in SPELLING_FIXES: line=line.replace(o,n)
        lines.append(line)
    return lines

p1=load_filtered(PART1,max_sec=CUT_SEC)
p2=load_filtered(PART2,min_sec=CUT_SEC)
all_lines=p1+p2
open(OUT,"w",encoding="utf-8").write("\n".join(all_lines))
srt=[]; 
for i,line in enumerate(all_lines,1):
    m=re.match(r'^\[(\d{2}:\d{2}:\d{2}) --> (\d{2}:\d{2}:\d{2})\]\s*(.*)',line)
    if m: srt+=[str(i),f"{m.group(1)},000 --> {m.group(2)},000",m.group(3),""]
open(OUT_SRT,"w",encoding="utf-8").write("\n".join(srt))
print(f"p1:{len(p1)} | p2:{len(p2)} | total:{len(all_lines)}")
\`\`\`

**4. Kiểm tra seam — đọc 5 dòng quanh CUT_SEC, báo nếu thấy lặp bất thường**

**5. Báo cáo: segments, đường dẫn output, thời lượng cuối**
```

---

## Bước 9 — Mở project trong Claude Code

```powershell
cd C:\ASR
claude    # CLI
# hoặc mở VSCode tại C:\ASR rồi dùng Claude Code extension
```

Sau đó có thể dùng ngay:
- `/transcribe D:\recordings\meeting.m4a`
- `/check-status`
- `/merge-transcript meeting_name`

---

## Bước 10 — Test nhanh

```powershell
# Kích hoạt venv
C:\ASR\venv\Scripts\Activate.ps1
$env:PYTHONUTF8 = "1"

# Test model load (tải ~1.5GB lần đầu)
python -X utf8 -c "
from faster_whisper import WhisperModel
m = WhisperModel('medium', device='cpu', compute_type='int8', cpu_threads=8)
print('Model loaded OK')
"
```

---

## Cấu trúc thư mục sau khi setup

```
C:\ASR\
├── .claude\
│   └── commands\
│       ├── transcribe.md        ← /transcribe skill
│       ├── check-status.md      ← /check-status skill
│       └── merge-transcript.md  ← /merge-transcript skill
├── scripts\
│   ├── whisper_inference.py     ← template 1-pass
│   └── merge_and_postprocess.py ← template merge
├── source\                      ← audio input (m4a, wav...)
├── output\                      ← transcript output (txt, srt)
├── venv\                        ← Python virtual environment
├── CLAUDE.md                    ← context cho Claude Code
├── SETUP_GUIDE.md               ← file này
└── TRANSCRIBE_GUIDE.md          ← chi tiết kỹ thuật pipeline
```

---

## Tóm tắt lệnh hay dùng

```powershell
# Kích hoạt môi trường
C:\ASR\venv\Scripts\Activate.ps1
$env:PYTHONUTF8 = "1"

# Convert audio
ffmpeg -i input.m4a -ar 16000 -ac 1 -c:a pcm_s16le output.wav -y

# Check duration
ffprobe -v error -show_entries format=duration -of csv=p=0 audio.wav

# Silence detection (tìm điểm cắt)
ffmpeg -ss <mid-300> -t 600 -i audio.wav -af "silencedetect=n=-35dB:d=0.5" -f null - 2>&1 | Select-String "silence_end"

# Monitor progress
Get-Content output\file.txt -Tail 3 -Encoding UTF8
```

---

## Lưu ý

- **Encoding**: luôn dùng `-X utf8` và `$env:PYTHONUTF8 = "1"` khi chạy Python trên Windows
- **Điểm cắt**: không cắt audio tại giây tròn — dùng silence detection để tránh hallucination
- **Domain vocab**: post-processing chỉ fix chính tả phổ thông; thuật ngữ chuyên ngành do agent riêng từng dự án xử lý
- **Đường dẫn**: thay `C:\ASR` bằng đường dẫn thực tế, cập nhật tương ứng trong CLAUDE.md và skills
