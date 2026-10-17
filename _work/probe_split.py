"""Do the displays that mix a diagram with an equation now split into canvas + maths?

Run: python _work/probe_split.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, mathconv  # noqa: E402

SPANS = {
    "qquad after": r'''\begin{tikzcd}[column sep=large,row sep=large] \operatorname{Typ}(h)\arrow[r,"1"]\arrow[d,"1"']& \operatorname{Typ}(h)\arrow[d,"1"] \\ \operatorname{Typ}(h)\arrow[r,"1-g"']&\operatorname{Typ}(h), \end{tikzcd} \qquad h=g\text{ or }h=1.''',
    "in gathered": r'''\begin{gathered} \begin{tikzcd}[ampersand replacement=\&,column sep=large,row sep=large] \mathcal{C} \arrow[r,"L"] \arrow[dr,"e_B(S')^\vee"'] \& A \arrow[d,"\Phi"] \& B \end{tikzcd} \\ R\simeq(M')^\vee e_B^{-1}\Phi. \end{gathered}''',
    "picture alone": r'''\begin{tikzcd}[column sep=large] A \arrow[r] & B \end{tikzcd}''',
}

for name, src in SPANS.items():
    got = cetz.split(src)
    if got is None:
        print("=== %-14s split -> None" % name)
        continue
    canvas, rest = got
    spans, missing, _err = mathconv.convert_formulas([rest], {})
    print("=== %-14s rest=%s" % (name, " ".join(rest.split())[:70]))
    print("    canvas head: %s" % " ".join(canvas.split())[:80])
    print("    rest converts: %s -> %s" % (0 in spans, spans.get(0, missing.get(0, ""))[:90]))
