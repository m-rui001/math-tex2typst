r"""#102 leg D: what the fix emits for the shapes the corpus writes (the test's expectation source).

Every expectation in the new test cell has to come from the emitter itself, not from the table in my
head, so this prints the whole `stroke:` of one statement per shape: the six names, a name reached
through a style and through the picture head (a scope default has to land on a node's frame too --
the same claim #90 measured for caps), an explicit `dash pattern=` with one and with two on/off pairs,
`dash dot` at two pens, `solid`, and the two patterns this fix refuses to price in full.

  PYTHONIOENCODING=utf-8 python _work/probe102d_dash_emit_shapes.py
"""
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402
OUT = os.path.join(HERE, "label102d_dash_emit_shapes.txt")

CASES = [
    ("dashed", "", r"\draw[dashed] (0,0)--(2,0);"),
    ("densely dashed", "", r"\draw[densely dashed] (0,0)--(2,0);"),
    ("loosely dashed", "", r"\draw[loosely dashed] (0,0)--(2,0);"),
    ("dotted", "", r"\draw[dotted] (0,0)--(2,0);"),
    ("densely dotted", "", r"\draw[densely dotted] (0,0)--(2,0);"),
    ("loosely dotted", "", r"\draw[loosely dotted] (0,0)--(2,0);"),
    ("densely dotted, thick pen", "", r"\draw[densely dotted, thick] (0,0)--(2,0);"),
    ("densely dashed via style", "[d/.style={densely dashed}]", r"\draw[d] (0,0)--(2,0);"),
    ("densely dashed on the head", "[densely dashed]", r"\draw (0,0)--(2,0);"),
    ("densely dashed on the head, node frame", "[densely dashed]",
     r"\node[draw] at (1,1) {X};"),
    ("dash pattern one pair", "", r"\draw[dash pattern=on 4pt off 2.5pt] (0,0)--(2,0);"),
    ("dash pattern two pairs", "",
     r"\draw[dash pattern=on 4pt off 2pt on 1pt off 2pt] (0,0)--(2,0);"),
    ("dash pattern mm", "", r"\draw[dash pattern=on 1mm off 1mm] (0,0)--(2,0);"),
    ("dash dot, default pen", "", r"\draw[dash dot] (0,0)--(2,0);"),
    ("dash dot, thick pen", "", r"\draw[dash dot, thick] (0,0)--(2,0);"),
    ("solid", "", r"\draw[solid] (0,0)--(2,0);"),
    ("pattern with a pgflinewidth element", "",
     r"\draw[dash pattern=on 3pt off 2pt on \pgflinewidth off 2pt] (0,0)--(2,0);"),
    ("pattern in bp", "", r"\draw[dash pattern=on 3bp off 2bp] (0,0)--(2,0);"),
]


def strokes(text):
    """Every `stroke: (...)` with its parens balanced -- a length list nests inside the stroke."""
    out = []
    for m in re.finditer(r"stroke: \(", text):
        depth = 0
        for i in range(m.end() - 1, len(text)):
            depth += {"(": 1, ")": -1}.get(text[i], 0)
            if depth == 0:
                out.append(text[m.start():i + 1])
                break
    return out


def main():
    sys.stdout.reconfigure(errors="replace")
    out = []
    for name, head, stmt in CASES:
        canvas = cetz.build(r"\begin{tikzpicture}" + head + stmt + r"\end{tikzpicture}")
        if canvas is None:
            out.append("%-40s REFUSED" % name)
            continue
        got = strokes(canvas)
        out.append("%-40s %s" % (name, " | ".join(got) if got else canvas.strip()[:120]))
    text = "\n".join(out) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
