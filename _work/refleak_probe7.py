# -*- coding: utf-8 -*-
import io, json, os
raw = io.open("E:/math/_work/preamble_tables.json", encoding="utf-8").read()
ptab = json.loads(raw)
v = ptab.get("D259")
print("type", type(v))
print(json.dumps(v, ensure_ascii=False)[:400].encode("ascii", "backslashreplace").decode("ascii"))
print("keys count", len(ptab))
print("D259 in", "D259" in ptab, "repr dir", repr(v.get("dir")) if isinstance(v, dict) else None)
print("isdir?", os.path.isdir(os.path.join("E:/math/preprints", (v or {}).get("dir") or "")))
dups = [k for k in ("D113", "D259") if k not in ptab]
print("absent", dups)
# duplicate top-level keys check
import re
ks = re.findall(r'"(D\d+)"\s*:\s*\{', raw)
c = {}
for k in ks:
    c[k] = c.get(k, 0) + 1
print("dup keys in raw", {k: n for k, n in c.items() if n > 1})
