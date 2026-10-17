"""Where does each line of a two-line label sit inside a fixed-width Typst box?

`align:` is not an argument of Typst's `box` (measured: `unexpected argument: align`), so the
candidate for centring the author's declared-width frame is `#align(center)` around the body.
Render both spellings at a known width and read the line positions out of the PDF: a centred
paragraph starts each line at a distance from the left edge proportional to how short it is, a
left-aligned one starts every line at the same place.
"""
import pathlib
import subprocess
import sys
import tempfile

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz  # noqa: E402

import fitz

DOC = cetz.HEADER + """#set page(width: 12cm, height: 6cm, margin: 0pt)
#set text(size: 10pt)
%s
"""

CASES = {
    "plain": '#box(width: 10cm, inset: 0pt, stroke: (thickness: 0.4pt), '
             '[AA#linebreak()BBBBBBBBBBBB])',
    "align": '#box(width: 10cm, inset: 0pt, stroke: (thickness: 0.4pt), '
             '[#align(center)[AA#linebreak()BBBBBBBBBBBB]])',
}

with tempfile.TemporaryDirectory() as tmp:
    for name, body in CASES.items():
        src = pathlib.Path(tmp) / ("%s.typ" % name)
        src.write_text(DOC % body, encoding="utf-8")
        out = pathlib.Path(tmp) / ("%s.pdf" % name)
        r = subprocess.run(["typst", "compile", str(src), str(out)], capture_output=True)
        if r.returncode:
            print("%-6s COMPILE FAIL %s" % (name, r.stderr.decode("utf-8", "replace")[:200]))
            continue
        doc = fitz.open(str(out))
        page = doc[0]
        w = page.rect.width
        spans = []
        for blk in page.get_text("dict")["blocks"]:
            for ln in blk.get("lines", []):
                for sp in ln["spans"]:
                    spans.append((round(sp["bbox"][0], 2), round(sp["bbox"][2], 2),
                                  sp["text"]))
        print("%-6s page %.2fpt ; lines:" % (name, w))
        for x0, x1, txt in sorted(spans):
            print("       x0=%7.2f x1=%7.2f %r" % (x0, x1, txt))
        doc.close()
