# -*- coding: utf-8 -*-
# D67 结构定位：所有 ## 标题行、错置块的边界、以及申报的重复段落在哪。
import glob
import io
import os
import re

p = glob.glob(u"研究笔记/D67-*.md")[0]
L = io.open(p, encoding="utf-8").read().split(u"\n")
out = []
heads = [(i + 1, l) for i, l in enumerate(L) if l.startswith(u"## ")]
out.append(u"== headers ==")
for ln, l in heads:
    out.append(u"%4d %s" % (ln, l[:70]))
out.append(u"== window 380..405 ==")
for i in range(379, min(405, len(L))):
    out.append(u"%4d %s" % (i + 1, L[i][:150]))
# 重复段落探测：非空行出现 >=2 次且长度 >60 的
from collections import Counter
c = Counter(l for l in L if len(l.strip()) > 60 and not l.strip().startswith(u"|"))
dups = [(l, n) for l, n in c.items() if n > 1]
out.append(u"== duplicate long lines: %d ==" % len(dups))
for l, n in dups[:6]:
    lines_at = [i + 1 for i, x in enumerate(L) if x == l]
    out.append(u"x%d at %s :: %s" % (n, lines_at, l[:120]))
io.open(u"_work/d67_struct.txt", "w", encoding="utf-8", newline=u"\n").write(u"\n".join(out) + u"\n")
print("written", len(out), "lines", os.path.getsize(u"_work/d67_struct.txt"))
