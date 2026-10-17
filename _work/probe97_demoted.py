"""#97 check: did #93's `"/"` demote a real fraction into an inline slash glyph?

#96's attribution (`probe96_attrib.py`) says a **bare** `/` reaching Typst from pandoc is a
`\frac` pandoc linearized, while an author-typed slash arrives escaped (`\/`).  #93 shipped a
rule that rewrites *any* bare `/` inside a canvas maths string into the tight quoted glyph
`"/"` (`cetz._math_body`).  Canvas maths also come out of `run_pandoc`, so if pandoc linearized a
`\frac` on the way to a canvas, #93 turned that fraction into a slash glyph -- the opposite of
faithful.

This reads every `"/"` on a canvas, takes the atoms on each side of it, and asks whether the flat
source writes `\frac{num}{den}` (or `\dfrac`/`\tfrac`/`\frac12`) with exactly those operands.
Matched -> the site is a demoted fraction.  No match -> the source had a literal division slash
and #93 was right.

  python _work/probe97_demoted.py            # summary
  python _work/probe97_demoted.py --tsv      # also write _work/m97_demoted.tsv
"""
import csv
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import canvases  # the one canvas walker, shared with #93/#96
from probe96_face import ATOM, unescape

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MATH = re.compile(r"\$[^$\n]+\$")
QUOTED = re.compile(r'"\s*/\s*"')


def sides(span, start, end):
    """(atom left of the quoted glyph, atom right of it)."""
    left = None
    for m in ATOM.finditer(span[:start]):
        left = m.group(0)
    rest = span[end:].lstrip()
    m = ATOM.match(rest)
    return (left or ""), (m.group(0) if m else "")


def main():
    tsv = "--tsv" in sys.argv
    flat = {}
    for f in glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")):
        flat[os.path.basename(f)[:-4]] = open(f, encoding="utf-8", errors="replace").read()

    sites = []
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        paper = os.path.basename(os.path.dirname(path))
        text = open(path, encoding="utf-8", errors="replace").read()
        src = None
        for stem, t in flat.items():
            if stem.startswith(paper[:44]) or paper.startswith(stem[:44]):
                src = t
                break
        for block in canvases(text):
            for span in MATH.finditer(block):
                s = span.group(0)
                for q in QUOTED.finditer(s):
                    num, den = sides(s, q.start(), q.end())
                    verdict = ""
                    if src and num and den:
                        n, d = re.escape(unescape(num)), re.escape(unescape(den))
                        if re.search(r"\\[dt]?frac\s*\{\s*%s\s*\}\s*\{\s*%s\s*\}" % (n, d), src):
                            verdict = "frac"
                        elif re.search(r"\\[dt]?frac\s*%s\s*%s" % (n, d), src):
                            verdict = "frac-nobrace"
                        elif re.search(r"%s\s*/\s*%s" % (n, d), src):
                            verdict = "literal"
                        else:
                            verdict = "no-source-match"
                    sites.append((paper, verdict, num, den,
                                  s.replace("\n", " ")[max(0, q.start() - 30):q.end() + 30]))

    by = {}
    for s in sites:
        by[s[1]] = by.get(s[1], 0) + 1
    papers = {s[0] for s in sites}
    print("canvas `\"/\"` sites: %d over %d papers" % (len(sites), len(papers)))
    for k in sorted(by, key=lambda x: -by[x]):
        sel = [s for s in sites if s[1] == k]
        print("   %-16s sites=%-6d papers=%d" % (k or "(no source)", len(sel),
                                                 len(set(s[0] for s in sel))))
    print("\nsamples where the source writes a fraction:")
    for s in [x for x in sites if x[1].startswith("frac")][:15]:
        print("   %-44s %-14s %s" % (s[0][:44], s[1], s[4]))
    if tsv:
        out = os.path.join(ROOT, "_work", "m97_demoted.tsv")
        with open(out, "w", encoding="utf-8", newline="") as fh:
            w = csv.writer(fh, delimiter="\t")
            w.writerow(["paper", "verdict", "num", "den", "window"])
            w.writerows(sites)
        print("\nwrote %s" % out)
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
