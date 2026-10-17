# -*- coding: utf-8 -*-
"""Read workorders.tsv and print selected slices for review."""
import io, sys, collections
P = r"E:\math\_work\workorders.tsv"
rows = [l.rstrip("\n").split("\t") for l in io.open(P, encoding="utf-8")]
hdr = rows[0]
data = [dict(zip(hdr, r)) for r in rows[1:] if len(r) == len(hdr)]
out = io.open(r"E:\math\_work\_probe5.txt", "w", encoding="utf-8")
out.write(u"rows=%d bad=%d\n" % (len(data), len(rows) - 1 - len(data)))
sel = sys.argv[1] if len(sys.argv) > 1 else "D370"
for d in data:
    if sel in d["note"]:
        out.write(u"== %s | %s | %s | stated=%s cur=%s ver=%s\n   L %s\n   Q %s\n   F %s\n   N %s\n"
                  % (d["id"], d["cat"], d["fam"], d["stated"], d["cur"], d["verified"],
                     d["label"], d["quote"], d["fix"], d["verify_note"]))
out.close()
print("wrote", sel)
