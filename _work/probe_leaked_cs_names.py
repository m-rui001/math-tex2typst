r"""Which quoted words inside maths are LaTeX command names that never became symbols.

texmath spells a control sequence it cannot map as its own name in quotes, so
``\simeq`` arrives at Typst as ``"simeq"`` and prints the word instead of the relation.
A quoted word is counted as a leak only when ``\word`` really is a control sequence in
that paper's flattened source -- that is what separates the broken ``"tr"``-looking
operator names (source: ``\operatorname{tr}``, no ``\tr`` anywhere) from a genuine drop.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
MATH = re.compile(r"\$[^$]*\$", re.S)
QUOTED = re.compile(r'"([A-Za-z][A-Za-z0-9]{1,20})"')
CS = re.compile(r"\\([A-Za-z]+)")


def papers():
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        name = os.path.basename(os.path.dirname(path))
        src = os.path.join(FLAT, name + ".tex")
        if not os.path.exists(src):
            srcs = glob.glob(os.path.join(FLAT, name[:30] + "*.tex"))
            if not srcs:
                continue
            src = srcs[0]
        yield name, path, src


def main():
    leaks = Counter()
    leak_papers = Counter()
    in_fig = Counter()
    where = {}
    for name, tpath, spath in papers():
        cs = set(CS.findall(open(spath, encoding="utf-8", errors="replace").read()))
        text = open(tpath, encoding="utf-8", errors="replace").read()
        lines = text.splitlines()
        # a canvas's own text is one `content((x, y), [...])` call per line
        figline = set(i for i, line in enumerate(lines) if re.match(r"\s*content\(", line))
        for region in MATH.finditer(text):
            start = text.count("\n", 0, region.start())
            for m in QUOTED.finditer(region.group(0)):
                w = m.group(1)
                if w not in cs:
                    continue
                leaks[w] += 1
                leak_papers[w] += 1
                if start in figline:
                    in_fig[w] += 1
                where.setdefault(w, (name[:40], region.group(0)[:110]))
    print("leaked command names: %d distinct, %d occurrences, %d of them inside figures"
          % (len(leaks), sum(leaks.values()), sum(in_fig.values())))
    print("%-16s %6s %6s  example" % ("word", "all", "fig"))
    for w, n in leaks.most_common(40):
        print("%-16s %6d %6d  %s" % (w, n, in_fig.get(w, 0), where[w][0]))
    print("\n--- occurrences inside canvas content, by paper")
    print(sum(in_fig.values()), "in", len(in_fig), "distinct words")


if __name__ == "__main__":
    main()
