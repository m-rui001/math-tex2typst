# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob("E:/math/研究笔记/D06-*.md")[0]
s = io.open(p, encoding="utf-8").read()
L = s.split("\n")
runs = []
for i, l in enumerate(L, 1):
    if i < 474:
        continue
    # 去掉反引号内容与公式段
    t = re.sub(r"\$[^$]*\$", " ", l)
    t = re.sub(r"`[^`]*`", " ", t)
    t = re.sub(r"[A-Za-z_][A-Za-z_0-9.\-]*\.(tex|lean|bib)", " ", t)
    for m in re.finditer(r"[A-Za-z][A-Za-z']+(?:[\s,]+[A-Za-z][A-Za-z']+){2,}", t):
        runs.append((i, m.group(0)[:90]))
    for m in re.finditer(r"（[a-z][a-zA-Z ]{2,20}）", t):
        runs.append((i, "PAREN " + m.group(0)[:40]))
out = io.open("E:/math/_work/d06_en.txt", "w", encoding="utf-8", newline="\n")
for i, r in runs:
    out.write("%d | %s\n" % (i, r))
out.write("count=%d\n" % len(runs))
out.close()
print("hits", len(runs))
