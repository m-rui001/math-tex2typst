r"""What does a real tikz-cd `column sep` / `row sep` value become on the page?

`cd_gap` answers three names (`CD_SIZE = {tiny, small, large}`) and everything else silently falls
back to the default -- so the corpus's `column sep=huge` (4 pics / 4 papers), `column sep=8em`
(`Global-quantum…#0`), `2em`, `3.2cm` and `row sep=4em` all draw at 2.6cm.  That fallback is the
mechanism behind the one exchange-diagram collision the verified face still carries: the label over
that gap is 90pt wide against a 73.7pt column distance.

Two things have to be read before `cd_gap` grows a table: how much does the value separate *cell
centres*, and is it a centre distance or an edge-to-edge gap (i.e. does a wide cell push its
neighbour further)?  Same diagram, narrow cells and wide cells, one number each, at 11pt -- every
class the corpus's tikzcd papers use is 11pt (`probe88c`), so one class is enough to read the law.

  python _work/probe90_cd_sep_law.py
  python _work/probe90_cd_sep_law.py pdf     # keep the pages for a look

Prints, per value: the centre distance for narrow cells and for wide cells, the two cells' own ink
widths, and the implied edge-to-edge gap.
"""
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TMP = os.path.join(WORK, "_m90")

DOC = ("\\documentclass[%dpt,border=6pt]{standalone}\n\\usepackage{tikz-cd}\n\\begin{document}\n"
       "%s\n\\end{document}\n")
NARROW = ("A", "B")
WIDE = ("ABCDEFGHIJ", "KLMNOPQR")
VALUES = [None, "tiny", "scriptsize", "small", "normal", "large", "huge",
          "1cm", "2em", "3.2cm", "4em", "8em"]
PT_CM = 28.3465


def opt(key, val):
    if val is None:
        return ""
    return "[%s sep=%s]" % (key, val)


def body(key, val, cells):
    c1, c2 = cells
    if key == "column":
        return "\\begin{tikzcd}%s\n%s & %s\n\\end{tikzcd}" % (opt(key, val), c1, c2)
    return "\\begin{tikzcd}%s\n%s \\\\\n%s\n\\end{tikzcd}" % (opt(key, val), c1, c2)


def compile_page(name, src, cls):
    os.makedirs(TMP, exist_ok=True)
    tex = os.path.join(TMP, name + ".tex")
    open(tex, "w", encoding="utf-8").write(DOC % (cls, src))
    proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP, tex],
                          capture_output=True, cwd=TMP, text=True, errors="replace")
    # a value tikz-cd does not know is an error, not a silent default: reading the page anyway would
    # score the fallback of a package that refused to draw it
    if re.search(r"^! ", proc.stdout, re.M):
        return None
    pdf = os.path.join(TMP, name + ".pdf")
    return pdf if os.path.exists(pdf) else None


def spans(pdf, tags):
    """(x0, x1, y0, y1, w, h) per tag, in pt, matched on the tag's first letter run."""
    doc = fitz.open(pdf)
    page = doc[0]
    out = {}
    for b in page.get_text("dict")["blocks"]:
        for line in b.get("lines", []):
            for s in line["spans"]:
                text = re.sub(r"\s+", "", s["text"])
                for tag in tags:
                    if text and text[0] == tag[0]:
                        r = fitz.Rect(s["bbox"])
                        prev = out.get(tag)
                        if prev is None or r.x1 - r.x0 > prev[4]:
                            out[tag] = (round(r.x0, 2), round(r.x1, 2), round(r.y0, 2),
                                        round(r.y1, 2), round(r.width, 2), round(r.height, 2))
    doc.close()
    return out


def read(key, val, i, cls):
    """[(ink-centre distance, extent1, extent2)] for the two cells, or a reason string.

    `i` is in the file name because Windows paths are case-insensitive, and `extents` are widths for
    a column pair and heights for a row pair.
    """
    got = []
    for cells, tag in ((NARROW, "n"), (WIDE, "w")):
        pdf = compile_page("%s-%d-%02d-%s" % (key, cls, i, tag), body(key, val, cells), cls)
        if not pdf:
            return "no page"
        s = spans(pdf, cells)
        if len(s) < 2:
            return "cells not found"
        a, b = s[cells[0]], s[cells[1]]
        if key == "column":
            centre = abs(((b[0] + b[1]) / 2) - ((a[0] + a[1]) / 2))
            got.append((round(centre, 2), a[4], b[4]))
        else:
            centre = abs(((b[2] + b[3]) / 2) - ((a[2] + a[3]) / 2))
            got.append((round(centre, 2), a[5], b[5]))
    return got


def table(key, cls):
    """{value: derived separation in pt} -- the centre distance minus the two half cells.

    `1cm` calibrates the cell boxes' own padding: whatever the ink gap reads beyond a centimetre is
    the inner sep of the two boxes, and every other value loses the same amount.
    """
    raw = {}
    for i, val in enumerate(VALUES):
        got = read(key, val, i, cls)
        if isinstance(got, str):
            raw[val] = got
            continue
        raw[val] = [(c, round(c - (e1 + e2) / 2, 2)) for (c, e1, e2) in got]
    pad = raw.get("1cm")
    if isinstance(pad, str) or pad is None:
        return raw, None
    return raw, round(pad[0][1] - PT_CM, 2)


def main():
    print("tikz-cd standalone border 6pt -- distances in pt")
    for cls in (10, 11, 12):
        print("\n=== class %dpt ===" % cls)
        for key in ("column", "row"):
            raw, pad = table(key, cls)
            print("--- %s sep ---  (cell padding on an ink gap: %s)"
                  % (key, pad if pad is not None else "not read"))
            for val in VALUES:
                got = raw.get(val)
                if not isinstance(got, list):
                    print("  %-11s %s" % (val or "(default)", got))
                    continue
                (nc, ng), (wc, wg) = got
                sep = round(ng - pad, 2) if pad is not None else None
                print("  %-11s narrow centre %7.2f  gap %6.2f  sep %6s = %5s cm   "
                      "wide centre %7.2f  gap %6.2f"
                      % (val or "(default)", nc, ng, sep,
                         round(sep / PT_CM, 3) if sep is not None else "-", wc, wg))
    if "pdf" in sys.argv[1:]:
        print("\npages kept in %s" % TMP)
    return 0


if __name__ == "__main__":
    sys.exit(main())
