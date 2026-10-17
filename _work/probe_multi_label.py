r"""Every `[??]` in the generated Typst, and how many floats carry more than one \label.

A float with two labels is a real authoring pattern; if the converter keeps only one, every \ref to
the dropped label renders as [??]. This measures the radius and shows each [??] with its source ref.
Read-only over _work/flat and typst.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
TYPST = os.path.join(ROOT, "typst")
FLOAT = re.compile(r"\\begin\{(figure|table)\}.*?\\end\{\1\}", re.S)
LABEL = re.compile(r"\\label\{([^}]*)\}")

multi = 0
papers = set()
lost = []
for tex in sorted(os.listdir(FLAT)):
    if not tex.endswith(".tex"):
        continue
    stem = tex[:-4]
    src = open(os.path.join(FLAT, tex), encoding="utf-8", errors="replace").read()
    typ_path = os.path.join(TYPST, stem, "main.typ")
    if not os.path.isfile(typ_path):
        for d in os.listdir(TYPST):
            if d.startswith(stem[:40]):
                typ_path = os.path.join(TYPST, d, "main.typ")
                break
    typ = open(typ_path, encoding="utf-8", errors="replace").read() if os.path.isfile(typ_path) else ""
    for match in FLOAT.finditer(src):
        labels = LABEL.findall(match.group(0))
        if len(labels) < 2:
            continue
        multi += 1
        papers.add(stem[:44])
        for lab in labels:
            if lab not in typ:
                lost.append((stem[:44], lab, len(labels)))

print("floats with >1 label: %d over %d papers" % (multi, len(papers)))
print("labels dropped from main.typ: %d" % len(lost))
for stem, lab, n in lost[:20]:
    print("   %-44s %-28s (float has %d labels)" % (stem, lab, n))

print("\n-- every [??] mark in the generated Typst --")
for stem in sorted(os.listdir(TYPST)):
    path = os.path.join(TYPST, stem, "main.typ")
    if not os.path.isfile(path):
        continue
    typ = open(path, encoding="utf-8", errors="replace").read()
    for m in re.finditer(r"\[\?\?\]", typ):
        line = typ[typ.rfind("\n", 0, m.start()) + 1:typ.index("\n", m.end())]
        print("   %-44s %s" % (stem[:44], line.strip()[:150].encode("unicode_escape").decode()[:150]))
