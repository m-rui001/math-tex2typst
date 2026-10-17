r"""Step 3 (second half): does the emitted canvas ink the same page TeX inks?

CeTz keeps the author's user frame in cm with y upwards; pdflatex inks the page in bp from the top
left, so the two differ by the unknown origin the box lands at. That translation is measured, not
assumed: every canvas point against every TeX point votes a candidate shift onto a 0.05cm grid and
the mode wins, because a correct canvas repeats the same offsets TeX used and a wrong one votes
scattered. Then each side's sampled geometry is required to lie on the other's, within 0.02cm.
"""
import math
import os
import re
import sys
from collections import Counter

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SB = os.path.join(ROOT, "_work", "pic-authmacros")
WORK = os.path.join(SB, "_verify")
sys.path.insert(0, SB)

CM_BP = 28.45274
PAIR = re.compile(r"\(\s*(-?[0-9.]+)\s*,\s*(-?[0-9.]+)\s*\)")
ITEM = re.compile(r"^\s*(line|rect|circle|bezier|polyline|path|arc|content|move|scale)\b(.*)$")


def seg_l(p, q):
    return [(p, q)]


def bez(p0, p1, p2, p3, n=12):
    out = []
    prev = p0
    for k in range(1, n + 1):
        t = k / n
        mt = 1 - t
        x = mt ** 3 * p0[0] + 3 * mt * mt * t * p1[0] + 3 * mt * t * t * p2[0] + t ** 3 * p3[0]
        y = mt ** 3 * p0[1] + 3 * mt * mt * t * p1[1] + 3 * mt * t * t * p2[1] + t ** 3 * p3[1]
        out.append((prev, (x, y)))
        prev = (x, y)
    return out


def ring(cx, cy, rx, ry, n=32):
    out = []
    prev = None
    for k in range(n + 1):
        a = 2 * math.pi * k / n
        p = (cx + rx * math.cos(a), cy + ry * math.sin(a))
        if prev is not None:
            out.append((prev, p))
        prev = p
    return out


def canvas_geometry(canvas):
    segs = []
    for line in canvas.splitlines():
        m = ITEM.match(line)
        if not m:
            continue
        kind, rest = m.group(1), m.group(2)
        if kind == "content":
            continue
        pts = [tuple(float(v) for v in p) for p in PAIR.findall(rest)]
        if kind == "line" and len(pts) >= 2:
            for a, b in zip(pts, pts[1:]):
                segs += seg_l(a, b)
        elif kind == "rect" and len(pts) >= 2:
            (x0, y0), (x1, y1) = pts[0], pts[1]
            corners = [(x0, y0), (x1, y0), (x1, y1), (x0, y1), (x0, y0)]
            for a, b in zip(corners, corners[1:]):
                segs += seg_l(a, b)
        elif kind == "circle" and pts:
            r = re.search(r"radius:\s*\(\s*(-?[0-9.]+)\s*,\s*(-?[0-9.]+)\s*\)", rest)
            if r:
                segs += ring(pts[0][0], pts[0][1], float(r.group(1)), float(r.group(2)))
            else:
                rr = re.search(r"radius:\s*([0-9.]+)", rest)
                if rr:
                    segs += ring(pts[0][0], pts[0][1], float(rr.group(1)), float(rr.group(1)))
                elif len(pts) > 1:
                    segs += seg_l(pts[0], pts[1])
        elif kind == "bezier" and len(pts) >= 4:
            # the emitter's order is start, end, control1, control2 (measured on the cylinder arcs)
            segs += bez(pts[0], pts[2], pts[3], pts[1])
        elif pts:
            for a, b in zip(pts, pts[1:]):
                segs += seg_l(a, b)
    return segs


def tex_geometry(pdf):
    import pymupdf
    d = pymupdf.open(pdf)
    segs = []
    for page in d:
        for item in page.get_drawings():
            for it in item["items"]:
                if it[0] == "l":
                    segs.append(((it[1].x / CM_BP, -it[1].y / CM_BP),
                                 (it[2].x / CM_BP, -it[2].y / CM_BP)))
                elif it[0] == "c":
                    p = [((q.x / CM_BP, -q.y / CM_BP)) for q in it[1:]]
                    segs += bez(p[0], p[1], p[2], p[3], 8)
                elif it[0] == "re":
                    r = it[1]
                    corners = [((r.x0 / CM_BP, -r.y0 / CM_BP)), ((r.x1 / CM_BP, -r.y0 / CM_BP)),
                               ((r.x1 / CM_BP, -r.y1 / CM_BP)), ((r.x0 / CM_BP, -r.y1 / CM_BP)),
                               ((r.x0 / CM_BP, -r.y0 / CM_BP))]
                    segs += list(zip(corners, corners[1:]))
                elif it[0] == "qu":
                    q = it[1]
                    pts = [((p.x / CM_BP, -p.y / CM_BP)) for p in (q.ul[0], q.ur[0], q.lr[0], q.ll[0])]
                    segs += list(zip(pts, pts[1:] + pts[:1]))
    d.close()
    return segs


