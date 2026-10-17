# -*- coding: utf-8 -*-
import glob, io, re

FALL = "\\fall"
p = glob.glob(u"研究笔记/D189-*.md")[0]
L = io.open(p, "rb").read().decode("utf-8").split(u"\n")
tot = 0
for i, l in enumerate(L):
    if FALL in l:
        n = l.count(FALL)
        tot += n
        print(u"%5d x%d | %s" % (i + 1, n, l.strip()[:400]))
print(u"occurrences=%d lines=%d" % (tot, sum(1 for l in L if FALL in l)))
# 素材里该宏的定义与用途，确认展开形状
m = io.open(u"preprints/A-Limiting-Satisfiability-Threshold-for-Every-Fixed-Clause-Size-"
            u"September-25-2026/build/source/preamble.tex", "rb").read().decode("utf-8")
for i, l in enumerate(m.split(u"\n")):
    if FALL in l:
        print(u"preamble %4d| %s" % (i + 1, l.strip()[:120]))
