import os
import re
import subprocess
import tempfile

CASES = {
    "align-plain": r"\begin{align} & \hspace{1cm} x \\ y &= \hspace{25mm} z \end{align}",
    "align-star": r"\begin{align*} B(v)={}&\bigl(1,7-2v/5,45-4v,275-30v,11,65-2v,\\ &\hspace{29mm}85,17,95-2v,25,35\bigr),\end{align*}",
    "inline": r"$\swarrow$\hspace{65mm}$\searrow$",
}

with tempfile.TemporaryDirectory() as tmp:
    src = os.path.join(tmp, "a.tex")
    dst = os.path.join(tmp, "a.json")
    for name, body in CASES.items():
        doc = ("\\documentclass{article}\n\\usepackage{amsmath}\n\\begin{document}\n"
               + body + "\n\\end{document}\n")
        open(src, "w", encoding="utf-8").write(doc)
        subprocess.run(["pandoc", src, "-f", "latex", "-t", "json", "-o", dst], check=True)
        text = open(dst, encoding="utf-8").read()
        print("%-12s hspace in AST = %d" % (name, text.count("hspace")))
