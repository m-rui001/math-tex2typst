r"""Print the framed-node lines the converter builds for one picture, beside what the source wrote.

Read-only and typst-free (`cetz.build` only), so it can run while the compile gate holds the compiler:
for one flat source, print each picture's `#box(` lines with the `width:`/`inset:` pair next to the
`inner sep` and `text width` the author wrote on the nodes. This is what a screenshot is checked against
-- the numbers the page should show.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NODE = re.compile(r"\\node\s*(\[[^\]]*\])?", re.S)

want = sys.argv[1]
paths = sorted(p for p in (ROOT / "_work" / "flat").glob("*.tex") if want in p.stem)
if not paths:
    print("no flat source matching %r" % want)
    sys.exit(1)
path = paths[0]
print("== %s" % path.name)
src = path.read_text(encoding="utf-8", errors="replace")
for n, pic in enumerate(PIC.findall(src)):
    built = cetz.build(pic)
    if built is None:
        print("pic %d: refused" % n)
        continue
    boxes = [l.strip() for l in built.splitlines() if "#box(" in l]
    if not boxes:
        continue
    seps = re.findall(r"inner sep\s*=\s*([^\s,\]]+)", pic)
    widths = re.findall(r"text width\s*=\s*([^\s,\]]+)", pic)
    print("pic %d: %d framed nodes   inner sep=%s   text width=%s"
          % (n, len(boxes), sorted(set(seps)) or "-", sorted(set(widths)) or "-"))
    LIVE = cetz.node_inset
    cetz.node_inset = lambda o: "0.3333em"          # the old hard-coded default, for the pair print
    before = [l.strip() for l in (cetz.build(pic) or "").splitlines() if "#box(" in l]
    cetz.node_inset = LIVE
    for line, old in zip(boxes, before):
        if line == old:
            continue
        print("   - %s" % old[:150])
        print("   + %s" % line[:150])
