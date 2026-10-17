"""Show the emitted Typst figure wrapper around the long barrier table."""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
NAME = "Complex-Matrix-Multiplication-Below-2.258-and-Rectangular-Bounds-September-24-2026"
typ = (ROOT / "typst" / NAME / "main.typ").read_text(encoding="utf-8", errors="replace")

cap = typ.find("Exact coefficients")
print("caption at", cap, "of", len(typ))
fig = typ.rfind("#figure(", 0, cap)
print("enclosing #figure( at", fig, " distance", cap - fig)
print("--- from #figure( : first 900 chars ---")
print(typ[fig : fig + 900])
print("--- 600 chars before the caption ---")
print(typ[cap - 600 : cap])
print("--- caption + 400 after ---")
print(typ[cap : cap + 400])
