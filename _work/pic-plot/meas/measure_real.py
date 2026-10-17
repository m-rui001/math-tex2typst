r"""Check the three real plots: the canvas this converter emits vs the PDF pdflatex draws.

Every control case is the refused picture's own statement, with its own picture options, compiled by
pdflatex; the page-centimetre items of the resulting PDF are then looked for, in order, among the
calls the canvas emits for the real picture. A picture's `scale=.8` or `x=0.8cm` is part of the
control, so what is compared is what lands on the page rather than the written coordinate.

Run: python _work/pic-plot/meas/measure_real.py
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from pdfpaths import centimetres  # noqa: E402
from t2t import cetz, convert, prep  # noqa: E402

FLAT = Path("E:/math/_work/flat")
TOL = 3e-3  # the canvas prints four significant digits, the PDF reads them back in points

# (case, paper prefix, picture index, real picture options, the statement on its own)
CASES = [
    ("honey_a", "Mass-and-covering-exponents-for-fixed-length-honeycomb-walks", 9,
     r"scale=.8,font=\small,>=Latex",
     r"\draw[blue!65!black,very thick] plot[smooth] coordinates {(-1.1,-.7) (-.7,-.5) (-.9,0) "
     r"(-.3,.3) (0,0) (.5,.3) (.2,.8) (.8,.9) (1.1,.5)};"),
    ("honey_b", "Mass-and-covering-exponents-for-fixed-length-honeycomb-walks", 9,
     r"scale=.8,font=\small,>=Latex",
     r"\begin{scope}[xshift=6cm]\draw[blue!65!black,very thick] plot[smooth] coordinates "
     r"{(-1.1,-1.5) (-.5,-.8) (-.6,0) (.1,.1) (.8,.35) (.6,.9) (1.1,1.4)};\end{scope}"),
    ("at_a", "The-joint-scaling-limit-of-critical-Ashkin-Teller-currents", 1,
     r"x=0.8cm,y=0.8cm,>=Latex",
     r"\draw[very thick,teal!70!black] plot[smooth] coordinates "
     r"{(0,0.8) (1,1.15) (2,0.9) (3,1.35) (4,1.0) (5,1.2) (6,0.9)};"),
    ("at_b", "The-joint-scaling-limit-of-critical-Ashkin-Teller-currents", 1,
     r"x=0.8cm,y=0.8cm,>=Latex",
     r"\draw[very thick,teal!70!black] plot[smooth] coordinates "
     r"{(0,2.7) (1,2.35) (2,2.55) (3,2.1) (4,2.45) (5,2.3) (6,2.7)};"),
    ("at_c", "The-joint-scaling-limit-of-critical-Ashkin-Teller-currents", 1,
     r"x=0.8cm,y=0.8cm,>=Latex",
     r"\begin{scope}[xshift=7.5cm]\draw[very thick,teal!70!black] plot[smooth] coordinates "
     r"{(0,0.6) (1,0.9) (2,0.75) (3,1.05) (4,0.8) (6,0.65)};\end{scope}"),
    ("at_d", "The-joint-scaling-limit-of-critical-Ashkin-Teller-currents", 1,
     r"x=0.8cm,y=0.8cm,>=Latex",
     r"\begin{scope}[xshift=7.5cm]\draw[very thick,teal!70!black] plot[smooth] coordinates "
     r"{(0,3.45) (1,3.1) (2,3.3) (3,3.0) (4,3.25) (6,3.4)};\end{scope}"),
    ("hs_plus", "Nonuniqueness-with-local-conservation-for-the-hard-sphere", 0,
     r"x=1cm,y=1cm,>=Latex,font=\small",
     r"\draw[blue!55!black,line width=1.1pt,domain=-2.2:2.2,samples=70]"
     r"plot ({10.3+\x},{2.55+.23*tanh(1.35*\x)});"),
    ("hs_minus", "Nonuniqueness-with-local-conservation-for-the-hard-sphere", 0,
     r"x=1cm,y=1cm,>=Latex,font=\small",
     r"\draw[orange!75!black,line width=1.1pt,domain=-2.2:2.2,samples=70]"
     r"plot ({10.3+\x},{1.19+.23*tanh(1.35*\x)});"),
]


NUMBER = r"-?\d+(?:\.\d+)?(?:e-?\d+)?"


def canvas_calls(canvas):
    """(kind, [(x, y), ...]) for every draw call the canvas emits, in drawing order.

    The emitter writes one call per line, so a line is read as one call rather than as a paren
    expression: its `stroke: (paint: rgb("#0000a6"))` tail nests deeper than a flat regex spans.
    """
    out = []
    for line in canvas.splitlines():
        m = re.match(r"\s*(bezier|line)\(", line)
        if not m:
            continue
        pairs = re.findall(r"\((%s), (%s)\)" % (NUMBER, NUMBER), line)
        out.append((m.group(1), [(float(a), float(b)) for a, b in pairs]))
    return out


def matches_pdf(call, item):
    """A canvas bezier((start, stop, c1, c2)) against a PDF curveto (start, c1, c2, stop)."""
    want = [item[0], item[3], item[1], item[2]]
    return len(call) == 4 and all(abs(a[k] - b[k]) <= TOL for a, b in zip(call, want) for k in (0, 1))


def find(calls, items, kind):
    """The run of `calls` of that kind that reproduces `items`, or where it first differs."""
    same = [c for c in calls if c[0] == kind]
    for start in range(len(same) - len(items) + 1):
        run = same[start:start + len(items)]
        if all(matches_pdf(r[1], i) for r, i in zip(run, items)):
            return True, start
    return False, 0


def polyline(items):
    """The points a run of PDF line items traces: each item is (from, to)."""
    return [items[0][0]] + [to for _, to in items]


if __name__ == "__main__":
    for prefix in {c[1] for c in CASES}:
        src = next(p for p in sorted(FLAT.glob(prefix + "*.tex"))).read_text(encoding="utf-8")
        pre_text, _ = prep.split_document(src)
        line_cm = convert.line_cm(prep.parse_preamble(pre_text))
        pics = [m.group(0) for m in cetz.PICTURE_ENV.finditer(src)]
        canvases = {i: cetz.build(cetz.MATH_ENVELOPE.sub("", p), None, line_cm)
                    for i, p in enumerate(pics)}
        for case, own, index, options, statement in CASES:
            if own != prefix:
                continue
            drawn = [it for it in centimetres(case, statement, "," + options)
                     if not (it[0] and abs(it[0][0]) < .05 and abs(it[0][1] - .6) < .05)]
            canvas = canvases[index]
            if canvas is None:
                print("%-9s NO CANVAS" % case)
                continue
            calls = canvas_calls(canvas)
            curves = [pts for _, kind, pts in drawn if kind == "c"]
            lines = [pts for _, kind, pts in drawn if kind == "l"]
            if curves:
                ok, at = find(calls, curves, "bezier")
                print("%-9s %2d pdf curves -> canvas bezier run at %2d, match=%s"
                      % (case, len(curves), at, ok))
                if not ok:
                    beziers = [c for c in calls if c[0] == "bezier"]
                    for i, item in enumerate(curves):
                        got = beziers[i][1] if i < len(beziers) else []
                        print("   pdf    ", [" (%.4f,%.4f)" % p for p in item])
                        print("   canvas ", [" (%.4f,%.4f)" % p for p in got])
            else:
                pts = polyline(lines)
                run = next((c[1] for c in calls if c[0] == "line" and len(c[1]) == len(pts)), None)
                ok = run is not None and all(abs(a[k] - b[k]) <= TOL for a, b in zip(run, pts)
                                             for k in (0, 1))
                print("%-9s %2d pdf lines = %d points -> canvas line of %s points, match=%s"
                      % (case, len(lines), len(pts), len(run) if run else "-", ok))
                print("          pdf ends (%.4f, %.4f) (%.4f, %.4f)" % (pts[0] + pts[-1]))
                if run:
                    print("          canvas ends (%.4f, %.4f) (%.4f, %.4f)" % (run[0] + run[-1]))
                    for i, (a, b) in enumerate(zip(run, pts)):
                        if any(abs(a[k] - b[k]) > TOL for k in (0, 1)):
                            print("          first difference at %d: canvas (%.4f, %.4f) "
                                  "pdf (%.4f, %.4f)" % (i, a[0], a[1], b[0], b[1]))
                            break
