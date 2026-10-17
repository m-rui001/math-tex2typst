r"""#90 follow-up: how many of the 918 touched canvases have a joint for `join:` to describe?

`_work/probe126_cap_products_page.py` section C found the SAME page pixel-for-pixel with and without
`miter-limit: 10` for the corpus's sharpest band corner.  A null there needs the artifact structure to
explain it, and the structure is not what one would guess from TikZ: CeTz writes a polyline as ONE
`line((a), (b), (c), ...)` call, so a joint exists there in Typst's own sense -- while a `\draw` whose
segments are emitted as separate two-point `line()` calls has NO joint, only end caps, and there a
written `line join=` and a miter limit cannot do anything however correct the keys are.

So count in the EMITTED coordinates (what Typst strokes, after the picture's own scale -- an angle
measures differently there than in the source, and the emitted one is the truth for the page):
  A. canvases built / canvases with a multi-point stroke call (`line` >=3 points, or `merge-path`)
  B. vertices in the engines' disagreement band [11.5, 29) INSIDE such a call  -> a real join, and
     vertices that only ever appear as the END of a two-point `line()`          -> no join to set
  C. the Directional-transience picture probe126 section C used, dumped as emitted
"""
import io
import math
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
CALL = re.compile(r"(?<![a-z-])(line|merge-path)\(")
PT = re.compile(r"\(\s*([-+0-9.]+)\s*,\s*([-+0-9.]+)\s*\)")

from t2t import cetz


def call_bodies(canvas):
    """The balanced argument text of every `line(` / `merge-path(` call.

    A regex cannot do this: the arguments are themselves full of `(x, y)` groups, and an unbalanced
    match would weld two neighbouring segments into one fake polyline.
    """
    out = []
    for m in CALL.finditer(canvas):
        i = m.end() - 1
        depth = 0
        while i < len(canvas):
            if canvas[i] == "(":
                depth += 1
            elif canvas[i] == ")":
                depth -= 1
                if depth == 0:
                    break
            i += 1
        out.append(canvas[m.end():i])
    return out


def vertices(points):
    """(vertex, angle) for each interior corner of a polyline in these coordinates."""
    out = []
    for a, v, b in zip(points, points[1:], points[2:]):
        u1 = math.hypot(a[0] - v[0], a[1] - v[1])
        u2 = math.hypot(b[0] - v[0], b[1] - v[1])
        if not u1 or not u2:
            continue
        cos = ((a[0] - v[0]) * (b[0] - v[0]) + (a[1] - v[1]) * (b[1] - v[1])) / (u1 * u2)
        out.append((v, math.degrees(math.acos(max(-1.0, min(1.0, cos))))))
    return out


def calls(canvas):
    """[(n_points, [vertices])] for every stroked polyline the emitter wrote."""
    got = []
    for body in call_bodies(canvas):
        pts = [(float(x), float(y)) for x, y in PT.findall(body)]
        if len(pts) >= 3:
            got.append((len(pts), vertices(pts)))
    return got


print("=== A. canvases with a multi-point stroke call (the only place Typst miters)")
built = with_join = 0
joins = 0
band_join = []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        canvas = cetz.build(pic)
        if canvas is None:
            continue
        built += 1
        cs = calls(canvas)
        if not cs:
            continue
        with_join += 1
        joins += sum(len(v) for _n, v in cs)
        for _n, vs in cs:
            for v, ang in vs:
                if 11.5 <= ang < 29.0:
                    band_join.append((fn[:-4], round(ang, 2)))
print("   canvases built=%d, carrying a >=3-point stroke call=%d" % (built, with_join))
print("   interior vertices on such calls=%d, of which in the band [11.5, 29)=%d"
      % (joins, len(band_join)))
seen = {}
for p, a in band_join:
    seen[p] = min(a, seen.get(p, 99))
for p in sorted(seen, key=lambda k: seen[k])[:24]:
    print("      %-62s band joint=%sdeg" % (p, seen[p]))
print("   papers with at least one band joint on the page=%d" % len(seen))

print("=== B. the band corners of the picture probe126 section C picked, in emitted coordinates")
PAPER = "Directional-transience-implies-ballisticity-September-23-2026"
text = io.open(os.path.join(FLAT, PAPER + ".tex"), encoding="utf-8", errors="replace").read()
shown = False
for pic in PIC.findall(text):
    canvas = cetz.build(pic)
    if canvas is None or ", miter-limit: 10" not in canvas:
        continue
    cs = calls(canvas)
    if not any(any(11.5 <= a < 29.0 for _v, a in vs) for _n, vs in cs):
        continue
    print("   canvas: two-point line() calls=%d, miter-limit occurrences=%d"
          % (len(re.findall(r"\bline\(", canvas)), canvas.count("miter-limit")))
    for n, vs in cs:
        inband = [round(a, 2) for _v, a in vs if 11.5 <= a < 29.0]
        if inband:
            print("      a %d-point call carries joints at %s deg (all its angles: %s)"
                  % (n, inband, sorted(round(a, 1) for _v, a in vs)))
    shown = True
    break
print("   no multi-point call of that picture has a band joint" if not shown else "")

print("=== C. that picture as emitted (first 60 chars of each stroke call)")
for pic in PIC.findall(text):
    canvas = cetz.build(pic)
    if canvas is None:
        continue
    for line in canvas.splitlines():
        line = line.strip()
        if line.startswith("line(") or line.startswith("merge-path"):
            print("   %s" % line[:88])
    break
