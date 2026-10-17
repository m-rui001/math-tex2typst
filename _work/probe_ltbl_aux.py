r"""Two oracles for one longtable: pdflatex's .aux numbers for every name in the float, and
pandoc's AST ident for the same source. The alias rule has to answer to both.
"""
import json
import os
import re
import subprocess
import sys

sys.stdout.reconfigure(errors="replace")
SRC = r"E:/math/_work/flat/_work_tex/Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026.tex"
lines = open(SRC, encoding="utf-8").read().split("\n")
region = "\n".join(lines[3180:3251])
labels = re.findall(r"\\(?:phantomsection\s*)?\\label\{([^{}]*)\}", region)
print("labels in float order:")
for i, l in enumerate(labels):
    print("  %d %s" % (i, l))

doc = r"""
\documentclass{article}
\usepackage{longtable}
\usepackage{hyperref}
\newcommand{\phantomsection}{}
\begin{document}
\setcounter{table}{3}
Table~\ref{sweeps:transfer-table} and Table~\ref{sweeps:assembly-collision-HS}
and Table~\ref{sweeps:assembly-trajectory}.
""" + region + r"""
\end{document}
"""
os.makedirs(r"E:/math/_work/_probe_ltbl", exist_ok=True)
tex = r"E:/math/_work/_probe_ltbl/t.tex"
open(tex, "w", encoding="utf-8").write(doc)
r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                    r"E:/math/_work/_probe_ltbl", tex], capture_output=True, text=True,
                   encoding="utf-8", errors="replace")
aux = open(r"E:/math/_work/_probe_ltbl/t.aux", encoding="utf-8", errors="replace").read()
print("aux newlabel:", re.findall(r"\\newlabel\{([^{}]*)\}\{\{([^{}]*)\}", aux))
print("pdf:", os.path.exists(r"E:/math/_work/_probe_ltbl/t.pdf"), "rc", r.returncode)

out = subprocess.run(["pandoc", tex, "-f", "latex", "-t", "json"],
                     capture_output=True, text=True, encoding="utf-8", errors="replace").stdout
ast = json.loads(out)


def walk(x, d=0):
    if isinstance(x, list):
        for i in x:
            walk(i, d)
        return
    if not isinstance(x, dict):
        return
    t, c = x["t"], x["c"]
    if t == "Div":
        print("Div ident=%r classes=%r -> children %s"
              % (c[0][0], c[0][1], [n["t"] for n in c[1]]))
        walk(c[1], d + 1)
    elif t == "Table":
        print("  Table ident=%r" % (c[0][0],))
    elif t in ("Para", "Plain"):
        for n in c:
            if isinstance(n, dict) and n["t"] == "Link":
                print("Link target=%r text=%s" % (n["c"][2][0], json.dumps(n["c"][1], ensure_ascii=False)[:60]))


walk(ast.get("blocks", ast) if isinstance(ast, dict) else ast)
