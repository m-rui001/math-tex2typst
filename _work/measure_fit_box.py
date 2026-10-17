r"""#104: what box does pgf's `fit=` build, and what does a placement read off it?

Found on the page, not in the ledger: `The-Blockwise-Alperin-Weight-Conjecture`'s flowchart is stacked
on top of itself.  Its source writes

    \node[fit=(genus)(lift),inner sep=0pt,outer sep=0pt] (branches) {}
    \node[stage,text width=12cm,below=10mm of branches] (specialization) {...}

and our emitter never reads `fit=`, so `branches` is no name in the table at all -- `below=10mm of
branches` falls back to the scope origin and the third box lands on top of the second.  The corpus face
is small (`_work/probe104c_fit_face.py`: 5 statements / 4 canvases / 4 papers, 4 of them consumed by a
placement), but every one of those four pictures loses a box.

Nothing here is guessed.  Each case asks pgf itself for the anchor positions through
`\pgfpointanchor` + `\pgfgetlastxy` -- measured on the test page: `\pgfgetlastxy` after a plain
`\path (a.north) coordinate (t)` reads 0pt, so it is not the tool, `\pgfpointanchor` is -- and
`\typeout`s them into the log.  The numbers are canvas points; the picture is set `x=y=1cm`, so
dividing by 28.45274 turns them into cm, the unit the corpus writes in.  `north west` ... `south east`
give the rect, `center` is dumped too so a mis-read anchor cannot hide.

The second question is what an ordinary node's default inset is, because that is what `fit=` spends on
top of the union when the author writes no `inner sep`.  The `e*` cases isolate it: `inner sep` written
0pt, then the same node with no font override, then a node with text at all three font tiers.

  sep0      fit=(a)(b) with `inner sep=0pt,outer sep=0pt`   -- is f the union of the two boxes?
  sepdef    the same without writing a sep                  -- what default does fit spend?
  out0      only `outer sep=0pt` written                    -- separates outer from inner
  sep5      `inner sep=5pt`                                 -- does it add to every side?
  xsep      `inner xsep=4mm,inner ysep=8mm` (Kaplan's form)  -- do the two seps price separately?
  one       fit=(a) alone
  points    fit=(p)(q) where p,q are bare `\coordinate`s    -- a point has no box
  atxy      `[fit=(a)(b)] (f) at (0,5) {}`                  -- does the author's `at` survive?
  below     `below=10mm of f`                               -- edge to edge, or centre to centre?
  e0/e      empty `\node` with and without `inner sep=0pt`  -- the default inset, and its outer sep
  enofont   the same in a picture with no `font=`           -- is the inset a font effect?
  etext     empty / `X` / `\small X` nodes                  -- what the inset costs around real text

  PYTHONIOENCODING=utf-8 python _work/measure_fit_box.py 2> _work/mfit_err.txt
      # -> _work/label104_fit_box.txt
"""
import io
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_mfit")
OUT = os.path.join(HERE, "label104_fit_box.txt")
PT = 28.45274  # canvas pt per user unit, since the picture is set x=y=1cm
CORNERS = ["north west", "north east", "south west", "south east", "center"]
SMALL = "x=1cm,y=1cm,font=\\small"
PLAIN = "x=1cm,y=1cm"

HEAD = r"""\documentclass[tikz,border=20pt]{standalone}
\usetikzlibrary{fit,positioning,calc}
\newcommand{\fitdump}[2]{%
  \pgfpointanchor{#1}{#2}%
  \pgfgetlastxy{\fitx}{\fity}%
  \typeout{FIT<#1.#2><\fitx><\fity>}}
\begin{document}
"""
ANCHORS = (r"  \node[text width=2cm,align=center] (a) at (0,0) {first box words here};" "\n"
           r"  \node[text width=2cm,align=center] (b) at (3.2,2.4) {second box};" "\n"
           r"  \coordinate (p) at (-1,-1);" "\n"
           r"  \coordinate (q) at (4,3);" "\n")

