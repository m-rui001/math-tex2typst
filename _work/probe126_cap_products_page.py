r"""#90 page check: does the round's ink land on the PRODUCT page?

The laws (`_work/measure90_cap_join.py`) were read off synthetic canvases; this one reads them off the
real artifact.  Two questions the product page can answer:

  CAP -- a free end of a heavy stroked path now carries (pen/2) of ink past its last coordinate under
  `line cap=round`, where it carried none.  The SLE corridor is the best case in the corpus: a
  12pt pen at `[scale=.88]` turning `rounded corners=12pt` corners, in a picture whose own brackets
  say `line cap=round, line join=round`.  Read the overshoot past both ends of the widest stroked
  path on the product page and on a pdflatex control of the same picture.

  JOIN -- a corner stances (pen/2)/sin(alpha/2) off the vertex along the OUTSIDE bisector, and Typst
  used to cut it at ratio 4 where pgf carries it to 10.  The list of miter-only canvases with a
  literal corner in the disagreement band [11.5, 29) is printed here, and the first of them is read
  on its page.

Ink is pixels at 600 dpi (Typst sends text as text and a rule as ink, and only pixels see both); the
window is cut to the page before mapping, and readings are page pt.  Crops are saved at 300 dpi.

Section C is the leg that answers 「did the key change anything on the page?」  A band corner sits in
the middle of a dense corridor, so walking its bisector reads the neighbours (sections E and B carry
flags for exactly that).  Two pages of the SAME canvas, one with a single stroke key stripped, differ
only where that key acts -- the disagreement is the key's effect, and a zero disagreement says the key
is inert on this page rather than that the ruler is blind.
"""
import io
import math
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
TMP = os.path.join(ROOT, "_work", "_m90p")
os.makedirs(TMP, exist_ok=True)
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
COORD = re.compile(r"\(\s*([-+0-9.]+)\s*,\s*([-+0-9.]+)\s*\)")
DPI = 600

from t2t import cetz


def ink(page, rect):
    """-> ({"bbox": Rect in page pt, "pts": [(x, y) ink points in page pt]}), 600 dpi pixels.

    The window is cut to the page first: fitz renders a clip that hangs off the page edge from the
    page's own border, so mapping its rows back by the uncut origin shifts every reading by the
    overhang.
    """
    rect = rect & page.rect
    pm = page.get_pixmap(dpi=DPI, clip=rect, colorspace=fitz.csGRAY, alpha=False)
    step = 72.0 / DPI
    samples = pm.samples
    n = pm.n
    pts = []
    x0, y0 = rect.x0, rect.y0
    for row in range(pm.height):
        base = row * pm.width * n
        for col in range(pm.width):
            if samples[base + col * n] < 128:
                pts.append((x0 + col * step, y0 + (row + 0.5) * step))
    if not pts:
        return None
    xs = [p[0] for p in pts]
    ys = [p[1] for p in pts]
    return {"bbox": fitz.Rect(min(xs), min(ys), max(xs), max(ys)), "pts": pts}


def paths(page, min_width=3.0):
    """The stroked polylines on a page heavier than `min_width`, as (width, [(x, y), ...])."""
    out = []
    for d in page.get_drawings():
        w = d.get("width") or 0.0
        if w < min_width or d.get("fill") is not None:
            continue
        pts = []
        for it in d["items"]:
            if it[0] == "l":
                p, q = it[1], it[2]
                if not pts:
                    pts.append((p.x, p.y))
                pts.append((q.x, q.y))
        if len(pts) >= 2:
            out.append((w, pts, d.get("lineCap"), d.get("lineJoin")))
    return out


