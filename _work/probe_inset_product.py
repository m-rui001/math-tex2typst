r"""Which products still draw a framed box with pgf's *default* padding, and which papers must be
regenerated because their source writes a padding of its own.

`box_args` emitted `inset: 0.3333em` for every framed node; the fix spends the node's own `inner sep`.
The stub diff (`_work/probe_inset_regen_guard.py`) measures the face only over pictures `cetz.build`
can build, which leaves out every canvas sized `x=.85\linewidth` and every tikzcd -- so the regeneration
list is written from the pages themselves, as #45 learned.

A product line is stale when the paper's own TikZ declares `inner sep` anywhere (node brackets,
`\tikzset`, `every node`): that value reaches the option table the emitter reads, and whether a given
node ends up framed or not, the page has to be re-built to know. Papers whose products carry the default
with no `inner sep` in the source are correct -- pgf's default is what they asked for.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
# the imported probe rewraps stdout for UTF-8; wrapping twice closes the first file
from probe_tip_product import canvases  # noqa: E402  the proven line-position splitter

DEFAULT = "inset: 0.3333em"
SEP = re.compile(r"inner sep\s*=")


def main():
    papers = []
    lines = correct = 0
    for typ in sorted((ROOT / "typst").glob("*/main.typ")):
        text = typ.read_text(encoding="utf-8", errors="replace")
        hit = 0
        for body in canvases(text):
            for line in body:
                if DEFAULT in line:
                    hit += 1
        lines += hit
        if not hit:
            continue
        src = ROOT / "_work" / "flat" / (typ.parent.name + ".tex")
        if not src.exists():
            print("   no flat source for %s" % typ.parent.name[:50])
            continue
        if not SEP.search(src.read_text(encoding="utf-8", errors="replace")):
            correct += hit
            continue
        papers.append((hit, typ.parent.name))
    papers.sort(reverse=True)
    print("canvas lines with the default inset: %d   of which no `inner sep` in source: %d"
          % (lines, correct))
    print("stale over %d papers: %d lines" % (len(papers), sum(n for n, _ in papers)))
    for n, name in papers[:12]:
        print("  %3d  %s" % (n, name[:60]))
    (ROOT / "_work" / "regen_needed.txt").write_text("\n".join(n for _c, n in papers),
                                                     encoding="utf-8")
    print("wrote _work/regen_needed.txt with %d papers" % len(papers))


if __name__ == "__main__":
    main()
