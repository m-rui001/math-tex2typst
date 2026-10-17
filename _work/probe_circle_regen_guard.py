r"""Which canvases the circle fix changes, how many nodes each face is, and whether any picture is lost.

The whole round hangs on one function: `cetz.node_shape` answers `circle` for a round node and the
emitter then squares its box, shrinks the drawn range by sqrt(2), pads a text-sized circle and gives an
empty node the radius of its own padding. Stub that one name back to `rect` and every picture comes out
the way it did before -- so the difference between the two builds IS this round's face, and a canvas
that built before must still build now.

`node_shape` is the whole stub, which is also why the change of guard on the empty-node branch (a node
asked to be drawn now gets its outline, where a bare colour used to be the only reason to draw it) is
counted here too: it is a `circle`-shaped decision, not a separate one.

Writes `_work/regen_circle.txt` for `_work/regen_list.py`.
"""
import io
import pathlib
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
LIVE = cetz.node_shape
RANGE = re.compile(r'frame: "circle"')
PAD = re.compile(r'frame: "circle", padding:')
DOT = re.compile(r'circle\(.*radius: ')


def build_old(pic):
    cetz.node_shape = lambda o: "rect"
    try:
        return cetz.build(pic)
    finally:
        cetz.node_shape = LIVE


def main():
    before = after = changed = lost = 0
    kinds = Counter()
    other = []
    gained = []
    papers = []
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        hit = 0
        for n, pic in enumerate(PIC.findall(text)):
            old = build_old(pic)
            new = cetz.build(pic)
            if old is not None:
                before += 1
                if new is None:
                    lost += 1
                    print("LOST %s" % path.stem[:60])
                elif old != new:
                    changed += 1
                    hit += 1
                    got = new.splitlines()
                    had = set(old.splitlines())
                    for line in got:
                        if line in had:
                            continue
                        if PAD.search(line):
                            kinds["text-sized circle"] += 1
                        elif RANGE.search(line):
                            kinds["declared circle re-range"] += 1
                        elif DOT.search(line):
                            kinds["empty node radius/outline"] += 1
                        else:
                            kinds["other"] += 1
                            if len(other) < 10:
                                other.append("%s | %s" % (path.stem[:34], line.strip()[:110]))
            if new is not None:
                after += 1
                if old is None:
                    gained.append("%s pic %d" % (path.stem[:52], n))
                    hit += 1
        if hit:
            papers.append((hit, path.stem))
    print("canvases built: before %d, after %d" % (before, after))
    print("canvases changed: %d over %d papers, lost: %d" % (changed, len(papers), lost))
    for kind, n in kinds.most_common():
        print("   %-26s %d lines" % (kind, n))
    for line in other:
        print("   other> %s" % line)
    for line in gained:
        print("   gained> %s" % line)
    for n, name in sorted(papers, reverse=True)[:12]:
        print("  %3d  %s" % (n, name[:60]))
    (ROOT / "_work" / "regen_circle.txt").write_text(
        "\n".join(name for _n, name in papers), encoding="utf-8")
    print("wrote _work/regen_circle.txt")


if __name__ == "__main__":
    main()
