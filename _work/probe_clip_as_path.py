r"""Does the `path` verb draw nothing, so that reading \clip as a path is the right alias?

A \clip path is invisible in TikZ; if \path is invisible here too, the whole clip family is one verb
alias rather than a statement-level rewrite. The second picture is the same drawing with its clip
left in, which is what the corpus does today.
"""
import sys

sys.path.insert(0, "tools")
from t2t import cetz

PATH_ONLY = (r"\begin{tikzpicture}"
             r"\draw (0,0) -- (1,1);"
             r"\path (2,0) -- (3,1);"
             r"\end{tikzpicture}")
CLIPPED = (r"\begin{tikzpicture}"
           r"\clip (-0.4,-0.3) -- (0.4,-0.3) -- (0,0.5) -- cycle;"
           r"\draw (0,0) -- (1,1);"
           r"\end{tikzpicture}")
RECT = (r"\begin{tikzpicture}"
        r"\clip (0,0) rectangle (5,3);"
        r"\draw[->] (0,0) -- (4,0);"
        r"\draw (1,1) coordinate (A) -- (2,2);"
        r"\end{tikzpicture}")

for name, src in (("path", PATH_ONLY), ("clip triangle", CLIPPED), ("clip rect", RECT)):
    print("==", name, "->", repr(cetz.convert(src))[:220])

print("== clip rewritten as path ->",
      repr(cetz.convert(CLIPPED.replace("\\clip", "\\path")))[:220])
print("== rect clip rewritten as path ->",
      repr(cetz.convert(RECT.replace("\\clip", "\\path")))[:300])
