"""The parser against the shapes the census found, one line each.

`_work/probe_arrowtips.py` listed every arrow key the corpus writes; this feeds each of them to the
real `opts()` + `arrow_mark` and prints what comes out, so a shape that is mis-split or dropped shows
up here before the batch runs. The last rows are keys that merely contain a dash and must stay alone.
"""
import sys

sys.path.insert(0, "tools")
sys.stdout.reconfigure(errors="replace")

from t2t import cetz  # noqa: E402

SPECS = [
    "->", "<-", "<->", "-.->", "<-.", ".->", "|-|", "|<->|",
    "-{Stealth[length=2mm]}", "-{Latex[length=2mm]}", "-{Stealth}", "-{Stealth[length=5pt]}",
    "-{Stealth[length=2.1mm,width=1.5mm]}",
    "{Latex[length=1.3mm]}-{Latex[length=1.3mm]}",
    "{Stealth[length=1.5mm]}-{Stealth[length=1.5mm]}",
    "-latex", "-Stealth", "<->>", "-->",
    "thick", "draw=black!65", ">=stealth", "x-scale=-1", "inner sep", "rounded corners",
    "text-b", "o-ox", "*", "-o", "-x", "-|", "-{Triangle}", "-{unknown}]",
]

for spec in SPECS:
    o = cetz.opts(spec)
    print("%-38r opts=%-28s -> %s" % (
        spec, sorted(o), cetz.arrow_mark(o, None, True)))

PIC = (r"\begin{tikzpicture}[>=stealth,flow/.style={-{Stealth[length=2mm]},thick,draw=red},"
       r"back/.style={|-|},both/.style={{Latex[length=1.3mm]}-{Latex[length=1.3mm]}}]"
       r"\draw[flow] (0,0) -- (2,0);\draw[back] (0,1) -- (2,1);"
       r"\draw[both] (0,2) -- (2,2);\draw (0,3) -- (2,3);\end{tikzpicture}")
print(cetz.build(PIC))
