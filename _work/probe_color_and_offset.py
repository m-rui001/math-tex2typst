"""How many picture statements carry the two surfaces found on the page.

A colour command inside a node prints its colour specification as words, because the text
stripper deletes command names and keeps their arguments. A coordinate offset written as
([yshift=2pt]name.anchor) refuses the statement it appears in. Both are counted over the
pictures the batch sees, and the offset ones are checked against build() so the count of
pictures a fix would recover is measured, not guessed. Nothing here compiles.
"""
import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
COLOR = re.compile(r"\\(?:textcolor|color|colorbox|fcolorbox)\b")
OFFSET = re.compile(r"\(\s*\[[^\]]*?\][^()]*?\)")

color_papers, offset_papers = Counter(), Counter()
offset_built = offset_refused = 0
for f in sorted(Path("_work/flat").glob("*.tex")):
    text = f.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(text):
        if COLOR.search(pic):
            color_papers[f.stem[:44]] += 1
        if OFFSET.search(pic):
            offset_papers[f.stem[:44]] += 1
            if cetz.build(pic) is None:
                offset_refused += 1
            else:
                offset_built += 1

print("pictures with a colour command in their text: %d over %d papers"
      % (sum(color_papers.values()), len(color_papers)))
for p, n in color_papers.most_common(10):
    print("  %2d  %s" % (n, p))
print("pictures with an offset coordinate: %d over %d papers"
      % (sum(offset_papers.values()), len(offset_papers)))
for p, n in offset_papers.most_common(10):
    print("  %2d  %s" % (n, p))
print("of those pictures, build() today: built %d / refused %d" % (offset_built, offset_refused))
