# -*- coding: utf-8 -*-
import io, sys
sys.stdout.reconfigure(encoding="utf-8")
TICK = chr(96)
PAT = re.compile(TICK + u"([A-Za-z0-9_.\-]+:[A-Za-z0-9_.\-]+)([$])") if False else None
import re
PAT = re.compile(TICK + u"([A-Za-z0-9_.\-]+:[A-Za-z0-9_.\-]+)([$])")
WANT = [(u"D130", 191), (u"D145", 395), (u"D218", 703), (u"D219", 157), (u"D227", 211),
        (u"D227", 225), (u"D252", 203), (u"D311", 328), (u"D33", 1183), (u"D33", 1193),
        (u"D397", 131), (u"D397", 163), (u"D449", 52), (u"D460", 54), (u"D49", 352),
        (u"D495", 376), (u"D578", 60), (u"D578", 96), (u"D578", 166), (u"D691", 573),
        (u"D743", 123), (u"D95", 1492)]
import glob, os
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    k = os.path.basename(p)[:10]
    lines = io.open(p, encoding="utf-8", errors="replace").read().split(u"\n")
    for want_k, ln in WANT:
        if k[:4] != want_k:
            continue
        l = lines[ln - 1]
        if not PAT.search(l):
            continue
        print(u"=== %s:%d  ($%%2=%d tick%%2=%d)" % (k, ln, l.count(u"$") % 2, l.count(TICK) % 2))
        print(l)
        print()
