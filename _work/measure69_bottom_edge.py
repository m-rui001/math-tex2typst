r"""#69: what has to change so a math body's box covers its own descender?

The reading that opened this (run125, re-taken at run131 in `_work/anchor_edge_run131.txt`):
`$x_i^2$` in a `draw` node with no declared size draws h=14.85 bp while pgf's same node is 17.34,
and the subscript's ink reaches +0.62 bp PAST the box's bottom rule.  The box is sized by Typst's
own measurement of the body, and #63 pinned that measurement with
`#set text(top-edge: "cap-height", bottom-edge: "baseline")` -- baseline is exactly where a
subscript stops being counted.

This probe does not rewrite the converter: it takes the canvas `cetz.build` emits today and
substitutes candidate values for the two edges, then reads, relative to the ruler crossing, the
drawn rectangle, where `south` lands, and the ink band.  A candidate is admissible when
(a) `south` still reads y1 = 0, (b) the ink band stays inside the rectangle, and (c) the height
comes out at or near pgf's.  pgf is compiled for the same label so every row has its own control.
"""
import os
import re
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
  \node[draw, anchor=south] (a) at (2, 0) {%s};
\end{tikzpicture}
\end{document}
"""

RULERS = r"\draw[gray] (0,0) -- (4,0); \draw[gray] (2,-2) -- (2,2);"

LABELS = [
    ("sub", r"$x_i^2$"),
    ("deep", r"$y_{i,1}$"),
    ("frac", r"$\frac{a}{b}$"),
    ("both", r"$f_\alpha^{(k)}$"),
    ("plain", r"$n+1$"),
    ("paren", r"$\left( a_i \right)$"),
    ("sum", r"$\sum_{k=1}^{n} k$"),
    ("mix", r"node $x_i^2$ here"),
    ("rows", r"$A_1$\\$B_2$"),
    ("text", "Abg"),
]

CANDIDATES = [
    ("as emitted", None, None),
    ("bot=descender", 'bottom-edge: "baseline"', 'bottom-edge: "descender"'),
    ("bot=bounds", 'bottom-edge: "baseline"', 'bottom-edge: "bounds"'),
    ("top=ascender", 'top-edge: "cap-height"', 'top-edge: "ascender"'),
    ("top=bounds", 'top-edge: "cap-height"', 'top-edge: "bounds"'),
    ("both=asc-desc", 'top-edge: "cap-height", bottom-edge: "baseline"',
     'top-edge: "ascender", bottom-edge: "descender"'),
    ("both=bounds", 'top-edge: "cap-height", bottom-edge: "baseline"',
     'top-edge: "bounds", bottom-edge: "bounds"'),
    # the two below are keyed on the pair the product emits NOW (bounds/bounds for a math body), so a
    # run after the fix measures them and reports SPELLING GONE for the five above; `ascender` on top
    # is the one constant that cannot be shorter than the ink, which `bounds` can be (`$y_{i,1}$`
    # measures 16.40 under bounds/bounds and still leaves 0.34bp over the top rule).
    ("asc-top+bounds", 'top-edge: "bounds", bottom-edge: "bounds"',
     'top-edge: "ascender", bottom-edge: "bounds"'),
    ("asc-top+desc", 'top-edge: "bounds", bottom-edge: "bounds"',
     'top-edge: "ascender", bottom-edge: "descender"'),
]


def built(label, key="draw, anchor=south"):
    return cetz.HEADER + cetz.build(r"\begin{tikzpicture}" + RULERS
                                    + r"\node[" + key + r"] at (2,0) {" + label
                                    + r"};\end{tikzpicture}")


def compile_run(dirpath, name, src, tex=False):
    ext = "tex" if tex else "typ"
    path = os.path.join(dirpath, name + "." + ext)
    open(path, "w", encoding="utf-8").write(src)
    pdf = os.path.join(dirpath, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    if tex:
        subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                       cwd=dirpath, capture_output=True)
    else:
        err = subprocess.run(["typst", "compile", path, pdf], cwd=dirpath, capture_output=True)
        if not os.path.exists(pdf):
            print("        !! typst: %s" % err.stderr.decode("utf-8", "replace")[:200])
    return pdf if os.path.exists(pdf) else None


def read(pdf):
    if pdf is None:
        return None
    doc = fitz.open(pdf)
    page = doc[0]
    rects, ry, rx = [], None, None
    ry_len = rx_len = -1.0
    for d in page.get_drawings():
        for it in d["items"]:
            if it[0] == "l":
                p, q = it[1], it[2]
                if abs(p.x - q.x) < 1e-6:
                    # The ruler is the LONGEST line of its direction, not the last one drawn: a
                    # fraction bar and a radical's vinculum are horizontal rules of the body itself,
                    # and taking ry in drawing order made `$\frac{a}{b}$` and `$\sqrt{n(p,0)}$` read
                    # the same y0/y1 for south, north, west and no anchor -- "anchor dead" in typst
                    # AND in the pgf control, where the anchor demonstrably works.  Both readings
                    # were the bar's own height inside the box, not the box's place on the ruler.
                    if abs(q.y - p.y) > rx_len:
                        rx, rx_len = p.x, abs(q.y - p.y)
                else:
                    if abs(q.x - p.x) > ry_len:
                        ry, ry_len = (p.y + q.y) / 2, abs(q.x - p.x)
            elif it[0] == "re":
                rects.append(it[1])
    if ry is None or rx is None or not rects:
        doc.close()
        return None
    r = max(rects, key=lambda b: b.width * b.height)
    band = None
    for blk in page.get_text("dict")["blocks"]:
        for l in blk.get("lines", []):
            b = fitz.Rect(l["bbox"])
            if (b.x0 + b.x1) / 2 > r.x0 - 1 and (b.x0 + b.x1) / 2 < r.x1 + 1:
                top, bot = b.y0 - ry, b.y1 - ry
                band = (top, bot) if band is None else (min(band[0], top), max(band[1], bot))
    doc.close()
    # escape: how far the ink hangs outside the drawn rectangle (positive = outside)
    esc = None
    if band:
        esc = max(r.y0 - (band[0] + ry), (band[1] + ry) - r.y1, 0.0)
    return (r.height, r.y0 - ry, r.y1 - ry, esc, band)


def show(got):
    if got is None:
        return "%35s none" % ""
    h, _, south, esc, band = got
    return ("h=%6.2f  south_y1=%+5.2f  escape=%+5.2f  ink[%+6.2f %+6.2f]"
            % (h, south, esc if esc is not None else -99, band[0], band[1]))


def anchor_show(got):
    if got is None:
        return "%45s none" % ""
    h, north, south, esc, band = got
    return ("h=%6.2f  y0=%+6.2f y1=%+6.2f  escape=%+5.2f" % (h, north, south,
                                                             esc if esc is not None else -99))


def main():
    tmp = os.path.join(HERE, "_69")
    os.makedirs(tmp, exist_ok=True)
    for slug, label in LABELS:
        src = built(label)
        if not src:
            print("%-6s build refused" % slug)
            continue
        print("%-6s pgf        %s" % (slug, show(read(compile_run(
            tmp, "pgf_" + slug, PGF % label, tex=True)))))
        for tag, old, new in CANDIDATES:
            if old is None:
                body = src
            elif old not in src:
                print("  %-14s SPELLING GONE (product no longer emits it)" % tag)
                continue
            else:
                body = src.replace(old, new)
            print("  %-14s %s" % (tag, show(read(compile_run(
                tmp, "t69_%s_%s" % (slug, re.sub(r"\W+", "_", tag)), body)))))

    # The chosen edges have to keep #63's anchor law: `south` still names the drawn box's bottom
    # rule, `north` its top, and no anchor leaves the box centred on the point.
    print("\n--- anchor law (which point the box hangs on) ---")
    OLD = 'top-edge: "cap-height", bottom-edge: "baseline"'
    for label in (r"$x_i^2$", r"$\frac{a}{b}$", "Abg"):
        for key in ("draw, anchor=south", "draw, anchor=north", "draw"):
            for tag, sub in (("emitted", None), ("bounds", OLD),):
                src = built(label, key)
                if not src:
                    print("  %-24s %s build refused" % (key, label))
                    continue
                body = src if sub is None else src.replace(
                    sub, 'top-edge: "bounds", bottom-edge: "bounds"')
                if sub is not None and sub not in src:
                    print("  %-24s %s SPELLING GONE" % (key, tag))
                    continue
                got = read(compile_run(tmp, "t69a_%s_%s_%s"
                                       % (re.sub(r"\W+", "", label), key.split(", ")[-1], tag),
                                       body))
                print("  %-11s %-16s %-8s %s" % (label[:11], key.split(", ")[-1], tag,
                                                 anchor_show(got)))


if __name__ == "__main__":
    main()
