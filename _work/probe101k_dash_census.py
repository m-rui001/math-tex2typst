r"""#101 leg G (found on the page, not in the ruler): the dash-name family the emitter never reads.

The 300 dpi crop of the §7 canvas (`_work/m101j_filed-*.png`) showed the `H` seam: pdflatex draws it
`densely dashed`, our page draws it solid.  `stroke_args` (cetz.py:440) prices a dash from two keys
alone -- a bare `dashed` and a bare `dotted` -- and every other way TikZ writes a dash
(`densely dashed`, `loosely dashed`, `dash pattern=on 2pt off 3pt`, `dash dot`, `dashed` with a
custom `dash=`) falls through to a solid rule.  This is a census of that fall-through, not a fix:
the count of statements, canvases and papers is what a round has to be priced with before anyone
claims it.

Only statements inside a `\begin{tikzpicture}...\end{tikzpicture}` are counted, because a dash key
written outside one is not our loss.

  PYTHONIOENCODING=utf-8 python _work/probe101k_dash_census.py   # -> _work/label101k_dash_census.txt
"""
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
FLAT = os.path.join(HERE, "flat")
OUT = os.path.join(HERE, "label101k_dash_census.txt")

# the dash spellings pgf accepts and `stroke_args` does not
NAMES = ["densely dashed", "loosely dashed", "very densely dashed", "ultra densely dashed",
         "densely dotted", "loosely dotted", "very densely dotted", "ultra densely dotted",
         "dash pattern", "dash dot", "dot dash", "dashdotted", "dashed and dotted"]
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def main():
    sys.stdout.reconfigure(errors="replace")
    stems = sorted(d[:-4] for d in os.listdir(FLAT) if d.endswith(".tex"))
    hits = {n: 0 for n in NAMES}
    papers = {n: set() for n in NAMES}
    pics = {n: set() for n in NAMES}
    for stem in stems:
        text = io.open(os.path.join(FLAT, stem + ".tex"), encoding="utf-8",
                       errors="replace").read()
        for k, pic in enumerate(PIC.findall(text)):
            for n in NAMES:
                c = pic.count(n)
                if c:
                    hits[n] += c
                    papers[n].add(stem)
                    pics[n].add((stem, k))
    lines = ["dash names the emitter never reads -- statements inside a tikzpicture, corpus-wide",
             "source = _work/flat/*.tex (flattened), counted by literal key",
             ""]
    lines.append("%-22s %8s %8s %8s" % ("key", "stmts", "canvases", "papers"))
    tot_s = tot_c = 0
    all_papers = set()
    all_canv = set()
    for n in NAMES:
        if not hits[n]:
            continue
        lines.append("%-22s %8d %8d %8d" % (n, hits[n], len(pics[n]), len(papers[n])))
        tot_s += hits[n]
        tot_c += len(pics[n])
        all_papers |= papers[n]
        all_canv |= pics[n]
    lines.append("")
    lines.append("UNION: %d statements / %d canvases / %d papers of %d"
                 % (tot_s, len(all_canv), len(all_papers), len(stems)))
    lines.append("")
    lines.append("papers, by canvas count:")
    by = {}
    for n in NAMES:
        for s in papers[n]:
            by[s] = by.get(s, 0) + 1
    for s, c in sorted(by.items(), key=lambda x: (-x[1], x[0]))[:25]:
        lines.append("  %2d  %s" % (c, s[:70]))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
