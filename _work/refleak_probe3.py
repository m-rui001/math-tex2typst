# -*- coding: utf-8 -*-
import io, re, glob, os
out = io.open("E:/math/_work/probe3_heads.txt", "w", encoding="utf-8", newline="\n")
for pat in ["D370", "D101", "D106", "D114", "D112", "D146", "D105", "D63", "D473",
            "D244", "D517", "D124", "D117", "D380", "D346", "D137", "D259"]:
    f = glob.glob(os.path.join("E:/math/研究笔记", pat + "-*.md"))
    out.write("==== %s nfiles=%d\n" % (pat, len(f)))
    if not f:
        continue
    p = f[0]
    txt = io.open(p, encoding="utf-8", errors="replace").read()
    lines = txt.split("\n")
    out.write("  file=%s nlines=%d CR=%d\n" % (os.path.basename(p), len(lines),
                                               io.open(p, "rb").read().count(b"\r")))
    for i, l in enumerate(lines):
        if re.match(r"^#{2,4} ", l):
            out.write("  H%d %s\n" % (i + 1, l[:110]))
out.close()
print("ok")
