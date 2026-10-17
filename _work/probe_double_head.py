r"""Which CeTz end-mark spells a double-headed tikzcd arrow with?

tikzcd's 'two heads' draws >> at the tip. The canvas gate compiles what we emit, so an
unsupported mark costs nothing but the diagram falls back; this says which spelling is
worth keeping.
"""
import io
import pathlib
import subprocess
import sys
import tempfile

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PRE = '#import "@preview/cetz:0.4.2"\n#cetz.canvas({\n'
USE = "  using cetz.draw\n"


def try_canvas(body):
    src = PRE + USE + body + "})\n"
    d = pathlib.Path(tempfile.mkdtemp())
    f = d / "t.typ"
    f.write_text(src, encoding="utf-8")
    r = subprocess.run(["typst", "compile", "--diagnostics", str(f), str(d / "t.pdf")],
                       capture_output=True, text=True, encoding="utf-8")
    ok = r.returncode == 0
    print("%-46s %s" % (body.strip()[:44], "OK" if ok else "FAIL"))
    if not ok:
        err = (r.stderr or r.stdout).replace("\n", " ")
        print("      " + err[:200])
    return ok


for mark in ('">>"', '">->>"', '">"', '"monoto"', '"two heads"'):
    try_canvas('  line((0, 0), (2, 0), end: %s,\n    mark: (end: "%%")\n    )\n'
              .replace("%%", mark[1:-1]))

# the shape the emitter actually builds: cd_mark's args inside a line
src = "A \\\\arrow[r, two heads, \"f\"] B"
print("\nreal diagram:")
print(cetz.convert("\\begin{tikzcd}\n%s\n\\end{tikzcd}" % (src,)) or "refused")
