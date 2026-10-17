r"""#91's oracle: what a pgf pen key actually prices, read off the page.

Two questions this round must answer with numbers, not with names from the manual:

1. the six pen NAMES pgf defines -- `ultra thin` ... `ultra thick` -- and what they put on the page as a
   stroke width, in the same units the product answers in;
2. whether a width written on the PICTURE's own brackets is a scope default for everything in the
   picture -- paths AND a `\node[draw]` frame -- the way #90 measured for `line cap`/`line join`
   (`_work/measure90_head_on_node.py`), because that decides where the fix goes.

pdflatex draws one rule per case, each at its own y, and fitz reads `get_drawings()`'s `width` for each
path, matched to the case by that y.  No colour trick is needed here: the paths do not overlap, and the
rule's own `width` is what both engines write into the PDF.
"""
import io
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "measure91_run.txt")
NAMES = ["ultra thin", "thin", "semithick", "thick", "very thick", "ultra thick"]
LENGTHS = ["0.4pt", "1pt", "2pt", "0.8mm", "1.5cm", "0.5bp", "1.2in"]
SPECIALS = ["\\pgflinewidth", "2\\pgflinewidth"]


def doc(body):
    return ("\\documentclass[10pt]{article}\n\\usepackage{tikz}\n\\usetikzlibrary{positioning}\n"
            "\\pagestyle{empty}\\begin{document}\n" + body + "\\end{document}\n")


def run(path, tex):
    io.open(path + ".tex", "w", encoding="utf-8").write(tex)
    # a reused case name must not answer with the PREVIOUS case's pdf (the lesson of #43)
    if os.path.exists(path + ".pdf"):
        os.remove(path + ".pdf")
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                        os.path.dirname(path), os.path.basename(path) + ".tex"],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if not os.path.exists(path + ".pdf"):
        sys.stderr.write("pdflatex failed for %s (rc=%s)\n" % (path, r.returncode))
        return None
    return path + ".pdf"


def widths(pdf):
    """[(page index, y of the rule in page pt, stroke width)] for every horizontal single-line path.

    One case per page: a rule's colour or its order on a shared page both have to be *decoded*, and a
    decoded pairing is a hypothesis (axis: 设计实验让仪器自己认得每个量).  The page index is not.
    """
    import fitz
    doc = fitz.open(pdf)
    out = []
    for i, page in enumerate(doc):
        for d in page.get_drawings():
            items = d["items"]
            if len(items) == 1 and items[0][0] == "l":
                p0, p1 = items[0][1], items[0][2]
                if abs(p1.y - p0.y) < 0.01:
                    out.append((i, round(p0.y, 2), d["width"]))
    doc.close()
    return out


def main():
    tmp = tempfile.mkdtemp(prefix="m91_", dir=os.path.join(ROOT, "_work"))
    log = io.open(OUT, "w", encoding="utf-8")

    def say(msg):
        print(msg)
        log.write(msg + "\n")

    say("== A: a statement's own `line width=` (pgf's six names, then lengths, then \\pgflinewidth)")
    cases = [name for name in NAMES] + ["line width=" + x for x in LENGTHS] + \
            ["line width=" + x for x in SPECIALS]
    body = []
    for i, opt in enumerate(cases):
        body.append("\\begin{tikzpicture}\n  \\draw[%s] (0,1) -- (6,1);\n"
                    "\\end{tikzpicture}\n\\newpage" % opt)
    pdf = run(os.path.join(tmp, "a"), doc("".join(body)))
    if pdf is None:
        say("   pdflatex produced nothing for A -- check the names are pgf's own")
        return
    got = {i: (py, w) for i, py, w in widths(pdf)}
    say("   rules read: %d (cases: %d)" % (len(got), len(cases)))
    for i, label in enumerate(cases):
        if i not in got:
            say("   %-28s  NO RULE ON THAT PAGE" % label)
            continue
        y, w = got[i]
        say("   %-28s  y=%-8.2f width=%7.3f pt" % (label, y, w))

    say("")
    say("== B: the SAME width written on the picture's brackets, no statement writes a key")
    body = ["\\begin{tikzpicture}[line width=2pt]",
            "  \\draw (0,1) -- (6,1);                       % plain path",
            "  \\draw[line width=0.4pt] (0,2) -- (6,2);      % statement overrides",
            "  \\node[draw] (n) at (3,3) {X};                 % node frame",
            "  \\node[draw, circle] (c) at (3,4) {Y};         % circle frame",
            "  \\draw (0,5) -- (2,6);                         % slanted rule",
            "\\end{tikzpicture}"]
    pdf = run(os.path.join(tmp, "b"), doc("\n".join(body) + "\n"))
    import fitz
    d = fitz.open(pdf)
    p = d[0]
    for dr in p.get_drawings():
        kinds = "".join(x[0] for x in dr["items"])
        r = dr["rect"]
        say("   items=%-8s width=%7.3f  rect=%s" % (
            kinds, dr["width"], [round(v, 2) for v in (r.x0, r.y0, r.x1, r.y1)]))
    d.close()

    say("")
    say("== C: does an `x=`/`scale=` transform price the pen?  (a length is a page length, per axis 71)")
    for head in ["line width=2pt", "line width=2pt, scale=2", "line width=2pt, x=2cm"]:
        pdf = run(os.path.join(tmp, "c"), doc(
            "\\begin{tikzpicture}[%s]\n  \\draw (0,1) -- (6,1);\n\\end{tikzpicture}\n" % head))
        got = widths(pdf)
        say("   %-28s -> %s" % (head, ["%.3f" % w for _i, _py, w in got]))

    log.close()
    print("log: " + OUT)


if __name__ == "__main__":
    main()
