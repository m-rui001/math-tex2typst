r"""Differential for the `every node/.style` default in resolve_opts.

Rebuilds every picture in _work/flat twice: once with the shipped resolve_opts, once with a
variant that ignores the every-node default (the behaviour before the change). Prints how many
canvases differ, how many gain a stroke/rect, and that nothing flipped built->refused.
"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SHIP = cetz.resolve_opts


def flat(o, styles):
    """resolve_opts without the every-node seed and tail merge."""
    got = dict(o)
    for _ in range(4):
        added = False
        for key, val in list(got.items()):
            if val is True and key in styles:
                for k, v in styles[key].items():
                    if k not in got:
                        got[k] = v
                        added = True
        if not added:
            break
    return got


heads = 0
diff = 0
new_stroke = 0
flipped = []
both = 0
papers = set()
for f in sorted(Path("_work/flat").glob("*.tex")):
    text = f.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(text):
        m = re.search(r"\\begin\{tikzpicture\}\s*(\[.*?\])?", pic, re.S)
        h = (m.group(1) or "")[1:-1]
        if "/.style" in h and "every node/.style" in h:
            heads += 1
        cetz.resolve_opts = SHIP
        now = cetz.build(pic)
        cetz.resolve_opts = flat
        before = cetz.build(pic)
        cetz.resolve_opts = SHIP
        if (now is None) != (before is None):
            flipped.append((f.stem[:40], now is None))
        if now is None or before is None:
            continue
        both += 1
        if now != before:
            diff += 1
            papers.add(f.stem[:40])
            if now.count("rect(") > before.count("rect(") or \
               now.count("path(") > before.count("path(") or \
               now.count("rounded") > before.count("rounded"):
                new_stroke += 1

print("picture heads declaring every node/.style: %d" % heads)
print("pictures built by both: %d, differing output: %d over %d papers" % (both, diff, len(papers)))
print("of the differing ones, gaining a box/rounded stroke: %d" % new_stroke)
print("built/refused flips: %d %s" % (len(flipped), flipped[:4]))
for p in sorted(papers)[:10]:
    print("  %s" % p)
