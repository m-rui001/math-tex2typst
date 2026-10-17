r"""Every `#h(<number><unit>)` in the product, so the `\hspace` face can be read off.

The `\hspace` fix turns each in-maths `\hspace{<len>}` into `#h(<len>) `; the `\;` fix turns
`#h(0em)` into `#h(0.27778em)`. Both land in the same spelling family, so the histogram has to be
read whole: `0.27778em` is the `\;` row, and everything else is a `\hspace` (or a cetz
`MATH_SPACES` value, which uses 0.3333/0.1667/0.2778/-0.1667).

  python _work/probe87g_hspace_tokens.py
"""
import collections
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
H = re.compile(r"#h\(([-+]?\d*\.?\d+)(mm|cm|pt|in|em)\)")


def main():
    hist = collections.Counter()
    papers = collections.defaultdict(set)
    files = glob.glob(os.path.join(ROOT, "typst", "*", "*.typ"))
    for path in files:
        stem = os.path.basename(os.path.dirname(path))
        for n, u in H.findall(io.open(path, encoding="utf-8").read()):
            hist["%s%s" % (n, u)] += 1
            papers["%s%s" % (n, u)].add(stem)
    print("products = %d .typ" % len(files))
    total = 0
    for key, n in hist.most_common():
        total += n
        print("  %-14s %5d occurrences / %4d papers" % (key, n, len(papers[key])))
    print("  TOTAL %d" % total)
    by_unit = collections.Counter()
    for key, n in hist.items():
        by_unit[key[-2:]] += n
    print("-- by unit --")
    for u, n in by_unit.most_common():
        print("  %-4s %6d" % (u, n))
    # mm/cm/pt can only come from `\hspace` (pandoc never emits them otherwise; `\qquad` is `2em`
    # and cetz's MATH_SPACES are em too), so their sum is the `\hspace` face minus the `2em` bucket
    hard = by_unit["mm"] + by_unit["cm"] + by_unit["pt"]
    print("  mm+cm+pt = %d  (the `\\hspace` face that cannot hide in the `2em` bucket)" % hard)
    return 0


if __name__ == "__main__":
    sys.exit(main())
