r"""How many node labels carry a real paragraph break, and does one survive inside a Typst `box`?

Part 1 counts the corpus face through the emitter, so the number is of labels the emitter actually
saw. `\par` has to be matched as a control word -- `\partial` sits in nearly every one of these
labels and a substring test reports 44 where the truth is far fewer.
Part 2 asks typst for the layout of a fixed-width box whose body holds a paragraph break.
"""
import glob
import os
import re
import subprocess
import sys
import tempfile

import pymupdf

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
PAR = re.compile(r"\\(?:par|medskip|smallskip|bigskip)(?![A-Za-z])")
FLAT = os.path.join(ROOT, "_work", "flat")

found = []
cur = None
orig = cetz.emit_node


def wrapped(at, inner_node, o, *a, **kw):
    text = str(inner_node)
    if PAR.search(text):
        found.append((cur, re.sub(r"\s+", " ", text)[:110]))
    return orig(at, inner_node, o, *a, **kw)


cetz.emit_node = wrapped
for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    cur = os.path.basename(src)
    for p in PIC.findall(open(src, encoding="utf-8", errors="replace").read()):
        cetz.build(p)

papers = {n for n, _ in found}
print("labels with a paragraph break: %d in %d papers" % (len(found), len(papers)))
for n, t in found[:10]:
    print("  %-50s %s" % (n[:50], t))

DOC = r"""#set page(width: 300pt, height: 300pt, margin: 20pt)
#box(width: 150pt, inset: 0pt)[#set text(hyphenate: false); one two three four five six seven
#parbreak()
second paragraph words here again]
"""
with tempfile.TemporaryDirectory() as tmp:
    src = os.path.join(tmp, "t.typ")
    open(src, "w", encoding="utf-8").write(cetz.HEADER + DOC)
    pdf = os.path.join(tmp, "t.pdf")
    r = subprocess.run(["typst", "compile", src, pdf], capture_output=True)
    print("typst rc", r.returncode, r.stderr.decode("utf-8", "replace")[:300])
    if not r.returncode:
        doc = pymupdf.open(pdf)
        try:
            for b in doc[0].get_text("rawdict")["blocks"]:
                for line in b.get("lines", []):
                    words = "".join(c["c"] for sp in line["spans"] for c in sp["chars"])
                    print("  y=%.1f x=%.1f %r" % (line["bbox"][1], line["bbox"][0], words[:60]))
        finally:
            doc.close()
