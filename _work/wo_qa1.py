# -*- coding: utf-8 -*-
import io, os, json, collections
OUTD = r"E:\math\_work\_woprep"
D = json.load(io.open(os.path.join(OUTD, "rows2.json"), encoding="utf-8"))
rows = D["rows"]
WANT = set([(u"D545", 451), (u"D597", 335), (u"D416", 624), (u"D742", 298),
            (u"D759", 940), (u"D765", 581), (u"D467", 205), (u"D467", 305),
            (u"D480", 270), (u"D419", 461), (u"D419", 563)])
buf = []
idx = {}
for r in rows:
    idx[(r["d"], r["line"])] = r
for k in sorted(WANT):
    r = idx.get(k)
    if r is None:
        buf.append(u"### MISSING %s L%d" % k)
        continue
    buf.append(u"### %s L%d kind=%s from=%s nc=%s verdict=%s kinds_all=%s sw=%s"
               % (r["d"], r["line"], r["kind"], r["kind_from"], r["now_count"],
                  r["verdict"], u",".join(r["kinds_all"]), r["switched"]))
    buf.append(u"Q: " + r["quote"][:160])
io.open(os.path.join(OUTD, "p_qa1.txt"), "w", encoding="utf-8").write(u"\n".join(buf))
neg = collections.Counter((r["kind"], r["verdict"]) for r in rows if r["now_count"] < 0)
print(json.dumps(sorted(neg.items())))
print(json.dumps({"n": len(rows)}))
