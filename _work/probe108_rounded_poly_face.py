r"""#89 face, measured by A on `_work/flat/*.tex` (not copied from C's probe).

For every TikZ statement that writes `rounded corners` on a multi-segment polyline, report
what the emitter would have to work with: the verb (draw/fill), whether the path closes,
how many corners, whether every coordinate is a literal (no node reference), and the two
neighbour segment lengths at each inner corner in the same units the author wrote.
"""
import io
import math
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))

from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
STMT = re.compile(r"\\(draw|fill|filldraw|path|shade)\b")
CORNER = re.compile(r"--|\|")


def statements(text):
    out = []
    for pic in PIC.findall(text):
        body = pic[pic.index("}") + 1:] if "\\begin{tikzpicture}" in pic else pic
        body = re.sub(r"\\begin\{tikzpicture\}(\[[^\]]*\])?", " ", body)
        body = body.replace("\\end{tikzpicture}", " ")
        for chunk in body.split(";"):
            if "rounded corners" not in chunk:
                continue
            if not CORNER.search(chunk):
                continue
            out.append(chunk.strip())
    return out


def points(chunk):
    """Literal coordinate pairs of the run, in order, plus a flag for a node reference."""
    pts, named = [], False
    for m in re.finditer(r"\(([^()]*)\)", chunk):
        inner = m.group(1)
        if re.fullmatch(r"\s*-?[0-9.]+(pt|cm|mm|in|bp)?\s*,\s*-?[0-9.]+(pt|cm|mm|in|bp)?\s*", inner):
            x, y = [p.strip() for p in inner.split(",")]
            pts.append((cetz._length(x, cetz.IDENT) or 0.0, cetz._length(y, cetz.IDENT) or 0.0))
        else:
            named = True
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
print("statements with a polyline rounded corners: %d over %d papers" % (total, len(papers)))
for name, chunks in papers.items():
    print("\n=== %s  (%d)" % (name[:52], len(chunks)))
    for c in chunks:
        verb = STMT.search(c)
        verb = verb.group(1) if verb else "?"
        closed = bool(re.search(r"--\s*(cycle|close)\b|\bcycle\b", c))
        pts, named = points(c)
        opt = re.search(r"\[([^\]]*)\]", c)
        o = cetz.opts(opt.group(1)) if opt else {}
        radius = cetz.corner_radius_pt(o)
        segs = [math.hypot(pts[i + 1][0] - pts[i][0], pts[i + 1][1] - pts[i][1])
                for i in range(len(pts) - 1)]
        inner = [(round(min(segs[i - 1], segs[i]) / 2.0, 3)) for i in range(1, len(pts) - 1)]
        fills = "fill" in c.lower().split("--")[0]
        print("  verb=%-9s closed=%-5s literal_pts=%d named_ref=%s radius=%s corners=%d"
              % (verb, closed, len(pts), named, radius, max(len(pts) - 1, 0)))
        print("     segs(pt)=%s  half-min-neighbour=%s  text-has-fill=%s"
              % ([round(s, 2) for s in segs], inner, fills))
        print("     src=%s" % re.sub(r"\s+", " ", c)[:150])
