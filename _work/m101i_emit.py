import sys
sys.path.insert(0, "tools")
from t2t import cetz

OPTS = ["rotate=90", "anchor=east,rotate=90", "rotate=90,anchor=south",
        "inner sep=3pt,rotate=90,anchor=south", r"font=\footnotesize,anchor=south,rotate=90",
        "above,rotate=90", "anchor=east", "rotate=90,anchor=south,draw,minimum size=1cm",
        "rotate=-63,anchor=west"]
for opt in OPTS:
    pic = (r"\begin{tikzpicture}[x=1cm,y=1cm]\node[" + opt + r"] at (0,0) {uncapped band};"
           r"\end{tikzpicture}")
    out = cetz.build(pic)
    print(opt)
    if out is None:
        print("   REFUSED")
        continue
    for line in out.splitlines():
        if "content(" in line:
            print("   " + line.strip())
