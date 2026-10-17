r"""Print the exact canvas lines the new tests will quote, so each assertion is written against
what the converter emits and the number next to what pdflatex measured.

Usage: python _work/pic-3d/emit_probe.py
"""
import io
import os
import sys

ROOT = r"E:\math\_work\pic-3d"
sys.path.insert(0, ROOT)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

from t2t import cetz  # noqa: E402

CASES = {
    "asharp_xf": lambda: cetz._transform(cetz.opts(
        r"scale=1.25,x={(1cm,0cm)},y={(0.45cm,0.35cm)},z={(0cm,1.5cm)}")),
    "critical_xf": lambda: cetz._transform(cetz.opts(
        r"x={(1.10cm,-0.55cm)},y={(-1.10cm,-0.55cm)},z={(0cm,1.18cm)}")),
    "diffeo_xf": lambda: cetz._transform(cetz.opts(
        r"shift={(7.1cm,.35cm)},x={(1.3cm,0cm)},y={(.42cm,.36cm)},z={(0cm,1.28cm)}")),
    "plainz_xf": lambda: cetz._transform(cetz.opts(r"x=1cm,y=1cm")),
    "plainz_scale2_xf": lambda: cetz._transform(cetz.opts(r"scale=2,x=1cm,y=1cm")),
}
for tag, fn in CASES.items():
    xf = fn()
    print("%-18s %s" % (tag, tuple(round(v, 6) for v in xf)))
    for at in ((1.4, -1, 1), (1, -1, -1), (1, 0.48, 0.56), (1, .7, 2.55), (0, 0, 1), (0, 0, 2)):
        print("       %-16s -> %s" % (str(at), tuple(round(v, 5) for v in cetz._apply(xf, *at))))

base = CASES["critical_xf"]()
nested = cetz._transform(cetz.opts("x=1cm,y=1cm"), base)
print("nested           ", tuple(round(v, 6) for v in nested))
for at in ((0, 0, 1), (2.38, 0), (-2.95, -1.63), (-2.4, -1.905)):
    print("       %-16s -> %s" % (str(at), tuple(round(v, 5) for v in cetz._apply(nested, *at))))

FILLS = {
    "critical_face": r"""\begin{tikzpicture}[x={(1.10cm,-0.55cm)},
  y={(-1.10cm,-0.55cm)},z={(0cm,1.18cm)}]
  \fill[black!3] (1,-1,-1)--(1,1,-1)--(1,1,1)--(1,-1,1)--cycle;
\end{tikzpicture}""",
    "diffeo_node": r"""\begin{tikzpicture}[font=\small]
  \begin{scope}[shift={(7.1cm,.35cm)},x={(1.3cm,0cm)},y={(.42cm,.36cm)},z={(0cm,1.28cm)}]
    \node[font=\bfseries] at (1,.7,2.55) {Input face prism};
  \end{scope}
\end{tikzpicture}""",
    "spaced_name": r"""\begin{tikzpicture}
  \coordinate (qf axes) at (1,2);
  \draw[red] (qf axes)--(3,2);
\end{tikzpicture}""",
    "qf_arrow": r"""\begin{tikzpicture}[x={(1.10cm,-0.55cm)},
  y={(-1.10cm,-0.55cm)},z={(0cm,1.18cm)},font=\small]
  \coordinate (qf representative) at (1,0.48,0.56);
  \begin{scope}[x=1cm,y=1cm]
    \node[anchor=west] (qf label) at (2.70,0.00) {$F_{1,+}^{+,+}$};
    \draw[line width=0.45pt] (qf label.west)--(2.38,0.00)--(qf representative);
  \end{scope}
\end{tikzpicture}""",
}
for tag, pic in FILLS.items():
    canvas = cetz.build(pic)
    print("== %s" % tag)
    for line in (canvas or "REFUSED").splitlines():
        if "line(" in line or "content(" in line or "polyline" in line:
            print("   " + line.strip())
