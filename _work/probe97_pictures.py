"""#97 face, measured where it actually lives: `\frac` inside the SOURCE pictures.

`probe97_demoted.py` matched a canvas `"/"` site against `\frac{num}{den}` **anywhere in the paper**,
so a coincidence in an equation gives a false "demoted" verdict -- the Gepner site did exactly that
(the `\frac45` it matched is in `\\begin{equation}`, while the canvas came from a node label).  This
drops the per-site matching and counts the population at the source: every `\frac`-family command
that sits inside a `tikzpicture`.  By the attribution law (a *simple* `\frac` reaches Typst as a bare
`a / b`, a group-sided one as `frac(a, b)`), each simple one of these is a slash #93's blanket rule
turned into the `"/"` glyph -- a stacked fraction in the source printed as an inline slash.

  python _work/probe97_pictures.py            # summary
  python _work/probe97_pictures.py --tsv      # also write _work/m97_pictures.tsv
"""
import csv
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe96_face import ATOM  # the same one-atom reader #96 uses

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
FRAC = re.compile(r"\\([dtc]?frac)\s*(?:"
                  r"\{((?:[^{}]|\{[^{}]*\})*)\}\s*\{((?:[^{}]|\{[^{}]*\})*)\}"
                  r"|(\S)\s*(\S))")


def one_atom(s):
    """True when the TeX operand is a single atom Typst can hand to `frac(a, b)` as-is."""
    s = s.strip()
    if not s:
        return False
    m = ATOM.match(s)
    return bool(m) and m.end() == len(s.replace(" ", ""))


def main():
    tsv = "--tsv" in sys.argv
    rows = []
    for f in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        paper = os.path.basename(f)[:-4]
        text = open(f, encoding="utf-8", errors="replace").read()
        for pic in PIC.finditer(text):
            block = pic.group(0)
            for m in FRAC.finditer(block):
                braced = m.group(2) is not None
                num = m.group(2) if braced else m.group(4)
                den = m.group(3) if braced else m.group(5)
                rows.append((paper, m.group(1) or "frac", "braced" if braced else "nobrace",
                             "simple" if (one_atom(num) and one_atom(den)) else "group",
                             num[:24], den[:24]))

    papers = {r[0] for r in rows}
    simple = [r for r in rows if r[3] == "simple"]
    group = [r for r in rows if r[3] == "group"]
    print("`\\frac`-family inside tikzpictures: %d sites over %d papers" % (len(rows), len(papers)))
    for label, sel in (("simple (both sides one atom)", simple), ("group-sided", group)):
        print("   %-28s sites=%-6d papers=%d" % (label, len(sel), len(set(r[0] for r in sel))))
    for key in ("nobrace", "braced"):
        sel = [r for r in rows if r[2] == key]
        print("   %-28s sites=%-6d papers=%d" % ("spelling " + key, len(sel),
                                                 len(set(r[0] for r in sel))))
    print("\nsimple sites by command:")
    by = {}
    for r in simple:
        by[r[1]] = by.get(r[1], 0) + 1
    for k, v in sorted(by.items(), key=lambda kv: -kv[1]):
        print("   \\%-10s %d" % (k, v))
    print("\nsamples:")
    for r in simple[:10]:
        print("   %-44s \\%-6s %-8s %s / %s" % (r[0][:44], r[1], r[2], r[4], r[5]))
    if tsv:
        out = os.path.join(ROOT, "_work", "m97_pictures.tsv")
        with open(out, "w", encoding="utf-8", newline="") as fh:
            w = csv.writer(fh, delimiter="\t")
            w.writerow(["paper", "command", "spelling", "scope", "num", "den"])
            w.writerows(rows)
        print("\nwrote %s" % out)
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
