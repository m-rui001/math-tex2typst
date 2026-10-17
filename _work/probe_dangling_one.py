r"""Why does Positive-scalar-curvature keep a dangling \ref{fig:topology-compression}?

Look up the label in the flat source and in main.typ, and show both sides of the reference.
Read-only.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NAME = "Positive-scalar-curvature-and-uniform-codime"

src = None
for path in glob.glob(os.path.join(ROOT, "_work", "flat", NAME + "*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    print("source %s (%d B)" % (os.path.basename(path), len(src)))
typ = open(glob.glob(os.path.join(ROOT, "typst", NAME + "*", "main.typ"))[0],
           encoding="utf-8", errors="replace").read()

for needle in (r"\label{fig:topology-compression}", "topology-compression"):
    print("\n### source %r -> %d hits" % (needle, src.count(needle)))
    for m in re.finditer(re.escape(needle), src):
        print("   " + src[max(0, m.start() - 160):m.end() + 60].replace("\n", " ").encode("unicode_escape").decode()[:260])
print("\n### main.typ %r -> %d hits" % (needle := "topology-compression", typ.count(needle)))
for m in re.finditer(needle, typ):
    line = typ[typ.rfind("\n", 0, m.start()) + 1:typ.index("\n", m.end())]
    print("   line %d: %s" % (typ[:m.start()].count("\n") + 1, line[:200].encode("unicode_escape").decode()[:200]))

print("\n### '??' marks in this paper")
for m in re.finditer(r"\?\?", typ):
    line = typ[typ.rfind("\n", 0, m.start()) + 1:typ.index("\n", m.end())]
    print("   line %d: %s" % (typ[:m.start()].count("\n") + 1, line[:220].encode("unicode_escape").decode()[:220]))
