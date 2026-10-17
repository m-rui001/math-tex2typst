# -*- coding: utf-8 -*-
# PROBE 10: numbers needed for the report
import io, json, collections, re
occ = json.load(io.open("E:/math/_work/refleak_occ.json", encoding="utf-8"))
ins = [o for o in occ if o["inc"]]
adv_rows = [l.rstrip("\n").split("\t") for l in io.open("E:/math/_work/refleak_catB_advice.tsv", encoding="utf-8")][1:]
o = io.open("E:/math/_work/probe10.txt", "w", encoding="utf-8", newline="\n")
o.write("notes in plan tsv=%d\n" % (len(io.open("E:/math/_work/refleak_plan.tsv", encoding="utf-8").read().split("\n")) - 2))
o.write("CAT=%s\n" % json.dumps(collections.Counter(x["cat"] for x in ins)))
o.write("CAT notes=%s\n" % json.dumps({c: len({x["id"] for x in ins if x["cat"] == c}) for c in "ABCDE"}))
o.write("PAT=%s\n" % json.dumps(collections.Counter(x["pat"] for x in ins).most_common()))
buckets = collections.Counter()
for r in adv_rows:
    if r[3] != "B":
        continue
    a = r[8]
    if a.startswith("delete-token"):
        buckets["B-delete(already-covered-by-pos-str)"] += 1
    elif a.startswith("keep-as-code"):
        buckets["B-keep-as-code"] += 1
    elif "必读" in a:
        buckets["B-rewrite-pos-AMBIGUOUS-same-label-multi-file"] += 1
    elif "须核对" in a:
        buckets["B-rewrite-pos-same-file-other-lineno"] += 1
    else:
        buckets["B-rewrite-pos-clean"] += 1
o.write("B buckets=%s\n" % json.dumps(buckets))
o.write("advice rows total=%d (all cats)=%d\n" % (sum(buckets.values()), len(adv_rows)))
# top notes
by = collections.defaultdict(list)
for x in ins:
    by[x["id"]].append(x)
o.write("TOP10=%s\n" % json.dumps([(n, len(r), collections.Counter(z["cat"] for z in r).most_common())
                                   for n, r in sorted(by.items(), key=lambda z: -len(z[1]))[:10]], ensure_ascii=False))
o.write("notes with any B=%d ; notes with only C=%d\n" % (
    len({x["id"] for x in ins if x["cat"] == "B"}),
    sum(1 for n, r in by.items() if {z["cat"] for z in r} == {"C"})))
o.write("D137 head distinct lines=%d ; forms=%s\n" % (
    len({x["line"] for x in ins if x["kind"] == "head"}),
    json.dumps(collections.Counter(x["lead"] for x in ins if x["kind"] == "head"))))
o.write("E ids=%s\n" % json.dumps([(x["id"], x["line"], x["arg"], x["pat"]) for x in ins if x["cat"] == "E"], ensure_ascii=False))
o.write("A ids=%s\n" % json.dumps([(x["id"], x["line"], x["arg"]) for x in ins if x["cat"] == "A"], ensure_ascii=False))
o.write("D rows by note=%s\n" % json.dumps(collections.Counter(x["id"] for x in ins if x["cat"] == "D")))
o.write("fence notes=%d ; fence-only notes=%d\n" % (
    len({x["id"] for x in ins if x["fence"]}),
    sum(1 for n, r in by.items() if all(z["fence"] for z in r))))
o.write("C sub-buckets=%s\n" % json.dumps(collections.Counter(x["pat"] for x in ins if x["cat"] == "C").most_common()))
o.write("C with decl-word=%d ; C notes=%d\n" % (sum(1 for x in ins if x["cat"] == "C" and x["decl"]),
                                                len({x["id"] for x in ins if x["cat"] == "C"})))
o.write("B cmd split=%s\n" % json.dumps(collections.Counter(x["cmd"] for x in ins if x["cat"] == "B")))
o.write("excluded: D476=%d D71=%d cats=%s\n" % (
    sum(1 for x in occ if x["id"] == "D476"), sum(1 for x in occ if x["id"] == "D71"),
    json.dumps(collections.Counter(x["cat"] for x in occ if x["id"] == "D71"))))
o.close()
print("done")
