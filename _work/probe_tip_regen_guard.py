r"""Which canvases the arrow-default fix changes, how many heads each is, and whether any picture is lost.

One function carries the round: `cetz.arrow_default` reads the picture's own `>=<name>` and answers the
tip it stands for, and `arrow_mark` writes that onto the bare `>`/`<` characters of every path in the
picture. Stub the reader back to `None` -- what it was before the round, when the declaration was read
and dropped -- and every canvas comes out the way it did before, so the difference between the two
builds IS this round's face. The stub is faithful in a way #40's was not: nothing else consumed the
head's `>` key, so no pre-existing behaviour is withdrawn with it.

Writes `_work/regen_needed.txt` for `_work/regen_list.py`.
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
GE = re.compile(r">=\s*(?:\{\s*([A-Za-z]+)\s*\}|([A-Za-z]+))")
STEALTH = re.compile(r'symbol: ">>"')
LATEX = re.compile(r'symbol: "\)>"')


def build_old(pic):
    live = cetz.arrow_default
    cetz.arrow_default = lambda val: None
    try:
        return cetz.build(pic)
    finally:
        cetz.arrow_default = live


def main():
    before = after = changed = lost = 0
    kinds = Counter()
    papers = []
    other = []
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
                    had = set(old.splitlines())
                    decl = [a or b for a, b in GE.findall(pic)]
                    for line in new.splitlines():
                        if line in had:
                            continue
                        if STEALTH.search(line):
                            kinds["stealth head (>> filled)"] += 1
                        elif LATEX.search(line):
                            kinds["latex head ()> filled)"] += 1
                        else:
                            kinds["other"] += 1
                            if len(other) < 8:
                                other.append("%s | %s" % (path.stem[:30], line.strip()[:100]))
                    if decl:
                        kinds["declared:%s" % decl[0].lower()] += 1
            if new is not None:
                after += 1
        if hit:
            papers.append((hit, path.stem))
    print("canvases built: before %d, after %d" % (before, after))
    print("canvases changed: %d over %d papers, lost: %d" % (changed, len(papers), lost))
    for kind, n in kinds.most_common():
        print("   %-26s %d" % (kind, n))
    for line in other:
        print("   other> %s" % line)
    for n, name in sorted(papers, reverse=True)[:8]:
        print("  %3d  %s" % (n, name[:60]))
    (ROOT / "_work" / "regen_needed.txt").write_text(
        "\n".join(name for _n, name in papers), encoding="utf-8")
    print("wrote _work/regen_needed.txt with %d papers" % len(papers))


if __name__ == "__main__":
    main()
