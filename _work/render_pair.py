"""Render one picture of one paper twice: pdflatex as the control, Typst as the candidate.

The foreach unroller now accepts statement-form loop bodies (`\foreach \i in {...} \foreach \j in
{...} {...}`), so four pictures moved from refused to drawn.  A build is not a drawing: this copies
the picture verbatim out of the flat source into a standalone document, compiles it with TeXLive,
and rasterizes both that PDF and the generated Typst PDF so the two can be compared by eye.
The typst side is only read, never invoked, so this stays safe next to a batch.
"""
import pathlib
import re
import subprocess
import sys

import pymupdf

ROOT = pathlib.Path(__file__).resolve().parents[1]
TAG = sys.argv[1]
PAPER = sorted(pathlib.Path(str(ROOT / "_work/flat")).glob(sys.argv[2] + ".tex"))
if not PAPER:
    sys.exit("no flat file matches %s" % sys.argv[2])
PAPER = PAPER[0]
INDEX = int(sys.argv[3])
src = PAPER.read_text(encoding="utf-8", errors="replace")
# a figure's own colours are declared in the `figure` environment, not in the preamble the flat file
# keeps, so a control cut from the picture alone answers "Undefined color" and the reference page is
# the blank one; every \definecolor the paper declares goes into the standalone preamble
COLORS = "".join(l + "\n" for l in re.findall(r"\\definecolor\{[^{}]*\}\{[^{}]*\}\{[^{}]*\}", src))
PRELUDE = (r"\documentclass[tikz,border=6pt]{standalone}" "\n"
           r"\usepackage{tikz}" "\n"
           # `positioning` is not optional here: without it the control's own `below=6mm of up`
           # answers "Unknown operator `o' or `of'" and stacks every node on the origin, so the
           # picture that is supposed to be the reference looks more broken than the candidate.
           r"\usetikzlibrary{patterns,arrows.meta,calc,decorations.markings,positioning}" "\n"
           + COLORS +
           r"\begin{document}" "\n")

pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", src, re.S)
print("pictures in %s: %d" % (PAPER.name, len(pics)))
pic = pics[INDEX]
out = ROOT / "_work"
tex = out / ("fig_%s.tex" % TAG)
tex.write_text(PRELUDE + pic + "\n\\end{document}\n", encoding="utf-8")
r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                    str(out), str(tex)], capture_output=True, text=True, cwd=str(ROOT))
errors = [l for l in (r.stdout + r.stderr).splitlines() if l.startswith("!")]
print("pdflatex rc=%d %s" % (r.returncode, errors[:2]))

pdf = out / ("fig_%s.pdf" % TAG)
if pdf.exists():
    page = pymupdf.open(str(pdf))[0]
    page.get_pixmap(dpi=170).save(str(out / ("latex_%s.png" % TAG)))
    print("latex ->", out / ("latex_%s.png" % TAG))

typst_pdf = ROOT / "typst" / PAPER.stem / "main.pdf"
doc = pymupdf.open(str(typst_pdf))
for n in range(len(doc)):
    doc[n].get_pixmap(dpi=170).save(str(out / ("typst_%s_p%d.png" % (TAG, n + 1))))
print("typst pages ->", len(doc), "at", typst_pdf.parent.name)
