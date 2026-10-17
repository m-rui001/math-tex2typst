r"""Count how many of the three papers' pictures the converter draws, for any t2t tree.

`cetz.build` is the whole drawing decision minus the typst compile gate, which this task must never
invoke; `sane` is the structural check the production path applies before that gate, so a canvas
that fails it would reach the paper as a verbatim `#raw` block just like a None.

Usage: python scan_family.py _work/pic-plot      (sandbox)
       python scan_family.py tools               (live tree, for the before number)
"""
import sys
from pathlib import Path

root = Path(sys.argv[1]).resolve()
sys.path.insert(0, str(root))
from t2t import cetz, convert, prep  # noqa: E402

PAPERS = [
    "Mass-and-covering-exponents-for-fixed-length-honeycomb-walks",
    "The-joint-scaling-limit-of-critical-Ashkin-Teller-currents",
    "Nonuniqueness-with-local-conservation-for-the-hard-sphere",
]
FLAT = Path("E:/math/_work/flat")

total_refused = 0
for prefix in PAPERS:
    src_path = next(p for p in sorted(FLAT.glob(prefix + "*.tex")))
    src = src_path.read_text(encoding="utf-8")
    pre_text, _ = prep.split_document(src)
    cm = convert.line_cm(prep.parse_preamble(pre_text))
    drawn = refused = 0
    for i, m in enumerate(cetz.PICTURE_ENV.finditer(src)):
        canvas = cetz.build(m.group(0), None, cm)
        if canvas is not None and cetz.sane(canvas):
            drawn += 1
        else:
            refused += 1
            print("  REFUSED %s #%d" % (prefix[:28], i))
    print("%s -> %d canvas, %d would be #raw(block: true, lang: \"latex\")"
          % (prefix[:42], drawn, refused))
    total_refused += refused
print("TOTAL refused pictures:", total_refused)
