# -*- coding: utf-8 -*-
import io, re, glob
o = io.open("E:/math/_work/probe12.txt", "w", encoding="utf-8", newline="\n")
for nid in ["D106", "D137"]:
    p = glob.glob("E:/math/研究笔记/" + nid + "-*.md")[0]
    lines = io.open(p, encoding="utf-8", errors="replace").read().split("\n")
    hd = [(i + 1, l) for i, l in enumerate(lines) if re.match(r"^#{2,4} ", l)]
    tilde = [(i, l) for i, l in hd if "~" in l]
    macro = [(i, l) for i, l in hd if re.search(r"[A-Za-z]{3,}\s*~\s*[A-Za-z]+:[A-Za-z0-9\-]+", l)]
    refcmd = [(i, l) for i, l in hd if re.search(r"\\(?:eq)?ref\{|\\label\{", l)]
    occ = [(i, l) for i, l in hd if re.search(r"~(?![\\])", l)]
    o.write("%s: headings=%d with-tilde=%d macro-Word~tag:name=%d with-ref-or-label-cmd=%d\n" % (
        nid, len(hd), len(tilde), len(macro), len(refcmd)))
    for i, l in tilde[:30]:
        o.write("   T%d %s\n" % (i, l[:100]))
    if nid == "D137":
        for i, l in refcmd:
            o.write("   R%d %s  (hits=%d)\n" % (i, l[:90], len(re.findall(r"\\(?:eq)?ref\{|\\label\{", l))))
o.close()
print("ok")
