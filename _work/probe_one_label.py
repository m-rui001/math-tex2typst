"""What one label actually emits: the paper's `\1` macro with an escaped-brace subscript."""
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
from t2t import cetz

for tex in [r"\1_{\{v\}}", r"\1_{v}", r"\mathbb{1}_{\{u\}}"]:
    built = cetz.build("\\begin{tikzpicture}\\node at (0,0) {$%s$};\\end{tikzpicture}" % tex)
    if not built:
        print("%-22s refused" % tex)
        continue
    line = [l.strip() for l in built.splitlines() if "content(" in l]
    print("%-22s %s" % (tex, line))
