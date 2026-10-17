"""Papers whose *formulae* carry a citation: the real reach of the math-cite fix.

bake_refs only ever sees math, so a prose `\\citep` is pandoc's business and unaffected. A math
region is read as `$...$`, `\\[...\\]`, `\\(...\\)` or a math environment body.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
MATHSPAN = re.compile(
    r"\$\$?.{0,4000}?\$\$?"
    r"|\\begin\{(?:equation|align|alignat|gather|gathered|multline|eqnarray|displaymath|math)\*?\}"
    r".{0,4000}?\\end\{(?:equation|align|alignat|gather|gathered|multline|eqnarray|displaymath|math)\*?\}",
    re.S)
CITED = re.compile(r"\\(?:cite[pt]|cite|nocite|autocite|parencite|textcite|citeauthor|citeyear"
                   r"|citetitle)(?![a-zA-Z])\s*((?:\[[^\]]*\])*)\s*\{[^{}]*\}")
hit, noted = [], []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    if not (ROOT / "typst" / path.stem / "main.typ").is_file():
        continue
    src = path.read_text(encoding="utf-8", errors="replace")
    cites = [m for span in MATHSPAN.finditer(src) for m in CITED.finditer(span.group(0))]
    if not cites:
        continue
    hit.append(path.stem)
    if any(m.group(1) for m in cites):
        noted.append(path.stem)
print("papers citing inside a formula: %d" % len(hit))
print("  ... of those, a cite carrying a bracket note: %d" % len(noted))
(ROOT / "_work" / "regen_mathcite.txt").write_text("\n".join(hit), encoding="utf-8")
for n in hit[:15]:
    print("   ", n[:70])
