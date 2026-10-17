# -*- coding: utf-8 -*-
# PROBE 11: report numbers, robust serialisation
import io, json, collections
occ = json.load(io.open("E:/math/_work/refleak_occ.json", encoding="utf-8"))
ins = [o for o in occ if o["inc"]]
o = io.open("E:/math/_work/probe11.txt", "w", encoding="utf-8", newline="\n")
def dump(label, cnt):
    o.write("%s=%s\n" % (label, json.dumps({str(k): v for k, v in sorted(cnt.items(), key=lambda z: -z[1])}, ensure_ascii=False)))
dump("CAT occ", collections.Counter(o2["cat"] for o2 in ins))
dump("CAT notes", {c: len({x["id"] for x in ins if x["cat"] == c}) for c in "ABCDE"})
dump("PAT occ", collections.Counter(o2["pat"] for o2 in ins))
dump("C sub", collections.Counter(o2["pat"] for o2 in ins if o2["cat"] == "C"))
dump("B sub", collections.Counter(o2["pat"] for o2 in ins if o2["cat"] == "B"))
dump("B lead", collections.Counter(str(o2["lead"]) for o2 in ins if o2["cat"] == "B"))
dump("D notes", collections.Counter(o2["id"] for o2 in ins if o2["cat"] == "D"))
dump("E list", collections.Counter("%s:%s" % (x["id"], x["pat"]) for x in ins if x["cat"] == "E"))
by = collections.defaultdict(list)
for x in ins:
    by[x["id"]].append(x)
o.write("notes=%d total=%d\n" % (len(by), len(ins)))
top = sorted(by.items(), key=lambda z: -len(z[1]))[:8]
for n, r in top:
    o.write("TOP %s hits=%d %s dominantform=%s\n" % (n, len(r), json.dumps({str(k): v for k, v in collections.Counter(z["cat"] for z in r).items()}, ensure_ascii=False), collections.Counter(z["form"] for z in r).most_common(3)))
adv = collections.Counter()
for l in list(io.open("E:/math/_work/refleak_catB_advice.tsv", encoding="utf-8"))[1:]:
    f = l.rstrip("\n").split("\t")
    if len(f) < 9 or f[3] != "B":
        continue
    a = f[8]
    if a.startswith("delete-token"):
        adv["B1 delete-token(pos-str already covers it)"] += 1
    elif a.startswith("keep-as-code"):
        adv["B2 keep-label-name-as-code"] += 1
    elif "AMBIG" in a or "必读" in a:
        adv["B4 rewrite-but-label-name-in-N-files(MUST READ)"] += 1
    elif "同文件另有行号" in a:
        adv["B3 rewrite-as-pos(check line no)"] += 1
    else:
        adv["B3 rewrite-as-pos(exact from index)"] += 1
dump("B advice", adv)
o.write("multi-file same-label occurrences=%d\n" % sum(1 for x in ins if x["cat"] == "B" and x["mat"] and len({m[0] for m in x["mat"]}) > 1))
o.write("fence occurrences=%d in %d notes\n" % (sum(1 for x in ins if x["fence"]), len({x["id"] for x in ins if x["fence"]})))
o.write("notes with only-C=%d ; with only-B=%d\n" % (
    sum(1 for n, r in by.items() if {z["cat"] for z in r} == {"C"}),
    sum(1 for n, r in by.items() if {z["cat"] for z in r} == {"B"})))
mx = max(((x["id"], x["line"]) for x in ins), key=lambda k: sum(1 for y in ins if (y["id"], y["line"]) == k))
o.write("busiest single line=%s hits=%d\n" % (json.dumps(mx), sum(1 for y in ins if (y["id"], y["line"]) == mx)))
o.write("D156:591 occurrences=%d args=%s\n" % (sum(1 for x in ins if x["id"] == "D156" and x["line"] == 591),
                                               json.dumps([x["arg"] for x in ins if x["id"] == "D156" and x["line"] == 591], ensure_ascii=False)))
o.close()
print("ok")
