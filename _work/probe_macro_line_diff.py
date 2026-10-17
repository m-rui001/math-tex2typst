r"""Print the canvas lines that in-picture macro expansion actually changes.

The aggregate probe says 39 pictures differ outside their math spans; whether that is the label
losing its stripped text or the drawing moving is only visible line by line.
"""
import difflib, pathlib, re, sys
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, macros, prep

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINES = re.compile(r"\\(?:newcommand|renewcommand|def|DeclareMathOperator)\s*\{?\s*\\([a-zA-Z]+)")

shown = 0
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    if not DEFINES.search(text):
        continue
    pre, _ = prep.split_document(text)
    table, _ = macros.parse_definitions(pre)
    if not table:
        continue
    for pic in PICTURE.finditer(text):
        src = pic.group(0)
        exp = macros.expand(src, table)
        if exp == src:
            continue
        core_a = cetz.MATH_ENVELOPE.sub("", src)
        core_b = cetz.MATH_ENVELOPE.sub("", exp)
        a = cetz.build(core_a) or cetz.build_cd(core_a)
        b = cetz.build(core_b) or cetz.build_cd(core_b)
        if not a or not b or a == b:
            continue
        diff = [l for l in difflib.unified_diff(a.split("  "), b.split("  "), lineterm="", n=0)
                if l[:1] in "+-" and l[1:2] not in ("+", "-")]
        if not diff:
            continue
        shown += 1
        if shown > 5:
            break
        print("== %s" % tex.stem[:46])
        for l in diff[:6]:
            print("   %s" % l.strip()[:150])
    if shown > 5:
        break
