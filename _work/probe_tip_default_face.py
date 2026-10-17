r"""How many pictures declare a `>=` arrow-tip default, and what their lines come out as.

pgf's `>=<name>` is a picture-wide declaration that changes what a bare `->` means: TikZ's own default
`>` is the classic arrowhead, `>=Stealth` asks for the solid concave one, `>=latex` for the LaTeX
arrow. #36 taught the emitter the NAME when it is written on the arrow itself (`-{Stealth}->` gives
`mark: (end: (symbol: ">>", fill: black))`), while `_arrow_spec` reads `>=stealth` as "declares what
`>` means without drawing anything" and drops it -- so a picture that sets the default gets a
default-less mark on every one of its arrows. `_work/shot_clip.py` on Kurosh p36 is what made this
visible: ten solid heads in the pdflatex control, ten hollow V's in the product.

This asks, over every picture that builds: which `>=` values the corpus writes (a regex over the
source, so a `>=` arriving through `\tikzset` or a style counts too), and in the canvases of those
pictures how many `mark:` lines are still the bare-character spelling -- which is what CeTz draws as
an unfilled V. A named tip always goes out as `(symbol: ..., fill: ...)`.

Run against the live code it is also the residue gauge: a `mark:` with no `symbol:` is a head drawn as
an open V, but the family is wider than the tip default (`|`, `[`, `+` sides are spelled that way and no
`>=` reaches them), so the count that answers "did the reheading land" is the subset holding a
bare `">"` or `"<"` character.
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
MARK = re.compile(r"mark: \([^)]*\)")
ANGLE = re.compile(r'"[<>]"')
# where the declaration is written: the picture's own option list, or somewhere below it
PICOPT = re.compile(r"\\begin\{tikzpicture\}\s*(\[[^\]]*\])", re.S)


def main():
    words = Counter()
    pics_declaring = papers = 0
    declared = set()
    bare_pics = bare_lines = named_lines = 0
    angle_pics = angle_lines = 0
    old_pics = old_lines = 0
    rest = Counter()
    where = Counter()
    family = Counter()
    live = cetz.arrow_default
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        src = path.read_text(encoding="utf-8", errors="replace")
        for pic in PIC.findall(src):
            vals = [a or b for a, b in GE.findall(pic)]
            for v in vals:
                words[v] += 1
            if not vals:
                continue
            pics_declaring += 1
            head = PICOPT.match(pic)
            in_head = head is not None and ">=" in (head.group(1) or "")
            where["picture options" if in_head else "scope/style/tikzset"] += 1
            family["%s:%s" % (vals[0].lower(), "same" if len(set(
                v.lower() for v in vals)) == 1 else "mixed")] += 1
            if path.stem not in declared:
                declared.add(path.stem)
                papers += 1
            built = cetz.build(pic)
            if built is None:
                continue
            cetz.arrow_default = lambda val: None
            unbuilt = cetz.build(pic)
            cetz.arrow_default = live
            marks = MARK.findall(built)
            named = [m for m in marks if "symbol:" in m]
            bare = [m for m in marks if "symbol:" not in m]
            named_lines += len(named)
            angle = [m for m in bare if ANGLE.search(m)]
            if angle:
                angle_pics += 1
                angle_lines += len(angle)
                rest[path.stem] += len(angle)
            old = [m for m in MARK.findall(unbuilt)
                   if "symbol:" not in m and ANGLE.search(m)]
            if old:
                old_pics += 1
                old_lines += len(old)
            if bare:
                bare_pics += 1
                bare_lines += len(bare)
    print("`>=` values written (occurrences):")
    for w, n in words.most_common():
        print("   %-18s %d" % (w, n))
    print("pictures declaring a tip default: %d over %d papers" % (pics_declaring, papers))
    for k, n in where.most_common():
        print("   written in %-22s %d" % (k + ":", n))
    for k, n in family.most_common():
        print("   first value %-22s %d" % (k + ":", n))
    print("   bare V heads with the guard withdrawn: %d pics, %d lines"
          % (old_pics, old_lines))
    print("   bare V heads as the code now stands:   %d pics, %d lines"
          % (angle_pics, angle_lines))
    print("   lines already carrying a named tip: %d" % named_lines)
    print("   lines with a mark no `>=` reaches ( | [ + ... ): %d over %d pics"
          % (bare_lines - angle_lines, bare_pics))
    for stem, n in rest.most_common(10):
        print("   still open V> %s (%d)" % (stem[:58], n))
    for stem in sorted(declared)[:5]:
        print("   paper> %s" % stem[:62])


if __name__ == "__main__":
    main()
