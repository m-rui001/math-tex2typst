# -*- coding: utf-8 -*-
import io, json, collections
H = json.load(io.open(r"E:\math\_work\_woprep\hits.json", encoding="utf-8"))
only_wd = [h for h in H if h["pats"] == [u"工单"]]
strong = [h for h in H if h["pats"] != [u"工单"]]
print(json.dumps({"only_danyuan": len(only_wd), "strong": len(strong),
                  "strong_files": len(set(h["d"] for h in strong)),
                  "only_files": len(set(h["d"] for h in only_wd))}))
c = collections.Counter(h["d"] for h in strong)
print(json.dumps(c.most_common(15)))
# length distribution of strong lines
print(json.dumps({"avg_len": sum(len(h["text"]) for h in strong)/max(1,len(strong))}))
# how many strong lines are inside a line that starts with '-' or '|' (table/ledger)
import re
pref = collections.Counter()
for h in strong:
    t = h["text"].strip()
    k = "table" if t.startswith("|") else ("bullet" if t.startswith(("-", "*", u"·")) else
        ("head" if t.startswith("#") else ("quote" if t.startswith(">") else "prose")))
    pref[k] += 1
print(json.dumps(pref))
json.dump(strong, io.open(r"E:\math\_work\_woprep\strong.json","w",encoding="utf-8"), ensure_ascii=False, indent=1)
json.dump(only_wd, io.open(r"E:\math\_work\_woprep\only_wd.json","w",encoding="utf-8"), ensure_ascii=False, indent=1)
