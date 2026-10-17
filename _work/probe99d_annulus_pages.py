r"""#99d: the hole -- pgf's `even odd rule` against what we ship, and against `compound-path`.

`even odd rule` has no reader (grep of `tools/t2t` for `even.?odd|fill.?rule|rulepath` comes back
empty), so a nested two-subpath fill ships as `circle(outer, fill: C, stroke: none)` followed by
`circle(inner, fill: C, stroke: none)` -- the inner one paints over the hole the author left open.
CetZ 0.5.0, which is what the products import, does have the primitive: `compound-path({ ... },
fill-rule: "even-odd")`, whose own doc string says "This can be used to create paths with holes".

Three pages per shape, read the same way:

  control   pdflatex with the author's statement -- pgf punches;
  today     the emission run147 ships for it (`_work/label99b_circle_context.txt`);
  compound  the same subpaths inside one `compound-path` with `fill-rule: "even-odd"`.

The sample points come off the page, not off a layout assumption: the largest filled drawing on the
page is the outer shape, its box gives the cm-to-point scale, the hole is the box centre and the band
point sits half-way between the two radii along +x.

Three shapes cover the census: concentric circles (the commonest form), concentric rectangles (the
`rectangle` half), and the ellipse pair of Rigidity-of-Smooth-Billiards whose gap is NOT uniform
(0.30 horizontally against 0.4867 vertically) -- that one decides whether a constant-pen stroke along
the mid-curve could ever be faithful, or the hole needs a real fill rule.

  python _work/probe99d_annulus_pages.py        # -> _work/label99d_annulus.txt
"""
import io
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
DIR = os.path.join(WORK, "m99d-annulus")
OUT = os.path.join(WORK, "label99d_annulus.txt")
B = chr(92)

# name, pgf statement, outer half-extent in cm (x), inner half-extent in cm (x), paint, subpaths for
# the two Typst forms
SHAPES = [
    ("circles 1.19/0.68",
     B + "fill[black!18,even odd rule] (2.20,-4.62) circle (1.19cm) (2.20,-4.62) circle (0.68cm);",
     1.19, 0.68, "#d1d1d1",
     ["circle((0, 0), radius: 1.19)", "circle((0, 0), radius: 0.68)"]),
    ("rects 3/2.15",
     B + "fill[blue!10,even odd rule] (-3,-3) rectangle (3,3) (-2.15,-2.15) rectangle (2.15,2.15);",
     3.0, 2.15, "#dfe7f5",
     ["rect((-3, -3), (3, 3))", "rect((-2.15, -2.15), (2.15, 2.15))"]),
    ("ellipse 3&2/2.70&1.5133",
     B + "fill[cyan!9,even odd rule] (0,0) ellipse (3 and 2) (0,0) ellipse (2.70 and 1.5133);",
     3.0, 2.70, "#d5ecf3",
     ["circle((0, 0), radius: (3, 2))", "circle((0, 0), radius: (2.70, 1.5133))"]),
]

DPI = 600


def run(cmd):
    return subprocess.run(cmd, cwd=DIR, capture_output=True, text=True, shell=True,
                          encoding="utf-8", errors="replace")


def canvas(body):
    return ("#import \"@preview/cetz:0.5.0\"\n"
            "#cetz.canvas({\nimport cetz.draw: *\n%s\n})\n" % body)


def build():
    """Compile the three sides; return [(side, pdf path, process)]."""
    tex = ("\\documentclass[tikz,border=3cm]{standalone}\n\\begin{document}\n"
           + "".join("\\begin{tikzpicture}%s\n\\end{tikzpicture}\n" % s[1] for s in SHAPES)
           + "\\end{document}\n")
    io.open(os.path.join(DIR, "control.tex"), "w", encoding="utf-8", newline="").write(tex)
    ctrl = run("pdflatex -interaction=nonstopmode -halt-on-error control.tex")

    def pages(forms):
        out = []
        for (name, _stmt, outer, inner, paint, subs) in SHAPES:
            out.append("#page(width: 12cm, height: 10cm, margin: 2cm)[%s]" % forms(name, paint, subs))
        return "#import \"@preview/cetz:0.5.0\"\n" + "\n".join(out) + "\n"

    def today_form(_n, paint, subs):
        # the options go inside the call, the way the emitter writes them
        return canvas("\n".join("%s, fill: rgb(\"%s\"), stroke: none)"
                                % (s[:-1], paint) for s in subs))
    today = pages(today_form)
    io.open(os.path.join(DIR, "today.typ"), "w", encoding="utf-8", newline="").write(today)
    r_today = run("typst compile today.typ today.pdf")

    def comp(_n, paint, subs):
        body = "\n".join("  " + s for s in subs)
        return canvas("compound-path({\n%s\n}, fill: rgb(\"%s\"), fill-rule: \"even-odd\","
                      " stroke: none)" % (body, paint))
    fix = pages(comp)
    io.open(os.path.join(DIR, "compound.typ"), "w", encoding="utf-8", newline="").write(fix)
    r_fix = run("typst compile compound.typ compound.pdf")
    return [("control pgf", os.path.join(DIR, "control.pdf"), ctrl),
            ("today  two filled paths"  , os.path.join(DIR, "today.pdf"), r_today),
            ("compound-path even-odd", os.path.join(DIR, "compound.pdf"), r_fix)]


def probe(side, pdf, proc):
    lines = ["", "== %s" % side]
    if not os.path.isfile(pdf):
        lines.append("   NO PDF rc=%d %s" % (proc.returncode,
                                             ((proc.stdout or "") + (proc.stderr or ""))[-700:]))
        return lines
    doc = fitz.open(pdf)
    for pno, (name, _stmt, outer, inner, _paint, _subs) in enumerate(SHAPES):
        if pno >= doc.page_count:
            lines.append("   %-26s no page %d (pages=%d)" % (name, pno, doc.page_count))
            continue
        page = doc[pno]
        fills = [d for d in page.get_drawings() if d.get("fill") is not None]
        if not fills:
            lines.append("   %-26s filled drawings=0" % name)
            continue
        big = max(fills, key=lambda d: d["rect"].get_area())
        box = big["rect"]
        cx, cy = (box.x0 + box.x1) / 2.0, (box.y0 + box.y1) / 2.0
        scale = box.width / (2.0 * outer) if box.width else 1.0
        mid = (outer + inner) / 2.0
        pix = page.get_pixmap(dpi=DPI)

        def at(x_pt, y_pt):
            ix, iy = int(round(x_pt * DPI / 72.0)), int(round(y_pt * DPI / 72.0))
            if not (0 <= ix < pix.width and 0 <= iy < pix.height):
                return None
            return pix.pixel(ix, iy)

        lines.append("   %-26s fills=%d box=%.1fx%.1fpt hole=%s band=%s paper=%s"
                     % (name, len(fills), box.width, box.height,
                        at(cx, cy), at(cx + mid * scale, cy), at(2.0, 2.0)))
    doc.close()
    return lines


def main():
    if not os.path.isdir(DIR):
        os.makedirs(DIR)
    lines = ["hole = centre of the outer box, band = half-way between the two radii along +x, paper =",
             "the page corner. A punched hole reads at the paper colour (255,255,255 on white); a",
             "painted hole reads at the fill. Expected: control punched, today painted, compound punched."]
    for side, pdf, proc in build():
        lines += probe(side, pdf, proc)
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
