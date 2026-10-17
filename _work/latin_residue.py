# -*- coding: utf-8 -*-
# 单个拉丁词残留：掩掉数学、代码跨度、tex 文件名与 URL 后数拉丁 token
import io, glob, re

CASES = [("D718", 1086), ("D04", 487)]
tok = re.compile(r"[A-Za-z][A-Za-z0-9.'\-]{1,}")
out = io.open("E:/math/_work/latin_residue.txt", "w", encoding="utf-8", newline="\n")
for key, frm in CASES:
    p = glob.glob("E:/math/研究笔记/%s-*.md" % key)[0]
    s = io.open(p, encoding="utf-8", newline="").read()
    L = s.split("\n")
    out.write("\n===== %s from %d =====\n" % (key, frm))
    n = 0
    for i in range(frm - 1, len(L)):
        line = L[i]
        m = re.sub(r"`[^`\n]*`", " ", line)
        m = re.sub(r"\$[^$]*\$", " ", m)
        m = re.sub(r"[A-Za-z0-9_\-]+\.(tex|md|yaml|json|pdf)", " ", m)
        m = re.sub(r"https?://\S+", " ", m)
        hits = tok.findall(m)
        if hits:
            n += 1
            out.write("%5d| %s || %s\n" % (i + 1, ",".join(hits)[:70], line.strip()[:140]))
    out.write("lines-with-latin=%d\n" % n)
out.close()
print("ok")
