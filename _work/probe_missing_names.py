"""How are the missing coordinate names actually made?

Three refusals all print `0 coords known`, which is not a bad anchor or a bad style -- it means
`register` never saw the `\coordinate`/`\node` lines that should have created those names. Print the
picture body before and after the expander chain so the shape that survives expansion is visible.
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PREFIX, PIC = sys.argv[1], int(sys.argv[2])
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

path = next(p for p in sorted((ROOT / "_work" / "flat").glob("*.tex"))
            if p.name[:-4].startswith(PREFIX))
src = path.read_text(encoding="utf-8", errors="replace")
core = cetz.expand_linewidth(PICTURE.findall(src)[PIC], 15.79)
body = core[len("\\begin{tikzpicture}"):].lstrip()
head, pos = cetz._opts_at(body, 0)
body = body[pos:body.rfind("\\end{tikzpicture}")]
print("---- RAW ----")
print(body[:900])
exp = cetz.expand_ifnum(cetz.expand_pgfmath(cetz.expand_def(cetz.expand_foreach(cetz.expand_def(body)))))
print("---- EXPANDED ----")
print((exp or body)[:900])
if exp is not None:
    for i, (s, xf) in enumerate(cetz.scoped(exp, cetz._transform(head))[:14]):
        print("  stmt[%d]: %s" % (i, " ".join(s.split())[:120]))
