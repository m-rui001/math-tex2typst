r"""#102 leg B: what Typst/CetZ puts on the page for each dash spelling, read back as a PDF array.

Leg A measured pgf's own numbers (tikz.code.tex:1583-1601 confirmed on the page): `dashed` = on 3pt
off 3pt, `densely dashed` = on 3pt off 2pt, `loosely dashed` = on 3pt off 6pt -- all absolute -- while
the dotted family's ON length is `\pgflinewidth` (0.4pt at `thin`, 1.6pt at `ultra thick`) with a 2pt /
1pt / 4pt gap.  `stroke_args` today can only say `dash: "dashed"` or `dash: "dotted"`, so the question
for the fix is whether Typst's own names carry the same arrays, and whether an explicit length list
reaches the page at all (Typst's dotted names may not scale with the pen the way pgf's do).

The canvas is compiled through probe81's own `render` -- the one Typst-side ruler this repo has -- and
the PDF dash array is read back, so the comparison is page-to-page, not documentation-to-page.

  PYTHONIOENCODING=utf-8 python _work/probe102b_typst_dash.py
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import fitz  # noqa: E402
import probe81_label_box_face as p81  # noqa: E402

OUT = os.path.join(HERE, "label102b_typst_dash.txt")

# (label, the dash: value as Typst source)
DASHES = [
    ("none", None),
    ('"dashed"', '"dashed"'),
    ('"densely-dashed"', '"densely-dashed"'),
    ('"loosely-dashed"', '"loosely-dashed"'),
    ('"dotted"', '"dotted"'),
    ('"densely-dotted"', '"densely-dotted"'),
    ('"loosely-dotted"', '"loosely-dotted"'),
    ("(3pt, 3pt)", "(3pt, 3pt)"),
    ("(3pt, 2pt)", "(3pt, 2pt)"),
    ("(3pt, 6pt)", "(3pt, 6pt)"),
    ("(0.4pt, 2pt)", "(0.4pt, 2pt)"),
    ("(3pt, 2pt, 0.4pt, 2pt)", "(3pt, 2pt, 0.4pt, 2pt)"),
    ("(2mm, 3mm)", "(2mm, 3mm)"),
    ("(1.5cm, 0.5cm)", "(1.5cm, 0.5cm)"),
    ("(3bp, 2bp)", "(3bp, 2bp)"),
]
PENS = ["0.4pt", "1.6pt"]
CANVAS = ('#cetz.canvas({\n  import cetz.draw: *\n  line((0cm, 0cm), (8cm, 0cm), stroke: (%s))\n})')


def stroke_body(pen, dash):
    parts = ["thickness: " + pen]
    if dash:
        parts.append("dash: " + dash)
    return CANVAS % ", ".join(parts)


def array_of(pdf):
    d = fitz.open(pdf)
    got = None
    for path in d[0].get_drawings():
        if path["type"] == "s" or path.get("fill") is None:
            got = path.get("dashes")
            if got is not None:
                break
    d.close()
    return got


def main():
    sys.stdout.reconfigure(errors="replace")
    lines = ["Typst/CetZ dash arrays read back off the compiled page (8cm line)",
             "pgf's numbers for comparison (leg A, _work/label102a_dash_pgf.txt): dashed 2.989/2.989, "
             "densely dashed 2.989/1.993, loosely dashed 2.989/5.978,",
             "dotted <pen>/1.993, densely dotted <pen>/0.996, loosely dotted <pen>/3.985 "
             "(pen 0.4pt -> .3985, 1.6pt -> 1.594 in page units)",
             ""]
    for pen in PENS:
        lines.append("== thickness %s ==" % pen)
        lines.append("%-24s %s" % ("dash value", "pdf dashes"))
        for label, dash in DASHES:
            canvas = stroke_body(pen, dash)
            name = "m102b_%s_%s" % (pen.replace("pt", "p"), label.strip('"() '))
            got = p81.render(canvas, name)
            if got is None or got[2] is None:
                lines.append("%-24s COMPILE FAILED" % label)
                continue
            lines.append("%-24s %s" % (label, array_of(got[2])))
        lines.append("")
    text = "\n".join(lines) + "\n"
    open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
