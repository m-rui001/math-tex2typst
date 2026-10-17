"""Which Typst spellings the installed compiler actually accepts for a node label.

`_math_body` maps a LaTeX command to a Typst identifier; a wrong guess is worse than an empty
one, because the compile gate would then refuse the whole picture. Compile each candidate as a
label on its own and keep the ones that pass.
"""
import pathlib
import subprocess
import sys
import tempfile

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

CANDIDATES = [
    "intersection", "union", "sect", "cup", "plus.o", "circle.plus", "o.plus",
    "arrow.b.double.long", "arrow.t.double.long", "Doublearrow.t", "ll.eq", "gt",
    "dot.op",
]


def ok(label):
    # the label has to be inside $ $: in content mode an unknown name is plain text and
    # always compiles, which would tell us nothing about the spelling
    canvas = "#cetz.canvas({\n  import cetz.draw: *\n  content((0, 0), [$%s$])\n})" % label
    with tempfile.TemporaryDirectory() as tmp:
        src = pathlib.Path(tmp) / "t.typ"
        src.write_text(cetz.HEADER + "#set page(width: 100pt, height: 60pt)\n" + canvas,
                       encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(src), str(pathlib.Path(tmp) / "t.pdf")],
                           capture_output=True)
    return r.returncode == 0


good, bad = [], []
for cand in CANDIDATES:
    (good if ok(cand) else bad).append(cand)
print("accepts:", " ".join(good))
print("rejects:", " ".join(bad))
