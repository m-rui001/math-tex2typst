"""What does a shipped `align`-style span actually look like on the page?

`_work/probe_bare_ampersand.py` counted 8,265 math spans in 694 papers that carry a bare `&` with
no `mat(`/`cases(`/`array(` around it. pandoc writes LaTeX's alignment environments that way. Take
real spans out of a product, compile them alone, and read the word boxes back: are the rows stacked
and the columns aligned, or is the whole thing one run-on line?
"""
import re
import subprocess
import sys
import tempfile
from pathlib import Path

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

STEM = "A-C1-Counterexample-to-the-Entropy-Conjecture-September-25-2026"
text = open("typst/%s/main.typ" % STEM, encoding="utf-8", errors="replace").read()

spans, i, start = [], 0, None
while i < len(text):
    c = text[i]
    if c == "\\" and i + 1 < len(text):
        i += 2
        continue
    if c == "$":
        if start is None:
            start = i
        else:
            spans.append(text[start + 1:i])
            start = None
    i += 1

picked = [s for s in spans if " & " in s and "mat(" not in s and "cases(" not in s][:3]


def boxes(d, body, tag):
    src, pdf = Path(d, tag + ".typ"), Path(d, tag + ".pdf")
    src.write_text("#set page(width: 400pt, height: auto, margin: 10pt)\n$" + body + "$\n",
                   encoding="utf-8")
    proc = subprocess.run(["typst", "compile", str(src), str(pdf)],
                          capture_output=True, encoding="utf-8", errors="replace")
    if not pdf.exists():
        print("   compile failed rc=%d %s" % (proc.returncode, (proc.stderr or "")[:200]))
        return
    doc = fitz.open(str(pdf))
    try:
        rows = {}
        for w in doc[0].get_text("words"):
            rows.setdefault(round(w[1], 1), []).append((round(w[0], 1), w[4]))
        print("   %d line(s), %d page(s)" % (len(rows), doc.page_count))
        for y in sorted(rows)[:6]:
            print("     y=%-7s %s" % (y, " ".join(t for _, t in sorted(rows[y]))[:110]))
    finally:
        doc.close()


with tempfile.TemporaryDirectory() as d:
    for n, s in enumerate(picked):
        print("== span %d: %s" % (n, " ".join(s.split())[:150]))
        boxes(d, s, "as_shipped%d" % n)
        # the same rows as an explicit matrix, for comparison
        rows = re.split(r"\\\s*\n|\\\s", s.strip())
        cells = [[c.strip() for c in r.split("&")] for r in rows if r.strip()]
        flat = "; ".join(", ".join(r) for r in cells)
        boxes(d, "mat(delim: #none, %s)" % flat, "as_matrix%d" % n)
