r"""Every canvas text run whose maths prints a LaTeX name instead of a glyph.

Scope is the figure leg only: a `content((x, y), [...])` line of a generated main.typ.
For each such line the flattened source is searched for the same quoted word written as
a control sequence, so ``"simeq"`` is reported with the TeX that produced it and an
operator name that the author set with ``\operatorname`` is not.
"""
import glob
import os
import re
import sys
from collections import Counter, defaultdict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
CONTENT = re.compile(r"^\s*content\(\([^)]*\),\s*\[(.*)\]\s*\)\s*$")
QUOTED = re.compile(r'"([A-Za-z][A-Za-z0-9]{1,20})"')
MATH = re.compile(r"\$([^$]*)\$", re.S)


def main():
    words = Counter()
    papers = Counter()
    shown = defaultdict(int)
    lines_hit = 0
    for tpath in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        name = os.path.basename(os.path.dirname(tpath))
        srcs = glob.glob(os.path.join(FLAT, name + "*.tex"))
        source = open(srcs[0], encoding="utf-8", errors="replace").read() if srcs else ""
        hit_here = set()
        for line in open(tpath, encoding="utf-8", errors="replace"):
            m = CONTENT.match(line.rstrip("\n"))
            if not m:
                continue
            body = m.group(1)
            bad = [w for reg in MATH.finditer(body)
                   for w in QUOTED.findall(reg.group(1))
                   if re.search(r"\\%s\b" % w, source) and not re.search(
                       r"\\(?:operatorname|mathrm|mathbf|mathit|text|textbf|textrm)\s*\{[^}]*\b%s\b" % w,
                       source)]
            if not bad:
                continue
            lines_hit += 1
            for w in bad:
                words[w] += 1
                hit_here.add(w)
                if shown[w] < 3:
                    shown[w] += 1
                    tex = re.search(r".{0,45}\\%s\b.{0,25}" % w, source, re.S)
                    print("LEAK %-14s | %-42s | typ: %s" % (w, name[:42], body[:70]))
                    if tex:
                        print("     %-14s | src: %s" % ("", tex.group(0).replace("\n", " ")[:100]))
        for w in hit_here:
            papers[w] += 1
    print("\ncontent() lines with a leaked name: %d" % lines_hit)
    print("distinct words: %d, occurrences: %d" % (len(words), sum(words.values())))
    print(" ".join("%s(%d/%dp)" % (w, n, papers[w]) for w, n in words.most_common(60)))


if __name__ == "__main__":
    main()
