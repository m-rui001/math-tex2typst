r"""Which canvases the mid-frame centring changes, and whether any picture is lost.

One call is this round: the body of a `content(range, ..., frame:)` goes from Typst's top-left to
`#align(<horizontal> + horizon)`. The old canvas is replayed by stubbing the single function that makes
the body -- `_box_body` answering the bare `[text]` on the range path (`horizon=True`) and the live
thing on the two paths that already centred horizontally, so their spelling is not counted here.
Prints built before/after, how many canvases changed and over how many papers, splits the new lines by
the frame they sit in, and refuses to call it a day if a canvas that built before stops building.
Writes `_work/regen_align.txt` for `_work/regen_list.py`.
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
LIVE = cetz._box_body
FRAME = re.compile(r'frame: "(\w+)"')
HORIZON = re.compile(r"#align\((\w+) \+ horizon\)")


def build_old(pic):
    cetz._box_body = lambda text, align, horizon=False: (
        "[%s]" % text) if horizon else LIVE(text, align)
    try:
        return cetz.build(pic)
    finally:
        cetz._box_body = LIVE


def main():
    before = after = changed = lost = refused = 0
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
                    had = set(old.splitlines())
                    for line in new.splitlines():
                        if line in had:
                            continue
                        m = HORIZON.search(line)
                        if m:
                            kinds["centred %s / %s"
                                  % (FRAME.search(line).group(1) if FRAME.search(line) else "?",
                                     m.group(1))] += 1
                        else:
                            kinds["other"] += 1
                            if len(other) < 10:
                                other.append("%s | %s" % (path.stem[:34], line.strip()[:110]))
            if new is not None:
                after += 1
                if old is None:
                    gained.append("%s pic %d" % (path.stem[:52], n))
                    hit += 1
            elif old is None:
                refused += 1
        if hit:
            papers.append((hit, path.stem))
    print("canvases built: before %d, after %d (refused both ways: %d)"
          % (before, after, refused))
    print("canvases changed: %d over %d papers, lost: %d" % (changed, len(papers), lost))
    for kind, cnt in kinds.most_common():
        print("   %-26s %d lines" % (kind, cnt))
    for line in other:
        print("   other> %s" % line)
    for line in gained:
        print("   gained> %s" % line)
    for cnt, name in sorted(papers, reverse=True)[:12]:
        print("  %3d  %s" % (cnt, name[:60]))
    (ROOT / "_work" / "regen_align.txt").write_text(
        "\n".join(name for _c, name in papers), encoding="utf-8")
    print("wrote _work/regen_align.txt")


if __name__ == "__main__":
    main()
