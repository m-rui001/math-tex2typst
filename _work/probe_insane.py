"""Print the canvas line that makes cetz.sane reject a picture.

sane() checks each canvas line for balanced [ ], $ and ( ) after deleting every backslash plus
one character, and the refusal report only says "insane" — nobody has read the line itself. This
builds the canvas for every flat picture that reaches that guard and writes the offending lines, so
the fix is written against real text rather than a guess about the guard.

Usage: python _work/probe_insane.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)


def bad_lines(canvas):
    out = []
    for line in canvas.splitlines()[2:-1]:
        stripped = re.sub(r"\\.", "", line)
        why = []
        if stripped.count("[") != stripped.count("]"):
            why.append("brackets")
        if stripped.count("$") % 2:
            why.append("dollars")
        if stripped.count("(") != stripped.count(")"):
            why.append("parens")
        if why:
            out.append((",".join(why), line))
    return out


rows = []
count = 0
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.finditer(text):
        core = cetz.MATH_ENVELOPE.sub("", pic.group(0))
        canvas = cetz.build(core)
        if canvas is None or cetz.sane(canvas):
            continue
        count += 1
        for why, line in bad_lines(canvas):
            rows.append("%s\n  [%s] %s" % (tex.stem[:60], why, line.strip()[:220]))

print("pictures whose canvas fails sane: %d" % count)
pathlib.Path(ROOT / "_work" / "insane_lines.txt").write_text("\n\n".join(rows), encoding="utf-8")
print("\n".join(rows[:12]))
print("wrote _work/insane_lines.txt (%d lines)" % len(rows))
