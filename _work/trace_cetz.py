"""Stage-by-stage trace of one tikzpicture through cetz.convert."""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

T = pathlib.Path(ROOT / "_work" / "sample.tex").read_text(encoding="utf-8").strip()

body = T[len("\\begin{tikzpicture}"):]
body = body[:body.rfind("\\end{tikzpicture}")]
head, pos = cetz._opts_at(body.lstrip(), 0)
body = body.lstrip()[pos:]
expanded = cetz.expand_foreach(body)
print("foreach ->", "REFUSED" if expanded is None else "ok")
print("unsupported:", cetz.UNSUPPORTED.search(expanded or ""))
placed = cetz.scoped(expanded)
print("scoped ->", "REFUSED" if placed is None else len(placed))
for stmt, xf in placed or []:
    print("   xf=%s  %r" % (xf, stmt[:70]))
names = {}
for stmt, xf in placed or []:
    cetz.register(stmt, names, xf)
print("names", names)
for stmt, xf in placed or []:
    got = cetz.translate_statement(stmt, names, xf)
    print("%-6s %r" % ("OK" if got is not None else "FAIL", stmt[:60]))
    for line in got or []:
        print("        ", line)
print()
print(cetz.convert(T) or "REFUSED")
