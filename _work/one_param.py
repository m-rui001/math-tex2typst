# -*- coding: utf-8 -*-
# 用法：python _work/one_param.py <ID>  （dir 从笔记 §0 的 preprints 路径取得）
import io, glob, os, re, sys, json

key = sys.argv[1]
p = glob.glob("E:/math/研究笔记/%s-*.md" % key)[0]
s = io.open(p, encoding="utf-8", newline="").read()
L = s.split("\n")
out = io.open("E:/math/_work/param_%s.txt" % key, "w", encoding="utf-8", newline="\n")
out.write("note=%s\nbytes=%d lines=%d CR=%d\n" % (p, len(s.encode("utf-8")), len(L), s.count("\r")))
dirs = [d for d in re.findall(r"preprints/([A-Za-z0-9._\-]+)", s[:9000])
        if os.path.isdir("E:/math/preprints/" + d)]
d = max(set(dirs), key=dirs.count)
out.write("dir=%s\n" % d)
heads = [(i + 1, l) for i, l in enumerate(L) if re.match(r"^#{2,3} ", l)]
out.write("heads=%d first=%s last=%s\n" % (len(heads), heads[0], heads[-1]))
out.write("last6=%s\n" % json.dumps([h[1][:70] for h in heads[-6:]], ensure_ascii=False))
syms = [(i + 1, l.split("|")[1].strip()) for i, l in enumerate(L)
        if l.startswith("|") and len(l.split("|")) > 2 and l.split("|")[1].strip() in ("符号", "记号")]
seps = [i + 1 for i, l in enumerate(L) if l.strip() == "| --- | --- | --- | --- | --- |"]
out.write("table_headers=%s separators=%s\n" % (syms, seps))
out.write("cite_form full=%d base=%d\n" % (len(re.findall(r"build/[A-Za-z0-9_./\-]+\.tex:\d+", s)),
                                           len(re.findall(r"(?<![/\w])[A-Za-z0-9_\-]+\.tex:\d+", s))))
root = "E:/math/preprints/" + d + "/build"
inv = []
for dp, dn, fn in os.walk(root):
    for x in fn:
        if x.endswith(".tex"):
            fp = os.path.join(dp, x)
            rel = os.path.relpath(fp, root).replace("\\", "/")
            body = io.open(fp, encoding="utf-8", errors="replace").read()
            inv.append((rel, os.path.getsize(fp), body.count("\n") + 1,
                        len(re.findall(re.escape(x) + r":\d+", s))))
out.write("inventory:\n")
for z in sorted(inv, key=lambda q: -q[1]):
    out.write("  %-46s %7dB %5dL refs=%d\n" % z)
out.write("  TOTAL %dB files=%d\n" % (sum(z[1] for z in inv), len(inv)))
out.close()
print("ok")
