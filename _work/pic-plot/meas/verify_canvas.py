r"""End-to-end: every real refused picture compiled by pdflatex, against the canvas cetz.py emits.

Each refused paper's own picture is replayed in a standalone file that also draws two reference axes
from the picture's (0,0), so the page->picture origin and 28.3465 pt per PDF cm are read off the same
file. Stroked items of the plot's own colour, in content order, are the drawn pieces of that one
`\draw`; a jump back to a point the stroke did not leave from starts a new chain. Chains are compared
with the canvas both absolutely (where TeX put them on the page) and by shape (offsets from the
chain's own first point, so the picture's frame drops out).

A PDF curveto reads (start, control 1, control 2, stop); a canvas bezier call is
(start, stop, control 1, control 2).

Run: python _work/pic-plot/meas/verify_canvas.py
"""
import math
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import pymupdf as fitz  # noqa: E402
from pdfpaths import PDFCM  # noqa: E402
from t2t import cetz, convert, prep  # noqa: E402

FLAT = Path("E:/math/_work/flat")
HERE = Path(__file__).resolve().parent
TOL = 3e-3  # the canvas prints four significant digits of a centimetre; the PDF reads back points
PDF_ORDER = (0, 2, 3, 1)  # canvas (start,stop,c1,c2) -> the PDF's (start,c1,c2,stop)

# a whole paper picture needs the maths its own preamble carries (`\tfrac`, `\pmod`)
TEMPLATE = (r"\documentclass[tikz,border=0pt]{standalone}" "\n"
            r"\usepackage{amsmath}" "\n"
            r"\usepackage{tikz}" "\n"
            r"\usetikzlibrary{arrows.meta,calc,patterns,decorations.pathmorphing}" "\n"
            r"\begin{document}" "\n"
            r"{picture}" "\n"
            r"\end{document}" "\n")


def compile_whole(name, picture):
    """The picture on a page of its own, plus the two axes that calibrate it."""
    src = HERE / (name + "_whole.tex")
    body = picture.replace(
        r"\end{tikzpicture}",
        # axes after the plots: they are the only green!60!black strokes here, and adding them must
        # not reorder the plots' own items in the content stream
        r"\draw[green!60!black,line width=0.4pt] (0,0)--(10,0)(0,0)--(0,10);"
        r"\end{tikzpicture}", 1)
    src.write_text(TEMPLATE.replace("{picture}", body), encoding="utf-8")
    proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                           "-output-directory", str(HERE), str(src)],
                          capture_output=True, text=True, cwd=str(HERE))
    if proc.returncode != 0:
        print(proc.stdout[-3000:])
        raise SystemExit("compile failed: " + name)
    return HERE / (name + "_whole.pdf")


def strokes(pdf, rgb):
    """(kind, points in page cm from the picture origin) for every stroked item of one colour."""
    paths = fitz.open(str(pdf))[0].get_drawings()
    axis = [p for path in paths if _is_axis(path) for item in path["items"]
            for p in [(q.x, q.y) for q in item[1:]]]
    if not axis:
        raise SystemExit("no calibration axes in " + str(pdf))
    ox, oy = min(p[0] for p in axis), max(p[1] for p in axis)
    out = []
    for path in paths:
        col = path.get("color")
        # a dashed stroke is a different drawing rule, and its items are not this plot's pieces
        if not col or path.get("dashes") not in (None, "[] 0") or any(
                abs(a - b) > 2e-2 for a, b in zip(col, rgb)):
            continue
        for item in path["items"]:
            if item[0] not in "lc":
                continue
            pts = [((q.x - ox) / PDFCM, (oy - q.y) / PDFCM) for q in item[1:]]
            out.append((item[0], pts))
    return out


def _is_axis(path):
    col = path.get("color")
    return col and abs(col[1] - 0.6) < 0.05 and col[0] < 0.05 and col[2] < 0.05


def chains(items):
    r"""Consecutive pieces that trail one another: one chain per drawn `\draw`."""
    out, cur = [], []
    for kind, pts in items:
        if cur and pts[0] != cur[-1][1][-1]:
            out.append(cur)
            cur = []
        cur.append((kind, pts))
    if cur:
        out.append(cur)
    return out


def canvas_calls(canvas):
    """(kind, [(x, y), ...]) for every bezier/line call the canvas emits, in drawing order."""
    number = r"-?\d+(?:\.\d+)?(?:e-?\d+)?"
    out = []
    for line in canvas.splitlines():
        m = re.match(r"\s*(bezier|line)\(", line)
        if m:
            pairs = re.findall(r"\((%s), (%s)\)" % (number, number), line)
            out.append((m.group(1), [(float(a), float(b)) for a, b in pairs]))
    return out


def bezier_runs(calls):
    """Runs of consecutive bezier calls that trail one another, in PDF point order.

    A canvas writes one `bezier(...)` per piece and two `plot[smooth]` chains can be adjacent in the
    file, so a run ends where a piece does not start on the previous one's stop -- exactly how the
    PDF's own items chain.
    """
    out, cur = [], []
    for kind, pts in calls:
        piece = [pts[i] for i in PDF_ORDER] if kind == "bezier" and len(pts) == 4 else None
        if piece and (not cur or piece[0] == cur[-1][-1]):
            cur.append(piece)
            continue
        if cur:
            out.append(cur)
        cur = [piece] if piece else []
    if cur:
        out.append(cur)
    return out


