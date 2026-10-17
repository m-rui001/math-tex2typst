"""What the two-value positioning form is worth, measured through build().

The corpus writes 'below left=12mm and -12mm of table' on nodes that used to refuse their whole
picture. This counts the pictures that carry the form and how many of them build now. Run it when
no batch is in flight: it reads _work/flat, which a running batch rewrites.
"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TWO = re.compile(r"\b(?:above|below|left|right)\s[^=]*=\s*[-+\d.]+\s*(?:cm|mm|pt|em|ex|in)?"
                 r"\s+and\s+[-+\d.]+")

built = refused = 0
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if not TWO.search(pic):
            continue
        if cetz.build(pic) is None:
            refused += 1
            print("refused  %s" % f.stem[:52])
        else:
            built += 1
            print("built    %s" % f.stem[:52])
print("two-value positioning: built %d / refused %d" % (built, refused))
