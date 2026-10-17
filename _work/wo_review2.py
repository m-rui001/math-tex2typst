# -*- coding: utf-8 -*-
# 复核 digest v2：按 kind/verdict/kind_from 过滤，写 UTF-8 文件给人读
import io, json, sys

OUTD = r"E:\math\_work\_woprep"
D = json.load(io.open(OUTD + r"\rows2.json", encoding="utf-8"))
R = D["rows"]
sel = sys.argv[1].split(u",") if len(sys.argv) > 1 and sys.argv[1] else None
ver = sys.argv[2].split(u",") if len(sys.argv) > 2 and sys.argv[2] else None
frm = sys.argv[3].split(u",") if len(sys.argv) > 3 and sys.argv[3] else None
path = sys.argv[4] if len(sys.argv) > 4 else OUTD + r"\review.txt"

rows = [r for r in R if (not sel or r["kind"] in sel) and (not ver or r["verdict"] in ver)
        and (not frm or r.get(u"kind_from", u"") in frm)]
rows.sort(key=lambda r: (r["kind"], r["verdict"], r["d"], r["line"]))
out = io.open(path, "w", encoding="utf-8")
for r in rows:
    out.write(u"@@ %s|%s|L%d|%s|nc=%d|nc_incl=%d|from=%s|pats=%s\n" % (
        r["kind"], r["verdict"], r["line"], r["d"], r["now_count"], r["now_count_incl"],
        r.get(u"kind_from", u""), u",".join(r["pats"])))
    m = r["metrics"]
    out.write(u"FM pipe=%d closer=%d/%d ban=%d/%d hdr=%d glued=%d dup=%d\n" % (
        m["pipe"], m["closer_strict"], m["closer_incl"], m["ban_strict"], m["ban_incl"],
        m["hdr_extra"], m["head_glued"], m["dup_paras"]))
    out.write(u"T: %s\n" % r["target"].replace(u"|", u"¦"))
    out.write(u"Q: %s\n" % r["quote"].replace(u"|", u"¦"))
    out.write(u"F: %s\n" % r["fix"].replace(u"|", u"¦"))
    if r["probe"]:
        out.write(u"P: %s\n" % json.dumps(r["probe"], ensure_ascii=False))
    out.write(u"\n")
out.close()
print(json.dumps({"written": len(rows)}))
