r"""#63: what makes CeTz's `south` land the drawn box on its point?

The library wraps a content body in `text(top-edge: "cap-height", bottom-edge: "baseline")` and sizes the
block by `measure(cap -> baseline) + (measure(cap -> bounds) - measure(cap -> baseline))`, so the block is
taller than the box it draws and `south` names the block's bottom, not the box's.

The spellings measured here are the ones the converter emits, not hand-written ones: a picture of two gray
rulers crossing at the node's point is run through `cetz.build` (and the same statements through the old
body law, by monkeypatching `_box_body`), and fitz reads the drawn rectangle relative to that crossing.
A `south` that works reads y1 = 0; pgf's control sits at -0.20, which is half the 0.4pt stroke.  Two
things have to hold for the fix to be admissible: the rectangle keeps the height it draws today, and the
descender of `Abg` stays inside the frame rather than crossing its bottom rule.
"""
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))

PGF = r"""\documentclass[tikz,border=10pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
  \draw[gray] (0,0) -- (4,0);
  \draw[gray] (2,-2) -- (2,2);
  \node[%s] (a) at (2, 0) {%s};
\end{tikzpicture}
\end{document}
"""

RULERS = (r"\draw[gray] (0,0) -- (4,0); \draw[gray] (2,-2) -- (2,2);")

# label, the options the author writes, his label, and what TeX has to be told ON TOP of those options
# (a multi-line label is centred by `align=` in TeX and by the body's own `#align(center)` here)
CASES = [
    ("plain south", "draw, anchor=south", "Abg", ""),
    ("plain north", "draw, anchor=north", "Abg", ""),
    ("plain centre", "draw", "Abg", ""),
    ("rows south", r"draw, anchor=south", r"A\\B\\C\\D", "align=center"),
    ("small south", "draw, anchor=south, font=\\small", "Abg", ""),
    ("wrap south", "draw, anchor=south, text width=2.5cm",
     "some words that have to wrap inside the frame", ""),
    ("wrap centre", "draw, text width=2.5cm",
     "some words that have to wrap inside the frame", ""),
    ("math south", "draw, anchor=south", "$x_i^2$", ""),
    ("fill south", "fill=white, anchor=south", "Abg", ""),
    ("declared south", "draw, minimum size=1cm, anchor=south", "Abg", ""),
]


def canvas(extra, label):
    built = cetz.build(r"\begin{tikzpicture}" + RULERS + r"\node[" + extra
                       + r"] at (2,0) {" + label + r"};\end{tikzpicture}")
    return cetz.HEADER + built if built else ""


def old_box_body(text, align, horizon=False):
    if horizon:
        inner = "#align(%s + horizon)[%s]" % (align or "left", text)
        return "[#set text(hyphenate: false); %s]" % inner
    inner = "#align(%s)[%s]" % (align, text) if align else text
    return "[#set text(hyphenate: false); %s]" % inner


def compile_typst(dirpath, name, src):
    path = os.path.join(dirpath, name + ".typ")
    open(path, "w", encoding="utf-8").write(src)
    pdf = os.path.join(dirpath, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    err = subprocess.run(["typst", "compile", path, pdf], cwd=dirpath,
                         capture_output=True).stderr
    if not os.path.exists(pdf):
        print("!! typst failed: %s" % err.decode("utf-8", "replace")[:300])
        return None
    return pdf


def compile_pgf(dirpath, name, key, text):
    path = os.path.join(dirpath, name + ".tex")
    open(path, "w", encoding="utf-8").write(PGF % (key, text))
    pdf = os.path.join(dirpath, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                   cwd=dirpath, capture_output=True)
    return pdf if os.path.exists(pdf) else None


def read(pdf):
    """The node rectangle and the words' ink band, relative to the ruler crossing."""
    if pdf is None:
        return None
    doc = fitz.open(pdf)
    page = doc[0]
    rects, ry, rx = [], None, None
    for d in page.get_drawings():
        for it in d["items"]:
            if it[0] == "l":
                if abs(it[1].x - it[2].x) < 1e-6:
                    rx = it[1].x
                else:
                    ry = (it[1].y + it[2].y) / 2
            elif it[0] == "re":
                rects.append(it[1])
    # every case here is framed by Typst's `box`, which strokes a `re` item; a CeTz `frame: "rect"` is a
    # line-strip and would need the ruler's own rectangle excluded first, which is why no case asks.
    if ry is None or rx is None or not rects:
        doc.close()
        return None
    r = max(rects, key=lambda b: b.width * b.height)
    ink = [b for blk in page.get_text("dict")["blocks"] for l in blk.get("lines", [])
           for b in [l["bbox"]] if b[1] > r.y0 - 2 and b[3] < r.y1 + 2]
    doc.close()
    band = (min(b[1] for b in ink) - ry, max(b[3] for b in ink) - ry) if ink else None
    return (r.x0 - rx, r.x1 - rx, r.y0 - ry, r.y1 - ry, r.height, band)


def show(got):
    if got is None:
        return " " * 35 + "none"
    band = ("%+6.2f %+6.2f]" % got[5]) if got[5] else "  none   ]"
    return ("x[%+6.2f %+6.2f] y[%+6.2f %+6.2f] h=%5.2f ink[" % got[:5] + band)


def main():
    tmp = os.path.join(HERE, "_ab")
    os.makedirs(tmp, exist_ok=True)
    new = cetz._box_body
    for label, extra, text, suffix in CASES:
        key = extra + (", " + suffix if suffix else "")
        slug = label.replace(" ", "_")
        print("%-14s %s" % ("pgf " + label,
                            show(read(compile_pgf(tmp, "pgf_" + slug, key, text)))))
        rows = []
        for tag, fn in (("old", old_box_body), ("new", new)):
            cetz._box_body = fn
            body = canvas(extra, text)
            got = read(compile_typst(tmp, "typ_" + tag + "_" + slug, body)) if body else None
            rows.append((tag, body, got))
        cetz._box_body = new
        for tag, _, got in rows:
            print("%-14s %s" % ("typ %s" % tag, show(got)))
        if rows[0][2] and rows[1][2] and rows[0][2][4] != rows[1][2][4]:
            print("               !! height changed %.2f -> %.2f"
                  % (rows[0][2][4], rows[1][2][4]))
        kept = [l.strip() for l in (rows[1][1] or "").splitlines() if "content(" in l]
        print("               %s" % (kept[-1][:230] if kept else ""))


if __name__ == "__main__":
    main()
