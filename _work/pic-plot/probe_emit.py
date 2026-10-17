r"""Print what the emitter now draws for the three plots this family owns.

Each printed line is checked against a number pdflatex measured (`measurements.md`), so the canvas
and TeX's own PDF are compared rather than the canvas against itself.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from t2t import cetz, convert, prep  # noqa: E402

FLAT = Path("E:/math/_work/flat")
CASES = [
    ("Mass-and-covering-exponents-for-fixed-length-honeycomb-walks", "plot[smooth]"),
    ("The-joint-scaling-limit-of-critical-Ashkin-Teller-currents", "plot[smooth]"),
    ("Nonuniqueness-with-local-conservation-for-the-hard-sphere", "samples=70"),
]

for prefix, needle in CASES:
    src = next(p for p in sorted(FLAT.glob(prefix + "*.tex"))).read_text(encoding="utf-8")
    pre_text, _ = prep.split_document(src)
    cm = convert.line_cm(prep.parse_preamble(pre_text))
    for i, pic in enumerate(m.group(0) for m in cetz.PICTURE_ENV.finditer(src)):
        if needle not in pic:
            continue
        canvas = cetz.build(cetz.MATH_ENVELOPE.sub("", pic), None, cm)
        print("### %s #%d" % (prefix, i))
        for line in canvas.splitlines():
            if "bezier" in line or "tanh" in line or len(line) > 400:
                print("   ", line.strip()[:4000])
        # the sampled plot comes out as one long polyline; show its head and tail
        for line in canvas.splitlines():
            if len(line) > 400:
                print("    head:", line.strip()[:160])
                print("    tail:", line.strip()[-160:])
