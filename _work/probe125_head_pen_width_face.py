r"""#90's next face: a pen written on the picture's own brackets never reaches the rule.

The round that landed `line cap`/`line join` reads the head's two PEN-SHAPE keys and nothing else, and
the reason it stopped there is that a third key, `line width`, prices the whole figure rather than a
fraction of it.  `_work/measure90_head_on_node.py` shows the head is a pgf SCOPE default for width too
-- a `\node[draw] {X}` under `[line width=12pt]` comes back with a 11.955pt rule -- while the converter
answers `thickness: 0.4pt` for the same silence, so a picture that fixes its pen on the brackets draws
every line of it at pgf's default weight instead of its own.

Counts per picture: does the head write a width (by measure or by one of pgf's six names), and does the
canvas that comes out of `cetz.build` carry it?  A canvas whose thickest stroke is the 0.4pt default
under a head that said otherwise is one face; a statement that repeats the key is not our problem.
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NAMED = {"ultra thin": 0.1, "thin": 0.4, "semithick": 0.6, "thick": 0.8,
         "very thick": 1.2, "ultra thick": 1.6}
PT = {"pt": 1.0, "bp": 1.0, "mm": 2.8346, "cm": 28.346, "in": 72.27}

from t2t import cetz


def head_pen(head):
    """The pen the picture's own brackets fix, in page pt, or None."""
    got = None
    width = head.get("line width")
    if isinstance(width, str):
        m = re.fullmatch(r"([0-9.]+)\s*(pt|bp|mm|cm|in)", width.strip())
        if m:
            got = max(got or 0.0, float(m.group(1)) * PT[m.group(2)])
    for name, val in NAMED.items():
        if head.get(name) is True:
            got = max(got or 0.0, val)
    return got


miss = hit = 0
papers = set()
worst = []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        if not m:
            continue
        head, _pos = cetz._opts_at(pic[m.end():].lstrip(), 0)
        if not head:
            continue
        want = head_pen(head)
        if want is None or want <= 0.4:
            continue
        got = cetz.build(pic)
        if got is None:
            continue
        th = [float(x) for x in re.findall(r"thickness: ([0-9.]+)pt", got)]
        if not th or max(th) < want * 0.9:
            miss += 1
            papers.add(fn[:-4])
            worst.append((fn[:-4], round(want, 2), round(max(th) if th else 0.0, 2),
                          got.count("stroke: (")))
        else:
            hit += 1
print("head fixes a pen above pgf's default: picture carries it=%d, loses it=%d over %d papers"
      % (hit, miss, len(papers)))
for w in sorted(worst, key=lambda x: -(x[1] - x[2]))[:12]:
    print("   %-58s head=%spt canvas=%spt strokes=%d" % w)
