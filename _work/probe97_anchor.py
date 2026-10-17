"""#97 face, anchored where it lives: a `\frac` in a SOURCE picture, found in the PRODUCT canvas.

`probe97_demoted.py` matched a canvas `"/"` against `\frac{num}{den}` anywhere in the paper, so a
coincidence in an equation gave a false "demoted" verdict -- the Gepner site did exactly that (the
`\frac45` it matched is in `\\begin{equation}`, while the node was `$\\k/5$`, an author-typed slash
that #93 correctly turned into `"/"`).  This walks the other way: it takes every `\frac`-family
command **inside a `tikzpicture`** in the flat source, reads its two operands, and looks for that
exact pair inside a canvas maths span of the product.

Verdicts:
  demoted    -- the product canvas shows `num"/"den`: a stacked fraction in the source printed as
                an inline slash (that is #93's blanket rule, not the author's intent)
  frac-call  -- the product canvas shows `frac(num, den)`: correct, nothing to do
  absent     -- neither: the label never reached a canvas, read by hand

  python _work/probe97_anchor.py            # summary
  python _work/probe97_anchor.py --tsv      # also write _work/m97_anchor.tsv
"""
import csv
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import canvases  # the one canvas walker, shared with #93/#96

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
MATH = re.compile(r"\$[^$\n]+\$")
FRAC = re.compile(r"\\([dtc]?frac)\s*(?:"
                  r"\{((?:[^{}]|\{[^{}]*\})*)\}\s*\{\s*((?:[^{}]|\{[^{}]*\})*)\s*\}"
                  r"|(.)\s*(.))")
# how the product spells one operand: pandoc escapes punctuation, TeX braces are gone
ESC = r"\\?"


def pattern(text):
    """A regex that matches how the product would write this TeX operand (loose on spacing)."""
    out = []
    for ch in text.strip():
        if ch.isspace():
            if out and not out[-1].endswith("+"):
                out.append(r"\s*")
            continue
        if ch.isalnum():
            out.append(re.escape(ch))
        else:
            out.append(ESC + re.escape(ch))
    return "".join(out)


def main():
    tsv = "--tsv" in sys.argv
    rows = []
    for f in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(f)[:-4]
        paper = None
        for d in glob.glob(os.path.join(ROOT, "typst", "*")):
            name = os.path.basename(d)
            if name.startswith(stem[:44]) or stem.startswith(name[:44]):
                paper = name
                break
        if not paper:
            continue
        prod_path = os.path.join(ROOT, "typst", paper, "main.typ")
        if not os.path.exists(prod_path):
            continue
        src = open(f, encoding="utf-8", errors="replace").read()
        prod = open(prod_path, encoding="utf-8", errors="replace").read()
        spans = []
        for block in canvases(prod):
            spans += [m.group(0) for m in MATH.finditer(block)]
        for pic in PIC.finditer(src):
            block = pic.group(0)
            for m in FRAC.finditer(block):
                braced = m.group(2) is not None
                num = m.group(2) if braced else m.group(4)
                den = m.group(3) if braced else m.group(5)
                n, d = pattern(num), pattern(den)
                joined = "".join(spans)
                quoted = re.search(n + r'\s*"\s*/\s*"\s*' + d, joined)
                call = re.search(r"frac\(\s*%s\s*,\s*%s\s*\)" % (n, d), joined)
                verdict = "demoted" if quoted else ("frac-call" if call else "absent")
                rows.append((paper, m.group(1) or "frac", "braced" if braced else "nobrace",
                             verdict, num[:20], den[:20],
                             (quoted or call).group(0)[:60] if (quoted or call) else ""))

    by = {}
    for r in rows:
        by[r[3]] = by.get(r[3], 0) + 1
    print("`\\frac`-family inside source tikzpictures, looked up in the product canvas: %d sites "
          "over %d papers" % (len(rows), len(set(r[0] for r in rows))))
    for k in ("demoted", "frac-call", "absent"):
        sel = [r for r in rows if r[3] == k]
        print("   %-10s sites=%-6d papers=%d" % (k, len(sel), len(set(r[0] for r in sel))))
    dem = [r for r in rows if r[3] == "demoted"]
    print("\ndemoted by spelling:")
    for key in ("braced", "nobrace"):
        sel = [r for r in dem if r[2] == key]
        print("   %-10s sites=%-6d papers=%d" % (key, len(sel), len(set(r[0] for r in sel))))
    print("\nsamples:")
    for r in dem[:12]:
        print("   %-42s \\%-6s %-8s %-10s %s" % (r[0][:42], r[1], r[2],
                                                 (r[4] + "/" + r[5])[:10], r[6]))
    if tsv:
        out = os.path.join(ROOT, "_work", "m97_anchor.tsv")
        with open(out, "w", encoding="utf-8", newline="") as fh:
            w = csv.writer(fh, delimiter="\t")
            w.writerow(["paper", "command", "spelling", "verdict", "num", "den", "product"])
            w.writerows(rows)
        print("\nwrote %s" % out)
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