def vote(canvas_pts, tex_pts):
    r"""The shift, in cm, the two point clouds agree on most often."""
    votes = Counter()
    for c in canvas_pts:
        for t in tex_pts:
            votes[(round(c[0] - t[0], 2), round(c[1] - t[1], 2))] += 1
    best, count = votes.most_common(1)[0]
    dx = dy = 0.0
    n = 0
    for key, k in votes.items():
        if abs(key[0] - best[0]) <= 0.06 and abs(key[1] - best[1]) <= 0.06 and k >= count * 0.2:
            dx += key[0] * k
            dy += key[1] * k
            n += k
    return (dx / n, dy / n), count, len(canvas_pts) * len(tex_pts)


def dist(p, a, b):
    ax, ay = a
    bx, by = b
    vx, vy = bx - ax, by - ay
    wx, wy = p[0] - ax, p[1] - ay
    L = vx * vx + vy * vy
    t = 0.0 if L == 0 else max(0.0, min(1.0, (wx * vx + wy * vy) / L))
    return ((wx - t * vx) ** 2 + (wy - t * vy) ** 2) ** 0.5


def probes(segs):
    r"""Three samples per segment: both ends and the middle. A wrong length or a wrong direction
    shows up at an end, a wrong curve shows up in the middle."""
    out = []
    for a, b in segs:
        out.append(a)
        out.append(((a[0] + b[0]) / 2.0, (a[1] + b[1]) / 2.0))
        out.append(b)
    return out


def check(points, segs, tol=0.02):
    r"""How many probe points lie on `segs`, and the worst misses."""
    bad = []
    for p in points:
        d = min(dist(p, s[0], s[1]) for s in segs)
        if d > tol:
            bad.append((round(d, 3), tuple(round(v, 2) for v in p)))
    bad.sort(reverse=True)
    return len(points) - len(bad), bad[:8]


def refine(shift, cp, tp, step=0.01):
    r"""Trim the vote's quantisation error: the shift is only known to the 0.05cm grid it was
    counted on, and a 0.03cm bias would read as a page full of near misses. Take the offset that
    puts the most canvas probes on TeX ink within 0.01cm of the vote's answer."""
    best, score = shift, None
    for i in range(-3, 4):
        for j in range(-3, 4):
            s = (shift[0] + i * step, shift[1] + j * step)
            pts = [(p[0] - s[0], p[1] - s[1]) for p in cp[::7]]
            hits = sum(1 for p in pts
                       if min(dist(p, a, b) for a, b in tp_pairs) <= 0.02)
            if score is None or hits > score:
                best, score = s, hits
    return best, score, len(cp[::7])


def main():
    global tp_pairs
    names = ["cylinder", "gff", "peps"]
    for tag in names:
        pdf = os.path.join(WORK, tag + "_B.pdf")
        typ = os.path.join(WORK, tag + "_canvas.typ")
        if not (os.path.exists(pdf) and os.path.exists(typ)):
            print(tag, "missing artefact", pdf, typ)
            continue
        canvas = open(typ, encoding="utf-8").read()
        cs = canvas_geometry(canvas)
        ts = tex_geometry(pdf)
        cp = [p for s in cs for p in s]
        tp = [p for s in ts for p in s]
        tp_pairs = ts
        shift, votes, pairs = vote(cp, tp)
        shift, hits, tried = refine(shift, cp, tp)
        # vote() answers canvas - TeX, so the canvas is carried onto TeX's page by subtracting it
        moved = [((a[0] - shift[0], a[1] - shift[1]), (b[0] - shift[0], b[1] - shift[1]))
                 for a, b in cs]
        ok_c, bad_c = check(probes(moved), ts)
        ok_t, bad_t = check(probes(ts), moved)
        n_c, n_t = len(probes(moved)), len(probes(ts))
        worst = max([d for d, _ in bad_c] + [d for d, _ in bad_t] + [0.0])
        print("== %s: canvas %d segs, TeX %d segs, shift (%.2f,%.2f) cm, refined hit %d/%d" % (
            tag, len(cs), len(ts), shift[0], shift[1], hits, tried))
        print("   canvas on TeX ink: %d/%d | TeX ink on canvas: %d/%d | worst residual %.3f cm" % (
            ok_c, n_c, ok_t, n_t, worst))
        for d, p in bad_c[:5]:
            print("      canvas segment %s off TeX by %s cm" % (p, d))
        for d, p in bad_t[:5]:
            print("      TeX segment %s off canvas by %s cm" % (p, d))


main()
