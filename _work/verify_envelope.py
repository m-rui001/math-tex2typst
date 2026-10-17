r"""Where the display-envelope strip changes a picture's verdict.

`convert` removes `\[` and `\]` so a picture wrapped in a display still parses, but `\\[3pt]`
inside a node's text holds a line break followed by a bracket, and the strip eats the second
backslash. A picture that draws only after that rewrite is drawing a mangled source: compare
the two verdicts over every picture in the corpus and print the ones that disagree.
"""
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
BREAK = re.compile(r"\\\\\[")

differs = 0
breaks = 0
total = 0
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(src):
        total += 1
        if not BREAK.search(pic):
            continue
        breaks += 1
        raw = cetz.build(pic)
        strip = cetz.build(cetz.MATH_ENVELOPE.sub("", pic))
        if (raw is None) != (strip is None):
            differs += 1
            print("%s: raw=%s stripped=%s" % (
                path.stem[:60], "draws" if raw else "refuses",
                "draws" if strip else "refuses"))

print({"pictures": total, "with-linebreak-bracket": breaks,
      "verdict differs": differs})
