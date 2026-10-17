# -*- coding: utf-8 -*-
"""Quick scale probe: which notes carry author-declared defect sections."""
import io, os, re, glob, sys

NOTES = r"E:\math" + "\\" + u"\u7814\u7a76\u7b14\u8bb0"
OUT = r"E:\math\_work\_probe1.txt"

KEYS = [u"\u52d8\u8bef", u"\u7533\u62a5", u"\u8865\u8bb0", u"\u81ea\u68c0", u"\u4ea4\u672c\u4f53\u4fa7"]
# 勘误 申报 补记 自检 交本体侧

files = sorted(glob.glob(os.path.join(NOTES, "D*.md")))
lines_out = []
tot_sec = 0
for p in files:
    t = io.open(p, encoding="utf-8", errors="replace").read()
    ls = t.split("\n")
    hits = []
    for i, l in enumerate(ls, 1):
        if re.match(r"^#{2,4}\s", l):
            if any(k in l for k in KEYS):
                hits.append((i, l.strip()))
    if hits:
        tot_sec += len(hits)
        lines_out.append(u"%s\t%d\t%s" % (os.path.basename(p)[:40], len(hits), u" || ".join(h[1][:60] for h in hits)))

with io.open(OUT, "w", encoding="utf-8") as f:
    f.write(u"files=%d notes_with_sections=%d sections=%d\n" % (len(files), len(lines_out), tot_sec))
    f.write(u"\n".join(lines_out))
print("files=%d notes=%d sections=%d" % (len(files), len(lines_out), tot_sec))
