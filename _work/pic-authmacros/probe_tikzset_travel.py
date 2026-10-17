r"""Does a picture-wide `\tikzset` default refuse a picture it stands inside?

Decides whether such a statement should travel with the picture or stay in the body.
"""
import sys
sys.path.insert(0, "_work/pic-authmacros")
from t2t import cetz, convert, prep

head = r"\begin{tikzpicture}"
tail = r"\end{tikzpicture}"
stmts = {
    "global default inside": r"\tikzset{line width=2pt}" "\n" r"\draw (0,0) -- (1,1);",
    "pure style inside": r"\tikzset{box/.style={draw}}" "\n" r"\node[box] at (0,0) {$x$};" "\n" r"\draw (0,0) -- (1,1);",
}
for tag, body in stmts.items():
    core = head + "\n" + body + "\n" + tail
    canvas = cetz.build(core, {}, 0.0)
    print(tag, "->", "None (refused)" if canvas is None else "built: %d lines" % len(canvas.splitlines()))

# and the same statement left in the body (never travelling): does the picture still convert?
for tag, body in stmts.items():
    src = r"\begin{document}" "\n" + body + "\n" + head + r"\draw (0,0) -- (1,1);" + tail
    pre, rest = prep.split_document(src)
    p = prep.parse_preamble(pre)
    scopes = convert.picture_scopes(rest, p.macros)
    print(tag, "| travelling declarations:", repr(scopes[0][1]))
