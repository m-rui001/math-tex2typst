"""Which picture the text-colour rule newly refuses, and does coloured text compile.

The gate is the typst compiler itself: a colour rendered as page text has to survive the same
compile check the batch applies, so this converts the two pictures the corpus shows colour in.
"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TEXTCOLOR = re.compile(r"\\textcolor")

for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if not TEXTCOLOR.search(pic):
            continue
        got = cetz.convert(pic)
        print("%s -> %s" % (f.stem[:46], "built+compiled" if got else "REFUSED"))
        if not got:
            print("   " + " ".join(pic.split())[:200])
