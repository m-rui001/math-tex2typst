"""What exactly does a node's self-loop line ask for?

Each case is the loop written one way or another inside a minimal picture, so the first spelling that
comes back None names the construct the converter does not yet answer.
"""
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

HEAD = (r"\begin{tikzpicture}[x=1cm,y=1cm]"
        r"\node[circle,draw,minimum size=8mm] (six) at (0,0) {$6$};")
CASES = {
    "out/in,looseness": r"\draw (six) to[out=135,in=45,looseness=5] (six);",
    "out/in": r"\draw (six) to[out=135,in=45] (six);",
    "bend": r"\draw (six) to[bend left=45] (six);",
    "loop above": r"\draw (six) edge[loop above] (six);",
    "plain to": r"\draw (six) to (six);",
    "controls": r"\draw (six) .. controls (1,1) and (2,1) .. (six);",
    "out/in,looseness bare coord": r"\draw (0,0) to[out=135,in=45,looseness=5] (0,0);",
    "out/in bare coord": r"\draw (0,0) to[out=135,in=45] (0,0);",
    "arrow out/in": r"\draw[->] (six) to[out=135,in=45,looseness=5] (six);",
    "dashed out/in": r"\draw[dashed] (six) to[out=135,in=45,looseness=5] (six);",
}
for name, body in CASES.items():
    pic = HEAD + body + r"\end{tikzpicture}"
    got = cetz.build(pic)
    line = "-"
    if got:
        line = next((ln.strip() for ln in got.splitlines()
                     if "bezier" in ln or "line(" in ln), "-no curve-")
    print("%-28s %-8s %s" % (name, "emitted" if got else "REFUSES", line[:96]))
