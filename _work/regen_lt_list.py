"""Write the papers whose big table figure overflows into _work/regen_needed.txt."""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
PREFIXES = [
    "The-hypercube-Ramsey-number-has-linear-order",
    "Signed-tensor-densities-and-diagram-budgets-for-coordinate-sweep",
    "Complex-Matrix-Multiplication-Below-2.258-and-Rectangular-Bounds",
    "A-sharp-Fourier-certificate-for-planar-circle-packing",
    "Catalans-constant-is-irrational",
]
names = []
for d in sorted((ROOT / "typst").iterdir()):
    for pre in PREFIXES:
        if d.name.startswith(pre) and (ROOT / "_work" / "flat" / (d.name + ".tex")).exists():
            names.append(d.name)
print("\n".join(names))
(ROOT / "_work" / "regen_needed.txt").write_text("\n".join(names), encoding="utf-8")
print("wrote %d names" % len(names))
