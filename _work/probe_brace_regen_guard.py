r"""Which canvases the script-group fix changes, how many scripts each is, and whether any picture is lost.

One function carries the round: `cetz._group_scripts` rewrites a braced script into the grouping Typst
actually honours (`x_{i+1}` -> `x_(i+1)`), where before only an all-alphanumeric body was unwrapped and
every compound body kept its braces -- which Typst draws. Stub the function back to that old single
substitution and the two builds differ by exactly this round's face.

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
# the substitution the code performed before this round
OLD_RX = re.compile(r"([\^_])\{([A-Za-z0-9]+)\}")
NEW_GROUP = re.compile(r"[\^_]\((?:[^()]|\([^()]*\))*\)")
LEFT_BRACE = re.compile(r"[\^_]\{")


def build_old(pic):
    live = cetz._group_scripts
    cetz._group_scripts = lambda tex: OLD_RX.sub(
        lambda m: (m.group(1) + "(" + " ".join(m.group(2)) + ")")
        if len(m.group(2)) > 1 and m.group(2).isalpha() else m.group(1) + m.group(2), tex)
    try:
        return cetz.build(pic)
    finally:
        cetz._group_scripts = live


def main():
    before = after = changed = lost = 0
    scripts = braces = 0
    papers = []
    samples = []
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
                    for line in new.splitlines():
                        if line in had:
                            continue
                        scripts += len(NEW_GROUP.findall(line))
                        left = len(LEFT_BRACE.findall(line))
                        braces += left
                        if left and len(samples) < 8:
                            samples.append("%s | %s" % (path.stem[:28], line.strip()[:110]))
            if new is not None:
                after += 1
        if hit:
            papers.append((hit, path.stem))
    print("canvases built: before %d, after %d" % (before, after))
    print("canvases changed: %d over %d papers, lost: %d" % (changed, len(papers), lost))
    print("   script groups written: %d   still braced on a changed line: %d" % (scripts, braces))
    for line in samples:
        print("   still braced> %s" % line)
    for n, name in sorted(papers, reverse=True)[:8]:
        print("  %3d  %s" % (n, name[:60]))
    (ROOT / "_work" / "regen_needed.txt").write_text(
        "\n".join(name for _n, name in papers), encoding="utf-8")
    print("wrote _work/regen_needed.txt with %d papers" % len(papers))


if __name__ == "__main__":
    main()
