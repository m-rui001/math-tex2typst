# -*- coding: utf-8 -*-
# 对 D_dangling 名单逐份取引用上下文：判 FP-1(中文序号标题) / FP-3(引论文自己的节号) / C3(真丢节)
import io, glob, os, re, sys

sys.stdout.reconfigure(encoding="utf-8")
IDS = u"01 02 05 10 13 14 15 16 17 20 227 244 298 351 400 418 46 478 569 643 79 89 90 91".split()
FLIGHT = set(u"D149 D10 D06".split())
HEAD = re.compile(u"^## *(?:\u00a7 ?)?(\\d+)(?:[. \u3000]|\u3000|$)")
CN = re.compile(u"^## +[\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341]+")

for k in IDS:
    g = u"研究笔记/D%s-*.md" % k
    if not glob.glob(g):
        continue
    f = glob.glob(g)[0]
    if os.path.basename(f).split(u"-")[0] in FLIGHT:
        print(u"== %s SKIP flight" % k)
        continue
    t = io.open(f, encoding="utf-8").read()
    L = t.split(u"\n")
    nums = []
    cn_heads = 0
    for l in L:
        m = HEAD.match(l)
        if m:
            nums.append(int(m.group(1)))
        elif CN.match(l):
            cn_heads += 1
    have = set(nums)
    mx = max(nums) if nums else -1
    refs = {}
    for m in re.finditer(u"\u00a7(\\d{1,3})(?![0-9])", t):
        n = int(m.group(1))
        refs.setdefault(n, []).append(m.start())
    dang = sorted(n for n in refs if n not in have)
    print(u"== D%s heads=%d max=%d cn_heads=%d dang=%s" % (k, len(nums), mx, cn_heads, dang))
    for n in dang[:4]:
        pos = refs[n][0]
        seg = t[max(0, pos - 70):pos + 90].replace(u"\n", u" ")
        beyond = u"OVER" if n > mx else u"in"
        print(u"   \u00a7%-4d n=%d %-4s %s" % (n, len(refs[n]), beyond, seg[:150]))
