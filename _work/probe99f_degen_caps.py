r"""#99f: of the zero-length `line((x,y),(x,y))` calls on the products, how many ship a cap at all?

§7's row prices a blob only where TWO things hold on the same emitted path: the subpath is zero-length
AND it is stroked with a non-butt cap (轴 72 律二 -- pgf answers that with a disc one pen diameter
across, Typst answers it with nothing). probe99's attribution read the option list for a `line cap`,
which cannot see a cap that arrives through a named style; the emission can, because by then the
author's key has already been resolved into `cap: "round"` or `cap: "square"` on the stroke.

So this reads each degenerate call as it ships and splits the face three ways: `stroke: none` (no ink
either engine), stroked with butt (no ink either engine), stroked with round/square (the blob case,
worth a fix). Same scanner and same 口径 as probe98's face count -- `shipped_lines` over
`typst/*/main.typ`, no render.

  python _work/probe99f_degen_caps.py           # -> _work/label99f_degen_caps.txt
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))

from probe98_loop_face import DEGEN, shipped_lines  # noqa: E402

CAP = re.compile(r'cap: "(round|square)"')
OUT = os.path.join(ROOT, "_work", "label99f_degen_caps.txt")


def main():
    rows = []
    buckets = {"stroke-none": 0, "butt": 0, "round/square": 0}
    for stem in sorted(os.listdir(os.path.join(ROOT, "typst"))):
        path = os.path.join(ROOT, "typst", stem, "main.typ")
        if not os.path.isfile(path):
            continue
        for line, n in shipped_lines(path):
            if "stroke: none" in line or "stroke: none," in line:
                kind = "stroke-none"
            elif CAP.search(line):
                kind = "round/square"
            else:
                kind = "butt"
            buckets[kind] += 1
            rows.append((stem, n, kind, line.strip()[:150]))
    total = sum(buckets.values())
    lines = ["zero-length emissions=%d  stroke:none=%d  stroked butt=%d  stroked round/square=%d"
             % (total, buckets["stroke-none"], buckets["butt"], buckets["round/square"])]
    lines.append("")
    for stem, n, kind, line in rows:
        lines.append("%-58s %-12s L%-5d %s" % (stem[:58], kind, n, line[:130]))
    caps = [r for r in rows if r[2] == "round/square"]
    lines.append("")
    lines.append("blob cases (the only shape §7's row is about): %d over %d papers"
                 % (len(caps), len({c[0] for c in caps})))
    for stem, n, _k, line in caps:
        lines.append("  %s L%d %s" % (stem[:58], n, line[:120]))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text[:1500])
    print("... %d rows, %d blob cases" % (len(rows), len(caps)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
