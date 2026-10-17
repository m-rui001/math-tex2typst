# -*- coding: utf-8 -*-
"""Dump ORDER rows grouped by family for manual rubric review."""
import io, os, collections

WORK = r"E:\math\_work"
path = os.path.join(WORK, "workorders.tsv")
rows = []
with io.open(path, encoding="utf-8") as f:
    lines = f.read().split("\n")
hdr = lines[0].split("\t")
for ln in lines[1:]:
    if not ln.strip():
        continue
    p = ln.split("\t")
    if len(p) < len(hdr):
        p += [""] * (len(hdr) - len(p))
    rows.append(dict(zip(hdr, p)))

order = [r for r in rows if r["cat"] == "ORDER"]
byfam = collections.defaultdict(list)
for r in order:
    key = (r["fam"] or "none").split(",")[0]
    byfam[key].append(r)

out = []
out.append("ORDER total=%d" % len(order))
for k in sorted(byfam, key=lambda x: -len(byfam[x])):
    out.append("== fam=%s n=%d" % (k, len(byfam[k])))
    for r in byfam[k][:6]:
        out.append("  %s | stated=%s cur=%s ver=%s" % (r["id"], r["stated"], r["cur"], r["verified"]))
        out.append("    FIX: %s" % r["fix"][:180])
        out.append("    QUO: %s" % r["quote"][:200])
        out.append("    NOTE: %s" % r["verify_note"][:160])

with io.open(os.path.join(WORK, "_probe7.txt"), "w", encoding="utf-8") as f:
    f.write("\n".join(out))
print("ok")
