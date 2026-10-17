# -*- coding: utf-8 -*-
import io, os, glob, json
NOTES = r"E:\math\研究笔记"
OUT = r"E:\math\_work\_woprep\p_peek3.txt"
WANT = [("D545", 445, 460), ("D416", 618, 628)]
buf = []
for d, a, b in WANT:
    p = glob.glob(os.path.join(NOTES, d + u"-*.md"))[0]
    ls = io.open(p, "rb").read().decode("utf-8", "replace").split(u"\n")
    buf.append(u"##### %s L%d-%d" % (d, a, b))
    for i in range(a, b + 1):
        buf.append(u"%d| %s" % (i, ls[i - 1].strip()[:300]))
io.open(OUT, "w", encoding="utf-8").write(u"\n".join(buf))
print(json.dumps({"n": len(WANT)}))
