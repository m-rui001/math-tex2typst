r"""Which option of the BSD diagram's own picture head makes its four nodes land on (0, 0)?

The picture as authored carries `baseline=(lower.base)`, `>=Stealth` and `node distance=8mm and 16mm`,
and its node text is `\(U_-\)`.  `cetz._transform` reads that head, and the relative placements
(`above right=of lower`) are offsets out of it; a head option the reader answers with nothing is a
placement of nothing.  Each line drops or rewrites one feature of the string that is read from the
paper, never a string the probe invented, so the surviving difference is the culprit.
"""
import io
import re
import sys

sys.path.insert(0, r"E:\math\tools")
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

PAPER = ("The-two-primary-Birch-Swinnerton-Dyer-formula-in-Selmer-corank-at-most-one"
         "-September-24-2026")
text = open(r"E:\math\_work\flat\%s.tex" % PAPER, encoding="utf-8").read()
pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", text, re.S)
real = pics[1]
print("AUTHORED HEAD:", re.match(r"\\begin\{tikzpicture\}\[([^\]]*)\]", real).group(1))
print("AUTHORED BODY:", " | ".join(real.splitlines()[1:6])[:220])

MUT = [
    ("verbatim", lambda s: s),
    ("drop baseline=", lambda s: s.replace("baseline=(lower.base),", "")),
    ("node distance=1cm", lambda s: s.replace("node distance=8mm and 16mm", "node distance=1cm")),
    ("drop node distance", lambda s: s.replace(",node distance=8mm and 16mm", "")),
    ("node text $ $", lambda s: s.replace(r"\(", "$").replace(r"\)", "$")),
    ("drop >=Stealth", lambda s: s.replace(">=Stealth,", "")),
]
for label, fn in MUT:
    src = fn(real)
    canvas = cetz.build(src)
    if canvas is None:
        print("%-22s -> build None" % label)
        continue
    coords = re.findall(r"\(\s*([-\d.e]+,\s*[-\d.e]+)\s*\)", canvas)
    uniq = sorted(set(coords))
    print("%-22s -> %d statements, coords=%s" % (label, canvas.count("\n  "), uniq[:6]))
