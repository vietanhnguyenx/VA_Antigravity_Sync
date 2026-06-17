# -*- coding: utf-8 -*-
"""Convert Figma 'Dev Mode' JSX (EFF.txt) -> static HTML openable in a browser.
Handles: style={{...}} -> style="...", className -> class, self-closing <div/> -> <div></div>.
Leaves SVG/base64 image attributes untouched (already valid).
"""
import re, sys, io

SRC = r"ba/workspace/drafts/mockup/EFF.txt"
OUT = r"ba/workspace/drafts/mockup/EFF-original-render.html"

with io.open(SRC, "r", encoding="utf-8") as f:
    src = f.read()

# React's list of unitless CSS properties (camelCase) — numbers stay raw.
UNITLESS = set("""animationIterationCount aspectRatio borderImageOutset borderImageSlice
borderImageWidth boxFlex boxFlexGroup boxOrdinalGroup columnCount columns flex flexGrow
flexPositive flexShrink flexNegative flexOrder gridArea gridRow gridRowEnd gridRowSpan
gridRowStart gridColumn gridColumnEnd gridColumnSpan gridColumnStart fontWeight lineClamp
lineHeight opacity order orphans tabSize widows zIndex zoom fillOpacity floodOpacity
stopOpacity strokeDasharray strokeDashoffset strokeMiterlimit strokeOpacity strokeWidth""".split())

VOID = {"area","base","br","col","embed","hr","img","input","link","meta","param","source","track","wbr"}

def camel_to_kebab(key):
    if key.startswith("--"):
        return key
    # vendor prefix e.g. WebkitX -> -webkit-x
    out = re.sub(r"([A-Z])", lambda m: "-" + m.group(1).lower(), key)
    return out

def split_top_level(s, sep=","):
    parts, depth, q, buf = [], 0, None, []
    for ch in s:
        if q:
            buf.append(ch)
            if ch == q:
                q = None
            continue
        if ch in "\"'":
            q = ch; buf.append(ch); continue
        if ch in "([{":
            depth += 1; buf.append(ch); continue
        if ch in ")]}":
            depth -= 1; buf.append(ch); continue
        if ch == sep and depth == 0:
            parts.append("".join(buf)); buf = []; continue
        buf.append(ch)
    if buf:
        parts.append("".join(buf))
    return parts

num_re = re.compile(r"^-?\d+(\.\d+)?$")

def conv_style(obj):
    decls = []
    for item in split_top_level(obj):
        item = item.strip()
        if not item:
            continue
        # split on first top-level colon
        ci = -1; depth = 0; q = None
        for i, ch in enumerate(item):
            if q:
                if ch == q: q = None
                continue
            if ch in "\"'": q = ch; continue
            if ch in "([{": depth += 1; continue
            if ch in ")]}": depth -= 1; continue
            if ch == ":" and depth == 0:
                ci = i; break
        if ci == -1:
            continue
        key = item[:ci].strip()
        val = item[ci+1:].strip()
        # unquote key if quoted
        if len(key) >= 2 and key[0] in "\"'" and key[-1] == key[0]:
            key = key[1:-1]
        unitless = key in UNITLESS
        css_key = camel_to_kebab(key)
        # value
        if len(val) >= 2 and val[0] in "\"'" and val[-1] == val[0]:
            val = val[1:-1]
        elif num_re.match(val):
            if not unitless and val != "0":
                val = val + "px"
        decls.append("%s:%s" % (css_key, val))
    return "; ".join(decls)

# 1) Replace style={{ ... }} -> style="..."
result = []
i = 0
marker = "style={{"
while True:
    j = src.find(marker, i)
    if j == -1:
        result.append(src[i:])
        break
    result.append(src[i:j])
    # find matching }} starting after marker
    k = j + len(marker)
    end = src.find("}}", k)
    if end == -1:
        result.append(src[j:])
        break
    obj = src[k:end]
    css = conv_style(obj)
    css = css.replace('"', "&quot;")
    result.append('style="%s"' % css)
    i = end + 2
src = "".join(result)

# 2) className -> class
src = re.sub(r"\bclassName=", "class=", src)

# 3) expand self-closing tags <tag .../> -> <tag ...></tag> (except void elements)
selfclose_re = re.compile(r"<([a-zA-Z][\w:.-]*)((?:\"[^\"]*\"|'[^']*'|[^>\"'])*?)\s*/>")
def expand(m):
    tag = m.group(1); attrs = m.group(2)
    if tag.lower() in VOID:
        return "<%s%s />" % (tag, attrs)
    return "<%s%s></%s>" % (tag, attrs, tag)
src = selfclose_re.sub(expand, src)

html = """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VNA Web EFF — Original Screen (converted from Figma JSX)</title>
<style>
  * { box-sizing: border-box; }
  body { margin:0; padding:0; background:#eaecf0; font-family:'Inter','Segoe UI',Arial,sans-serif; }
  /* Figma fallback color tokens (in case var() fallbacks are missing) */
  :root {
    --Gray-100:#F2F4F7; --Gray-200:#E4E7EC; --Gray-300:#D0D5DD;
    --Gray-50:#F9FAFB; --Gray-500:#667085; --Gray-600:#475467;
    --Gray-700:#344054; --Gray-900:#101828;
  }
</style>
</head>
<body>
%s
</body>
</html>
""" % src

with io.open(OUT, "w", encoding="utf-8") as f:
    f.write(html)

print("OK ->", OUT, "bytes:", len(html))