# name: (picture options, pre-body statements, the case statement, nodes to dump)
CASES = [
    ("sep0", SMALL, "", r"\node[fit=(a)(b),inner sep=0pt,outer sep=0pt] (f) {};", ["a", "b", "f"]),
    ("sepdef", SMALL, "", r"\node[fit=(a)(b)] (f) {};", ["a", "b", "f"]),
    ("out0", SMALL, "", r"\node[fit=(a)(b),outer sep=0pt] (f) {};", ["a", "b", "f"]),
    ("sep5", SMALL, "", r"\node[fit=(a)(b),inner sep=5pt] (f) {};", ["a", "b", "f"]),
    ("xsep", SMALL, "",
     r"\node[fit=(a)(b),inner xsep=4mm,inner ysep=8mm,outer sep=0pt] (f) {};", ["a", "b", "f"]),
    ("one", SMALL, "", r"\node[fit=(a),inner sep=0pt] (f) {};", ["a", "f"]),
    ("points", SMALL, "", r"\node[fit=(p)(q),inner sep=0pt] (f) {};", ["p", "q", "f"]),
    ("atxy", SMALL, "", r"\node[fit=(a)(b),inner sep=0pt] (f) at (0,5) {};", ["a", "b", "f"]),
    ("below", SMALL, "", r"\node[fit=(a)(b),inner sep=0pt,outer sep=0pt] (f) {};"
                         r"\node[below=10mm of f,text width=2cm,align=center] (g) {below the fit};",
     ["f", "g"]),
    ("e", SMALL, "", r"\node (e) {};", ["e"]),
    ("e0", SMALL, "", r"\node[inner sep=0pt] (e0) {};", ["e0"]),
    ("e0out", SMALL, "", r"\node[inner sep=0pt,outer sep=0pt] (e0o) {};", ["e0o"]),
    ("enofont", PLAIN, "", r"\node (en) {};", ["en"]),
    ("eplain0", PLAIN, "", r"\node[inner sep=0pt,outer sep=0pt] (ep0) {};", ["ep0"]),
    ("etext", SMALL, r"\node (w) {X};" "\n" r"\node[inner sep=0pt] (w0) {X};" "\n"
                     r"\node (big) {\Large X};" "\n",
     "", ["w", "w0", "big"]),
]


def run(name, opts, pre, stmt, nodes):
    # every case is measured on the same four references standing in the same picture, so a case
    # that names only `f` and `g` still has the nodes `f` gathers
    dumps = [(nd, anc) for nd in nodes for anc in CORNERS]
    tex = (HEAD + "\\begin{tikzpicture}[" + opts + "]\n" + ANCHORS + pre + stmt + "\n"
           + "".join("\\fitdump{%s}{%s}\n" % d for d in dumps) + "\\end{tikzpicture}\n\\end{document}\n")
    os.makedirs(TMP, exist_ok=True)
    stem = os.path.join(TMP, "fit_" + name)
    io.open(stem + ".tex", "w", encoding="utf-8").write(tex)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                    "-output-directory", TMP, stem + ".tex"],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    log = io.open(stem + ".log", encoding="utf-8", errors="replace").read()
    out = {}
    # \typeout wraps at the terminal width, and a broken line carries no marker of its
    # own, so rejoin the log by deleting the newlines rather than guessing where they fall.
    for m in re.finditer(r"FIT<([^<>]+)><(-?[\d.]+)pt><(-?[\d.]+)pt>", log.replace("\n", "")):
        out[m.group(1)] = (float(m.group(2)) / PT, float(m.group(3)) / PT)
    return out


def box(got, node):
    """The rect pgf gives this node, in cm, plus the inset it spent over its text."""
    nw, ne = got.get(node + ".north west"), got.get(node + ".north east")
    sw, se = got.get(node + ".south west"), got.get(node + ".south east")
    if not all((nw, ne, sw, se)):
        return "NOT DUMPED"
    return ("x [%+.4f, %+.4f]  y [%+.4f, %+.4f]  size %.4f x %.4f  centre (%+.4f, %+.4f)"
            % (sw[0], ne[0], sw[1], nw[1], ne[0] - sw[0], nw[1] - sw[1],
               (sw[0] + ne[0]) / 2, (sw[1] + nw[1]) / 2))


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    lines = ["#104 pgf's `fit=` box, in cm at x=y=1cm (a=(0,0) and b=(3.2,2.4) are 2cm-wide",
             "     `text width` nodes, p=(-1,-1) and q=(4,3) are bare `\\coordinate`s):"]
    for name, opts, pre, stmt, nodes in CASES:
        got = run(name, opts, pre, stmt, nodes)
        lines.append("\n== %-8s [%s]  %s%s" % (name, opts, pre.replace(";\n", "; "), stmt))
        for nd in nodes:
            lines.append("   %-4s %s" % (nd, box(got, nd)))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
