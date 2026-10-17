"""Every Xy-pic CD diagram through the converter that now claims to know them.

Run: python _work/probe_cd_xy_convert.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

CD = re.compile(r"\\begin\{CD\}(.*?)\\end\{CD\}", re.S)
ARROW = re.compile(r"@(?:[<>=VA|.]|\{(?:[^{}]|\{[^{}]*\})*\})+")
drawn = refused = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in CD.finditer(text):
        block = m.group(0)
        canvas = cetz.convert(block)
        if canvas:
            drawn += 1
            if drawn <= 2:
                print("== %s\n%s" % (path.stem[:48], canvas[:700]))
        else:
            refused += 1
            stuck = [t.group(0) for t in cetz.XY_TOKEN.finditer(m.group(1))
                     if cetz.xy_arrow(t.group(0), False) is None]
            print("REFUSE %s: %s" % (path.stem[:40], " ".join(block.split())[:90]))
            for tok in stuck[:4]:
                print("      stuck token: %s" % " ".join(tok.split())[:90])
print("\nCD drawn=%d refused=%d" % (drawn, refused))
