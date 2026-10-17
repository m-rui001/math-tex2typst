"""Print typst's own words for one canvas, so a compile gate that reports failure is read
rather than assumed. `python _work/probe_typst_words.py grown|plain`."""
import pathlib
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

name = "Self-dual-random-cluster-interfaces-below-one-September-23-2026"
src = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8", errors="replace")
pic = cetz.PICTURE_ENV.search(src).group(0)
core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), 15.79)
canvas = cetz.build(core)
if sys.argv[1:2] == ["plain"]:
    canvas = canvas.replace("align: center, ", "")
with tempfile.TemporaryDirectory() as tmp:
    f = pathlib.Path(tmp) / "t.typ"
    f.write_text(cetz.HEADER + "#set page(width: 300pt, height: 300pt)\n" + canvas,
                 encoding="utf-8")
    r = subprocess.run(["typst", "compile", str(f), str(pathlib.Path(tmp) / "t.pdf")],
                       capture_output=True)
print("returncode", r.returncode)
print(r.stderr.decode("utf-8", "replace")[:1500])
