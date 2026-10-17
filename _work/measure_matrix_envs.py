"""Which LaTeX spellings does pandoc turn into a real Typst `mat(...)`, and which into inert `&`?

A nested matrix inside a `cases` branch has to be a real `mat`, because `&` and a row break do
nothing inside a branch (that is the "linebreaks are ignored in branches" warning). So the question
is which environment names pandoc understands well enough to emit `mat(` for.
"""
import subprocess
import sys
import tempfile
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ENVS = [
    r"\begin{matrix}1&0\\u&1\end{matrix}",
    r"\begin{pmatrix}1&0\\u&1\end{pmatrix}",
    r"\begin{bmatrix}1&0\\u&1\end{bmatrix}",
    r"\begin{smallmatrix}1&0\\u&1\end{smallmatrix}",
    r"\begin{array}{cc}1&0\\u&1\end{array}",
    r"\bigl(\begin{smallmatrix}1&0\\u&1\end{smallmatrix}\bigr)",
    r"\left(\begin{array}{cc}1&0\\u&1\end{array}\right)",
]

with tempfile.TemporaryDirectory() as d:
    src = Path(d, "m.tex")
    for env in ENVS:
        for wrapper in ("bare", "in cases"):
            body = env if wrapper == "bare" else (
                r"H=\begin{cases} I,&3\mid c,\\" + env + r",&v=1.\end{cases}")
            src.write_text("\\documentclass{article}\n\\usepackage{amsmath}\n\\begin{document}\n$"
                           + body + "$\n\\end{document}\n", encoding="utf-8")
            proc = subprocess.run(["pandoc", "-f", "latex", "-t", "typst", str(src),
                                   "--wrap=none"],
                                  capture_output=True, encoding="utf-8", errors="replace")
            out = " ".join(proc.stdout.split())
            print("%-9s %-46s -> %s" % (wrapper, env[:46], out[:150]))
