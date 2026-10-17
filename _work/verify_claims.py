import io, re, glob

out = io.open("_work/verify_claims.txt", "w", encoding="utf-8")
SEP = "| --- | --- | --- | --- | --- |"
files = sorted(glob.glob("研究笔记/D*.md"))
multi = 0
for p in files:
    s = io.open(p, encoding="utf-8").read()
    if s.count(SEP) >= 2:
        multi += 1
out.write("notes=%d sep_ge2=%d\n" % (len(files), multi))

d04 = glob.glob("研究笔记/D04-*.md")[0]
L = io.open(d04, encoding="utf-8").read().split("\n")
for i, l in enumerate(L):
    if re.match(r"^## 35", l):
        out.write("D04 head@%d|%s\n" % (i + 1, l))

d137 = glob.glob("研究笔记/D137-*.md")[0]
M = io.open(d137, encoding="utf-8").read().split("\n")
for i, l in enumerate(M):
    if l.startswith("| 记号 |"):
        out.write("D137 cont_hdr@%d|%s\n" % (i + 1, l[:60]))
out.close()
print("ok")
