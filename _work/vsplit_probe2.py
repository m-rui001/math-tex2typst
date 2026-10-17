# -*- coding: utf-8 -*-
# 展开腿落地后的自检：控制字吞字母必须逐篇「今文 vs 备份」比对，只报本腿新增的。
import glob
import io
import os
import re

PAT = re.compile(u"\\\\(?:lVert|rVert|Vert|lvert|rvert|mid(?!dle)|lfloor|upharpoonright)(?=[A-Za-z])")
tot_now = tot_old = 0
rows = []
for bk in sorted(glob.glob(u"_work/D*.pre-single.md")):
    key = os.path.basename(bk).split(u".")[0]
    cur = glob.glob(u"研究笔记/%s-*.md" % key)
    if not cur:
        continue
    a = io.open(bk, encoding="utf-8").read()
    b = io.open(cur[0], encoding="utf-8").read()
    na, nb = len(PAT.findall(a)), len(PAT.findall(b))
    tot_old += na
    tot_now += nb
    if nb != na:
        rows.append((key, na, nb, [m.group(0) for m in PAT.finditer(b)][:4]))
print("changed_notes=%d backups=%d swallow old=%d now=%d delta=%+d" % (
    len(rows), len(glob.glob(u"_work/D*.pre-single.md")), tot_old, tot_now, tot_now - tot_old))
for r in rows:
    print("  %s %d->%d %s" % r)

corpus = 0
cnotes = 0
for f in glob.glob(u"研究笔记/D*.md"):
    t = io.open(f, encoding="utf-8").read()
    n = len(PAT.findall(t))
    corpus += n
    cnotes += 1 if n else 0
print("corpus now: notes=%d occ=%d" % (cnotes, corpus))
