r"""Does a picture-wide `\tikzset` default refuse the drawing, or silently mis-ink it?

The check is between two readings of the same statement: folded into the picture by
`convert.with_declarations` versus left in the body where the picture never sees it. A statement the
emitter refuses when it stands inside the picture must keep refusing there, because the alternative
is a converted figure drawn in an ink the author overrode.
"""
import sys
sys.path.insert(0, "_work/pic-authmacros")
from t2t import cetz, convert, prep

PIC = "\\begin{tikzpicture}\n\\draw (0,0) -- (1,1);\n\\end{tikzpicture}"

for stmt in ("\\tikzset{line width=2pt}",
             "\\tikzset{every node/.style={draw}}",
             "\\tikzset{every picture/.style={line width=3pt}}"):
    inside = "\\begin{tikzpicture}\n" + stmt + "\n\\draw (0,0) -- (1,1);\n\\end{tikzpicture}"
    print("INSIDE ", stmt, "->", "refused" if cetz.build(inside, {}, 0.0) is None else "built")
    body = stmt + "\n\n" + PIC
    _pre, rest = prep.split_document("\\begin{document}\n" + body + "\n\\end{document}")
    scopes = convert.picture_scopes(rest, {})
    print("   travels as declarations:", repr(scopes[0][1]), "| left in body:", stmt in rest)
