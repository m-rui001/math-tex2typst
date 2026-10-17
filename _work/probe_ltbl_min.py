r"""Minimal shape check: does pandoc really hand a longtable the last \label of the whole region,
even when that label sits inside a row? Prints the Div/Table idents for the test's own source.
"""
import json
import subprocess
import sys

sys.stdout.reconfigure(errors="replace")

DOC = r"""\documentclass{article}
\usepackage{longtable}
\begin{document}
See Table~\ref{tab:bounds} and Table~\ref{row:one}.
\begin{longtable}{lr}
\caption{Bounds.}\label{tab:bounds}\\
one & \phantomsection\label{row:one} 1\\
two & \phantomsection\label{row:two} 2\\
\end{longtable}
\end{document}
"""
path = r"E:/math/_work/_probe/lt_min.tex"
open(path, "w", encoding="utf-8").write(DOC)
out = subprocess.run(["pandoc", path, "-f", "latex", "-t", "json"],
                     capture_output=True, text=True, encoding="utf-8",
                     errors="replace").stdout
ast = json.loads(out)


def walk(x):
    if isinstance(x, list):
        for i in x:
            walk(i)
        return
    if not isinstance(x, dict):
        return
    t, c = x["t"], x["c"]
    if t == "Div":
        print("Div ident=%r children=%s" % (c[0][0], [n["t"] for n in c[1] if isinstance(n, dict)]))
        walk(c[1])
    elif t == "Table":
        print("Table ident=%r caption=%s" % (c[0][0], json.dumps(c[1], ensure_ascii=False)[:60]))
    elif t == "Figure":
        print("Figure ident=%r" % (c[0][0],))


walk(ast["blocks"] if isinstance(ast, dict) and "blocks" in ast else ast)
