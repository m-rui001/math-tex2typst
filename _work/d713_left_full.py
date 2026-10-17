import io, glob, re

p = glob.glob("研究笔记/D713-*.md")[0]
L = io.open(p, encoding="utf-8").read().split("\n")
out = io.open("_work/d713_left_full.txt", "w", encoding="utf-8")
for i, l in enumerate(L):
    if re.search(r"primary|overfield|invert", l):
        out.write("=== %d\n%s\n" % (i + 1, l))
out.close()
print("ok")
