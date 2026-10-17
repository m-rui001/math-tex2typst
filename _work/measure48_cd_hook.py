r"""Which side of its own arrow does tikz-cd put a hook's barb, and which side do we?

`build_cd`'s normal is about to change side (轴 61 left the plain label on the wrong side of travel and
`measure48_cd_bend.py` proved it), and that flip moves every arrow's label, bend **and hook barb** --
so the barb's side has to be measured, not guessed, before the flip is allowed to touch it.  The count
of hook spellings in the corpus (`_work/probe48_cd_hook.py`) says how much this is worth.

The barb is the short thing at the arrow's tail: pgf draws tikz-cd's `hook` as a small curve, so both a
short straight segment and a short cubic whose start sits on the shaft's start are taken, and their
midpoint's right-hand distance from the shaft answers the question.  Signs follow
`measure48_cd_bend.py`: positive is the RIGHT of travel, and the canvas is read in its own basis.
"""
import math
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
import fitz  # noqa: E402
from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_m48hook")
CM = 0.0352778

DOC = ("\\documentclass[border=6pt]{standalone}\n"
       "\\usepackage{tikz-cd}\n"
       "\\begin{document}\n"
       "\\begin{tikzcd}%s"
       "\\end{tikzcd}\n"
       "\\end{document}\n")
CASES = [
    ("hook", '[column sep=2cm]A \\arrow[r,hook] & B'),
    ("r hook", '[column sep=2cm]A \\arrow[r,r hook] & B'),
    ("l hook", '[column sep=2cm]A \\arrow[r,l hook] & B'),
    ("down", '[row sep=1.5cm]A \\arrow[d,hook] \\\\ B'),
    ("down l", '[row sep=1.5cm]A \\arrow[d,l hook] \\\\ B'),
]
LINE_T = re.compile(r"line\(\((-?[\d.]+), (-?[\d.]+)\), \((-?[\d.]+), (-?[\d.]+)\)")


def on_page(name, body):
    os.makedirs(TMP, exist_ok=True)
    open(os.path.join(TMP, name + ".tex"), "w", encoding="utf-8").write(DOC % body)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                   cwd=TMP, capture_output=True)
    doc = fitz.open(os.path.join(TMP, name + ".pdf"))
    page = doc[0]
    h = page.rect.height

    def up(p):
        return (p.x * CM, (h - p.y) * CM)

    items = []
    for d in page.get_drawings():
        for item in d["items"]:
            if item[0] == "l":
                items.append((up(item[1]), up(item[2])))
            elif item[0] == "c":
                pts = [up(p) for p in item[1:]]
                items.append((pts[0], ((pts[0][0] + pts[-1][0]) / 2,
                                       (pts[0][1] + pts[-1][1]) / 2)))
    doc.close()
    return items


def perp(p, a, b):
    vx, vy = b[0] - a[0], b[1] - a[1]
    n = math.hypot(vx, vy)
    if not n:
        return 0.0
    ux, uy = vx / n, vy / n
    return (p[0] - a[0]) * uy - (p[1] - a[1]) * ux


def main():
    for name, body in CASES:
        items = on_page(re.sub(r"\W+", "_", name), body)
        shaft = max(items, key=lambda s: math.hypot(s[1][0] - s[0][0], s[1][1] - s[0][1]))
        barbs = [s for s in items if s is not shaft
                 and math.hypot(s[1][0] - s[0][0], s[1][1] - s[0][1]) < 0.6
                 and math.hypot(s[0][0] - shaft[0][0], s[0][1] - shaft[0][1]) < 0.15]
        print("   %-8s page: shaft %.3fcm, %d barb piece(s)%s"
              % (name, math.hypot(shaft[1][0] - shaft[0][0], shaft[1][1] - shaft[0][1]),
                 len(barbs),
                 "".join("  mid right %+.3f" % perp(((b[0][0] + b[1][0]) / 2,
                                                     (b[0][1] + b[1][1]) / 2),
                                                    shaft[0], shaft[1]) for b in barbs)))
        core = cetz.strip_envelope("\\begin{tikzcd}" + body + "\\end{tikzcd}")
        canvas = cetz.build_cd(core)
        if not canvas:
            print("          ours: build_cd refused")
            continue
        segs = [((float(m.group(1)), float(m.group(2))), (float(m.group(3)), float(m.group(4))))
                for m in LINE_T.finditer(canvas)]
        ours = max(segs, key=lambda s: math.hypot(s[1][0] - s[0][0], s[1][1] - s[0][1]))
        short = [s for s in segs if s is not ours]
        spec = re.search(r"\\arrow\[([^\]]*)\]", body).group(1)
        print("          ours: %d extra segment(s)%s  (hook key %+d)"
              % (len(short),
                 "".join("  mid right %+.3f" % perp(((s[0][0] + s[1][0]) / 2,
                                                     (s[0][1] + s[1][1]) / 2),
                                                    ours[0], ours[1]) for s in short),
                 cetz.cd_arrow(spec)["hook"]))


if __name__ == "__main__":
    main()
