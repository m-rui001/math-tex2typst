"""Which control sequences inside a picture's maths leave nothing to draw.

`_math_body` deletes every command it has no Typst spelling for, so a node whose whole text is
`$\Phi$` ends up with an empty label and the figure loses it in silence. Count the sequences
that leave a span empty, and say how many of them sit in a picture that draws today.
"""
import pathlib
import re
import sys
from collections import Counter

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
MATHSPAN = re.compile(r"\$([^$]*)\$")
CMD = re.compile(r"\\[a-zA-Z]+")

lost = Counter()
in_drawn = Counter()
labels = 0
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(src):
        draws = bool(cetz.build(cetz.MATH_ENVELOPE.sub("", pic)))
        for span in MATHSPAN.findall(pic):
            if not CMD.search(span):
                continue
            if cetz._math_body(span):
                continue
            labels += 1
            for cmd in CMD.findall(span):
                lost[cmd] += 1
                if draws:
                    in_drawn[cmd] += 1

print({"empty maths labels": labels, "in pictures that draw": sum(in_drawn.values())})
for cmd, n in lost.most_common(28):
    print("  %-18s %4d  (drawing now: %d)" % (cmd, n, in_drawn.get(cmd, 0)))
