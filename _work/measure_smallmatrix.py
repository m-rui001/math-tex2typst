"""How does pandoc render `smallmatrix`, and what lands on the page?

84 papers carry 129 of them. The Quasi-Riemann one came out as literal `1 & 0\\ u_0 & 1` inside a
`cases` branch, with the row break ignored, so the question is whether that is the nesting or the
environment.
"""
import subprocess
import sys
import tempfile
from pathlib import Path

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

CASES = {
    "smallmatrix alone": r"$\begin{smallmatrix}1&0\\u_0&1\end{smallmatrix}$",
    "smallmatrix in bigl": r"$\bigl(\begin{smallmatrix}1&0\\u_0&1\end{smallmatrix}\bigr)$",
    "smallmatrix in cases": (r"$H=\begin{cases} I,&3\mid c,\\ "
                             r"\bigl(\begin{smallmatrix}1&0\\u_0&1\end{smallmatrix}\bigr),&v=1."
                             r"\end{cases}$"),
    "matrix alone": r"$\begin{matrix}1&0\\u_0&1\end{matrix}$",
    "pmatrix alone": r"$\begin{pmatrix}1&0\\u_0&1\end{pmatrix}$",
    "matrix in cases": (r"$H=\begin{cases} I,&3\mid c\\ "
                        r"\bigl(\begin{matrix}1&0\\u_0&1\end{matrix}\bigr),&v=1."
                        r"\end{cases}$"),
}

with tempfile.TemporaryDirectory() as d:
    src = Path(d, "m.tex")
    for name, tex in CASES.items():
        src.write_text("\\documentclass{article}\n\\usepackage{amsmath}\n\\begin{document}\n"
                       + tex + "\n\\end{document}\n", encoding="utf-8")
        proc = subprocess.run(["pandoc", "-f", "latex", "-t", "typst", str(src), "--wrap=none"],
                              capture_output=True, encoding="utf-8", errors="replace")
        typ = proc.stdout.strip()
        body = typ
        # now compile that Typst and read the page back
        tsrc = Path(d, "t.typ")
        tsrc.write_text("#set page(width: 300pt, height: auto)\n" + body + "\n",
                        encoding="utf-8")
        tpdf = Path(d, "t.pdf")
        tp = subprocess.run(["typst", "compile", str(tsrc), str(tpdf)],
                            capture_output=True, encoding="utf-8", errors="replace")
        page = ""
        if tpdf.exists():
            doc = fitz.open(str(tpdf))
            try:
                page = " ".join(doc[0].get_text().split())
            finally:
                doc.close()
        warns = [l for l in (tp.stderr or "").splitlines()
                 if l.startswith(("warning", "error"))]
        print("== %s" % name)
        print("   typst : %s" % body[:220].replace(chr(10), " / "))
        print("   page  : %r" % page[:120])
        for w in warns:
            print("   !! %s" % w[:150])
