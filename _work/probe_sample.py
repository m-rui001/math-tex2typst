# -*- coding: utf-8 -*-
"""Sample rows per category for rubric review."""
import io, random, collections
rows = [l.rstrip("\n").split("\t") for l in io.open(r"E:\math\_work\workorders.tsv", encoding="utf-8")]
hdr = rows[0]
data = [dict(zip(hdr, r)) for r in rows[1:] if len(r) == len(hdr)]
out = io.open(r"E:\math\_work\_probe4.txt", "w", encoding="utf-8")
random.seed(7)
for cat in ["JUDGMENT", "WAIVER", "KEEP", "ORDER"]:
    sub = [d for d in data if d["cat"] == cat]
    out.write(u"\n########## %s  n=%d\n" % (cat, len(sub)))
    for d in random.sample(sub, min(35, len(sub))):
        out.write(u"--- %s | %s | secL%s | stated=%s cur=%s ver=%s\n    LABEL %s\n    QUOTE %s\n    FIX %s\n    EV %s | %s\n"
                  % (d["id"], d["note"][:26], d["sec_line"], d["stated"], d["cur"], d["verified"],
                     d["label"], d["quote"], d["fix"], d["evidence"], d["how"]))
# label frequency inside JUDGMENT to see garbage
c = collections.Counter(d["label"][:12] for d in data if d["cat"] == "JUDGMENT")
out.write("\n#### JUDGMENT label heads\n")
for k, v in c.most_common(40):
    out.write(u"%4d %s\n" % (v, k))
out.close()
print("n=", len(data))
