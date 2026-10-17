r"""Which products still carry a braced script inside a canvas, and which of them are literal by design.

The stub diff over `cetz.build` measures only the pictures that build without the pipeline's
`expand_linewidth` and without the tikzcd path, so a paper whose axes read `x=.85\linewidth` was
never seen changing and never entered the regen list. The page is the complete basis: every canvas
line still carrying `_{` or `^{` is either a stale product (regen it) or a site the converter
deliberately leaves braced -- a quoted `$"…"$` string, or an escaped `\{` the author meant as a
character. Print both, and write the stale papers to `_work/regen_needed.txt`.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
# the imported probe already rewraps stdout for UTF-8; wrapping it a second time here closes the
# first wrapper's file and every later print raises `I/O operation on closed file`
from probe_tip_product import canvases  # noqa: E402  the proven line-position splitter

SCRIPT = re.compile(r"[\^_]\{")
# a `$"…"$` span is a quoted string: Typst prints what sits between the quotes verbatim, so a brace
# there is the author's own text, not a script group the emitter failed to write
QUOTED = re.compile(r'"[^"]*"')


def main():
    papers = []
    sites = literal = 0
    shown = []
    for typ in sorted((ROOT / "typst").glob("*/main.typ")):
        text = typ.read_text(encoding="utf-8", errors="replace")
        hit = 0
        for body in canvases(text):
            for line in body:
                if not SCRIPT.search(line):
                    continue
                sites += 1
                if SCRIPT.search(QUOTED.sub('""', line)):
                    hit += 1
                    if len(shown) < 12:
                        shown.append("%s | %s" % (typ.parent.name[:34], line.strip()[:110]))
                else:
                    literal += 1
        if hit:
            papers.append((hit, typ.parent.name))
    papers.sort(reverse=True)
    print("canvas lines with a braced script: %d   literal-by-design %d   to regen %d over %d papers"
          % (sites, literal, sum(n for n, _ in papers), len(papers)))
    for line in shown:
        print("   left> %s" % line)
    for n, name in papers:
        print("  %3d  %s" % (n, name))
    (ROOT / "_work" / "regen_needed.txt").write_text("\n".join(n for _c, n in papers),
                                                     encoding="utf-8")
    print("wrote _work/regen_needed.txt with %d papers" % len(papers))


if __name__ == "__main__":
    main()
