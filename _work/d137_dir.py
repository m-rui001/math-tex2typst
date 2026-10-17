# -*- coding: utf-8 -*-
import io, glob, os, re, json

CAND = "Strict-convexity-and-differentiability-of-the-planar-exponential-first-passage-limit-shape-September-24-2026"
root = "E:/math/preprints/" + CAND
out = io.open("E:/math/_work/d137_dir.txt", "w", encoding="utf-8", newline="\n")
out.write("exact=%s siblings=%s\n" % (os.path.isdir(root),
        json.dumps([os.path.basename(x) for x in glob.glob("E:/math/preprints/Strict-convexity*")], ensure_ascii=False)))
tex = []
for dp, dn, fn in os.walk(os.path.join(root, "build")):
    for x in fn:
        if x.endswith(".tex"):
            fp = os.path.join(dp, x)
            tex.append((os.path.relpath(fp, root).replace("\\", "/"), os.path.getsize(fp),
                        io.open(fp, encoding="utf-8", errors="replace").read().count("\n") + 1))
for t, sz, ln in sorted(tex, key=lambda z: -z[1]):
    out.write("%-44s %8dB %5dL\n" % (t, sz, ln))
out.write("total=%dB files=%d\n" % (sum(z[1] for z in tex), len(tex)))

# §0 前 1200 字看登记形态
p = glob.glob("E:/math/研究笔记/D137-*.md")[0]
s = io.open(p, encoding="utf-8").read()
out.write("\nHEAD600=%s\n" % s[:600])
out.close()
print("ok")
