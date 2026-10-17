r"""#94 second gauge: WHERE does a glyph sit next to a stacked fraction -- axis or denominator row?

`_work/measure94_body_slash.py` read only line grouping and ink gaps, and for pandoc's linearized
simple fractions it reports `==` for the bare slash.  That verdict is not evidence: 轴 74 already recorded
that a ruler reading ink row-by-row cannot see a denominator swallowing its neighbours, because both the
TeX denominator and the Typst denominator land in the same y-band.  The difference is what happens to the
atoms AFTER the fraction: TeX sets them on the fraction's axis, Typst (bare `/`) has already taken them
into the denominator.

So this reads the vertical position of every glyph against the fraction bar itself: bar y from the page's
drawings, glyph y from its bbox centre, and the sign of (glyph - bar) says axis-level, above the bar, or
below it.

  python _work/measure94_frac_axis.py > _work/m94_axis.txt
"""
import os
import re
import sys

import fitz

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work"))
import measure93_slash_fidelity as ruler  # one ruler: compile_()/control() are #93's

TMP = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_m94axis")
ruler.TMP = TMP

# (case, sentinel, TeX for the control, [(label, Typst body)]) -- one sentinel per case, and the body
# starts with the same one, because rows() drops the leftmost occurrence and no more.
CASES = [
    ("frac-then-tail", "q", r"$\frac{1}{2} f(x)$",
     [("bare", r"$q 1 / 2 f \( x \)$"), ("frac", r"$q frac(1, 2) f \( x \)$")]),
    ("frac-then-times", "w", r"$\frac{1}{2} \times 3$",
     [("bare", r"$w 1 / 2 times 3$"), ("frac", r"$w frac(1, 2) times 3$")]),
    ("two-fracs", "y", r"$\frac{1}{2}+\frac{1}{3}$",
     [("bare", "$y 1 / 2 + 1 / 3$"), ("frac", "$y frac(1, 2) + frac(1, 3)$")]),
    ("frac-then-add", "z", r"$\frac{a}{b}+c$",
     [("bare", "$z a / b + c$"), ("frac", "$z frac(a, b) + c$")]),
    # -- the shapes the corpus actually ships (read out of `_work/m94_bare_slash.tsv`); the TeX side is
    #    the same formula with the fraction braced, which is what pandoc linearized away.
    ("real-log-tail", "r", r"$\frac{1}{2}\log n$",
     [("bare", "$r 1 / 2 log n$"), ("frac", "$r frac(1, 2) log n$")]),
    ("real-sum-then-le", "s", r"$\sum_i \frac{w_i}{2} (2 d_i F)^2 \le 4 b (d - s).$",
     [("bare", r"$s sum_i w_i / 2 \( 2 d_i F \)^2 lt.eq 4 b \( d - s \) .$"),
      ("frac", r"$s sum_i frac(w_i, 2) \( 2 d_i F \)^2 lt.eq 4 b \( d - s \) .$")]),
    ("real-two-fracs-le", "t", r"$\frac18 m(\mu) \le \mathbb{E}\,\|p-\mathsf{u}\| \le \frac12\sqrt{m(\mu)}.$",
     [("bare", r'$t 1 / 8 m \( mu \) lt.eq bb(E) thin "TV" \( p \, sans(u) \) lt.eq 1 / 2 sqrt(m \( mu \)) .$'),
      ("frac", r'$t frac(1, 8) m \( mu \) lt.eq bb(E) thin "TV" \( p \, sans(u) \) lt.eq frac(1, 2) sqrt(m \( mu \)) .$')]),
    ("real-paren-frac", "u", r"$\mathcal{E}_{\mathrm{ADM}} \ge \varsigma\|Q\| + \frac{1-s^2}{2}{(\frac{a}{\omega})}^{(k-1)/k}$",
     [("bare", r'$u cal(E)_(upright("ADM")) gt.eq s \| Q \| + frac(1 - s^2, 2) (a / omega)^(\( k - 1 \) \/ k)$'),
      ("frac", r'$u cal(E)_(upright("ADM")) gt.eq s \| Q \| + frac(1 - s^2, 2) (frac(a, omega))^(\( k - 1 \) \/ k)$')]),
]
BAR = re.compile(r"^[\s\(\)\[\]\.,;:!|]+$")


def rows(pdf, sent):
    """[(glyph, dy against the fraction bar)] in left-to-right order, plus the bar count."""
    doc = fitz.open(pdf)
    page = doc[0]
    bars = []
    for d in page.get_drawings():
        for item in d["items"]:
            if item[0] == "l":
                p1, p2 = item[1], item[2]
                if abs(p1.y - p2.y) < 0.4 and abs(p1.x - p2.x) > 1.5:
                    bars.append((p1.y + p2.y) / 2)
            elif item[0] == "re":
                r = item[1]
                if r.height < 1.2 and r.width > 1.5:
                    bars.append((r.y0 + r.y1) / 2)
    words = []
    for block in page.get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            for sp in line["spans"]:
                for ch in sp["chars"]:
                    c = ruler.fold(ch["c"])
                    if not c.strip() or BAR.match(c):
                        continue
                    x0, y0, x1, y1 = ch["bbox"]
                    words.append((c, (x0 + x1) / 2, (y0 + y1) / 2))
    doc.close()
    words = sorted(words, key=lambda w: w[1])
    if words and words[0][0] == sent:
        words = words[1:]
    if not bars:
        return "no bar", []
    bar = min(bars)
    return len(bars), [(c, round(y - bar, 2)) for c, _x, y in words]


def main():
    os.makedirs(TMP, exist_ok=True)
    for name, sent, math, cands in CASES:
        ruler.control(name.replace("-", "_"), sent, math)
        print("\n== %-16s TeX %s" % (name, math))
        # control() writes the PDF next to the .tex; read it with the same bar-relative view
        pdf = os.path.join(TMP, name.replace("-", "_") + ".pdf")
        print("   %-10s bars=%s %s" % ("CONTROL", *rows(pdf, sent)))
        for label, body in cands:
            got = ruler.compile_(os.path.join(TMP, "%s-%s.typ" % (name, label)),
                                 ruler.PRE + "#text(size: 10pt)[%s]\n" % body)
            if isinstance(got, list):
                print("   %-10s FAILED %s" % (label, got))
                continue
            print("   %-10s bars=%s %s" % (label, *rows(got, sent)))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
