r"""#90: the pen's ends and its corners, pgf's ink against Typst's.

`line cap=round` is written 86 times and `line join=round` 77 times inside the flat pictures
(`_work/probe120_linecap_face.py`) and neither reaches a product: no `cap:` or `join:` key appears in
any of 724 papers.  Before a spelling is handed over, both engines' INK is measured on one ruler --
page points read off rendered pixels, a pen wide enough to see -- and the same is asked of Typst,
because a conversion is only faithful if the two pages agree:

* CAP: how far ink reaches past the end of a path (`butt` nothing, `round` and `rect` half a pen, the
  two differing in the shape of the tip) and what a zero-length subpath inks at all -- a filled dot is
  what a `line cap=round` picture means by `\draw (0,0) -- (0,0);`.
* JOIN: how far ink reaches past a corner at angle `a` for `miter`, `round`, `bevel`.  A miter grows as
  `(pen/2)/sin(a/2)` and stops growing at the engine's carry limit; pgf's limit and Typst's default are
  both read here, because the DEFAULT is what the ~700 papers that write nothing get, and a different
  limit would bevel a sharp corner pgf left pointed.

Every case is its own page so one bad case cannot cost the run.
"""
import io
import math
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m90")
os.makedirs(TMP, exist_ok=True)
DPI = 600
PX = 72.0 / DPI
THR = 128
PAGE_CM = 12.0
PEN = 12.0  # the pen both engines are told to use, in their own points


def ink(page, rect, want_pts=False):
    """Bounding box, in page points, of the dark pixels inside `rect`; None where nothing inks.

    The window is cut to the page first: fitz renders a clip that hangs off the page edge from the
    page's own border, so mapping its rows back by the uncut origin shifts every reading by the
    overhang (that is what once turned a 6pt miter tip into `-4.10`).
    """
    rect = rect & page.rect
    pm = page.get_pixmap(dpi=DPI, clip=rect, colorspace=fitz.csGRAY, alpha=False)
    w, h, n = pm.width, pm.height, pm.n
    s = pm.samples
    rows = [r for r in range(h) if min(s[r * w * n:(r + 1) * w * n]) < THR]
    if not rows:
        return None
    cols = [c for c in range(w)
            if min(s[r * w * n + c * n] for r in rows) < THR]
    out = {"x0": rect.x0 + cols[0] * PX, "x1": rect.x0 + (cols[-1] + 1) * PX,
           "y0": rect.y0 + rows[0] * PX, "y1": rect.y0 + (rows[-1] + 1) * PX,
           "w": rect.x1 - rect.x0, "h": rect.y1 - rect.y0}
    if want_pts:
        out["pts"] = [(rect.x0 + (c + .5) * PX, rect.y0 + (r + .5) * PX)
                      for r in rows for c in cols if s[r * w * n + c * n] < THR]
    return out


def state(page):
    """The stroke state of the one drawing on a page, plus its polyline in page points."""
    ds = [d for d in page.get_drawings() if d["items"]]
    if not ds:
        return None
    d = max(ds, key=lambda e: (abs(e.get("width") or 0), len(e["items"])))
    pts = []
    for it in d["items"]:
        if it[0] == "l":
            pts.append(((it[1].x, it[1].y), (it[2].x, it[2].y)))
    return {"width": d.get("width"), "cap": d.get("lineCap"), "join": d.get("lineJoin"),
            "limit": d.get("miterlimit"), "items": len(d["items"]), "segs": pts,
            "keys": sorted(k for k in d if k != "items")}


