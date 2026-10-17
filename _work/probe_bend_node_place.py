r"""Where does the converter put a node written on a bent edge today?

The pdflatex oracle (`_work/measure_bend_node.py`) says the anchor is the curve's own midpoint: for a
3cm chord and `bend left=45` that point is 17.6532pt = 0.6227cm above the chord, and `above` parks the
label's south anchor exactly there, so the centre sits at 24.60283pt = 0.8679cm. This prints the
placement the current code emits for the same picture, at 15/45/90 degrees and for a straight edge,
so the two can be compared without opening a PDF.
"""
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import cetz  # noqa: E402

CONTENT = re.compile(r"content\(\(([-\d.]+), ([-\d.]+)\)")

CASES = [(0, 0.0), (15, 6.46152 / 28.346), (45, 17.6532 / 28.346), (90, 24.96536 / 28.346)]


def main():
    for angle, expected in CASES:
        key = "--" if not angle else "to[bend left=%d]" % angle
        pic = (r"\draw (0,0) %s node[above] {X} (3,0);" % key) if angle else \
              (r"\draw (0,0) -- node[above] {X} (3,0);")
        got = cetz.build(r"\begin{tikzpicture}" + pic + r"\end{tikzpicture}")
        if got is None:
            print("angle=%-3d REFUSED  %s" % (angle, pic))
            continue
        m = CONTENT.search(got)
        if not m:
            print("angle=%-3d no content() emitted: %r" % (angle, pic))
            continue
        x, y = float(m.group(1)), float(m.group(2))
        print("angle=%-3d emitted=(%.4f, %.4f) cm  curve midpoint y=%.4f  centre should be %.4f"
              % (angle, x, y, expected, expected + 6.94963 / 28.346))


if __name__ == "__main__":
    main()
