# -*- coding: utf-8 -*-
import io, glob

WANT = {"D718": [1090, 1106, 1156, 1158, 1176, 1243], "D04": [519, 563, 565, 615, 732]}
out = io.open("E:/math/_work/residue_ctx.txt", "w", encoding="utf-8", newline="\n")
for key, lines in WANT.items():
    p = glob.glob("E:/math/研究笔记/%s-*.md" % key)[0]
    L = io.open(p, encoding="utf-8", newline="").read().split("\n")
    out.write("\n===== %s =====\n" % key)
    for n in lines:
        out.write("%5d| %s\n" % (n, L[n - 1]))
out.close()
print("ok")
