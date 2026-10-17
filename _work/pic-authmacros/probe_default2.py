r"""Which side of `convert.picture_scopes` keeps a picture-wide default honest?

`picture_scopes` reads the block between two pictures and has to decide what travels with the drawing
below it. A `\tikzset` that sets a whole-picture default draws nothing itself, but it changes the ink
of everything under it, so the question is whether the emitter still refuses a picture that carries
one -- if it does, travelling is the honest choice, because dropping the statement instead would
convert the figure in an ink the author overrode.
"""
import sys
sys.path.insert(0, "_work/pic-authmacros")
from t2t import cetz, convert, prep

STMTS = ("\\tikzset{line width=2pt}",
         "\\tikzset{every node/.style={draw}}",
         "\\tikzset{every picture/.style={line width=3pt}}",
         "\\tikzset{box/.style={draw}, line width=2pt}")

for stmt in STMTS:
    inside = "\\begin{tikzpicture}\n" + stmt + "\n\\draw (0,0) -- (1,1);\n\\node (a) at (2,2) {$x$};\n\\end{tikzpicture}"
    canvas = cetz.build(inside, {}, 0.0)
    print("%-58s inside picture: %s" % (stmt, "refused" if canvas is None else "built"))
