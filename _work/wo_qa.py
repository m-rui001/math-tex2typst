# -*- coding: utf-8 -*-
import io, json, collections, sys
sys.path.insert(0, r"E:\math\_work")
from wo_lex import KW
OUTD = r"E:\math\_work\_woprep"
R = json.load(io.open(OUTD + r"\rows2.json", encoding="utf-8"))["rows"]
q = collections.Counter()
linelvl = collections.defaultdict(list)
for r in R:
    k = r["kind"]
    inLine = any(w in r["quote"] for w in KW.get(k, []))
    q[(k, r["verdict"], inLine)] += 1
    if k == u"ban_style" and not inLine:
        linelvl[u"ban_only_window"].append((r["d"], r["line"], r["verdict"], r["kinds_all"]))
print(json.dumps(sorted(q.items())))
print(json.dumps({"ban_window_only": len(linelvl[u"ban_only_window"])}))
# distribution of now_count for STALE evidence
for k in [u"ban_style", u"closer_char", u"bare_pipe", u"latin_residue", u"other"]:
    st = [r for r in R if r["kind"] == k and r["verdict"] == u"STALE"]
    print(json.dumps({k: {"stale": len(st), "incl_nonzero": sum(1 for r in st if r["now_count_incl"] > 0)}}))
# files ranking
c = collections.Counter(r["d"] for r in R)
print(json.dumps(c.most_common(15)))
c2 = collections.Counter(r["d"] for r in R if r["verdict"] == u"ORDER")
print(json.dumps(c2.most_common(15)))
# how many distinct notes have ORDER rows
print(json.dumps({"notes_with_order": len(c2), "notes_with_rows": len(c)}))
