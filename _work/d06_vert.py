# -*- coding: utf-8 -*-
# D06 台账两行格内裸绝对值 → \lvert/\rvert（badLedgerRows 只能本体侧单 token 回改）。
import glob
import io
import sys
from collections import Counter

sys.stdout.reconfigure(encoding="utf-8")
B = chr(92)
L1 = u"|j" + B + u"omega+" + B + u"log(1+t)|"
N1 = B + u"lvert j" + B + u"omega+" + B + u"log(1+t)" + B + u"rvert"
L2 = u"|j" + B + u"omega|"
N2 = B + u"lvert j" + B + u"omega" + B + u"rvert"

apply = u"--apply" in sys.argv
p = glob.glob(u"研究笔记/D06-*.md")[0]
raw = io.open(p, encoding=u"utf-8").read()
assert u"\r" not in raw
t = raw
for old, new in ((L1, N1), (L2, N2)):
    assert t.count(old) == 1, (old, t.count(old))
    t = t.replace(old, new)
ob = raw.encode(u"utf-8")
nb = t.encode(u"utf-8")
assert nb.count(b"\r") == 0
assert t.count(u"$") == raw.count(u"$")
hist = Counter(l.count(u"|") for l in t.split(u"\n") if l.startswith(u"| "))
assert set(hist) == {6}, dict(hist)
old_nb = [l for l in raw.split(u"\n") if l.strip()]
new_nb = [l for l in t.split(u"\n") if l.strip()]
assert len(old_nb) == len(new_nb)
assert len(nb) - len(ob) == (len(N1) - len(L1)) + (len(N2) - len(L2))
print(u"rows=%s +%dB size=%d->%d" % (dict(hist), len(nb) - len(ob), len(ob), len(nb)))
for i, l in enumerate(t.split(u"\n")):
    if N1 in l or N2 in l:
        print(u"  L%d %s" % (i + 1, l[:100]))
if apply:
    io.open(u"_work/D06.pre-vert.md", u"w", encoding=u"utf-8").write(raw)
    io.open(p, "wb").write(nb)
print(u"APPLY=%s" % apply)
