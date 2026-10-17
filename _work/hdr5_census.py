# -*- coding: utf-8 -*-
# 精确普查：五列分隔行上一行的首格分布；符号>1 即重复标准表头
import io, glob, os, re
from collections import Counter

SEP5 = re.compile(u"^\\| *(-{3}|:?-+:?) *\\|(?: *-{3} *\\|){4}$")
rows = []
firsts = Counter()
dup = []
for f in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    name = os.path.basename(f)
    if u"_work" in f:
        continue
    s = io.open(f, encoding="utf-8").read()
    L = s.split("\n")
    cnt = Counter()
    detail = []
    for j, l in enumerate(L):
        if not SEP5.match(l.strip()):
            continue
        prev = L[j - 1].strip() if j else ""
        if not (prev.startswith(u"|") and prev.endswith(u"|")):
            continue
        cells = [c.strip() for c in prev.strip("|").split("|")]
        fc = cells[0] if cells else "?"
        cnt[fc] += 1
        firsts[fc] += 1
        detail.append((j, fc, len(cells)))
    if cnt.get(u"符号", 0) >= 2:
        dup.append((name[:46], cnt, [(d[0] + 1, d[1], d[2]) for d in detail]))
    elif len(detail) >= 2 and sum(cnt.values()) >= 2:
        rows.append((name[:46], sum(cnt.values()), dict(cnt)))
out = io.open("E:/math/_work/hdr5_census.txt", "w", encoding="utf-8", newline="\n")
out.write(u"首格分布：%s\n\n" % dict(firsts.most_common()))
out.write(u"### 符号表头 >=2（缺陷族）n=%d\n" % len(dup))
for d in dup:
    out.write(u"%s | %s | %s\n" % (d[0], dict(d[1]), d[2]))
out.write(u"\n### 两份及以上五列表但符号<=1（续表形态，非缺陷，抽样 20）\n")
for r in rows[:20]:
    out.write(u"%s | tables=%d | %s\n" % (r[0], r[1], r[2]))
out.write(u"multi_table_notes=%d\n" % len(rows))
out.close()
print("dup", len(dup), "multi", len(rows))
