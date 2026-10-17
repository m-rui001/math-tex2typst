"""How many floats does the caption lift create whose only content is the \\mbox{} placeholder?

run61 reported 13 "empty figures" over 9 papers where run59 reported 2, so the question is whether
the lifted caption floats are the difference -- a float with a caption and no drawing.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import prep

ROOT = pathlib.Path(__file__).resolve().parents[1]
LIFTED_FLOAT = re.compile(r"\\begin\{(?:figure|table)\}\\caption(?:[^;]*?)\\mbox\{\}\n"
                          r"\\end\{(?:figure|table)\}", re.S)
papers = 0
floats = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    body = path.read_text(encoding="utf-8", errors="replace")
    lifted = prep.lift_captions(body)
    n = len(LIFTED_FLOAT.findall(lifted))
    if n:
        papers += 1
        floats += n
        print("%2d  %s" % (n, path.stem[:46]))
print("caption-only floats the rule creates: %d over %d papers" % (floats, papers))
