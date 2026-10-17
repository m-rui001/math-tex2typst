r"""Where do an in-path node's own options go: `-- node[fill=white] {x} --` keeps nothing.

A white-filled label is how TikZ interrupts a line it draws through a word, and the Partition
triangle's three such labels sit *on* their lines in the product because the emitted statement is a
bare `content((0, -0.8), [$D_u$])` -- no box, no inset, no fill. Three shapes separate the possible
causes: the same options written on a standalone `\\node`, written inline on the in-path `node[...]`,
and reached through a `\\tikzset` style the way the paper writes them.
"""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

CASES = {
    "standalone node, inline fill":
        r"\node[fill=white, inner sep=3pt] at (0,0) {$D_u$};",
    "in-path node, inline fill":
        r"\draw (0,0) -- node[fill=white, inner sep=3pt] {$D_u$} (3,0);",
    "in-path node, style fill":
        r"[overlap/.style={fill=white, inner sep=3pt}]"
        r"\draw (0,0) -- node[overlap] {$D_u$} (3,0);",
    "standalone node, style fill":
        r"[overlap/.style={fill=white, inner sep=3pt}]"
        r"\node[overlap] at (0,0) {$D_u$};",
}

for title, body in CASES.items():
    core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("",
                                 r"\begin{tikzpicture}" + body + r"\end{tikzpicture}"), None)
    print("== %s" % title)
    for line in (cetz.build(core) or "<not built>").splitlines():
        if "content(" in line or "line(" in line:
            print("   %s" % line.strip()[:150])
