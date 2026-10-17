"""Two checks after the envelope lookbehind: a wrapped display still draws, the blob does not.

`convert` must still see past `\[` and `\]` when a picture really is set inside a display, and
must now refuse the Kurosh picture that only drew because its source was mangled.
"""
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
DISPLAY = re.compile(r"\\\[.*?\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}.*?\\\]", re.S)

wrapped = 0
draws = 0
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for disp in DISPLAY.findall(src):
        if not PIC.search(disp):
            continue
        wrapped += 1
        if cetz.convert(disp):
            draws += 1
        elif wrapped <= 4:
            print("refused: %s | %s" % (path.stem[:48], " ".join(disp.split())[:120]))

print({"displays holding a picture": wrapped, "still draw": draws})

kurosh = next(p for p in pathlib.Path("_work", "flat").glob("A-Counterexample-to-Kurosh*.tex"))
for i, pic in enumerate(PIC.findall(kurosh.read_text(encoding="utf-8", errors="replace"))):
    got = cetz.convert(pic)
    print("kurosh picture %d: %s" % (i, "none" if not got else "%d chars" % len(got)))
