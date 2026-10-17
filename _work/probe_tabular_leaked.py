r"""Which products carry a TABLE that never became a table?

`A-spectral-gap-throughout…` fig. 1 is a `\begin{tabular}{c@{\quad}c}` whose five rows reach the page
as markup: the column spec arrives mangled as a first line `c\@c`, and the row separators arrive as
literal `\&` lines. That is a `#figure([ … ])` body, not a Typst `table`, so nothing on the page is
aligned and the spec text is visible.

Scan the products for that shape rather than the sources: a figure/canvas body that contains a line
whose whole content is a column separator, or a line that reads like a mangled array preamble.

Usage:  python _work/probe_tabular_leaked.py [--specs]
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SEP = re.compile(r"^\s*(?:\\&|&)\s*$")
SPEC = re.compile(r"^\s*[lcrX|m@{}|,>\S]+@[{\s]*\S*\s*$")


def main():
    show = "--specs" in sys.argv
    papers = []
    seps = specs = 0
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        lines = open(path, encoding="utf-8", errors="replace").read().splitlines()
        got = []
        for i, ln in enumerate(lines):
            if SEP.match(ln):
                seps += 1
                got.append((i + 1, "sep", ln.strip()))
            elif SPEC.match(ln) and "@" in ln and len(ln.strip()) < 24:
                specs += 1
                got.append((i + 1, "spec", ln.strip()))
        if got:
            papers.append((stem, got))
    print("lines that are a bare column separator: %d" % seps)
    print("lines that read as a mangled array preamble: %d" % specs)
    print("papers carrying either: %d" % len(papers))
    for stem, got in papers[: (100 if show else 15)]:
        print("   %-56s %s" % (stem[:56], ["%s@%d %r" % (k, n, t) for n, k, t in got[:4]]))


if __name__ == "__main__":
    main()
