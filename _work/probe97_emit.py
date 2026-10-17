"""#97 face, measured through the shipped rule: run every source picture `$...$` through `_math_body`.

`probe97_anchor.py` still matched a `\frac` in a source picture against `num"/"den` anywhere in that
paper's canvases, and the operands are usually `1`/`2` -- the Mass-and-covering paper has four
`\tfrac12` node labels AND four `frac(1, 2)` in its product, yet the probe called four of them
"demoted" because the same paper also carries author-typed `-1/2` exponents.  A text coincidence is
not a face.

So ask the emitter: `_math_body` (tools/t2t/cetz.py:1846) is the rule #93 shipped.  Feed it each
`$...$` span that sits inside a `tikzpicture` in the flat source and contains a `\frac`-family
command, then read what comes back:

  frac(...)  -- the fraction survives as a stacked fraction: faithful, no defect
  "/"        -- the fraction became an inline slash glyph: the demotion disease
  other      -- the span went to a quoted fallback instead; look by hand

  python _work/probe97_emit.py            # summary
  python _work/probe97_emit.py --tsv      # also write _work/m97_emit.tsv
"""
import csv
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t.cetz import _math_body  # the shipped rule, the same one #93 changed

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SPAN = re.compile(r"\$([^$\n]+)\$")
FRAC = re.compile(r"\\[tdc]?frac(?![a-zA-Z])")


def main():
    tsv = "--tsv" in sys.argv
    rows = []
    for f in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        paper = os.path.basename(f)[:-4]
        text = open(f, encoding="utf-8", errors="replace").read()
        for pic in PIC.finditer(text):
            for span in SPAN.finditer(pic.group(0)):
                tex = span.group(1)
                if not FRAC.search(tex):
                    continue
                try:
                    body = _math_body(tex)
                except Exception as exc:  # the emitter itself is part of the reading
                    body = "RAISED %s" % exc
                if body is None:
                    verdict = "None (refused)"
                elif "frac(" in body:
                    verdict = "frac-call"
                elif '"/"' in body:
                    verdict = "slash-glyph"
                else:
                    verdict = "other"
                rows.append((paper, verdict, tex[:60].replace("\n", " "),
                             (body or "")[:70].replace("\n", " ")))

    by = {}
    for r in rows:
        by[r[1]] = by.get(r[1], 0) + 1
    print("source picture `$...$` spans carrying a `\frac`-family command, read through `_math_body`: "
          "%d spans over %d papers" % (len(rows), len(set(r[0] for r in rows))))
    for k in sorted(by, key=lambda x: -by[x]):
        sel = [r for r in rows if r[1] == k]
        print("   %-16s spans=%-6d papers=%d" % (k, len(sel), len(set(r[0] for r in sel))))
    bad = [r for r in rows if r[1] == "slash-glyph"]
    print("\nspans whose fraction came back as an inline slash glyph:")
    for r in bad[:15]:
        print("   %-44s  %s  ->  %s" % (r[0][:44], r[2], r[3]))
    other = [r for r in rows if r[1] == "other"]
    print("\nother (%d spans), first few:" % len(other))
    for r in other[:8]:
        print("   %-44s  %s  ->  %s" % (r[0][:44], r[2], r[3]))
    if tsv:
        out = os.path.join(ROOT, "_work", "m97_emit.tsv")
        with open(out, "w", encoding="utf-8", newline="") as fh:
            w = csv.writer(fh, delimiter="\t")
            w.writerow(["paper", "verdict", "source", "math_body"])
            w.writerows(rows)
        print("\nwrote %s" % out)
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
