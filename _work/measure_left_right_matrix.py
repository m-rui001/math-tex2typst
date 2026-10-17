"""Does `\left( … \right)` around a delimiter-less matrix make pandoc emit a real `mat`?

pandoc only builds `mat(...)` when it can see the delimiters as the environment's own. The Quasi-
Riemann `cases` branch writes `\bigl(\begin{smallmatrix}…\end{smallmatrix}\bigr)`, which pandoc
reads as a scaled paren plus loose text, and inside a branch the text's `&` and row break are inert.
"""
import subprocess
import sys
import tempfile
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

BODIES = [
    r"\begin{matrix}1&0\\u&1\end{matrix}",
    r"\begin{smallmatrix}1&0\\u&1\end{smallmatrix}",
    r"\begin{array}{cc}1&0\\u&1\end{array}",
]
DELIMS = [r"\bigl( %s \bigr)", r"\Bigl( %s \Bigr)", r"\left( %s \right)", r"( %s )"]

with tempfile.TemporaryDirectory() as d:
    src = Path(d, "m.tex")
    for body in BODIES:
        for dl in DELIMS:
            tex = "$H=\\begin{cases} I,&3\\mid c,\\\\" + (dl % body) + r",&v=1.\end{cases}$"
            src.write_text("\\documentclass{article}\n\\usepackage{amsmath}\n\\begin{document}\n"
                           + tex + "\n\\end{document}\n", encoding="utf-8")
            proc = subprocess.run(["pandoc", "-f", "latex", "-t", "typst", str(src),
                                   "--wrap=none"],
                                  capture_output=True, encoding="utf-8", errors="replace")
            out = " ".join(proc.stdout.split())
            ok = "mat(" in out
            print("%-6s %-14s %s" % ("mat" if ok else "LOOSE", (dl % "")[:12], out[:130]))
