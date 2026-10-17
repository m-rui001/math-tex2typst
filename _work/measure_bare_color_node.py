"""#50 oracle: what does a bare colour key on a TikZ node actually paint?

One tikzpicture per page, compiled with pdflatex, read back with fitz.  For each page
we report the colour of the *text spans* and the colour of every *stroke* and *fill*
path, so the pgf law is read off the PDF rather than guessed from the manual.
"""
import os
import subprocess
import sys

import fitz

OUT = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(OUT, "barecolor")

CASES = [
    ("bare only            \\node[blue]{ab}",              r"\node (n) at (0,0) [blue] {ab};"),
    ("bare + draw          \\node[blue,draw]{ab}",         r"\node (n) at (0,0) [blue,draw] {ab};"),
    ("draw + bare          \\node[draw,blue]{ab}",         r"\node (n) at (0,0) [draw,blue] {ab};"),
    ("bare + draw=red      \\node[blue,draw=red]{ab}",     r"\node (n) at (0,0) [blue,draw=red] {ab};"),
    ("bare + fill=white    \\node[blue,fill=white]{ab}",   r"\node (n) at (0,0) [blue,fill=white] {ab};"),
    ("bare + fill=red      \\node[blue,fill=red]{ab}",     r"\node (n) at (0,0) [blue,fill=red] {ab};"),
    ("bare + fill (no val) \\node[blue,fill]{ab}",         r"\node (n) at (0,0) [blue,fill] {ab};"),
    ("draw=red only        \\node[draw=red]{ab}",          r"\node (n) at (0,0) [draw=red] {ab};"),
    ("fill=red only        \\node[fill=red]{ab}",          r"\node (n) at (0,0) [fill=red] {ab};"),
    ("text=red only        \\node[text=red]{ab}",          r"\node (n) at (0,0) [text=red] {ab};"),
    ("general colour       \\node{ab} in \\color{red}",    r"BODY"),
    ("bare green           \\node[green]{ab}",             r"\node (n) at (0,0) [green] {ab};"),
    ("bare + rounded       \\node[blue,rounded corners]{ab}", r"\node (n) at (0,0) [blue,rounded corners] {ab};"),
    ("draw=+bare empty     \\node[blue,draw=]{ab}",        r"\node (n) at (0,0) [blue,draw=] {ab};"),
    # second round: is `color=` the same general colour as a bare key, and does a bare key still ink
    # the text when a frame sits on the same node?
    ("color=blue           \\node[color=blue]{ab}",        r"\node (n) at (0,0) [color=blue] {ab};"),
    ("color=blue + draw    \\node[color=blue,draw]{ab}",   r"\node (n) at (0,0) [color=blue,draw] {ab};"),
    ("color=blue + fill    \\node[color=blue,fill=white]{ab}", r"\node (n) at (0,0) [color=blue,fill=white] {ab};"),
    ("blue + draw + fill   \\node[blue,draw,fill=white]{ab}", r"\node (n) at (0,0) [blue,draw,fill=white] {ab};"),
    ("blue + text=red      \\node[blue,text=red]{ab}",     r"\node (n) at (0,0) [blue,text=red] {ab};"),
    ("blue+fill+text=red   \\node[blue,fill=white,text=red]{ab}", r"\node (n) at (0,0) [blue,fill=white,text=red] {ab};"),
    ("red!50 bare          \\node[red!50]{ab}",            r"\node (n) at (0,0) [red!50] {ab};"),
    ("red!50 + fill=white  \\node[red!50,fill=white]{ab}", r"\node (n) at (0,0) [red!50,fill=white] {ab};"),
    ("blue+fill+sized      \\node[blue,fill=white,minimum width=1cm]{ab}",
     r"\node (n) at (0,0) [blue,fill=white,minimum width=1cm] {ab};"),
    ("draw, general red    {\\color{red}\\node[draw]{ab}}", "BODY2"),
    ("fill, general blue   {\\color{blue}\\node[fill]{ab}}", "BODY3"),
    # does `text=` join the general colour that a valueless draw/fill picks up, or is it text-only?
    ("text=red + draw      \\node[text=red,draw]{ab}",     r"\node (n) at (0,0) [text=red,draw] {ab};"),
    ("text=red + fill      \\node[text=red,fill]{ab}",     r"\node (n) at (0,0) [text=red,fill] {ab};"),
    ("blue+text=red+draw   \\node[blue,text=red,draw]{ab}", r"\node (n) at (0,0) [blue,text=red,draw] {ab};"),
    ("text=red + draw=blue \\node[text=red,draw=blue]{ab}", r"\node (n) at (0,0) [text=red,draw=blue] {ab};"),
    # does draw=none cancel a border that a bare colour would otherwise have painted?
    ("blue + draw=none     \\node[blue,draw=none]{ab}",    r"\node (n) at (0,0) [blue,draw=none] {ab};"),
    ("blue+fill+draw=none  \\node[blue,fill=red,draw=none]{ab}", r"\node (n) at (0,0) [blue,fill=red,draw=none] {ab};"),
    ("blue + fill= (empty) \\node[blue,fill=]{ab}",        r"\node (n) at (0,0) [blue,fill=] {ab};"),
    ("circle+fill, no draw \\node[circle,fill=red]{ab}",   r"\node (n) at (0,0) [circle,fill=red] {ab};"),
    ("rect+fill, no draw   \\node[rectangle,fill=red]{ab}", r"\node (n) at (0,0) [rectangle,fill=red] {ab};"),
]


