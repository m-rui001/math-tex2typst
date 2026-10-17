r"""#89 face, tightened by A: only polylines whose OWN statement rounds its corners.

Unlike `_work/probe108_rounded_poly_face.py` this filter drops the `/.style` node-box declarations
(the #61 family, already drawn through `box`) and keeps only `\draw`/`\fill`-class statements with at
least two `--` segments.  Coordinates come out of `cetz._length` in CM while `corner_radius_pt` answers
PT, so everything is put into cm here.  The per-corner `CLAMP` column prints C's hypothesis
`min(radius, 0.5*min(seg_in, seg_out))` and is kept only to show which corners it would have moved --
the law is REFUTED (`_work/measure89_rounded_clamp.py`: pgf cuts at the declared radius and draws the
overshoot), so nothing downstream may read it as the rule.
"""
import io
import math
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))

from t2t import cetz  # noqa: E402

PT_CM = 1.0 / 28.346
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
VERB = re.compile(r"\\(draw|fill|filldraw|shade|path)\b")
STYLE_DEF = re.compile(r"/\w*\.style|/tikz/.*rounded|\.style=")


def statements(text):
    out = []
    for pic in PIC.findall(text):
        body = re.sub(r"\\begin\{tikzpicture\}(\[[^\]]*\])?", " ",
                      pic[pic.index("}") + 1:])
        body = body.replace("\\end{tikzpicture}", " ")
        for chunk in body.split(";"):
            if "rounded corners" not in chunk:
                continue
            if chunk.count("--") < 2:
                continue
            if STYLE_DEF.search(chunk):
                continue
            if not VERB.search(chunk):
                continue
            out.append(chunk.strip())
    return out


def points(chunk):
    pts, named = [], []
    for m in re.finditer(r"\(([^()]*)\)", chunk):
        inner = m.group(1)
        if re.fullmatch(r"\s*-?[0-9.]+(pt|cm|mm|in|bp)?\s*,\s*-?[0-9.]+(pt|cm|mm|in|bp)?\s*", inner):
            x, y = [p.strip() for p in inner.split(",")]
            pts.append((cetz._length(x, cetz.IDENT) or 0.0,
                        cetz._length(y, cetz.IDENT) or 0.0))
        else:
            named.append(inner)
    return pts, named


root = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work", "flat")
papers = {}
for name in sorted(os.listdir(root)):
    if not name.endswith(".tex"):
        continue
    text = io.open(os.path.join(root, name), encoding="utf-8", errors="replace").read()
    found = statements(text)
    if found:
        papers[name] = found

total = sum(len(v) for v in papers.values())
print("polyline statements with rounded corners: %d over %d papers" % (total, len(papers)))
clamped = free = 0
for name, chunks in papers.items():
    print("\n=== %s  (%d)" % (name[:60], len(chunks)))
    for c in chunks:
        verb = VERB.search(c).group(1)
        closed = bool(re.search(r"--\s*cycle\b|^[^{]*\bcycle\b", c))
        marks = bool(re.search(r"->[^(]|<[^(]|-(>|<|<<|>>)", c))
        fills = bool(re.search(r"fill=", c[:c.index("--")]) or verb in ("fill", "filldraw", "shade"))
        pts, named = points(c)
        opts = re.findall(r"\[([^\]]*)\]", c)
        o = {}
        for spec in opts:
            o = {**o, **cetz.opts(spec)}
        radius = cetz.corner_radius_pt(o)
        segs = [math.hypot(pts[i + 1][0] - pts[i][0], pts[i + 1][1] - pts[i][1])
                for i in range(len(pts) - 1)]
        rows = []
        for i in range(1, len(pts) - 1):
            cap = min(segs[i - 1], segs[i]) / 2.0
            if radius is None:
                rows.append("?")
            elif radius * PT_CM > cap + 1e-9:
                rows.append("CLAMP %.3f->%.3f" % (radius * PT_CM, cap))
                clamped += 1
            else:
                rows.append("free %.3f" % (radius * PT_CM))
                free += 1
        print("  verb=%-9s closed=%-5s fill=%-5s mark=%-5s pts=%d named=%s radius=%s"
              % (verb, closed, fills, marks, len(pts), named, radius))
        print("     segs(cm)=%s" % [round(s, 3) for s in segs])
        print("     corners=%s" % rows[:8])
        print("     src=%s" % re.sub(r"\s+", " ", c)[:170])
print("\ncorners: clamped=%d free=%d" % (clamped, free))
