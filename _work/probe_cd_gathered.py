r"""Show how build_cd parses the Abundance proof-map diagram: rows, cells, canvas.

The diagram's cells hold `\begin{gathered} A \\ B \end{gathered}`, whose `\\` is also the
row separator, so the first question is whether the cell survives parsing at all.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

tex = ""
for path in (ROOT / "_work" / "flat").glob("Abundance-in-numerical-dimension-one*.tex"):
    t = path.read_text(encoding="utf-8", errors="replace")
    m = re.search(r"\\begin\{tikzcd\}.*?\\end\{tikzcd\}", t, re.S)
    tex = m.group(0)
    break
print("---- source diagram ----")
print(tex)

rows = [cetz.split_top(line, "&") for line in cetz.LINEBREAK.split(cetz.CD_ENV.search(tex).group(2))]
print("---- parsed rows: %d ----" % len(rows))
for r, cells in enumerate(rows):
    for c, cell in enumerate(cells):
        if cell.strip():
            print("  r%d c%d: %r" % (r, c, cell.strip()[:90]))

print("---- build_cd output ----")
canvas = cetz.build_cd(tex)
print("REFUSED (None)" if canvas is None else canvas)
