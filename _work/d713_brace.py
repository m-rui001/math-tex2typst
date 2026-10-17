import io, glob

p = glob.glob("研究笔记/D713-*.md")[0]
L = io.open(p, encoding="utf-8").read().split("\n")
out = io.open("_work/d713_brace.txt", "w", encoding="utf-8")
bad = []
for i in range(765, 815):
    l = L[i]
    o = l.count("{") - l.count("\\{")
    c = l.count("}") - l.count("\\}")
    if o != c:
        bad.append(i + 1)
        out.write("=== %d open=%d close=%d\n%s\n" % (i + 1, l.count("{"), l.count("}"), l))
out.write("unbalanced=%s\n" % bad)
out.close()
print("unbalanced", bad)
