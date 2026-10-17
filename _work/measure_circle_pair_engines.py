r"""The same round node in pdflatex and in CeTz: what diameter does each engine draw?

`_work/measure_cetz_frame_circle.py` established two facts on the page: CeTz's `frame: "circle"` is
the circle through three corners of the content box (a 0.9cm square range came out 1.2758cm across =
0.45 x sqrt(2) radius), and `content(point, [text], frame: "circle")` compiles -- Typst measures the
text and CeTz draws around it. What neither says is which spelling reproduces TeX.

So both engines draw the same three bodies and the DRAWN PATH is measured, not the anchor: PGF's
anchors and its stroked circle can disagree, and a canvas string saying `(-0.45,-0.45)` certainly
does not say what lands on paper. Cases:
  * a bare `circle` node sized by its text -- the 87 nodes that currently fall into Typst's `#box(`
    and lose the shape entirely;
  * `minimum size=9mm` -- the spelling the range form already draws, to see how far off it is;
  * a long label -- whether the two engines' circles grow by the same rule.
The candidate spellings on the Typst side are the two the fix can use: the point form, and the range
form with its half-extent divided by sqrt(2) (which is what "circumscribed" would need to hit a
declared diameter).
"""
import os
import re
import subprocess
import sys
import tempfile

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")

CM = 28.3465
BODIES = ["$k$", "ab", "a rather long label"]
TEX_OPTS = ["circle,draw", "circle,draw,minimum size=9mm"]

TEX_DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\begin{document}
%(body)s
\end{document}
"""

TEX_PIC = (r"\begin{tikzpicture}\node[%s] at (0,0) {%s};\end{tikzpicture}")

# each Typst case carries a 1cm ruler so the page numbers convert back to cm
TYP = ('#import "@preview/cetz:0.5.0"\n'
       '#set page(width: 300pt, height: 120pt)\n'
       '#cetz.canvas({\n  import cetz.draw: *\n'
       '  line((0, -3), (1, -3), stroke: (thickness: 0.1pt, paint: luma(200)))\n'
       '  %s\n})\n')

TYP_CASES = {
    "point": lambda body: ('content((0, 0), [%s], frame: "circle", '
                           'stroke: (thickness: 0.4pt), fill: none)' % body),
    "range9mm": lambda body: ('content((-0.45, -0.45), (0.45, 0.45), [%s], frame: "circle", '
                              'stroke: (thickness: 0.4pt), fill: none)' % body),
    "range-sqrt2": lambda body: ('content((-0.3182, -0.3182), (0.3182, 0.3182), [%s], '
                                 'frame: "circle", stroke: (thickness: 0.4pt), fill: none)' % body),
}


def biggest(page, min_side=3.0):
    """The widest square-ish drawn path -- the circle -- as (width, height) in cm."""
    best = None
    for d in page.get_drawings():
        r = d["rect"]
        if r.width < min_side or r.height < min_side:
            continue
        if r.width > 250:      # the ruler is flat; a full-page box is the frame
            continue
        if best is None or r.width * r.height > best[0] * best[1]:
            best = (r.width, r.height)
    return best


def main():
    print("== pdflatex (the law to match)")
    with tempfile.TemporaryDirectory() as tmp:
        body = "\n".join(TEX_PIC % (opt, txt) for opt in TEX_OPTS for txt in BODIES)
        tex = os.path.join(tmp, "t.tex")
        open(tex, "w", encoding="utf-8").write(TEX_DOC % {"body": body})
        subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", tmp, tex],
                       capture_output=True)
        doc = fitz.open(os.path.join(tmp, "t.pdf"))
        page = doc[0]
        shots = [d["rect"] for d in page.get_drawings()
                 if d["rect"].width >= 3 and d["rect"].height >= 3]
        shots.sort(key=lambda r: r.x0)
        for i, r in enumerate(shots):
            opt = TEX_OPTS[i // len(BODIES)]
            txt = BODIES[i % len(BODIES)]
            print("   %-30s %-22r  drawn %.4f x %.4f cm"
                  % (opt, txt, r.width / CM, r.height / CM))
        doc.close()

    print("\n== typst + cetz (the candidate spellings)")
    for name, make in TYP_CASES.items():
        for txt in BODIES:
            src_text = TYP % make(txt)
            with tempfile.TemporaryDirectory() as tmp:
                src = os.path.join(tmp, "c.typ")
                open(src, "w", encoding="utf-8").write(src_text)
                r = subprocess.run(["typst", "compile", src, os.path.join(tmp, "c.pdf")],
                                   capture_output=True)
                if r.returncode:
                    print("   %-12s %-22r  FAILED %s"
                          % (name, txt, re.sub(r"\s+", " ", r.stderr.decode("utf8", "replace"))[:90]))
                    continue
                doc = fitz.open(os.path.join(tmp, "c.pdf"))
                got = biggest(doc[0])
                doc.close()
                if not got:
                    print("   %-12s %-22r  no path found" % (name, txt))
                    continue
                print("   %-12s %-22r  drawn %.4f x %.4f cm"
                      % (name, txt, got[0] / CM, got[1] / CM))


if __name__ == "__main__":
    main()