HEAD = r"""\documentclass[12pt]{article}
\usepackage{tikz}
\pagestyle{empty}
\begin{document}
"""

BODIES = {
    "BODY": r"{\color{red}\node (n) at (0,0) {ab};}" + "\n",
    "BODY2": r"{\color{red}\node (n) at (0,0) [draw] {ab};}" + "\n",
    "BODY3": r"{\color{blue}\node (n) at (0,0) [fill] {ab};}" + "\n",
}


def pic_for(body):
    body = BODIES.get(body, body)
    return "\\begin{tikzpicture}\n%s\\end{tikzpicture}\n" % body


def main():
    os.makedirs(TMP, exist_ok=True)
    body = [HEAD]
    for k, (name, raw) in enumerate(CASES):
        if k:
            body.append("\\newpage\n")
        body.append(pic_for(raw))
    body.append("\\end{document}\n")
    src = "".join(body)
    tex = os.path.join(TMP, "barecolor.tex")
    with open(tex, "w", encoding="utf-8") as f:
        f.write(src)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "barecolor.tex"], cwd=TMP,
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                       encoding="utf-8", errors="replace")
    pdf = os.path.join(TMP, "barecolor.pdf")
    if not os.path.exists(pdf):
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
        print("pdflatex failed rc=%s" % r.returncode)
        print((r.stdout or "")[-3000:])
        return
    doc = fitz.open(pdf)
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    print("pages=%d cases=%d" % (len(doc), len(CASES)))

    def hx(c):
        if c is None:
            return None
        if isinstance(c, (int, float)):
            return "#%06x" % int(c)
        if len(c) == 3:
            return "#%02x%02x%02x" % tuple(int(round(255 * v)) for v in c)
        return str(c)

    for i, (name, body) in enumerate(CASES):
        if i >= len(doc):
            print("%2d %-45s  [no page]" % (i, name))
            continue
        page = doc[i]
        texts = []
        for blk in page.get_text("dict")["blocks"]:
            for ln in blk.get("lines", []):
                for sp in ln.get("spans", []):
                    if sp["text"].strip():
                        texts.append((sp["text"].strip(), hx(sp["color"])))
        strokes, fills = [], []
        for d in page.get_drawings():
            c = hx(d.get("color"))
            f = hx(d.get("fill"))
            if c:
                strokes.append(c)
            if f:
                fills.append(f)
        print("%2d %-45s text=%s stroke=%s fill=%s"
              % (i, name, texts, sorted(set(strokes)) or "-", sorted(set(fills)) or "-"))
    doc.close()


if __name__ == "__main__":
    main()
