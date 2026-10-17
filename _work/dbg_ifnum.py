"""Step through the foreach+ifnum picture to see which stage drops it."""
import sys

sys.path.insert(0, "tools")
from t2t import cetz

body = (r"\foreach \k in {0,...,2}{\ifnum\k<2\draw (0,\k) -- (1,\k);\else"
        r"\draw (2,\k) -- (3,\k);\fi}")
expanded = cetz.expand_foreach(body)
print("foreach:", repr(expanded))
print("pattern:", repr(cetz.IFNUM.pattern), "match:", cetz.IFNUM.search(expanded))
print("term:", cetz._int_term(expanded, cetz.IFNUM.search(expanded).end()))
if expanded is not None:
    print("ifnum:", repr(cetz.expand_ifnum(expanded)))
print("build:", cetz.build(r"\begin{tikzpicture}" + body + r"\end{tikzpicture}"))
