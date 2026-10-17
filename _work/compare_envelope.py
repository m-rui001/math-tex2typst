"""Build-only before/after for the envelope lookbehind, over every picture in the corpus.

The gate's compile step would pay typst for 900 canvases; the question here is only which
pictures the parser can draw. Run the same build on the source as it stands and on the source
with the old, unanchored envelope strip, so the recovered and the newly honest refusals are
both counted.
"""
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

OLD = re.compile(r"\\(?:begin|end)\{(?:equation|gather|multline|align|displaymath)"
                 r"\*?\}|\\label\{[^{}]*\}|\\tag\{[^{}]*\}|\\\[|\\\]")
ENV = re.compile(r"\\begin\{(?:tikzpicture|tikzcd|CD)\}.*?\\end\{(?:tikzpicture|tikzcd|CD)\}",
                 re.S)


def draw(src):
    core = cetz.MATH_ENVELOPE.sub("", src)
    return bool(cetz.build(core) or cetz.build_cd(core))


def draw_old(src):
    core = OLD.sub("", cetz.MATH_ENVELOPE.sub("", src))
    return bool(cetz.build(core) or cetz.build_cd(core))


tally = {"pictures": 0, "draws now": 0, "drew before": 0, "gained": 0, "made honest": 0}
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in ENV.findall(src):
        tally["pictures"] += 1
        got, was = draw(pic), draw_old(pic)
        tally["draws now"] += got
        tally["drew before"] += was
        if got and not was:
            tally["gained"] += 1
            print("gained: %s" % path.stem[:62])
        if was and not got:
            tally["made honest"] += 1
            print("refuses a mangled drawing: %s" % path.stem[:62])

print(tally)