def overshoot(page, pts, width, end):
    """How far ink reaches PAST the chosen END of a leg, measured along that leg, in page pt.

    The walk is CONTIGUOUS on purpose: taking the farthest ink point in a window lets a neighbouring
    corridor or a letter read as a cap (the first version of this probe reported 2.0 pens of "cap"
    that way).  Ink is required to reach from the endpoint without a gap of more than three steps, so
    what comes back is the half-circle the pen left there -- 0.5 of the pen for `round`, nothing for
    `butt`.
    """
    a, b = (pts[0], pts[1]) if end == 0 else (pts[-2], pts[-1])
    ux, uy = (b[0] - a[0], b[1] - a[1])
    u = math.hypot(ux, uy)
    if not u:
        return None
    ux, uy = ux / u, uy / u
    far = 2.5 * width
    rect = fitz.Rect(min(b[0], b[0] + far * ux) - width, min(b[1], b[1] + far * uy) - width,
                     max(b[0], b[0] + far * ux) + width, max(b[1], b[1] + far * uy) + width)
    got = ink(page, rect)
    if not got:
        return None
    seen = {}
    for x, y in got["pts"]:
        t = (x - b[0]) * ux + (y - b[1]) * uy
        perp = abs((x - b[0]) * uy - (y - b[1]) * ux)
        if perp <= 0.42 * width and t <= far:
            key = int(round(t * 10))
            seen[key] = min(seen.get(key, 1e9), perp)
    step = 0.1
    best = None
    gaps = 0
    t = 0.0
    while t <= far:
        key = int(round(t * 10))
        if key in seen:
            best = t
            gaps = 0
        else:
            gaps += 1
            if gaps > 3:
                break
        t += step
    return None if best is None else round(best, 3)


def canvas_max(canvas):
    """The heaviest rule a canvas draws, in page pt (0.4pt where it says nothing)."""
    vals = [float(v) for v in re.findall(r"thickness: ([0-9.]+)pt", canvas or "")]
    return max(vals) if vals else 0.4


def pen_of(pic):
    """The heaviest rule the canvas of this picture draws -- the emitter's own number.

    #91 replaced the old source-side reading (a second name table and a second unit table here, which
    could only ever re-derive what the emitter derives) with this: a picture's pen is what its
    `stroke:` dictionaries say, so the window sizes below are set by the artifact the page shows.
    """
    return canvas_max(cetz.build(pic))


def corners(pic):
    """(sharpest literal corner in degrees, its vertex coordinates) or (None, None)."""
    worst = None
    where = None
    for stmt in re.findall(r"\\(?:draw|fill|filldraw|path|stroke)\b([^;]*);", pic, re.S):
        pts = [(float(x), float(y)) for x, y in COORD.findall(stmt)]
        for a, v, b in zip(pts, pts[1:], pts[2:]):
            u1 = math.hypot(a[0] - v[0], a[1] - v[1])
            u2 = math.hypot(b[0] - v[0], b[1] - v[1])
            if not u1 or not u2:
                continue
            cos = ((a[0] - v[0]) * (b[0] - v[0]) + (a[1] - v[1]) * (b[1] - v[1])) / (u1 * u2)
            ang = math.degrees(math.acos(max(-1.0, min(1.0, cos))))
            if (worst is None or ang < worst) and 11.5 <= ang < 29.0:
                worst, where = ang, v
    return worst, where


print("=== A. pictures that write a pen shape and carry a pen of 3pt or more")
heavy = []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        if not re.search(r"line (cap|join)\s*=", pic):
            continue
        w = pen_of(pic)
        if w < 3.0:
            continue
        got = cetz.build(pic)
        heavy.append((fn[:-4], round(w, 2), got is not None,
                      got is not None and ('cap: "' in got or 'join: "' in got)))
for h in sorted(heavy, key=lambda x: -x[1]):
    print("   %-62s pen=%spt emitted=%s keys_on_page=%s" % h)
print("   total=%d" % len(heavy))

def singles(page, min_width=3.0):
    """Heavy stroked paths on a page that are exactly ONE straight leg.

    Only such a path has two FREE ends: at a joint the neighbouring leg feeds the same window and the
    reading says join, not cap.  Returns (width, [(x, y), (x, y)], lineCap) newest first by width.
    """
    out = []
    for w, pts, cap, join in paths(page, min_width):
        if len(pts) == 2:
            out.append((w, pts, cap))
    return sorted(out, key=lambda x: -x[0])


def control_pdf(name, pics):
    """A pdflatex page with the picture verbatim, for the same reading on the TeX side."""
    src = ("\\documentclass[tikz,border=10pt]{standalone}\n\\usepackage{tikz}\n"
           "\\usetikzlibrary{arrows.meta,positioning,calc,shapes.geometric,patterns,"
           "decorations.markings,backgrounds}\n\\begin{document}\n" + pics + "\n\\end{document}\n")
    tex = os.path.join(TMP, name + ".tex")
    io.open(tex, "w", encoding="utf-8").write(src)
    pdf = os.path.join(TMP, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "-output-directory", TMP, name + ".tex"], cwd=TMP,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode or not os.path.exists(pdf):
        return None
    return pdf


