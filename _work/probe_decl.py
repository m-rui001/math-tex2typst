"""Which declaration-style constructs appear inside tikzpictures?"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
DECL = re.compile(r"\\(definecolor|tikzset|colorlet|pgfdeclarelayer|setlayer"
                  r"|usetikzlibrary|pgfset|execute[^\s{]*)\b")

hits = {}
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(text):
        for m in DECL.finditer(pic):
            hits.setdefault(m.group(1), []).append((tex.name, pic[:260]))
print("%d pictures scanned" % sum(1 for tex in (ROOT / "_work" / "flat").glob("*.tex")
                                  for _ in PIC.findall(tex.read_text(encoding="utf-8", errors="replace"))))
for name, found in sorted(hits.items(), key=lambda kv: -len(kv[1])):
    print("%3d  %s" % (len(found), name))
    for paper, pic in found[:3]:
        print("      %-40s %s" % (paper[:40], re.sub(r"\s+", " ", pic)[:165]))
