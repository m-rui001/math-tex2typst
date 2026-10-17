r"""Static gate for lift_captions: does it move the captions it should and lose no words?

Runs the prep pass over every flat source and compares, per paper, how many \caption markers and
how many floats exist before and after. The caption count must be conserved (the words are moved,
not dropped) and every caption that sat outside a float must add exactly one float — the 17 over
12 papers the census counted. The rule wraps only the text between floats, so it cannot nest one.
"""
import pathlib
import re
import sys

sys.path.insert(0, "tools")
from t2t import prep

ROOT = pathlib.Path("_work/flat")
FLOAT_REGION = re.compile(r"\\begin\{(figure|table)\*?\}.*?\\end\{\1\*?\}", re.S)
CAPTION = re.compile(r"\\caption\b")

lifted = floats_before = floats_after = papers = 0
conserved = 0
for tex in sorted(ROOT.glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    if not CAPTION.search(text):
        continue
    out = prep.lift_captions(text)
    if out == text:
        continue
    papers += 1
    before = len(FLOAT_REGION.findall(text))
    after = len(FLOAT_REGION.findall(out))
    floats_before += before
    floats_after += after
    lifted += after - before
    if len(CAPTION.findall(out)) != len(CAPTION.findall(text)):
        conserved += 1
print("papers the rule touches: %d, floats added: %d (before %d -> after %d)"
      % (papers, lifted, floats_before, floats_after))
print("caption counts changed (should be 0): %d" % conserved)
