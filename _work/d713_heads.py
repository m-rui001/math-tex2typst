import io, glob, re

p = glob.glob("研究笔记/D713-*.md")[0]
s = io.open(p, encoding="utf-8").read()
L = s.split("\n")
out = io.open("_work/d713_heads.txt", "w", encoding="utf-8")
for i, l in enumerate(L):
    if l.startswith("#"):
        out.write("%d|%s\n" % (i + 1, l[:110]))
out.write("bytes=%d lines=%d CR=%d\n" % (len(s.encode("utf-8")), len(L), s.count("\r")))
SEP = "| --- | --- | --- | --- | --- |"
for i, l in enumerate(L):
    if l.startswith("| 符号 |") or l.startswith("| 记号 |") or SEP in l:
        out.write("TBL@%d|%s\n" % (i + 1, l[:110]))
out.close()
print("ok")
