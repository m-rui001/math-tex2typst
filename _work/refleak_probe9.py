# -*- coding: utf-8 -*-
import io, re, glob, os, json
occ = json.load(io.open("E:/math/_work/refleak_occ.json", encoding="utf-8"))
want = [("D110", 125), ("D101", 88), ("D102", 631), ("D114", 1671), ("D115", 717), ("D134", 308), ("D120", 585)]
o = io.open("E:/math/_work/probe9.txt", "w", encoding="utf-8", newline="\n")
for nid, ln in want:
    p = glob.glob(os.path.join("E:/math/研究笔记", nid + "-*.md"))[0]
    raw = io.open(p, encoding="utf-8", errors="replace").read().split("\n")[ln - 1]
    o.write("\n===== %s:%d\n%s\n" % (nid, ln, raw))
    for x in occ:
        if x["id"] == nid and x["line"] == ln:
            o.write("   col=%d arg=%r cat=%s pat=%s cjk=%d inquote=%s\n" % (
                x["col"], x["arg"], x["cat"], x["pat"], x["cjk"], x["inquote"]))
            o.write("   context +-60: %s\n" % raw[max(0, x["col"] - 60):x["col"] + 60].replace("\n", " "))
o.close()
print("ok")
