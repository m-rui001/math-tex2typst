# -*- coding: utf-8 -*-
# 紧凑 digest：一行一枚，便于批量眼检
import io, json, sys

OUTD = r"E:\math\_work\_woprep"
R = json.load(io.open(OUTD + r"\rows2.json", encoding="utf-8"))["rows"]
sel = sys.argv[1].split(u",") if sys.argv[1] else None
ver = sys.argv[2].split(u",") if sys.argv[2] else None
path = sys.argv[3]
rows = [r for r in R if (not sel or r["kind"] in sel) and (not ver or r["verdict"] in ver)]
rows.sort(key=lambda r: (r["d"], r["line"]))
out = io.open(path, "w", encoding="utf-8")
for r in rows:
    out.write(u"%s|L%d|nc=%d|%s|%s\n" % (r["d"], r["line"], r["now_count"],
                                         r["kind_from"][:4], r["quote"][:110].replace(u"|", u"¦")))
out.close()
print(json.dumps({"written": len(rows)}))
