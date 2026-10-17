"""Check node placement, coordinate intersection and per-coordinate shifts."""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

CASES = {
    "bare node at origin": r"""\begin{tikzpicture}
\node (a) {Alpha};
\node (b) at (2,0) {Beta};
\draw (a) -- (b);
\end{tikzpicture}""",
    "bare node under scaled scope": r"""\begin{tikzpicture}[x=2cm,y=3cm]
\begin{scope}[shift={(1,1)}]
\node (a) {Gamma};
\draw (a) -- (2,2);
\end{scope}
\end{tikzpicture}""",
    "coordinate intersection": r"""\begin{tikzpicture}
\node (a) at (0,0) {A};
\node (b) at (3,2) {B};
\draw[->] (a.north -| b.south) -- (b);
\draw (a |- b) -- (b -| a);
\end{tikzpicture}""",
    "per-coordinate shift": r"""\begin{tikzpicture}
\node (a) at (1,1) {A};
\draw ([yshift=2pt]a) -- (2,0);
\draw[->] ([xshift=3mm,yshift=-4mm]a.east) -- (3,3);
\end{tikzpicture}""",
    "positioning is refused": r"""\begin{tikzpicture}
\node (a) at (0,0) {A};
\node[below=5mm of a] {B};
\end{tikzpicture}""",
    "node with text containing 'of'": r"""\begin{tikzpicture}
\node at (1,1) {the set of all points};
\end{tikzpicture}""",
    "definecolor palette": r"""\begin{tikzpicture}
\definecolor{rowshade}{RGB}{182,218,223}
\definecolor{light}{rgb}{0.5,0.25,0.1}
\definecolor{hexy}{HTML}{3FA9F5}
\definecolor{g}{gray}{0.4}
\fill[rowshade] (0,0) rectangle (1,1);
\draw[black!55] (1,1) -- (2,2);
\node[fill=light] at (3,0) {X};
\draw[hexy] (0,2) -- (1,2);
\draw[g] (0,3) -- (1,3);
\end{tikzpicture}""",
    "unknown color model refuses": r"""\begin{tikzpicture}
\definecolor{c}{cmyk}{0,1,1,0}
\draw[c] (0,0) -- (1,1);
\end{tikzpicture}""",
    "bare colour follows the action": r"""\begin{tikzpicture}
\fill[red] (0,0) rectangle (1,1);
\draw[blue,dashed] (1,1) -- (2,2);
\filldraw[green] (2,0) circle (3pt);
\draw[fill=orange] (3,1) -- (4,1) -- (4,2) -- cycle;
\draw[draw=red,line width=2pt,dotted] (0,2) -- (1,2);
\end{tikzpicture}""",
}

for name, pic in CASES.items():
    got = cetz.convert(pic)
    print("=== %s" % name)
    print(got if got else "REFUSED")
