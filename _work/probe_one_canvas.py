"""Print the whole canvas a paper's picture builds to, and what typst says about it.

`cetz.compiles` keeps only the exit code; a gate refusal that is reproducible needs the error text
to be worth anything.
"""
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

LC = 15.79
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINECOLOR = re.compile(r"\\definecolor\{([-\w]+)\}\{(\w+)\}\{([^{}]*)\}")

paper = sys.argv[1]
path = next((ROOT / "_work" / "flat").glob(paper + "*.tex"))
src = path.read_text(encoding="utf-8", errors="replace")
pal = {m.group(1): (m.group(2), m.group(3)) for m in DEFINECOLOR.finditer(src)}
want = int(sys.argv[2]) if len(sys.argv) > 2 else 0
for i, m in enumerate(PICTURE.finditer(src)):
    if i != want:
        continue
    core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), LC)
    canvas = cetz.build(core, pal)
    print("=== source picture %d ===\n%s" % (i, " ".join(core.split())))
    print("=== canvas ===\n%s" % canvas)
    print("=== sane: %s" % cetz.sane(canvas))
    out = pathlib.Path(ROOT / "_work" / "gate_canvas.typ")
    out.write_text(cetz.HEADER + "#set page(width: 300pt, height: 300pt)\n" + canvas, encoding="utf-8")
    r = subprocess.run(["typst", "compile", str(out), str(out.with_suffix(".pdf"))],
                       capture_output=True, encoding="utf-8", errors="replace")
    print("=== typst rc=%d ===\n%s%s" % (r.returncode, r.stdout, r.stderr))
