"""Does the rename hold when a subscript follows the symbol? (the six leftovers in one paper)"""
import subprocess
import sys
import tempfile
from pathlib import Path

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

PAIRS = [
    ("lt.tri.eq_o", "lt.closed.eq_o"),
    ("lt.tri_o", "lt.closed_o"),
    ("gt.tri.eq_o", "gt.closed.eq_o"),
    ("tack.r.double_i", "tack.rr_i"),
]


def render(d, name):
    src = Path(d, "t.typ")
    src.write_text("$N %s Gamma$\n" % name, encoding="utf-8")
    pdf = Path(d, "t.pdf")
    proc = subprocess.run(["typst", "compile", str(src), str(pdf)],
                          capture_output=True, encoding="utf-8", errors="replace")
    warn = [l for l in (proc.stderr or "").splitlines() if "deprecated" in l]
    doc = fitz.open(str(pdf))
    try:
        chars = " ".join("%s+%04X" % (c["c"], ord(c["c"]))
                         for b in doc[0].get_text("rawdict")["blocks"]
                         for l in b.get("lines", []) for s in l["spans"]
                         for c in s["chars"] if not c["c"].isalnum() and c["c"].strip())
    finally:
        doc.close()
    return proc.returncode, len(warn), chars


with tempfile.TemporaryDirectory() as d:
    for old, new in PAIRS:
        a, b = render(d, old), render(d, new)
        print("GLYPHS SAME" if a[2] == b[2] else "GLYPHS DIFFER")
        for name, (rc, nw, chars) in ((old, a), (new, b)):
            print("    %-16s rc=%d deprecated=%d  [%s]" % (name, rc, nw, chars))
