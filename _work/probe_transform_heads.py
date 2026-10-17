"""Which picture-level options does `_transform` refuse?

`transform` is the single biggest refusal stage left (5 pictures): it fires before one statement is
read, so whatever the authors wrote in the picture's option block is something the axis transform
cannot be built from. Print every head that fails, with the paper, so the families can be named.
"""
import re
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{tikzpicture\}(.*?)\\end\{tikzpicture\}", re.S)

for src in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = src.read_text(encoding="utf-8", errors="replace")
    for m in PICTURE.finditer(text):
        body = m.group(1)
        head, _ = cetz._opts_at(body, 0)
        if head is None or cetz._transform(head) is not None:
            continue
        opts = " ".join(str(item) for item in head)
        print("%-40s %s" % (src.stem[:40], opts[:150]))
