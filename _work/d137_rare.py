# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob("E:/math/研究笔记/D137-*.md")[0]
L = io.open(p, encoding="utf-8", newline="").read().split("\n")
out = io.open("E:/math/_work/d137_rare.txt", "w", encoding="utf-8", newline="\n")
for i, l in enumerate(L):
    if "rare" in l and i + 1 >= 866:
        out.write("%5d| FULL: %s\n" % (i + 1, l))
        for m in re.finditer(r".{40}rare.{60}", l):
            out.write("     CTX: %s\n" % m.group(0))
out.close()
print("ok")
