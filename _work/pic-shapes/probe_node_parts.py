r"""Which part of the Thompsons node, if any, still refuses?

Each case is the picture's own node with one option removed, so a verdict names the blocker instead
of the whole option group, and a case that builds shows the text width reaching the canvas.
"""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "_work" / "pic-shapes"))
from t2t import cetz  # noqa: E402

HEAD = ("\\begin{tikzpicture}[x=1.05cm,y=0.62cm,font=\\small]"
        "\\definecolor{parentblue}{HTML}{28698D}\\definecolor{childorange}{HTML}{B76223}\n"
        "%s\\end{tikzpicture}")
TEXT = (r"{\textcolor{parentblue}{Separated pairs}"
        r"\\ \(D(D-1)\) terms, each with\\ mean in \([\alpha-\eta,\alpha+\eta]\)}")

CASES = [
    ("the picture's node", r"\node[anchor=west,align=left,text width=5.2cm] at (5.45,3.15) " + TEXT),
    ("no text width", r"\node[anchor=west,align=left] at (5.45,3.15) " + TEXT),
    ("no align", r"\node[anchor=west,text width=5.2cm] at (5.45,3.15) " + TEXT),
    ("no anchor", r"\node[align=left,text width=5.2cm] at (5.45,3.15) " + TEXT),
    ("single line only", r"\node[anchor=west,align=left,text width=5.2cm] at (5.45,3.15)"
                         r"{Separated pairs};"),
    ("\\ breaks, no width", r"\node[anchor=west,align=left] at (5.45,3.15)"
                            r"{Separated pairs\\ \(D(D-1)\) terms};"),
    ("cm width, plain text", r"\node[text width=5.2cm] at (5.45,3.15){Separated pairs};"),
    ("math in \\( \\) form", r"\node at (5.45,3.15){mean in \([\alpha-\eta,\alpha+\eta]\)};"),
    ("math in $ $ form", r"\node at (5.45,3.15){mean in $[\alpha-\eta,\alpha+\eta]$};"),
]

for label, body in CASES:
    canvas = cetz.build(HEAD % (body + ";"))
    print("%-24s %s" % (label, "builds" if canvas else "REFUSES"))
    if canvas:
        for line in canvas.splitlines():
            if "content(" in line:
                print("       %s" % line.strip()[:150])
