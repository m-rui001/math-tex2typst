r"""Measure, from the canvas coordinates themselves, how often figure text boxes collide.

A node with more than one line is emitted as `content((x, y), [#box(width: Wcm, ...[...]])`
centred on the node: the width comes from the source, the height from however many lines the
text has, and CeTz draws the border and routes the edges without knowing either.  Two boxes
whose rectangles intersect, or a box whose own text is taller than the space its neighbours
were routed around, is what a reader sees as letters printed over a line.

Height is estimated at one typst text line (0.4 cm at the corpus's node font) per
`#linebreak()` plus one; that is the only number here that is not read off the file.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CONTENT = re.compile(r"^\s*content\(\((-?[\d.]+),\s*(-?[\d.]+)\),\s*\[(.*)\]\s*\)\s*$")
WIDTH = re.compile(r"width:\s*([\d.]+)cm")
LINE = 0.40


def boxes(lines):
    out = []
    for line in lines:
        m = CONTENT.match(line)
        if not m:
            continue
        x, y, body = float(m.group(1)), float(m.group(2)), m.group(3)
        w = WIDTH.search(body)
        if not w:
            continue
        n = body.count("#linebreak()") + body.count("\\\\") + 1
        h = LINE * n
        out.append((x, y, float(w.group(1)), h, n))
    return out


def main():
    sys.stdout.reconfigure(errors="replace")
    papers_with_overlap = 0
    papers = 0
    overlap_pairs = 0
    multiline = 0
    total_boxes = 0
    worst = Counter()
    multiline_papers = set()
    for tpath in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        name = os.path.basename(os.path.dirname(tpath))
        text = open(tpath, encoding="utf-8", errors="replace").read()
        if "canvas(" not in text:
            continue
        papers += 1
        # one canvas at a time: boxes in different pictures never collide
        group, groups = [], []
        for line in text.splitlines():
            if "canvas(" in line:
                group = []
                groups.append(group)
            m = CONTENT.match(line)
            if m and group is not None:
                group.append(line)
        hits = 0
        for g in groups:
            bs = boxes(g)
            total_boxes += len(bs)
            for i, (x, y, w, h, n) in enumerate(bs):
                if n > 1:
                    multiline += 1
                    multiline_papers.add(name)
                for (x2, y2, w2, h2, _n2) in bs[i + 1:]:
                    if abs(x - x2) < (w + w2) / 2 and abs(y - y2) < (h + h2) / 2:
                        hits += 1
        overlap_pairs += hits
        if hits:
            papers_with_overlap += 1
            worst[name] = hits
    print("papers with a canvas: %d ; fixed-width text boxes: %d" % (papers, total_boxes))
    print("multi-line boxes: %d (%.1f%%) in %d papers"
          % (multiline, 100.0 * multiline / max(total_boxes, 1), len(multiline_papers)))
    print("colliding box pairs: %d, in %d papers (%.0f%% of figure papers)"
          % (overlap_pairs, papers_with_overlap, 100.0 * papers_with_overlap / papers))
    print("\nworst offenders")
    for name, n in worst.most_common(12):
        print("  %5d  %s" % (n, name[:60]))


if __name__ == "__main__":
    main()
