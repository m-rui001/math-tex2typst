r"""Of the pictures a paper macro touches, how many change shape and not just label text?

Expanding inside a picture is measured-safe for the refuse gate, but a macro can also stand for a
whole TikZ statement. This compares the two canvases line by line and keeps the ones whose
difference is not inside a label's $...$, which is the case that would redraw the picture.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, macros, prep  # noqa: E402

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINES = re.compile(r"\\(?:newcommand|renewcommand|def|DeclareMathOperator)\s*\{?\s*\\([a-zA-Z]+)")
MATHY = re.compile(r"\$[^$]*\$")


def canvas(src):
    core = cetz.MATH_ENVELOPE.sub("", src)
    return cetz.build(core) or cetz.build_cd(core)


changed = text_only = touched = both_refused = 0
shape, samples = [], []
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
        # every picture a macro touch could rewrite, not only the ones whose maths names one:
        # a text macro behind \node {...} is exactly the case that moves the drawing
        if exp == src:
            continue
        touched += 1
        a, b = canvas(src), canvas(exp)
        if a is None and b is None:
            both_refused += 1
            continue
        if a == b or (a is not None and b is not None
                      and MATHY.sub("$", a) == MATHY.sub("$", b)):
            text_only += 1
        elif a is None or b is None:
            shape.append("%s  %s -> %s" % (tex.stem[:40], "draws" if a else "refused",
                                           "draws" if b else "refused"))
        else:
            changed += 1
            if len(samples) < 6:
                samples.append("%s\n  -- %s" % (tex.stem[:44], b[:150].replace("\n", " ")))

print("pictures a macro rewrite touches: %d -- refused either way %d, same shape or maths-only "
      "%d, redraw %d, refuse flips %d"
      % (touched, both_refused, text_only, changed, len(shape)))
print("\n".join(shape[:12]))
print("\n".join(samples))
