# -*- coding: utf-8 -*-
import io, glob, os, re, json

ID = "D137"
f = glob.glob("E:/math/研究笔记/" + ID + "-*.md")[0]
s = io.open(f, encoding="utf-8").read()
L = s.split("\n")
heads = [(i + 1, l) for i, l in enumerate(L) if l.startswith("## ")]
m = re.search(r"preprints[/\\][^\s`'’”),），]{6,200}", s[:6000])
root = "E:/math/" + m.group(0).replace("\\", "/")
D = os.path.basename(root)
sib = [os.path.basename(x) for x in glob.glob("E:/math/preprints/" + D[:40] + "*")]
tex = []
for dp, dn, fn in os.walk(os.path.join(root, "build")):
    for x in fn:
        if x.endswith(".tex"):
            fp = os.path.join(dp, x)
            tex.append((os.path.relpath(fp, root).replace("\\", "/"), os.path.getsize(fp),
                        io.open(fp, encoding="utf-8", errors="replace").read().count("\n") + 1))
cited = set()
for l in L:
    cited |= set(re.findall(r"[0-9A-Za-z_][0-9A-Za-z_.\-]{0,60}\.tex", l))
out = io.open("E:/math/_work/precheck_D137.txt", "w", encoding="utf-8", newline="\n")
out.write("note=%s bytes=%d lines=%d CR=%d heads=%d B/sec=%.0f\n" % (
    os.path.basename(f), len(s.encode("utf-8")), len(L), s.count("\r"), len(heads),
    len(s.encode("utf-8")) / max(1, len(heads))))
out.write("dir=%s exact=%s siblings=%d %s\n" % (D, os.path.isdir(root), len(sib), json.dumps(sib, ensure_ascii=False)))
out.write("sep=%d hdr_fu=%d hdr_ji=%d\n" % (
    s.count(u"| --- | --- | --- | --- | --- |"),
    len(re.findall(u"(?m)^\\| *符号 *\\|", s)), len(re.findall(u"(?m)^\\| *记号 *\\|", s))))
out.write("first_head=%s\nlast_head(line %d)=%s\n" % (heads[0][1], heads[-1][0], heads[-1][1]))
out.write("all_heads=%s\n" % json.dumps([h[1] for h in heads], ensure_ascii=False))
out.write("tail4=%s\n" % json.dumps(L[-4:], ensure_ascii=False))
for t, sz, ln in sorted(tex, key=lambda z: -z[1]):
    out.write("%-46s %7dB %5dL %s\n" % (t, sz, ln, "" if os.path.basename(t) in cited else "UNCITED"))
out.close()
print("ok")
