"""Which Typst identifier each LaTeX arrow/symbol actually spells to.

The symbol table can only carry a spelling the installed renderer accepts, and a wrong one reaches
the page as an error, so every candidate is compiled alone here. Output is `name -> OK|BAD`.
"""
import os
import subprocess
import sys
import tempfile

CANDIDATES = {
    "Downarrow": ["Downarrow", "arrow.d.double"],
    "Uparrow": ["Uparrow", "arrow.u.double"],
    "updownarrow": ["updownarrow", "arrow.u.d"],
    "Leftrightarrow": ["Leftrightarrow", "arrow.l.r"],
    "rightarrowtail": ["arrow.r.monospace", "mapsTo"],
    "dashrightarrow": ["arrow.r.dash", "dashrightarrow"],
    "Rrightarrow": ["arrow.r.double.long", "Rrightarrow"],
    "twoheadrightarrow": ["arrow.r.double.head", "twoheadrightarrow"],
    "curvearrowright": ["arrow.r.curve", "curvearrowright"],
    "leadsto": ["arrow.r.squiggly", "leadsto"],
    "Longleftrightarrow": ["arrow.l.r.long", "Longleftrightarrow"],
    "equiv": ["equiv", "eq.triple"],
    "propto": ["prop", "propto"],
    "parallel": ["parallel"],
    "mid": ["mid"],
    "setminus": ["without", "setminus"],
    "succ": ["succ"],
    "trianglelefteq": ["l.triangle.eq", "trianglelefteq"],
    "ngeq": ["gt.not", "ngeq"],
    "circ": ["compose", "circ"],
    "bigtriangleup": ["triangle.up", "bigtriangleup"],
    "square": ["square", "box"],
    "Vvdash": ["tack.r.v.v.v", "Vvdash"],
    "vDash": ["tack.r.double", "vDash"],
    "therefore": ["therefore"],
    "because": ["because"],
    "colon": ["colon"],
    "langle": ["angle.l", "langle"],
    "dagger": ["dagger"],
    "wp": ["wp"],
    "hbar": ["planck.constant", "hbar"],
    "Re": ["Re"],
    "Im": ["Im"],
    "Subset": ["supset.big", "Subset"],
    "cdot": ["dot.op", "cdot"],
    "star": ["star.op", "star"],
    "bullet": ["bullet"],
    "Cap": ["sect.big", "Cap"],
    "Cup": ["union.big", "Cup"],
    "uplus": ["plus.union", "uplus"],
    "wr": ["wr"],
    "ominus": ["minus.circle", "ominus"],
    "otimes": ["times.circle", "otimes"],
    "perp": ["tack.up", "perp"],
    "alpha": ["alpha"],
}

tmp = tempfile.mkdtemp(prefix="typst_symbols")
bad = 0
for latex, names in CANDIDATES.items():
    for cand in names:
        path = os.path.join(tmp, "s.typ")
        with open(path, "w", encoding="utf-8") as fh:
            fh.write("$ %s $\n" % cand)
        got = subprocess.run(["typst", "compile", path, os.path.join(tmp, "s.pdf")],
                             capture_output=True, text=True, encoding="utf-8", errors="replace")
        ok = got.returncode == 0
        print("%-18s %-22s %s" % (latex, cand, "OK" if ok else "BAD"))
        if not ok:
            bad += 1
print("failed candidates: %d" % bad)
