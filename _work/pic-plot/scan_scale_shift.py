r"""How many pictures in the corpus already mix a scope shift with a `scale=`?

That combination is the one this family's honeycomb picture falls into, and the converter's
`_compose` says a scope shift arrives already in page centimetres -- true of `x=`/`y=`, measured as
false of `scale=` -- so a shifted scope inside a scaled picture lands away from where TeX puts it.
Counting the pictures that would show it says whether the plot patch unblocks anything of the sort.

Run: python _work/pic-plot/scan_scale_shift.py
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from t2t import cetz  # noqa: E402

FLAT = Path("E:/math/_work/flat")
SCOPE_OPTS = re.compile(r"\\begin\s*\{\s*scope\s*\}\s*(\[[^\]]*\]|\{[^\}]*\})")
MOVED = re.compile(r"xshift|yshift|shift=")
SCALED = re.compile(r"(?<![a-z])scale\s*=")

moved = scaled = both = 0
for path in sorted(FLAT.glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="ignore")
    for pic in (m.group(0) for m in cetz.PICTURE_ENV.finditer(src)):
        # every option list the picture carries, the scopes' and the picture's own head alike
        lists = [m.group(1) for m in SCOPE_OPTS.finditer(pic)]
        head = re.match(r"\\begin\{(?:tikzpicture|tikzcd|CD)\}\s*(\[[^\]]*\])?", pic)
        if head and head.group(1):
            lists.append(head.group(1))
        has_move = any(MOVED.search(l) for l in lists)
        has_scale = any(SCALED.search(l) for l in lists)
        moved += has_move
        scaled += has_scale
        if has_move and has_scale:
            both += 1
            print("both:", path.name[:60], pic[:70].replace("\n", " "))
print("pictures with a scope shift: %d, with a scale=: %d, with both: %d" % (moved, scaled, both))
