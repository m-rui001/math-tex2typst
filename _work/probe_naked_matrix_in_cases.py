"""Two things the nested-matrix fix has to answer.

1. Does `\left. … \right.` (invisible delimiters) make pandoc emit a real `mat`, so a nested matrix
   with no delimiter of its own can be fixed the same way?
2. Face: how many delimiter-less matrices sit inside a `cases` branch with NO delimiter around them?
"""
import glob
import re
import subprocess
import sys
import tempfile
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

PROBES = [
    r"$H=\begin{cases} I,&3\mid c,\\\left.\begin{smallmatrix}1&0\\u&1\end{smallmatrix}\right.&v=1.\end{cases}$",
    r"$H=\begin{cases} I,&3\mid c,\\\begin{smallmatrix}1&0\\u&1\end{smallmatrix}&v=1.\end{cases}$",
    r"$\left.\begin{matrix}1&0\\u&1\end{matrix}\right.$",
]
with tempfile.TemporaryDirectory() as d:
    src = Path(d, "m.tex")
    for tex in PROBES:
        src.write_text("\\documentclass{article}\n\\usepackage{amsmath}\n\\begin{document}\n"
                       + tex + "\n\\end{document}\n", encoding="utf-8")
        proc = subprocess.run(["pandoc", "-f", "latex", "-t", "typst", str(src), "--wrap=none"],
                              capture_output=True, encoding="utf-8", errors="replace")
        print("%-58s -> %s" % (tex[24:80], " ".join(proc.stdout.split())[:120]))

CASES = re.compile(r"\\begin\{(cases|rcases|dcases)\}(.*?)\\end\{\1\}", re.S)
ENV = re.compile(r"\\begin\{(matrix|smallmatrix|array)\}")
BIG = re.compile(r"\\[bB]igg?[lrm]?[(\[{|.]$")
naked = wrapped = 0
papers = set()
for f in sorted(glob.glob("_work/flat/*.tex")):
    text = open(f, encoding="utf-8", errors="replace").read()
    for m in CASES.finditer(text):
        for e in ENV.finditer(m.group(2)):
            papers.add(f)
            if BIG.search(text[max(0, m.start(2) + e.start() - 20):m.start(2) + e.start()]):
                wrapped += 1
            else:
                naked += 1
print("delimiter-less matrices inside a cases branch: %d naked, %d behind a big delimiter, %d papers"
      % (naked, wrapped, len(papers)))
