r"""#89 test leg: what `cetz.build` answers for the four statements the new test asserts on.

Read it against the law (tangent at the declared page radius, arc from the back-vector of the incoming
edge to the forward vector of the outgoing one, sweep never over 180deg) -- the point is to see whether
the canvas shifts the picture's own coordinates, which decides the numbers the test may quote.
"""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
from t2t import cetz  # noqa: E402

CASES = {
    "plain-two-point": "\\begin{tikzpicture}\\draw (0,0) -- (4,0);\\end{tikzpicture}",
    "box8": "\\begin{tikzpicture}\\draw[rounded corners=8pt] (0,0) -- (4,0) -- (4,4) -- (0,4);"
            "\\end{tikzpicture}",
    "left-turn": "\\begin{tikzpicture}\\draw[rounded corners=8pt] (0,0) -- (4,0) -- (4,-4);"
                 "\\end{tikzpicture}",
    "overshoot40": "\\begin{tikzpicture}\\draw[rounded corners=40pt] (0,0) -- (1,0) -- (1,4);"
                   "\\end{tikzpicture}",
    "scaled-half": "\\begin{tikzpicture}[x=0.5cm,y=0.5cm]\\draw[rounded corners=8pt] (0,0) -- (4,0)"
                   " -- (4,4);\\end{tikzpicture}",
    "collinear": "\\begin{tikzpicture}\\draw[rounded corners=8pt] (0,0) -- (2,0) -- (4,0) -- (4,4);"
                 "\\end{tikzpicture}",
    "bare": "\\begin{tikzpicture}\\draw[rounded corners] (0,0) -- (4,0) -- (4,4);\\end{tikzpicture}",
    "marked": "\\begin{tikzpicture}\\draw[->,rounded corners=6pt] (0,0) -- (4,0) -- (4,-4) -- (0,-4);"
              "\\end{tikzpicture}",
}

for name, src in CASES.items():
    print("\n=== %s" % name)
    print(cetz.build(src))
