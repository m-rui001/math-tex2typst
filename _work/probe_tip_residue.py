r"""Which declaring pictures still hand out an open V, and what the source says around each one.

`_work/probe_tip_default_face.py` counts the face: 453 pictures declare `>=<name>`, and with #43's
guard live **6 canvases keep 41 bare `">"`/`"<"` marks**. Two causes are possible and they want
different answers: the picture's value may be one the guard refuses to translate (an unmeasured name
keeps its characters rather than a guess), or the tip may be written on a statement pgf executes
*before* the declaration takes effect -- `<->` in front of `>=Stealth` inside the same option list,
which is why the 3 statement-level `>=` writers were left alone.

This prints, for each of the 6: every `>=` in the picture with the text around it, and every line of
the canvas that still carries a bare mark.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
GE = re.compile(r">=\s*(?:\{\s*([A-Za-z]+)\s*\}|([A-Za-z]+))")
MARK = re.compile(r"mark: \([^)]*\)")
ANGLE = re.compile(r'"[<>]"')
STMT = re.compile(r"\\(?:draw|path|fill|filldraw|shade|foreach)\b")


def main():
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        src = path.read_text(encoding="utf-8", errors="replace")
        for pic in PIC.findall(src):
            if not GE.search(pic):
                continue
            built = cetz.build(pic)
            if built is None:
                continue
            bare = [l.strip() for l in built.splitlines()
                    if "mark:" in l and "symbol:" not in l and ANGLE.search(l)]
            if not bare:
                continue
            print("== %s" % path.stem[:70])
            for m in GE.finditer(pic):
                start = max(0, m.start() - 60)
                print("   decl> ...%s" % pic[start:m.end() + 24].replace("\n", " "))
            for value in {a or b for a, b in GE.findall(pic)}:
                print("   guard> %s -> %r" % (value, cetz.arrow_default(value)))
            for line in bare:
                print("   open > %s" % line[:150])
            print("   statements: %d, decl sites: %d"
                  % (len(STMT.findall(pic)), len(GE.findall(pic))))


if __name__ == "__main__":
    main()
