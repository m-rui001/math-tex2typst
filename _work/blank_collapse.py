# -*- coding: utf-8 -*-
# 台账表被空行截断：数据行本身合规（6 枚竖线），但行间夹了空行，markdown 只在第一个
# 空行处认表，后面的行渲染成字面文本。修法=删掉表内的空行，一个内容行都不动。
# 用法：blank_census.py [--apply] [ID...]（不给 ID 就全库普查）
import glob
import io
import os
import sys

sys.stdout.reconfigure(encoding="utf-8")
HDR = (u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | "
       u"\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | "
       u"\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
SEP = u"| --- | --- | --- | --- | --- |"
FLIGHT = set(u"D296 D368 D530 D681 D682 D683 D684 D685 D686 D691 D741".split())
apply = u"--apply" in sys.argv
ids = [a for a in sys.argv[1:] if not a.startswith(u"--")]
if not ids:
    for f in sorted(glob.glob(u"研究笔记/D*.md")):
        b = os.path.basename(f)
        k = b[:b.find(u"-")]
        if k not in FLIGHT:
            ids.append(k)
tn = tr = 0
for k in ids:
    hits = glob.glob(u"研究笔记/%s-*.md" % k)
    if not hits:
        continue
    p = hits[0]
    raw = io.open(p, encoding="utf-8").read()
    L = raw.split(u"\n")
    hs = [i for i, l in enumerate(L) if l == HDR]
    if len(hs) != 1:
        continue
    h = hs[0]
    assert L[h + 1] == SEP, (k, "sep")
    # 表内截断：从块尾往后，只隔空行的 6 竖线行
    i = h + 2
    cut = []
    while i < len(L):
        l = L[i]
        if l.startswith(u"| ") and l.count(u"|") == 6:
            i += 1
            continue
        if l == u"":
            j = i
            while j < len(L) and L[j] == u"":
                j += 1
            if j < len(L) and L[j].startswith(u"| ") and L[j].count(u"|") == 6:
                cut.extend(range(i, j))     # 这些空行在表内部
                i = j
                continue
        break
    if not cut:
        continue
    nl = [l for n, l in enumerate(L) if n not in set(cut)]
    new = u"\n".join(nl)
    ob = raw.encode("utf-8")
    nb = new.encode("utf-8")
    assert len(ob) - len(nb) == len(cut)
    assert [l for l in ob.decode("utf-8").split(u"\n") if l.strip()] == \
           [l for l in nb.decode("utf-8").split(u"\n") if l.strip()], k
    print(u"%s cut_blank=%d at=%s -%dB size=%d" %
          (k, len(cut), [c + 1 for c in cut][:12], len(ob) - len(nb), len(nb)))
    tn += 1
    tr += len(cut)
    if apply:
        io.open(u"_work/%s.pre-blank.md" % k, u"w", encoding="utf-8").write(raw)
        io.open(p, "wb").write(nb)
print(u"NOTES=%d BLANKS=%d APPLY=%s" % (tn, tr, apply))
