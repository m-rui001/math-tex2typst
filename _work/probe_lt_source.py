"""Dump the longtable source of the Complex-Matrix paper, and the emitted Typst table."""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
NAME = "Complex-Matrix-Multiplication-Below-2.258-and-Rectangular-Bounds-September-24-2026"

tex = (ROOT / "_work" / "flat" / (NAME + ".tex")).read_text(encoding="utf-8", errors="replace")
for m in re.finditer(r"\\begin\{longtable\}", tex):
    i = m.start()
    end = tex.find(r"\end{longtable}", i)
    print("=" * 30, "longtable at", i, "->", end, "=" * 30)
    print(tex[max(0, i - 300) : end + 60])

typ = (ROOT / "typst" / NAME / "main.typ").read_text(encoding="utf-8", errors="replace")
j = typ.find("Exact coefficients")
print("=" * 30, "main.typ around caption", j, "=" * 30)
print(typ[max(0, j - 1200) : j + 400])
