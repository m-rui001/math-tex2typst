r"""Check a node body's two maths delimiters against what pdflatex proved TeX draws.

measure_node_math.py established that `\\( ... \\)` and `$ ... $` give byte-identical page spans,
and that `\\(i)` after a line break is prose (TeX reads `\\\\` as one control sequence). These are
the same inputs through node_text, so the emitted markup can be read against that evidence.
"""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "_work" / "pic-shapes"))
from t2t import cetz, mathconv  # noqa: E402

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

PAL = {"parentblue": (0x28, 0x69, 0x8D), "childorange": (0xB7, 0x62, 0x23)}

CASES = [
    ("paren vs dollar", r"\(D(D-1)\) terms", "$D(D-1)$ terms"),
    ("greek", r"mean in \([\alpha-\eta,\alpha+\eta]\)", r"mean in $[\alpha-\eta,\alpha+\eta]$"),
    ("row break then note", r"Nested pairs\\(i) terms", None),
    ("row break then maths", r"Nested pairs\\ (i)\((i+1)\) terms", None),
    ("paper node 1", r"\textcolor{parentblue}{Separated pairs}\\ "
                     r"\(D(D-1)\) terms, each with\\ mean in \([\alpha-\eta,\alpha+\eta]\)", None),
    ("paper node 2", r"\textcolor{childorange}{Nested pairs}\\ \(D\) terms, each at least \(-1\)",
     None),
]

for label, body, other in CASES:
    print("%-20s %s" % (label, cetz.node_text(body, PAL)))
    if other is not None:
        print("%-20s %s" % ("", cetz.node_text(other, PAL)))

print("%-20s %s" % ("mathconv body", mathconv.convert_formulas(
    [r"Each has average at least $\alpha-\eta$."])[0][0]))
