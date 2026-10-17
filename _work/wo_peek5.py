# -*- coding: utf-8 -*-
import io, os, glob, re, json
NOTES = r"E:\math\研究笔记"
OUT = r"E:\math\_work\_woprep\p_probe.txt"
RX1 = re.compile(u"[、，]\\s*[:：]\\s*\\d*\\s*$")
buf = []
p = glob.glob(os.path.join(NOTES, u"D742-*.md"))[0]
ls = io.open(p, "rb").read().decode("utf-8", "replace").split(u"\n")
tot = 0
for i, l in enumerate(ls):
    if RX1.search(l.rstrip()):
        tot += 1
        if tot <= 8:
            buf.append(u"%d| %s" % (i + 1, l.strip()[:200]))
buf.insert(0, u"D742 junk_lines=%d of %d" % (tot, len(ls)))
buf.append(u"--- context L294-300 ---")
for i in range(294, 301):
    buf.append(u"%d| %s" % (i, ls[i - 1].strip()[:220]))
io.open(OUT, "w", encoding="utf-8").write(u"\n".join(buf))
print(json.dumps({"hits": tot}))