def run_pgf(case, body):
    name = "pgf_" + case
    src = ("\\documentclass[10pt]{article}\n"
           "\\usepackage[paperwidth=%.1fcm,paperheight=%.1fcm,margin=0cm]{geometry}\n"
           "\\usepackage{tikz}\n\\begin{document}\n\\pagestyle{empty}\n"
           "\\vbox to %.1fcm{\\vss\\hbox to %.1fcm{\\hss\\begin{tikzpicture}[x=1cm,y=1cm]%s"
           "\\end{tikzpicture}\\hss}\\vss}\n\\end{document}\n"
           % (PAGE_CM, PAGE_CM, PAGE_CM, PAGE_CM, body))
    tex = os.path.join(TMP, name + ".tex")
    io.open(tex, "w", encoding="utf-8").write(src)
    pdf = os.path.join(TMP, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "-output-directory", TMP, name + ".tex"], cwd=TMP,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if not os.path.exists(pdf):
        print("PGF FAIL %s: %s" % (name, (r.stdout or "")[-600:]))
        return None
    return pdf


def run_typst(case, body):
    name = "typst_" + case
    src = ['#import "@preview/cetz:0.5.0"',
           '#set page(width: %gcm, height: %gcm, margin: 0cm)' % (PAGE_CM, PAGE_CM),
           # a canvas boxes its content tightly, so a 12pt pen hanging off the top of a y=0 segment
           # is cut by the page edge; padding gives the ink room to be measured
           '#cetz.canvas(padding: 3cm, {\n  import cetz.draw: *\n%s\n})' % body]
    typ = os.path.join(TMP, name + ".typ")
    io.open(typ, "w", encoding="utf-8").write("\n".join(src) + "\n")
    pdf = os.path.join(TMP, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    r = subprocess.run(["typst", "compile", "--root", ROOT, name + ".typ"], cwd=TMP,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode or not os.path.exists(pdf):
        print("TYPST FAIL %s: %s %s" % (name, r.stdout[-500:], r.stderr[-500:]))
        return None
    return pdf


def one_seg(pdf, end="right"):
    """Overshoot past a horizontal segment's end, plus the height of the ink at the very tip."""
    page = fitz.open(pdf)[0]
    st = state(page)
    if st is None or not st["segs"]:
        return st, None
    a, b = st["segs"][0]
    tip = b if end == "right" else a
    other = a if end == "right" else b
    sign = 1 if tip[0] > other[0] else -1
    box = ink(page, fitz.Rect(tip[0] - 20, tip[1] - 20, tip[0] + 20, tip[1] + 20))
    if box is None:
        return st, None
    over = (box["x1"] - tip[0]) if sign > 0 else (tip[0] - box["x0"])
    edge = ink(page, fitz.Rect(box["x1"] - 1.0, tip[1] - 15, box["x1"] + .2, tip[1] + 15))
    return st, {"overshoot": over, "tip_height": (edge["y1"] - edge["y0"]) if edge else 0.0}


def pen_of(pdf):
    """The ink thickness of a straight segment on this page, measured mid-way between its ends."""
    page = fitz.open(pdf)[0]
    st = state(page)
    if st is None or not st["segs"]:
        return None, None
    a, b = st["segs"][0]
    mid = ((a[0] + b[0]) / 2.0, (a[1] + b[1]) / 2.0)
    box = ink(page, fitz.Rect(mid[0] - 2, mid[1] - 20, mid[0] + 2, mid[1] + 20))
    return (st, (box["y1"] - box["y0"]) if box else None)


def corner(pdf):
    """How far ink reaches past the vertex, measured ALONG the outside bisector.

    A window around the corner cannot do this: its legs' own ends are the farthest ink from the
    vertex (2cm of leg reads 57pt), so only the projection on the direction the join grows in --
    opposite the two legs' bisector -- says anything about the join.
    """
    page = fitz.open(pdf)[0]
    st = state(page)
    if st is None or len(st["segs"]) < 2:
        return st, None
    a, v = st["segs"][0]
    b = st["segs"][1][1]
    u1 = math.hypot(a[0] - v[0], a[1] - v[1])
    u2 = math.hypot(b[0] - v[0], b[1] - v[1])
    ux = -((a[0] - v[0]) / u1 + (b[0] - v[0]) / u2)
    uy = -((a[1] - v[1]) / u1 + (b[1] - v[1]) / u2)
    un = math.hypot(ux, uy)
    ux, uy = ux / un, uy / un
    dot = ((a[0] - v[0]) * (b[0] - v[0]) + (a[1] - v[1]) * (b[1] - v[1])) / (u1 * u2)
    angle = math.degrees(math.acos(max(-1.0, min(1.0, dot))))
    box = ink(page, fitz.Rect(v[0] - 110, v[1] - 110, v[0] + 110, v[1] + 110), want_pts=True)
    far = max((x - v[0]) * ux + (y - v[1]) * uy for x, y in box["pts"])
    return st, {"far": far, "angle": angle, "n": len(box["pts"])}


print("=== stroke-state keys fitz reports: %s" % state(fitz.open(run_pgf(
    "s_probe", "\\draw[line width=12pt, line cap=round] (0,0) -- (2,0);"))[0])["keys"])

print("\n=== CAP: ink past the end of a 2cm segment, and the height of the ink at the tip")
for eng, spell, arg in [("pgf", "default", None), ("pgf", "butt", "butt"),
                        ("pgf", "round", "round"), ("pgf", "rect", "rect"),
                        ("typst", "default", None), ("typst", "butt", "butt"),
                        ("typst", "round", "round"), ("typst", "square", "square")]:
    if eng == "pgf":
        pdf = run_pgf("cap_%s" % spell,
                      "\\draw[line width=12pt%s] (0,0) -- (2,0);"
                      % ("" if arg is None else ", line cap=" + arg))
    else:
        pdf = run_typst("cap_%s" % spell,
                        "  line((0, 0), (2, 0), stroke: (thickness: %gpt%s))"
                        % (PEN, "" if arg is None else ', cap: "%s"' % arg))
    if not pdf:
        continue
    st, m = one_seg(pdf)
    print("%-6s %-8s state(cap=%s width=%s) overshoot=%s tip_height=%s"
          % (eng, spell, st["cap"] if st else "?",
             ("%.3f" % st["width"]) if st and st["width"] else "?",
             ("%.3f" % m["overshoot"]) if m else "no ink",
             ("%.3f" % m["tip_height"]) if m else "-"))

print("\n=== ZERO-LENGTH subpath: what does (0,0)--(0,0) ink?")
for eng, spell, arg in [("pgf", "default", None), ("pgf", "butt", "butt"),
                        ("pgf", "round", "round"), ("pgf", "rect", "rect"),
                        ("typst", "default", None), ("typst", "butt", "butt"),
                        ("typst", "round", "round"), ("typst", "square", "square")]:
    if eng == "pgf":
        pdf = run_pgf("zero_%s" % spell,
                      "\\draw[line width=12pt%s] (0,0) -- (0,0);"
                      % ("" if arg is None else ", line cap=" + arg))
    else:
        pdf = run_typst("zero_%s" % spell,
                        "  line((0, 0), (0, 0), stroke: (thickness: %gpt%s))"
                        % (PEN, "" if arg is None else ', cap: "%s"' % arg))
    if not pdf:
        continue
    page = fitz.open(pdf)[0]
    box = ink(page, fitz.Rect(0, 0, page.rect.width, page.rect.height))
    st = state(page)
    print("%-6s %-8s drawings=%s ink=%s" % (eng, spell,
                                            0 if st is None else st["items"],
                                            "none" if box is None else
                                            "%.2f x %.2f pt" % (box["x1"] - box["x0"],
                                                                 box["y1"] - box["y0"])))

print("\n=== JOIN: ink past the vertex of a corner of angle `a` (miter law = (pen/2)/sin(a/2))")
PENS = {"pgf": pen_of(run_pgf("pen_pgf", "\\draw[line width=12pt] (0,0) -- (2,0);"))[1],
        "typst": pen_of(run_typst("pen_typst",
                                  "  line((0, 0), (2, 0), stroke: (thickness: 12pt))"))[1]}
print("measured pen: pgf=%s typst=%s page points"
      % (("%.3f" % PENS["pgf"]) if PENS["pgf"] else "?",
         ("%.3f" % PENS["typst"]) if PENS["typst"] else "?"))
print("%-6s %-8s %8s %8s %10s %10s %8s %6s" % ("eng", "join", "angle", "read",
                                                "far/half", "1/sin(a/2)", "far pt", "code"))
for eng in ("pgf", "typst"):
    for spell, arg in [("default", None), ("miter", "miter"), ("round", "round"),
                       ("bevel", "bevel")]:
        for ang in (150, 120, 90, 60, 30, 20, 15, 12, 10, 8):
            b = 2 * math.cos(math.radians((180 - ang) / 2.0))
            h = 2 * math.sin(math.radians((180 - ang) / 2.0))
            tag = "%s%d" % (spell[0] if spell != "default" else "d", ang)
            if eng == "pgf":
                pdf = run_pgf("join_%s" % tag,
                              "\\draw[line width=12pt%s] (-%.4f, %.4f) -- (0,0) -- (%.4f, %.4f);"
                              % ("" if arg is None else ", line join=" + arg, b, h, b, h))
            else:
                pdf = run_typst("join_%s" % tag,
                                "  line((%.4f, %.4f), (0, 0), (%.4f, %.4f), "
                                "stroke: (thickness: %gpt%s))"
                                % (-b, h, b, h, PEN,
                                   "" if arg is None else ', join: "%s"' % arg))
            if not pdf:
                continue
            st, m = corner(pdf)
            if m is None:
                print("%-6s %-8s %8d no geometry" % (eng, spell, ang))
                continue
            print("%-6s %-8s %8d %8.2f %10.3f %10.3f %8.2f %6s"
                  % (eng, spell, ang, m["angle"], m["far"] / (PENS[eng] / 2.0),
                     1.0 / math.sin(math.radians(m["angle"] / 2)), m["far"], st["join"]))

print("\n=== MITER LIMIT: the angle at which each engine stops pointing (mitered reads 1/sin(a/2))")


def corner_case(eng, extra, ang, tag):
    b = 2 * math.cos(math.radians((180 - ang) / 2.0))
    h = 2 * math.sin(math.radians((180 - ang) / 2.0))
    tail = (", " + extra) if extra else ""
    if eng == "pgf":
        return run_pgf("limit_%s" % tag,
                       "\\draw[line width=12pt%s] (-%.4f, %.4f) -- (0,0) -- (%.4f, %.4f);"
                       % (tail, b, h, b, h))
    return run_typst("limit_%s" % tag,
                     "  line((%.4f, %.4f), (0, 0), (%.4f, %.4f), stroke: (thickness: %gpt%s))"
                     % (-b, h, b, h, PEN, tail))


print("%-6s %-30s %8s %9s %10s" % ("eng", "written on the pen", "angle", "far/half", "miter law"))
for eng, extra in (("pgf", ""), ("typst", ""),
                   ("typst", 'join: "miter", miter-limit: 10'),
                   ("typst", 'join: "round", miter-limit: 10')):
    for ang in ((32, 31, 30, 29.5, 29, 28.5, 28, 26, 24, 20, 16, 14, 12, 11.4, 11, 10.5, 10, 8)
                if eng == "typst" else (28, 24, 20, 16, 14, 12, 11.4, 11, 10.5, 10, 8)):
        tag = "%s_%g" % (re.sub(r"\W", "", extra) or "d", ang)
        pdf = corner_case(eng, extra, ang, tag)
        if not pdf:
            continue
        st, m = corner(pdf)
        if m is None:
            continue
        print("%-6s %-26s %8.1f %9.3f %10.3f"
              % (eng, extra or "(nothing)", ang, m["far"] / (PENS[eng] / 2.0),
                 1.0 / math.sin(math.radians(m["angle"] / 2))))

print("\ntmp=%s" % TMP)
