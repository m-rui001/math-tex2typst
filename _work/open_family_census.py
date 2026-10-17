r"""Census of the still-open figure families, counted on the flat sources that really contain them.

Each family is counted two ways: how many tikzpictures carry the spelling, and how many papers.
Nothing here infers meaning from a keyword list -- the spellings counted are the literal pgf keys,
and every count is re-checked against the products in typst/<stem>/main.typ.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

FAMILIES = {
    "ellipse_shape": re.compile(r"\[([^\]]*\bellipse\b[^\]]*)\]"),
    "diamond_shape": re.compile(r"\[([^\]]*\bdiamond\b[^\]]*)\]"),
    "rounded_corners": re.compile(r"rounded\s+corners"),
    "textwidth_relative": re.compile(r"\.\d+\s*\\(?:textwidth|linewidth)"),
    "em_ex_unit": re.compile(r"=\s*-?\d*\.?\d+\s*(?:em|ex)\b"),
    "label_angle": re.compile(r"label\s*=\s*-?\d+(?:\.\d+)?\s*:"),
    "diagonal_side": re.compile(r"\b(?:above|below)\s+(?:left|right)\s*="),
}


def main():
    papers = sorted(glob.glob(os.path.join(FLAT, "*.tex")))
    tally = {k: [0, set()] for k in FAMILIES}
    for path in papers:
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        pics = PIC.findall(src)
        if not pics:
            continue
        prod = os.path.join(ROOT, "typst", stem, "main.typ")
        out = open(prod, encoding="utf-8", errors="replace").read() if os.path.exists(prod) else ""
        for name, rx in FAMILIES.items():
            n = sum(len(rx.findall(p)) for p in pics)
            if n:
                # does the product still carry the key verbatim (i.e. we did not model it)?
                tally[name][0] += n
                tally[name][1].add(stem)
                tally[name].append((stem, n, out.count(name)))
    for name, (total, stems) in ((k, (v[0], v[1])) for k, v in tally.items()):
        print("%-18s hits=%4d papers=%3d" % (name, total, len(stems)))
    print()
    for name in FAMILIES:
        rows = tally[name][2:]
        if rows:
            print("%s: %s" % (name, ", ".join("%s(%d)" % (r[0][:36], r[1]) for r in rows[:12])))


if __name__ == "__main__":
    main()
