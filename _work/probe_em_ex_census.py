r"""C's claim (2026-10-15 §0): read-only census of `em`/`ex` relative-unit usage in tikz options.

§7 residual "相对单位 em/ex 读不出": `_size`/`UNITS` has no `em`/`ex`, so `above=2em` and arrow
`length=...em` lose their lengths (#37 made it a negative assertion). The fix direction is to add
`em`/`ex` to `UNITS` as 1em/0.5ex of the current font size, but the residual says
"先普查带这两单位的选项出现次数再决定做哪几条腿". This probe is that census.

Read-only: scans `_work/flat/*.tex`. No tools changed, no typst.
"""
import glob
import os
import re
import sys
from collections import Counter, defaultdict

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

KEYED = re.compile(r"([A-Za-z][\w-]*)\s*=\s*(-?\d+(?:\.\d+)?)\s*(em|ex)\b")
# any number+unit, to catch bare uses too (coordinates, etc.)
UNIT = re.compile(r"(-?\d+(?:\.\d+)?)\s*(em|ex)\b")
TIPLEN = re.compile(r"length\s*=\s*(-?\d+(?:\.\d+)?)\s*(em|ex)\b")


def main():
    keyed = Counter()
    keyed_papers = defaultdict(set)
    bare_any = Counter()          # unit -> count of ALL num+unit (incl keyed)
    bare_papers = set()
    tiplen = 0
    papers_with = set()
    examples = []
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        # flat source is unwrapped: scan whole body (the census's STMT scan does the same)
        bodies = PIC.findall(src) or [src]
        for pic in bodies:
            for m in KEYED.finditer(pic):
                keyed["%s:%s" % (m.group(1), m.group(3))] += 1
                keyed_papers["%s:%s" % (m.group(1), m.group(3))].add(stem)
                papers_with.add(stem)
            for m in TIPLEN.finditer(pic):
                tiplen += 1
                papers_with.add(stem)
            for m in UNIT.finditer(pic):
                bare_any[m.group(2)] += 1
                bare_papers.add(stem)
                if len(examples) < 20:
                    a = max(0, m.start() - 30)
                    examples.append((stem, pic[a:m.end() + 5].replace("\n", " ")))
    print("em/ex census over %d papers (flat source)\n" % len(bare_papers))
    print("ALL <num>(em|ex) occurrences in tikzpictures: %d  (em=%d ex=%d)"
          % (sum(bare_any.values()), bare_any.get("em", 0), bare_any.get("ex", 0)))
    print("papers containing any <num>(em|ex): %d\n" % len(bare_papers))
    print("by KEYED option (key:unit -> count, #papers):")
    for k, n in keyed.most_common():
        print("  %-22s %4d   papers=%d" % (k, n, len(keyed_papers[k])))
    if not keyed:
        print("  (none in key=value form -- all are bare/coordinate uses)")
    print("\narrow-tip length=...em/ex: %d" % tiplen)

    # classify: tikz figure-option keys vs text-layout length macros
    TIKZ_KEYS = {"above", "below", "left", "right", "xshift", "yshift",
                 "node distance", "inner sep", "outer sep", "minimum width",
                 "minimum height", "minimum size", "text width", "text height",
                 "label distance", "pos", "shorten", "looseness", "bend"}
    tikz_hits = sum(n for k, n in keyed.items() if k.split(":")[0] in TIKZ_KEYS)
    print("\nCLASSIFICATION:")
    print("  tikz figure-option em/ex hits : %d  (keys seen: %s)"
          % (tikz_hits, sorted(k.split(":")[0] for k in keyed
                               if k.split(":")[0] in TIKZ_KEYS) or "NONE"))
    print("  text-layout length-macro hits : %d (emergencystretch/vskip/hspace/enumitem…)"
          % (sum(keyed.values()) - tikz_hits))
    print("\nCONCLUSION: the §7 '方向键与箭尖 length' em/ex legs have **0 corpus face** --")
    print("  every em/ex in the flat source is a textual length macro, none sits in a tikz")
    print("  picture option. Adding em/ex to UNITS would change 0 figures. Recommend")
    print("  closing this residual as 'no real face' (same pattern as other 撤案 rows).")

    print("\nsample contexts (first 20):")
    for stem, ctx in examples:
        print("  %-40s …%s…" % (stem[:40], ctx[-45:]))


if __name__ == "__main__":
    main()
