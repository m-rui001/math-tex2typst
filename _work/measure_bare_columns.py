"""Char-level x positions: does a bare `&` build the same columns `mat` does?

`_work/measure_bare_ampersand.py` left this open -- a real product `align` span aligned three
positions across two rows, while `$1 & 0\\ u & 1$` came back as one glued run per row. Both are
spelled the same way, so the cells themselves are read out here and compared with `mat`.
"""
import subprocess
import sys
import tempfile
from pathlib import Path

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

CASES = {
    "digits, bare": "$1 & 0\\\n2 & 3$",
    "digits, mat": "$mat(delim: #none, 1, 0; 2, 3)$",
    "letters, bare": "$a & b\\\nc & d$",
    "letters, mat": "$mat(delim: #none, a, b; c, d)$",
    "relations, bare": "$t' & = t + h \\,\\\nz' & = z^2$",
    "relations, mat": "$mat(delim: #none, align(right, t'), align(left, = t + h); "
                      "z', = z^2)$",
    "wide cells, bare": "$alpha & = beta + gamma \\\ndelta & = epsilon$",
    "wide cells, mat": "$mat(delim: #none, alpha, = beta + gamma; delta, = epsilon)$",
}

with tempfile.TemporaryDirectory() as d:
    for name, body in CASES.items():
        src, pdf = Path(d, "t.typ"), Path(d, "t.pdf")
        src.write_text("#set page(width: 400pt, height: auto, margin: 10pt)\n" + body + "\n",
                       encoding="utf-8")
        proc = subprocess.run(["typst", "compile", str(src), str(pdf)],
                              capture_output=True, encoding="utf-8", errors="replace")
        print("== %-20s rc=%d" % (name, proc.returncode))
        if not pdf.exists():
            print("   ", (proc.stderr or "")[:200].replace("\n", " | "))
            continue
        doc = fitz.open(str(pdf))
        try:
            lines = {}
            for b in doc[0].get_text("rawdict")["blocks"]:
                for l in b.get("lines", []):
                    for s in l["spans"]:
                        for c in s["chars"]:
                            lines.setdefault(round(c["origin"][1], 1), []).append(
                                (round(c["origin"][0], 1), c["c"]))
        finally:
            doc.close()
        for y in sorted(lines):
            print("     y=%-6s %s" % (y, " ".join("%s@%.0f" % (ch, x) for x, ch in sorted(lines[y]))))
