import io, glob, re

p = glob.glob("研究笔记/D713-*.md")[0]
L = io.open(p, encoding="utf-8").read().split("\n")
out = io.open("_work/d713_move.txt", "w", encoding="utf-8")
for n in [884, 885, 886, 887, 888, 889, 908, 909, 910, 911, 912, 913, 914, 915, 916, 917, 918, 919]:
    out.write("=== %d (len=%d)\n%s\n" % (n, len(L[n - 1]), L[n - 1]))
out.write("\n=== english forms in new region (545+)\n")
reg = "\n".join(L[544:])
for w in ["generic", "prime", "generic点", "准素", "上域", "反演"]:
    out.write("%s=%d\n" % (w, reg.count(w)))
out.write("\n=== latin words freq (new region)\n")
cnt = {}
for w in re.findall(r"[A-Za-z]{4,}", reg):
    cnt[w] = cnt.get(w, 0) + 1
for w, c in sorted(cnt.items(), key=lambda z: -z[1])[:25]:
    out.write("%s %d\n" % (w, c))
out.close()
print("ok")
