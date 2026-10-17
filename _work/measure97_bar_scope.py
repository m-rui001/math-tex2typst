"""#96's decisive gauge: how far does a Typst slash-fraction's BAR reach?

轴 76 read each glyph's height against the bar and found `bare` and `frac` identical in eight shapes,
which already says the neighbours are not swallowed.  Ink-row reading (`measure94_body_slash.py`)
cannot see scope, and the page-level asymmetry ruler (`receipt96_body_slash.py`) is a false-positive
machine.  The reading that separates the two hypotheses directly is the bar's **x-extent**: if a bare
`/` really takes the rest of the span as its denominator, its bar must be much wider than the bar of
the same fraction written `frac(a, b)`, and wider than the TeX control's.

One page per shape per variant, plus a pdflatex control of the same shape with the fraction braced.
Reports for every bar: width, and how many glyph centres sit under it.

  python _work/measure97_bar_scope.py > _work/m97_bar.txt
"""
import os
import re
import sys

import fitz

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import measure93_slash_fidelity as ruler  # one ruler: compile_()/control() are #93's

TMP = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_m97bar")
ruler.TMP = TMP

# (case, sentinel, TeX control, [(label, Typst body)]) -- bodies are the product spellings read out
# of `_work/m96_face.tsv`, so `bare` is exactly what pandoc ships.
CASES = [
    ("frac-then-letters", "q", r"$\frac{1}{2} m(\mu)$",
     [("bare", r"$q 1 / 2 m \( mu \)$"), ("frac", r"$q frac(1, 2) m \( mu \)$")]),
    ("frac-then-relation", "w", r"$\frac{1}{2} \leq E_0$",
     [("bare", r"$w 1 / 2 lt.eq E_0$"), ("frac", r"$w frac(1, 2) lt.eq E_0$")]),
    ("num-then-frac-then-tail", "y", r"$a + \frac{1}{2} = b$",
     [("bare", r"$y a + 1 / 2 = b$"), ("frac", r"$y a + frac(1, 2) = b$")]),
    ("real-corpus-line", "s",
     r"$\frac{1}{8} m(\mu) \leq \mathbb{E}\,\|p-\mathsf{u}\| \leq \frac{1}{2}\sqrt{m(\mu)}.$",
     [("bare", r'$s 1 / 8 m \( mu \) lt.eq bb(E) thin "TV" \( p \, sans(u) \) lt.eq 1 / 2 sqrt(m \( mu \)) .$'),
      ("frac", r'$s frac(1, 8) m \( mu \) lt.eq bb(E) thin "TV" \( p \, sans(u) \) lt.eq frac(1, 2) '
               r'sqrt(m \( mu \)) .$')]),
    ("real-log-tail", "t", r"$\limsup_n \frac{1}{n} \log X$",
     [("bare", r"$t limsup_(n arrow.r oo) 1 / n log s_X \( n \, epsilon \)$"),
      ("frac", r"$t limsup_(n arrow.r oo) frac(1, n) log s_X \( n \, epsilon \)$")]),
    ("unspaced-slash", "u", r"$R^{2}/d_{ij}^{2}$",
     [("bare-nospace", r"$u R^2/d_(i j)^2$"), ("frac", r"$u frac(R^2, d_(i j)^2)$")]),
    # what is the denominator's real boundary when the slash is unspaced and a tail follows?
    ("unspaced-then-letters", "v", r"$x/y z$",
     [("bare-nospace", r"$v x/y z$"), ("bare-spaced", r"$v x / y z$"),
      ("frac", r"$v frac(x, y) z$")]),
    ("unspaced-then-sum", "w", r"$a/b+c$",
     [("bare-nospace", r"$w a/b+c$"), ("frac", r"$w frac(a, b) +c$")]),
    ("unspaced-then-paren", "x", r"$1/2(m)$",
     [("bare-nospace", r"$x 1/2(m)$"), ("frac", r"$x frac(1, 2)(m)$")]),
]
BAR = re.compile(r"^[\s\(\)\[\]\.,;:!|]+$")


def bars(pdf, sent):
    """[(bar x0, x1, y, glyph centres under the bar, ink centres anywhere on the line)] ."""
    doc = fitz.open(pdf)
    page = doc[0]
    found = []
    for d in page.get_drawings():
        for item in d["items"]:
            if item[0] == "l":
                p1, p2 = item[1], item[2]
                if abs(p1.y - p2.y) < 0.4 and abs(p1.x - p2.x) > 1.5:
                    found.append([min(p1.x, p2.x), max(p1.x, p2.x), (p1.y + p2.y) / 2])
            elif item[0] == "re":
                r = item[1]
                if r.height < 1.2 and r.width > 1.5:
                    found.append([r.x0, r.x1, (r.y0 + r.y1) / 2])
    chars = []
    for block in page.get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            for sp in line["spans"]:
                for ch in sp["chars"]:
                    c = ruler.fold(ch["c"])
                    if not c.strip() or BAR.match(c):
                        continue
                    x0, y0, x1, y1 = ch["bbox"]
                    chars.append(((x0 + x1) / 2, (y0 + y1) / 2))
    doc.close()
    out = []
    for x0, x1, y in sorted(found):
        under = [cx for cx, cy in chars if x0 - 0.5 <= cx <= x1 + 0.5 and cy > y + 0.5]
        out.append((x0, x1, y, len(under)))
    return out, len(chars)


def main():
    os.makedirs(TMP, exist_ok=True)
    for name, sent, math, variants in CASES:
        key = name.replace("-", "_")
        ruler.control(key, sent, math)
        ctrl, _n = bars(os.path.join(TMP, key + ".pdf"), sent)
        print("\n== %s   TeX %s" % (name, math))
        print("   CONTROL   bars: %s" % ["width %.2fpt under %d" % (x1 - x0, k)
                                         for x0, x1, _y, k in ctrl])
        for label, body in variants:
            got = ruler.compile_(os.path.join(TMP, "%s_%s.typ" % (name, label)),
                                 ruler.PRE + "#text(size: 10pt)[%s]\n" % body)
            if isinstance(got, list):
                print("   %-16s FAILED %s" % (label, got))
                continue
            read, _n = bars(got, sent)
            print("   %-16s bars: %s" % (label, ["width %.2fpt under %d" % (x1 - x0, k)
                                                 for x0, x1, _y, k in read]))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
