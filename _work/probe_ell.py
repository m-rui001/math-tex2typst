import sys
from pathlib import Path
sys.path.insert(0, str(Path("tools").resolve()))
from t2t import cetz

cases = [
    r"L_{\ell,t}\sum_i\alpha_i+ L_{\ell,u}\sum_i\beta_i=b_\ell",
    r"L_{\ell,t}\sum_i\alpha_i",
    r"b_\ell",
    r"L_{\ell,u}",
]
for c in cases:
    print(repr(c), "->", repr(cetz._math_body(c)))

decl = (r"\begin{tikzpicture}"
        r"\node[align=center] at (7.65,-1.28) "
        r"{\(L_{\ell,t}\sum_i\alpha_i+ L_{\ell,u}\sum_i\beta_i=b_\ell\)};"
        r"\end{tikzpicture}")
out = cetz.build(decl)
print("=== build ===")
print(out)
