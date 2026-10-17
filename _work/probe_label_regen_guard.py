r"""Which canvases the `label=` fix actually changes, and whether any figure is lost.

The rule is additive: a node that writes `label=<side>:<text>` gains one more `content(...)` line
beside whatever it drew before. Replaying the OLD behaviour is one stub at the door of the labels
themselves -- `label_placements` answering nothing -- and NOT a stub of `emit_node`, whose signature
and node drawing are unchanged in substance. Prints canvases built before/after, how many changed, and
refuses to call it a day if a canvas that built before stops building: an unseen `label` spelling (a
`[name=L]` preamble, an angle) would now refuse the picture, and that is the regression to catch here.
Writes the affected papers to `_work/regen_labels.txt` for `_work/regen_list.py`.
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
LIVE = cetz.label_placements


def build_old(pic):
    cetz.label_placements = lambda o: []
    try:
        return cetz.build(pic)
    finally:
        cetz.label_placements = LIVE


def main():
    before = after = changed = lost = refused = 0
    papers = []
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        hit = 0
        for pic in PIC.findall(text):
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
            if new is not None:
                after += 1
            elif old is None:
                refused += 1
        if hit:
            papers.append((hit, path.stem))
    print("canvases built: before %d, after %d (refused both ways: %d)"
          % (before, after, refused))
    print("canvases changed: %d over %d papers, lost: %d" % (changed, len(papers), lost))
    for n, name in sorted(papers, reverse=True)[:12]:
        print("  %3d  %s" % (n, name[:60]))
    (ROOT / "_work" / "regen_labels.txt").write_text(
        "\n".join(name for _n, name in papers), encoding="utf-8")
    print("wrote _work/regen_labels.txt")


if __name__ == "__main__":
    main()
