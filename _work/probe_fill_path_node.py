"""Does a node written on a `\fill ... circle` statement reach the canvas?

The honeycomb figure's pivots are drawn that way and their `$M$`/`$m$` labels are missing from the page,
so each spelling is built on its own and the emitted lines printed.
"""
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

CASES = {
    "fill circle node": r"\fill (.3,1.8) circle (1.2pt) node[above left] {$M$};",
    "fill circle bare": r"\fill (.3,1.8) circle (1.2pt);",
    "fill node only": r"\fill (.3,1.8) node[above left] {$M$};",
    "draw circle node": r"\draw (.3,1.8) circle (1.2pt) node[above left] {$M$};",
    "path circle node": r"\path (.3,1.8) circle (1.2pt) node[above left] {$M$};",
    "fill no space": r"\fill(.3,1.8)circle(1.2pt) node[above left]{$M$};",
    "node after fill at": r"\fill (1,1) circle (2pt) node {$x$};",
}
for name, stmt in CASES.items():
    pic = r"\begin{tikzpicture}[x=1cm,y=1cm]" + stmt + r"\end{tikzpicture}"
    got = cetz.build(pic)
    body = "-" if got is None else " | ".join(
        ln.strip() for ln in got.splitlines()[2:-1] if ln.strip())
    print("%-20s %s" % (name, body[:118]))
