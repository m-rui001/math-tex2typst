"""Does a bare `&` + row break align in Typst maths, and which spelling of the row break matters?

The products carry 8,265 spans that use this form (`_work/probe_bare_ampersand.py`), and one
measurement of pandoc's `smallmatrix` output looked collapsed while a real product `align` span
laid out in two aligned columns. The two differ only in what stands before the row break, so the
spellings are compared here directly.
"""
import subprocess
import sys
import tempfile
from pathlib import Path

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

CASES = {
    "backslash + newline": "$1 & 0\\\nu_0 & 1$",
    "backslash + space": "$1 & 0\\ u_0 & 1$",
    "thin space, backslash, newline": "$1 & 0 \\,\\\nu_0 & 1$",
    "product align span": "$t' & = t + h \\,\\\nz' & = z^2 + 20$",
    "inside cases, newline": "$cases(delim: \"{\", a & b, 1 & 0\\\nu & 1 & c)$",
    "inside cases, mat": '$cases(delim: "{", a & b, mat(delim: "(", 1, 0; u, 1) & c)$',
}

with tempfile.TemporaryDirectory() as d:
    for name, body in CASES.items():
        src, pdf = Path(d, "t.typ"), Path(d, "t.pdf")
        src.write_text("#set page(width: 400pt, height: auto, margin: 10pt)\n" + body + "\n",
                       encoding="utf-8")
        proc = subprocess.run(["typst", "compile", str(src), str(pdf)],
                              capture_output=True, encoding="utf-8", errors="replace")
        rows = {}
        if pdf.exists():
            doc = fitz.open(str(pdf))
            try:
                for w in doc[0].get_text("words"):
                    rows.setdefault(round(w[1], 1), []).append((round(w[0], 1), w[4]))
            finally:
                doc.close()
        warns = [l[:90] for l in (proc.stderr or "").splitlines()
                 if l.startswith(("warning", "error"))]
        print("== %-32s rc=%d lines=%d" % (name, proc.returncode, len(rows)))
        for y in sorted(rows):
            print("     y=%-7s %s" % (y, "  ".join("%s@%s" % (t, x) for x, t in sorted(rows[y]))[:100]))
        for w in warns:
            print("     !! %s" % w)
