# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob("E:/math/研究笔记/D235-*.md")[0]
s = io.open(p, encoding="utf-8").read()
L = s.split("\n")
STOP = set("""tex lean pdf main introduction sections build abs norm articleid
lvert rvert lVert rVert upharpoonright mid le ge leq cdots dots mathbf mathrm text substack
sum prod frac sqrt infty subset subseteq cdot cdots substack ule""".split())
out = io.open("E:/math/_work/d235_en.txt", "w", encoding="utf-8", newline="\n")
n = 0
for i in range(685, len(L)):
    l = L[i]
    t = re.sub(r"\$[^$]*\$", " ", l)
    t = re.sub(r"`[^`]*`", " ", t)
    t = re.sub(r"\\[A-Za-z]+", " ", t)
    t = re.sub(r"[A-Za-z_][A-Za-z_0-9.\-]*\.(tex|lean|bib)", " ", t)
    for m in re.finditer(r"[A-Za-z][A-Za-z]{2,}", t):
        w = m.group(0)
        if w.lower() in STOP or w in ("Bai", "Roth"):
            continue
        out.write("%d | %s | %s\n" % (i + 1, w, l[:150]))
        n += 1
out.write("hits=%d\n" % n)
out.close()
print("hits", n)
