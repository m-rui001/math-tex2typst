r"""Where does a node written on a bent edge actually sit?  Measured with pdflatex, one picture per page.

TikZ puts the node at the middle of the CURVE and lifts it along the curve's own frame, so the label
of `to[bend left=45] node[above]` is not the chord midpoint with a vertical lift.  The curve's own
midpoint is had for an oracle by a second, zero-size node on the very same `to`
(`node[inner sep=0pt, circle] {}` sits where the label's `pos=0.5` is), so the difference between that
and the label's centre is the displacement a converter has to reproduce -- and the same picture at
angle 0 says what `above` means when there is no bend. Payloads are short and comma separated because
TeX folds a long \typeout line and swallows the space in the middle of a number.
"""
import os
import re
import subprocess
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_bend")

TEMPLATE = r"""\documentclass[tikz,border=10pt]{standalone}
\begin{document}
\begin{tikzpicture}
  \coordinate (a) at (0,0);
  \coordinate (b) at (3,0);
  \draw (a) to[bend left=%(angle)s] node[inner sep=0pt, circle, name=M] {} (b);
  \draw[->] (a) to[bend left=%(angle)s] node[%(side)s, name=L] {X} (b);
  \makeatletter
  \pgf@process{\pgfpointanchor{M}{center}}
  \typeout{P%(angle)s-%(tag)s M,\the\pgf@x,\the\pgf@y}
  \pgf@process{\pgfpointanchor{L}{center}}
  \typeout{P%(angle)s-%(tag)s L,\the\pgf@x,\the\pgf@y}
  \pgf@process{\pgfpointanchor{L}{south}}
  \typeout{P%(angle)s-%(tag)s S,\the\pgf@x,\the\pgf@y}
  \makeatother
\end{tikzpicture}
\end{document}
"""

SIDES = ["above", "below", "left", "right", "sloped", "above,sloped"]


def run(name, source):
    os.makedirs(TMP, exist_ok=True)
    path = os.path.join(TMP, name + ".tex")
    open(path, "w", encoding="utf-8").write(source)
    logpath = os.path.join(TMP, name + ".log")
    if os.path.exists(logpath):
        os.remove(logpath)
    for _ in range(2):
        subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                       cwd=TMP, capture_output=True)
    log = open(logpath, encoding="utf-8", errors="replace").read()
    errors = [l for l in log.splitlines() if l.startswith("!")]
    if len(errors) > 1:
        return "ERROR " + errors[0][2:]
    return " ".join(l.strip() for l in log.splitlines() if re.match(r"^P\d+-\S+ [MLS],", l))


def main():
    for angle in (0, 15, 45, 90):
        for i, side in enumerate(SIDES):
            got = run("bend_%d_%d" % (angle, i),
                      TEMPLATE % {"angle": angle, "side": side, "tag": i})
            print("angle=%-3d side=%-13s %s" % (angle, side, got))


if __name__ == "__main__":
    main()
