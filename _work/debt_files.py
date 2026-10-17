# -*- coding: utf-8 -*-
# 债表候选：列出每篇未覆盖 tex 的文件名，排除 references/bib 类素材
import io, glob, os, re

IDS = ["D463", "D358", "D225", "D710", "D137", "D713", "D325", "D476",
       "D627", "D259", "D118", "D718", "D499"]
out = io.open("E:/math/_work/debt_files.txt", "w", encoding="utf-8", newline="\n")
for i in IDS:
    f = glob.glob("E:/math/研究笔记/" + i + "-*.md")
    if not f:
        out.write(i + " NOFILE\n"); continue
    f = f[0]
    s = io.open(f, encoding="utf-8").read()
    m = re.search(r"preprints[/\\][^\s`'’”),），]{6,200}", s[:6000])
    if not m:
        out.write(i + " NODIR\n"); continue
    root = "E:/math/" + m.group(0).replace("\\", "/")
    if not os.path.isdir(root):
        out.write(i + " NOTDIR " + os.path.basename(root) + "\n"); continue
    heads = [l for l in s.split("\n") if l.startswith("## ")]
    unc = []
    for dp, dn, fn in os.walk(os.path.join(root, "build")):
        for x in fn:
            if not x.endswith(".tex"):
                continue
            rel = os.path.relpath(os.path.join(dp, x), root).replace("\\", "/")
            if rel not in s:
                unc.append((x, os.path.getsize(os.path.join(dp, x))))
    tot = sum(o[1] for o in sorted(unc, key=lambda z: -z[1]))
    out.write("%s bytes=%d secs=%d B/sec=%.0f unc=%d %dB  files=%s\n" % (
        i, len(s.encode("utf-8")), len(heads), len(s.encode("utf-8")) / max(1, len(heads)),
        len(unc), tot,
        ", ".join("%s:%d" % (x, z) for x, z in sorted(unc, key=lambda z: -z[1]))))
out.close()
print(io.open("E:/math/_work/debt_files.txt", encoding="utf-8").read())
