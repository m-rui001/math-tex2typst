# -*- coding: utf-8 -*-
"""Dump several candidate declaration sections verbatim for rubric calibration."""
import io, os, re, glob

NOTES = r"E:\math" + "\\" + u"\u7814\u7a76\u7b14\u8bb0"
OUT = r"E:\math\_work\_probe3.txt"
KEYS = [u"\u52d8\u8bef", u"\u7533\u62a5", u"\u8865\u8bb0", u"\u81ea\u68c0", u"\u4ea4\u672c\u4f53\u4fa7"]

want = [u"D07-", u"D10-", u"D12-", u"D137-", u"D356-", u"D398-", u"D587-", u"D616-",
        u"D68-", u"D711-", u"D183-", u"D218-", u"D533-", u"D628-"]
files = sorted(glob.glob(os.path.join(NOTES, "D*.md")))
out = []
for p in files:
    b = os.path.basename(p)
    if not any(b.startswith(w) for w in want):
        continue
    t = io.open(p, encoding="utf-8", errors="replace").read()
    ls = t.split("\n")
    for i, l in enumerate(ls):
        if re.match(r"^#{2,4}\s", l) and any(k in l for k in KEYS):
            lvl = len(l) - len(l.lstrip("#"))
            j = i + 1
            while j < len(ls):
                m = ls[j]
                if re.match(r"^#{1,6}\s", m) and (len(m) - len(m.lstrip("#"))) <= lvl:
                    break
                j += 1
            out.append(u"===== %s  L%d(1-based) %s\n" % (b[:40], i + 1, l.strip()) + u"\n".join(ls[i:min(j, i + 60)]))
    if out and len(out) > 60:
        break
io.open(OUT, "w", encoding="utf-8").write(u"\n".join(out[-40:]))
print("blocks", len(out))
