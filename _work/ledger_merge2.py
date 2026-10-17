# -*- coding: utf-8 -*-
# 台账脱队行并回唯一表：整块移动 + 只做空行压实，不增删任何内容行。
# 判据：唯一标准表头 HDR，块尾之后仍有 6 枚竖线的数据行。
# 跳过：在飞稿、含脱队表头行的稿（那是自造表头一族，另开一趟）、竖线数异常行>0 的稿。
# 用法：ledger_merge2.py [--apply] D559 ...
import glob
import io
import os
import sys
from collections import Counter

sys.stdout.reconfigure(encoding="utf-8")
HDR = (u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | "
       u"\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | "
       u"\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
CELL = u"\u6570\u503c\u6216\u589e\u957f\u7387"
SEP = u"| --- | --- | --- | --- | --- |"
FLIGHT = set(u"D741 D691".split())

args = [a for a in sys.argv[1:] if a != u"--apply"]
apply = u"--apply" in sys.argv
if u"ALL" in args:
    args = []
    for f in sorted(glob.glob(u"研究笔记/D*.md")):
        b = os.path.basename(f)
        if b.startswith(u"D"):
            args.append(b[:b.find(u"-")])
    args = [a for a in args if a not in FLIGHT]

for k in args:
    hits = glob.glob(u"研究笔记/%s-*.md" % k)
    if not hits:
        continue
    p = hits[0]
    raw = io.open(p, encoding="utf-8").read()
    L = raw.split(u"\n")
    hs = [i for i, l in enumerate(L) if l == HDR]
    if len(hs) != 1:
        print("%s SKIP hdr=%d" % (k, len(hs)))
        continue
    h = hs[0]
    e = h + 2 if h + 1 < len(L) and L[h + 1].strip() == SEP else h + 1
    while e < len(L) and L[e].startswith(u"| "):
        e += 1
    stray = [i for i, l in enumerate(L) if i >= e and l.startswith(u"| ")
             and l.strip() != SEP]
    if not stray:
        continue
    sep_after = [i for i, l in enumerate(L) if i > e and l.strip() == SEP]
    if sep_after:
        print("%s SKIP second-sep@%s" % (k, [i + 1 for i in sep_after][:4]))
        continue
    hdr_rows = [i for i in stray if CELL in L[i]]
    badpipe = [i for i in stray if L[i].count(u"|") != 6]
    if hdr_rows or badpipe:
        print("%s SKIP stray_hdr=%d badpipe=%d" % (k, len(hdr_rows), len(badpipe)))
        continue
    # 切成连续段（段内行号相邻）
    runs, cur = [], [stray[0]]
    for i in stray[1:]:
        if i == cur[-1] + 1:
            cur.append(i)
        else:
            runs.append(cur)
            cur = [i]
    runs.append(cur)
    # 每个段必须紧跟在散文行之后（不是另一张表的表头），否则它是独立表，不许并进来
    unsafe = []
    for r in runs:
        j = r[0] - 1
        while j >= 0 and L[j] == u"":
            j -= 1
        prev = L[j] if j >= 0 else u""
        # 段前是主表自己的数据行（只隔着空行）＝同一张表被空行截断，并进来等价于删空行；
        # 段前是另一张表的行、或另一张表的分隔行，才要拦。
        if prev.strip() == SEP or (prev.startswith(u"| ") and j >= e):
            unsafe.append((r[0] + 1, u"OTHER-TABLE " + prev[:30]))
        if prev.startswith(u"## "):
            # 段前直接是节标题：并走数据行会留下空头节，换别趟工序处理
            unsafe.append((r[0] + 1, u"HEADING " + prev[:30]))
    if unsafe:
        print("%s SKIP own-table %s" % (k, unsafe))
        continue
    for r in runs:
        j = r[0] - 1
        while j >= 0 and L[j] == u"":
            j -= 1
        print("    run@%d len=%d prev=%r" % (r[0] + 1, len(r),
              (L[j] if j >= 0 else u"")[:56]))
    moved = [i for r in runs for i in r]
    drop = set(moved)
    for r in runs:
        j = r[-1] + 1
        while j < len(L) and L[j] == u"":
            drop.add(j)
            j += 1
    kept = [l for i, l in enumerate(L) if i not in drop]
    insert_at = e                                   # e 之前无删除，索引不变
    block_rows = [l for l in kept[:insert_at] if l.startswith(u"| ")]
    rows_moved = [L[i] for i in moved]
    new = kept[:insert_at] + rows_moved + kept[insert_at:]
    out = u"\n".join(new)
    nb_old = [l for l in L if l.strip()]
    nb_new = [l for l in new if l.strip()]
    pure = Counter(nb_new) == Counter(nb_old)
    blanks = sum(1 for l in L if not l.strip()) - sum(1 for l in new if not l.strip())
    dbl = u"\n\n\n" in out
    dbl_before = u"\n\n\n" in raw
    hdrs = sum(1 for l in new if l == HDR)
    print("%s size=%d->%d block=%d moved=%d runs=%d content_pure=%s blanks_removed=%d dbl=%s/%s hdr=%d"
          % (k, len(raw.encode("utf-8")), len(out.encode("utf-8")),
             len(block_rows), len(rows_moved), len(runs), pure, blanks, dbl,
             dbl_before, hdrs))
    if not (pure and not (dbl and not dbl_before) and hdrs == 1):
        print("    SKIP not-applicable")
        continue
    if apply:
        io.open(u"_work/%s.pre-ledgermerge.md" % k, "w", encoding="utf-8",
                newline=u"\n").write(raw)
        io.open(p, "w", encoding="utf-8", newline=u"\n").write(out)
        print("    APPLIED")
