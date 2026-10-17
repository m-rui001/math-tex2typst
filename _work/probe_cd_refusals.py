"""Do the commutative diagrams that print as LaTeX convert when they are handed over bare?

The figure ledger counts refused tikzpictures, but a diagram inside \begin{equation} reaches the
emitter as a formula, and when the canvas is refused it prints as LaTeX without ever being
counted. This asks each diagram twice: as the source writes it, and wrapped in the equation the
paper puts around it, so a wrapper problem is told apart from a missing feature.

Usage: python _work/probe_cd_refusals.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

DIAGRAM = re.compile(r"\\begin\{(?:tikzcd|CD)\*?\}.*?\\end\{(?:tikzcd|CD)\*?\}", re.S)
EQUATION = re.compile(r"\\begin\{equation\}.*?\\end\{equation\}", re.S)

bare_ok = bare_bad = wrapped_ok = 0
shown = 0
for path in sorted((ROOT / "_work/flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for eq in EQUATION.finditer(src):
        if not DIAGRAM.search(eq.group(0)):
            continue
        if cetz.convert(eq.group(0)):
            wrapped_ok += 1
    for m in DIAGRAM.finditer(src):
        if cetz.convert(m.group(0)):
            bare_ok += 1
        else:
            bare_bad += 1
            if shown < 6:
                shown += 1
                print("REFUSES %s: %s" % (path.stem[:40], m.group(0)[:150].replace("\n", " ")))

print("bare diagrams: %d convert, %d refuse ; equation+diagram blocks converted by the same gate: %d"
      % (bare_ok, bare_bad, wrapped_ok))