print("=== B. the free ends of a heavy leg: overshoot past each end, as a fraction of that page's pen")
PAPERS = [h[0] for h in sorted(heavy, key=lambda x: -x[1])[:4]]
for paper in PAPERS:
    text = io.open(os.path.join(FLAT, paper + ".tex"), encoding="utf-8", errors="replace").read()
    pics = [p for p in PIC.findall(text) if re.search(r"line (cap|join)\s*=", p)
            and pen_of(p) >= 3.0]
    doc = fitz.open(os.path.join(ROOT, "typst", paper, "main.pdf"))
    prod = None
    for pno in range(doc.page_count):
        got = singles(doc[pno], 3.0)
        if got:
            prod = (doc[pno], got[:3])
            break
    ctrl_pdf = control_pdf("cap_" + paper[:20], "\n".join(pics))
    ctrl = None
    if ctrl_pdf:
        got = singles(fitz.open(ctrl_pdf)[0], 3.0)
        if got:
            ctrl = (fitz.open(ctrl_pdf)[0], got[:3])
    print("   %s" % paper[:62])
    for tag, side in (("pgf control", ctrl), ("product", prod)):
        if not side:
            print("      %-12s no single heavy leg found" % tag)
            continue
        page, legs = side
        for w, pts, cap in legs:
            ratios = [overshoot(page, pts, w, end) for end in (0, -1)]
            ratios = [None if v is None else round(v / w, 3) for v in ratios]
            clean = [r for r in ratios if r is not None]
            print("      %-12s pen=%.3fpt lineCap=%s overshoot/pen = %s / %s%s" %
                  (tag, w, cap, ratios[0], ratios[1],
                   "" if (clean and max(clean) < 0.75) else
                   "  (ink in line beyond a cap -- neighbour, not cap)"))
            if tag == "product" and clean and max(clean) < 0.75:
                for end, nm in ((0, "start"), (-1, "end")):
                    p = pts[end]
                    rect = fitz.Rect(p[0] - 2.2 * w, p[1] - 2.2 * w,
                                     p[0] + 2.2 * w, p[1] + 2.2 * w)
                    out = os.path.join(ROOT, "_work", "cap143_%s_%s.png" % (paper[:8], nm))
                    page.get_pixmap(dpi=300, clip=rect).save(out)
                    print("         crop -> %s" % os.path.basename(out))
                break


def join_ratios(page, min_width=1.0):
    """The tip each joint on a page actually reaches, as a multiple of half the pen.

    pgf carries a miter to ratio 10 and Typst to 4, so a corner in the disagreement band is the one
    place the two engines can be told apart WITHOUT knowing the source: read the angle off the
    polyline fitz hands back, then walk the ink along the outside bisector and divide by half the pen.
    A pointed join answers 1/sin(alpha/2), a beveled one sits far under it.
    """
    out = []
    for w, pts, cap, join in paths(page, min_width):
        if len(pts) < 3:
            continue
        for a, v, b in zip(pts, pts[1:], pts[2:]):
            u1 = math.hypot(a[0] - v[0], a[1] - v[1])
            u2 = math.hypot(b[0] - v[0], b[1] - v[1])
            if not u1 or not u2:
                continue
            cos = ((a[0] - v[0]) * (b[0] - v[0]) + (a[1] - v[1]) * (b[1] - v[1])) / (u1 * u2)
            ang = math.degrees(math.acos(max(-1.0, min(1.0, cos))))
            if not (11.5 <= ang < 29.0):
                continue
            ux = -((a[0] - v[0]) / u1 + (b[0] - v[0]) / u2)
            uy = -((a[1] - v[1]) / u1 + (b[1] - v[1]) / u2)
            n = math.hypot(ux, uy)
            if not n:
                continue
            ux, uy = ux / n, uy / n
            far = 6.0 * w
            rect = fitz.Rect(v[0] - far, v[1] - far, v[0] + far, v[1] + far)
            got = ink(page, rect)
            if not got:
                continue
            tip = max((x - v[0]) * ux + (y - v[1]) * uy for x, y in got["pts"])
            ratio = tip / (w / 2.0)
            # the window is 6 pens = 12 half-pens wide, so a reading near 12 is the WINDOW, not the
            # joint: ink 6 pens away along the bisector is some other corridor of the figure.  A joint
            # is only measurable this way when it sits alone; say so on the line rather than let the
            # number look like a measurement.
            out.append((round(ang, 2), round(w, 3), round(ratio, 3),
                        round(1.0 / math.sin(math.radians(ang / 2.0)), 3), join,
                        "  (window edge -- neighbour, not joint)" if ratio > 11.0 else ""))
    return sorted(out, key=lambda x: -x[1])


