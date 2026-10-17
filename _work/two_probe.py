# -*- coding: utf-8 -*-
import io, glob, os, re

out = io.open("E:/math/_work/two_probe.txt", "w", encoding="utf-8", newline="\n")
for ID in ["D710", "D627", "D718"]:
    f = glob.glob("E:/math/研究笔记/" + ID + "-*.md")[0]
    s = io.open(f, encoding="utf-8").read()
    lines = s.split("\n")
    heads = [l for l in lines if l.startswith("## ")]
    m = re.search(r"preprints[/\\][^\s`'’”),），]{6,200}", s[:6000])
    root = "E:/math/" + m.group(0).replace("\\", "/")
    tex = sorted(glob.glob(os.path.join(root, "**", "*.tex"), recursive=True))
    cited = set()
    for l in lines:
        cited |= set(re.findall(r"[0-9A-Za-z_][0-9A-Za-z_.\-]{0,60}\.tex", l))
    unc = [t for t in tex if os.path.basename(t) not in cited]
    out.write("=== %s bytes=%d heads=%d B/sec=%.0f\n" % (
        ID, len(s.encode("utf-8")), len(heads), len(s.encode("utf-8")) / max(1, len(heads))))
    out.write("dir=%s tex=%d total=%dB unc=%d %dB\n" % (
        os.path.basename(root), len(tex), sum(os.path.getsize(t) for t in tex),
        len(unc), sum(os.path.getsize(t) for t in unc)))
    for t in unc:
        out.write("  UNC %8dB %4dL %s\n" % (os.path.getsize(t),
                io.open(t, encoding="utf-8", errors="replace").read().count("\n") + 1,
                t[len(root) + 1:].replace(os.sep, "/")))
    out.write("headlines=%s\n" % json_head(heads)) if False else None
    out.write("last5=%s\n" % " || ".join(heads[-5:]))
out.close()
print("ok")
