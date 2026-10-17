# -*- coding: utf-8 -*-
# 复核 digest：按需筛选行，输出给人读的文件（stdout 只打 ASCII 计数）
import io, json, sys, collections

OUTD = r"E:\math\_work\_woprep"
D = json.load(io.open(OUTD + r"\rows.json", encoding="utf-8"))
R = D["rows"]
sel = sys.argv[1].split(u",") if len(sys.argv) > 1 and sys.argv[1] else None
ver = sys.argv[2].split(u",") if len(sys.argv) > 2 and sys.argv[2] else None
cap = int(sys.argv[3]) if len(sys.argv) > 3 else 9999
path = sys.argv[4] if len(sys.argv) > 4 else OUTD + r"\review.txt"

rows = [r for r in R if (not sel or r["kind"] in sel) and (not ver or r["verdict"] in ver)]
rows.sort(key=lambda r: (r["kind"], r["verdict"], r["d"], r["line"]))
out = io.open(path, "w", encoding="utf-8")
n = 0
for r in rows:
    n += 1
    if n > cap:
        break
    out.write(u"@@ %s|%s|L%d|%s|nc=%d|nc_incl=%d|pats=%s\n" % (
        r["kind"], r["verdict"], r["line"], r["d"], r["now_count"], r["now_count_incl"], u",".join(r["pats"])))
    out.write(u"FM pipe=%d closer=%d/%d ban=%d/%d\n" % (
        r["file_metrics"]["pipe"], r["file_metrics"]["closer_strict"],
        r["file_metrics"]["closer_incl"], r["file_metrics"]["ban_strict"],
        r["file_metrics"]["ban_incl"]))
    out.write(u"Q: %s\n" % r["quote"])
    out.write(u"F: %s\n" % r["fix"].replace(u"|", u"¦"))
    if r["probe"]:
        out.write(u"P: %s\n" % json.dumps(r["probe"], ensure_ascii=False))
    out.write(u"\n")
out.close()
print(json.dumps({"written": min(n, cap), "matched": len(rows), "path_len": len(path)}))
