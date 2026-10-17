import io, glob, re

p = glob.glob("研究笔记/D713-*.md")[0]
L = io.open(p, encoding="utf-8").read().split("\n")
old = "\n".join(L[:544])
new = "\n".join(L[544:])
out = io.open("_work/d713_en.txt", "w", encoding="utf-8")
for w in ["generic", "一般", "primary", "准素", "field", "上域", "invert", "反演", "smooth", "大"]:
    out.write("%s old=%d new=%d\n" % (w, old.count(w), new.count(w)))
out.write("\n--- generic contexts in new region ---\n")
for i, l in enumerate(L[544:], start=545):
    for m in re.finditer("generic", l):
        a = max(0, m.start() - 22)
        out.write("%d|...%s...\n" % (i, l[a:m.end() + 14]))
out.close()
print("generic new=%d old=%d" % (new.count("generic"), old.count("generic")))
