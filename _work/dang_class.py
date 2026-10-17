# -*- coding: utf-8 -*-
# 悬空 §N 引用逐份定性：打印标题写法、节号范围、每个悬空号的命中数与样句。
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
ROOT = u"研究笔记"
H = re.compile(u"^## *(?:\u00a7 ?)?(\\d+)(?:[. ]|$)")
REF = re.compile(u"\u00a7(\\d+)(?![\\.\\d])")
FLIGHT = set(u"D296 D368 D530 D681 D682 D683 D684 D685 D686 D691 D741".split())
ids = sys.argv[1:] or None
for name in sorted(os.listdir(ROOT)):
    m = re.match(u"^(D\\d+)-.*\\.md$", name)
    if not m:
        continue
    d = m.group(1)
    if d in FLIGHT or (ids and d not in ids):
        continue
    lines = io.open(os.path.join(ROOT, name), encoding=u"utf-8").read().split(u"\n")
    seq = []
    for l in lines:
        if l.startswith(u"###"):
            continue
        mm = H.match(l)
        if mm:
            seq.append(int(mm.group(1)))
    if not seq:
        continue
    s = set(seq)
    hits = {}
    for i, l in enumerate(lines):
        if l.startswith(u"#"):
            continue
        for mm in REF.finditer(l):
            n = int(mm.group(1))
            if n not in s:
                hits.setdefault(n, []).append((i + 1, l))
    if not hits:
        continue
    print(u"=== %s heads=%d range=%d..%d  dangling=%s" %
          (d, len(seq), min(seq), max(seq), sorted(hits)))
    for n in sorted(hits):
        v = hits[n]
        print(u"   \u00a7%-3d x%-3d %s:%s" % (n, len(v), v[0][0], v[0][1][:74]))
        if len(v) > 1:
            print(u"          %s:%s" % (v[1][0], v[1][1][:74]))
