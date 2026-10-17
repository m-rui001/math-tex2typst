r"""#52 oracle: which modes do `\path`, `\draw`, `\fill`, `\filldraw` turn on, and how thick is the rule?

The converter decides a path's `stroke:` from the verb alone (`bare=verb != "fill"`), so a bare
`\path` gets a line (#48's face: 16 papers write `\path` statements) and every `\fill` shape arrives
on the page wearing CeTz's default 1pt black rule (#52's face: 3,004 shapes over 293 papers, seen as
black rings around the red dots of `A-projective-fourfold…` fig 2 in `_work/render_pair.py`).  Both
are the same question -- which of pgf's two modes, stroke and fill, does this statement turn on, and
what does an unstated rule weigh -- so it is measured once, here: one statement per page, pdflatex,
read back with fitz for the colour AND THE WIDTH of every stroked path and the colour of every fill.
"""
import os
import subprocess
import sys

import fitz

OUT = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(OUT, "pathmode")

LINE = r"(0,0) -- (2,0);"
DOT = r"(0,0) circle (4pt);"
BOX = r"(0,0) rectangle (2,1);"

CASES = [
    ("\\path" + LINE, r"\path " + LINE),
    ("\\path[red]" + LINE, r"\path[red] " + LINE),
    ("\\path[->]" + LINE, r"\path[->] " + LINE),
    ("\\path[red,->]" + LINE, r"\path[red,->] " + LINE),
    ("\\path[draw]" + LINE, r"\path[draw] " + LINE),
    ("\\path[draw=red]" + LINE, r"\path[draw=red] " + LINE),
    ("\\draw" + LINE, r"\draw " + LINE),
    ("\\draw[red]" + LINE, r"\draw[red] " + LINE),
    ("\\draw[->]" + LINE, r"\draw[->] " + LINE),
    ("\\draw[draw=none]" + LINE, r"\draw[draw=none] " + LINE),
    ("\\path" + DOT, r"\path " + DOT),
    ("\\path[fill=red]" + DOT, r"\path[fill=red] " + DOT),
    ("\\path[draw,fill=red]" + DOT, r"\path[draw,fill=red] " + DOT),
    ("\\fill[red]" + DOT, r"\fill[red] " + DOT),
    ("\\fill" + BOX, r"\fill " + BOX),
    ("\\draw[fill=red]" + BOX, r"\draw[fill=red] " + BOX),
    ("\\filldraw[red]" + DOT, r"\filldraw[red] " + DOT),
    ("\\draw[red,line width=2pt]" + LINE, r"\draw[red,line width=2pt] " + LINE),
]

HEAD = r"""\documentclass[12pt]{article}
\usepackage{tikz}
\pagestyle{empty}
\begin{document}
"""


def main():
    os.makedirs(TMP, exist_ok=True)
    body = [HEAD]
    for k, (_, raw) in enumerate(CASES):
        if k:
            body.append("\\newpage\n")
        body.append("\\begin{tikzpicture}[x=1cm,y=1cm]\n%s\n\\end{tikzpicture}\n" % raw)
    body.append("\\end{document}\n")
    tex = os.path.join(TMP, "pathmode.tex")
    with open(tex, "w", encoding="utf-8") as f:
        f.write("".join(body))
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "pathmode.tex"], cwd=TMP,
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                       encoding="utf-8", errors="replace")
    pdf = os.path.join(TMP, "pathmode.pdf")
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    if not os.path.exists(pdf):
        print("pdflatex failed rc=%s\n%s" % (r.returncode, (r.stdout or "")[-2000:]))
        return

    def hx(c):
        if c is None:
            return None
        if isinstance(c, (int, float)):
            return "#%06x" % int(c)
        if len(c) == 3:
            return "#%02x%02x%02x" % tuple(int(round(255 * v)) for v in c)
        return str(c)

    doc = fitz.open(pdf)
    print("pages=%d cases=%d" % (len(doc), len(CASES)))
    for i, (name, _) in enumerate(CASES):
        if i >= len(doc):
            print("%2d %-40s [no page]" % (i, name))
            continue
        strokes, fills = [], []
        for d in doc[i].get_drawings():
            c, f = hx(d.get("color")), hx(d.get("fill"))
            if c:
                strokes.append("%s/%.3gpt" % (c, d.get("width") or 0))
            if f:
                fills.append(f)
        print("%2d %-40s stroke=%-28s fill=%s"
              % (i, name, ",".join(sorted(set(strokes))) or "-",
                 ",".join(sorted(set(fills))) or "-"))
    doc.close()


if __name__ == "__main__":
    main()
