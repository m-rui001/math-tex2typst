# -*- coding: utf-8 -*-
import io, glob, os, re

note = glob.glob("E:/math/研究笔记/D137-*.md")[0]
s = io.open(note, encoding="utf-8").read()
L = s.split("\n")
out = io.open("E:/math/_work/d137_debt.txt", "w", encoding="utf-8", newline="\n")
out.write("note=%s bytes=%d lines=%d CR=%d\n" % (os.path.basename(note), len(s.encode("utf-8")), len(L), s.count("\r")))

root = "E:/math/preprints/Strict-convexity-and-differentiability-of-the-planar-exponential-first-passage-limit-shape-September-24-2026/build"
rows = []
for dp, dn, fn in os.walk(root):
    for x in fn:
        if not x.endswith(".tex"):
            continue
        fp = os.path.join(dp, x)
        rel = os.path.relpath(fp, root).replace("\\", "/")
        full = "build/" + rel
        body = io.open(fp, encoding="utf-8", errors="replace").read()
        rows.append((full, len(body.encode("utf-8")), body.count("\n") + 1,
                     s.count(full), s.count(os.path.basename(x)),
                     len(re.findall(re.escape(os.path.basename(x)) + r":\d+", s))))
out.write("\nFILE | bytes | lines | fullpath_in_note | basename_in_note | refcolon\n")
for r in sorted(rows, key=lambda z: (z[3], z[4])):
    out.write("%-52s %7dB %5dL cite=%d base=%d refs=%d\n" % (r[0], r[1], r[2], r[3], r[4], r[5]))

heads = [(i + 1, l) for i, l in enumerate(L) if re.match(r"^## ", l)]
out.write("\nheads=%d first=%s last2=%s\n" % (len(heads), heads[0], heads[-2:]))
out.write("title_shape_sample:\n")
for i, l in heads[3:19]:
    out.write("  %d| %s\n" % (i, l))
# 符号表头 / SEP
hdr = [i + 1 for i, l in enumerate(L) if l.strip().startswith("|") and "符号" in l.split("|")[1] if len(l.split("|")) > 2]
out.write("\nsymbol_hdr_lines=%s sep_count=%d\n" % (hdr, s.count("| --- | --- | --- | --- | --- |")))
out.write("last8=%r\n" % (L[-8:],))
out.close()
print("ok")
