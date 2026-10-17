# -*- coding: utf-8 -*-
import io, os, json, collections
OUTD = r"E:\math\_work\_woprep"
D = json.load(io.open(os.path.join(OUTD, "rows2.json"), encoding="utf-8"))
rows = D["rows"]
WANT = {("D545", 451), ("D597", 335), ("D416", 624), ("D742", 298), ("D759", 940),
        ("D765", 581), ("D467", 205), ("D480", 270)}
buf = []
for r in rows:
    if (r["d"], r["line"]) in WANT:
        buf.append(json.dumps(r, ensure_ascii=False, indent=1))
io.open(os.path.join(OUTD, "p_rows.txt"), "w", encoding="utf-8").write(u"\n".join(buf))
print(json.dumps({"n": len(buf)}))
print(json.dumps(collections.Counter(r["kind_from"] for r in rows), ensure_ascii=False))
print(json.dumps(collections.Counter(r["switched"] for r in rows), ensure_ascii=False))
