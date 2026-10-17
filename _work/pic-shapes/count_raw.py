r"""Count the pictures of an owned paper the converter draws, with a chosen t2t tree.

Run twice, once against the untouched `tools/` copy and once against the patched sandbox, so
status.txt reports the raw-block count before and after the same change rather than a remembered
one. `sane` is checked as well because the production gate is `build` and `sane` together; the
typst compile gate is the third part and this task must not run it.

Usage: python count_raw.py <t2t-parent-dir> <paper-glob>
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / sys.argv[1].replace("\\", "/")))
from t2t import cetz, convert, prep  # noqa: E402

pattern = sys.argv[2]
path = next((ROOT / "_work" / "flat").glob(pattern + "*.tex"))
src = path.read_text(encoding="utf-8", errors="replace")
pre, _ = prep.split_document(src)
p = prep.parse_preamble(pre)
cm = convert.line_cm(p)
core = cetz.MATH_ENVELOPE.sub("", src)
pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", core, re.S)
drawn = quoted = 0
for i, pic in enumerate(pics):
    canvas = cetz.build(cetz.expand_linewidth(pic, cm), p.colors)
    ok = bool(canvas) and cetz.sane(canvas)
    drawn += 1 if ok else 0
    quoted += 0 if ok else 1
    print("  pic %d: %s%s" % (i, "canvas" if ok else "RAW",
                              "" if ok or canvas is None else " (builds but sane rejects)"))
print("%s: %d pictures, %d drawn, %d quoted verbatim" % (path.name, len(pics), drawn, quoted))
