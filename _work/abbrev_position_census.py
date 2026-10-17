# -*- coding: utf-8 -*-
# 全库普查：闭合符正确、但省掉文件名的缩写式位置串（形如 `05:191-192`）。
# 这类串 cite_audit.js 看不见（它按 basename 认文件），逐条判真伪要人工；本量具只数不改。
import glob
import io
import os
import re
import sys
from collections import Counter

sys.stdout.reconfigure(encoding="utf-8")

PAT = re.compile(u"`(\\d{1,2}[A-Za-z\\-]*):([0-9][0-9,\\- ]*)`")
FLIGHT = set(a for a in sys.argv[1:] if re.match(u"^D[0-9]+$", a))

files = Counter()
sites = 0
samples = []
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    base = os.path.basename(p)
    k = base[1:base.find(u"-")]
    if k in FLIGHT:
        continue
    t = io.open(p, encoding="utf-8", errors="replace").read()
    ms = PAT.findall(t)
    if not ms:
        continue
    files[k] = len(ms)
    sites += len(ms)
    if len(samples) < 8:
        for ln, l in enumerate(t.split(u"\n")):
            m = PAT.search(l)
            if m:
                samples.append((k, ln + 1, m.group(0)))
                break
print(u"abbrev-position sites=%d notes=%d" % (sites, len(files)))
print(u"top: " + u" ".join(u"%s:%d" % kv for kv in files.most_common(12)))
for s in samples:
    print(s)
