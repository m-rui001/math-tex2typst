# -*- coding: utf-8 -*-
# 把台账里「脱队的 5 列数据行」并回表头之后的连续块：整块移动，字节不变。
# 判据：表头行 HDR 之后紧跟分隔行 SEP，再往下第一处非「| …」行即块尾；
# 全文其余位置的 6 枚竖线行都是脱队行。用法：ledger_merge.py [--apply] D621 ...
import glob
import io
import sys

sys.stdout.reconfigure(encoding="utf-8")
HDR = (u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | "
       u"\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | "
       u"\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
SEP = u"| --- | --- | --- | --- | --- |"
FLIGHT = set(u"D741 D691".split())

args = [a for a in sys.argv[1:] if a != u"--apply"]
apply = u"--apply" in sys.argv
if u"ALL" in args:
    args = [a for a in args if a != u"ALL"]
    import os
    for f in sorted(glob.glob(u"研究笔记/D*.md")):
        b = os.path.basename(f)
        args.append(b[:b.find(u"-")])
    args = [a for a in args if a not in FLIGHT]

for k in args:
    if k in FLIGHT:
        print("%s SKIP flight" % k)
        continue
    hits = glob.glob(u"研究笔记/%s-*.md" % k)
    if not hits:
        print("%s NOFILE" % k)
        continue
    p = hits[0]
    raw = io.open(p, encoding="utf-8").read()
    L = raw.split(u"\n")
    hs = [i for i, l in enumerate(L) if l == HDR]
    if len(hs) != 1:
        print("%s SKIP hdr=%d" % (k, len(hs)))
        continue
    h = hs[0]
    if L[h + 1].strip() != SEP:
        print("%s SKIP no-sep" % k)
        continue
    e = h + 2
    while e < len(L) and L[e].startswith(u"| "):
        e += 1
    block = L[h + 2:e]
    stray = [(i, l) for i, l in enumerate(L)
             if i > h + 1 and (i < h + 2 or i >= e) and l.startswith(u"| ")
             and l.count(u"|") == 6 and l.strip() != SEP]
    bad = [(i, l) for i, l in enumerate(L)
           if l.startswith(u"| ") and l.count(u"|") != 6]
    print("%s size=%d block=%d stray=%d badpipe=%d" % (
        k, len(raw.encode("utf-8")), len(block), len(stray), len(bad)))
    for i, l in stray[:4]:
        print("    stray@%d %s" % (i + 1, l[:64]))
    if not stray:
        continue
    rows = [l for _, l in stray]
    keep = [l for i, l in enumerate(L) if i not in set(i for i, _ in stray)]
    # 去掉脱队行原位留下的多余空行（该行删掉后可能形成连续两空行）
    new = keep[:e] + rows + keep[e:]
    while u"\n\n\n" in u"\n".join(new):
        new = [l for j, l in enumerate(new)
               if not (l == u"" and j > 0 and new[j - 1] == u"")]
    out = u"\n".join(new)
    same_bytes = len(out.encode("utf-8")) == len(raw.encode("utf-8"))
    ok = sorted(new) == sorted(L)
    print("    merge -> block=%d bytes_same=%s multiset=%s" % (
        len(rows) + len(block), same_bytes, ok))
    if not (same_bytes and ok):
        print("    SKIP not-a-pure-move")
        continue
    if apply:
        io.open(u"_work/%s.pre-ledgermerge.md" % k, "w", encoding="utf-8",
                newline=u"\n").write(raw)
        io.open(p, "w", encoding="utf-8", newline=u"\n").write(out)
        print("    APPLIED")
