r"""What point size each TeX size name actually means, read from the engine.

`font=\small` in a TikZ node is a relative instruction: its answer depends on the document class
and its size option.  The canvas has to emit an absolute point size, because the node's box width
and the coordinates around it are already absolute centimetres taken from TeX's own metrics.  These
are the numbers pdflatex reports for `\f@size` inside each size command, for the classes the corpus
flattens from.

Precedence rule: a size only counts here if pdflatex printed it; an unprinted name is not guessed.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "sizecheck")
NAMES = ["tiny", "scriptsize", "footnotesize", "small", "normalsize", "large", "Large", "LARGE", "huge", "Huge"]

DOC = r"""\documentclass[%OPT%]{article}
\usepackage{tikz}
\begin{document}
\makeatletter
%CHECKS%
\makeatother
x
\end{document}
"""


def run(opt):
    checks = "\n".join(
        r"{\%s\typeout{SIZE %s = f@size=\f@size pt}}" % (n, n)
        for n in NAMES)
    src = DOC.replace("%OPT%", opt).replace("%CHECKS%", checks)
    os.makedirs(OUT, exist_ok=True)
    path = os.path.join(OUT, "s%s.tex" % opt.replace("pt", ""))
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(src)
    log = os.path.join(OUT, "s%s.log" % opt.replace("pt", ""))
    subprocess.run(["pdflatex", "-interaction=batchmode", "-output-directory", OUT, path],
                   capture_output=True)
    text = open(log, encoding="utf-8", errors="replace").read()
    got = dict((m.group(1), float(m.group(2))) for m in
               re.finditer(r"SIZE (\w+) = f@size=([\d.]+)\s*pt", text))
    print("documentclass[%s]" % opt)
    for n in NAMES:
        print("  \\%-12s %s" % (n, got.get(n, "NOT REPORTED")))
    return got


def main():
    sys.stdout.reconfigure(errors="replace")
    for opt in ("10pt", "11pt", "12pt"):
        run(opt)


if __name__ == "__main__":
    main()
