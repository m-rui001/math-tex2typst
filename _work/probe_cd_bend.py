"""Why does the CeTz gate refuse these tikzcd diagrams? Walk the stages.

Run: python _work/probe_cd_bend.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

SPANS = {
    "bend pair": r''' \begin{tikzcd}[column sep=large] \mathscr{D}_C^{\mathrm{or}} \arrow[r,bend left=18,"\mathfrak{s}"] &\mathscr{D}_\Gamma^{\mathrm{or}} \arrow[l,bend left=18,"\mathfrak{f}"] \end{tikzcd}''',
    "prime swap": r''' \begin{tikzcd}[column sep=large,row sep=large] \operatorname{Typ}(h)\arrow[r,"1"]\arrow[d,"1"']& \operatorname{Typ}(h)\arrow[d,"1"] \\ \operatorname{Typ}(h)\arrow[r,"1-g"']&\operatorname{Typ}(h), \end{tikzcd}''',
    "in gathered": r''' \begin{tikzcd}[ampersand replacement=\&,column sep=large,row sep=large] \mathcal{C} \arrow[r,"L"] \arrow[dr,"e_B(S')^\vee"'] \& A \arrow[d,"\Phi"] \& B \end{tikzcd}''',
}

for name, src in SPANS.items():
    print("=== %s" % name)
    for fn, label in ((cetz.build, "build"), (cetz.build_cd, "build_cd")):
        got = fn(src)
        if got is None:
            print("    %-9s -> None" % label)
            continue
        print("    %-9s -> sane=%s compiles=%s" % (label, cetz.sane(got), cetz.compiles(got)))
        if not cetz.compiles(got):
            print("    canvas: %s" % " ".join(got.split())[:300])
