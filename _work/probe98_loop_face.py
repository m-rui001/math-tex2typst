"""#98 face: how many emitted paths are a zero-length `line`, and what made them?

A `to` whose two ends name the same thing is a loop.  TikZ curves it: with `loop above`/`out=,in=` it
leaves and returns on the node's border and draws a cubic over the top.  Our emitter currently has no
reader for the `loop` keys, so the statement falls through to the straight-piece branch and ships as
`line((x, y), (x, y))` -- no ink at all for the path, and the path's own `node[above]` label is then
placed at that point, printing on top of the node it was supposed to hang off of (the worst on-ink pair
of run146's face, 5.66pt, is exactly this).

This counts the shipped signature statically (it needs no render): every `line(...)` call in a canvas
whose two endpoints coincide, joined back to the statement that made it by the coordinates.

  python _work/probe98_loop_face.py            # census to stdout
  python _work/probe98_loop_face.py --tsv      # also _work/m98_loop_face.tsv
"""
import csv
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
NUM = r"-?[\d.eE+-]+"
DEGEN = re.compile(r"\bline\(\((%s), (%s)\), \(\1, \2\)" % (NUM, NUM))
SELFLOOP = re.compile(r"to\s*\[[^\]]*\bloop\b[^\]]*\]|\[[^\]]*\bloop\b[^\]]*\]\s*(?:\(|node|coordinate)")
COORD_SELF = re.compile(r"to\s*\[[^\]]*\bout\s*=|[^\]]*\blooseness\s*=[^\]]*\]")


def shipped_lines(path):
    """(line text, lineno) for every degenerate `line(...)` in one main.typ."""
    text = io.open(path, encoding="utf-8", errors="replace").read()
    out = []
    for n, line in enumerate(text.splitlines(), 1):
        if DEGEN.search(line):
            out.append((line.strip(), n))
    return out


def source_of(stem):
    for cand in (os.path.join(WORK, "flat", stem + ".tex"),):
        if os.path.isfile(cand):
            return cand
    hits = glob.glob(os.path.join(WORK, "flat", stem[:38] + "*.tex"))
    return hits[0] if hits else None


def main():
    rows = []
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        deg = shipped_lines(path)
        if not deg:
            continue
        src = source_of(stem)
        tex = io.open(src, encoding="utf-8", errors="replace").read() if src else ""
        loops = len(SELFLOOP.findall(tex))
        tangent = len(COORD_SELF.findall(tex))
        rows.append((stem, len(deg), loops, tangent, deg[0][0][:120]))
    tot = sum(r[1] for r in rows)
    print("degenerate line() emissions: %d over %d papers" % (tot, len(rows)))
    print("  of those papers: %d carry a `loop` key in the source, %d carry out=/in=/looseness="
          % (sum(1 for r in rows if r[2]), sum(1 for r in rows if r[3])))
    for stem, n, loops, tangent, sample in sorted(rows, key=lambda r: -r[1]):
        print("  %-56s %3d  loop=%-3d tan=%-3d  %s" % (stem[:56], n, loops, tangent, sample))
    if "--tsv" in sys.argv:
        with io.open(os.path.join(WORK, "m98_loop_face.tsv"), "w", encoding="utf-8",
                     newline="") as fh:
            w = csv.writer(fh, delimiter="\t")
            w.writerow(["stem", "degenerate", "loop_keys", "tangent_keys", "sample"])
            for row in rows:
                w.writerow(row)
    return 0


if __name__ == "__main__":
    sys.exit(main())
