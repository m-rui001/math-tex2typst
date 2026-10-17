r"""#102 leg A: what a pgf dash name actually asks the page for, read back out of the PDF.

`stroke_args` (cetz.py:440) prices a dash from two bare keys alone, so every other spelling falls
through to a solid rule. Before mapping anything we need the numbers pgf itself puts on the page:
pgf's own definitions (tikz.code.tex:1583-1601) say `dotted` = on \pgflinewidth off 2pt while
`dashed` = on 3pt off 3pt -- i.e. one family's dot length is the PEN and the other's is absolute.
This probe draws one 8cm horizontal rule per style, at two pen widths, and reads back the dash
array the driver wrote plus the ink runs, so the law is measured, not recalled.

The PDF keeps the pattern in the graphics state (`[on off] 0 d`), so PyMuPDF hands it over as
`path["dashes"]`; the ink runs are the drawn segments' own lengths, which is the check that the
array really reaches the page.

  PYTHONIOENCODING=utf-8 python _work/probe102a_dash_pgf.py
"""
import os
import re
import sys

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import compare_figure as g  # noqa: E402  (the one pdflatex-rendering helper)

STYLES = [
    ("solid", ""),
    ("dashed", "dashed"),
    ("densely dashed", "densely dashed"),
    ("loosely dashed", "loosely dashed"),
    ("dotted", "dotted"),
    ("densely dotted", "densely dotted"),
    ("loosely dotted", "loosely dotted"),
    ("dashdotted", "dashdotted"),
    ("dash dot", "dash dot"),
    ("densely dashdotted", "densely dashdotted"),
    ("dashdotdotted", "dashdotdotted"),
    ("dash dot dot", "dash dot dot"),
    ("explicit 2/3", "dash pattern=on 2pt off 3pt"),
    ("explicit 4/2/1/2", "dash pattern=on 4pt off 2pt on 1pt off 2pt"),
    ("explicit mm", "dash pattern=on 1mm off 1mm"),
    ("penscaled", "dash pattern=on 3\\pgflinewidth off 2\\pgflinewidth"),
]
PENS = ["thin", "ultra thick"]
OUT = os.path.join(HERE, "label102a_dash_pgf.txt")


def pic(style, pen):
    opts = ", ".join(x for x in [pen, style] if x)
    body = "\\begin{tikzpicture}\n\\draw[%s] (0,0) -- (8cm,0);\n\\end{tikzpicture}" % opts
    return "\\documentclass{article}\n\\usepackage{tikz}\n\\begin{document}\n" + body + "\n\\end{document}\n"


def runs(pdf):
    """(dash array string, sorted run lengths in pt) of the longest stroked path on the page."""
    d = fitz.open(pdf)
    best = None
    for path in d[0].get_drawings():
        w = path.get("width") or 0
        segs = []
        for item in path["items"]:
            if item[0] == "l":
                segs.append((item[1], item[2]))
        if not segs:
            continue
        span = max(abs(b.x - a.x) for a, b in segs) + max(abs(b.y - a.y) for a, b in segs)
        key = (round(w, 3), span)
        if best is None or key > best[0]:
            best = (key, path.get("dashes"), segs)
    d.close()
    if best is None:
        return None, None, None
    _, dashes, segs = best
    lens = []
    for a, b in segs:
        L = abs(b.x - a.x) if abs(b.y - a.y) < 1e-6 else (b.x - a.x, b.y - a.y)
        if isinstance(L, tuple):
            L = (L[0] ** 2 + L[1] ** 2) ** 0.5
        lens.append(round(L, 3))
    return dashes, sorted(set(lens)), len(segs)


def main():
    sys.stdout.reconfigure(errors="replace")
    lines = ["pgf dash names read back off the pdflatex page (8cm horizontal rule)",
             "pen column: thin = 0.4pt, ultra thick = 1.6pt.  dashes = the PDF array, runs = ink segment lengths",
             ""]
    for pen in PENS:
        lines.append("== pen %s ==" % pen)
        lines.append("%-22s %-26s %-22s %s" % ("style", "pgf key", "pdf dashes", "ink runs (pt) x count"))
        for name, style in STYLES:
            stem = "m102a_%s_%s" % (re.sub(r"\W", "", name), pen)
            tex = os.path.join(g.CMP, stem + ".tex")
            open(tex, "w", encoding="utf-8").write(pic(style, pen))
            pdf, _ = g.control(tex, 0, [])
            if pdf is None:
                lines.append("%-22s %-26s FAILED" % (name, style))
                continue
            dashes, lens, n = runs(pdf)
            lines.append("%-22s %-26s %-22s %s" % (
                name, style or "(none)", dashes,
                "%s x %d" % (lens, n) if lens else "no straight segments"))
        lines.append("")
    text = "\n".join(lines) + "\n"
    open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
