"""Can Typst make a box whose width is a MINIMUM, the way TikZ's `minimum width` is?

The grown frame hands the box the width the author declared, and where our font metrics need more
than that Typst breaks a word in half (`Finite FK compar / isons`, measured on
Self-dual-random-cluster p8). The candidate is `measure`: ask Typst for the content's own width and
take the larger of the two. This renders both directions of the test -- a declared width too small,
and one generously large -- and reads the stroked rectangles back out of the PDF, so the answer is
the geometry on the page rather than a compile status.
"""
import pathlib
import subprocess
import sys
import tempfile

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz  # noqa: E402

import fitz

CAND = ("#context {"
        "  let _t = [#align(center)[%s]];"
        "  let _w = measure(_t).first().x;"
        "  box(width: max(%scm, _w + 0.6666em), inset: 0.3333em,"
        "      stroke: (thickness: 0.4pt), [_t])"
        "}")
PLAIN = "#box(width: %scm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#align(center)[%s]])"

CASES = [
    ("too-narrow", "Finite FK comparisons#linebreak()rectangles and sectors", 3.552),
    ("generous", "short#linebreak()label", 8.0),
]

DOC = cetz.HEADER + "#set page(width: 20cm, height: 4cm, margin: 0pt)\n#set text(size: 9.6pt)\n%s\n"


def rects(doc):
    out = []
    for d in doc[0].get_drawings():
        r = d["rect"]
        if r.width > 20 and r.height > 10:
            out.append((round(r.width, 2), round(r.height, 2)))
    return out


with tempfile.TemporaryDirectory() as tmp:
    for name, text, w in CASES:
        for style, src in (("plain", PLAIN % (w, text)), ("measure", CAND % (text, w))):
            f = pathlib.Path(tmp) / ("%s-%s.typ" % (name, style))
            f.write_text(DOC % src, encoding="utf-8")
            out = f.with_suffix(".pdf")
            r = subprocess.run(["typst", "compile", str(f), str(out)], capture_output=True)
            if r.returncode:
                print("%-11s %-7s FAIL %s" % (name, style,
                                              r.stderr.decode("utf-8", "replace")[:600]))
                print("      src: %s" % src[:300])
                continue
            doc = fitz.open(str(out))
            print("%-11s %-7s declared %.3fcm -> rects %s" % (name, style, w, rects(doc)))
            doc.close()