def polyline_runs(calls):
    """Every `line(...)` call of at least three points, cut into the two-ended pieces a stroke has.

    A sampled `plot` without `smooth` is one polyline in the canvas and 69 short strokes in the PDF,
    so both sides have to be read as pieces before they can be compared at all.
    """
    out = []
    for kind, pts in calls:
        if kind == "line" and len(pts) >= 3:
            out.append([[pts[i], pts[i + 1]] for i in range(len(pts) - 1)])
    return out


def print_tol(v):
    """Half the last digit `fmt` can still print for a coordinate of this size (`%.4g`)."""
    return 0.5 * 10.0 ** (math.floor(math.log10(max(abs(v), 1e-9))) - 3) + 2e-4


def over(a, b):
    """How far a canvas point misses the PDF's, in units of what the canvas can even express."""
    bad = 0.0
    for p, q in zip(a, b):
        for k in (0, 1):
            bad = max(bad, abs(p[k] - q[k]) - print_tol(max(abs(p[k]), abs(q[k]))))
    return bad


def compare(label, pdf_chain, canvas_chain):
    if len(pdf_chain) != len(canvas_chain):
        print("%-26s FAIL %d pdf pieces vs %d canvas" % (label, len(pdf_chain), len(canvas_chain)))
        return False
    dx = pdf_chain[0][0][0] - canvas_chain[0][0][0]
    dy = pdf_chain[0][0][1] - canvas_chain[0][0][1]
    place = max(abs(p[k] - q[k]) for x, y in zip(pdf_chain, canvas_chain)
                for p, q in zip(x, y) for k in (0, 1))
    # the chain slid onto TeX's own start point, so what is left is the spline and nothing else
    shape = max(over(x, [[p[0] + dx, p[1] + dy] for p in item])
                for x, item in zip(pdf_chain, canvas_chain))
    print("%-26s %s shape %+.5f past print, place %.4f cm, %d pieces"
          % (label, "OK  " if shape <= 0 else "FAIL", shape, place, len(pdf_chain)))
    if place > TOL:
        print("      pdf    %s" % ["(%.4f,%.4f)" % p for p in pdf_chain[0]])
        print("      canvas %s" % ["(%.4f,%.4f)" % p for p in canvas_chain[0]])
        print("      (the spline is exact; where the chain sits is the scope reader's job)")
    return shape <= 0


CASES = [
    # (case, paper prefix, picture index, the colour this family plots in)
    ("honeycomb", "Mass-and-covering-exponents-for-fixed-length-honeycomb-walks", 9,
     (0.0, 0.0, 0.65)),               # blue!65!black, two `plot[smooth]` chains
    ("ashkin", "The-joint-scaling-limit-of-critical-Ashkin-Teller-currents", 1,
     (0.0, 0.35, 0.35)),              # teal!70!black, four `plot[smooth]` chains
    ("hardsphere", "Nonuniqueness-with-local-conservation-for-the-hard-sphere", 0,
     (0.0, 0.0, 0.55)),               # blue!55!black, samples=70 over domain=-2.2:2.2
]

for label, prefix, index, rgb in CASES:
    src = next(p for p in sorted(FLAT.glob(prefix + "*.tex"))).read_text(encoding="utf-8")
    pre_text, _ = prep.split_document(src)
    cm = convert.line_cm(prep.parse_preamble(pre_text))
    pic = [m.group(0) for m in cetz.PICTURE_ENV.finditer(src)][index]
    canvas = cetz.build(cetz.MATH_ENVELOPE.sub("", pic), None, cm)
    if canvas is None:
        print("%-26s NO CANVAS" % label)
        continue
    items = strokes(compile_whole(label, pic), rgb)
    kinds = {k for k, _ in items}
    pdf_runs = [[pts for _, pts in run] for run in chains(items)]
    got = canvas_calls(canvas)
    if kinds == {"c"}:
        canvas_runs = bezier_runs(got)
    elif kinds == {"l"}:
        canvas_runs = polyline_runs(got)
    else:
        print("%-26s MIXED pdf item kinds %s" % (label, sorted(kinds)))
        continue
    print("-- %s: pdf chains %s, canvas chains %s"
          % (label, [len(r) for r in pdf_runs], [len(r) for r in canvas_runs]))
    for i, pc in enumerate(pdf_runs):
        # two chains of the same length are told apart by where TeX put them on the page
        same = [c for c in canvas_runs if len(c) == len(pc)]
        if not same:
            print("%-26s FAIL no canvas chain of %d pieces" % (label + " chain %d" % i, len(pc)))
            continue
        cc = min(same, key=lambda c: math.hypot(c[0][0][0] - pc[0][0][0],
                                                c[0][0][1] - pc[0][0][1]))
        canvas_runs.remove(cc)
        compare("%s chain %d" % (label, i), pc, cc)
