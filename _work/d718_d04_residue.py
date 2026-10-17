# -*- coding: utf-8 -*-
# 英文残留 + 花括号失衡 + 禁串同形 三查（新区域）
import io, glob, re, sys

CASES = [("D718", 1086), ("D04", 487)]
tex_name = re.compile(r"[A-Za-z0-9_\-]+\.tex")
eng = re.compile(r"(?:[A-Za-z][A-Za-z.\-]*[ ]){2,}[A-Za-z][A-Za-z.\-]*")
out = io.open("E:/math/_work/d718_d04_residue.txt", "w", encoding="utf-8", newline="\n")
for key, frm in CASES:
    p = glob.glob("E:/math/研究笔记/%s-*.md" % key)[0]
    s = io.open(p, encoding="utf-8", newline="").read()
    L = s.split("\n")
    out.write("\n===== %s new region from %d =====\n" % (key, frm))
    res = []
    for i in range(frm - 1, len(L)):
        line = L[i]
        m = re.sub(r"`[^`\n]*`", " ", line)
        m = re.sub(r"\$[^$]*\$", " ", m)
        m = tex_name.sub(" ", m)
        for g in eng.finditer(m):
            res.append("%d| %s || %s" % (i + 1, g.group(0)[:60], line.strip()[:130]))
    out.write("ENGLISH-RUN=%d\n" % len(res))
    for r in res:
        out.write("  " + r + "\n")
    # 花括号失衡（仅行内式行，排除环境行）
    bad = []
    for i in range(frm - 1, len(L)):
        line = L[i]
        if "$" not in line:
            continue
        seg = re.sub(r"`[^`\n]*`", "", line)
        if re.search(r"\\(begin|end|substack|boxed|middle)\b", seg):
            continue
        lb = len(re.findall(r"(?<!\\)\{", seg))
        rb = len(re.findall(r"(?<!\\)\}", seg))
        if lb != rb:
            bad.append("%d| diff=%+d | %s" % (i + 1, lb - rb, line.strip()[:150]))
    out.write("BRACE-IMBALANCE=%d\n" % len(bad))
    for b in bad:
        out.write("  " + b + "\n")
    # 禁串同形
    ban = re.compile(r"不是.{0,20}而是|而不是|而非|(?<![因反从进])而是|值得注意的是|需要指出的是|换句话说|综上|总体而言|—|✓")
    hits = ["%d| %s" % (i + 1, l.strip()[:140]) for i, l in enumerate(L) if ban.search(l)]
    out.write("BAN-SHAPE(full note)=%d\n" % len(hits))
    for h in hits[:20]:
        out.write("  " + h + "\n")
out.close()
print("ok")
