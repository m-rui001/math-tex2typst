r"""Where does pandoc put the second \label of a caption's label chain?

The TeX truth is already measured (a chain under one caption numbers every name from that caption,
the aux answers 1 and 1). What is unknown is the AST: does the dropped name survive anywhere pandoc
hands us -- the figure's ident, the caption inlines, the body -- or is it gone, so the number has to
be given to it from the source text?

pandoc only, no typst.
"""
import io
import json
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

CASE = r"""\documentclass{article}
\begin{document}
\begin{figure}[!b]
\centering
\begin{tikzpicture}
\draw (0,0) -- (1,1);
\end{tikzpicture}
\caption{Two names, one number.}
\label{fig:first-name}
\label{packet:second-name}
\end{figure}
\ref{fig:first-name} and \ref{packet:second-name}
\end{document}
"""

folder = os.path.join("_work", "pandoc_label")
if not os.path.isdir(folder):
    os.makedirs(folder)
src = os.path.join(folder, "case.tex")
open(src, "w", encoding="utf-8").write(CASE)
proc = subprocess.run([os.environ.get("PANDOC", "pandoc"), src, "-f", "latex", "-t", "json"],
                      capture_output=True, text=True, encoding="utf-8")
if proc.returncode:
    print("pandoc failed: %s" % proc.stderr[:300])
    sys.exit(1)
doc = json.loads(proc.stdout)
text = json.dumps(doc, ensure_ascii=False)
for name in ("fig:first-name", "packet:second-name"):
    print("%-22s appears %d time(s) in the AST" % (name, text.count(name)))
print("\n-- the AST's figure block --")


def show(node, depth=0):
    if isinstance(node, dict):
        t = node.get("t", "")
        print("%s%s" % ("  " * depth, t))
        show(node.get("c"), depth + 1)
    elif isinstance(node, list):
        if node and isinstance(node[0], str):
            print("%s%r" % ("  " * depth, node if len(node) < 4 else node[:2]))
        for item in node:
            show(item, depth + 1)


for block in doc["blocks"]:
    if block.get("t") in ("Figure", "Para", "RawBlock", "Div"):
        print("[%s]" % block.get("t"))
        show(block["c"], 1)
