r"""Convert the three papers whose captions pandoc dropped, and read what the lift changed.

Each is expected to keep its caption's own words, give the float a number, and stop reporting a
dangling reference for that name; a compile failure here is the reason not to ship the rule.
"""
import json
import pathlib
import re
import sys
import tempfile

sys.path.insert(0, "tools")
from t2t.convert import convert_paper

CASES = [
    ("A-positive-solution-to-Tingleys", "aligned chords of Proposition"),
    ("An-integral-scalar-curvature", "the resolution metric"),
    ("A-boundary-field-gap", None),
]
ROOT = pathlib.Path("_work/flat")

for stem, needle in CASES:
    src = next(iter(ROOT.glob("%s*.tex" % stem)), None)
    if src is None:
        print("missing", stem)
        continue
    with tempfile.TemporaryDirectory() as folder:
        out = pathlib.Path(folder)
        rep = convert_paper(str(src), str(out), "lift")
        text = (out / "main.typ").read_text(encoding="utf-8")
        stats = rep.get("stats") or {}
        line = ("%-42s compile=%s figures=%s tables=%s dangling=%s"
                % (src.stem[:42], rep["compile_ok"], rep.get("figures"),
                   rep.get("tables"), stats.get("dangling_ref", 0)))
        if needle:
            line += "  caption words on page=%s" % (needle in text)
        print(line)
        if not rep["compile_ok"]:
            print("   ERR", rep.get("compile_err_full", "")[:300].replace("\n", " "))
