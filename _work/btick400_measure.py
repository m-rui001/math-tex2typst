# -*- coding: utf-8 -*-
# btick400_measure.py <note-id>  — ASCII metrics for one note (no Chinese to stdout).
import io
import sys
import glob
import re

BT = chr(96)
DL = chr(36)
BS = chr(92)

ID = sys.argv[1]
p = glob.glob(u"研究笔记/%s-*.md" % ID)[0]
raw = io.open(p, "rb").read()
text = raw.decode("utf-8")
lines = text.split(u"\n")
cr = text.count(chr(13))
odd = sum(1 for l in lines if l.count(DL) % 2)
math = text.count(BS + u"(") + text.count(DL)
out = []
out.append("id=%s" % ID)
out.append("bytes=%d" % len(raw))
out.append("lines=%d" % len(lines))
out.append("cr=%d" % cr)
out.append("dollars=%d" % text.count(DL))
out.append("backticks=%d" % text.count(BT))
out.append("math=%d" % math)
out.append("odd_dollar_lines=%d" % odd)
# target substring uniqueness
targets = {
    "L148": u"618`-`628$",
    "L218": u"597`-`620$",
    "L356": u"747`-`749$",
}
for k, s in targets.items():
    out.append("target %s count=%d" % (k, text.count(s)))
print("\n".join(out))