print("=== E. a joint in the disagreement band: tip as a multiple of half the pen (product vs pgf)")
BAND = ["Integral-points-on-character-varieties-of-curves-September-25-2026",
        "Directional-transience-implies-ballisticity-September-23-2026",
        "Bochner-Riesz-Multipliers-in-Three-Dimensions-September-24-2026",
        "Critical-strip-crossing-mass-on-the-honeycomb-lattice-September-26-2026"]
for paper in BAND:
    text = io.open(os.path.join(FLAT, paper + ".tex"), encoding="utf-8", errors="replace").read()
    pics = []
    for p in PIC.findall(text):
        ang, _v = corners(p)
        if ang is not None:
            pics.append(p)
    doc = fitz.open(os.path.join(ROOT, "typst", paper, "main.pdf"))
    prod = None
    for pno in range(doc.page_count):
        got = join_ratios(doc[pno], 1.0)
        if got:
            prod = next((g for g in got if not g[5]), got[0])
            break
    ctrl_pdf = control_pdf("join_" + paper[:20], "\n".join(pics))
    ctrl = None
    if ctrl_pdf:
        allc = join_ratios(fitz.open(ctrl_pdf)[0], 1.0)
        ctrl = [next((g for g in allc if not g[5]), allc[0])] if allc else None
    print("   %s" % paper[:62])
    print("      product   angle=%s pen=%spt tip/half=%s (1/sin(a/2)=%s) lineJoin=%s%s" % prod
          if prod else "      product   no band joint readable")
    if ctrl:
        print("      control   angle=%s pen=%spt tip/half=%s (1/sin(a/2)=%s) lineJoin=%s%s" % ctrl[0])
    else:
        print("      control   no band joint readable")

