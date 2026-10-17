import io, re, glob, os

out = io.open("_work/d235_state.txt", "w", encoding="utf-8")
p = glob.glob("研究笔记/D235-*.md")[0]
s = io.open(p, encoding="utf-8").read()
L = s.split("\n")
heads = [(i + 1, l) for i, l in enumerate(L) if re.match(r"^## ", l)]
for n, t in heads:
    out.write("%d|%s\n" % (n, t[:80]))
out.write("heads=%d bytes=%d lines=%d CR=%d\n" % (len(heads), len(s.encode("utf-8")), len(L), s.count("\r")))
HDR = None
for i, l in enumerate(L):
    if l.startswith("| 符号 |") or l.startswith("| 记号 |"):
        out.write("HDR@%d|%s\n" % (i + 1, l[:120]))
out.write("SEP=%d\n" % s.count("| --- | --- | --- | --- | --- |"))
out.close()
print("ok")
