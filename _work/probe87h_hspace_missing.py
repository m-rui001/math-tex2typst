r"""Per-paper: in-maths `\hspace{mm|cm|pt}` in the source vs `#h(<n>mm|cm|pt)` in the product.

mm/cm/pt can only come from `\hspace` (pandoc emits `2em` for `\qquad`, and cetz's MATH_SPACES are
em), so a paper whose product count is below its source count is one where the length did not reach
the product -- either the paper was never regenerated, or the `\hspace` sits on a path that does not
run `mathconv.clean()` (a node label goes through `cetz._math_body` instead).

  python _work/probe87h_hspace_missing.py
"""
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = re.compile(r"\\hspace\s*\{([-\d.]+)\s*(mm|cm|pt)\}")
PROD = re.compile(r"#h\([-\d.]+(mm|cm|pt)\)")


def main():
    short = []
    tot_src = tot_prod = 0
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = len(SRC.findall(io.open(path, encoding="utf-8", errors="replace").read()))
        prod_path = os.path.join(ROOT, "typst", stem, "main.typ")
        prod = 0
        if os.path.exists(prod_path):
            prod = len(PROD.findall(io.open(prod_path, encoding="utf-8").read()))
        tot_src += src
        tot_prod += prod
        if src != prod:
            short.append((src - prod, stem, src, prod))
    print("source \\hspace{mm|cm|pt} = %d   product #h(mm|cm|pt) = %d" % (tot_src, tot_prod))
    short.sort(reverse=True)
    for d, stem, src, prod in short:
        print("  %+d  %-62s src=%d prod=%d" % (d, stem, src, prod))
    return 0


if __name__ == "__main__":
    sys.exit(main())
