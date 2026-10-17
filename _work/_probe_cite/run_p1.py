r"""What pandoc's typst writer does with a cite inside \text{} in maths.

Sentinels of a few shapes are put through the maths channel to see which one comes back as a
single recognisable token we can substitute a real #cite(...) into, and the untouched cite is
run to show what pandoc itself makes of it.
"""
import io
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import mathconv  # noqa: E402

SRC = os.path.join(ROOT, "_work", "_probe_cite", "p1.tex")
body = io.open(SRC, encoding="utf-8").read()
out, err = mathconv.run_pandoc(body)
io.open(os.path.join(ROOT, "_work", "_probe_cite", "p1_typst.txt"), "w", encoding="utf-8").write(
    "=== typst ===\n" + out + "\n=== stderr ===\n" + err)
print("wrote p1_typst.txt, out chars=%d err chars=%d" % (len(out), len(err)))
