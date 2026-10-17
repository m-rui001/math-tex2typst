r"""Does every page line that still says `inset: 0.3333em` match what today's converter produces?

The regeneration was driven by a paper-level needle (source mentions `inner sep` anywhere), so a page
can legitimately keep default lines: the nodes that declared no padding get pgf's default, which is
what TeX does too. The node-level probe (`probe_inset_declared_kept.py`) already reports zero declared
values answered by the default -- but it counts calls, while the page counts lines, and the two bases
have to be squared before the residue can be called literal.

This rebuilds each paper's pictures through the preprocessing `convert` puts before `build` (no
compiler), counts the default lines the fresh canvas carries, and compares per paper with the product
on disk. A paper whose page has MORE default lines than a fresh build is a stale product; fewer means a
picture on the page was built by a path this probe misses.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
from probe_tip_product import canvases  # noqa: E402  the proven line-position splitter
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFAULT = "inset: 0.3333em"


def main():
    stale = lean = papers = sites = 0
    shown = []
    for typ in sorted((ROOT / "typst").glob("*/main.typ")):
        src = ROOT / "_work" / "flat" / (typ.parent.name + ".tex")
        if not src.exists():
            continue
        page = sum(1 for body in canvases(typ.read_text(encoding="utf-8", errors="replace"))
                   for line in body if DEFAULT in line)
        fresh = 0
        text = src.read_text(encoding="utf-8", errors="replace")
        for m in PIC.finditer(text):
            core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), None)
            canvas = cetz.build(core) or cetz.build_cd(core)
            if canvas:
                fresh += sum(1 for line in canvas.splitlines() if DEFAULT in line)
        if not page:
            continue
        papers += 1
        sites += page
        if page > fresh:
            stale += 1
            if len(shown) < 10:
                shown.append("%s page %d fresh %d" % (typ.parent.name[:44], page, fresh))
        elif fresh > page:
            lean += 1
            if len(shown) < 10:
                shown.append("LEAN %s page %d fresh %d" % (typ.parent.name[:44], page, fresh))
    print("papers with default lines: %d   lines: %d" % (papers, sites))
    print("page carries MORE than a fresh build (stale): %d" % stale)
    print("page carries FEWER (a path this probe misses): %d" % lean)
    for line in shown:
        print("  > %s" % line)


if __name__ == "__main__":
    main()
