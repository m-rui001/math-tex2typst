"""`to[out=,in=]` now curves instead of drawing a chord.

Asserts the control-point construction on canonical shapes, then walks every corpus picture that
mentions a tangent option: how many build, how many emit a bezier, and the first few through
cetz.convert's typst compile gate.
"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TANGENT = re.compile(r"\s(?:to|edge)\s*\[[^\]]*\b(?:out|in)\s*=")


def emit(src):
    return str(cetz.build("\\begin{tikzpicture}" + src + "\\end{tikzpicture}"))


def check(name, src, expect):
    out = emit(src)
    ok = expect in out
    print("%-28s %s  %s" % (name, "OK" if ok else "FAIL",
                            " ".join(out.split())[:110]))
    return ok


good = 0
good += check("out=90,in=180", r"\draw (0,0) to[out=90,in=180] (2,0);",
              'bezier((0, 0), (2, 0), (4.776e-17, 0.78), (1.22, 9.552e-17)')
good += check("out=30 only", r"\draw (0,0) to[out=30] (2,0);",
              'bezier((0, 0), (2, 0), (0.6755, 0.39), (1.448, 0.5515)')
good += check("bend still works", r"\draw (0,0) to[bend left=90] (2,0);", "bezier(")
good += check("plain to stays straight", r"\draw (0,0) to (2,0);", "line(")
good += check("controls still works", r"\draw (0,0) .. controls (1,2) and (3,2) .. (4,0);",
              "bezier(")

built = curved = 0
samples = []
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if not TANGENT.search(pic):
            continue
        res = cetz.build(pic)
        if res is None:
            continue
        built += 1
        if "bezier(" in str(res):
            curved += 1
            if len(samples) < 3:
                samples.append((f.stem, pic))

print("corpus pictures with a tangent option: built=%d emitting bezier=%d" % (built, curved))
for stem, pic in samples:
    got = cetz.convert(pic)
    print("  convert %-55s %s" % (stem[:55], "compiled" if got else "REFUSED"))
