r"""Which canvases the accent fix changes, and whether any figure is lost on the way.

The rule is again additive: a node body that writes no accent must come out byte-for-byte the same,
so replaying the OLD behaviour is a matter of stubbing the one helper the new code calls --
`cetz._accents` handing its argument straight back. Prints changed canvases and papers, and refuses
to call the run a day if a canvas that built before stops building.
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
live = cetz._accents


def build_with(pic, accents):
    cetz._accents = accents
    try:
        return cetz.build(pic)
    finally:
        cetz._accents = live


def main():
    before = after = changed = lost = 0
    papers = []
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        hit = 0
        for pic in PIC.findall(text):
            old = build_with(pic, lambda s: s)
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
    for n, name in papers:
        print("  %3d  %s" % (n, name[:60]))
    (ROOT / "_work" / "accent_needed.txt").write_text(
        "\n".join(name for _n, name in papers), encoding="utf-8")
    print("wrote _work/accent_needed.txt")


if __name__ == "__main__":
    main()
