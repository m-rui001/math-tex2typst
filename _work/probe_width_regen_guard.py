r"""Which papers' canvases the `text width` frame fix actually changes, and whether any figure is lost.

The rule under test is additive: a node that declares a measure gains a `width:` on the box Typst
lays out, and a fixed-range multi-line box keeps the alignment its own measure asks for. Replaying the
OLD behaviour takes two stubs at the drawing's own door -- `emit_node` never told a width and
`_node_align` always answered `center` -- and NOT a stub of `node_frame_width`, because the old
`node_size` read that same measure for placement; stubbing the law itself would compare the fix
against a converter that never had it.

Prints canvases built before/after, how many changed, and refuses to call it a day if a canvas that
built before stops building. Writes the affected papers to `_work/regen_needed.txt` for
`_work/regen_list.py`.
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
LIVE_EMIT = cetz.emit_node
LIVE_ALIGN = cetz._node_align


def build_old(pic):
    def old(at, inner, o, pal=None, box=None, angle=0.0, width=None):
        return LIVE_EMIT(at, inner, o, pal, box, angle, None)

    cetz.emit_node = old
    cetz._node_align = lambda o: "center"
    try:
        return cetz.build(pic)
    finally:
        cetz.emit_node = LIVE_EMIT
        cetz._node_align = LIVE_ALIGN


def main():
    before = after = changed = lost = 0
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
        if hit:
            papers.append((hit, path.stem))
    print("canvases built: before %d, after %d" % (before, after))
    print("canvases changed: %d over %d papers, lost: %d" % (changed, len(papers), lost))
    for n, name in sorted(papers, reverse=True)[:12]:
        print("  %3d  %s" % (n, name[:60]))
    (ROOT / "_work" / "regen_needed.txt").write_text(
        "\n".join(name for _n, name in papers), encoding="utf-8")
    print("wrote _work/regen_needed.txt")


if __name__ == "__main__":
    main()
