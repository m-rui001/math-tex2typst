# -*- coding: utf-8 -*-
import io, sys, glob, os, json
NOTES = r"E:\math\研究笔记"
OUT = r"E:\math\_work\_woprep\p_peek2.txt"
WANT = [("D416", 624), ("D742", 298), ("D467", 205), ("D467", 305), ("D480", 270),
        ("D759", 940), ("D765", 581), ("D545", 451), ("D597", 268), ("D597", 335)]
buf = []
for d, n in WANT:
    p = glob.glob(os.path.join(NOTES, d + u"-*.md"))[0]
    ls = io.open(p, "rb").read().decode("utf-8", "replace").split(u"\n")
    buf.append(u"=== %s L%d" % (d, n))
    buf.append(ls[n - 1].strip()[:500])
io.open(OUT, "w", encoding="utf-8").write(u"\n".join(buf))
print(json.dumps({"n": len(WANT)}))
