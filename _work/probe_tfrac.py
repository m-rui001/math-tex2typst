import sys
sys.path.insert(0, "tools")
sys.stdout.reconfigure(errors="replace")
from t2t import cetz

for tex in [r"t=\tfrac12", r"\frac{1}{2}", r"\dfrac{a}{b}", r"x+\tfrac{1}{2}", r"\cfrac12"]:
    src = "\\begin{tikzpicture}\\node at (0,0) {$%s$};\\end{tikzpicture}" % tex
    print(repr(tex), "->", cetz.convert(src)[0] if isinstance(cetz.convert(src), tuple) else "")
    print("   build:", [l.strip() for l in cetz.build(src).splitlines() if "content(" in l])
