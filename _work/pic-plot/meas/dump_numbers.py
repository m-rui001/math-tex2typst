r"""Print the numbers the tests quote, straight off the compiled control PDFs.

Run: python _work/pic-plot/meas/dump_numbers.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from pdfpaths import pieces, measure  # noqa: E402

K5 = "(0,0) (1,1) (2,0) (3,1) (4,0)"
for label, opt in (("default", ""), ("tension=1", ",tension=1"), ("tension=2", ",tension=2")):
    got = pieces("dump_k5" + label.replace("=", "").replace("2", "b").replace("1", "a"),
                 r"\draw[blue,very thick] plot[smooth%s] coordinates {%s};" % (opt, K5))
    print("K5 %-9s" % label, [["(%.4f,%.4f)" % p for p in item] for item in got[:2]])

got = pieces("dump_k3", r"\draw[blue,very thick] plot[smooth] coordinates {(0,0) (1,1) (2,0)};")
print("three knots  ", [["(%.4f,%.4f)" % p for p in item] for item in got])

# the real pictures, in page cm from the picture origin: what the canvas has to print
from verify_canvas import CASES, compile_whole, strokes, chains, canvas_calls, bezier_runs  # noqa: E402
from t2t import cetz, convert, prep  # noqa: E402

FLAT = Path("E:/math/_work/flat")
for label, prefix, index, rgb in CASES:
    src = next(p for p in sorted(FLAT.glob(prefix + "*.tex"))).read_text(encoding="utf-8")
    pre_text, _ = prep.split_document(src)
    cm = convert.line_cm(prep.parse_preamble(pre_text))
    pic = [m.group(0) for m in cetz.PICTURE_ENV.finditer(src)][index]
    canvas = cetz.build(cetz.MATH_ENVELOPE.sub("", pic), None, cm)
    items = strokes(compile_whole(label, pic), rgb)
    print("== %s" % label)
    for n, run in enumerate(chains(items)):
        pts = [p for _, p in run]
        print("   pdf chain %d head %s" % (n, ["(%.4f,%.4f)" % q for q in pts[0]]))
        print("   pdf chain %d tail %s" % (n, ["(%.4f,%.4f)" % q for q in pts[-1][-1:]]))
    if label == "hardsphere":
        poly = [pts[0] for pts in [[p for _, p in run] for run in chains(items)][0:1]]
        head, tail = poly[0][0], poly[0][-1]
        print("   pdf polyline %d points, head %s tail %s"
              % (len(poly[0]) + 1, ["(%.4f,%.4f)" % q for q in head],
                 ["(%.4f,%.4f)" % q for q in tail]))
        step = poly[0][1][0] - poly[0][0][0]
        print("   pdf step in x %.6f cm, (hi-lo)/(n-1) = %.6f" % (step, 4.4 / 69))
        for kind, pts in canvas_calls(canvas):
            if kind == "line" and len(pts) == 70:
                print("   canvas line head %s tail %s"
                      % (["(%.4f,%.4f)" % q for q in pts[0]],
                         ["(%.4f,%.4f)" % q for q in pts[-1]]))
    else:
        for n, run in enumerate(bezier_runs(canvas_calls(canvas))):
            print("   canvas run %d head %s" % (n, ["(%.4f,%.4f)" % q for q in run[0]]))
