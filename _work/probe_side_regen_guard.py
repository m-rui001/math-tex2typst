r"""Which papers' canvases the `above=20pt` fix actually changes, and whether any figure is lost.

The rule under test is additive: a node whose side key carries a dimension gains an anchor and a
shift, and every other canvas must come out byte-for-byte the same. Replaying the OLD behaviour is
therefore a matter of stubbing the one helper the new code consults -- `cetz._side_key` answering
None puts both `_node_anchor` and `_node_shift` back exactly as they were -- so the diff is the
change's true blast radius rather than a keyword guess.

Prints canvases built before/after, how many changed, and refuses to call it a day if a canvas that
built before stops building (a lost figure is the one regression this batch must never ship).
Writes the affected paper names to `_work/regen_needed.txt` for `_work/regen_list.py`.
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
live = cetz._side_key


def build_with(pic, side_key):
    cetz._side_key = side_key
    try:
        return cetz.build(pic)
    finally:
        cetz._side_key = live


def main():
    before = after = changed = lost = 0
    papers = []
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        hit = 0
        for pic in PIC.findall(text):
            old = build_with(pic, lambda o: None)
            new = build_with(pic, live)
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
    for n, name in sorted(papers, reverse=True)[:10]:
        print("  %3d  %s" % (n, name[:60]))
    (ROOT / "_work" / "regen_needed.txt").write_text(
        "\n".join(name for _n, name in papers), encoding="utf-8")
    print("wrote _work/regen_needed.txt")


if __name__ == "__main__":
    main()
