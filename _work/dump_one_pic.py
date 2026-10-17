r"""Print one picture's source verbatim, so a screenshot check knows what the node text should be.

`_work/render_pair.py` compiles the control; this says what to look for in it -- the words inside the
frames whose padding #46 just widened, and how many nodes carry an `inner xsep`/`inner ysep` pair.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)

stem = sys.argv[1]
index = int(sys.argv[2])
src = (ROOT / "_work" / "flat" / (stem + ".tex")).read_text(encoding="utf-8", errors="replace")
pics = [m.group(0) for m in PIC.finditer(src)]
print("pictures: %d, showing %d" % (len(pics), index))
print(pics[index][:2600])
