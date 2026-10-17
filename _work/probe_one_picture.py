"""Why does the grown branch not fire on the reproducing node?"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

name = sys.argv[1]
path = ROOT / "_work" / "flat" / (name + ".tex")
src = path.read_text(encoding="utf-8", errors="replace")
for i, m in enumerate(cetz.PICTURE_ENV.finditer(src)):
    core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), 15.79)
    canvas = cetz.build(core)
    n_frame = canvas.count('frame: "rect"') if canvas else -1
    n_box = canvas.count("#box(width:") if canvas else -1
    has_break = "linebreak" in core
    print("pic %d: built=%s frame-rect=%d grown=%d linebreak-in-source=%s"
          % (i, canvas is not None, n_frame, n_box, has_break))
    if canvas and "#box(width:" in canvas:
        for line in canvas.splitlines():
            if "#box(width:" in line:
                print("   ", line[:240])
