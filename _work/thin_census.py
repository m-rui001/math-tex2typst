# -*- coding: utf-8 -*-
# 找「素材厚而笔记薄」的加深批候选：每份笔记的字节数 / 数学定界符数 / 其素材 tex 总字节。
import glob
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
ROOT = u"研究笔记"
PRE = u"preprints"
DIR = re.compile(u"preprints/([A-Za-z0-9._\\-]+)")
rows = []
inflight = set(x.strip() for x in io.open(u".tools/inflight.txt", encoding="utf-8")
               .read().split(u"\n") if x.strip())
for p in sorted(glob.glob(ROOT + u"/D*.md")):
    base = os.path.basename(p)
    d = base[1:base.find(u"-")]
    raw = io.open(p, encoding="utf-8").read()
    size = len(raw.encode("utf-8"))
    math = raw.count(u"$")
    dirs = DIR.findall(raw)
    if not dirs:
        continue
    base_dir = os.path.join(PRE, dirs[0])
    tot = [sum(os.path.getsize(os.path.join(w, f))
               for f in fs if f.endswith(u".tex"))
           for w, _, fs in os.walk(base_dir)]
    if not tot:
        continue
    mat = sum(tot)
    rows.append((size / float(mat), size, mat, math, d, base[:34],
                 d in inflight))
rows.sort(key=lambda t: t[0])
print("%-6s %8s %9s %6s %6s %-7s %s" % ("ID", "note_B", "tex_B", "ratio",
      "math", "flight", "file"))
for r in rows:
    if r[1] >= 92000 or r[2] < 120000:
        continue
    if r[3] > 1600:
        continue
    print("%-6s %8d %9d %6.3f %6d %-7s %s" % (r[4], r[1], r[2], r[0], r[3],
          "FLIGHT" if r[6] else "", r[5]))
