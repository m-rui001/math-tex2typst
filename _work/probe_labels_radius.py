r"""Radius of a float whose split is caption-driven, and what the appendix refs print today.

Counts corpus floats by how many \caption and how many \label they carry -- that bounds any change to
_split_floats -- and shows the baked text the A-boundary body carries for its three appendix tables.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
TYPST = os.path.join(ROOT, "typst")
FLOAT = re.compile(r"\\begin\{(figure|table)\*?\}.*?\\end\{\1\*?\}", re.S)
LABEL = re.compile(r"\\label\{([^}]*)\}")
CAPTION = re.compile(r"\\caption\b")

multi_cap = {}
multi_lab = {}
for tex in sorted(os.listdir(FLAT)):
    if not tex.endswith(".tex"):
        continue
    stem = tex[:-4]
    src = open(os.path.join(FLAT, tex), encoding="utf-8", errors="replace").read()
    for m in FLOAT.finditer(src):
        body = m.group(0)
        caps = len(CAPTION.findall(body))
        labs = LABEL.findall(body)
        if caps > 1:
            multi_cap.setdefault(stem, []).append((body[:body.index("}") + 1], caps, labs))
        if len(labs) > 1:
            multi_lab.setdefault(stem, []).append((caps, labs))

print("papers with a multi-caption float: %d, floats: %d"
      % (len(multi_cap), sum(len(v) for v in multi_cap.values())))
for stem, hits in sorted(multi_cap.items()):
    for _env, caps, labs in hits:
        print("   %-50s caps=%d labels=%s" % (stem[:50], caps, labs))
print()
print("papers with a multi-label float: %d, floats: %d"
      % (len(multi_lab), sum(len(v) for v in multi_lab.values())))
for stem, hits in sorted(multi_lab.items()):
    print("   %-50s %s" % (stem[:50], hits))

A = "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026"
typ = open(os.path.join(TYPST, A, "main.typ"), encoding="utf-8", errors="replace").read()
print("\n-- A-boundary: lines naming an appendix table --")
for line in typ.splitlines():
    if "apptr:entry-table" in line or "apptr:endpoint-table" in line or "apptr:coupling-table" in line:
        print("   " + line.strip()[:150].encode("unicode_escape").decode()[:150])
print("-- and every 'Table N' caption in order --")
print("   " + " | ".join(re.findall(r"caption: \[(Table [0-9]+[^\]]{0,28})", typ)))
