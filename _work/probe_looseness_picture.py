"""The one picture that writes `looseness`: what does it hold besides that?

It sits quoted in the page, and `to[...]` ignores keys it does not know, so looseness alone cannot
be why it refuses -- this prints the picture and the stage at which the build stops.
"""
import re
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

SRC = "_work/flat/Translative-covering-densities-of-order-n-log-n-September-23-2026.tex"
text = open(SRC, encoding="utf-8", errors="replace").read()
pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end{tikzpicture}", text, re.S)
print("pictures in paper:", len(pics))
for i, pic in enumerate(pics):
    print("---- pic %d, %d chars, looseness=%s" % (i, len(pic), "looseness" in pic))
    print(pic[:1400])
    print("build ->", "None" if cetz.build(pic) is None else "emitted")
