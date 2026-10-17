r"""What size does a real exchange diagram set its arrow labels at?

The one surviving exchange-diagram canvas in the verified face (`Global-quantum…#0`, a `tikzcd` with
`column sep=8em`) collides because its long labels print at the same size as the cells. The control
page of the same diagram says otherwise at a glance: cells 10.9pt, every label 8.0pt. Before
`build_cd` gets a size rule, the rule has to be read off both languages at every class the corpus
uses -- amscd's arrow labels are `\scriptstyle` by default and tikz-cd's are not necessarily the
same number.

  python _work/probe88b_cd_label_size.py

Prints, for each (package, class size): the size the page sets cells at and the size it sets arrow
labels at, horizontal and vertical labels separately.
"""
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TMP = os.path.join(WORK, "_m88b")

DOC = ("\\documentclass[%spt,border=6pt]{standalone}\n\\usepackage{%s}\n\\begin{document}\n"
       "%s\n\\end{document}\n")

BODIES = {
    # \\mathrm keeps a label one upright text run, so fitz reports it as one span with one size;
    # italic maths would split per letter and say nothing about the size either way.
    "tikz-cd": ("\\begin{tikzcd}[column sep=4em]\n"
                "A \\arrow[r,\"$\\mathrm{hlabelabcdefghij}$\"] "
                "\\arrow[d,\"$\\mathrm{vlabelklmnopqr}$\"] & B \\\\\n"
                "& C\n\\end{tikzcd}"),
    "amscd": ("\\begin{CD}\n"
              "A @>{\\mathrm{hlabelabcdefghij}}>> B \\\\\n"
              "@V{\\mathrm{vlabelklmnopqr}}VV @VV{\\mathrm{vlabelstu}}V\\\\\n"
              "& C\n\\end{CD}"),
}
CELLS = ("A", "B", "C")

# The paper that owns the only surviving exchange-diagram collision writes its labels as
# `\text{integrated $N$ case of \eqref{...}}`, and its control page sets them at 8pt under an 11pt
# class -- while the `\mathrm` probe above says tikz-cd labels are body size. So the spelling may be
# what decides. Three spellings, one diagram, one number each.
VARIANTS = [
    ("mathrm", "\\mathrm{variantalpha}", "variantalpha"),
    ("text", "\\text{variantbeta}", "variantbeta"),
    ("bare", "variantgamma", "variantgamma"),
]
VARIANT_DOC = ("\\begin{tikzcd}[column sep=4em,row sep=2.5em]\n"
               "A \\arrow[r,\"%s\"] \\arrow[d,\"%s\"] \\arrow[dr,\"%s\"] & B \\\\\n"
               "&& C\n\\end{tikzcd}" % (VARIANTS[0][1], VARIANTS[1][1], VARIANTS[2][1]))


def variants(cls):
    """{spelling: (size, ink width pt)} for the three label spellings at one class size."""
    os.makedirs(TMP, exist_ok=True)
    name = "variant-%d" % cls
    open(os.path.join(TMP, name + ".tex"), "w", encoding="utf-8").write(
        DOC % (cls, "tikz-cd", VARIANT_DOC))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP,
                    os.path.join(TMP, name + ".tex")], capture_output=True, cwd=TMP)
    pdf = os.path.join(TMP, name + ".pdf")
    if not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    page = doc[0]
    got = {}
    for b in page.get_text("dict")["blocks"]:
        for line in b.get("lines", []):
            for s in line["spans"]:
                text = re.sub(r"\s+", "", s["text"])
                for kind, _spell, tag in VARIANTS:
                    if text.startswith(tag[:8]):
                        r = fitz.Rect(s["bbox"])
                        got[kind] = (round(s["size"], 2), round(r.width, 2))
    cell = min(round(s["size"], 2) for b in page.get_text("dict")["blocks"]
               for l in b.get("lines", []) for s in l["spans"]
               if re.sub(r"\s+", "", s["text"]) in CELLS)
    doc.close()
    return cell, got


def sizes(pkg, cls):
    """(cell size, label size) the compiled page carries, read off the spans' own font size."""
    os.makedirs(TMP, exist_ok=True)
    name = "%s-%d" % (pkg.replace("-", ""), cls)
    open(os.path.join(TMP, name + ".tex"), "w", encoding="utf-8").write(
        DOC % (cls, pkg, BODIES[pkg]))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP,
                    os.path.join(TMP, name + ".tex")], capture_output=True, cwd=TMP)
    pdf = os.path.join(TMP, name + ".pdf")
    if not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    cell, labels = set(), {}
    for b in doc[0].get_text("dict")["blocks"]:
        for line in b.get("lines", []):
            for s in line["spans"]:
                text = re.sub(r"\s+", "", s["text"])
                if not text:
                    continue
                if text in CELLS:
                    cell.add(round(s["size"], 2))
                elif re.search(r"[a-z]{5}", text):
                    labels.setdefault(round(s["size"], 2), []).append(text[:12])
    doc.close()
    return sorted(cell), labels


def main():
    for pkg in sorted(BODIES):
        for cls in (10, 11, 12):
            got = sizes(pkg, cls)
            if not got:
                print("%-8s %2dpt  pdflatex produced nothing" % (pkg, cls))
                continue
            cell, labels = got
            print("%-8s %2dpt  cells %s   labels %s" % (pkg, cls, cell, labels))
    print("\ntikz-cd, by spelling (size pt / ink width pt):")
    for cls in (10, 11, 12):
        got = variants(cls)
        if not got:
            print("  %2dpt  pdflatex produced nothing" % cls)
            continue
        cell, kinds = got
        print("  %2dpt  cell %.2f   %s" % (cls, cell, "  ".join(
            "%s %s" % (kind, "%.2f/%.1f" % kinds[kind] if kind in kinds else "not found")
            for kind, _spell, _tag in VARIANTS)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