def compile_typst(name, canvas):
    """The canvas as a one-page document, read back with the same ruler."""
    src = ['#import "@preview/cetz:0.5.0"',
           '#set page(width: 20cm, height: 14cm, margin: 0cm)', canvas]
    typ = os.path.join(TMP, name + ".typ")
    io.open(typ, "w", encoding="utf-8").write("\n".join(src) + "\n")
    pdf = os.path.join(TMP, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    r = subprocess.run(["typst", "compile", "--root", ROOT, name + ".typ"], cwd=TMP,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode or not os.path.exists(pdf):
        print((r.stdout or "")[-500:] + (r.stderr or "")[-500:])
        return None
    return fitz.open(pdf)[0]


def mask(page, dpi=300):
    """(width, height, pt-per-pixel, 1-per-ink-byte) for the WHOLE page.

    A pair of pages that differ only by one stroke key can be compared pixel for pixel: what the two
    masks disagree about IS that key's effect, with nothing else in the figure able to leak into the
    reading.  That is the only way this page can speak about a joint buried in a dense corridor --
    walking the bisector there reads the neighbouring ink, not the joint (see section E's flags).
    """
    pm = page.get_pixmap(dpi=dpi, colorspace=fitz.csGRAY, alpha=False)
    return pm.width, pm.height, 72.0 / dpi, bytes(1 if b < 128 else 0 for b in pm.samples)


def diff(name_a, a, name_b, b):
    """Where the two pages disagree, in ink pixels and page pt."""
    if not a or not b or a[:2] != b[:2]:
        print("      %s vs %s: pages not comparable (%s / %s)" % (name_a, name_b, bool(a), bool(b)))
        return
    w, h, step, ma, mb = a[0], a[1], a[2], a[3], b[3]
    only_a = only_b = 0
    x0 = y0 = 10 ** 9
    x1 = y1 = -1
    for i in range(w * h):
        if ma[i] == mb[i]:
            continue
        col, row = i % w, i // w
        if ma[i]:
            only_a += 1
        else:
            only_b += 1
        x0, y0 = min(x0, col), min(y0, row)
        x1, y1 = max(x1, col), max(y1, row)
    ink_a = sum(ma)
    print("      %-18s ink=%d   vs %-18s ink=%d   disagreement: only-A=%d only-B=%d  box=%s pt"
          % (name_a, ink_a, name_b, sum(mb), only_a, only_b,
             (None if only_a + only_b == 0 else
              (round(x0 * step, 2), round(y0 * step, 2),
               round((x1 + 1) * step, 2), round((y1 + 1) * step, 2)))))


print("=== C. the SAME real figure with one stroke key stripped: the pages' pixel disagreement")


def strip_pair(label, paper, needle):
    """Diff one figure's own page against the same page with ONE key taken out."""
    text = io.open(os.path.join(FLAT, paper + ".tex"), encoding="utf-8", errors="replace").read()
    for p in PIC.findall(text):
        canvas = cetz.build(p)
        if canvas is None or needle not in canvas:
            continue
        other = canvas.replace(needle, "")
        print("   %s: %s  (canvas is %d chars, stripped is %d, %d occurrence(s) taken out)"
              % (label, paper[:56], len(canvas), len(other),
                 (len(canvas) - len(other)) // len(needle)))
        a = compile_typst("diff_" + label + "_a", canvas)
        b = compile_typst("diff_" + label + "_b", other)
        if a is None or b is None:
            print("      one of the two pages did not compile -- no reading")
            continue
        diff("as emitted", mask(a), "key stripped", mask(b))
        return
    print("   %s: no canvas of this paper carries the key -- no pair" % label)


# the limit leg on the corpus's sharpest band corner; the cap leg on a picture that writes the cap
strip_pair("limit", "Directional-transience-implies-ballisticity-September-23-2026",
           ", miter-limit: 10")
strip_pair("cap", "An-explicit-exact-Hausdorff-gauge-for-SLE-September-26-2026",
           ', cap: "round"')

print("=== D. miter-only canvases with a literal corner in the disagreement band [11.5, 29)")
band = []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        got = cetz.build(pic)
        if got is None or 'cap: "' in got or 'join: "' in got:
            continue
        ang, vtx = corners(pic)
        if ang is not None:
            band.append((fn[:-4], round(ang, 2), round(pen_of(pic), 2)))
for b in sorted(band, key=lambda x: x[1]):
    print("   %-62s corner=%sdeg pen=%spt" % b)
print("   total=%d" % len(band))


print("=== F. #91: the pen's weight, one picture per page on BOTH engines, then stripped from one page")

def width_side(page):
    """The distinct stroke widths a page draws, heaviest first -- fitz's own `width`."""
    if page is None:
        return None
    return sorted(set(round(w, 3) for w, _p, _c, _j in paths(page, 0.3)), reverse=True)


def first_pic(paper, needle=None):
    text = io.open(os.path.join(FLAT, paper + ".tex"), encoding="utf-8",
                   errors="replace").read()
    for pic in PIC.findall(text):
        if needle is None or needle in pic:
            return pic
    return None


# the two heaviest pens in the corpus, one picture each, plus the spelling this hunk alone raised:
# a weight written in `every path/.style`, which no statement invokes
cands = []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        canvas = cetz.build(pic)
        if canvas is None:
            continue
        w = canvas_max(canvas)
        if w >= 1.2:
            cands.append((w, fn[:-4], pic, canvas))
cands.sort(key=lambda x: -x[0])
picked = []
for w, paper, pic, canvas in cands:
    if any(p == paper for _x, p, _y, _z in picked):
        continue
    picked.append((w, paper, pic, canvas))
    if len(picked) == 2:
        break
every_path = "Mean-payoff-parity-games-in-quasipolynomial-time-October-5-2026"
ep_pic = first_pic(every_path, "every path")
if ep_pic is not None:
    picked.append((canvas_max(cetz.build(ep_pic)), every_path, ep_pic, cetz.build(ep_pic)))

for w, paper, pic, canvas in picked:
    name = "pen_" + paper[:12]
    print("   %s  canvas pen=%spt" % (paper[:62], w))
    prod = width_side(compile_typst(name, canvas))
    ctrl_pdf = control_pdf(name, pic)
    ctrl = width_side(fitz.open(ctrl_pdf)[0]) if ctrl_pdf else None
    print("      product    widths=%s" % prod)
    print("      pgf        widths=%s" % ctrl)
    print("      heaviest product/pgf=%s"
          % (None if not (prod and ctrl) else round(prod[0] / ctrl[0], 4)))

# the same key-strip leg C uses, for the weight itself: as emitted vs the weight taken out of EVERY
# rule in the picture (a partial strip would measure the rules that still carry it, not this one)
strip_pair("pen12", "An-explicit-exact-Hausdorff-gauge-for-SLE-September-26-2026",
           "thickness: 12.0pt, ")
strip_pair("pen-name", picked[0][1], "thickness: %spt, " % picked[0][0])
strip_pair("every-path", every_path, "thickness: 0.6pt, ")
