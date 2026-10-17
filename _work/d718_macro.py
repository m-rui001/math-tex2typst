# -*- coding: utf-8 -*-
import io, glob, re, os

root = "E:/math/preprints/Uniform-quasipolynomial-time-trace-reconstruction-October-5-2026/build"
out = io.open("E:/math/_work/d718_macro.txt", "w", encoding="utf-8", newline="\n")
defs = []
for dp, dn, fn in os.walk(root):
    for x in fn:
        if not x.endswith(".tex"):
            continue
        fp = os.path.join(dp, x)
        for i, line in enumerate(io.open(fp, encoding="utf-8", errors="replace")):
            if re.search(r"\\(newcommand|renewcommand|DeclareMathOperator|providecommand)\s*\{?\\?(re|abs|norm|inner|ip|langl|mid)\b", line):
                defs.append((os.path.relpath(fp, root).replace("\\", "/"), i + 1, line.strip()[:160]))
out.write("PREAMBLE DEFS (%d)\n" % len(defs))
for d in defs:
    out.write("%s:%d| %s\n" % d)

p = glob.glob("E:/math/研究笔记/D718-*.md")[0]
L = io.open(p, encoding="utf-8").read().split("\n")
seg = L[1085:]
out.write("\nNEW REGION (line 1086..%d) counts\n" % len(L))
for name in [r"\re", r"\norm", r"\abs", r"\langl", r"\inner", r"\ip"]:
    pat = re.compile(re.escape(name) + r"(?![A-Za-z])")
    tot = sum(len(pat.findall(l)) for l in seg)
    bt = [(1086 + i) for i, l in enumerate(seg) if "`" in l and pat.search(l)]
    lines = [(1086 + i) for i, l in enumerate(seg) if pat.search(l)]
    out.write("%-9s total=%3d lines=%d in_backtick_lines=%s\n" % (name, tot, len(lines), bt))
# 全 note 命中（含旧区）
full = "\n".join(L)
out.write("\nWHOLE NOTE: re=%d norm=%d abs=%d\n" % (
    len(re.findall(r"\\re(?![A-Za-z])", full)), len(re.findall(r"\\norm(?![A-Za-z])", full)),
    len(re.findall(r"\\abs(?![A-Za-z])", full))))
out.close()
print("ok defs=%d" % len(defs))
