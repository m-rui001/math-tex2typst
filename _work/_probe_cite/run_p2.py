r"""What the maths channel gives back for the upright cite tokens and for the note prose.

The lift writes ZQCT<mode>,<keys> as its own \\text run and leaves the note as another \\text run;
this reads what pandoc's typst writer makes of both, including a note with an en dash, a pair of
TeX quotes and a key carrying an underscore.
"""
import io
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import mathconv  # noqa: E402

SRC = os.path.join(ROOT, "_work", "_probe_cite", "p2.tex")
body = io.open(SRC, encoding="utf-8").read()
out, err = mathconv.run_pandoc(body)
io.open(os.path.join(ROOT, "_work", "_probe_cite", "p2_typst.txt"), "w", encoding="utf-8").write(
    "=== typst ===\n" + out + "\n=== stderr ===\n" + err)
print(out.encode("unicode_escape").decode().replace("\\n", "\n"))
print("=== stderr ===")
print(err.encode("unicode_escape").decode())
