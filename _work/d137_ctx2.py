# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob("E:/math/研究笔记/D137-*.md")[0]
L = io.open(p, encoding="utf-8", newline="").read().split("\n")
out = io.open("E:/math/_work/d137_ctx.txt", "w", encoding="utf-8", newline="\n")
for n in (888, 898):
    out.write("%5d| %s\n\n" % (n, L[n - 1]))
for pat in [r"mesh", r"rare-fast", r"\*\*[^*]+\*\*"]:
    out.write("PATTERN %s\n" % pat)
    for i, l in enumerate(L):
        if i + 1 >= 866 and re.search(pat, l):
            out.write("  %5d| %s\n" % (i + 1, l.strip()[:400]))
    out.write("\n")
out.close()
print("ok")
