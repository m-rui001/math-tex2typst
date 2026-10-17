# -*- coding: utf-8 -*-
import io, glob, os

B = chr(92)
NOTE = u"研究笔记"
f = glob.glob(u"E:/math/" + NOTE + u"/D68-*.md")[0]
lines = io.open(f, encoding="utf-8").read().split(u"\n")
tok = B + u"nuW"
out = [u"file = " + f,
       u"nuW total = %d" % sum(x.count(tok) for x in lines),
       u"nuW lines = %s" % [i + 1 for i, x in enumerate(lines) if tok in x],
       u"--- line 1523 ---",
       lines[1522]]

b = u"E:/math/preprints/Compatibility-entropy-and-the-spectrum-of-a-Thorp-sweep-September-26-2026/build"
files = sorted(glob.glob(os.path.join(b, u"**", u"*.tex"), recursive=True))
out.append(u"tex files = %d" % len(files))
for probe in (B + u"nu W", B + u"nu_W", B + u"nu" + B + u"W", B + u"nu}W", B + u"nu} W", B + u"E_" + B + u"nu"):
    n = 0
    ex = []
    for g in files:
        for i, x in enumerate(io.open(g, encoding="utf-8", errors="replace").read().split(u"\n"), 1):
            c = x.count(probe)
            if c:
                n += c
                if len(ex) < 6:
                    ex.append(u"  %s:%d %s" % (os.path.basename(g), i, x.strip()[:200]))
    out.append(u"### %r  count=%d" % (probe, n))
    out.extend(ex)
io.open(u"E:/math/_work/d68_nuW.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
print(u"wrote", len(out))
