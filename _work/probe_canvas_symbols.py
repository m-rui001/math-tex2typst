"""Which new symbol spelling dies inside a canvas.

Each value was measured alone in math mode, but a canvas also carries `import cetz.draw: *`, so a
name the draw module exports can shadow the math symbol. This compiles every new spelling in the
shape the converter really emits and prints the ones typst rejects.
"""
import os
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz

NEW = {
    r"\Downarrow": "arrow.b.double", r"\Uparrow": "arrow.t.double",
    r"\cup": "union", r"\setminus": "without", r"\mapsto": "arrow.r.bar",
    r"\twoheadrightarrow": "arrow.r.twohead", r"\curvearrowleft": "arrow.l.curve",
    r"\rightrightarrows": "arrow.r.double.bar", r"\Vdash": "tack.r.double",
    r"\ddagger": "dagger.double", r"\i": "i.dot",
}

tmp = tempfile.mkdtemp(prefix="canvas_symbols")
doc = os.path.join(tmp, "c.typ")
out = os.path.join(tmp, "c.pdf")
for latex, value in sorted(NEW.items()):
    src = ('#import "@preview/cetz:0.5.0"\n'
           '#let canvas = cetz.canvas\n'
           '#cetz.canvas({\n  import cetz.draw: *\n'
           '  line((0, 0), (1, 1))\n  content((0, 0), [$%s$])\n})\n' % value)
    with open(doc, "w", encoding="utf-8") as fh:
        fh.write(src)
    got = subprocess.run(["typst", "compile", doc, out], capture_output=True, text=True,
                         encoding="utf-8", errors="replace")
    print("%-20s %-22s %s" % (latex, value, "OK" if got.returncode == 0 else
                              "BAD: " + " ".join((got.stderr or "").split())[:150]))
